/// Module for [PasteNode] class
module gid.gsk4.paste_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node for a paste.
*/
class PasteNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_paste_node_get_type != &gidSymbolNotFound ? gsk_paste_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will paste copied contents.
  
      Params:
        bounds = the rectangle to render the paste into
        depth = the index of which copy to paste. This will usually be 0.
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.graphene1.rect.Rect bounds, size_t depth) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_paste_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, depth);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the index of the copy that should be pasted.
      Returns: the index of the copy to paste.
  */
  size_t getDepth() nothrow
  {
    size_t _retval;
    _retval = gsk_paste_node_get_depth(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
