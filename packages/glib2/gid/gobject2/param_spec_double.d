/// Module for [ParamSpecDouble] class
module gid.gobject2.param_spec_double;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.param_spec;
import gid.gobject2.types;

/**
    A #GParamSpec derived structure that contains the meta data for double properties.
*/
@gidGir("ParamSpecDouble")
class ParamSpecDouble : gid.gobject2.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }
}
