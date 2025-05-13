/// Module for [ListStore] class
module gtk.list_store;

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
    A list-like data structure that can be used with the [gtk.tree_view.TreeView].
    
    The [gtk.list_store.ListStore] object is a list model for use with a [gtk.tree_view.TreeView]
    widget.  It implements the [gtk.tree_model.TreeModel] interface, and consequentialy,
    can use all of the methods available there.  It also implements the
    [gtk.tree_sortable.TreeSortable] interface so it can be sorted by the view.
    Finally, it also implements the tree
    [drag](iface.TreeDragSource.html) and [drop](iface.TreeDragDest.html)
    interfaces.
    
    The [gtk.list_store.ListStore] can accept most [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s as a column type, though
    it can’t accept all custom types.  Internally, it will keep a copy of
    data passed in (such as a string or a boxed pointer).  Columns that
    accept [gobject.object.ObjectWrap]s are handled a little differently.  The
    [gtk.list_store.ListStore] will keep a reference to the object instead of copying the
    value.  As a result, if the object is modified, it is up to the
    application writer to call [gtk.tree_model.TreeModel.rowChanged] to emit the
    `signal@Gtk.TreeModel::row_changed` signal. This most commonly affects lists
    with [gdk.texture.Texture]s stored.
    
    An example for creating a simple list store:
    
    ```c
    enum {
      COLUMN_STRING,
      COLUMN_INT,
      COLUMN_BOOLEAN,
      N_COLUMNS
    };
    
    {
      GtkListStore *list_store;
      GtkTreePath *path;
      GtkTreeIter iter;
      int i;
    
      list_store = gtk_list_store_new (N_COLUMNS,
                                       G_TYPE_STRING,
                                       G_TYPE_INT,
                                       G_TYPE_BOOLEAN);
    
      for (i = 0; i < 10; i++)
        {
          char *some_data;
    
          some_data = get_some_data (i);
    
          // Add a new row to the model
          gtk_list_store_append (list_store, &iter);
          gtk_list_store_set (list_store, &iter,
                              COLUMN_STRING, some_data,
                              COLUMN_INT, i,
                              COLUMN_BOOLEAN,  FALSE,
                              -1);
    
          // As the store will keep a copy of the string internally,
          // we free some_data.
          g_free (some_data);
        }
    
      // Modify a particular row
      path = gtk_tree_path_new_from_string ("4");
      gtk_tree_model_get_iter (GTK_TREE_MODEL (list_store),
                               &iter,
                               path);
      gtk_tree_path_free (path);
      gtk_list_store_set (list_store, &iter,
                          COLUMN_BOOLEAN, TRUE,
                          -1);
    }
    ```
    
    [gtk.list_store.ListStore] is deprecated since GTK 4.10, and should not be used in newly
    written code. You should use [gio.list_store.ListStore] instead, and the various
    list models provided by GTK.
    
    ## Performance Considerations
    
    Internally, the [gtk.list_store.ListStore] was originally implemented with a linked list
    with a tail pointer.  As a result, it was fast at data insertion and deletion,
    and not fast at random data access.  The [gtk.list_store.ListStore] sets the
    [gtk.types.TreeModelFlags.ItersPersist] flag, which means that [gtk.tree_iter.TreeIter]s can be
    cached while the row exists.  Thus, if access to a particular row is needed
    often and your code is expected to run on older versions of GTK, it is worth
    keeping the iter around.
    
    ## Atomic Operations
    
    It is important to note that only the methods
    [gtk.list_store.ListStore.insertWithValues] and [gtk.list_store.ListStore.insertWithValuesv]
    are atomic, in the sense that the row is being appended to the store and the
    values filled in in a single operation with regard to [gtk.tree_model.TreeModel] signaling.
    In contrast, using e.g. [gtk.list_store.ListStore.append] and then [gtk.list_store.ListStore.set]
    will first create a row, which triggers the `GtkTreeModel::row-inserted` signal
    on [gtk.list_store.ListStore]. The row, however, is still empty, and any signal handler
    connecting to `GtkTreeModel::row-inserted` on this particular store should be prepared
    for the situation that the row might be empty. This is especially important
    if you are wrapping the [gtk.list_store.ListStore] inside a [gtk.tree_model.TreeModel]Filter and are
    using a [gtk.tree_model.TreeModel]FilterVisibleFunc. Using any of the non-atomic operations
    to append rows to the [gtk.list_store.ListStore] will cause the
    [gtk.tree_model.TreeModel]FilterVisibleFunc to be visited with an empty row first; the
    function must be prepared for that.
    
    ## GtkListStore as GtkBuildable
    
    The GtkListStore implementation of the [gtk.buildable.Buildable] interface allows
    to specify the model columns with a `<columns>` element that may contain
    multiple `<column>` elements, each specifying one model column. The “type”
    attribute specifies the data type for the column.
    
    Additionally, it is possible to specify content for the list store
    in the UI definition, with the `<data>` element. It can contain multiple
    `<row>` elements, each specifying to content for one row of the list model.
    Inside a `<row>`, the `<col>` elements specify the content for individual cells.
    
    Note that it is probably more common to define your models in the code,
    and one might consider it a layering violation to specify the content of
    a list store in a UI definition, data, not presentation, and common wisdom
    is to separate the two, as far as possible.
    
    An example of a UI Definition fragment for a list store:
    
    ```xml
    <object class="GtkListStore">
      <columns>
        <column type="gchararray"/>
        <column type="gchararray"/>
        <column type="gint"/>
      </columns>
      <data>
        <row>
          <col id="0">John</col>
          <col id="1">Doe</col>
          <col id="2">25</col>
        </row>
        <row>
          <col id="0">Johan</col>
          <col id="1">Dahlin</col>
          <col id="2">50</col>
        </row>
      </data>
    </object>
    ```

    Deprecated: Use [gio.list_store.ListStore] instead
*/
class ListStore : gobject.object.ObjectWrap, gtk.buildable.Buildable, gtk.tree_drag_dest.TreeDragDest, gtk.tree_drag_source.TreeDragSource, gtk.tree_model.TreeModel, gtk.tree_sortable.TreeSortable
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_store_get_type != &gidSymbolNotFound ? gtk_list_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListStore self()
  {
    return this;
  }

  mixin BuildableT!();
  mixin TreeDragDestT!();
  mixin TreeDragSourceT!();
  mixin TreeModelT!();
  mixin TreeSortableT!();

  /**
      Creates a new [gtk.list_store.ListStore].
      
      This function is meant to be used by language bindings.
  
      Params:
        types = an array of [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] types for the columns, from first to last
      Returns: a new [gtk.list_store.ListStore]
  
      Deprecated: Use [gio.list_store.ListStore] instead
  */
  static gtk.list_store.ListStore new_(gobject.types.GType[] types)
  {
    GtkListStore* _cretval;
    int _nColumns;
    if (types)
      _nColumns = cast(int)types.length;

    auto _types = cast(GType*)types.ptr;
    _cretval = gtk_list_store_newv(_nColumns, _types);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_store.ListStore)(cast(GtkListStore*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends a new row to list_store.  iter will be changed to point to this new
      row.  The row will be empty after this function is called.  To fill in
      values, you need to call [gtk.list_store.ListStore.set] or [gtk.list_store.ListStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the appended row
  
      Deprecated: Use list models
  */
  void append(out gtk.tree_iter.TreeIter iter)
  {
    GtkTreeIter _iter;
    gtk_list_store_append(cast(GtkListStore*)this._cPtr, &_iter);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
  }

  /**
      Removes all rows from the list store.
  
      Deprecated: Use list models
  */
  void clear()
  {
    gtk_list_store_clear(cast(GtkListStore*)this._cPtr);
  }

  /**
      Creates a new row at position.  iter will be changed to point to this new
      row.  If position is -1 or is larger than the number of rows on the list,
      then the new row will be appended to the list. The row will be empty after
      this function is called.  To fill in values, you need to call
      [gtk.list_store.ListStore.set] or [gtk.list_store.ListStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        position = position to insert the new row, or -1 for last
  
      Deprecated: Use list models
  */
  void insert(out gtk.tree_iter.TreeIter iter, int position)
  {
    GtkTreeIter _iter;
    gtk_list_store_insert(cast(GtkListStore*)this._cPtr, &_iter, position);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
  }

  /**
      Inserts a new row after sibling. If sibling is null, then the row will be
      prepended to the beginning of the list. iter will be changed to point to
      this new row. The row will be empty after this function is called. To fill
      in values, you need to call [gtk.list_store.ListStore.set] or [gtk.list_store.ListStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        sibling = A valid [gtk.tree_iter.TreeIter]
  
      Deprecated: Use list models
  */
  void insertAfter(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter sibling = null)
  {
    GtkTreeIter _iter;
    gtk_list_store_insert_after(cast(GtkListStore*)this._cPtr, &_iter, sibling ? cast(GtkTreeIter*)sibling._cPtr(No.Dup) : null);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
  }

  /**
      Inserts a new row before sibling. If sibling is null, then the row will
      be appended to the end of the list. iter will be changed to point to this
      new row. The row will be empty after this function is called. To fill in
      values, you need to call [gtk.list_store.ListStore.set] or [gtk.list_store.ListStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        sibling = A valid [gtk.tree_iter.TreeIter]
  
      Deprecated: Use list models
  */
  void insertBefore(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter sibling = null)
  {
    GtkTreeIter _iter;
    gtk_list_store_insert_before(cast(GtkListStore*)this._cPtr, &_iter, sibling ? cast(GtkTreeIter*)sibling._cPtr(No.Dup) : null);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
  }

  /**
      A variant of [gtk.list_store.ListStore.insertWithValues] which
      takes the columns and values as two arrays, instead of
      varargs.
      
      This function is mainly intended for language-bindings.
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the new row
        position = position to insert the new row, or -1 for last
        columns = an array of column numbers
        values = an array of GValues
  
      Deprecated: Use list models
  */
  void insertWithValues(out gtk.tree_iter.TreeIter iter, int position, int[] columns, gobject.value.Value[] values)
  {
    GtkTreeIter _iter;
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
    gtk_list_store_insert_with_valuesv(cast(GtkListStore*)this._cPtr, &_iter, position, _columns, _values, _nValues);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
  }

  /**
      Checks if the given iter is a valid iter for this [gtk.list_store.ListStore].
      
      This function is slow. Only use it for debugging and/or testing
      purposes.
  
      Params:
        iter = the iterator to check
      Returns: true if the iter is valid, false if the iter is invalid.
  
      Deprecated: Use list models
  */
  bool iterIsValid(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = gtk_list_store_iter_is_valid(cast(GtkListStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter in store to the position after position. Note that this
      function only works with unsorted stores. If position is null, iter
      will be moved to the start of the list.
  
      Params:
        iter = A [gtk.tree_iter.TreeIter]
        position = A [gtk.tree_iter.TreeIter]
  
      Deprecated: Use list models
  */
  void moveAfter(gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter position = null)
  {
    gtk_list_store_move_after(cast(GtkListStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, position ? cast(GtkTreeIter*)position._cPtr(No.Dup) : null);
  }

  /**
      Moves iter in store to the position before position. Note that this
      function only works with unsorted stores. If position is null, iter
      will be moved to the end of the list.
  
      Params:
        iter = A [gtk.tree_iter.TreeIter]
        position = A [gtk.tree_iter.TreeIter]
  
      Deprecated: Use list models
  */
  void moveBefore(gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter position = null)
  {
    gtk_list_store_move_before(cast(GtkListStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, position ? cast(GtkTreeIter*)position._cPtr(No.Dup) : null);
  }

  /**
      Prepends a new row to list_store. iter will be changed to point to this new
      row. The row will be empty after this function is called. To fill in
      values, you need to call [gtk.list_store.ListStore.set] or [gtk.list_store.ListStore.setValue].
  
      Params:
        iter = An unset [gtk.tree_iter.TreeIter] to set to the prepend row
  
      Deprecated: Use list models
  */
  void prepend(out gtk.tree_iter.TreeIter iter)
  {
    GtkTreeIter _iter;
    gtk_list_store_prepend(cast(GtkListStore*)this._cPtr, &_iter);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
  }

  /**
      Removes the given row from the list store.  After being removed,
      iter is set to be the next valid row, or invalidated if it pointed
      to the last row in list_store.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter]
      Returns: true if iter is valid, false if not.
  
      Deprecated: Use list models
  */
  bool remove(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = gtk_list_store_remove(cast(GtkListStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the types of the columns of a list store.
      
      This function is meant primarily for objects that inherit
      from [gtk.list_store.ListStore], and should only be used when constructing
      a new instance.
      
      This function cannot be called after a row has been added, or
      a method on the [gtk.tree_model.TreeModel] interface is called.
  
      Params:
        types = An array length n of [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s
  
      Deprecated: Use list models
  */
  void setColumnTypes(gobject.types.GType[] types)
  {
    int _nColumns;
    if (types)
      _nColumns = cast(int)types.length;

    auto _types = cast(GType*)types.ptr;
    gtk_list_store_set_column_types(cast(GtkListStore*)this._cPtr, _nColumns, _types);
  }

  /**
      Sets the data in the cell specified by iter and column.
      The type of value must be convertible to the type of the
      column.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter] for the row being modified
        column = column number to modify
        value = new value for the cell
  
      Deprecated: Use list models
  */
  void setValue(gtk.tree_iter.TreeIter iter, int column, gobject.value.Value value)
  {
    gtk_list_store_set_value(cast(GtkListStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, column, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      A variant of [gtk.list_store.ListStore.setValist] which
      takes the columns and values as two arrays, instead of
      varargs. This function is mainly intended for
      language-bindings and in case the number of columns to
      change is not known until run-time.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter] for the row being modified
        columns = an array of column numbers
        values = an array of GValues
  
      Deprecated: Use list models
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
    gtk_list_store_set_valuesv(cast(GtkListStore*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, _columns, _values, _nValues);
  }

  /**
      Swaps `a` and `b` in store. Note that this function only works with
      unsorted stores.
  
      Params:
        a = A [gtk.tree_iter.TreeIter]
        b = Another [gtk.tree_iter.TreeIter]
  
      Deprecated: Use list models
  */
  void swap(gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b)
  {
    gtk_list_store_swap(cast(GtkListStore*)this._cPtr, a ? cast(GtkTreeIter*)a._cPtr(No.Dup) : null, b ? cast(GtkTreeIter*)b._cPtr(No.Dup) : null);
  }
}
