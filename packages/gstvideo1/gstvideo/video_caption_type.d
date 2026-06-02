/// Module for [VideoCaptionType] enum namespace
module gstvideo.video_caption_type;

import gid.gid;
import gst.caps;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoCaptionType] enum
struct VideoCaptionType
{
  alias Enum = gstvideo.types.VideoCaptionType; ///

  /**
      Parses fixed Closed Caption #GstCaps and returns the corresponding caption
      type, or [gstvideo.types.VideoCaptionType.Unknown].
  
      Params:
        caps = Fixed #GstCaps to parse
      Returns: #GstVideoCaptionType.
  */
  static gstvideo.types.VideoCaptionType fromCaps(gst.caps.Caps caps) nothrow
  {
    GstVideoCaptionType _cretval;
    _cretval = gst_video_caption_type_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    gstvideo.types.VideoCaptionType _retval = cast(gstvideo.types.VideoCaptionType)_cretval;
    return _retval;
  }

  /**
      Creates new caps corresponding to type.
  
      Params:
        type = #GstVideoCaptionType
      Returns: new #GstCaps
  */
  static gst.caps.Caps toCaps(gstvideo.types.VideoCaptionType type) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_video_caption_type_to_caps(type);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
