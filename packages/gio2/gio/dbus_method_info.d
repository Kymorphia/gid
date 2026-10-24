/// Module for [DBusMethodInfo] class
module gio.dbus_method_info;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_annotation_info;
import gio.dbus_arg_info;
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
    super(boxedNew!GDBusMethodInfo(_getGType), Yes.Take);
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

  /**
      Get `inArgs` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusArgInfo structures or null if there are no in arguments.
  */
  @property gio.dbus_arg_info.DBusArgInfo[] inArgs() nothrow
  {
    uint len;
    if ((cast(GDBusMethodInfo*)this._cPtr).inArgs)
    {
      for (; (cast(GDBusMethodInfo*)this._cPtr).inArgs[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_arg_info.DBusArgInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_arg_info.DBusArgInfo(cast(void*)(cast(GDBusMethodInfo*)this._cPtr).inArgs[i], No.Take);
    return _retval;
  }

  /**
      Get `outArgs` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusArgInfo structures or null if there are no out arguments.
  */
  @property gio.dbus_arg_info.DBusArgInfo[] outArgs() nothrow
  {
    uint len;
    if ((cast(GDBusMethodInfo*)this._cPtr).outArgs)
    {
      for (; (cast(GDBusMethodInfo*)this._cPtr).outArgs[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_arg_info.DBusArgInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_arg_info.DBusArgInfo(cast(void*)(cast(GDBusMethodInfo*)this._cPtr).outArgs[i], No.Take);
    return _retval;
  }

  /**
      Get `annotations` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  @property gio.dbus_annotation_info.DBusAnnotationInfo[] annotations() nothrow
  {
    uint len;
    if ((cast(GDBusMethodInfo*)this._cPtr).annotations)
    {
      for (; (cast(GDBusMethodInfo*)this._cPtr).annotations[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_annotation_info.DBusAnnotationInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_annotation_info.DBusAnnotationInfo(cast(void*)(cast(GDBusMethodInfo*)this._cPtr).annotations[i], No.Take);
    return _retval;
  }
}
