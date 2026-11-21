/// Module for [GLSLProfile] flags namespace
module gid.gstgl1.glslprofile;

import gid.core.gid;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLSLProfile] flags
struct GLSLProfile
{
  alias Enum = gid.gstgl1.types.GLSLProfile; ///

  /** */
  static gid.gstgl1.types.GLSLProfile fromString(string string_) nothrow
  {
    GstGLSLProfile _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_glsl_profile_from_string(_string_);
    gid.gstgl1.types.GLSLProfile _retval = cast(gid.gstgl1.types.GLSLProfile)_cretval;
    return _retval;
  }

  /** */
  static string toString_(gid.gstgl1.types.GLSLProfile profile) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_glsl_profile_to_string(profile);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
