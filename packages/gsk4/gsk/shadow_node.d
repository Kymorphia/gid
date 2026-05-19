/// Module for [ShadowNode] class
module gsk.shadow_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.shadow;
import gsk.types;

/**
    A render node drawing one or more shadows behind its single child node.
*/
class ShadowNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.shadow_node.ShadowNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Retrieves the child [gsk.render_node.RenderNode] of the shadow node.
      Returns: the child render node
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_shadow_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the number of shadows in the node.
      Returns: the number of shadows.
  */
  size_t getNShadows()
  {
    size_t _retval;
    _retval = gsk_shadow_node_get_n_shadows(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the shadow data at the given index `i`.
  
      Params:
        i = the given index
      Returns: the shadow data
  */
  gsk.shadow.Shadow getShadow(size_t i)
  {
    const(GskShadow)* _cretval;
    _cretval = gsk_shadow_node_get_shadow(cast(const(GskRenderNode)*)this._cPtr, i);
    auto _retval = _cretval ? new gsk.shadow.Shadow(cast(GskShadow*)_cretval, No.Take) : null;
    return _retval;
  }
}
