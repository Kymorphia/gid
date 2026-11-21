/// Module for [ComponentTransferNode] class
module gid.gsk4.component_transfer_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.types;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.component_transfer;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node for applying a [gid.gsk4.component_transfer.ComponentTransfer] for each color
    component of the child node.
*/
class ComponentTransferNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_component_transfer_node_get_type != &gidSymbolNotFound ? gsk_component_transfer_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.gsk4.component_transfer.ComponentTransfer r, gid.gsk4.component_transfer.ComponentTransfer g, gid.gsk4.component_transfer.ComponentTransfer b, gid.gsk4.component_transfer.ComponentTransfer a) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_component_transfer_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, r ? cast(const(GskComponentTransfer)*)r._cPtr(No.Dup) : null, g ? cast(const(GskComponentTransfer)*)g._cPtr(No.Dup) : null, b ? cast(const(GskComponentTransfer)*)b._cPtr(No.Dup) : null, a ? cast(const(GskComponentTransfer)*)a._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
      Returns: the child [gid.gsk4.render_node.RenderNode]
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_component_transfer_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the component transfer for one of the components.
  
      Params:
        component = the component to get the transfer for
      Returns: the [gid.gsk4.component_transfer.ComponentTransfer]
  */
  gid.gsk4.component_transfer.ComponentTransfer getTransfer(gid.gdk4.types.ColorChannel component) nothrow
  {
    const(GskComponentTransfer)* _cretval;
    _cretval = gsk_component_transfer_node_get_transfer(cast(const(GskRenderNode)*)this._cPtr, component);
    auto _retval = _cretval ? new gid.gsk4.component_transfer.ComponentTransfer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
