module gio.dbus_method_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about a method on an D-Bus interface.
*/
class DBusMethodInfo : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GDBusMethodInfo.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_method_info_get_type != &gidSymbolNotFound ? g_dbus_method_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property int refCount()
  {
    return (cast(GDBusMethodInfo*)cPtr).refCount;
  }

  @property void refCount(int propval)
  {
    (cast(GDBusMethodInfo*)cPtr).refCount = propval;
  }

  @property string name()
  {
    return (cast(GDBusMethodInfo*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusMethodInfo*)cPtr).name);
    (cast(GDBusMethodInfo*)cPtr).name = propval.toCString(Yes.Alloc);
  }
}
