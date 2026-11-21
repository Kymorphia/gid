/// Module for [AudioAggregatorConvertPad] class
module gid.gstaudio1.audio_aggregator_convert_pad;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.structure;
import gid.gstaudio1.audio_aggregator_pad;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    An implementation of GstPad that can be used with #GstAudioAggregator.
    
    See #GstAudioAggregator for more details.
*/
class AudioAggregatorConvertPad : gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad
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
    return cast(void function())gst_audio_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_audio_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioAggregatorConvertPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioAggregatorConvertPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_aggregator_convert_pad.AudioAggregatorConvertPad]
      Returns: New builder object
  */
  static AudioAggregatorConvertPadGidBuilder builder() nothrow
  {
    return new AudioAggregatorConvertPadGidBuilder;
  }

  /** */
  @property gid.gst1.structure.Structure converterConfig() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.structure.Structure)("converter-config");
  }

  /** */
  @property void converterConfig(gid.gst1.structure.Structure propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.structure.Structure)("converter-config", propval);
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_aggregator_convert_pad.AudioAggregatorConvertPad]
class AudioAggregatorConvertPadGidBuilderImpl(T) : gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPadGidBuilderImpl!T
{

  /** */
  T converterConfig(gid.gst1.structure.Structure propval) nothrow
  {
    return setProperty("converter-config", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_aggregator_convert_pad.AudioAggregatorConvertPad]
final class AudioAggregatorConvertPadGidBuilder : AudioAggregatorConvertPadGidBuilderImpl!AudioAggregatorConvertPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioAggregatorConvertPad build() nothrow
  {
    return new AudioAggregatorConvertPad(cast(void*)createGObject(AudioAggregatorConvertPad._getGType), Yes.Take);
  }
}
