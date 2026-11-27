/// Module for [TreeModel] interface mixin
module gid.gtk4.tree_model_mixin;

public import gid.core.basictypes;
public import gid.gtk4.tree_model;
public import gid.gtk4.tree_model_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.types;
public import gid.gobject2.value;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.tree_iter;
public import gid.gtk4.tree_path;
public import gid.gtk4.types;

/**
    The tree interface used by GtkTreeView
    
    The [gid.gtk4.tree_model.TreeModel] interface defines a generic tree interface for
    use by the [gid.gtk4.tree_view.TreeView] widget. It is an abstract interface, and
    is designed to be usable with any appropriate data structure. The
    programmer just has to implement this interface on their own data
    type for it to be viewable by a [gid.gtk4.tree_view.TreeView] widget.
    
    The model is represented as a hierarchical tree of strongly-typed,
    columned data. In other words, the model can be seen as a tree where
    every node has different values depending on which column is being
    queried. The type of data found in a column is determined by using
    the GType system (ie. `G_TYPE_INT`, `GTK_TYPE_BUTTON`, `G_TYPE_POINTER`,
    etc). The types are homogeneous per column across all nodes. It is
    important to note that this interface only provides a way of examining
    a model and observing changes. The implementation of each individual
    model decides how and if changes are made.
    
    In order to make life simpler for programmers who do not need to
    write their own specialized model, two generic models are provided
    — the [gid.gtk4.tree_store.TreeStore] and the [gid.gtk4.list_store.ListStore]. To use these, the
    developer simply pushes data into these models as necessary. These
    models provide the data structure as well as all appropriate tree
    interfaces. As a result, implementing drag and drop, sorting, and
    storing data is trivial. For the vast majority of trees and lists,
    these two models are sufficient.
    
    Models are accessed on a node/column level of granularity. One can
    query for the value of a model at a certain node and a certain
    column on that node. There are two structures used to reference a
    particular node in a model. They are the [gid.gtk4.tree_path.TreePath] and
    the [gid.gtk4.tree_iter.TreeIter] (“iter” is short for iterator). Most of the
    interface consists of operations on a [gid.gtk4.tree_iter.TreeIter].
    
    A path is essentially a potential node. It is a location on a model
    that may or may not actually correspond to a node on a specific
    model. A [gid.gtk4.tree_path.TreePath] can be converted into either an
    array of unsigned integers or a string. The string form is a list
    of numbers separated by a colon. Each number refers to the offset
    at that level. Thus, the path `0` refers to the root
    node and the path `2:4` refers to the fifth child of
    the third node.
    
    By contrast, a [gid.gtk4.tree_iter.TreeIter] is a reference to a specific node on
    a specific model. It is a generic struct with an integer and three
    generic pointers. These are filled in by the model in a model-specific
    way. One can convert a path to an iterator by calling
    [gid.gtk4.tree_model.TreeModel.getIter]. These iterators are the primary way
    of accessing a model and are similar to the iterators used by
    [gid.gtk4.text_buffer.TextBuffer]. They are generally statically allocated on the
    stack and only used for a short time. The model interface defines
    a set of operations using them for navigating the model.
    
    It is expected that models fill in the iterator with private data.
    For example, the [gid.gtk4.list_store.ListStore] model, which is internally a simple
    linked list, stores a list node in one of the pointers. The
    [gid.gtk4.tree_model.TreeModel]Sort stores an array and an offset in two of the
    pointers. Additionally, there is an integer field. This field is
    generally filled with a unique stamp per model. This stamp is for
    catching errors resulting from using invalid iterators with a model.
    
    The lifecycle of an iterator can be a little confusing at first.
    Iterators are expected to always be valid for as long as the model
    is unchanged (and doesn’t emit a signal). The model is considered
    to own all outstanding iterators and nothing needs to be done to
    free them from the user’s point of view. Additionally, some models
    guarantee that an iterator is valid for as long as the node it refers
    to is valid (most notably the [gid.gtk4.tree_store.TreeStore] and [gid.gtk4.list_store.ListStore]).
    Although generally uninteresting, as one always has to allow for
    the case where iterators do not persist beyond a signal, some very
    important performance enhancements were made in the sort model.
    As a result, the [gid.gtk4.types.TreeModelFlags.ItersPersist] flag was added to
    indicate this behavior.
    
    To help show some common operation of a model, some examples are
    provided. The first example shows three ways of getting the iter at
    the location `3:2:5`. While the first method shown is
    easier, the second is much more common, as you often get paths from
    callbacks.
    
    ## Acquiring a [gid.gtk4.tree_iter.TreeIter]
    
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
    shown, as it is specific to the [gid.gtk4.list_store.ListStore]. For information on
    how to write such a function, see the [gid.gtk4.list_store.ListStore] documentation.
    
    ## Reading data from a [gid.gtk4.tree_model.TreeModel]
    
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
    int row_count = 0;
    
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
       char *str_data;
       int    int_data;
    
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
    
    The [gid.gtk4.tree_model.TreeModel] interface contains two methods for reference
    counting: [gid.gtk4.tree_model.TreeModel.refNode] and [gid.gtk4.tree_model.TreeModel.unrefNode].
    These two methods are optional to implement. The reference counting
    is meant as a way for views to let models know when nodes are being
    displayed. [gid.gtk4.tree_view.TreeView] will take a reference on a node when it is
    visible, which means the node is either in the toplevel or expanded.
    Being displayed does not mean that the node is currently directly
    visible to the user in the viewport. Based on this reference counting
    scheme a caching model, for example, can decide whether or not to cache
    a node based on the reference count. A file-system based model would
    not want to keep the entire file hierarchy in memory, but just the
    folders that are currently expanded in every current view.
    
    When working with reference counting, the following rules must be taken
    into account:
    
    - Never take a reference on a node without owning a reference on its parent.
      This means that all parent nodes of a referenced node must be referenced
      as well.
    
    - Outstanding references on a deleted node are not released. This is not
      possible because the node has already been deleted by the time the
      row-deleted signal is received.
    
    - Models are not obligated to emit a signal on rows of which none of its
      siblings are referenced. To phrase this differently, signals are only
      required for levels in which nodes are referenced. For the root level
      however, signals must be emitted at all times (however the root level
      is always referenced when any view is attached).

    Deprecated: Use [gid.gio2.list_model.ListModel] instead
*/
template TreeModelT()
{

  /**
      Returns the type of the column.
  
      Params:
        index = the column index
      Returns: the type of the column
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.types.GType vfuncGetColumnType(int index)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.getColumnType)
      return typeof(return).init;

    gid.gobject2.types.GType _retval;
    _retval = _klass.getColumnType(cast(GtkTreeModel*)this._cPtr, index);
    return _retval;
  }

  /**
      Returns a set of flags supported by this interface.
      
      The flags are a bitwise combination of [gid.gtk4.tree_model.TreeModel]Flags.
      The flags supported should not change during the lifetime
      of the tree_model.
      Returns: the flags supported by this interface
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFlags`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.types.TreeModelFlags vfuncGetFlags()
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.getFlags)
      return typeof(return).init;

    GtkTreeModelFlags _cretval;
    _cretval = _klass.getFlags(cast(GtkTreeModel*)this._cPtr);
    gid.gtk4.types.TreeModelFlags _retval = cast(gid.gtk4.types.TreeModelFlags)_cretval;
    return _retval;
  }

  /**
      Sets iter to a valid iterator pointing to path.
      
      If path does not exist, iter is set to an invalid
      iterator and false is returned.
  
      Params:
        iter = the uninitialized [gid.gtk4.tree_iter.TreeIter]
        path = the [gid.gtk4.tree_path.TreePath] (modified in place, changes are seen by the caller)
      Returns: true, if iter was set
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetIter(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.getIter)
      return typeof(return).init;

    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)_klass.getIter(cast(GtkTreeModel*)this._cPtr, _iter, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Returns the number of columns supported by tree_model.
      Returns: the number of columns
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNColumns`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNColumns()
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.getNColumns)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNColumns(cast(GtkTreeModel*)this._cPtr);
    return _retval;
  }

  /**
      Returns a newly-created [gid.gtk4.tree_path.TreePath] referenced by iter.
      
      This path should be freed with [gid.gtk4.tree_path.TreePath.free].
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
      Returns: a newly-created [gid.gtk4.tree_path.TreePath]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPath`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.tree_path.TreePath vfuncGetPath(gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.getPath)
      return typeof(return).init;

    GtkTreePath* _cretval;
    _cretval = _klass.getPath(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk4.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes and sets value to that at column.
      
      When done with value, [gid.gobject2.value.Value.unset] needs to be called
      to free any allocated memory.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
        column = the column to lookup the value at
        value = an empty [gid.gobject2.value.Value] to set
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetValue(gid.gtk4.tree_iter.TreeIter iter, int column, out gid.gobject2.value.Value value)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.getValue)
      return;

    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _klass.getValue(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, column, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Sets iter to point to the first child of parent.
      
      If parent has no children, false is returned and iter is
      set to be invalid. parent will remain a valid node after this
      function has been called.
      
      If parent is null returns the first node, equivalent to
      `gtk_tree_model_get_iter_first (tree_model, iter);`
  
      Params:
        iter = the new [gid.gtk4.tree_iter.TreeIter] to be set to the child
        parent = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
      Returns: true, if iter has been set to the first child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterChildren`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIterChildren(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_iter.TreeIter parent = null)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterChildren)
      return typeof(return).init;

    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)_klass.iterChildren(cast(GtkTreeModel*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Returns true if iter has children, false otherwise.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] to test for children (modified in place, changes are seen by the caller)
      Returns: true if iter has children
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterHasChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIterHasChild(gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterHasChild)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.iterHasChild(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the number of children that iter has.
      
      As a special case, if iter is null, then the number
      of toplevel nodes is returned.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
      Returns: the number of children of iter
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterNChildren`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncIterNChildren(gid.gtk4.tree_iter.TreeIter iter = null)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterNChildren)
      return typeof(return).init;

    int _retval;
    _retval = _klass.iterNChildren(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets iter to point to the node following it at the current level.
      
      If there is no next iter, false is returned and iter is set
      to be invalid.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
      Returns: true if iter has been changed to the next node
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterNext`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIterNext(gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterNext)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.iterNext(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
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
        iter = the [gid.gtk4.tree_iter.TreeIter] to set to the nth child
        parent = the [gid.gtk4.tree_iter.TreeIter] to get the child from (modified in place, changes are seen by the caller)
        n = the index of the desired child
      Returns: true, if parent has an `n`-th child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterNthChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIterNthChild(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_iter.TreeIter parent, int n)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterNthChild)
      return typeof(return).init;

    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)_klass.iterNthChild(cast(GtkTreeModel*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, n);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
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
        iter = the new [gid.gtk4.tree_iter.TreeIter] to set to the parent
        child = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
      Returns: true, if iter is set to the parent of child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterParent`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIterParent(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_iter.TreeIter child)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterParent)
      return typeof(return).init;

    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)_klass.iterParent(cast(GtkTreeModel*)this._cPtr, _iter, child ? cast(GtkTreeIter*)child._cPtr(No.Dup) : null);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Sets iter to point to the previous node at the current level.
      
      If there is no previous iter, false is returned and iter is
      set to be invalid.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
      Returns: true if iter has been changed to the previous node
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIterPrevious`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIterPrevious(gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.iterPrevious)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.iterPrevious(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
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
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRefNode`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRefNode(gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.refNode)
      return;

    _klass.refNode(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-changed signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowChanged].
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the changed row (modified in place, changes are seen by the caller)
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the changed row (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowChanged(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.rowChanged)
      return;

    _klass.rowChanged(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-deleted signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowDeleted].
      
      This should be called by models after a row has been removed.
      The location pointed to by path should be the location that
      the row previously was at. It may not be a valid location anymore.
      
      Nodes that are deleted are not unreffed, this means that any
      outstanding references on the deleted node should not be released.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the previous location of
            the deleted row (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowDeleted`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowDeleted(gid.gtk4.tree_path.TreePath path)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.rowDeleted)
      return;

    _klass.rowDeleted(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-has-child-toggled signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowHasChildToggled].
      
      This should be called by models after the child
      state of a node changes.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the changed row (modified in place, changes are seen by the caller)
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the changed row (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowHasChildToggled`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowHasChildToggled(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.rowHasChildToggled)
      return;

    _klass.rowHasChildToggled(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-inserted signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowInserted].
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the inserted row (modified in place, changes are seen by the caller)
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the inserted row (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRowInserted`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowInserted(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.rowInserted)
      return;

    _klass.rowInserted(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Lets the tree unref the node.
      
      This is an optional method for models to implement.
      To be more specific, models may ignore this call as it exists
      primarily for performance reasons. For more information on what
      this means, see [gid.gtk4.tree_model.TreeModel.refNode].
      
      Please note that nodes that are deleted are not unreffed.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnrefNode`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnrefNode(gid.gtk4.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.tree_model.TreeModel._getGType);
    if (!_klass || !_klass.unrefNode)
      return;

    _klass.unrefNode(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Creates a new [gid.gtk4.tree_model.TreeModel], with child_model as the child_model
      and root as the virtual root.
  
      Params:
        root = A [gid.gtk4.tree_path.TreePath]
      Returns: A new [gid.gtk4.tree_model.TreeModel].
  */
  override gid.gtk4.tree_model.TreeModel filterNew(gid.gtk4.tree_path.TreePath root = null) nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_model_filter_new(cast(GtkTreeModel*)this._cPtr, root ? cast(GtkTreePath*)root._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Calls func on each node in model in a depth-first fashion.
      
      If func returns true, then the tree ceases to be walked,
      and [gid.gtk4.tree_model.TreeModel.foreach_] returns.
  
      Params:
        func = a function to be called on each row
  */
  override void foreach_(gid.gtk4.types.TreeModelForeachFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.TreeModelForeachFunc*)data;
      auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;
      auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(cast(void*)model, No.Take), _path, _iter);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.TreeModelForeachFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_path)
        _path._cUnborrow;
      if (_iter)
        _iter._cUnborrow;

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
  override gid.gobject2.types.GType getColumnType(int index) nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gtk_tree_model_get_column_type(cast(GtkTreeModel*)this._cPtr, index);
    return _retval;
  }

  /**
      Returns a set of flags supported by this interface.
      
      The flags are a bitwise combination of [gid.gtk4.tree_model.TreeModel]Flags.
      The flags supported should not change during the lifetime
      of the tree_model.
      Returns: the flags supported by this interface
  */
  override gid.gtk4.types.TreeModelFlags getFlags() nothrow
  {
    GtkTreeModelFlags _cretval;
    _cretval = gtk_tree_model_get_flags(cast(GtkTreeModel*)this._cPtr);
    gid.gtk4.types.TreeModelFlags _retval = cast(gid.gtk4.types.TreeModelFlags)_cretval;
    return _retval;
  }

  /**
      Sets iter to a valid iterator pointing to path.
      
      If path does not exist, iter is set to an invalid
      iterator and false is returned.
  
      Params:
        iter = the uninitialized [gid.gtk4.tree_iter.TreeIter]
        path = the [gid.gtk4.tree_path.TreePath]
      Returns: true, if iter was set
  */
  override bool getIter(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_path.TreePath path) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_model_get_iter(cast(GtkTreeModel*)this._cPtr, _iter, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Initializes iter with the first iterator in the tree
      (the one at the path "0").
      
      Returns false if the tree is empty, true otherwise.
  
      Params:
        iter = the uninitialized [gid.gtk4.tree_iter.TreeIter]
      Returns: true, if iter was set
  */
  override bool getIterFirst(out gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_model_get_iter_first(cast(GtkTreeModel*)this._cPtr, _iter);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Sets iter to a valid iterator pointing to path_string, if it
      exists.
      
      Otherwise, iter is left invalid and false is returned.
  
      Params:
        iter = an uninitialized [gid.gtk4.tree_iter.TreeIter]
        pathString = a string representation of a [gid.gtk4.tree_path.TreePath]
      Returns: true, if iter was set
  */
  override bool getIterFromString(out gid.gtk4.tree_iter.TreeIter iter, string pathString) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    const(char)* _pathString = pathString.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_tree_model_get_iter_from_string(cast(GtkTreeModel*)this._cPtr, _iter, _pathString);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Returns the number of columns supported by tree_model.
      Returns: the number of columns
  */
  override int getNColumns() nothrow
  {
    int _retval;
    _retval = gtk_tree_model_get_n_columns(cast(GtkTreeModel*)this._cPtr);
    return _retval;
  }

  /**
      Returns a newly-created [gid.gtk4.tree_path.TreePath] referenced by iter.
      
      This path should be freed with [gid.gtk4.tree_path.TreePath.free].
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter]
      Returns: a newly-created [gid.gtk4.tree_path.TreePath]
  */
  override gid.gtk4.tree_path.TreePath getPath(gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_get_path(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk4.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generates a string representation of the iter.
      
      This string is a “:” separated list of numbers.
      For example, “4:10:0:3” would be an acceptable
      return value for this string.
  
      Params:
        iter = a [gid.gtk4.tree_iter.TreeIter]
      Returns: a newly-allocated string
  */
  override string getStringFromIter(gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    char* _cretval;
    _cretval = gtk_tree_model_get_string_from_iter(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Initializes and sets value to that at column.
      
      When done with value, [gid.gobject2.value.Value.unset] needs to be called
      to free any allocated memory.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter]
        column = the column to lookup the value at
        value = an empty [gid.gobject2.value.Value] to set
  */
  override void getValue(gid.gtk4.tree_iter.TreeIter iter, int column, out gid.gobject2.value.Value value) nothrow
  {
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    gtk_tree_model_get_value(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, column, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Sets iter to point to the first child of parent.
      
      If parent has no children, false is returned and iter is
      set to be invalid. parent will remain a valid node after this
      function has been called.
      
      If parent is null returns the first node, equivalent to
      `gtk_tree_model_get_iter_first (tree_model, iter);`
  
      Params:
        iter = the new [gid.gtk4.tree_iter.TreeIter] to be set to the child
        parent = the [gid.gtk4.tree_iter.TreeIter]
      Returns: true, if iter has been set to the first child
  */
  override bool iterChildren(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_iter.TreeIter parent = null) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_model_iter_children(cast(GtkTreeModel*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Returns true if iter has children, false otherwise.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter] to test for children
      Returns: true if iter has children
  */
  override bool iterHasChild(gid.gtk4.tree_iter.TreeIter iter) nothrow
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
        iter = the [gid.gtk4.tree_iter.TreeIter]
      Returns: the number of children of iter
  */
  override int iterNChildren(gid.gtk4.tree_iter.TreeIter iter = null) nothrow
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
        iter = the [gid.gtk4.tree_iter.TreeIter]
      Returns: true if iter has been changed to the next node
  */
  override bool iterNext(gid.gtk4.tree_iter.TreeIter iter) nothrow
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
        iter = the [gid.gtk4.tree_iter.TreeIter] to set to the nth child
        parent = the [gid.gtk4.tree_iter.TreeIter] to get the child from
        n = the index of the desired child
      Returns: true, if parent has an `n`-th child
  */
  override bool iterNthChild(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_iter.TreeIter parent, int n) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_model_iter_nth_child(cast(GtkTreeModel*)this._cPtr, _iter, parent ? cast(GtkTreeIter*)parent._cPtr(No.Dup) : null, n);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
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
        iter = the new [gid.gtk4.tree_iter.TreeIter] to set to the parent
        child = the [gid.gtk4.tree_iter.TreeIter]
      Returns: true, if iter is set to the parent of child
  */
  override bool iterParent(out gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_iter.TreeIter child) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_model_iter_parent(cast(GtkTreeModel*)this._cPtr, _iter, child ? cast(GtkTreeIter*)child._cPtr(No.Dup) : null);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Sets iter to point to the previous node at the current level.
      
      If there is no previous iter, false is returned and iter is
      set to be invalid.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter]
      Returns: true if iter has been changed to the previous node
  */
  override bool iterPrevious(gid.gtk4.tree_iter.TreeIter iter) nothrow
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
        iter = the [gid.gtk4.tree_iter.TreeIter]
  */
  override void refNode(gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_model_ref_node(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-changed signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowChanged].
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the changed row
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the changed row
  */
  override void rowChanged(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_model_row_changed(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-deleted signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowDeleted].
      
      This should be called by models after a row has been removed.
      The location pointed to by path should be the location that
      the row previously was at. It may not be a valid location anymore.
      
      Nodes that are deleted are not unreffed, this means that any
      outstanding references on the deleted node should not be released.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the previous location of
            the deleted row
  */
  override void rowDeleted(gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_tree_model_row_deleted(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-has-child-toggled signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowHasChildToggled].
      
      This should be called by models after the child
      state of a node changes.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the changed row
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the changed row
  */
  override void rowHasChildToggled(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_model_row_has_child_toggled(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::row-inserted signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowInserted].
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the inserted row
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the inserted row
  */
  override void rowInserted(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_model_row_inserted(cast(GtkTreeModel*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::rows-reordered signal on tree_model.
      
      See [gid.gtk4.tree_model.TreeModel.rowsReordered].
      
      This should be called by models when their rows have been
      reordered.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] pointing to the tree node whose children
            have been reordered
        iter = a valid [gid.gtk4.tree_iter.TreeIter] pointing to the node
            whose children have been reordered, or null if the depth
            of path is 0
        newOrder = an array of integers
            mapping the current position of each child to its old
            position before the re-ordering,
            i.e. new_order`[newpos] = oldpos`
  */
  override void rowsReordered(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter, int[] newOrder) nothrow
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
      this means, see [gid.gtk4.tree_model.TreeModel.refNode].
      
      Please note that nodes that are deleted are not unreffed.
  
      Params:
        iter = the [gid.gtk4.tree_iter.TreeIter]
  */
  override void unrefNode(gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_model_unref_node(cast(GtkTreeModel*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Connect to `RowChanged` signal.
  
      This signal is emitted when a row in the model has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_model.TreeModel treeModel)`
  
          `path` a [gid.gtk4.tree_path.TreePath] identifying the changed row (optional)
  
          `iter` a valid [gid.gtk4.tree_iter.TreeIter] pointing to the changed row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk4.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.tree_model.TreeModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.rowChanged");
      }
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
  
          `void callback(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_model.TreeModel treeModel)`
  
          `path` a [gid.gtk4.tree_path.TreePath] identifying the row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowDeleted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.tree_model.TreeModel)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.rowDeleted");
      }
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
  
          `void callback(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_model.TreeModel treeModel)`
  
          `path` a [gid.gtk4.tree_path.TreePath] identifying the row (optional)
  
          `iter` a valid [gid.gtk4.tree_iter.TreeIter] pointing to the row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowHasChildToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk4.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.tree_model.TreeModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.rowHasChildToggled");
      }
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
  
          `void callback(gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter, gid.gtk4.tree_model.TreeModel treeModel)`
  
          `path` a [gid.gtk4.tree_path.TreePath] identifying the new row (optional)
  
          `iter` a valid [gid.gtk4.tree_iter.TreeIter] pointing to the new row (optional)
  
          `treeModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowInserted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk4.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.tree_model.TreeModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.rowInserted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-inserted", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.tree_model.TreeModel (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_tree_model_TreeModel(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFlags", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNColumns", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPath", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterChildren", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterHasChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterNChildren", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterNext", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterNthChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterParent", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterPrevious", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefNode", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDeleted", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowHasChildToggled", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowInserted", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnrefNode", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.tree_model.TreeModel vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_tree_model_TreeModel(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "get_column_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFlags", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "get_flags");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "get_iter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNColumns", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "get_n_columns");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPath", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "get_path");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "get_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterChildren", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_children");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterHasChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_has_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterNChildren", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_n_children");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterNext", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_next");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterNthChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_nth_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterParent", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_parent");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIterPrevious", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "iter_previous");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefNode", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "ref_node");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "row_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDeleted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "row_deleted");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowHasChildToggled", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "row_has_child_toggled");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowInserted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "row_inserted");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnrefNode", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(iface, "unref_node");
  }

  private static void _installIfaceVfunc_gid_gtk4_tree_model_TreeModel(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkTreeModelIface*)iface;

    switch (vfunc)
    {
      case "get_column_type":
      {
        static extern(C) GType _vfuncGetColumnTypeTramp(GtkTreeModel* treeModel, int index) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.getColumnType)
              return (cast(typeof(&_vfuncGetColumnTypeTramp))_klass.getColumnType)(treeModel, index);
            return typeof(return).init;
          }

          gid.gobject2.types.GType _dretval;

          try
          {
            _dretval = _obj.vfuncGetColumnType(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncGetColumnType");
          }
          auto _retval = cast(GType)_dretval;

          return _retval;
        }

        _klass.getColumnType = cast(typeof(_klass.getColumnType))&_vfuncGetColumnTypeTramp;
        break;
      }
      case "get_flags":
      {
        static extern(C) GtkTreeModelFlags _vfuncGetFlagsTramp(GtkTreeModel* treeModel) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.getFlags)
              return (cast(typeof(&_vfuncGetFlagsTramp))_klass.getFlags)(treeModel);
            return typeof(return).init;
          }

          gid.gtk4.types.TreeModelFlags _dretval;

          try
          {
            _dretval = _obj.vfuncGetFlags();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncGetFlags");
          }
          auto _retval = cast(GtkTreeModelFlags)_dretval;

          return _retval;
        }

        _klass.getFlags = cast(typeof(_klass.getFlags))&_vfuncGetFlagsTramp;
        break;
      }
      case "get_iter":
      {
        static extern(C) gboolean _vfuncGetIterTramp(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreePath* path) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.getIter)
              return (cast(typeof(&_vfuncGetIterTramp))_klass.getIter)(treeModel, iter, path);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gtk4.tree_iter.TreeIter _iter;
          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetIter(_iter, _path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncGetIter");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
          {
            auto p_ = _iter._cPtr(Yes.Dup);
            *iter = *cast(GtkTreeIter*)p_;
            gFree(p_);
          }
          if (_path)
            _path._cUnborrow;

          return _retval;
        }

        _klass.getIter = cast(typeof(_klass.getIter))&_vfuncGetIterTramp;
        break;
      }
      case "get_n_columns":
      {
        static extern(C) int _vfuncGetNColumnsTramp(GtkTreeModel* treeModel) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.getNColumns)
              return (cast(typeof(&_vfuncGetNColumnsTramp))_klass.getNColumns)(treeModel);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNColumns();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncGetNColumns");
          }
          return _retval;
        }

        _klass.getNColumns = cast(typeof(_klass.getNColumns))&_vfuncGetNColumnsTramp;
        break;
      }
      case "get_path":
      {
        static extern(C) GtkTreePath* _vfuncGetPathTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.getPath)
              return (cast(typeof(&_vfuncGetPathTramp))_klass.getPath)(treeModel, iter);
            return typeof(return).init;
          }

          gid.gtk4.tree_path.TreePath _dretval;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetPath(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncGetPath");
          }
          auto _retval = _dretval ? cast(GtkTreePath*)_dretval._cPtr(Yes.Dup) : null;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.getPath = cast(typeof(_klass.getPath))&_vfuncGetPathTramp;
        break;
      }
      case "get_value":
      {
        static extern(C) void _vfuncGetValueTramp(GtkTreeModel* treeModel, GtkTreeIter* iter, int column, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.getValue)
              return (cast(typeof(&_vfuncGetValueTramp))_klass.getValue)(treeModel, iter, column, value);
            return;
          }

          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;
          gid.gobject2.value.Value _value;

          try
          {
            _obj.vfuncGetValue(_iter, column, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncGetValue");
          }
          if (_iter)
            _iter._cUnborrow;
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

        }

        _klass.getValue = cast(typeof(_klass.getValue))&_vfuncGetValueTramp;
        break;
      }
      case "iter_children":
      {
        static extern(C) gboolean _vfuncIterChildrenTramp(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreeIter* parent) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterChildren)
              return (cast(typeof(&_vfuncIterChildrenTramp))_klass.iterChildren)(treeModel, iter, parent);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gtk4.tree_iter.TreeIter _iter;
          auto _parent = parent ? new gid.gtk4.tree_iter.TreeIter(cast(void*)parent, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncIterChildren(_iter, _parent);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterChildren");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
          {
            auto p_ = _iter._cPtr(Yes.Dup);
            *iter = *cast(GtkTreeIter*)p_;
            gFree(p_);
          }
          if (_parent)
            _parent._cUnborrow;

          return _retval;
        }

        _klass.iterChildren = cast(typeof(_klass.iterChildren))&_vfuncIterChildrenTramp;
        break;
      }
      case "iter_has_child":
      {
        static extern(C) gboolean _vfuncIterHasChildTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterHasChild)
              return (cast(typeof(&_vfuncIterHasChildTramp))_klass.iterHasChild)(treeModel, iter);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncIterHasChild(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterHasChild");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.iterHasChild = cast(typeof(_klass.iterHasChild))&_vfuncIterHasChildTramp;
        break;
      }
      case "iter_n_children":
      {
        static extern(C) int _vfuncIterNChildrenTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterNChildren)
              return (cast(typeof(&_vfuncIterNChildrenTramp))_klass.iterNChildren)(treeModel, iter);
            return typeof(return).init;
          }

          int _retval;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _retval = _obj.vfuncIterNChildren(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterNChildren");
          }
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.iterNChildren = cast(typeof(_klass.iterNChildren))&_vfuncIterNChildrenTramp;
        break;
      }
      case "iter_next":
      {
        static extern(C) gboolean _vfuncIterNextTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterNext)
              return (cast(typeof(&_vfuncIterNextTramp))_klass.iterNext)(treeModel, iter);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncIterNext(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterNext");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.iterNext = cast(typeof(_klass.iterNext))&_vfuncIterNextTramp;
        break;
      }
      case "iter_nth_child":
      {
        static extern(C) gboolean _vfuncIterNthChildTramp(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreeIter* parent, int n) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterNthChild)
              return (cast(typeof(&_vfuncIterNthChildTramp))_klass.iterNthChild)(treeModel, iter, parent, n);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gtk4.tree_iter.TreeIter _iter;
          auto _parent = parent ? new gid.gtk4.tree_iter.TreeIter(cast(void*)parent, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncIterNthChild(_iter, _parent, n);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterNthChild");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
          {
            auto p_ = _iter._cPtr(Yes.Dup);
            *iter = *cast(GtkTreeIter*)p_;
            gFree(p_);
          }
          if (_parent)
            _parent._cUnborrow;

          return _retval;
        }

        _klass.iterNthChild = cast(typeof(_klass.iterNthChild))&_vfuncIterNthChildTramp;
        break;
      }
      case "iter_parent":
      {
        static extern(C) gboolean _vfuncIterParentTramp(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreeIter* child) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterParent)
              return (cast(typeof(&_vfuncIterParentTramp))_klass.iterParent)(treeModel, iter, child);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gtk4.tree_iter.TreeIter _iter;
          auto _child = child ? new gid.gtk4.tree_iter.TreeIter(cast(void*)child, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncIterParent(_iter, _child);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterParent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
          {
            auto p_ = _iter._cPtr(Yes.Dup);
            *iter = *cast(GtkTreeIter*)p_;
            gFree(p_);
          }
          if (_child)
            _child._cUnborrow;

          return _retval;
        }

        _klass.iterParent = cast(typeof(_klass.iterParent))&_vfuncIterParentTramp;
        break;
      }
      case "iter_previous":
      {
        static extern(C) gboolean _vfuncIterPreviousTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.iterPrevious)
              return (cast(typeof(&_vfuncIterPreviousTramp))_klass.iterPrevious)(treeModel, iter);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncIterPrevious(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncIterPrevious");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.iterPrevious = cast(typeof(_klass.iterPrevious))&_vfuncIterPreviousTramp;
        break;
      }
      case "ref_node":
      {
        static extern(C) void _vfuncRefNodeTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.refNode)
              return (cast(typeof(&_vfuncRefNodeTramp))_klass.refNode)(treeModel, iter);
            return;
          }

          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRefNode(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncRefNode");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.refNode = cast(typeof(_klass.refNode))&_vfuncRefNodeTramp;
        break;
      }
      case "row_changed":
      {
        static extern(C) void _vfuncRowChangedTramp(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.rowChanged)
              return (cast(typeof(&_vfuncRowChangedTramp))_klass.rowChanged)(treeModel, path, iter);
            return;
          }

          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRowChanged(_path, _iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncRowChanged");
          }
          if (_path)
            _path._cUnborrow;
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.rowChanged = cast(typeof(_klass.rowChanged))&_vfuncRowChangedTramp;
        break;
      }
      case "row_deleted":
      {
        static extern(C) void _vfuncRowDeletedTramp(GtkTreeModel* treeModel, GtkTreePath* path) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.rowDeleted)
              return (cast(typeof(&_vfuncRowDeletedTramp))_klass.rowDeleted)(treeModel, path);
            return;
          }

          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRowDeleted(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncRowDeleted");
          }
          if (_path)
            _path._cUnborrow;

        }

        _klass.rowDeleted = cast(typeof(_klass.rowDeleted))&_vfuncRowDeletedTramp;
        break;
      }
      case "row_has_child_toggled":
      {
        static extern(C) void _vfuncRowHasChildToggledTramp(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.rowHasChildToggled)
              return (cast(typeof(&_vfuncRowHasChildToggledTramp))_klass.rowHasChildToggled)(treeModel, path, iter);
            return;
          }

          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRowHasChildToggled(_path, _iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncRowHasChildToggled");
          }
          if (_path)
            _path._cUnborrow;
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.rowHasChildToggled = cast(typeof(_klass.rowHasChildToggled))&_vfuncRowHasChildToggledTramp;
        break;
      }
      case "row_inserted":
      {
        static extern(C) void _vfuncRowInsertedTramp(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.rowInserted)
              return (cast(typeof(&_vfuncRowInsertedTramp))_klass.rowInserted)(treeModel, path, iter);
            return;
          }

          auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;
          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRowInserted(_path, _iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncRowInserted");
          }
          if (_path)
            _path._cUnborrow;
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.rowInserted = cast(typeof(_klass.rowInserted))&_vfuncRowInsertedTramp;
        break;
      }
      case "unref_node":
      {
        static extern(C) void _vfuncUnrefNodeTramp(GtkTreeModel* treeModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)treeModel);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)treeModel), gid.gtk4.tree_model.TreeModel._getGType);
            if (_klass && _klass.unrefNode)
              return (cast(typeof(&_vfuncUnrefNodeTramp))_klass.unrefNode)(treeModel, iter);
            return;
          }

          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncUnrefNode(_iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_model.TreeModel.vfuncUnrefNode");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.unrefNode = cast(typeof(_klass.unrefNode))&_vfuncUnrefNodeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_model.TreeModel]
template TreeModelGidBuilderT()
{
}
