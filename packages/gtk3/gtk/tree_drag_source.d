/// Module for [TreeDragSource] interface
module gtk.tree_drag_source;

public import gtk.tree_drag_source_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.selection_data;
import gtk.tree_path;
import gtk.types;

/** */
interface TreeDragSource
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
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
  bool dragDataDelete(gtk.tree_path.TreePath path);

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
  bool dragDataGet(gtk.tree_path.TreePath path, gtk.selection_data.SelectionData selectionData);

  /**
      Asks the #GtkTreeDragSource whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  */
  bool rowDraggable(gtk.tree_path.TreePath path);
}

/// Fluent builder implementation template for [gtk.tree_drag_source.TreeDragSource]
interface TreeDragSourceGidBuilderImpl(T)
{
}
