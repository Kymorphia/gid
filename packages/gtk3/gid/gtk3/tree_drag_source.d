/// Module for [TreeDragSource] interface
module gid.gtk3.tree_drag_source;

public import gid.core.basictypes;
public import gid.gtk3.tree_drag_source_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.selection_data;
import gid.gtk3.tree_path;
import gid.gtk3.types;

/** */
interface TreeDragSource : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_drag_source_get_type != &gidSymbolNotFound ? gtk_tree_drag_source_get_type() : cast(GType)0;
  }

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
  bool dragDataDelete(gid.gtk3.tree_path.TreePath path);

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
  bool dragDataGet(gid.gtk3.tree_path.TreePath path, gid.gtk3.selection_data.SelectionData selectionData);

  /**
      Asks the #GtkTreeDragSource whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  */
  bool rowDraggable(gid.gtk3.tree_path.TreePath path);
}

/// Fluent builder implementation template for [gid.gtk3.tree_drag_source.TreeDragSource]
interface TreeDragSourceGidBuilderImpl(T)
{
}
