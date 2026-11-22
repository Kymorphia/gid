//!kind loader Namespace
//!inhibit imports init funcs

import std.algorithm : sort;
import std.array : array, join;
import std.ascii : isDigit;
import std.exception : assumeWontThrow, ifThrown;
import std.file : exists;
import std.path : buildNormalizedPath, buildPath;
import std.process : environment;
import std.stdio : stderr, writeln;
import std.string : fromStringz, indexOf, lastIndexOf, split, strip, toStringz;

__gshared string[] gidUnresolvedLibs; /// Array of unresolved libraries
__gshared string[] gidUnresolvedSymbols; /// Array of unresolved function symbols (for libs which were resolved)
__gshared string gidLibraryPath; /// Override library path either from direct assignment or from GID_LIBRARY_PATH environment var
__gshared GidPackageLibs[string] gidPackageLibs; /// Libraries of each linked giD package, by package namespace (`gid.gtk4`), see [isLibAvailable]

/// How a package's shared libraries were opened (`dlopen` flags on POSIX)
enum GidRtldMode
{
  global, /// `RTLD_GLOBAL` — symbols are in the process-wide global scope
  local,  /// `RTLD_LOCAL` — symbols are only found through the package's library handles
}

/// Libraries of a giD package which were requested by its `c.functions` module at startup
struct GidPackageLibs
{
  string[] names; /// Library base names the package asked for
  void*[] handles; /// Handles of the libraries which were found and opened
  bool allLoaded; /// true if every library of the package was found and opened
  GidRtldMode rtldMode; /// [GidRtldMode.global] unless another major of the same library is also linked, or an override
  string library; /// GIR namespace of the library (`Gtk` for `gid.gtk3` and `gid.gtk4`)
}

private __gshared string[] gidRtldLocalOverride; /// Package names from the GID_RTLD_LOCAL environment variable
private __gshared string[] gidRtldGlobalOverride; /// Package names from the GID_RTLD_GLOBAL environment variable

debug private immutable bool gidLoaderDebug; // Set by GID_LOADER_DEBUG=1 to enable loader debugging

shared static this()
{
  gidLibraryPath = assumeWontThrow(environment.get("GID_LIBRARY_PATH"));
  debug gidLoaderDebug = assumeWontThrow(environment.get("GID_LOADER_DEBUG")) == "1";
  gidRtldLocalOverride = parsePkgList(assumeWontThrow(environment.get("GID_RTLD_LOCAL")));
  gidRtldGlobalOverride = parsePkgList(assumeWontThrow(environment.get("GID_RTLD_GLOBAL")));
}

/**
 * Open the shared libraries of a giD package. Called by the generated `c.functions` module of each package when the
 * program starts.
 *
 * Libraries are opened with `RTLD_GLOBAL` by default, so other code in the process can find their symbols by name
 * (GtkBuilder, `g_module_open(NULL)`, plugins). If another major of the same library is also linked (GTK 3 and GTK 4,
 * or two versions of a library), both are opened with `RTLD_LOCAL` instead, so their symbols do not collide. The
 * `GID_RTLD_LOCAL` and `GID_RTLD_GLOBAL` environment variables override this, with a comma-separated list of package
 * namespaces (`gid.gtk3,gid.gtk4`) or package names (`gtk3,gtk4`). `GID_RTLD_LOCAL` is checked first.
 * Params:
 *   libs = Library base names (`gtk-4_1` for libgtk-4.so.1)
 *   pkg = Package namespace of the calling module (`gid.gtk4`), which is registered so that [isLibAvailable] can
 *     report whether its libraries were found. Null to not register.
 *   library = GIR namespace of the library (`Gtk`), used to detect other linked majors of the same library
 * Returns: Handles of the libraries which were opened
 */
