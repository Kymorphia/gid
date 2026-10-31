/// Module for [CopyNode] class
module gsk.copy_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node that copies the current state of the rendering canvas
    so a [gsk.paste_node.PasteNode] can draw it.
*/
class CopyNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that copies the current rendering
      canvas for playback by paste nodes that are part of the child.
  
      Params:
        child = The child
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_copy_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
      Returns: the child [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_copy_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
