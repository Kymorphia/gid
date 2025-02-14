module Gtk.BoolFilterClass;

import Gid.gid;
import Gtk.FilterClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class BoolFilterClass
{
  GtkBoolFilterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.BoolFilterClass");

    cInstance = *cast(GtkBoolFilterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FilterClass parentClass()
  {
    return new FilterClass(cast(GtkFilterClass*)&(cast(GtkBoolFilterClass*)cPtr).parentClass);
  }
}
