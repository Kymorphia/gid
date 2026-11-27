/// Module for [ParamSpecChar] class
module gid.gobject2.param_spec_char;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.param_spec;
import gid.gobject2.types;

/**
    A #GParamSpec derived structure that contains the meta data for character properties.
*/
@gidGir("ParamSpecChar")
class ParamSpecChar : gid.gobject2.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }
}
