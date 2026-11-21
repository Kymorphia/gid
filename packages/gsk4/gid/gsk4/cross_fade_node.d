/// Module for [CrossFadeNode] class
module gid.gsk4.cross_fade_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node cross fading between two child nodes.
*/
class CrossFadeNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_cross_fade_node_get_type != &gidSymbolNotFound ? gsk_cross_fade_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will do a cross-fade between start and end.
  
      Params:
        start = The start node to be drawn
        end = The node to be cross_fadeed onto the start node
        progress = How far the fade has progressed from start to end. The value will
              be clamped to the range [0 ... 1]
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode start, gid.gsk4.render_node.RenderNode end, float progress) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cross_fade_node_new(start ? cast(GskRenderNode*)start._cPtr(No.Dup) : null, end ? cast(GskRenderNode*)end._cPtr(No.Dup) : null, progress);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child [gid.gsk4.render_node.RenderNode] at the end of the cross-fade.
      Returns: a [gid.gsk4.render_node.RenderNode]
  */
  gid.gsk4.render_node.RenderNode getEndChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cross_fade_node_get_end_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the progress value of the cross fade.
      Returns: the progress value, between 0 and 1
  */
  float getProgress() nothrow
  {
    float _retval;
    _retval = gsk_cross_fade_node_get_progress(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the child [gid.gsk4.render_node.RenderNode] at the beginning of the cross-fade.
      Returns: a [gid.gsk4.render_node.RenderNode]
  */
  gid.gsk4.render_node.RenderNode getStartChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cross_fade_node_get_start_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
