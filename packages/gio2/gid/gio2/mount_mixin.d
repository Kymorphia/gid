/// Module for [Mount] interface mixin
module gid.gio2.mount_mixin;

public import gid.core.basictypes;
public import gid.gio2.mount;
public import gid.gio2.mount_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.drive;
public import gid.gio2.file;
public import gid.gio2.icon;
public import gid.gio2.mount_operation;
public import gid.gio2.types;
public import gid.gio2.volume;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The [gid.gio2.mount.Mount] interface represents a user-visible mount, such as a mounted
    file system.
    
    [gid.gio2.mount.Mount] is a ‘mounted’ filesystem that you can access. Mounted is in
    quotes because it’s not the same as a UNIX mount, it might be a GVFS
    mount, but you can still access the files on it if you use GIO.
    
    A [gid.gio2.mount.Mount] might be associated with a [gid.gio2.volume.Volume] (such as a USB flash
    drive) which hosts it.
    
    Unmounting a [gid.gio2.mount.Mount] instance is an asynchronous operation. For
    more information about asynchronous operations, see [gid.gio2.async_result.AsyncResult]
    and [gid.gio2.task.Task]. To unmount a [gid.gio2.mount.Mount] instance, first call
    [gid.gio2.mount.Mount.unmountWithOperation] with (at least) the [gid.gio2.mount.Mount]
    instance and a [gid.gio2.types.AsyncReadyCallback].  The callback will be fired
    when the operation has resolved (either with success or failure), and a
    [gid.gio2.async_result.AsyncResult] structure will be passed to the callback.  That
    callback should then call [gid.gio2.mount.Mount.unmountWithOperationFinish]
    with the [gid.gio2.mount.Mount] and the [gid.gio2.async_result.AsyncResult] data to see if the
    operation was completed successfully.  If an `error` is present when
    [gid.gio2.mount.Mount.unmountWithOperationFinish] is called, then it will be
    filled with any error information.
    
    Note, when [porting from GnomeVFS](migrating-gnome-vfs.html), [gid.gio2.mount.Mount] is the
    moral equivalent of `GnomeVFSVolume`.
