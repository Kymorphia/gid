/// Module for [TreeRowReference] class
module gid.gtk4.tree_row_reference;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.tree_model;
import gid.gtk4.tree_path;
import gid.gtk4.types;

/**
    A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [gid.gtk4.tree_path.TreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with [gid.gtk4.tree_row_reference.TreeRowReference.new_].

    Deprecated: Use [gid.gio2.list_model.ListModel] instead
*/
class TreeRowReference : gid.gobject2.boxed.BoxedWrap!(gtk_tree_row_reference_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeRowReference self() nothrow
  {
    return this;
  }

  /**
      Creates a row reference based on path.
      
      This reference will keep pointing to the node pointed to
      by path, so long as it exists. Any changes that occur on model are
      propagated, and the path is updated appropriately. If
      path isn’t a valid path in model, then null is returned.
  
      Params:
        model = a [gid.gtk4.tree_model.TreeModel]
        path = a valid [gid.gtk4.tree_path.TreePath] to monitor
      Returns: a newly allocated [gid.gtk4.tree_row_reference.TreeRowReference]
  */
  this(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_path.TreePath path) nothrow
  {
    GtkTreeRowReference* _cretval;
    _cretval = gtk_tree_row_reference_new(model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      You do not need to use this function.
      
      Creates a row reference based on path.
      
      This reference will keep pointing to the node pointed to
      by path, so long as it exists. If path isn’t a valid
      path in model, then null is returned. However, unlike
      references created with [gid.gtk4.tree_row_reference.TreeRowReference.new_], it
      does not listen to the model for changes. The creator of
      the row reference must do this explicitly using
      [gid.gtk4.tree_row_reference.TreeRowReference.inserted], [gid.gtk4.tree_row_reference.TreeRowReference.deleted],
      [gid.gtk4.tree_row_reference.TreeRowReference.reordered].
      
      These functions must be called exactly once per proxy when the
      corresponding signal on the model is emitted. This single call
      updates all row references for that proxy. Since built-in GTK
      objects like [gid.gtk4.tree_view.TreeView] already use this mechanism internally,
      using them as the proxy object will produce unpredictable results.
      Further more, passing the same object as model and proxy
      doesn’t work for reasons of internal implementation.
      
      This type of row reference is primarily meant by structures that
      need to carefully monitor exactly when a row reference updates
      itself, and is not generally needed by most applications.
  
      Params:
        proxy = a proxy [gid.gobject2.object.ObjectWrap]
        model = a [gid.gtk4.tree_model.TreeModel]
        path = a valid [gid.gtk4.tree_path.TreePath] to monitor
      Returns: a newly allocated [gid.gtk4.tree_row_reference.TreeRowReference]
  */
  static gid.gtk4.tree_row_reference.TreeRowReference newProxy(gid.gobject2.object.ObjectWrap proxy, gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_path.TreePath path) nothrow
  {
    GtkTreeRowReference* _cretval;
    _cretval = gtk_tree_row_reference_new_proxy(proxy ? cast(GObject*)proxy._cPtr(No.Dup) : null, model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk4.tree_row_reference.TreeRowReference(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies a [gid.gtk4.tree_row_reference.TreeRowReference].
      Returns: a copy of reference
  */
  gid.gtk4.tree_row_reference.TreeRowReference copy() nothrow
  {
    GtkTreeRowReference* _cretval;
    _cretval = gtk_tree_row_reference_copy(cast(GtkTreeRowReference*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.tree_row_reference.TreeRowReference(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the model that the row reference is monitoring.
      Returns: the model
  */
  gid.gtk4.tree_model.TreeModel getModel() nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_row_reference_get_model(cast(GtkTreeRowReference*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a path that the row reference currently points to,
      or null if the path pointed to is no longer valid.
      Returns: a current path
  */
  gid.gtk4.tree_path.TreePath getPath() nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_row_reference_get_path(cast(GtkTreeRowReference*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns true if the reference is non-null and refers to
      a current valid path.
      Returns: true if reference points to a valid path
  */
  bool valid() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_row_reference_valid(cast(GtkTreeRowReference*)this._cPtr);
    return _retval;
  }

  /**
      Lets a set of row reference created by
      [gid.gtk4.tree_row_reference.TreeRowReference.newProxy] know that the
      model emitted the ::row-deleted signal.
  
      Params:
        proxy = a [gid.gobject2.object.ObjectWrap]
        path = the path position that was deleted
  */
  static void deleted(gid.gobject2.object.ObjectWrap proxy, gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_tree_row_reference_deleted(proxy ? cast(GObject*)proxy._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Lets a set of row reference created by
      [gid.gtk4.tree_row_reference.TreeRowReference.newProxy] know that the
      model emitted the ::row-inserted signal.
  
      Params:
        proxy = a [gid.gobject2.object.ObjectWrap]
        path = the row position that was inserted
  */
  static void inserted(gid.gobject2.object.ObjectWrap proxy, gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_tree_row_reference_inserted(proxy ? cast(GObject*)proxy._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }
}
