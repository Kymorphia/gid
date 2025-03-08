module harfbuzz.set;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding a set of integers. #hb_set_t's are
  used to gather and contain glyph IDs, Unicode code
  points, and various other collections of discrete
  values.
*/
class Set : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_set_get_type != &gidSymbolNotFound ? hb_gobject_set_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
