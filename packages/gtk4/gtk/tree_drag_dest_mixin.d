/// Module for [TreeDragDest] interface mixin
module gtk.tree_drag_dest_mixin;

public import gtk.tree_drag_dest_iface_proxy;
public import gid.gid;
public import gobject.value;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.tree_path;
public import gtk.types;

/**
    Interface for Drag-and-Drop destinations in [gtk.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gtk.drop_target.DropTarget] to implement a drop destination
*/
template TreeDragDestT()
{

  /**
      Asks the [gtk.tree_drag_dest.TreeDragDest] to insert a row before the path dest,
      deriving the contents of the row from value. If dest is
      outside the tree so that inserting before it is impossible, false
      will be returned. Also, false may be returned if the new row is
      not created for some model-specific reason.  Should robustly handle
      a dest no longer found in the model!
  
      Params:
        dest = row to drop in front of
        value = data to drop
      Returns: whether a new row was created before position dest
  
      Deprecated: Use list models instead
  */
  override bool dragDataReceived(gtk.tree_path.TreePath dest, gobject.value.Value value)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_dest_drag_data_received(cast(GtkTreeDragDest*)this._cPtr, dest ? cast(GtkTreePath*)dest._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether a drop is possible before the given dest_path,
      at the same depth as dest_path. i.e., can we drop the data in
      value at that location. dest_path does not have to
      exist; the return value will almost certainly be false if the
      parent of dest_path doesn’t exist, though.
  
      Params:
        destPath = destination row
        value = the data being dropped
      Returns: true if a drop is possible before dest_path
  
      Deprecated: Use list models instead
  */
  override bool rowDropPossible(gtk.tree_path.TreePath destPath, gobject.value.Value value)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_dest_row_drop_possible(cast(GtkTreeDragDest*)this._cPtr, destPath ? cast(GtkTreePath*)destPath._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }
}
