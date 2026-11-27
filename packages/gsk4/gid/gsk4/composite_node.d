/// Module for [CompositeNode] class
module gid.gsk4.composite_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node that uses Porter/Duff compositing operators to combine
    its child with the background.
*/
@gidGir("CompositeNode")
class CompositeNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_composite_node_get_type != &gidSymbolNotFound ? gsk_composite_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will composite the child onto the
      background with the given operator wherever the mask is set.
      
      Note that various operations can modify the background outside of
      the child's bounds, so the mask may cause visual changes outside
      of the child.
  
      Params:
        child = The child to composite
        mask = The mask where the compositing will apply
        op = The compositing operator
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.gsk4.render_node.RenderNode mask, gid.gsk4.types.PorterDuff op) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_composite_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, mask ? cast(GskRenderNode*)mask._cPtr(No.Dup) : null, op);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting composited by the given node.
      Returns: the child [gid.gsk4.render_node.RenderNode]
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_composite_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the mask node that describes the region where the compositing
      applies.
      Returns: the mask [gid.gsk4.render_node.RenderNode]
  */
  gid.gsk4.render_node.RenderNode getMask() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_composite_node_get_mask(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the compositing operator used by this node.
      Returns: The compositing operator
  */
  gid.gsk4.types.PorterDuff getOperator() nothrow
  {
    GskPorterDuff _cretval;
    _cretval = gsk_composite_node_get_operator(cast(const(GskRenderNode)*)this._cPtr);
    gid.gsk4.types.PorterDuff _retval = cast(gid.gsk4.types.PorterDuff)_cretval;
    return _retval;
  }
}
