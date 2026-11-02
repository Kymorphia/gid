/// Module for [DBusPropertyInfo] class
module gio.dbus_property_info;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_annotation_info;
import gio.types;
import gobject.boxed;

/**
    Information about a D-Bus property on a D-Bus interface.
*/
class DBusPropertyInfo : gobject.boxed.BoxedWrap!(g_dbus_property_info_get_type)
{
  /**
      Create a `dbus_property_info.DBusPropertyInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = The name of the D-Bus property, e.g. "SupportedFilesystems".
        signature = The D-Bus signature of the property (a single complete type).
        flags = Access control flags for the property.
  */
  this(int refCount = int.init, string name = string.init, string signature = string.init, gio.types.DBusPropertyInfoFlags flags = gio.types.DBusPropertyInfoFlags.init) nothrow
  {
    super(boxedNew!GDBusPropertyInfo(_getGType), Yes.Take);
    this.refCount = refCount;
    this.name = name;
    this.signature = signature;
    this.flags = flags;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusPropertyInfo self() nothrow
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount() nothrow
  {
    return (cast(GDBusPropertyInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval) nothrow
  {
    (cast(GDBusPropertyInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus property, e.g. "SupportedFilesystems".
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus property, e.g. "SupportedFilesystems".
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).name);
    (cast(GDBusPropertyInfo*)this._cPtr).name = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `signature` field.
      Returns: The D-Bus signature of the property (a single complete type).
  */
  @property string signature() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).signature);
  }

  /**
      Set `signature` field.
      Params:
        propval = The D-Bus signature of the property (a single complete type).
  */
  @property void signature(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).signature);
    (cast(GDBusPropertyInfo*)this._cPtr).signature = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `flags` field.
      Returns: Access control flags for the property.
  */
  @property gio.types.DBusPropertyInfoFlags flags() nothrow
  {
    return cast(gio.types.DBusPropertyInfoFlags)(cast(GDBusPropertyInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = Access control flags for the property.
  */
  @property void flags(gio.types.DBusPropertyInfoFlags propval) nothrow
  {
    (cast(GDBusPropertyInfo*)this._cPtr).flags = cast(GDBusPropertyInfoFlags)propval;
  }

  /**
      Get `annotations` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  @property gio.dbus_annotation_info.DBusAnnotationInfo[] annotations() nothrow
  {
    uint len;
    if ((cast(GDBusPropertyInfo*)this._cPtr).annotations)
    {
      for (; (cast(GDBusPropertyInfo*)this._cPtr).annotations[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_annotation_info.DBusAnnotationInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_annotation_info.DBusAnnotationInfo(cast(void*)(cast(GDBusPropertyInfo*)this._cPtr).annotations[i], No.Take);
    return _retval;
  }
}
