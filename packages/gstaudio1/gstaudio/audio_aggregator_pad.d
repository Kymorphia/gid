/// Module for [AudioAggregatorPad] class
module gstaudio.audio_aggregator_pad;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.aggregator_pad;

/**
    The default implementation of GstPad used with #GstAudioAggregator
*/
class AudioAggregatorPad : gstbase.aggregator_pad.AggregatorPad
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
    return cast(void function())gst_audio_aggregator_pad_get_type != &gidSymbolNotFound ? gst_audio_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioAggregatorPad self()
  {
    return this;
  }

  /**
  Get builder for [gstaudio.audio_aggregator_pad.AudioAggregatorPad]
  Returns: New builder object
  */
  static AudioAggregatorPadGidBuilder builder()
  {
    return new AudioAggregatorPadGidBuilder;
  }

  /**
      Get `qosMessages` property.
      Returns: Emit QoS messages when dropping buffers.
  */
  @property bool qosMessages()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("qos-messages");
  }

  /**
      Set `qosMessages` property.
      Params:
        propval = Emit QoS messages when dropping buffers.
  */
  @property void qosMessages(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("qos-messages", propval);
  }
}

class AudioAggregatorPadGidBuilderImpl(T) : gstbase.aggregator_pad.AggregatorPadGidBuilderImpl!T
{

  /**
      Set `qosMessages` property.
      Params:
        propval = Emit QoS messages when dropping buffers.
      Returns: Builder instance for fluent chaining
  */
  T qosMessages(bool propval)
  {
    return setProperty("qos-messages", propval);
  }
}

/// Fluent builder for [gstaudio.audio_aggregator_pad.AudioAggregatorPad]
final class AudioAggregatorPadGidBuilder : AudioAggregatorPadGidBuilderImpl!AudioAggregatorPadGidBuilder
{
  AudioAggregatorPad build()
  {
    return new AudioAggregatorPad(cast(void*)createGObject(AudioAggregatorPad._getGType), No.Take);
  }
}
