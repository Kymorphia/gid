/// Module for [loader] class
module gid.loader;

public import gid.basictypes;

import std.exception : assumeWontThrow;
import std.file : exists;
import std.path : buildNormalizedPath, buildPath;
import std.process : environment;
import std.stdio : stderr, writeln;
import std.string : fromStringz, toStringz;

__gshared string[] gidUnresolvedLibs; /// Array of unresolved libraries
__gshared string[] gidUnresolvedSymbols; /// Array of unresolved function symbols (for libs which were resolved)
__gshared string gidLibraryPath; /// Override library path either from direct assignment or from GID_LIBRARY_PATH environment var

debug private immutable bool gidLoaderDebug; // Set by GID_LOADER_DEBUG=1 to enable loader debugging

shared static this()
{
  gidLibraryPath = assumeWontThrow(environment.get("GID_LIBRARY_PATH"));
  debug gidLoaderDebug = assumeWontThrow(environment.get("GID_LOADER_DEBUG")) == "1";
}

version(Windows)
{
  import core.sys.windows.winbase : LoadLibraryA, GetProcAddress;
  import std.algorithm : splitter;

  void*[] gidResolveLibs(immutable(string[]) libs) nothrow
  {
    void*[] libHandles;

    foreach (libVariations; libs) // Loop on each library
    {
      void* handle;

      foreach (lib; libVariations.splitter(";")) // Loop on library name variations (separated by ';' - windows only)
      {
        if (gidLibraryPath.length > 0) // First try loading the library using gidLibraryPath if set
          handle = LoadLibraryA(cast(char*)buildPath(gidLibraryPath, lib).toStringz);

        if (!handle)
          handle = LoadLibraryA(cast(char*)toStringz(lib)); // Search the executable directory, PATH, and other system paths

        if (handle)
        {
          libHandles ~= handle;
          break;
        }
      }

      if (!handle)
      {
        debug if (gidLoaderDebug)
        assumeWontThrow(stderr.writeln("giD library '" ~ libVariations ~ "'not found"));

        gidUnresolvedLibs ~= libVariations;
      }
    }

    return libHandles;
  }

  void gidLink(void** funcPtr, string symbol, void*[] libHandles) nothrow
  {
    foreach (handle; libHandles) // Loop on each library handle
    {
      if (auto symPtr = GetProcAddress(handle, cast(char*)toStringz(symbol)))
      {
        *funcPtr = symPtr;
        return;
      }
    }

    *funcPtr = &gidSymbolNotFound;
    gidUnresolvedSymbols ~= symbol;

    debug if (gidLoaderDebug)
    assumeWontThrow(stderr.writeln("giD symbol '" ~ symbol ~ "' not found"));
  }
}
else // Linux or OSX
{
  import core.sys.posix.dlfcn : dlerror, dlopen, dlsym, RTLD_GLOBAL, RTLD_NOW;
  import core.stdc.limits : PATH_MAX;

  void*[] gidResolveLibs(immutable(string[]) libs) nothrow
  {
    version (OSX)
    {
      if (gidLibraryPath.length == 0)
      {
        if (auto path = assumeWontThrow(environment.get("GTK_BASEPATH")))
          gidLibraryPath = path;
        else if (auto path = assumeWontThrow(environment.get("HOMEBREW_PREFIX")))
          gidLibraryPath = buildPath(path, "lib");

        debug if (gidLoaderDebug && gidLibraryPath.length > 0)
        assumeWontThrow(stderr.writeln("Detected giD library path: ", gidLoaderDebug));
      }
    }

    void*[] libHandles;

    foreach (lib; libs)
    {
      void* handle;

      if (gidLibraryPath.length > 0) // First try loading the library using gidLibraryPath if set
        handle = dlopen(cast(char*)buildPath(gidLibraryPath, lib).toStringz, RTLD_GLOBAL | RTLD_NOW);

      if (!handle) // Try to load from system paths
        handle = dlopen(cast(char*)lib.toStringz, RTLD_GLOBAL | RTLD_NOW);

      if (handle)
      {
        debug
        {
          version(Android) // Android doesn't have dlinfo
          {
          }
          else version(linux)
          {
            if (gidLoaderDebug)
            {
              import core.sys.linux.dlfcn : dlinfo, RTLD_DI_ORIGIN;
              char[PATH_MAX + 1] path;

              if (dlinfo(handle, RTLD_DI_ORIGIN, path.ptr) == 0)
                assumeWontThrow(stderr.writeln("Found ", lib, " at ", path.fromStringz.idup));
            }
          }
        }

        libHandles ~= handle;
      }
      else
      {
        debug if (gidLoaderDebug)
        assumeWontThrow(stderr.writeln("giD library '" ~ lib ~ "' not found: " ~ dlerror().fromStringz.idup));

        gidUnresolvedLibs ~= lib;
      }
    }

    return libHandles;
  }

  void gidLink(void** funcPtr, string symbol, void*[] libHandles) nothrow
  {
    foreach (handle; libHandles)
    {
      if (auto symPtr = dlsym(handle, cast(char*)toStringz(symbol)))
      {
        *funcPtr = symPtr;
        return;
      }
    }

    *funcPtr = &gidSymbolNotFound;
    gidUnresolvedSymbols ~= symbol;

    debug if (gidLoaderDebug)
    assumeWontThrow(stderr.writeln("giD symbol '" ~ symbol ~ "' not found"));
  }
}

/// Return a giD unresolved lib/symbol report (might get called by multiple threads)
string gidLoaderUnresolvedReport() nothrow
{
  if (gidUnresolvedLibs.length == 0 && gidUnresolvedSymbols.length == 0)
    return "All giD symbols have been resolved\n";

  auto s = "giD unresolved symbol report:\n";

  import std.algorithm : sort;
  import std.array : array;
  import std.string : join;

  // dup to prevent multi-thread sort issues. gidUnresolvedLibs and gidUnresolvedSymbols should not change at this point.
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
