/// Module for [GLTextureTarget] enum namespace
module gid.gstgl1.gltexture_target;

import gid.core.gid;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLTextureTarget] enum
struct GLTextureTarget
{
  alias Enum = gid.gstgl1.types.GLTextureTarget; ///

  /** */
  static gid.gstgl1.types.GLTextureTarget fromGl(uint target) nothrow
  {
    GstGLTextureTarget _cretval;
    _cretval = gst_gl_texture_target_from_gl(target);
    gid.gstgl1.types.GLTextureTarget _retval = cast(gid.gstgl1.types.GLTextureTarget)_cretval;
    return _retval;
  }

  /** */
  static gid.gstgl1.types.GLTextureTarget fromString(string str) nothrow
  {
    GstGLTextureTarget _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_gl_texture_target_from_string(_str);
    gid.gstgl1.types.GLTextureTarget _retval = cast(gid.gstgl1.types.GLTextureTarget)_cretval;
    return _retval;
  }

  /** */
  static string toBufferPoolOption(gid.gstgl1.types.GLTextureTarget target) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_texture_target_to_buffer_pool_option(target);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  static uint toGl(gid.gstgl1.types.GLTextureTarget target) nothrow
  {
    uint _retval;
    _retval = gst_gl_texture_target_to_gl(target);
    return _retval;
  }

  /** */
  static string toString_(gid.gstgl1.types.GLTextureTarget target) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_texture_target_to_string(target);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
