/// Module for [TreeNode] class
module gda.tree_node;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gobject.value;

/** */
class TreeNode : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_tree_node_get_type != &gidSymbolNotFound ? gda_tree_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeNode self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gda.tree_node.TreeNode]
      Returns: New builder object
  */
  static TreeNodeGidBuilder builder() nothrow
  {
    return new TreeNodeGidBuilder;
  }

  /** */
  @property string name() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name");
  }

  /** */
  @property void name(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("name", propval);
  }

  /**
      Creates a new #GdaTreeNode object
  
      Params:
        name = a name, or null
      Returns: a new #GdaTreeNode
  */
  this(string name = null) nothrow
  {
    GdaTreeNode* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gda_tree_node_new(_name);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gda_tree_node_error_quark();
    return _retval;
  }

  /**
      Get the value associated to the attribute named attribute for node. If the attribute is not set,
      then node's parents is queries (recursively up to the top level node).
      
      Attributes can have any name, but Libgda proposes some default names,
      see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
  
      Params:
        attribute = attribute name as a string
      Returns: a read-only #GValue, or null if not attribute named attribute has been set for node
  */
  gobject.value.Value fetchAttribute(string attribute) nothrow
  {
    const(GValue)* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = gda_tree_node_fetch_attribute(cast(GdaTreeNode*)this._cPtr, _attribute);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the #GdaTreeNode child of node at position index (starting at 0).
  
      Params:
        index = a index
      Returns: the #GdaTreeNode, or null if not found
  */
  gda.tree_node.TreeNode getChildIndex(int index) nothrow
  {
    GdaTreeNode* _cretval;
    _cretval = gda_tree_node_get_child_index(cast(GdaTreeNode*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.tree_node.TreeNode)(cast(GdaTreeNode*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GdaTreeNode child of node which has the #GDA_ATTRIBUTE_NAME set to name
  
      Params:
        name = requested node's name
      Returns: the #GdaTreeNode, or null if not found
  */
  gda.tree_node.TreeNode getChildName(string name) nothrow
  {
    GdaTreeNode* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gda_tree_node_get_child_name(cast(GdaTreeNode*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.tree_node.TreeNode)(cast(GdaTreeNode*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get a list of all node's children, free it with [glib.slist.SList.free] after usage
      Returns: a new #GSList of #GdaTreeNode objects, or null if node does not have any child
  */
  gda.tree_node.TreeNode[] getChildren() nothrow
  {
    GSList* _cretval;
    _cretval = gda_tree_node_get_children(cast(GdaTreeNode*)this._cPtr);
    auto _retval = gSListToD!(gda.tree_node.TreeNode, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Get the value associated to the attribute named attribute for node. The difference with [gda.tree_node.TreeNode.fetchAttribute]
      is that [gda.tree_node.TreeNode.fetchAttribute] will also query node's parents (recursively up to the top level node) if
      the attribute is not set for node.
      
      Attributes can have any name, but Libgda proposes some default names,
      see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
  
      Params:
        attribute = attribute name as a string
      Returns: a read-only #GValue, or null if not attribute named attribute has been set for node
  */
  gobject.value.Value getNodeAttribute(string attribute) nothrow
  {
    const(GValue)* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = gda_tree_node_get_node_attribute(cast(GdaTreeNode*)this._cPtr, _attribute);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the #GdaTreeNode parent of node in the #GdaTree node belongs to. If node is at the top level,
      then this method return null.
      Returns: the parent #GdaTreeNode
  */
  gda.tree_node.TreeNode getParent() nothrow
  {
    GdaTreeNode* _cretval;
    _cretval = gda_tree_node_get_parent(cast(GdaTreeNode*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.tree_node.TreeNode)(cast(GdaTreeNode*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the value associated to a named attribute. The attribute string is used AS IT IS by this method (eg.
      no copy of it is made), and
      the memory it uses will be freed using the destroy function when no longer needed (if destroy is null,
      then the string will not be freed at all).
      
      Attributes can have any name, but Libgda proposes some default names,
      see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
      
      For example one would use it as:
      
      <code>
      gda_tree_node_set_node_attribute (node, g_strdup (my_attribute), my_value, g_free);
      gda_tree_node_set_node_attribute (node, GDA_ATTRIBUTE_NAME, my_value, NULL);
      </code>
      
      If there is already an attribute named attribute set, then its value is replaced with the new value (value is
      copied), except if value is null, in which case the attribute is removed.
  
      Params:
        attribute = attribute name
        value = a #GValue, or null
        destroy = a function to be called when attribute is not needed anymore, or null
  */
  void setNodeAttribute(string attribute, gobject.value.Value value, glib.types.DestroyNotify destroy) nothrow
  {
    extern(C) void _destroyCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.DestroyNotify");
      }
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    gda_tree_node_set_node_attribute(cast(GdaTreeNode*)this._cPtr, _attribute, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, _destroyCB);
  }

  /**
      Connect to `NodeChanged` signal.
  
      Gets emitted when a node has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gda.tree_node.TreeNode node, gda.tree_node.TreeNode treeNode)`
  
          `node` the #GdaTreeNode which has changed (optional)
  
          `treeNode` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNodeChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.tree_node.TreeNode)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree_node.TreeNode)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gda.tree_node.TreeNode.nodeChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("node-changed", closure, after);
  }

  /**
      Connect to `NodeDeleted` signal.
  
      Gets emitted when a node has been removed
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string relativePath, gda.tree_node.TreeNode treeNode)`
  
          `relativePath` the path the node held, relative to reporting (optional)
  
          `treeNode` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNodeDeleted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree_node.TreeNode)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gda.tree_node.TreeNode.nodeDeleted");
      }
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
  
          `void callback(gda.tree_node.TreeNode node, gda.tree_node.TreeNode treeNode)`
  
          `node` the #GdaTreeNode which changed from having children to being a
                   leaf or the other way around (optional)
  
          `treeNode` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNodeHasChildToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.tree_node.TreeNode)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree_node.TreeNode)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gda.tree_node.TreeNode.nodeHasChildToggled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("node-has-child-toggled", closure, after);
  }

  /**
      Connect to `NodeInserted` signal.
  
      Gets emitted when a node has been inserted
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gda.tree_node.TreeNode node, gda.tree_node.TreeNode treeNode)`
  
          `node` the #GdaTreeNode which has been inserted (optional)
  
          `treeNode` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNodeInserted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.tree_node.TreeNode)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.tree_node.TreeNode)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gda.tree_node.TreeNode.nodeInserted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("node-inserted", closure, after);
  }
}

/// Fluent builder implementation template for [gda.tree_node.TreeNode]
class TreeNodeGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }
}

/// Fluent builder for [gda.tree_node.TreeNode]
final class TreeNodeGidBuilder : TreeNodeGidBuilderImpl!TreeNodeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeNode build() nothrow
  {
    return new TreeNode(cast(void*)createGObject(TreeNode._getGType), Yes.Take);
  }
}

class TreeNodeException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gda.tree_node.TreeNode.errorQuark, cast(int)code, msg);
  }

  alias Code = TreeNodeError;
}
