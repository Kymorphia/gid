/// Module for [IsolationNode] class
module gsk.isolation_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node that isolates its child from surrounding rendernodes.
*/
class IsolationNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that isolates the drawing operations of
      the child from surrounding ones.
      
      You can express "everything but these flags" in a forward compatible
      way by using bit math:
      `GSK_ISOLATION_ALL & ~(GSK_ISOLATION_BACKGROUND | GSK_ISOLATION_COPY_PASTE)`
      will isolate everything but background and copy/paste.
      
      For the available isolations, see [gsk.types.Isolation].
  
      Params:
        child = The child
        isolations = features to isolate
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.types.Isolation isolations) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_isolation_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, isolations);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
      Returns: the child [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_isolation_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the isolation features that are enforced by this node.
      Returns: the isolation features
  */
  gsk.types.Isolation getIsolations() nothrow
  {
    GskIsolation _cretval;
    _cretval = gsk_isolation_node_get_isolations(cast(const(GskRenderNode)*)this._cPtr);
    gsk.types.Isolation _retval = cast(gsk.types.Isolation)_cretval;
    return _retval;
  }
}
