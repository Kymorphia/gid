/// Module for [RepeatNode] class
module gsk.repeat_node;

public import gid.basictypes;
import gid.gid;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node repeating its single child node.
*/
class RepeatNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.repeat_node.RepeatNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will repeat the drawing of child across
      the given bounds.
  
      Params:
        bounds = The bounds of the area to be painted
        child = The child to repeat
        childBounds = The area of the child to repeat or null to
              use the child's bounds
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(graphene.rect.Rect bounds, gsk.render_node.RenderNode child, graphene.rect.Rect childBounds = null)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_repeat_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, childBounds ? cast(const(graphene_rect_t)*)childBounds._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child of node.
      Returns: a [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_repeat_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the bounding rectangle of the child of node.
      Returns: a bounding rectangle
  */
  graphene.rect.Rect getChildBounds()
  {
    const(graphene_rect_t)* _cretval;
    _cretval = gsk_repeat_node_get_child_bounds(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
