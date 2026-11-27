/// Module for [Drive] interface
module gid.gio2.drive;

public import gid.core.basictypes;
public import gid.gio2.drive_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.icon;
import gid.gio2.mount_operation;
import gid.gio2.types;
import gid.gio2.volume;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

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
@gidGir("Drive", "DriveIface")
interface Drive : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_drive_get_type != &gidSymbolNotFound ? g_drive_get_type() : cast(GType)0;
  }

































  /**
      Checks if a drive can be ejected.
      Returns: true if the drive can be ejected, false otherwise.
  */
  bool canEject();

  /**
      Checks if a drive can be polled for media changes.
      Returns: true if the drive can be polled for media changes,
            false otherwise.
  */
  bool canPollForMedia();

  /**
      Checks if a drive can be started.
      Returns: true if the drive can be started, false otherwise.
  */
  bool canStart();

  /**
      Checks if a drive can be started degraded.
      Returns: true if the drive can be started degraded, false otherwise.
  */
  bool canStartDegraded();

  /**
      Checks if a drive can be stopped.
      Returns: true if the drive can be stopped, false otherwise.
  */
  bool canStop();

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
  void eject(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes ejecting a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been ejected successfully,
            false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.drive.Drive.ejectWithOperationFinish] instead.
  */
  bool ejectFinish(gid.gio2.async_result.AsyncResult result);

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
  void ejectWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes ejecting a drive. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  */
  bool ejectWithOperationFinish(gid.gio2.async_result.AsyncResult result);

  /**
      Gets the kinds of identifiers that drive has.
      Use [gid.gio2.drive.Drive.getIdentifier] to obtain the identifiers
      themselves.
      Returns: a null-terminated
            array of strings containing kinds of identifiers. Use [gid.glib2.global.strfreev]
            to free.
  */
  string[] enumerateIdentifiers();

  /**
      Gets the icon for drive.
      Returns: #GIcon for the drive.
           Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.icon.Icon getIcon();

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
  string getIdentifier(string kind);

  /**
      Gets the name of drive.
      Returns: a string containing drive's name. The returned
            string should be freed when no longer needed.
  */
  string getName();

  /**
      Gets the sort key for drive, if any.
      Returns: Sorting key for drive or null if no such key is available.
  */
  string getSortKey();

  /**
      Gets a hint about how a drive can be started/stopped.
      Returns: A value from the #GDriveStartStopType enumeration.
  */
  gid.gio2.types.DriveStartStopType getStartStopType();

  /**
      Gets the icon for drive.
      Returns: symbolic #GIcon for the drive.
           Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.icon.Icon getSymbolicIcon();

  /**
      Get a list of mountable volumes for drive.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: #GList containing any #GVolume objects on the given drive.
  */
  gid.gio2.volume.Volume[] getVolumes();

  /**
      Checks if the drive has media. Note that the OS may not be polling
      the drive for media changes; see [gid.gio2.drive.Drive.isMediaCheckAutomatic]
      for more details.
      Returns: true if drive has media, false otherwise.
  */
  bool hasMedia();

  /**
      Check if drive has any mountable volumes.
      Returns: true if the drive contains volumes, false otherwise.
  */
  bool hasVolumes();

  /**
      Checks if drive is capable of automatically detecting media changes.
      Returns: true if the drive is capable of automatically detecting
            media changes, false otherwise.
  */
  bool isMediaCheckAutomatic();

  /**
      Checks if the drive supports removable media.
      Returns: true if drive supports removable media, false otherwise.
  */
  bool isMediaRemovable();

  /**
      Checks if the #GDrive and/or its media is considered removable by the user.
      See [gid.gio2.drive.Drive.isMediaRemovable].
      Returns: true if drive and/or its media is considered removable, false otherwise.
  */
  bool isRemovable();

  /**
      Asynchronously polls drive to see if media has been inserted or removed.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.drive.Drive.pollForMediaFinish] to obtain the
      result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback, or null.
  */
  void pollForMedia(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes an operation started with [gid.gio2.drive.Drive.pollForMedia] on a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been poll_for_mediaed successfully,
            false otherwise.
      Throws: [ErrorWrap]
  */
  bool pollForMediaFinish(gid.gio2.async_result.AsyncResult result);

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
  void start(gid.gio2.types.DriveStartFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes starting a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been started successfully,
            false otherwise.
      Throws: [ErrorWrap]
  */
  bool startFinish(gid.gio2.async_result.AsyncResult result);

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
  void stop(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes stopping a drive.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the drive has been stopped successfully,
            false otherwise.
      Throws: [ErrorWrap]
  */
  bool stopFinish(gid.gio2.async_result.AsyncResult result);

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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("changed", closure, after);
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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("disconnected", closure, after);
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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("eject-button", closure, after);
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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("stop-button", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.drive.Drive]
interface DriveGidBuilderImpl(T)
{
}
