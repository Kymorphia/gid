/// Module for [VideoOverlayComposition] class
module gstvideo.video_overlay_composition;

import gid.gid;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_frame;
import gstvideo.video_overlay_rectangle;

/**
    Functions to create and handle overlay compositions on video buffers.
    
    An overlay composition describes one or more overlay rectangles to be
    blended on top of a video buffer.
    
    This API serves two main purposes:
    
    $(LIST
      * it can be used to attach overlay information (subtitles or logos)
        to non-raw video buffers such as GL/VAAPI/VDPAU surfaces. The actual
        blending of the overlay can then be done by e.g. the video sink that
        processes these non-raw buffers.
      
      * it can also be used to blend overlay rectangles on top of raw video
        buffers, thus consolidating blending functionality for raw video in
        one place.
    )
      
    Together, this allows existing overlay elements to easily handle raw
    and non-raw video as input in without major changes (once the overlays
    have been put into a #GstVideoOverlayComposition object anyway) - for raw
    video the overlay can just use the blending function to blend the data
    on top of the video, and for surface buffers it can just attach them to
    the buffer and let the sink render the overlays.
*/
class VideoOverlayComposition : gobject.boxed.Boxed
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
    return cast(void function())gst_video_overlay_composition_get_type != &gidSymbolNotFound ? gst_video_overlay_composition_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoOverlayComposition self()
  {
    return this;
  }

  /**
      Creates a new video overlay composition object to hold one or more
      overlay rectangles.
      
      Note that since 1.20 this allows to pass null for rectangle.
  
      Params:
        rectangle = a #GstVideoOverlayRectangle to add to the
              composition
      Returns: a new #GstVideoOverlayComposition. Unref with
            gst_video_overlay_composition_unref() when no longer needed.
  */
  this(gstvideo.video_overlay_rectangle.VideoOverlayRectangle rectangle = null)
  {
    GstVideoOverlayComposition* _cretval;
    _cretval = gst_video_overlay_composition_new(rectangle ? cast(GstVideoOverlayRectangle*)rectangle._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds an overlay rectangle to an existing overlay composition object. This
      must be done right after creating the overlay composition.
  
      Params:
        rectangle = a #GstVideoOverlayRectangle to add to the
              composition
  */
  void addRectangle(gstvideo.video_overlay_rectangle.VideoOverlayRectangle rectangle)
  {
    gst_video_overlay_composition_add_rectangle(cast(GstVideoOverlayComposition*)this._cPtr, rectangle ? cast(GstVideoOverlayRectangle*)rectangle._cPtr(No.Dup) : null);
  }

  /**
      Blends the overlay rectangles in comp on top of the raw video data
      contained in video_buf. The data in video_buf must be writable and
      mapped appropriately.
      
      Since video_buf data is read and will be modified, it ought be
      mapped with flag GST_MAP_READWRITE.
  
      Params:
        videoBuf = a #GstVideoFrame containing raw video data in a
                      supported format. It should be mapped using GST_MAP_READWRITE
      Returns: 
  */
  bool blend(gstvideo.video_frame.VideoFrame videoBuf)
  {
    bool _retval;
    _retval = cast(bool)gst_video_overlay_composition_blend(cast(GstVideoOverlayComposition*)this._cPtr, videoBuf ? cast(GstVideoFrame*)videoBuf._cPtr : null);
    return _retval;
  }

  /**
      Makes a copy of comp and all contained rectangles, so that it is possible
      to modify the composition and contained rectangles (e.g. add additional
      rectangles or change the render co-ordinates or render dimension). The
      actual overlay pixel data buffers contained in the rectangles are not
      copied.
      Returns: a new #GstVideoOverlayComposition equivalent
            to comp.
  */
  gstvideo.video_overlay_composition.VideoOverlayComposition copy()
  {
    GstVideoOverlayComposition* _cretval;
    _cretval = gst_video_overlay_composition_copy(cast(GstVideoOverlayComposition*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_overlay_composition.VideoOverlayComposition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the `n`-th #GstVideoOverlayRectangle contained in comp.
  
      Params:
        n = number of the rectangle to get
      Returns: the `n`-th rectangle, or NULL if `n` is out of
            bounds. Will not return a new reference, the caller will need to
            obtain her own reference using gst_video_overlay_rectangle_ref()
            if needed.
  */
  gstvideo.video_overlay_rectangle.VideoOverlayRectangle getRectangle(uint n)
  {
    GstVideoOverlayRectangle* _cretval;
    _cretval = gst_video_overlay_composition_get_rectangle(cast(GstVideoOverlayComposition*)this._cPtr, n);
    auto _retval = _cretval ? new gstvideo.video_overlay_rectangle.VideoOverlayRectangle(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the sequence number of this composition. Sequence numbers are
      monotonically increasing and unique for overlay compositions and rectangles
      (meaning there will never be a rectangle with the same sequence number as
      a composition).
      Returns: the sequence number of comp
  */
  uint getSeqnum()
  {
    uint _retval;
    _retval = gst_video_overlay_composition_get_seqnum(cast(GstVideoOverlayComposition*)this._cPtr);
    return _retval;
  }

  /**
      Takes ownership of comp and returns a version of comp that is writable
      (i.e. can be modified). Will either return comp right away, or create a
      new writable copy of comp and unref comp itself. All the contained
      rectangles will also be copied, but the actual overlay pixel data buffers
      contained in the rectangles are not copied.
      Returns: a writable #GstVideoOverlayComposition
            equivalent to comp.
  */
  gstvideo.video_overlay_composition.VideoOverlayComposition makeWritable()
  {
    GstVideoOverlayComposition* _cretval;
    _cretval = gst_video_overlay_composition_make_writable(cast(GstVideoOverlayComposition*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_overlay_composition.VideoOverlayComposition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the number of #GstVideoOverlayRectangle<!-- -->s contained in comp.
      Returns: the number of rectangles
  */
  uint nRectangles()
  {
    uint _retval;
    _retval = gst_video_overlay_composition_n_rectangles(cast(GstVideoOverlayComposition*)this._cPtr);
    return _retval;
  }
}
