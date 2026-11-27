/// Module for [TreeStore] class
module gid.gtk3.tree_store;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.tree_drag_dest;
import gid.gtk3.tree_drag_dest_mixin;
import gid.gtk3.tree_drag_source;
import gid.gtk3.tree_drag_source_mixin;
import gid.gtk3.tree_iter;
import gid.gtk3.tree_model;
import gid.gtk3.tree_model_mixin;
import gid.gtk3.tree_sortable;
import gid.gtk3.tree_sortable_mixin;
import gid.gtk3.types;

/**
    The #GtkTreeStore object is a list model for use with a #GtkTreeView
    widget.  It implements the #GtkTreeModel interface, and consequentially,
    can use all of the methods available there.  It also implements the
    #GtkTreeSortable interface so it can be sorted by the view.  Finally,
    it also implements the tree
    [drag and drop][gtk3-GtkTreeView-drag-and-drop]
    interfaces.
    
    # GtkTreeStore as GtkBuildable
    
    The GtkTreeStore implementation of the #GtkBuildable interface allows
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
*/
@gidGir("TreeStore", "TreeStoreClass")
class TreeStore : gid.gobject2.object.ObjectWrap, gid.gtk3.buildable.Buildable, gid.gtk3.tree_drag_dest.TreeDragDest, gid.gtk3.tree_drag_source.TreeDragSource, gid.gtk3.tree_model.TreeModel, gid.gtk3.tree_sortable.TreeSortable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_store_get_type != &gidSymbolNotFound ? gtk_tree_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeStore";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeStore self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tree_store.TreeStore]
      Returns: New builder object
  */
  static TreeStoreGidBuilder builder() nothrow
  {
    return new TreeStoreGidBuilder;
  }

  mixin BuildableT!();
  mixin TreeDragDestT!();
  mixin TreeDragSourceT!();
  mixin TreeModelT!();
  mixin TreeSortableT!();

  /**
      Non vararg creation function.  Used primarily by language bindings.
  
      Params:
        types = an array of #GType types for the columns, from first to last
      Returns: a new #GtkTreeStore
  */
  static gid.gtk3.tree_store.TreeStore new_(gid.gobject2.types.GType[] types) nothrow
  {
    GtkTreeStore* _cretval;
    int _nColumns;
    if (types)
      _nColumns = cast(int)types.length;

    auto _types = cast(GType*)types.ptr;
    _cretval = gtk_tree_store_newv(_nColumns, _types);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_store.TreeStore)(cast(GtkTreeStore*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends a new row to tree_store.  If parent is non-null, then it will append the
      new row after the last child of parent, otherwise it will append a row to
      the top level.  iter will be changed to point to this new row.  The row will
      be empty after this function is called.  To fill in values, you need to call
      [gid.gtk4.tree_store.TreeStore.set] or [gid.gtk4.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset #GtkTreeIter to set to the appended row
        parent = A valid #GtkTreeIter, or null
  */
  void append(out gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter parent = null) nothrow
  {
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    gtk_tree_store_append(cast(GtkTreeStore*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Removes all rows from tree_store
  */
  void clear() nothrow
  {
    gtk_tree_store_clear(cast(GtkTreeStore*)this._cPtr);
  }

  /**
      Creates a new row at position.  If parent is non-null, then the row will be
      made a child of parent.  Otherwise, the row will be created at the toplevel.
      If position is -1 or is larger than the number of rows at that level, then
      the new row will be inserted to the end of the list.  iter will be changed
      to point to this new row.  The row will be empty after this function is
      called.  To fill in values, you need to call [gid.gtk4.tree_store.TreeStore.set] or
      [gid.gtk4.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset #GtkTreeIter to set to the new row
        parent = A valid #GtkTreeIter, or null
        position = position to insert the new row, or -1 for last
  */
  void insert(out gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter parent, int position) nothrow
  {
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    gtk_tree_store_insert(cast(GtkTreeStore*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, position);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Inserts a new row after sibling.  If sibling is null, then the row will be
      prepended to parent ’s children.  If parent and sibling are null, then
      the row will be prepended to the toplevel.  If both sibling and parent are
      set, then parent must be the parent of sibling.  When sibling is set,
      parent is optional.
      
      iter will be changed to point to this new row.  The row will be empty after
      this function is called.  To fill in values, you need to call
      [gid.gtk4.tree_store.TreeStore.set] or [gid.gtk4.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset #GtkTreeIter to set to the new row
        parent = A valid #GtkTreeIter, or null
        sibling = A valid #GtkTreeIter, or null
  */
  void insertAfter(out gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter parent = null, gid.gtk3.tree_iter.TreeIter sibling = null) nothrow
  {
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    gtk_tree_store_insert_after(cast(GtkTreeStore*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, sibling ? cast(GtkTreeIter*)sibling._cPtr(No.Dup) : null);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Inserts a new row before sibling.  If sibling is null, then the row will
      be appended to parent ’s children.  If parent and sibling are null, then
      the row will be appended to the toplevel.  If both sibling and parent are
      set, then parent must be the parent of sibling.  When sibling is set,
      parent is optional.
      
      iter will be changed to point to this new row.  The row will be empty after
      this function is called.  To fill in values, you need to call
      [gid.gtk4.tree_store.TreeStore.set] or [gid.gtk4.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset #GtkTreeIter to set to the new row
        parent = A valid #GtkTreeIter, or null
        sibling = A valid #GtkTreeIter, or null
  */
  void insertBefore(out gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter parent = null, gid.gtk3.tree_iter.TreeIter sibling = null) nothrow
  {
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    gtk_tree_store_insert_before(cast(GtkTreeStore*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, sibling ? cast(GtkTreeIter*)sibling._cPtr(No.Dup) : null);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
  }

  /**
      A variant of [gid.gtk4.tree_store.TreeStore.insertWithValues] which takes
      the columns and values as two arrays, instead of varargs.  This
      function is mainly intended for language bindings.
  
      Params:
        iter = An unset #GtkTreeIter to set the new row, or null.
        parent = A valid #GtkTreeIter, or null
        position = position to insert the new row, or -1 for last
        columns = an array of column numbers
        values = an array of GValues
  */
  void insertWithValues(out gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter parent, int position, int[] columns, gid.gobject2.value.Value[] values) nothrow
  {
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    int _nValues;
    if (columns)
      _nValues = cast(int)columns.length;

    auto _columns = cast(int*)columns.ptr;
    if (values)
      _nValues = cast(int)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    gtk_tree_store_insert_with_valuesv(cast(GtkTreeStore*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, position, _columns, _values, _nValues);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Returns true if iter is an ancestor of descendant.  That is, iter is the
      parent (or grandparent or great-grandparent) of descendant.
  
      Params:
        iter = A valid #GtkTreeIter
        descendant = A valid #GtkTreeIter
      Returns: true, if iter is an ancestor of descendant
  */
  bool isAncestor(gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter descendant) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_store_is_ancestor(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, descendant ? cast(GtkTreeIter*)descendant._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the depth of iter.  This will be 0 for anything on the root level, 1
      for anything down a level, etc.
  
      Params:
        iter = A valid #GtkTreeIter
      Returns: The depth of iter
  */
  int iterDepth(gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    int _retval;
    _retval = gtk_tree_store_iter_depth(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      WARNING: This function is slow. Only use it for debugging and/or testing
      purposes.
      
      Checks if the given iter is a valid iter for this #GtkTreeStore.
  
      Params:
        iter = A #GtkTreeIter.
      Returns: true if the iter is valid, false if the iter is invalid.
  */
  bool iterIsValid(gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_store_iter_is_valid(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter in tree_store to the position after position. iter and
      position should be in the same level. Note that this function only
      works with unsorted stores. If position is null, iter will be moved
      to the start of the level.
  
      Params:
        iter = A #GtkTreeIter.
        position = A #GtkTreeIter.
  */
  void moveAfter(gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter position = null) nothrow
  {
    gtk_tree_store_move_after(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, position ? cast(GtkTreeIter*)position._cPtr(No.Dup) : null);
  }

  /**
      Moves iter in tree_store to the position before position. iter and
      position should be in the same level. Note that this function only
      works with unsorted stores. If position is null, iter will be
      moved to the end of the level.
  
      Params:
        iter = A #GtkTreeIter.
        position = A #GtkTreeIter or null.
  */
  void moveBefore(gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter position = null) nothrow
  {
    gtk_tree_store_move_before(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, position ? cast(GtkTreeIter*)position._cPtr(No.Dup) : null);
  }

  /**
      Prepends a new row to tree_store.  If parent is non-null, then it will prepend
      the new row before the first child of parent, otherwise it will prepend a row
      to the top level.  iter will be changed to point to this new row.  The row
      will be empty after this function is called.  To fill in values, you need to
      call [gid.gtk4.tree_store.TreeStore.set] or [gid.gtk4.tree_store.TreeStore.setValue].
  
      Params:
        iter = An unset #GtkTreeIter to set to the prepended row
        parent = A valid #GtkTreeIter, or null
  */
  void prepend(out gid.gtk3.tree_iter.TreeIter iter, gid.gtk3.tree_iter.TreeIter parent = null) nothrow
  {
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    gtk_tree_store_prepend(cast(GtkTreeStore*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Removes iter from tree_store.  After being removed, iter is set to the
      next valid row at that level, or invalidated if it previously pointed to the
      last one.
  
      Params:
        iter = A valid #GtkTreeIter
      Returns: true if iter is still valid, false if not.
  */
  bool remove(gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_store_remove(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is meant primarily for #GObjects that inherit from
      #GtkTreeStore, and should only be used when constructing a new
      #GtkTreeStore.  It will not function after a row has been added,
      or a method on the #GtkTreeModel interface is called.
  
      Params:
        types = An array of #GType types, one for each column
  */
  void setColumnTypes(gid.gobject2.types.GType[] types) nothrow
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
        iter = A valid #GtkTreeIter for the row being modified
        column = column number to modify
        value = new value for the cell
  */
  void setValue(gid.gtk3.tree_iter.TreeIter iter, int column, gid.gobject2.value.Value value) nothrow
  {
    gtk_tree_store_set_value(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, column, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      A variant of [gid.gtk4.tree_store.TreeStore.setValist] which takes
      the columns and values as two arrays, instead of varargs.  This
      function is mainly intended for language bindings or in case
      the number of columns to change is not known until run-time.
  
      Params:
        iter = A valid #GtkTreeIter for the row being modified
        columns = an array of column numbers
        values = an array of GValues
  */
  void set(gid.gtk3.tree_iter.TreeIter iter, int[] columns, gid.gobject2.value.Value[] values) nothrow
  {
    int _nValues;
    if (columns)
      _nValues = cast(int)columns.length;

    auto _columns = cast(int*)columns.ptr;
    if (values)
      _nValues = cast(int)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    gtk_tree_store_set_valuesv(cast(GtkTreeStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, _columns, _values, _nValues);
  }

  /**
      Swaps `a` and `b` in the same level of tree_store. Note that this function
      only works with unsorted stores.
  
      Params:
        a = A #GtkTreeIter.
        b = Another #GtkTreeIter.
  */
  void swap(gid.gtk3.tree_iter.TreeIter a, gid.gtk3.tree_iter.TreeIter b) nothrow
  {
    gtk_tree_store_swap(cast(GtkTreeStore*)this._cPtr, a ? cast(GtkTreeIter*)a._cPtr(No.Dup) : null, b ? cast(GtkTreeIter*)b._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.tree_store.TreeStore]
class TreeStoreGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T, gid.gtk3.tree_drag_dest.TreeDragDestGidBuilderImpl!T, gid.gtk3.tree_drag_source.TreeDragSourceGidBuilderImpl!T, gid.gtk3.tree_model.TreeModelGidBuilderImpl!T, gid.gtk3.tree_sortable.TreeSortableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
  mixin TreeDragDestGidBuilderT!();
  mixin TreeDragSourceGidBuilderT!();
  mixin TreeModelGidBuilderT!();
  mixin TreeSortableGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.tree_store.TreeStore]
final class TreeStoreGidBuilder : TreeStoreGidBuilderImpl!TreeStoreGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeStore build() nothrow
  {
    return new TreeStore(cast(void*)createGObject(TreeStore._getGType), Yes.Take);
  }
}
