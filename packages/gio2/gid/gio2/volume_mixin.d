/// Module for [Volume] interface mixin
module gid.gio2.volume_mixin;

public import gid.core.basictypes;
public import gid.gio2.volume_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.drive;
public import gid.gio2.file;
public import gid.gio2.icon;
public import gid.gio2.mount;
public import gid.gio2.mount_operation;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The [gid.gio2.volume.Volume] interface represents user-visible objects that can be
    mounted. For example, a file system partition on a USB flash drive, or an
    optical disc inserted into a disc drive.
    
    If a [gid.gio2.volume.Volume] is currently mounted, the corresponding [gid.gio2.mount.Mount] can
    be retrieved using [gid.gio2.volume.Volume.getMount].
    
    Mounting a [gid.gio2.volume.Volume] instance is an asynchronous operation. For more
    information about asynchronous operations, see [gid.gio2.async_result.AsyncResult] and
    [gid.gio2.task.Task]. To mount a [gid.gio2.volume.Volume], first call [gid.gio2.volume.Volume.mount]
    with (at least) the [gid.gio2.volume.Volume] instance, optionally a
    [gid.gio2.mount_operation.MountOperation] object and a [gid.gio2.types.AsyncReadyCallback].
    
    Typically, one will only want to pass `NULL` for the
    [gid.gio2.mount_operation.MountOperation] if automounting all volumes when a desktop session
    starts since it’s not desirable to put up a lot of dialogs asking
    for credentials.
    
    The callback will be fired when the operation has resolved (either
    with success or failure), and a [gid.gio2.async_result.AsyncResult] instance will be
    passed to the callback.  That callback should then call
    [gid.gio2.volume.Volume.mountFinish] with the [gid.gio2.volume.Volume] instance and the
    [gid.gio2.async_result.AsyncResult] data to see if the operation was completed
    successfully.  If a [gid.glib2.error.ErrorWrap] is present when
    [gid.gio2.volume.Volume.mountFinish] is called, then it will be filled with any
    error information.
    
    Note, when [porting from GnomeVFS](migrating-gnome-vfs.html),
    [gid.gio2.volume.Volume] is the moral equivalent of `GnomeVFSDrive`.
    
    ## Volume Identifiers
    
    It is sometimes necessary to directly access the underlying
    operating system object behind a volume (e.g. for passing a volume
    to an application via the command line). For this purpose, GIO
    allows to obtain an ‘identifier’ for the volume. There can be
    different kinds of identifiers, such as Hal UDIs, filesystem labels,
    traditional Unix devices (e.g. `/dev/sda2`), UUIDs. GIO uses predefined
    strings as names for the different kinds of identifiers:
    [gid.gio2.types.VOLUME_IDENTIFIER_KIND_UUID], [gid.gio2.types.VOLUME_IDENTIFIER_KIND_LABEL], etc.
    Use [gid.gio2.volume.Volume.getIdentifier] to obtain an identifier for a volume.
    
    Note that [gid.gio2.types.VOLUME_IDENTIFIER_KIND_HAL_UDI] will only be available
    when the GVFS hal volume monitor is in use. Other volume monitors
    will generally be able to provide the [gid.gio2.types.VOLUME_IDENTIFIER_KIND_UNIX_DEVICE]
    identifier, which can be used to obtain a hal device by means of
    `libhal_manager_find_device_string_match()`.
