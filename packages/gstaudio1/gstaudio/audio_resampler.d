/// Module for [AudioResampler] class
module gstaudio.audio_resampler;

import gid.gid;
import gst.structure;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    #GstAudioResampler is a structure which holds the information
    required to perform various kinds of resampling filtering.
*/
class AudioResampler
{
  GstAudioResampler* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_resampler.AudioResampler");

    _cInstancePtr = cast(GstAudioResampler*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Get the number of input frames that would currently be needed
      to produce out_frames from resampler.
  
      Params:
        outFrames = number of input frames
      Returns: The number of input frames needed for producing
        out_frames of data from resampler.
  */
  size_t getInFrames(size_t outFrames)
  {
    size_t _retval;
    _retval = gst_audio_resampler_get_in_frames(cast(GstAudioResampler*)this._cPtr, outFrames);
    return _retval;
  }

  /**
      Get the maximum number of input samples that the resampler would
      need before producing output.
      Returns: the latency of resampler as expressed in the number of
        frames.
  */
  size_t getMaxLatency()
  {
    size_t _retval;
    _retval = gst_audio_resampler_get_max_latency(cast(GstAudioResampler*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of output frames that would be currently available when
      in_frames are given to resampler.
  
      Params:
        inFrames = number of input frames
      Returns: The number of frames that would be available after giving
        in_frames as input to resampler.
  */
  size_t getOutFrames(size_t inFrames)
  {
    size_t _retval;
    _retval = gst_audio_resampler_get_out_frames(cast(GstAudioResampler*)this._cPtr, inFrames);
    return _retval;
  }

  /**
      Reset resampler to the state it was when it was first created, discarding
      all sample history.
  */
  void reset()
  {
    gst_audio_resampler_reset(cast(GstAudioResampler*)this._cPtr);
  }

  /**
      Update the resampler parameters for resampler. This function should
      not be called concurrently with any other function on resampler.
      
      When in_rate or out_rate is 0, its value is unchanged.
      
      When options is null, the previously configured options are reused.
  
      Params:
        inRate = new input rate
        outRate = new output rate
        options = new options or null
      Returns: true if the new parameters could be set
  */
  bool update(int inRate, int outRate, gst.structure.Structure options)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_resampler_update(cast(GstAudioResampler*)this._cPtr, inRate, outRate, options ? cast(GstStructure*)options._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Make a new resampler.
  
      Params:
        method = a #GstAudioResamplerMethod
        flags = #GstAudioResamplerFlags
        format = the #GstAudioFormat
        channels = the number of channels
        inRate = input rate
        outRate = output rate
        options = extra options
      Returns: The new #GstAudioResampler.
  */
  static gstaudio.audio_resampler.AudioResampler new_(gstaudio.types.AudioResamplerMethod method, gstaudio.types.AudioResamplerFlags flags, gstaudio.types.AudioFormat format, int channels, int inRate, int outRate, gst.structure.Structure options)
  {
    GstAudioResampler* _cretval;
    _cretval = gst_audio_resampler_new(method, flags, format, channels, inRate, outRate, options ? cast(GstStructure*)options._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstaudio.audio_resampler.AudioResampler(cast(GstAudioResampler*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the parameters for resampling from in_rate to out_rate using method
      for quality in options.
  
      Params:
        method = a #GstAudioResamplerMethod
        quality = the quality
        inRate = the input rate
        outRate = the output rate
        options = a #GstStructure
  */
  static void optionsSetQuality(gstaudio.types.AudioResamplerMethod method, uint quality, int inRate, int outRate, gst.structure.Structure options)
  {
    gst_audio_resampler_options_set_quality(method, quality, inRate, outRate, options ? cast(GstStructure*)options._cPtr(No.Dup) : null);
  }
}
