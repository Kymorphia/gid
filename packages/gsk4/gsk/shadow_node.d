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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_shadow_node_get_type != &gidSymbolNotFound ? gsk_shadow_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will draw a child with the given
      shadows below it.
  
      Params:
        child = The node to draw
        shadows = The shadows to apply
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.shadow.Shadow[] shadows) nothrow
  {
    GskRenderNode* _cretval;
    size_t _nShadows;
    if (shadows)
      _nShadows = cast(size_t)shadows.length;

    auto _shadows_arr = new GskShadow[](shadows.length);
    auto _shadows = _shadows_arr.ptr;
    foreach (i, obj; shadows) _shadows[i] = obj._cInstance;
    _cretval = gsk_shadow_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, _shadows, _nShadows);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child [gsk.render_node.RenderNode] of the shadow node.
      Returns: the child render node
  */
  gsk.render_node.RenderNode getChild() nothrow
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
  gsk.shadow.Shadow getShadow(size_t i) nothrow
  {
    const(GskShadow)* _cretval;
    _cretval = gsk_shadow_node_get_shadow(cast(const(GskRenderNode)*)this._cPtr, i);
    auto _retval = _cretval ? new gsk.shadow.Shadow(cast(GskShadow*)_cretval, No.Take) : null;
    return _retval;
  }
}
