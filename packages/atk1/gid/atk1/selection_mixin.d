/// Module for [Selection] interface mixin
module gid.atk1.selection_mixin;

public import gid.core.basictypes;
public import gid.atk1.selection_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.object;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface implemented by container objects whose #AtkObject children can be selected.
    
    #AtkSelection should be implemented by UI components with children
    which are exposed by #atk_object_ref_child and
    #atk_object_get_n_children, if the use of the parent UI component
    ordinarily involves selection of one or more of the objects
    corresponding to those #AtkObject children - for example,
    selectable lists.
    
    Note that other types of "selection" (for instance text selection)
    are accomplished a other ATK interfaces - #AtkSelection is limited
    to the selection/deselection of children.
*/
template SelectionT()
{

  /**
      Adds the specified accessible child of the object to the
      object's selection.
  
      Params:
        i = a #gint specifying the child index.
      Returns: TRUE if success, FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectionAddSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectionAddSelection(int i)
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.addSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.addSelection(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Clears the selection in the object so that no children in the object
      are selected.
      Returns: TRUE if success, FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncClearSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncClearSelection()
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.clearSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.clearSelection(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of accessible children currently selected.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
      Returns: a gint representing the number of items selected, or 0
        if selection does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSelectionCount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetSelectionCount()
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.getSelectionCount)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getSelectionCount(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the current child of this object is selected
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the child index.
      Returns: a gboolean representing the specified child is selected, or 0
        if selection does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsChildSelected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsChildSelected(int i)
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.isChildSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isChildSelected(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Gets a reference to the accessible object representing the specified
      selected child of the object.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: an #AtkObject representing the
        selected accessible, or null if selection does not implement this
        interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRefSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncRefSelection(int i)
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.refSelection)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.refSelection(cast(AtkSelection*)this._cPtr, i);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes the specified child of the object from the object's selection.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: TRUE if success, FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectionRemoveSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectionRemoveSelection(int i)
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.removeSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.removeSelection(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Causes every child of the object to be selected if the object
      supports multiple selections.
      Returns: TRUE if success, FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectAllSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectAllSelection()
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.selectAllSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectAllSelection(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSelectionChanged()
  {
    auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.selection.Selection._getGType);
    if (!_klass || !_klass.selectionChanged)
      return;

    _klass.selectionChanged(cast(AtkSelection*)this._cPtr);
  }

  /**
      Adds the specified accessible child of the object to the
      object's selection.
  
      Params:
        i = a #gint specifying the child index.
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool addSelection(int i) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_selection_add_selection(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Clears the selection in the object so that no children in the object
      are selected.
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool clearSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_selection_clear_selection(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of accessible children currently selected.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
      Returns: a gint representing the number of items selected, or 0
        if selection does not implement this interface.
  */
  override int getSelectionCount() nothrow
  {
    int _retval;
    _retval = atk_selection_get_selection_count(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the current child of this object is selected
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the child index.
      Returns: a gboolean representing the specified child is selected, or 0
        if selection does not implement this interface.
  */
  override bool isChildSelected(int i) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_selection_is_child_selected(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Gets a reference to the accessible object representing the specified
      selected child of the object.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: an #AtkObject representing the
        selected accessible, or null if selection does not implement this
        interface.
  */
  override gid.atk1.object.ObjectWrap refSelection(int i) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_selection_ref_selection(cast(AtkSelection*)this._cPtr, i);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes the specified child of the object from the object's selection.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool removeSelection(int i) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_selection_remove_selection(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Causes every child of the object to be selected if the object
      supports multiple selections.
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool selectAllSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_selection_select_all_selection(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `SelectionChanged` signal.
  
      The "selection-changed" signal is emitted by an object which
        implements AtkSelection interface when the selection changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.selection.Selection selection)`
  
          `selection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.selection.Selection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.selection.Selection (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_selection_Selection(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionAddSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClearSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelectionCount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsChildSelected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionRemoveSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectAllSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionChanged", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.selection.Selection vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_selection_Selection(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionAddSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "add_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClearSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "clear_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelectionCount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "get_selection_count");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsChildSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "is_child_selected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "ref_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionRemoveSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "remove_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectAllSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "select_all_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_selection_Selection(iface, "selection_changed");
  }

  private static void _installIfaceVfunc_gid_atk1_selection_Selection(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkSelectionIface*)iface;

    switch (vfunc)
    {
      case "add_selection":
      {
        static extern(C) gboolean _vfuncSelectionAddSelectionTramp(AtkSelection* selection, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.addSelection)
              return (cast(typeof(&_vfuncSelectionAddSelectionTramp))_klass.addSelection)(selection, i);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectionAddSelection(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncSelectionAddSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.addSelection = cast(typeof(_klass.addSelection))&_vfuncSelectionAddSelectionTramp;
        break;
      }
      case "clear_selection":
      {
        static extern(C) gboolean _vfuncClearSelectionTramp(AtkSelection* selection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.clearSelection)
              return (cast(typeof(&_vfuncClearSelectionTramp))_klass.clearSelection)(selection);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClearSelection();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncClearSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.clearSelection = cast(typeof(_klass.clearSelection))&_vfuncClearSelectionTramp;
        break;
      }
      case "get_selection_count":
      {
        static extern(C) int _vfuncGetSelectionCountTramp(AtkSelection* selection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.getSelectionCount)
              return (cast(typeof(&_vfuncGetSelectionCountTramp))_klass.getSelectionCount)(selection);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetSelectionCount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncGetSelectionCount");
          }
          return _retval;
        }

        _klass.getSelectionCount = cast(typeof(_klass.getSelectionCount))&_vfuncGetSelectionCountTramp;
        break;
      }
      case "is_child_selected":
      {
        static extern(C) gboolean _vfuncIsChildSelectedTramp(AtkSelection* selection, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.isChildSelected)
              return (cast(typeof(&_vfuncIsChildSelectedTramp))_klass.isChildSelected)(selection, i);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsChildSelected(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncIsChildSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isChildSelected = cast(typeof(_klass.isChildSelected))&_vfuncIsChildSelectedTramp;
        break;
      }
      case "ref_selection":
      {
        static extern(C) AtkObject* _vfuncRefSelectionTramp(AtkSelection* selection, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.refSelection)
              return (cast(typeof(&_vfuncRefSelectionTramp))_klass.refSelection)(selection, i);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncRefSelection(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncRefSelection");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.refSelection = cast(typeof(_klass.refSelection))&_vfuncRefSelectionTramp;
        break;
      }
      case "remove_selection":
      {
        static extern(C) gboolean _vfuncSelectionRemoveSelectionTramp(AtkSelection* selection, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.removeSelection)
              return (cast(typeof(&_vfuncSelectionRemoveSelectionTramp))_klass.removeSelection)(selection, i);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectionRemoveSelection(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncSelectionRemoveSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.removeSelection = cast(typeof(_klass.removeSelection))&_vfuncSelectionRemoveSelectionTramp;
        break;
      }
      case "select_all_selection":
      {
        static extern(C) gboolean _vfuncSelectAllSelectionTramp(AtkSelection* selection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.selectAllSelection)
              return (cast(typeof(&_vfuncSelectAllSelectionTramp))_klass.selectAllSelection)(selection);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectAllSelection();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncSelectAllSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectAllSelection = cast(typeof(_klass.selectAllSelection))&_vfuncSelectAllSelectionTramp;
        break;
      }
      case "selection_changed":
      {
        static extern(C) void _vfuncSelectionChangedTramp(AtkSelection* selection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(AtkSelectionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection), gid.atk1.selection.Selection._getGType);
            if (_klass && _klass.selectionChanged)
              return (cast(typeof(&_vfuncSelectionChangedTramp))_klass.selectionChanged)(selection);
            return;
          }

          try
          {
            _obj.vfuncSelectionChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.selection.Selection.vfuncSelectionChanged");
          }
        }

        _klass.selectionChanged = cast(typeof(_klass.selectionChanged))&_vfuncSelectionChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.selection.Selection]
template SelectionGidBuilderT()
{
}
