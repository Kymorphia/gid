/// Module for [TreeRowReference] class
module gtk.tree_row_reference;

import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_model;
import gtk.tree_path;
import gtk.types;

/**
    A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [gtk.tree_path.TreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with [gtk.tree_row_reference.TreeRowReference.new_].

    Deprecated: Use [gio.list_model.ListModel] instead
*/
class TreeRowReference : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_row_reference_get_type != &gidSymbolNotFound ? gtk_tree_row_reference_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeRowReference self()
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
        model = a [gtk.tree_model.TreeModel]
        path = a valid [gtk.tree_path.TreePath] to monitor
      Returns: a newly allocated [gtk.tree_row_reference.TreeRowReference]
  */
  this(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path)
  {
    GtkTreeRowReference* _cretval;
    _cretval = gtk_tree_row_reference_new(model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      You do not need to use this function.
      
      Creates a row reference based on path.
      
      This reference will keep pointing to the node pointed to
      by path, so long as it exists. If path isn’t a valid
      path in model, then null is returned. However, unlike
      references created with [gtk.tree_row_reference.TreeRowReference.new_], it
      does not listen to the model for changes. The creator of
      the row reference must do this explicitly using
      [gtk.tree_row_reference.TreeRowReference.inserted], [gtk.tree_row_reference.TreeRowReference.deleted],
      [gtk.tree_row_reference.TreeRowReference.reordered].
      
      These functions must be called exactly once per proxy when the
      corresponding signal on the model is emitted. This single call
      updates all row references for that proxy. Since built-in GTK
      objects like [gtk.tree_view.TreeView] already use this mechanism internally,
      using them as the proxy object will produce unpredictable results.
      Further more, passing the same object as model and proxy
      doesn’t work for reasons of internal implementation.
      
      This type of row reference is primarily meant by structures that
      need to carefully monitor exactly when a row reference updates
      itself, and is not generally needed by most applications.
  
      Params:
        proxy = a proxy [gobject.object.ObjectWrap]
        model = a [gtk.tree_model.TreeModel]
        path = a valid [gtk.tree_path.TreePath] to monitor
      Returns: a newly allocated [gtk.tree_row_reference.TreeRowReference]
  */
  static gtk.tree_row_reference.TreeRowReference newProxy(gobject.object.ObjectWrap proxy, gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path)
  {
    GtkTreeRowReference* _cretval;
    _cretval = gtk_tree_row_reference_new_proxy(proxy ? cast(GObject*)proxy._cPtr(No.Dup) : null, model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.tree_row_reference.TreeRowReference(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies a [gtk.tree_row_reference.TreeRowReference].
      Returns: a copy of reference
  */
  gtk.tree_row_reference.TreeRowReference copy()
  {
    GtkTreeRowReference* _cretval;
    _cretval = gtk_tree_row_reference_copy(cast(GtkTreeRowReference*)this._cPtr);
    auto _retval = _cretval ? new gtk.tree_row_reference.TreeRowReference(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the model that the row reference is monitoring.
      Returns: the model
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_row_reference_get_model(cast(GtkTreeRowReference*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a path that the row reference currently points to,
      or null if the path pointed to is no longer valid.
      Returns: a current path
  */
  gtk.tree_path.TreePath getPath()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_row_reference_get_path(cast(GtkTreeRowReference*)this._cPtr);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns true if the reference is non-null and refers to
      a current valid path.
      Returns: true if reference points to a valid path
  */
  bool valid()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_row_reference_valid(cast(GtkTreeRowReference*)this._cPtr);
    return _retval;
  }

  /**
      Lets a set of row reference created by
      [gtk.tree_row_reference.TreeRowReference.newProxy] know that the
      model emitted the ::row-deleted signal.
  
      Params:
        proxy = a [gobject.object.ObjectWrap]
        path = the path position that was deleted
  */
  static void deleted(gobject.object.ObjectWrap proxy, gtk.tree_path.TreePath path)
  {
    gtk_tree_row_reference_deleted(proxy ? cast(GObject*)proxy._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Lets a set of row reference created by
      [gtk.tree_row_reference.TreeRowReference.newProxy] know that the
      model emitted the ::row-inserted signal.
  
      Params:
        proxy = a [gobject.object.ObjectWrap]
        path = the row position that was inserted
  */
  static void inserted(gobject.object.ObjectWrap proxy, gtk.tree_path.TreePath path)
  {
    gtk_tree_row_reference_inserted(proxy ? cast(GObject*)proxy._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }
}
