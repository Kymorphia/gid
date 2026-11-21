/// Module for [Vfs] class
module gid.gio2.vfs;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.file;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Entry point for using GIO functionality.
*/
class Vfs : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_vfs_get_type != &gidSymbolNotFound ? g_vfs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GVfs";
  }

  /** Returns `this`, for use in `with` statements. */
  override Vfs self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.vfs.Vfs]
      Returns: New builder object
  */
  static VfsGidBuilder builder() nothrow
  {
    return new VfsGidBuilder;
  }

  /**
      Gets the default #GVfs for the system.
      Returns: a #GVfs, which will be the local
            file system #GVfs if no other implementation is available.
  */
  static gid.gio2.vfs.Vfs getDefault() nothrow
  {
    GVfs* _cretval;
    _cretval = g_vfs_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.vfs.Vfs)(cast(GVfs*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the local #GVfs for the system.
      Returns: a #GVfs.
  */
  static gid.gio2.vfs.Vfs getLocal() nothrow
  {
    GVfs* _cretval;
    _cretval = g_vfs_get_local();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.vfs.Vfs)(cast(GVfs*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #GFile for path.
  
      Params:
        path = a string containing a VFS path.
      Returns: a #GFile.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.file.File getFileForPath(string path) nothrow
  {
    GFile* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = g_vfs_get_file_for_path(cast(GVfs*)this._cPtr, _path);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
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
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.file.File getFileForUri(string uri) nothrow
  {
    GFile* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = g_vfs_get_file_for_uri(cast(GVfs*)this._cPtr, _uri);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of URI schemes supported by vfs.
      Returns: a null-terminated array of strings.
            The returned array belongs to GIO and must
            not be freed or modified.
  */
  string[] getSupportedUriSchemes() nothrow
  {
    const(char*)* _cretval;
    _cretval = g_vfs_get_supported_uri_schemes(cast(GVfs*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Checks if the VFS is active.
      Returns: true if construction of the vfs was successful
            and it is now active.
  */
  bool isActive() nothrow
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
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.file.File parseName(string parseName) nothrow
  {
    GFile* _cretval;
    const(char)* _parseName = parseName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_vfs_parse_name(cast(GVfs*)this._cPtr, _parseName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Registers uri_func and parse_name_func as the #GFile URI and parse name
      lookup functions for URIs with a scheme matching scheme.
      Note that scheme is registered only within the running application, as
      opposed to desktop-wide as it happens with GVfs backends.
      
      When a #GFile is requested with an URI containing scheme (e.g. through
      [gid.gio2.file.File.newForUri]), uri_func will be called to allow a custom
      constructor. The implementation of uri_func should not be blocking, and
      must not call [gid.gio2.vfs.Vfs.registerUriScheme] or [gid.gio2.vfs.Vfs.unregisterUriScheme].
      
      When [gid.gio2.file.File.parseName] is called with a parse name obtained from such file,
      parse_name_func will be called to allow the #GFile to be created again. In
      that case, it's responsibility of parse_name_func to make sure the parse
      name matches what the custom #GFile implementation returned when
      [gid.gio2.file.File.getParseName] was previously called. The implementation of
      parse_name_func should not be blocking, and must not call
      [gid.gio2.vfs.Vfs.registerUriScheme] or [gid.gio2.vfs.Vfs.unregisterUriScheme].
      
      It's an error to call this function twice with the same scheme. To unregister
      a custom URI scheme, use [gid.gio2.vfs.Vfs.unregisterUriScheme].
  
      Params:
        scheme = an URI scheme, e.g. "http"
        uriFunc = a #GVfsFileLookupFunc
        parseNameFunc = a #GVfsFileLookupFunc
      Returns: true if scheme was successfully registered, or false if a handler
            for scheme already exists.
  */
  bool registerUriScheme(string scheme, gid.gio2.types.VfsFileLookupFunc uriFunc = null, gid.gio2.types.VfsFileLookupFunc parseNameFunc = null) nothrow
  {
    extern(C) GFile* _uriFuncCallback(GVfs* vfs, const(char)* identifier, void* userData) nothrow
    {
      gid.gio2.file.File _dretval;
      auto _dlg = cast(gid.gio2.types.VfsFileLookupFunc*)userData;
      string _identifier = identifier.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.vfs.Vfs)(cast(void*)vfs, No.Take), _identifier);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.VfsFileLookupFunc");
      }
      auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _uriFuncCB = uriFunc ? &_uriFuncCallback : null;
    extern(C) GFile* _parseNameFuncCallback(GVfs* vfs, const(char)* identifier, void* userData) nothrow
    {
      gid.gio2.file.File _dretval;
      auto _dlg = cast(gid.gio2.types.VfsFileLookupFunc*)userData;
      string _identifier = identifier.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.vfs.Vfs)(cast(void*)vfs, No.Take), _identifier);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.VfsFileLookupFunc");
      }
      auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _parseNameFuncCB = parseNameFunc ? &_parseNameFuncCallback : null;
    bool _retval;
    const(char)* _scheme = scheme.toCString!(No.Malloc, No.Nullable);
    auto _uriFunc = uriFunc ? freezeDelegate(cast(void*)&uriFunc) : null;
    GDestroyNotify _uriFuncDestroyCB = uriFunc ? &thawDelegate : null;
    auto _parseNameFunc = parseNameFunc ? freezeDelegate(cast(void*)&parseNameFunc) : null;
    GDestroyNotify _parseNameFuncDestroyCB = parseNameFunc ? &thawDelegate : null;
    _retval = cast(bool)g_vfs_register_uri_scheme(cast(GVfs*)this._cPtr, _scheme, _uriFuncCB, _uriFunc, _uriFuncDestroyCB, _parseNameFuncCB, _parseNameFunc, _parseNameFuncDestroyCB);
    return _retval;
  }

  /**
      Unregisters the URI handler for scheme previously registered with
      [gid.gio2.vfs.Vfs.registerUriScheme].
  
      Params:
        scheme = an URI scheme, e.g. "http"
      Returns: true if scheme was successfully unregistered, or false if a
            handler for scheme does not exist.
  */
  bool unregisterUriScheme(string scheme) nothrow
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_vfs_unregister_uri_scheme(cast(GVfs*)this._cPtr, _scheme);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.vfs.Vfs]
class VfsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.vfs.Vfs]
final class VfsGidBuilder : VfsGidBuilderImpl!VfsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Vfs build() nothrow
  {
    return new Vfs(cast(void*)createGObject(Vfs._getGType), Yes.Take);
  }
}
