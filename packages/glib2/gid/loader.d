module gid.loader;


import std.file : exists;
import std.path : buildNormalizedPath, buildPath;
import std.process : environment;
import std.string : fromStringz, toStringz;

debug
{
  import std.stdio : writeln;

  private immutable bool gidLoaderDebug; // Set by GID_LOADER_DEBUG=1 to enable loader debugging

  shared static this()
  {
    import std.process : environment;
    gidLoaderDebug = environment.get("GID_LOADER_DEBUG", "0") == "1";
  }
}

version(Windows)
{
  import core.sys.windows.winbase : LoadLibraryA, GetProcAddress, FreeLibrary, GetLastError, FormatMessageA,
  FORMAT_MESSAGE_FROM_SYSTEM, FORMAT_MESSAGE_IGNORE_INSERTS;
  import core.sys.windows.winnt : LANG_NEUTRAL, IMAGE_FILE_MACHINE_AMD64, IMAGE_FILE_MACHINE_I386;
  import std.algorithm : splitter;

  private bool dllPathSet;
  private void*[string] dllHandles;

  extern(Windows) int SetDllDirectoryA(const(char)* path);

  void gidLink(void** funcPtr, string symbol, immutable(string[]) libs)
  {
    if (!dllPathSet && libs.length > 0)
    {
      outer: foreach (lib; libs[0].splitter(";"))
      {
        foreach (path; environment.get("PATH").splitter(';'))
        {
          string dllPath = buildNormalizedPath(path, lib);

          if (exists(dllPath) && checkArchitecture(dllPath))
          {
            debug
            {
              if (gidLoaderDebug)
                writeln("Found giD DLL path: ", path);
            }

            SetDllDirectoryA(toStringz(path));
            dllPathSet = true;
            break outer;
          }
        }
      }

      if (!dllPathSet)
        throw new Exception("Failed to find giD DLL library path");
    }

    foreach (libVariations; libs) // Loop on each library
    {
      auto handle = dllHandles.get(libVariations, null);

      if (!handle)
      {
        foreach (lib; libVariations.splitter(";")) // Loop on library name variations (separated by ';' - windows only)
        {
          handle = LoadLibraryA(cast(char*)toStringz(lib));
          if (handle)
          {
            dllHandles[libVariations] = handle;
            break;
          }
        }

        if (!handle)
          throw new Exception("Failed to load library " ~ libVariations);
      }

      if (auto symPtr = GetProcAddress(handle, cast(char*)toStringz(symbol)))
      {
         *funcPtr = symPtr;
        return;
      }
    }

     *funcPtr = &gidSymbolNotFound;

    debug
    {
      if (gidLoaderDebug)
        writeln("Symbol not found: " ~ symbol);
    }
  }

  private string getErrorMessage()
  {
    char[] buffer = new char[2048];
    buffer[0] = '\0';

    FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, null, GetLastError(), LANG_NEUTRAL,
    buffer.ptr, cast(uint)buffer.length, null);

    return buffer.ptr.fromStringz.idup;
  }

  // Verify a DLL matches the current host architecture
  private bool checkArchitecture(string dllPath)
  {
    import std.stdio : File;
    File dll = File(dllPath);
    uint[1] ubuf;
    ushort[1] shbuf;

    dll.seek(0x3c);
    int offset = dll.rawRead(ubuf)[0];
    dll.seek(offset);
    uint peHead = dll.rawRead(ubuf)[0];

    if (peHead != 0x00004550) // Not a PE Header
      return false;

    ushort type = dll.rawRead(shbuf)[0];

    version(Win32)
      return type == IMAGE_FILE_MACHINE_I386;
    else version(Win64)
      return type == IMAGE_FILE_MACHINE_AMD64;
    else
      return false;
  }
}
else // Linux or OSX
{
  import core.sys.posix.dlfcn : dlerror, dlopen, dlsym, RTLD_GLOBAL, RTLD_NOW;

  void gidLink(void** funcPtr, string symbol, immutable(string[]) libs)
  {
    foreach (lib; libs)
    {
      string mutableLib = lib;
      version (OSX) mutableLib = buildPath(basePath, lib);

      if (auto handle = dlopen(cast(char*)toStringz(mutableLib), RTLD_GLOBAL | RTLD_NOW))
      {
        if (auto symPtr = dlsym(handle, cast(char*)toStringz(symbol)))
        {
           *funcPtr = symPtr;
          return;
        }
      }
      else
        throw new Error("Failed to load library '" ~ mutableLib ~ "': " ~ dlerror().fromStringz.idup);
    }

     *funcPtr = &gidSymbolNotFound;

    debug
    {
      if (gidLoaderDebug)
        writeln("Symbol not found: ", symbol);
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
          writeln("Found giD DLL path: ", path);
      }

      return path;
    }
  }
}

void gidSymbolNotFound()
{
  throw new Error("Attempted to execute a dynamic library function which was not found");
}
class loader
{
}
