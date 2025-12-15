/// Global functions for gtksource5 library
module gtksource.global;

import gid.gid;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;


/**
    Like GTK_SOURCE_CHECK_VERSION, but the check for gtk_source_check_version is
    at runtime instead of compile time. This is useful for compiling
    against older versions of GtkSourceView, but using features from newer
    versions.

    Params:
      major = the major version to check
      minor = the minor version to check
      micro = the micro version to check
    Returns: true if the version of the GtkSourceView currently loaded
      is the same as or newer than the passed-in version.
*/
bool checkVersion(uint major, uint minor, uint micro)
{
  bool _retval;
  _retval = cast(bool)gtk_source_check_version(major, minor, micro);
  return _retval;
}

/**
    Free the resources allocated by GtkSourceView. For example it unrefs the
    singleton objects.
    
    It is not mandatory to call this function, it's just to be friendlier to
    memory debugging tools. This function is meant to be called at the end of
    main(). It can be called several times.
*/
void finalize()
{
  gtk_source_finalize();
}

/**
    Returns the major version number of the GtkSourceView library.
    (e.g. in GtkSourceView version 3.20.0 this is 3.)
    
    This function is in the library, so it represents the GtkSourceView library
    your code is running against. Contrast with the #GTK_SOURCE_MAJOR_VERSION
    macro, which represents the major version of the GtkSourceView headers you
    have included when compiling your code.
    Returns: the major version number of the GtkSourceView library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = gtk_source_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the GtkSourceView library.
    (e.g. in GtkSourceView version 3.20.0 this is 0.)
    
    This function is in the library, so it represents the GtkSourceView library
    your code is running against. Contrast with the #GTK_SOURCE_MICRO_VERSION
    macro, which represents the micro version of the GtkSourceView headers you
    have included when compiling your code.
    Returns: the micro version number of the GtkSourceView library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = gtk_source_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the GtkSourceView library.
    (e.g. in GtkSourceView version 3.20.0 this is 20.)
    
    This function is in the library, so it represents the GtkSourceView library
    your code is running against. Contrast with the #GTK_SOURCE_MINOR_VERSION
    macro, which represents the minor version of the GtkSourceView headers you
    have included when compiling your code.
    Returns: the minor version number of the GtkSourceView library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = gtk_source_get_minor_version();
  return _retval;
}

/**
    Initializes the GtkSourceView library (e.g. for the internationalization).
    
    This function can be called several times, but is meant to be called at the
    beginning of main(), before any other GtkSourceView function call.
*/
void init_()
{
  gtk_source_init();
}

/**
    Simplified version of `funcscheduler_add_full`.

    Params:
      callback = the callback to execute
    Returns: 
*/
size_t schedulerAdd(gtksource.types.SchedulerCallback callback)
{
  extern(C) gboolean _callbackCallback(long deadline, void* userData)
  {
    ptrThawGC(userData);
    auto _dlg = cast(gtksource.types.SchedulerCallback*)userData;

    gboolean _retval = (*_dlg)(deadline);
    return _retval;
  }
  auto _callbackCB = callback ? &_callbackCallback : null;

  size_t _retval;
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  _retval = gtk_source_scheduler_add(_callbackCB, _callback);
  return _retval;
}

/**
    Adds a new callback that will be executed as time permits on the main thread.
    
    This is useful when you need to do a lot of background work but want to do
    it incrementally.
    
    callback will be provided a deadline that it should complete it's work by
    (or near) and can be checked using `funcGLib.get_monotonic_time` for comparison.
    
    Use `funcscheduler_remove` to remove the handler.

    Params:
      callback = the callback to execute
    Returns: 
*/
size_t schedulerAddFull(gtksource.types.SchedulerCallback callback)
{
  extern(C) gboolean _callbackCallback(long deadline, void* userData)
  {
    auto _dlg = cast(gtksource.types.SchedulerCallback*)userData;

    gboolean _retval = (*_dlg)(deadline);
    return _retval;
  }
  auto _callbackCB = callback ? &_callbackCallback : null;

  size_t _retval;
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
  _retval = gtk_source_scheduler_add_full(_callbackCB, _callback, _callbackDestroyCB);
  return _retval;
}

/**
    Removes a scheduler callback previously registered with
    `funcscheduler_add` or `funcscheduler_add_full`.

    Params:
      handlerId = the handler id
*/
void schedulerRemove(size_t handlerId)
{
  gtk_source_scheduler_remove(handlerId);
}

/**
    Use this function to escape the following characters: `\n`, `\r`, `\t` and `\`.
    
    For a regular expression search, use [glib.regex.Regex.escapeString] instead.
    
    One possible use case is to take the #GtkTextBuffer's selection and put it in a
    search entry. The selection can contain tabulations, newlines, etc. So it's
    better to escape those special characters to better fit in the search entry.
    
    See also: `funcutils_unescape_search_text`.
    
    <warning>
    Warning: the escape and unescape functions are not reciprocal! For example,
    escape (unescape (\)) = \\. So avoid cycles such as: search entry -> unescape
    -> search settings -> escape -> search entry. The original search entry text
    may be modified.
    </warning>

    Params:
      text = the text to escape.
    Returns: the escaped text.
*/
string utilsEscapeSearchText(string text)
{
  char* _cretval;
  const(char)* _text = text.toCString(No.Alloc);
  _cretval = gtk_source_utils_escape_search_text(_text);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Use this function before [gtksource.search_settings.SearchSettings.setSearchText], to
    unescape the following sequences of characters: `\n`, `\r`, `\t` and `\\`.
    The purpose is to easily write those characters in a search entry.
    
    Note that unescaping the search text is not needed for regular expression
    searches.
    
    See also: `funcutils_escape_search_text`.

    Params:
      text = the text to unescape.
    Returns: the unescaped text.
*/
string utilsUnescapeSearchText(string text)
{
  char* _cretval;
  const(char)* _text = text.toCString(No.Alloc);
  _cretval = gtk_source_utils_unescape_search_text(_text);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
