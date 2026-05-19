/// Module for [ParamFraction] class
module gst.param_fraction;

public import gid.basictypes;
import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A fundamental type that describes a #GParamSpec for fractional
    properties
*/
class ParamFraction : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.param_fraction.ParamFraction");

    super(cast(GParamSpec*)ptr, take);
  }
}
