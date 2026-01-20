/// Module for [Mount] interface
module gio.mount;

public import gio.mount_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.drive;
import gio.file;
import gio.icon;
import gio.mount_operation;
import gio.types;
import gio.volume;
import glib.error;
import gobject.dclosure;
import gobject.object;

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
interface Mount
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mount_get_type != &gidSymbolNotFound ? g_mount_get_type() : cast(GType)0;
  }

  /**
      Checks if mount can be ejected.
      Returns: true if the mount can be ejected.
  */
  bool canEject();

  /**
      Checks if mount can be unmounted.
      Returns: true if the mount can be unmounted.
  */
  bool canUnmount();

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
  void eject(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes ejecting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.mount.Mount.ejectWithOperationFinish] instead.
  */
  bool ejectFinish(gio.async_result.AsyncResult result);

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
  void ejectWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes ejecting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully ejected. false otherwise.
      Throws: [ErrorWrap]
  */
  bool ejectWithOperationFinish(gio.async_result.AsyncResult result);

  /**
      Gets the default location of mount. The default location of the given
      mount is a path that reflects the main entry point for the user (e.g.
      the home directory, or the root of the volume).
      Returns: a #GFile.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.file.File getDefaultLocation();

  /**
      Gets the drive for the mount.
      
      This is a convenience method for getting the #GVolume and then
      using that object to get the #GDrive.
      Returns: a #GDrive or null if mount is not
             associated with a volume or a drive.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.drive.Drive getDrive();

  /**
      Gets the icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.icon.Icon getIcon();

  /**
      Gets the name of mount.
      Returns: the name for the given mount.
            The returned string should be freed with [glib.global.gfree]
            when no longer needed.
  */
  string getName();

  /**
      Gets the root directory on mount.
      Returns: a #GFile.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.file.File getRoot();

  /**
      Gets the sort key for mount, if any.
      Returns: Sorting key for mount or null if no such key is available.
  */
  string getSortKey();

  /**
      Gets the symbolic icon for mount.
      Returns: a #GIcon.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.icon.Icon getSymbolicIcon();

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
  string getUuid();

  /**
      Gets the volume for the mount.
      Returns: a #GVolume or null if mount is not
             associated with a volume.
             The returned object should be unreffed with
             [gobject.object.ObjectWrap.unref] when no longer needed.
  */
  gio.volume.Volume getVolume();

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
  void guessContentType(bool forceRescan, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

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
  string[] guessContentTypeFinish(gio.async_result.AsyncResult result);

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
  string[] guessContentTypeSync(bool forceRescan, gio.cancellable.Cancellable cancellable = null);

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
  bool isShadowed();

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
  void remount(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes remounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully remounted. false otherwise.
      Throws: [ErrorWrap]
  */
  bool remountFinish(gio.async_result.AsyncResult result);

  /**
      Increments the shadow count on mount. Usually used by
      #GVolumeMonitor implementations when creating a shadow mount for
      mount, see [gio.mount.Mount.isShadowed] for more information. The caller
      will need to emit the #GMount::changed signal on mount manually.
  */
  void shadow();

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
  void unmount(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes unmounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully unmounted. false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.mount.Mount.unmountWithOperationFinish] instead.
  */
  bool unmountFinish(gio.async_result.AsyncResult result);

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
  void unmountWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes unmounting a mount. If any errors occurred during the operation,
      error will be set to contain the errors and false will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the mount was successfully unmounted. false otherwise.
      Throws: [ErrorWrap]
  */
  bool unmountWithOperationFinish(gio.async_result.AsyncResult result);

  /**
      Decrements the shadow count on mount. Usually used by
      #GVolumeMonitor implementations when destroying a shadow mount for
      mount, see [gio.mount.Mount.isShadowed] for more information. The caller
      will need to emit the #GMount::changed signal on mount manually.
  */
  void unshadow();

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
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectPreUnmount(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectUnmounted(T)(T callback, Flag!"After" after = No.After);
}
