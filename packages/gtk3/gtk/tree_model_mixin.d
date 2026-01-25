/// Module for [TreeModel] interface mixin
module gtk.tree_model_mixin;

public import gtk.tree_model_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gobject.types;
public import gobject.value;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.tree_iter;
public import gtk.tree_path;
public import gtk.types;

/**
    The #GtkTreeModel interface defines a generic tree interface for
    use by the #GtkTreeView widget. It is an abstract interface, and
    is designed to be usable with any appropriate data structure. The
    programmer just has to implement this interface on their own data
    type for it to be viewable by a #GtkTreeView widget.
    
    The model is represented as a hierarchical tree of strongly-typed,
    columned data. In other words, the model can be seen as a tree where
    every node has different values depending on which column is being
    queried. The type of data found in a column is determined by using
    the GType system (ie. #G_TYPE_INT, #GTK_TYPE_BUTTON, #G_TYPE_POINTER,
    etc). The types are homogeneous per column across all nodes. It is
    important to note that this interface only provides a way of examining
    a model and observing changes. The implementation of each individual
    model decides how and if changes are made.
    
    In order to make life simpler for programmers who do not need to
    write their own specialized model, two generic models are provided
    — the #GtkTreeStore and the #GtkListStore. To use these, the
    developer simply pushes data into these models as necessary. These
    models provide the data structure as well as all appropriate tree
    interfaces. As a result, implementing drag and drop, sorting, and
    storing data is trivial. For the vast majority of trees and lists,
    these two models are sufficient.
    
    Models are accessed on a node/column level of granularity. One can
    query for the value of a model at a certain node and a certain
    column on that node. There are two structures used to reference a
    particular node in a model. They are the #GtkTreePath-struct and
    the #GtkTreeIter-struct (“iter” is short for iterator). Most of the
    interface consists of operations on a #GtkTreeIter-struct.
    
    A path is essentially a potential node. It is a location on a model
    that may or may not actually correspond to a node on a specific
    model. The #GtkTreePath-struct can be converted into either an
    array of unsigned integers or a string. The string form is a list
    of numbers separated by a colon. Each number refers to the offset
    at that level. Thus, the path `0` refers to the root
    node and the path `2:4` refers to the fifth child of
    the third node.
    
    By contrast, a #GtkTreeIter-struct is a reference to a specific node on
    a specific model. It is a generic struct with an integer and three
    generic pointers. These are filled in by the model in a model-specific
    way. One can convert a path to an iterator by calling
    [gtk.tree_model.TreeModel.getIter]. These iterators are the primary way
    of accessing a model and are similar to the iterators used by
    #GtkTextBuffer. They are generally statically allocated on the
    stack and only used for a short time. The model interface defines
    a set of operations using them for navigating the model.
    
    It is expected that models fill in the iterator with private data.
    For example, the #GtkListStore model, which is internally a simple
    linked list, stores a list node in one of the pointers. The
    #GtkTreeModelSort stores an array and an offset in two of the
    pointers. Additionally, there is an integer field. This field is
    generally filled with a unique stamp per model. This stamp is for
    catching errors resulting from using invalid iterators with a model.
    
    The lifecycle of an iterator can be a little confusing at first.
    Iterators are expected to always be valid for as long as the model
    is unchanged (and doesn’t emit a signal). The model is considered
    to own all outstanding iterators and nothing needs to be done to
    free them from the user’s point of view. Additionally, some models
    guarantee that an iterator is valid for as long as the node it refers
    to is valid (most notably the #GtkTreeStore and #GtkListStore).
    Although generally uninteresting, as one always has to allow for
    the case where iterators do not persist beyond a signal, some very
    important performance enhancements were made in the sort model.
    As a result, the #GTK_TREE_MODEL_ITERS_PERSIST flag was added to
    indicate this behavior.
    
    To help show some common operation of a model, some examples are
    provided. The first example shows three ways of getting the iter at
    the location `3:2:5`. While the first method shown is
    easier, the second is much more common, as you often get paths from
    callbacks.
    
    ## Acquiring a #GtkTreeIter-struct
    
    ```c
    // Three ways of getting the iter pointing to the location
    GtkTreePath *path;
    GtkTreeIter iter;
    GtkTreeIter parent_iter;
    
    // get the iterator from a string
    gtk_tree_model_get_iter_from_string (model,
                                         &iter,
                                         "3:2:5");
    
    // get the iterator from a path
    path = gtk_tree_path_new_from_string ("3:2:5");
    gtk_tree_model_get_iter (model, &iter, path);
    gtk_tree_path_free (path);
    
    // walk the tree to find the iterator
    gtk_tree_model_iter_nth_child (model, &iter,
                                   NULL, 3);
    parent_iter = iter;
    gtk_tree_model_iter_nth_child (model, &iter,
                                   &parent_iter, 2);
    parent_iter = iter;
    gtk_tree_model_iter_nth_child (model, &iter,
                                   &parent_iter, 5);
    ```
    
    This second example shows a quick way of iterating through a list
    and getting a string and an integer from each row. The
    populate_model() function used below is not
    shown, as it is specific to the #GtkListStore. For information on
    how to write such a function, see the #GtkListStore documentation.
    
    ## Reading data from a #GtkTreeModel
    
    ```c
    enum
    {
      STRING_COLUMN,
      INT_COLUMN,
      N_COLUMNS
    };
    
    ...
    
    GtkTreeModel *list_store;
    GtkTreeIter iter;
    gboolean valid;
    gint row_count = 0;
    
    // make a new list_store
    list_store = gtk_list_store_new (N_COLUMNS,
                                     G_TYPE_STRING,
                                     G_TYPE_INT);
    
    // Fill the list store with data
    populate_model (list_store);
    
    // Get the first iter in the list, check it is valid and walk
    // through the list, reading each row.
    
    valid = gtk_tree_model_get_iter_first (list_store,
                                           &iter);
    while (valid)
     {
       gchar *str_data;
       gint   int_data;
    
       // Make sure you terminate calls to gtk_tree_model_get() with a “-1” value
       gtk_tree_model_get (list_store, &iter,
                           STRING_COLUMN, &str_data,
                           INT_COLUMN, &int_data,
                           -1);
    
       // Do something with the data
       g_print ("Row %d: (%s,%d)\n",
                row_count, str_data, int_data);
       g_free (str_data);
    
       valid = gtk_tree_model_iter_next (list_store,
                                         &iter);
       row_count++;
     }
    ```
    
    The #GtkTreeModel interface contains two methods for reference
    counting: [gtk.tree_model.TreeModel.refNode] and [gtk.tree_model.TreeModel.unrefNode].
    These two methods are optional to implement. The reference counting
    is meant as a way for views to let models know when nodes are being
    displayed. #GtkTreeView will take a reference on a node when it is
    visible, which means the node is either in the toplevel or expanded.
    Being displayed does not mean that the node is currently directly
    visible to the user in the viewport. Based on this reference counting
    scheme a caching model, for example, can decide whether or not to cache
    a node based on the reference count. A file-system based model would
    not want to keep the entire file hierarchy in memory, but just the
    folders that are currently expanded in every current view.
    
    When working with reference counting, the following rules must be taken
    into account:
    
    $(LIST
      * Never take a reference on a node without owning a reference on its parent.
        This means that all parent nodes of a referenced node must be referenced
        as well.
      
      * Outstanding references on a deleted node are not released. This is not
        possible because the node has already been deleted by the time the
        row-deleted signal is received.
      
      * Models are not obligated to emit a signal on rows of which none of its
        siblings are referenced. To phrase this differently, signals are only
        required for levels in which nodes are referenced. For the root level
        however, signals must be emitted at all times (however the root level
        is always referenced when any view is attached).
    )
*/
template TreeModelT()
{

  /**
      Creates a new #GtkTreeModel, with child_model as the child_model
      and root as the virtual root.
  
      Params:
        root = A #GtkTreePath or null.
      Returns: A new #GtkTreeModel.
  */
  override gtk.tree_model.TreeModel filterNew(gtk.tree_path.TreePath root = null)
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_model_filter_new(cast(GtkTreeModel*)this._cPtr, root ? cast(GtkTreePath*)root._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Calls func on each node in model in a depth-first fashion.
      
      If func returns true, then the tree ceases to be walked,
      and [gtk.tree_model.TreeModel.foreach_] returns.
  
      Params:
        func = a function to be called on each row
  */
  override void foreach_(gtk.types.TreeModelForeachFunc func)
  {
    extern(C) gboolean _funcCallback(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeModelForeachFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), path ? new gtk.tree_path.TreePath(cast(void*)path, No.Take) : null, iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_tree_model_foreach(cast(GtkTreeModel*)this._cPtr, _funcCB, _func);
  }

  /**
      Returns the type of the column.
  
      Params:
        index = the column index
      Returns: the type of the column
  */
  override gobject.types.GType getColumnType(int index)
  {
    gobject.types.GType _retval;
    _retval = gtk_tree_model_get_column_type(cast(GtkTreeModel*)this._cPtr, index);
    return _retval;
  }

  /**
      Returns a set of flags supported by this interface.
      
      The flags are a bitwise combination of #GtkTreeModelFlags.
      The flags supported should not change during the lifetime
      of the tree_model.
      Returns: the flags supported by this interface
  */
  override gtk.types.TreeModelFlags getFlags()
  {
    GtkTreeModelFlags _cretval;
    _cretval = gtk_tree_model_get_flags(cast(GtkTreeModel*)this._cPtr);
    gtk.types.TreeModelFlags _retval = cast(gtk.types.TreeModelFlags)_cretval;
    return _retval;
  }

  /**
      Sets iter to a valid iterator pointing to path.  If path does
      not exist, iter is set to an invalid iterator and false is returned.
  
      Params:
        iter = the uninitialized #GtkTreeIter-struct
        path = the #GtkTreePath-struct
      Returns: true, if iter was set
  */
  override bool getIter(out gtk.tree_iter.TreeIter iter, gtk.tree_path.TreePath path)
  {
    bool _retval;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_model_get_iter(cast(GtkTreeModel*)this._cPtr, &_iter, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Initializes iter with the first iterator in the tree
      (the one at the path "0") and returns true. Returns
      false if the tree is empty.
  
      Params:
        iter = the uninitialized #GtkTreeIter-struct
      Returns: true, if iter was set
  */
  override bool getIterFirst(out gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_model_get_iter_first(cast(GtkTreeModel*)this._cPtr, &_iter);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Sets iter to a valid iterator pointing to path_string, if it
      exists. Otherwise, iter is left invalid and false is returned.
  
      Params:
        iter = an uninitialized #GtkTreeIter-struct
        pathString = a string representation of a #GtkTreePath-struct
      Returns: true, if iter was set
  */
  override bool getIterFromString(out gtk.tree_iter.TreeIter iter, string pathString)
  {
    bool _retval;
    GtkTreeIter _iter;
    const(char)* _pathString = pathString.toCString(No.Alloc);
    _retval = cast(bool)gtk_tree_model_get_iter_from_string(cast(GtkTreeModel*)this._cPtr, &_iter, _pathString);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Returns the number of columns supported by tree_model.
      Returns: the number of columns
  */
  override int getNColumns()
  {
    int _retval;
    _retval = gtk_tree_model_get_n_columns(cast(GtkTreeModel*)this._cPtr);
    return _retval;
  }

  /**
      Returns a newly-created #GtkTreePath-struct referenced by iter.
      
      This path should be freed with [gtk.tree_path.TreePath.free].
  
      Params:
        iter = the #GtkTreeIter-struct
      Returns: a newly-created #GtkTreePath-struct
  */
  override gtk.tree_path.TreePath getPath(gtk.tree_iter.TreeIter iter)
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_get_path(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generates a string representation of the iter.
      
      This string is a “:” separated list of numbers.
      For example, “4:10:0:3” would be an acceptable
      return value for this string.
  
      Params:
        iter = a #GtkTreeIter-struct
      Returns: a newly-allocated string.
            Must be freed with [glib.global.gfree].
  */
  override string getStringFromIter(gtk.tree_iter.TreeIter iter)
  {
    char* _cretval;
    _cretval = gtk_tree_model_get_string_from_iter(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Initializes and sets value to that at column.
      
      When done with value, [gobject.value.Value.unset] needs to be called
      to free any allocated memory.
  
      Params:
        iter = the #GtkTreeIter-struct
        column = the column to lookup the value at
        value = an empty #GValue to set
  */
  override void getValue(gtk.tree_iter.TreeIter iter, int column, out gobject.value.Value value)
  {
    GValue _value;
    gtk_tree_model_get_value(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, column, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Sets iter to point to the first child of parent.
      
      If parent has no children, false is returned and iter is
      set to be invalid. parent will remain a valid node after this
      function has been called.
      
      If parent is null returns the first node, equivalent to
      `gtk_tree_model_get_iter_first (tree_model, iter);`
  
      Params:
        iter = the new #GtkTreeIter-struct to be set to the child
        parent = the #GtkTreeIter-struct, or null
      Returns: true, if iter has been set to the first child
  */
  override bool iterChildren(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent = null)
  {
    bool _retval;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_model_iter_children(cast(GtkTreeModel*)this._cPtr, &_iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Returns true if iter has children, false otherwise.
  
      Params:
        iter = the #GtkTreeIter-struct to test for children
      Returns: true if iter has children
  */
  override bool iterHasChild(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_model_iter_has_child(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the number of children that iter has.
      
      As a special case, if iter is null, then the number
      of toplevel nodes is returned.
  
      Params:
        iter = the #GtkTreeIter-struct, or null
      Returns: the number of children of iter
  */
  override int iterNChildren(gtk.tree_iter.TreeIter iter = null)
  {
    int _retval;
    _retval = gtk_tree_model_iter_n_children(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets iter to point to the node following it at the current level.
      
      If there is no next iter, false is returned and iter is set
      to be invalid.
  
      Params:
        iter = the #GtkTreeIter-struct
      Returns: true if iter has been changed to the next node
  */
  override bool iterNext(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_model_iter_next(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets iter to be the child of parent, using the given index.
      
      The first index is 0. If `n` is too big, or parent has no children,
      iter is set to an invalid iterator and false is returned. parent
      will remain a valid node after this function has been called. As a
      special case, if parent is null, then the `n`-th root node
      is set.
  
      Params:
        iter = the #GtkTreeIter-struct to set to the nth child
        parent = the #GtkTreeIter-struct to get the child from, or null.
        n = the index of the desired child
      Returns: true, if parent has an `n`-th child
  */
  override bool iterNthChild(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter parent, int n)
  {
    bool _retval;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_model_iter_nth_child(cast(GtkTreeModel*)this._cPtr, &_iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, n);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Sets iter to be the parent of child.
      
      If child is at the toplevel, and doesn’t have a parent, then
      iter is set to an invalid iterator and false is returned.
      child will remain a valid node after this function has been
      called.
      
      iter will be initialized before the lookup is performed, so child
      and iter cannot point to the same memory location.
  
      Params:
        iter = the new #GtkTreeIter-struct to set to the parent
        child = the #GtkTreeIter-struct
      Returns: true, if iter is set to the parent of child
  */
  override bool iterParent(out gtk.tree_iter.TreeIter iter, gtk.tree_iter.TreeIter child)
  {
    bool _retval;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_model_iter_parent(cast(GtkTreeModel*)this._cPtr, &_iter, child ? cast(GtkTreeIter*)child._cPtr(No.Dup) : null);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Sets iter to point to the previous node at the current level.
      
      If there is no previous iter, false is returned and iter is
      set to be invalid.
  
      Params:
        iter = the #GtkTreeIter-struct
      Returns: true if iter has been changed to the previous node
  */
  override bool iterPrevious(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_model_iter_previous(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Lets the tree ref the node.
      
      This is an optional method for models to implement.
      To be more specific, models may ignore this call as it exists
      primarily for performance reasons.
      
      This function is primarily meant as a way for views to let
      caching models know when nodes are being displayed (and hence,
      whether or not to cache that node). Being displayed means a node
      is in an expanded branch, regardless of whether the node is currently
      visible in the viewport. For example, a file-system based model
      would not want to keep the entire file-hierarchy in memory,
      just the sections that are currently being displayed by
      every current view.
      
      A model should be expected to be able to get an iter independent
      of its reffed state.
  
      Params:
        iter = the #GtkTreeIter-struct
  */
  override void refNode(gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_model_ref_node(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the #GtkTreeModel::row-changed signal on tree_model.
  
      Params:
        path = a #GtkTreePath-struct pointing to the changed row
        iter = a valid #GtkTreeIter-struct pointing to the changed row
  */
  override void rowChanged(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_model_row_changed(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the #GtkTreeModel::row-deleted signal on tree_model.
      
      This should be called by models after a row has been removed.
      The location pointed to by path should be the location that
      the row previously was at. It may not be a valid location anymore.
      
      Nodes that are deleted are not unreffed, this means that any
      outstanding references on the deleted node should not be released.
  
      Params:
        path = a #GtkTreePath-struct pointing to the previous location of
              the deleted row
  */
  override void rowDeleted(gtk.tree_path.TreePath path)
  {
    gtk_tree_model_row_deleted(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Emits the #GtkTreeModel::row-has-child-toggled signal on
      tree_model. This should be called by models after the child
      state of a node changes.
  
      Params:
        path = a #GtkTreePath-struct pointing to the changed row
        iter = a valid #GtkTreeIter-struct pointing to the changed row
  */
  override void rowHasChildToggled(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_model_row_has_child_toggled(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the #GtkTreeModel::row-inserted signal on tree_model.
  
      Params:
        path = a #GtkTreePath-struct pointing to the inserted row
        iter = a valid #GtkTreeIter-struct pointing to the inserted row
  */
  override void rowInserted(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_model_row_inserted(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the #GtkTreeModel::rows-reordered signal on tree_model.
      
      This should be called by models when their rows have been
      reordered.
  
      Params:
        path = a #GtkTreePath-struct pointing to the tree node whose children
              have been reordered
        iter = a valid #GtkTreeIter-struct pointing to the node
              whose children have been reordered, or null if the depth
              of path is 0
        newOrder = an array of integers
              mapping the current position of each child to its old
              position before the re-ordering,
              i.e. new_order`[newpos] = oldpos`
  */
  override void rowsReordered(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, int[] newOrder)
  {
    int _length;
    if (newOrder)
      _length = cast(int)newOrder.length;

    auto _newOrder = cast(int*)newOrder.ptr;
    gtk_tree_model_rows_reordered_with_length(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, _newOrder, _length);
  }

  /**
      Lets the tree unref the node.
      
      This is an optional method for models to implement.
      To be more specific, models may ignore this call as it exists
      primarily for performance reasons. For more information on what
      this means, see [gtk.tree_model.TreeModel.refNode].
      
      Please note that nodes that are deleted are not unreffed.
  
      Params:
        iter = the #GtkTreeIter-struct
  */
  override void unrefNode(gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_model_unref_node(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Connect to `RowChanged` signal.
  
      This signal is emitted when a row in the model has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel))
  
          `path` a #GtkTreePath-struct identifying the changed row (optional)
  
          `iter` a valid #GtkTreeIter-struct pointing to the changed row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_model.TreeModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-changed", closure, after);
  }

  /**
      Connect to `RowDeleted` signal.
  
      This signal is emitted when a row has been deleted.
        
        Note that no iterator is passed to the signal handler,
        since the row is already deleted.
        
        This should be called by models after a row has been removed.
        The location pointed to by path should be the location that
        the row previously was at. It may not be a valid location anymore.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_path.TreePath path, gtk.tree_model.TreeModel treeModel))
  
          `path` a #GtkTreePath-struct identifying the row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowDeleted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.tree_model.TreeModel)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-deleted", closure, after);
  }

  /**
      Connect to `RowHasChildToggled` signal.
  
      This signal is emitted when a row has gotten the first child
        row or lost its last child row.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel))
  
          `path` a #GtkTreePath-struct identifying the row (optional)
  
          `iter` a valid #GtkTreeIter-struct pointing to the row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowHasChildToggled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_model.TreeModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-has-child-toggled", closure, after);
  }

  /**
      Connect to `RowInserted` signal.
  
      This signal is emitted when a new row has been inserted in
        the model.
        
        Note that the row may still be empty at this point, since
        it is a common pattern to first insert an empty row, and
        then fill it with the desired values.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter, gtk.tree_model.TreeModel treeModel))
  
          `path` a #GtkTreePath-struct identifying the new row (optional)
  
          `iter` a valid #GtkTreeIter-struct pointing to the new row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowInserted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_model.TreeModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-inserted", closure, after);
  }
}
