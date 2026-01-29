/// Module for [AudioConverter] class
module gstaudio.audio_converter;

import gid.gid;
import gobject.boxed;
import gst.structure;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This object is used to convert audio samples from one format to another.
    The object can perform conversion of:
    
     $(LIST
        * audio format with optional dithering and noise shaping
       
        * audio samplerate
       
        * audio channels and channel layout
     )
*/
class AudioConverter : gobject.boxed.Boxed
{

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
    return cast(void function())gst_audio_converter_get_type != &gidSymbolNotFound ? gst_audio_converter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioConverter self()
  {
    return this;
  }

  /**
      Create a new #GstAudioConverter that is able to convert between in and out
      audio formats.
      
      config contains extra configuration options, see `GST_AUDIO_CONVERTER_OPT_*`
      parameters for details about the options and values.
  
      Params:
        flags = extra #GstAudioConverterFlags
        inInfo = a source #GstAudioInfo
        outInfo = a destination #GstAudioInfo
        config = a #GstStructure with configuration options
      Returns: a #GstAudioConverter or null if conversion is not possible.
  */
  this(gstaudio.types.AudioConverterFlags flags, gstaudio.audio_info.AudioInfo inInfo, gstaudio.audio_info.AudioInfo outInfo, gst.structure.Structure config = null)
  {
    GstAudioConverter* _cretval;
    _cretval = gst_audio_converter_new(flags, inInfo ? cast(GstAudioInfo*)inInfo._cPtr(No.Dup) : null, outInfo ? cast(GstAudioInfo*)outInfo._cPtr(No.Dup) : null, config ? cast(GstStructure*)config._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Convenience wrapper around [gstaudio.audio_converter.AudioConverter.samples], which will
      perform allocation of the output buffer based on the result from
      [gstaudio.audio_converter.AudioConverter.getOutFrames].
  
      Params:
        flags = extra #GstAudioConverterFlags
        in_ = input data
        out_ = a pointer where
           the output data will be written
      Returns: true is the conversion could be performed.
  */
  bool convert(gstaudio.types.AudioConverterFlags flags, ubyte[] in_, out ubyte[] out_)
  {
    bool _retval;
    size_t _inSize;
    if (in_)
      _inSize = cast(size_t)in_.length;

    auto _in_ = cast(void*)in_.ptr;
    size_t _outSize;
    void* _out_;
    _retval = cast(bool)gst_audio_converter_convert(cast(GstAudioConverter*)this._cPtr, flags, _in_, _inSize, &_out_, &_outSize);
    out_.length = _outSize;
    out_[0 .. $] = (cast(ubyte*)_out_)[0 .. _outSize];
    gFree(cast(void*)_out_);
    return _retval;
  }

  /**
      Get the current configuration of convert.
  
      Params:
        inRate = result input rate
        outRate = result output rate
      Returns: a #GstStructure that remains valid for as long as convert is valid
          or until [gstaudio.audio_converter.AudioConverter.updateConfig] is called.
  */
  gst.structure.Structure getConfig(out int inRate, out int outRate)
  {
    const(GstStructure)* _cretval;
    _cretval = gst_audio_converter_get_config(cast(GstAudioConverter*)this._cPtr, cast(int*)&inRate, cast(int*)&outRate);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Calculate how many input frames are currently needed by convert to produce
      out_frames of output frames.
  
      Params:
        outFrames = number of output frames
      Returns: the number of input frames
  */
  size_t getInFrames(size_t outFrames)
  {
    size_t _retval;
    _retval = gst_audio_converter_get_in_frames(cast(GstAudioConverter*)this._cPtr, outFrames);
    return _retval;
  }

  /**
      Get the maximum number of input frames that the converter would
      need before producing output.
      Returns: the latency of convert as expressed in the number of
        frames.
  */
  size_t getMaxLatency()
  {
    size_t _retval;
    _retval = gst_audio_converter_get_max_latency(cast(GstAudioConverter*)this._cPtr);
    return _retval;
  }

  /**
      Calculate how many output frames can be produced when in_frames input
      frames are given to convert.
  
      Params:
        inFrames = number of input frames
      Returns: the number of output frames
  */
  size_t getOutFrames(size_t inFrames)
  {
    size_t _retval;
    _retval = gst_audio_converter_get_out_frames(cast(GstAudioConverter*)this._cPtr, inFrames);
    return _retval;
  }

  /**
      Returns whether the audio converter will operate in passthrough mode.
      The return value would be typically input to [gstbase.base_transform.BaseTransform.setPassthrough]
      Returns: true when no conversion will actually occur.
  */
  bool isPassthrough()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_converter_is_passthrough(cast(GstAudioConverter*)this._cPtr);
    return _retval;
  }

  /**
      Reset convert to the state it was when it was first created, clearing
      any history it might currently have.
  */
  void reset()
  {
    gst_audio_converter_reset(cast(GstAudioConverter*)this._cPtr);
  }

  /**
      Returns whether the audio converter can perform the conversion in-place.
      The return value would be typically input to [gstbase.base_transform.BaseTransform.setInPlace]
      Returns: true when the conversion can be done in place.
  */
  bool supportsInplace()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_converter_supports_inplace(cast(GstAudioConverter*)this._cPtr);
    return _retval;
  }

  /**
      Set in_rate, out_rate and config as extra configuration for convert.
      
      in_rate and out_rate specify the new sample rates of input and output
      formats. A value of 0 leaves the sample rate unchanged.
      
      config can be null, in which case, the current configuration is not
      changed.
      
      If the parameters in config can not be set exactly, this function returns
      false and will try to update as much state as possible. The new state can
      then be retrieved and refined with [gstaudio.audio_converter.AudioConverter.getConfig].
      
      Look at the `GST_AUDIO_CONVERTER_OPT_*` fields to check valid configuration
      option and values.
  
      Params:
        inRate = input rate
        outRate = output rate
        config = a #GstStructure or null
      Returns: true when the new parameters could be set
  */
  bool updateConfig(int inRate, int outRate, gst.structure.Structure config = null)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_converter_update_config(cast(GstAudioConverter*)this._cPtr, inRate, outRate, config ? cast(GstStructure*)config._cPtr(Yes.Dup) : null);
    return _retval;
  }
}
