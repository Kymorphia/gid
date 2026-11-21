/// Module for [AudioStreamAlign] class
module gid.gstaudio1.audio_stream_align;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gst1.types;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    #GstAudioStreamAlign provides a helper object that helps tracking audio
    stream alignment and discontinuities, and detects discontinuities if
    possible.
    
    See [gid.gstaudio1.audio_stream_align.AudioStreamAlign.new_] for a description of its parameters and
    [gid.gstaudio1.audio_stream_align.AudioStreamAlign.process] for the details of the processing.
*/
class AudioStreamAlign : gid.gobject2.boxed.BoxedWrap!(gst_audio_stream_align_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioStreamAlign self() nothrow
  {
    return this;
  }

  /**
      Allocate a new #GstAudioStreamAlign with the given configuration. All
      processing happens according to sample rate rate, until
      [gid.gstaudio1.audio_stream_align.AudioStreamAlign.setRate] is called with a new rate.
      A negative rate can be used for reverse playback.
      
      alignment_threshold gives the tolerance in nanoseconds after which a
      timestamp difference is considered a discontinuity. Once detected,
      discont_wait nanoseconds have to pass without going below the threshold
      again until the output buffer is marked as a discontinuity. These can later
      be re-configured with [gid.gstaudio1.audio_stream_align.AudioStreamAlign.setAlignmentThreshold] and
      [gid.gstaudio1.audio_stream_align.AudioStreamAlign.setDiscontWait].
  
      Params:
        rate = a sample rate
        alignmentThreshold = a alignment threshold in nanoseconds
        discontWait = discont wait in nanoseconds
      Returns: a new #GstAudioStreamAlign. free with [gid.gstaudio1.audio_stream_align.AudioStreamAlign.free].
  */
  this(int rate, gid.gst1.types.ClockTime alignmentThreshold, gid.gst1.types.ClockTime discontWait) nothrow
  {
    GstAudioStreamAlign* _cretval;
    _cretval = gst_audio_stream_align_new(rate, alignmentThreshold, discontWait);
    this(_cretval, Yes.Take);
  }

  /**
      Copy a GstAudioStreamAlign structure.
      Returns: a new #GstAudioStreamAlign. free with gst_audio_stream_align_free.
  */
  gid.gstaudio1.audio_stream_align.AudioStreamAlign copy() nothrow
  {
    GstAudioStreamAlign* _cretval;
    _cretval = gst_audio_stream_align_copy(cast(const(GstAudioStreamAlign)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstaudio1.audio_stream_align.AudioStreamAlign(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the currently configured alignment threshold.
      Returns: The currently configured alignment threshold
  */
  gid.gst1.types.ClockTime getAlignmentThreshold() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_stream_align_get_alignment_threshold(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently configured discont wait.
      Returns: The currently configured discont wait
  */
  gid.gst1.types.ClockTime getDiscontWait() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_stream_align_get_discont_wait(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently configured sample rate.
      Returns: The currently configured sample rate
  */
  int getRate() nothrow
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
  ulong getSamplesSinceDiscont() nothrow
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
  gid.gst1.types.ClockTime getTimestampAtDiscont() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_stream_align_get_timestamp_at_discont(cast(const(GstAudioStreamAlign)*)this._cPtr);
    return _retval;
  }

  /**
      Marks the next buffer as discontinuous and resets timestamp tracking.
  */
  void markDiscont() nothrow
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
  bool process(bool discont, gid.gst1.types.ClockTime timestamp, uint nSamples, out gid.gst1.types.ClockTime outTimestamp, out gid.gst1.types.ClockTime outDuration, out ulong outSamplePosition) nothrow
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
  void setAlignmentThreshold(gid.gst1.types.ClockTime alignmentThreshold) nothrow
  {
    gst_audio_stream_align_set_alignment_threshold(cast(GstAudioStreamAlign*)this._cPtr, alignmentThreshold);
  }

  /**
      Sets alignment_treshold as new discont wait for the following processing.
  
      Params:
        discontWait = a new discont wait
  */
  void setDiscontWait(gid.gst1.types.ClockTime discontWait) nothrow
  {
    gst_audio_stream_align_set_discont_wait(cast(GstAudioStreamAlign*)this._cPtr, discontWait);
  }

  /**
      Sets rate as new sample rate for the following processing. If the sample
      rate differs this implicitly marks the next data as discontinuous.
  
      Params:
        rate = a new sample rate
  */
  void setRate(int rate) nothrow
  {
    gst_audio_stream_align_set_rate(cast(GstAudioStreamAlign*)this._cPtr, rate);
  }
}
