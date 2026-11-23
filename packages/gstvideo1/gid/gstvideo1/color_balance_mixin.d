/// Module for [ColorBalance] interface mixin
module gid.gstvideo1.color_balance_mixin;

public import gid.core.basictypes;
public import gid.gstvideo1.color_balance_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gstvideo1.c.functions;
public import gid.gstvideo1.c.types;
public import gid.gstvideo1.color_balance_channel;
public import gid.gstvideo1.types;

/**
    This interface is implemented by elements which can perform some color
    balance operation on video frames they process. For example, modifying
    the brightness, contrast, hue or saturation.
    
    Example elements are 'xvimagesink' and 'colorbalance'
*/
template ColorBalanceT()
{

  /**
      Get the #GstColorBalanceType of this implementation.
      Returns: A the #GstColorBalanceType.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetBalanceType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstvideo1.types.ColorBalanceType vfuncGetBalanceType()
  {
    auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.color_balance.ColorBalance._getGType);
    if (!_klass || !_klass.getBalanceType)
      return typeof(return).init;

    GstColorBalanceType _cretval;
    _cretval = _klass.getBalanceType(cast(GstColorBalance*)this._cPtr);
    gid.gstvideo1.types.ColorBalanceType _retval = cast(gid.gstvideo1.types.ColorBalanceType)_cretval;
    return _retval;
  }

  /**
      Retrieve the current value of the indicated channel, between min_value
      and max_value.
      
      See Also: The #GstColorBalanceChannel.min_value and
              #GstColorBalanceChannel.max_value members of the
              #GstColorBalanceChannel object.
  
      Params:
        channel = A #GstColorBalanceChannel instance
      Returns: The current value of the channel.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetValue(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel)
  {
    auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.color_balance.ColorBalance._getGType);
    if (!_klass || !_klass.getValue)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getValue(cast(GstColorBalance*)this._cPtr, channel ? cast(GstColorBalanceChannel*)channel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieve a list of the available channels.
      Returns: A
                 GList containing pointers to #GstColorBalanceChannel
                 objects. The list is owned by the #GstColorBalance
                 instance and must not be freed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncListChannels`
      to chain up from an override.
      Overriding it from D is not supported (callback return container type 'List' ownership 'None' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstvideo1.color_balance_channel.ColorBalanceChannel[] vfuncListChannels()
  {
    auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.color_balance.ColorBalance._getGType);
    if (!_klass || !_klass.listChannels)
      return typeof(return).init;

    const(GList)* _cretval;
    _cretval = _klass.listChannels(cast(GstColorBalance*)this._cPtr);
    auto _retval = gListToD!(gid.gstvideo1.color_balance_channel.ColorBalanceChannel, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the current value of the channel to the passed value, which must
      be between min_value and max_value.
      
      See Also: The #GstColorBalanceChannel.min_value and
              #GstColorBalanceChannel.max_value members of the
              #GstColorBalanceChannel object.
  
      Params:
        channel = A #GstColorBalanceChannel instance
        value = The new value for the channel.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetValue(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel, int value)
  {
    auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.color_balance.ColorBalance._getGType);
    if (!_klass || !_klass.setValue)
      return;

    _klass.setValue(cast(GstColorBalance*)this._cPtr, channel ? cast(GstColorBalanceChannel*)channel._cPtr(No.Dup) : null, value);
  }

  /**
      A helper function called by implementations of the GstColorBalance
      interface. It fires the #GstColorBalance::value-changed signal on the
      instance, and the #GstColorBalanceChannel::value-changed signal on the
      channel object.
  
      Params:
        channel = A #GstColorBalanceChannel whose value has changed
        value = The new value of the channel
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncValueChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncValueChanged(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel, int value)
  {
    auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.color_balance.ColorBalance._getGType);
    if (!_klass || !_klass.valueChanged)
      return;

    _klass.valueChanged(cast(GstColorBalance*)this._cPtr, channel ? cast(GstColorBalanceChannel*)channel._cPtr(No.Dup) : null, value);
  }

  /**
      Get the #GstColorBalanceType of this implementation.
      Returns: A the #GstColorBalanceType.
  */
  override gid.gstvideo1.types.ColorBalanceType getBalanceType() nothrow
  {
    GstColorBalanceType _cretval;
    _cretval = gst_color_balance_get_balance_type(cast(GstColorBalance*)this._cPtr);
    gid.gstvideo1.types.ColorBalanceType _retval = cast(gid.gstvideo1.types.ColorBalanceType)_cretval;
    return _retval;
  }

  /**
      Retrieve the current value of the indicated channel, between min_value
      and max_value.
      
      See Also: The #GstColorBalanceChannel.min_value and
              #GstColorBalanceChannel.max_value members of the
              #GstColorBalanceChannel object.
  
      Params:
        channel = A #GstColorBalanceChannel instance
      Returns: The current value of the channel.
  */
  override int getValue(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel) nothrow
  {
    int _retval;
    _retval = gst_color_balance_get_value(cast(GstColorBalance*)this._cPtr, channel ? cast(GstColorBalanceChannel*)channel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieve a list of the available channels.
      Returns: A
                 GList containing pointers to #GstColorBalanceChannel
                 objects. The list is owned by the #GstColorBalance
                 instance and must not be freed.
  */
  override gid.gstvideo1.color_balance_channel.ColorBalanceChannel[] listChannels() nothrow
  {
    const(GList)* _cretval;
    _cretval = gst_color_balance_list_channels(cast(GstColorBalance*)this._cPtr);
    auto _retval = gListToD!(gid.gstvideo1.color_balance_channel.ColorBalanceChannel, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the current value of the channel to the passed value, which must
      be between min_value and max_value.
      
      See Also: The #GstColorBalanceChannel.min_value and
              #GstColorBalanceChannel.max_value members of the
              #GstColorBalanceChannel object.
  
      Params:
        channel = A #GstColorBalanceChannel instance
        value = The new value for the channel.
  */
  override void setValue(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel, int value) nothrow
  {
    gst_color_balance_set_value(cast(GstColorBalance*)this._cPtr, channel ? cast(GstColorBalanceChannel*)channel._cPtr(No.Dup) : null, value);
  }

  /**
      A helper function called by implementations of the GstColorBalance
      interface. It fires the #GstColorBalance::value-changed signal on the
      instance, and the #GstColorBalanceChannel::value-changed signal on the
      channel object.
  
      Params:
        channel = A #GstColorBalanceChannel whose value has changed
        value = The new value of the channel
  */
  override void valueChanged(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel, int value) nothrow
  {
    gst_color_balance_value_changed(cast(GstColorBalance*)this._cPtr, channel ? cast(GstColorBalanceChannel*)channel._cPtr(No.Dup) : null, value);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Fired when the value of the indicated channel has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstvideo1.color_balance_channel.ColorBalanceChannel channel, int value, gid.gstvideo1.color_balance.ColorBalance colorBalance)`
  
          `channel` The #GstColorBalanceChannel (optional)
  
          `value` The new value (optional)
  
          `colorBalance` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstvideo1.color_balance_channel.ColorBalanceChannel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gstvideo1.color_balance.ColorBalance)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance.ColorBalance.valueChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gstvideo1.color_balance.ColorBalance (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gstvideo1_color_balance_ColorBalance(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBalanceType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListChannels", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncValueChanged", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gstvideo1.color_balance.ColorBalance vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gstvideo1_color_balance_ColorBalance(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBalanceType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_color_balance_ColorBalance(iface, "get_balance_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_color_balance_ColorBalance(iface, "get_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListChannels", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gstvideo1.color_balance.ColorBalance.vfuncListChannels is not supported: callback return container type 'List' ownership 'None' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_color_balance_ColorBalance(iface, "set_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncValueChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_color_balance_ColorBalance(iface, "value_changed");
  }

  private static void _installIfaceVfunc_gid_gstvideo1_color_balance_ColorBalance(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstColorBalanceInterface*)iface;

    switch (vfunc)
    {
      case "get_balance_type":
      {
        static extern(C) GstColorBalanceType _vfuncGetBalanceTypeTramp(GstColorBalance* balance) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)balance);
          if (!_obj)
          {
            auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)balance), gid.gstvideo1.color_balance.ColorBalance._getGType);
            if (_klass && _klass.getBalanceType)
              return (cast(typeof(&_vfuncGetBalanceTypeTramp))_klass.getBalanceType)(balance);
            return typeof(return).init;
          }

          gid.gstvideo1.types.ColorBalanceType _dretval;

          try
          {
            _dretval = _obj.vfuncGetBalanceType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance.ColorBalance.vfuncGetBalanceType");
          }
          auto _retval = cast(GstColorBalanceType)_dretval;

          return _retval;
        }

        _klass.getBalanceType = cast(typeof(_klass.getBalanceType))&_vfuncGetBalanceTypeTramp;
        break;
      }
      case "get_value":
      {
        static extern(C) int _vfuncGetValueTramp(GstColorBalance* balance, GstColorBalanceChannel* channel) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)balance);
          if (!_obj)
          {
            auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)balance), gid.gstvideo1.color_balance.ColorBalance._getGType);
            if (_klass && _klass.getValue)
              return (cast(typeof(&_vfuncGetValueTramp))_klass.getValue)(balance, channel);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetValue(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.color_balance_channel.ColorBalanceChannel)(cast(void*)channel, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance.ColorBalance.vfuncGetValue");
          }
          return _retval;
        }

        _klass.getValue = cast(typeof(_klass.getValue))&_vfuncGetValueTramp;
        break;
      }
      case "set_value":
      {
        static extern(C) void _vfuncSetValueTramp(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)balance);
          if (!_obj)
          {
            auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)balance), gid.gstvideo1.color_balance.ColorBalance._getGType);
            if (_klass && _klass.setValue)
              return (cast(typeof(&_vfuncSetValueTramp))_klass.setValue)(balance, channel, value);
            return;
          }

          try
          {
            _obj.vfuncSetValue(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.color_balance_channel.ColorBalanceChannel)(cast(void*)channel, No.Take), value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance.ColorBalance.vfuncSetValue");
          }
        }

        _klass.setValue = cast(typeof(_klass.setValue))&_vfuncSetValueTramp;
        break;
      }
      case "value_changed":
      {
        static extern(C) void _vfuncValueChangedTramp(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)balance);
          if (!_obj)
          {
            auto _klass = cast(GstColorBalanceInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)balance), gid.gstvideo1.color_balance.ColorBalance._getGType);
            if (_klass && _klass.valueChanged)
              return (cast(typeof(&_vfuncValueChangedTramp))_klass.valueChanged)(balance, channel, value);
            return;
          }

          try
          {
            _obj.vfuncValueChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.color_balance_channel.ColorBalanceChannel)(cast(void*)channel, No.Take), value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance.ColorBalance.vfuncValueChanged");
          }
        }

        _klass.valueChanged = cast(typeof(_klass.valueChanged))&_vfuncValueChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.color_balance.ColorBalance]
template ColorBalanceGidBuilderT()
{
}
