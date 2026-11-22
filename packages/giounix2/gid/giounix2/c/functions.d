/// C functions for giounix2 library
module gid.giounix2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.giounix2.c.types;
public import gid.gio2.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["gio-2.0_0"];

// DesktopAppInfo
private alias c_g_desktop_app_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_desktop_app_info_get_typeFn c_g_desktop_app_info_get_type; ///
private alias c_g_desktop_app_info_newFn = extern(C) GDesktopAppInfo* function(const(char)* desktopId) nothrow;
__gshared c_g_desktop_app_info_newFn c_g_desktop_app_info_new; ///
private alias c_g_desktop_app_info_new_from_filenameFn = extern(C) GDesktopAppInfo* function(const(char)* filename) nothrow;
__gshared c_g_desktop_app_info_new_from_filenameFn c_g_desktop_app_info_new_from_filename; ///
private alias c_g_desktop_app_info_new_from_keyfileFn = extern(C) GDesktopAppInfo* function(GKeyFile* keyFile) nothrow;
__gshared c_g_desktop_app_info_new_from_keyfileFn c_g_desktop_app_info_new_from_keyfile; ///
private alias c_g_desktop_app_info_get_implementationsFn = extern(C) GList* function(const(char)* interface_) nothrow;
__gshared c_g_desktop_app_info_get_implementationsFn c_g_desktop_app_info_get_implementations; ///
private alias c_g_desktop_app_info_searchFn = extern(C) char*** function(const(char)* searchString) nothrow;
__gshared c_g_desktop_app_info_searchFn c_g_desktop_app_info_search; ///
private alias c_g_desktop_app_info_set_desktop_envFn = extern(C) void function(const(char)* desktopEnv) nothrow;
__gshared c_g_desktop_app_info_set_desktop_envFn c_g_desktop_app_info_set_desktop_env; ///
private alias c_g_desktop_app_info_get_action_nameFn = extern(C) char* function(GDesktopAppInfo* info, const(char)* actionName) nothrow;
__gshared c_g_desktop_app_info_get_action_nameFn c_g_desktop_app_info_get_action_name; ///
private alias c_g_desktop_app_info_get_booleanFn = extern(C) gboolean function(GDesktopAppInfo* info, const(char)* key) nothrow;
__gshared c_g_desktop_app_info_get_booleanFn c_g_desktop_app_info_get_boolean; ///
private alias c_g_desktop_app_info_get_categoriesFn = extern(C) const(char)* function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_categoriesFn c_g_desktop_app_info_get_categories; ///
private alias c_g_desktop_app_info_get_filenameFn = extern(C) const(char)* function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_filenameFn c_g_desktop_app_info_get_filename; ///
private alias c_g_desktop_app_info_get_generic_nameFn = extern(C) const(char)* function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_generic_nameFn c_g_desktop_app_info_get_generic_name; ///
private alias c_g_desktop_app_info_get_is_hiddenFn = extern(C) gboolean function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_is_hiddenFn c_g_desktop_app_info_get_is_hidden; ///
private alias c_g_desktop_app_info_get_keywordsFn = extern(C) const(char*)* function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_keywordsFn c_g_desktop_app_info_get_keywords; ///
private alias c_g_desktop_app_info_get_locale_stringFn = extern(C) char* function(GDesktopAppInfo* info, const(char)* key) nothrow;
__gshared c_g_desktop_app_info_get_locale_stringFn c_g_desktop_app_info_get_locale_string; ///
private alias c_g_desktop_app_info_get_nodisplayFn = extern(C) gboolean function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_nodisplayFn c_g_desktop_app_info_get_nodisplay; ///
private alias c_g_desktop_app_info_get_show_inFn = extern(C) gboolean function(GDesktopAppInfo* info, const(char)* desktopEnv) nothrow;
__gshared c_g_desktop_app_info_get_show_inFn c_g_desktop_app_info_get_show_in; ///
private alias c_g_desktop_app_info_get_startup_wm_classFn = extern(C) const(char)* function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_get_startup_wm_classFn c_g_desktop_app_info_get_startup_wm_class; ///
private alias c_g_desktop_app_info_get_stringFn = extern(C) char* function(GDesktopAppInfo* info, const(char)* key) nothrow;
__gshared c_g_desktop_app_info_get_stringFn c_g_desktop_app_info_get_string; ///
private alias c_g_desktop_app_info_get_string_listFn = extern(C) char** function(GDesktopAppInfo* info, const(char)* key, size_t* length) nothrow;
__gshared c_g_desktop_app_info_get_string_listFn c_g_desktop_app_info_get_string_list; ///
private alias c_g_desktop_app_info_has_keyFn = extern(C) gboolean function(GDesktopAppInfo* info, const(char)* key) nothrow;
__gshared c_g_desktop_app_info_has_keyFn c_g_desktop_app_info_has_key; ///
private alias c_g_desktop_app_info_launch_actionFn = extern(C) void function(GDesktopAppInfo* info, const(char)* actionName, GAppLaunchContext* launchContext) nothrow;
__gshared c_g_desktop_app_info_launch_actionFn c_g_desktop_app_info_launch_action; ///
private alias c_g_desktop_app_info_launch_uris_as_managerFn = extern(C) gboolean function(GDesktopAppInfo* appinfo, GList* uris, GAppLaunchContext* launchContext, GSpawnFlags spawnFlags, GSpawnChildSetupFunc userSetup, void* userSetupData, GDesktopAppLaunchCallback pidCallback, void* pidCallbackData, GError** _err) nothrow;
__gshared c_g_desktop_app_info_launch_uris_as_managerFn c_g_desktop_app_info_launch_uris_as_manager; ///
private alias c_g_desktop_app_info_launch_uris_as_manager_with_fdsFn = extern(C) gboolean function(GDesktopAppInfo* appinfo, GList* uris, GAppLaunchContext* launchContext, GSpawnFlags spawnFlags, GSpawnChildSetupFunc userSetup, void* userSetupData, GDesktopAppLaunchCallback pidCallback, void* pidCallbackData, int stdinFd, int stdoutFd, int stderrFd, GError** _err) nothrow;
__gshared c_g_desktop_app_info_launch_uris_as_manager_with_fdsFn c_g_desktop_app_info_launch_uris_as_manager_with_fds; ///
private alias c_g_desktop_app_info_list_actionsFn = extern(C) const(char*)* function(GDesktopAppInfo* info) nothrow;
__gshared c_g_desktop_app_info_list_actionsFn c_g_desktop_app_info_list_actions; ///

