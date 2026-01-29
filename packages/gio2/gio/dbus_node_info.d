/// Module for [DBusNodeInfo] class
module gio.dbus_node_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface_info;
import gio.types;
import glib.error;
import glib.string_;
import gobject.boxed;

/**
    Information about nodes in a remote object hierarchy.
*/
class DBusNodeInfo : gobject.boxed.Boxed
{

  /**
      Create a `dbus_node_info.DBusNodeInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        path = The path of the node or null if omitted. Note that this may be a relative path. See the D-Bus specification for more details.
  */
  this(int refCount = int.init, string path = string.init)
  {
    super(gMalloc(GDBusNodeInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.path = path;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_node_info_get_type != &gidSymbolNotFound ? g_dbus_node_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusNodeInfo self()
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount()
  {
    return (cast(GDBusNodeInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval)
  {
    (cast(GDBusNodeInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `path` field.
      Returns: The path of the node or null if omitted. Note that this may be a relative path. See the D-Bus specification for more details.
  */
  @property string path()
  {
    return cToD!(string)(cast(void*)(cast(GDBusNodeInfo*)this._cPtr).path);
  }

  /**
      Set `path` field.
      Params:
        propval = The path of the node or null if omitted. Note that this may be a relative path. See the D-Bus specification for more details.
  */
  @property void path(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusNodeInfo*)this._cPtr).path);
    dToC(propval, cast(void*)&(cast(GDBusNodeInfo*)this._cPtr).path);
  }

  /**
      Parses xml_data and returns a #GDBusNodeInfo representing the data.
      
      The introspection XML must contain exactly one top-level
      <node> element.
      
      Note that this routine is using a
      [GMarkup][glib-Simple-XML-Subset-Parser.description]-based
      parser that only accepts a subset of valid XML documents.
  
      Params:
        xmlData = Valid D-Bus introspection XML.
      Returns: A #GDBusNodeInfo structure or null if error is set. Free
        with [gio.dbus_node_info.DBusNodeInfo.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_node_info.DBusNodeInfo newForXml(string xmlData)
  {
    GDBusNodeInfo* _cretval;
    const(char)* _xmlData = xmlData.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_node_info_new_for_xml(_xmlData, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gio.dbus_node_info.DBusNodeInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Appends an XML representation of info (and its children) to string_builder.
      
      This function is typically used for generating introspection XML documents at run-time for
      handling the `org.freedesktop.DBus.Introspectable.Introspect`  method.
  
      Params:
        indent = Indentation level.
        stringBuilder = A #GString to to append XML data to.
  */
  void generateXml(uint indent, glib.string_.String stringBuilder)
  {
    g_dbus_node_info_generate_xml(cast(GDBusNodeInfo*)this._cPtr, indent, stringBuilder ? cast(GString*)stringBuilder._cPtr(No.Dup) : null);
  }

  /**
      Looks up information about an interface.
      
      The cost of this function is O(n) in number of interfaces.
  
      Params:
        name = A D-Bus interface name.
      Returns: A #GDBusInterfaceInfo or null if not found. Do not free, it is owned by info.
  */
  gio.dbus_interface_info.DBusInterfaceInfo lookupInterface(string name)
  {
    GDBusInterfaceInfo* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_node_info_lookup_interface(cast(GDBusNodeInfo*)this._cPtr, _name);
    auto _retval = _cretval ? new gio.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
