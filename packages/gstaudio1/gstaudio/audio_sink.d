/// Module for [AudioSink] class
module gstaudio.audio_sink;

import gid.gid;
import gobject.gid_builder;
import gstaudio.audio_base_sink;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This is the most simple base class for audio sinks that only requires
    subclasses to implement a set of simple functions:
    
    $(LIST
      * `open()` :Open the device.
      
      * `prepare()` :Configure the device with the specified format.
      
      * `write()` :Write samples to the device.
      
      * `reset()` :Unblock writes and flush the device.
      
      * `delay()` :Get the number of samples written but not yet played
    )
    by the device.
    
    $(LIST
      * `unprepare()` :Undo operations done by prepare.
      
      * `close()` :Close the device.
    )
      
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSink using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
class AudioSink : gstaudio.audio_base_sink.AudioBaseSink
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_sink_get_type != &gidSymbolNotFound ? gst_audio_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioSink self()
  {
    return this;
  }

  /**
      Get builder for [gstaudio.audio_sink.AudioSink]
      Returns: New builder object
  */
  static AudioSinkGidBuilder builder()
  {
    return new AudioSinkGidBuilder;
  }
}

/// Fluent builder implementation template for [gstaudio.audio_sink.AudioSink]
class AudioSinkGidBuilderImpl(T) : gstaudio.audio_base_sink.AudioBaseSinkGidBuilderImpl!T
{
}

/// Fluent builder for [gstaudio.audio_sink.AudioSink]
final class AudioSinkGidBuilder : AudioSinkGidBuilderImpl!AudioSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioSink build()
  {
    return new AudioSink(cast(void*)createGObject(AudioSink._getGType), No.Take);
  }
}
