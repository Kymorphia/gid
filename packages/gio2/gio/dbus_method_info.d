/// Module for [DBusMethodInfo] class
module gio.dbus_method_info;

public import gid.basictypes;
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

  /**
      Create a `dbus_method_info.DBusMethodInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = The name of the D-Bus method, e.g. @RequestName.
  */
  this(int refCount = int.init, string name = string.init) nothrow
  {
    super(gMalloc(GDBusMethodInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.name = name;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_method_info_get_type != &gidSymbolNotFound ? g_dbus_method_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusMethodInfo self() nothrow
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount() nothrow
  {
    return (cast(GDBusMethodInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval) nothrow
  {
    (cast(GDBusMethodInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus method, e.g. @RequestName.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusMethodInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus method, e.g. @RequestName.
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusMethodInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusMethodInfo*)this._cPtr).name);
  }
}
