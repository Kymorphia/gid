/// Module for [FilterWindows] class
module gmime.filter_windows;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for detecting whether or not a text stream claimed to be
    iso-8859-X is really that charset or if it is really a
    Windows-CP125x charset.
*/
class FilterWindows : gmime.filter.Filter
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_windows_get_type != &gidSymbolNotFound ? g_mime_filter_windows_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterWindows self()
  {
    return this;
  }

  /**
      Creates a new GMimeFilterWindows filter. When a stream of text has
      been filtered, it can be determined whether or not said text stream
      was in claimed_charset or the equivalent Windows-CP125# charset.
  
      Params:
        claimedCharset = charset that a text stream claims to be
      Returns: a new windows filter.
  */
  this(string claimedCharset)
  {
    GMimeFilter* _cretval;
    const(char)* _claimedCharset = claimedCharset.toCString(No.Alloc);
    _cretval = g_mime_filter_windows_new(_claimedCharset);
    this(_cretval, Yes.Take);
  }

  /**
      Determines whether or not a Windows-CP125# charset has been
      detected so far.
      Returns: true if the filtered stream has been detected to contain
        Windows-CP125# characters or false otherwise.
  */
  bool isWindowsCharset()
  {
    bool _retval;
    _retval = cast(bool)g_mime_filter_windows_is_windows_charset(cast(GMimeFilterWindows*)this._cPtr);
    return _retval;
  }

  /**
      Figures out the real charset that the text is encoded in based on whether or not Windows-CP125# characters were found.
      Returns: a const string pointer to the claimed charset if filtered
        text stream was found not to contain any Windows-CP125# characters
        or the proper Windows-CP125# charset.
  */
  string realCharset()
  {
    const(char)* _cretval;
    _cretval = g_mime_filter_windows_real_charset(cast(GMimeFilterWindows*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
