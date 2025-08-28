/// Module for [ParamList] class
module gmime.param_list;

import gid.gid;
import glib.string_;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.param;
import gmime.parser_options;
import gmime.types;
import gobject.object;

/**
    A list of Content-Type or Content-Disposition parameters.
*/
class ParamList : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_param_list_get_type != &gidSymbolNotFound ? g_mime_param_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ParamList self()
  {
    return this;
  }

  /**
      Creates a new Content-Type or Content-Disposition parameter list.
      Returns: a new #GMimeParamList.
  */
  this()
  {
    GMimeParamList* _cretval;
    _cretval = g_mime_param_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parses the input string into a parameter list.
  
      Params:
        options = a #GMimeParserOptions or null
        str = a string to parse
      Returns: a new #GMimeParamList.
  */
  static gmime.param_list.ParamList parse(gmime.parser_options.ParserOptions options, string str)
  {
    GMimeParamList* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = g_mime_param_list_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.param_list.ParamList)(cast(GMimeParamList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Clears the list of parameters.
  */
  void clear()
  {
    g_mime_param_list_clear(cast(GMimeParamList*)this._cPtr);
  }

  /**
      Encodes the parameter list into str, folding lines if required.
  
      Params:
        options = a #GMimeFormatOptions or null
        fold = true if the parameter list should be folded; otherwise, false
        str = the output string buffer
  */
  void encode(gmime.format_options.FormatOptions options, bool fold, out glib.string_.String str)
  {
    GString _str;
    g_mime_param_list_encode(cast(GMimeParamList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, fold, &_str);
    str = new glib.string_.String(cast(void*)&_str, No.Take);
  }

  /**
      Gets the #GMimeParam with the given name.
  
      Params:
        name = the name of the parameter
      Returns: the requested #GMimeParam.
  */
  gmime.param.Param getParameter(string name)
  {
    GMimeParam* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_param_list_get_parameter(cast(GMimeParamList*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.param.Param)(cast(GMimeParam*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GMimeParam at the specified index.
  
      Params:
        index = the index of the requested parameter
      Returns: the #GMimeParam at the specified index.
  */
  gmime.param.Param getParameterAt(int index)
  {
    GMimeParam* _cretval;
    _cretval = g_mime_param_list_get_parameter_at(cast(GMimeParamList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.param.Param)(cast(GMimeParam*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the length of the list.
      Returns: the number of #GMimeParam items in the list.
  */
  int length()
  {
    int _retval;
    _retval = g_mime_param_list_length(cast(GMimeParamList*)this._cPtr);
    return _retval;
  }

  /**
      Removes a parameter from the #GMimeParamList.
  
      Params:
        name = the name of the parameter
      Returns: true if the specified parameter was removed or false otherwise.
  */
  bool remove(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = g_mime_param_list_remove(cast(GMimeParamList*)this._cPtr, _name);
    return _retval;
  }

  /**
      Removes a #GMimeParam from the #GMimeParamList at the specified index.
  
      Params:
        index = index of the param to remove
      Returns: true if a #GMimeParam was removed or false otherwise.
  */
  bool removeAt(int index)
  {
    bool _retval;
    _retval = g_mime_param_list_remove_at(cast(GMimeParamList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the specified parameter to value.
  
      Params:
        name = The name of the parameter
        value = The parameter value
  */
  void setParameter(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_mime_param_list_set_parameter(cast(GMimeParamList*)this._cPtr, _name, _value);
  }
}
