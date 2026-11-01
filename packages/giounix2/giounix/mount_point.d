/// Module for [MountPoint] class
module giounix.mount_point;

public import gid.basictypes;
import gid.gid;
import gio.icon;
import giounix.c.functions;
import giounix.c.types;
import giounix.types;
import gobject.boxed;
import gobject.object;

/**
    Defines a Unix mount point (e.g. `/dev`).
    This corresponds roughly to a fstab entry.
*/
class MountPoint : gobject.boxed.BoxedWrap!(g_unix_mount_point_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override MountPoint self() nothrow
  {
    return this;
  }

  /**
      Compares two Unix mount points.
  
      Params:
        mount2 = a [giounix.mount_point.MountPoint]
      Returns: `1`, `0` or `-1` if mount1 is greater than, equal to,
           or less than mount2, respectively
  */
  int compare(giounix.mount_point.MountPoint mount2) nothrow
  {
    int _retval;
    _retval = g_unix_mount_point_compare(cast(GUnixMountPoint*)this._cPtr, mount2 ? cast(GUnixMountPoint*)mount2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Makes a copy of mount_point.
      Returns: a new [giounix.mount_point.MountPoint]
  */
  giounix.mount_point.MountPoint copy() nothrow
  {
    GUnixMountPoint* _cretval;
    _cretval = g_unix_mount_point_copy(cast(GUnixMountPoint*)this._cPtr);
    auto _retval = _cretval ? new giounix.mount_point.MountPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the device path for a Unix mount point.
      Returns: a string containing the device path
  */
  string getDevicePath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_device_path(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the file system type for the mount point.
      Returns: a string containing the file system type
  */
  string getFsType() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_fs_type(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the mount path for a Unix mount point.
      Returns: a string containing the mount path
  */
  string getMountPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_mount_path(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the options for the mount point.
      Returns: a string containing the options
  */
  string getOptions() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_options(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Guesses whether a Unix mount point can be ejected.
      Returns: true if mount_point is deemed to be ejectable; false otherwise
  */
  bool guessCanEject() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_guess_can_eject(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Guesses the icon of a Unix mount point.
      Returns: a [gio.icon.Icon]
  */
  gio.icon.Icon guessIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_unix_mount_point_guess_icon(cast(GUnixMountPoint*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Guesses the name of a Unix mount point.
      
      The result is a translated string.
      Returns: a newly allocated translated string
  */
  string guessName() nothrow
  {
    char* _cretval;
    _cretval = g_unix_mount_point_guess_name(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Guesses the symbolic icon of a Unix mount point.
      Returns: a [gio.icon.Icon]
  */
  gio.icon.Icon guessSymbolicIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_unix_mount_point_guess_symbolic_icon(cast(GUnixMountPoint*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if a Unix mount point is a loopback device.
      Returns: true if the mount point is a loopback device; false otherwise
  */
  bool isLoopback() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_is_loopback(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a Unix mount point is read only.
      Returns: true if a mount point is read only; false otherwise
  */
  bool isReadonly() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_is_readonly(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a Unix mount point is mountable by the user.
      Returns: true if the mount point is user mountable; false otherwise
  */
  bool isUserMountable() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_is_user_mountable(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [giounix.mount_point.MountPoint] for a given mount path.
      
      If time_read is set, it will be filled with a Unix timestamp for checking if
      the mount points have changed since with
      `funcGioUnix.mount_points_changed_since`.
      
      If more mount points have the same mount path, the last matching mount point
      is returned.
  
      Params:
        mountPath = path for a possible Unix mount point
        timeRead = return location for a timestamp
      Returns: a [giounix.mount_point.MountPoint], or `NULL`
           if no match is found
  */
  static giounix.mount_point.MountPoint at(string mountPath, out ulong timeRead) nothrow
  {
    GUnixMountPoint* _cretval;
    const(char)* _mountPath = mountPath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_unix_mount_point_at(_mountPath, cast(ulong*)&timeRead);
    auto _retval = _cretval ? new giounix.mount_point.MountPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
