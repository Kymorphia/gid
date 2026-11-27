/// Module for [ParamSpecOverride] class
module gid.gobject2.param_spec_override;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.param_spec;
import gid.gobject2.types;

/**
    A #GParamSpec derived structure that redirects operations to
    other types of #GParamSpec.
    
    All operations other than getting or setting the value are redirected,
    including accessing the nick and blurb, validating a value, and so
    forth.
    
    See [gid.gobject2.param_spec.ParamSpec.getRedirectTarget] for retrieving the overridden
    property. #GParamSpecOverride is used in implementing
    [gid.gobject2.object_class.ObjectClass.overrideProperty], and will not be directly useful
    unless you are implementing a new base type similar to GObject.
*/
@gidGir("ParamSpecOverride")
class ParamSpecOverride : gid.gobject2.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }
}
