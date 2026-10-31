/// C functions for giounix2 library
module giounix.c.functions;

public import gid.basictypes;
import gid.loader;
import giounix.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gio.c.types;

private immutable LIBS = ["gio-2.0_0"];

__gshared extern(C) nothrow
{
  // DesktopAppInfo
  GType function() c_g_desktop_app_info_get_type; ///
  GDesktopAppInfo* function(const(char)* desktopId) c_g_desktop_app_info_new; ///
  GDesktopAppInfo* function(const(char)* filename) c_g_desktop_app_info_new_from_filename; ///
  GDesktopAppInfo* function(GKeyFile* keyFile) c_g_desktop_app_info_new_from_keyfile; ///
  GList* function(const(char)* interface_) c_g_desktop_app_info_get_implementations; ///
  char*** function(const(char)* searchString) c_g_desktop_app_info_search; ///
  void function(const(char)* desktopEnv) c_g_desktop_app_info_set_desktop_env; ///
  char* function(GDesktopAppInfo* info, const(char)* actionName) c_g_desktop_app_info_get_action_name; ///
  gboolean function(GDesktopAppInfo* info, const(char)* key) c_g_desktop_app_info_get_boolean; ///
  const(char)* function(GDesktopAppInfo* info) c_g_desktop_app_info_get_categories; ///
  const(char)* function(GDesktopAppInfo* info) c_g_desktop_app_info_get_filename; ///
  const(char)* function(GDesktopAppInfo* info) c_g_desktop_app_info_get_generic_name; ///
  gboolean function(GDesktopAppInfo* info) c_g_desktop_app_info_get_is_hidden; ///
  const(char*)* function(GDesktopAppInfo* info) c_g_desktop_app_info_get_keywords; ///
  char* function(GDesktopAppInfo* info, const(char)* key) c_g_desktop_app_info_get_locale_string; ///
  gboolean function(GDesktopAppInfo* info) c_g_desktop_app_info_get_nodisplay; ///
  gboolean function(GDesktopAppInfo* info, const(char)* desktopEnv) c_g_desktop_app_info_get_show_in; ///
  const(char)* function(GDesktopAppInfo* info) c_g_desktop_app_info_get_startup_wm_class; ///
  char* function(GDesktopAppInfo* info, const(char)* key) c_g_desktop_app_info_get_string; ///
  char** function(GDesktopAppInfo* info, const(char)* key, size_t* length) c_g_desktop_app_info_get_string_list; ///
  gboolean function(GDesktopAppInfo* info, const(char)* key) c_g_desktop_app_info_has_key; ///
  void function(GDesktopAppInfo* info, const(char)* actionName, GAppLaunchContext* launchContext) c_g_desktop_app_info_launch_action; ///
  gboolean function(GDesktopAppInfo* appinfo, GList* uris, GAppLaunchContext* launchContext, GSpawnFlags spawnFlags, GSpawnChildSetupFunc userSetup, void* userSetupData, GDesktopAppLaunchCallback pidCallback, void* pidCallbackData, GError** _err) c_g_desktop_app_info_launch_uris_as_manager; ///
  gboolean function(GDesktopAppInfo* appinfo, GList* uris, GAppLaunchContext* launchContext, GSpawnFlags spawnFlags, GSpawnChildSetupFunc userSetup, void* userSetupData, GDesktopAppLaunchCallback pidCallback, void* pidCallbackData, int stdinFd, int stdoutFd, int stderrFd, GError** _err) c_g_desktop_app_info_launch_uris_as_manager_with_fds; ///
  const(char*)* function(GDesktopAppInfo* info) c_g_desktop_app_info_list_actions; ///

  // DesktopAppInfoLookup
  GType function() c_g_desktop_app_info_lookup_get_type; ///
  GAppInfo* function(GDesktopAppInfoLookup* lookup, const(char)* uriScheme) c_g_desktop_app_info_lookup_get_default_for_uri_scheme; ///

  // FDMessage
  GType function() c_g_unix_fd_message_get_type; ///
  GSocketControlMessage* function() c_g_unix_fd_message_new; ///
  GSocketControlMessage* function(GUnixFDList* fdList) c_g_unix_fd_message_new_with_fd_list; ///
  gboolean function(GUnixFDMessage* message, int fd, GError** _err) c_g_unix_fd_message_append_fd; ///
  GUnixFDList* function(GUnixFDMessage* message) c_g_unix_fd_message_get_fd_list; ///
  int* function(GUnixFDMessage* message, int* length) c_g_unix_fd_message_steal_fds; ///

  // FileDescriptorBased
  GType function() c_g_file_descriptor_based_get_type; ///
  int function(GFileDescriptorBased* fdBased) c_g_file_descriptor_based_get_fd; ///

  // InputStream
  GType function() c_g_unix_input_stream_get_type; ///
  GInputStream* function(int fd, gboolean closeFd) c_g_unix_input_stream_new; ///
  gboolean function(GUnixInputStream* stream) c_g_unix_input_stream_get_close_fd; ///
  int function(GUnixInputStream* stream) c_g_unix_input_stream_get_fd; ///
  void function(GUnixInputStream* stream, gboolean closeFd) c_g_unix_input_stream_set_close_fd; ///

  // MountEntry
  GType function() c_g_unix_mount_entry_get_type; ///
  int function(GUnixMountEntry* mount1, GUnixMountEntry* mount2) c_g_unix_mount_entry_compare; ///
  GUnixMountEntry* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_copy; ///
  void function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_free; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_get_device_path; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_get_fs_type; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_get_mount_path; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_get_options; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_get_root_path; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_guess_can_eject; ///
  GIcon* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_guess_icon; ///
  char* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_guess_name; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_guess_should_display; ///
  GIcon* function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_guess_symbolic_icon; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_is_readonly; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_entry_is_system_internal; ///
  GUnixMountEntry* function(const(char)* mountPath, ulong* timeRead) c_g_unix_mount_entry_at; ///
  GUnixMountEntry* function(const(char)* filePath, ulong* timeRead) c_g_unix_mount_entry_for; ///

  // MountMonitor
  GType function() c_g_unix_mount_monitor_get_type; ///
  GUnixMountMonitor* function() c_g_unix_mount_monitor_new; ///
  GUnixMountMonitor* function() c_g_unix_mount_monitor_get; ///
  void function(GUnixMountMonitor* mountMonitor, int limitMsec) c_g_unix_mount_monitor_set_rate_limit; ///

  // MountPoint
  GType function() c_g_unix_mount_point_get_type; ///
  int function(GUnixMountPoint* mount1, GUnixMountPoint* mount2) c_g_unix_mount_point_compare; ///
  GUnixMountPoint* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_copy; ///
  void function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_free; ///
  const(char)* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_get_device_path; ///
  const(char)* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_get_fs_type; ///
  const(char)* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_get_mount_path; ///
  const(char)* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_get_options; ///
  gboolean function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_guess_can_eject; ///
  GIcon* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_guess_icon; ///
  char* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_guess_name; ///
  GIcon* function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_guess_symbolic_icon; ///
  gboolean function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_is_loopback; ///
  gboolean function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_is_readonly; ///
  gboolean function(GUnixMountPoint* mountPoint) c_g_unix_mount_point_is_user_mountable; ///
  GUnixMountPoint* function(const(char)* mountPath, ulong* timeRead) c_g_unix_mount_point_at; ///

  // OutputStream
  GType function() c_g_unix_output_stream_get_type; ///
  GOutputStream* function(int fd, gboolean closeFd) c_g_unix_output_stream_new; ///
  gboolean function(GUnixOutputStream* stream) c_g_unix_output_stream_get_close_fd; ///
  int function(GUnixOutputStream* stream) c_g_unix_output_stream_get_fd; ///
  void function(GUnixOutputStream* stream, gboolean closeFd) c_g_unix_output_stream_set_close_fd; ///

  // global
  gboolean function(const(char)* mountPath) c_g_unix_is_mount_path_system_internal; ///
  gboolean function(const(char)* devicePath) c_g_unix_is_system_device_path; ///
  gboolean function(const(char)* fsType) c_g_unix_is_system_fs_type; ///
  GUnixMountEntry* function(const(char)* mountPath, ulong* timeRead) c_g_unix_mount_at; ///
  int function(GUnixMountEntry* mount1, GUnixMountEntry* mount2) c_g_unix_mount_compare; ///
  GUnixMountEntry* function(GUnixMountEntry* mountEntry) c_g_unix_mount_copy; ///
  gboolean function(ulong time) c_g_unix_mount_entries_changed_since; ///
  GList* function(ulong* timeRead) c_g_unix_mount_entries_get; ///
  GUnixMountEntry** function(const(char)* tablePath, ulong* timeReadOut, size_t* nEntriesOut) c_g_unix_mount_entries_get_from_file; ///
  GUnixMountEntry* function(const(char)* filePath, ulong* timeRead) c_g_unix_mount_for; ///
  void function(GUnixMountEntry* mountEntry) c_g_unix_mount_free; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_get_device_path; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_get_fs_type; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_get_mount_path; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_get_options; ///
  const(char)* function(GUnixMountEntry* mountEntry) c_g_unix_mount_get_root_path; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_guess_can_eject; ///
  GIcon* function(GUnixMountEntry* mountEntry) c_g_unix_mount_guess_icon; ///
  char* function(GUnixMountEntry* mountEntry) c_g_unix_mount_guess_name; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_guess_should_display; ///
  GIcon* function(GUnixMountEntry* mountEntry) c_g_unix_mount_guess_symbolic_icon; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_is_readonly; ///
  gboolean function(GUnixMountEntry* mountEntry) c_g_unix_mount_is_system_internal; ///
  gboolean function(ulong time) c_g_unix_mount_points_changed_since; ///
  GList* function(ulong* timeRead) c_g_unix_mount_points_get; ///
  GUnixMountPoint** function(const(char)* tablePath, ulong* timeReadOut, size_t* nPointsOut) c_g_unix_mount_points_get_from_file; ///
  gboolean function(ulong time) c_g_unix_mounts_changed_since; ///
  GList* function(ulong* timeRead) c_g_unix_mounts_get; ///
  GUnixMountEntry** function(const(char)* tablePath, ulong* timeReadOut, size_t* nEntriesOut) c_g_unix_mounts_get_from_file; ///
}

