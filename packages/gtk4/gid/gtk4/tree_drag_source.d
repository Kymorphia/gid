/// Module for [TreeDragSource] interface
module gid.gtk4.tree_drag_source;

public import gid.core.basictypes;
public import gid.gtk4.tree_drag_source_iface_proxy;
import gid.core.gid;
import gid.gdk4.content_provider;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.tree_path;
import gid.gtk4.types;

/**
    Interface for Drag-and-Drop destinations in [gid.gtk4.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gid.gtk4.drag_source.DragSource] to implement a drag source
*/
interface TreeDragSource : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_drag_source_get_type != &gidSymbolNotFound ? gtk_tree_drag_source_get_type() : cast(GType)0;
  }

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] to delete the row at path, because
      it was moved somewhere else via drag-and-drop. Returns false
      if the deletion fails because path no longer exists, or for
      some model-specific reason. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was being dragged
      Returns: true if the row was successfully deleted
  
      Deprecated: Use list models instead
  */
  bool dragDataDelete(gid.gtk4.tree_path.TreePath path);

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] to return a [gid.gdk4.content_provider.ContentProvider] representing
      the row at path. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was dragged
      Returns: a [gid.gdk4.content_provider.ContentProvider] for the
           given path
  
      Deprecated: Use list models instead
  */
  gid.gdk4.content_provider.ContentProvider dragDataGet(gid.gtk4.tree_path.TreePath path);

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  
      Deprecated: Use list models instead
  */
  bool rowDraggable(gid.gtk4.tree_path.TreePath path);
}

/// Fluent builder implementation template for [gid.gtk4.tree_drag_source.TreeDragSource]
interface TreeDragSourceGidBuilderImpl(T)
{
}
