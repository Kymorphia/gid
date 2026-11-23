/// Module for [Drive] interface mixin
module gid.gio2.drive_mixin;

public import gid.core.basictypes;
public import gid.gio2.drive_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
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
    [gid.gio2.drive.Drive] represents a piece of hardware connected to the machine.
    It’s generally only created for removable hardware or hardware with
    removable media. For example, an optical disc drive, or a USB flash drive.
    
    [gid.gio2.drive.Drive] is a container class for [gid.gio2.volume.Volume] objects that stem from
    the same piece of media. As such, [gid.gio2.drive.Drive] abstracts a drive with
    (or without) removable media and provides operations for querying
    whether media is available, determining whether media change is
    automatically detected and ejecting the media.
    
    If the [gid.gio2.drive.Drive] reports that media isn’t automatically detected, one
    can poll for media; typically one should not do this periodically
    as a poll for media operation is potentially expensive and may
    spin up the drive creating noise.
    
    [gid.gio2.drive.Drive] supports starting and stopping drives with authentication
    support for the former. This can be used to support a diverse set
    of use cases including connecting/disconnecting iSCSI devices,
    powering down external disk enclosures and starting/stopping
    multi-disk devices such as RAID devices. Note that the actual
    semantics and side-effects of starting/stopping a [gid.gio2.drive.Drive] may vary
    according to implementation. To choose the correct verbs in e.g. a
    file manager, use [gid.gio2.drive.Drive.getStartStopType].
    
    For [porting from GnomeVFS](migrating-gnome-vfs.html) note that there is no
    equivalent of [gid.gio2.drive.Drive] in that API.
