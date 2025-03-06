module gsk.debug_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node that emits a debugging message when drawing its
  child node.
*/
class DebugNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.DebugNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will add debug information about
    the given child.
    
    Adding this node has no visual effect.
    Params:
      child =       The child to add debug info for
      message =       The debug message
    Returns:     A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, string message)
  {
    GskRenderNode* _cretval;
    char* _message = message.toCString(Yes.Alloc);
    _cretval = gsk_debug_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, _message);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
    Returns:     the child [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_debug_node_get_child(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the debug message that was set on this node
    Returns:     The debug message
  */
  string getMessage()
  {
    const(char)* _cretval;
    _cretval = gsk_debug_node_get_message(cast(const(GskRenderNode)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
