/// Module for [ListModel] interface mixin
module gid.gio2.list_model_mixin;

public import gid.core.basictypes;
public import gid.gio2.list_model;
public import gid.gio2.list_model_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.types;

/**
    [gid.gio2.list_model.ListModel] is an interface that represents a mutable list of
    [gid.gobject2.object.ObjectWrap]. Its main intention is as a model for various widgets
    in user interfaces, such as list views, but it can also be used as a
    convenient method of returning lists of data, with support for
    updates.
    
    Each object in the list may also report changes in itself via some
    mechanism (normally the [gid.gobject2.object.ObjectWrap.notify] signal).  Taken
    together with the [gid.gio2.list_model.ListModel.itemsChanged] signal, this provides
    for a list that can change its membership, and in which the members can
    change their individual properties.
    
    A good example would be the list of visible wireless network access
    points, where each access point can report dynamic properties such as
    signal strength.
    
    It is important to note that the [gid.gio2.list_model.ListModel] itself does not report
    changes to the individual items.  It only reports changes to the list
    membership.  If you want to observe changes to the objects themselves
    then you need to connect signals to the objects that you are
    interested in.
    
    All items in a [gid.gio2.list_model.ListModel] are of (or derived from) the same type.
    [gid.gio2.list_model.ListModel.getItemType] returns that type.  The type may be an
    interface, in which case all objects in the list must implement it.
    
    The semantics are close to that of an array:
    [gid.gio2.list_model.ListModel.getNItems] returns the number of items in the list
    and [gid.gio2.list_model.ListModel.getItem] returns an item at a (0-based) position.
    In order to allow implementations to calculate the list length lazily,
    you can also iterate over items: starting from 0, repeatedly call
    [gid.gio2.list_model.ListModel.getItem] until it returns `NULL`.
    
    An implementation may create objects lazily, but must take care to
    return the same object for a given position until all references to
    it are gone.
    
    On the other side, a consumer is expected only to hold references on
    objects that are currently ‘user visible’, in order to facilitate the
    maximum level of laziness in the implementation of the list and to
    reduce the required number of signal connections at a given time.
    
    This interface is intended only to be used from a single thread.  The
    thread in which it is appropriate to use it depends on the particular
    implementation, but typically it will be from the thread that owns
    the thread-default main context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) in effect at the time that the
    model was created.
    
    Over time, it has established itself as good practice for list model
    implementations to provide properties `item-type` and `n-items` to
    ease working with them. While it is not required, it is recommended
    that implementations provide these two properties. They should return
    the values of [gid.gio2.list_model.ListModel.getItemType] and
    [gid.gio2.list_model.ListModel.getNItems] respectively and be defined as such:
    
    ```c
    properties[PROP_ITEM_TYPE] =
      g_param_spec_gtype ("item-type", NULL, NULL, G_TYPE_OBJECT,
                          G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
    properties[PROP_N_ITEMS] =
      g_param_spec_uint ("n-items", NULL, NULL, 0, G_MAXUINT, 0,
                         G_PARAM_READABLE | G_PARAM_STATIC_STRINGS);
    ```
*/
template ListModelT()
{

  /**
  * Get the item at position and cast to the template type.
  * NOTE: If type is an interface and no known D object is found that the object conforms to,
  * the interface IfaceProxy object will be used.
  * If position is greater than the number of items in list, %NULL is
  * returned.
  * %NULL may be returned if index is smaller than the length
  * of the list, but the object does not conform to the template type.
  * This function is meant to be used by language bindings in place
  * of [Gio.ListModel.getItem].
  * See also: [Gio.ListModel.getNItems]
  * Params:
  *   T = type to cast the resulting object to (can be an interface type)
  *   position = the position of the item to fetch
  * Returns: the object at position.
  */
  T getItem(T)(uint position) nothrow
  {
    auto gobj = cast(GObject*)g_list_model_get_object(cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)this)._cPtr, position);
    return gid.gobject2.object.ObjectWrap._getDObject!T(gobj, Yes.Take);
  }





  /**
      Get the item at position. If position is greater than the number of
      items in list, null is returned.
      
      null is never returned for an index that is smaller than the length
      of the list.  See [gid.gio2.list_model.ListModel.getNItems].
      
      The same #GObject instance may not appear more than once in a #GListModel.
  
      Params:
        position = the position of the item to fetch
      Returns: the object at position.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetItem`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncGetItem(uint position)
  {
    auto _klass = cast(GListModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.list_model.ListModel._getGType);
    if (!_klass || !_klass.getItem)
      return typeof(return).init;

    GObject* _cretval;
    _cretval = _klass.getItem(cast(GListModel*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the type of the items in list.
      
      All items returned from [gid.gio2.list_model.ListModel.getItem] are of the type
      returned by this function, or a subtype, or if the type is an
      interface, they are an implementation of that interface.
      
      The item type of a #GListModel can not change during the life of the
      model.
      Returns: the #GType of the items contained in list.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetItemType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.types.GType vfuncGetItemType()
  {
    auto _klass = cast(GListModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.list_model.ListModel._getGType);
    if (!_klass || !_klass.getItemType)
      return typeof(return).init;

    gid.gobject2.types.GType _retval;
    _retval = _klass.getItemType(cast(GListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of items in list.
      
      Depending on the model implementation, calling this function may be
      less efficient than iterating the list with increasing values for
      position until [gid.gio2.list_model.ListModel.getItem] returns null.
      Returns: the number of items in list.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNItems`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncGetNItems()
  {
    auto _klass = cast(GListModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.list_model.ListModel._getGType);
    if (!_klass || !_klass.getNItems)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getNItems(cast(GListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of the items in list.
      
      All items returned from [gid.gio2.list_model.ListModel.getItem] are of the type
      returned by this function, or a subtype, or if the type is an
      interface, they are an implementation of that interface.
      
      The item type of a #GListModel can not change during the life of the
      model.
      Returns: the #GType of the items contained in list.
  */
  override gid.gobject2.types.GType getItemType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_list_model_get_item_type(cast(GListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of items in list.
      
      Depending on the model implementation, calling this function may be
      less efficient than iterating the list with increasing values for
      position until [gid.gio2.list_model.ListModel.getItem] returns null.
      Returns: the number of items in list.
  */
  override uint getNItems() nothrow
  {
    uint _retval;
    _retval = g_list_model_get_n_items(cast(GListModel*)this._cPtr);
    return _retval;
  }

  /**
      Get the item at position.
      
      If position is greater than the number of items in list, null is
      returned.
      
      null is never returned for an index that is smaller than the length
      of the list.
      
      This function is meant to be used by language bindings in place
      of [gid.gio2.list_model.ListModel.getItem].
      
      See also: [gid.gio2.list_model.ListModel.getNItems]
  
      Params:
        position = the position of the item to fetch
      Returns: the object at position.
  */
  override gid.gobject2.object.ObjectWrap getItem(uint position) nothrow
  {
    GObject* _cretval;
    _cretval = g_list_model_get_object(cast(GListModel*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Emits the #GListModel::items-changed signal on list.
      
      This function should only be called by classes implementing
      #GListModel. It has to be called after the internal representation
      of list has been updated, because handlers connected to this signal
      might query the new state of the list.
      
      Implementations must only make changes to the model (as visible to
      its consumer) in places that will not cause problems for that
      consumer.  For models that are driven directly by a write API (such
      as #GListStore), changes can be reported in response to uses of that
      API.  For models that represent remote data, changes should only be
      made from a fresh mainloop dispatch.  It is particularly not
      permitted to make changes in response to a call to the #GListModel
      consumer API.
      
      Stated another way: in general, it is assumed that code making a
      series of accesses to the model via the API, without returning to the
      mainloop, and without calling other code, will continue to view the
      same contents of the model.
  
      Params:
        position = the position at which list changed
        removed = the number of items removed
        added = the number of items added
  */
  override void itemsChanged(uint position, uint removed, uint added) nothrow
  {
    g_list_model_items_changed(cast(GListModel*)this._cPtr, position, removed, added);
  }

  /**
      Connect to `ItemsChanged` signal.
  
      This signal is emitted whenever items were added to or removed
        from list. At position, removed items were removed and added
        items were added in their place.
        
        Note: If `removed != added`, the positions of all later items
        in the model change.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint position, uint removed, uint added, gid.gio2.list_model.ListModel listModel)`
  
          `position` the position at which list changed (optional)
  
          `removed` the number of items removed (optional)
  
          `added` the number of items added (optional)
  
          `listModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectItemsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gio2.list_model.ListModel)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_model.ListModel.itemsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("items-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.list_model.ListModel (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_list_model_ListModel(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetItem", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetItemType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNItems", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.list_model.ListModel vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_list_model_ListModel(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetItem", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_list_model_ListModel(iface, "get_item");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetItemType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_list_model_ListModel(iface, "get_item_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNItems", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_list_model_ListModel(iface, "get_n_items");
  }

  private static void _installIfaceVfunc_gid_gio2_list_model_ListModel(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GListModelInterface*)iface;

    switch (vfunc)
    {
      case "get_item":
      {
        static extern(C) GObject* _vfuncGetItemTramp(GListModel* list, uint position) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)list);
          if (!_obj)
          {
            auto _klass = cast(GListModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)list), gid.gio2.list_model.ListModel._getGType);
            if (_klass && _klass.getItem)
              return (cast(typeof(&_vfuncGetItemTramp))_klass.getItem)(list, position);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetItem(position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_model.ListModel.vfuncGetItem");
          }
          auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getItem = cast(typeof(_klass.getItem))&_vfuncGetItemTramp;
        break;
      }
      case "get_item_type":
      {
        static extern(C) GType _vfuncGetItemTypeTramp(GListModel* list) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)list);
          if (!_obj)
          {
            auto _klass = cast(GListModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)list), gid.gio2.list_model.ListModel._getGType);
            if (_klass && _klass.getItemType)
              return (cast(typeof(&_vfuncGetItemTypeTramp))_klass.getItemType)(list);
            return typeof(return).init;
          }

          gid.gobject2.types.GType _dretval;

          try
          {
            _dretval = _obj.vfuncGetItemType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_model.ListModel.vfuncGetItemType");
          }
          auto _retval = cast(GType)_dretval;

          return _retval;
        }

        _klass.getItemType = cast(typeof(_klass.getItemType))&_vfuncGetItemTypeTramp;
        break;
      }
      case "get_n_items":
      {
        static extern(C) uint _vfuncGetNItemsTramp(GListModel* list) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)list);
          if (!_obj)
          {
            auto _klass = cast(GListModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)list), gid.gio2.list_model.ListModel._getGType);
            if (_klass && _klass.getNItems)
              return (cast(typeof(&_vfuncGetNItemsTramp))_klass.getNItems)(list);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetNItems();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_model.ListModel.vfuncGetNItems");
          }
          return _retval;
        }

        _klass.getNItems = cast(typeof(_klass.getNItems))&_vfuncGetNItemsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.list_model.ListModel]
template ListModelGidBuilderT()
{
}
