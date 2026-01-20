/// Module for [LFOControlSource] class
module gstcontroller.lfocontrol_source;

import gid.gid;
import gobject.object;
import gst.control_source;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    #GstLFOControlSource is a #GstControlSource, that provides several periodic
    waveforms as control values.
    
    To use #GstLFOControlSource get a new instance by calling
    [gstcontroller.lfocontrol_source.LFOControlSource.new_], bind it to a #GParamSpec and set the relevant
    properties.
    
    All functions are MT-safe.
*/
class LFOControlSource : gst.control_source.ControlSource
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
    return cast(void function())gst_lfo_control_source_get_type != &gidSymbolNotFound ? gst_lfo_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LFOControlSource self()
  {
    return this;
  }

  /**
      Get `amplitude` property.
      Returns: Specifies the amplitude for the waveform of this #GstLFOControlSource.
  */
  @property double amplitude()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("amplitude");
  }

  /**
      Set `amplitude` property.
      Params:
        propval = Specifies the amplitude for the waveform of this #GstLFOControlSource.
  */
  @property void amplitude(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("amplitude", propval);
  }

  /**
      Get `frequency` property.
      Returns: Specifies the frequency that should be used for the waveform
        of this #GstLFOControlSource. It should be large enough
        so that the period is longer than one nanosecond.
  */
  @property double frequency()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("frequency");
  }

  /**
      Set `frequency` property.
      Params:
        propval = Specifies the frequency that should be used for the waveform
          of this #GstLFOControlSource. It should be large enough
          so that the period is longer than one nanosecond.
  */
  @property void frequency(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("frequency", propval);
  }

  /**
      Get `offset` property.
      Returns: Specifies the value offset for the waveform of this #GstLFOControlSource.
  */
  @property double offset()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("offset");
  }

  /**
      Set `offset` property.
      Params:
        propval = Specifies the value offset for the waveform of this #GstLFOControlSource.
  */
  @property void offset(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("offset", propval);
  }

  /**
      Get `timeshift` property.
      Returns: Specifies the timeshift to the right that should be used for the waveform
        of this #GstLFOControlSource in nanoseconds.
        
        To get a n nanosecond shift to the left use
        "(GST_SECOND / frequency) - n".
  */
  @property ulong timeshift()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("timeshift");
  }

  /**
      Set `timeshift` property.
      Params:
        propval = Specifies the timeshift to the right that should be used for the waveform
          of this #GstLFOControlSource in nanoseconds.
          
          To get a n nanosecond shift to the left use
          "(GST_SECOND / frequency) - n".
  */
  @property void timeshift(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("timeshift", propval);
  }

  /**
      Get `waveform` property.
      Returns: Specifies the waveform that should be used for this #GstLFOControlSource.
  */
  @property gstcontroller.types.LFOWaveform waveform()
  {
    return gobject.object.ObjectWrap.getProperty!(gstcontroller.types.LFOWaveform)("waveform");
  }

  /**
      Set `waveform` property.
      Params:
        propval = Specifies the waveform that should be used for this #GstLFOControlSource.
  */
  @property void waveform(gstcontroller.types.LFOWaveform propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstcontroller.types.LFOWaveform)("waveform", propval);
  }

  /**
      This returns a new, unbound #GstLFOControlSource.
      Returns: a new, unbound #GstLFOControlSource.
  */
  this()
  {
    GstControlSource* _cretval;
    _cretval = gst_lfo_control_source_new();
    this(_cretval, Yes.Take);
  }
}
