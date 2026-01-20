/// Module for [VideoContentLightLevel] struct
module gstvideo.video_content_light_level;

import gid.gid;
import gst.caps;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Content light level information specified in CEA-861.3, Appendix A.
*/
struct VideoContentLightLevel
{
  /**
      the maximum content light level
        (abbreviated to MaxCLL) in candelas per square meter (cd/m^2 and nit)
  */
  ushort maxContentLightLevel;

  /**
      the maximum frame average light level
        (abbreviated to MaxFLL) in candelas per square meter (cd/m^2 and nit)
  */
  ushort maxFrameAverageLightLevel;

  /** */
  void*[4] GstReserved;

  /**
      Parse caps and update linfo
  
      Params:
        caps = a #GstCaps
      Returns: true if linfo was successfully set to caps
  */
  bool addToCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_video_content_light_level_add_to_caps(cast(const(GstVideoContentLightLevel)*)&this, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Parse caps and update linfo
  
      Params:
        caps = a #GstCaps
      Returns: if caps has #GstVideoContentLightLevel and could be parsed
  */
  bool fromCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_video_content_light_level_from_caps(cast(GstVideoContentLightLevel*)&this, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Parse the value of content-light-level caps field and update minfo
      with the parsed values.
  
      Params:
        level = a content-light-level string from caps
      Returns: true if linfo points to valid #GstVideoContentLightLevel.
  */
  bool fromString(string level)
  {
    bool _retval;
    const(char)* _level = level.toCString(No.Alloc);
    _retval = cast(bool)gst_video_content_light_level_from_string(cast(GstVideoContentLightLevel*)&this, _level);
    return _retval;
  }

  /**
      Initialize linfo
  */
  void init_()
  {
    gst_video_content_light_level_init(cast(GstVideoContentLightLevel*)&this);
  }

  /**
      Checks equality between linfo and other.
  
      Params:
        other = a #GstVideoContentLightLevel
      Returns: true if linfo and other are equal.
  */
  bool isEqual(gstvideo.video_content_light_level.VideoContentLightLevel other)
  {
    bool _retval;
    _retval = cast(bool)gst_video_content_light_level_is_equal(cast(const(GstVideoContentLightLevel)*)&this, cast(const(GstVideoContentLightLevel)*)&other);
    return _retval;
  }

  /**
      Convert linfo to its string representation.
      Returns: a string representation of linfo.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_video_content_light_level_to_string(cast(const(GstVideoContentLightLevel)*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
