module gstrtp.rtpbase_audio_payload;

import gid.gid;
import gobject.object;
import gst.types;
import gstbase.adapter;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtpbase_payload;
import gstrtp.types;

/**
    Provides a base class for audio RTP payloaders for frame or sample based
  audio codecs (constant bitrate)
  
  This class derives from GstRTPBasePayload. It can be used for payloading
  audio codecs. It will only work with constant bitrate codecs. It supports
  both frame based and sample based codecs. It takes care of packing up the
  audio data into RTP packets and filling up the headers accordingly. The
  payloading is done based on the maximum MTU (mtu) and the maximum time per
  packet (max-ptime). The general idea is to divide large data buffers into
  smaller RTP packets. The RTP packet size is the minimum of either the MTU,
  max-ptime (if set) or available data. The RTP packet size is always larger or
  equal to min-ptime (if set). If min-ptime is not set, any residual data is
  sent in a last RTP packet. In the case of frame based codecs, the resulting
  RTP packets always contain full frames.
  
  ## Usage
  
  To use this base class, your child element needs to call either
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setFrameBased] or
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setSampleBased]. This is usually done in the
  element's `_init()` function. Then, the child element must call either
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setFrameOptions],
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setSampleOptions] or
  gst_rtp_base_audio_payload_set_samplebits_options. Since
  GstRTPBaseAudioPayload derives from GstRTPBasePayload, the child element
  must set any variables or call/override any functions required by that base
  class. The child element does not need to override any other functions
  specific to GstRTPBaseAudioPayload.
*/
class RTPBaseAudioPayload : gstrtp.rtpbase_payload.RTPBasePayload
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtp_base_audio_payload_get_type != &gidSymbolNotFound ? gst_rtp_base_audio_payload_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override RTPBaseAudioPayload self()
  {
    return this;
  }

  /**
      Create an RTP buffer and store payload_len bytes of the adapter as the
    payload. Set the timestamp on the new buffer to timestamp before pushing
    the buffer downstream.
    
    If payload_len is -1, all pending bytes will be flushed. If timestamp is
    -1, the timestamp will be calculated automatically.
    Params:
      payloadLen =       length of payload
      timestamp =       a #GstClockTime
    Returns:     a #GstFlowReturn
  */
  gst.types.FlowReturn flush(uint payloadLen, gst.types.ClockTime timestamp)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_audio_payload_flush(cast(GstRTPBaseAudioPayload*)cPtr, payloadLen, timestamp);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Gets the internal adapter used by the depayloader.
    Returns:     a #GstAdapter.
  */
  gstbase.adapter.Adapter getAdapter()
  {
    GstAdapter* _cretval;
    _cretval = gst_rtp_base_audio_payload_get_adapter(cast(GstRTPBaseAudioPayload*)cPtr);
    auto _retval = ObjectG.getDObject!(gstbase.adapter.Adapter)(cast(GstAdapter*)_cretval, Yes.Take);
    return _retval;
  }

  alias push = gstrtp.rtpbase_payload.RTPBasePayload.push;

  /**
      Create an RTP buffer and store payload_len bytes of data as the
    payload. Set the timestamp on the new buffer to timestamp before pushing
    the buffer downstream.
    Params:
      data =       data to set as payload
      timestamp =       a #GstClockTime
    Returns:     a #GstFlowReturn
  */
  gst.types.FlowReturn push(ubyte[] data, gst.types.ClockTime timestamp)
  {
    GstFlowReturn _cretval;
    uint _payloadLen;
    if (data)
      _payloadLen = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = gst_rtp_base_audio_payload_push(cast(GstRTPBaseAudioPayload*)cPtr, _data, _payloadLen, timestamp);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Tells #GstRTPBaseAudioPayload that the child element is for a frame based
    audio codec
  */
  void setFrameBased()
  {
    gst_rtp_base_audio_payload_set_frame_based(cast(GstRTPBaseAudioPayload*)cPtr);
  }

  /**
      Sets the options for frame based audio codecs.
    Params:
      frameDuration =       The duraction of an audio frame in milliseconds.
      frameSize =       The size of an audio frame in bytes.
  */
  void setFrameOptions(int frameDuration, int frameSize)
  {
    gst_rtp_base_audio_payload_set_frame_options(cast(GstRTPBaseAudioPayload*)cPtr, frameDuration, frameSize);
  }

  /**
      Tells #GstRTPBaseAudioPayload that the child element is for a sample based
    audio codec
  */
  void setSampleBased()
  {
    gst_rtp_base_audio_payload_set_sample_based(cast(GstRTPBaseAudioPayload*)cPtr);
  }

  /**
      Sets the options for sample based audio codecs.
    Params:
      sampleSize =       Size per sample in bytes.
  */
  void setSampleOptions(int sampleSize)
  {
    gst_rtp_base_audio_payload_set_sample_options(cast(GstRTPBaseAudioPayload*)cPtr, sampleSize);
  }

  /**
      Sets the options for sample based audio codecs.
    Params:
      sampleSize =       Size per sample in bits.
  */
  void setSamplebitsOptions(int sampleSize)
  {
    gst_rtp_base_audio_payload_set_samplebits_options(cast(GstRTPBaseAudioPayload*)cPtr, sampleSize);
  }
}