// DesktopAppInfo

/** */
alias g_desktop_app_info_get_type = c_g_desktop_app_info_get_type;

/** */
alias g_desktop_app_info_new = c_g_desktop_app_info_new;

/** */
alias g_desktop_app_info_new_from_filename = c_g_desktop_app_info_new_from_filename;

/** */
alias g_desktop_app_info_new_from_keyfile = c_g_desktop_app_info_new_from_keyfile;

/** */
alias g_desktop_app_info_get_implementations = c_g_desktop_app_info_get_implementations;

/** */
alias g_desktop_app_info_search = c_g_desktop_app_info_search;

/** */
alias g_desktop_app_info_set_desktop_env = c_g_desktop_app_info_set_desktop_env;

/** */
alias g_desktop_app_info_get_action_name = c_g_desktop_app_info_get_action_name;

/** */
alias g_desktop_app_info_get_boolean = c_g_desktop_app_info_get_boolean;

/** */
alias g_desktop_app_info_get_categories = c_g_desktop_app_info_get_categories;

/** */
alias g_desktop_app_info_get_filename = c_g_desktop_app_info_get_filename;

/** */
alias g_desktop_app_info_get_generic_name = c_g_desktop_app_info_get_generic_name;

/** */
alias g_desktop_app_info_get_is_hidden = c_g_desktop_app_info_get_is_hidden;

