/// Module for [DBusInterfaceInfo] class
module gio.dbus_interface_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_method_info;
import gio.dbus_property_info;
import gio.dbus_signal_info;
import gio.types;
import glib.string_;
import gobject.boxed;

/**
    Information about a D-Bus interface.
*/
class DBusInterfaceInfo : gobject.boxed.Boxed
{

  /**
      Create a `dbus_interface_info.DBusInterfaceInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  this(int refCount = int.init, string name = string.init)
  {
    super(gMalloc(GDBusInterfaceInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.name = name;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_interface_info_get_type != &gidSymbolNotFound ? g_dbus_interface_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusInterfaceInfo self()
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount()
  {
    return (cast(GDBusInterfaceInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval)
  {
    (cast(GDBusInterfaceInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusInterfaceInfo*)this._cPtr).name);
  }

  /**
      Builds a lookup-cache to speed up
      [gio.dbus_interface_info.DBusInterfaceInfo.lookupMethod],
      [gio.dbus_interface_info.DBusInterfaceInfo.lookupSignal] and
      [gio.dbus_interface_info.DBusInterfaceInfo.lookupProperty].
      
      If this has already been called with info, the existing cache is
      used and its use count is increased.
      
      Note that info cannot be modified until
      [gio.dbus_interface_info.DBusInterfaceInfo.cacheRelease] is called.
  */
  void cacheBuild()
  {
    g_dbus_interface_info_cache_build(cast(GDBusInterfaceInfo*)this._cPtr);
  }

  /**
      Decrements the usage count for the cache for info built by
      [gio.dbus_interface_info.DBusInterfaceInfo.cacheBuild] (if any) and frees the
      resources used by the cache if the usage count drops to zero.
  */
  void cacheRelease()
  {
    g_dbus_interface_info_cache_release(cast(GDBusInterfaceInfo*)this._cPtr);
  }

  /**
      Appends an XML representation of info (and its children) to string_builder.
      
      This function is typically used for generating introspection XML
      documents at run-time for handling the
      `org.freedesktop.DBus.Introspectable.Introspect`
      method.
  
      Params:
        indent = Indentation level.
        stringBuilder = A #GString to to append XML data to.
  */
  void generateXml(uint indent, glib.string_.String stringBuilder)
  {
    g_dbus_interface_info_generate_xml(cast(GDBusInterfaceInfo*)this._cPtr, indent, stringBuilder ? cast(GString*)stringBuilder._cPtr(No.Dup) : null);
  }

  /**
      Looks up information about a method.
      
      The cost of this function is O(n) in number of methods unless
      [gio.dbus_interface_info.DBusInterfaceInfo.cacheBuild] has been used on info.
  
      Params:
        name = A D-Bus method name (typically in CamelCase)
      Returns: A #GDBusMethodInfo or null if not found. Do not free, it is owned by info.
  */
  gio.dbus_method_info.DBusMethodInfo lookupMethod(string name)
  {
    GDBusMethodInfo* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_interface_info_lookup_method(cast(GDBusInterfaceInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gio.dbus_method_info.DBusMethodInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Looks up information about a property.
      
      The cost of this function is O(n) in number of properties unless
      [gio.dbus_interface_info.DBusInterfaceInfo.cacheBuild] has been used on info.
  
      Params:
        name = A D-Bus property name (typically in CamelCase).
      Returns: A #GDBusPropertyInfo or null if not found. Do not free, it is owned by info.
  */
  gio.dbus_property_info.DBusPropertyInfo lookupProperty(string name)
  {
    GDBusPropertyInfo* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_interface_info_lookup_property(cast(GDBusInterfaceInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gio.dbus_property_info.DBusPropertyInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Looks up information about a signal.
      
      The cost of this function is O(n) in number of signals unless
      [gio.dbus_interface_info.DBusInterfaceInfo.cacheBuild] has been used on info.
  
      Params:
        name = A D-Bus signal name (typically in CamelCase)
      Returns: A #GDBusSignalInfo or null if not found. Do not free, it is owned by info.
  */
  gio.dbus_signal_info.DBusSignalInfo lookupSignal(string name)
  {
    GDBusSignalInfo* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_interface_info_lookup_signal(cast(GDBusInterfaceInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gio.dbus_signal_info.DBusSignalInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
