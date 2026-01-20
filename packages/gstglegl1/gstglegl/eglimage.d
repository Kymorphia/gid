/// Module for [EGLImage] class
module gstglegl.eglimage;

import gid.gid;
import gobject.boxed;
import gstgl.glcontext;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;
import gstvideo.video_info;

/**
    #GstEGLImage represents and holds an `EGLImage` handle.
    
    A #GstEGLImage can be created from a dmabuf with [gstglegl.eglimage.EGLImage.fromDmabuf],
    or [gstglegl.eglimage.EGLImage.fromDmabufDirect], or #GstGLMemoryEGL provides a
    #GstAllocator to allocate `EGLImage`'s bound to and OpenGL texture.
*/
class EGLImage : gobject.boxed.Boxed
{

  /**
      Create a `eglimage.EGLImage` boxed type.
  */
  this()
  {
    super(gMalloc(GstEGLImage.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_egl_image_get_type != &gidSymbolNotFound ? gst_egl_image_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EGLImage self()
  {
    return this;
  }

  /** */
  void* getImage()
  {
    auto _retval = gst_egl_image_get_image(cast(GstEGLImage*)this._cPtr);
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
  static gstglegl.eglimage.EGLImage fromDmabuf(gstgl.glcontext.GLContext context, int dmabuf, gstvideo.video_info.VideoInfo inInfo, int plane, size_t offset)
  {
    GstEGLImage* _cretval;
    _cretval = gst_egl_image_from_dmabuf(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, dmabuf, inInfo ? cast(const(GstVideoInfo)*)inInfo._cPtr(No.Dup) : null, plane, offset);
    auto _retval = _cretval ? new gstglegl.eglimage.EGLImage(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
