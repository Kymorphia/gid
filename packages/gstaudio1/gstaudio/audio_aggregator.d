/// Module for [AudioAggregator] class
module gstaudio.audio_aggregator;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.caps;
import gstaudio.audio_aggregator_pad;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.aggregator;

/**
    Subclasses must use (a subclass of) #GstAudioAggregatorPad for both
    their source and sink pads,
    [gst.element_class.ElementClass.addStaticPadTemplateWithGtype] is a convenient
    helper.
    
    #GstAudioAggregator can perform conversion on the data arriving
    on its sink pads, based on the format expected downstream: in order
    to enable that behaviour, the GType of the sink pads must either be
    a (subclass of) #GstAudioAggregatorConvertPad to use the default
    #GstAudioConverter implementation, or a subclass of #GstAudioAggregatorPad
    implementing #GstAudioAggregatorPadClass.convert_buffer.
    
    To allow for the output caps to change, the mechanism is the same as
    above, with the GType of the source pad.
    
    See #GstAudioMixer for an example.
    
    When conversion is enabled, #GstAudioAggregator will accept
    any type of raw audio caps and perform conversion
    on the data arriving on its sink pads, with whatever downstream
    expects as the target format.
    
    In case downstream caps are not fully fixated, it will use
    the first configured sink pad to finish fixating its source pad
    caps.
    
    A notable exception for now is the sample rate, sink pads must
    have the same sample rate as either the downstream requirement,
    or the first configured pad, or a combination of both (when
    downstream specifies a range or a set of acceptable rates).
    
    The #GstAggregator::samples-selected signal is provided with some
    additional information about the output buffer:
    - "offset"  G_TYPE_UINT64   Offset in samples since segment start
      for the position that is next to be filled in the output buffer.
    - "frames"  G_TYPE_UINT   Number of frames per output buffer.
    
    In addition the [gstbase.aggregator.Aggregator.peekNextSample] function returns
    additional information in the info #GstStructure of the returned sample:
    - "output-offset"  G_TYPE_UINT64   Sample offset in output segment relative to
      the output segment's start where the current position of this input
      buffer would be placed
    - "position"  G_TYPE_UINT   current position in the input buffer in samples
    - "size"  G_TYPE_UINT   size of the input buffer in samples
*/
class AudioAggregator : gstbase.aggregator.Aggregator
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
    return cast(void function())gst_audio_aggregator_get_type != &gidSymbolNotFound ? gst_audio_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioAggregator self()
  {
    return this;
  }

  /**
      Get builder for [gstaudio.audio_aggregator.AudioAggregator]
      Returns: New builder object
  */
  static AudioAggregatorGidBuilder builder()
  {
    return new AudioAggregatorGidBuilder;
  }

  /** */
  @property ulong alignmentThreshold()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("alignment-threshold");
  }

  /** */
  @property void alignmentThreshold(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("alignment-threshold", propval);
  }

  /** */
  @property ulong discontWait()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("discont-wait");
  }

  /** */
  @property void discontWait(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("discont-wait", propval);
  }

  /**
      Get `forceLive` property.
      Returns: Causes the element to aggregate on a timeout even when no live source is
        connected to its sinks. See #GstAggregator:min-upstream-latency for a
        companion property: in the vast majority of cases where you plan to plug in
        live sources with a non-zero latency, you should set it to a non-zero value.
  */
  @property bool forceLive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("force-live");
  }

  /**
      Get `ignoreInactivePads` property.
      Returns: Don't wait for inactive pads when live. An inactive pad
        is a pad that hasn't yet received a buffer, but that has
        been waited on at least once.
        
        The purpose of this property is to avoid aggregating on
        timeout when new pads are requested in advance of receiving
        data flow, for example the user may decide to connect it later,
        but wants to configure it already.
  */
  @property bool ignoreInactivePads()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("ignore-inactive-pads");
  }

  /**
      Set `ignoreInactivePads` property.
      Params:
        propval = Don't wait for inactive pads when live. An inactive pad
          is a pad that hasn't yet received a buffer, but that has
          been waited on at least once.
          
          The purpose of this property is to avoid aggregating on
          timeout when new pads are requested in advance of receiving
          data flow, for example the user may decide to connect it later,
          but wants to configure it already.
  */
  @property void ignoreInactivePads(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ignore-inactive-pads", propval);
  }

  /** */
  @property ulong outputBufferDuration()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("output-buffer-duration");
  }

  /** */
  @property void outputBufferDuration(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("output-buffer-duration", propval);
  }

  /** */
  void setSinkCaps(gstaudio.audio_aggregator_pad.AudioAggregatorPad pad, gst.caps.Caps caps)
  {
    gst_audio_aggregator_set_sink_caps(cast(GstAudioAggregator*)this._cPtr, pad ? cast(GstAudioAggregatorPad*)pad._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gstaudio.audio_aggregator.AudioAggregator]
class AudioAggregatorGidBuilderImpl(T) : gstbase.aggregator.AggregatorGidBuilderImpl!T
{

  /** */
  T alignmentThreshold(ulong propval)
  {
    return setProperty("alignment-threshold", propval);
  }

  /** */
  T discontWait(ulong propval)
  {
    return setProperty("discont-wait", propval);
  }

  /**
      Set `forceLive` property.
      Params:
        propval = Causes the element to aggregate on a timeout even when no live source is
          connected to its sinks. See #GstAggregator:min-upstream-latency for a
          companion property: in the vast majority of cases where you plan to plug in
          live sources with a non-zero latency, you should set it to a non-zero value.
      Returns: Builder instance for fluent chaining
  */
  T forceLive(bool propval)
  {
    return setProperty("force-live", propval);
  }

  /**
      Set `ignoreInactivePads` property.
      Params:
        propval = Don't wait for inactive pads when live. An inactive pad
          is a pad that hasn't yet received a buffer, but that has
          been waited on at least once.
          
          The purpose of this property is to avoid aggregating on
          timeout when new pads are requested in advance of receiving
          data flow, for example the user may decide to connect it later,
          but wants to configure it already.
      Returns: Builder instance for fluent chaining
  */
  T ignoreInactivePads(bool propval)
  {
    return setProperty("ignore-inactive-pads", propval);
  }

  /** */
  T outputBufferDuration(ulong propval)
  {
    return setProperty("output-buffer-duration", propval);
  }
}

/// Fluent builder for [gstaudio.audio_aggregator.AudioAggregator]
final class AudioAggregatorGidBuilder : AudioAggregatorGidBuilderImpl!AudioAggregatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioAggregator build()
  {
    return new AudioAggregator(cast(void*)createGObject(AudioAggregator._getGType), No.Take);
  }
}
