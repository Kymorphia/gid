/// Module for [AudioStreamAlign] class
module gstaudio.audio_stream_align;

import gid.gid;
import gobject.boxed;
import gst.types;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    #GstAudioStreamAlign provides a helper object that helps tracking audio
    stream alignment and discontinuities, and detects discontinuities if
    possible.
    
    See [gstaudio.audio_stream_align.AudioStreamAlign.new_] for a description of its parameters and
    [gstaudio.audio_stream_align.AudioStreamAlign.process] for the details of the processing.
*/
class AudioStreamAlign : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_stream_align_get_type != &gidSymbolNotFound ? gst_audio_stream_align_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioStreamAlign self()
  {
    return this;
  }

  /**
      Allocate a new #GstAudioStreamAlign with the given configuration. All
      processing happens according to sample rate rate, until
      [gstaudio.audio_stream_align.AudioStreamAlign.setRate] is called with a new rate.
      A negative rate can be used for reverse playback.
      
      alignment_threshold gives the tolerance in nanoseconds after which a
      timestamp difference is considered a discontinuity. Once detected,
      discont_wait nanoseconds have to pass without going below the threshold
      again until the output buffer is marked as a discontinuity. These can later
      be re-configured with [gstaudio.audio_stream_align.AudioStreamAlign.setAlignmentThreshold] and
      [gstaudio.audio_stream_align.AudioStreamAlign.setDiscontWait].
  
      Params:
        rate = a sample rate
        alignmentThreshold = a alignment threshold in nanoseconds
        discontWait = discont wait in nanoseconds
      Returns: a new #GstAudioStreamAlign. free with [gstaudio.audio_stream_align.AudioStreamAlign.free].
  */
  this(int rate, gst.types.ClockTime alignmentThreshold, gst.types.ClockTime discontWait)
  {
    GstAudioStreamAlign* _cretval;
    _cretval = gst_audio_stream_align_new(rate, alignmentThreshold, discontWait);
    this(_cretval, Yes.Take);
  }

  /**
      Copy a GstAudioStreamAlign structure.
      Returns: a new #GstAudioStreamAlign. free with gst_audio_stream_align_free.
  */
  gstaudio.audio_stream_align.AudioStreamAlign copy()
  {
    GstAudioStreamAlign* _cretval;
    _cretval = gst_audio_stream_align_copy(cast(const(GstAudioStreamAlign)*)this._cPtr);
    auto _retval = _cretval ? new gstaudio.audio_stream_align.AudioStreamAlign(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the currently configured alignment threshold.
      Returns: The currently configured alignment threshold
  */
  gst.types.ClockTime getAlignmentThreshold()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_stream_align_get_alignment_threshold(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently configured discont wait.
      Returns: The currently configured discont wait
  */
  gst.types.ClockTime getDiscontWait()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_stream_align_get_discont_wait(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently configured sample rate.
      Returns: The currently configured sample rate
  */
  int getRate()
  {
    int _retval;
    _retval = gst_audio_stream_align_get_rate(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of samples that were processed since the last
      discontinuity was detected.
      Returns: The number of samples processed since the last discontinuity.
  */
  ulong getSamplesSinceDiscont()
  {
    ulong _retval;
    _retval = gst_audio_stream_align_get_samples_since_discont(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Timestamp that was passed when a discontinuity was detected, i.e. the first
      timestamp after the discontinuity.
      Returns: The last timestamp at when a discontinuity was detected
  */
  gst.types.ClockTime getTimestampAtDiscont()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_stream_align_get_timestamp_at_discont(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Marks the next buffer as discontinuous and resets timestamp tracking.
  */
  void markDiscont()
  {
    gst_audio_stream_align_mark_discont(cast(GstAudioStreamAlign*)this._cPtr);
  }

  /**
      Processes data with timestamp and n_samples, and returns the output
      timestamp, duration and sample position together with a boolean to signal
      whether a discontinuity was detected or not. All non-discontinuous data
      will have perfect timestamps and durations.
      
      A discontinuity is detected once the difference between the actual
      timestamp and the timestamp calculated from the sample count since the last
      discontinuity differs by more than the alignment threshold for a duration
      longer than discont wait.
      
      Note: In reverse playback, every buffer is considered discontinuous in the
      context of buffer flags because the last sample of the previous buffer is
      discontinuous with the first sample of the current one. However for this
      function they are only considered discontinuous in reverse playback if the
      first sample of the previous buffer is discontinuous with the last sample
      of the current one.
  
      Params:
        discont = if this data is considered to be discontinuous
        timestamp = a #GstClockTime of the start of the data
        nSamples = number of samples to process
        outTimestamp = output timestamp of the data
        outDuration = output duration of the data
        outSamplePosition = output sample position of the start of the data
      Returns: true if a discontinuity was detected, false otherwise.
  */
  bool process(bool discont, gst.types.ClockTime timestamp, uint nSamples, out gst.types.ClockTime outTimestamp, out gst.types.ClockTime outDuration, out ulong outSamplePosition)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_stream_align_process(cast(GstAudioStreamAlign*)this._cPtr, discont, timestamp, nSamples, cast(GstClockTime*)&outTimestamp, cast(GstClockTime*)&outDuration, cast(ulong*)&outSamplePosition);
    return _retval;
  }

  /**
      Sets alignment_treshold as new alignment threshold for the following processing.
  
      Params:
        alignmentThreshold = a new alignment threshold
  */
  void setAlignmentThreshold(gst.types.ClockTime alignmentThreshold)
  {
    gst_audio_stream_align_set_alignment_threshold(cast(GstAudioStreamAlign*)this._cPtr, alignmentThreshold);
  }

  /**
      Sets alignment_treshold as new discont wait for the following processing.
  
      Params:
        discontWait = a new discont wait
  */
  void setDiscontWait(gst.types.ClockTime discontWait)
  {
    gst_audio_stream_align_set_discont_wait(cast(GstAudioStreamAlign*)this._cPtr, discontWait);
  }

  /**
      Sets rate as new sample rate for the following processing. If the sample
      rate differs this implicitly marks the next data as discontinuous.
  
      Params:
        rate = a new sample rate
  */
  void setRate(int rate)
  {
    gst_audio_stream_align_set_rate(cast(GstAudioStreamAlign*)this._cPtr, rate);
  }
}
