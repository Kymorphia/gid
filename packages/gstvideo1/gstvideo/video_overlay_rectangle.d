/// Module for [VideoOverlayRectangle] class
module gstvideo.video_overlay_rectangle;

import gid.gid;
import gobject.boxed;
import gst.buffer;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    An opaque video overlay rectangle object. A rectangle contains a single
    overlay rectangle which can be added to a composition.
*/
class VideoOverlayRectangle : gobject.boxed.Boxed
{

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
    return cast(void function())gst_video_overlay_rectangle_get_type != &gidSymbolNotFound ? gst_video_overlay_rectangle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoOverlayRectangle self()
  {
    return this;
  }

  /**
      Creates a new video overlay rectangle with ARGB or AYUV pixel data.
      The layout in case of ARGB of the components in memory is B-G-R-A
      on little-endian platforms
      (corresponding to #GST_VIDEO_FORMAT_BGRA) and A-R-G-B on big-endian
      platforms (corresponding to #GST_VIDEO_FORMAT_ARGB). In other words,
      pixels are treated as 32-bit words and the lowest 8 bits then contain
      the blue component value and the highest 8 bits contain the alpha
      component value. Unless specified in the flags, the RGB values are
      non-premultiplied. This is the format that is used by most hardware,
      and also many rendering libraries such as Cairo, for example.
      The pixel data buffer must have #GstVideoMeta set.
  
      Params:
        pixels = a #GstBuffer pointing to the pixel memory
        renderX = the X co-ordinate on the video where the top-left corner of this
              overlay rectangle should be rendered to
        renderY = the Y co-ordinate on the video where the top-left corner of this
              overlay rectangle should be rendered to
        renderWidth = the render width of this rectangle on the video
        renderHeight = the render height of this rectangle on the video
        flags = flags
      Returns: a new #GstVideoOverlayRectangle. Unref with
            gst_video_overlay_rectangle_unref() when no longer needed.
  */
  static gstvideo.video_overlay_rectangle.VideoOverlayRectangle newRaw(gst.buffer.Buffer pixels, int renderX, int renderY, uint renderWidth, uint renderHeight, gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstVideoOverlayRectangle* _cretval;
    _cretval = gst_video_overlay_rectangle_new_raw(pixels ? cast(GstBuffer*)pixels._cPtr(No.Dup) : null, renderX, renderY, renderWidth, renderHeight, flags);
    auto _retval = _cretval ? new gstvideo.video_overlay_rectangle.VideoOverlayRectangle(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Makes a copy of rectangle, so that it is possible to modify it
      (e.g. to change the render co-ordinates or render dimension). The
      actual overlay pixel data buffers contained in the rectangle are not
      copied.
      Returns: a new #GstVideoOverlayRectangle equivalent
            to rectangle.
  */
  gstvideo.video_overlay_rectangle.VideoOverlayRectangle copy()
  {
    GstVideoOverlayRectangle* _cretval;
    _cretval = gst_video_overlay_rectangle_copy(cast(GstVideoOverlayRectangle*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_overlay_rectangle.VideoOverlayRectangle(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the flags associated with a #GstVideoOverlayRectangle.
      This is useful if the caller can handle both premultiplied alpha and
      non premultiplied alpha, for example. By knowing whether the rectangle
      uses premultiplied or not, it can request the pixel data in the format
      it is stored in, to avoid unnecessary conversion.
      Returns: the #GstVideoOverlayFormatFlags associated with the rectangle.
  */
  gstvideo.types.VideoOverlayFormatFlags getFlags()
  {
    GstVideoOverlayFormatFlags _cretval;
    _cretval = gst_video_overlay_rectangle_get_flags(cast(GstVideoOverlayRectangle*)this._cPtr);
    gstvideo.types.VideoOverlayFormatFlags _retval = cast(gstvideo.types.VideoOverlayFormatFlags)_cretval;
    return _retval;
  }

  /**
      Retrieves the global-alpha value associated with a #GstVideoOverlayRectangle.
      Returns: the global-alpha value associated with the rectangle.
  */
  float getGlobalAlpha()
  {
    float _retval;
    _retval = gst_video_overlay_rectangle_get_global_alpha(cast(GstVideoOverlayRectangle*)this._cPtr);
    return _retval;
  }

  /** */
  gst.buffer.Buffer getPixelsArgb(gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstBuffer* _cretval;
    _cretval = gst_video_overlay_rectangle_get_pixels_argb(cast(GstVideoOverlayRectangle*)this._cPtr, flags);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.buffer.Buffer getPixelsAyuv(gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstBuffer* _cretval;
    _cretval = gst_video_overlay_rectangle_get_pixels_ayuv(cast(GstVideoOverlayRectangle*)this._cPtr, flags);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.buffer.Buffer getPixelsRaw(gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstBuffer* _cretval;
    _cretval = gst_video_overlay_rectangle_get_pixels_raw(cast(GstVideoOverlayRectangle*)this._cPtr, flags);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the pixel data as it is. This is useful if the caller can
      do the scaling itself when handling the overlaying. The rectangle will
      need to be scaled to the render dimensions, which can be retrieved using
      [gstvideo.video_overlay_rectangle.VideoOverlayRectangle.getRenderRectangle].
  
      Params:
        flags = flags.
             If a global_alpha value != 1 is set for the rectangle, the caller
             should set the #GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA flag
             if he wants to apply global-alpha himself. If the flag is not set
             global_alpha is applied internally before returning the pixel-data.
      Returns: a #GstBuffer holding the ARGB pixel data with
           #GstVideoMeta set. This function does not return a reference, the caller
           should obtain a reference of her own with gst_buffer_ref() if needed.
  */
  gst.buffer.Buffer getPixelsUnscaledArgb(gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstBuffer* _cretval;
    _cretval = gst_video_overlay_rectangle_get_pixels_unscaled_argb(cast(GstVideoOverlayRectangle*)this._cPtr, flags);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the pixel data as it is. This is useful if the caller can
      do the scaling itself when handling the overlaying. The rectangle will
      need to be scaled to the render dimensions, which can be retrieved using
      [gstvideo.video_overlay_rectangle.VideoOverlayRectangle.getRenderRectangle].
  
      Params:
        flags = flags.
             If a global_alpha value != 1 is set for the rectangle, the caller
             should set the #GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA flag
             if he wants to apply global-alpha himself. If the flag is not set
             global_alpha is applied internally before returning the pixel-data.
      Returns: a #GstBuffer holding the AYUV pixel data with
           #GstVideoMeta set. This function does not return a reference, the caller
           should obtain a reference of her own with gst_buffer_ref() if needed.
  */
  gst.buffer.Buffer getPixelsUnscaledAyuv(gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstBuffer* _cretval;
    _cretval = gst_video_overlay_rectangle_get_pixels_unscaled_ayuv(cast(GstVideoOverlayRectangle*)this._cPtr, flags);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the pixel data as it is. This is useful if the caller can
      do the scaling itself when handling the overlaying. The rectangle will
      need to be scaled to the render dimensions, which can be retrieved using
      [gstvideo.video_overlay_rectangle.VideoOverlayRectangle.getRenderRectangle].
  
      Params:
        flags = flags.
             If a global_alpha value != 1 is set for the rectangle, the caller
             should set the #GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA flag
             if he wants to apply global-alpha himself. If the flag is not set
             global_alpha is applied internally before returning the pixel-data.
      Returns: a #GstBuffer holding the pixel data with
           #GstVideoMeta set. This function does not return a reference, the caller
           should obtain a reference of her own with gst_buffer_ref() if needed.
  */
  gst.buffer.Buffer getPixelsUnscaledRaw(gstvideo.types.VideoOverlayFormatFlags flags)
  {
    GstBuffer* _cretval;
    _cretval = gst_video_overlay_rectangle_get_pixels_unscaled_raw(cast(GstVideoOverlayRectangle*)this._cPtr, flags);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the render position and render dimension of the overlay
      rectangle on the video.
  
      Params:
        renderX = address where to store the X render offset
        renderY = address where to store the Y render offset
        renderWidth = address where to store the render width
        renderHeight = address where to store the render height
      Returns: TRUE if valid render dimensions were retrieved.
  */
  bool getRenderRectangle(out int renderX, out int renderY, out uint renderWidth, out uint renderHeight)
  {
    bool _retval;
    _retval = cast(bool)gst_video_overlay_rectangle_get_render_rectangle(cast(GstVideoOverlayRectangle*)this._cPtr, cast(int*)&renderX, cast(int*)&renderY, cast(uint*)&renderWidth, cast(uint*)&renderHeight);
    return _retval;
  }

  /**
      Returns the sequence number of this rectangle. Sequence numbers are
      monotonically increasing and unique for overlay compositions and rectangles
      (meaning there will never be a rectangle with the same sequence number as
      a composition).
      
      Using the sequence number of a rectangle as an indicator for changed
      pixel-data of a rectangle is dangereous. Some API calls, like e.g.
      [gstvideo.video_overlay_rectangle.VideoOverlayRectangle.setGlobalAlpha], automatically update
      the per rectangle sequence number, which is misleading for renderers/
      consumers, that handle global-alpha themselves. For them  the
      pixel-data returned by gst_video_overlay_rectangle_get_pixels_*()
      won't be different for different global-alpha values. In this case a
      renderer could also use the GstBuffer pointers as a hint for changed
      pixel-data.
      Returns: the sequence number of rectangle
  */
  uint getSeqnum()
  {
    uint _retval;
    _retval = gst_video_overlay_rectangle_get_seqnum(cast(GstVideoOverlayRectangle*)this._cPtr);
    return _retval;
  }

  /**
      Sets the global alpha value associated with a #GstVideoOverlayRectangle. Per-
      pixel alpha values are multiplied with this value. Valid
      values: 0 <= global_alpha <= 1; 1 to deactivate.
      
      rectangle must be writable, meaning its refcount must be 1. You can
      make the rectangles inside a #GstVideoOverlayComposition writable using
      [gstvideo.video_overlay_composition.VideoOverlayComposition.makeWritable] or
      [gstvideo.video_overlay_composition.VideoOverlayComposition.copy].
  
      Params:
        globalAlpha = Global alpha value (0 to 1.0)
  */
  void setGlobalAlpha(float globalAlpha)
  {
    gst_video_overlay_rectangle_set_global_alpha(cast(GstVideoOverlayRectangle*)this._cPtr, globalAlpha);
  }

  /**
      Sets the render position and dimensions of the rectangle on the video.
      This function is mainly for elements that modify the size of the video
      in some way (e.g. through scaling or cropping) and need to adjust the
      details of any overlays to match the operation that changed the size.
      
      rectangle must be writable, meaning its refcount must be 1. You can
      make the rectangles inside a #GstVideoOverlayComposition writable using
      [gstvideo.video_overlay_composition.VideoOverlayComposition.makeWritable] or
      [gstvideo.video_overlay_composition.VideoOverlayComposition.copy].
  
      Params:
        renderX = render X position of rectangle on video
        renderY = render Y position of rectangle on video
        renderWidth = render width of rectangle
        renderHeight = render height of rectangle
  */
  void setRenderRectangle(int renderX, int renderY, uint renderWidth, uint renderHeight)
  {
    gst_video_overlay_rectangle_set_render_rectangle(cast(GstVideoOverlayRectangle*)this._cPtr, renderX, renderY, renderWidth, renderHeight);
  }
}
