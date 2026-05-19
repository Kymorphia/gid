/// Module for [OpacityNode] class
module gsk.opacity_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node controlling the opacity of its single child node.
*/
class OpacityNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.opacity_node.OpacityNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will drawn the child with reduced
      opacity.
  
      Params:
        child = The node to draw
        opacity = The opacity to apply
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, float opacity)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_opacity_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, opacity);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting opacityed by the given node.
      Returns: The child that is getting opacityed
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_opacity_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the transparency factor for an opacity node.
      Returns: the opacity factor
  */
  float getOpacity()
  {
    float _retval;
    _retval = gsk_opacity_node_get_opacity(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
