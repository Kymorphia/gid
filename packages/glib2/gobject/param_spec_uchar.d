module gobject.param_spec_uchar;

import gid.global;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for unsigned character properties.
 */
class ParamSpecUChar : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecUChar");

    super(cast(GParamSpec*)ptr, take);
  }
}
