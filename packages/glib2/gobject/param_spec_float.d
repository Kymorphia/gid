/// Module for [ParamSpecFloat] class
module gobject.param_spec_float;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for float properties.
*/
class ParamSpecFloat : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecFloat");

    super(cast(GParamSpec*)ptr, take);
  }
}
