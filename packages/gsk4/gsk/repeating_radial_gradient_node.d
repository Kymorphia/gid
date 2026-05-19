/// Module for [RepeatingRadialGradientNode] class
module gsk.repeating_radial_gradient_node;

public import gid.basictypes;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a repeating radial gradient.
*/
class RepeatingRadialGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.repeating_radial_gradient_node.RepeatingRadialGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }
}
