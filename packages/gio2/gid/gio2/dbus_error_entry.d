/// Module for [DBusErrorEntry] class
module gid.gio2.dbus_error_entry;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;

/**
    Struct used in `func@Gio.DBusError.register_error_domain`.
*/
@gidGir("DBusErrorEntry")
class DBusErrorEntry : StructWrap!(GDBusErrorEntry)
{
  /**
      Create a `dbus_error_entry.DBusErrorEntry` wrap type.
      Params:
        errorCode = an error code
        dbusErrorName = the D-Bus error name to associate with @error_code
  */
  this(int errorCode = int.init, string dbusErrorName = string.init) nothrow
  {
    this.errorCode = errorCode;
    this.dbusErrorName = dbusErrorName;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `errorCode` field.
      Returns: an error code
  */
  @property int errorCode() nothrow
  {
    return (cast(GDBusErrorEntry*)this._cPtr).errorCode;
  }

  /**
      Set `errorCode` field.
      Params:
        propval = an error code
  */
  @property void errorCode(int propval) nothrow
  {
    (cast(GDBusErrorEntry*)this._cPtr).errorCode = propval;
  }

  private const(char)* _dbusErrorNameRef; // Keeps borrowed GC string alive

  /**
      Get `dbusErrorName` field.
      Returns: the D-Bus error name to associate with @error_code
  */
  @property string dbusErrorName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusErrorEntry*)this._cPtr).dbusErrorName);
  }

  /**
      Set `dbusErrorName` field.
      Params:
        propval = the D-Bus error name to associate with @error_code
  */
  @property void dbusErrorName(string propval) nothrow
  {
    if (_refuseBorrowedStore("dbusErrorName"))
      return;

    _dbusErrorNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GDBusErrorEntry*)this._cPtr).dbusErrorName = cast(const(char)*)_dbusErrorNameRef;
  }
}
