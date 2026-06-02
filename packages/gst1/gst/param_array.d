/// Module for [ParamArray] class
module gst.param_array;

public import gid.basictypes;
import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A fundamental type that describes a #GParamSpec for arrays of
    values
*/
class ParamArray : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GParamSpec*)ptr, take);
  }
}
