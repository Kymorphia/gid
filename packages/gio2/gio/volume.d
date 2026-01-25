/// Module for [Volume] interface
module gio.volume;

public import gio.volume_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.drive;
import gio.file;
import gio.icon;
import gio.mount;
import gio.mount_operation;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

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
    [gio.types.VOLUME_IDENTIFIER_KIND_UUID], [gio.types.VOLUME_IDENTIFIER_KIND_LABEL], etc.
    Use [gio.volume.Volume.getIdentifier] to obtain an identifier for a volume.
    
    Note that [gio.types.VOLUME_IDENTIFIER_KIND_HAL_UDI] will only be available
    when the GVFS hal volume monitor is in use. Other volume monitors
    will generally be able to provide the [gio.types.VOLUME_IDENTIFIER_KIND_UNIX_DEVICE]
    identifier, which can be used to obtain a hal device by means of
    `libhal_manager_find_device_string_match()`.
*/
interface Volume
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_volume_get_type != &gidSymbolNotFound ? g_volume_get_type() : cast(GType)0;
  }

  /**
      Checks if a volume can be ejected.
      Returns: true if the volume can be ejected. false otherwise
  */
  bool canEject();

  /**
      Checks if a volume can be mounted.
      Returns: true if the volume can be mounted. false otherwise
  */
  bool canMount();

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
  void eject(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true, false if operation failed
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.volume.Volume.ejectWithOperationFinish] instead.
  */
  bool ejectFinish(gio.async_result.AsyncResult result);

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
  void ejectWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes ejecting a volume. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult
      Returns: true if the volume was successfully ejected. false otherwise
      Throws: [ErrorWrap]
  */
  bool ejectWithOperationFinish(gio.async_result.AsyncResult result);

  /**
      Gets the kinds of [identifiers](#volume-identifiers) that volume has.
      Use [gio.volume.Volume.getIdentifier] to obtain the identifiers themselves.
      Returns: a null-terminated array
          of strings containing kinds of identifiers. Use [glib.global.strfreev] to free.
  */
  string[] enumerateIdentifiers();

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
  gio.file.File getActivationRoot();

  /**
      Gets the drive for the volume.
      Returns: a #GDrive or null if volume is not
            associated with a drive. The returned object should be unreffed
            with [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.drive.Drive getDrive();

  /**
      Gets the icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gobject.object.ObjectWrap.unref]
            when no longer needed.
  */
  gio.icon.Icon getIcon();

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
  string getIdentifier(string kind);

  /**
      Gets the mount for the volume.
      Returns: a #GMount or null if volume isn't mounted.
            The returned object should be unreffed with [gobject.object.ObjectWrap.unref]
            when no longer needed.
  */
  gio.mount.Mount getMount();

  /**
      Gets the name of volume.
      Returns: the name for the given volume. The returned string should
            be freed with [glib.global.gfree] when no longer needed.
  */
  string getName();

  /**
      Gets the sort key for volume, if any.
      Returns: Sorting key for volume or null if no such key is available
  */
  string getSortKey();

  /**
      Gets the symbolic icon for volume.
      Returns: a #GIcon.
            The returned object should be unreffed with [gobject.object.ObjectWrap.unref]
            when no longer needed.
  */
  gio.icon.Icon getSymbolicIcon();

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
  string getUuid();

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
  void mount(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

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
  bool mountFinish(gio.async_result.AsyncResult result);

  /**
      Returns whether the volume should be automatically mounted.
      Returns: true if the volume should be automatically mounted
  */
  bool shouldAutomount();

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
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectRemoved(T)(T callback, Flag!"After" after = No.After);
}
