/// Module for [CellEditable] interface mixin
module gtk.cell_editable_mixin;

public import gtk.cell_editable_iface_proxy;
public import gdk.event;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    Interface for widgets that can be used for editing cells
    
    The [gtk.cell_editable.CellEditable] interface must be implemented for widgets to be usable
    to edit the contents of a [gtk.tree_view.TreeView] cell. It provides a way to specify how
    temporary widgets should be configured for editing, get the new value, etc.

    Deprecated: List views use widgets for displaying their
        contents. See [gtk.editable.Editable] for editable text widgets
*/
template CellEditableT()
{

  /**
      Get `editingCanceled` property.
      Returns: Indicates whether editing on the cell has been canceled.
  */
  @property bool editingCanceled()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editing-canceled");
  }

  /**
      Set `editingCanceled` property.
      Params:
        propval = Indicates whether editing on the cell has been canceled.
  */
  @property void editingCanceled(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editing-canceled", propval);
  }

  /**
      Emits the `GtkCellEditable::editing-done` signal.
  */
  override void editingDone()
  {
    gtk_cell_editable_editing_done(cast(GtkCellEditable*)this._cPtr);
  }

  /**
      Emits the `GtkCellEditable::remove-widget` signal.
  */
  override void removeWidget()
  {
    gtk_cell_editable_remove_widget(cast(GtkCellEditable*)this._cPtr);
  }

  /**
      Begins editing on a cell_editable.
      
      The [gtk.cell_renderer.CellRenderer] for the cell creates and returns a [gtk.cell_editable.CellEditable] from
      [gtk.cell_renderer.CellRenderer.startEditing], configured for the [gtk.cell_renderer.CellRenderer] type.
      
      [gtk.cell_editable.CellEditable.startEditing] can then set up cell_editable suitably for
      editing a cell, e.g. making the Esc key emit `GtkCellEditable::editing-done`.
      
      Note that the cell_editable is created on-demand for the current edit; its
      lifetime is temporary and does not persist across other edits and/or cells.
  
      Params:
        event = The [gdk.event.Event] that began the editing process, or
            null if editing was initiated programmatically
  */
  override void startEditing(gdk.event.Event event = null)
  {
    gtk_cell_editable_start_editing(cast(GtkCellEditable*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Connect to `EditingDone` signal.
  
      This signal is a sign for the cell renderer to update its
        value from the cell_editable.
        
        Implementations of [gtk.cell_editable.CellEditable] are responsible for
        emitting this signal when they are done editing, e.g.
        [gtk.entry.Entry] emits this signal when the user presses Enter. Typical things to
        do in a handler for ::editing-done are to capture the edited value,
        disconnect the cell_editable from signals on the [gtk.cell_renderer.CellRenderer], etc.
        
        [gtk.cell_editable.CellEditable.editingDone] is a convenience method
        for emitting `GtkCellEditable::editing-done`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.cell_editable.CellEditable cellEditable))
  
          `cellEditable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEditingDone(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.cell_editable.CellEditable)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-done", closure, after);
  }

  /**
      Connect to `RemoveWidget` signal.
  
      This signal is meant to indicate that the cell is finished
        editing, and the cell_editable widget is being removed and may
        subsequently be destroyed.
        
        Implementations of [gtk.cell_editable.CellEditable] are responsible for
        emitting this signal when they are done editing. It must
        be emitted after the `GtkCellEditable::editing-done` signal,
        to give the cell renderer a chance to update the cell's value
        before the widget is removed.
        
        [gtk.cell_editable.CellEditable.removeWidget] is a convenience method
        for emitting `GtkCellEditable::remove-widget`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.cell_editable.CellEditable cellEditable))
  
          `cellEditable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRemoveWidget(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.cell_editable.CellEditable)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("remove-widget", closure, after);
  }
}
