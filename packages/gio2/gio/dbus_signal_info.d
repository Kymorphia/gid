/// Module for [DBusSignalInfo] class
module gio.dbus_signal_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about a signal on a D-Bus interface.
*/
class DBusSignalInfo : gobject.boxed.Boxed
{

  /**
      Create a `dbus_signal_info.DBusSignalInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = The name of the D-Bus signal, e.g. "NameOwnerChanged".
  */
  this(int refCount = int.init, string name = string.init)
  {
    super(gMalloc(GDBusSignalInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.name = name;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_signal_info_get_type != &gidSymbolNotFound ? g_dbus_signal_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusSignalInfo self()
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount()
  {
    return (cast(GDBusSignalInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval)
  {
    (cast(GDBusSignalInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus signal, e.g. "NameOwnerChanged".
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GDBusSignalInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus signal, e.g. "NameOwnerChanged".
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusSignalInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusSignalInfo*)this._cPtr).name);
  }
}
