/// Module for [DBusErrorEntry] class
module gio.dbus_error_entry;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    Struct used in [gio.global.dbusErrorRegisterErrorDomain].
*/
class DBusErrorEntry
{
  GDBusErrorEntry _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gio.dbus_error_entry.DBusErrorEntry");

    _cInstance = *cast(GDBusErrorEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `errorCode` field.
      Returns: An error code.
  */
  @property int errorCode()
  {
    return (cast(GDBusErrorEntry*)this._cPtr).errorCode;
  }

  /**
      Set `errorCode` field.
      Params:
        propval = An error code.
  */
  @property void errorCode(int propval)
  {
    (cast(GDBusErrorEntry*)this._cPtr).errorCode = propval;
  }

  /**
      Get `dbusErrorName` field.
      Returns: The D-Bus error name to associate with @error_code.
  */
  @property string dbusErrorName()
  {
    return cToD!(string)(cast(void*)(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
  }

  /**
      Set `dbusErrorName` field.
      Params:
        propval = The D-Bus error name to associate with @error_code.
  */
  @property void dbusErrorName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
    dToC(propval, cast(void*)&(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
  }
}
