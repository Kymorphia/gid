/// Module for [VideoCodecFrame] class
module gid.gstvideo1.video_codec_frame;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.types;
import gid.gobject2.boxed;
import gid.gst1.buffer;
import gid.gst1.types;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    A #GstVideoCodecFrame represents a video frame both in raw and
    encoded form.
*/
class VideoCodecFrame : gid.gobject2.boxed.BoxedWrap!(gst_video_codec_frame_get_type)
{
  /**
      Create a `video_codec_frame.VideoCodecFrame` boxed type.
      Params:
        systemFrameNumber = Unique identifier for the frame. Use this if you need
                to get hold of the frame later (like when data is being decoded).
                Typical usage in decoders is to set this on the opaque value provided
                to the library and get back the frame using [gid.gstvideo1.video_decoder.VideoDecoder.getFrame]
        dts = Decoding timestamp
        pts = Presentation timestamp
        duration = Duration of the frame
        distanceFromSync = Distance in frames from the last synchronization point.
        inputBuffer = the input #GstBuffer that created this frame. The buffer is owned
                    by the frame and references to the frame instead of the buffer should
                    be kept.
        outputBuffer = the output #GstBuffer. Implementations should set this either
                    directly, or by using the
                    [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputFrame] or
                    [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                    owned by the frame and references to the frame instead of the
                    buffer should be kept.
        deadline = Running time when the frame will be used.
  */
  this(uint systemFrameNumber = uint.init, gid.gst1.types.ClockTime dts = gid.gst1.types.ClockTime.init, gid.gst1.types.ClockTime pts = gid.gst1.types.ClockTime.init, gid.gst1.types.ClockTime duration = gid.gst1.types.ClockTime.init, int distanceFromSync = int.init, gid.gst1.buffer.Buffer inputBuffer = gid.gst1.buffer.Buffer.init, gid.gst1.buffer.Buffer outputBuffer = gid.gst1.buffer.Buffer.init, gid.gst1.types.ClockTime deadline = gid.gst1.types.ClockTime.init) nothrow
  {
    super(boxedNew!GstVideoCodecFrame(_getGType), Yes.Take);
    this.systemFrameNumber = systemFrameNumber;
    this.dts = dts;
    this.pts = pts;
    this.duration = duration;
    this.distanceFromSync = distanceFromSync;
    this.inputBuffer = inputBuffer;
    this.outputBuffer = outputBuffer;
    this.deadline = deadline;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoCodecFrame self() nothrow
  {
    return this;
  }

  /**
      Get `systemFrameNumber` field.
      Returns: Unique identifier for the frame. Use this if you need
              to get hold of the frame later (like when data is being decoded).
              Typical usage in decoders is to set this on the opaque value provided
              to the library and get back the frame using [gid.gstvideo1.video_decoder.VideoDecoder.getFrame]
  */
  @property uint systemFrameNumber() nothrow
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).systemFrameNumber;
  }

  /**
      Set `systemFrameNumber` field.
      Params:
        propval = Unique identifier for the frame. Use this if you need
                to get hold of the frame later (like when data is being decoded).
                Typical usage in decoders is to set this on the opaque value provided
                to the library and get back the frame using [gid.gstvideo1.video_decoder.VideoDecoder.getFrame]
  */
  @property void systemFrameNumber(uint propval) nothrow
  {
    (cast(GstVideoCodecFrame*)this._cPtr).systemFrameNumber = propval;
  }

  /**
      Get `dts` field.
      Returns: Decoding timestamp
  */
  @property gid.gst1.types.ClockTime dts() nothrow
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).dts;
  }

  /**
      Set `dts` field.
      Params:
        propval = Decoding timestamp
  */
  @property void dts(gid.gst1.types.ClockTime propval) nothrow
  {
    (cast(GstVideoCodecFrame*)this._cPtr).dts = propval;
  }

  /**
      Get `pts` field.
      Returns: Presentation timestamp
  */
  @property gid.gst1.types.ClockTime pts() nothrow
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).pts;
  }

  /**
      Set `pts` field.
      Params:
        propval = Presentation timestamp
  */
  @property void pts(gid.gst1.types.ClockTime propval) nothrow
  {
    (cast(GstVideoCodecFrame*)this._cPtr).pts = propval;
  }

  /**
      Get `duration` field.
      Returns: Duration of the frame
  */
  @property gid.gst1.types.ClockTime duration() nothrow
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = Duration of the frame
  */
  @property void duration(gid.gst1.types.ClockTime propval) nothrow
  {
    (cast(GstVideoCodecFrame*)this._cPtr).duration = propval;
  }

  /**
      Get `distanceFromSync` field.
      Returns: Distance in frames from the last synchronization point.
  */
  @property int distanceFromSync() nothrow
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).distanceFromSync;
  }

  /**
      Set `distanceFromSync` field.
      Params:
        propval = Distance in frames from the last synchronization point.
  */
  @property void distanceFromSync(int propval) nothrow
  {
    (cast(GstVideoCodecFrame*)this._cPtr).distanceFromSync = propval;
  }

  /**
      Get `inputBuffer` field.
      Returns: the input #GstBuffer that created this frame. The buffer is owned
                  by the frame and references to the frame instead of the buffer should
                  be kept.
  */
  @property gid.gst1.buffer.Buffer inputBuffer() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).inputBuffer);
  }

  /**
      Set `inputBuffer` field.
      Params:
        propval = the input #GstBuffer that created this frame. The buffer is owned
                    by the frame and references to the frame instead of the buffer should
                    be kept.
  */
  @property void inputBuffer(gid.gst1.buffer.Buffer propval) nothrow
  {
    cValueFree!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).inputBuffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecFrame*)this._cPtr).inputBuffer);
  }

  /**
      Get `outputBuffer` field.
      Returns: the output #GstBuffer. Implementations should set this either
                  directly, or by using the
                  [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputFrame] or
                  [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                  owned by the frame and references to the frame instead of the
                  buffer should be kept.
  */
  @property gid.gst1.buffer.Buffer outputBuffer() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).outputBuffer);
  }

  /**
      Set `outputBuffer` field.
      Params:
        propval = the output #GstBuffer. Implementations should set this either
                    directly, or by using the
                    [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputFrame] or
                    [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                    owned by the frame and references to the frame instead of the
                    buffer should be kept.
  */
  @property void outputBuffer(gid.gst1.buffer.Buffer propval) nothrow
  {
    cValueFree!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).outputBuffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecFrame*)this._cPtr).outputBuffer);
  }

  /**
      Get `deadline` field.
      Returns: Running time when the frame will be used.
  */
  @property gid.gst1.types.ClockTime deadline() nothrow
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).deadline;
  }

  /**
      Set `deadline` field.
      Params:
        propval = Running time when the frame will be used.
  */
  @property void deadline(gid.gst1.types.ClockTime propval) nothrow
  {
    (cast(GstVideoCodecFrame*)this._cPtr).deadline = propval;
  }

  /**
      Gets private data set on the frame by the subclass via
      [gid.gstvideo1.video_codec_frame.VideoCodecFrame.setUserData] previously.
      Returns: The previously set user_data
  */
  void* getUserData() nothrow
  {
    auto _retval = gst_video_codec_frame_get_user_data(cast(GstVideoCodecFrame*)this._cPtr);
    return _retval;
  }

  /**
      Sets user_data on the frame and the #GDestroyNotify that will be called when
      the frame is freed. Allows to attach private data by the subclass to frames.
      
      If a user_data was previously set, then the previous set notify will be called
      before the user_data is replaced.
  
      Params:
        notify = a #GDestroyNotify
  */
  void setUserData(gid.glib2.types.DestroyNotify notify) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.glib2.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.DestroyNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    gst_video_codec_frame_set_user_data(cast(GstVideoCodecFrame*)this._cPtr, _notify, _notifyCB);
  }
}
