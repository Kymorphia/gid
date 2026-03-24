/// Module for [TreeDragSource] interface
module gtk.tree_drag_source;

public import gtk.tree_drag_source_iface_proxy;
import gdk.content_provider;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_path;
import gtk.types;

/**
    Interface for Drag-and-Drop destinations in [gtk.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gtk.drag_source.DragSource] to implement a drag source
*/
interface TreeDragSource
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_drag_source_get_type != &gidSymbolNotFound ? gtk_tree_drag_source_get_type() : cast(GType)0;
  }

  /**
      Asks the [gtk.tree_drag_source.TreeDragSource] to delete the row at path, because
      it was moved somewhere else via drag-and-drop. Returns false
      if the deletion fails because path no longer exists, or for
      some model-specific reason. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was being dragged
      Returns: true if the row was successfully deleted
  
      Deprecated: Use list models instead
  */
  bool dragDataDelete(gtk.tree_path.TreePath path);

  /**
      Asks the [gtk.tree_drag_source.TreeDragSource] to return a [gdk.content_provider.ContentProvider] representing
      the row at path. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was dragged
      Returns: a [gdk.content_provider.ContentProvider] for the
           given path
  
      Deprecated: Use list models instead
  */
  gdk.content_provider.ContentProvider dragDataGet(gtk.tree_path.TreePath path);

  /**
      Asks the [gtk.tree_drag_source.TreeDragSource] whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  
      Deprecated: Use list models instead
  */
  bool rowDraggable(gtk.tree_path.TreePath path);
}

interface TreeDragSourceGidBuilderImpl(T)
{
}
