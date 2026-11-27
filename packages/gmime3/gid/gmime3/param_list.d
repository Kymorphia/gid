/// Module for [ParamList] class
module gid.gmime3.param_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.string_;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.format_options;
import gid.gmime3.param;
import gid.gmime3.parser_options;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A list of Content-Type or Content-Disposition parameters.
*/
@gidGir("ParamList", "ParamListClass")
class ParamList : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_param_list_get_type != &gidSymbolNotFound ? g_mime_param_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeParamList";
  }

  /** Returns `this`, for use in `with` statements. */
  override ParamList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.param_list.ParamList]
      Returns: New builder object
  */
  static ParamListGidBuilder builder() nothrow
  {
    return new ParamListGidBuilder;
  }

  /**
      Creates a new Content-Type or Content-Disposition parameter list.
      Returns: a new #GMimeParamList.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeParamList* _cretval;
      _cretval = g_mime_param_list_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Parses the input string into a parameter list.
  
      Params:
        options = a #GMimeParserOptions or null
        str = a string to parse
      Returns: a new #GMimeParamList.
  */
  static gid.gmime3.param_list.ParamList parse(gid.gmime3.parser_options.ParserOptions options, string str) nothrow
  {
    GMimeParamList* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_param_list_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.param_list.ParamList)(cast(GMimeParamList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Clears the list of parameters.
  */
  void clear() nothrow
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
  void encode(gid.gmime3.format_options.FormatOptions options, bool fold, out gid.glib2.string_.String str) nothrow
  {
    auto _str = boxedNew!GString(gid.glib2.string_.String._getGType);
    g_mime_param_list_encode(cast(GMimeParamList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, fold, _str);
    str = new gid.glib2.string_.String(cast(void*)_str, Yes.Take);
  }

  /**
      Gets the #GMimeParam with the given name.
  
      Params:
        name = the name of the parameter
      Returns: the requested #GMimeParam.
  */
  gid.gmime3.param.Param getParameter(string name) nothrow
  {
    GMimeParam* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_param_list_get_parameter(cast(GMimeParamList*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.param.Param)(cast(GMimeParam*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GMimeParam at the specified index.
  
      Params:
        index = the index of the requested parameter
      Returns: the #GMimeParam at the specified index.
  */
  gid.gmime3.param.Param getParameterAt(int index) nothrow
  {
    GMimeParam* _cretval;
    _cretval = g_mime_param_list_get_parameter_at(cast(GMimeParamList*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.param.Param)(cast(GMimeParam*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the length of the list.
      Returns: the number of #GMimeParam items in the list.
  */
  int length() nothrow
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
  bool remove(string name) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_mime_param_list_remove(cast(GMimeParamList*)this._cPtr, _name);
    return _retval;
  }

  /**
      Removes a #GMimeParam from the #GMimeParamList at the specified index.
  
      Params:
        index = index of the param to remove
      Returns: true if a #GMimeParam was removed or false otherwise.
  */
  bool removeAt(int index) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_param_list_remove_at(cast(GMimeParamList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the specified parameter to value.
  
      Params:
        name = The name of the parameter
        value = The parameter value
  */
  void setParameter(string name, string value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    g_mime_param_list_set_parameter(cast(GMimeParamList*)this._cPtr, _name, _value);
  }
}

/// Fluent builder implementation template for [gid.gmime3.param_list.ParamList]
class ParamListGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.param_list.ParamList]
final class ParamListGidBuilder : ParamListGidBuilderImpl!ParamListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ParamList build() nothrow
  {
    return new ParamList(cast(void*)createGObject(ParamList._getGType), Yes.Take);
  }
}
