/// Module for [VideoInfo] class
module gstvideo.video_info;

import gid.gid;
import gobject.boxed;
import gst.caps;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_alignment;
import gstvideo.video_colorimetry;
import gstvideo.video_format_info;

/**
    Information describing image properties. This information can be filled
    in from GstCaps with [gstvideo.video_info.VideoInfo.fromCaps]. The information is also used
    to store the specific video info when mapping a video frame with
    [gstvideo.video_frame.VideoFrame.map].
    
    Use the provided macros to access the info in this structure.
*/
class VideoInfo : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_info_get_type != &gidSymbolNotFound ? gst_video_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoInfo self()
  {
    return this;
  }

  /**
      Get `finfo` field.
      Returns: the format info of the video
  */
  @property gstvideo.video_format_info.VideoFormatInfo finfo()
  {
    return new gstvideo.video_format_info.VideoFormatInfo(cast(GstVideoFormatInfo*)(cast(GstVideoInfo*)this._cPtr).finfo, No.Take);
  }

  /**
      Get `interlaceMode` field.
      Returns: the interlace mode
  */
  @property gstvideo.types.VideoInterlaceMode interlaceMode()
  {
    return cast(gstvideo.types.VideoInterlaceMode)(cast(GstVideoInfo*)this._cPtr).interlaceMode;
  }

  /**
      Set `interlaceMode` field.
      Params:
        propval = the interlace mode
  */
  @property void interlaceMode(gstvideo.types.VideoInterlaceMode propval)
  {
    (cast(GstVideoInfo*)this._cPtr).interlaceMode = cast(GstVideoInterlaceMode)propval;
  }

  /**
      Get `flags` field.
      Returns: additional video flags
  */
  @property gstvideo.types.VideoFlags flags()
  {
    return cast(gstvideo.types.VideoFlags)(cast(GstVideoInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = additional video flags
  */
  @property void flags(gstvideo.types.VideoFlags propval)
  {
    (cast(GstVideoInfo*)this._cPtr).flags = cast(GstVideoFlags)propval;
  }

  /**
      Get `width` field.
      Returns: the width of the video
  */
  @property int width()
  {
    return (cast(GstVideoInfo*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the width of the video
  */
  @property void width(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the height of the video
  */
  @property int height()
  {
    return (cast(GstVideoInfo*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the height of the video
  */
  @property void height(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).height = propval;
  }

  /**
      Get `size` field.
      Returns: the default size of one frame
  */
  @property size_t size()
  {
    return (cast(GstVideoInfo*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the default size of one frame
  */
  @property void size(size_t propval)
  {
    (cast(GstVideoInfo*)this._cPtr).size = propval;
  }

  /**
      Get `views` field.
      Returns: the number of views for multiview video
  */
  @property int views()
  {
    return (cast(GstVideoInfo*)this._cPtr).views;
  }

  /**
      Set `views` field.
      Params:
        propval = the number of views for multiview video
  */
  @property void views(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).views = propval;
  }

  /**
      Get `chromaSite` field.
      Returns: a #GstVideoChromaSite.
  */
  @property gstvideo.types.VideoChromaSite chromaSite()
  {
    return cast(gstvideo.types.VideoChromaSite)(cast(GstVideoInfo*)this._cPtr).chromaSite;
  }

  /**
      Set `chromaSite` field.
      Params:
        propval = a #GstVideoChromaSite.
  */
  @property void chromaSite(gstvideo.types.VideoChromaSite propval)
  {
    (cast(GstVideoInfo*)this._cPtr).chromaSite = cast(GstVideoChromaSite)propval;
  }

  /**
      Get `colorimetry` field.
      Returns: the colorimetry info
  */
  @property gstvideo.video_colorimetry.VideoColorimetry colorimetry()
  {
    return cToD!(gstvideo.video_colorimetry.VideoColorimetry)(cast(void*)&(cast(GstVideoInfo*)this._cPtr).colorimetry);
  }

  /**
      Set `colorimetry` field.
      Params:
        propval = the colorimetry info
  */
  @property void colorimetry(gstvideo.video_colorimetry.VideoColorimetry propval)
  {
    (cast(GstVideoInfo*)this._cPtr).colorimetry = cast(GstVideoColorimetry)propval;
  }

  /**
      Get `parN` field.
      Returns: the pixel-aspect-ratio numerator
  */
  @property int parN()
  {
    return (cast(GstVideoInfo*)this._cPtr).parN;
  }

  /**
      Set `parN` field.
      Params:
        propval = the pixel-aspect-ratio numerator
  */
  @property void parN(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).parN = propval;
  }

  /**
      Get `parD` field.
      Returns: the pixel-aspect-ratio denominator
  */
  @property int parD()
  {
    return (cast(GstVideoInfo*)this._cPtr).parD;
  }

  /**
      Set `parD` field.
      Params:
        propval = the pixel-aspect-ratio denominator
  */
  @property void parD(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).parD = propval;
  }

  /**
      Get `fpsN` field.
      Returns: the framerate numerator
  */
  @property int fpsN()
  {
    return (cast(GstVideoInfo*)this._cPtr).fpsN;
  }

  /**
      Set `fpsN` field.
      Params:
        propval = the framerate numerator
  */
  @property void fpsN(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).fpsN = propval;
  }

  /**
      Get `fpsD` field.
      Returns: the framerate denominator
  */
  @property int fpsD()
  {
    return (cast(GstVideoInfo*)this._cPtr).fpsD;
  }

  /**
      Set `fpsD` field.
      Params:
        propval = the framerate denominator
  */
  @property void fpsD(int propval)
  {
    (cast(GstVideoInfo*)this._cPtr).fpsD = propval;
  }

  /**
      Allocate a new #GstVideoInfo that is also initialized with
      [gstvideo.video_info.VideoInfo.init_].
      Returns: a new #GstVideoInfo. free with [gstvideo.video_info.VideoInfo.free].
  */
  this()
  {
    GstVideoInfo* _cretval;
    _cretval = gst_video_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parse caps to generate a #GstVideoInfo.
  
      Params:
        caps = a #GstCaps
      Returns: A #GstVideoInfo, or null if caps couldn't be parsed
  */
  static gstvideo.video_info.VideoInfo newFromCaps(gst.caps.Caps caps)
  {
    GstVideoInfo* _cretval;
    _cretval = gst_video_info_new_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstvideo.video_info.VideoInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adjust the offset and stride fields in info so that the padding and
      stride alignment in align is respected.
      
      Extra padding will be added to the right side when stride alignment padding
      is required and align will be updated with the new padding values.
  
      Params:
        align_ = alignment parameters
      Returns: false if alignment could not be applied, e.g. because the
          size of a frame can't be represented as a 32 bit integer (Since: 1.12)
  */
  bool align_(gstvideo.video_alignment.VideoAlignment align_)
  {
    bool _retval;
    _retval = cast(bool)gst_video_info_align(cast(GstVideoInfo*)this._cPtr, cast(GstVideoAlignment*)&align_);
    return _retval;
  }

  /**
      Extra padding will be added to the right side when stride alignment padding
      is required and align will be updated with the new padding values.
      
      This variant of [gstvideo.video_info.VideoInfo.align_] provides the updated size, in bytes,
      of each video plane after the alignment, including all horizontal and vertical
      paddings.
      
      In case of GST_VIDEO_INTERLACE_MODE_ALTERNATE info, the returned sizes are the
      ones used to hold a single field, not the full frame.
  
      Params:
        align_ = alignment parameters
        planeSize = array used to store the plane sizes
      Returns: false if alignment could not be applied, e.g. because the
          size of a frame can't be represented as a 32 bit integer
  */
  bool alignFull(gstvideo.video_alignment.VideoAlignment align_, out size_t planeSize)
  {
    bool _retval;
    _retval = cast(bool)gst_video_info_align_full(cast(GstVideoInfo*)this._cPtr, cast(GstVideoAlignment*)&align_, cast(size_t*)&planeSize);
    return _retval;
  }

  /**
      Converts among various #GstFormat types.  This function handles
      GST_FORMAT_BYTES, GST_FORMAT_TIME, and GST_FORMAT_DEFAULT.  For
      raw video, GST_FORMAT_DEFAULT corresponds to video frames.  This
      function can be used to handle pad queries of the type GST_QUERY_CONVERT.
  
      Params:
        srcFormat = #GstFormat of the src_value
        srcValue = value to convert
        destFormat = #GstFormat of the dest_value
        destValue = pointer to destination value
      Returns: TRUE if the conversion was successful.
  */
  bool convert(gst.types.Format srcFormat, long srcValue, gst.types.Format destFormat, out long destValue)
  {
    bool _retval;
    _retval = cast(bool)gst_video_info_convert(cast(const(GstVideoInfo)*)this._cPtr, srcFormat, srcValue, destFormat, cast(long*)&destValue);
    return _retval;
  }

  /**
      Copy a GstVideoInfo structure.
      Returns: a new #GstVideoInfo. free with gst_video_info_free.
  */
  gstvideo.video_info.VideoInfo copy()
  {
    GstVideoInfo* _cretval;
    _cretval = gst_video_info_copy(cast(const(GstVideoInfo)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_info.VideoInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two #GstVideoInfo and returns whether they are equal or not
  
      Params:
        other = a #GstVideoInfo
      Returns: true if info and other are equal, else false.
  */
  bool isEqual(gstvideo.video_info.VideoInfo other)
  {
    bool _retval;
    _retval = cast(bool)gst_video_info_is_equal(cast(const(GstVideoInfo)*)this._cPtr, other ? cast(const(GstVideoInfo)*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set the default info for a video frame of format and width and height.
      
      Note: This initializes info first, no values are preserved. This function
      does not set the offsets correctly for interlaced vertically
      subsampled formats.
  
      Params:
        format = the format
        width = a width
        height = a height
      Returns: false if the returned video info is invalid, e.g. because the
          size of a frame can't be represented as a 32 bit integer (Since: 1.12)
  */
  bool setFormat(gstvideo.types.VideoFormat format, uint width, uint height)
  {
    bool _retval;
    _retval = cast(bool)gst_video_info_set_format(cast(GstVideoInfo*)this._cPtr, format, width, height);
    return _retval;
  }

  /**
      Same as #gst_video_info_set_format but also allowing to set the interlaced
      mode.
  
      Params:
        format = the format
        mode = a #GstVideoInterlaceMode
        width = a width
        height = a height
      Returns: false if the returned video info is invalid, e.g. because the
          size of a frame can't be represented as a 32 bit integer.
  */
  bool setInterlacedFormat(gstvideo.types.VideoFormat format, gstvideo.types.VideoInterlaceMode mode, uint width, uint height)
  {
    bool _retval;
    _retval = cast(bool)gst_video_info_set_interlaced_format(cast(GstVideoInfo*)this._cPtr, format, mode, width, height);
    return _retval;
  }

  /**
      Convert the values of info into a #GstCaps.
      Returns: a new #GstCaps containing the info of info.
  */
  gst.caps.Caps toCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_video_info_to_caps(cast(const(GstVideoInfo)*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parse caps and update info.
  
      Params:
        info = #GstVideoInfo
        caps = a #GstCaps
      Returns: TRUE if caps could be parsed
  */
  static bool fromCaps(out gstvideo.video_info.VideoInfo info, gst.caps.Caps caps)
  {
    bool _retval;
    GstVideoInfo _info;
    _retval = cast(bool)gst_video_info_from_caps(&_info, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    info = new gstvideo.video_info.VideoInfo(cast(void*)&_info, No.Take);
    return _retval;
  }

  /**
      Initialize info with default values.
  
      Params:
        info = a #GstVideoInfo
  */
  static void init_(out gstvideo.video_info.VideoInfo info)
  {
    GstVideoInfo _info;
    gst_video_info_init(&_info);
    info = new gstvideo.video_info.VideoInfo(cast(void*)&_info, No.Take);
  }
}
