/// Module for [VideoCaptionType] enum namespace
module gid.gstvideo1.video_caption_type;

import gid.core.gid;
import gid.gst1.caps;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/// Namespace for [VideoCaptionType] enum
struct VideoCaptionType
{
  alias Enum = gid.gstvideo1.types.VideoCaptionType; ///

  /**
      Parses fixed Closed Caption #GstCaps and returns the corresponding caption
      type, or [gid.gstvideo1.types.VideoCaptionType.Unknown].
  
      Params:
        caps = Fixed #GstCaps to parse
      Returns: #GstVideoCaptionType.
  */
  static gid.gstvideo1.types.VideoCaptionType fromCaps(gid.gst1.caps.Caps caps) nothrow
  {
    GstVideoCaptionType _cretval;
    _cretval = gst_video_caption_type_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    gid.gstvideo1.types.VideoCaptionType _retval = cast(gid.gstvideo1.types.VideoCaptionType)_cretval;
    return _retval;
  }

  /**
      Creates new caps corresponding to type.
  
      Params:
        type = #GstVideoCaptionType
      Returns: new #GstCaps
  */
  static gid.gst1.caps.Caps toCaps(gid.gstvideo1.types.VideoCaptionType type) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_video_caption_type_to_caps(type);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
