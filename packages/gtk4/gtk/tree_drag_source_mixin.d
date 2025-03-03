module gtk.tree_drag_source_mixin;

public import gtk.tree_drag_source_iface_proxy;
public import gdk.content_provider;
public import gid.gid;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.tree_path;
public import gtk.types;

/**
 * Interface for Drag-and-Drop destinations in `GtkTreeView`.

 * Deprecated: List views use widgets to display their contents.
 *   You can use [gtk.drag_source.DragSource] to implement a drag source
 */
template TreeDragSourceT()
{

  /**
   * Asks the `GtkTreeDragSource` to delete the row at path, because
   * it was moved somewhere else via drag-and-drop. Returns %FALSE
   * if the deletion fails because path no longer exists, or for
   * some model-specific reason. Should robustly handle a path no
   * longer found in the model!
   * Params:
   *   path = row that was being dragged
   * Returns: %TRUE if the row was successfully deleted

   * Deprecated: Use list models instead
   */
  override bool dragDataDelete(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = gtk_tree_drag_source_drag_data_delete(cast(GtkTreeDragSource*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Asks the `GtkTreeDragSource` to return a `GdkContentProvider` representing
   * the row at path. Should robustly handle a path no
   * longer found in the model!
   * Params:
   *   path = row that was dragged
   * Returns: a `GdkContentProvider` for the
   *   given path

   * Deprecated: Use list models instead
   */
  override gdk.content_provider.ContentProvider dragDataGet(gtk.tree_path.TreePath path)
  {
    GdkContentProvider* _cretval;
    _cretval = gtk_tree_drag_source_drag_data_get(cast(GtkTreeDragSource*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Asks the `GtkTreeDragSource` whether a particular row can be used as
   * the source of a DND operation. If the source doesn’t implement
   * this interface, the row is assumed draggable.
   * Params:
   *   path = row on which user is initiating a drag
   * Returns: %TRUE if the row can be dragged

   * Deprecated: Use list models instead
   */
  override bool rowDraggable(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = gtk_tree_drag_source_row_draggable(cast(GtkTreeDragSource*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    return _retval;
  }
}
