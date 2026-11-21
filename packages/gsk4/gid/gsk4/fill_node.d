/// Module for [FillNode] class
module gid.gsk4.fill_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.path;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node filling the area given by [gid.gsk4.path.Path]
    and [gid.gsk4.types.FillRule] with the child node.
*/
class FillNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_fill_node_get_type != &gidSymbolNotFound ? gsk_fill_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will fill the child in the area
      given by path and fill_rule.
  
      Params:
        child = The node to fill the area with
        path = The path describing the area to fill
        fillRule = The fill rule to use
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.gsk4.path.Path path, gid.gsk4.types.FillRule fillRule) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_fill_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, path ? cast(GskPath*)path._cPtr(No.Dup) : null, fillRule);
    this(_cretval, No.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
      Returns: The child that is getting drawn
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_fill_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the fill rule used to determine how the path is filled.
      Returns: a [gid.gsk4.types.FillRule]
  */
  gid.gsk4.types.FillRule getFillRule() nothrow
  {
    GskFillRule _cretval;
    _cretval = gsk_fill_node_get_fill_rule(cast(const(GskRenderNode)*)this._cPtr);
    gid.gsk4.types.FillRule _retval = cast(gid.gsk4.types.FillRule)_cretval;
    return _retval;
  }

  /**
      Retrieves the path used to describe the area filled with the contents of
      the node.
      Returns: a [gid.gsk4.path.Path]
  */
  gid.gsk4.path.Path getPath() nothrow
  {
    GskPath* _cretval;
    _cretval = gsk_fill_node_get_path(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.path.Path(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
