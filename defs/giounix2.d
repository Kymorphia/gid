//!gir GioUnix-2.0
//!info description "D binding for the GioUnix library - Portable API for dynamically loading modules"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~giounix2/
//!info capi https://docs.gtk.org/gio-unix/

//# Hand-written below: Returns an array of string arrays (char***)
//!set class[DesktopAppInfo].function[search][ignore] 1

//!class DesktopAppInfo

  /**
      Searches desktop files for ones that match searchString.
      The return value is an array of arrays of desktop file IDs. Each array corresponds to a group of results of
      equal quality, ordered from the best matching group to the worst.
      Params:
        searchString = the search string to use
      Returns: a list of arrays of desktop file IDs which matched the search string
  */
  static string[][] search(string searchString) nothrow
  {
    import glib.c.functions : g_free, g_strfreev;

    const(char)* _searchString = searchString.toCString!(No.Malloc, No.Nullable);
    char*** _cretval = g_desktop_app_info_search(_searchString);
    string[][] _retval;

    if (_cretval)
    {
      for (auto group = _cretval; *group; group++)
      {
        string[] ids;

        for (auto id = *group; *id; id++)
          ids ~= fromCString(*id);

        _retval ~= ids;
        g_strfreev(*group);
      }

      g_free(_cretval);
    }

    return _retval;
  }
