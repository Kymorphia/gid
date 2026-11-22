/// Module for [GLFormat] enum namespace
module gid.gstgl1.glformat;

import gid.core.utils;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;
import gid.gstvideo1.video_info;

/// Namespace for [GLFormat] enum
struct GLFormat
{
  alias Enum = gid.gstgl1.types.GLFormat; ///

  /** */
  static gid.gstgl1.types.GLFormat fromVideoInfo(gid.gstgl1.glcontext.GLContext context, gid.gstvideo1.video_info.VideoInfo vinfo, uint plane) nothrow
  {
    GstGLFormat _cretval;
    _cretval = gst_gl_format_from_video_info(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, vinfo ? cast(const(GstVideoInfo)*)vinfo._cPtr(No.Dup) : null, plane);
    gid.gstgl1.types.GLFormat _retval = cast(gid.gstgl1.types.GLFormat)_cretval;
    return _retval;
  }

  /** */
  static bool isSupported(gid.gstgl1.glcontext.GLContext context, gid.gstgl1.types.GLFormat format) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_format_is_supported(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, format);
    return _retval;
  }

  /** */
  static uint nComponents(gid.gstgl1.types.GLFormat glFormat) nothrow
  {
    uint _retval;
    _retval = gst_gl_format_n_components(glFormat);
    return _retval;
  }

  /**
      Get the unsized format and type from format for usage in glReadPixels,
      glTex{Sub}Image*, glTexImage* and similar functions.
  
      Params:
        format = the sized internal #GstGLFormat
        unsizedFormat = location for the resulting unsized #GstGLFormat
        glType = location for the resulting GL type
  */
  static void typeFromSizedGlFormat(gid.gstgl1.types.GLFormat format, out gid.gstgl1.types.GLFormat unsizedFormat, out uint glType) nothrow
  {
    gst_gl_format_type_from_sized_gl_format(format, &unsizedFormat, cast(uint*)&glType);
  }

  /** */
  static uint typeNBytes(uint format, uint type) nothrow
  {
    uint _retval;
    _retval = gst_gl_format_type_n_bytes(format, type);
    return _retval;
  }
}
