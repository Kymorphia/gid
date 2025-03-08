module gsk.mask_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node masking one child node with another.
*/
class MaskNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.MaskNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will mask a given node by another.
    
    The mask_mode determines how the 'mask values' are derived from
    the colors of the mask. Applying the mask consists of multiplying
    the 'mask value' with the alpha of the source.
    Params:
      source =       The source node to be drawn
      mask =       The node to be used as mask
      maskMode =       The mask mode to use
    Returns:     A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode source, gsk.render_node.RenderNode mask, gsk.types.MaskMode maskMode)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_mask_node_new(source ? cast(GskRenderNode*)source.cPtr(No.Dup) : null, mask ? cast(GskRenderNode*)mask.cPtr(No.Dup) : null, maskMode);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the mask [gsk.render_node.RenderNode] child of the node.
    Returns:     the mask child node
  */
  gsk.render_node.RenderNode getMask()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_mask_node_get_mask(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the mask mode used by node.
    Returns:     the mask mode
  */
  gsk.types.MaskMode getMaskMode()
  {
    GskMaskMode _cretval;
    _cretval = gsk_mask_node_get_mask_mode(cast(const(GskRenderNode)*)cPtr);
    gsk.types.MaskMode _retval = cast(gsk.types.MaskMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the source [gsk.render_node.RenderNode] child of the node.
    Returns:     the source child node
  */
  gsk.render_node.RenderNode getSource()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_mask_node_get_source(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
