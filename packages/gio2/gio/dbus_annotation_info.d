/// Module for [DBusAnnotationInfo] class
module gio.dbus_annotation_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about an annotation.
*/
class DBusAnnotationInfo : gobject.boxed.Boxed
{

  /**
      Create a `dbus_annotation_info.DBusAnnotationInfo` boxed type.
      Params:
        refCount = The reference count or -1 if statically allocated.
        key = The name of the annotation, e.g. "org.freedesktop.DBus.Deprecated".
        value = The value of the annotation.
  */
  this(int refCount = int.init, string key = string.init, string value = string.init)
  {
    super(gMalloc(GDBusAnnotationInfo.sizeof), Yes.Take);
    this.refCount = refCount;
    this.key = key;
    this.value = value;
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
    return cast(void function())g_dbus_annotation_info_get_type != &gidSymbolNotFound ? g_dbus_annotation_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusAnnotationInfo self()
  {
    return this;
  }

  /**
      Get `refCount` field.
      Returns: The reference count or -1 if statically allocated.
  */
  @property int refCount()
  {
    return (cast(GDBusAnnotationInfo*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = The reference count or -1 if statically allocated.
  */
  @property void refCount(int propval)
  {
    (cast(GDBusAnnotationInfo*)this._cPtr).refCount = propval;
  }

  /**
      Get `key` field.
      Returns: The name of the annotation, e.g. "org.freedesktop.DBus.Deprecated".
  */
  @property string key()
  {
    return cToD!(string)(cast(void*)(cast(GDBusAnnotationInfo*)this._cPtr).key);
  }

  /**
      Set `key` field.
      Params:
        propval = The name of the annotation, e.g. "org.freedesktop.DBus.Deprecated".
  */
  @property void key(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusAnnotationInfo*)this._cPtr).key);
    dToC(propval, cast(void*)&(cast(GDBusAnnotationInfo*)this._cPtr).key);
  }

  /**
      Get `value` field.
      Returns: The value of the annotation.
  */
  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(GDBusAnnotationInfo*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = The value of the annotation.
  */
  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusAnnotationInfo*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(GDBusAnnotationInfo*)this._cPtr).value);
  }

  /**
      Looks up the value of an annotation.
      
      The cost of this function is O(n) in number of annotations.
  
      Params:
        annotations = A null-terminated array of annotations or null.
        name = The name of the annotation to look up.
      Returns: The value or null if not found. Do not free, it is owned by annotations.
  */
  static string lookup(gio.dbus_annotation_info.DBusAnnotationInfo[] annotations, string name)
  {
    const(char)* _cretval;
    GDBusAnnotationInfo*[] _tmpannotations;
    foreach (obj; annotations)
      _tmpannotations ~= cast(GDBusAnnotationInfo*)obj._cPtr;
    _tmpannotations.length++;
    GDBusAnnotationInfo** _annotations = _tmpannotations.ptr;

    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_annotation_info_lookup(_annotations, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
