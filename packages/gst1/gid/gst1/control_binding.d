/// Module for [ControlBinding] class
module gid.gst1.control_binding;

public import gid.core.basictypes;
import gid.core.utils;
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
@gidGir("ControlBinding", "ControlBindingClass")
class ControlBinding : gid.gst1.object.ObjectWrap
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetGValueArray` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGetGValueArray(gid.gst1.types.ClockTime timestamp, gid.gst1.types.ClockTime interval, gid.gobject2.value.Value[] values)
  {
    auto _klass = cast(GstControlBindingClass*)_vfuncClass;
    if (!_klass.getGValueArray)
      return typeof(return).init;

    bool _retval;
    uint _nValues;
    if (values)
      _nValues = cast(uint)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    _retval = cast(bool)_klass.getGValueArray(cast(GstControlBinding*)this._cPtr, timestamp, interval, _nValues, _values);
    return _retval;
  }

  /**
      Gets the value for the given controlled property at the requested time.
  
      Params:
        timestamp = the time the control-change should be read from
      Returns: the GValue of the property at the given time,
        or null if the property isn't controlled.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetValue` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gobject2.value.Value vfuncGetValue(gid.gst1.types.ClockTime timestamp)
  {
    auto _klass = cast(GstControlBindingClass*)_vfuncClass;
    if (!_klass.getValue)
      return typeof(return).init;

    GValue* _cretval;
    _cretval = _klass.getValue(cast(GstControlBinding*)this._cPtr, timestamp);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSyncValues` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSyncValues(gid.gst1.object.ObjectWrap object, gid.gst1.types.ClockTime timestamp, gid.gst1.types.ClockTime lastSync)
  {
    auto _klass = cast(GstControlBindingClass*)_vfuncClass;
    if (!_klass.syncValues)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.syncValues(cast(GstControlBinding*)this._cPtr, object ? cast(GstObject*)object._cPtr(No.Dup) : null, timestamp, lastSync);
    return _retval;
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ControlBinding
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.control_binding.ControlBinding), T.stringof ~ " is not derived from gid.gst1.control_binding.ControlBinding");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetGValueArray", true)[0]) == gid.gst1.control_binding.ControlBinding))
      _installVfunc(klass, "get_g_value_array");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetValue", true)[0]) == gid.gst1.control_binding.ControlBinding))
      _installVfunc(klass, "get_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSyncValues", true)[0]) == gid.gst1.control_binding.ControlBinding))
      _installVfunc(klass, "sync_values");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstControlBindingClass*)klass;

    switch (vfunc)
    {
      case "get_g_value_array":
      {
        static extern(C) gboolean _vfuncGetGValueArrayTramp(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, GValue* values) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.control_binding.ControlBinding)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)binding);
          if (!_obj)
          {
            auto _klass = cast(GstControlBindingClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)binding);
            if (_klass.getGValueArray)
              return (cast(typeof(&_vfuncGetGValueArrayTramp))_klass.getGValueArray)(binding, timestamp, interval, nValues, values);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gobject2.value.Value[] _values;
          _values.length = nValues;
          foreach (i; 0 .. nValues)
            _values[i] = new gid.gobject2.value.Value(cast(GValue*)&values[i], No.Take);

          try
          {
            _dretval = _obj.vfuncGetGValueArray(timestamp, interval, _values);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.control_binding.ControlBinding.vfuncGetGValueArray");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getGValueArray = cast(typeof(_klass.getGValueArray))&_vfuncGetGValueArrayTramp;
        break;
      }
      case "get_value":
      {
        static extern(C) GValue* _vfuncGetValueTramp(GstControlBinding* binding, GstClockTime timestamp) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.control_binding.ControlBinding)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)binding);
          if (!_obj)
          {
            auto _klass = cast(GstControlBindingClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)binding);
            if (_klass.getValue)
              return (cast(typeof(&_vfuncGetValueTramp))_klass.getValue)(binding, timestamp);
            return typeof(return).init;
          }

          gid.gobject2.value.Value _dretval;

          try
          {
            _dretval = _obj.vfuncGetValue(timestamp);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.control_binding.ControlBinding.vfuncGetValue");
          }
          auto _retval = _dretval ? cast(GValue*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getValue = cast(typeof(_klass.getValue))&_vfuncGetValueTramp;
        break;
      }
      case "sync_values":
      {
        static extern(C) gboolean _vfuncSyncValuesTramp(GstControlBinding* binding, GstObject* object, GstClockTime timestamp, GstClockTime lastSync) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.control_binding.ControlBinding)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)binding);
          if (!_obj)
          {
            auto _klass = cast(GstControlBindingClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)binding);
            if (_klass.syncValues)
              return (cast(typeof(&_vfuncSyncValuesTramp))_klass.syncValues)(binding, object, timestamp, lastSync);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSyncValues(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)object, No.Take), timestamp, lastSync);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.control_binding.ControlBinding.vfuncSyncValues");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.syncValues = cast(typeof(_klass.syncValues))&_vfuncSyncValuesTramp;
        break;
      }
      default:
      break;
    }
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
