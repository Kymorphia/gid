/// Global functions for vte3 library
module vte.global;

import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;


/**
    Queries whether the legacy encoding encoding is supported.
    
    If ICU support is not available, this function always returns false.
    
    Note that UTF-8 is always supported; you can select it by
    passing null to [vte.terminal.Terminal.setEncoding].

    Params:
      encoding = the name of the legacy encoding
    Returns: true iff the legacy encoding encoding is supported
*/
bool getEncodingSupported(string encoding) nothrow
{
  bool _retval;
  const(char)* _encoding = encoding.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)vte_get_encoding_supported(_encoding);
  return _retval;
}

/**
    Gets the list of supported legacy encodings.
    
    If ICU support is not available, this returns an empty vector.
    Note that UTF-8 is always supported; you can select it by
    passing null to [vte.terminal.Terminal.setEncoding].

    Params:
      includeAliases = whether to include alias names
    Returns: the list of supported encodings; free with
        [glib.global.strfreev]
*/
string[] getEncodings(bool includeAliases) nothrow
{
  char** _cretval;
  _cretval = vte_get_encodings(includeAliases);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString!(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Gets features VTE was compiled with.
    Returns: flags from #VteFeatureFlags
*/
vte.types.FeatureFlags getFeatureFlags() nothrow
{
  VteFeatureFlags _cretval;
  _cretval = vte_get_feature_flags();
  vte.types.FeatureFlags _retval = cast(vte.types.FeatureFlags)_cretval;
  return _retval;
}

/**
    Gets a list of features vte was compiled with.
    Returns: a string with features
*/
string getFeatures() nothrow
{
  const(char)* _cretval;
  _cretval = vte_get_features();
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Returns the major version of the VTE library at runtime.
    Contrast this with [vte.types.MAJOR_VERSION] which represents
    the version of the VTE library that the code was compiled
    with.
    Returns: the major version
*/
uint getMajorVersion() nothrow
{
  uint _retval;
  _retval = vte_get_major_version();
  return _retval;
}

/**
    Returns the micro version of the VTE library at runtime.
    Contrast this with [vte.types.MICRO_VERSION] which represents
    the version of the VTE library that the code was compiled
    with.
    Returns: the micro version
*/
uint getMicroVersion() nothrow
{
  uint _retval;
  _retval = vte_get_micro_version();
  return _retval;
}

/**
    Returns the minor version of the VTE library at runtime.
    Contrast this with [vte.types.MINOR_VERSION] which represents
    the version of the VTE library that the code was compiled
    with.
    Returns: the minor version
*/
uint getMinorVersion() nothrow
{
  uint _retval;
  _retval = vte_get_minor_version();
  return _retval;
}

/**
    Gets the names of the installed termprops in an unspecified order.
    Returns: the names of the installed
        termprops, or null if there are no termprops
*/
string[] getTermprops() nothrow
{
  const(char*)* _cretval;
  size_t _cretlength;
  _cretval = vte_get_termprops(&_cretlength);
  string[] _retval;

  if (_cretval)
  {
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString!(No.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Gets the user's shell, or null. In the latter case, the
    system default (usually "/bin/sh") should be used.
    Returns: a newly allocated string with the
        user's shell, or null
*/
string getUserShell() nothrow
{
  char* _cretval;
  _cretval = vte_get_user_shell();
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Installs a new terminal property that can be set by the application.
    
    name must follow the rules for termprop names as laid out above; it
    must have at least 4 components, the first two of which must be "vte",
    and "ext". Use the [vte.types.TERMPROP_NAME_PREFIX] macro which defines this
    name prefix.
    
    You should use an identifier for your terminal as the first component
    after the prefix, as a namespace marker.
    
    It is a programming error to call this function with a name that does
    not meet these requirements.
    
    It is a programming error to call this function after any #VteTerminal
    instances have been created.
    
    It is a programming error to call this function if the named termprop
    is already installed with a different type or flags.

    Params:
      name = a namespaced property name
      type = a #VtePropertyType to use for the property
      flags = flags from #VtePropertyFlags
    Returns: an ID for the termprop
*/
int installTermprop(string name, vte.types.PropertyType type, vte.types.PropertyFlags flags) nothrow
{
  int _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _retval = vte_install_termprop(_name, type, flags);
  return _retval;
}

/**
    Installs a new terminal property name as an alias for the terminal
    property target_name.

    Params:
      name = a namespaced property name
      targetName = the target property name
    Returns: the ID for the termprop target_name
*/
int installTermpropAlias(string name, string targetName) nothrow
{
  int _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _targetName = targetName.toCString!(No.Malloc, No.Nullable);
  _retval = vte_install_termprop_alias(_name, _targetName);
  return _retval;
}

/**
    Gets the property type of the termprop. For properties installed by
    [vte.global.installTermprop], the name starts with "vte.ext.".
    
    For an alias termprop (see [vte.global.installTermpropAlias]), resolved_name
    will be name of the alias' target termprop; otherwise it will be name.

    Params:
      name = a termprop name
      resolvedName = a location to store the termprop's name
      prop = a location to store the termprop's ID
      type = a location to store the termprop's type as a #VtePropertyType
      flags = a location to store the termprop's flags as a #VtePropertyFlags
    Returns: true iff the termprop exists, and then prop, type and
        flags will be filled in
*/
bool queryTermprop(string name, out string resolvedName, out int prop, out vte.types.PropertyType type, out vte.types.PropertyFlags flags) nothrow
{
  bool _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  char* _resolvedName;
  _retval = cast(bool)vte_query_termprop(_name, &_resolvedName, cast(int*)&prop, &type, &flags);
  resolvedName = _resolvedName.fromCString!(No.Free);
  return _retval;
}

/**
    Like [vte.global.queryTermprop] except that it takes the termprop by ID.
    See that function for more information.
    
    For an alias termprop (see [vte.global.installTermpropAlias]), resolved_name
    will be name of the alias' target termprop; otherwise it will be name.

    Params:
      prop = a termprop ID
      name = a location to store the termprop's name
      type = a location to store the termprop's type as a #VtePropertyType
      flags = a location to store the termprop's flags as a #VtePropertyFlags
    Returns: true iff the termprop exists, and then name, type and
        flags will be filled in
*/
bool queryTermpropById(int prop, out string name, out vte.types.PropertyType type, out vte.types.PropertyFlags flags) nothrow
{
  bool _retval;
  char* _name;
  _retval = cast(bool)vte_query_termprop_by_id(prop, &_name, &type, &flags);
  name = _name.fromCString!(No.Free);
  return _retval;
}
