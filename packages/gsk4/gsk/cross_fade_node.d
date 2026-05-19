/// Module for [CrossFadeNode] class
module gsk.cross_fade_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node cross fading between two child nodes.
*/
class CrossFadeNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.cross_fade_node.CrossFadeNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will do a cross-fade between start and end.
  
      Params:
        start = The start node to be drawn
        end = The node to be cross_fadeed onto the start node
        progress = How far the fade has progressed from start to end. The value will
              be clamped to the range [0 ... 1]
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode start, gsk.render_node.RenderNode end, float progress)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cross_fade_node_new(start ? cast(GskRenderNode*)start._cPtr(No.Dup) : null, end ? cast(GskRenderNode*)end._cPtr(No.Dup) : null, progress);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the child [gsk.render_node.RenderNode] at the end of the cross-fade.
      Returns: a [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getEndChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cross_fade_node_get_end_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the progress value of the cross fade.
      Returns: the progress value, between 0 and 1
  */
  float getProgress()
  {
    float _retval;
    _retval = gsk_cross_fade_node_get_progress(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the child [gsk.render_node.RenderNode] at the beginning of the cross-fade.
      Returns: a [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getStartChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cross_fade_node_get_start_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
