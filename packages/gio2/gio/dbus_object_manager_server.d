/// Module for [DBusObjectManagerServer] class
module gio.dbus_object_manager_server;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.dbus_object_manager;
import gio.dbus_object_manager_mixin;
import gio.dbus_object_skeleton;
import gio.types;
import gobject.object;

/**
    [gio.dbus_object_manager_server.DBusObjectManagerServer] is used to export [gio.dbus_object.DBusObject] instances
    using the standardized
    [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface. For example, remote D-Bus clients can get all objects
    and properties in a single call. Additionally, any change in the
    object hierarchy is broadcast using signals. This means that D-Bus
    clients can keep caches up to date by only listening to D-Bus
    signals.
    
    The recommended path to export an object manager at is the path form of the
    well-known name of a D-Bus service, or below. For example, if a D-Bus service
    is available at the well-known name `net.example.ExampleService1`, the object
    manager should typically be exported at `/net/example/ExampleService1`, or
    below (to allow for multiple object managers in a service).
    
    It is supported, but not recommended, to export an object manager at the root
    path, `/`.
    
    See [gio.dbus_object_manager_client.DBusObjectManagerClient] for the client-side code that is
    intended to be used with [gio.dbus_object_manager_server.DBusObjectManagerServer] or any D-Bus
    object implementing the `org.freedesktop.DBus.ObjectManager` interface.
*/
class DBusObjectManagerServer : gobject.object.ObjectWrap, gio.dbus_object_manager.DBusObjectManager
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
    return cast(void function())g_dbus_object_manager_server_get_type != &gidSymbolNotFound ? g_dbus_object_manager_server_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectManagerServer self()
  {
    return this;
  }

  /**
      Get `connection` property.
      Returns: The #GDBusConnection to export objects on.
  */
  @property gio.dbus_connection.DBusConnection connection()
  {
    return getConnection();
  }

  /**
      Set `connection` property.
      Params:
        propval = The #GDBusConnection to export objects on.
  */
  @property void connection(gio.dbus_connection.DBusConnection propval)
  {
    return setConnection(propval);
  }

  mixin DBusObjectManagerT!();

  /**
      Creates a new #GDBusObjectManagerServer object.
      
      The returned server isn't yet exported on any connection. To do so,
      use [gio.dbus_object_manager_server.DBusObjectManagerServer.setConnection]. Normally you
      want to export all of your objects before doing so to avoid
      [InterfacesAdded](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
      signals being emitted.
  
      Params:
        objectPath = The object path to export the manager object at.
      Returns: A #GDBusObjectManagerServer object. Free with [gobject.object.ObjectWrap.unref].
  */
  this(string objectPath)
  {
    GDBusObjectManagerServer* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_object_manager_server_new(_objectPath);
    this(_cretval, Yes.Take);
  }

  /**
      Exports object on manager.
      
      If there is already a #GDBusObject exported at the object path,
      then the old object is removed.
      
      The object path for object must be in the hierarchy rooted by the
      object path for manager.
      
      Note that manager will take a reference on object for as long as
      it is exported.
  
      Params:
        object = A #GDBusObjectSkeleton.
  */
  void export_(gio.dbus_object_skeleton.DBusObjectSkeleton object)
  {
    g_dbus_object_manager_server_export(cast(GDBusObjectManagerServer*)this._cPtr, object ? cast(GDBusObjectSkeleton*)object._cPtr(No.Dup) : null);
  }

  /**
      Like [gio.dbus_object_manager_server.DBusObjectManagerServer.export_] but appends a string of
      the form _N (with N being a natural number) to object's object path
      if an object with the given path already exists. As such, the
      #GDBusObjectProxy:g-object-path property of object may be modified.
  
      Params:
        object = An object.
  */
  void exportUniquely(gio.dbus_object_skeleton.DBusObjectSkeleton object)
  {
    g_dbus_object_manager_server_export_uniquely(cast(GDBusObjectManagerServer*)this._cPtr, object ? cast(GDBusObjectSkeleton*)object._cPtr(No.Dup) : null);
  }

  /**
      Gets the #GDBusConnection used by manager.
      Returns: A #GDBusConnection object or null if
          manager isn't exported on a connection. The returned object should
          be freed with [gobject.object.ObjectWrap.unref].
  */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_manager_server_get_connection(cast(GDBusObjectManagerServer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns whether object is currently exported on manager.
  
      Params:
        object = An object.
      Returns: true if object is exported
  */
  bool isExported(gio.dbus_object_skeleton.DBusObjectSkeleton object)
  {
    bool _retval;
    _retval = cast(bool)g_dbus_object_manager_server_is_exported(cast(GDBusObjectManagerServer*)this._cPtr, object ? cast(GDBusObjectSkeleton*)object._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Exports all objects managed by manager on connection. If
      connection is null, stops exporting objects.
  
      Params:
        connection = A #GDBusConnection or null.
  */
  void setConnection(gio.dbus_connection.DBusConnection connection = null)
  {
    g_dbus_object_manager_server_set_connection(cast(GDBusObjectManagerServer*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null);
  }

  /**
      If manager has an object at path, removes the object. Otherwise
      does nothing.
      
      Note that object_path must be in the hierarchy rooted by the
      object path for manager.
  
      Params:
        objectPath = An object path.
      Returns: true if object at object_path was removed, false otherwise.
  */
  bool unexport(string objectPath)
  {
    bool _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _retval = cast(bool)g_dbus_object_manager_server_unexport(cast(GDBusObjectManagerServer*)this._cPtr, _objectPath);
    return _retval;
  }
}
