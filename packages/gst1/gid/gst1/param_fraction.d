/// Module for [ParamFraction] class
module gid.gst1.param_fraction;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.param_spec;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    A fundamental type that describes a #GParamSpec for fractional
    properties
*/
class ParamFraction : gid.gobject2.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_param_spec_fraction_get_type != &gidSymbolNotFound ? gst_param_spec_fraction_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }
}
