/// Module for [Mount] interface mixin
module gio.mount_mixin;

public import gio.mount_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.drive;
public import gio.file;
public import gio.icon;
public import gio.mount_operation;
public import gio.types;
public import gio.volume;
public import glib.error;
public import gobject.dclosure;
public import gobject.object;

/**
    The [gio.mount.Mount] interface represents user-visible mounts. Note, when
    [porting from GnomeVFS](migrating-gnome-vfs.html), [gio.mount.Mount] is the moral
    equivalent of `GnomeVFSVolume`.
    
    [gio.mount.Mount] is a ‘mounted’ filesystem that you can access. Mounted is in
    quotes because it’s not the same as a UNIX mount, it might be a GVFS
    mount, but you can still access the files on it if you use GIO. Might or
    might not be related to a volume object.
    
    Unmounting a [gio.mount.Mount] instance is an asynchronous operation. For
    more information about asynchronous operations, see [gio.async_result.AsyncResult]
    and [gio.task.Task]. To unmount a [gio.mount.Mount] instance, first call
    [gio.mount.Mount.unmountWithOperation] with (at least) the [gio.mount.Mount]
    instance and a [gio.types.AsyncReadyCallback].  The callback will be fired
    when the operation has resolved (either with success or failure), and a
    [gio.async_result.AsyncResult] structure will be passed to the callback.  That
    callback should then call [gio.mount.Mount.unmountWithOperationFinish]
    with the [gio.mount.Mount] and the [gio.async_result.AsyncResult] data to see if the
    operation was completed successfully.  If an `error` is present when
    [gio.mount.Mount.unmountWithOperationFinish] is called, then it will be
    filled with any error information.
*/
template MountT()
{

  /**
      Checks if mount can be ejected.
      Returns: true if the mount can be ejected.
  */
  override bool canEject()
  {
    bool _retval;
    _retval = cast(bool)g_mount_can_eject(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Checks if mount can be unmounted.
      Returns: true if the mount can be unmounted.
  */
  override bool canUnmount()
  {
    bool _retval;
    _retval = cast(bool)g_mount_can_unmount(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Ejects a mount. This is an asynchronous operation, and is
      finished by calling [gio.mount.Mount.ejectFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Deprecated: Use [gio.mount.Mount.ejectWithOperation] instead.
  */
  override void eject(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
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
  
      Deprecated: Use [gio.mount.Mount.ejectWithOperationFinish] instead.
  */
  override bool ejectFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_eject_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Ejects a mount. This is an asynchronous operation, and is
      finished by calling [gio.mount.Mount.ejectWithOperationFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void ejectWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
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
  override bool ejectWithOperationFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_eject_with_operation_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the default location of mount. The default location of the given
      mount is a path that reflects the main entry point for the user (e.g.
      the home directory, or the root of the volume).
      Returns: a #GFile.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.file.File getDefaultLocation()
  {
    GFile* _cretval;
    _cretval = g_mount_get_default_location(cast(GMount*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the drive for the mount.
      
      This is a convenience method for getting the #GVolume and then
      using that object to get the #GDrive.
      Returns: a #GDrive or null if mount is not
             associated with a volume or a drive.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.drive.Drive getDrive()
  {
    GDrive* _cretval;
    _cretval = g_mount_get_drive(cast(GMount*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.drive.Drive)(cast(GDrive*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_mount_get_icon(cast(GMount*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of mount.
      Returns: the name for the given mount.
            The returned string should be freed with [glib.global.gfree]
            when no longer needed.
  */
  override string getName()
  {
    char* _cretval;
    _cretval = g_mount_get_name(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the root directory on mount.
      Returns: a #GFile.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.file.File getRoot()
  {
    GFile* _cretval;
    _cretval = g_mount_get_root(cast(GMount*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the sort key for mount, if any.
      Returns: Sorting key for mount or null if no such key is available.
  */
  override string getSortKey()
  {
    const(char)* _cretval;
    _cretval = g_mount_get_sort_key(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the symbolic icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.icon.Icon getSymbolicIcon()
  {
    GIcon* _cretval;
    _cretval = g_mount_get_symbolic_icon(cast(GMount*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the UUID for the mount. The reference is typically based on
      the file system UUID for the mount in question and should be
      considered an opaque string. Returns null if there is no UUID
      available.
      Returns: the UUID for mount or null if no UUID
            can be computed.
            The returned string should be freed with [glib.global.gfree]
            when no longer needed.
  */
  override string getUuid()
  {
    char* _cretval;
    _cretval = g_mount_get_uuid(cast(GMount*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the volume for the mount.
      Returns: a #GVolume or null if mount is not
             associated with a volume.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.volume.Volume getVolume()
  {
    GVolume* _cretval;
    _cretval = g_mount_get_volume(cast(GMount*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
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
      [gio.mount.Mount.guessContentTypeSync] for the synchronous version), and
      is finished by calling [gio.mount.Mount.guessContentTypeFinish] with the
      mount and #GAsyncResult data returned in the callback.
  
      Params:
        forceRescan = Whether to force a rescan of the content.
              Otherwise a cached result will be used if available
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
  */
  override void guessContentType(bool forceRescan, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_mount_guess_content_type(cast(GMount*)this._cPtr, forceRescan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes guessing content types of mount. If any errors occurred
      during the operation, error will be set to contain the errors and
      false will be returned. In particular, you may get an
      [gio.types.IOErrorEnum.NotSupported] if the mount does not support content
      guessing.
  
      Params:
        result = a #GAsyncResult
      Returns: a null-terminated array of content types or null on error.
            Caller should free this array with [glib.global.strfreev] when done with it.
      Throws: [ErrorWrap]
  */
  override string[] guessContentTypeFinish(gio.async_result.AsyncResult result)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_mount_guess_content_type_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
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
      see [gio.mount.Mount.guessContentType] for the asynchronous version.
  
      Params:
        forceRescan = Whether to force a rescan of the content.
              Otherwise a cached result will be used if available
        cancellable = optional #GCancellable object, null to ignore
      Returns: a null-terminated array of content types or null on error.
            Caller should free this array with [glib.global.strfreev] when done with it.
      Throws: [ErrorWrap]
  */
  override string[] guessContentTypeSync(bool forceRescan, gio.cancellable.Cancellable cancellable = null)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_mount_guess_content_type_sync(cast(GMount*)this._cPtr, forceRescan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
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
  override bool isShadowed()
  {
    bool _retval;
    _retval = cast(bool)g_mount_is_shadowed(cast(GMount*)this._cPtr);
    return _retval;
  }

  /**
      Remounts a mount. This is an asynchronous operation, and is
      finished by calling [gio.mount.Mount.remountFinish] with the mount
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
  override void remount(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
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
  override bool remountFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_remount_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Increments the shadow count on mount. Usually used by
      #GVolumeMonitor implementations when creating a shadow mount for
      mount, see [gio.mount.Mount.isShadowed] for more information. The caller
      will need to emit the #GMount::changed signal on mount manually.
  */
  override void shadow()
  {
    g_mount_shadow(cast(GMount*)this._cPtr);
  }

  /**
      Unmounts a mount. This is an asynchronous operation, and is
      finished by calling [gio.mount.Mount.unmountFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Deprecated: Use [gio.mount.Mount.unmountWithOperation] instead.
  */
  override void unmount(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
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
  
      Deprecated: Use [gio.mount.Mount.unmountWithOperationFinish] instead.
  */
  override bool unmountFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_unmount_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Unmounts a mount. This is an asynchronous operation, and is
      finished by calling [gio.mount.Mount.unmountWithOperationFinish] with the mount
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void unmountWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
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
  override bool unmountWithOperationFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_mount_unmount_with_operation_finish(cast(GMount*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Decrements the shadow count on mount. Usually used by
      #GVolumeMonitor implementations when destroying a shadow mount for
      mount, see [gio.mount.Mount.isShadowed] for more information. The caller
      will need to emit the #GMount::changed signal on mount manually.
  */
  override void unshadow()
  {
    g_mount_unshadow(cast(GMount*)this._cPtr);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the mount has been changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.mount.Mount mount))
  
          `mount` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.mount.Mount)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gio.mount.Mount mount))
  
          `mount` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreUnmount(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.mount.Mount)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gio.mount.Mount mount))
  
          `mount` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnmounted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.mount.Mount)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmounted", closure, after);
  }
}
