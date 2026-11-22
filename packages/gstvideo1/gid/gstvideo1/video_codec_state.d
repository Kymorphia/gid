/// Module for [VideoCodecState] class
module gid.gstvideo1.video_codec_state;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_content_light_level;
import gid.gstvideo1.video_info;
import gid.gstvideo1.video_mastering_display_info;

/**
    Structure representing the state of an incoming or outgoing video
    stream for encoders and decoders.
    
    Decoders and encoders will receive such a state through their
    respective @set_format vmethods.
    
    Decoders and encoders can set the downstream state, by using the
    [gid.gstvideo1.video_decoder.VideoDecoder.setOutputState] or
    [gid.gstvideo1.video_encoder.VideoEncoder.setOutputState] methods.
*/
class VideoCodecState : gid.gobject2.boxed.BoxedWrap!(gst_video_codec_state_get_type)
{
  /**
      Create a `video_codec_state.VideoCodecState` boxed type.
      Params:
        caps = The #GstCaps used in the caps negotiation of the pad.
        codecData = a #GstBuffer corresponding to the
              'codec_data' field of a stream, or NULL.
        allocationCaps = The #GstCaps for allocation query and pool
              negotiation. Since: 1.10
  */
  this(gid.gst1.caps.Caps caps = gid.gst1.caps.Caps.init, gid.gst1.buffer.Buffer codecData = gid.gst1.buffer.Buffer.init, gid.gst1.caps.Caps allocationCaps = gid.gst1.caps.Caps.init) nothrow
  {
    super(boxedNew!GstVideoCodecState(_getGType), Yes.Take);
    this.caps = caps;
    this.codecData = codecData;
    this.allocationCaps = allocationCaps;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoCodecState self() nothrow
  {
    return this;
  }

  /**
      Get `info` field.
      Returns: The #GstVideoInfo describing the stream
  */
  @property gid.gstvideo1.video_info.VideoInfo info() nothrow
  {
    return cToD!(gid.gstvideo1.video_info.VideoInfo)(cast(void*)&(cast(GstVideoCodecState*)this._cPtr).info);
  }

  /**
      Get `caps` field.
      Returns: The #GstCaps used in the caps negotiation of the pad.
  */
  @property gid.gst1.caps.Caps caps() nothrow
  {
    return cToD!(gid.gst1.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).caps);
  }

  /**
      Set `caps` field.
      Params:
        propval = The #GstCaps used in the caps negotiation of the pad.
  */
  @property void caps(gid.gst1.caps.Caps propval) nothrow
  {
    cValueFree!(gid.gst1.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).caps);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)this._cPtr).caps);
  }

  /**
      Get `codecData` field.
      Returns: a #GstBuffer corresponding to the
            'codec_data' field of a stream, or NULL.
  */
  @property gid.gst1.buffer.Buffer codecData() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).codecData);
  }

  /**
      Set `codecData` field.
      Params:
        propval = a #GstBuffer corresponding to the
              'codec_data' field of a stream, or NULL.
  */
  @property void codecData(gid.gst1.buffer.Buffer propval) nothrow
  {
    cValueFree!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).codecData);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)this._cPtr).codecData);
  }

  /**
      Get `allocationCaps` field.
      Returns: The #GstCaps for allocation query and pool
            negotiation. Since: 1.10
  */
  @property gid.gst1.caps.Caps allocationCaps() nothrow
  {
    return cToD!(gid.gst1.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).allocationCaps);
  }

  /**
      Set `allocationCaps` field.
      Params:
        propval = The #GstCaps for allocation query and pool
              negotiation. Since: 1.10
  */
  @property void allocationCaps(gid.gst1.caps.Caps propval) nothrow
  {
    cValueFree!(gid.gst1.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).allocationCaps);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)this._cPtr).allocationCaps);
  }

  /**
      Get `masteringDisplayInfo` field.
      Returns: Mastering display color volume information (HDR metadata) for the stream.
  */
  @property gid.gstvideo1.video_mastering_display_info.VideoMasteringDisplayInfo masteringDisplayInfo() nothrow
  {
    return new gid.gstvideo1.video_mastering_display_info.VideoMasteringDisplayInfo(cast(GstVideoMasteringDisplayInfo*)(cast(GstVideoCodecState*)this._cPtr).masteringDisplayInfo, No.Take);
  }

  /**
      Get `contentLightLevel` field.
      Returns: Content light level information for the stream.
  */
  @property gid.gstvideo1.video_content_light_level.VideoContentLightLevel contentLightLevel() nothrow
  {
    return cToD!(gid.gstvideo1.video_content_light_level.VideoContentLightLevel)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).contentLightLevel);
  }
}
