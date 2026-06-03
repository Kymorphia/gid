/// Module for [GLTextureTarget] enum namespace
module gstgl.gltexture_target;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLTextureTarget] enum
struct GLTextureTarget
{
  alias Enum = gstgl.types.GLTextureTarget; ///

  /** */
  static gstgl.types.GLTextureTarget fromGl(uint target) nothrow
  {
    GstGLTextureTarget _cretval;
    _cretval = gst_gl_texture_target_from_gl(target);
    gstgl.types.GLTextureTarget _retval = cast(gstgl.types.GLTextureTarget)_cretval;
    return _retval;
  }

  /** */
  static gstgl.types.GLTextureTarget fromString(string str) nothrow
  {
    GstGLTextureTarget _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_gl_texture_target_from_string(_str);
    gstgl.types.GLTextureTarget _retval = cast(gstgl.types.GLTextureTarget)_cretval;
    return _retval;
  }

  /** */
  static string toBufferPoolOption(gstgl.types.GLTextureTarget target) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_texture_target_to_buffer_pool_option(target);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  static uint toGl(gstgl.types.GLTextureTarget target) nothrow
  {
    uint _retval;
    _retval = gst_gl_texture_target_to_gl(target);
    return _retval;
  }

  /** */
  static string toString_(gstgl.types.GLTextureTarget target) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_texture_target_to_string(target);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
