/// Module for [ClipNode] class
module gsk.clip_node;

public import gid.basictypes;
import gid.gid;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node applying a rectangular clip to its single child node.
*/
class ClipNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.clip_node.ClipNode");

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
  this(gsk.render_node.RenderNode child, graphene.rect.Rect clip)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_clip_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, clip ? cast(const(graphene_rect_t)*)clip._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting clipped by the given node.
      Returns: The child that is getting clipped
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_clip_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the clip rectangle for node.
      Returns: a clip rectangle
  */
  graphene.rect.Rect getClip()
  {
    const(graphene_rect_t)* _cretval;
    _cretval = gsk_clip_node_get_clip(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
