/// Module for [TreeDragDest] interface mixin
module gid.gtk4.tree_drag_dest_mixin;

public import gid.core.basictypes;
public import gid.gtk4.tree_drag_dest_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.value;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.tree_path;
public import gid.gtk4.types;

/**
    Interface for Drag-and-Drop destinations in [gid.gtk4.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gid.gtk4.drop_target.DropTarget] to implement a drop destination
*/
template TreeDragDestT()
{

  /**
      Asks the [gid.gtk4.tree_drag_dest.TreeDragDest] to insert a row before the path dest,
      deriving the contents of the row from value. If dest is
      outside the tree so that inserting before it is impossible, false
      will be returned. Also, false may be returned if the new row is
      not created for some model-specific reason.  Should robustly handle
      a dest no longer found in the model!
  
      Params:
        dest = row to drop in front of (modified in place, changes are seen by the caller)
        value = data to drop
      Returns: whether a new row was created before position dest
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDragDataReceived`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use list models instead
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDragDataReceived(gid.gtk4.tree_path.TreePath dest, gid.gobject2.value.Value value)
  {
    auto _klass = cast(GtkTreeDragDestIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_drag_dest.TreeDragDest._getGType);
    if (!_klass || !_klass.dragDataReceived)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragDataReceived(cast(GtkTreeDragDest*)this._cPtr, dest ? cast(GtkTreePath*)dest._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether a drop is possible before the given dest_path,
      at the same depth as dest_path. i.e., can we drop the data in
      value at that location. dest_path does not have to
      exist; the return value will almost certainly be false if the
      parent of dest_path doesn’t exist, though.
  
      Params:
        destPath = destination row (modified in place, changes are seen by the caller)
        value = the data being dropped
      Returns: true if a drop is possible before dest_path
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowDropPossible`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use list models instead
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRowDropPossible(gid.gtk4.tree_path.TreePath destPath, gid.gobject2.value.Value value)
  {
    auto _klass = cast(GtkTreeDragDestIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_drag_dest.TreeDragDest._getGType);
    if (!_klass || !_klass.rowDropPossible)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.rowDropPossible(cast(GtkTreeDragDest*)this._cPtr, destPath ? cast(GtkTreePath*)destPath._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
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
  override bool dragDataReceived(gid.gtk4.tree_path.TreePath dest, gid.gobject2.value.Value value) nothrow
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
  override bool rowDropPossible(gid.gtk4.tree_path.TreePath destPath, gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_drag_dest_row_drop_possible(cast(GtkTreeDragDest*)this._cPtr, destPath ? cast(GtkTreePath*)destPath._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.tree_drag_dest.TreeDragDest (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_tree_drag_dest_TreeDragDest(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataReceived", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDropPossible", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.tree_drag_dest.TreeDragDest vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_tree_drag_dest_TreeDragDest(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDragDataReceived", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_drag_dest_TreeDragDest(iface, "drag_data_received");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDropPossible", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_drag_dest_TreeDragDest(iface, "row_drop_possible");
  }

  private static void _installIfaceVfunc_gid_gtk4_tree_drag_dest_TreeDragDest(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkTreeDragDestIface*)iface;

    switch (vfunc)
    {
      case "drag_data_received":
      {
        static extern(C) gboolean _vfuncDragDataReceivedTramp(GtkTreeDragDest* dragDest, GtkTreePath* dest, const(GValue)* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dragDest);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeDragDestIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragDest), gid.gtk4.tree_drag_dest.TreeDragDest._getGType);
            if (_klass && _klass.dragDataReceived)
              return (cast(typeof(&_vfuncDragDataReceivedTramp))_klass.dragDataReceived)(dragDest, dest, value);
            return typeof(return).init;
          }

          bool _dretval;
          auto _dest = dest ? new gid.gtk4.tree_path.TreePath(cast(void*)dest, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDragDataReceived(_dest, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_drag_dest.TreeDragDest.vfuncDragDataReceived");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_dest)
            _dest._cUnborrow;

          return _retval;
        }

        _klass.dragDataReceived = cast(typeof(_klass.dragDataReceived))&_vfuncDragDataReceivedTramp;
        break;
      }
      case "row_drop_possible":
      {
        static extern(C) gboolean _vfuncRowDropPossibleTramp(GtkTreeDragDest* dragDest, GtkTreePath* destPath, const(GValue)* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dragDest);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeDragDestIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dragDest), gid.gtk4.tree_drag_dest.TreeDragDest._getGType);
            if (_klass && _klass.rowDropPossible)
              return (cast(typeof(&_vfuncRowDropPossibleTramp))_klass.rowDropPossible)(dragDest, destPath, value);
            return typeof(return).init;
          }

          bool _dretval;
          auto _destPath = destPath ? new gid.gtk4.tree_path.TreePath(cast(void*)destPath, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncRowDropPossible(_destPath, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_drag_dest.TreeDragDest.vfuncRowDropPossible");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_destPath)
            _destPath._cUnborrow;

          return _retval;
        }

        _klass.rowDropPossible = cast(typeof(_klass.rowDropPossible))&_vfuncRowDropPossibleTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_drag_dest.TreeDragDest]
template TreeDragDestGidBuilderT()
{
}
