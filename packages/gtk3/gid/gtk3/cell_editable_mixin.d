/// Module for [CellEditable] interface mixin
module gid.gtk3.cell_editable_mixin;

public import gid.core.basictypes;
public import gid.gtk3.cell_editable_iface_proxy;
public import gid.core.utils;
public import gid.gdk3.event;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;

/**
    The #GtkCellEditable interface must be implemented for widgets to be usable
    to edit the contents of a #GtkTreeView cell. It provides a way to specify how
    temporary widgets should be configured for editing, get the new value, etc.
*/
template CellEditableT()
{

  /**
      Get `editingCanceled` property.
      Returns: Indicates whether editing on the cell has been canceled.
  */
  @property bool editingCanceled() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("editing-canceled");
  }

  /**
      Set `editingCanceled` property.
      Params:
        propval = Indicates whether editing on the cell has been canceled.
  */
  @property void editingCanceled(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("editing-canceled", propval);
  }

  /**
      Emits the #GtkCellEditable::editing-done signal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEditingDone`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEditingDone()
  {
    auto _klass = cast(GtkCellEditableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_editable.CellEditable._getGType);
    if (!_klass || !_klass.editingDone)
      return;

    _klass.editingDone(cast(GtkCellEditable*)this._cPtr);
  }

  /**
      Emits the #GtkCellEditable::remove-widget signal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveWidget`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemoveWidget()
  {
    auto _klass = cast(GtkCellEditableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_editable.CellEditable._getGType);
    if (!_klass || !_klass.removeWidget)
      return;

    _klass.removeWidget(cast(GtkCellEditable*)this._cPtr);
  }

  /**
      Begins editing on a cell_editable.
      
      The #GtkCellRenderer for the cell creates and returns a #GtkCellEditable from
      [gid.gtk4.cell_renderer.CellRenderer.startEditing], configured for the #GtkCellRenderer type.
      
      [gid.gtk4.cell_editable.CellEditable.startEditing] can then set up cell_editable suitably for
      editing a cell, e.g. making the Esc key emit #GtkCellEditable::editing-done.
      
      Note that the cell_editable is created on-demand for the current edit; its
      lifetime is temporary and does not persist across other edits and/or cells.
  
      Params:
        event = The #GdkEvent that began the editing process, or
            null if editing was initiated programmatically (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStartEditing`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncStartEditing(gid.gdk3.event.Event event = null)
  {
    auto _klass = cast(GtkCellEditableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_editable.CellEditable._getGType);
    if (!_klass || !_klass.startEditing)
      return;

    _klass.startEditing(cast(GtkCellEditable*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Emits the #GtkCellEditable::editing-done signal.
  */
  override void editingDone() nothrow
  {
    gtk_cell_editable_editing_done(cast(GtkCellEditable*)this._cPtr);
  }

  /**
      Emits the #GtkCellEditable::remove-widget signal.
  */
  override void removeWidget() nothrow
  {
    gtk_cell_editable_remove_widget(cast(GtkCellEditable*)this._cPtr);
  }

  /**
      Begins editing on a cell_editable.
      
      The #GtkCellRenderer for the cell creates and returns a #GtkCellEditable from
      [gid.gtk4.cell_renderer.CellRenderer.startEditing], configured for the #GtkCellRenderer type.
      
      [gid.gtk4.cell_editable.CellEditable.startEditing] can then set up cell_editable suitably for
      editing a cell, e.g. making the Esc key emit #GtkCellEditable::editing-done.
      
      Note that the cell_editable is created on-demand for the current edit; its
      lifetime is temporary and does not persist across other edits and/or cells.
  
      Params:
        event = The #GdkEvent that began the editing process, or
            null if editing was initiated programmatically
  */
  override void startEditing(gid.gdk3.event.Event event = null) nothrow
  {
    gtk_cell_editable_start_editing(cast(GtkCellEditable*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Connect to `EditingDone` signal.
  
      This signal is a sign for the cell renderer to update its
        value from the cell_editable.
        
        Implementations of #GtkCellEditable are responsible for
        emitting this signal when they are done editing, e.g.
        #GtkEntry emits this signal when the user presses Enter. Typical things to
        do in a handler for ::editing-done are to capture the edited value,
        disconnect the cell_editable from signals on the #GtkCellRenderer, etc.
        
        [gid.gtk4.cell_editable.CellEditable.editingDone] is a convenience method
        for emitting #GtkCellEditable::editing-done.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.cell_editable.CellEditable cellEditable)`
  
          `cellEditable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEditingDone(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.cell_editable.CellEditable)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_editable.CellEditable.editingDone");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-done", closure, after);
  }

  /**
      Connect to `RemoveWidget` signal.
  
      This signal is meant to indicate that the cell is finished
        editing, and the cell_editable widget is being removed and may
        subsequently be destroyed.
        
        Implementations of #GtkCellEditable are responsible for
        emitting this signal when they are done editing. It must
        be emitted after the #GtkCellEditable::editing-done signal,
        to give the cell renderer a chance to update the cell's value
        before the widget is removed.
        
        [gid.gtk4.cell_editable.CellEditable.removeWidget] is a convenience method
        for emitting #GtkCellEditable::remove-widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.cell_editable.CellEditable cellEditable)`
  
          `cellEditable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRemoveWidget(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.cell_editable.CellEditable)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_editable.CellEditable.removeWidget");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("remove-widget", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.cell_editable.CellEditable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_cell_editable_CellEditable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEditingDone", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveWidget", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartEditing", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.cell_editable.CellEditable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_cell_editable_CellEditable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEditingDone", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_editable_CellEditable(iface, "editing_done");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveWidget", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_editable_CellEditable(iface, "remove_widget");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartEditing", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_editable_CellEditable(iface, "start_editing");
  }

  private static void _installIfaceVfunc_gid_gtk3_cell_editable_CellEditable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellEditableIface*)iface;

    switch (vfunc)
    {
      case "editing_done":
      {
        static extern(C) void _vfuncEditingDoneTramp(GtkCellEditable* cellEditable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellEditable);
          if (!_obj)
          {
            auto _klass = cast(GtkCellEditableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellEditable), gid.gtk3.cell_editable.CellEditable._getGType);
            if (_klass && _klass.editingDone)
              return (cast(typeof(&_vfuncEditingDoneTramp))_klass.editingDone)(cellEditable);
            return;
          }

          try
          {
            _obj.vfuncEditingDone();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_editable.CellEditable.vfuncEditingDone");
          }
        }

        _klass.editingDone = cast(typeof(_klass.editingDone))&_vfuncEditingDoneTramp;
        break;
      }
      case "remove_widget":
      {
        static extern(C) void _vfuncRemoveWidgetTramp(GtkCellEditable* cellEditable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellEditable);
          if (!_obj)
          {
            auto _klass = cast(GtkCellEditableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellEditable), gid.gtk3.cell_editable.CellEditable._getGType);
            if (_klass && _klass.removeWidget)
              return (cast(typeof(&_vfuncRemoveWidgetTramp))_klass.removeWidget)(cellEditable);
            return;
          }

          try
          {
            _obj.vfuncRemoveWidget();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_editable.CellEditable.vfuncRemoveWidget");
          }
        }

        _klass.removeWidget = cast(typeof(_klass.removeWidget))&_vfuncRemoveWidgetTramp;
        break;
      }
      case "start_editing":
      {
        static extern(C) void _vfuncStartEditingTramp(GtkCellEditable* cellEditable, GdkEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellEditable);
          if (!_obj)
          {
            auto _klass = cast(GtkCellEditableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellEditable), gid.gtk3.cell_editable.CellEditable._getGType);
            if (_klass && _klass.startEditing)
              return (cast(typeof(&_vfuncStartEditingTramp))_klass.startEditing)(cellEditable, event);
            return;
          }

          auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncStartEditing(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_editable.CellEditable.vfuncStartEditing");
          }
          if (_event)
            _event._cUnborrow;

        }

        _klass.startEditing = cast(typeof(_klass.startEditing))&_vfuncStartEditingTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_editable.CellEditable]
template CellEditableGidBuilderT()
{

  /**
      Set `editingCanceled` property.
      Params:
        propval = Indicates whether editing on the cell has been canceled.
      Returns: Builder instance for fluent chaining
  */
  T editingCanceled(bool propval) nothrow
  {
    return setProperty("editing-canceled", propval);
  }
}
