/// Module for [AudioSrc] class
module gstaudio.audio_src;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gstaudio.audio_base_src;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This is the most simple base class for audio sources that only requires
    subclasses to implement a set of simple functions:
    
    * `open()` :Open the device.
    * `prepare()` :Configure the device with the specified format.
    * `read()` :Read samples from the device.
    * `reset()` :Unblock reads and flush the device.
    * `delay()` :Get the number of samples in the device but not yet read.
    * `unprepare()` :Undo operations done by prepare.
    * `close()` :Close the device.
    
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSrc using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
class AudioSrc : gstaudio.audio_base_src.AudioBaseSrc
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_src_get_type != &gidSymbolNotFound ? gst_audio_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstaudio.audio_src.AudioSrc]
      Returns: New builder object
  */
  static AudioSrcGidBuilder builder() nothrow
  {
    return new AudioSrcGidBuilder;
  }
}

/// Fluent builder implementation template for [gstaudio.audio_src.AudioSrc]
class AudioSrcGidBuilderImpl(T) : gstaudio.audio_base_src.AudioBaseSrcGidBuilderImpl!T
{
}

/// Fluent builder for [gstaudio.audio_src.AudioSrc]
final class AudioSrcGidBuilder : AudioSrcGidBuilderImpl!AudioSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioSrc build() nothrow
  {
    return new AudioSrc(cast(void*)createGObject(AudioSrc._getGType), No.Take);
  }
}
