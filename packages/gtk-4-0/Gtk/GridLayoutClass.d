module Gtk.GridLayoutClass;

import Gid.gid;
import Gtk.LayoutManagerClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class GridLayoutClass
{
  GtkGridLayoutClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.GridLayoutClass");

    cInstance = *cast(GtkGridLayoutClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property LayoutManagerClass parentClass()
  {
    return new LayoutManagerClass(cast(GtkLayoutManagerClass*)&(cast(GtkGridLayoutClass*)cPtr).parentClass);
  }
}
