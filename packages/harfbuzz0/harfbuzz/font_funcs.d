/// Module for [FontFuncs] class
module harfbuzz.font_funcs;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type containing a set of virtual methods used for
    working on #hb_font_t font objects.
    
    HarfBuzz provides a lightweight default function for each of
    the methods in #hb_font_funcs_t. Client programs can implement
    their own replacements for the individual font functions, as
    needed, and replace the default by calling the setter for a
    method.
*/
class FontFuncs : gobject.boxed.BoxedWrap!(hb_gobject_font_funcs_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override FontFuncs self() nothrow
  {
    return this;
  }
}
