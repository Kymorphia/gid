/// Module for [ControlBinding] class
module gid.gst1.control_binding;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.types;

/**
    A base class for value mapping objects that attaches control sources to #GObject
    properties. Such an object is taking one or more #GstControlSource instances,
    combines them and maps the resulting value to the type and value range of the
    bound property.
*/
class ControlBinding : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_control_binding_get_type != &gidSymbolNotFound ? gst_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstControlBinding";
  }

  /** Returns `this`, for use in `with` statements. */
  override ControlBinding self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.control_binding.ControlBinding]
      Returns: New builder object
  */
  static ControlBindingGidBuilder builder() nothrow
  {
    return new ControlBindingGidBuilder;
  }

  /** */
  override @property string name() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("name");
  }

  /** */
  @property gid.gst1.object.ObjectWrap object() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.object.ObjectWrap)("object");
  }

  alias getGValueArray = gid.gst1.object.ObjectWrap.getGValueArray;

  /**
      Gets a number of #GValues for the given controlled property starting at the
      requested time. The array values need to hold enough space for n_values of
      #GValue.
      
      This function is useful if one wants to e.g. draw a graph of the control
      curve or apply a control curve sample by sample.
  
      Params:
        timestamp = the time that should be processed
        interval = the time spacing between subsequent values
        values = array to put control-values in
      Returns: true if the given array could be filled, false otherwise
  */
  bool getGValueArray(gid.gst1.types.ClockTime timestamp, gid.gst1.types.ClockTime interval, gid.gobject2.value.Value[] values) nothrow
  {
    bool _retval;
    uint _nValues;
    if (values)
      _nValues = cast(uint)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    _retval = cast(bool)gst_control_binding_get_g_value_array(cast(GstControlBinding*)this._cPtr, timestamp, interval, _nValues, _values);
    return _retval;
  }

  alias getValue = gid.gst1.object.ObjectWrap.getValue;

  /**
      Gets the value for the given controlled property at the requested time.
  
      Params:
        timestamp = the time the control-change should be read from
      Returns: the GValue of the property at the given time,
        or null if the property isn't controlled.
  */
  gid.gobject2.value.Value getValue(gid.gst1.types.ClockTime timestamp) nothrow
  {
    GValue* _cretval;
    _cretval = gst_control_binding_get_value(cast(GstControlBinding*)this._cPtr, timestamp);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if the control binding is disabled.
      Returns: true if the binding is inactive
  */
  bool isDisabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_control_binding_is_disabled(cast(GstControlBinding*)this._cPtr);
    return _retval;
  }

  /**
      This function is used to disable a control binding for some time, i.e.
      [gid.gst1.object.ObjectWrap.syncValues] will do nothing.
  
      Params:
        disabled = boolean that specifies whether to disable the controller
          or not.
  */
  void setDisabled(bool disabled) nothrow
  {
    gst_control_binding_set_disabled(cast(GstControlBinding*)this._cPtr, disabled);
  }

  alias syncValues = gid.gst1.object.ObjectWrap.syncValues;

  /**
      Sets the property of the object, according to the #GstControlSources that
      handles it and for the given timestamp.
      
      If this function fails, it is most likely the application developers fault.
      Most probably the control sources are not setup correctly.
  
      Params:
        object = the object that has controlled properties
        timestamp = the time that should be processed
        lastSync = the last time this was called
      Returns: true if the controller value could be applied to the object
        property, false otherwise
  */
  bool syncValues(gid.gst1.object.ObjectWrap object, gid.gst1.types.ClockTime timestamp, gid.gst1.types.ClockTime lastSync) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_control_binding_sync_values(cast(GstControlBinding*)this._cPtr, object ? cast(GstObject*)object._cPtr(No.Dup) : null, timestamp, lastSync);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.control_binding.ControlBinding]
class ControlBindingGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  override T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /** */
  T object(gid.gst1.object.ObjectWrap propval) nothrow
  {
    return setProperty("object", propval);
  }
}

/// Fluent builder for [gid.gst1.control_binding.ControlBinding]
final class ControlBindingGidBuilder : ControlBindingGidBuilderImpl!ControlBindingGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ControlBinding build() nothrow
  {
    return new ControlBinding(cast(void*)createGObject(ControlBinding._getGType), Yes.Take);
  }
}
