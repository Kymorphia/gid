/// Module for [AudioAggregator] class
module gstaudio.audio_aggregator;

import gid.gid;
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
    $(LIST
      * "offset"  G_TYPE_UINT64   Offset in samples since segment start
        for the position that is next to be filled in the output buffer.
      * "frames"  G_TYPE_UINT   Number of frames per output buffer.
    )
      
    In addition the [gstbase.aggregator.Aggregator.peekNextSample] function returns
    additional information in the info #GstStructure of the returned sample:
    $(LIST
      * "output-offset"  G_TYPE_UINT64   Sample offset in output segment relative to
        the output segment's start where the current position of this input
        buffer would be placed
      * "position"  G_TYPE_UINT   current position in the input buffer in samples
      * "size"  G_TYPE_UINT   size of the input buffer in samples
    )
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
