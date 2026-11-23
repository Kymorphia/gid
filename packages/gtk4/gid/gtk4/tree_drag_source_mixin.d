/// Module for [TreeDragSource] interface mixin
module gid.gtk4.tree_drag_source_mixin;

public import gid.core.basictypes;
public import gid.gtk4.tree_drag_source_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.content_provider;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.tree_path;
public import gid.gtk4.types;

/**
    Interface for Drag-and-Drop destinations in [gid.gtk4.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gid.gtk4.drag_source.DragSource] to implement a drag source
*/
template TreeDragSourceT()
{

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] to delete the row at path, because
      it was moved somewhere else via drag-and-drop. Returns false
      if the deletion fails because path no longer exists, or for
      some model-specific reason. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was being dragged (modified in place, changes are seen by the caller)
      Returns: true if the row was successfully deleted
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDragDataDelete`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use list models instead
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDragDataDelete(gid.gtk4.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_drag_source.TreeDragSource._getGType);
    if (!_klass || !_klass.dragDataDelete)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragDataDelete(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] to return a [gid.gdk4.content_provider.ContentProvider] representing
      the row at path. Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was dragged (modified in place, changes are seen by the caller)
      Returns: a [gid.gdk4.content_provider.ContentProvider] for the
           given path
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDragDataGet`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use list models instead
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gdk4.content_provider.ContentProvider vfuncDragDataGet(gid.gtk4.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_drag_source.TreeDragSource._getGType);
    if (!_klass || !_klass.dragDataGet)
      return typeof(return).init;

    GdkContentProvider* _cretval;
    _cretval = _klass.dragDataGet(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag (modified in place, changes are seen by the caller)
      Returns: true if the row can be dragged
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowDraggable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use list models instead
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRowDraggable(gid.gtk4.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_drag_source.TreeDragSource._getGType);
    if (!_klass || !_klass.rowDraggable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.rowDraggable(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
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
  override bool dragDataDelete(gid.gtk4.tree_path.TreePath path) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_drag_data_delete(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

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
  override gid.gdk4.content_provider.ContentProvider dragDataGet(gid.gtk4.tree_path.TreePath path) nothrow
  {
    GdkContentProvider* _cretval;
    _cretval = gtk_tree_drag_source_drag_data_get(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asks the [gid.gtk4.tree_drag_source.TreeDragSource] whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  
      Deprecated: Use list models instead
  */
  override bool rowDraggable(gid.gtk4.tree_path.TreePath path) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_row_draggable(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.tree_drag_source.TreeDragSource (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_tree_drag_source_TreeDragSource(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataDelete", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataGet", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDraggable", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.tree_drag_source.TreeDragSource vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_tree_drag_source_TreeDragSource(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataDelete", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_drag_source_TreeDragSource(iface, "drag_data_delete");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataGet", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_drag_source_TreeDragSource(iface, "drag_data_get");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDraggable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_drag_source_TreeDragSource(iface, "row_draggable");
  }

  private static void _installIfaceVfunc_gid_gtk4_tree_drag_source_TreeDragSource(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkTreeDragSourceIface*)iface;

    switch (vfunc)
    {
      case "drag_data_delete":
      {
        static extern(C) gboolean _vfuncDragDataDeleteTramp(GtkTreeDragSource* dragSource, GtkTreePath* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dragSource);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragSource), gid.gtk4.tree_drag_source.TreeDragSource._getGType);
            if (_klass && _klass.dragDataDelete)
              return (cast(typeof(&_vfuncDragDataDeleteTramp))_klass.dragDataDelete)(dragSource, path);
            return typeof(return).init;
          }

          bool _dretval;
          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDragDataDelete(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_drag_source.TreeDragSource.vfuncDragDataDelete");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_path)
            _path._cUnborrow;

          return _retval;
        }

        _klass.dragDataDelete = cast(typeof(_klass.dragDataDelete))&_vfuncDragDataDeleteTramp;
        break;
      }
      case "drag_data_get":
      {
        static extern(C) GdkContentProvider* _vfuncDragDataGetTramp(GtkTreeDragSource* dragSource, GtkTreePath* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dragSource);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragSource), gid.gtk4.tree_drag_source.TreeDragSource._getGType);
            if (_klass && _klass.dragDataGet)
              return (cast(typeof(&_vfuncDragDataGetTramp))_klass.dragDataGet)(dragSource, path);
            return typeof(return).init;
          }

          gid.gdk4.content_provider.ContentProvider _dretval;
          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDragDataGet(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_drag_source.TreeDragSource.vfuncDragDataGet");
          }
          auto _retval = _dretval ? cast(GdkContentProvider*)_dretval._cPtr(Yes.Dup) : null;
          if (_path)
            _path._cUnborrow;

          return _retval;
        }

        _klass.dragDataGet = cast(typeof(_klass.dragDataGet))&_vfuncDragDataGetTramp;
        break;
      }
      case "row_draggable":
      {
        static extern(C) gboolean _vfuncRowDraggableTramp(GtkTreeDragSource* dragSource, GtkTreePath* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dragSource);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragSource), gid.gtk4.tree_drag_source.TreeDragSource._getGType);
            if (_klass && _klass.rowDraggable)
              return (cast(typeof(&_vfuncRowDraggableTramp))_klass.rowDraggable)(dragSource, path);
            return typeof(return).init;
          }

          bool _dretval;
          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncRowDraggable(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_drag_source.TreeDragSource.vfuncRowDraggable");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_path)
            _path._cUnborrow;

          return _retval;
        }

        _klass.rowDraggable = cast(typeof(_klass.rowDraggable))&_vfuncRowDraggableTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_drag_source.TreeDragSource]
template TreeDragSourceGidBuilderT()
{
}