// DesktopAppInfoLookup
private alias c_g_desktop_app_info_lookup_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_desktop_app_info_lookup_get_typeFn c_g_desktop_app_info_lookup_get_type; ///
private alias c_g_desktop_app_info_lookup_get_default_for_uri_schemeFn = extern(C) GAppInfo* function(GDesktopAppInfoLookup* lookup, const(char)* uriScheme) nothrow;
__gshared c_g_desktop_app_info_lookup_get_default_for_uri_schemeFn c_g_desktop_app_info_lookup_get_default_for_uri_scheme; ///

// FDMessage
private alias c_g_unix_fd_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_fd_message_get_typeFn c_g_unix_fd_message_get_type; ///
private alias c_g_unix_fd_message_newFn = extern(C) GSocketControlMessage* function() nothrow;
__gshared c_g_unix_fd_message_newFn c_g_unix_fd_message_new; ///
private alias c_g_unix_fd_message_new_with_fd_listFn = extern(C) GSocketControlMessage* function(GUnixFDList* fdList) nothrow;
__gshared c_g_unix_fd_message_new_with_fd_listFn c_g_unix_fd_message_new_with_fd_list; ///
private alias c_g_unix_fd_message_append_fdFn = extern(C) gboolean function(GUnixFDMessage* message, int fd, GError** _err) nothrow;
__gshared c_g_unix_fd_message_append_fdFn c_g_unix_fd_message_append_fd; ///
private alias c_g_unix_fd_message_get_fd_listFn = extern(C) GUnixFDList* function(GUnixFDMessage* message) nothrow;
__gshared c_g_unix_fd_message_get_fd_listFn c_g_unix_fd_message_get_fd_list; ///
private alias c_g_unix_fd_message_steal_fdsFn = extern(C) int* function(GUnixFDMessage* message, int* length) nothrow;
__gshared c_g_unix_fd_message_steal_fdsFn c_g_unix_fd_message_steal_fds; ///

