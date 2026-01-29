/// Module for [DBusPropertyInfo] class
module gio.dbus_property_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about a D-Bus property on a D-Bus interface.
*/
class DBusPropertyInfo : gobject.boxed.Boxed
{

  /**
      Create a `dbus_property_info.DBusPropertyInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = The name of the D-Bus property, e.g. "SupportedFilesystems".
        signature = The D-Bus signature of the property (a single complete type).
        flags = Access control flags for the property.
  */
  this(int refCount = int.init, string name = string.init, string signature = string.init, gio.types.DBusPropertyInfoFlags flags = gio.types.DBusPropertyInfoFlags.init)
  {
    super(gMalloc(GDBusPropertyInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.name = name;
    this.signature = signature;
    this.flags = flags;
  }

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
    return cast(void function())g_dbus_property_info_get_type != &gidSymbolNotFound ? g_dbus_property_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusPropertyInfo self()
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount()
  {
    return (cast(GDBusPropertyInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval)
  {
    (cast(GDBusPropertyInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus property, e.g. "SupportedFilesystems".
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus property, e.g. "SupportedFilesystems".
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusPropertyInfo*)this._cPtr).name);
  }

  /**
      Get `signature` field.
      Returns: The D-Bus signature of the property (a single complete type).
  */
  @property string signature()
  {
    return cToD!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).signature);
  }

  /**
      Set `signature` field.
      Params:
        propval = The D-Bus signature of the property (a single complete type).
  */
  @property void signature(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).signature);
    dToC(propval, cast(void*)&(cast(GDBusPropertyInfo*)this._cPtr).signature);
  }

  /**
      Get `flags` field.
      Returns: Access control flags for the property.
  */
  @property gio.types.DBusPropertyInfoFlags flags()
  {
    return cast(gio.types.DBusPropertyInfoFlags)(cast(GDBusPropertyInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = Access control flags for the property.
  */
  @property void flags(gio.types.DBusPropertyInfoFlags propval)
  {
    (cast(GDBusPropertyInfo*)this._cPtr).flags = cast(GDBusPropertyInfoFlags)propval;
  }
}
