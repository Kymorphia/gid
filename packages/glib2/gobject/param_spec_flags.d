/// Module for [ParamSpecFlags] class
module gobject.param_spec_flags;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for flags
    properties.
*/
class ParamSpecFlags : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec_flags.ParamSpecFlags");

    super(cast(GParamSpec*)ptr, take);
  }
}