// FileDescriptorBased
private alias c_g_file_descriptor_based_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_descriptor_based_get_typeFn c_g_file_descriptor_based_get_type; ///
private alias c_g_file_descriptor_based_get_fdFn = extern(C) int function(GFileDescriptorBased* fdBased) nothrow;
__gshared c_g_file_descriptor_based_get_fdFn c_g_file_descriptor_based_get_fd; ///

// InputStream
private alias c_g_unix_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_input_stream_get_typeFn c_g_unix_input_stream_get_type; ///
private alias c_g_unix_input_stream_newFn = extern(C) GInputStream* function(int fd, gboolean closeFd) nothrow;
__gshared c_g_unix_input_stream_newFn c_g_unix_input_stream_new; ///
private alias c_g_unix_input_stream_get_close_fdFn = extern(C) gboolean function(GUnixInputStream* stream) nothrow;
__gshared c_g_unix_input_stream_get_close_fdFn c_g_unix_input_stream_get_close_fd; ///
private alias c_g_unix_input_stream_get_fdFn = extern(C) int function(GUnixInputStream* stream) nothrow;
__gshared c_g_unix_input_stream_get_fdFn c_g_unix_input_stream_get_fd; ///
private alias c_g_unix_input_stream_set_close_fdFn = extern(C) void function(GUnixInputStream* stream, gboolean closeFd) nothrow;
__gshared c_g_unix_input_stream_set_close_fdFn c_g_unix_input_stream_set_close_fd; ///

// MountEntry
private alias c_g_unix_mount_entry_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_mount_entry_get_typeFn c_g_unix_mount_entry_get_type; ///
private alias c_g_unix_mount_entry_compareFn = extern(C) int function(GUnixMountEntry* mount1, GUnixMountEntry* mount2) nothrow;
__gshared c_g_unix_mount_entry_compareFn c_g_unix_mount_entry_compare; ///
private alias c_g_unix_mount_entry_copyFn = extern(C) GUnixMountEntry* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_copyFn c_g_unix_mount_entry_copy; ///
private alias c_g_unix_mount_entry_freeFn = extern(C) void function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_freeFn c_g_unix_mount_entry_free; ///
private alias c_g_unix_mount_entry_get_device_pathFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_get_device_pathFn c_g_unix_mount_entry_get_device_path; ///
private alias c_g_unix_mount_entry_get_fs_typeFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_get_fs_typeFn c_g_unix_mount_entry_get_fs_type; ///
private alias c_g_unix_mount_entry_get_mount_pathFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_get_mount_pathFn c_g_unix_mount_entry_get_mount_path; ///
private alias c_g_unix_mount_entry_get_optionsFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_get_optionsFn c_g_unix_mount_entry_get_options; ///
private alias c_g_unix_mount_entry_get_root_pathFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_get_root_pathFn c_g_unix_mount_entry_get_root_path; ///
private alias c_g_unix_mount_entry_guess_can_ejectFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_guess_can_ejectFn c_g_unix_mount_entry_guess_can_eject; ///
private alias c_g_unix_mount_entry_guess_iconFn = extern(C) GIcon* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_guess_iconFn c_g_unix_mount_entry_guess_icon; ///
private alias c_g_unix_mount_entry_guess_nameFn = extern(C) char* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_guess_nameFn c_g_unix_mount_entry_guess_name; ///
private alias c_g_unix_mount_entry_guess_should_displayFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_guess_should_displayFn c_g_unix_mount_entry_guess_should_display; ///
private alias c_g_unix_mount_entry_guess_symbolic_iconFn = extern(C) GIcon* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_guess_symbolic_iconFn c_g_unix_mount_entry_guess_symbolic_icon; ///
private alias c_g_unix_mount_entry_is_readonlyFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_is_readonlyFn c_g_unix_mount_entry_is_readonly; ///
private alias c_g_unix_mount_entry_is_system_internalFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_entry_is_system_internalFn c_g_unix_mount_entry_is_system_internal; ///
private alias c_g_unix_mount_entry_atFn = extern(C) GUnixMountEntry* function(const(char)* mountPath, ulong* timeRead) nothrow;
__gshared c_g_unix_mount_entry_atFn c_g_unix_mount_entry_at; ///
private alias c_g_unix_mount_entry_forFn = extern(C) GUnixMountEntry* function(const(char)* filePath, ulong* timeRead) nothrow;
__gshared c_g_unix_mount_entry_forFn c_g_unix_mount_entry_for; ///

