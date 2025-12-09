/// Module for [Volume] interface mixin
module gio.volume_mixin;

public import gio.volume_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.drive;
public import gio.file;
public import gio.icon;
public import gio.mount;
public import gio.mount_operation;
public import gio.types;
public import glib.error;
public import gobject.dclosure;
public import gobject.object;

/**
    The [gio.volume.Volume] interface represents user-visible objects that can be
    mounted. Note, when [porting from GnomeVFS](migrating-gnome-vfs.html),
    [gio.volume.Volume] is the moral equivalent of `GnomeVFSDrive`.
    
    Mounting a [gio.volume.Volume] instance is an asynchronous operation. For more
    information about asynchronous operations, see [gio.async_result.AsyncResult] and
    [gio.task.Task]. To mount a [gio.volume.Volume], first call [gio.volume.Volume.mount]
    with (at least) the [gio.volume.Volume] instance, optionally a
    [gio.mount_operation.MountOperation] object and a [gio.types.AsyncReadyCallback].
    
    Typically, one will only want to pass `NULL` for the
    [gio.mount_operation.MountOperation] if automounting all volumes when a desktop session
    starts since it’s not desirable to put up a lot of dialogs asking
    for credentials.
    
    The callback will be fired when the operation has resolved (either
    with success or failure), and a [gio.async_result.AsyncResult] instance will be
    passed to the callback.  That callback should then call
    [gio.volume.Volume.mountFinish] with the [gio.volume.Volume] instance and the
    [gio.async_result.AsyncResult] data to see if the operation was completed
    successfully.  If a [glib.error.ErrorWrap] is present when
    [gio.volume.Volume.mountFinish] is called, then it will be filled with any
    error information.
    
    ## Volume Identifiers
    
    It is sometimes necessary to directly access the underlying
    operating system object behind a volume (e.g. for passing a volume
    to an application via the command line). For this purpose, GIO
    allows to obtain an ‘identifier’ for the volume. There can be
    different kinds of identifiers, such as Hal UDIs, filesystem labels,
    traditional Unix devices (e.g. `/dev/sda2`), UUIDs. GIO uses predefined
    strings as names for the different kinds of identifiers:
    `G_VOLUME_IDENTIFIER_KIND_UUID`, `G_VOLUME_IDENTIFIER_KIND_LABEL`, etc.
    Use [gio.volume.Volume.getIdentifier] to obtain an identifier for a volume.
    
    Note that `G_VOLUME_IDENTIFIER_KIND_HAL_UDI` will only be available
    when the GVFS hal volume monitor is in use. Other volume monitors
    will generally be able to provide the `G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE`
    identifier, which can be used to obtain a hal device by means of
    `libhal_manager_find_device_string_match()`.
*/
template VolumeT()
{

  /**
      Checks if a volume can be ejected.
      Returns: true if the volume can be ejected. false otherwise
  */
  override bool canEject()
  {
    bool _retval;
    _retval = g_volume_can_eject(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a volume can be mounted.
      Returns: true if the volume can be mounted. false otherwise
  */
  override bool canMount()
  {
    bool _retval;
    _retval = g_volume_can_mount(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Ejects a volume. This is an asynchronous operation, and is
      finished by calling [gio.volume.Volume.ejectFinish] with the volume
      and #GAsyncResult returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
  
      Deprecated: Use [gio.volume.Volume.ejectWithOperation] instead.
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
    g_volume_eject(cast(GVolume*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true, false if operation failed
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.volume.Volume.ejectWithOperationFinish] instead.
  */
  override bool ejectFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_volume_eject_finish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Ejects a volume. This is an asynchronous operation, and is
      finished by calling [gio.volume.Volume.ejectWithOperationFinish] with the volume
      and #GAsyncResult data returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        mountOperation = a #GMountOperation or null to
              avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
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
  override bool ejectWithOperationFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_volume_eject_with_operation_finish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the kinds of [identifiers](#volume-identifiers) that volume has.
      Use [gio.volume.Volume.getIdentifier] to obtain the identifiers themselves.
      Returns: a null-terminated array
          of strings containing kinds of identifiers. Use [glib.global.strfreev] to free.
  */
  override string[] enumerateIdentifiers()
  {
    char** _cretval;
    _cretval = g_volume_enumerate_identifiers(cast(GVolume*)this._cPtr);
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
      Gets the activation root for a #GVolume if it is known ahead of
      mount time. Returns null otherwise. If not null and if volume
      is mounted, then the result of [gio.mount.Mount.getRoot] on the
      #GMount object obtained from [gio.volume.Volume.getMount] will always
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
      [gio.mount.Mount.isShadowed] for more details.
      Returns: the activation root of volume
            or null. Use [gobject.object.ObjectWrap.unref] to free.
  */
  override gio.file.File getActivationRoot()
  {
    GFile* _cretval;
    _cretval = g_volume_get_activation_root(cast(GVolume*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the drive for the volume.
      Returns: a #GDrive or null if volume is not
            associated with a drive. The returned object should be unreffed
            with [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  override gio.drive.Drive getDrive()
  {
    GDrive* _cretval;
    _cretval = g_volume_get_drive(cast(GVolume*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.drive.Drive)(cast(GDrive*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gobject.object.ObjectWrap.unref]
            when no longer needed.
  */
  override gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_volume_get_icon(cast(GVolume*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
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
  override string getIdentifier(string kind)
  {
    char* _cretval;
    const(char)* _kind = kind.toCString(No.Alloc);
    _cretval = g_volume_get_identifier(cast(GVolume*)this._cPtr, _kind);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the mount for the volume.
      Returns: a #GMount or null if volume isn't mounted.
            The returned object should be unreffed with [gobject.object.ObjectWrap.unref]
            when no longer needed.
  */
  override gio.mount.Mount getMount()
  {
    GMount* _cretval;
    _cretval = g_volume_get_mount(cast(GVolume*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of volume.
      Returns: the name for the given volume. The returned string should
            be freed with [glib.global.gfree] when no longer needed.
  */
  override string getName()
  {
    char* _cretval;
    _cretval = g_volume_get_name(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the sort key for volume, if any.
      Returns: Sorting key for volume or null if no such key is available
  */
  override string getSortKey()
  {
    const(char)* _cretval;
    _cretval = g_volume_get_sort_key(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the symbolic icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gobject.object.ObjectWrap.unref]
            when no longer needed.
  */
  override gio.icon.Icon getSymbolicIcon()
  {
    GIcon* _cretval;
    _cretval = g_volume_get_symbolic_icon(cast(GVolume*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the UUID for the volume. The reference is typically based on
      the file system UUID for the volume in question and should be
      considered an opaque string. Returns null if there is no UUID
      available.
      Returns: the UUID for volume or null if no UUID
            can be computed.
            The returned string should be freed with [glib.global.gfree]
            when no longer needed.
  */
  override string getUuid()
  {
    char* _cretval;
    _cretval = g_volume_get_uuid(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Mounts a volume. This is an asynchronous operation, and is
      finished by calling [gio.volume.Volume.mountFinish] with the volume
      and #GAsyncResult returned in the callback.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation or null to avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
  */
  override void mount(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_volume_mount(cast(GVolume*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes mounting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
      
      If the mount operation succeeded, [gio.volume.Volume.getMount] on volume
      is guaranteed to return the mount right after calling this
      function; there's no need to listen for the 'mount-added' signal on
      #GVolumeMonitor.
  
      Params:
        result = a #GAsyncResult
      Returns: true, false if operation failed
      Throws: [ErrorWrap]
  */
  override bool mountFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_volume_mount_finish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Returns whether the volume should be automatically mounted.
      Returns: true if the volume should be automatically mounted
  */
  override bool shouldAutomount()
  {
    bool _retval;
    _retval = g_volume_should_automount(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the volume has been changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.volume.Volume volume))
  
          `volume` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.volume.Volume)))
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
      Connect to `Removed` signal.
  
      This signal is emitted when the #GVolume have been removed. If
      the recipient is holding references to the object they should
      release them so the object can be finalized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.volume.Volume volume))
  
          `volume` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.volume.Volume)))
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
    return connectSignalClosure("removed", closure, after);
  }
}
