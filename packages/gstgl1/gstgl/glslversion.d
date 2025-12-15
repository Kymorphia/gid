/// Module for [GLSLVersion] enum namespace
module gstgl.glslversion;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLSLVersion] enum
struct GLSLVersion
{
  alias Enum = gstgl.types.GLSLVersion; ///

  /** */
  static gstgl.types.GLSLVersion fromString(string string_)
  {
    GstGLSLVersion _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gst_glsl_version_from_string(_string_);
    gstgl.types.GLSLVersion _retval = cast(gstgl.types.GLSLVersion)_cretval;
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
  static bool profileFromString(string string_, out gstgl.types.GLSLVersion versionRet, out gstgl.types.GLSLProfile profileRet)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _retval = cast(bool)gst_glsl_version_profile_from_string(_string_, &versionRet, &profileRet);
    return _retval;
  }

  /** */
  static string profileToString(gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    char* _cretval;
    _cretval = gst_glsl_version_profile_to_string(version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  static string toString_(gstgl.types.GLSLVersion version_)
  {
    const(char)* _cretval;
    _cretval = gst_glsl_version_to_string(version_);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
