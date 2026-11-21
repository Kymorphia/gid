/// Module for [MaskNode] class
module gid.gsk4.mask_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node masking one child node with another.
*/
class MaskNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_mask_node_get_type != &gidSymbolNotFound ? gsk_mask_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will mask a given node by another.
      
      The mask_mode determines how the 'mask values' are derived from
      the colors of the mask. Applying the mask consists of multiplying
      the 'mask value' with the alpha of the source.
  
      Params:
        source = The source node to be drawn
        mask = The node to be used as mask
        maskMode = The mask mode to use
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode source, gid.gsk4.render_node.RenderNode mask, gid.gsk4.types.MaskMode maskMode) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_mask_node_new(source ? cast(GskRenderNode*)source._cPtr(No.Dup) : null, mask ? cast(GskRenderNode*)mask._cPtr(No.Dup) : null, maskMode);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the mask [gid.gsk4.render_node.RenderNode] child of the node.
      Returns: the mask child node
  */
  gid.gsk4.render_node.RenderNode getMask() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_mask_node_get_mask(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the mask mode used by node.
      Returns: the mask mode
  */
  gid.gsk4.types.MaskMode getMaskMode() nothrow
  {
    GskMaskMode _cretval;
    _cretval = gsk_mask_node_get_mask_mode(cast(const(GskRenderNode)*)this._cPtr);
    gid.gsk4.types.MaskMode _retval = cast(gid.gsk4.types.MaskMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the source [gid.gsk4.render_node.RenderNode] child of the node.
      Returns: the source child node
  */
  gid.gsk4.render_node.RenderNode getSource() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_mask_node_get_source(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
