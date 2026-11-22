/// Module for [DBusObjectProxy] class
module gid.gio2.dbus_object_proxy;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_connection;
import gid.gio2.dbus_object;
import gid.gio2.dbus_object_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.dbus_object_proxy.DBusObjectProxy] is an object used to represent a remote object
    with one or more D-Bus interfaces. Normally, you don’t instantiate
    a [gid.gio2.dbus_object_proxy.DBusObjectProxy] yourself — typically [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient]
    is used to obtain it.
*/
class DBusObjectProxy : gid.gobject2.object.ObjectWrap, gid.gio2.dbus_object.DBusObject
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
    return cast(void function())g_dbus_object_proxy_get_type != &gidSymbolNotFound ? g_dbus_object_proxy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusObjectProxy";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectProxy self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_object_proxy.DBusObjectProxy]
      Returns: New builder object
  */
  static DBusObjectProxyGidBuilder builder() nothrow
  {
    return new DBusObjectProxyGidBuilder;
  }

  /**
      Get `gConnection` property.
      Returns: The connection of the proxy.
  */
  @property gid.gio2.dbus_connection.DBusConnection gConnection() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.dbus_connection.DBusConnection)("g-connection");
  }

  /**
      Get `gObjectPath` property.
      Returns: The object path of the proxy.
  */
  @property string gObjectPath() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("g-object-path");
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
  this(gid.gio2.dbus_connection.DBusConnection connection, string objectPath) nothrow
  {
    GDBusObjectProxy* _cretval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_object_proxy_new(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _objectPath);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the connection that proxy is for.
      Returns: A #GDBusConnection. Do not free, the
          object is owned by proxy.
  */
  gid.gio2.dbus_connection.DBusConnection getConnection() nothrow
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_proxy_get_connection(cast(GDBusObjectProxy*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_object_proxy.DBusObjectProxy]
class DBusObjectProxyGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.dbus_object.DBusObjectGidBuilderImpl!T
{

  mixin DBusObjectGidBuilderT!();

  /**
      Set `gConnection` property.
      Params:
        propval = The connection of the proxy.
      Returns: Builder instance for fluent chaining
  */
  T gConnection(gid.gio2.dbus_connection.DBusConnection propval) nothrow
  {
    return setProperty("g-connection", propval);
  }

  /**
      Set `gObjectPath` property.
      Params:
        propval = The object path of the proxy.
      Returns: Builder instance for fluent chaining
  */
  T gObjectPath(string propval) nothrow
  {
    return setProperty("g-object-path", propval);
  }
}

/// Fluent builder for [gid.gio2.dbus_object_proxy.DBusObjectProxy]
final class DBusObjectProxyGidBuilder : DBusObjectProxyGidBuilderImpl!DBusObjectProxyGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusObjectProxy build() nothrow
  {
    return new DBusObjectProxy(cast(void*)createGObject(DBusObjectProxy._getGType), Yes.Take);
  }
}
