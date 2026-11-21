/// Module for [TransformNode] class
module gid.gsk4.transform_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.transform;
import gid.gsk4.types;

/**
    A render node applying a [gid.gsk4.transform.Transform] to its single child node.
*/
class TransformNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_transform_node_get_type != &gidSymbolNotFound ? gsk_transform_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will transform the given child
      with the given transform.
  
      Params:
        child = The node to transform
        transform = The transform to apply
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.gsk4.transform.Transform transform = null) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, transform ? cast(GskTransform*)transform._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting transformed by the given node.
      Returns: The child that is getting transformed
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the [gid.gsk4.transform.Transform] used by the node.
      Returns: a [gid.gsk4.transform.Transform]
  */
  gid.gsk4.transform.Transform getTransform() nothrow
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_node_get_transform(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
