/// Module for [ControlSource] class
module gid.gst1.control_source;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.types;

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
    These are then used by [gid.gst1.control_source.ControlSource.controlSourceGetValue] and
    [gid.gst1.control_source.ControlSource.controlSourceGetValueArray] to get values for specific timestamps.
*/
class ControlSource : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_control_source_get_type != &gidSymbolNotFound ? gst_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstControlSource";
  }

  /** Returns `this`, for use in `with` statements. */
  override ControlSource self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.control_source.ControlSource]
      Returns: New builder object
  */
  static ControlSourceGidBuilder builder() nothrow
  {
    return new ControlSourceGidBuilder;
  }

  /**
      Gets the value for this #GstControlSource at a given timestamp.
  
      Params:
        timestamp = the time for which the value should be returned
        value = the value
      Returns: false if the value couldn't be returned, true otherwise.
  */
  bool controlSourceGetValue(gid.gst1.types.ClockTime timestamp, out double value) nothrow
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
  bool controlSourceGetValueArray(gid.gst1.types.ClockTime timestamp, gid.gst1.types.ClockTime interval, double[] values) nothrow
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

/// Fluent builder implementation template for [gid.gst1.control_source.ControlSource]
class ControlSourceGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.control_source.ControlSource]
final class ControlSourceGidBuilder : ControlSourceGidBuilderImpl!ControlSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ControlSource build() nothrow
  {
    return new ControlSource(cast(void*)createGObject(ControlSource._getGType), Yes.Take);
  }
}
