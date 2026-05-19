/// Module for [ParamSpecUInt64] class
module gobject.param_spec_uint64;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.
*/
class ParamSpecUInt64 : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec_uint64.ParamSpecUInt64");

    super(cast(GParamSpec*)ptr, take);
  }
}
