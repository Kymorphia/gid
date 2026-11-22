/// Module for [GLSLVersion] enum namespace
module gid.gstgl1.glslversion;

import gid.core.utils;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLSLVersion] enum
struct GLSLVersion
{
  alias Enum = gid.gstgl1.types.GLSLVersion; ///

  /** */
  static gid.gstgl1.types.GLSLVersion fromString(string string_) nothrow
  {
    GstGLSLVersion _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_glsl_version_from_string(_string_);
    gid.gstgl1.types.GLSLVersion _retval = cast(gid.gstgl1.types.GLSLVersion)_cretval;
    return _retval;
  }

  /**
      Note: this function expects either a `#version` GLSL preprocesser directive
      or a valid GLSL version and/or profile.
  
      Params:
        string_ = a valid GLSL `#version` string
        versionRet = resulting #GstGLSLVersion
        profileRet = resulting #GstGLSLVersion
      Returns: TRUE if a valid `#version` string was found, FALSE otherwise
  */
  static bool profileFromString(string string_, out gid.gstgl1.types.GLSLVersion versionRet, out gid.gstgl1.types.GLSLProfile profileRet) nothrow
  {
    bool _retval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_glsl_version_profile_from_string(_string_, &versionRet, &profileRet);
    return _retval;
  }

  /** */
  static string profileToString(gid.gstgl1.types.GLSLVersion version_, gid.gstgl1.types.GLSLProfile profile) nothrow
  {
    char* _cretval;
    _cretval = gst_glsl_version_profile_to_string(version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  static string toString_(gid.gstgl1.types.GLSLVersion version_) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_glsl_version_to_string(version_);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