*/
template MountT()
{

  /**
      Checks if mount can be ejected.
      Returns: true if the mount can be ejected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanEject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanEject()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.canEject)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canEject(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Checks if mount can be unmounted.
      Returns: true if the mount can be unmounted.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanUnmount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanUnmount()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.canUnmount)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canUnmount(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Changed signal that is emitted when the mount's state has changed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChanged()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.changed)
      return;

    _klass.changed(cast(GMount*)this._cPtr);
  }

  /**
      Ejects a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.ejectFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEject`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  
      Deprecated: Use [gid.gio2.mount.Mount.ejectWithOperation] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEject(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.eject)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.eject(cast(GMount*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.mount.Mount.ejectWithOperationFinish] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.ejectFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectFinish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ejects a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.ejectWithOperationFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectWithOperation`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEjectWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.ejectWithOperation)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.ejectWithOperation(cast(GMount*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectWithOperationFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.ejectWithOperationFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectWithOperationFinish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the default location of mount. The default location of the given
      mount is a path that reflects the main entry point for the user (e.g.
      the home directory, or the root of the volume).
      Returns: a #GFile.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDefaultLocation`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncGetDefaultLocation()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getDefaultLocation)
      return typeof(return).init;

    GFile* _cretval;
    _cretval = _klass.getDefaultLocation(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the drive for the mount.
      
      This is a convenience method for getting the #GVolume and then
      using that object to get the #GDrive.
      Returns: a #GDrive or null if mount is not
             associated with a volume or a drive.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDrive`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.drive.Drive vfuncGetDrive()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getDrive)
      return typeof(return).init;

    GDrive* _cretval;
    _cretval = _klass.getDrive(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(GDrive*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetIcon()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getIcon(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of mount.
      Returns: the name for the given mount.
            The returned string should be freed with [gid.glib2.global.gfree]
            when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getName(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the root directory on mount.
      Returns: a #GFile.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRoot`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncGetRoot()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getRoot)
      return typeof(return).init;

    GFile* _cretval;
    _cretval = _klass.getRoot(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the sort key for mount, if any.
      Returns: Sorting key for mount or null if no such key is available.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSortKey`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetSortKey()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getSortKey)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getSortKey(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the symbolic icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSymbolicIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetSymbolicIcon()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getSymbolicIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getSymbolicIcon(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the UUID for the mount. The reference is typically based on
      the file system UUID for the mount in question and should be
      considered an opaque string. Returns null if there is no UUID
      available.
      Returns: the UUID for mount or null if no UUID
            can be computed.
            The returned string should be freed with [gid.glib2.global.gfree]
            when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUuid`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetUuid()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getUuid)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getUuid(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the volume for the mount.
      Returns: a #GVolume or null if mount is not
             associated with a volume.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetVolume`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.volume.Volume vfuncGetVolume()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.getVolume)
      return typeof(return).init;

    GVolume* _cretval;
    _cretval = _klass.getVolume(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to guess the type of content stored on mount. Returns one or
      more textual identifiers of well-known content types (typically
      prefixed with "x-content/"), e.g. x-content/image-dcf for camera
      memory cards. See the
      [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
      specification for more on x-content types.
      
      This is an asynchronous operation (see
      [gid.gio2.mount.Mount.guessContentTypeSync] for the synchronous version), and
      is finished by calling [gid.gio2.mount.Mount.guessContentTypeFinish] with the
      mount and #GAsyncResult data returned in the callback.
  
      Params:
        forceRescan = Whether to force a rescan of the content.
              Otherwise a cached result will be used if available
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGuessContentType`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGuessContentType(bool forceRescan, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.guessContentType)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.guessContentType(cast(GMount*)this._cPtr, forceRescan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes guessing content types of mount. If any errors occurred
      during the operation, error will be set to contain the errors and
      false will be returned. In particular, you may get an
      [gid.gio2.types.IOErrorEnum.NotSupported] if the mount does not support content
      guessing.
  
      Params:
        result = a #GAsyncResult
      Returns: a null-terminated array of content types or null on error.
            Caller should free this array with [gid.glib2.global.strfreev] when done with it.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGuessContentTypeFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncGuessContentTypeFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.guessContentTypeFinish)
      return typeof(return).init;

    char** _cretval;
    GError *_err;
    _cretval = _klass.guessContentTypeFinish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Tries to guess the type of content stored on mount. Returns one or
      more textual identifiers of well-known content types (typically
      prefixed with "x-content/"), e.g. x-content/image-dcf for camera
      memory cards. See the
      [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
      specification for more on x-content types.
      
      This is a synchronous operation and as such may block doing IO;
      see [gid.gio2.mount.Mount.guessContentType] for the asynchronous version.
  
      Params:
        forceRescan = Whether to force a rescan of the content.
              Otherwise a cached result will be used if available
        cancellable = optional #GCancellable object, null to ignore
      Returns: a null-terminated array of content types or null on error.
            Caller should free this array with [gid.glib2.global.strfreev] when done with it.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGuessContentTypeSync`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncGuessContentTypeSync(bool forceRescan, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.guessContentTypeSync)
      return typeof(return).init;

    char** _cretval;
    GError *_err;
    _cretval = _klass.guessContentTypeSync(cast(GMount*)this._cPtr, forceRescan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      The ::pre-unmount signal that is emitted when the #GMount will soon be emitted. If the recipient is somehow holding the mount open by keeping an open file on it it should close the file.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPreUnmount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPreUnmount()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.preUnmount)
      return;

    _klass.preUnmount(cast(GMount*)this._cPtr);
  }

  /**
      Remounts a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.remountFinish] with the mount
      and #GAsyncResults data returned in the callback.
      
      Remounting is useful when some setting affecting the operation
      of the volume has been changed, as these may need a remount to
      take affect. While this is semantically equivalent with unmounting
      and then remounting not all backends might need to actually be
      unmounted.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemount`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemount(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.remount)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.remount(cast(GMount*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes remounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully remounted. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemountFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRemountFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.remountFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.remountFinish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.unmountFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmount`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  
      Deprecated: Use [gid.gio2.mount.Mount.unmountWithOperation] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnmount(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.unmount)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.unmount(cast(GMount*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes unmounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully unmounted. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.mount.Mount.unmountWithOperationFinish] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnmountFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.unmountFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.unmountFinish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.unmountWithOperationFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountWithOperation`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnmountWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.unmountWithOperation)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.unmountWithOperation(cast(GMount*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes unmounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully unmounted. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountWithOperationFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnmountWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.unmountWithOperationFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.unmountWithOperationFinish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      The unmounted signal that is emitted when the #GMount have been unmounted. If the recipient is holding references to the object they should release them so the object can be finalized.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmounted`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnmounted()
  {
    auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.mount.Mount._getGType);
    if (!_klass || !_klass.unmounted)
      return;

    _klass.unmounted(cast(GMount*)this._cPtr);
  }

  /**
      Checks if mount can be ejected.
      Returns: true if the mount can be ejected.
  */
  override bool canEject() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mount_can_eject(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Checks if mount can be unmounted.
      Returns: true if the mount can be unmounted.
  */
  override bool canUnmount() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mount_can_unmount(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Ejects a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.ejectFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Deprecated: Use [gid.gio2.mount.Mount.ejectWithOperation] instead.
  */
  override void eject(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_eject(cast(GMount*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.mount.Mount.ejectWithOperationFinish] instead.
  */
  override bool ejectFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_eject_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ejects a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.ejectWithOperationFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void ejectWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_eject_with_operation(cast(GMount*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool ejectWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_eject_with_operation_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the default location of mount. The default location of the given
      mount is a path that reflects the main entry point for the user (e.g.
      the home directory, or the root of the volume).
      Returns: a #GFile.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.file.File getDefaultLocation() nothrow
  {
    GFile* _cretval;
    _cretval = g_mount_get_default_location(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the drive for the mount.
      
      This is a convenience method for getting the #GVolume and then
      using that object to get the #GDrive.
      Returns: a #GDrive or null if mount is not
             associated with a volume or a drive.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.drive.Drive getDrive() nothrow
  {
    GDrive* _cretval;
    _cretval = g_mount_get_drive(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(GDrive*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_mount_get_icon(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of mount.
      Returns: the name for the given mount.
            The returned string should be freed with [gid.glib2.global.gfree]
            when no longer needed.
  */
  override string getName() nothrow
  {
    char* _cretval;
    _cretval = g_mount_get_name(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the root directory on mount.
      Returns: a #GFile.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.file.File getRoot() nothrow
  {
    GFile* _cretval;
    _cretval = g_mount_get_root(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the sort key for mount, if any.
      Returns: Sorting key for mount or null if no such key is available.
  */
  override string getSortKey() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mount_get_sort_key(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the symbolic icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.icon.Icon getSymbolicIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_mount_get_symbolic_icon(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the UUID for the mount. The reference is typically based on
      the file system UUID for the mount in question and should be
      considered an opaque string. Returns null if there is no UUID
      available.
      Returns: the UUID for mount or null if no UUID
            can be computed.
            The returned string should be freed with [gid.glib2.global.gfree]
            when no longer needed.
  */
  override string getUuid() nothrow
  {
    char* _cretval;
    _cretval = g_mount_get_uuid(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the volume for the mount.
      Returns: a #GVolume or null if mount is not
             associated with a volume.
             The returned object should be unreffed with
             [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.volume.Volume getVolume() nothrow
  {
    GVolume* _cretval;
    _cretval = g_mount_get_volume(cast(GMount*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to guess the type of content stored on mount. Returns one or
      more textual identifiers of well-known content types (typically
      prefixed with "x-content/"), e.g. x-content/image-dcf for camera
      memory cards. See the
      [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
      specification for more on x-content types.
      
      This is an asynchronous operation (see
      [gid.gio2.mount.Mount.guessContentTypeSync] for the synchronous version), and
      is finished by calling [gid.gio2.mount.Mount.guessContentTypeFinish] with the
      mount and #GAsyncResult data returned in the callback.
  
      Params:
        forceRescan = Whether to force a rescan of the content.
              Otherwise a cached result will be used if available
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
  */
  override void guessContentType(bool forceRescan, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_guess_content_type(cast(GMount*)this._cPtr, forceRescan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes guessing content types of mount. If any errors occurred
      during the operation, error will be set to contain the errors and
      false will be returned. In particular, you may get an
      [gid.gio2.types.IOErrorEnum.NotSupported] if the mount does not support content
      guessing.
  
      Params:
        result = a #GAsyncResult
      Returns: a null-terminated array of content types or null on error.
            Caller should free this array with [gid.glib2.global.strfreev] when done with it.
      Throws: [ErrorWrap]
  */
  override string[] guessContentTypeFinish(gid.gio2.async_result.AsyncResult result)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_mount_guess_content_type_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Tries to guess the type of content stored on mount. Returns one or
      more textual identifiers of well-known content types (typically
      prefixed with "x-content/"), e.g. x-content/image-dcf for camera
      memory cards. See the
      [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
      specification for more on x-content types.
      
      This is a synchronous operation and as such may block doing IO;
      see [gid.gio2.mount.Mount.guessContentType] for the asynchronous version.
  
      Params:
        forceRescan = Whether to force a rescan of the content.
              Otherwise a cached result will be used if available
        cancellable = optional #GCancellable object, null to ignore
      Returns: a null-terminated array of content types or null on error.
            Caller should free this array with [gid.glib2.global.strfreev] when done with it.
      Throws: [ErrorWrap]
  */
  override string[] guessContentTypeSync(bool forceRescan, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_mount_guess_content_type_sync(cast(GMount*)this._cPtr, forceRescan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Determines if mount is shadowed. Applications or libraries should
      avoid displaying mount in the user interface if it is shadowed.
      
      A mount is said to be shadowed if there exists one or more user
      visible objects (currently #GMount objects) with a root that is
      inside the root of mount.
      
      One application of shadow mounts is when exposing a single file
      system that is used to address several logical volumes. In this
      situation, a #GVolumeMonitor implementation would create two
      #GVolume objects (for example, one for the camera functionality of
      the device and one for a SD card reader on the device) with
      activation URIs `gphoto2://[usb:001,002]/store1/`
      and `gphoto2://[usb:001,002]/store2/`. When the
      underlying mount (with root
      `gphoto2://[usb:001,002]/`) is mounted, said
      #GVolumeMonitor implementation would create two #GMount objects
      (each with their root matching the corresponding volume activation
      root) that would shadow the original mount.
      
      The proxy monitor in GVfs 2.26 and later, automatically creates and
      manage shadow mounts (and shadows the underlying mount) if the
      activation root on a #GVolume is set.
      Returns: true if mount is shadowed.
  */
  override bool isShadowed() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mount_is_shadowed(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Remounts a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.remountFinish] with the mount
      and #GAsyncResults data returned in the callback.
      
      Remounting is useful when some setting affecting the operation
      of the volume has been changed, as these may need a remount to
      take affect. While this is semantically equivalent with unmounting
      and then remounting not all backends might need to actually be
      unmounted.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void remount(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_remount(cast(GMount*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes remounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully remounted. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool remountFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_remount_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Increments the shadow count on mount. Usually used by
      #GVolumeMonitor implementations when creating a shadow mount for
      mount, see [gid.gio2.mount.Mount.isShadowed] for more information. The caller
      will need to emit the #GMount::changed signal on mount manually.
  */
  override void shadow() nothrow
  {
    g_mount_shadow(cast(GMount*)this._cPtr);
  }

  /**
      Unmounts a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.unmountFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Deprecated: Use [gid.gio2.mount.Mount.unmountWithOperation] instead.
  */
  override void unmount(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_unmount(cast(GMount*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes unmounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully unmounted. false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.mount.Mount.unmountWithOperationFinish] instead.
  */
  override bool unmountFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_unmount_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a mount. This is an asynchronous operation, and is
      finished by calling [gid.gio2.mount.Mount.unmountWithOperationFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void unmountWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_unmount_with_operation(cast(GMount*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes unmounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully unmounted. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool unmountWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_unmount_with_operation_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Decrements the shadow count on mount. Usually used by
      #GVolumeMonitor implementations when destroying a shadow mount for
      mount, see [gid.gio2.mount.Mount.isShadowed] for more information. The caller
      will need to emit the #GMount::changed signal on mount manually.
  */
  override void unshadow() nothrow
  {
    g_mount_unshadow(cast(GMount*)this._cPtr);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the mount has been changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount)`
  
          `mount` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `PreUnmount` signal.
  
      This signal may be emitted when the #GMount is about to be
        unmounted.
        
        This signal depends on the backend and is only emitted if
        GIO was used to unmount.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount)`
  
          `mount` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreUnmount(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.preUnmount");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pre-unmount", closure, after);
  }

  /**
      Connect to `Unmounted` signal.
  
      This signal is emitted when the #GMount have been
        unmounted. If the recipient is holding references to the
        object they should release them so the object can be
        finalized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount)`
  
          `mount` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnmounted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.unmounted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmounted", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.mount.Mount (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_mount_Mount(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanEject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanUnmount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultLocation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDrive", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRoot", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortKey", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSymbolicIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUuid", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVolume", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGuessContentType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGuessContentTypeFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGuessContentTypeSync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPreUnmount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmounted", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.mount.Mount vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_mount_Mount(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanEject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "can_eject");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanUnmount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "can_unmount");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncEject is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "eject_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncEjectWithOperation is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "eject_with_operation_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultLocation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_default_location");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDrive", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_drive");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRoot", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_root");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortKey", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncGetSortKey is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSymbolicIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_symbolic_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUuid", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_uuid");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVolume", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "get_volume");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGuessContentType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncGuessContentType is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGuessContentTypeFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "guess_content_type_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGuessContentTypeSync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "guess_content_type_sync");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPreUnmount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "pre_unmount");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncRemount is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "remount_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncUnmount is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "unmount_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.mount.Mount.vfuncUnmountWithOperation is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "unmount_with_operation_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmounted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_mount_Mount(iface, "unmounted");
  }

  private static void _installIfaceVfunc_gid_gio2_mount_Mount(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GMountIface*)iface;

    switch (vfunc)
    {
      case "can_eject":
      {
        static extern(C) gboolean _vfuncCanEjectTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.canEject)
              return (cast(typeof(&_vfuncCanEjectTramp))_klass.canEject)(mount);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanEject();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncCanEject");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canEject = cast(typeof(_klass.canEject))&_vfuncCanEjectTramp;
        break;
      }
      case "can_unmount":
      {
        static extern(C) gboolean _vfuncCanUnmountTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.canUnmount)
              return (cast(typeof(&_vfuncCanUnmountTramp))_klass.canUnmount)(mount);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanUnmount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncCanUnmount");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canUnmount = cast(typeof(_klass.canUnmount))&_vfuncCanUnmountTramp;
        break;
      }
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(mount);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "eject_finish":
      {
        static extern(C) gboolean _vfuncEjectFinishTramp(GMount* mount, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.ejectFinish)
              return (cast(typeof(&_vfuncEjectFinishTramp))_klass.ejectFinish)(mount, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEjectFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.ejectFinish = cast(typeof(_klass.ejectFinish))&_vfuncEjectFinishTramp;
        break;
      }
      case "eject_with_operation_finish":
      {
        static extern(C) gboolean _vfuncEjectWithOperationFinishTramp(GMount* mount, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.ejectWithOperationFinish)
              return (cast(typeof(&_vfuncEjectWithOperationFinishTramp))_klass.ejectWithOperationFinish)(mount, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEjectWithOperationFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.ejectWithOperationFinish = cast(typeof(_klass.ejectWithOperationFinish))&_vfuncEjectWithOperationFinishTramp;
        break;
      }
      case "get_default_location":
      {
        static extern(C) GFile* _vfuncGetDefaultLocationTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getDefaultLocation)
              return (cast(typeof(&_vfuncGetDefaultLocationTramp))_klass.getDefaultLocation)(mount);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncGetDefaultLocation();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetDefaultLocation");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getDefaultLocation = cast(typeof(_klass.getDefaultLocation))&_vfuncGetDefaultLocationTramp;
        break;
      }
      case "get_drive":
      {
        static extern(C) GDrive* _vfuncGetDriveTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getDrive)
              return (cast(typeof(&_vfuncGetDriveTramp))_klass.getDrive)(mount);
            return typeof(return).init;
          }

          gid.gio2.drive.Drive _dretval;

          try
          {
            _dretval = _obj.vfuncGetDrive();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetDrive");
          }
          auto _retval = _dretval ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getDrive = cast(typeof(_klass.getDrive))&_vfuncGetDriveTramp;
        break;
      }
      case "get_icon":
      {
        static extern(C) GIcon* _vfuncGetIconTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getIcon)
              return (cast(typeof(&_vfuncGetIconTramp))_klass.getIcon)(mount);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getIcon = cast(typeof(_klass.getIcon))&_vfuncGetIconTramp;
        break;
      }
      case "get_name":
      {
        static extern(C) char* _vfuncGetNameTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getName)
              return (cast(typeof(&_vfuncGetNameTramp))_klass.getName)(mount);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetName();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetName");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getName = cast(typeof(_klass.getName))&_vfuncGetNameTramp;
        break;
      }
      case "get_root":
      {
        static extern(C) GFile* _vfuncGetRootTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getRoot)
              return (cast(typeof(&_vfuncGetRootTramp))_klass.getRoot)(mount);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncGetRoot();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetRoot");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getRoot = cast(typeof(_klass.getRoot))&_vfuncGetRootTramp;
        break;
      }
      case "get_symbolic_icon":
      {
        static extern(C) GIcon* _vfuncGetSymbolicIconTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getSymbolicIcon)
              return (cast(typeof(&_vfuncGetSymbolicIconTramp))_klass.getSymbolicIcon)(mount);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetSymbolicIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetSymbolicIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getSymbolicIcon = cast(typeof(_klass.getSymbolicIcon))&_vfuncGetSymbolicIconTramp;
        break;
      }
      case "get_uuid":
      {
        static extern(C) char* _vfuncGetUuidTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getUuid)
              return (cast(typeof(&_vfuncGetUuidTramp))_klass.getUuid)(mount);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetUuid();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetUuid");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getUuid = cast(typeof(_klass.getUuid))&_vfuncGetUuidTramp;
        break;
      }
      case "get_volume":
      {
        static extern(C) GVolume* _vfuncGetVolumeTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.getVolume)
              return (cast(typeof(&_vfuncGetVolumeTramp))_klass.getVolume)(mount);
            return typeof(return).init;
          }

          gid.gio2.volume.Volume _dretval;

          try
          {
            _dretval = _obj.vfuncGetVolume();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncGetVolume");
          }
          auto _retval = _dretval ? cast(GVolume*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getVolume = cast(typeof(_klass.getVolume))&_vfuncGetVolumeTramp;
        break;
      }
      case "guess_content_type_finish":
      {
        static extern(C) char** _vfuncGuessContentTypeFinishTramp(GMount* mount, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.guessContentTypeFinish)
              return (cast(typeof(&_vfuncGuessContentTypeFinishTramp))_klass.guessContentTypeFinish)(mount, result, _err);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncGuessContentTypeFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.guessContentTypeFinish = cast(typeof(_klass.guessContentTypeFinish))&_vfuncGuessContentTypeFinishTramp;
        break;
      }
      case "guess_content_type_sync":
      {
        static extern(C) char** _vfuncGuessContentTypeSyncTramp(GMount* mount, gboolean forceRescan, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.guessContentTypeSync)
              return (cast(typeof(&_vfuncGuessContentTypeSyncTramp))_klass.guessContentTypeSync)(mount, forceRescan, cancellable, _err);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncGuessContentTypeSync(cast(bool)forceRescan, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.guessContentTypeSync = cast(typeof(_klass.guessContentTypeSync))&_vfuncGuessContentTypeSyncTramp;
        break;
      }
      case "pre_unmount":
      {
        static extern(C) void _vfuncPreUnmountTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.preUnmount)
              return (cast(typeof(&_vfuncPreUnmountTramp))_klass.preUnmount)(mount);
            return;
          }

          try
          {
            _obj.vfuncPreUnmount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncPreUnmount");
          }
        }

        _klass.preUnmount = cast(typeof(_klass.preUnmount))&_vfuncPreUnmountTramp;
        break;
      }
      case "remount_finish":
      {
        static extern(C) gboolean _vfuncRemountFinishTramp(GMount* mount, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.remountFinish)
              return (cast(typeof(&_vfuncRemountFinishTramp))_klass.remountFinish)(mount, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRemountFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.remountFinish = cast(typeof(_klass.remountFinish))&_vfuncRemountFinishTramp;
        break;
      }
      case "unmount_finish":
      {
        static extern(C) gboolean _vfuncUnmountFinishTramp(GMount* mount, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.unmountFinish)
              return (cast(typeof(&_vfuncUnmountFinishTramp))_klass.unmountFinish)(mount, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnmountFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unmountFinish = cast(typeof(_klass.unmountFinish))&_vfuncUnmountFinishTramp;
        break;
      }
      case "unmount_with_operation_finish":
      {
        static extern(C) gboolean _vfuncUnmountWithOperationFinishTramp(GMount* mount, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.unmountWithOperationFinish)
              return (cast(typeof(&_vfuncUnmountWithOperationFinishTramp))_klass.unmountWithOperationFinish)(mount, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnmountWithOperationFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unmountWithOperationFinish = cast(typeof(_klass.unmountWithOperationFinish))&_vfuncUnmountWithOperationFinishTramp;
        break;
      }
      case "unmounted":
      {
        static extern(C) void _vfuncUnmountedTramp(GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)mount);
          if (!_obj)
          {
            auto _klass = cast(GMountIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mount), gid.gio2.mount.Mount._getGType);
            if (_klass && _klass.unmounted)
              return (cast(typeof(&_vfuncUnmountedTramp))_klass.unmounted)(mount);
            return;
          }

          try
          {
            _obj.vfuncUnmounted();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount.Mount.vfuncUnmounted");
          }
        }

        _klass.unmounted = cast(typeof(_klass.unmounted))&_vfuncUnmountedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.mount.Mount]
template MountGidBuilderT()
{
}
