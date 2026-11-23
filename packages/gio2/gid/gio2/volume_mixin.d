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
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanEject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanEject()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.canEject)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canEject(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a volume can be mounted.
      Returns: true if the volume can be mounted. false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanMount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanMount()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.canMount)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canMount(cast(GVolume*)this._cPtr);
    return _retval;
  }

  /**
      Changed signal that is emitted when the volume's state has changed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChanged()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.changed)
      return;

    _klass.changed(cast(GVolume*)this._cPtr);
  }

  /**
      Ejects a volume. This is an asynchronous operation, and is
      finished by calling [gid.gio2.volume.Volume.ejectFinish] with the volume
      and #GAsyncResult returned in the callback.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEject`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  
      Deprecated: Use [gid.gio2.volume.Volume.ejectWithOperation] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEject(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
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
    _klass.eject(cast(GVolume*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true, false if operation failed
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.volume.Volume.ejectWithOperationFinish] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.ejectFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectFinish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectWithOperation`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEjectWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
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
    _klass.ejectWithOperation(cast(GVolume*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true if the volume was successfully ejected. false otherwise
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectWithOperationFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.ejectWithOperationFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectWithOperationFinish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the kinds of [identifiers](#volume-identifiers) that volume has.
      Use [gid.gio2.volume.Volume.getIdentifier] to obtain the identifiers themselves.
      Returns: a null-terminated array
          of strings containing kinds of identifiers. Use [gid.glib2.global.strfreev] to free.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnumerateIdentifiers`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncEnumerateIdentifiers()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.enumerateIdentifiers)
      return typeof(return).init;

    char** _cretval;
    _cretval = _klass.enumerateIdentifiers(cast(GVolume*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActivationRoot`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncGetActivationRoot()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getActivationRoot)
      return typeof(return).init;

    GFile* _cretval;
    _cretval = _klass.getActivationRoot(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the drive for the volume.
      Returns: a #GDrive or null if volume is not
            associated with a drive. The returned object should be unreffed
            with [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDrive`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.drive.Drive vfuncGetDrive()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getDrive)
      return typeof(return).init;

    GDrive* _cretval;
    _cretval = _klass.getDrive(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(GDrive*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gid.gobject2.object.ObjectWrap.unref]
            when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetIcon()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getIcon(cast(GVolume*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIdentifier`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetIdentifier(string kind)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getIdentifier)
      return typeof(return).init;

    char* _cretval;
    const(char)* _kind = kind.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getIdentifier(cast(GVolume*)this._cPtr, _kind);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the mount for the volume.
      Returns: a #GMount or null if volume isn't mounted.
            The returned object should be unreffed with [gid.gobject2.object.ObjectWrap.unref]
            when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.mount.Mount vfuncGetMount()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getMount)
      return typeof(return).init;

    GMount* _cretval;
    _cretval = _klass.getMount(cast(GVolume*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of volume.
      Returns: the name for the given volume. The returned string should
            be freed with [gid.glib2.global.gfree] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getName(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the sort key for volume, if any.
      Returns: Sorting key for volume or null if no such key is available
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSortKey`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetSortKey()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getSortKey)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getSortKey(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the symbolic icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gid.gobject2.object.ObjectWrap.unref]
            when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSymbolicIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetSymbolicIcon()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getSymbolicIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getSymbolicIcon(cast(GVolume*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUuid`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetUuid()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.getUuid)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getUuid(cast(GVolume*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMountFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMountFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.mountFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.mountFinish(cast(GVolume*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMountFn`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncMountFn(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.mountFn)
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
    _klass.mountFn(cast(GVolume*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      The removed signal that is emitted when the #GVolume have been removed. If the recipient is holding references to the object they should release them so the object can be finalized.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoved`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemoved()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.removed)
      return;

    _klass.removed(cast(GVolume*)this._cPtr);
  }

  /**
      Returns whether the volume should be automatically mounted.
      Returns: true if the volume should be automatically mounted
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncShouldAutomount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncShouldAutomount()
  {
    auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.volume.Volume._getGType);
    if (!_klass || !_klass.shouldAutomount)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.shouldAutomount(cast(GVolume*)this._cPtr);
    return _retval;
  }

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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.removed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("removed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.volume.Volume (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_volume_Volume(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanEject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanMount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateIdentifiers", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActivationRoot", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDrive", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIdentifier", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortKey", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSymbolicIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUuid", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountFn", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncShouldAutomount", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.volume.Volume vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_volume_Volume(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanEject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "can_eject");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanMount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "can_mount");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.volume.Volume.vfuncEject is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "eject_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.volume.Volume.vfuncEjectWithOperation is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "eject_with_operation_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateIdentifiers", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "enumerate_identifiers");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActivationRoot", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_activation_root");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDrive", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_drive");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIdentifier", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_identifier");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_mount");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortKey", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.volume.Volume.vfuncGetSortKey is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSymbolicIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_symbolic_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUuid", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "get_uuid");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "mount_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountFn", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.volume.Volume.vfuncMountFn is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "removed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncShouldAutomount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_volume_Volume(iface, "should_automount");
  }

  private static void _installIfaceVfunc_gid_gio2_volume_Volume(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GVolumeIface*)iface;

    switch (vfunc)
    {
      case "can_eject":
      {
        static extern(C) gboolean _vfuncCanEjectTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.canEject)
              return (cast(typeof(&_vfuncCanEjectTramp))_klass.canEject)(volume);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanEject();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncCanEject");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canEject = cast(typeof(_klass.canEject))&_vfuncCanEjectTramp;
        break;
      }
      case "can_mount":
      {
        static extern(C) gboolean _vfuncCanMountTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.canMount)
              return (cast(typeof(&_vfuncCanMountTramp))_klass.canMount)(volume);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanMount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncCanMount");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canMount = cast(typeof(_klass.canMount))&_vfuncCanMountTramp;
        break;
      }
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(volume);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "eject_finish":
      {
        static extern(C) gboolean _vfuncEjectFinishTramp(GVolume* volume, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.ejectFinish)
              return (cast(typeof(&_vfuncEjectFinishTramp))_klass.ejectFinish)(volume, result, _err);
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
        static extern(C) gboolean _vfuncEjectWithOperationFinishTramp(GVolume* volume, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.ejectWithOperationFinish)
              return (cast(typeof(&_vfuncEjectWithOperationFinishTramp))_klass.ejectWithOperationFinish)(volume, result, _err);
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
      case "enumerate_identifiers":
      {
        static extern(C) char** _vfuncEnumerateIdentifiersTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.enumerateIdentifiers)
              return (cast(typeof(&_vfuncEnumerateIdentifiersTramp))_klass.enumerateIdentifiers)(volume);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncEnumerateIdentifiers();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncEnumerateIdentifiers");
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

        _klass.enumerateIdentifiers = cast(typeof(_klass.enumerateIdentifiers))&_vfuncEnumerateIdentifiersTramp;
        break;
      }
      case "get_activation_root":
      {
        static extern(C) GFile* _vfuncGetActivationRootTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getActivationRoot)
              return (cast(typeof(&_vfuncGetActivationRootTramp))_klass.getActivationRoot)(volume);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncGetActivationRoot();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetActivationRoot");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getActivationRoot = cast(typeof(_klass.getActivationRoot))&_vfuncGetActivationRootTramp;
        break;
      }
      case "get_drive":
      {
        static extern(C) GDrive* _vfuncGetDriveTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getDrive)
              return (cast(typeof(&_vfuncGetDriveTramp))_klass.getDrive)(volume);
            return typeof(return).init;
          }

          gid.gio2.drive.Drive _dretval;

          try
          {
            _dretval = _obj.vfuncGetDrive();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetDrive");
          }
          auto _retval = _dretval ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getDrive = cast(typeof(_klass.getDrive))&_vfuncGetDriveTramp;
        break;
      }
      case "get_icon":
      {
        static extern(C) GIcon* _vfuncGetIconTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getIcon)
              return (cast(typeof(&_vfuncGetIconTramp))_klass.getIcon)(volume);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getIcon = cast(typeof(_klass.getIcon))&_vfuncGetIconTramp;
        break;
      }
      case "get_identifier":
      {
        static extern(C) char* _vfuncGetIdentifierTramp(GVolume* volume, const(char)* kind) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getIdentifier)
              return (cast(typeof(&_vfuncGetIdentifierTramp))_klass.getIdentifier)(volume, kind);
            return typeof(return).init;
          }

          string _dretval;
          string _kind = kind.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetIdentifier(_kind);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetIdentifier");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getIdentifier = cast(typeof(_klass.getIdentifier))&_vfuncGetIdentifierTramp;
        break;
      }
      case "get_mount":
      {
        static extern(C) GMount* _vfuncGetMountTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getMount)
              return (cast(typeof(&_vfuncGetMountTramp))_klass.getMount)(volume);
            return typeof(return).init;
          }

          gid.gio2.mount.Mount _dretval;

          try
          {
            _dretval = _obj.vfuncGetMount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetMount");
          }
          auto _retval = _dretval ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getMount = cast(typeof(_klass.getMount))&_vfuncGetMountTramp;
        break;
      }
      case "get_name":
      {
        static extern(C) char* _vfuncGetNameTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getName)
              return (cast(typeof(&_vfuncGetNameTramp))_klass.getName)(volume);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetName();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetName");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getName = cast(typeof(_klass.getName))&_vfuncGetNameTramp;
        break;
      }
      case "get_symbolic_icon":
      {
        static extern(C) GIcon* _vfuncGetSymbolicIconTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getSymbolicIcon)
              return (cast(typeof(&_vfuncGetSymbolicIconTramp))_klass.getSymbolicIcon)(volume);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetSymbolicIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetSymbolicIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getSymbolicIcon = cast(typeof(_klass.getSymbolicIcon))&_vfuncGetSymbolicIconTramp;
        break;
      }
      case "get_uuid":
      {
        static extern(C) char* _vfuncGetUuidTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.getUuid)
              return (cast(typeof(&_vfuncGetUuidTramp))_klass.getUuid)(volume);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetUuid();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncGetUuid");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getUuid = cast(typeof(_klass.getUuid))&_vfuncGetUuidTramp;
        break;
      }
      case "mount_finish":
      {
        static extern(C) gboolean _vfuncMountFinishTramp(GVolume* volume, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.mountFinish)
              return (cast(typeof(&_vfuncMountFinishTramp))_klass.mountFinish)(volume, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMountFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.mountFinish = cast(typeof(_klass.mountFinish))&_vfuncMountFinishTramp;
        break;
      }
      case "removed":
      {
        static extern(C) void _vfuncRemovedTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.removed)
              return (cast(typeof(&_vfuncRemovedTramp))_klass.removed)(volume);
            return;
          }

          try
          {
            _obj.vfuncRemoved();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncRemoved");
          }
        }

        _klass.removed = cast(typeof(_klass.removed))&_vfuncRemovedTramp;
        break;
      }
      case "should_automount":
      {
        static extern(C) gboolean _vfuncShouldAutomountTramp(GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volume);
          if (!_obj)
          {
            auto _klass = cast(GVolumeIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volume), gid.gio2.volume.Volume._getGType);
            if (_klass && _klass.shouldAutomount)
              return (cast(typeof(&_vfuncShouldAutomountTramp))_klass.shouldAutomount)(volume);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncShouldAutomount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume.Volume.vfuncShouldAutomount");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.shouldAutomount = cast(typeof(_klass.shouldAutomount))&_vfuncShouldAutomountTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.volume.Volume]
template VolumeGidBuilderT()
{
}
