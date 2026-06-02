/// Module for [GLSLProfile] flags namespace
module gstgl.glslprofile;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLSLProfile] flags
struct GLSLProfile
{
  alias Enum = gstgl.types.GLSLProfile; ///

  /** */
  static gstgl.types.GLSLProfile fromString(string string_) nothrow
  {
    GstGLSLProfile _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gst_glsl_profile_from_string(_string_);
    gstgl.types.GLSLProfile _retval = cast(gstgl.types.GLSLProfile)_cretval;
    return _retval;
  }

  /** */
  static string toString_(gstgl.types.GLSLProfile profile) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_glsl_profile_to_string(profile);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
