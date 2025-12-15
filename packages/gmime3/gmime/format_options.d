/// Module for [FormatOptions] class
module gmime.format_options;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;
import gobject.boxed;
import gobject.object;

/**
    Format options for serializing various GMime objects.
*/
class FormatOptions : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_format_options_get_type != &gidSymbolNotFound ? g_mime_format_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FormatOptions self()
  {
    return this;
  }

  /**
      Creates a new set of #GMimeFormatOptions.
      Returns: a newly allocated set of #GMimeFormatOptions with the default values.
  */
  this()
  {
    GMimeFormatOptions* _cretval;
    _cretval = g_mime_format_options_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds the given header to the list of headers that should be hidden.
  
      Params:
        header = a header name
  */
  void addHiddenHeader(string header)
  {
    const(char)* _header = header.toCString(No.Alloc);
    g_mime_format_options_add_hidden_header(cast(GMimeFormatOptions*)this._cPtr, _header);
  }

  /**
      Clears the list of headers that should be hidden.
  */
  void clearHiddenHeaders()
  {
    g_mime_format_options_clear_hidden_headers(cast(GMimeFormatOptions*)this._cPtr);
  }

  /**
      Clones a #GMimeFormatOptions.
      Returns: a newly allocated #GMimeFormatOptions.
  */
  gmime.format_options.FormatOptions clone()
  {
    GMimeFormatOptions* _cretval;
    _cretval = g_mime_format_options_clone(cast(GMimeFormatOptions*)this._cPtr);
    auto _retval = _cretval ? new gmime.format_options.FormatOptions(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GMimeFilter suitable for converting line-endings to the
      currently set new-line format.
  
      Params:
        ensureNewline = true if the output must *always* end with a new line
      Returns: a #GMimeFilter to convert to the specified new-line format.
  */
  gmime.filter.Filter createNewlineFilter(bool ensureNewline)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_format_options_create_newline_filter(cast(GMimeFormatOptions*)this._cPtr, ensureNewline);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.filter.Filter)(cast(GMimeFilter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a string representing the currently set new-line format.
      Returns: a new-line character sequence.
  */
  string getNewline()
  {
    const(char)* _cretval;
    _cretval = g_mime_format_options_get_newline(cast(GMimeFormatOptions*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the new-line format to use when writing out messages and headers.
      Returns: the new-line format that is currently set.
  */
  gmime.types.NewLineFormat getNewlineFormat()
  {
    GMimeNewLineFormat _cretval;
    _cretval = g_mime_format_options_get_newline_format(cast(GMimeFormatOptions*)this._cPtr);
    gmime.types.NewLineFormat _retval = cast(gmime.types.NewLineFormat)_cretval;
    return _retval;
  }

  /**
      Gets the parameter encoding method to use for #GMimeParam parameters that do not
      already have an encoding method specified.
      Returns: the encoding method that is currently set.
  */
  gmime.types.ParamEncodingMethod getParamEncodingMethod()
  {
    GMimeParamEncodingMethod _cretval;
    _cretval = g_mime_format_options_get_param_encoding_method(cast(GMimeFormatOptions*)this._cPtr);
    gmime.types.ParamEncodingMethod _retval = cast(gmime.types.ParamEncodingMethod)_cretval;
    return _retval;
  }

  /**
      Gets whether or not the specified header should be hidden.
  
      Params:
        header = the name of a header
      Returns: true if the header should be hidden or false otherwise.
  */
  bool isHiddenHeader(string header)
  {
    bool _retval;
    const(char)* _header = header.toCString(No.Alloc);
    _retval = cast(bool)g_mime_format_options_is_hidden_header(cast(GMimeFormatOptions*)this._cPtr, _header);
    return _retval;
  }

  /**
      Removes the given header from the list of headers that should be hidden.
  
      Params:
        header = a header name
  */
  void removeHiddenHeader(string header)
  {
    const(char)* _header = header.toCString(No.Alloc);
    g_mime_format_options_remove_hidden_header(cast(GMimeFormatOptions*)this._cPtr, _header);
  }

  /**
      Sets the new-line format that should be used when writing headers and messages.
  
      Params:
        newline = a #GMimeNewLineFormat
  */
  void setNewlineFormat(gmime.types.NewLineFormat newline)
  {
    g_mime_format_options_set_newline_format(cast(GMimeFormatOptions*)this._cPtr, newline);
  }

  /**
      Sets the parameter encoding method to use when encoding parameters which
      do not have an encoding method specified.
      
      Note: #GMIME_PARAM_ENCODING_METHOD_DEFAULT is not allowed.
  
      Params:
        method = a #GMimeParamEncodingMethod
  */
  void setParamEncodingMethod(gmime.types.ParamEncodingMethod method)
  {
    g_mime_format_options_set_param_encoding_method(cast(GMimeFormatOptions*)this._cPtr, method);
  }

  /**
      Gets the default format options.
      Returns: the default format options.
  */
  static gmime.format_options.FormatOptions getDefault()
  {
    GMimeFormatOptions* _cretval;
    _cretval = g_mime_format_options_get_default();
    auto _retval = _cretval ? new gmime.format_options.FormatOptions(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
