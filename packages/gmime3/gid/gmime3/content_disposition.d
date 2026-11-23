/// Module for [ContentDisposition] class
module gid.gmime3.content_disposition;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.format_options;
import gid.gmime3.param_list;
import gid.gmime3.parser_options;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A data structure representing a Content-Disposition.
*/
class ContentDisposition : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_content_disposition_get_type != &gidSymbolNotFound ? g_mime_content_disposition_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeContentDisposition";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentDisposition self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.content_disposition.ContentDisposition]
      Returns: New builder object
  */
  static ContentDispositionGidBuilder builder() nothrow
  {
    return new ContentDispositionGidBuilder;
  }

  /**
      Creates a new #GMimeContentDisposition object.
      Returns: a new #GMimeContentDisposition object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeContentDisposition* _cretval;
      _cretval = g_mime_content_disposition_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Parses the input string into a #GMimeContentDisposition object.
  
      Params:
        options = a #GMimeParserOptions or null
        str = Content-Disposition field value
      Returns: a new #GMimeContentDisposition object.
  */
  static gid.gmime3.content_disposition.ContentDisposition parse(gid.gmime3.parser_options.ParserOptions options, string str) nothrow
  {
    GMimeContentDisposition* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_content_disposition_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.content_disposition.ContentDisposition)(cast(GMimeContentDisposition*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Encodes the Content-Disposition header.
  
      Params:
        options = a #GMimeFormatOptions or null
      Returns: a new string containing the encoded header value.
  */
  string encode(gid.gmime3.format_options.FormatOptions options = null) nothrow
  {
    char* _cretval;
    _cretval = g_mime_content_disposition_encode(cast(GMimeContentDisposition*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the disposition or null on fail.
      Returns: the disposition string which is probably one of
        #GMIME_DISPOSITION_ATTACHMENT or #GMIME_DISPOSITION_INLINE.
  */
  string getDisposition() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_content_disposition_get_disposition(cast(GMimeContentDisposition*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  string getParameter(string name) nothrow
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_content_disposition_get_parameter(cast(GMimeContentDisposition*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the Content-Disposition parameter list.
      Returns: the Content-Disposition's parameter list.
  */
  gid.gmime3.param_list.ParamList getParameters() nothrow
  {
    GMimeParamList* _cretval;
    _cretval = g_mime_content_disposition_get_parameters(cast(GMimeContentDisposition*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.param_list.ParamList)(cast(GMimeParamList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines if a Content-Disposition has a value of "attachment".
      Returns: true if the value matches "attachment", otherwise false.
  */
  bool isAttachment() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_content_disposition_is_attachment(cast(GMimeContentDisposition*)this._cPtr);
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
  void setDisposition(string value) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
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
  void setParameter(string name, string value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    g_mime_content_disposition_set_parameter(cast(GMimeContentDisposition*)this._cPtr, _name, _value);
  }
}

/// Fluent builder implementation template for [gid.gmime3.content_disposition.ContentDisposition]
class ContentDispositionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.content_disposition.ContentDisposition]
final class ContentDispositionGidBuilder : ContentDispositionGidBuilderImpl!ContentDispositionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContentDisposition build() nothrow
  {
    return new ContentDisposition(cast(void*)createGObject(ContentDisposition._getGType), Yes.Take);
  }
}
