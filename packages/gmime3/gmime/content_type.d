/// Module for [ContentType] class
module gmime.content_type;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.param_list;
import gmime.parser_options;
import gmime.types;
import gobject.object;

/**
    A data structure representing a Content-Type.
*/
class ContentType : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_content_type_get_type != &gidSymbolNotFound ? g_mime_content_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentType self()
  {
    return this;
  }

  /**
      Creates a Content-Type object with type type and subtype subtype.
  
      Params:
        type = the MIME type or null for the default value
        subtype = the MIME subtype or null for the default value
      Returns: a new #GMimeContentType object.
  */
  this(string type, string subtype)
  {
    GMimeContentType* _cretval;
    const(char)* _type = type.toCString(No.Alloc);
    const(char)* _subtype = subtype.toCString(No.Alloc);
    _cretval = g_mime_content_type_new(_type, _subtype);
    this(_cretval, Yes.Take);
  }

  /**
      Parses the input string into a #GMimeContentType object.
  
      Params:
        options = a #GMimeParserOptions or null
        str = input string containing a content-type (and params)
      Returns: a new #GMimeContentType object.
  */
  static gmime.content_type.ContentType parse(gmime.parser_options.ParserOptions options, string str)
  {
    GMimeContentType* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = g_mime_content_type_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.content_type.ContentType)(cast(GMimeContentType*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Encodes the Content-Disposition header.
  
      Params:
        options = a #GMimeFormatOptions or null
      Returns: a new string containing the encoded header value.
  */
  string encode(gmime.format_options.FormatOptions options = null)
  {
    char* _cretval;
    _cretval = g_mime_content_type_encode(cast(GMimeContentType*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the Content-Type's media sub-type.
      Returns: the Content-Type's media sub-type.
  */
  string getMediaSubtype()
  {
    const(char)* _cretval;
    _cretval = g_mime_content_type_get_media_subtype(cast(GMimeContentType*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the Content-Type's media type.
      Returns: the Content-Type's media type.
  */
  string getMediaType()
  {
    const(char)* _cretval;
    _cretval = g_mime_content_type_get_media_type(cast(GMimeContentType*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Allocates a string buffer containing the type and subtype defined
      by the content_type.
      Returns: an allocated string containing the type and subtype of the
        content-type in the format: type/subtype.
  */
  string getMimeType()
  {
    char* _cretval;
    _cretval = g_mime_content_type_get_mime_type(cast(GMimeContentType*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the parameter value specified by name if it's available.
  
      Params:
        name = parameter name (aka attribute)
      Returns: the value of the requested parameter or null if the
        parameter is not set. If the parameter is set, the returned string
        will be in UTF-8.
  */
  string getParameter(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_content_type_get_parameter(cast(GMimeContentType*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the Content-Type's parameter list.
      Returns: the Content-Type's parameter list.
  */
  gmime.param_list.ParamList getParameters()
  {
    GMimeParamList* _cretval;
    _cretval = g_mime_content_type_get_parameters(cast(GMimeContentType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.param_list.ParamList)(cast(GMimeParamList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Compares the given type and subtype with that of the given mime
      type object.
  
      Params:
        type = MIME type to compare against
        subtype = MIME subtype to compare against
      Returns: true if the MIME types match or false otherwise. You may
        use "*" in place of type and/or subtype as a wilcard.
  */
  bool isType(string type, string subtype)
  {
    bool _retval;
    const(char)* _type = type.toCString(No.Alloc);
    const(char)* _subtype = subtype.toCString(No.Alloc);
    _retval = cast(bool)g_mime_content_type_is_type(cast(GMimeContentType*)this._cPtr, _type, _subtype);
    return _retval;
  }

  /**
      Sets the Content-Type's media subtype.
  
      Params:
        subtype = media subtype
  */
  void setMediaSubtype(string subtype)
  {
    const(char)* _subtype = subtype.toCString(No.Alloc);
    g_mime_content_type_set_media_subtype(cast(GMimeContentType*)this._cPtr, _subtype);
  }

  /**
      Sets the Content-Type's media type.
  
      Params:
        type = media type
  */
  void setMediaType(string type)
  {
    const(char)* _type = type.toCString(No.Alloc);
    g_mime_content_type_set_media_type(cast(GMimeContentType*)this._cPtr, _type);
  }

  /**
      Sets a parameter on the Content-Type.
      
      Note: The name should be in US-ASCII while the value should be in
      UTF-8.
  
      Params:
        name = parameter name (aka attribute)
        value = parameter value
  */
  void setParameter(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_content_type_set_parameter(cast(GMimeContentType*)this._cPtr, _name, _value);
  }
}
