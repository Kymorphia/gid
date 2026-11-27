/// Module for [ContainerNode] class
module gid.gsk4.container_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node that can contain other render nodes.
*/
@gidGir("ContainerNode")
class ContainerNode : gid.gsk4.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gsk_container_node_get_type != &gidSymbolNotFound ? gsk_container_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a new [gid.gsk4.render_node.RenderNode] instance for holding the given children.
      
      The new node will acquire a reference to each of the children.
  
      Params:
        children = The children of the node
      Returns: the new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode[] children) nothrow
  {
    GskRenderNode* _cretval;
    uint _nChildren;
    if (children)
      _nChildren = cast(uint)children.length;

    auto _children_arr = new GskRenderNode*[](children.length);
    auto _children = cast(GskRenderNode**)_children_arr.ptr;
    foreach (i, obj; children) _children[i] = obj ? cast(GskRenderNode*)obj._cPtr(No.Dup) : null;
    _cretval = gsk_container_node_new(_children, _nChildren);
    this(_cretval, Yes.Take);
  }

  /**
      Gets one of the children of container.
  
      Params:
        idx = the position of the child to get
      Returns: the idx'th child of container
  */
  gid.gsk4.render_node.RenderNode getChild(uint idx) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_container_node_get_child(cast(const(GskRenderNode)*)this._cPtr, idx);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the number of direct children of node.
      Returns: the number of children of the [gid.gsk4.render_node.RenderNode]
  */
  uint getNChildren() nothrow
  {
    uint _retval;
    _retval = gsk_container_node_get_n_children(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
