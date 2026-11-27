/// Module for [BlendNode] class
module gid.gsk4.blend_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node applying a blending function between its two child nodes.
*/
@gidGir("BlendNode")
class BlendNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_blend_node_get_type != &gidSymbolNotFound ? gsk_blend_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will use blend_mode to blend the top
      node onto the bottom node.
  
      Params:
        bottom = The bottom node to be drawn
        top = The node to be blended onto the bottom node
        blendMode = The blend mode to use
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode bottom, gid.gsk4.render_node.RenderNode top, gid.gsk4.types.BlendMode blendMode) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blend_node_new(bottom ? cast(GskRenderNode*)bottom._cPtr(No.Dup) : null, top ? cast(GskRenderNode*)top._cPtr(No.Dup) : null, blendMode);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the blend mode used by node.
      Returns: the blend mode
  */
  gid.gsk4.types.BlendMode getBlendMode() nothrow
  {
    GskBlendMode _cretval;
    _cretval = gsk_blend_node_get_blend_mode(cast(const(GskRenderNode)*)this._cPtr);
    gid.gsk4.types.BlendMode _retval = cast(gid.gsk4.types.BlendMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the bottom [gid.gsk4.render_node.RenderNode] child of the node.
      Returns: the bottom child node
  */
  gid.gsk4.render_node.RenderNode getBottomChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blend_node_get_bottom_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the top [gid.gsk4.render_node.RenderNode] child of the node.
      Returns: the top child node
  */
  gid.gsk4.render_node.RenderNode getTopChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blend_node_get_top_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
