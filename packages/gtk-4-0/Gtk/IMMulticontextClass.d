module Gtk.IMMulticontextClass;

import Gid.gid;
import Gtk.IMContextClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class IMMulticontextClass
{
  GtkIMMulticontextClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.IMMulticontextClass");

    cInstance = *cast(GtkIMMulticontextClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IMContextClass parentClass()
  {
    return new IMContextClass(cast(GtkIMContextClass*)&(cast(GtkIMMulticontextClass*)cPtr).parentClass);
  }
}
