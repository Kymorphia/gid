/// Global functions for javascriptcore6 library
module javascriptcore.global;

import gid.gid;
import glib.option_group;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;


/**
    Returns the major version number of the JavaScriptCore library.
    (e.g. in JavaScriptCore version 1.8.3 this is 1.)
    
    This function is in the library, so it represents the JavaScriptCore library
    your code is running against. Contrast with the #JSC_MAJOR_VERSION
    macro, which represents the major version of the JavaScriptCore headers you
    have included when compiling your code.
    Returns: the major version number of the JavaScriptCore library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = jsc_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the JavaScriptCore library.
    (e.g. in JavaScriptCore version 1.8.3 this is 3.)
    
    This function is in the library, so it represents the JavaScriptCore library
    your code is running against. Contrast with the #JSC_MICRO_VERSION
    macro, which represents the micro version of the JavaScriptCore headers you
    have included when compiling your code.
    Returns: the micro version number of the JavaScriptCore library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = jsc_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the JavaScriptCore library.
    (e.g. in JavaScriptCore version 1.8.3 this is 8.)
    
    This function is in the library, so it represents the JavaScriptCore library
    your code is running against. Contrast with the #JSC_MINOR_VERSION
    macro, which represents the minor version of the JavaScriptCore headers you
    have included when compiling your code.
    Returns: the minor version number of the JavaScriptCore library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = jsc_get_minor_version();
  return _retval;
}

/**
    Iterates all available options calling function for each one. Iteration can
    stop early if function returns false.

    Params:
      function_ = a #JSCOptionsFunc callback
*/
void optionsForeach(javascriptcore.types.OptionsFunc function_)
{
  extern(C) gboolean _function_Callback(const(char)* option, JSCOptionType type, const(char)* description, void* userData)
  {
    bool _dretval;
    auto _dlg = cast(javascriptcore.types.OptionsFunc*)userData;
    string _option = option.fromCString(No.Free);
    string _description = description.fromCString(No.Free);

    _dretval = (*_dlg)(_option, type, _description);
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  auto _function_ = function_ ? cast(void*)&(function_) : null;
  jsc_options_foreach(_function_CB, _function_);
}

/**
    Get option as a #gboolean value.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetBoolean(string option, out bool value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  gboolean _value;
  _retval = cast(bool)jsc_options_get_boolean(_option, &_value);
  value = cast(bool)_value;
  return _retval;
}

/**
    Get option as a #gdouble value.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetDouble(string option, out double value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_get_double(_option, cast(double*)&value);
  return _retval;
}

/**
    Get option as a #gint value.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetInt(string option, out int value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_get_int(_option, cast(int*)&value);
  return _retval;
}

/**
    Create a #GOptionGroup to handle JSCOptions as command line arguments.
    The options will be exposed as command line arguments with the form
    <emphasis>--jsc-&lt;option&gt;=&lt;value&gt;</emphasis>.
    Each entry in the returned #GOptionGroup is configured to apply the
    corresponding option during command line parsing. Applications only need to
    pass the returned group to [glib.option_context.OptionContext.addGroup], and the rest will
    be taken care for automatically.
    Returns: a #GOptionGroup for the JSCOptions
*/
glib.option_group.OptionGroup optionsGetOptionGroup()
{
  GOptionGroup* _cretval;
  _cretval = jsc_options_get_option_group();
  auto _retval = _cretval ? new glib.option_group.OptionGroup(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Get option as a range string. The string must be in the
    format <emphasis>[!]&lt;low&gt;[:&lt;high&gt;]</emphasis> where low and high are #guint values.
    Values between low and high (both included) will be considered in
    the range, unless <emphasis>!</emphasis> is used to invert the range.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetRangeString(string option, out string value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  char* _value;
  _retval = cast(bool)jsc_options_get_range_string(_option, &_value);
  value = _value.fromCString(Yes.Free);
  return _retval;
}

/**
    Get option as a #gsize value.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetSize(string option, out size_t value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_get_size(_option, cast(size_t*)&value);
  return _retval;
}

/**
    Get option as a string.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetString(string option, out string value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  char* _value;
  _retval = cast(bool)jsc_options_get_string(_option, &_value);
  value = _value.fromCString(Yes.Free);
  return _retval;
}

/**
    Get option as a #guint value.

    Params:
      option = the option identifier
      value = return location for the option value
    Returns: true if value has been set or false if the option doesn't exist
*/
bool optionsGetUint(string option, out uint value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_get_uint(_option, cast(uint*)&value);
  return _retval;
}

/**
    Set option as a #gboolean value.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetBoolean(string option, bool value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_boolean(_option, value);
  return _retval;
}

/**
    Set option as a #gdouble value.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetDouble(string option, double value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_double(_option, value);
  return _retval;
}

/**
    Set option as a #gint value.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetInt(string option, int value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_int(_option, value);
  return _retval;
}

/**
    Set option as a range string. The string must be in the
    format <emphasis>[!]&lt;low&gt;[:&lt;high&gt;]</emphasis> where low and high are #guint values.
    Values between low and high (both included) will be considered in
    the range, unless <emphasis>!</emphasis> is used to invert the range.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetRangeString(string option, string value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_range_string(_option, _value);
  return _retval;
}

/**
    Set option as a #gsize value.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetSize(string option, size_t value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_size(_option, value);
  return _retval;
}

/**
    Set option as a string.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetString(string option, string value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_string(_option, _value);
  return _retval;
}

/**
    Set option as a #guint value.

    Params:
      option = the option identifier
      value = the value to set
    Returns: true if option was correctly set or false otherwise.
*/
bool optionsSetUint(string option, uint value)
{
  bool _retval;
  const(char)* _option = option.toCString(No.Alloc);
  _retval = cast(bool)jsc_options_set_uint(_option, value);
  return _retval;
}
