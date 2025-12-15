/// Module for [ControlSource] class
module gst.control_source;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.types;

/**
    The #GstControlSource is a base class for control value sources that could
    be used to get timestamp-value pairs. A control source essentially is a
    function over time.
    
    A #GstControlSource is used by first getting an instance of a specific
    control-source, creating a binding for the control-source to the target property
    of the element and then adding the binding to the element. The binding will
    convert the data types and value range to fit to the bound property.
    
    For implementing a new #GstControlSource one has to implement
    #GstControlSourceGetValue and #GstControlSourceGetValueArray functions.
    These are then used by [gst.control_source.ControlSource.controlSourceGetValue] and
    [gst.control_source.ControlSource.controlSourceGetValueArray] to get values for specific timestamps.
*/
class ControlSource : gst.object.ObjectWrap
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
    return cast(void function())gst_control_source_get_type != &gidSymbolNotFound ? gst_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ControlSource self()
  {
    return this;
  }

  /**
      Gets the value for this #GstControlSource at a given timestamp.
  
      Params:
        timestamp = the time for which the value should be returned
        value = the value
      Returns: false if the value couldn't be returned, true otherwise.
  */
  bool controlSourceGetValue(gst.types.ClockTime timestamp, out double value)
  {
    bool _retval;
    _retval = cast(bool)gst_control_source_get_value(cast(GstControlSource*)this._cPtr, timestamp, cast(double*)&value);
    return _retval;
  }

  /**
      Gets an array of values for for this #GstControlSource. Values that are
      undefined contain NANs.
  
      Params:
        timestamp = the first timestamp
        interval = the time steps
        values = array to put control-values in
      Returns: true if the given array could be filled, false otherwise
  */
  bool controlSourceGetValueArray(gst.types.ClockTime timestamp, gst.types.ClockTime interval, double[] values)
  {
    bool _retval;
    uint _nValues;
    if (values)
      _nValues = cast(uint)values.length;

    auto _values = cast(double*)values.ptr;
    _retval = cast(bool)gst_control_source_get_value_array(cast(GstControlSource*)this._cPtr, timestamp, interval, _nValues, _values);
    return _retval;
  }
}
