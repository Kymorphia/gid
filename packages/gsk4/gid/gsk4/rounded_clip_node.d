/// Module for [RoundedClipNode] class
module gid.gsk4.rounded_clip_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.rounded_rect;
import gid.gsk4.types;

/**
    A render node applying a rounded rectangle clip to its single child.
*/
class RoundedClipNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_rounded_clip_node_get_type != &gidSymbolNotFound ? gsk_rounded_clip_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will clip the child to the area
      given by clip.
  
      Params:
        child = The node to draw
        clip = The clip to apply
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.gsk4.rounded_rect.RoundedRect clip) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_rounded_clip_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, clip ? cast(const(GskRoundedRect)*)clip._cPtr : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting clipped by the given node.
      Returns: The child that is getting clipped
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_rounded_clip_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the rounded rectangle used to clip the contents of the node.
      Returns: a rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect getClip() nothrow
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_rounded_clip_node_get_clip(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }
}
