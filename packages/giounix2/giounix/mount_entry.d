/// Module for [MountEntry] class
module giounix.mount_entry;

public import gid.basictypes;
import gid.gid;
import gio.icon;
import giounix.c.functions;
import giounix.c.types;
import giounix.types;
import gobject.boxed;
import gobject.object;

/**
    Defines a Unix mount entry (e.g. `/media/cdrom`).
    This corresponds roughly to a mtab entry.
*/
class MountEntry : gobject.boxed.BoxedWrap!(g_unix_mount_entry_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override MountEntry self() nothrow
  {
    return this;
  }

  /**
      Compares two Unix mounts.
  
      Params:
        mount2 = second [giounix.mount_entry.MountEntry] to compare
      Returns: `1`, `0` or `-1` if mount1 is greater than, equal to,
           or less than mount2, respectively
  */
  int compare(giounix.mount_entry.MountEntry mount2) nothrow
  {
    int _retval;
    _retval = g_unix_mount_entry_compare(cast(GUnixMountEntry*)this._cPtr, mount2 ? cast(GUnixMountEntry*)mount2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Makes a copy of mount_entry.
      Returns: a new [giounix.mount_entry.MountEntry]
  */
  giounix.mount_entry.MountEntry copy() nothrow
  {
    GUnixMountEntry* _cretval;
    _cretval = g_unix_mount_entry_copy(cast(GUnixMountEntry*)this._cPtr);
    auto _retval = _cretval ? new giounix.mount_entry.MountEntry(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the device path for a Unix mount.
      Returns: a string containing the device path
  */
  string getDevicePath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_entry_get_device_path(cast(GUnixMountEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the filesystem type for the Unix mount.
      Returns: a string containing the file system type
  */
  string getFsType() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_entry_get_fs_type(cast(GUnixMountEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the mount path for a Unix mount.
      Returns: the mount path for mount_entry
  */
  string getMountPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_entry_get_mount_path(cast(GUnixMountEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a comma separated list of mount options for the Unix mount.
      
      For example: `rw,relatime,seclabel,data=ordered`.
      
      This is similar to [giounix.mount_point.MountPoint.getOptions], but it takes
      a [giounix.mount_entry.MountEntry] as an argument.
      Returns: a string containing the options, or `NULL` if not
           available.
  */
  string getOptions() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_entry_get_options(cast(GUnixMountEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the root of the mount within the filesystem. This is useful e.g. for
      mounts created by bind operation, or btrfs subvolumes.
      
      For example, the root path is equal to `/` for a mount created by
      `mount /dev/sda1 /mnt/foo` and `/bar` for
      `mount --bind /mnt/foo/bar /mnt/bar`.
      Returns: a string containing the root, or `NULL` if not supported
  */
  string getRootPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_unix_mount_entry_get_root_path(cast(GUnixMountEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Guesses whether a Unix mount entry can be ejected.
      Returns: true if mount_entry is deemed to be ejectable; false otherwise
  */
  bool guessCanEject() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_entry_guess_can_eject(cast(GUnixMountEntry*)this._cPtr);
    return _retval;
  }

  /**
      Guesses the icon of a Unix mount entry.
      Returns: a [gio.icon.Icon]
  */
  gio.icon.Icon guessIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_unix_mount_entry_guess_icon(cast(GUnixMountEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Guesses the name of a Unix mount entry.
      
      The result is a translated string.
      Returns: a newly allocated translated string
  */
  string guessName() nothrow
  {
    char* _cretval;
    _cretval = g_unix_mount_entry_guess_name(cast(GUnixMountEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Guesses whether a Unix mount entry should be displayed in the UI.
      Returns: true if mount_entry is deemed to be displayable; false otherwise
  */
  bool guessShouldDisplay() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_entry_guess_should_display(cast(GUnixMountEntry*)this._cPtr);
    return _retval;
  }

  /**
      Guesses the symbolic icon of a Unix mount entry.
      Returns: a [gio.icon.Icon]
  */
  gio.icon.Icon guessSymbolicIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_unix_mount_entry_guess_symbolic_icon(cast(GUnixMountEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if a Unix mount is mounted read only.
      Returns: true if mount_entry is read only; false otherwise
  */
  bool isReadonly() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_entry_is_readonly(cast(GUnixMountEntry*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a Unix mount is a system mount.
      
      This is the Boolean OR of
      `funcGioUnix.is_system_fs_type`, `funcGioUnix.is_system_device_path` and
      `funcGioUnix.is_mount_path_system_internal` on mount_entry’s properties.
      
      The definition of what a ‘system’ mount entry is may change over time as new
      file system types and device paths are ignored.
      Returns: true if the Unix mount is for a system path; false otherwise
  */
  bool isSystemInternal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_mount_entry_is_system_internal(cast(GUnixMountEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [giounix.mount_entry.MountEntry] for a given mount path.
      
      If time_read is set, it will be filled with a Unix timestamp for checking
      if the mounts have changed since with
      `funcGioUnix.mount_entries_changed_since`.
      
      If more mounts have the same mount path, the last matching mount
      is returned.
      
      This will return `NULL` if there is no mount point at mount_path.
  
      Params:
        mountPath = path for a possible Unix mount
        timeRead = return location for a timestamp
      Returns: a [giounix.mount_entry.MountEntry]
  */
  static giounix.mount_entry.MountEntry at(string mountPath, out ulong timeRead) nothrow
  {
    GUnixMountEntry* _cretval;
    const(char)* _mountPath = mountPath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_unix_mount_entry_at(_mountPath, cast(ulong*)&timeRead);
    auto _retval = _cretval ? new giounix.mount_entry.MountEntry(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a [giounix.mount_entry.MountEntry] for a given file path.
      
      If time_read is set, it will be filled with a Unix timestamp for checking
      if the mounts have changed since with
      `funcGioUnix.mount_entries_changed_since`.
      
      If more mounts have the same mount path, the last matching mount
      is returned.
      
      This will return `NULL` if looking up the mount entry fails, if
      file_path doesn’t exist or there is an I/O error.
  
      Params:
        filePath = file path on some Unix mount
        timeRead = return location for a timestamp
      Returns: a [giounix.mount_entry.MountEntry]
  */
  static giounix.mount_entry.MountEntry for_(string filePath, out ulong timeRead) nothrow
  {
    GUnixMountEntry* _cretval;
    const(char)* _filePath = filePath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_unix_mount_entry_for(_filePath, cast(ulong*)&timeRead);
    auto _retval = _cretval ? new giounix.mount_entry.MountEntry(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
