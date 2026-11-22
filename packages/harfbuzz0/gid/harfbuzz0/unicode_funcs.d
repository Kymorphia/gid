/// Module for [UnicodeFuncs] class
module gid.harfbuzz0.unicode_funcs;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type containing a set of virtual methods used for
    accessing various Unicode character properties.
    
    HarfBuzz provides a default function for each of the
    methods in #hb_unicode_funcs_t. Client programs can implement
    their own replacements for the individual Unicode functions, as
    needed, and replace the default by calling the setter for a
    method.
*/
class UnicodeFuncs : gid.gobject2.boxed.BoxedWrap!(hb_gobject_unicode_funcs_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override UnicodeFuncs self() nothrow
  {
    return this;
  }
}
