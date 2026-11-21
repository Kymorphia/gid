/// Module for [DBusMenuModel] class
module gid.gio2.dbus_menu_model;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_connection;
import gid.gio2.menu_model;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.dbus_menu_model.DBusMenuModel] is an implementation of [gid.gio2.menu_model.MenuModel] that can be
    used as a proxy for a menu model that is exported over D-Bus with
    [gid.gio2.dbus_connection.DBusConnection.exportMenuModel].
*/
class DBusMenuModel : gid.gio2.menu_model.MenuModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_menu_model_get_type != &gidSymbolNotFound ? g_dbus_menu_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusMenuModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusMenuModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_menu_model.DBusMenuModel]
      Returns: New builder object
  */
  static DBusMenuModelGidBuilder builder() nothrow
  {
    return new DBusMenuModelGidBuilder;
  }

  /**
      Obtains a #GDBusMenuModel for the menu model which is exported
      at the given bus_name and object_path.
      
      The thread default main context is taken at the time of this call.
      All signals on the menu model (and any linked models) are reported
      with respect to this context.  All calls on the returned menu model
      (and linked models) must also originate from this same context, with
      the thread default main context unchanged.
  
      Params:
        connection = a #GDBusConnection
        busName = the bus name which exports the menu model
              or null if connection is not a message bus connection
        objectPath = the object path at which the menu model is exported
      Returns: a #GDBusMenuModel object. Free with
            [gid.gobject2.object.ObjectWrap.unref].
  */
  static gid.gio2.dbus_menu_model.DBusMenuModel get(gid.gio2.dbus_connection.DBusConnection connection, string busName, string objectPath) nothrow
  {
    GDBusMenuModel* _cretval;
    const(char)* _busName = busName.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_menu_model_get(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _busName, _objectPath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_menu_model.DBusMenuModel)(cast(GDBusMenuModel*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_menu_model.DBusMenuModel]
class DBusMenuModelGidBuilderImpl(T) : gid.gio2.menu_model.MenuModelGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.dbus_menu_model.DBusMenuModel]
final class DBusMenuModelGidBuilder : DBusMenuModelGidBuilderImpl!DBusMenuModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusMenuModel build() nothrow
  {
    return new DBusMenuModel(cast(void*)createGObject(DBusMenuModel._getGType), Yes.Take);
  }
}
