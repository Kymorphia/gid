/// Module for [DBusInterfaceInfo] class
module gid.gio2.dbus_interface_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_annotation_info;
import gid.gio2.dbus_method_info;
import gid.gio2.dbus_property_info;
import gid.gio2.dbus_signal_info;
import gid.gio2.types;
import gid.glib2.string_;
import gid.gobject2.boxed;

/**
    Information about a D-Bus interface.
*/
@gidGir("DBusInterfaceInfo")
class DBusInterfaceInfo : gid.gobject2.boxed.BoxedWrap!(g_dbus_interface_info_get_type)
{
  /**
      Create a `dbus_interface_info.DBusInterfaceInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        name = The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  this(int refCount = int.init, string name = string.init) nothrow
  {
    super(boxedNew!GDBusInterfaceInfo(_getGType), Yes.Take);
    this.refCount = refCount;
    this.name = name;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusInterfaceInfo self() nothrow
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount() nothrow
  {
    return (cast(GDBusInterfaceInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval) nothrow
  {
    (cast(GDBusInterfaceInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `name` field.
      Returns: The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).name);
    (cast(GDBusInterfaceInfo*)this._cPtr).name = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `methods` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusMethodInfo structures or null if there are no methods.
  */
  @property gid.gio2.dbus_method_info.DBusMethodInfo[] methods() nothrow
  {
    uint len;
    if ((cast(GDBusInterfaceInfo*)this._cPtr).methods)
    {
      for (; (cast(GDBusInterfaceInfo*)this._cPtr).methods[len] !is null; len++)
      {
      }
    }

    auto _retval = new gid.gio2.dbus_method_info.DBusMethodInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gid.gio2.dbus_method_info.DBusMethodInfo(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).methods[i], No.Take);
    return _retval;
  }

  /**
      Get `signals` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusSignalInfo structures or null if there are no signals.
  */
  @property gid.gio2.dbus_signal_info.DBusSignalInfo[] signals() nothrow
  {
    uint len;
    if ((cast(GDBusInterfaceInfo*)this._cPtr).signals)
    {
      for (; (cast(GDBusInterfaceInfo*)this._cPtr).signals[len] !is null; len++)
      {
      }
    }

    auto _retval = new gid.gio2.dbus_signal_info.DBusSignalInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gid.gio2.dbus_signal_info.DBusSignalInfo(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).signals[i], No.Take);
    return _retval;
  }

  /**
      Get `properties` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusPropertyInfo structures or null if there are no properties.
  */
  @property gid.gio2.dbus_property_info.DBusPropertyInfo[] properties() nothrow
  {
    uint len;
    if ((cast(GDBusInterfaceInfo*)this._cPtr).properties)
    {
      for (; (cast(GDBusInterfaceInfo*)this._cPtr).properties[len] !is null; len++)
      {
      }
    }

    auto _retval = new gid.gio2.dbus_property_info.DBusPropertyInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gid.gio2.dbus_property_info.DBusPropertyInfo(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).properties[i], No.Take);
    return _retval;
  }

  /**
      Get `annotations` field.
      Returns: A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  @property gid.gio2.dbus_annotation_info.DBusAnnotationInfo[] annotations() nothrow
  {
    uint len;
    if ((cast(GDBusInterfaceInfo*)this._cPtr).annotations)
    {
      for (; (cast(GDBusInterfaceInfo*)this._cPtr).annotations[len] !is null; len++)
      {
      }
    }

    auto _retval = new gid.gio2.dbus_annotation_info.DBusAnnotationInfo[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gid.gio2.dbus_annotation_info.DBusAnnotationInfo(cast(void*)(cast(GDBusInterfaceInfo*)this._cPtr).annotations[i], No.Take);
    return _retval;
  }

  /**
      Builds a lookup-cache to speed up
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.lookupMethod],
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.lookupSignal] and
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.lookupProperty].
      
      If this has already been called with info, the existing cache is
      used and its use count is increased.
      
      Note that info cannot be modified until
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.cacheRelease] is called.
  */
  void cacheBuild() nothrow
  {
    g_dbus_interface_info_cache_build(cast(GDBusInterfaceInfo*)this._cPtr);
  }

  /**
      Decrements the usage count for the cache for info built by
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.cacheBuild] (if any) and frees the
      resources used by the cache if the usage count drops to zero.
  */
  void cacheRelease() nothrow
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
  void generateXml(uint indent, gid.glib2.string_.String stringBuilder) nothrow
  {
    g_dbus_interface_info_generate_xml(cast(GDBusInterfaceInfo*)this._cPtr, indent, stringBuilder ? cast(GString*)stringBuilder._cPtr(No.Dup) : null);
  }

  /**
      Looks up information about a method.
      
      The cost of this function is O(n) in number of methods unless
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.cacheBuild] has been used on info.
  
      Params:
        name = A D-Bus method name (typically in CamelCase)
      Returns: A #GDBusMethodInfo or null if not found. Do not free, it is owned by info.
  */
  gid.gio2.dbus_method_info.DBusMethodInfo lookupMethod(string name) nothrow
  {
    GDBusMethodInfo* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_interface_info_lookup_method(cast(GDBusInterfaceInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gid.gio2.dbus_method_info.DBusMethodInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Looks up information about a property.
      
      The cost of this function is O(n) in number of properties unless
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.cacheBuild] has been used on info.
  
      Params:
        name = A D-Bus property name (typically in CamelCase).
      Returns: A #GDBusPropertyInfo or null if not found. Do not free, it is owned by info.
  */
  gid.gio2.dbus_property_info.DBusPropertyInfo lookupProperty(string name) nothrow
  {
    GDBusPropertyInfo* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_interface_info_lookup_property(cast(GDBusInterfaceInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gid.gio2.dbus_property_info.DBusPropertyInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Looks up information about a signal.
      
      The cost of this function is O(n) in number of signals unless
      [gid.gio2.dbus_interface_info.DBusInterfaceInfo.cacheBuild] has been used on info.
  
      Params:
        name = A D-Bus signal name (typically in CamelCase)
      Returns: A #GDBusSignalInfo or null if not found. Do not free, it is owned by info.
  */
  gid.gio2.dbus_signal_info.DBusSignalInfo lookupSignal(string name) nothrow
  {
    GDBusSignalInfo* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_interface_info_lookup_signal(cast(GDBusInterfaceInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gid.gio2.dbus_signal_info.DBusSignalInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
