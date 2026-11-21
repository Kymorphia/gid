/// Module for [EGLImage] class
module gid.gstglegl1.eglimage;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gstgl1.glcontext;
import gid.gstglegl1.c.functions;
import gid.gstglegl1.c.types;
import gid.gstglegl1.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_info;

/**
    #GstEGLImage represents and holds an `EGLImage` handle.
    
    A #GstEGLImage can be created from a dmabuf with [gid.gstglegl1.eglimage.EGLImage.fromDmabuf],
    or [gid.gstglegl1.eglimage.EGLImage.fromDmabufDirect], or #GstGLMemoryEGL provides a
    #GstAllocator to allocate `EGLImage`'s bound to and OpenGL texture.
*/
class EGLImage : gid.gobject2.boxed.BoxedWrap!(gst_egl_image_get_type)
{
  /**
      Create a `eglimage.EGLImage` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GstEGLImage(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override EGLImage self() nothrow
  {
    return this;
  }

  /** */
  void* getImage() nothrow
  {
    auto _retval = gst_egl_image_get_image(cast(GstEGLImage*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the given context can emulate format using a limited subset of
      RGB texture formats. Such format is then suitable for importing using
      [gid.gstglegl1.eglimage.EGLImage.fromDmabuf] even when GL supports the video format as
      external-only or not at all.
  
      Params:
        context = a #GstGLContext (must be an EGL context)
        format = a #GstVideoFormat
      Returns: #TRUE if format can be emulated
  */
  static bool canEmulate(gid.gstgl1.glcontext.GLContext context, gid.gstvideo1.types.VideoFormat format) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_egl_image_can_emulate(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, format);
    return _retval;
  }

  /**
      Creates an EGL image that imports the dmabuf FD. The dmabuf data
      is passed as RGBA data. Shaders later take this "RGBA" data and
      convert it from its true format (described by in_info) to actual
      RGBA output. For example, with I420, three EGL images are created,
      one for each plane, each EGL image with a single-channel R format.
      With NV12, two EGL images are created, one with R format, one
      with RG format etc.
  
      Params:
        context = a #GstGLContext (must be an EGL context)
        dmabuf = the DMA-Buf file descriptor
        inInfo = the #GstVideoInfo in dmabuf
        plane = the plane in in_info to create and #GstEGLImage for
        offset = the byte-offset in the data
      Returns: a #GstEGLImage wrapping dmabuf or null on failure
  */
  static gid.gstglegl1.eglimage.EGLImage fromDmabuf(gid.gstgl1.glcontext.GLContext context, int dmabuf, gid.gstvideo1.video_info.VideoInfo inInfo, int plane, size_t offset) nothrow
  {
    GstEGLImage* _cretval;
    _cretval = gst_egl_image_from_dmabuf(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, dmabuf, inInfo ? cast(const(GstVideoInfo)*)inInfo._cPtr(No.Dup) : null, plane, offset);
    auto _retval = _cretval ? new gid.gstglegl1.eglimage.EGLImage(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
