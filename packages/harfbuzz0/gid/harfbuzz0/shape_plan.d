/// Module for [ShapePlan] class
module gid.harfbuzz0.shape_plan;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for holding a shaping plan.
    
    Shape plans contain information about how HarfBuzz will shape a
    particular text segment, based on the segment's properties and the
    capabilities in the font face in use.
    
    Shape plans can be queried about how shaping will perform, given a set
    of specific input parameters (script, language, direction, features,
    etc.).
*/
class ShapePlan : gid.gobject2.boxed.BoxedWrap!(hb_gobject_shape_plan_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ShapePlan self() nothrow
  {
    return this;
  }
}
