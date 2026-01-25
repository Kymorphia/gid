//!kind loader Namespace
//!inhibit imports init funcs

import std.file : exists;
import std.path : buildNormalizedPath, buildPath;
import std.process : environment;
import std.stdio : stderr, writeln;
import std.string : fromStringz, toStringz;

__gshared string[] gidUnresolvedLibs; /// Array of unresolved libraries
__gshared string[] gidUnresolvedSymbols; /// Array of unresolved function symbols (for libs which were resolved)

debug
{
  private immutable bool gidLoaderDebug; // Set by GID_LOADER_DEBUG=1 to enable loader debugging

  shared static this()
  {
    import std.process : environment;
    gidLoaderDebug = environment.get("GID_LOADER_DEBUG", "0") == "1";
  }
}

version(Windows)
{
  import core.sys.windows.winbase : LoadLibraryA, GetProcAddress;
  import std.algorithm : splitter;

  void*[] gidResolveLibs(immutable(string[]) libs)
  {
    void*[] libHandles;

    foreach (libVariations; libs) // Loop on each library
    {
      void* handle;

      foreach (lib; libVariations.splitter(";")) // Loop on library name variations (separated by ';' - windows only)
      {
        handle = LoadLibraryA(cast(char*)toStringz(lib)); // Windows should search the executable directory, PATH, and other system paths
        if (handle)
        {
          libHandles ~= handle;
          break;
        }
      }

      if (!handle)
      {
        debug
        {
          if (gidLoaderDebug)
            stderr.writeln("giD library '" ~ libVariations ~ "'not found");
        }

        gidUnresolvedLibs ~= libVariations;
      }
    }

    return libHandles;
  }

  void gidLink(void** funcPtr, string symbol, void*[] libHandles)
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

    debug
    {
      if (gidLoaderDebug)
        stderr.writeln("giD symbol '" ~ symbol ~ "' not found");
    }
  }
}
else // Linux or OSX
{
  import core.sys.posix.dlfcn : dlerror, dlopen, dlsym, RTLD_GLOBAL, RTLD_NOW;
  import core.stdc.limits : PATH_MAX;

  void*[] gidResolveLibs(immutable(string[]) libs)
  {
    void*[] libHandles;

    foreach (lib; libs)
    {
      version (OSX) lib = lib.buildPath(basePath, lib);

      if (auto handle = dlopen(cast(char*)toStringz(lib), RTLD_GLOBAL | RTLD_NOW))
      {
        debug
        {
          if (gidLoaderDebug)
          {
            char[PATH_MAX + 1] path;

            version(linux)
            {
              import core.sys.linux.dlfcn : dlinfo, RTLD_DI_ORIGIN;

              if (dlinfo(handle, RTLD_DI_ORIGIN, path.ptr) == 0)
                stderr.writeln("Found ", lib, " at ", path.fromStringz.idup);
              else
                stderr.writeln("dlinfo() returned error: ", dlerror().fromStringz.idup);
            }
          }
        }

        libHandles ~= handle;
      }
      else
      {
        debug
        {
          if (gidLoaderDebug)
            stderr.writeln("giD library '" ~ lib ~ "' not found: " ~ dlerror().fromStringz.idup);
        }

        gidUnresolvedLibs ~= lib;
      }
    }

    return libHandles;
  }

  void gidLink(void** funcPtr, string symbol, void*[] libHandles)
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

    debug
    {
      if (gidLoaderDebug)
        stderr.writeln("giD symbol '" ~ symbol ~ "' not found");
    }
  }

  version(OSX)
  {
    string basePath()
    {
      static string path;

      if (path is null)
      {
        path = environment.get("GTK_BASEPATH");

        if(!path)
        {
          path = environment.get("HOMEBREW_ROOT");

          if (path)
            path = path.buildPath("lib");
        }
      }

      debug
      {
        if (gidLoaderDebug)
          stderr.writeln("Found giD DLL path: ", path);
      }

      return path;
    }
  }
}

/// Return a giD unresolved lib/symbol report
string gidLoaderUnresolvedReport()
{
  if (gidUnresolvedLibs.length == 0 && gidUnresolvedSymbols.length == 0)
    return "All giD symbols have been resolved\n";

  auto s = "giD unresolved symbol report:\n";

  import std.algorithm : sort;
  import std.array : array;
  import std.string : join;

  if (gidUnresolvedLibs.length > 0)
    s ~= "Unresolved libraries: " ~ gidUnresolvedLibs.sort.array.join(", ") ~ "\n";

  if (gidUnresolvedSymbols.length > 0)
    s ~= "Unresolved symbols: " ~ gidUnresolvedSymbols.sort.array.join(", ") ~ "\n";

  return s;
}

void gidSymbolNotFound()
{
  if (gidUnresolvedLibs.length > 0 || gidUnresolvedSymbols.length > 0)
    stderr.writeln(gidLoaderUnresolvedReport);

  throw new Error("Attempt to execute an unresolved giD function");
}
