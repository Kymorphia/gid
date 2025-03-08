module gtk.cell_editable_mixin;

public import gtk.cell_editable_iface_proxy;
public import gdk.event;
public import gid.gid;
public import gobject.dclosure;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The #GtkCellEditable interface must be implemented for widgets to be usable
  to edit the contents of a #GtkTreeView cell. It provides a way to specify how
  temporary widgets should be configured for editing, get the new value, etc.
*/
template CellEditableT()
{

  /**
      Emits the #GtkCellEditable::editing-done signal.
  */
  override void editingDone()
  {
    gtk_cell_editable_editing_done(cast(GtkCellEditable*)cPtr);
  }

  /**
      Emits the #GtkCellEditable::remove-widget signal.
  */
  override void removeWidget()
  {
    gtk_cell_editable_remove_widget(cast(GtkCellEditable*)cPtr);
  }

  /**
      Begins editing on a cell_editable.
    
    The #GtkCellRenderer for the cell creates and returns a #GtkCellEditable from
    [gtk.cell_renderer.CellRenderer.startEditing], configured for the #GtkCellRenderer type.
    
    [gtk.cell_editable.CellEditable.startEditing] can then set up cell_editable suitably for
    editing a cell, e.g. making the Esc key emit #GtkCellEditable::editing-done.
    
    Note that the cell_editable is created on-demand for the current edit; its
    lifetime is temporary and does not persist across other edits and/or cells.
    Params:
      event =       The #GdkEvent that began the editing process, or
          null if editing was initiated programmatically
  */
  override void startEditing(gdk.event.Event event = null)
  {
    gtk_cell_editable_start_editing(cast(GtkCellEditable*)cPtr, event ? cast(GdkEvent*)event.cPtr : null);
  }

  /**
      This signal is a sign for the cell renderer to update its
    value from the cell_editable.
    
    Implementations of #GtkCellEditable are responsible for
    emitting this signal when they are done editing, e.g.
    #GtkEntry emits this signal when the user presses Enter. Typical things to
    do in a handler for ::editing-done are to capture the edited value,
    disconnect the cell_editable from signals on the #GtkCellRenderer, etc.
    
    [gtk.cell_editable.CellEditable.editingDone] is a convenience method
    for emitting #GtkCellEditable::editing-done.
  
    ## Parameters
    $(LIST
      * $(B cellEditable) the instance the signal is connected to
    )
  */
  alias EditingDoneCallbackDlg = void delegate(gtk.cell_editable.CellEditable cellEditable);

  /** ditto */
  alias EditingDoneCallbackFunc = void function(gtk.cell_editable.CellEditable cellEditable);

  /**
    Connect to EditingDone signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEditingDone(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EditingDoneCallbackDlg) || is(T : EditingDoneCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellEditable = getVal!(gtk.cell_editable.CellEditable)(_paramVals);
      _dClosure.dlg(cellEditable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-done", closure, after);
  }

  /**
      This signal is meant to indicate that the cell is finished
    editing, and the cell_editable widget is being removed and may
    subsequently be destroyed.
    
    Implementations of #GtkCellEditable are responsible for
    emitting this signal when they are done editing. It must
    be emitted after the #GtkCellEditable::editing-done signal,
    to give the cell renderer a chance to update the cell's value
    before the widget is removed.
    
    [gtk.cell_editable.CellEditable.removeWidget] is a convenience method
    for emitting #GtkCellEditable::remove-widget.
  
    ## Parameters
    $(LIST
      * $(B cellEditable) the instance the signal is connected to
    )
  */
  alias RemoveWidgetCallbackDlg = void delegate(gtk.cell_editable.CellEditable cellEditable);

  /** ditto */
  alias RemoveWidgetCallbackFunc = void function(gtk.cell_editable.CellEditable cellEditable);

  /**
    Connect to RemoveWidget signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRemoveWidget(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RemoveWidgetCallbackDlg) || is(T : RemoveWidgetCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellEditable = getVal!(gtk.cell_editable.CellEditable)(_paramVals);
      _dClosure.dlg(cellEditable);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("remove-widget", closure, after);
  }
}
