/// Module for [ParamSpecInt64] class
module gobject.param_spec_int64;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for 64bit integer properties.
*/
class ParamSpecInt64 : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec_int64.ParamSpecInt64");

    super(cast(GParamSpec*)ptr, take);
  }
}