/** */
alias g_desktop_app_info_get_keywords = c_g_desktop_app_info_get_keywords;

/** */
alias g_desktop_app_info_get_locale_string = c_g_desktop_app_info_get_locale_string;

/** */
alias g_desktop_app_info_get_nodisplay = c_g_desktop_app_info_get_nodisplay;

/** */
alias g_desktop_app_info_get_show_in = c_g_desktop_app_info_get_show_in;

/** */
alias g_desktop_app_info_get_startup_wm_class = c_g_desktop_app_info_get_startup_wm_class;

/** */
alias g_desktop_app_info_get_string = c_g_desktop_app_info_get_string;

/** */
alias g_desktop_app_info_get_string_list = c_g_desktop_app_info_get_string_list;

/** */
alias g_desktop_app_info_has_key = c_g_desktop_app_info_has_key;

/** */
alias g_desktop_app_info_launch_action = c_g_desktop_app_info_launch_action;

/** */
alias g_desktop_app_info_launch_uris_as_manager = c_g_desktop_app_info_launch_uris_as_manager;

/** */
alias g_desktop_app_info_launch_uris_as_manager_with_fds = c_g_desktop_app_info_launch_uris_as_manager_with_fds;

/** */
alias g_desktop_app_info_list_actions = c_g_desktop_app_info_list_actions;

// DesktopAppInfoLookup

