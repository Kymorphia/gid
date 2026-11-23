/// Module for [UndoManager] interface mixin
module gid.gtksource4.undo_manager_mixin;

public import gid.core.basictypes;
public import gid.gtksource4.undo_manager_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource4.c.functions;
public import gid.gtksource4.c.types;
public import gid.gtksource4.types;

/** */
template UndoManagerT()
{

  /**
      Begin a not undoable action on the buffer. All changes between this call
      and the call to [gid.gtksource4.undo_manager.UndoManager.endNotUndoableAction] cannot
      be undone. This function should be re-entrant.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncBeginNotUndoableAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncBeginNotUndoableAction()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.beginNotUndoableAction)
      return;

    _klass.beginNotUndoableAction(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Get whether there are redo operations available.
      Returns: true if there are redo operations available, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanRedo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanRedo()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.canRedo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canRedo(cast(GtkSourceUndoManager*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkSourceUndoManager::can-redo-changed signal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanRedoChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCanRedoChanged()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.canRedoChanged)
      return;

    _klass.canRedoChanged(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Get whether there are undo operations available.
      Returns: true if there are undo operations available, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanUndo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanUndo()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.canUndo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canUndo(cast(GtkSourceUndoManager*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkSourceUndoManager::can-undo-changed signal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanUndoChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCanUndoChanged()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.canUndoChanged)
      return;

    _klass.canUndoChanged(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Ends a not undoable action on the buffer.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEndNotUndoableAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEndNotUndoableAction()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.endNotUndoableAction)
      return;

    _klass.endNotUndoableAction(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Perform a single redo. Calling this function when there are no redo operations
      available is an error. Use [gid.gtksource4.undo_manager.UndoManager.canRedo] to find out
      if there are redo operations available.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRedo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRedo()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.redo)
      return;

    _klass.redo(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Perform a single undo. Calling this function when there are no undo operations
      available is an error. Use [gid.gtksource4.undo_manager.UndoManager.canUndo] to find out
      if there are undo operations available.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUndo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUndo()
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.undo_manager.UndoManager._getGType);
    if (!_klass || !_klass.undo)
      return;

    _klass.undo(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Begin a not undoable action on the buffer. All changes between this call
      and the call to [gid.gtksource4.undo_manager.UndoManager.endNotUndoableAction] cannot
      be undone. This function should be re-entrant.
  */
  override void beginNotUndoableAction() nothrow
  {
    gtk_source_undo_manager_begin_not_undoable_action(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Get whether there are redo operations available.
      Returns: true if there are redo operations available, false otherwise
  */
  override bool canRedo() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_undo_manager_can_redo(cast(GtkSourceUndoManager*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkSourceUndoManager::can-redo-changed signal.
  */
  override void canRedoChanged() nothrow
  {
    gtk_source_undo_manager_can_redo_changed(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Get whether there are undo operations available.
      Returns: true if there are undo operations available, false otherwise
  */
  override bool canUndo() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_undo_manager_can_undo(cast(GtkSourceUndoManager*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkSourceUndoManager::can-undo-changed signal.
  */
  override void canUndoChanged() nothrow
  {
    gtk_source_undo_manager_can_undo_changed(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Ends a not undoable action on the buffer.
  */
  override void endNotUndoableAction() nothrow
  {
    gtk_source_undo_manager_end_not_undoable_action(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Perform a single redo. Calling this function when there are no redo operations
      available is an error. Use [gid.gtksource4.undo_manager.UndoManager.canRedo] to find out
      if there are redo operations available.
  */
  override void redo() nothrow
  {
    gtk_source_undo_manager_redo(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Perform a single undo. Calling this function when there are no undo operations
      available is an error. Use [gid.gtksource4.undo_manager.UndoManager.canUndo] to find out
      if there are undo operations available.
  */
  override void undo() nothrow
  {
    gtk_source_undo_manager_undo(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Connect to `CanRedoChanged` signal.
  
      Emitted when the ability to redo has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.undo_manager.UndoManager undoManager)`
  
          `undoManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCanRedoChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.undo_manager.UndoManager)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.canRedoChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("can-redo-changed", closure, after);
  }

  /**
      Connect to `CanUndoChanged` signal.
  
      Emitted when the ability to undo has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.undo_manager.UndoManager undoManager)`
  
          `undoManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCanUndoChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.undo_manager.UndoManager)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.canUndoChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("can-undo-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource4.undo_manager.UndoManager (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource4_undo_manager_UndoManager(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncBeginNotUndoableAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanRedo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanRedoChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanUndo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanUndoChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEndNotUndoableAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRedo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUndo", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource4.undo_manager.UndoManager vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource4_undo_manager_UndoManager(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncBeginNotUndoableAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "begin_not_undoable_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanRedo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "can_redo");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanRedoChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "can_redo_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanUndo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "can_undo");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanUndoChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "can_undo_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEndNotUndoableAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "end_not_undoable_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRedo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "redo");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUndo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(iface, "undo");
  }

  private static void _installIfaceVfunc_gid_gtksource4_undo_manager_UndoManager(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceUndoManagerIface*)iface;

    switch (vfunc)
    {
      case "begin_not_undoable_action":
      {
        static extern(C) void _vfuncBeginNotUndoableActionTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.beginNotUndoableAction)
              return (cast(typeof(&_vfuncBeginNotUndoableActionTramp))_klass.beginNotUndoableAction)(manager);
            return;
          }

          try
          {
            _obj.vfuncBeginNotUndoableAction();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncBeginNotUndoableAction");
          }
        }

        _klass.beginNotUndoableAction = cast(typeof(_klass.beginNotUndoableAction))&_vfuncBeginNotUndoableActionTramp;
        break;
      }
      case "can_redo":
      {
        static extern(C) gboolean _vfuncCanRedoTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.canRedo)
              return (cast(typeof(&_vfuncCanRedoTramp))_klass.canRedo)(manager);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanRedo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncCanRedo");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canRedo = cast(typeof(_klass.canRedo))&_vfuncCanRedoTramp;
        break;
      }
      case "can_redo_changed":
      {
        static extern(C) void _vfuncCanRedoChangedTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.canRedoChanged)
              return (cast(typeof(&_vfuncCanRedoChangedTramp))_klass.canRedoChanged)(manager);
            return;
          }

          try
          {
            _obj.vfuncCanRedoChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncCanRedoChanged");
          }
        }

        _klass.canRedoChanged = cast(typeof(_klass.canRedoChanged))&_vfuncCanRedoChangedTramp;
        break;
      }
      case "can_undo":
      {
        static extern(C) gboolean _vfuncCanUndoTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.canUndo)
              return (cast(typeof(&_vfuncCanUndoTramp))_klass.canUndo)(manager);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanUndo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncCanUndo");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canUndo = cast(typeof(_klass.canUndo))&_vfuncCanUndoTramp;
        break;
      }
      case "can_undo_changed":
      {
        static extern(C) void _vfuncCanUndoChangedTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.canUndoChanged)
              return (cast(typeof(&_vfuncCanUndoChangedTramp))_klass.canUndoChanged)(manager);
            return;
          }

          try
          {
            _obj.vfuncCanUndoChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncCanUndoChanged");
          }
        }

        _klass.canUndoChanged = cast(typeof(_klass.canUndoChanged))&_vfuncCanUndoChangedTramp;
        break;
      }
      case "end_not_undoable_action":
      {
        static extern(C) void _vfuncEndNotUndoableActionTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.endNotUndoableAction)
              return (cast(typeof(&_vfuncEndNotUndoableActionTramp))_klass.endNotUndoableAction)(manager);
            return;
          }

          try
          {
            _obj.vfuncEndNotUndoableAction();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncEndNotUndoableAction");
          }
        }

        _klass.endNotUndoableAction = cast(typeof(_klass.endNotUndoableAction))&_vfuncEndNotUndoableActionTramp;
        break;
      }
      case "redo":
      {
        static extern(C) void _vfuncRedoTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.redo)
              return (cast(typeof(&_vfuncRedoTramp))_klass.redo)(manager);
            return;
          }

          try
          {
            _obj.vfuncRedo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncRedo");
          }
        }

        _klass.redo = cast(typeof(_klass.redo))&_vfuncRedoTramp;
        break;
      }
      case "undo":
      {
        static extern(C) void _vfuncUndoTramp(GtkSourceUndoManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceUndoManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gtksource4.undo_manager.UndoManager._getGType);
            if (_klass && _klass.undo)
              return (cast(typeof(&_vfuncUndoTramp))_klass.undo)(manager);
            return;
          }

          try
          {
            _obj.vfuncUndo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.undo_manager.UndoManager.vfuncUndo");
          }
        }

        _klass.undo = cast(typeof(_klass.undo))&_vfuncUndoTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.undo_manager.UndoManager]
template UndoManagerGidBuilderT()
{
}
