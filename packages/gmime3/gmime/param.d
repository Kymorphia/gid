/// Module for [Param] class
module gmime.param;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;
import gobject.object;

/**
    A parameter name/value pair as used in the Content-Type and Content-Disposition headers.
*/
class Param : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_param_get_type != &gidSymbolNotFound ? g_mime_param_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Param self()
  {
    return this;
  }

  /**
      Gets the charset used for encoding the parameter.
      Returns: the charset used for encoding the parameter.
  */
  string getCharset()
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_charset(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the encoding method used for encoding the parameter.
      Returns: the encoding method used for encoding the parameter.
  */
  gmime.types.ParamEncodingMethod getEncodingMethod()
  {
    GMimeParamEncodingMethod _cretval;
    _cretval = g_mime_param_get_encoding_method(cast(GMimeParam*)this._cPtr);
    gmime.types.ParamEncodingMethod _retval = cast(gmime.types.ParamEncodingMethod)_cretval;
    return _retval;
  }

  /**
      Gets the language specifier used for encoding the parameter.
      Returns: the language specifier used for encoding the parameter.
  */
  string getLang()
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_lang(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of the parameter.
      Returns: the name of the parameter.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_name(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the parameter.
      Returns: the value of the parameter.
  */
  string getValue()
  {
    const(char)* _cretval;
    _cretval = g_mime_param_get_value(cast(GMimeParam*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the parameter charset used for encoding the value.
  
      Params:
        charset = the charset or null to use the default
  */
  void setCharset(string charset)
  {
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_param_set_charset(cast(GMimeParam*)this._cPtr, _charset);
  }

  /**
      Sets the encoding method used for encoding the value.
  
      Params:
        method = a #GMimeParamEncodingMethod
  */
  void setEncodingMethod(gmime.types.ParamEncodingMethod method)
  {
    g_mime_param_set_encoding_method(cast(GMimeParam*)this._cPtr, method);
  }

  /**
      Sets the parameter language specifier used for encoding the value.
  
      Params:
        lang = the language specifier
  */
  void setLang(string lang)
  {
    const(char)* _lang = lang.toCString(No.Alloc);
    g_mime_param_set_lang(cast(GMimeParam*)this._cPtr, _lang);
  }

  /**
      Sets the parameter value to value.
  
      Params:
        value = the new parameter value
  */
  void setValue(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_param_set_value(cast(GMimeParam*)this._cPtr, _value);
  }
}
