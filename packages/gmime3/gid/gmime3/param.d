/// Module for [Param] class
module gid.gmime3.param;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A parameter name/value pair as used in the Content-Type and Content-Disposition headers.
*/
class Param : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_param_get_type != &gidSymbolNotFound ? g_mime_param_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeParam";
  }

  /** Returns `this`, for use in `with` statements. */
  override Param self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.param.Param]
      Returns: New builder object
  */
  static ParamGidBuilder builder() nothrow
  {
    return new ParamGidBuilder;
  }

  /**
      Gets the charset used for encoding the parameter.
      Returns: the charset used for encoding the parameter.
  */
  string getCharset() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_charset(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the encoding method used for encoding the parameter.
      Returns: the encoding method used for encoding the parameter.
  */
  gid.gmime3.types.ParamEncodingMethod getEncodingMethod() nothrow
  {
    GMimeParamEncodingMethod _cretval;
    _cretval = g_mime_param_get_encoding_method(cast(GMimeParam*)this._cPtr);
    gid.gmime3.types.ParamEncodingMethod _retval = cast(gid.gmime3.types.ParamEncodingMethod)_cretval;
    return _retval;
  }

  /**
      Gets the language specifier used for encoding the parameter.
      Returns: the language specifier used for encoding the parameter.
  */
  string getLang() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_lang(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the name of the parameter.
      Returns: the name of the parameter.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_name(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of the parameter.
      Returns: the value of the parameter.
  */
  string getValue() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_value(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the parameter charset used for encoding the value.
  
      Params:
        charset = the charset or null to use the default
  */
  void setCharset(string charset) nothrow
  {
    const(char)* _charset = charset.toCString!(No.Malloc, No.Nullable);
    g_mime_param_set_charset(cast(GMimeParam*)this._cPtr, _charset);
  }

  /**
      Sets the encoding method used for encoding the value.
  
      Params:
        method = a #GMimeParamEncodingMethod
  */
  void setEncodingMethod(gid.gmime3.types.ParamEncodingMethod method) nothrow
  {
    g_mime_param_set_encoding_method(cast(GMimeParam*)this._cPtr, method);
  }

  /**
      Sets the parameter language specifier used for encoding the value.
  
      Params:
        lang = the language specifier
  */
  void setLang(string lang) nothrow
  {
    const(char)* _lang = lang.toCString!(No.Malloc, No.Nullable);
    g_mime_param_set_lang(cast(GMimeParam*)this._cPtr, _lang);
  }

  /**
      Sets the parameter value to value.
  
      Params:
        value = the new parameter value
  */
  void setValue(string value) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    g_mime_param_set_value(cast(GMimeParam*)this._cPtr, _value);
  }
}

/// Fluent builder implementation template for [gid.gmime3.param.Param]
class ParamGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.param.Param]
final class ParamGidBuilder : ParamGidBuilderImpl!ParamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Param build() nothrow
  {
    return new Param(cast(void*)createGObject(Param._getGType), Yes.Take);
  }
}
