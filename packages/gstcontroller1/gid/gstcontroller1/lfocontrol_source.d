/// Module for [LFOControlSource] class
module gid.gstcontroller1.lfocontrol_source;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.control_source;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.types;

/**
    #GstLFOControlSource is a #GstControlSource, that provides several periodic
    waveforms as control values.
    
    To use #GstLFOControlSource get a new instance by calling
    [gid.gstcontroller1.lfocontrol_source.LFOControlSource.new_], bind it to a #GParamSpec and set the relevant
    properties.
    
    All functions are MT-safe.
*/
class LFOControlSource : gid.gst1.control_source.ControlSource
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
    return cast(void function())gst_lfo_control_source_get_type != &gidSymbolNotFound ? gst_lfo_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstLFOControlSource";
  }

  /** Returns `this`, for use in `with` statements. */
  override LFOControlSource self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstcontroller1.lfocontrol_source.LFOControlSource]
      Returns: New builder object
  */
  static LFOControlSourceGidBuilder builder() nothrow
  {
    return new LFOControlSourceGidBuilder;
  }

  /**
      Get `amplitude` property.
      Returns: Specifies the amplitude for the waveform of this #GstLFOControlSource.
  */
  @property double amplitude() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("amplitude");
  }

  /**
      Set `amplitude` property.
      Params:
        propval = Specifies the amplitude for the waveform of this #GstLFOControlSource.
  */
  @property void amplitude(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("amplitude", propval);
  }

  /**
      Get `frequency` property.
      Returns: Specifies the frequency that should be used for the waveform
        of this #GstLFOControlSource. It should be large enough
        so that the period is longer than one nanosecond.
  */
  @property double frequency() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("frequency");
  }

  /**
      Set `frequency` property.
      Params:
        propval = Specifies the frequency that should be used for the waveform
          of this #GstLFOControlSource. It should be large enough
          so that the period is longer than one nanosecond.
  */
  @property void frequency(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("frequency", propval);
  }

  /**
      Get `offset` property.
      Returns: Specifies the value offset for the waveform of this #GstLFOControlSource.
  */
  @property double offset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("offset");
  }

  /**
      Set `offset` property.
      Params:
        propval = Specifies the value offset for the waveform of this #GstLFOControlSource.
  */
  @property void offset(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("offset", propval);
  }

  /**
      Get `timeshift` property.
      Returns: Specifies the timeshift to the right that should be used for the waveform
        of this #GstLFOControlSource in nanoseconds.
        
        To get a n nanosecond shift to the left use
        "(GST_SECOND / frequency) - n".
  */
  @property ulong timeshift() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("timeshift");
  }

  /**
      Set `timeshift` property.
      Params:
        propval = Specifies the timeshift to the right that should be used for the waveform
          of this #GstLFOControlSource in nanoseconds.
          
          To get a n nanosecond shift to the left use
          "(GST_SECOND / frequency) - n".
  */
  @property void timeshift(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("timeshift", propval);
  }

  /**
      Get `waveform` property.
      Returns: Specifies the waveform that should be used for this #GstLFOControlSource.
  */
  @property gid.gstcontroller1.types.LFOWaveform waveform() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstcontroller1.types.LFOWaveform)("waveform");
  }

  /**
      Set `waveform` property.
      Params:
        propval = Specifies the waveform that should be used for this #GstLFOControlSource.
  */
  @property void waveform(gid.gstcontroller1.types.LFOWaveform propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstcontroller1.types.LFOWaveform)("waveform", propval);
  }

  /**
      This returns a new, unbound #GstLFOControlSource.
      Returns: a new, unbound #GstLFOControlSource.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstControlSource* _cretval;
      _cretval = gst_lfo_control_source_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstcontroller1.lfocontrol_source.LFOControlSource]
class LFOControlSourceGidBuilderImpl(T) : gid.gst1.control_source.ControlSourceGidBuilderImpl!T
{

  /**
      Set `amplitude` property.
      Params:
        propval = Specifies the amplitude for the waveform of this #GstLFOControlSource.
      Returns: Builder instance for fluent chaining
  */
  T amplitude(double propval) nothrow
  {
    return setProperty("amplitude", propval);
  }

  /**
      Set `frequency` property.
      Params:
        propval = Specifies the frequency that should be used for the waveform
          of this #GstLFOControlSource. It should be large enough
          so that the period is longer than one nanosecond.
      Returns: Builder instance for fluent chaining
  */
  T frequency(double propval) nothrow
  {
    return setProperty("frequency", propval);
  }

  /**
      Set `offset` property.
      Params:
        propval = Specifies the value offset for the waveform of this #GstLFOControlSource.
      Returns: Builder instance for fluent chaining
  */
  T offset(double propval) nothrow
  {
    return setProperty("offset", propval);
  }

  /**
      Set `timeshift` property.
      Params:
        propval = Specifies the timeshift to the right that should be used for the waveform
          of this #GstLFOControlSource in nanoseconds.
          
          To get a n nanosecond shift to the left use
          "(GST_SECOND / frequency) - n".
      Returns: Builder instance for fluent chaining
  */
  T timeshift(ulong propval) nothrow
  {
    return setProperty("timeshift", propval);
  }

  /**
      Set `waveform` property.
      Params:
        propval = Specifies the waveform that should be used for this #GstLFOControlSource.
      Returns: Builder instance for fluent chaining
  */
  T waveform(gid.gstcontroller1.types.LFOWaveform propval) nothrow
  {
    return setProperty("waveform", propval);
  }
}

/// Fluent builder for [gid.gstcontroller1.lfocontrol_source.LFOControlSource]
final class LFOControlSourceGidBuilder : LFOControlSourceGidBuilderImpl!LFOControlSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LFOControlSource build() nothrow
  {
    return new LFOControlSource(cast(void*)createGObject(LFOControlSource._getGType), Yes.Take);
  }
}
