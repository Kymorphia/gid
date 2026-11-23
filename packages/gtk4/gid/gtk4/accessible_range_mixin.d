/// Module for [AccessibleRange] interface mixin
module gid.gtk4.accessible_range_mixin;

public import gid.core.basictypes;
public import gid.gtk4.accessible_range_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for accessible objects containing a numeric value.
    
    [gid.gtk4.accessible_range.AccessibleRange] describes ranged controls for Assistive Technologies.
    
    Ranged controls have a single value within an allowed range that can
    optionally be changed by the user.
    
    This interface is expected to be implemented by controls using the
    following roles:
    
    - [gid.gtk4.types.AccessibleRole.Meter]
    - [gid.gtk4.types.AccessibleRole.ProgressBar]
    - [gid.gtk4.types.AccessibleRole.Scrollbar]
    - [gid.gtk4.types.AccessibleRole.Slider]
    - [gid.gtk4.types.AccessibleRole.SpinButton]
    
    If that is not the case, a warning will be issued at run time.
    
    In addition to this interface, its implementers are expected to provide the
    correct values for the following properties:
    
    - [gid.gtk4.types.AccessibleProperty.ValueMax]
    - [gid.gtk4.types.AccessibleProperty.ValueMin]
    - [gid.gtk4.types.AccessibleProperty.ValueNow]
    - [gid.gtk4.types.AccessibleProperty.ValueText]
*/
template AccessibleRangeT()
{

  /**
      Sets the current value of the accessible range.
      
      This operation should behave similarly as if the user performed the
      action.
  
      Params:
        value = the value to set
      Returns: true if the operation was performed, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCurrentValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetCurrentValue(double value)
  {
    auto _klass = cast(GtkAccessibleRangeInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_range.AccessibleRange._getGType);
    if (!_klass || !_klass.setCurrentValue)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCurrentValue(cast(GtkAccessibleRange*)this._cPtr, value);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.accessible_range.AccessibleRange (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_accessible_range_AccessibleRange(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCurrentValue", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.accessible_range.AccessibleRange vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_accessible_range_AccessibleRange(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCurrentValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_range_AccessibleRange(iface, "set_current_value");
  }

  private static void _installIfaceVfunc_gid_gtk4_accessible_range_AccessibleRange(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkAccessibleRangeInterface*)iface;

    switch (vfunc)
    {
      case "set_current_value":
      {
        static extern(C) gboolean _vfuncSetCurrentValueTramp(GtkAccessibleRange* self, double value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleRangeInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_range.AccessibleRange._getGType);
            if (_klass && _klass.setCurrentValue)
              return (cast(typeof(&_vfuncSetCurrentValueTramp))_klass.setCurrentValue)(self, value);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetCurrentValue(value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_range.AccessibleRange.vfuncSetCurrentValue");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setCurrentValue = cast(typeof(_klass.setCurrentValue))&_vfuncSetCurrentValueTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.accessible_range.AccessibleRange]
template AccessibleRangeGidBuilderT()
{
}
