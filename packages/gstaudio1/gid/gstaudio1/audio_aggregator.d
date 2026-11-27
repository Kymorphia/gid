/// Module for [AudioAggregator] class
module gid.gstaudio1.audio_aggregator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gstaudio1.audio_aggregator_pad;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.aggregator;

import gid.gst1.types;

/**
    Subclasses must use (a subclass of) #GstAudioAggregatorPad for both
    their source and sink pads,
    [gid.gst1.element_class.ElementClass.addStaticPadTemplateWithGtype] is a convenient
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
    
    In addition the [gid.gstbase1.aggregator.Aggregator.peekNextSample] function returns
    additional information in the info #GstStructure of the returned sample:
    - "output-offset"  G_TYPE_UINT64   Sample offset in output segment relative to
      the output segment's start where the current position of this input
      buffer would be placed
    - "position"  G_TYPE_UINT   current position in the input buffer in samples
    - "size"  G_TYPE_UINT   size of the input buffer in samples
*/
@gidGir("AudioAggregator", "AudioAggregatorClass")
class AudioAggregator : gid.gstbase1.aggregator.Aggregator
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_aggregator_get_type != &gidSymbolNotFound ? gst_audio_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioAggregator";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioAggregator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_aggregator.AudioAggregator]
      Returns: New builder object
  */
  static AudioAggregatorGidBuilder builder() nothrow
  {
    return new AudioAggregatorGidBuilder;
  }

  /** */
  @property ulong alignmentThreshold() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("alignment-threshold");
  }

  /** */
  @property void alignmentThreshold(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("alignment-threshold", propval);
  }

  /** */
  @property ulong discontWait() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("discont-wait");
  }

  /** */
  @property void discontWait(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("discont-wait", propval);
  }

  /**
      Get `forceLive` property.
      Returns: Causes the element to aggregate on a timeout even when no live source is
        connected to its sinks. See #GstAggregator:min-upstream-latency for a
        companion property: in the vast majority of cases where you plan to plug in
        live sources with a non-zero latency, you should set it to a non-zero value.
  */
  @property bool forceLive() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("force-live");
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
  @property bool ignoreInactivePads() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("ignore-inactive-pads");
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
  @property void ignoreInactivePads(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("ignore-inactive-pads", propval);
  }

  /** */
  @property ulong outputBufferDuration() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("output-buffer-duration");
  }

  /** */
  @property void outputBufferDuration(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("output-buffer-duration", propval);
  }

  /**
  Get `outputBufferDurationFraction` property.
  Returns: Output block size in nanoseconds, expressed as a fraction.
  */
  @property gid.gst1.types.Fraction outputBufferDurationFraction() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.types.Fraction)("output-buffer-duration-fraction");
  }

  /**
  Set `outputBufferDurationFraction` property.
  Params:
  propval = Output block size in nanoseconds, expressed as a fraction.
  */
  @property void outputBufferDurationFraction(gid.gst1.types.Fraction propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.types.Fraction)("output-buffer-duration-fraction", propval);
  }


  /**
      Aggregates one input buffer to the output
       buffer.  The in_offset and out_offset are in "frames", which is
       the size of a sample times the number of channels. Returns TRUE if
       any non-silence was added to the buffer
  
      Params:
        pad = 
        inbuf =  (modified in place, changes are seen by the caller)
        inOffset = 
        outbuf =  (modified in place, changes are seen by the caller)
        outOffset = 
        numFrames = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAggregateOneBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAggregateOneBuffer(gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad pad, gid.gst1.buffer.Buffer inbuf, uint inOffset, gid.gst1.buffer.Buffer outbuf, uint outOffset, uint numFrames)
  {
    auto _klass = cast(GstAudioAggregatorClass*)_vfuncClass;
    if (!_klass.aggregateOneBuffer)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.aggregateOneBuffer(cast(GstAudioAggregator*)this._cPtr, pad ? cast(GstAudioAggregatorPad*)pad._cPtr(No.Dup) : null, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null, inOffset, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null, outOffset, numFrames);
    return _retval;
  }

  /**
      Create a new output buffer contains num_frames frames.
  
      Params:
        numFrames = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateOutputBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncCreateOutputBuffer(uint numFrames)
  {
    auto _klass = cast(GstAudioAggregatorClass*)_vfuncClass;
    if (!_klass.createOutputBuffer)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.createOutputBuffer(cast(GstAudioAggregator*)this._cPtr, numFrames);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void setSinkCaps(gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad pad, gid.gst1.caps.Caps caps) nothrow
  {
    gst_audio_aggregator_set_sink_caps(cast(GstAudioAggregator*)this._cPtr, pad ? cast(GstAudioAggregatorPad*)pad._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioAggregator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_aggregator.AudioAggregator), T.stringof ~ " is not derived from gid.gstaudio1.audio_aggregator.AudioAggregator");

    gid.gstbase1.aggregator.Aggregator._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAggregateOneBuffer", true)[0]) == gid.gstaudio1.audio_aggregator.AudioAggregator))
      _installVfunc(klass, "aggregate_one_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateOutputBuffer", true)[0]) == gid.gstaudio1.audio_aggregator.AudioAggregator))
      _installVfunc(klass, "create_output_buffer");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioAggregatorClass*)klass;

    switch (vfunc)
    {
      case "aggregate_one_buffer":
      {
        static extern(C) gboolean _vfuncAggregateOneBufferTramp(GstAudioAggregator* aagg, GstAudioAggregatorPad* pad, GstBuffer* inbuf, uint inOffset, GstBuffer* outbuf, uint outOffset, uint numFrames) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_aggregator.AudioAggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aagg);
          if (!_obj)
          {
            auto _klass = cast(GstAudioAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aagg);
            if (_klass.aggregateOneBuffer)
              return (cast(typeof(&_vfuncAggregateOneBufferTramp))_klass.aggregateOneBuffer)(aagg, pad, inbuf, inOffset, outbuf, outOffset, numFrames);
            return typeof(return).init;
          }

          bool _dretval;
          auto _inbuf = inbuf ? new gid.gst1.buffer.Buffer(cast(void*)inbuf, Yes.Take)._cBorrow : null;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncAggregateOneBuffer(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad)(cast(void*)pad, No.Take), _inbuf, inOffset, _outbuf, outOffset, numFrames);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_aggregator.AudioAggregator.vfuncAggregateOneBuffer");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_inbuf)
            _inbuf._cUnborrow;
          if (_outbuf)
            _outbuf._cUnborrow;

          return _retval;
        }

        _klass.aggregateOneBuffer = cast(typeof(_klass.aggregateOneBuffer))&_vfuncAggregateOneBufferTramp;
        break;
      }
      case "create_output_buffer":
      {
        static extern(C) GstBuffer* _vfuncCreateOutputBufferTramp(GstAudioAggregator* aagg, uint numFrames) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_aggregator.AudioAggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aagg);
          if (!_obj)
          {
            auto _klass = cast(GstAudioAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aagg);
            if (_klass.createOutputBuffer)
              return (cast(typeof(&_vfuncCreateOutputBufferTramp))_klass.createOutputBuffer)(aagg, numFrames);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;

          try
          {
            _dretval = _obj.vfuncCreateOutputBuffer(numFrames);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_aggregator.AudioAggregator.vfuncCreateOutputBuffer");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createOutputBuffer = cast(typeof(_klass.createOutputBuffer))&_vfuncCreateOutputBufferTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_aggregator.AudioAggregator]
class AudioAggregatorGidBuilderImpl(T) : gid.gstbase1.aggregator.AggregatorGidBuilderImpl!T
{

  /**
  Set `outputBufferDurationFraction` property.
  Params:
  propval = Output block size in nanoseconds, expressed as a fraction.
  Returns: Builder instance for fluent chaining
  */
  T outputBufferDurationFraction(gid.gst1.types.Fraction propval) nothrow
  {
    return setProperty("output-buffer-duration-fraction", propval);
  }

  /** */
  T alignmentThreshold(ulong propval) nothrow
  {
    return setProperty("alignment-threshold", propval);
  }

  /** */
  T discontWait(ulong propval) nothrow
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
  T forceLive(bool propval) nothrow
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
  T ignoreInactivePads(bool propval) nothrow
  {
    return setProperty("ignore-inactive-pads", propval);
  }

  /** */
  T outputBufferDuration(ulong propval) nothrow
  {
    return setProperty("output-buffer-duration", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_aggregator.AudioAggregator]
final class AudioAggregatorGidBuilder : AudioAggregatorGidBuilderImpl!AudioAggregatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioAggregator build() nothrow
  {
    return new AudioAggregator(cast(void*)createGObject(AudioAggregator._getGType), Yes.Take);
  }
}
