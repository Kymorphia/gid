/// Module for [VolumeMonitor] class
module gid.gio2.volume_monitor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.drive;
import gid.gio2.mount;
import gid.gio2.types;
import gid.gio2.volume;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.volume_monitor.VolumeMonitor] is for listing the user interesting devices and volumes
    on the computer. In other words, what a file selector or file manager
    would show in a sidebar.
    
    [gid.gio2.volume_monitor.VolumeMonitor] is not
    thread-default-context aware (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]), and so should not be used
    other than from the main thread, with no thread-default-context active.
    
    In order to receive updates about volumes and mounts monitored through GVFS,
    a main loop must be running.
*/
class VolumeMonitor : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_volume_monitor_get_type != &gidSymbolNotFound ? g_volume_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GVolumeMonitor";
  }

  /** Returns `this`, for use in `with` statements. */
  override VolumeMonitor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.volume_monitor.VolumeMonitor]
      Returns: New builder object
  */
  static VolumeMonitorGidBuilder builder() nothrow
  {
    return new VolumeMonitorGidBuilder;
  }

  /**
      This function should be called by any #GVolumeMonitor
      implementation when a new #GMount object is created that is not
      associated with a #GVolume object. It must be called just before
      emitting the mount_added signal.
      
      If the return value is not null, the caller must associate the
      returned #GVolume object with the #GMount. This involves returning
      it in its [gid.gio2.mount.Mount.getVolume] implementation. The caller must
      also listen for the "removed" signal on the returned object
      and give up its reference when handling that signal
      
      Similarly, if implementing [gid.gio2.volume_monitor.VolumeMonitor.adoptOrphanMount],
      the implementor must take a reference to mount and return it in
      its [gid.gio2.volume.Volume.getMount] implemented. Also, the implementor must
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
        mount = a #GMount object to find a parent for
      Returns: the #GVolume object that is the parent for mount or null
        if no wants to adopt the #GMount.
  
      Deprecated: Instead of using this function, #GVolumeMonitor
        implementations should instead create shadow mounts with the URI of
        the mount they intend to adopt. See the proxy volume monitor in
        gvfs for an example of this. Also see [gid.gio2.mount.Mount.isShadowed],
        [gid.gio2.mount.Mount.shadow] and [gid.gio2.mount.Mount.unshadow] functions.
  */
  static gid.gio2.volume.Volume adoptOrphanMount(gid.gio2.mount.Mount mount) nothrow
  {
    GVolume* _cretval;
    _cretval = g_volume_monitor_adopt_orphan_mount(mount ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)mount)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the volume monitor used by gio.
      Returns: a reference to the #GVolumeMonitor used by gio. Call
           [gid.gobject2.object.ObjectWrap.unref] when done with it, after disconnecting any signal handlers.
  */
  static gid.gio2.volume_monitor.VolumeMonitor get() nothrow
  {
    GVolumeMonitor* _cretval;
    _cretval = g_volume_monitor_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume_monitor.VolumeMonitor)(cast(GVolumeMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncDriveChanged(gid.gio2.drive.Drive drive)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.driveChanged)
      return;

    _klass.driveChanged(cast(GVolumeMonitor*)this._cPtr, drive ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)drive)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDriveConnected(gid.gio2.drive.Drive drive)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.driveConnected)
      return;

    _klass.driveConnected(cast(GVolumeMonitor*)this._cPtr, drive ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)drive)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDriveDisconnected(gid.gio2.drive.Drive drive)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.driveDisconnected)
      return;

    _klass.driveDisconnected(cast(GVolumeMonitor*)this._cPtr, drive ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)drive)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDriveEjectButton(gid.gio2.drive.Drive drive)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.driveEjectButton)
      return;

    _klass.driveEjectButton(cast(GVolumeMonitor*)this._cPtr, drive ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)drive)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDriveStopButton(gid.gio2.drive.Drive drive)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.driveStopButton)
      return;

    _klass.driveStopButton(cast(GVolumeMonitor*)this._cPtr, drive ? cast(GDrive*)(cast(gid.gobject2.object.ObjectWrap)drive)._cPtr(No.Dup) : null);
  }

  /**
      Gets a list of drives connected to the system.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: a #GList of connected #GDrive objects.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetConnectedDrives` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.drive.Drive[] vfuncGetConnectedDrives()
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.getConnectedDrives)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getConnectedDrives(cast(GVolumeMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.drive.Drive, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds a #GMount object by its UUID (see [gid.gio2.mount.Mount.getUuid])
  
      Params:
        uuid = the UUID to look for
      Returns: a #GMount or null if no such mount is available.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetMountForUuid` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.mount.Mount vfuncGetMountForUuid(string uuid)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.getMountForUuid)
      return typeof(return).init;

    GMount* _cretval;
    const(char)* _uuid = uuid.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getMountForUuid(cast(GVolumeMonitor*)this._cPtr, _uuid);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of the mounts on the system.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: a #GList of #GMount objects.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetMounts` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.mount.Mount[] vfuncGetMounts()
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.getMounts)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getMounts(cast(GVolumeMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.mount.Mount, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds a #GVolume object by its UUID (see [gid.gio2.volume.Volume.getUuid])
  
      Params:
        uuid = the UUID to look for
      Returns: a #GVolume or null if no such volume is available.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetVolumeForUuid` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.volume.Volume vfuncGetVolumeForUuid(string uuid)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.getVolumeForUuid)
      return typeof(return).init;

    GVolume* _cretval;
    const(char)* _uuid = uuid.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getVolumeForUuid(cast(GVolumeMonitor*)this._cPtr, _uuid);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of the volumes on the system.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: a #GList of #GVolume objects.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetVolumes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.volume.Volume[] vfuncGetVolumes()
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.getVolumes)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getVolumes(cast(GVolumeMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.volume.Volume, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  protected void vfuncMountAdded(gid.gio2.mount.Mount mount)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.mountAdded)
      return;

    _klass.mountAdded(cast(GVolumeMonitor*)this._cPtr, mount ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)mount)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncMountChanged(gid.gio2.mount.Mount mount)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.mountChanged)
      return;

    _klass.mountChanged(cast(GVolumeMonitor*)this._cPtr, mount ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)mount)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncMountPreUnmount(gid.gio2.mount.Mount mount)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.mountPreUnmount)
      return;

    _klass.mountPreUnmount(cast(GVolumeMonitor*)this._cPtr, mount ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)mount)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncMountRemoved(gid.gio2.mount.Mount mount)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.mountRemoved)
      return;

    _klass.mountRemoved(cast(GVolumeMonitor*)this._cPtr, mount ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)mount)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncVolumeAdded(gid.gio2.volume.Volume volume)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.volumeAdded)
      return;

    _klass.volumeAdded(cast(GVolumeMonitor*)this._cPtr, volume ? cast(GVolume*)(cast(gid.gobject2.object.ObjectWrap)volume)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncVolumeChanged(gid.gio2.volume.Volume volume)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.volumeChanged)
      return;

    _klass.volumeChanged(cast(GVolumeMonitor*)this._cPtr, volume ? cast(GVolume*)(cast(gid.gobject2.object.ObjectWrap)volume)._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncVolumeRemoved(gid.gio2.volume.Volume volume)
  {
    auto _klass = cast(GVolumeMonitorClass*)_vfuncClass;
    if (!_klass.volumeRemoved)
      return;

    _klass.volumeRemoved(cast(GVolumeMonitor*)this._cPtr, volume ? cast(GVolume*)(cast(gid.gobject2.object.ObjectWrap)volume)._cPtr(No.Dup) : null);
  }

  /**
      Gets a list of drives connected to the system.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: a #GList of connected #GDrive objects.
  */
  gid.gio2.drive.Drive[] getConnectedDrives() nothrow
  {
    GList* _cretval;
    _cretval = g_volume_monitor_get_connected_drives(cast(GVolumeMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.drive.Drive, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds a #GMount object by its UUID (see [gid.gio2.mount.Mount.getUuid])
  
      Params:
        uuid = the UUID to look for
      Returns: a #GMount or null if no such mount is available.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.mount.Mount getMountForUuid(string uuid) nothrow
  {
    GMount* _cretval;
    const(char)* _uuid = uuid.toCString!(No.Malloc, No.Nullable);
    _cretval = g_volume_monitor_get_mount_for_uuid(cast(GVolumeMonitor*)this._cPtr, _uuid);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of the mounts on the system.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: a #GList of #GMount objects.
  */
  gid.gio2.mount.Mount[] getMounts() nothrow
  {
    GList* _cretval;
    _cretval = g_volume_monitor_get_mounts(cast(GVolumeMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.mount.Mount, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds a #GVolume object by its UUID (see [gid.gio2.volume.Volume.getUuid])
  
      Params:
        uuid = the UUID to look for
      Returns: a #GVolume or null if no such volume is available.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.volume.Volume getVolumeForUuid(string uuid) nothrow
  {
    GVolume* _cretval;
    const(char)* _uuid = uuid.toCString!(No.Malloc, No.Nullable);
    _cretval = g_volume_monitor_get_volume_for_uuid(cast(GVolumeMonitor*)this._cPtr, _uuid);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(GVolume*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of the volumes on the system.
      
      The returned list should be freed with [gid.glib2.list.List.free], after
      its elements have been unreffed with [gid.gobject2.object.ObjectWrap.unref].
      Returns: a #GList of #GVolume objects.
  */
  gid.gio2.volume.Volume[] getVolumes() nothrow
  {
    GList* _cretval;
    _cretval = g_volume_monitor_get_volumes(cast(GVolumeMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.volume.Volume, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Connect to `DriveChanged` signal.
  
      Emitted when a drive changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `drive` the drive that changed (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDriveChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.driveChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-changed", closure, after);
  }

  /**
      Connect to `DriveConnected` signal.
  
      Emitted when a drive is connected to the system.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `drive` a #GDrive that was connected. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDriveConnected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.driveConnected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-connected", closure, after);
  }

  /**
      Connect to `DriveDisconnected` signal.
  
      Emitted when a drive is disconnected from the system.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `drive` a #GDrive that was disconnected. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDriveDisconnected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.driveDisconnected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-disconnected", closure, after);
  }

  /**
      Connect to `DriveEjectButton` signal.
  
      Emitted when the eject button is pressed on drive.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `drive` the drive where the eject button was pressed (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDriveEjectButton(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.driveEjectButton");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-eject-button", closure, after);
  }

  /**
      Connect to `DriveStopButton` signal.
  
      Emitted when the stop button is pressed on drive.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.drive.Drive drive, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `drive` the drive where the stop button was pressed (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDriveStopButton(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.drive.Drive)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.driveStopButton");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drive-stop-button", closure, after);
  }

  /**
      Connect to `MountAdded` signal.
  
      Emitted when a mount is added.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `mount` a #GMount that was added. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.mountAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-added", closure, after);
  }

  /**
      Connect to `MountChanged` signal.
  
      Emitted when a mount changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `mount` a #GMount that changed. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.mountChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-changed", closure, after);
  }

  /**
      Connect to `MountPreUnmount` signal.
  
      May be emitted when a mount is about to be removed.
        
        This signal depends on the backend and is only emitted if
        GIO was used to unmount.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `mount` a #GMount that is being unmounted. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountPreUnmount(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.mountPreUnmount");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-pre-unmount", closure, after);
  }

  /**
      Connect to `MountRemoved` signal.
  
      Emitted when a mount is removed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount.Mount mount, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `mount` a #GMount that was removed. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount.Mount)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.mountRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount-removed", closure, after);
  }

  /**
      Connect to `VolumeAdded` signal.
  
      Emitted when a mountable volume is added to the system.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.volume.Volume volume, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `volume` a #GVolume that was added. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectVolumeAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.volume.Volume)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.volumeAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("volume-added", closure, after);
  }

  /**
      Connect to `VolumeChanged` signal.
  
      Emitted when mountable volume is changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.volume.Volume volume, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `volume` a #GVolume that changed. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectVolumeChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.volume.Volume)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.volumeChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("volume-changed", closure, after);
  }

  /**
      Connect to `VolumeRemoved` signal.
  
      Emitted when a mountable volume is removed from the system.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.volume.Volume volume, gid.gio2.volume_monitor.VolumeMonitor volumeMonitor)`
  
          `volume` a #GVolume that was removed. (optional)
  
          `volumeMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectVolumeRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.volume.Volume)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.volume_monitor.VolumeMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.volumeRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("volume-removed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VolumeMonitor
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.volume_monitor.VolumeMonitor), T.stringof ~ " is not derived from gid.gio2.volume_monitor.VolumeMonitor");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDriveChanged", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "drive_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDriveConnected", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "drive_connected");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDriveDisconnected", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "drive_disconnected");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDriveEjectButton", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "drive_eject_button");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDriveStopButton", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "drive_stop_button");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetConnectedDrives", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "get_connected_drives");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetMountForUuid", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "get_mount_for_uuid");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetMounts", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "get_mounts");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetVolumeForUuid", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "get_volume_for_uuid");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetVolumes", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "get_volumes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMountAdded", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "mount_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMountChanged", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "mount_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMountPreUnmount", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "mount_pre_unmount");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMountRemoved", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "mount_removed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVolumeAdded", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "volume_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVolumeChanged", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "volume_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVolumeRemoved", true)[0]) == gid.gio2.volume_monitor.VolumeMonitor))
      _installVfunc(klass, "volume_removed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GVolumeMonitorClass*)klass;

    switch (vfunc)
    {
      case "drive_changed":
      {
        static extern(C) void _vfuncDriveChangedTramp(GVolumeMonitor* volumeMonitor, GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.driveChanged)
              return (cast(typeof(&_vfuncDriveChangedTramp))_klass.driveChanged)(volumeMonitor, drive);
            return;
          }

          try
          {
            _obj.vfuncDriveChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(void*)drive, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncDriveChanged");
          }
        }

        _klass.driveChanged = cast(typeof(_klass.driveChanged))&_vfuncDriveChangedTramp;
        break;
      }
      case "drive_connected":
      {
        static extern(C) void _vfuncDriveConnectedTramp(GVolumeMonitor* volumeMonitor, GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.driveConnected)
              return (cast(typeof(&_vfuncDriveConnectedTramp))_klass.driveConnected)(volumeMonitor, drive);
            return;
          }

          try
          {
            _obj.vfuncDriveConnected(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(void*)drive, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncDriveConnected");
          }
        }

        _klass.driveConnected = cast(typeof(_klass.driveConnected))&_vfuncDriveConnectedTramp;
        break;
      }
      case "drive_disconnected":
      {
        static extern(C) void _vfuncDriveDisconnectedTramp(GVolumeMonitor* volumeMonitor, GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.driveDisconnected)
              return (cast(typeof(&_vfuncDriveDisconnectedTramp))_klass.driveDisconnected)(volumeMonitor, drive);
            return;
          }

          try
          {
            _obj.vfuncDriveDisconnected(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(void*)drive, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncDriveDisconnected");
          }
        }

        _klass.driveDisconnected = cast(typeof(_klass.driveDisconnected))&_vfuncDriveDisconnectedTramp;
        break;
      }
      case "drive_eject_button":
      {
        static extern(C) void _vfuncDriveEjectButtonTramp(GVolumeMonitor* volumeMonitor, GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.driveEjectButton)
              return (cast(typeof(&_vfuncDriveEjectButtonTramp))_klass.driveEjectButton)(volumeMonitor, drive);
            return;
          }

          try
          {
            _obj.vfuncDriveEjectButton(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(void*)drive, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncDriveEjectButton");
          }
        }

        _klass.driveEjectButton = cast(typeof(_klass.driveEjectButton))&_vfuncDriveEjectButtonTramp;
        break;
      }
      case "drive_stop_button":
      {
        static extern(C) void _vfuncDriveStopButtonTramp(GVolumeMonitor* volumeMonitor, GDrive* drive) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.driveStopButton)
              return (cast(typeof(&_vfuncDriveStopButtonTramp))_klass.driveStopButton)(volumeMonitor, drive);
            return;
          }

          try
          {
            _obj.vfuncDriveStopButton(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.drive.Drive)(cast(void*)drive, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncDriveStopButton");
          }
        }

        _klass.driveStopButton = cast(typeof(_klass.driveStopButton))&_vfuncDriveStopButtonTramp;
        break;
      }
      case "get_connected_drives":
      {
        static extern(C) GList* _vfuncGetConnectedDrivesTramp(GVolumeMonitor* volumeMonitor) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.getConnectedDrives)
              return (cast(typeof(&_vfuncGetConnectedDrivesTramp))_klass.getConnectedDrives)(volumeMonitor);
            return typeof(return).init;
          }

          gid.gio2.drive.Drive[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetConnectedDrives();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncGetConnectedDrives");
          }
          auto _retval = gListFromD!(gid.gio2.drive.Drive)(_dretval);

          return _retval;
        }

        _klass.getConnectedDrives = cast(typeof(_klass.getConnectedDrives))&_vfuncGetConnectedDrivesTramp;
        break;
      }
      case "get_mount_for_uuid":
      {
        static extern(C) GMount* _vfuncGetMountForUuidTramp(GVolumeMonitor* volumeMonitor, const(char)* uuid) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.getMountForUuid)
              return (cast(typeof(&_vfuncGetMountForUuidTramp))_klass.getMountForUuid)(volumeMonitor, uuid);
            return typeof(return).init;
          }

          gid.gio2.mount.Mount _dretval;
          string _uuid = uuid.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetMountForUuid(_uuid);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncGetMountForUuid");
          }
          auto _retval = _dretval ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getMountForUuid = cast(typeof(_klass.getMountForUuid))&_vfuncGetMountForUuidTramp;
        break;
      }
      case "get_mounts":
      {
        static extern(C) GList* _vfuncGetMountsTramp(GVolumeMonitor* volumeMonitor) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.getMounts)
              return (cast(typeof(&_vfuncGetMountsTramp))_klass.getMounts)(volumeMonitor);
            return typeof(return).init;
          }

          gid.gio2.mount.Mount[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetMounts();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncGetMounts");
          }
          auto _retval = gListFromD!(gid.gio2.mount.Mount)(_dretval);

          return _retval;
        }

        _klass.getMounts = cast(typeof(_klass.getMounts))&_vfuncGetMountsTramp;
        break;
      }
      case "get_volume_for_uuid":
      {
        static extern(C) GVolume* _vfuncGetVolumeForUuidTramp(GVolumeMonitor* volumeMonitor, const(char)* uuid) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.getVolumeForUuid)
              return (cast(typeof(&_vfuncGetVolumeForUuidTramp))_klass.getVolumeForUuid)(volumeMonitor, uuid);
            return typeof(return).init;
          }

          gid.gio2.volume.Volume _dretval;
          string _uuid = uuid.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetVolumeForUuid(_uuid);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncGetVolumeForUuid");
          }
          auto _retval = _dretval ? cast(GVolume*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getVolumeForUuid = cast(typeof(_klass.getVolumeForUuid))&_vfuncGetVolumeForUuidTramp;
        break;
      }
      case "get_volumes":
      {
        static extern(C) GList* _vfuncGetVolumesTramp(GVolumeMonitor* volumeMonitor) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.getVolumes)
              return (cast(typeof(&_vfuncGetVolumesTramp))_klass.getVolumes)(volumeMonitor);
            return typeof(return).init;
          }

          gid.gio2.volume.Volume[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetVolumes();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncGetVolumes");
          }
          auto _retval = gListFromD!(gid.gio2.volume.Volume)(_dretval);

          return _retval;
        }

        _klass.getVolumes = cast(typeof(_klass.getVolumes))&_vfuncGetVolumesTramp;
        break;
      }
      case "mount_added":
      {
        static extern(C) void _vfuncMountAddedTramp(GVolumeMonitor* volumeMonitor, GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.mountAdded)
              return (cast(typeof(&_vfuncMountAddedTramp))_klass.mountAdded)(volumeMonitor, mount);
            return;
          }

          try
          {
            _obj.vfuncMountAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(void*)mount, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncMountAdded");
          }
        }

        _klass.mountAdded = cast(typeof(_klass.mountAdded))&_vfuncMountAddedTramp;
        break;
      }
      case "mount_changed":
      {
        static extern(C) void _vfuncMountChangedTramp(GVolumeMonitor* volumeMonitor, GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.mountChanged)
              return (cast(typeof(&_vfuncMountChangedTramp))_klass.mountChanged)(volumeMonitor, mount);
            return;
          }

          try
          {
            _obj.vfuncMountChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(void*)mount, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncMountChanged");
          }
        }

        _klass.mountChanged = cast(typeof(_klass.mountChanged))&_vfuncMountChangedTramp;
        break;
      }
      case "mount_pre_unmount":
      {
        static extern(C) void _vfuncMountPreUnmountTramp(GVolumeMonitor* volumeMonitor, GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.mountPreUnmount)
              return (cast(typeof(&_vfuncMountPreUnmountTramp))_klass.mountPreUnmount)(volumeMonitor, mount);
            return;
          }

          try
          {
            _obj.vfuncMountPreUnmount(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(void*)mount, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncMountPreUnmount");
          }
        }

        _klass.mountPreUnmount = cast(typeof(_klass.mountPreUnmount))&_vfuncMountPreUnmountTramp;
        break;
      }
      case "mount_removed":
      {
        static extern(C) void _vfuncMountRemovedTramp(GVolumeMonitor* volumeMonitor, GMount* mount) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.mountRemoved)
              return (cast(typeof(&_vfuncMountRemovedTramp))_klass.mountRemoved)(volumeMonitor, mount);
            return;
          }

          try
          {
            _obj.vfuncMountRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(void*)mount, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncMountRemoved");
          }
        }

        _klass.mountRemoved = cast(typeof(_klass.mountRemoved))&_vfuncMountRemovedTramp;
        break;
      }
      case "volume_added":
      {
        static extern(C) void _vfuncVolumeAddedTramp(GVolumeMonitor* volumeMonitor, GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.volumeAdded)
              return (cast(typeof(&_vfuncVolumeAddedTramp))_klass.volumeAdded)(volumeMonitor, volume);
            return;
          }

          try
          {
            _obj.vfuncVolumeAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(void*)volume, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncVolumeAdded");
          }
        }

        _klass.volumeAdded = cast(typeof(_klass.volumeAdded))&_vfuncVolumeAddedTramp;
        break;
      }
      case "volume_changed":
      {
        static extern(C) void _vfuncVolumeChangedTramp(GVolumeMonitor* volumeMonitor, GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.volumeChanged)
              return (cast(typeof(&_vfuncVolumeChangedTramp))_klass.volumeChanged)(volumeMonitor, volume);
            return;
          }

          try
          {
            _obj.vfuncVolumeChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(void*)volume, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncVolumeChanged");
          }
        }

        _klass.volumeChanged = cast(typeof(_klass.volumeChanged))&_vfuncVolumeChangedTramp;
        break;
      }
      case "volume_removed":
      {
        static extern(C) void _vfuncVolumeRemovedTramp(GVolumeMonitor* volumeMonitor, GVolume* volume) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.volume_monitor.VolumeMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)volumeMonitor);
          if (!_obj)
          {
            auto _klass = cast(GVolumeMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)volumeMonitor);
            if (_klass.volumeRemoved)
              return (cast(typeof(&_vfuncVolumeRemovedTramp))_klass.volumeRemoved)(volumeMonitor, volume);
            return;
          }

          try
          {
            _obj.vfuncVolumeRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.volume.Volume)(cast(void*)volume, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.volume_monitor.VolumeMonitor.vfuncVolumeRemoved");
          }
        }

        _klass.volumeRemoved = cast(typeof(_klass.volumeRemoved))&_vfuncVolumeRemovedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.volume_monitor.VolumeMonitor]
class VolumeMonitorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.volume_monitor.VolumeMonitor]
final class VolumeMonitorGidBuilder : VolumeMonitorGidBuilderImpl!VolumeMonitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VolumeMonitor build() nothrow
  {
    return new VolumeMonitor(cast(void*)createGObject(VolumeMonitor._getGType), Yes.Take);
  }
}
