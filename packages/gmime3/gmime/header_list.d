/// Module for [HeaderList] class
module gmime.header_list;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.header;
import gmime.parser_options;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A list of message or mime-part headers.
*/
class HeaderList : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_header_list_get_type != &gidSymbolNotFound ? g_mime_header_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderList self()
  {
    return this;
  }

  /**
      Creates a new #GMimeHeaderList object.
  
      Params:
        options = a #GMimeParserOptions or null
      Returns: a new header list object.
  */
  this(gmime.parser_options.ParserOptions options = null)
  {
    GMimeHeaderList* _cretval;
    _cretval = g_mime_header_list_new(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Appends a header. If value is null, a space will be set aside for it
      (useful for setting the order of headers before values can be
      obtained for them) otherwise the header will be unset.
  
      Params:
        name = header name
        value = header value
        charset = a charset
  */
  void append(string name, string value, string charset = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_header_list_append(cast(GMimeHeaderList*)this._cPtr, _name, _value, _charset);
  }

  /**
      Removes all of the headers from the #GMimeHeaderList.
  */
  void clear()
  {
    g_mime_header_list_clear(cast(GMimeHeaderList*)this._cPtr);
  }

  /**
      Checks whether or not a header exists.
  
      Params:
        name = header name
      Returns: true if the specified header exists or false otherwise.
  */
  bool contains(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)g_mime_header_list_contains(cast(GMimeHeaderList*)this._cPtr, _name);
    return _retval;
  }

  /**
      Gets the number of headers contained within the header list.
      Returns: the number of headers in the header list.
  */
  int getCount()
  {
    int _retval;
    _retval = g_mime_header_list_get_count(cast(GMimeHeaderList*)this._cPtr);
    return _retval;
  }

  /**
      Gets the first header with the specified name.
  
      Params:
        name = header name
      Returns: a #GMimeHeader for the specified name.
  */
  gmime.header.Header getHeader(string name)
  {
    GMimeHeader* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_header_list_get_header(cast(GMimeHeaderList*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.header.Header)(cast(GMimeHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the header at the specified index within the list.
  
      Params:
        index = the 0-based index of the header
      Returns: the header at position index.
  */
  gmime.header.Header getHeaderAt(int index)
  {
    GMimeHeader* _cretval;
    _cretval = g_mime_header_list_get_header_at(cast(GMimeHeaderList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.header.Header)(cast(GMimeHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Prepends a header. If value is null, a space will be set aside
      for it (useful for setting the order of headers before values can
      be obtained for them) otherwise the header will be unset.
  
      Params:
        name = header name
        value = header value
        charset = a charset
  */
  void prepend(string name, string value, string charset = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_header_list_prepend(cast(GMimeHeaderList*)this._cPtr, _name, _value, _charset);
  }

  /**
      Remove the first instance of the specified header.
  
      Params:
        name = header name
      Returns: true if the header was successfully removed or false if
        the specified header could not be found.
  */
  bool remove(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)g_mime_header_list_remove(cast(GMimeHeaderList*)this._cPtr, _name);
    return _retval;
  }

  /**
      Removes the header at the specified index from headers.
  
      Params:
        index = the 0-based index of the header to remove
  */
  void removeAt(int index)
  {
    g_mime_header_list_remove_at(cast(GMimeHeaderList*)this._cPtr, index);
  }

  /**
      Set the value of the specified header. If value is null and the
      header, name, had not been previously set, a space will be set
      aside for it (useful for setting the order of headers before values
      can be obtained for them) otherwise the header will be unset.
      
      Note: If there are multiple headers with the specified field name,
      the first instance of the header will be replaced and further
      instances will be removed.
  
      Params:
        name = header name
        value = header value
        charset = a charset
  */
  void set(string name, string value, string charset = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_header_list_set(cast(GMimeHeaderList*)this._cPtr, _name, _value, _charset);
  }

  /**
      Allocates a string buffer containing the raw rfc822 headers
      contained in headers.
  
      Params:
        options = a #GMimeFormatOptions or null
      Returns: a string containing the header block.
  */
  string toString_(gmime.format_options.FormatOptions options = null)
  {
    char* _cretval;
    _cretval = g_mime_header_list_to_string(cast(GMimeHeaderList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Write the headers to a stream.
  
      Params:
        options = a #GMimeFormatOptions or null
        stream = output stream
      Returns: the number of bytes written or %-1 on fail.
  */
  ptrdiff_t writeToStream(gmime.format_options.FormatOptions options, gmime.stream.Stream stream)
  {
    ptrdiff_t _retval;
    _retval = g_mime_header_list_write_to_stream(cast(GMimeHeaderList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }
}
