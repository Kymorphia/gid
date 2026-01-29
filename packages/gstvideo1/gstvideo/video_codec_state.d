/// Module for [VideoCodecState] class
module gstvideo.video_codec_state;

import gid.gid;
import gobject.boxed;
import gst.buffer;
import gst.caps;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_content_light_level;
import gstvideo.video_info;
import gstvideo.video_mastering_display_info;

/**
    Structure representing the state of an incoming or outgoing video
    stream for encoders and decoders.
    
    Decoders and encoders will receive such a state through their
    respective @set_format vmethods.
    
    Decoders and encoders can set the downstream state, by using the
    [gstvideo.video_decoder.VideoDecoder.setOutputState] or
    [gstvideo.video_encoder.VideoEncoder.setOutputState] methods.
*/
class VideoCodecState : gobject.boxed.Boxed
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
  this(gst.caps.Caps caps = gst.caps.Caps.init, gst.buffer.Buffer codecData = gst.buffer.Buffer.init, gst.caps.Caps allocationCaps = gst.caps.Caps.init)
  {
    super(gMalloc(GstVideoCodecState.sizeof), Yes.Take);
    this.caps = caps;
    this.codecData = codecData;
    this.allocationCaps = allocationCaps;
  }

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
    return cast(void function())gst_video_codec_state_get_type != &gidSymbolNotFound ? gst_video_codec_state_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoCodecState self()
  {
    return this;
  }

  /**
      Get `info` field.
      Returns: The #GstVideoInfo describing the stream
  */
  @property gstvideo.video_info.VideoInfo info()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)&(cast(GstVideoCodecState*)this._cPtr).info);
  }

  /**
      Get `caps` field.
      Returns: The #GstCaps used in the caps negotiation of the pad.
  */
  @property gst.caps.Caps caps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).caps);
  }

  /**
      Set `caps` field.
      Params:
        propval = The #GstCaps used in the caps negotiation of the pad.
  */
  @property void caps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).caps);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)this._cPtr).caps);
  }

  /**
      Get `codecData` field.
      Returns: a #GstBuffer corresponding to the
            'codec_data' field of a stream, or NULL.
  */
  @property gst.buffer.Buffer codecData()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).codecData);
  }

  /**
      Set `codecData` field.
      Params:
        propval = a #GstBuffer corresponding to the
              'codec_data' field of a stream, or NULL.
  */
  @property void codecData(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).codecData);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)this._cPtr).codecData);
  }

  /**
      Get `allocationCaps` field.
      Returns: The #GstCaps for allocation query and pool
            negotiation. Since: 1.10
  */
  @property gst.caps.Caps allocationCaps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).allocationCaps);
  }

  /**
      Set `allocationCaps` field.
      Params:
        propval = The #GstCaps for allocation query and pool
              negotiation. Since: 1.10
  */
  @property void allocationCaps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).allocationCaps);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)this._cPtr).allocationCaps);
  }

  /**
      Get `masteringDisplayInfo` field.
      Returns: Mastering display color volume information (HDR metadata) for the stream.
  */
  @property gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo masteringDisplayInfo()
  {
    return new gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo(cast(GstVideoMasteringDisplayInfo*)(cast(GstVideoCodecState*)this._cPtr).masteringDisplayInfo, No.Take);
  }

  /**
      Get `contentLightLevel` field.
      Returns: Content light level information for the stream.
  */
  @property gstvideo.video_content_light_level.VideoContentLightLevel contentLightLevel()
  {
    return cToD!(gstvideo.video_content_light_level.VideoContentLightLevel)(cast(void*)(cast(GstVideoCodecState*)this._cPtr).contentLightLevel);
  }
}
