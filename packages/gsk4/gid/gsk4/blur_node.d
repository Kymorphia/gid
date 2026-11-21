/// Module for [BlurNode] class
module gid.gsk4.blur_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node applying a blur effect to its single child.
*/
class BlurNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_blur_node_get_type != &gidSymbolNotFound ? gsk_blur_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a render node that blurs the child.
  
      Params:
        child = the child node to blur
        radius = the blur radius. Must be positive
      Returns: a new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, float radius) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, radius);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child [gid.gsk4.render_node.RenderNode] of the blur node.
      Returns: the blurred child node
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
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
