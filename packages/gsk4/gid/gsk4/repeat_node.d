/// Module for [RepeatNode] class
module gid.gsk4.repeat_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node repeating its single child node.
*/
class RepeatNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_repeat_node_get_type != &gidSymbolNotFound ? gsk_repeat_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will repeat the drawing of child across
      the given bounds.
  
      Params:
        bounds = The bounds of the area to be painted
        child = The child to repeat
        childBounds = The area of the child to repeat or null to
              use the child's bounds
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.graphene1.rect.Rect bounds, gid.gsk4.render_node.RenderNode child, gid.graphene1.rect.Rect childBounds = null) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_repeat_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, childBounds ? cast(const(graphene_rect_t)*)childBounds._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child of node.
      Returns: a [gid.gsk4.render_node.RenderNode]
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_repeat_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the bounding rectangle of the child of node.
      Returns: a bounding rectangle
  */
  gid.graphene1.rect.Rect getChildBounds() nothrow
  {
    const(graphene_rect_t)* _cretval;
    _cretval = gsk_repeat_node_get_child_bounds(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.graphene1.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