void*[] gidResolveLibs(immutable(string[]) libs, string pkg = null, string library = null) nothrow
{
  version (OSX) // Check for OSX specific library path environment variable hints
  {
    if (gidLibraryPath.length == 0)
    {
      if (auto path = assumeWontThrow(environment.get("GTK_BASEPATH")))
        gidLibraryPath = path;
      else if (auto path = assumeWontThrow(environment.get("HOMEBREW_PREFIX")))
        gidLibraryPath = buildPath(path, "lib");

      debug if (gidLoaderDebug && gidLibraryPath.length > 0)
        assumeWontThrow(stderr.writeln("Detected giD library path: ", gidLibraryPath));
    }
  }

  auto rtldMode = gidChooseRtldMode(pkg, library);
  void*[] libHandles;

  foreach (baseName; libs)
  {
    auto candidates = libraryCandidates(baseName);
    string found;

    if (auto handle = libraryOpen(candidates, found, rtldMode))
    {
      debug if (gidLoaderDebug)
      {
        if (auto libPath = libraryPath(handle))
          assumeWontThrow(stderr.writeln("Found ", found, " at ", libPath));
        else
          assumeWontThrow(stderr.writeln("Found ", found));
      }

      libHandles ~= handle;
    }
    else
    {
      debug if (gidLoaderDebug)
        assumeWontThrow(stderr.writeln("giD library '" ~ baseName ~ "' not found (tried: "
          ~ candidates.join(", ") ~ ")"));

      gidUnresolvedLibs ~= baseName;
    }
  }

  if (pkg.length > 0)
    gidPackageLibs[pkg] = GidPackageLibs(libs.dup, libHandles, libHandles.length == libs.length, rtldMode, library);

  return libHandles;
}

/**
 * Check if the C libraries of a giD package were loaded.
 *
 * This is true when the package is part of the program and every shared library it needs was found and opened. It does
 * not depend on any C function symbol, so it can be used to choose between several versions of a library which are
 * all linked into the program, such as `gid:gtk3` and `gid:gtk4` or two releases of a library that the application
 * supports.
 * Params:
 *   pkg = The package namespace, `"gid.gtk4"` for example (the root and the dub package name)
 * Returns: true if the package's libraries were loaded, false if a library is missing or the package isn't linked
 */
bool isLibAvailable(string pkg) nothrow
{
  if (auto p = pkg in gidPackageLibs)
    return p.allLoaded;

  return false;
}

/**
 * Check if the C libraries of the giD package of a module or other symbol were loaded.
 *
 * Use any module or declaration of the package that the application imports, for example:
 * ---
 * import gid.gtk4.widget;
 * import gid.gtk3.widget;
 *
 * if (isLibAvailable!(gid.gtk4.widget))
 *   // use GTK 4
 * else if (isLibAvailable!(gid.gtk3.widget))
 *   // use GTK 3
 * ---
 * Params:
 *   sym = A module (`gid.gtk4.widget`) or declaration (`gid.gtk4.widget.Widget`) of the package
 * Returns: true if the package's libraries were loaded (see the string version of isLibAvailable)
 */
bool isLibAvailable(alias sym)() nothrow
{
  import std.traits : moduleName;

  enum pkg = gidPackageOfModule(moduleName!sym);
  return isLibAvailable(pkg);
}

/// Get the package namespace (root and dub package name, `gid.gtk4`) from a module name (`gid.gtk4.widget`)
string gidPackageOfModule(string modName) pure nothrow
{
  size_t dots;

  foreach (i, c; modName)
  {
    if (c == '.' && ++dots == 2)
      return modName[0 .. i];
  }

  return modName;
}

/**
 * Choose the `dlopen` mode for a package. An explicit `GID_RTLD_LOCAL` or `GID_RTLD_GLOBAL` value wins, otherwise
 * [GidRtldMode.local] is used when another major of the same library is linked into the program.
 */
private GidRtldMode gidChooseRtldMode(string pkg, string library) nothrow
{
  if (pkgListHas(gidRtldLocalOverride, pkg))
    return GidRtldMode.local;

  if (pkgListHas(gidRtldGlobalOverride, pkg))
    return GidRtldMode.global;

  if (gidHasOtherMajor(pkg, library))
    return GidRtldMode.local;

  return GidRtldMode.global;
}

/**
 * true if another giD package of the same GIR namespace is linked into the program. This looks at generated marker
 * modules (`gid.gtk4.c._gidlib_Gtk`) listed in `ModuleInfo`, so it is valid before any package has opened its
 * libraries and does not depend on static constructor order.
 */
bool gidHasOtherMajor(string pkg, string library) nothrow
{
  if (pkg.length == 0 || library.length == 0)
    return false;

  return assumeWontThrow(gidHasOtherMajorImpl(pkg, library));
}

private bool gidHasOtherMajorImpl(string pkg, string library)
{
  auto suffix = ".c._gidlib_" ~ library;

  foreach (m; ModuleInfo)
  {
    auto name = m.name;

    if (name.length > suffix.length && name[$ - suffix.length .. $] == suffix)
    {
      auto other = name[0 .. $ - suffix.length];

      if (other != pkg)
        return true;
    }
  }

  return false;
}