// MountMonitor
private alias c_g_unix_mount_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_mount_monitor_get_typeFn c_g_unix_mount_monitor_get_type; ///
private alias c_g_unix_mount_monitor_newFn = extern(C) GUnixMountMonitor* function() nothrow;
__gshared c_g_unix_mount_monitor_newFn c_g_unix_mount_monitor_new; ///
private alias c_g_unix_mount_monitor_getFn = extern(C) GUnixMountMonitor* function() nothrow;
__gshared c_g_unix_mount_monitor_getFn c_g_unix_mount_monitor_get; ///
private alias c_g_unix_mount_monitor_set_rate_limitFn = extern(C) void function(GUnixMountMonitor* mountMonitor, int limitMsec) nothrow;
__gshared c_g_unix_mount_monitor_set_rate_limitFn c_g_unix_mount_monitor_set_rate_limit; ///

// MountPoint
private alias c_g_unix_mount_point_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_mount_point_get_typeFn c_g_unix_mount_point_get_type; ///
private alias c_g_unix_mount_point_compareFn = extern(C) int function(GUnixMountPoint* mount1, GUnixMountPoint* mount2) nothrow;
__gshared c_g_unix_mount_point_compareFn c_g_unix_mount_point_compare; ///
private alias c_g_unix_mount_point_copyFn = extern(C) GUnixMountPoint* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_copyFn c_g_unix_mount_point_copy; ///
private alias c_g_unix_mount_point_freeFn = extern(C) void function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_freeFn c_g_unix_mount_point_free; ///
private alias c_g_unix_mount_point_get_device_pathFn = extern(C) const(char)* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_get_device_pathFn c_g_unix_mount_point_get_device_path; ///
private alias c_g_unix_mount_point_get_fs_typeFn = extern(C) const(char)* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_get_fs_typeFn c_g_unix_mount_point_get_fs_type; ///
private alias c_g_unix_mount_point_get_mount_pathFn = extern(C) const(char)* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_get_mount_pathFn c_g_unix_mount_point_get_mount_path; ///
private alias c_g_unix_mount_point_get_optionsFn = extern(C) const(char)* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_get_optionsFn c_g_unix_mount_point_get_options; ///
private alias c_g_unix_mount_point_guess_can_ejectFn = extern(C) gboolean function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_guess_can_ejectFn c_g_unix_mount_point_guess_can_eject; ///
private alias c_g_unix_mount_point_guess_iconFn = extern(C) GIcon* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_guess_iconFn c_g_unix_mount_point_guess_icon; ///
private alias c_g_unix_mount_point_guess_nameFn = extern(C) char* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_guess_nameFn c_g_unix_mount_point_guess_name; ///
private alias c_g_unix_mount_point_guess_symbolic_iconFn = extern(C) GIcon* function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_guess_symbolic_iconFn c_g_unix_mount_point_guess_symbolic_icon; ///
private alias c_g_unix_mount_point_is_loopbackFn = extern(C) gboolean function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_is_loopbackFn c_g_unix_mount_point_is_loopback; ///
private alias c_g_unix_mount_point_is_readonlyFn = extern(C) gboolean function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_is_readonlyFn c_g_unix_mount_point_is_readonly; ///
private alias c_g_unix_mount_point_is_user_mountableFn = extern(C) gboolean function(GUnixMountPoint* mountPoint) nothrow;
__gshared c_g_unix_mount_point_is_user_mountableFn c_g_unix_mount_point_is_user_mountable; ///
private alias c_g_unix_mount_point_atFn = extern(C) GUnixMountPoint* function(const(char)* mountPath, ulong* timeRead) nothrow;
__gshared c_g_unix_mount_point_atFn c_g_unix_mount_point_at; ///

