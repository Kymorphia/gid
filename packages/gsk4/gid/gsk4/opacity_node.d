/// Module for [OpacityNode] class
module gid.gsk4.opacity_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node controlling the opacity of its single child node.
*/
class OpacityNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_opacity_node_get_type != &gidSymbolNotFound ? gsk_opacity_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will drawn the child with reduced
      opacity.
  
      Params:
        child = The node to draw
        opacity = The opacity to apply
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, float opacity) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_opacity_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, opacity);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting opacityed by the given node.
      Returns: The child that is getting opacityed
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_opacity_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the transparency factor for an opacity node.
      Returns: the opacity factor
  */
  float getOpacity() nothrow
  {
    float _retval;
    _retval = gsk_opacity_node_get_opacity(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
