/// Module for [TransformNode] class
module gsk.transform_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.transform;
import gsk.types;

/**
    A render node applying a [gsk.transform.Transform] to its single child node.
*/
class TransformNode : gsk.render_node.RenderNode
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
    return cast(void function())gsk_transform_node_get_type != &gidSymbolNotFound ? gsk_transform_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will transform the given child
      with the given transform.
  
      Params:
        child = The node to transform
        transform = The transform to apply
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.transform.Transform transform = null) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, transform ? cast(GskTransform*)transform._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting transformed by the given node.
      Returns: The child that is getting transformed
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the [gsk.transform.Transform] used by the node.
      Returns: a [gsk.transform.Transform]
  */
  gsk.transform.Transform getTransform() nothrow
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_node_get_transform(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
