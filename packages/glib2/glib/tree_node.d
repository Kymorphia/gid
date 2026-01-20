/// Module for [TreeNode] class
module glib.tree_node;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    An opaque type which identifies a specific node in a #GTree.
*/
class TreeNode
{
  GTreeNode* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.tree_node.TreeNode");

    _cInstancePtr = cast(GTreeNode*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Gets the key stored at a particular tree node.
      Returns: the key at the node.
  */
  void* key()
  {
    auto _retval = g_tree_node_key(cast(GTreeNode*)this._cPtr);
    return _retval;
  }

  /**
      Returns the next in-order node of the tree, or null
      if the passed node was already the last one.
      Returns: the next node in the tree
  */
  glib.tree_node.TreeNode next()
  {
    GTreeNode* _cretval;
    _cretval = g_tree_node_next(cast(GTreeNode*)this._cPtr);
    auto _retval = _cretval ? new glib.tree_node.TreeNode(cast(GTreeNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the previous in-order node of the tree, or null
      if the passed node was already the first one.
      Returns: the previous node in the tree
  */
  glib.tree_node.TreeNode previous()
  {
    GTreeNode* _cretval;
    _cretval = g_tree_node_previous(cast(GTreeNode*)this._cPtr);
    auto _retval = _cretval ? new glib.tree_node.TreeNode(cast(GTreeNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the value stored at a particular tree node.
      Returns: the value at the node.
  */
  void* value()
  {
    auto _retval = g_tree_node_value(cast(GTreeNode*)this._cPtr);
    return _retval;
  }
}
