/// Module for [ShapePlan] class
module harfbuzz.shape_plan;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding a shaping plan.
    
    Shape plans contain information about how HarfBuzz will shape a
    particular text segment, based on the segment's properties and the
    capabilities in the font face in use.
    
    Shape plans can be queried about how shaping will perform, given a set
    of specific input parameters (script, language, direction, features,
    etc.).
*/
class ShapePlan : gobject.boxed.BoxedWrap!(hb_gobject_shape_plan_get_type)
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
