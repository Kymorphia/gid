module Gio.Vfs;

import GObject.ObjectG;
import Gid.gid;
import Gio.File;
import Gio.FileT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Entry point for using GIO functionality.
 */
class Vfs : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_vfs_get_type != &gidSymbolNotFound ? g_vfs_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the default #GVfs for the system.
   * Returns: a #GVfs, which will be the local
   *   file system #GVfs if no other implementation is available.
   */
  static Vfs getDefault()
  {
    GVfs* _cretval;
    _cretval = g_vfs_get_default();
    auto _retval = ObjectG.getDObject!Vfs(cast(GVfs*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the local #GVfs for the system.
   * Returns: a #GVfs.
   */
  static Vfs getLocal()
  {
    GVfs* _cretval;
    _cretval = g_vfs_get_local();
    auto _retval = ObjectG.getDObject!Vfs(cast(GVfs*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets a #GFile for path.
   * Params:
   *   path = a string containing a VFS path.
   * Returns: a #GFile.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File getFileForPath(string path)
  {
    GFile* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_vfs_get_file_for_path(cast(GVfs*)cPtr, _path);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets a #GFile for uri.
   * This operation never fails, but the returned object
   * might not support any I/O operation if the URI
   * is malformed or if the URI scheme is not supported.
   * Params:
   *   uri = a string containing a URI
   * Returns: a #GFile.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File getFileForUri(string uri)
  {
    GFile* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = g_vfs_get_file_for_uri(cast(GVfs*)cPtr, _uri);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets a list of URI schemes supported by vfs.
   * Returns: a %NULL-terminated array of strings.
   *   The returned array belongs to GIO and must
   *   not be freed or modified.
   */
  string[] getSupportedUriSchemes()
  {
    const(char*)* _cretval;
    _cretval = g_vfs_get_supported_uri_schemes(cast(GVfs*)cPtr);
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
   * Checks if the VFS is active.
   * Returns: %TRUE if construction of the vfs was successful
   *   and it is now active.
   */
  bool isActive()
  {
    bool _retval;
    _retval = g_vfs_is_active(cast(GVfs*)cPtr);
    return _retval;
  }

  /**
   * This operation never fails, but the returned object might
   * not support any I/O operations if the parse_name cannot
   * be parsed by the #GVfs module.
   * Params:
   *   parseName = a string to be parsed by the VFS module.
   * Returns: a #GFile for the given parse_name.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File parseName(string parseName)
  {
    GFile* _cretval;
    const(char)* _parseName = parseName.toCString(No.Alloc);
    _cretval = g_vfs_parse_name(cast(GVfs*)cPtr, _parseName);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Registers uri_func and parse_name_func as the #GFile URI and parse name
   * lookup functions for URIs with a scheme matching scheme.
   * Note that scheme is registered only within the running application, as
   * opposed to desktop-wide as it happens with GVfs backends.
   * When a #GFile is requested with an URI containing scheme $(LPAREN)e.g. through
   * [Gio.File.newForUri]$(RPAREN), uri_func will be called to allow a custom
   * constructor. The implementation of uri_func should not be blocking, and
   * must not call [Gio.Vfs.registerUriScheme] or [Gio.Vfs.unregisterUriScheme].
   * When [Gio.File.parseName] is called with a parse name obtained from such file,
   * parse_name_func will be called to allow the #GFile to be created again. In
   * that case, it's responsibility of parse_name_func to make sure the parse
   * name matches what the custom #GFile implementation returned when
   * [Gio.File.getParseName] was previously called. The implementation of
   * parse_name_func should not be blocking, and must not call
   * [Gio.Vfs.registerUriScheme] or [Gio.Vfs.unregisterUriScheme].
   * It's an error to call this function twice with the same scheme. To unregister
   * a custom URI scheme, use [Gio.Vfs.unregisterUriScheme].
   * Params:
   *   scheme = an URI scheme, e.g. "http"
   *   uriFunc = a #GVfsFileLookupFunc
   *   parseNameFunc = a #GVfsFileLookupFunc
   * Returns: %TRUE if scheme was successfully registered, or %FALSE if a handler
   *   for scheme already exists.
   */
  bool registerUriScheme(string scheme, VfsFileLookupFunc uriFunc, VfsFileLookupFunc parseNameFunc)
  {
    extern(C) GFile* _uriFuncCallback(GVfs* vfs, const(char)* identifier, void* userData)
    {
      File _dretval;
      auto _dlg = cast(VfsFileLookupFunc*)userData;
      string _identifier = identifier.fromCString(No.Free);

      _dretval = (*_dlg)(ObjectG.getDObject!Vfs(cast(void*)vfs, No.Take), _identifier);
      GFile* _retval = cast(GFile*)(cast(ObjectG)_dretval).cPtr(Yes.Dup);

      return _retval;
    }

    extern(C) GFile* _parseNameFuncCallback(GVfs* vfs, const(char)* identifier, void* userData)
    {
      File _dretval;
      auto _dlg = cast(VfsFileLookupFunc*)userData;
      string _identifier = identifier.fromCString(No.Free);

      _dretval = (*_dlg)(ObjectG.getDObject!Vfs(cast(void*)vfs, No.Take), _identifier);
      GFile* _retval = cast(GFile*)(cast(ObjectG)_dretval).cPtr(Yes.Dup);

      return _retval;
    }

    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    auto _uriFunc = freezeDelegate(cast(void*)&uriFunc);
    auto _parseNameFunc = freezeDelegate(cast(void*)&parseNameFunc);
    _retval = g_vfs_register_uri_scheme(cast(GVfs*)cPtr, _scheme, &_uriFuncCallback, _uriFunc, &thawDelegate, &_parseNameFuncCallback, _parseNameFunc, &thawDelegate);
    return _retval;
  }

  /**
   * Unregisters the URI handler for scheme previously registered with
   * [Gio.Vfs.registerUriScheme].
   * Params:
   *   scheme = an URI scheme, e.g. "http"
   * Returns: %TRUE if scheme was successfully unregistered, or %FALSE if a
   *   handler for scheme does not exist.
   */
  bool unregisterUriScheme(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = g_vfs_unregister_uri_scheme(cast(GVfs*)cPtr, _scheme);
    return _retval;
  }
}
