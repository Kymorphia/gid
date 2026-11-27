/// Module for [ChildProxy] interface mixin
module gid.gst1.child_proxy_mixin;

public import gid.core.basictypes;
public import gid.gst1.child_proxy;
public import gid.gst1.child_proxy_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.param_spec;
public import gid.gobject2.value;
public import gid.gst1.c.functions;
public import gid.gst1.c.types;
public import gid.gst1.types;

/**
    This interface abstracts handling of property sets for elements with
    children. Imagine elements such as mixers or polyphonic generators. They all
    have multiple #GstPad or some kind of voice objects. Another use case are
    container elements like #GstBin.
    The element implementing the interface acts as a parent for those child
    objects.
    
    By implementing this interface the child properties can be accessed from the
    parent element by using [gid.gst1.child_proxy.ChildProxy.get] and [gid.gst1.child_proxy.ChildProxy.set].
    
    Property names are written as `child-name::property-name`. The whole naming
    scheme is recursive. Thus `child1::child2::property` is valid too, if
    `child1` and `child2` implement the #GstChildProxy interface.
*/
template ChildProxyT()
{

  /**
      Emits the #GstChildProxy::child-added signal.
  
      Params:
        child = the newly added child
        name = the name of the new child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChildAdded`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChildAdded(gid.gobject2.object.ObjectWrap child, string name)
  {
    auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.child_proxy.ChildProxy._getGType);
    if (!_klass || !_klass.childAdded)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.childAdded(cast(GstChildProxy*)this._cPtr, child ? cast(GObject*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Emits the #GstChildProxy::child-removed signal.
  
      Params:
        child = the removed child
        name = the name of the old child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChildRemoved`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChildRemoved(gid.gobject2.object.ObjectWrap child, string name)
  {
    auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.child_proxy.ChildProxy._getGType);
    if (!_klass || !_klass.childRemoved)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.childRemoved(cast(GstChildProxy*)this._cPtr, child ? cast(GObject*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Fetches a child by its number.
  
      Params:
        index = the child's position in the child list
      Returns: the child object or null if
            not found (index too high).
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetChildByIndex`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncGetChildByIndex(uint index)
  {
    auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.child_proxy.ChildProxy._getGType);
    if (!_klass || !_klass.getChildByIndex)
      return typeof(return).init;

    GObject* _cretval;
    _cretval = _klass.getChildByIndex(cast(GstChildProxy*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a child element by the given name.
      
      This virtual method has a default implementation that uses #GstObject
      together with [gid.gst1.object.ObjectWrap.getName]. If the interface is to be used with
      #GObjects, this methods needs to be overridden.
  
      Params:
        name = the child's name
      Returns: the child object or null if
            not found.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetChildByName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncGetChildByName(string name)
  {
    auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.child_proxy.ChildProxy._getGType);
    if (!_klass || !_klass.getChildByName)
      return typeof(return).init;

    GObject* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getChildByName(cast(GstChildProxy*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the number of child objects this parent contains.
      Returns: the number of child objects
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetChildrenCount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncGetChildrenCount()
  {
    auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.child_proxy.ChildProxy._getGType);
    if (!_klass || !_klass.getChildrenCount)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getChildrenCount(cast(GstChildProxy*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GstChildProxy::child-added signal.
  
      Params:
        child = the newly added child
        name = the name of the new child
  */
  override void childAdded(gid.gobject2.object.ObjectWrap child, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_child_proxy_child_added(cast(GstChildProxy*)this._cPtr, child ? cast(GObject*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Emits the #GstChildProxy::child-removed signal.
  
      Params:
        child = the removed child
        name = the name of the old child
  */
  override void childRemoved(gid.gobject2.object.ObjectWrap child, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_child_proxy_child_removed(cast(GstChildProxy*)this._cPtr, child ? cast(GObject*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Fetches a child by its number.
  
      Params:
        index = the child's position in the child list
      Returns: the child object or null if
            not found (index too high).
  */
  override gid.gobject2.object.ObjectWrap getChildByIndex(uint index) nothrow
  {
    GObject* _cretval;
    _cretval = gst_child_proxy_get_child_by_index(cast(GstChildProxy*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a child element by the given name.
      
      This virtual method has a default implementation that uses #GstObject
      together with [gid.gst1.object.ObjectWrap.getName]. If the interface is to be used with
      #GObjects, this methods needs to be overridden.
  
      Params:
        name = the child's name
      Returns: the child object or null if
            not found.
  */
  override gid.gobject2.object.ObjectWrap getChildByName(string name) nothrow
  {
    GObject* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_child_proxy_get_child_by_name(cast(GstChildProxy*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a child element by the given full-path name.
      
      Similar to [gid.gst1.child_proxy.ChildProxy.getChildByName], this method
      searches and returns a child given a name. The difference is that
      this method allows a hierarchical path in the form of
      child1::child2::child3. In the later example this method would
      return a reference to child3, if found. The name should be made of
      element names only and should not contain any property names.
  
      Params:
        name = the full-path child's name
      Returns: the child object or null if
            not found.
  */
  override gid.gobject2.object.ObjectWrap getChildByNameRecurse(string name) nothrow
  {
    GObject* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_child_proxy_get_child_by_name_recurse(cast(GstChildProxy*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the number of child objects this parent contains.
      Returns: the number of child objects
  */
  override uint getChildrenCount() nothrow
  {
    uint _retval;
    _retval = gst_child_proxy_get_children_count(cast(GstChildProxy*)this._cPtr);
    return _retval;
  }

  /**
      Gets a single property using the GstChildProxy mechanism.
      You are responsible for freeing it by calling [gid.gobject2.value.Value.unset]
  
      Params:
        name = name of the property
        value = a #GValue that should take the result.
  */
  override void getChildProxyProperty(string name, out gid.gobject2.value.Value value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    gst_child_proxy_get_property(cast(GstChildProxy*)this._cPtr, _name, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Looks up which object and #GParamSpec would be effected by the given name.
  
      Params:
        name = name of the property to look up
        target = pointer to a #GObject that
              takes the real object to set property on
        pspec = pointer to take the #GParamSpec
              describing the property
      Returns: true if target and pspec could be found. false otherwise. In that
        case the values for pspec and target are not modified. Unref target after
        usage. For plain #GObject target is the same as object.
  */
  override bool lookup(string name, out gid.gobject2.object.ObjectWrap target, out gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    GObject* _target;
    GParamSpec* _pspec;
    _retval = cast(bool)gst_child_proxy_lookup(cast(GstChildProxy*)this._cPtr, _name, &_target, &_pspec);
    target = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(_target, Yes.Take);
    if (_pspec)
      pspec = new gid.gobject2.param_spec.ParamSpec(cast(void*)_pspec, No.Take);
    return _retval;
  }

  /**
      Sets a single property using the GstChildProxy mechanism.
  
      Params:
        name = name of the property to set
        value = new #GValue for the property
  */
  override void setProperty(string name, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_child_proxy_set_property(cast(GstChildProxy*)this._cPtr, _name, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ChildAdded` signal.
  
      Will be emitted after the object was added to the child_proxy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gobject2.object.ObjectWrap object, string name, gid.gst1.child_proxy.ChildProxy childProxy)`
  
          `object` the #GObject that was added (optional)
  
          `name` the name of the new child (optional)
  
          `childProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChildAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gobject2.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gst1.child_proxy.ChildProxy)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.childAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-added", closure, after);
  }

  /**
      Connect to `ChildRemoved` signal.
  
      Will be emitted after the object was removed from the child_proxy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gobject2.object.ObjectWrap object, string name, gid.gst1.child_proxy.ChildProxy childProxy)`
  
          `object` the #GObject that was removed (optional)
  
          `name` the name of the old child (optional)
  
          `childProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChildRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gobject2.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gst1.child_proxy.ChildProxy)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.childRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-removed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gst1.child_proxy.ChildProxy (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gst1_child_proxy_ChildProxy(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChildAdded", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChildRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildByIndex", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildByName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildrenCount", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gst1.child_proxy.ChildProxy vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gst1_child_proxy_ChildProxy(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChildAdded", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_child_proxy_ChildProxy(iface, "child_added");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChildRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_child_proxy_ChildProxy(iface, "child_removed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildByIndex", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_child_proxy_ChildProxy(iface, "get_child_by_index");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildByName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_child_proxy_ChildProxy(iface, "get_child_by_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildrenCount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_child_proxy_ChildProxy(iface, "get_children_count");
  }

  private static void _installIfaceVfunc_gid_gst1_child_proxy_ChildProxy(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstChildProxyInterface*)iface;

    switch (vfunc)
    {
      case "child_added":
      {
        static extern(C) void _vfuncChildAddedTramp(GstChildProxy* parent, GObject* child, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gst1.child_proxy.ChildProxy._getGType);
            if (_klass && _klass.childAdded)
              return (cast(typeof(&_vfuncChildAddedTramp))_klass.childAdded)(parent, child, name);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncChildAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.vfuncChildAdded");
          }
        }

        _klass.childAdded = cast(typeof(_klass.childAdded))&_vfuncChildAddedTramp;
        break;
      }
      case "child_removed":
      {
        static extern(C) void _vfuncChildRemovedTramp(GstChildProxy* parent, GObject* child, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gst1.child_proxy.ChildProxy._getGType);
            if (_klass && _klass.childRemoved)
              return (cast(typeof(&_vfuncChildRemovedTramp))_klass.childRemoved)(parent, child, name);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncChildRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.vfuncChildRemoved");
          }
        }

        _klass.childRemoved = cast(typeof(_klass.childRemoved))&_vfuncChildRemovedTramp;
        break;
      }
      case "get_child_by_index":
      {
        static extern(C) GObject* _vfuncGetChildByIndexTramp(GstChildProxy* parent, uint index) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gst1.child_proxy.ChildProxy._getGType);
            if (_klass && _klass.getChildByIndex)
              return (cast(typeof(&_vfuncGetChildByIndexTramp))_klass.getChildByIndex)(parent, index);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetChildByIndex(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.vfuncGetChildByIndex");
          }
          auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getChildByIndex = cast(typeof(_klass.getChildByIndex))&_vfuncGetChildByIndexTramp;
        break;
      }
      case "get_child_by_name":
      {
        static extern(C) GObject* _vfuncGetChildByNameTramp(GstChildProxy* parent, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gst1.child_proxy.ChildProxy._getGType);
            if (_klass && _klass.getChildByName)
              return (cast(typeof(&_vfuncGetChildByNameTramp))_klass.getChildByName)(parent, name);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetChildByName(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.vfuncGetChildByName");
          }
          auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getChildByName = cast(typeof(_klass.getChildByName))&_vfuncGetChildByNameTramp;
        break;
      }
      case "get_children_count":
      {
        static extern(C) uint _vfuncGetChildrenCountTramp(GstChildProxy* parent) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GstChildProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gst1.child_proxy.ChildProxy._getGType);
            if (_klass && _klass.getChildrenCount)
              return (cast(typeof(&_vfuncGetChildrenCountTramp))_klass.getChildrenCount)(parent);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetChildrenCount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.child_proxy.ChildProxy.vfuncGetChildrenCount");
          }
          return _retval;
        }

        _klass.getChildrenCount = cast(typeof(_klass.getChildrenCount))&_vfuncGetChildrenCountTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.child_proxy.ChildProxy]
template ChildProxyGidBuilderT()
{
}
