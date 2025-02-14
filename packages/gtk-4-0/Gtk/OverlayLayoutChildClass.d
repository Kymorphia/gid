module Gtk.OverlayLayoutChildClass;

import Gid.gid;
import Gtk.LayoutChildClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class OverlayLayoutChildClass
{
  GtkOverlayLayoutChildClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.OverlayLayoutChildClass");

    cInstance = *cast(GtkOverlayLayoutChildClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property LayoutChildClass parentClass()
  {
    return new LayoutChildClass(cast(GtkLayoutChildClass*)&(cast(GtkOverlayLayoutChildClass*)cPtr).parentClass);
  }
}