*/
template DriveT()
{

  /**
      Checks if a drive can be ejected.
      Returns: true if the drive can be ejected, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanEject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanEject()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.canEject)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canEject(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be polled for media changes.
      Returns: true if the drive can be polled for media changes,
            false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanPollForMedia`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanPollForMedia()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.canPollForMedia)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canPollForMedia(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be started.
      Returns: true if the drive can be started, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanStart`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanStart()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.canStart)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canStart(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be started degraded.
      Returns: true if the drive can be started degraded, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanStartDegraded`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanStartDegraded()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.canStartDegraded)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canStartDegraded(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be stopped.
      Returns: true if the drive can be stopped, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanStop`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanStop()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.canStop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canStop(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Signal emitted when the drive is changed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChanged()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.changed)
      return;

    _klass.changed(cast(GDrive*)this._cPtr);
  }

  /**
      The removed signal that is emitted when the #GDrive have been disconnected. If the recipient is holding references to the object they should release them so the object can be finalized.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDisconnected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncDisconnected()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.disconnected)
      return;

    _klass.disconnected(cast(GDrive*)this._cPtr);
  }

  /**
      Asynchronously ejects a drive.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.ejectFinish] to obtain the
      result of the operation.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEject`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  
      Deprecated: Use [gid.gio2.drive.Drive.ejectWithOperation] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEject(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
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
    _klass.eject(cast(GDrive*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Signal emitted when the physical eject button (if any) of a drive have been pressed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectButton`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEjectButton()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.ejectButton)
      return;

    _klass.ejectButton(cast(GDrive*)this._cPtr);
  }

  /**
      Finishes ejecting a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been ejected successfully,
            false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.drive.Drive.ejectWithOperationFinish] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.ejectFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectFinish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ejects a drive. This is an asynchronous operation, and is
      finished by calling [gid.gio2.drive.Drive.ejectWithOperationFinish] with the drive
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
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
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
    _klass.ejectWithOperation(cast(GDrive*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a drive. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectWithOperationFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.ejectWithOperationFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectWithOperationFinish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the kinds of identifiers that drive has.
      Use [gid.gio2.drive.Drive.getIdentifier] to obtain the identifiers
      themselves.
      Returns: a null-terminated
            array of strings containing kinds of identifiers. Use [gid.glib2.global.strfreev]
            to free.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnumerateIdentifiers`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncEnumerateIdentifiers()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.enumerateIdentifiers)
      return typeof(return).init;

    char** _cretval;
    _cretval = _klass.enumerateIdentifiers(cast(GDrive*)this._cPtr);
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
      Gets the icon for drive.
      Returns: #GIcon for the drive.
           Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetIcon()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getIcon(cast(GDrive*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the identifier of the given kind for drive. The only
      identifier currently available is
      [gid.gio2.types.DRIVE_IDENTIFIER_KIND_UNIX_DEVICE].
  
      Params:
        kind = the kind of identifier to return
      Returns: a newly allocated string containing the
            requested identifier, or null if the #GDrive
            doesn't have this kind of identifier.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIdentifier`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetIdentifier(string kind)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getIdentifier)
      return typeof(return).init;

    char* _cretval;
    const(char)* _kind = kind.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getIdentifier(cast(GDrive*)this._cPtr, _kind);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the name of drive.
      Returns: a string containing drive's name. The returned
            string should be freed when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getName(cast(GDrive*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the sort key for drive, if any.
      Returns: Sorting key for drive or null if no such key is available.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSortKey`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetSortKey()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getSortKey)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getSortKey(cast(GDrive*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a hint about how a drive can be started/stopped.
      Returns: A value from the #GDriveStartStopType enumeration.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStartStopType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.types.DriveStartStopType vfuncGetStartStopType()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getStartStopType)
      return typeof(return).init;

    GDriveStartStopType _cretval;
    _cretval = _klass.getStartStopType(cast(GDrive*)this._cPtr);
    gid.gio2.types.DriveStartStopType _retval = cast(gid.gio2.types.DriveStartStopType)_cretval;
    return _retval;
  }

  /**
      Gets the icon for drive.
      Returns: symbolic #GIcon for the drive.
           Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSymbolicIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetSymbolicIcon()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getSymbolicIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getSymbolicIcon(cast(GDrive*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a list of mountable volumes for drive.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: #GList containing any #GVolume objects on the given drive.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetVolumes`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.volume.Volume[] vfuncGetVolumes()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.getVolumes)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getVolumes(cast(GDrive*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.volume.Volume, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks if the drive has media. Note that the OS may not be polling
      the drive for media changes; see [gid.gio2.drive.Drive.isMediaCheckAutomatic]
      for more details.
      Returns: true if drive has media, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHasMedia`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncHasMedia()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.hasMedia)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.hasMedia(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Check if drive has any mountable volumes.
      Returns: true if the drive contains volumes, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHasVolumes`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncHasVolumes()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.hasVolumes)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.hasVolumes(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if drive is capable of automatically detecting media changes.
      Returns: true if the drive is capable of automatically detecting
            media changes, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsMediaCheckAutomatic`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsMediaCheckAutomatic()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.isMediaCheckAutomatic)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isMediaCheckAutomatic(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the drive supports removable media.
      Returns: true if drive supports removable media, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsMediaRemovable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsMediaRemovable()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.isMediaRemovable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isMediaRemovable(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the #GDrive and/or its media is considered removable by the user.
      See [gid.gio2.drive.Drive.isMediaRemovable].
      Returns: true if drive and/or its media is considered removable, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsRemovable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsRemovable()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.isRemovable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isRemovable(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously polls drive to see if media has been inserted or removed.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.pollForMediaFinish] to obtain the
      result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPollForMedia`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPollForMedia(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.pollForMedia)
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
    _klass.pollForMedia(cast(GDrive*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an operation started with [gid.gio2.drive.Drive.pollForMedia] on a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been poll_for_mediaed successfully,
            false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPollForMediaFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncPollForMediaFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.pollForMediaFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.pollForMediaFinish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously starts a drive.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.startFinish] to obtain the
      result of the operation.
  
      Params:
        flags = flags affecting the start operation.
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStart`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncStart(gid.gio2.types.DriveStartFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.start)
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
    _klass.start(cast(GDrive*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes starting a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been started successfully,
            false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStartFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncStartFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.startFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.startFinish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously stops a drive.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.stopFinish] to obtain the
      result of the operation.
  
      Params:
        flags = flags affecting the unmount if required for stopping.
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStop`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncStop(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.stop)
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
    _klass.stop(cast(GDrive*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Signal emitted when the physical stop button (if any) of a drive have been pressed. Since 2.22.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStopButton`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncStopButton()
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.stopButton)
      return;

    _klass.stopButton(cast(GDrive*)this._cPtr);
  }

  /**
      Finishes stopping a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been stopped successfully,
            false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStopFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncStopFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.drive.Drive._getGType);
    if (!_klass || !_klass.stopFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.stopFinish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if a drive can be ejected.
      Returns: true if the drive can be ejected, false otherwise.
  */
  override bool canEject() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_can_eject(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be polled for media changes.
      Returns: true if the drive can be polled for media changes,
            false otherwise.
  */
  override bool canPollForMedia() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_can_poll_for_media(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be started.
      Returns: true if the drive can be started, false otherwise.
  */
  override bool canStart() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_can_start(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be started degraded.
      Returns: true if the drive can be started degraded, false otherwise.
  */
  override bool canStartDegraded() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_can_start_degraded(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be stopped.
      Returns: true if the drive can be stopped, false otherwise.
  */
  override bool canStop() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_can_stop(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously ejects a drive.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.ejectFinish] to obtain the
      result of the operation.
  
      Params:
        flags = flags affecting the unmount if required for eject
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  
      Deprecated: Use [gid.gio2.drive.Drive.ejectWithOperation] instead.
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
    g_drive_eject(cast(GDrive*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been ejected successfully,
            false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.drive.Drive.ejectWithOperationFinish] instead.
  */
  override bool ejectFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_drive_eject_finish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ejects a drive. This is an asynchronous operation, and is
      finished by calling [gid.gio2.drive.Drive.ejectWithOperationFinish] with the drive
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
    g_drive_eject_with_operation(cast(GDrive*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a drive. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool ejectWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_drive_eject_with_operation_finish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the kinds of identifiers that drive has.
      Use [gid.gio2.drive.Drive.getIdentifier] to obtain the identifiers
      themselves.
      Returns: a null-terminated
            array of strings containing kinds of identifiers. Use [gid.glib2.global.strfreev]
            to free.
  */
  override string[] enumerateIdentifiers() nothrow
  {
    char** _cretval;
    _cretval = g_drive_enumerate_identifiers(cast(GDrive*)this._cPtr);
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
      Gets the icon for drive.
      Returns: #GIcon for the drive.
           Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_drive_get_icon(cast(GDrive*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the identifier of the given kind for drive. The only
      identifier currently available is
      [gid.gio2.types.DRIVE_IDENTIFIER_KIND_UNIX_DEVICE].
  
      Params:
        kind = the kind of identifier to return
      Returns: a newly allocated string containing the
            requested identifier, or null if the #GDrive
            doesn't have this kind of identifier.
  */
  override string getIdentifier(string kind) nothrow
  {
    char* _cretval;
    const(char)* _kind = kind.toCString!(No.Malloc, No.Nullable);
    _cretval = g_drive_get_identifier(cast(GDrive*)this._cPtr, _kind);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the name of drive.
      Returns: a string containing drive's name. The returned
            string should be freed when no longer needed.
  */
  override string getName() nothrow
  {
    char* _cretval;
    _cretval = g_drive_get_name(cast(GDrive*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the sort key for drive, if any.
      Returns: Sorting key for drive or null if no such key is available.
  */
  override string getSortKey() nothrow
  {
    const(char)* _cretval;
    _cretval = g_drive_get_sort_key(cast(GDrive*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a hint about how a drive can be started/stopped.
      Returns: A value from the #GDriveStartStopType enumeration.
  */
  override gid.gio2.types.DriveStartStopType getStartStopType() nothrow
  {
    GDriveStartStopType _cretval;
    _cretval = g_drive_get_start_stop_type(cast(GDrive*)this._cPtr);
    gid.gio2.types.DriveStartStopType _retval = cast(gid.gio2.types.DriveStartStopType)_cretval;
    return _retval;
  }

  /**
      Gets the icon for drive.
      Returns: symbolic #GIcon for the drive.
           Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.icon.Icon getSymbolicIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_drive_get_symbolic_icon(cast(GDrive*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a list of mountable volumes for drive.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: #GList containing any #GVolume objects on the given drive.
  */
  override gid.gio2.volume.Volume[] getVolumes() nothrow
  {
    GList* _cretval;
    _cretval = g_drive_get_volumes(cast(GDrive*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.volume.Volume, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks if the drive has media. Note that the OS may not be polling
      the drive for media changes; see [gid.gio2.drive.Drive.isMediaCheckAutomatic]
      for more details.
      Returns: true if drive has media, false otherwise.
  */
  override bool hasMedia() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_has_media(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Check if drive has any mountable volumes.
      Returns: true if the drive contains volumes, false otherwise.
  */
  override bool hasVolumes() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_has_volumes(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if drive is capable of automatically detecting media changes.
      Returns: true if the drive is capable of automatically detecting
            media changes, false otherwise.
  */
  override bool isMediaCheckAutomatic() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_is_media_check_automatic(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the drive supports removable media.
      Returns: true if drive supports removable media, false otherwise.
  */
  override bool isMediaRemovable() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_is_media_removable(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the #GDrive and/or its media is considered removable by the user.
      See [gid.gio2.drive.Drive.isMediaRemovable].
      Returns: true if drive and/or its media is considered removable, false otherwise.
  */
  override bool isRemovable() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_drive_is_removable(cast(GDrive*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously polls drive to see if media has been inserted or removed.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.pollForMediaFinish] to obtain the
      result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void pollForMedia(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_drive_poll_for_media(cast(GDrive*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an operation started with [gid.gio2.drive.Drive.pollForMedia] on a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been poll_for_mediaed successfully,
            false otherwise.
      Throws: [ErrorWrap]
  */
  override bool pollForMediaFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_drive_poll_for_media_finish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously starts a drive.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.startFinish] to obtain the
      result of the operation.
  
      Params:
        flags = flags affecting the start operation.
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void start(gid.gio2.types.DriveStartFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_drive_start(cast(GDrive*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes starting a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been started successfully,
            false otherwise.
      Throws: [ErrorWrap]
  */
  override bool startFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_drive_start_finish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously stops a drive.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.stopFinish] to obtain the
      result of the operation.
  
      Params:
        flags = flags affecting the unmount if required for stopping.
        mountOperation = a #GMountOperation or null to avoid
              user interaction.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  override void stop(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_drive_stop(cast(GDrive*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes stopping a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been stopped successfully,
            false otherwise.
      Throws: [ErrorWrap]
  */
  override bool stopFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_drive_stop_finish(cast(GDrive*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the drive's state has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive)`
  
          `drive` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `Disconnected` signal.
  
      This signal is emitted when the #GDrive have been
        disconnected. If the recipient is holding references to the
        object they should release them so the object can be
        finalized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive)`
  
          `drive` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDisconnected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.disconnected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("disconnected", closure, after);
  }

  /**
      Connect to `EjectButton` signal.
  
      Emitted when the physical eject button (if any) of a drive has
        been pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive)`
  
          `drive` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEjectButton(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.ejectButton");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eject-button", closure, after);
  }

  /**
      Connect to `StopButton` signal.
  
      Emitted when the physical stop button (if any) of a drive has
        been pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive)`
  
          `drive` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStopButton(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.stopButton");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-button", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.drive.Drive (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_drive_Drive(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanEject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanPollForMedia", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanStart", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanStartDegraded", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanStop", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDisconnected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectButton", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateIdentifiers", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIdentifier", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortKey", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStartStopType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSymbolicIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVolumes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasMedia", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasVolumes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsMediaCheckAutomatic", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsMediaRemovable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsRemovable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollForMedia", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollForMediaFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStart", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStop", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopButton", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.drive.Drive vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_drive_Drive(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanEject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "can_eject");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanPollForMedia", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "can_poll_for_media");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanStart", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "can_start");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanStartDegraded", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "can_start_degraded");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanStop", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "can_stop");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDisconnected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "disconnected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.drive.Drive.vfuncEject is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectButton", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "eject_button");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "eject_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.drive.Drive.vfuncEjectWithOperation is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "eject_with_operation_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateIdentifiers", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "enumerate_identifiers");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "get_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIdentifier", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "get_identifier");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "get_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortKey", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.drive.Drive.vfuncGetSortKey is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStartStopType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "get_start_stop_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSymbolicIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "get_symbolic_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVolumes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "get_volumes");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasMedia", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "has_media");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasVolumes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "has_volumes");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsMediaCheckAutomatic", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "is_media_check_automatic");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsMediaRemovable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "is_media_removable");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsRemovable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "is_removable");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollForMedia", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.drive.Drive.vfuncPollForMedia is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollForMediaFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "poll_for_media_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStart", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.drive.Drive.vfuncStart is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "start_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStop", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.drive.Drive.vfuncStop is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopButton", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "stop_button");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_drive_Drive(iface, "stop_finish");
  }

  private static void _installIfaceVfunc_gid_gio2_drive_Drive(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GDriveIface*)iface;

    switch (vfunc)
    {
      case "can_eject":
      {
        static extern(C) gboolean _vfuncCanEjectTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.canEject)
              return (cast(typeof(&_vfuncCanEjectTramp))_klass.canEject)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanEject();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncCanEject");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canEject = cast(typeof(_klass.canEject))&_vfuncCanEjectTramp;
        break;
      }
      case "can_poll_for_media":
      {
        static extern(C) gboolean _vfuncCanPollForMediaTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.canPollForMedia)
              return (cast(typeof(&_vfuncCanPollForMediaTramp))_klass.canPollForMedia)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanPollForMedia();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncCanPollForMedia");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canPollForMedia = cast(typeof(_klass.canPollForMedia))&_vfuncCanPollForMediaTramp;
        break;
      }
      case "can_start":
      {
        static extern(C) gboolean _vfuncCanStartTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.canStart)
              return (cast(typeof(&_vfuncCanStartTramp))_klass.canStart)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncCanStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canStart = cast(typeof(_klass.canStart))&_vfuncCanStartTramp;
        break;
      }
      case "can_start_degraded":
      {
        static extern(C) gboolean _vfuncCanStartDegradedTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.canStartDegraded)
              return (cast(typeof(&_vfuncCanStartDegradedTramp))_klass.canStartDegraded)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanStartDegraded();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncCanStartDegraded");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canStartDegraded = cast(typeof(_klass.canStartDegraded))&_vfuncCanStartDegradedTramp;
        break;
      }
      case "can_stop":
      {
        static extern(C) gboolean _vfuncCanStopTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.canStop)
              return (cast(typeof(&_vfuncCanStopTramp))_klass.canStop)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncCanStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canStop = cast(typeof(_klass.canStop))&_vfuncCanStopTramp;
        break;
      }
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(drive);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "disconnected":
      {
        static extern(C) void _vfuncDisconnectedTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.disconnected)
              return (cast(typeof(&_vfuncDisconnectedTramp))_klass.disconnected)(drive);
            return;
          }

          try
          {
            _obj.vfuncDisconnected();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncDisconnected");
          }
        }

        _klass.disconnected = cast(typeof(_klass.disconnected))&_vfuncDisconnectedTramp;
        break;
      }
      case "eject_button":
      {
        static extern(C) void _vfuncEjectButtonTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.ejectButton)
              return (cast(typeof(&_vfuncEjectButtonTramp))_klass.ejectButton)(drive);
            return;
          }

          try
          {
            _obj.vfuncEjectButton();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncEjectButton");
          }
        }

        _klass.ejectButton = cast(typeof(_klass.ejectButton))&_vfuncEjectButtonTramp;
        break;
      }
      case "eject_finish":
      {
        static extern(C) gboolean _vfuncEjectFinishTramp(GDrive* drive, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.ejectFinish)
              return (cast(typeof(&_vfuncEjectFinishTramp))_klass.ejectFinish)(drive, result, _err);
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
        static extern(C) gboolean _vfuncEjectWithOperationFinishTramp(GDrive* drive, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.ejectWithOperationFinish)
              return (cast(typeof(&_vfuncEjectWithOperationFinishTramp))_klass.ejectWithOperationFinish)(drive, result, _err);
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
        static extern(C) char** _vfuncEnumerateIdentifiersTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.enumerateIdentifiers)
              return (cast(typeof(&_vfuncEnumerateIdentifiersTramp))_klass.enumerateIdentifiers)(drive);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncEnumerateIdentifiers();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncEnumerateIdentifiers");
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
      case "get_icon":
      {
        static extern(C) GIcon* _vfuncGetIconTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.getIcon)
              return (cast(typeof(&_vfuncGetIconTramp))_klass.getIcon)(drive);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncGetIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getIcon = cast(typeof(_klass.getIcon))&_vfuncGetIconTramp;
        break;
      }
      case "get_identifier":
      {
        static extern(C) char* _vfuncGetIdentifierTramp(GDrive* drive, const(char)* kind) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.getIdentifier)
              return (cast(typeof(&_vfuncGetIdentifierTramp))_klass.getIdentifier)(drive, kind);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncGetIdentifier");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getIdentifier = cast(typeof(_klass.getIdentifier))&_vfuncGetIdentifierTramp;
        break;
      }
      case "get_name":
      {
        static extern(C) char* _vfuncGetNameTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.getName)
              return (cast(typeof(&_vfuncGetNameTramp))_klass.getName)(drive);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetName();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncGetName");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getName = cast(typeof(_klass.getName))&_vfuncGetNameTramp;
        break;
      }
      case "get_start_stop_type":
      {
        static extern(C) GDriveStartStopType _vfuncGetStartStopTypeTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.getStartStopType)
              return (cast(typeof(&_vfuncGetStartStopTypeTramp))_klass.getStartStopType)(drive);
            return typeof(return).init;
          }

          gid.gio2.types.DriveStartStopType _dretval;

          try
          {
            _dretval = _obj.vfuncGetStartStopType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncGetStartStopType");
          }
          auto _retval = cast(GDriveStartStopType)_dretval;

          return _retval;
        }

        _klass.getStartStopType = cast(typeof(_klass.getStartStopType))&_vfuncGetStartStopTypeTramp;
        break;
      }
      case "get_symbolic_icon":
      {
        static extern(C) GIcon* _vfuncGetSymbolicIconTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.getSymbolicIcon)
              return (cast(typeof(&_vfuncGetSymbolicIconTramp))_klass.getSymbolicIcon)(drive);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetSymbolicIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncGetSymbolicIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getSymbolicIcon = cast(typeof(_klass.getSymbolicIcon))&_vfuncGetSymbolicIconTramp;
        break;
      }
      case "get_volumes":
      {
        static extern(C) GList* _vfuncGetVolumesTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.getVolumes)
              return (cast(typeof(&_vfuncGetVolumesTramp))_klass.getVolumes)(drive);
            return typeof(return).init;
          }

          gid.gio2.volume.Volume[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetVolumes();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncGetVolumes");
          }
          auto _retval = gListFromD!(gid.gio2.volume.Volume)(_dretval);

          return _retval;
        }

        _klass.getVolumes = cast(typeof(_klass.getVolumes))&_vfuncGetVolumesTramp;
        break;
      }
      case "has_media":
      {
        static extern(C) gboolean _vfuncHasMediaTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.hasMedia)
              return (cast(typeof(&_vfuncHasMediaTramp))_klass.hasMedia)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHasMedia();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncHasMedia");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasMedia = cast(typeof(_klass.hasMedia))&_vfuncHasMediaTramp;
        break;
      }
      case "has_volumes":
      {
        static extern(C) gboolean _vfuncHasVolumesTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.hasVolumes)
              return (cast(typeof(&_vfuncHasVolumesTramp))_klass.hasVolumes)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHasVolumes();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncHasVolumes");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasVolumes = cast(typeof(_klass.hasVolumes))&_vfuncHasVolumesTramp;
        break;
      }
      case "is_media_check_automatic":
      {
        static extern(C) gboolean _vfuncIsMediaCheckAutomaticTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.isMediaCheckAutomatic)
              return (cast(typeof(&_vfuncIsMediaCheckAutomaticTramp))_klass.isMediaCheckAutomatic)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsMediaCheckAutomatic();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncIsMediaCheckAutomatic");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isMediaCheckAutomatic = cast(typeof(_klass.isMediaCheckAutomatic))&_vfuncIsMediaCheckAutomaticTramp;
        break;
      }
      case "is_media_removable":
      {
        static extern(C) gboolean _vfuncIsMediaRemovableTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.isMediaRemovable)
              return (cast(typeof(&_vfuncIsMediaRemovableTramp))_klass.isMediaRemovable)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsMediaRemovable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncIsMediaRemovable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isMediaRemovable = cast(typeof(_klass.isMediaRemovable))&_vfuncIsMediaRemovableTramp;
        break;
      }
      case "is_removable":
      {
        static extern(C) gboolean _vfuncIsRemovableTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.isRemovable)
              return (cast(typeof(&_vfuncIsRemovableTramp))_klass.isRemovable)(drive);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsRemovable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncIsRemovable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isRemovable = cast(typeof(_klass.isRemovable))&_vfuncIsRemovableTramp;
        break;
      }
      case "poll_for_media_finish":
      {
        static extern(C) gboolean _vfuncPollForMediaFinishTramp(GDrive* drive, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.pollForMediaFinish)
              return (cast(typeof(&_vfuncPollForMediaFinishTramp))_klass.pollForMediaFinish)(drive, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPollForMediaFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.pollForMediaFinish = cast(typeof(_klass.pollForMediaFinish))&_vfuncPollForMediaFinishTramp;
        break;
      }
      case "start_finish":
      {
        static extern(C) gboolean _vfuncStartFinishTramp(GDrive* drive, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.startFinish)
              return (cast(typeof(&_vfuncStartFinishTramp))_klass.startFinish)(drive, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStartFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.startFinish = cast(typeof(_klass.startFinish))&_vfuncStartFinishTramp;
        break;
      }
      case "stop_button":
      {
        static extern(C) void _vfuncStopButtonTramp(GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.stopButton)
              return (cast(typeof(&_vfuncStopButtonTramp))_klass.stopButton)(drive);
            return;
          }

          try
          {
            _obj.vfuncStopButton();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.drive.Drive.vfuncStopButton");
          }
        }

        _klass.stopButton = cast(typeof(_klass.stopButton))&_vfuncStopButtonTramp;
        break;
      }
      case "stop_finish":
      {
        static extern(C) gboolean _vfuncStopFinishTramp(GDrive* drive, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)drive);
          if (!_obj)
          {
            auto _klass = cast(GDriveIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)drive), gid.gio2.drive.Drive._getGType);
            if (_klass && _klass.stopFinish)
              return (cast(typeof(&_vfuncStopFinishTramp))_klass.stopFinish)(drive, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStopFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stopFinish = cast(typeof(_klass.stopFinish))&_vfuncStopFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.drive.Drive]
template DriveGidBuilderT()
{
}
