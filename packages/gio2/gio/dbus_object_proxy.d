/// Module for [DBusObjectProxy] class
module gio.dbus_object_proxy;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.dbus_object;
import gio.dbus_object_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    A [gio.dbus_object_proxy.DBusObjectProxy] is an object used to represent a remote object
    with one or more D-Bus interfaces. Normally, you don’t instantiate
    a [gio.dbus_object_proxy.DBusObjectProxy] yourself — typically [gio.dbus_object_manager_client.DBusObjectManagerClient]
    is used to obtain it.
*/
class DBusObjectProxy : gobject.object.ObjectWrap, gio.dbus_object.DBusObject
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_proxy_get_type != &gidSymbolNotFound ? g_dbus_object_proxy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectProxy self()
  {
    return this;
  }

  /**
  Get builder for [gio.dbus_object_proxy.DBusObjectProxy]
  Returns: New builder object
  */
  static DBusObjectProxyGidBuilder builder()
  {
    return new DBusObjectProxyGidBuilder;
  }

  /**
      Get `gConnection` property.
      Returns: The connection of the proxy.
  */
  @property gio.dbus_connection.DBusConnection gConnection()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.dbus_connection.DBusConnection)("g-connection");
  }

  /**
      Get `gObjectPath` property.
      Returns: The object path of the proxy.
  */
  @property string gObjectPath()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("g-object-path");
  }

  mixin DBusObjectT!();

  /**
      Creates a new #GDBusObjectProxy for the given connection and
      object path.
  
      Params:
        connection = a #GDBusConnection
        objectPath = the object path
      Returns: a new #GDBusObjectProxy
  */
  this(gio.dbus_connection.DBusConnection connection, string objectPath)
  {
    GDBusObjectProxy* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_object_proxy_new(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _objectPath);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the connection that proxy is for.
      Returns: A #GDBusConnection. Do not free, the
          object is owned by proxy.
  */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_proxy_get_connection(cast(GDBusObjectProxy*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }
}

class DBusObjectProxyGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.dbus_object.DBusObjectGidBuilderImpl!T
{

  mixin DBusObjectGidBuilderT!();

  /**
      Set `gConnection` property.
      Params:
        propval = The connection of the proxy.
      Returns: Builder instance for fluent chaining
  */
  T gConnection(gio.dbus_connection.DBusConnection propval)
  {
    return setProperty("g-connection", propval);
  }

  /**
      Set `gObjectPath` property.
      Params:
        propval = The object path of the proxy.
      Returns: Builder instance for fluent chaining
  */
  T gObjectPath(string propval)
  {
    return setProperty("g-object-path", propval);
  }
}

/// Fluent builder for [gio.dbus_object_proxy.DBusObjectProxy]
final class DBusObjectProxyGidBuilder : DBusObjectProxyGidBuilderImpl!DBusObjectProxyGidBuilder
{
  DBusObjectProxy build()
  {
    return new DBusObjectProxy(cast(void*)createGObject(DBusObjectProxy._getGType), Yes.Take);
  }
}
