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
import std.string : fromStringz, indexOf, lastIndexOf, split, toStringz;

__gshared string[] gidUnresolvedLibs; /// Array of unresolved libraries
__gshared string[] gidUnresolvedSymbols; /// Array of unresolved function symbols (for libs which were resolved)
__gshared string gidLibraryPath; /// Override library path either from direct assignment or from GID_LIBRARY_PATH environment var

debug private immutable bool gidLoaderDebug; // Set by GID_LOADER_DEBUG=1 to enable loader debugging

shared static this()
{
  gidLibraryPath = assumeWontThrow(environment.get("GID_LIBRARY_PATH"));
  debug gidLoaderDebug = assumeWontThrow(environment.get("GID_LOADER_DEBUG")) == "1";
}

void*[] gidResolveLibs(immutable(string[]) libs) nothrow
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

  void*[] libHandles;

  foreach (baseName; libs)
  {
    auto candidates = libraryCandidates(baseName);
    string found;

    if (auto handle = libraryOpen(candidates, found))
    {
      debug if (gidLoaderDebug)
      {
        if (auto libPath = libraryPath(handle))
          assumeWontThrow(stderr.writeln("Found ", found, " at ", libPath));
        else
          assumeWontThrow(stderr.writeln("Found ", found));
      }

      libHandles ~= handle;
      break;
    }
    else
    {
      debug if (gidLoaderDebug)
        assumeWontThrow(stderr.writeln("giD library '" ~ baseName ~ "' not found (tried: "
          ~ candidates.join(", ") ~ ")"));

      gidUnresolvedLibs ~= baseName;
    }
  }

  return libHandles;
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
private void* libraryOpen(string[] candidates, out string found) nothrow
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
      import core.sys.posix.dlfcn : dlopen, RTLD_GLOBAL, RTLD_NOW;

      if (gidLibraryPath.length > 0)
        handle = dlopen(cast(char*)buildPath(gidLibraryPath, lib).toStringz, RTLD_GLOBAL | RTLD_NOW);

      if (!handle)
        handle = dlopen(cast(char*)lib.toStringz, RTLD_GLOBAL | RTLD_NOW);
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
      cands ~= "lib" ~ base ~ "." ~ soVer ~ ".dylib";

    cands ~= "lib" ~ base ~ ".dylib";

    if (soVer.length > 0)
      cands ~= base ~ "." ~ soVer ~ ".dylib";

    cands ~= base ~ ".dylib";
  }
  else // Other posix systems
  {
    if (soVer.length > 0)
      cands ~= "lib" ~ base ~ ".so." ~ soVer;

    cands ~= "lib" ~ base ~ ".so";

    if (soVer.length > 0)
      cands ~= base ~ ".so." ~ soVer;

    cands ~= base ~ ".so";
  }

  return cands;
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