/** */
alias g_desktop_app_info_lookup_get_type = c_g_desktop_app_info_lookup_get_type;

/** */
alias g_desktop_app_info_lookup_get_default_for_uri_scheme = c_g_desktop_app_info_lookup_get_default_for_uri_scheme;

// FDMessage

/** */
alias g_unix_fd_message_get_type = c_g_unix_fd_message_get_type;

/** */
alias g_unix_fd_message_new = c_g_unix_fd_message_new;

/** */
alias g_unix_fd_message_new_with_fd_list = c_g_unix_fd_message_new_with_fd_list;

/** */
alias g_unix_fd_message_append_fd = c_g_unix_fd_message_append_fd;

/** */
alias g_unix_fd_message_get_fd_list = c_g_unix_fd_message_get_fd_list;

/** */
alias g_unix_fd_message_steal_fds = c_g_unix_fd_message_steal_fds;

// FileDescriptorBased

/** */
alias g_file_descriptor_based_get_type = c_g_file_descriptor_based_get_type;

/** */
alias g_file_descriptor_based_get_fd = c_g_file_descriptor_based_get_fd;

// InputStream

/** */
alias g_unix_input_stream_get_type = c_g_unix_input_stream_get_type;

/** */
alias g_unix_input_stream_new = c_g_unix_input_stream_new;

/** */
alias g_unix_input_stream_get_close_fd = c_g_unix_input_stream_get_close_fd;

/** */
alias g_unix_input_stream_get_fd = c_g_unix_input_stream_get_fd;

/** */
alias g_unix_input_stream_set_close_fd = c_g_unix_input_stream_set_close_fd;

// MountEntry

/** */
alias g_unix_mount_entry_get_type = c_g_unix_mount_entry_get_type;

/** */
alias g_unix_mount_entry_compare = c_g_unix_mount_entry_compare;

/** */
alias g_unix_mount_entry_copy = c_g_unix_mount_entry_copy;

/** */
alias g_unix_mount_entry_free = c_g_unix_mount_entry_free;

/** */
alias g_unix_mount_entry_get_device_path = c_g_unix_mount_entry_get_device_path;

/** */
alias g_unix_mount_entry_get_fs_type = c_g_unix_mount_entry_get_fs_type;

/** */
alias g_unix_mount_entry_get_mount_path = c_g_unix_mount_entry_get_mount_path;

/** */
alias g_unix_mount_entry_get_options = c_g_unix_mount_entry_get_options;

/** */
alias g_unix_mount_entry_get_root_path = c_g_unix_mount_entry_get_root_path;

/** */
alias g_unix_mount_entry_guess_can_eject = c_g_unix_mount_entry_guess_can_eject;

/** */
alias g_unix_mount_entry_guess_icon = c_g_unix_mount_entry_guess_icon;

/** */
alias g_unix_mount_entry_guess_name = c_g_unix_mount_entry_guess_name;

/** */
alias g_unix_mount_entry_guess_should_display = c_g_unix_mount_entry_guess_should_display;

/** */
alias g_unix_mount_entry_guess_symbolic_icon = c_g_unix_mount_entry_guess_symbolic_icon;

/** */
alias g_unix_mount_entry_is_readonly = c_g_unix_mount_entry_is_readonly;

/** */
alias g_unix_mount_entry_is_system_internal = c_g_unix_mount_entry_is_system_internal;

/** */
alias g_unix_mount_entry_at = c_g_unix_mount_entry_at;

/** */
alias g_unix_mount_entry_for = c_g_unix_mount_entry_for;

// MountMonitor

/** */
alias g_unix_mount_monitor_get_type = c_g_unix_mount_monitor_get_type;

/** */
alias g_unix_mount_monitor_new = c_g_unix_mount_monitor_new;

/** */
alias g_unix_mount_monitor_get = c_g_unix_mount_monitor_get;

/** */
alias g_unix_mount_monitor_set_rate_limit = c_g_unix_mount_monitor_set_rate_limit;

// MountPoint

/** */
alias g_unix_mount_point_get_type = c_g_unix_mount_point_get_type;

/** */
alias g_unix_mount_point_compare = c_g_unix_mount_point_compare;

/** */
alias g_unix_mount_point_copy = c_g_unix_mount_point_copy;

/** */
alias g_unix_mount_point_free = c_g_unix_mount_point_free;

/** */
alias g_unix_mount_point_get_device_path = c_g_unix_mount_point_get_device_path;

