/// Module for [ContainerNode] class
module gsk.container_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node that can contain other render nodes.
*/
class ContainerNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.container_node.ContainerNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a new [gsk.render_node.RenderNode] instance for holding the given children.
      
      The new node will acquire a reference to each of the children.
  
      Params:
        children = The children of the node
      Returns: the new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode[] children)
  {
    GskRenderNode* _cretval;
    uint _nChildren;
    if (children)
      _nChildren = cast(uint)children.length;

    GskRenderNode*[] _tmpchildren;
    foreach (obj; children)
      _tmpchildren ~= obj ? cast(GskRenderNode*)obj._cPtr : null;
    GskRenderNode** _children = cast(GskRenderNode**)_tmpchildren.ptr;

    _cretval = gsk_container_node_new(_children, _nChildren);
    this(_cretval, Yes.Take);
  }

  /**
      Gets one of the children of container.
  
      Params:
        idx = the position of the child to get
      Returns: the idx'th child of container
  */
  gsk.render_node.RenderNode getChild(uint idx)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_container_node_get_child(cast(const(GskRenderNode)*)this._cPtr, idx);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the number of direct children of node.
      Returns: the number of children of the [gsk.render_node.RenderNode]
  */
  uint getNChildren()
  {
    uint _retval;
    _retval = gsk_container_node_get_n_children(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
