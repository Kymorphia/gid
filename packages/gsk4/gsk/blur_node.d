/// Module for [BlurNode] class
module gsk.blur_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node applying a blur effect to its single child.
*/
class BlurNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a render node that blurs the child.
  
      Params:
        child = the child node to blur
        radius = the blur radius. Must be positive
      Returns: a new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, float radius) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, radius);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child [gsk.render_node.RenderNode] of the blur node.
      Returns: the blurred child node
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the blur radius of the node.
      Returns: the blur radius
  */
  float getRadius() nothrow
  {
    float _retval;
    _retval = gsk_blur_node_get_radius(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