/** */
alias g_unix_mount_point_get_fs_type = c_g_unix_mount_point_get_fs_type;

/** */
alias g_unix_mount_point_get_mount_path = c_g_unix_mount_point_get_mount_path;

/** */
alias g_unix_mount_point_get_options = c_g_unix_mount_point_get_options;

/** */
alias g_unix_mount_point_guess_can_eject = c_g_unix_mount_point_guess_can_eject;

/** */
alias g_unix_mount_point_guess_icon = c_g_unix_mount_point_guess_icon;

/** */
alias g_unix_mount_point_guess_name = c_g_unix_mount_point_guess_name;

/** */
alias g_unix_mount_point_guess_symbolic_icon = c_g_unix_mount_point_guess_symbolic_icon;

/** */
alias g_unix_mount_point_is_loopback = c_g_unix_mount_point_is_loopback;

/** */
alias g_unix_mount_point_is_readonly = c_g_unix_mount_point_is_readonly;

/** */
alias g_unix_mount_point_is_user_mountable = c_g_unix_mount_point_is_user_mountable;

/** */
alias g_unix_mount_point_at = c_g_unix_mount_point_at;

// OutputStream

/** */
alias g_unix_output_stream_get_type = c_g_unix_output_stream_get_type;

/** */
alias g_unix_output_stream_new = c_g_unix_output_stream_new;

/** */
alias g_unix_output_stream_get_close_fd = c_g_unix_output_stream_get_close_fd;

/** */
alias g_unix_output_stream_get_fd = c_g_unix_output_stream_get_fd;

/** */
alias g_unix_output_stream_set_close_fd = c_g_unix_output_stream_set_close_fd;

// global

/** */
alias g_unix_is_mount_path_system_internal = c_g_unix_is_mount_path_system_internal;

/** */
alias g_unix_is_system_device_path = c_g_unix_is_system_device_path;

/** */
alias g_unix_is_system_fs_type = c_g_unix_is_system_fs_type;

/** */
alias g_unix_mount_at = c_g_unix_mount_at;

/** */
alias g_unix_mount_compare = c_g_unix_mount_compare;

/** */
alias g_unix_mount_copy = c_g_unix_mount_copy;

/** */
alias g_unix_mount_entries_changed_since = c_g_unix_mount_entries_changed_since;

/** */
alias g_unix_mount_entries_get = c_g_unix_mount_entries_get;

/** */
alias g_unix_mount_entries_get_from_file = c_g_unix_mount_entries_get_from_file;

/** */
alias g_unix_mount_for = c_g_unix_mount_for;

/** */
alias g_unix_mount_free = c_g_unix_mount_free;

/** */
alias g_unix_mount_get_device_path = c_g_unix_mount_get_device_path;

/** */
alias g_unix_mount_get_fs_type = c_g_unix_mount_get_fs_type;

/** */
alias g_unix_mount_get_mount_path = c_g_unix_mount_get_mount_path;

/** */
alias g_unix_mount_get_options = c_g_unix_mount_get_options;

/** */
alias g_unix_mount_get_root_path = c_g_unix_mount_get_root_path;

/** */
alias g_unix_mount_guess_can_eject = c_g_unix_mount_guess_can_eject;

/** */
alias g_unix_mount_guess_icon = c_g_unix_mount_guess_icon;

/** */
alias g_unix_mount_guess_name = c_g_unix_mount_guess_name;

/** */
alias g_unix_mount_guess_should_display = c_g_unix_mount_guess_should_display;

/** */
alias g_unix_mount_guess_symbolic_icon = c_g_unix_mount_guess_symbolic_icon;

/** */
alias g_unix_mount_is_readonly = c_g_unix_mount_is_readonly;

/** */
alias g_unix_mount_is_system_internal = c_g_unix_mount_is_system_internal;

/** */
alias g_unix_mount_points_changed_since = c_g_unix_mount_points_changed_since;

/** */
alias g_unix_mount_points_get = c_g_unix_mount_points_get;

/** */
alias g_unix_mount_points_get_from_file = c_g_unix_mount_points_get_from_file;

/** */
alias g_unix_mounts_changed_since = c_g_unix_mounts_changed_since;

/** */
alias g_unix_mounts_get = c_g_unix_mounts_get;