// OutputStream
private alias c_g_unix_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_output_stream_get_typeFn c_g_unix_output_stream_get_type; ///
private alias c_g_unix_output_stream_newFn = extern(C) GOutputStream* function(int fd, gboolean closeFd) nothrow;
__gshared c_g_unix_output_stream_newFn c_g_unix_output_stream_new; ///
private alias c_g_unix_output_stream_get_close_fdFn = extern(C) gboolean function(GUnixOutputStream* stream) nothrow;
__gshared c_g_unix_output_stream_get_close_fdFn c_g_unix_output_stream_get_close_fd; ///
private alias c_g_unix_output_stream_get_fdFn = extern(C) int function(GUnixOutputStream* stream) nothrow;
__gshared c_g_unix_output_stream_get_fdFn c_g_unix_output_stream_get_fd; ///
private alias c_g_unix_output_stream_set_close_fdFn = extern(C) void function(GUnixOutputStream* stream, gboolean closeFd) nothrow;
__gshared c_g_unix_output_stream_set_close_fdFn c_g_unix_output_stream_set_close_fd; ///

// global
private alias c_g_unix_is_mount_path_system_internalFn = extern(C) gboolean function(const(char)* mountPath) nothrow;
__gshared c_g_unix_is_mount_path_system_internalFn c_g_unix_is_mount_path_system_internal; ///
private alias c_g_unix_is_system_device_pathFn = extern(C) gboolean function(const(char)* devicePath) nothrow;
__gshared c_g_unix_is_system_device_pathFn c_g_unix_is_system_device_path; ///
private alias c_g_unix_is_system_fs_typeFn = extern(C) gboolean function(const(char)* fsType) nothrow;
__gshared c_g_unix_is_system_fs_typeFn c_g_unix_is_system_fs_type; ///
private alias c_g_unix_mount_atFn = extern(C) GUnixMountEntry* function(const(char)* mountPath, ulong* timeRead) nothrow;
__gshared c_g_unix_mount_atFn c_g_unix_mount_at; ///
private alias c_g_unix_mount_compareFn = extern(C) int function(GUnixMountEntry* mount1, GUnixMountEntry* mount2) nothrow;
__gshared c_g_unix_mount_compareFn c_g_unix_mount_compare; ///
private alias c_g_unix_mount_copyFn = extern(C) GUnixMountEntry* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_copyFn c_g_unix_mount_copy; ///
private alias c_g_unix_mount_entries_changed_sinceFn = extern(C) gboolean function(ulong time) nothrow;
__gshared c_g_unix_mount_entries_changed_sinceFn c_g_unix_mount_entries_changed_since; ///
private alias c_g_unix_mount_entries_getFn = extern(C) GList* function(ulong* timeRead) nothrow;
__gshared c_g_unix_mount_entries_getFn c_g_unix_mount_entries_get; ///
private alias c_g_unix_mount_entries_get_from_fileFn = extern(C) GUnixMountEntry** function(const(char)* tablePath, ulong* timeReadOut, size_t* nEntriesOut) nothrow;
__gshared c_g_unix_mount_entries_get_from_fileFn c_g_unix_mount_entries_get_from_file; ///
private alias c_g_unix_mount_forFn = extern(C) GUnixMountEntry* function(const(char)* filePath, ulong* timeRead) nothrow;
__gshared c_g_unix_mount_forFn c_g_unix_mount_for; ///
private alias c_g_unix_mount_freeFn = extern(C) void function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_freeFn c_g_unix_mount_free; ///
private alias c_g_unix_mount_get_device_pathFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_get_device_pathFn c_g_unix_mount_get_device_path; ///
private alias c_g_unix_mount_get_fs_typeFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_get_fs_typeFn c_g_unix_mount_get_fs_type; ///
private alias c_g_unix_mount_get_mount_pathFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_get_mount_pathFn c_g_unix_mount_get_mount_path; ///
private alias c_g_unix_mount_get_optionsFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_get_optionsFn c_g_unix_mount_get_options; ///
private alias c_g_unix_mount_get_root_pathFn = extern(C) const(char)* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_get_root_pathFn c_g_unix_mount_get_root_path; ///
private alias c_g_unix_mount_guess_can_ejectFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_guess_can_ejectFn c_g_unix_mount_guess_can_eject; ///
private alias c_g_unix_mount_guess_iconFn = extern(C) GIcon* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_guess_iconFn c_g_unix_mount_guess_icon; ///
private alias c_g_unix_mount_guess_nameFn = extern(C) char* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_guess_nameFn c_g_unix_mount_guess_name; ///
private alias c_g_unix_mount_guess_should_displayFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_guess_should_displayFn c_g_unix_mount_guess_should_display; ///
private alias c_g_unix_mount_guess_symbolic_iconFn = extern(C) GIcon* function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_guess_symbolic_iconFn c_g_unix_mount_guess_symbolic_icon; ///
private alias c_g_unix_mount_is_readonlyFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_is_readonlyFn c_g_unix_mount_is_readonly; ///
private alias c_g_unix_mount_is_system_internalFn = extern(C) gboolean function(GUnixMountEntry* mountEntry) nothrow;
__gshared c_g_unix_mount_is_system_internalFn c_g_unix_mount_is_system_internal; ///
private alias c_g_unix_mount_points_changed_sinceFn = extern(C) gboolean function(ulong time) nothrow;
__gshared c_g_unix_mount_points_changed_sinceFn c_g_unix_mount_points_changed_since; ///
private alias c_g_unix_mount_points_getFn = extern(C) GList* function(ulong* timeRead) nothrow;
__gshared c_g_unix_mount_points_getFn c_g_unix_mount_points_get; ///
private alias c_g_unix_mount_points_get_from_fileFn = extern(C) GUnixMountPoint** function(const(char)* tablePath, ulong* timeReadOut, size_t* nPointsOut) nothrow;
__gshared c_g_unix_mount_points_get_from_fileFn c_g_unix_mount_points_get_from_file; ///
private alias c_g_unix_mounts_changed_sinceFn = extern(C) gboolean function(ulong time) nothrow;
__gshared c_g_unix_mounts_changed_sinceFn c_g_unix_mounts_changed_since; ///
private alias c_g_unix_mounts_getFn = extern(C) GList* function(ulong* timeRead) nothrow;
__gshared c_g_unix_mounts_getFn c_g_unix_mounts_get; ///
private alias c_g_unix_mounts_get_from_fileFn = extern(C) GUnixMountEntry** function(const(char)* tablePath, ulong* timeReadOut, size_t* nEntriesOut) nothrow;
__gshared c_g_unix_mounts_get_from_fileFn c_g_unix_mounts_get_from_file; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.giounix2");

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
