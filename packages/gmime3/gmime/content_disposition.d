/// Module for [ContentDisposition] class
module gmime.content_disposition;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.param_list;
import gmime.parser_options;
import gmime.types;
import gobject.object;

/**
    A data structure representing a Content-Disposition.
*/
class ContentDisposition : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_content_disposition_get_type != &gidSymbolNotFound ? g_mime_content_disposition_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentDisposition self()
  {
    return this;
  }

  /**
      Creates a new #GMimeContentDisposition object.
      Returns: a new #GMimeContentDisposition object.
  */
  this()
  {
    GMimeContentDisposition* _cretval;
    _cretval = g_mime_content_disposition_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parses the input string into a #GMimeContentDisposition object.
  
      Params:
        options = a #GMimeParserOptions or null
        str = Content-Disposition field value
      Returns: a new #GMimeContentDisposition object.
  */
  static gmime.content_disposition.ContentDisposition parse(gmime.parser_options.ParserOptions options, string str)
  {
    GMimeContentDisposition* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = g_mime_content_disposition_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.content_disposition.ContentDisposition)(cast(GMimeContentDisposition*)_cretval, Yes.Take);
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
    _cretval = g_mime_content_disposition_encode(cast(GMimeContentDisposition*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the disposition or null on fail.
      Returns: the disposition string which is probably one of
        #GMIME_DISPOSITION_ATTACHMENT or #GMIME_DISPOSITION_INLINE.
  */
  string getDisposition()
  {
    const(char)* _cretval;
    _cretval = g_mime_content_disposition_get_disposition(cast(GMimeContentDisposition*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the parameter value specified by name if it's available.
  
      Params:
        name = parameter name
      Returns: the value of the requested parameter or null if the
        parameter is not set. If the parameter is set, the returned string
        will be in UTF-8.
  */
  string getParameter(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_content_disposition_get_parameter(cast(GMimeContentDisposition*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the Content-Disposition parameter list.
      Returns: the Content-Disposition's parameter list.
  */
  gmime.param_list.ParamList getParameters()
  {
    GMimeParamList* _cretval;
    _cretval = g_mime_content_disposition_get_parameters(cast(GMimeContentDisposition*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.param_list.ParamList)(cast(GMimeParamList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines if a Content-Disposition has a value of "attachment".
      Returns: true if the value matches "attachment", otherwise false.
  */
  bool isAttachment()
  {
    bool _retval;
    _retval = g_mime_content_disposition_is_attachment(cast(GMimeContentDisposition*)this._cPtr);
    return _retval;
  }

  /**
      Sets the disposition to value which may be one of
      #GMIME_DISPOSITION_ATTACHMENT or #GMIME_DISPOSITION_INLINE or, by
      your choice, any other string which would indicate how the MIME
      part should be displayed by the MUA.
  
      Params:
        value = disposition value
  */
  void setDisposition(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_content_disposition_set_disposition(cast(GMimeContentDisposition*)this._cPtr, _value);
  }

  /**
      Sets a parameter on the Content-Disposition.
      
      Note: The name should be in US-ASCII while the value should be in
      UTF-8.
  
      Params:
        name = parameter name
        value = parameter value
  */
  void setParameter(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_content_disposition_set_parameter(cast(GMimeContentDisposition*)this._cPtr, _name, _value);
  }
}
