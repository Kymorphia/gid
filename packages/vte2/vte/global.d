/// Global functions for vte2 library
module vte.global;

import gid.gid;
import gobject.types;
import vte.c.functions;
import vte.c.types;
import vte.types;


/** */
gobject.types.GType eventContextGetType()
{
  gobject.types.GType _retval;
  _retval = vte_event_context_get_type();
  return _retval;
}

/**
    Queries whether the legacy encoding encoding is supported.
    
    If ICU support is not available, this function always returns false.
    
    Note that UTF-8 is always supported; you can select it by
    passing null to [vte.terminal.Terminal.setEncoding].

    Params:
      encoding = the name of the legacy encoding
    Returns: true iff the legacy encoding encoding is supported
*/
bool getEncodingSupported(string encoding)
{
  bool _retval;
  const(char)* _encoding = encoding.toCString(No.Alloc);
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
string[] getEncodings(bool includeAliases)
{
  char** _cretval;
  _cretval = vte_get_encodings(includeAliases);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Gets features VTE was compiled with.
    Returns: flags from #VteFeatureFlags
*/
vte.types.FeatureFlags getFeatureFlags()
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
string getFeatures()
{
  const(char)* _cretval;
  _cretval = vte_get_features();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns the major version of the VTE library at runtime.
    Contrast this with `VTE_MAJOR_VERSION` which represents
    the version of the VTE library that the code was compiled
    with.
    Returns: the major version
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = vte_get_major_version();
  return _retval;
}

/**
    Returns the micro version of the VTE library at runtime.
    Contrast this with `VTE_MICRO_VERSION` which represents
    the version of the VTE library that the code was compiled
    with.
    Returns: the micro version
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = vte_get_micro_version();
  return _retval;
}

/**
    Returns the minor version of the VTE library at runtime.
    Contrast this with `VTE_MINOR_VERSION` which represents
    the version of the VTE library that the code was compiled
    with.
    Returns: the minor version
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = vte_get_minor_version();
  return _retval;
}

/**
    Gets the user's shell, or null. In the latter case, the
    system default (usually "/bin/sh") should be used.
    Returns: a newly allocated string with the
        user's shell, or null
*/
string getUserShell()
{
  char* _cretval;
  _cretval = vte_get_user_shell();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
