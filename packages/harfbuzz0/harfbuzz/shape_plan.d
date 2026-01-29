/// Module for [ShapePlan] class
module harfbuzz.shape_plan;

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
class ShapePlan : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_shape_plan_get_type != &gidSymbolNotFound ? hb_gobject_shape_plan_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShapePlan self()
  {
    return this;
  }
}
