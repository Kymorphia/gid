/// Module for [Mount] interface mixin
module gid.gio2.mount_mixin;

public import gid.core.basictypes;
public import gid.gio2.mount_iface_proxy;
public import gid.core.gid;
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
}

/// Fluent builder implementation template for [gid.gio2.mount.Mount]
template MountGidBuilderT()
{
}
