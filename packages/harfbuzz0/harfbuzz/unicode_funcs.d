/// Module for [UnicodeFuncs] class
module harfbuzz.unicode_funcs;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type containing a set of virtual methods used for
    accessing various Unicode character properties.
    
    HarfBuzz provides a default function for each of the
    methods in #hb_unicode_funcs_t. Client programs can implement
    their own replacements for the individual Unicode functions, as
    needed, and replace the default by calling the setter for a
    method.
*/
class UnicodeFuncs : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_unicode_funcs_get_type != &gidSymbolNotFound ? hb_gobject_unicode_funcs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnicodeFuncs self()
  {
    return this;
  }
}
