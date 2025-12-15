/// Module for [TreeDragDest] interface mixin
module gtk.tree_drag_dest_mixin;

public import gtk.tree_drag_dest_iface_proxy;
public import gid.gid;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.selection_data;
public import gtk.tree_path;
public import gtk.types;

/** */
template TreeDragDestT()
{

  /**
      Asks the #GtkTreeDragDest to insert a row before the path dest,
      deriving the contents of the row from selection_data. If dest is
      outside the tree so that inserting before it is impossible, false
      will be returned. Also, false may be returned if the new row is
      not created for some model-specific reason.  Should robustly handle
      a dest no longer found in the model!
  
      Params:
        dest = row to drop in front of
        selectionData = data to drop
      Returns: whether a new row was created before position dest
  */
  override bool dragDataReceived(gtk.tree_path.TreePath dest, gtk.selection_data.SelectionData selectionData)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_dest_drag_data_received(cast(GtkTreeDragDest*)this._cPtr, dest ? cast(GtkTreePath*)dest._cPtr(No.Dup) : null, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether a drop is possible before the given dest_path,
      at the same depth as dest_path. i.e., can we drop the data in
      selection_data at that location. dest_path does not have to
      exist; the return value will almost certainly be false if the
      parent of dest_path doesn’t exist, though.
  
      Params:
        destPath = destination row
        selectionData = the data being dragged
      Returns: true if a drop is possible before dest_path
  */
  override bool rowDropPossible(gtk.tree_path.TreePath destPath, gtk.selection_data.SelectionData selectionData)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_dest_row_drop_possible(cast(GtkTreeDragDest*)this._cPtr, destPath ? cast(GtkTreePath*)destPath._cPtr(No.Dup) : null, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null);
    return _retval;
  }
}
