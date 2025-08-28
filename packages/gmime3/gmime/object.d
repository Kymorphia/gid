/// Module for [ObjectWrap] class
module gmime.object;

import gid.gid;
import glib.date_time;
import gmime.autocrypt_header_list;
import gmime.c.functions;
import gmime.c.types;
import gmime.content_disposition;
import gmime.content_type;
import gmime.format_options;
import gmime.header_list;
import gmime.internet_address_list;
import gmime.parser_options;
import gmime.stream;
import gmime.types;
import gobject.object;
import gobject.types;

/**
    Base class for all MIME parts.
*/
class ObjectWrap : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_object_get_type != &gidSymbolNotFound ? g_mime_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectWrap self()
  {
    return this;
  }

  /**
      Performs a lookup of registered #GMimeObject subclasses, registered
      using [gmime.object.ObjectWrap.registerType], to find an appropriate class
      capable of handling MIME parts of the specified Content-Type. If no
      class has been registered to handle that type, it looks for a
      registered class that can handle content_type's media type. If
      that also fails, then it will use the generic part class,
      #GMimePart.
  
      Params:
        options = a #GMimeParserOptions or null
        contentType = a #GMimeContentType object
      Returns: an appropriate #GMimeObject registered to handle MIME
        parts appropriate for content_type.
  */
  this(gmime.parser_options.ParserOptions options, gmime.content_type.ContentType contentType)
  {
    GMimeObject* _cretval;
    _cretval = g_mime_object_new(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, contentType ? cast(GMimeContentType*)contentType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Performs a lookup of registered #GMimeObject subclasses, registered
      using [gmime.object.ObjectWrap.registerType], to find an appropriate class
      capable of handling MIME parts of type type/subtype. If no class
      has been registered to handle that type, it looks for a registered
      class that can handle type. If that also fails, then it will use
      the generic part class, #GMimePart.
  
      Params:
        options = a #GMimeParserOptions or null
        type = mime type
        subtype = mime subtype
      Returns: an appropriate #GMimeObject registered to handle mime-types
        of type/subtype.
  */
  static gmime.object.ObjectWrap newType(gmime.parser_options.ParserOptions options, string type, string subtype)
  {
    GMimeObject* _cretval;
    const(char)* _type = type.toCString(No.Alloc);
    const(char)* _subtype = subtype.toCString(No.Alloc);
    _cretval = g_mime_object_new_type(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _type, _subtype);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Registers the object type object_type for use with the
      [gmime.object.ObjectWrap.newType] convenience function.
      
      Note: You may use the wildcard "*" to match any type and/or
      subtype.
  
      Params:
        type = mime type
        subtype = mime subtype
        objectType = object type
  */
  static void registerType(string type, string subtype, gobject.types.GType objectType)
  {
    const(char)* _type = type.toCString(No.Alloc);
    const(char)* _subtype = subtype.toCString(No.Alloc);
    g_mime_object_register_type(_type, _subtype, objectType);
  }

  /** */
  static void typeRegistryInit()
  {
    g_mime_object_type_registry_init();
  }

  /** */
  static void typeRegistryShutdown()
  {
    g_mime_object_type_registry_shutdown();
  }

  /**
      Appends a new header to the header list.
  
      Params:
        header = header name
        value = header value
        charset = a charset
  */
  void appendHeader(string header, string value, string charset = null)
  {
    const(char)* _header = header.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_object_append_header(cast(GMimeObject*)this._cPtr, _header, _value, _charset);
  }

  /**
      Calculates and sets the most efficient Content-Transfer-Encoding
      for this #GMimeObject and all child parts based on the constraint
      provided.
  
      Params:
        constraint = a #GMimeEncodingConstraint
  */
  void encode(gmime.types.EncodingConstraint constraint)
  {
    g_mime_object_encode(cast(GMimeObject*)this._cPtr, constraint);
  }

  /**
      Creates a new #GMimeAutocryptHeaderList of relevant headers of the
      given type based on the addresses of an mime_part.
      
      Each header in the returned list will:
      
       $(LIST
          * have a valid address
          * be of the type requested
          * be complete
       )
         
      If no Autocrypt header is found for an address, no
      #GMimeAutocryptHeader will be in the list associated with that e-mail address.
      
      Note that the following types of Autocrypt headers will not be
      returned by this function:
      
       $(LIST
          * headers of an unrequested type
          * headers that do not match an address in "From:"
          * unparseable headers
          * headers with unknown critical attributes
          * duplicate valid headers for a given address
       )
         
      On error (e.g. if this version of GMime cannot handle the requested
      Autocrypt type, or if a parameter is missing or malformed), returns
      null
      
      The returned Autocrypt headers will have it effective_date set to
      effective_date
      
      if keep_incomplete isn't set, incompletes are removed
  
      Params:
        effectiveDate = a #GDateTime object
        matchheader = the header we want to match
        addresses = a #InternetAddressList
        keepIncomplete = true if the we should include incompletes
      Returns: a new #GMimeAutocryptHeaderList object,
        or null on error.
  */
  gmime.autocrypt_header_list.AutocryptHeaderList getAutocryptHeaders(glib.date_time.DateTime effectiveDate, string matchheader, gmime.internet_address_list.InternetAddressList addresses, bool keepIncomplete)
  {
    GMimeAutocryptHeaderList* _cretval;
    const(char)* _matchheader = matchheader.toCString(No.Alloc);
    _cretval = g_mime_object_get_autocrypt_headers(cast(GMimeObject*)this._cPtr, effectiveDate ? cast(GDateTime*)effectiveDate._cPtr(No.Dup) : null, _matchheader, addresses ? cast(GMimeInternetAddressList*)addresses._cPtr(No.Dup) : null, keepIncomplete);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header_list.AutocryptHeaderList)(cast(GMimeAutocryptHeaderList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GMimeContentDisposition for the specified MIME object.
      Returns: the #GMimeContentDisposition set on the
        MIME object.
  */
  gmime.content_disposition.ContentDisposition getContentDisposition()
  {
    GMimeContentDisposition* _cretval;
    _cretval = g_mime_object_get_content_disposition(cast(GMimeObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.content_disposition.ContentDisposition)(cast(GMimeContentDisposition*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the Content-Disposition parameter specified by
      name, or null if the parameter does not exist.
  
      Params:
        name = parameter name
      Returns: the value of the requested content-disposition param or
        null if the param doesn't exist. If the param is set, the returned
        string will be in UTF-8.
  */
  string getContentDispositionParameter(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_object_get_content_disposition_parameter(cast(GMimeObject*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the Content-Id of the MIME object or NULL if one is not set.
      Returns: a const pointer to the Content-Id header.
  */
  string getContentId()
  {
    const(char)* _cretval;
    _cretval = g_mime_object_get_content_id(cast(GMimeObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GMimeContentType object for the given MIME object or
      null on fail.
      Returns: the content-type object for the specified
        MIME object.
  */
  gmime.content_type.ContentType getContentType()
  {
    GMimeContentType* _cretval;
    _cretval = g_mime_object_get_content_type(cast(GMimeObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.content_type.ContentType)(cast(GMimeContentType*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the content-type param name set on the MIME part
      object.
  
      Params:
        name = param name
      Returns: the value of the requested content-type param or null if
        the param doesn't exist. If the param is set, the returned string
        will be in UTF-8.
  */
  string getContentTypeParameter(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_object_get_content_type_parameter(cast(GMimeObject*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the MIME object's disposition if set or null otherwise.
      Returns: the disposition string which is probably one of
        #GMIME_DISPOSITION_ATTACHMENT or #GMIME_DISPOSITION_INLINE.
  */
  string getDisposition()
  {
    const(char)* _cretval;
    _cretval = g_mime_object_get_disposition(cast(GMimeObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the first header with the specified name.
  
      Params:
        header = header name
      Returns: the value of the requested header if it
        exists or null otherwise.
  */
  string getHeader(string header)
  {
    const(char)* _cretval;
    const(char)* _header = header.toCString(No.Alloc);
    _cretval = g_mime_object_get_header(cast(GMimeObject*)this._cPtr, _header);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the header list for object.
      Returns: the #GMimeHeaderList for object. Do not
        free this pointer when you are done with it.
  */
  gmime.header_list.HeaderList getHeaderList()
  {
    GMimeHeaderList* _cretval;
    _cretval = g_mime_object_get_header_list(cast(GMimeObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.header_list.HeaderList)(cast(GMimeHeaderList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Allocates a string buffer containing all of the MIME object's raw
      headers.
  
      Params:
        options = a #GMimeFormatOptions or null
      Returns: an allocated string containing all of the raw MIME headers.
        
        Note: The returned string will not be suitable for display.
  */
  string getHeaders(gmime.format_options.FormatOptions options = null)
  {
    char* _cretval;
    _cretval = g_mime_object_get_headers(cast(GMimeObject*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Prepends a new header to the header list.
  
      Params:
        header = header name
        value = header value
        charset = a charset
  */
  void prependHeader(string header, string value, string charset = null)
  {
    const(char)* _header = header.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_object_prepend_header(cast(GMimeObject*)this._cPtr, _header, _value, _charset);
  }

  /**
      Removed the specified header if it exists.
  
      Params:
        header = header name
      Returns: true if the header was removed or false if it could not
        be found.
  */
  bool removeHeader(string header)
  {
    bool _retval;
    const(char)* _header = header.toCString(No.Alloc);
    _retval = g_mime_object_remove_header(cast(GMimeObject*)this._cPtr, _header);
    return _retval;
  }

  /**
      Set the content disposition for the specified mime part and then
      serializes it to the Content-Disposition header field.
  
      Params:
        disposition = a #GMimeContentDisposition object
  */
  void setContentDisposition(gmime.content_disposition.ContentDisposition disposition)
  {
    g_mime_object_set_content_disposition(cast(GMimeObject*)this._cPtr, disposition ? cast(GMimeContentDisposition*)disposition._cPtr(No.Dup) : null);
  }

  /**
      Add a content-disposition parameter to the specified mime part.
      
      Note: The name string should be in US-ASCII while the value
      string should be in UTF-8.
  
      Params:
        name = parameter name
        value = parameter value
  */
  void setContentDispositionParameter(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_object_set_content_disposition_parameter(cast(GMimeObject*)this._cPtr, _name, _value);
  }

  /**
      Sets the Content-Id of the MIME object.
  
      Params:
        contentId = content-id (addr-spec portion)
  */
  void setContentId(string contentId)
  {
    const(char)* _contentId = contentId.toCString(No.Alloc);
    g_mime_object_set_content_id(cast(GMimeObject*)this._cPtr, _contentId);
  }

  /**
      Sets the content-type for the specified MIME object and then
      serializes it to the Content-Type header field.
  
      Params:
        contentType = a #GMimeContentType object
  */
  void setContentType(gmime.content_type.ContentType contentType)
  {
    g_mime_object_set_content_type(cast(GMimeObject*)this._cPtr, contentType ? cast(GMimeContentType*)contentType._cPtr(No.Dup) : null);
  }

  /**
      Sets the content-type param name to the value value.
      
      Note: The name string should be in US-ASCII while the value
      string should be in UTF-8.
  
      Params:
        name = param name
        value = param value
  */
  void setContentTypeParameter(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_object_set_content_type_parameter(cast(GMimeObject*)this._cPtr, _name, _value);
  }

  /**
      Sets the disposition to disposition which may be one of
      #GMIME_DISPOSITION_ATTACHMENT or #GMIME_DISPOSITION_INLINE or, by
      your choice, any other string which would indicate how the MIME
      part should be displayed by the MUA.
  
      Params:
        disposition = disposition ("attachment" or "inline")
  */
  void setDisposition(string disposition)
  {
    const(char)* _disposition = disposition.toCString(No.Alloc);
    g_mime_object_set_disposition(cast(GMimeObject*)this._cPtr, _disposition);
  }

  /**
      Sets a header to the specified value.
  
      Params:
        header = header name
        value = header value
        charset = a charset
  */
  void setHeader(string header, string value, string charset = null)
  {
    const(char)* _header = header.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_object_set_header(cast(GMimeObject*)this._cPtr, _header, _value, _charset);
  }

  /**
      Allocates a string buffer containing the contents of object.
  
      Params:
        options = a #GMimeFormatOptions or null
      Returns: an allocated string containing the contents of the mime
        object.
  */
  string toString_(gmime.format_options.FormatOptions options = null)
  {
    char* _cretval;
    _cretval = g_mime_object_to_string(cast(GMimeObject*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Write only the content of the MIME object to stream.
  
      Params:
        options = a #GMimeFormatOptions or null
        stream = stream
      Returns: the number of bytes written or %-1 on fail.
  */
  ptrdiff_t writeContentToStream(gmime.format_options.FormatOptions options, gmime.stream.Stream stream)
  {
    ptrdiff_t _retval;
    _retval = g_mime_object_write_content_to_stream(cast(GMimeObject*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Write the headers and content of the MIME object to stream.
  
      Params:
        options = a #GMimeFormatOptions or null
        stream = stream
      Returns: the number of bytes written or %-1 on fail.
  */
  ptrdiff_t writeToStream(gmime.format_options.FormatOptions options, gmime.stream.Stream stream)
  {
    ptrdiff_t _retval;
    _retval = g_mime_object_write_to_stream(cast(GMimeObject*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }
}
