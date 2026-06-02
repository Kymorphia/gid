/// Module for [GLFormat] enum namespace
module gstgl.glformat;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;
import gstvideo.video_info;

/// Namespace for [GLFormat] enum
struct GLFormat
{
  alias Enum = gstgl.types.GLFormat; ///

  /** */
  static gstgl.types.GLFormat fromVideoInfo(gstgl.glcontext.GLContext context, gstvideo.video_info.VideoInfo vinfo, uint plane) nothrow
  {
    GstGLFormat _cretval;
    _cretval = gst_gl_format_from_video_info(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, vinfo ? cast(const(GstVideoInfo)*)vinfo._cPtr(No.Dup) : null, plane);
    gstgl.types.GLFormat _retval = cast(gstgl.types.GLFormat)_cretval;
    return _retval;
  }

  /** */
  static bool isSupported(gstgl.glcontext.GLContext context, gstgl.types.GLFormat format) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_format_is_supported(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, format);
    return _retval;
  }

  /** */
  static uint nComponents(gstgl.types.GLFormat glFormat) nothrow
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
  static void typeFromSizedGlFormat(gstgl.types.GLFormat format, out gstgl.types.GLFormat unsizedFormat, out uint glType) nothrow
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
