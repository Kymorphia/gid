/// Module for [ParamSpecVariant] class
module gobject.param_spec_variant;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for #GVariant properties.
    
    When comparing values with [gobject.global.paramValuesCmp], scalar values with the same
    type will be compared with [glib.variant.Variant.compare]. Other non-null variants will
    be checked for equality with [glib.variant.Variant.equal], and their sort order is
    otherwise undefined. null is ordered before non-null variants. Two null
    values compare equal.
*/
class ParamSpecVariant : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GParamSpec*)ptr, take);
  }
}
