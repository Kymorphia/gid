/// Module for [DBusArgInfo] class
module gio.dbus_arg_info;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_annotation_info;
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
  this(int refCount = int.init, string name = string.init, string signature = string.init) nothrow
  {
    super(gMalloc(GDBusArgInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.name = name;
    this.signature = signature;
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
    return cast(void function())g_dbus_arg_info_get_type != &gidSymbolNotFound ? g_dbus_arg_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusArgInfo self() nothrow
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount() nothrow
  {
    return (cast(GDBusArgInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval) nothrow
  {
    (cast(GDBusArgInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: Name of the argument, e.g. @unix_user_id.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = Name of the argument, e.g. @unix_user_id.
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusArgInfo*)this._cPtr).name);
  }

  /**
      Get `signature` field.
      Returns: D-Bus signature of the argument (a single complete type).
  */
  @property string signature() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).signature);
  }

  /**
      Set `signature` field.
      Params:
        propval = D-Bus signature of the argument (a single complete type).
  */
  @property void signature(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusArgInfo*)this._cPtr).signature);
    dToC(propval, cast(void*)&(cast(GDBusArgInfo*)this._cPtr).signature);
  }

  /**
      Get `annotations` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  @property gio.dbus_annotation_info.DBusAnnotationInfo[] annotations() nothrow
  {
    uint len;
    if ((cast(GDBusArgInfo*)this._cPtr).annotations)
    {
      for (; (cast(GDBusArgInfo*)this._cPtr).annotations[len] !is null; len++)
      {
      }
    }

    auto _retval = new gio.dbus_annotation_info.DBusAnnotationInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gio.dbus_annotation_info.DBusAnnotationInfo(cast(void*)(cast(GDBusArgInfo*)this._cPtr).annotations[i], No.Take);
    return _retval;
  }
}
