/// Module for [FillNode] class
module gsk.fill_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.path;
import gsk.render_node;
import gsk.types;

/**
    A render node filling the area given by [gsk.path.Path]
    and [gsk.types.FillRule] with the child node.
*/
class FillNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will fill the child in the area
      given by path and fill_rule.
  
      Params:
        child = The node to fill the area with
        path = The path describing the area to fill
        fillRule = The fill rule to use
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, gsk.path.Path path, gsk.types.FillRule fillRule) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_fill_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, path ? cast(GskPath*)path._cPtr(No.Dup) : null, fillRule);
    this(_cretval, No.Take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
      Returns: The child that is getting drawn
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_fill_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the fill rule used to determine how the path is filled.
      Returns: a [gsk.types.FillRule]
  */
  gsk.types.FillRule getFillRule() nothrow
  {
    GskFillRule _cretval;
    _cretval = gsk_fill_node_get_fill_rule(cast(const(GskRenderNode)*)this._cPtr);
    gsk.types.FillRule _retval = cast(gsk.types.FillRule)_cretval;
    return _retval;
  }

  /**
      Retrieves the path used to describe the area filled with the contents of
      the node.
      Returns: a [gsk.path.Path]
  */
  gsk.path.Path getPath() nothrow
  {
    GskPath* _cretval;
    _cretval = gsk_fill_node_get_path(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.path.Path(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
