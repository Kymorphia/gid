/// Module for [TreeDragDest] interface
module gtk.tree_drag_dest;

public import gtk.tree_drag_dest_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.selection_data;
import gtk.tree_path;
import gtk.types;

/** */
interface TreeDragDest
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_drag_dest_get_type != &gidSymbolNotFound ? gtk_tree_drag_dest_get_type() : cast(GType)0;
  }

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
  bool dragDataReceived(gtk.tree_path.TreePath dest, gtk.selection_data.SelectionData selectionData);

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
  bool rowDropPossible(gtk.tree_path.TreePath destPath, gtk.selection_data.SelectionData selectionData);
}

/// Fluent builder implementation template for [gtk.tree_drag_dest.TreeDragDest]
interface TreeDragDestGidBuilderImpl(T)
{
}
