/// Module for [Node] class
module gid.glib2.node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    The #GNode struct represents one node in a [n-ary tree](data-structures.html#n-ary-trees).
*/
class Node : StructWrap!(GNode)
{
  /**
      Create a `node.Node` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `next` field.
      Returns: points to the node's next sibling (a sibling is another
               #GNode with the same parent).
  */
  @property gid.glib2.node.Node next() nothrow
  {
    return (cast(GNode*)this._cPtr).next ? new gid.glib2.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).next, this) : null;
  }

  /**
      Get `prev` field.
      Returns: points to the node's previous sibling.
  */
  @property gid.glib2.node.Node prev() nothrow
  {
    return (cast(GNode*)this._cPtr).prev ? new gid.glib2.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).prev, this) : null;
  }

  /**
      Get `parent` field.
      Returns: points to the parent of the #GNode, or is null if the
                 #GNode is the root of the tree.
  */
  @property gid.glib2.node.Node parent() nothrow
  {
    return (cast(GNode*)this._cPtr).parent ? new gid.glib2.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).parent, this) : null;
  }

  /**
      Get `children` field.
      Returns: points to the first child of the #GNode.  The other
                   children are accessed by using the @next pointer of each
                   child.
  */
  @property gid.glib2.node.Node children() nothrow
  {
    return (cast(GNode*)this._cPtr).children ? new gid.glib2.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).children, this) : null;
  }

  /**
      Gets the position of the first child of a #GNode
      which contains the given data.
  
      Params:
        data = the data to find
      Returns: the index of the child of node which contains
            data, or -1 if the data is not found
  */
  int childIndex(void* data = null) nothrow
  {
    int _retval;
    _retval = g_node_child_index(cast(GNode*)this._cPtr, data);
    return _retval;
  }

  /**
      Gets the position of a #GNode with respect to its siblings.
      child must be a child of node. The first child is numbered 0,
      the second 1, and so on.
  
      Params:
        child = a child of node
      Returns: the position of child with respect to its siblings
  */
  int childPosition(gid.glib2.node.Node child) nothrow
  {
    int _retval;
    _retval = g_node_child_position(cast(GNode*)this._cPtr, child ? cast(GNode*)child._cPtr : null);
    return _retval;
  }

  /**
      Calls a function for each of the children of a #GNode. Note that it
      doesn't descend beneath the child nodes. func must not do anything
      that would modify the structure of the tree.
  
      Params:
        flags = which types of children are to be visited, one of
              [gid.glib2.types.TraverseFlags.All], [gid.glib2.types.TraverseFlags.Leaves] and [gid.glib2.types.TraverseFlags.NonLeaves]
        func = the function to call for each visited node
  */
  void childrenForeach(gid.glib2.types.TraverseFlags flags, gid.glib2.types.NodeForeachFunc func) nothrow
  {
    extern(C) void _funcCallback(GNode* node, void* data) nothrow
    {
      auto _dlg = cast(gid.glib2.types.NodeForeachFunc*)data;
      auto _node = node ? new gid.glib2.node.Node(cast(void*)node, null) : null;

      try
      {
        (*_dlg)(_node);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.NodeForeachFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_node_children_foreach(cast(GNode*)this._cPtr, flags, _funcCB, _func);
  }

  /**
      Gets the depth of a #GNode.
      
      If node is null the depth is 0. The root node has a depth of 1.
      For the children of the root node the depth is 2. And so on.
      Returns: the depth of the #GNode
  */
  uint depth() nothrow
  {
    uint _retval;
    _retval = g_node_depth(cast(GNode*)this._cPtr);
    return _retval;
  }

  /**
      Removes root and its children from the tree, freeing any memory
      allocated.
  */
  void destroy() nothrow
  {
    g_node_destroy(cast(GNode*)this._cPtr);
  }

  /**
      Returns true if node is an ancestor of descendant.
      This is true if node is the parent of descendant,
      or if node is the grandparent of descendant etc.
  
      Params:
        descendant = a #GNode
      Returns: true if node is an ancestor of descendant
  */
  bool isAncestor(gid.glib2.node.Node descendant) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_node_is_ancestor(cast(GNode*)this._cPtr, descendant ? cast(GNode*)descendant._cPtr : null);
    return _retval;
  }

  /**
      Gets the maximum height of all branches beneath a #GNode.
      This is the maximum distance from the #GNode to all leaf nodes.
      
      If root is null, 0 is returned. If root has no children,
      1 is returned. If root has children, 2 is returned. And so on.
      Returns: the maximum height of the tree beneath root
  */
  uint maxHeight() nothrow
  {
    uint _retval;
    _retval = g_node_max_height(cast(GNode*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of children of a #GNode.
      Returns: the number of children of node
  */
  uint nChildren() nothrow
  {
    uint _retval;
    _retval = g_node_n_children(cast(GNode*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of nodes in a tree.
  
      Params:
        flags = which types of children are to be counted, one of
              [gid.glib2.types.TraverseFlags.All], [gid.glib2.types.TraverseFlags.Leaves] and [gid.glib2.types.TraverseFlags.NonLeaves]
      Returns: the number of nodes in the tree
  */
  uint nNodes(gid.glib2.types.TraverseFlags flags) nothrow
  {
    uint _retval;
    _retval = g_node_n_nodes(cast(GNode*)this._cPtr, flags);
    return _retval;
  }

  /**
      Reverses the order of the children of a #GNode.
      (It doesn't change the order of the grandchildren.)
  */
  void reverseChildren() nothrow
  {
    g_node_reverse_children(cast(GNode*)this._cPtr);
  }

  /**
      Traverses a tree starting at the given root #GNode.
      It calls the given function for each node visited.
      The traversal can be halted at any point by returning true from func.
      func must not do anything that would modify the structure of the tree.
  
      Params:
        order = the order in which nodes are visited - [gid.glib2.types.TraverseType.InOrder],
              [gid.glib2.types.TraverseType.PreOrder], [gid.glib2.types.TraverseType.PostOrder], or [gid.glib2.types.TraverseType.LevelOrder].
        flags = which types of children are to be visited, one of
              [gid.glib2.types.TraverseFlags.All], [gid.glib2.types.TraverseFlags.Leaves] and [gid.glib2.types.TraverseFlags.NonLeaves]
        maxDepth = the maximum depth of the traversal. Nodes below this
              depth will not be visited. If max_depth is -1 all nodes in
              the tree are visited. If depth is 1, only the root is visited.
              If depth is 2, the root and its children are visited. And so on.
        func = the function to call for each visited #GNode
  */
  void traverse(gid.glib2.types.TraverseType order, gid.glib2.types.TraverseFlags flags, int maxDepth, gid.glib2.types.NodeTraverseFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GNode* node, void* data) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.glib2.types.NodeTraverseFunc*)data;
      auto _node = node ? new gid.glib2.node.Node(cast(void*)node, null) : null;

      try
      {
        _dretval = (*_dlg)(_node);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.NodeTraverseFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_node_traverse(cast(GNode*)this._cPtr, order, flags, maxDepth, _funcCB, _func);
  }

  /**
      Unlinks a #GNode from a tree, resulting in two separate trees.
  */
  void unlink() nothrow
  {
    g_node_unlink(cast(GNode*)this._cPtr);
  }

  /** */
  static void popAllocator() nothrow
  {
    g_node_pop_allocator();
  }

  /** */
  static void pushAllocator(gid.glib2.types.Allocator allocator) nothrow
  {
    g_node_push_allocator(allocator);
  }
}
