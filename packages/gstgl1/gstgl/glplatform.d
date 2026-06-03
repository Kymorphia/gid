/// Module for [GLPlatform] flags namespace
module gstgl.glplatform;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLPlatform] flags
struct GLPlatform
{
  alias Enum = gstgl.types.GLPlatform; ///

  /** */
  static gstgl.types.GLPlatform fromString(string platformS) nothrow
  {
    GstGLPlatform _cretval;
    const(char)* _platformS = platformS.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_gl_platform_from_string(_platformS);
    gstgl.types.GLPlatform _retval = cast(gstgl.types.GLPlatform)_cretval;
    return _retval;
  }

  /** */
  static string toString_(gstgl.types.GLPlatform platform) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_platform_to_string(platform);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
