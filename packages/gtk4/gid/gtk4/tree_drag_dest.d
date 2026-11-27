/// Module for [TreeDragDest] interface
module gid.gtk4.tree_drag_dest;

public import gid.core.basictypes;
public import gid.gtk4.tree_drag_dest_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.tree_path;
import gid.gtk4.types;

/**
    Interface for Drag-and-Drop destinations in [gid.gtk4.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gid.gtk4.drop_target.DropTarget] to implement a drop destination
*/
@gidGir("TreeDragDest", "TreeDragDestIface")
interface TreeDragDest : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_drag_dest_get_type != &gidSymbolNotFound ? gtk_tree_drag_dest_get_type() : cast(GType)0;
  }



  /**
      Asks the [gid.gtk4.tree_drag_dest.TreeDragDest] to insert a row before the path dest,
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
  bool dragDataReceived(gid.gtk4.tree_path.TreePath dest, gid.gobject2.value.Value value);

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
  bool rowDropPossible(gid.gtk4.tree_path.TreePath destPath, gid.gobject2.value.Value value);
}

/// Fluent builder implementation template for [gid.gtk4.tree_drag_dest.TreeDragDest]
interface TreeDragDestGidBuilderImpl(T)
{
}
