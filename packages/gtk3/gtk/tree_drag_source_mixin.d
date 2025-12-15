/// Module for [TreeDragSource] interface mixin
module gtk.tree_drag_source_mixin;

public import gtk.tree_drag_source_iface_proxy;
public import gid.gid;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.selection_data;
public import gtk.tree_path;
public import gtk.types;

/** */
template TreeDragSourceT()
{

  /**
      Asks the #GtkTreeDragSource to delete the row at path, because
      it was moved somewhere else via drag-and-drop. Returns false
      if the deletion fails because path no longer exists, or for
      some model-specific reason. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was being dragged
      Returns: true if the row was successfully deleted
  */
  override bool dragDataDelete(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_drag_data_delete(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the #GtkTreeDragSource to fill in selection_data with a
      representation of the row at path. selection_data->target gives
      the required type of the data.  Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was dragged
        selectionData = a #GtkSelectionData to fill with data
                           from the dragged row
      Returns: true if data of the required type was provided
  */
  override bool dragDataGet(gtk.tree_path.TreePath path, gtk.selection_data.SelectionData selectionData)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_drag_data_get(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the #GtkTreeDragSource whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  */
  override bool rowDraggable(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_row_draggable(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }
}
