/// Module for [Node] class
module glib.node;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    The #GNode struct represents one node in a [n-ary tree][glib-N-ary-Trees].
*/
class Node
{
  GNode _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.node.Node");

    _cInstance = *cast(GNode*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `next` field.
      Returns: points to the node's next sibling (a sibling is another
               #GNode with the same parent).
  */
  @property glib.node.Node next()
  {
    return new glib.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).next, No.Take);
  }

  /**
      Get `prev` field.
      Returns: points to the node's previous sibling.
  */
  @property glib.node.Node prev()
  {
    return new glib.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).prev, No.Take);
  }

  /**
      Get `parent` field.
      Returns: points to the parent of the #GNode, or is null if the
                 #GNode is the root of the tree.
  */
  @property glib.node.Node parent()
  {
    return new glib.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).parent, No.Take);
  }

  /**
      Get `children` field.
      Returns: points to the first child of the #GNode.  The other
                   children are accessed by using the @next pointer of each
                   child.
  */
  @property glib.node.Node children()
  {
    return new glib.node.Node(cast(GNode*)(cast(GNode*)this._cPtr).children, No.Take);
  }

  /**
      Gets the position of the first child of a #GNode
      which contains the given data.
  
      Params:
        data = the data to find
      Returns: the index of the child of node which contains
            data, or -1 if the data is not found
  */
  int childIndex(void* data = null)
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
  int childPosition(glib.node.Node child)
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
              `G_TRAVERSE_ALL`, `G_TRAVERSE_LEAVES` and `G_TRAVERSE_NON_LEAVES`
        func = the function to call for each visited node
  */
  void childrenForeach(glib.types.TraverseFlags flags, glib.types.NodeForeachFunc func)
  {
    extern(C) void _funcCallback(GNode* node, void* data)
    {
      auto _dlg = cast(glib.types.NodeForeachFunc*)data;

      (*_dlg)(node ? new glib.node.Node(cast(void*)node, No.Take) : null);
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
  uint depth()
  {
    uint _retval;
    _retval = g_node_depth(cast(GNode*)this._cPtr);
    return _retval;
  }

  /**
      Removes root and its children from the tree, freeing any memory
      allocated.
  */
  void destroy()
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
  bool isAncestor(glib.node.Node descendant)
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
  uint maxHeight()
  {
    uint _retval;
    _retval = g_node_max_height(cast(GNode*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of children of a #GNode.
      Returns: the number of children of node
  */
  uint nChildren()
  {
    uint _retval;
    _retval = g_node_n_children(cast(GNode*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of nodes in a tree.
  
      Params:
        flags = which types of children are to be counted, one of
              `G_TRAVERSE_ALL`, `G_TRAVERSE_LEAVES` and `G_TRAVERSE_NON_LEAVES`
      Returns: the number of nodes in the tree
  */
  uint nNodes(glib.types.TraverseFlags flags)
  {
    uint _retval;
    _retval = g_node_n_nodes(cast(GNode*)this._cPtr, flags);
    return _retval;
  }

  /**
      Reverses the order of the children of a #GNode.
      (It doesn't change the order of the grandchildren.)
  */
  void reverseChildren()
  {
    g_node_reverse_children(cast(GNode*)this._cPtr);
  }

  /**
      Traverses a tree starting at the given root #GNode.
      It calls the given function for each node visited.
      The traversal can be halted at any point by returning true from func.
      func must not do anything that would modify the structure of the tree.
  
      Params:
        order = the order in which nodes are visited - `G_IN_ORDER`,
              `G_PRE_ORDER`, `G_POST_ORDER`, or `G_LEVEL_ORDER`.
        flags = which types of children are to be visited, one of
              `G_TRAVERSE_ALL`, `G_TRAVERSE_LEAVES` and `G_TRAVERSE_NON_LEAVES`
        maxDepth = the maximum depth of the traversal. Nodes below this
              depth will not be visited. If max_depth is -1 all nodes in
              the tree are visited. If depth is 1, only the root is visited.
              If depth is 2, the root and its children are visited. And so on.
        func = the function to call for each visited #GNode
  */
  void traverse(glib.types.TraverseType order, glib.types.TraverseFlags flags, int maxDepth, glib.types.NodeTraverseFunc func)
  {
    extern(C) gboolean _funcCallback(GNode* node, void* data)
    {
      bool _dretval;
      auto _dlg = cast(glib.types.NodeTraverseFunc*)data;

      _dretval = (*_dlg)(node ? new glib.node.Node(cast(void*)node, No.Take) : null);
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
  void unlink()
  {
    g_node_unlink(cast(GNode*)this._cPtr);
  }

  /** */
  static void popAllocator()
  {
    g_node_pop_allocator();
  }

  /** */
  static void pushAllocator(glib.types.Allocator allocator)
  {
    g_node_push_allocator(allocator);
  }
}
