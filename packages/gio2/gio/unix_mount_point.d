/// Module for [UnixMountPoint] class
module gio.unix_mount_point;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.icon;
import gio.types;
import gobject.boxed;
import gobject.object;

/**
    Defines a Unix mount point (e.g. <filename>/dev</filename>).
    This corresponds roughly to a fstab entry.
*/
class UnixMountPoint : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_mount_point_get_type != &gidSymbolNotFound ? g_unix_mount_point_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixMountPoint self()
  {
    return this;
  }

  /**
      Compares two unix mount points.
  
      Params:
        mount2 = a #GUnixMount.
      Returns: 1, 0 or -1 if mount1 is greater than, equal to,
        or less than mount2, respectively.
  */
  int compare(gio.unix_mount_point.UnixMountPoint mount2)
  {
    int _retval;
    _retval = g_unix_mount_point_compare(cast(GUnixMountPoint*)this._cPtr, mount2 ? cast(GUnixMountPoint*)mount2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Makes a copy of mount_point.
      Returns: a new #GUnixMountPoint
  */
  gio.unix_mount_point.UnixMountPoint copy()
  {
    GUnixMountPoint* _cretval;
    _cretval = g_unix_mount_point_copy(cast(GUnixMountPoint*)this._cPtr);
    auto _retval = _cretval ? new gio.unix_mount_point.UnixMountPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the device path for a unix mount point.
      Returns: a string containing the device path.
  */
  string getDevicePath()
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_device_path(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the file system type for the mount point.
      Returns: a string containing the file system type.
  */
  string getFsType()
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_fs_type(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the mount path for a unix mount point.
      Returns: a string containing the mount path.
  */
  string getMountPath()
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_mount_path(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the options for the mount point.
      Returns: a string containing the options.
  */
  string getOptions()
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_point_get_options(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Guesses whether a Unix mount point can be ejected.
      Returns: true if mount_point is deemed to be ejectable.
  */
  bool guessCanEject()
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_guess_can_eject(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Guesses the icon of a Unix mount point.
      Returns: a #GIcon
  */
  gio.icon.Icon guessIcon()
  {
    GIcon* _cretval;
    _cretval = g_unix_mount_point_guess_icon(cast(GUnixMountPoint*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Guesses the name of a Unix mount point.
      The result is a translated string.
      Returns: A newly allocated string that must
            be freed with [glib.global.gfree]
  */
  string guessName()
  {
    char* _cretval;
    _cretval = g_unix_mount_point_guess_name(cast(GUnixMountPoint*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Guesses the symbolic icon of a Unix mount point.
      Returns: a #GIcon
  */
  gio.icon.Icon guessSymbolicIcon()
  {
    GIcon* _cretval;
    _cretval = g_unix_mount_point_guess_symbolic_icon(cast(GUnixMountPoint*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if a unix mount point is a loopback device.
      Returns: true if the mount point is a loopback. false otherwise.
  */
  bool isLoopback()
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_is_loopback(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a unix mount point is read only.
      Returns: true if a mount point is read only.
  */
  bool isReadonly()
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_is_readonly(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a unix mount point is mountable by the user.
      Returns: true if the mount point is user mountable.
  */
  bool isUserMountable()
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_point_is_user_mountable(cast(GUnixMountPoint*)this._cPtr);
    return _retval;
  }

  /**
      Gets a #GUnixMountPoint for a given mount path. If time_read is set, it
      will be filled with a unix timestamp for checking if the mount points have
      changed since with [gio.global.unixMountPointsChangedSince].
      
      If more mount points have the same mount path, the last matching mount point
      is returned.
  
      Params:
        mountPath = path for a possible unix mount point.
        timeRead = guint64 to contain a timestamp.
      Returns: a #GUnixMountPoint, or null if no match
        is found.
  */
  static gio.unix_mount_point.UnixMountPoint at(string mountPath, out ulong timeRead)
  {
    GUnixMountPoint* _cretval;
    const(char)* _mountPath = mountPath.toCString(No.Alloc);
    _cretval = g_unix_mount_point_at(_mountPath, cast(ulong*)&timeRead);
    auto _retval = _cretval ? new gio.unix_mount_point.UnixMountPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
