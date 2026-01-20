/// Module for [VideoCodecFrame] class
module gstvideo.video_codec_frame;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.buffer;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    A #GstVideoCodecFrame represents a video frame both in raw and
    encoded form.
*/
class VideoCodecFrame : gobject.boxed.Boxed
{

  /**
      Create a `video_codec_frame.VideoCodecFrame` boxed type.
      Params:
        systemFrameNumber = Unique identifier for the frame. Use this if you need
                to get hold of the frame later (like when data is being decoded).
                Typical usage in decoders is to set this on the opaque value provided
                to the library and get back the frame using [gstvideo.video_decoder.VideoDecoder.getFrame]
        dts = Decoding timestamp
        pts = Presentation timestamp
        duration = Duration of the frame
        distanceFromSync = Distance in frames from the last synchronization point.
        inputBuffer = the input #GstBuffer that created this frame. The buffer is owned
                    by the frame and references to the frame instead of the buffer should
                    be kept.
        outputBuffer = the output #GstBuffer. Implementations should set this either
                    directly, or by using the
                    [gstvideo.video_decoder.VideoDecoder.allocateOutputFrame] or
                    [gstvideo.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                    owned by the frame and references to the frame instead of the
                    buffer should be kept.
        deadline = Running time when the frame will be used.
  */
  this(uint systemFrameNumber = uint.init, gst.types.ClockTime dts = gst.types.ClockTime.init, gst.types.ClockTime pts = gst.types.ClockTime.init, gst.types.ClockTime duration = gst.types.ClockTime.init, int distanceFromSync = int.init, gst.buffer.Buffer inputBuffer = gst.buffer.Buffer.init, gst.buffer.Buffer outputBuffer = gst.buffer.Buffer.init, gst.types.ClockTime deadline = gst.types.ClockTime.init)
  {
    super(gMalloc(GstVideoCodecFrame.sizeof), Yes.Take);
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_codec_frame_get_type != &gidSymbolNotFound ? gst_video_codec_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoCodecFrame self()
  {
    return this;
  }

  /**
      Get `systemFrameNumber` field.
      Returns: Unique identifier for the frame. Use this if you need
              to get hold of the frame later (like when data is being decoded).
              Typical usage in decoders is to set this on the opaque value provided
              to the library and get back the frame using [gstvideo.video_decoder.VideoDecoder.getFrame]
  */
  @property uint systemFrameNumber()
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).systemFrameNumber;
  }

  /**
      Set `systemFrameNumber` field.
      Params:
        propval = Unique identifier for the frame. Use this if you need
                to get hold of the frame later (like when data is being decoded).
                Typical usage in decoders is to set this on the opaque value provided
                to the library and get back the frame using [gstvideo.video_decoder.VideoDecoder.getFrame]
  */
  @property void systemFrameNumber(uint propval)
  {
    (cast(GstVideoCodecFrame*)this._cPtr).systemFrameNumber = propval;
  }

  /**
      Get `dts` field.
      Returns: Decoding timestamp
  */
  @property gst.types.ClockTime dts()
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).dts;
  }

  /**
      Set `dts` field.
      Params:
        propval = Decoding timestamp
  */
  @property void dts(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)this._cPtr).dts = propval;
  }

  /**
      Get `pts` field.
      Returns: Presentation timestamp
  */
  @property gst.types.ClockTime pts()
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).pts;
  }

  /**
      Set `pts` field.
      Params:
        propval = Presentation timestamp
  */
  @property void pts(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)this._cPtr).pts = propval;
  }

  /**
      Get `duration` field.
      Returns: Duration of the frame
  */
  @property gst.types.ClockTime duration()
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = Duration of the frame
  */
  @property void duration(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)this._cPtr).duration = propval;
  }

  /**
      Get `distanceFromSync` field.
      Returns: Distance in frames from the last synchronization point.
  */
  @property int distanceFromSync()
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).distanceFromSync;
  }

  /**
      Set `distanceFromSync` field.
      Params:
        propval = Distance in frames from the last synchronization point.
  */
  @property void distanceFromSync(int propval)
  {
    (cast(GstVideoCodecFrame*)this._cPtr).distanceFromSync = propval;
  }

  /**
      Get `inputBuffer` field.
      Returns: the input #GstBuffer that created this frame. The buffer is owned
                  by the frame and references to the frame instead of the buffer should
                  be kept.
  */
  @property gst.buffer.Buffer inputBuffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).inputBuffer);
  }

  /**
      Set `inputBuffer` field.
      Params:
        propval = the input #GstBuffer that created this frame. The buffer is owned
                    by the frame and references to the frame instead of the buffer should
                    be kept.
  */
  @property void inputBuffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).inputBuffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecFrame*)this._cPtr).inputBuffer);
  }

  /**
      Get `outputBuffer` field.
      Returns: the output #GstBuffer. Implementations should set this either
                  directly, or by using the
                  [gstvideo.video_decoder.VideoDecoder.allocateOutputFrame] or
                  [gstvideo.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                  owned by the frame and references to the frame instead of the
                  buffer should be kept.
  */
  @property gst.buffer.Buffer outputBuffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).outputBuffer);
  }

  /**
      Set `outputBuffer` field.
      Params:
        propval = the output #GstBuffer. Implementations should set this either
                    directly, or by using the
                    [gstvideo.video_decoder.VideoDecoder.allocateOutputFrame] or
                    [gstvideo.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                    owned by the frame and references to the frame instead of the
                    buffer should be kept.
  */
  @property void outputBuffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)this._cPtr).outputBuffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecFrame*)this._cPtr).outputBuffer);
  }

  /**
      Get `deadline` field.
      Returns: Running time when the frame will be used.
  */
  @property gst.types.ClockTime deadline()
  {
    return (cast(GstVideoCodecFrame*)this._cPtr).deadline;
  }

  /**
      Set `deadline` field.
      Params:
        propval = Running time when the frame will be used.
  */
  @property void deadline(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)this._cPtr).deadline = propval;
  }

  /**
      Gets private data set on the frame by the subclass via
      [gstvideo.video_codec_frame.VideoCodecFrame.setUserData] previously.
      Returns: The previously set user_data
  */
  void* getUserData()
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
  void setUserData(glib.types.DestroyNotify notify)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    gst_video_codec_frame_set_user_data(cast(GstVideoCodecFrame*)this._cPtr, _notify, _notifyCB);
  }
}
