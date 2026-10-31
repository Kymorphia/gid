/// Global functions for giounix2 library
module giounix.global;

import gid.gid;
import gio.icon;
import giounix.c.functions;
import giounix.c.types;
import giounix.mount_entry;
import giounix.mount_point;
import giounix.types;
import gobject.object;


/**
    Determines if mount_path is considered an implementation of the
    OS.
    
    This is primarily used for hiding mountable and mounted volumes
    that only are used in the OS and has little to no relevance to the
    casual user.

    Params:
      mountPath = a mount path, e.g. `/media/disk` or `/usr`
    Returns: true if mount_path is considered an implementation detail
         of the OS; false otherwise
*/
bool isMountPathSystemInternal(string mountPath) nothrow
{
  bool _retval;
  const(char)* _mountPath = mountPath.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)g_unix_is_mount_path_system_internal(_mountPath);
  return _retval;
}

/**
    Determines if device_path is considered a block device path which is only
    used in implementation of the OS.
    
    This is primarily used for hiding mounted volumes that are intended as APIs
    for programs to read, and system administrators at a shell; rather than
    something that should, for example, appear in a GUI. For example, the Linux
    `/proc` filesystem.
    
    The list of device paths considered ‘system’ ones may change over time.

    Params:
      devicePath = a device path, e.g. `/dev/loop0` or `nfsd`
    Returns: true if device_path is considered an implementation detail of
         the OS; false otherwise
*/
bool isSystemDevicePath(string devicePath) nothrow
{
  bool _retval;
  const(char)* _devicePath = devicePath.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)g_unix_is_system_device_path(_devicePath);
  return _retval;
}

/**
    Determines if fs_type is considered a type of file system which is only
    used in implementation of the OS.
    
    This is primarily used for hiding mounted volumes that are intended as APIs
    for programs to read, and system administrators at a shell; rather than
    something that should, for example, appear in a GUI. For example, the Linux
    `/proc` filesystem.
    
    The list of file system types considered ‘system’ ones may change over time.

    Params:
      fsType = a file system type, e.g. `procfs` or `tmpfs`
    Returns: true if fs_type is considered an implementation detail of the OS;
         false otherwise
*/
bool isSystemFsType(string fsType) nothrow
{
  bool _retval;
  const(char)* _fsType = fsType.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)g_unix_is_system_fs_type(_fsType);
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

    Deprecated: Use [giounix.mount_entry.MountEntry.at] instead.
