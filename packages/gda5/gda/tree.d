/// Module for [Tree] class
module gda.tree;

import gda.c.functions;
import gda.c.types;
import gda.tree_manager;
import gda.tree_node;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/** */
class Tree : gobject.object.ObjectWrap
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
    return cast(void function())gda_tree_get_type != &gidSymbolNotFound ? gda_tree_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Tree self()
  {
    return this;
  }

  /**
      Get `isList` property.
      Returns: Tells if the GdaTree is a list or a tree.
  */
  @property bool isList()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-list");
  }

  /**
      Creates a new #GdaTree object
      Returns: a new #GdaTree object
  */
  this()
  {
    GdaTree* _cretval;
    _cretval = gda_tree_new();
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_tree_error_quark();
    return _retval;
  }

  /**
      Sets manager as a top #GdaTreeManager object, which will be responsible for creating top level nodes in tree.
  
      Params:
        manager = a #GdaTreeManager object
  */
  void addManager(gda.tree_manager.TreeManager manager)
  {
    gda_tree_add_manager(cast(GdaTree*)this._cPtr, manager ? cast(GdaTreeManager*)manager._cPtr(No.Dup) : null);
  }

  /**
      Removes any node in tree
  */
  void clean()
  {
    gda_tree_clean(cast(GdaTree*)this._cPtr);
  }

  /**
      Dumps the contents of tree to stream, using a hierarchical view.
  
      Params:
        node = a #GdaTreeNode to start the dump from, or null for a full dump
        stream = a stream to send the dump to, or null for STDOUT
  */
  void dump(gda.tree_node.TreeNode node = null, void* stream = null)
  {
    gda_tree_dump(cast(GdaTree*)this._cPtr, node ? cast(GdaTreeNode*)node._cPtr(No.Dup) : null, stream);
  }

  /**
      Locates a #GdaTreeNode using the tree_path path.
  
      Params:
        treePath = full path to the required nodes (if use_names is true, then it must start with '/')
        useNames = if true, then tree_path will be interpreted as a unix style path, and if false,
                      then tree_path will be interpreted similarly to the #GtkTreePath's string representation.
      Returns: the requested #GdaTreeNode pointer, or null if not found
  */
  gda.tree_node.TreeNode getNode(string treePath, bool useNames)
  {
    GdaTreeNode* _cretval;
    const(char)* _treePath = treePath.toCString(No.Alloc);
    _cretval = gda_tree_get_node(cast(GdaTree*)this._cPtr, _treePath, useNames);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.tree_node.TreeNode)(cast(GdaTreeNode*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GdaTreeManager which created node in tree
  
      Params:
        node = a #GdaTreeNode present in tree
      Returns: the #GdaTreeManager, or null if node is not present in tree
  */
  gda.tree_manager.TreeManager getNodeManager(gda.tree_node.TreeNode node)
  {
    GdaTreeManager* _cretval;
    _cretval = gda_tree_get_node_manager(cast(GdaTree*)this._cPtr, node ? cast(GdaTreeNode*)node._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.tree_manager.TreeManager)(cast(GdaTreeManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the path associated to node in tree.
  
      Params:
        node = a #GdaTreeNode node in tree
      Returns: a new string, or null if node is not in tree
  */
  string getNodePath(gda.tree_node.TreeNode node)
  {
    char* _cretval;
    _cretval = gda_tree_get_node_path(cast(GdaTree*)this._cPtr, node ? cast(GdaTreeNode*)node._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      The returned list is a list of all the #GdaTreeNode nodes <emphasis>below</emphasis> the node
      at the specified path.
      
      As a corner case if tree_path is null, then the returned list contains all the top level nodes.
  
      Params:
        treePath = full path to the required nodes (if use_names is true, then it must start with '/'), or null
        useNames = if true, then tree_path will be interpreted as a unix style path, and if false,
                      then tree_path will be interpreted similarly to the #GtkTreePath's string representation.
      Returns: a new list of #GdaTreeNode pointers, free it with [glib.slist.SList.free]
  */
  gda.tree_node.TreeNode[] getNodesInPath(string treePath, bool useNames)
  {
    GSList* _cretval;
    const(char)* _treePath = treePath.toCString(No.Alloc);
    _cretval = gda_tree_get_nodes_in_path(cast(GdaTree*)this._cPtr, _treePath, useNames);
    auto _retval = gSListToD!(gda.tree_node.TreeNode, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Sets an attribute to tree, which will be accessible to any node in it.
  
      Params:
        attribute = attribute name
        value = a #GValue, or null
        destroy = a function to be called when attribute is not needed anymore, or null
  */
  void setAttribute(string attribute, gobject.value.Value value, glib.types.DestroyNotify destroy)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;

    const(char)* _attribute = attribute.toCString(No.Alloc);
    gda_tree_set_attribute(cast(GdaTree*)this._cPtr, _attribute, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, _destroyCB);
  }

  /**
      Requests that tree be populated with nodes. If an error occurs, then tree's contents is left
      unchanged, and otherwise tree's previous contents is completely replaced by the new one.
      Returns: TRUE if no error occurred.
      Throws: [TreeException]
  */
  bool updateAll()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_tree_update_all(cast(GdaTree*)this._cPtr, &_err);
    if (_err)
      throw new TreeException(_err);
    return _retval;
  }

  /**
      Update the children of node in tree (not recursively, to update recursively, use
      [gda.tree.Tree.updatePart]). If node is null then the top level nodes are updated.
  
      Params:
        node = a #GdaTreeNode node in tree, or null
      Returns: TRUE if no error occurred.
      Throws: [TreeException]
  */
  bool updateChildren(gda.tree_node.TreeNode node = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_tree_update_children(cast(GdaTree*)this._cPtr, node ? cast(GdaTreeNode*)node._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new TreeException(_err);
    return _retval;
  }

  /**
      Requests that tree be populated with nodes, starting from node
  
      Params:
        node = a #GdaTreeNode node in tree
      Returns: TRUE if no error occurred.
      Throws: [TreeException]
  */
  bool updatePart(gda.tree_node.TreeNode node)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_tree_update_part(cast(GdaTree*)this._cPtr, node ? cast(GdaTreeNode*)node._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new TreeException(_err);
    return _retval;
  }

  /**
      Connect to `NodeChanged` signal.
  
      Gets emitted when a node has changed in tree
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.tree_node.TreeNode node, gda.tree.Tree tree))
  
          `node` the #GdaTreeNode which has changed (optional)
  
          `tree` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNodeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.tree_node.TreeNode)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree.Tree)))
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
    return connectSignalClosure("node-changed", closure, after);
  }

  /**
      Connect to `NodeDeleted` signal.
  
      Gets emitted when a node has been removed from tree
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string nodePath, gda.tree.Tree tree))
  
          `nodePath` the position the node held in tree as a tree path (optional)
  
          `tree` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNodeDeleted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree.Tree)))
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
    return connectSignalClosure("node-deleted", closure, after);
  }

  /**
      Connect to `NodeHasChildToggled` signal.
  
      Gets emitted when a node has has a child when it did not have any or when it
      does not have a ny children anymore when it had some
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.tree_node.TreeNode node, gda.tree.Tree tree))
  
          `node` the #GdaTreeNode which changed from having children to being a
                 leaf or the other way around (optional)
  
          `tree` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNodeHasChildToggled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.tree_node.TreeNode)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree.Tree)))
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
    return connectSignalClosure("node-has-child-toggled", closure, after);
  }

  /**
      Connect to `NodeInserted` signal.
  
      Gets emitted when a node has been inserted in tree
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.tree_node.TreeNode node, gda.tree.Tree tree))
  
          `node` the #GdaTreeNode which has inserted (optional)
  
          `tree` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNodeInserted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.tree_node.TreeNode)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree.Tree)))
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
    return connectSignalClosure("node-inserted", closure, after);
  }
}

class TreeException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.tree.Tree.errorQuark, cast(int)code, msg);
  }

  alias Code = TreeError;
}
