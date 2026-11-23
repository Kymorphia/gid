/// Module for [Vfs] class
module gid.gio2.vfs;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.file_attribute_info_list;
import gid.gio2.file_info;
import gid.gio2.types;
import gid.glib2.error;
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

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
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

  /** */
  protected void vfuncAddWritableNamespaces(gid.gio2.file_attribute_info_list.FileAttributeInfoList list)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.addWritableNamespaces)
      return;

    _klass.addWritableNamespaces(cast(GVfs*)this._cPtr, list ? cast(GFileAttributeInfoList*)list._cPtr(No.Dup) : null);
  }

  /**
      Gets a #GFile for path.
  
      Params:
        path = a string containing a VFS path.
      Returns: a #GFile.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFileForPath` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file.File vfuncGetFileForPath(string path)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.getFileForPath)
      return typeof(return).init;

    GFile* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getFileForPath(cast(GVfs*)this._cPtr, _path);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFileForUri` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file.File vfuncGetFileForUri(string uri)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.getFileForUri)
      return typeof(return).init;

    GFile* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getFileForUri(cast(GVfs*)this._cPtr, _uri);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of URI schemes supported by vfs.
      Returns: a null-terminated array of strings.
            The returned array belongs to GIO and must
            not be freed or modified.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSupportedUriSchemes` to chain up from an override.
      Overriding it from D is not supported (callback return container type 'Array' ownership 'None' is not supported).
  */
  protected string[] vfuncGetSupportedUriSchemes()
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.getSupportedUriSchemes)
      return typeof(return).init;

    const(char*)* _cretval;
    _cretval = _klass.getSupportedUriSchemes(cast(GVfs*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsActive` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncIsActive()
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.isActive)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isActive(cast(GVfs*)this._cPtr);
    return _retval;
  }

  /** */
  protected void vfuncLocalFileMoved(string source, string dest)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.localFileMoved)
      return;

    const(char)* _source = source.toCString!(No.Malloc, No.Nullable);
    const(char)* _dest = dest.toCString!(No.Malloc, No.Nullable);
    _klass.localFileMoved(cast(GVfs*)this._cPtr, _source, _dest);
  }

  /** */
  protected void vfuncLocalFileRemoved(string filename)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.localFileRemoved)
      return;

    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _klass.localFileRemoved(cast(GVfs*)this._cPtr, _filename);
  }

  /** */
  protected bool vfuncLocalFileSetAttributes(string filename, gid.gio2.file_info.FileInfo info, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.localFileSetAttributes)
      return typeof(return).init;

    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.localFileSetAttributes(cast(GVfs*)this._cPtr, _filename, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncParseName` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file.File vfuncParseName(string parseName)
  {
    auto _klass = cast(GVfsClass*)_vfuncClass;
    if (!_klass.parseName)
      return typeof(return).init;

    GFile* _cretval;
    const(char)* _parseName = parseName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.parseName(cast(GVfs*)this._cPtr, _parseName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
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
      gidAttachThread();
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
      gidAttachThread();
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Vfs
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.vfs.Vfs), T.stringof ~ " is not derived from gid.gio2.vfs.Vfs");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAddWritableNamespaces", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "add_writable_namespaces");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFileForPath", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "get_file_for_path");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFileForUri", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "get_file_for_uri");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSupportedUriSchemes", true)[0]) == gid.gio2.vfs.Vfs))
      static assert(0, "Overriding gid.gio2.vfs.Vfs.vfuncGetSupportedUriSchemes is not supported: callback return container type 'Array' ownership 'None' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsActive", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "is_active");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLocalFileMoved", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "local_file_moved");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLocalFileRemoved", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "local_file_removed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLocalFileSetAttributes", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "local_file_set_attributes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParseName", true)[0]) == gid.gio2.vfs.Vfs))
      _installVfunc(klass, "parse_name");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GVfsClass*)klass;

    switch (vfunc)
    {
      case "add_writable_namespaces":
      {
        static extern(C) void _vfuncAddWritableNamespacesTramp(GVfs* vfs, GFileAttributeInfoList* list) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.addWritableNamespaces)
              return (cast(typeof(&_vfuncAddWritableNamespacesTramp))_klass.addWritableNamespaces)(vfs, list);
            return;
          }

          auto _list = list ? new gid.gio2.file_attribute_info_list.FileAttributeInfoList(cast(void*)list, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncAddWritableNamespaces(_list);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncAddWritableNamespaces");
          }
          if (_list)
            _list._cUnborrow;

        }

        _klass.addWritableNamespaces = cast(typeof(_klass.addWritableNamespaces))&_vfuncAddWritableNamespacesTramp;
        break;
      }
      case "get_file_for_path":
      {
        static extern(C) GFile* _vfuncGetFileForPathTramp(GVfs* vfs, const(char)* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.getFileForPath)
              return (cast(typeof(&_vfuncGetFileForPathTramp))_klass.getFileForPath)(vfs, path);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetFileForPath(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncGetFileForPath");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getFileForPath = cast(typeof(_klass.getFileForPath))&_vfuncGetFileForPathTramp;
        break;
      }
      case "get_file_for_uri":
      {
        static extern(C) GFile* _vfuncGetFileForUriTramp(GVfs* vfs, const(char)* uri) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.getFileForUri)
              return (cast(typeof(&_vfuncGetFileForUriTramp))_klass.getFileForUri)(vfs, uri);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetFileForUri(_uri);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncGetFileForUri");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getFileForUri = cast(typeof(_klass.getFileForUri))&_vfuncGetFileForUriTramp;
        break;
      }
      case "is_active":
      {
        static extern(C) gboolean _vfuncIsActiveTramp(GVfs* vfs) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.isActive)
              return (cast(typeof(&_vfuncIsActiveTramp))_klass.isActive)(vfs);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsActive();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncIsActive");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isActive = cast(typeof(_klass.isActive))&_vfuncIsActiveTramp;
        break;
      }
      case "local_file_moved":
      {
        static extern(C) void _vfuncLocalFileMovedTramp(GVfs* vfs, const(char)* source, const(char)* dest) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.localFileMoved)
              return (cast(typeof(&_vfuncLocalFileMovedTramp))_klass.localFileMoved)(vfs, source, dest);
            return;
          }

          string _source = source.fromCString!(No.Free);
          string _dest = dest.fromCString!(No.Free);

          try
          {
            _obj.vfuncLocalFileMoved(_source, _dest);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncLocalFileMoved");
          }
        }

        _klass.localFileMoved = cast(typeof(_klass.localFileMoved))&_vfuncLocalFileMovedTramp;
        break;
      }
      case "local_file_removed":
      {
        static extern(C) void _vfuncLocalFileRemovedTramp(GVfs* vfs, const(char)* filename) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.localFileRemoved)
              return (cast(typeof(&_vfuncLocalFileRemovedTramp))_klass.localFileRemoved)(vfs, filename);
            return;
          }

          string _filename = filename.fromCString!(No.Free);

          try
          {
            _obj.vfuncLocalFileRemoved(_filename);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncLocalFileRemoved");
          }
        }

        _klass.localFileRemoved = cast(typeof(_klass.localFileRemoved))&_vfuncLocalFileRemovedTramp;
        break;
      }
      case "local_file_set_attributes":
      {
        static extern(C) gboolean _vfuncLocalFileSetAttributesTramp(GVfs* vfs, const(char)* filename, GFileInfo* info, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.localFileSetAttributes)
              return (cast(typeof(&_vfuncLocalFileSetAttributesTramp))_klass.localFileSetAttributes)(vfs, filename, info, flags, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _filename = filename.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLocalFileSetAttributes(_filename, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(void*)info, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.localFileSetAttributes = cast(typeof(_klass.localFileSetAttributes))&_vfuncLocalFileSetAttributesTramp;
        break;
      }
      case "parse_name":
      {
        static extern(C) GFile* _vfuncParseNameTramp(GVfs* vfs, const(char)* parseName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.vfs.Vfs)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vfs);
          if (!_obj)
          {
            auto _klass = cast(GVfsClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vfs);
            if (_klass.parseName)
              return (cast(typeof(&_vfuncParseNameTramp))_klass.parseName)(vfs, parseName);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;
          string _parseName = parseName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncParseName(_parseName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.vfs.Vfs.vfuncParseName");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.parseName = cast(typeof(_klass.parseName))&_vfuncParseNameTramp;
        break;
      }
      default:
      break;
    }
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
