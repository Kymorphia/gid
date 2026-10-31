/// Module for [VideoMasteringDisplayInfo] class
module gstvideo.video_mastering_display_info;

public import gid.basictypes;
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
  GstVideoMasteringDisplayInfo _cInstance;

  /**
      Create a `video_mastering_display_info.VideoMasteringDisplayInfo` wrap type.
      Params:
        displayPrimaries = the xy coordinates of primaries in the CIE 1931 color space.
            the index 0 contains red, 1 is for green and 2 is for blue.
            each value is normalized to 50000 (meaning that in unit of 0.00002)
        whitePoint = the xy coordinates of white point in the CIE 1931 color space.
            each value is normalized to 50000 (meaning that in unit of 0.00002)
        maxDisplayMasteringLuminance = the maximum value of display luminance
            in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
        minDisplayMasteringLuminance = the minimum value of display luminance
            in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  this(gstvideo.types.VideoMasteringDisplayInfoCoordinates[3] displayPrimaries = (gstvideo.types.VideoMasteringDisplayInfoCoordinates[3]).init, gstvideo.types.VideoMasteringDisplayInfoCoordinates whitePoint = gstvideo.types.VideoMasteringDisplayInfoCoordinates.init, uint maxDisplayMasteringLuminance = uint.init, uint minDisplayMasteringLuminance = uint.init) nothrow
  {
    this.displayPrimaries = displayPrimaries;
    this.whitePoint = whitePoint;
    this.maxDisplayMasteringLuminance = maxDisplayMasteringLuminance;
    this.minDisplayMasteringLuminance = minDisplayMasteringLuminance;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoMasteringDisplayInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `displayPrimaries` field.
      Returns: the xy coordinates of primaries in the CIE 1931 color space.
          the index 0 contains red, 1 is for green and 2 is for blue.
          each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  @property gstvideo.types.VideoMasteringDisplayInfoCoordinates[3] displayPrimaries() nothrow
  {
    return *cast(gstvideo.types.VideoMasteringDisplayInfoCoordinates[3]*)&(cast(GstVideoMasteringDisplayInfo*)this._cPtr).displayPrimaries;
  }

  /**
      Set `displayPrimaries` field.
      Params:
        propval = the xy coordinates of primaries in the CIE 1931 color space.
            the index 0 contains red, 1 is for green and 2 is for blue.
            each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  @property void displayPrimaries(gstvideo.types.VideoMasteringDisplayInfoCoordinates[3] propval) nothrow
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).displayPrimaries = *cast(GstVideoMasteringDisplayInfoCoordinates[3]*)&propval;
  }

  /**
      Get `whitePoint` field.
      Returns: the xy coordinates of white point in the CIE 1931 color space.
          each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  @property gstvideo.types.VideoMasteringDisplayInfoCoordinates whitePoint() nothrow
  {
    return cToD!(gstvideo.types.VideoMasteringDisplayInfoCoordinates)(cast(void*)&(cast(GstVideoMasteringDisplayInfo*)this._cPtr).whitePoint);
  }

  /**
      Set `whitePoint` field.
      Params:
        propval = the xy coordinates of white point in the CIE 1931 color space.
            each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  @property void whitePoint(gstvideo.types.VideoMasteringDisplayInfoCoordinates propval) nothrow
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).whitePoint = cast(GstVideoMasteringDisplayInfoCoordinates)propval;
  }

  /**
      Get `maxDisplayMasteringLuminance` field.
      Returns: the maximum value of display luminance
          in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property uint maxDisplayMasteringLuminance() nothrow
  {
    return (cast(GstVideoMasteringDisplayInfo*)this._cPtr).maxDisplayMasteringLuminance;
  }

  /**
      Set `maxDisplayMasteringLuminance` field.
      Params:
        propval = the maximum value of display luminance
            in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property void maxDisplayMasteringLuminance(uint propval) nothrow
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).maxDisplayMasteringLuminance = propval;
  }

  /**
      Get `minDisplayMasteringLuminance` field.
      Returns: the minimum value of display luminance
          in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property uint minDisplayMasteringLuminance() nothrow
  {
    return (cast(GstVideoMasteringDisplayInfo*)this._cPtr).minDisplayMasteringLuminance;
  }

  /**
      Set `minDisplayMasteringLuminance` field.
      Params:
        propval = the minimum value of display luminance
            in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  @property void minDisplayMasteringLuminance(uint propval) nothrow
  {
    (cast(GstVideoMasteringDisplayInfo*)this._cPtr).minDisplayMasteringLuminance = propval;
  }

  /**
      Set string representation of minfo to caps
  
      Params:
        caps = a #GstCaps
      Returns: true if minfo was successfully set to caps
  */
  bool addToCaps(gst.caps.Caps caps) nothrow
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
  bool fromCaps(gst.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_mastering_display_info_from_caps(cast(GstVideoMasteringDisplayInfo*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initialize minfo
  */
  void init_() nothrow
  {
    gst_video_mastering_display_info_init(cast(GstVideoMasteringDisplayInfo*)this._cPtr);
  }

  /**
      Checks equality between minfo and other.
  
      Params:
        other = a #GstVideoMasteringDisplayInfo
      Returns: true if minfo and other are equal.
  */
  bool isEqual(gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_mastering_display_info_is_equal(cast(const(GstVideoMasteringDisplayInfo)*)this._cPtr, other ? cast(const(GstVideoMasteringDisplayInfo)*)other._cPtr : null);
    return _retval;
  }

  /**
      Convert minfo to its string representation
      Returns: a string representation of minfo
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gst_video_mastering_display_info_to_string(cast(const(GstVideoMasteringDisplayInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Extract #GstVideoMasteringDisplayInfo from mastering
  
      Params:
        minfo = a #GstVideoMasteringDisplayInfo
        mastering = a #GstStructure representing #GstVideoMasteringDisplayInfo
      Returns: true if minfo was filled with mastering
  */
  static bool fromString(out gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo minfo, string mastering) nothrow
  {
    bool _retval;
    GstVideoMasteringDisplayInfo _minfo;
    const(char)* _mastering = mastering.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_video_mastering_display_info_from_string(&_minfo, _mastering);
    minfo = new gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo(cast(void*)&_minfo, No.Take);
    return _retval;
  }
}
