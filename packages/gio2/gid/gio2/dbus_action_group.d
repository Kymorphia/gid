/// Module for [DBusActionGroup] class
module gid.gio2.dbus_action_group;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_connection;
import gid.gio2.remote_action_group;
import gid.gio2.remote_action_group_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.dbus_action_group.DBusActionGroup] is an implementation of the [gid.gio2.action_group.ActionGroup]
    interface.
    
    [gid.gio2.dbus_action_group.DBusActionGroup] can be used as a proxy for an action group
    that is exported over D-Bus with [gid.gio2.dbus_connection.DBusConnection.exportActionGroup].
*/
@gidGir("DBusActionGroup")
class DBusActionGroup : gid.gobject2.object.ObjectWrap, gid.gio2.action_group.ActionGroup, gid.gio2.remote_action_group.RemoteActionGroup
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_action_group_get_type != &gidSymbolNotFound ? g_dbus_action_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusActionGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusActionGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_action_group.DBusActionGroup]
      Returns: New builder object
  */
  static DBusActionGroupGidBuilder builder() nothrow
  {
    return new DBusActionGroupGidBuilder;
  }

  mixin ActionGroupT!();
  mixin RemoteActionGroupT!();

  /**
      Obtains a #GDBusActionGroup for the action group which is exported at
      the given bus_name and object_path.
      
      The thread default main context is taken at the time of this call.
      All signals on the menu model (and any linked models) are reported
      with respect to this context.  All calls on the returned menu model
      (and linked models) must also originate from this same context, with
      the thread default main context unchanged.
      
      This call is non-blocking.  The returned action group may or may not
      already be filled in.  The correct thing to do is connect the signals
      for the action group to monitor for changes and then to call
      [gid.gio2.action_group.ActionGroup.listActions] to get the initial list.
  
      Params:
        connection = A #GDBusConnection
        busName = the bus name which exports the action
              group or null if connection is not a message bus connection
        objectPath = the object path at which the action group is exported
      Returns: a #GDBusActionGroup
  */
  static gid.gio2.dbus_action_group.DBusActionGroup get(gid.gio2.dbus_connection.DBusConnection connection, string busName, string objectPath) nothrow
  {
    GDBusActionGroup* _cretval;
    const(char)* _busName = busName.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_action_group_get(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _busName, _objectPath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_action_group.DBusActionGroup)(cast(GDBusActionGroup*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_action_group.DBusActionGroup]
class DBusActionGroupGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T, gid.gio2.remote_action_group.RemoteActionGroupGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();
  mixin RemoteActionGroupGidBuilderT!();
}

/// Fluent builder for [gid.gio2.dbus_action_group.DBusActionGroup]
final class DBusActionGroupGidBuilder : DBusActionGroupGidBuilderImpl!DBusActionGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusActionGroup build() nothrow
  {
    return new DBusActionGroup(cast(void*)createGObject(DBusActionGroup._getGType), Yes.Take);
  }
}