*/
giounix.mount_entry.MountEntry mountAt(string mountPath, out ulong timeRead) nothrow
{
  GUnixMountEntry* _cretval;
  const(char)* _mountPath = mountPath.toCString!(No.Malloc, No.Nullable);
  _cretval = g_unix_mount_at(_mountPath, cast(ulong*)&timeRead);
  auto _retval = _cretval ? new giounix.mount_entry.MountEntry(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Compares two Unix mounts.

    Params:
      mount1 = first [giounix.mount_entry.MountEntry] to compare
      mount2 = second [giounix.mount_entry.MountEntry] to compare
    Returns: `1`, `0` or `-1` if mount1 is greater than, equal to,
         or less than mount2, respectively

    Deprecated: Use [giounix.mount_entry.MountEntry.compare] instead.
*/
int mountCompare(giounix.mount_entry.MountEntry mount1, giounix.mount_entry.MountEntry mount2) nothrow
{
  int _retval;
  _retval = g_unix_mount_compare(mount1 ? cast(GUnixMountEntry*)mount1._cPtr(No.Dup) : null, mount2 ? cast(GUnixMountEntry*)mount2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes a copy of mount_entry.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a new [giounix.mount_entry.MountEntry]

    Deprecated: Use [giounix.mount_entry.MountEntry.copy] instead.
*/
giounix.mount_entry.MountEntry mountCopy(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  GUnixMountEntry* _cretval;
  _cretval = g_unix_mount_copy(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new giounix.mount_entry.MountEntry(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Checks if the Unix mounts have changed since a given Unix time.
    
    This can only work reliably if a [giounix.mount_monitor.MountMonitor] is running in
    the process, otherwise changes in the mount entries file (such as
    `/proc/self/mountinfo` on Linux) cannot be detected and, as a result, this
    function has to conservatively always return `TRUE`.
    
    It is more efficient to use [giounix.mount_monitor.MountMonitor.mountsChanged] to
    be signalled of changes to the mount entries, rather than polling using this
    function. This function is more appropriate for infrequently determining
    cache validity.

    Params:
      time = a timestamp
    Returns: true if the mounts have changed since time; false otherwise
      Since 2.84
*/
bool mountEntriesChangedSince(ulong time) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_entries_changed_since(time);
  return _retval;
}

/**
    Gets a list of [giounix.mount_entry.MountEntry] instances representing the Unix
    mounts.
    
    If time_read is set, it will be filled with the mount timestamp, allowing
    for checking if the mounts have changed with
    `funcGioUnix.mount_entries_changed_since`.

    Params:
      timeRead = return location for a timestamp
    Returns: a list of the
         Unix mounts
*/
giounix.mount_entry.MountEntry[] mountEntriesGet(out ulong timeRead) nothrow
{
  GList* _cretval;
  _cretval = g_unix_mount_entries_get(cast(ulong*)&timeRead);
  auto _retval = gListToD!(giounix.mount_entry.MountEntry, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Gets an array of [giounix.mount_entry.MountEntry]s containing the Unix mounts
    listed in table_path.
    
    This is a generalized version of `funcGioUnix.mount_entries_get`, mainly
    intended for internal testing use. Note that `funcGioUnix.mount_entries_get`
    may parse multiple hierarchical table files, so this function is not a direct
    superset of its functionality.
    
    If there is an error reading or parsing the file, `NULL` will be returned
    and both out parameters will be set to `0`.

    Params:
      tablePath = path to the mounts table file (for example `/proc/self/mountinfo`)
      timeReadOut = return location for the
          modification time of table_path
    Returns: mount
        entries, or `NULL` if there was an error loading them
*/
giounix.mount_entry.MountEntry[] mountEntriesGetFromFile(string tablePath, out ulong timeReadOut) nothrow
{
  GUnixMountEntry** _cretval;
  size_t _cretlength;
  const(char)* _tablePath = tablePath.toCString!(No.Malloc, No.Nullable);
  _cretval = g_unix_mount_entries_get_from_file(_tablePath, cast(ulong*)&timeReadOut, &_cretlength);
  giounix.mount_entry.MountEntry[] _retval;

  if (_cretval)
  {
    _retval = new giounix.mount_entry.MountEntry[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = new giounix.mount_entry.MountEntry(cast(void*)_cretval[i], Yes.Take);
    gFree(cast(void*)_cretval);
  }
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

    Deprecated: Use [giounix.mount_entry.MountEntry.for_] instead.
*/
giounix.mount_entry.MountEntry mountFor(string filePath, out ulong timeRead) nothrow
{
  GUnixMountEntry* _cretval;
  const(char)* _filePath = filePath.toCString!(No.Malloc, No.Nullable);
  _cretval = g_unix_mount_for(_filePath, cast(ulong*)&timeRead);
  auto _retval = _cretval ? new giounix.mount_entry.MountEntry(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Frees a Unix mount.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]

    Deprecated: Use [giounix.mount_entry.MountEntry.free] instead.
*/
void mountFree(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  g_unix_mount_free(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
}

/**
    Gets the device path for a Unix mount.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a string containing the device path

    Deprecated: Use [giounix.mount_entry.MountEntry.getDevicePath] instead.
*/
string mountGetDevicePath(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_device_path(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Gets the filesystem type for the Unix mount.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a string containing the file system type

    Deprecated: Use [giounix.mount_entry.MountEntry.getFsType] instead.
*/
string mountGetFsType(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_fs_type(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Gets the mount path for a Unix mount.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry] to get the mount path for
    Returns: the mount path for mount_entry

    Deprecated: Use [giounix.mount_entry.MountEntry.getMountPath] instead.
*/
string mountGetMountPath(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_mount_path(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Gets a comma separated list of mount options for the Unix mount.
    
    For example: `rw,relatime,seclabel,data=ordered`.
    
    This is similar to [giounix.mount_point.MountPoint.getOptions], but it takes
    a [giounix.mount_entry.MountEntry] as an argument.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a string containing the options, or `NULL` if not
         available.

    Deprecated: Use [giounix.mount_entry.MountEntry.getOptions] instead.
*/
string mountGetOptions(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_options(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Gets the root of the mount within the filesystem.
    
    This is useful e.g. for mounts created by bind operation, or btrfs subvolumes.
    
    For example, the root path is equal to `/` for a mount created by
    `mount /dev/sda1 /mnt/foo` and `/bar` for
    `mount --bind /mnt/foo/bar /mnt/bar`.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a string containing the root, or `NULL` if not supported

    Deprecated: Use [giounix.mount_entry.MountEntry.getRootPath] instead.
*/
string mountGetRootPath(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_root_path(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Guesses whether a Unix mount entry can be ejected.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: true if mount_entry is deemed to be ejectable; false otherwise

    Deprecated: Use [giounix.mount_entry.MountEntry.guessCanEject] instead.
*/
bool mountGuessCanEject(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_guess_can_eject(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Guesses the icon of a Unix mount entry.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a [gio.icon.Icon]

    Deprecated: Use [giounix.mount_entry.MountEntry.guessIcon] instead.
*/
gio.icon.Icon mountGuessIcon(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  GIcon* _cretval;
  _cretval = g_unix_mount_guess_icon(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
  return _retval;
}

/**
    Guesses the name of a Unix mount entry.
    
    The result is a translated string.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a newly allocated translated string

    Deprecated: Use [giounix.mount_entry.MountEntry.guessName] instead.
*/
string mountGuessName(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  char* _cretval;
  _cretval = g_unix_mount_guess_name(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Guesses whether a Unix mount entry should be displayed in the UI.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: true if mount_entry is deemed to be displayable; false otherwise

    Deprecated: Use [giounix.mount_entry.MountEntry.guessShouldDisplay] instead.
*/
bool mountGuessShouldDisplay(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_guess_should_display(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Guesses the symbolic icon of a Unix mount entry.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: a [gio.icon.Icon]

    Deprecated: Use [giounix.mount_entry.MountEntry.guessSymbolicIcon] instead.
*/
gio.icon.Icon mountGuessSymbolicIcon(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  GIcon* _cretval;
  _cretval = g_unix_mount_guess_symbolic_icon(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
  return _retval;
}

/**
    Checks if a Unix mount is mounted read only.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: true if mount_entry is read only; false otherwise

    Deprecated: Use [giounix.mount_entry.MountEntry.isReadonly] instead.
*/
bool mountIsReadonly(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_is_readonly(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Checks if a Unix mount is a system mount.
    
    This is the Boolean OR of
    `funcGioUnix.is_system_fs_type`, `funcGioUnix.is_system_device_path` and
    `funcGioUnix.is_mount_path_system_internal` on mount_entry’s properties.
    
    The definition of what a ‘system’ mount entry is may change over time as new
    file system types and device paths are ignored.

    Params:
      mountEntry = a [giounix.mount_entry.MountEntry]
    Returns: true if the Unix mount is for a system path; false otherwise

    Deprecated: Use [giounix.mount_entry.MountEntry.isSystemInternal] instead.
*/
bool mountIsSystemInternal(giounix.mount_entry.MountEntry mountEntry) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_is_system_internal(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Checks if the Unix mount points have changed since a given Unix time.
    
    Unlike `funcGioUnix.mount_entries_changed_since`, this function can work
    reliably without a [giounix.mount_monitor.MountMonitor] running, as it accesses the
    static mount point information (such as `/etc/fstab` on Linux), which has a
    valid modification time.
    
    It is more efficient to use [giounix.mount_monitor.MountMonitor.mountpointsChanged]
    to be signalled of changes to the mount points, rather than polling using
    this function. This function is more appropriate for infrequently determining
    cache validity.

    Params:
      time = a timestamp
    Returns: true if the mount points have changed since time; false otherwise
*/
bool mountPointsChangedSince(ulong time) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_points_changed_since(time);
  return _retval;
}

/**
    Gets a list of [giounix.mount_point.MountPoint] instances representing the Unix
    mount points.
    
    If time_read is set, it will be filled with the mount timestamp, allowing
    for checking if the mounts have changed with
    `funcGioUnix.mount_points_changed_since`.

    Params:
      timeRead = return location for a timestamp
    Returns: a list of the Unix
         mount points
*/
giounix.mount_point.MountPoint[] mountPointsGet(out ulong timeRead) nothrow
{
  GList* _cretval;
  _cretval = g_unix_mount_points_get(cast(ulong*)&timeRead);
  auto _retval = gListToD!(giounix.mount_point.MountPoint, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Gets an array of [giounix.mount_point.MountPoint]s containing the Unix mount
    points listed in table_path.
    
    This is a generalized version of `funcGioUnix.mount_points_get`, mainly
    intended for internal testing use. Note that `funcGioUnix.mount_points_get`
    may parse multiple hierarchical table files, so this function is not a direct
    superset of its functionality.
    
    If there is an error reading or parsing the file, `NULL` will be returned
    and both out parameters will be set to `0`.

    Params:
      tablePath = path to the mount points table file (for example `/etc/fstab`)
      timeReadOut = return location for the
          modification time of table_path
    Returns: mount
        points, or `NULL` if there was an error loading them
*/
giounix.mount_point.MountPoint[] mountPointsGetFromFile(string tablePath, out ulong timeReadOut) nothrow
{
  GUnixMountPoint** _cretval;
  size_t _cretlength;
  const(char)* _tablePath = tablePath.toCString!(No.Malloc, No.Nullable);
  _cretval = g_unix_mount_points_get_from_file(_tablePath, cast(ulong*)&timeReadOut, &_cretlength);
  giounix.mount_point.MountPoint[] _retval;

  if (_cretval)
  {
    _retval = new giounix.mount_point.MountPoint[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = new giounix.mount_point.MountPoint(cast(void*)_cretval[i], Yes.Take);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Checks if the Unix mounts have changed since a given Unix time.

    Params:
      time = a timestamp
    Returns: true if the mounts have changed since time; false otherwise

    Deprecated: Use `funcGioUnix.mount_entries_changed_since` instead.
*/
bool mountsChangedSince(ulong time) nothrow
{
  bool _retval;
  _retval = cast(bool)g_unix_mounts_changed_since(time);
  return _retval;
}

/**
    Gets a list of [giounix.mount_entry.MountEntry] instances representing the Unix
    mounts.
    
    If time_read is set, it will be filled with the mount timestamp, allowing
    for checking if the mounts have changed with
    `funcGioUnix.mount_entries_changed_since`.

    Params:
      timeRead = return location for a timestamp
    Returns: a list of the
         Unix mounts

    Deprecated: Use `funcGioUnix.mount_entries_get` instead.
*/
giounix.mount_entry.MountEntry[] mountsGet(out ulong timeRead) nothrow
{
  GList* _cretval;
  _cretval = g_unix_mounts_get(cast(ulong*)&timeRead);
  auto _retval = gListToD!(giounix.mount_entry.MountEntry, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Gets an array of [giounix.mount_entry.MountEntry]s containing the Unix mounts
    listed in table_path.
    
    This is a generalized version of `funcGioUnix.mount_entries_get`, mainly
    intended for internal testing use. Note that `funcGioUnix.mount_entries_get`
    may parse multiple hierarchical table files, so this function is not a direct
    superset of its functionality.
    
    If there is an error reading or parsing the file, `NULL` will be returned
    and both out parameters will be set to `0`.

    Params:
      tablePath = path to the mounts table file (for example `/proc/self/mountinfo`)
      timeReadOut = return location for the
          modification time of table_path
    Returns: mount
        entries, or `NULL` if there was an error loading them

    Deprecated: Use `funcGioUnix.mount_entries_get_from_file` instead.
*/
giounix.mount_entry.MountEntry[] mountsGetFromFile(string tablePath, out ulong timeReadOut) nothrow
{
  GUnixMountEntry** _cretval;
  size_t _cretlength;
  const(char)* _tablePath = tablePath.toCString!(No.Malloc, No.Nullable);
  _cretval = g_unix_mounts_get_from_file(_tablePath, cast(ulong*)&timeReadOut, &_cretlength);
  giounix.mount_entry.MountEntry[] _retval;

  if (_cretval)
  {
    _retval = new giounix.mount_entry.MountEntry[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = new giounix.mount_entry.MountEntry(cast(void*)_cretval[i], Yes.Take);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}
