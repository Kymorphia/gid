/// Module for [DBusErrorEntry] class
module gio.dbus_error_entry;

public import gid.basictypes;
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

  /**
      Create a `dbus_error_entry.DBusErrorEntry` wrap type.
      Params:
        errorCode = An error code.
        dbusErrorName = The D-Bus error name to associate with @error_code.
  */
  this(int errorCode = int.init, string dbusErrorName = string.init) nothrow
  {
    this.errorCode = errorCode;
    this.dbusErrorName = dbusErrorName;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GDBusErrorEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `errorCode` field.
      Returns: An error code.
  */
  @property int errorCode() nothrow
  {
    return (cast(GDBusErrorEntry*)this._cPtr).errorCode;
  }

  /**
      Set `errorCode` field.
      Params:
        propval = An error code.
  */
  @property void errorCode(int propval) nothrow
  {
    (cast(GDBusErrorEntry*)this._cPtr).errorCode = propval;
  }

  /**
      Get `dbusErrorName` field.
      Returns: The D-Bus error name to associate with @error_code.
  */
  @property string dbusErrorName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
  }

  /**
      Set `dbusErrorName` field.
      Params:
        propval = The D-Bus error name to associate with @error_code.
  */
  @property void dbusErrorName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
    dToC(propval, cast(void*)&(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
  }
}
