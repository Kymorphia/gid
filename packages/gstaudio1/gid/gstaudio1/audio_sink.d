/// Module for [AudioSink] class
module gid.gstaudio1.audio_sink;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstaudio1.audio_base_sink;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    This is the most simple base class for audio sinks that only requires
    subclasses to implement a set of simple functions:
    
    * `open()` :Open the device.
    
    * `prepare()` :Configure the device with the specified format.
    
    * `write()` :Write samples to the device.
    
    * `reset()` :Unblock writes and flush the device.
    
    * `delay()` :Get the number of samples written but not yet played
    by the device.
    
    * `unprepare()` :Undo operations done by prepare.
    
    * `close()` :Close the device.
    
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSink using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
class AudioSink : gid.gstaudio1.audio_base_sink.AudioBaseSink
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_sink_get_type != &gidSymbolNotFound ? gst_audio_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioSink";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioSink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_sink.AudioSink]
      Returns: New builder object
  */
  static AudioSinkGidBuilder builder() nothrow
  {
    return new AudioSinkGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_sink.AudioSink]
class AudioSinkGidBuilderImpl(T) : gid.gstaudio1.audio_base_sink.AudioBaseSinkGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_sink.AudioSink]
final class AudioSinkGidBuilder : AudioSinkGidBuilderImpl!AudioSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioSink build() nothrow
  {
    return new AudioSink(cast(void*)createGObject(AudioSink._getGType), Yes.Take);
  }
}
