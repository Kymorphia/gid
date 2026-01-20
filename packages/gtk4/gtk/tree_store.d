/// Module for [TreeStore] class
module gtk.tree_store;

import gid.gid;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_drag_dest;
import gtk.tree_drag_dest_mixin;
import gtk.tree_drag_source;
import gtk.tree_drag_source_mixin;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_model_mixin;
import gtk.tree_sortable;
import gtk.tree_sortable_mixin;
import gtk.types;

/**
    A tree-like data structure that can be used with the [gtk.tree_view.TreeView].
    
    The [gtk.tree_store.TreeStore] object is a list model for use with a [gtk.tree_view.TreeView]
    widget. It implements the [gtk.tree_model.TreeModel] interface, and consequently,
    can use all of the methods available there. It also implements the
    [gtk.tree_sortable.TreeSortable] interface so it can be sorted by the view.
    Finally, it also implements the tree [drag][gtk.tree_drag_source.TreeDragSource]
    and [drop][gtk.tree_drag_dest.TreeDragDest] interfaces.
    
    [gtk.tree_store.TreeStore] is deprecated since GTK 4.10, and should not be used in newly
    written code. You should use [gtk.tree_list_model.TreeListModel] for a tree-like model
    object.
    
    ## GtkTreeStore as GtkBuildable
    
    The GtkTreeStore implementation of the [gtk.buildable.Buildable] interface allows
    to specify the model columns with a `<columns>` element that may contain
    multiple `<column>` elements, each specifying one model column. The “type”
    attribute specifies the data type for the column.
    
    An example of a UI Definition fragment for a tree store:
    
    ```xml
    <object class="GtkTreeStore">
      <columns>
        <column type="gchararray"/>
        <column type="gchararray"/>
        <column type="gint"/>
      </columns>
    </object>
    ```

    Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
*/
class TreeStore : gobject.object.ObjectWrap, gtk.buildable.Buildable, gtk.tree_drag_dest.TreeDragDest, gtk.tree_drag_source.TreeDragSource, gtk.tree_model.TreeModel, gtk.tree_sortable.TreeSortable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_store_get_type != &gidSymbolNotFound ? gtk_tree_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeStore self()
  {
    return this;
  }

  mixin BuildableT!();
  mixin TreeDragDestT!();
  mixin TreeDragSourceT!();
  mixin TreeModelT!();
  mixin TreeSortableT!();

  /**
      Creates a new tree store.
      
      This constructor is meant for language bindings.
  
      Params:
        types = an array of [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] types for the columns, from first to last
      Returns: a new [gtk.tree_store.TreeStore]
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  static gtk.tree_store.TreeStore new_(gobject.types.GType[] types)
  {
    GtkTreeStore* _cretval;
    int _nColumns;
    if (types)
      _nColumns = cast(int)types.length;

    auto _types = cast(GType*)types.ptr;
    _cretval = gtk_tree_store_newv(_nColumns, _types);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_store.TreeStore)(cast(GtkTreeStore*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends a new row to tree_store.
      
      If parent is non-null, then it will append the new row after the last
      child of parent, otherwise it will append a row to the top level.
      
      The iter parameter will be changed to point to this new row. The row will
      be empty after this function is called. To fill in values, you need to call
      [gtk.tree_store.TreeStore.set] or [gtk.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the appended row
        parent = A valid [gtk.tree_iter.TreeIter]
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void append(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent)
  {
    gtk_tree_store_append(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&parent);
  }

  /**
      Removes all rows from tree_store
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void clear()
  {
    gtk_tree_store_clear(cast(GtkTreeStore*)this._cPtr);
  }

  /**
      Creates a new row at position.
      
      If parent is non-null, then the row will be made a child of parent.
      Otherwise, the row will be created at the toplevel.
      
      If position is `-1` or is larger than the number of rows at that level,
      then the new row will be inserted to the end of the list.
      
      The iter parameter will be changed to point to this new row. The row
      will be empty after this function is called. To fill in values, you
      need to call [gtk.tree_store.TreeStore.set] or [gtk.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        parent = A valid [gtk.tree_iter.TreeIter]
        position = position to insert the new row, or -1 for last
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void insert(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent, int position)
  {
    gtk_tree_store_insert(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&parent, position);
  }

  /**
      Inserts a new row after sibling.
      
      If sibling is null, then the row will be prepended to parent’s children.
      
      If parent and sibling are null, then the row will be prepended to the
      toplevel.
      
      If both sibling and parent are set, then parent must be the parent
      of sibling. When sibling is set, parent is optional.
      
      The iter parameter will be changed to point to this new row. The row will
      be empty after this function is called. To fill in values, you need to call
      [gtk.tree_store.TreeStore.set] or [gtk.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        parent = A valid [gtk.tree_iter.TreeIter]
        sibling = A valid [gtk.tree_iter.TreeIter]
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void insertAfter(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent, gtk.tree_iter.TreeIter sibling)
  {
    gtk_tree_store_insert_after(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&parent, cast(GtkTreeIter*)&sibling);
  }

  /**
      Inserts a new row before sibling.
      
      If sibling is null, then the row will be appended to parent’s children.
      
      If parent and sibling are null, then the row will be appended to the
      toplevel.
      
      If both sibling and parent are set, then parent must be the parent
      of sibling. When sibling is set, parent is optional.
      
      The iter parameter will be changed to point to this new row. The row will
      be empty after this function is called. To fill in values, you need to call
      [gtk.tree_store.TreeStore.set] or [gtk.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        parent = A valid [gtk.tree_iter.TreeIter]
        sibling = A valid [gtk.tree_iter.TreeIter]
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void insertBefore(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent, gtk.tree_iter.TreeIter sibling)
  {
    gtk_tree_store_insert_before(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&parent, cast(GtkTreeIter*)&sibling);
  }

  /**
      A variant of [gtk.tree_store.TreeStore.insertWithValues] which takes
      the columns and values as two arrays, instead of varargs.
      
      This function is mainly intended for language bindings.
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set the new row
        parent = A valid [gtk.tree_iter.TreeIter]
        position = position to insert the new row, or -1 for last
        columns = an array of column numbers
        values = an array of GValues
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void insertWithValues(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent, int position, int[] columns, gobject.value.Value[] values)
  {
    int _nValues;
    if (columns)
      _nValues = cast(int)columns.length;

    auto _columns = cast(int*)columns.ptr;
    if (values)
      _nValues = cast(int)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj._cPtr;
    GValue* _values = _tmpvalues.ptr;

    gtk_tree_store_insert_with_valuesv(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&parent, position, _columns, _values, _nValues);
  }

  /**
      Checks if iter is an ancestor of descendant.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter]
        descendant = A valid [gtk.tree_iter.TreeIter]
      Returns: true if iter is an ancestor of descendant, and false otherwise
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  bool isAncestor(gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter descendant)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_store_is_ancestor(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&descendant);
    return _retval;
  }

  /**
      Returns the depth of the position pointed by the iterator
      
      The depth will be 0 for anything on the root level, 1 for anything down
      a level, etc.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter]
      Returns: The depth of the position pointed by the iterator
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  int iterDepth(gtk.tree_iter.TreeIter iter)
  {
    int _retval;
    _retval = gtk_tree_store_iter_depth(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter);
    return _retval;
  }

  /**
      Checks if the given iter is a valid iter for this [gtk.tree_store.TreeStore].
      
      This function is slow. Only use it for debugging and/or testing
      purposes.
  
      Params:
        iter = the iterator to check
      Returns: true if the iter is valid, and false otherwise
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  bool iterIsValid(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_store_iter_is_valid(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter);
    return _retval;
  }

  /**
      Moves iter in tree_store to the position after position.
      
      iter and position should be in the same level.
      
      Note that this function only works with unsorted stores.
      
      If position is null, iter will be moved to the start of the level.
  
      Params:
        iter = A [gtk.tree_iter.TreeIter].
        position = A [gtk.tree_iter.TreeIter].
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void moveAfter(gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter position)
  {
    gtk_tree_store_move_after(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&position);
  }

  /**
      Moves iter in tree_store to the position before position.
      
      iter and position should be in the same level.
      
      Note that this function only works with unsorted stores.
      
      If position is null, iter will be moved to the end of the level.
  
      Params:
        iter = A [gtk.tree_iter.TreeIter]
        position = A [gtk.tree_iter.TreeIter]
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void moveBefore(gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter position)
  {
    gtk_tree_store_move_before(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&position);
  }

  /**
      Prepends a new row to tree_store.
      
      If parent is non-null, then it will prepend the new row before the first
      child of parent, otherwise it will prepend a row to the top level. The
      `iter` parameter will be changed to point to this new row.  The row will
      be empty after this function is called. To fill in values, you need to
      call [gtk.tree_store.TreeStore.set] or [gtk.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the prepended row
        parent = A valid [gtk.tree_iter.TreeIter]
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void prepend(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent)
  {
    gtk_tree_store_prepend(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, cast(GtkTreeIter*)&parent);
  }

  /**
      Removes iter from tree_store.
      
      After being removed, iter is set to the next valid row at that level, or
      invalidated if it previously pointed to the last one.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter]
      Returns: true if iter is still valid, and false otherwise
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  bool remove(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_store_remove(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter);
    return _retval;
  }

  /**
      Sets the type of the columns in a tree store.
      
      This function is meant primarily for types that inherit from
      [gtk.tree_store.TreeStore], and should only be used when constructing a new
      [gtk.tree_store.TreeStore].
      
      This functions cannot be called after a row has been added,
      or a method on the [gtk.tree_model.TreeModel] interface is called on the
      tree store.
  
      Params:
        types = An array of [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] types, one for each column
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void setColumnTypes(gobject.types.GType[] types)
  {
    int _nColumns;
    if (types)
      _nColumns = cast(int)types.length;

    auto _types = cast(GType*)types.ptr;
    gtk_tree_store_set_column_types(cast(GtkTreeStore*)this._cPtr, _nColumns, _types);
  }

  /**
      Sets the data in the cell specified by iter and column.
      
      The type of value must be convertible to the type of the
      column.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter] for the row being modified
        column = column number to modify
        value = new value for the cell
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void setValue(gtk.tree_iter.TreeIter iter, int column, gobject.value.Value value)
  {
    gtk_tree_store_set_value(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, column, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      A variant of [gtk.tree_store.TreeStore.setValist] which takes
      the columns and values as two arrays, instead of using variadic
      arguments.
      
      This function is mainly intended for language bindings or in case
      the number of columns to change is not known until run-time.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter] for the row being modified
        columns = an array of column numbers
        values = an array of GValues
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void set(gtk.tree_iter.TreeIter iter, int[] columns, gobject.value.Value[] values)
  {
    int _nValues;
    if (columns)
      _nValues = cast(int)columns.length;

    auto _columns = cast(int*)columns.ptr;
    if (values)
      _nValues = cast(int)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj._cPtr;
    GValue* _values = _tmpvalues.ptr;

    gtk_tree_store_set_valuesv(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&iter, _columns, _values, _nValues);
  }

  /**
      Swaps `a` and `b` in the same level of tree_store.
      
      Note that this function only works with unsorted stores.
  
      Params:
        a = A [gtk.tree_iter.TreeIter].
        b = Another [gtk.tree_iter.TreeIter].
  
      Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
  */
  void swap(gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b)
  {
    gtk_tree_store_swap(cast(GtkTreeStore*)this._cPtr, cast(GtkTreeIter*)&a, cast(GtkTreeIter*)&b);
  }
}
