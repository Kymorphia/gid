/// Module for [ParamSpecVariant] class
module gid.gobject2.param_spec_variant;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.param_spec;
import gid.gobject2.types;

/**
    A #GParamSpec derived structure that contains the meta data for #GVariant properties.
    
    When comparing values with [gid.gobject2.global.paramValuesCmp], scalar values with the same
    type will be compared with [gid.glib2.variant.Variant.compare]. Other non-null variants will
    be checked for equality with [gid.glib2.variant.Variant.equal], and their sort order is
    otherwise undefined. null is ordered before non-null variants. Two null
    values compare equal.
*/
@gidGir("ParamSpecVariant")
class ParamSpecVariant : gid.gobject2.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }
}
