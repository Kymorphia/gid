/// Module for [ComponentTransferNode] class
module gsk.component_transfer_node;

public import gid.basictypes;
import gdk.types;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.component_transfer;
import gsk.render_node;
import gsk.types;

/**
    A render node for applying a [gsk.component_transfer.ComponentTransfer] for each color
    component of the child node.
*/
class ComponentTransferNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a render node that will apply component
      transfers to a child node.
  
      Params:
        child = The child to apply component transfers to
        r = transfer for the red component
        g = transfer for the green component
        b = transfer for the blue component
        a = transfer for the alpha component
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.component_transfer.ComponentTransfer r, gsk.component_transfer.ComponentTransfer g, gsk.component_transfer.ComponentTransfer b, gsk.component_transfer.ComponentTransfer a) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_component_transfer_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, r ? cast(const(GskComponentTransfer)*)r._cPtr(No.Dup) : null, g ? cast(const(GskComponentTransfer)*)g._cPtr(No.Dup) : null, b ? cast(const(GskComponentTransfer)*)b._cPtr(No.Dup) : null, a ? cast(const(GskComponentTransfer)*)a._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
      Returns: the child [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_component_transfer_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the component transfer for one of the components.
  
      Params:
        component = the component to get the transfer for
      Returns: the [gsk.component_transfer.ComponentTransfer]
  */
  gsk.component_transfer.ComponentTransfer getTransfer(gdk.types.ColorChannel component) nothrow
  {
    const(GskComponentTransfer)* _cretval;
    _cretval = gsk_component_transfer_node_get_transfer(cast(const(GskRenderNode)*)this._cPtr, component);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
