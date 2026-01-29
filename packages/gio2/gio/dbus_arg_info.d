/// Module for [DBusArgInfo] class
module gio.dbus_arg_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about an argument for a method or a signal.
*/
class DBusArgInfo : gobject.boxed.Boxed
{

  /**
      Create a `dbus_arg_info.DBusArgInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = Name of the argument, e.g. @unix_user_id.
        signature = D-Bus signature of the argument (a single complete type).
  */
  this(int refCount = int.init, string name = string.init, string signature = string.init)
  {
    super(gMalloc(GDBusArgInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.name = name;
    this.signature = signature;
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
    return cast(void function())g_dbus_arg_info_get_type != &gidSymbolNotFound ? g_dbus_arg_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusArgInfo self()
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount()
  {
    return (cast(GDBusArgInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval)
  {
    (cast(GDBusArgInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: Name of the argument, e.g. @unix_user_id.
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = Name of the argument, e.g. @unix_user_id.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusArgInfo*)this._cPtr).name);
  }

  /**
      Get `signature` field.
      Returns: D-Bus signature of the argument (a single complete type).
  */
  @property string signature()
  {
    return cToD!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).signature);
  }

  /**
      Set `signature` field.
      Params:
        propval = D-Bus signature of the argument (a single complete type).
  */
  @property void signature(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).signature);
    dToC(propval, cast(void*)&(cast(GDBusArgInfo*)this._cPtr).signature);
  }
}
