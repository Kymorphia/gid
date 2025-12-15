/// Module for [Vfs] class
module gio.vfs;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file;
import gio.types;
import gobject.object;

/**
    Entry point for using GIO functionality.
*/
class Vfs : gobject.object.ObjectWrap
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
    return cast(void function())g_vfs_get_type != &gidSymbolNotFound ? g_vfs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Vfs self()
  {
    return this;
  }

  /**
      Gets the default #GVfs for the system.
      Returns: a #GVfs, which will be the local
            file system #GVfs if no other implementation is available.
  */
  static gio.vfs.Vfs getDefault()
  {
    GVfs* _cretval;
    _cretval = g_vfs_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.vfs.Vfs)(cast(GVfs*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the local #GVfs for the system.
      Returns: a #GVfs.
  */
  static gio.vfs.Vfs getLocal()
  {
    GVfs* _cretval;
    _cretval = g_vfs_get_local();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.vfs.Vfs)(cast(GVfs*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #GFile for path.
  
      Params:
        path = a string containing a VFS path.
      Returns: a #GFile.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  gio.file.File getFileForPath(string path)
  {
    GFile* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_vfs_get_file_for_path(cast(GVfs*)this._cPtr, _path);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a #GFile for uri.
      
      This operation never fails, but the returned object
      might not support any I/O operation if the URI
      is malformed or if the URI scheme is not supported.
  
      Params:
        uri = a string containing a URI
      Returns: a #GFile.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  gio.file.File getFileForUri(string uri)
  {
    GFile* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = g_vfs_get_file_for_uri(cast(GVfs*)this._cPtr, _uri);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of URI schemes supported by vfs.
      Returns: a null-terminated array of strings.
            The returned array belongs to GIO and must
            not be freed or modified.
  */
  string[] getSupportedUriSchemes()
  {
    const(char*)* _cretval;
    _cretval = g_vfs_get_supported_uri_schemes(cast(GVfs*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Checks if the VFS is active.
      Returns: true if construction of the vfs was successful
            and it is now active.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)g_vfs_is_active(cast(GVfs*)this._cPtr);
    return _retval;
  }

  /**
      This operation never fails, but the returned object might
      not support any I/O operations if the parse_name cannot
      be parsed by the #GVfs module.
  
      Params:
        parseName = a string to be parsed by the VFS module.
      Returns: a #GFile for the given parse_name.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  gio.file.File parseName(string parseName)
  {
    GFile* _cretval;
    const(char)* _parseName = parseName.toCString(No.Alloc);
    _cretval = g_vfs_parse_name(cast(GVfs*)this._cPtr, _parseName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Registers uri_func and parse_name_func as the #GFile URI and parse name
      lookup functions for URIs with a scheme matching scheme.
      Note that scheme is registered only within the running application, as
      opposed to desktop-wide as it happens with GVfs backends.
      
      When a #GFile is requested with an URI containing scheme (e.g. through
      [gio.file.File.newForUri]), uri_func will be called to allow a custom
      constructor. The implementation of uri_func should not be blocking, and
      must not call [gio.vfs.Vfs.registerUriScheme] or [gio.vfs.Vfs.unregisterUriScheme].
      
      When [gio.file.File.parseName] is called with a parse name obtained from such file,
      parse_name_func will be called to allow the #GFile to be created again. In
      that case, it's responsibility of parse_name_func to make sure the parse
      name matches what the custom #GFile implementation returned when
      [gio.file.File.getParseName] was previously called. The implementation of
      parse_name_func should not be blocking, and must not call
      [gio.vfs.Vfs.registerUriScheme] or [gio.vfs.Vfs.unregisterUriScheme].
      
      It's an error to call this function twice with the same scheme. To unregister
      a custom URI scheme, use [gio.vfs.Vfs.unregisterUriScheme].
  
      Params:
        scheme = an URI scheme, e.g. "http"
        uriFunc = a #GVfsFileLookupFunc
        parseNameFunc = a #GVfsFileLookupFunc
      Returns: true if scheme was successfully registered, or false if a handler
            for scheme already exists.
  */
  bool registerUriScheme(string scheme, gio.types.VfsFileLookupFunc uriFunc = null, gio.types.VfsFileLookupFunc parseNameFunc = null)
  {
    extern(C) GFile* _uriFuncCallback(GVfs* vfs, const(char)* identifier, void* userData)
    {
      gio.file.File _dretval;
      auto _dlg = cast(gio.types.VfsFileLookupFunc*)userData;
      string _identifier = identifier.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.vfs.Vfs)(cast(void*)vfs, No.Take), _identifier);
      GFile* _retval = cast(GFile*)(cast(gobject.object.ObjectWrap)_dretval)._cPtr(Yes.Dup);

      return _retval;
    }
    auto _uriFuncCB = uriFunc ? &_uriFuncCallback : null;

    extern(C) GFile* _parseNameFuncCallback(GVfs* vfs, const(char)* identifier, void* userData)
    {
      gio.file.File _dretval;
      auto _dlg = cast(gio.types.VfsFileLookupFunc*)userData;
      string _identifier = identifier.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.vfs.Vfs)(cast(void*)vfs, No.Take), _identifier);
      GFile* _retval = cast(GFile*)(cast(gobject.object.ObjectWrap)_dretval)._cPtr(Yes.Dup);

      return _retval;
    }
    auto _parseNameFuncCB = parseNameFunc ? &_parseNameFuncCallback : null;

    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    auto _uriFunc = uriFunc ? freezeDelegate(cast(void*)&uriFunc) : null;
    GDestroyNotify _uriFuncDestroyCB = uriFunc ? &thawDelegate : null;
    auto _parseNameFunc = parseNameFunc ? freezeDelegate(cast(void*)&parseNameFunc) : null;
    GDestroyNotify _parseNameFuncDestroyCB = parseNameFunc ? &thawDelegate : null;
    _retval = cast(bool)g_vfs_register_uri_scheme(cast(GVfs*)this._cPtr, _scheme, _uriFuncCB, _uriFunc, _uriFuncDestroyCB, _parseNameFuncCB, _parseNameFunc, _parseNameFuncDestroyCB);
    return _retval;
  }

  /**
      Unregisters the URI handler for scheme previously registered with
      [gio.vfs.Vfs.registerUriScheme].
  
      Params:
        scheme = an URI scheme, e.g. "http"
      Returns: true if scheme was successfully unregistered, or false if a
            handler for scheme does not exist.
  */
  bool unregisterUriScheme(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)g_vfs_unregister_uri_scheme(cast(GVfs*)this._cPtr, _scheme);
    return _retval;
  }
}
