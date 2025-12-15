/// Module for [ControlBinding] class
module gst.control_binding;

import gid.gid;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.types;

/**
    A base class for value mapping objects that attaches control sources to #GObject
    properties. Such an object is taking one or more #GstControlSource instances,
    combines them and maps the resulting value to the type and value range of the
    bound property.
*/
class ControlBinding : gst.object.ObjectWrap
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
    return cast(void function())gst_control_binding_get_type != &gidSymbolNotFound ? gst_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ControlBinding self()
  {
    return this;
  }

  alias getGValueArray = gst.object.ObjectWrap.getGValueArray;

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
  bool getGValueArray(gst.types.ClockTime timestamp, gst.types.ClockTime interval, gobject.value.Value[] values)
  {
    bool _retval;
    uint _nValues;
    if (values)
      _nValues = cast(uint)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj._cPtr;
    GValue* _values = _tmpvalues.ptr;
    _retval = cast(bool)gst_control_binding_get_g_value_array(cast(GstControlBinding*)this._cPtr, timestamp, interval, _nValues, _values);
    return _retval;
  }

  alias getValue = gst.object.ObjectWrap.getValue;

  /**
      Gets the value for the given controlled property at the requested time.
  
      Params:
        timestamp = the time the control-change should be read from
      Returns: the GValue of the property at the given time,
        or null if the property isn't controlled.
  */
  gobject.value.Value getValue(gst.types.ClockTime timestamp)
  {
    GValue* _cretval;
    _cretval = gst_control_binding_get_value(cast(GstControlBinding*)this._cPtr, timestamp);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if the control binding is disabled.
      Returns: true if the binding is inactive
  */
  bool isDisabled()
  {
    bool _retval;
    _retval = cast(bool)gst_control_binding_is_disabled(cast(GstControlBinding*)this._cPtr);
    return _retval;
  }

  /**
      This function is used to disable a control binding for some time, i.e.
      [gst.object.ObjectWrap.syncValues] will do nothing.
  
      Params:
        disabled = boolean that specifies whether to disable the controller
          or not.
  */
  void setDisabled(bool disabled)
  {
    gst_control_binding_set_disabled(cast(GstControlBinding*)this._cPtr, disabled);
  }

  alias syncValues = gst.object.ObjectWrap.syncValues;

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
  bool syncValues(gst.object.ObjectWrap object, gst.types.ClockTime timestamp, gst.types.ClockTime lastSync)
  {
    bool _retval;
    _retval = cast(bool)gst_control_binding_sync_values(cast(GstControlBinding*)this._cPtr, object ? cast(GstObject*)object._cPtr(No.Dup) : null, timestamp, lastSync);
    return _retval;
  }
}
