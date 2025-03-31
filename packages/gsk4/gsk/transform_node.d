/// Module for [TransformNode] class
module gsk.transform_node;

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
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.TransformNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will transform the given child
      with the given transform.
  
      Params:
        child = The node to transform
        transform = The transform to apply
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.transform.Transform transform)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, transform ? cast(GskTransform*)transform.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting transformed by the given node.
      Returns: The child that is getting transformed
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_get_child(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the [gsk.transform.Transform] used by the node.
      Returns: a [gsk.transform.Transform]
  */
  gsk.transform.Transform getTransform()
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_node_get_transform(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
