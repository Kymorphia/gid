/// Module for [Header] class
module gmime.header;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A message or mime-part header.
*/
class Header : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_header_get_type != &gidSymbolNotFound ? g_mime_header_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Header self()
  {
    return this;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a Sender, From, Reply-To, To, Cc, or Bcc header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatAddrlist(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_addrlist(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a Content-Disposition header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatContentDisposition(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_content_disposition(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a Content-Type header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatContentType(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_content_type(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a header value
        charset = a charset to use when encoding the value
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatDefault(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_default(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a Message-Id or Content-Id header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatMessageId(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_message_id(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a Newsgroups header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatNewsgroups(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_newsgroups(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a Received header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatReceived(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_received(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses the value and then re-formats it to conform to the formatting options,
      folding the value if necessary.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = a References or In-Reply-To header value
        charset = a charset (note: unused)
      Returns: a newly allocated string containing the reformatted value.
  */
  string formatReferences(gmime.format_options.FormatOptions options, string value, string charset)
  {
    char* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_header_format_references(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the header's name.
      Returns: the header name or null if invalid.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_mime_header_get_name(cast(GMimeHeader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the header's stream offset if known.
      Returns: the header offset or %-1 if unknown.
  */
  long getOffset()
  {
    long _retval;
    _retval = g_mime_header_get_offset(cast(GMimeHeader*)this._cPtr);
    return _retval;
  }

  /**
      Gets the header's raw name. The raw header name is the complete string up to
      (but not including) the ':' separating the header's name from its value. This
      string may be different from the value returned by [gmime.header.Header.getName]
      if the parsed message's header contained trailing whitespace after the header
      name, such as: "Subject : this is the subject\r\n".
      Returns: the raw header name.
  */
  string getRawName()
  {
    const(char)* _cretval;
    _cretval = g_mime_header_get_raw_name(cast(GMimeHeader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the header's raw (folded) value.
      Returns: the header value or null if invalid.
  */
  string getRawValue()
  {
    const(char)* _cretval;
    _cretval = g_mime_header_get_raw_value(cast(GMimeHeader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the header's unfolded value.
      Returns: the header's decoded value or null if invalid.
  */
  string getValue()
  {
    const(char)* _cretval;
    _cretval = g_mime_header_get_value(cast(GMimeHeader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the header's raw value.
  
      Params:
        rawValue = the raw value
  */
  void setRawValue(string rawValue)
  {
    const(char)* _rawValue = rawValue.toCString(No.Alloc);
    g_mime_header_set_raw_value(cast(GMimeHeader*)this._cPtr, _rawValue);
  }

  /**
      Sets the header's decoded value.
  
      Params:
        options = a #GMimeFormatOptions or null
        value = the new header value
        charset = a charset
  */
  void setValue(gmime.format_options.FormatOptions options, string value, string charset = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_header_set_value(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _value, _charset);
  }

  /**
      Write the header to the specified stream.
  
      Params:
        options = a #GMimeFormatOptions or null
        stream = a #GMimeStream
      Returns: the number of bytes written, or %-1 on fail.
  */
  ptrdiff_t writeToStream(gmime.format_options.FormatOptions options, gmime.stream.Stream stream)
  {
    ptrdiff_t _retval;
    _retval = g_mime_header_write_to_stream(cast(GMimeHeader*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }
}
