/// Module for [ApplicationInfo] class
module webkit.application_info;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Information about an application running in automation mode.
*/
class ApplicationInfo : gobject.boxed.Boxed
{

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
    return cast(void function())webkit_application_info_get_type != &gidSymbolNotFound ? webkit_application_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationInfo self()
  {
    return this;
  }

  /**
      Creates a new #WebKitApplicationInfo
      Returns: the newly created #WebKitApplicationInfo.
  */
  this()
  {
    WebKitApplicationInfo* _cretval;
    _cretval = webkit_application_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the name of the application.
      
      If [webkit.application_info.ApplicationInfo.setName] hasn't been
      called with a valid name, this returns [glib.global.getPrgname].
      Returns: the application name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_application_info_get_name(cast(WebKitApplicationInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the application version previously set with [webkit.application_info.ApplicationInfo.setVersion].
  
      Params:
        major = return location for the major version number
        minor = return location for the minor version number
        micro = return location for the micro version number
  */
  void getVersion(out ulong major, out ulong minor, out ulong micro)
  {
    webkit_application_info_get_version(cast(WebKitApplicationInfo*)this._cPtr, cast(ulong*)&major, cast(ulong*)&minor, cast(ulong*)&micro);
  }

  /**
      Set the name of the application.
      
      If not provided, or null is passed,
      [glib.global.getPrgname] will be used.
  
      Params:
        name = the application name
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    webkit_application_info_set_name(cast(WebKitApplicationInfo*)this._cPtr, _name);
  }

  /**
      Set the application version.
      
      If the application doesn't use the format
      major.minor.micro you can pass 0 as the micro to use major.minor, or pass
      0 as both micro and minor to use only major number. Any other format must
      be converted to major.minor.micro so that it can be used in version comparisons.
  
      Params:
        major = the major version number
        minor = the minor version number
        micro = the micro version number
  */
  void setVersion(ulong major, ulong minor, ulong micro)
  {
    webkit_application_info_set_version(cast(WebKitApplicationInfo*)this._cPtr, major, minor, micro);
  }
}
