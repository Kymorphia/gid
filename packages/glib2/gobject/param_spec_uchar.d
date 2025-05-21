/// Module for [ParamSpecUChar] class
module gobject.param_spec_uchar;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for unsigned character properties.
*/
class ParamSpecUChar : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec_uchar.ParamSpecUChar");

    super(cast(GParamSpec*)ptr, take);
  }
}
