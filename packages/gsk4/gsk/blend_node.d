/// Module for [BlendNode] class
module gsk.blend_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node applying a blending function between its two child nodes.
*/
class BlendNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will use blend_mode to blend the top
      node onto the bottom node.
  
      Params:
        bottom = The bottom node to be drawn
        top = The node to be blended onto the bottom node
        blendMode = The blend mode to use
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode bottom, gsk.render_node.RenderNode top, gsk.types.BlendMode blendMode) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blend_node_new(bottom ? cast(GskRenderNode*)bottom._cPtr(No.Dup) : null, top ? cast(GskRenderNode*)top._cPtr(No.Dup) : null, blendMode);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the blend mode used by node.
      Returns: the blend mode
  */
  gsk.types.BlendMode getBlendMode() nothrow
  {
    GskBlendMode _cretval;
    _cretval = gsk_blend_node_get_blend_mode(cast(const(GskRenderNode)*)this._cPtr);
    gsk.types.BlendMode _retval = cast(gsk.types.BlendMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the bottom [gsk.render_node.RenderNode] child of the node.
      Returns: the bottom child node
  */
  gsk.render_node.RenderNode getBottomChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blend_node_get_bottom_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the top [gsk.render_node.RenderNode] child of the node.
      Returns: the top child node
  */
  gsk.render_node.RenderNode getTopChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blend_node_get_top_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