/// Split a comma-separated list of package names (from `GID_RTLD_LOCAL` or `GID_RTLD_GLOBAL`)
private string[] parsePkgList(string val) nothrow
{
  if (val.length == 0)
    return null;

  string[] result;

  foreach (part; assumeWontThrow(val.split(",")))
  {
    auto s = assumeWontThrow(part.strip);

    if (s.length > 0)
      result ~= s;
  }

  return result;
}

/// true if `list` contains `pkg` (`gid.gtk4`) or its last component (`gtk4`)
private bool pkgListHas(string[] list, string pkg) nothrow
{
  foreach (item; list)
  {
    if (item == pkg)
      return true;

    if (pkg.length > item.length && pkg[$ - item.length - 1] == '.' && pkg[$ - item.length .. $] == item)
      return true;
  }

  return false;
}

void gidLink(void** funcPtr, string symbol, void*[] libHandles) nothrow
{
  foreach (handle; libHandles)
  {
    version(Windows)
    {
      import core.sys.windows.winbase : GetProcAddress;

      if (auto symPtr = GetProcAddress(handle, cast(char*)toStringz(symbol)))
      {
        *funcPtr = symPtr;
        return;
      }
    }
    else
    {
      import core.sys.posix.dlfcn : dlsym;

      if (auto symPtr = dlsym(handle, cast(char*)toStringz(symbol)))
      {
        *funcPtr = symPtr;
        return;
      }
    }
  }

  *funcPtr = &gidSymbolNotFound;
  gidUnresolvedSymbols ~= symbol;

  debug if (gidLoaderDebug)
    assumeWontThrow(stderr.writeln("giD symbol '" ~ symbol ~ "' not found"));
}

/**
 * Parse a giD library name to separate base and so version.
 * Params:
 *   libName = The giD library name
 *   base = Output base name
 *   ver = The so version (or empty, but not with any libraries currently)
 */
private void parseLibBaseAndVer(string libName, out string base, out string ver) nothrow
{
  auto idx = assumeWontThrow(libName.lastIndexOf('_'));
  if (idx > 0)
  {
    string suffix = libName[idx + 1 .. $];
    if (suffix.length > 0 && (suffix[0] >= '0' && suffix[0] <= '9'))
    {
      base = libName[0 .. idx];
      ver = suffix;
      return;
    }
  }
  base = libName;
  ver = "";
}

/**
 * Attempt to open a library from a list of library candidate names.
 * Params:
 *   candidates = The list of library filename candidates.
 *   found = Output string of the found candidate (only if return value is not null)
 * Returns: The library handle or null if not found
 */
private void* libraryOpen(string[] candidates, out string found, GidRtldMode rtldMode) nothrow
{
  foreach (lib; candidates)
  {
    void *handle;

    version(Windows)
    {
      import core.sys.windows.winbase : LoadLibraryA;

      if (gidLibraryPath.length > 0)
        handle = LoadLibraryA(cast(char*)buildPath(gidLibraryPath, lib).toStringz);

      if (!handle)
        handle = LoadLibraryA(cast(char*)toStringz(lib));
    }
    else
    {
      import core.sys.posix.dlfcn : dlopen, RTLD_GLOBAL, RTLD_LOCAL, RTLD_NOW;

      // RTLD_GLOBAL is the default so GtkBuilder and g_module_open(NULL) can find symbols by name. RTLD_LOCAL is used
      // when another major of the same library is also linked, so the two versions do not collide in the global scope.
      auto flags = (rtldMode == GidRtldMode.local ? RTLD_LOCAL : RTLD_GLOBAL) | RTLD_NOW;

      if (gidLibraryPath.length > 0)
        handle = dlopen(cast(char*)buildPath(gidLibraryPath, lib).toStringz, flags);

      if (!handle)
        handle = dlopen(cast(char*)lib.toStringz, flags);
    }

    if (handle)
    {
      found = lib;
      return handle;
    }
  }

  return null;
}

/**
 * Get detailed library path from a handle.
 * Params:
 *   handle = The opened library handle
 * Returns: The full path of the library or null if not supported
 */
private string libraryPath(void* handle) nothrow
{
  version(Android)
  {
  }
  else version(linux)
  {
    import core.sys.linux.dlfcn : dlinfo, RTLD_DI_ORIGIN;
    import core.stdc.limits : PATH_MAX;

    char[PATH_MAX + 1] pathBuf;

    if (dlinfo(handle, RTLD_DI_ORIGIN, pathBuf.ptr) == 0)
      return pathBuf.fromStringz.idup;
  }

  return null;
}

