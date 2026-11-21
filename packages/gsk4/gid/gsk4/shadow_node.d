/// Module for [ShadowNode] class
module gid.gsk4.shadow_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.shadow;
import gid.gsk4.types;

/**
    A render node drawing one or more shadows behind its single child node.
*/
class ShadowNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_shadow_node_get_type != &gidSymbolNotFound ? gsk_shadow_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will draw a child with the given
      shadows below it.
  
      Params:
        child = The node to draw
        shadows = The shadows to apply
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.gsk4.shadow.Shadow[] shadows) nothrow
  {
    GskRenderNode* _cretval;
    size_t _nShadows;
    if (shadows)
      _nShadows = cast(size_t)shadows.length;

    auto _shadows_arr = new GskShadow[](shadows.length);
    auto _shadows = _shadows_arr.ptr;
    foreach (i, obj; shadows) _shadows[i] = *cast(GskShadow*)obj._cPtr;
    _cretval = gsk_shadow_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, _shadows, _nShadows);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child [gid.gsk4.render_node.RenderNode] of the shadow node.
      Returns: the child render node
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_shadow_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the number of shadows in the node.
      Returns: the number of shadows.
  */
  size_t getNShadows() nothrow
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
  gid.gsk4.shadow.Shadow getShadow(size_t i) nothrow
  {
    const(GskShadow)* _cretval;
    _cretval = gsk_shadow_node_get_shadow(cast(const(GskRenderNode)*)this._cPtr, i);
    auto _retval = _cretval ? new gid.gsk4.shadow.Shadow(cast(GskShadow*)_cretval, No.Take) : null;
    return _retval;
  }
}
