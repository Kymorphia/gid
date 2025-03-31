/// Module for [RoundedClipNode] class
module gsk.rounded_clip_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.rounded_rect;
import gsk.types;

/**
    A render node applying a rounded rectangle clip to its single child.
*/
class RoundedClipNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.RoundedClipNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will clip the child to the area
      given by clip.
  
      Params:
        child = The node to draw
        clip = The clip to apply
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.rounded_rect.RoundedRect clip)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_rounded_clip_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, clip ? cast(const(GskRoundedRect)*)clip.cPtr : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting clipped by the given node.
      Returns: The child that is getting clipped
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_rounded_clip_node_get_child(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the rounded rectangle used to clip the contents of the node.
      Returns: a rounded rectangle
  */
  gsk.rounded_rect.RoundedRect getClip()
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_rounded_clip_node_get_clip(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval) : null;
    return _retval;
  }
}
