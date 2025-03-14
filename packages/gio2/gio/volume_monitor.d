module gio.volume_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.drive;
import gio.mount;
import gio.types;
import gio.volume;
import gobject.dclosure;
import gobject.object;

/**
    [gio.volume_monitor.VolumeMonitor] is for listing the user interesting devices and volumes
  on the computer. In other words, what a file selector or file manager
  would show in a sidebar.
  
  [gio.volume_monitor.VolumeMonitor] is not
  thread-default-context aware (see
  [glib.main_context.MainContext.pushThreadDefault]), and so should not be used
  other than from the main thread, with no thread-default-context active.
  
  In order to receive updates about volumes and mounts monitored through GVFS,
  a main loop must be running.
*/
class VolumeMonitor : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_volume_monitor_get_type != &gidSymbolNotFound ? g_volume_monitor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override VolumeMonitor self()
  {
    return this;
  }

  /**
      This function should be called by any #GVolumeMonitor
    implementation when a new #GMount object is created that is not
    associated with a #GVolume object. It must be called just before
    emitting the mount_added signal.
    
    If the return value is not null, the caller must associate the
    returned #GVolume object with the #GMount. This involves returning
    it in its [gio.mount.Mount.getVolume] implementation. The caller must
    also listen for the "removed" signal on the returned object
    and give up its reference when handling that signal
    
    Similarly, if implementing [gio.volume_monitor.VolumeMonitor.adoptOrphanMount],
    the implementor must take a reference to mount and return it in
    its [gio.volume.Volume.getMount] implemented. Also, the implementor must
    listen for the "unmounted" signal on mount and give up its
    reference upon handling that signal.
    
    There are two main use cases for this function.
    
    One is when implementing a user space file system driver that reads
    blocks of a block device that is already represented by the native
    volume monitor (for example a CD Audio file system driver). Such
    a driver will generate its own #GMount object that needs to be
    associated with the #GVolume object that represents the volume.
    
    The other is for implementing a #GVolumeMonitor whose sole purpose
    is to return #GVolume objects representing entries in the users
    "favorite servers" list or similar.
    Params:
      mount =       a #GMount object to find a parent for
    Returns:     the #GVolume object that is the parent for mount or null
      if no wants to adopt the #GMount.
  
    Deprecated:     Instead of using this function, #GVolumeMonitor
      implementations should instead create shadow mounts with the URI of
      the mount they intend to adopt. See the proxy volume monitor in
      gvfs for an example of this. Also see [gio.mount.Mount.isShadowed],
      [gio.mount.Mount.shadow] and [gio.mount.Mount.unshadow] functions.
  */
  static gio.volume.Volume adoptOrphanMount(gio.mount.Mount mount)
  {
    GVolume* _cretval;
    _cretval = g_volume_monitor_adopt_orphan_mount(mount ? cast(GMount*)(cast(ObjectG)mount).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gio.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the volume monitor used by gio.
    Returns:     a reference to the #GVolumeMonitor used by gio. Call
         [gobject.object.ObjectG.unref] when done with it.
  */
  static gio.volume_monitor.VolumeMonitor get()
  {
    GVolumeMonitor* _cretval;
    _cretval = g_volume_monitor_get();
    auto _retval = ObjectG.getDObject!(gio.volume_monitor.VolumeMonitor)(cast(GVolumeMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of drives connected to the system.
    
    The returned list should be freed with [glib.list.List.free], after
    its elements have been unreffed with [gobject.object.ObjectG.unref].
    Returns:     a #GList of connected #GDrive objects.
  */
  gio.drive.Drive[] getConnectedDrives()
  {
    GList* _cretval;
    _cretval = g_volume_monitor_get_connected_drives(cast(GVolumeMonitor*)cPtr);
    auto _retval = gListToD!(gio.drive.Drive, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds a #GMount object by its UUID (see [gio.mount.Mount.getUuid])
    Params:
      uuid =       the UUID to look for
    Returns:     a #GMount or null if no such mount is available.
          Free the returned object with [gobject.object.ObjectG.unref].
  */
  gio.mount.Mount getMountForUuid(string uuid)
  {
    GMount* _cretval;
    const(char)* _uuid = uuid.toCString(No.Alloc);
    _cretval = g_volume_monitor_get_mount_for_uuid(cast(GVolumeMonitor*)cPtr, _uuid);
    auto _retval = ObjectG.getDObject!(gio.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of the mounts on the system.
    
    The returned list should be freed with [glib.list.List.free], after
    its elements have been unreffed with [gobject.object.ObjectG.unref].
    Returns:     a #GList of #GMount objects.
  */
  gio.mount.Mount[] getMounts()
  {
    GList* _cretval;
    _cretval = g_volume_monitor_get_mounts(cast(GVolumeMonitor*)cPtr);
    auto _retval = gListToD!(gio.mount.Mount, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds a #GVolume object by its UUID (see [gio.volume.Volume.getUuid])
    Params:
      uuid =       the UUID to look for
    Returns:     a #GVolume or null if no such volume is available.
          Free the returned object with [gobject.object.ObjectG.unref].
  */
  gio.volume.Volume getVolumeForUuid(string uuid)
  {
    GVolume* _cretval;
    const(char)* _uuid = uuid.toCString(No.Alloc);
    _cretval = g_volume_monitor_get_volume_for_uuid(cast(GVolumeMonitor*)cPtr, _uuid);
    auto _retval = ObjectG.getDObject!(gio.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of the volumes on the system.
    
    The returned list should be freed with [glib.list.List.free], after
    its elements have been unreffed with [gobject.object.ObjectG.unref].
    Returns:     a #GList of #GVolume objects.
  */
  gio.volume.Volume[] getVolumes()
  {
    GList* _cretval;
    _cretval = g_volume_monitor_get_volumes(cast(GVolumeMonitor*)cPtr);
    auto _retval = gListToD!(gio.volume.Volume, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Emitted when a drive changes.
  
    ## Parameters
    $(LIST
      * $(B drive)       the drive that changed
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias DriveChangedCallbackDlg = void delegate(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias DriveChangedCallbackFunc = void function(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to DriveChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDriveChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DriveChangedCallbackDlg) || is(T : DriveChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto drive = getVal!(gio.drive.Drive)(&_paramVals[1]);
      _dClosure.dlg(drive, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-changed", closure, after);
  }

  /**
      Emitted when a drive is connected to the system.
  
    ## Parameters
    $(LIST
      * $(B drive)       a #GDrive that was connected.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias DriveConnectedCallbackDlg = void delegate(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias DriveConnectedCallbackFunc = void function(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to DriveConnected signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDriveConnected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DriveConnectedCallbackDlg) || is(T : DriveConnectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto drive = getVal!(gio.drive.Drive)(&_paramVals[1]);
      _dClosure.dlg(drive, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-connected", closure, after);
  }

  /**
      Emitted when a drive is disconnected from the system.
  
    ## Parameters
    $(LIST
      * $(B drive)       a #GDrive that was disconnected.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias DriveDisconnectedCallbackDlg = void delegate(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias DriveDisconnectedCallbackFunc = void function(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to DriveDisconnected signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDriveDisconnected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DriveDisconnectedCallbackDlg) || is(T : DriveDisconnectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto drive = getVal!(gio.drive.Drive)(&_paramVals[1]);
      _dClosure.dlg(drive, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-disconnected", closure, after);
  }

  /**
      Emitted when the eject button is pressed on drive.
  
    ## Parameters
    $(LIST
      * $(B drive)       the drive where the eject button was pressed
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias DriveEjectButtonCallbackDlg = void delegate(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias DriveEjectButtonCallbackFunc = void function(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to DriveEjectButton signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDriveEjectButton(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DriveEjectButtonCallbackDlg) || is(T : DriveEjectButtonCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto drive = getVal!(gio.drive.Drive)(&_paramVals[1]);
      _dClosure.dlg(drive, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-eject-button", closure, after);
  }

  /**
      Emitted when the stop button is pressed on drive.
  
    ## Parameters
    $(LIST
      * $(B drive)       the drive where the stop button was pressed
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias DriveStopButtonCallbackDlg = void delegate(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias DriveStopButtonCallbackFunc = void function(gio.drive.Drive drive, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to DriveStopButton signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDriveStopButton(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DriveStopButtonCallbackDlg) || is(T : DriveStopButtonCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto drive = getVal!(gio.drive.Drive)(&_paramVals[1]);
      _dClosure.dlg(drive, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-stop-button", closure, after);
  }

  /**
      Emitted when a mount is added.
  
    ## Parameters
    $(LIST
      * $(B mount)       a #GMount that was added.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias MountAddedCallbackDlg = void delegate(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias MountAddedCallbackFunc = void function(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to MountAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMountAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountAddedCallbackDlg) || is(T : MountAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto mount = getVal!(gio.mount.Mount)(&_paramVals[1]);
      _dClosure.dlg(mount, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-added", closure, after);
  }

  /**
      Emitted when a mount changes.
  
    ## Parameters
    $(LIST
      * $(B mount)       a #GMount that changed.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias MountChangedCallbackDlg = void delegate(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias MountChangedCallbackFunc = void function(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to MountChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMountChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountChangedCallbackDlg) || is(T : MountChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto mount = getVal!(gio.mount.Mount)(&_paramVals[1]);
      _dClosure.dlg(mount, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-changed", closure, after);
  }

  /**
      May be emitted when a mount is about to be removed.
    
    This signal depends on the backend and is only emitted if
    GIO was used to unmount.
  
    ## Parameters
    $(LIST
      * $(B mount)       a #GMount that is being unmounted.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias MountPreUnmountCallbackDlg = void delegate(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias MountPreUnmountCallbackFunc = void function(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to MountPreUnmount signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMountPreUnmount(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountPreUnmountCallbackDlg) || is(T : MountPreUnmountCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto mount = getVal!(gio.mount.Mount)(&_paramVals[1]);
      _dClosure.dlg(mount, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-pre-unmount", closure, after);
  }

  /**
      Emitted when a mount is removed.
  
    ## Parameters
    $(LIST
      * $(B mount)       a #GMount that was removed.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias MountRemovedCallbackDlg = void delegate(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias MountRemovedCallbackFunc = void function(gio.mount.Mount mount, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to MountRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMountRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountRemovedCallbackDlg) || is(T : MountRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto mount = getVal!(gio.mount.Mount)(&_paramVals[1]);
      _dClosure.dlg(mount, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-removed", closure, after);
  }

  /**
      Emitted when a mountable volume is added to the system.
  
    ## Parameters
    $(LIST
      * $(B volume)       a #GVolume that was added.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias VolumeAddedCallbackDlg = void delegate(gio.volume.Volume volume, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias VolumeAddedCallbackFunc = void function(gio.volume.Volume volume, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to VolumeAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectVolumeAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : VolumeAddedCallbackDlg) || is(T : VolumeAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto volume = getVal!(gio.volume.Volume)(&_paramVals[1]);
      _dClosure.dlg(volume, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("volume-added", closure, after);
  }

  /**
      Emitted when mountable volume is changed.
  
    ## Parameters
    $(LIST
      * $(B volume)       a #GVolume that changed.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias VolumeChangedCallbackDlg = void delegate(gio.volume.Volume volume, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias VolumeChangedCallbackFunc = void function(gio.volume.Volume volume, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to VolumeChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectVolumeChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : VolumeChangedCallbackDlg) || is(T : VolumeChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto volume = getVal!(gio.volume.Volume)(&_paramVals[1]);
      _dClosure.dlg(volume, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("volume-changed", closure, after);
  }

  /**
      Emitted when a mountable volume is removed from the system.
  
    ## Parameters
    $(LIST
      * $(B volume)       a #GVolume that was removed.
      * $(B volumeMonitor) the instance the signal is connected to
    )
  */
  alias VolumeRemovedCallbackDlg = void delegate(gio.volume.Volume volume, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /** ditto */
  alias VolumeRemovedCallbackFunc = void function(gio.volume.Volume volume, gio.volume_monitor.VolumeMonitor volumeMonitor);

  /**
    Connect to VolumeRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectVolumeRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : VolumeRemovedCallbackDlg) || is(T : VolumeRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto volumeMonitor = getVal!(gio.volume_monitor.VolumeMonitor)(_paramVals);
      auto volume = getVal!(gio.volume.Volume)(&_paramVals[1]);
      _dClosure.dlg(volume, volumeMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("volume-removed", closure, after);
  }
}
