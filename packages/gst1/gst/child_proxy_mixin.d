/// Module for [ChildProxy] interface mixin
module gst.child_proxy_mixin;

public import gst.child_proxy_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gobject.param_spec;
public import gobject.value;
public import gst.c.functions;
public import gst.c.types;
public import gst.types;

/**
    This interface abstracts handling of property sets for elements with
    children. Imagine elements such as mixers or polyphonic generators. They all
    have multiple #GstPad or some kind of voice objects. Another use case are
    container elements like #GstBin.
    The element implementing the interface acts as a parent for those child
    objects.
    
    By implementing this interface the child properties can be accessed from the
    parent element by using [gst.child_proxy.ChildProxy.get] and [gst.child_proxy.ChildProxy.set].
    
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
  */
  override void childAdded(gobject.object.ObjectWrap child, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_child_proxy_child_added(cast(GstChildProxy*)this._cPtr, child ? cast(GObject*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Emits the #GstChildProxy::child-removed signal.
  
      Params:
        child = the removed child
        name = the name of the old child
  */
  override void childRemoved(gobject.object.ObjectWrap child, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_child_proxy_child_removed(cast(GstChildProxy*)this._cPtr, child ? cast(GObject*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Fetches a child by its number.
  
      Params:
        index = the child's position in the child list
      Returns: the child object or null if
            not found (index too high).
  */
  override gobject.object.ObjectWrap getChildByIndex(uint index)
  {
    GObject* _cretval;
    _cretval = gst_child_proxy_get_child_by_index(cast(GstChildProxy*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a child element by the given name.
      
      This virtual method has a default implementation that uses #GstObject
      together with [gst.object.ObjectWrap.getName]. If the interface is to be used with
      #GObjects, this methods needs to be overridden.
  
      Params:
        name = the child's name
      Returns: the child object or null if
            not found.
  */
  override gobject.object.ObjectWrap getChildByName(string name)
  {
    GObject* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_child_proxy_get_child_by_name(cast(GstChildProxy*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a child element by the given full-path name.
      
      Similar to [gst.child_proxy.ChildProxy.getChildByName], this method
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
  override gobject.object.ObjectWrap getChildByNameRecurse(string name)
  {
    GObject* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_child_proxy_get_child_by_name_recurse(cast(GstChildProxy*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the number of child objects this parent contains.
      Returns: the number of child objects
  */
  override uint getChildrenCount()
  {
    uint _retval;
    _retval = gst_child_proxy_get_children_count(cast(GstChildProxy*)this._cPtr);
    return _retval;
  }

  /**
      Gets a single property using the GstChildProxy mechanism.
      You are responsible for freeing it by calling [gobject.value.Value.unset]
  
      Params:
        name = name of the property
        value = a #GValue that should take the result.
  */
  override void getChildProxyProperty(string name, out gobject.value.Value value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    GValue _value;
    gst_child_proxy_get_property(cast(GstChildProxy*)this._cPtr, _name, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
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
  override bool lookup(string name, out gobject.object.ObjectWrap target, out gobject.param_spec.ParamSpec pspec)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GObject* _target;
    GParamSpec* _pspec;
    _retval = cast(bool)gst_child_proxy_lookup(cast(GstChildProxy*)this._cPtr, _name, &_target, &_pspec);
    target = new gobject.object.ObjectWrap(cast(void*)_target, Yes.Take);
    pspec = new gobject.param_spec.ParamSpec(cast(void*)_pspec, No.Take);
    return _retval;
  }

  /**
      Sets a single property using the GstChildProxy mechanism.
  
      Params:
        name = name of the property to set
        value = new #GValue for the property
  */
  override void setProperty(string name, gobject.value.Value value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_child_proxy_set_property(cast(GstChildProxy*)this._cPtr, _name, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ChildAdded` signal.
  
      Will be emitted after the object was added to the child_proxy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, string name, gst.child_proxy.ChildProxy childProxy))
  
          `object` the #GObject that was added (optional)
  
          `name` the name of the new child (optional)
  
          `childProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChildAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gst.child_proxy.ChildProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-added", closure, after);
  }

  /**
      Connect to `ChildRemoved` signal.
  
      Will be emitted after the object was removed from the child_proxy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, string name, gst.child_proxy.ChildProxy childProxy))
  
          `object` the #GObject that was removed (optional)
  
          `name` the name of the old child (optional)
  
          `childProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChildRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gst.child_proxy.ChildProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-removed", closure, after);
  }
}