/** */
alias g_unix_mounts_get_from_file = c_g_unix_mounts_get_from_file;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // DesktopAppInfo
  gidLink(cast(void**)&g_desktop_app_info_get_type, "g_desktop_app_info_get_type", libs);
  gidLink(cast(void**)&g_desktop_app_info_new, "g_desktop_app_info_new", libs);
  gidLink(cast(void**)&g_desktop_app_info_new_from_filename, "g_desktop_app_info_new_from_filename", libs);
  gidLink(cast(void**)&g_desktop_app_info_new_from_keyfile, "g_desktop_app_info_new_from_keyfile", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_implementations, "g_desktop_app_info_get_implementations", libs);
  gidLink(cast(void**)&g_desktop_app_info_search, "g_desktop_app_info_search", libs);
  gidLink(cast(void**)&g_desktop_app_info_set_desktop_env, "g_desktop_app_info_set_desktop_env", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_action_name, "g_desktop_app_info_get_action_name", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_boolean, "g_desktop_app_info_get_boolean", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_categories, "g_desktop_app_info_get_categories", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_filename, "g_desktop_app_info_get_filename", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_generic_name, "g_desktop_app_info_get_generic_name", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_is_hidden, "g_desktop_app_info_get_is_hidden", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_keywords, "g_desktop_app_info_get_keywords", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_locale_string, "g_desktop_app_info_get_locale_string", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_nodisplay, "g_desktop_app_info_get_nodisplay", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_show_in, "g_desktop_app_info_get_show_in", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_startup_wm_class, "g_desktop_app_info_get_startup_wm_class", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_string, "g_desktop_app_info_get_string", libs);
  gidLink(cast(void**)&g_desktop_app_info_get_string_list, "g_desktop_app_info_get_string_list", libs);
  gidLink(cast(void**)&g_desktop_app_info_has_key, "g_desktop_app_info_has_key", libs);
  gidLink(cast(void**)&g_desktop_app_info_launch_action, "g_desktop_app_info_launch_action", libs);
  gidLink(cast(void**)&g_desktop_app_info_launch_uris_as_manager, "g_desktop_app_info_launch_uris_as_manager", libs);
  gidLink(cast(void**)&g_desktop_app_info_launch_uris_as_manager_with_fds, "g_desktop_app_info_launch_uris_as_manager_with_fds", libs);
  gidLink(cast(void**)&g_desktop_app_info_list_actions, "g_desktop_app_info_list_actions", libs);

  // DesktopAppInfoLookup
  gidLink(cast(void**)&g_desktop_app_info_lookup_get_type, "g_desktop_app_info_lookup_get_type", libs);
  gidLink(cast(void**)&g_desktop_app_info_lookup_get_default_for_uri_scheme, "g_desktop_app_info_lookup_get_default_for_uri_scheme", libs);

  // FDMessage
  gidLink(cast(void**)&g_unix_fd_message_get_type, "g_unix_fd_message_get_type", libs);
  gidLink(cast(void**)&g_unix_fd_message_new, "g_unix_fd_message_new", libs);
  gidLink(cast(void**)&g_unix_fd_message_new_with_fd_list, "g_unix_fd_message_new_with_fd_list", libs);
  gidLink(cast(void**)&g_unix_fd_message_append_fd, "g_unix_fd_message_append_fd", libs);
  gidLink(cast(void**)&g_unix_fd_message_get_fd_list, "g_unix_fd_message_get_fd_list", libs);
  gidLink(cast(void**)&g_unix_fd_message_steal_fds, "g_unix_fd_message_steal_fds", libs);

  // FileDescriptorBased
  gidLink(cast(void**)&g_file_descriptor_based_get_type, "g_file_descriptor_based_get_type", libs);
  gidLink(cast(void**)&g_file_descriptor_based_get_fd, "g_file_descriptor_based_get_fd", libs);

  // InputStream
  gidLink(cast(void**)&g_unix_input_stream_get_type, "g_unix_input_stream_get_type", libs);
  gidLink(cast(void**)&g_unix_input_stream_new, "g_unix_input_stream_new", libs);
  gidLink(cast(void**)&g_unix_input_stream_get_close_fd, "g_unix_input_stream_get_close_fd", libs);
  gidLink(cast(void**)&g_unix_input_stream_get_fd, "g_unix_input_stream_get_fd", libs);
  gidLink(cast(void**)&g_unix_input_stream_set_close_fd, "g_unix_input_stream_set_close_fd", libs);

  // MountEntry
  gidLink(cast(void**)&g_unix_mount_entry_get_type, "g_unix_mount_entry_get_type", libs);
  gidLink(cast(void**)&g_unix_mount_entry_compare, "g_unix_mount_entry_compare", libs);
  gidLink(cast(void**)&g_unix_mount_entry_copy, "g_unix_mount_entry_copy", libs);
  gidLink(cast(void**)&g_unix_mount_entry_free, "g_unix_mount_entry_free", libs);
  gidLink(cast(void**)&g_unix_mount_entry_get_device_path, "g_unix_mount_entry_get_device_path", libs);
  gidLink(cast(void**)&g_unix_mount_entry_get_fs_type, "g_unix_mount_entry_get_fs_type", libs);
  gidLink(cast(void**)&g_unix_mount_entry_get_mount_path, "g_unix_mount_entry_get_mount_path", libs);
  gidLink(cast(void**)&g_unix_mount_entry_get_options, "g_unix_mount_entry_get_options", libs);
  gidLink(cast(void**)&g_unix_mount_entry_get_root_path, "g_unix_mount_entry_get_root_path", libs);
  gidLink(cast(void**)&g_unix_mount_entry_guess_can_eject, "g_unix_mount_entry_guess_can_eject", libs);
  gidLink(cast(void**)&g_unix_mount_entry_guess_icon, "g_unix_mount_entry_guess_icon", libs);
  gidLink(cast(void**)&g_unix_mount_entry_guess_name, "g_unix_mount_entry_guess_name", libs);
  gidLink(cast(void**)&g_unix_mount_entry_guess_should_display, "g_unix_mount_entry_guess_should_display", libs);
  gidLink(cast(void**)&g_unix_mount_entry_guess_symbolic_icon, "g_unix_mount_entry_guess_symbolic_icon", libs);
  gidLink(cast(void**)&g_unix_mount_entry_is_readonly, "g_unix_mount_entry_is_readonly", libs);
  gidLink(cast(void**)&g_unix_mount_entry_is_system_internal, "g_unix_mount_entry_is_system_internal", libs);
  gidLink(cast(void**)&g_unix_mount_entry_at, "g_unix_mount_entry_at", libs);
  gidLink(cast(void**)&g_unix_mount_entry_for, "g_unix_mount_entry_for", libs);

  // MountMonitor
  gidLink(cast(void**)&g_unix_mount_monitor_get_type, "g_unix_mount_monitor_get_type", libs);
  gidLink(cast(void**)&g_unix_mount_monitor_new, "g_unix_mount_monitor_new", libs);
  gidLink(cast(void**)&g_unix_mount_monitor_get, "g_unix_mount_monitor_get", libs);
  gidLink(cast(void**)&g_unix_mount_monitor_set_rate_limit, "g_unix_mount_monitor_set_rate_limit", libs);

  // MountPoint
  gidLink(cast(void**)&g_unix_mount_point_get_type, "g_unix_mount_point_get_type", libs);
  gidLink(cast(void**)&g_unix_mount_point_compare, "g_unix_mount_point_compare", libs);
  gidLink(cast(void**)&g_unix_mount_point_copy, "g_unix_mount_point_copy", libs);
  gidLink(cast(void**)&g_unix_mount_point_free, "g_unix_mount_point_free", libs);
  gidLink(cast(void**)&g_unix_mount_point_get_device_path, "g_unix_mount_point_get_device_path", libs);
  gidLink(cast(void**)&g_unix_mount_point_get_fs_type, "g_unix_mount_point_get_fs_type", libs);
  gidLink(cast(void**)&g_unix_mount_point_get_mount_path, "g_unix_mount_point_get_mount_path", libs);
  gidLink(cast(void**)&g_unix_mount_point_get_options, "g_unix_mount_point_get_options", libs);
  gidLink(cast(void**)&g_unix_mount_point_guess_can_eject, "g_unix_mount_point_guess_can_eject", libs);
  gidLink(cast(void**)&g_unix_mount_point_guess_icon, "g_unix_mount_point_guess_icon", libs);
  gidLink(cast(void**)&g_unix_mount_point_guess_name, "g_unix_mount_point_guess_name", libs);
  gidLink(cast(void**)&g_unix_mount_point_guess_symbolic_icon, "g_unix_mount_point_guess_symbolic_icon", libs);
  gidLink(cast(void**)&g_unix_mount_point_is_loopback, "g_unix_mount_point_is_loopback", libs);
  gidLink(cast(void**)&g_unix_mount_point_is_readonly, "g_unix_mount_point_is_readonly", libs);
  gidLink(cast(void**)&g_unix_mount_point_is_user_mountable, "g_unix_mount_point_is_user_mountable", libs);
  gidLink(cast(void**)&g_unix_mount_point_at, "g_unix_mount_point_at", libs);

  // OutputStream
  gidLink(cast(void**)&g_unix_output_stream_get_type, "g_unix_output_stream_get_type", libs);
  gidLink(cast(void**)&g_unix_output_stream_new, "g_unix_output_stream_new", libs);
  gidLink(cast(void**)&g_unix_output_stream_get_close_fd, "g_unix_output_stream_get_close_fd", libs);
  gidLink(cast(void**)&g_unix_output_stream_get_fd, "g_unix_output_stream_get_fd", libs);
  gidLink(cast(void**)&g_unix_output_stream_set_close_fd, "g_unix_output_stream_set_close_fd", libs);

  // global
  gidLink(cast(void**)&g_unix_is_mount_path_system_internal, "g_unix_is_mount_path_system_internal", libs);
  gidLink(cast(void**)&g_unix_is_system_device_path, "g_unix_is_system_device_path", libs);
  gidLink(cast(void**)&g_unix_is_system_fs_type, "g_unix_is_system_fs_type", libs);
  gidLink(cast(void**)&g_unix_mount_at, "g_unix_mount_at", libs);
  gidLink(cast(void**)&g_unix_mount_compare, "g_unix_mount_compare", libs);
  gidLink(cast(void**)&g_unix_mount_copy, "g_unix_mount_copy", libs);
  gidLink(cast(void**)&g_unix_mount_entries_changed_since, "g_unix_mount_entries_changed_since", libs);
  gidLink(cast(void**)&g_unix_mount_entries_get, "g_unix_mount_entries_get", libs);
  gidLink(cast(void**)&g_unix_mount_entries_get_from_file, "g_unix_mount_entries_get_from_file", libs);
  gidLink(cast(void**)&g_unix_mount_for, "g_unix_mount_for", libs);
  gidLink(cast(void**)&g_unix_mount_free, "g_unix_mount_free", libs);
  gidLink(cast(void**)&g_unix_mount_get_device_path, "g_unix_mount_get_device_path", libs);
  gidLink(cast(void**)&g_unix_mount_get_fs_type, "g_unix_mount_get_fs_type", libs);
  gidLink(cast(void**)&g_unix_mount_get_mount_path, "g_unix_mount_get_mount_path", libs);
  gidLink(cast(void**)&g_unix_mount_get_options, "g_unix_mount_get_options", libs);
  gidLink(cast(void**)&g_unix_mount_get_root_path, "g_unix_mount_get_root_path", libs);
  gidLink(cast(void**)&g_unix_mount_guess_can_eject, "g_unix_mount_guess_can_eject", libs);
  gidLink(cast(void**)&g_unix_mount_guess_icon, "g_unix_mount_guess_icon", libs);
  gidLink(cast(void**)&g_unix_mount_guess_name, "g_unix_mount_guess_name", libs);
  gidLink(cast(void**)&g_unix_mount_guess_should_display, "g_unix_mount_guess_should_display", libs);
  gidLink(cast(void**)&g_unix_mount_guess_symbolic_icon, "g_unix_mount_guess_symbolic_icon", libs);
  gidLink(cast(void**)&g_unix_mount_is_readonly, "g_unix_mount_is_readonly", libs);
  gidLink(cast(void**)&g_unix_mount_is_system_internal, "g_unix_mount_is_system_internal", libs);
  gidLink(cast(void**)&g_unix_mount_points_changed_since, "g_unix_mount_points_changed_since", libs);
  gidLink(cast(void**)&g_unix_mount_points_get, "g_unix_mount_points_get", libs);
  gidLink(cast(void**)&g_unix_mount_points_get_from_file, "g_unix_mount_points_get_from_file", libs);
  gidLink(cast(void**)&g_unix_mounts_changed_since, "g_unix_mounts_changed_since", libs);
  gidLink(cast(void**)&g_unix_mounts_get, "g_unix_mounts_get", libs);
  gidLink(cast(void**)&g_unix_mounts_get_from_file, "g_unix_mounts_get_from_file", libs);
}
