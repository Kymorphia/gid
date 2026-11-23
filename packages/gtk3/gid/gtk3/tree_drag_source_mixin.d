/// Module for [TreeDragSource] interface mixin
module gid.gtk3.tree_drag_source_mixin;

public import gid.core.basictypes;
public import gid.gtk3.tree_drag_source_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.selection_data;
public import gid.gtk3.tree_path;
public import gid.gtk3.types;

/** */
template TreeDragSourceT()
{

  /**
      Asks the #GtkTreeDragSource to delete the row at path, because
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
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDragDataDelete(gid.gtk3.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_drag_source.TreeDragSource._getGType);
    if (!_klass || !_klass.dragDataDelete)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragDataDelete(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the #GtkTreeDragSource to fill in selection_data with a
      representation of the row at path. selection_data->target gives
      the required type of the data.  Should robustly handle a path no
      longer found in the model!
  
      Params:
        path = row that was dragged (modified in place, changes are seen by the caller)
        selectionData = a #GtkSelectionData to fill with data
                           from the dragged row (modified in place, changes are seen by the caller)
      Returns: true if data of the required type was provided
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDragDataGet`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDragDataGet(gid.gtk3.tree_path.TreePath path, gid.gtk3.selection_data.SelectionData selectionData)
  {
    auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_drag_source.TreeDragSource._getGType);
    if (!_klass || !_klass.dragDataGet)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragDataGet(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the #GtkTreeDragSource whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag (modified in place, changes are seen by the caller)
      Returns: true if the row can be dragged
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowDraggable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRowDraggable(gid.gtk3.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_drag_source.TreeDragSource._getGType);
    if (!_klass || !_klass.rowDraggable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.rowDraggable(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
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
  override bool dragDataDelete(gid.gtk3.tree_path.TreePath path) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_drag_data_delete(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

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
  override bool dragDataGet(gid.gtk3.tree_path.TreePath path, gid.gtk3.selection_data.SelectionData selectionData) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_drag_data_get(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the #GtkTreeDragSource whether a particular row can be used as
      the source of a DND operation. If the source doesn’t implement
      this interface, the row is assumed draggable.
  
      Params:
        path = row on which user is initiating a drag
      Returns: true if the row can be dragged
  */
  override bool rowDraggable(gid.gtk3.tree_path.TreePath path) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_source_row_draggable(cast(GtkTreeDragSource*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.tree_drag_source.TreeDragSource (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_tree_drag_source_TreeDragSource(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataDelete", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataGet", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDraggable", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.tree_drag_source.TreeDragSource vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_tree_drag_source_TreeDragSource(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataDelete", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_drag_source_TreeDragSource(iface, "drag_data_delete");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataGet", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_drag_source_TreeDragSource(iface, "drag_data_get");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDraggable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_drag_source_TreeDragSource(iface, "row_draggable");
  }

  private static void _installIfaceVfunc_gid_gtk3_tree_drag_source_TreeDragSource(void* iface, string vfunc) nothrow
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
            auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragSource), gid.gtk3.tree_drag_source.TreeDragSource._getGType);
            if (_klass && _klass.dragDataDelete)
              return (cast(typeof(&_vfuncDragDataDeleteTramp))_klass.dragDataDelete)(dragSource, path);
            return typeof(return).init;
          }

          bool _dretval;
          auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDragDataDelete(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_drag_source.TreeDragSource.vfuncDragDataDelete");
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
        static extern(C) gboolean _vfuncDragDataGetTramp(GtkTreeDragSource* dragSource, GtkTreePath* path, GtkSelectionData* selectionData) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dragSource);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragSource), gid.gtk3.tree_drag_source.TreeDragSource._getGType);
            if (_klass && _klass.dragDataGet)
              return (cast(typeof(&_vfuncDragDataGetTramp))_klass.dragDataGet)(dragSource, path, selectionData);
            return typeof(return).init;
          }

          bool _dretval;
          auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;
          auto _selectionData = selectionData ? new gid.gtk3.selection_data.SelectionData(cast(void*)selectionData, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDragDataGet(_path, _selectionData);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_drag_source.TreeDragSource.vfuncDragDataGet");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_path)
            _path._cUnborrow;
          if (_selectionData)
            _selectionData._cUnborrow;

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
            auto _klass = cast(GtkTreeDragSourceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragSource), gid.gtk3.tree_drag_source.TreeDragSource._getGType);
            if (_klass && _klass.rowDraggable)
              return (cast(typeof(&_vfuncRowDraggableTramp))_klass.rowDraggable)(dragSource, path);
            return typeof(return).init;
          }

          bool _dretval;
          auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncRowDraggable(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_drag_source.TreeDragSource.vfuncRowDraggable");
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

/// Fluent builder implementation template for [gid.gtk3.tree_drag_source.TreeDragSource]
template TreeDragSourceGidBuilderT()
{
}
