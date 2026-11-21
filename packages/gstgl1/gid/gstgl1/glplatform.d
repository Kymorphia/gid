/// Module for [GLPlatform] flags namespace
module gid.gstgl1.glplatform;

import gid.core.gid;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLPlatform] flags
struct GLPlatform
{
  alias Enum = gid.gstgl1.types.GLPlatform; ///

  /** */
  static gid.gstgl1.types.GLPlatform fromString(string platformS) nothrow
  {
    GstGLPlatform _cretval;
    const(char)* _platformS = platformS.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_gl_platform_from_string(_platformS);
    gid.gstgl1.types.GLPlatform _retval = cast(gid.gstgl1.types.GLPlatform)_cretval;
    return _retval;
  }

  /** */
  static string toString_(gid.gstgl1.types.GLPlatform platform) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_platform_to_string(platform);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
