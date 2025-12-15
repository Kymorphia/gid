/// Module for [VideoMasteringDisplayInfo] class
module gstvideo.video_mastering_display_info;

import gid.gid;
import gst.caps;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Mastering display color volume information defined by SMPTE ST 2086
    (a.k.a static HDR metadata).
*/
class VideoMasteringDisplayInfo
{
  GstVideoMasteringDisplayInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo");

    cInstance = *cast(GstVideoMasteringDisplayInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `whitePoint` field.
      Returns: the xy coordinates of white point in the CIE 1931 color space.
        each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  @property gstvideo.types.VideoMasteringDisplayInfoCoordinates whitePoint()
  {
    return cToD!(gstvideo.types.VideoMasteringDisplayInfoCoordinates)(cast(void*)&(cast(GstVideoMasteringDisplayInfo*)this._cPtr).whitePoint);
  }

  /**
      Set `whitePoint` field.
      Params:
        propval = the xy coordinates of white point in the CIE 1931 color space.
          each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  @property void whitePoint(gstvideo.types.VideoMasteringDisplayInfoCoordinates propval)
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).whitePoint = propval;
  }

  /**
      Get `maxDisplayMasteringLuminance` field.
      Returns: the maximum value of display luminance
        in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property uint maxDisplayMasteringLuminance()
  {
    return (cast(GstVideoMasteringDisplayInfo*)this._cPtr).maxDisplayMasteringLuminance;
  }

  /**
      Set `maxDisplayMasteringLuminance` field.
      Params:
        propval = the maximum value of display luminance
          in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property void maxDisplayMasteringLuminance(uint propval)
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).maxDisplayMasteringLuminance = propval;
  }

  /**
      Get `minDisplayMasteringLuminance` field.
      Returns: the minimum value of display luminance
        in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property uint minDisplayMasteringLuminance()
  {
    return (cast(GstVideoMasteringDisplayInfo*)this._cPtr).minDisplayMasteringLuminance;
  }

  /**
      Set `minDisplayMasteringLuminance` field.
      Params:
        propval = the minimum value of display luminance
          in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property void minDisplayMasteringLuminance(uint propval)
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).minDisplayMasteringLuminance = propval;
  }

  /**
      Set string representation of minfo to caps
  
      Params:
        caps = a #GstCaps
      Returns: true if minfo was successfully set to caps
  */
  bool addToCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_video_mastering_display_info_add_to_caps(cast(const(GstVideoMasteringDisplayInfo)*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Parse caps and update minfo
  
      Params:
        caps = a #GstCaps
      Returns: true if caps has #GstVideoMasteringDisplayInfo and could be parsed
  */
  bool fromCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_video_mastering_display_info_from_caps(cast(GstVideoMasteringDisplayInfo*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initialize minfo
  */
  void init_()
  {
    gst_video_mastering_display_info_init(cast(GstVideoMasteringDisplayInfo*)this._cPtr);
  }

  /**
      Checks equality between minfo and other.
  
      Params:
        other = a #GstVideoMasteringDisplayInfo
      Returns: true if minfo and other are equal.
  */
  bool isEqual(gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo other)
  {
    bool _retval;
    _retval = cast(bool)gst_video_mastering_display_info_is_equal(cast(const(GstVideoMasteringDisplayInfo)*)this._cPtr, other ? cast(const(GstVideoMasteringDisplayInfo)*)other._cPtr : null);
    return _retval;
  }

  /**
      Convert minfo to its string representation
      Returns: a string representation of minfo
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_video_mastering_display_info_to_string(cast(const(GstVideoMasteringDisplayInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Extract #GstVideoMasteringDisplayInfo from mastering
  
      Params:
        minfo = a #GstVideoMasteringDisplayInfo
        mastering = a #GstStructure representing #GstVideoMasteringDisplayInfo
      Returns: true if minfo was filled with mastering
  */
  static bool fromString(out gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo minfo, string mastering)
  {
    bool _retval;
    GstVideoMasteringDisplayInfo _minfo;
    const(char)* _mastering = mastering.toCString(No.Alloc);
    _retval = cast(bool)gst_video_mastering_display_info_from_string(&_minfo, _mastering);
    minfo = new gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo(cast(void*)&_minfo, No.Take);
    return _retval;
  }
}
