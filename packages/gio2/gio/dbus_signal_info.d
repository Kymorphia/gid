/// Module for [DBusSignalInfo] class
module gio.dbus_signal_info;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_annotation_info;
import gio.dbus_arg_info;
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
  this(int refCount = int.init, string name = string.init) nothrow
  {
    super(gMalloc(GDBusSignalInfo.sizeof), Yes.Take);
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
    return cast(void function())g_dbus_signal_info_get_type != &gidSymbolNotFound ? g_dbus_signal_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusSignalInfo self() nothrow
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount() nothrow
  {
    return (cast(GDBusSignalInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval) nothrow
  {
    (cast(GDBusSignalInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus signal, e.g. "NameOwnerChanged".
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusSignalInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus signal, e.g. "NameOwnerChanged".
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusSignalInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusSignalInfo*)this._cPtr).name);
  }

  /**
      Get `args` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusArgInfo structures or null if there are no arguments.
  */
  @property gio.dbus_arg_info.DBusArgInfo[] args() nothrow
  {
    uint len;
    if ((cast(GDBusSignalInfo*)this._cPtr).args)
    {
      for (; (cast(GDBusSignalInfo*)this._cPtr).args[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_arg_info.DBusArgInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_arg_info.DBusArgInfo(cast(void*)(cast(GDBusSignalInfo*)this._cPtr).args[i], No.Take);
    return _retval;
  }

  /**
      Get `annotations` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  @property gio.dbus_annotation_info.DBusAnnotationInfo[] annotations() nothrow
  {
    uint len;
    if ((cast(GDBusSignalInfo*)this._cPtr).annotations)
    {
      for (; (cast(GDBusSignalInfo*)this._cPtr).annotations[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_annotation_info.DBusAnnotationInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_annotation_info.DBusAnnotationInfo(cast(void*)(cast(GDBusSignalInfo*)this._cPtr).annotations[i], No.Take);
    return _retval;
  }
}