*/
template VolumeT()
{

  /**
      Checks if a volume can be ejected.
      Returns: true if the volume can be ejected. false otherwise
  */
  override bool canEject() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_volume_can_eject(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a volume can be mounted.
      Returns: true if the volume can be mounted. false otherwise
  */
  override bool canMount() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_volume_can_mount(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Ejects a volume. This is an asynchronous operation, and is
      finished by calling [gid.gio2.volume.Volume.ejectFinish] with the volume
      and #GAsyncResult returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
  
      Deprecated: Use [gid.gio2.volume.Volume.ejectWithOperation] instead.
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
    g_volume_eject(cast(GVolume*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true, false if operation failed
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.volume.Volume.ejectWithOperationFinish] instead.
  */
  override bool ejectFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_volume_eject_finish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ejects a volume. This is an asynchronous operation, and is
      finished by calling [gid.gio2.volume.Volume.ejectWithOperationFinish] with the volume
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        mountOperation = a #GMountOperation or null to
              avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
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
    g_volume_eject_with_operation(cast(GVolume*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true if the volume was successfully ejected. false otherwise
      Throws: [ErrorWrap]
  */
  override bool ejectWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_volume_eject_with_operation_finish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the kinds of [identifiers](#volume-identifiers) that volume has.
      Use [gid.gio2.volume.Volume.getIdentifier] to obtain the identifiers themselves.
      Returns: a null-terminated array
          of strings containing kinds of identifiers. Use [gid.glib2.global.strfreev] to free.
  */
  override string[] enumerateIdentifiers() nothrow
  {
    char** _cretval;
    _cretval = g_volume_enumerate_identifiers(cast(GVolume*)this._cPtr);
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
      Gets the activation root for a #GVolume if it is known ahead of
      mount time. Returns null otherwise. If not null and if volume
      is mounted, then the result of [gid.gio2.mount.Mount.getRoot] on the
      #GMount object obtained from [gid.gio2.volume.Volume.getMount] will always
      either be equal or a prefix of what this function returns. In
      other words, in code
      
      ```c
        GMount *mount;
        GFile *mount_root
        GFile *volume_activation_root;
      
        mount = g_volume_get_mount (volume); // mounted, so never NULL
        mount_root = g_mount_get_root (mount);
        volume_activation_root = g_volume_get_activation_root (volume); // assume not NULL
      ```
      then the expression
      ```c
        (g_file_has_prefix (volume_activation_root, mount_root) ||
         g_file_equal (volume_activation_root, mount_root))
      ```
      will always be true.
      
      Activation roots are typically used in #GVolumeMonitor
      implementations to find the underlying mount to shadow, see
      [gid.gio2.mount.Mount.isShadowed] for more details.
      Returns: the activation root of volume
            or null. Use [gid.gobject2.object.ObjectWrap.unref] to free.
  */
  override gid.gio2.file.File getActivationRoot() nothrow
  {
    GFile* _cretval;
    _cretval = g_volume_get_activation_root(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the drive for the volume.
      Returns: a #GDrive or null if volume is not
            associated with a drive. The returned object should be unreffed
            with [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  */
  override gid.gio2.drive.Drive getDrive() nothrow
  {
    GDrive* _cretval;
    _cretval = g_volume_get_drive(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(GDrive*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gid.gobject2.object.ObjectWrap.unref]
            when no longer needed.
  */
  override gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_volume_get_icon(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the identifier of the given kind for volume.
      See the [introduction](#volume-identifiers) for more
      information about volume identifiers.
  
      Params:
        kind = the kind of identifier to return
      Returns: a newly allocated string containing the
            requested identifier, or null if the #GVolume
            doesn't have this kind of identifier
  */
  override string getIdentifier(string kind) nothrow
  {
    char* _cretval;
    const(char)* _kind = kind.toCString!(No.Malloc, No.Nullable);
    _cretval = g_volume_get_identifier(cast(GVolume*)this._cPtr, _kind);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the mount for the volume.
      Returns: a #GMount or null if volume isn't mounted.
            The returned object should be unreffed with [gid.gobject2.object.ObjectWrap.unref]
            when no longer needed.
  */
  override gid.gio2.mount.Mount getMount() nothrow
  {
    GMount* _cretval;
    _cretval = g_volume_get_mount(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of volume.
      Returns: the name for the given volume. The returned string should
            be freed with [gid.glib2.global.gfree] when no longer needed.
  */
  override string getName() nothrow
  {
    char* _cretval;
    _cretval = g_volume_get_name(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the sort key for volume, if any.
      Returns: Sorting key for volume or null if no such key is available
  */
  override string getSortKey() nothrow
  {
    const(char)* _cretval;
    _cretval = g_volume_get_sort_key(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the symbolic icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gid.gobject2.object.ObjectWrap.unref]
            when no longer needed.
  */
  override gid.gio2.icon.Icon getSymbolicIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_volume_get_symbolic_icon(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the UUID for the volume. The reference is typically based on
      the file system UUID for the volume in question and should be
      considered an opaque string. Returns null if there is no UUID
      available.
      Returns: the UUID for volume or null if no UUID
            can be computed.
            The returned string should be freed with [gid.glib2.global.gfree]
            when no longer needed.
  */
  override string getUuid() nothrow
  {
    char* _cretval;
    _cretval = g_volume_get_uuid(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Mounts a volume. This is an asynchronous operation, and is
      finished by calling [gid.gio2.volume.Volume.mountFinish] with the volume
      and #GAsyncResult returned in the callback.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
  */
  override void mount(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_volume_mount(cast(GVolume*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes mounting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
      
      If the mount operation succeeded, [gid.gio2.volume.Volume.getMount] on volume
      is guaranteed to return the mount right after calling this
      function; there's no need to listen for the 'mount-added' signal on
      #GVolumeMonitor.
  
      Params:
        result = a #GAsyncResult
      Returns: true, false if operation failed
      Throws: [ErrorWrap]
  */
  override bool mountFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_volume_mount_finish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Returns whether the volume should be automatically mounted.
      Returns: true if the volume should be automatically mounted
  */
  override bool shouldAutomount() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_volume_should_automount(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the volume has been changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.volume.Volume volume)`
  
          `volume` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.volume.Volume)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `Removed` signal.
  
      This signal is emitted when the #GVolume have been removed. If
        the recipient is holding references to the object they should
        release them so the object can be finalized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.volume.Volume volume)`
  
          `volume` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.volume.Volume)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.removed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("removed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.volume.Volume]
template VolumeGidBuilderT()
{
}