private string[] libraryCandidates(string baseName) nothrow
{
  string base, soVer;
  parseLibBaseAndVer(baseName, base, soVer);

  string[] cands;

  version(Windows)
  {
    if (soVer.length > 0)
    {
      cands ~= base ~ "-" ~ soVer ~ ".dll";
      cands ~= "lib" ~ cands[$ - 1];
      cands ~= base ~ "." ~ soVer ~ ".dll";
      cands ~= "lib" ~ cands[$ - 1];
    }

    // Without so version
    cands ~= base ~ ".dll";
    cands ~= "lib" ~ cands[$ - 1];

    auto splitLibVer = base.split(".");

    foreach_reverse (i; 1 .. splitLibVer.length) // Add variations with stripped lib versions (from more specific to less)
    { // Stop if component does not start with a digit
      if (!splitLibVer[i][0].isDigit)
        break;

      cands ~= splitLibVer[0 .. i].join(".") ~ ".dll";
      cands ~= "lib" ~ cands[$ - 1];
    }
  }
  else version(OSX)
  {
    if (soVer.length > 0)
      cands ~= ["lib" ~ base ~ "." ~ soVer ~ ".dylib", base ~ "." ~ soVer ~ ".dylib"];
    else // Only try unversioned libs if soVer is empty (to prevent ABI breakage)
      cands ~= ["lib" ~ base ~ ".dylib", base ~ ".dylib"];
  }
  else // Other posix systems
  {
    if (soVer.length > 0)
      cands ~= ["lib" ~ base ~ ".so." ~ soVer, base ~ ".so." ~ soVer];
    else // Only try unversioned libs if soVer is empty (to prevent ABI breakage)
      cands ~= ["lib" ~ base ~ ".so", base ~ ".so"];
  }

  return cands;
}

/**
 * Get the handle of the loaded library which contains an address (of a function or data). Used to find which version
 * of a library registered a GType when several versions of it are loaded. Not supported on Windows.
 * Params:
 *   addr = The address
 * Returns: The library handle (the same value that [gidResolveLibs] returned for it) or null if the address is not in
 *   a loaded library
 */
void* gidLibHandleOfAddress(const(void)* addr) nothrow
{
  version(Windows)
    return null;
  else
  {
    import core.sys.posix.dlfcn : dladdr, dlclose, dlopen, Dl_info, RTLD_LAZY, RTLD_NOLOAD;

    Dl_info info;

    if (!addr || !dladdr(addr, &info) || !info.dli_fname)
      return null;

    if (auto handle = dlopen(info.dli_fname, RTLD_LAZY | RTLD_NOLOAD)) // Same handle as the one that loaded the library
    {
      dlclose(handle); // Remove the reference added by dlopen, the library stays loaded by its original handle
      return handle;
    }

    return null;
  }
}

/**
 * Check if a library handle is one of the libraries which a giD package opened.
 * Params:
 *   pkg = The package namespace (`gid.gtk4`)
 *   handle = The library handle
 * Returns: true if the handle belongs to the package
 */
bool gidPackageHasLibHandle(string pkg, void* handle) nothrow
{
  if (auto p = pkg in gidPackageLibs)
  {
    foreach (h; p.handles)
      if (h is handle)
        return true;
  }

  return false;
}

/// Return a giD unresolved lib/symbol report (might get called by multiple threads)
string gidLoaderUnresolvedReport() nothrow
{
  if (gidUnresolvedLibs.length == 0 && gidUnresolvedSymbols.length == 0)
    return "All giD symbols have been resolved\n";

  auto s = "giD unresolved symbol report:\n";

  if (gidUnresolvedLibs.length > 0)
    s ~= "Unresolved libraries: " ~ gidUnresolvedLibs.dup.sort.array.join(", ") ~ "\n";

  if (gidUnresolvedSymbols.length > 0)
    s ~= "Unresolved symbols: " ~ gidUnresolvedSymbols.dup.sort.array.join(", ") ~ "\n";

  return s;
}

void gidSymbolNotFound() nothrow
{
  if (gidUnresolvedLibs.length > 0 || gidUnresolvedSymbols.length > 0)
    assumeWontThrow(stderr.writeln(gidLoaderUnresolvedReport));

  throw new Error("Attempt to execute an unresolved giD function");
}
