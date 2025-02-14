module Gtk.OrientableIface;

import GObject.TypeInterface;
import Gid.gid;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class OrientableIface
{
  GtkOrientableIface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.OrientableIface");

    cInstance = *cast(GtkOrientableIface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface baseIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkOrientableIface*)cPtr).baseIface);
  }
}
