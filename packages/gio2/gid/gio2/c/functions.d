/// C functions for gio2 library
module gid.gio2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gio2.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["gio-2.0_0"];

// Action
private alias c_g_action_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_action_get_typeFn c_g_action_get_type; ///
private alias c_g_action_name_is_validFn = extern(C) gboolean function(const(char)* actionName) nothrow;
__gshared c_g_action_name_is_validFn c_g_action_name_is_valid; ///
private alias c_g_action_parse_detailed_nameFn = extern(C) gboolean function(const(char)* detailedName, char** actionName, GVariant** targetValue, GError** _err) nothrow;
__gshared c_g_action_parse_detailed_nameFn c_g_action_parse_detailed_name; ///
private alias c_g_action_print_detailed_nameFn = extern(C) char* function(const(char)* actionName, GVariant* targetValue) nothrow;
__gshared c_g_action_print_detailed_nameFn c_g_action_print_detailed_name; ///
private alias c_g_action_activateFn = extern(C) void function(GAction* action, GVariant* parameter) nothrow;
__gshared c_g_action_activateFn c_g_action_activate; ///
private alias c_g_action_change_stateFn = extern(C) void function(GAction* action, GVariant* value) nothrow;
__gshared c_g_action_change_stateFn c_g_action_change_state; ///
private alias c_g_action_get_enabledFn = extern(C) gboolean function(GAction* action) nothrow;
__gshared c_g_action_get_enabledFn c_g_action_get_enabled; ///
private alias c_g_action_get_nameFn = extern(C) const(char)* function(GAction* action) nothrow;
__gshared c_g_action_get_nameFn c_g_action_get_name; ///
private alias c_g_action_get_parameter_typeFn = extern(C) const(GVariantType)* function(GAction* action) nothrow;
__gshared c_g_action_get_parameter_typeFn c_g_action_get_parameter_type; ///
private alias c_g_action_get_stateFn = extern(C) GVariant* function(GAction* action) nothrow;
__gshared c_g_action_get_stateFn c_g_action_get_state; ///
private alias c_g_action_get_state_hintFn = extern(C) GVariant* function(GAction* action) nothrow;
__gshared c_g_action_get_state_hintFn c_g_action_get_state_hint; ///
private alias c_g_action_get_state_typeFn = extern(C) const(GVariantType)* function(GAction* action) nothrow;
__gshared c_g_action_get_state_typeFn c_g_action_get_state_type; ///

// ActionGroup
private alias c_g_action_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_action_group_get_typeFn c_g_action_group_get_type; ///
private alias c_g_action_group_action_addedFn = extern(C) void function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_action_addedFn c_g_action_group_action_added; ///
private alias c_g_action_group_action_enabled_changedFn = extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, gboolean enabled) nothrow;
__gshared c_g_action_group_action_enabled_changedFn c_g_action_group_action_enabled_changed; ///
private alias c_g_action_group_action_removedFn = extern(C) void function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_action_removedFn c_g_action_group_action_removed; ///
private alias c_g_action_group_action_state_changedFn = extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, GVariant* state) nothrow;
__gshared c_g_action_group_action_state_changedFn c_g_action_group_action_state_changed; ///
private alias c_g_action_group_activate_actionFn = extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, GVariant* parameter) nothrow;
__gshared c_g_action_group_activate_actionFn c_g_action_group_activate_action; ///
private alias c_g_action_group_change_action_stateFn = extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, GVariant* value) nothrow;
__gshared c_g_action_group_change_action_stateFn c_g_action_group_change_action_state; ///
private alias c_g_action_group_get_action_enabledFn = extern(C) gboolean function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_get_action_enabledFn c_g_action_group_get_action_enabled; ///
private alias c_g_action_group_get_action_parameter_typeFn = extern(C) const(GVariantType)* function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_get_action_parameter_typeFn c_g_action_group_get_action_parameter_type; ///
private alias c_g_action_group_get_action_stateFn = extern(C) GVariant* function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_get_action_stateFn c_g_action_group_get_action_state; ///
private alias c_g_action_group_get_action_state_hintFn = extern(C) GVariant* function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_get_action_state_hintFn c_g_action_group_get_action_state_hint; ///
private alias c_g_action_group_get_action_state_typeFn = extern(C) const(GVariantType)* function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_get_action_state_typeFn c_g_action_group_get_action_state_type; ///
private alias c_g_action_group_has_actionFn = extern(C) gboolean function(GActionGroup* actionGroup, const(char)* actionName) nothrow;
__gshared c_g_action_group_has_actionFn c_g_action_group_has_action; ///
private alias c_g_action_group_list_actionsFn = extern(C) char** function(GActionGroup* actionGroup) nothrow;
__gshared c_g_action_group_list_actionsFn c_g_action_group_list_actions; ///
private alias c_g_action_group_query_actionFn = extern(C) gboolean function(GActionGroup* actionGroup, const(char)* actionName, gboolean* enabled, const(GVariantType*)* parameterType, const(GVariantType*)* stateType, GVariant** stateHint, GVariant** state) nothrow;
__gshared c_g_action_group_query_actionFn c_g_action_group_query_action; ///

// ActionMap
private alias c_g_action_map_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_action_map_get_typeFn c_g_action_map_get_type; ///
private alias c_g_action_map_add_actionFn = extern(C) void function(GActionMap* actionMap, GAction* action) nothrow;
__gshared c_g_action_map_add_actionFn c_g_action_map_add_action; ///
private alias c_g_action_map_add_action_entriesFn = extern(C) void function(GActionMap* actionMap, const(GActionEntry)* entries, int nEntries, void* userData) nothrow;
__gshared c_g_action_map_add_action_entriesFn c_g_action_map_add_action_entries; ///
private alias c_g_action_map_lookup_actionFn = extern(C) GAction* function(GActionMap* actionMap, const(char)* actionName) nothrow;
__gshared c_g_action_map_lookup_actionFn c_g_action_map_lookup_action; ///
private alias c_g_action_map_remove_actionFn = extern(C) void function(GActionMap* actionMap, const(char)* actionName) nothrow;
__gshared c_g_action_map_remove_actionFn c_g_action_map_remove_action; ///
private alias c_g_action_map_remove_action_entriesFn = extern(C) void function(GActionMap* actionMap, const(GActionEntry)* entries, int nEntries) nothrow;
__gshared c_g_action_map_remove_action_entriesFn c_g_action_map_remove_action_entries; ///

// AppInfo
private alias c_g_app_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_app_info_get_typeFn c_g_app_info_get_type; ///
private alias c_g_app_info_create_from_commandlineFn = extern(C) GAppInfo* function(const(char)* commandline, const(char)* applicationName, GAppInfoCreateFlags flags, GError** _err) nothrow;
__gshared c_g_app_info_create_from_commandlineFn c_g_app_info_create_from_commandline; ///
private alias c_g_app_info_get_allFn = extern(C) GList* function() nothrow;
__gshared c_g_app_info_get_allFn c_g_app_info_get_all; ///
private alias c_g_app_info_get_all_for_typeFn = extern(C) GList* function(const(char)* contentType) nothrow;
__gshared c_g_app_info_get_all_for_typeFn c_g_app_info_get_all_for_type; ///
private alias c_g_app_info_get_default_for_typeFn = extern(C) GAppInfo* function(const(char)* contentType, gboolean mustSupportUris) nothrow;
__gshared c_g_app_info_get_default_for_typeFn c_g_app_info_get_default_for_type; ///
private alias c_g_app_info_get_default_for_type_asyncFn = extern(C) void function(const(char)* contentType, gboolean mustSupportUris, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_app_info_get_default_for_type_asyncFn c_g_app_info_get_default_for_type_async; ///
private alias c_g_app_info_get_default_for_type_finishFn = extern(C) GAppInfo* function(GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_app_info_get_default_for_type_finishFn c_g_app_info_get_default_for_type_finish; ///
private alias c_g_app_info_get_default_for_uri_schemeFn = extern(C) GAppInfo* function(const(char)* uriScheme) nothrow;
__gshared c_g_app_info_get_default_for_uri_schemeFn c_g_app_info_get_default_for_uri_scheme; ///
private alias c_g_app_info_get_default_for_uri_scheme_asyncFn = extern(C) void function(const(char)* uriScheme, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_app_info_get_default_for_uri_scheme_asyncFn c_g_app_info_get_default_for_uri_scheme_async; ///
private alias c_g_app_info_get_default_for_uri_scheme_finishFn = extern(C) GAppInfo* function(GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_app_info_get_default_for_uri_scheme_finishFn c_g_app_info_get_default_for_uri_scheme_finish; ///
private alias c_g_app_info_get_fallback_for_typeFn = extern(C) GList* function(const(char)* contentType) nothrow;
__gshared c_g_app_info_get_fallback_for_typeFn c_g_app_info_get_fallback_for_type; ///
private alias c_g_app_info_get_recommended_for_typeFn = extern(C) GList* function(const(char)* contentType) nothrow;
__gshared c_g_app_info_get_recommended_for_typeFn c_g_app_info_get_recommended_for_type; ///
private alias c_g_app_info_launch_default_for_uriFn = extern(C) gboolean function(const(char)* uri, GAppLaunchContext* context, GError** _err) nothrow;
__gshared c_g_app_info_launch_default_for_uriFn c_g_app_info_launch_default_for_uri; ///
private alias c_g_app_info_launch_default_for_uri_asyncFn = extern(C) void function(const(char)* uri, GAppLaunchContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_app_info_launch_default_for_uri_asyncFn c_g_app_info_launch_default_for_uri_async; ///
private alias c_g_app_info_launch_default_for_uri_finishFn = extern(C) gboolean function(GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_app_info_launch_default_for_uri_finishFn c_g_app_info_launch_default_for_uri_finish; ///
private alias c_g_app_info_reset_type_associationsFn = extern(C) void function(const(char)* contentType) nothrow;
__gshared c_g_app_info_reset_type_associationsFn c_g_app_info_reset_type_associations; ///
private alias c_g_app_info_add_supports_typeFn = extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow;
__gshared c_g_app_info_add_supports_typeFn c_g_app_info_add_supports_type; ///
private alias c_g_app_info_can_deleteFn = extern(C) gboolean function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_can_deleteFn c_g_app_info_can_delete; ///
private alias c_g_app_info_can_remove_supports_typeFn = extern(C) gboolean function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_can_remove_supports_typeFn c_g_app_info_can_remove_supports_type; ///
private alias c_g_app_info_deleteFn = extern(C) gboolean function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_deleteFn c_g_app_info_delete; ///
private alias c_g_app_info_dupFn = extern(C) GAppInfo* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_dupFn c_g_app_info_dup; ///
private alias c_g_app_info_equalFn = extern(C) gboolean function(GAppInfo* appinfo1, GAppInfo* appinfo2) nothrow;
__gshared c_g_app_info_equalFn c_g_app_info_equal; ///
private alias c_g_app_info_get_commandlineFn = extern(C) const(char)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_commandlineFn c_g_app_info_get_commandline; ///
private alias c_g_app_info_get_descriptionFn = extern(C) const(char)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_descriptionFn c_g_app_info_get_description; ///
private alias c_g_app_info_get_display_nameFn = extern(C) const(char)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_display_nameFn c_g_app_info_get_display_name; ///
private alias c_g_app_info_get_executableFn = extern(C) const(char)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_executableFn c_g_app_info_get_executable; ///
private alias c_g_app_info_get_iconFn = extern(C) GIcon* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_iconFn c_g_app_info_get_icon; ///
private alias c_g_app_info_get_idFn = extern(C) const(char)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_idFn c_g_app_info_get_id; ///
private alias c_g_app_info_get_nameFn = extern(C) const(char)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_nameFn c_g_app_info_get_name; ///
private alias c_g_app_info_get_supported_typesFn = extern(C) const(char*)* function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_get_supported_typesFn c_g_app_info_get_supported_types; ///
private alias c_g_app_info_launchFn = extern(C) gboolean function(GAppInfo* appinfo, GList* files, GAppLaunchContext* context, GError** _err) nothrow;
__gshared c_g_app_info_launchFn c_g_app_info_launch; ///
private alias c_g_app_info_launch_urisFn = extern(C) gboolean function(GAppInfo* appinfo, GList* uris, GAppLaunchContext* context, GError** _err) nothrow;
__gshared c_g_app_info_launch_urisFn c_g_app_info_launch_uris; ///
private alias c_g_app_info_launch_uris_asyncFn = extern(C) void function(GAppInfo* appinfo, GList* uris, GAppLaunchContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_app_info_launch_uris_asyncFn c_g_app_info_launch_uris_async; ///
private alias c_g_app_info_launch_uris_finishFn = extern(C) gboolean function(GAppInfo* appinfo, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_app_info_launch_uris_finishFn c_g_app_info_launch_uris_finish; ///
private alias c_g_app_info_remove_supports_typeFn = extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow;
__gshared c_g_app_info_remove_supports_typeFn c_g_app_info_remove_supports_type; ///
private alias c_g_app_info_set_as_default_for_extensionFn = extern(C) gboolean function(GAppInfo* appinfo, const(char)* extension, GError** _err) nothrow;
__gshared c_g_app_info_set_as_default_for_extensionFn c_g_app_info_set_as_default_for_extension; ///
private alias c_g_app_info_set_as_default_for_typeFn = extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow;
__gshared c_g_app_info_set_as_default_for_typeFn c_g_app_info_set_as_default_for_type; ///
private alias c_g_app_info_set_as_last_used_for_typeFn = extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow;
__gshared c_g_app_info_set_as_last_used_for_typeFn c_g_app_info_set_as_last_used_for_type; ///
private alias c_g_app_info_should_showFn = extern(C) gboolean function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_should_showFn c_g_app_info_should_show; ///
private alias c_g_app_info_supports_filesFn = extern(C) gboolean function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_supports_filesFn c_g_app_info_supports_files; ///
private alias c_g_app_info_supports_urisFn = extern(C) gboolean function(GAppInfo* appinfo) nothrow;
__gshared c_g_app_info_supports_urisFn c_g_app_info_supports_uris; ///

// AppInfoMonitor
private alias c_g_app_info_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_app_info_monitor_get_typeFn c_g_app_info_monitor_get_type; ///
private alias c_g_app_info_monitor_getFn = extern(C) GAppInfoMonitor* function() nothrow;
__gshared c_g_app_info_monitor_getFn c_g_app_info_monitor_get; ///

// AppLaunchContext
private alias c_g_app_launch_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_app_launch_context_get_typeFn c_g_app_launch_context_get_type; ///
private alias c_g_app_launch_context_newFn = extern(C) GAppLaunchContext* function() nothrow;
__gshared c_g_app_launch_context_newFn c_g_app_launch_context_new; ///
private alias c_g_app_launch_context_get_displayFn = extern(C) char* function(GAppLaunchContext* context, GAppInfo* info, GList* files) nothrow;
__gshared c_g_app_launch_context_get_displayFn c_g_app_launch_context_get_display; ///
private alias c_g_app_launch_context_get_environmentFn = extern(C) char** function(GAppLaunchContext* context) nothrow;
__gshared c_g_app_launch_context_get_environmentFn c_g_app_launch_context_get_environment; ///
private alias c_g_app_launch_context_get_startup_notify_idFn = extern(C) char* function(GAppLaunchContext* context, GAppInfo* info, GList* files) nothrow;
__gshared c_g_app_launch_context_get_startup_notify_idFn c_g_app_launch_context_get_startup_notify_id; ///
private alias c_g_app_launch_context_launch_failedFn = extern(C) void function(GAppLaunchContext* context, const(char)* startupNotifyId) nothrow;
__gshared c_g_app_launch_context_launch_failedFn c_g_app_launch_context_launch_failed; ///
private alias c_g_app_launch_context_setenvFn = extern(C) void function(GAppLaunchContext* context, const(char)* variable, const(char)* value) nothrow;
__gshared c_g_app_launch_context_setenvFn c_g_app_launch_context_setenv; ///
private alias c_g_app_launch_context_unsetenvFn = extern(C) void function(GAppLaunchContext* context, const(char)* variable) nothrow;
__gshared c_g_app_launch_context_unsetenvFn c_g_app_launch_context_unsetenv; ///

// Application
private alias c_g_application_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_application_get_typeFn c_g_application_get_type; ///
private alias c_g_application_newFn = extern(C) GApplication* function(const(char)* applicationId, GApplicationFlags flags) nothrow;
__gshared c_g_application_newFn c_g_application_new; ///
private alias c_g_application_get_defaultFn = extern(C) GApplication* function() nothrow;
__gshared c_g_application_get_defaultFn c_g_application_get_default; ///
private alias c_g_application_id_is_validFn = extern(C) gboolean function(const(char)* applicationId) nothrow;
__gshared c_g_application_id_is_validFn c_g_application_id_is_valid; ///
private alias c_g_application_activateFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_activateFn c_g_application_activate; ///
private alias c_g_application_add_main_optionFn = extern(C) void function(GApplication* application, const(char)* longName, char shortName, GOptionFlags flags, GOptionArg arg, const(char)* description, const(char)* argDescription) nothrow;
__gshared c_g_application_add_main_optionFn c_g_application_add_main_option; ///
private alias c_g_application_add_main_option_entriesFn = extern(C) void function(GApplication* application, const(GOptionEntry)* entries) nothrow;
__gshared c_g_application_add_main_option_entriesFn c_g_application_add_main_option_entries; ///
private alias c_g_application_add_option_groupFn = extern(C) void function(GApplication* application, GOptionGroup* group) nothrow;
__gshared c_g_application_add_option_groupFn c_g_application_add_option_group; ///
private alias c_g_application_bind_busy_propertyFn = extern(C) void function(GApplication* application, GObject* object, const(char)* property) nothrow;
__gshared c_g_application_bind_busy_propertyFn c_g_application_bind_busy_property; ///
private alias c_g_application_get_application_idFn = extern(C) const(char)* function(GApplication* application) nothrow;
__gshared c_g_application_get_application_idFn c_g_application_get_application_id; ///
private alias c_g_application_get_dbus_connectionFn = extern(C) GDBusConnection* function(GApplication* application) nothrow;
__gshared c_g_application_get_dbus_connectionFn c_g_application_get_dbus_connection; ///
private alias c_g_application_get_dbus_object_pathFn = extern(C) const(char)* function(GApplication* application) nothrow;
__gshared c_g_application_get_dbus_object_pathFn c_g_application_get_dbus_object_path; ///
private alias c_g_application_get_flagsFn = extern(C) GApplicationFlags function(GApplication* application) nothrow;
__gshared c_g_application_get_flagsFn c_g_application_get_flags; ///
private alias c_g_application_get_inactivity_timeoutFn = extern(C) uint function(GApplication* application) nothrow;
__gshared c_g_application_get_inactivity_timeoutFn c_g_application_get_inactivity_timeout; ///
private alias c_g_application_get_is_busyFn = extern(C) gboolean function(GApplication* application) nothrow;
__gshared c_g_application_get_is_busyFn c_g_application_get_is_busy; ///
private alias c_g_application_get_is_registeredFn = extern(C) gboolean function(GApplication* application) nothrow;
__gshared c_g_application_get_is_registeredFn c_g_application_get_is_registered; ///
private alias c_g_application_get_is_remoteFn = extern(C) gboolean function(GApplication* application) nothrow;
__gshared c_g_application_get_is_remoteFn c_g_application_get_is_remote; ///
private alias c_g_application_get_resource_base_pathFn = extern(C) const(char)* function(GApplication* application) nothrow;
__gshared c_g_application_get_resource_base_pathFn c_g_application_get_resource_base_path; ///
private alias c_g_application_get_versionFn = extern(C) const(char)* function(GApplication* application) nothrow;
__gshared c_g_application_get_versionFn c_g_application_get_version; ///
private alias c_g_application_holdFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_holdFn c_g_application_hold; ///
private alias c_g_application_mark_busyFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_mark_busyFn c_g_application_mark_busy; ///
private alias c_g_application_openFn = extern(C) void function(GApplication* application, GFile** files, int nFiles, const(char)* hint) nothrow;
__gshared c_g_application_openFn c_g_application_open; ///
private alias c_g_application_quitFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_quitFn c_g_application_quit; ///
private alias c_g_application_registerFn = extern(C) gboolean function(GApplication* application, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_application_registerFn c_g_application_register; ///
private alias c_g_application_releaseFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_releaseFn c_g_application_release; ///
private alias c_g_application_runFn = extern(C) int function(GApplication* application, int argc, char** argv) nothrow;
__gshared c_g_application_runFn c_g_application_run; ///
private alias c_g_application_send_notificationFn = extern(C) void function(GApplication* application, const(char)* id, GNotification* notification) nothrow;
__gshared c_g_application_send_notificationFn c_g_application_send_notification; ///
private alias c_g_application_set_action_groupFn = extern(C) void function(GApplication* application, GActionGroup* actionGroup) nothrow;
__gshared c_g_application_set_action_groupFn c_g_application_set_action_group; ///
private alias c_g_application_set_application_idFn = extern(C) void function(GApplication* application, const(char)* applicationId) nothrow;
__gshared c_g_application_set_application_idFn c_g_application_set_application_id; ///
private alias c_g_application_set_defaultFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_set_defaultFn c_g_application_set_default; ///
private alias c_g_application_set_flagsFn = extern(C) void function(GApplication* application, GApplicationFlags flags) nothrow;
__gshared c_g_application_set_flagsFn c_g_application_set_flags; ///
private alias c_g_application_set_inactivity_timeoutFn = extern(C) void function(GApplication* application, uint inactivityTimeout) nothrow;
__gshared c_g_application_set_inactivity_timeoutFn c_g_application_set_inactivity_timeout; ///
private alias c_g_application_set_option_context_descriptionFn = extern(C) void function(GApplication* application, const(char)* description) nothrow;
__gshared c_g_application_set_option_context_descriptionFn c_g_application_set_option_context_description; ///
private alias c_g_application_set_option_context_parameter_stringFn = extern(C) void function(GApplication* application, const(char)* parameterString) nothrow;
__gshared c_g_application_set_option_context_parameter_stringFn c_g_application_set_option_context_parameter_string; ///
private alias c_g_application_set_option_context_summaryFn = extern(C) void function(GApplication* application, const(char)* summary) nothrow;
__gshared c_g_application_set_option_context_summaryFn c_g_application_set_option_context_summary; ///
private alias c_g_application_set_resource_base_pathFn = extern(C) void function(GApplication* application, const(char)* resourcePath) nothrow;
__gshared c_g_application_set_resource_base_pathFn c_g_application_set_resource_base_path; ///
private alias c_g_application_set_versionFn = extern(C) void function(GApplication* application, const(char)* version_) nothrow;
__gshared c_g_application_set_versionFn c_g_application_set_version; ///
private alias c_g_application_unbind_busy_propertyFn = extern(C) void function(GApplication* application, GObject* object, const(char)* property) nothrow;
__gshared c_g_application_unbind_busy_propertyFn c_g_application_unbind_busy_property; ///
private alias c_g_application_unmark_busyFn = extern(C) void function(GApplication* application) nothrow;
__gshared c_g_application_unmark_busyFn c_g_application_unmark_busy; ///
private alias c_g_application_withdraw_notificationFn = extern(C) void function(GApplication* application, const(char)* id) nothrow;
__gshared c_g_application_withdraw_notificationFn c_g_application_withdraw_notification; ///

// ApplicationCommandLine
private alias c_g_application_command_line_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_application_command_line_get_typeFn c_g_application_command_line_get_type; ///
private alias c_g_application_command_line_create_file_for_argFn = extern(C) GFile* function(GApplicationCommandLine* cmdline, const(char)* arg) nothrow;
__gshared c_g_application_command_line_create_file_for_argFn c_g_application_command_line_create_file_for_arg; ///
private alias c_g_application_command_line_doneFn = extern(C) void function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_doneFn c_g_application_command_line_done; ///
private alias c_g_application_command_line_get_argumentsFn = extern(C) char** function(GApplicationCommandLine* cmdline, int* argc) nothrow;
__gshared c_g_application_command_line_get_argumentsFn c_g_application_command_line_get_arguments; ///
private alias c_g_application_command_line_get_cwdFn = extern(C) const(char)* function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_cwdFn c_g_application_command_line_get_cwd; ///
private alias c_g_application_command_line_get_environFn = extern(C) const(char*)* function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_environFn c_g_application_command_line_get_environ; ///
private alias c_g_application_command_line_get_exit_statusFn = extern(C) int function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_exit_statusFn c_g_application_command_line_get_exit_status; ///
private alias c_g_application_command_line_get_is_remoteFn = extern(C) gboolean function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_is_remoteFn c_g_application_command_line_get_is_remote; ///
private alias c_g_application_command_line_get_options_dictFn = extern(C) GVariantDict* function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_options_dictFn c_g_application_command_line_get_options_dict; ///
private alias c_g_application_command_line_get_platform_dataFn = extern(C) GVariant* function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_platform_dataFn c_g_application_command_line_get_platform_data; ///
private alias c_g_application_command_line_get_stdinFn = extern(C) GInputStream* function(GApplicationCommandLine* cmdline) nothrow;
__gshared c_g_application_command_line_get_stdinFn c_g_application_command_line_get_stdin; ///
private alias c_g_application_command_line_getenvFn = extern(C) const(char)* function(GApplicationCommandLine* cmdline, const(char)* name) nothrow;
__gshared c_g_application_command_line_getenvFn c_g_application_command_line_getenv; ///
private alias c_g_application_command_line_printFn = extern(C) void function(GApplicationCommandLine* cmdline, const(char)* format,  ...) nothrow;
__gshared c_g_application_command_line_printFn c_g_application_command_line_print; ///
private alias c_g_application_command_line_print_literalFn = extern(C) void function(GApplicationCommandLine* cmdline, const(char)* message) nothrow;
__gshared c_g_application_command_line_print_literalFn c_g_application_command_line_print_literal; ///
private alias c_g_application_command_line_printerrFn = extern(C) void function(GApplicationCommandLine* cmdline, const(char)* format,  ...) nothrow;
__gshared c_g_application_command_line_printerrFn c_g_application_command_line_printerr; ///
private alias c_g_application_command_line_printerr_literalFn = extern(C) void function(GApplicationCommandLine* cmdline, const(char)* message) nothrow;
__gshared c_g_application_command_line_printerr_literalFn c_g_application_command_line_printerr_literal; ///
private alias c_g_application_command_line_set_exit_statusFn = extern(C) void function(GApplicationCommandLine* cmdline, int exitStatus) nothrow;
__gshared c_g_application_command_line_set_exit_statusFn c_g_application_command_line_set_exit_status; ///

// AsyncInitable
private alias c_g_async_initable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_async_initable_get_typeFn c_g_async_initable_get_type; ///
private alias c_g_async_initable_new_asyncFn = extern(C) void function(GType objectType, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_g_async_initable_new_asyncFn c_g_async_initable_new_async; ///
private alias c_g_async_initable_new_valist_asyncFn = extern(C) void function(GType objectType, const(char)* firstPropertyName, void* varArgs, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_async_initable_new_valist_asyncFn c_g_async_initable_new_valist_async; ///
private alias c_g_async_initable_newv_asyncFn = extern(C) void function(GType objectType, uint nParameters, GParameter* parameters, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_async_initable_newv_asyncFn c_g_async_initable_newv_async; ///
private alias c_g_async_initable_init_asyncFn = extern(C) void function(GAsyncInitable* initable, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_async_initable_init_asyncFn c_g_async_initable_init_async; ///
private alias c_g_async_initable_init_finishFn = extern(C) gboolean function(GAsyncInitable* initable, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_async_initable_init_finishFn c_g_async_initable_init_finish; ///
private alias c_g_async_initable_new_finishFn = extern(C) GObject* function(GAsyncInitable* initable, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_async_initable_new_finishFn c_g_async_initable_new_finish; ///

// AsyncResult
private alias c_g_async_result_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_async_result_get_typeFn c_g_async_result_get_type; ///
private alias c_g_async_result_get_source_objectFn = extern(C) GObject* function(GAsyncResult* res) nothrow;
__gshared c_g_async_result_get_source_objectFn c_g_async_result_get_source_object; ///
private alias c_g_async_result_get_user_dataFn = extern(C) void* function(GAsyncResult* res) nothrow;
__gshared c_g_async_result_get_user_dataFn c_g_async_result_get_user_data; ///
private alias c_g_async_result_is_taggedFn = extern(C) gboolean function(GAsyncResult* res, void* sourceTag) nothrow;
__gshared c_g_async_result_is_taggedFn c_g_async_result_is_tagged; ///
private alias c_g_async_result_legacy_propagate_errorFn = extern(C) gboolean function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_async_result_legacy_propagate_errorFn c_g_async_result_legacy_propagate_error; ///

// BufferedInputStream
private alias c_g_buffered_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_buffered_input_stream_get_typeFn c_g_buffered_input_stream_get_type; ///
private alias c_g_buffered_input_stream_newFn = extern(C) GInputStream* function(GInputStream* baseStream) nothrow;
__gshared c_g_buffered_input_stream_newFn c_g_buffered_input_stream_new; ///
private alias c_g_buffered_input_stream_new_sizedFn = extern(C) GInputStream* function(GInputStream* baseStream, size_t size) nothrow;
__gshared c_g_buffered_input_stream_new_sizedFn c_g_buffered_input_stream_new_sized; ///
private alias c_g_buffered_input_stream_fillFn = extern(C) ptrdiff_t function(GBufferedInputStream* stream, ptrdiff_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_buffered_input_stream_fillFn c_g_buffered_input_stream_fill; ///
private alias c_g_buffered_input_stream_fill_asyncFn = extern(C) void function(GBufferedInputStream* stream, ptrdiff_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_buffered_input_stream_fill_asyncFn c_g_buffered_input_stream_fill_async; ///
private alias c_g_buffered_input_stream_fill_finishFn = extern(C) ptrdiff_t function(GBufferedInputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_buffered_input_stream_fill_finishFn c_g_buffered_input_stream_fill_finish; ///
private alias c_g_buffered_input_stream_get_availableFn = extern(C) size_t function(GBufferedInputStream* stream) nothrow;
__gshared c_g_buffered_input_stream_get_availableFn c_g_buffered_input_stream_get_available; ///
private alias c_g_buffered_input_stream_get_buffer_sizeFn = extern(C) size_t function(GBufferedInputStream* stream) nothrow;
__gshared c_g_buffered_input_stream_get_buffer_sizeFn c_g_buffered_input_stream_get_buffer_size; ///
private alias c_g_buffered_input_stream_peekFn = extern(C) size_t function(GBufferedInputStream* stream, void* buffer, size_t offset, size_t count) nothrow;
__gshared c_g_buffered_input_stream_peekFn c_g_buffered_input_stream_peek; ///
private alias c_g_buffered_input_stream_peek_bufferFn = extern(C) void* function(GBufferedInputStream* stream, size_t* count) nothrow;
__gshared c_g_buffered_input_stream_peek_bufferFn c_g_buffered_input_stream_peek_buffer; ///
private alias c_g_buffered_input_stream_read_byteFn = extern(C) int function(GBufferedInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_buffered_input_stream_read_byteFn c_g_buffered_input_stream_read_byte; ///
private alias c_g_buffered_input_stream_set_buffer_sizeFn = extern(C) void function(GBufferedInputStream* stream, size_t size) nothrow;
__gshared c_g_buffered_input_stream_set_buffer_sizeFn c_g_buffered_input_stream_set_buffer_size; ///

// BufferedOutputStream
private alias c_g_buffered_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_buffered_output_stream_get_typeFn c_g_buffered_output_stream_get_type; ///
private alias c_g_buffered_output_stream_newFn = extern(C) GOutputStream* function(GOutputStream* baseStream) nothrow;
__gshared c_g_buffered_output_stream_newFn c_g_buffered_output_stream_new; ///
private alias c_g_buffered_output_stream_new_sizedFn = extern(C) GOutputStream* function(GOutputStream* baseStream, size_t size) nothrow;
__gshared c_g_buffered_output_stream_new_sizedFn c_g_buffered_output_stream_new_sized; ///
private alias c_g_buffered_output_stream_get_auto_growFn = extern(C) gboolean function(GBufferedOutputStream* stream) nothrow;
__gshared c_g_buffered_output_stream_get_auto_growFn c_g_buffered_output_stream_get_auto_grow; ///
private alias c_g_buffered_output_stream_get_buffer_sizeFn = extern(C) size_t function(GBufferedOutputStream* stream) nothrow;
__gshared c_g_buffered_output_stream_get_buffer_sizeFn c_g_buffered_output_stream_get_buffer_size; ///
private alias c_g_buffered_output_stream_set_auto_growFn = extern(C) void function(GBufferedOutputStream* stream, gboolean autoGrow) nothrow;
__gshared c_g_buffered_output_stream_set_auto_growFn c_g_buffered_output_stream_set_auto_grow; ///
private alias c_g_buffered_output_stream_set_buffer_sizeFn = extern(C) void function(GBufferedOutputStream* stream, size_t size) nothrow;
__gshared c_g_buffered_output_stream_set_buffer_sizeFn c_g_buffered_output_stream_set_buffer_size; ///

// BytesIcon
private alias c_g_bytes_icon_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_bytes_icon_get_typeFn c_g_bytes_icon_get_type; ///
private alias c_g_bytes_icon_newFn = extern(C) GIcon* function(GBytes* bytes) nothrow;
__gshared c_g_bytes_icon_newFn c_g_bytes_icon_new; ///
private alias c_g_bytes_icon_get_bytesFn = extern(C) GBytes* function(GBytesIcon* icon) nothrow;
__gshared c_g_bytes_icon_get_bytesFn c_g_bytes_icon_get_bytes; ///

// Cancellable
private alias c_g_cancellable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_cancellable_get_typeFn c_g_cancellable_get_type; ///
private alias c_g_cancellable_newFn = extern(C) GCancellable* function() nothrow;
__gshared c_g_cancellable_newFn c_g_cancellable_new; ///
private alias c_g_cancellable_get_currentFn = extern(C) GCancellable* function() nothrow;
__gshared c_g_cancellable_get_currentFn c_g_cancellable_get_current; ///
private alias c_g_cancellable_cancelFn = extern(C) void function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_cancelFn c_g_cancellable_cancel; ///
private alias c_g_cancellable_connectFn = extern(C) gulong function(GCancellable* cancellable, GCancellableConnectFunc callback, void* data, GDestroyNotify dataDestroyFunc) nothrow;
__gshared c_g_cancellable_connectFn c_g_cancellable_connect; ///
private alias c_g_cancellable_disconnectFn = extern(C) void function(GCancellable* cancellable, gulong handlerId) nothrow;
__gshared c_g_cancellable_disconnectFn c_g_cancellable_disconnect; ///
private alias c_g_cancellable_get_fdFn = extern(C) int function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_get_fdFn c_g_cancellable_get_fd; ///
private alias c_g_cancellable_is_cancelledFn = extern(C) gboolean function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_is_cancelledFn c_g_cancellable_is_cancelled; ///
private alias c_g_cancellable_make_pollfdFn = extern(C) gboolean function(GCancellable* cancellable, GPollFD* pollfd) nothrow;
__gshared c_g_cancellable_make_pollfdFn c_g_cancellable_make_pollfd; ///
private alias c_g_cancellable_pop_currentFn = extern(C) void function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_pop_currentFn c_g_cancellable_pop_current; ///
private alias c_g_cancellable_push_currentFn = extern(C) void function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_push_currentFn c_g_cancellable_push_current; ///
private alias c_g_cancellable_release_fdFn = extern(C) void function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_release_fdFn c_g_cancellable_release_fd; ///
private alias c_g_cancellable_resetFn = extern(C) void function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_resetFn c_g_cancellable_reset; ///
private alias c_g_cancellable_set_error_if_cancelledFn = extern(C) gboolean function(GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_cancellable_set_error_if_cancelledFn c_g_cancellable_set_error_if_cancelled; ///
private alias c_g_cancellable_source_newFn = extern(C) GSource* function(GCancellable* cancellable) nothrow;
__gshared c_g_cancellable_source_newFn c_g_cancellable_source_new; ///

// CharsetConverter
private alias c_g_charset_converter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_charset_converter_get_typeFn c_g_charset_converter_get_type; ///
private alias c_g_charset_converter_newFn = extern(C) GCharsetConverter* function(const(char)* toCharset, const(char)* fromCharset, GError** _err) nothrow;
__gshared c_g_charset_converter_newFn c_g_charset_converter_new; ///
private alias c_g_charset_converter_get_num_fallbacksFn = extern(C) uint function(GCharsetConverter* converter) nothrow;
__gshared c_g_charset_converter_get_num_fallbacksFn c_g_charset_converter_get_num_fallbacks; ///
private alias c_g_charset_converter_get_use_fallbackFn = extern(C) gboolean function(GCharsetConverter* converter) nothrow;
__gshared c_g_charset_converter_get_use_fallbackFn c_g_charset_converter_get_use_fallback; ///
private alias c_g_charset_converter_set_use_fallbackFn = extern(C) void function(GCharsetConverter* converter, gboolean useFallback) nothrow;
__gshared c_g_charset_converter_set_use_fallbackFn c_g_charset_converter_set_use_fallback; ///

// Converter
private alias c_g_converter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_converter_get_typeFn c_g_converter_get_type; ///
private alias c_g_converter_convertFn = extern(C) GConverterResult function(GConverter* converter, void* inbuf, size_t inbufSize, void* outbuf, size_t outbufSize, GConverterFlags flags, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_converter_convertFn c_g_converter_convert; ///
private alias c_g_converter_convert_bytesFn = extern(C) GBytes* function(GConverter* converter, GBytes* bytes, GError** _err) nothrow;
__gshared c_g_converter_convert_bytesFn c_g_converter_convert_bytes; ///
private alias c_g_converter_resetFn = extern(C) void function(GConverter* converter) nothrow;
__gshared c_g_converter_resetFn c_g_converter_reset; ///

// ConverterInputStream
private alias c_g_converter_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_converter_input_stream_get_typeFn c_g_converter_input_stream_get_type; ///
private alias c_g_converter_input_stream_newFn = extern(C) GInputStream* function(GInputStream* baseStream, GConverter* converter) nothrow;
__gshared c_g_converter_input_stream_newFn c_g_converter_input_stream_new; ///
private alias c_g_converter_input_stream_get_converterFn = extern(C) GConverter* function(GConverterInputStream* converterStream) nothrow;
__gshared c_g_converter_input_stream_get_converterFn c_g_converter_input_stream_get_converter; ///

// ConverterOutputStream
private alias c_g_converter_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_converter_output_stream_get_typeFn c_g_converter_output_stream_get_type; ///
private alias c_g_converter_output_stream_newFn = extern(C) GOutputStream* function(GOutputStream* baseStream, GConverter* converter) nothrow;
__gshared c_g_converter_output_stream_newFn c_g_converter_output_stream_new; ///
private alias c_g_converter_output_stream_get_converterFn = extern(C) GConverter* function(GConverterOutputStream* converterStream) nothrow;
__gshared c_g_converter_output_stream_get_converterFn c_g_converter_output_stream_get_converter; ///

// Credentials
private alias c_g_credentials_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_credentials_get_typeFn c_g_credentials_get_type; ///
private alias c_g_credentials_newFn = extern(C) GCredentials* function() nothrow;
__gshared c_g_credentials_newFn c_g_credentials_new; ///
private alias c_g_credentials_get_nativeFn = extern(C) void* function(GCredentials* credentials, GCredentialsType nativeType) nothrow;
__gshared c_g_credentials_get_nativeFn c_g_credentials_get_native; ///
private alias c_g_credentials_get_unix_pidFn = extern(C) int function(GCredentials* credentials, GError** _err) nothrow;
__gshared c_g_credentials_get_unix_pidFn c_g_credentials_get_unix_pid; ///
private alias c_g_credentials_get_unix_userFn = extern(C) uint function(GCredentials* credentials, GError** _err) nothrow;
__gshared c_g_credentials_get_unix_userFn c_g_credentials_get_unix_user; ///
private alias c_g_credentials_is_same_userFn = extern(C) gboolean function(GCredentials* credentials, GCredentials* otherCredentials, GError** _err) nothrow;
__gshared c_g_credentials_is_same_userFn c_g_credentials_is_same_user; ///
private alias c_g_credentials_set_nativeFn = extern(C) void function(GCredentials* credentials, GCredentialsType nativeType, void* native) nothrow;
__gshared c_g_credentials_set_nativeFn c_g_credentials_set_native; ///
private alias c_g_credentials_set_unix_userFn = extern(C) gboolean function(GCredentials* credentials, uint uid, GError** _err) nothrow;
__gshared c_g_credentials_set_unix_userFn c_g_credentials_set_unix_user; ///
private alias c_g_credentials_to_stringFn = extern(C) char* function(GCredentials* credentials) nothrow;
__gshared c_g_credentials_to_stringFn c_g_credentials_to_string; ///

// DBusActionGroup
private alias c_g_dbus_action_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_action_group_get_typeFn c_g_dbus_action_group_get_type; ///
private alias c_g_dbus_action_group_getFn = extern(C) GDBusActionGroup* function(GDBusConnection* connection, const(char)* busName, const(char)* objectPath) nothrow;
__gshared c_g_dbus_action_group_getFn c_g_dbus_action_group_get; ///

// DBusAnnotationInfo
private alias c_g_dbus_annotation_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_annotation_info_get_typeFn c_g_dbus_annotation_info_get_type; ///
private alias c_g_dbus_annotation_info_refFn = extern(C) GDBusAnnotationInfo* function(GDBusAnnotationInfo* info) nothrow;
__gshared c_g_dbus_annotation_info_refFn c_g_dbus_annotation_info_ref; ///
private alias c_g_dbus_annotation_info_unrefFn = extern(C) void function(GDBusAnnotationInfo* info) nothrow;
__gshared c_g_dbus_annotation_info_unrefFn c_g_dbus_annotation_info_unref; ///
private alias c_g_dbus_annotation_info_lookupFn = extern(C) const(char)* function(GDBusAnnotationInfo** annotations, const(char)* name) nothrow;
__gshared c_g_dbus_annotation_info_lookupFn c_g_dbus_annotation_info_lookup; ///

// DBusArgInfo
private alias c_g_dbus_arg_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_arg_info_get_typeFn c_g_dbus_arg_info_get_type; ///
private alias c_g_dbus_arg_info_refFn = extern(C) GDBusArgInfo* function(GDBusArgInfo* info) nothrow;
__gshared c_g_dbus_arg_info_refFn c_g_dbus_arg_info_ref; ///
private alias c_g_dbus_arg_info_unrefFn = extern(C) void function(GDBusArgInfo* info) nothrow;
__gshared c_g_dbus_arg_info_unrefFn c_g_dbus_arg_info_unref; ///

// DBusAuthObserver
private alias c_g_dbus_auth_observer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_auth_observer_get_typeFn c_g_dbus_auth_observer_get_type; ///
private alias c_g_dbus_auth_observer_newFn = extern(C) GDBusAuthObserver* function() nothrow;
__gshared c_g_dbus_auth_observer_newFn c_g_dbus_auth_observer_new; ///
private alias c_g_dbus_auth_observer_allow_mechanismFn = extern(C) gboolean function(GDBusAuthObserver* observer, const(char)* mechanism) nothrow;
__gshared c_g_dbus_auth_observer_allow_mechanismFn c_g_dbus_auth_observer_allow_mechanism; ///
private alias c_g_dbus_auth_observer_authorize_authenticated_peerFn = extern(C) gboolean function(GDBusAuthObserver* observer, GIOStream* stream, GCredentials* credentials) nothrow;
__gshared c_g_dbus_auth_observer_authorize_authenticated_peerFn c_g_dbus_auth_observer_authorize_authenticated_peer; ///

// DBusConnection
private alias c_g_dbus_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_connection_get_typeFn c_g_dbus_connection_get_type; ///
private alias c_g_dbus_connection_new_finishFn = extern(C) GDBusConnection* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_new_finishFn c_g_dbus_connection_new_finish; ///
private alias c_g_dbus_connection_new_for_address_finishFn = extern(C) GDBusConnection* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_new_for_address_finishFn c_g_dbus_connection_new_for_address_finish; ///
private alias c_g_dbus_connection_new_for_address_syncFn = extern(C) GDBusConnection* function(const(char)* address, GDBusConnectionFlags flags, GDBusAuthObserver* observer, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_new_for_address_syncFn c_g_dbus_connection_new_for_address_sync; ///
private alias c_g_dbus_connection_new_syncFn = extern(C) GDBusConnection* function(GIOStream* stream, const(char)* guid, GDBusConnectionFlags flags, GDBusAuthObserver* observer, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_new_syncFn c_g_dbus_connection_new_sync; ///
private alias c_g_dbus_connection_newFn = extern(C) void function(GIOStream* stream, const(char)* guid, GDBusConnectionFlags flags, GDBusAuthObserver* observer, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_newFn c_g_dbus_connection_new; ///
private alias c_g_dbus_connection_new_for_addressFn = extern(C) void function(const(char)* address, GDBusConnectionFlags flags, GDBusAuthObserver* observer, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_new_for_addressFn c_g_dbus_connection_new_for_address; ///
private alias c_g_dbus_connection_add_filterFn = extern(C) uint function(GDBusConnection* connection, GDBusMessageFilterFunction filterFunction, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_g_dbus_connection_add_filterFn c_g_dbus_connection_add_filter; ///
private alias c_g_dbus_connection_callFn = extern(C) void function(GDBusConnection* connection, const(char)* busName, const(char)* objectPath, const(char)* interfaceName, const(char)* methodName, GVariant* parameters, const(GVariantType)* replyType, GDBusCallFlags flags, int timeoutMsec, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_callFn c_g_dbus_connection_call; ///
private alias c_g_dbus_connection_call_finishFn = extern(C) GVariant* function(GDBusConnection* connection, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_call_finishFn c_g_dbus_connection_call_finish; ///
private alias c_g_dbus_connection_call_syncFn = extern(C) GVariant* function(GDBusConnection* connection, const(char)* busName, const(char)* objectPath, const(char)* interfaceName, const(char)* methodName, GVariant* parameters, const(GVariantType)* replyType, GDBusCallFlags flags, int timeoutMsec, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_call_syncFn c_g_dbus_connection_call_sync; ///
private alias c_g_dbus_connection_call_with_unix_fd_listFn = extern(C) void function(GDBusConnection* connection, const(char)* busName, const(char)* objectPath, const(char)* interfaceName, const(char)* methodName, GVariant* parameters, const(GVariantType)* replyType, GDBusCallFlags flags, int timeoutMsec, GUnixFDList* fdList, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_call_with_unix_fd_listFn c_g_dbus_connection_call_with_unix_fd_list; ///
private alias c_g_dbus_connection_call_with_unix_fd_list_finishFn = extern(C) GVariant* function(GDBusConnection* connection, GUnixFDList** outFdList, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_call_with_unix_fd_list_finishFn c_g_dbus_connection_call_with_unix_fd_list_finish; ///
private alias c_g_dbus_connection_call_with_unix_fd_list_syncFn = extern(C) GVariant* function(GDBusConnection* connection, const(char)* busName, const(char)* objectPath, const(char)* interfaceName, const(char)* methodName, GVariant* parameters, const(GVariantType)* replyType, GDBusCallFlags flags, int timeoutMsec, GUnixFDList* fdList, GUnixFDList** outFdList, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_call_with_unix_fd_list_syncFn c_g_dbus_connection_call_with_unix_fd_list_sync; ///
private alias c_g_dbus_connection_closeFn = extern(C) void function(GDBusConnection* connection, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_closeFn c_g_dbus_connection_close; ///
private alias c_g_dbus_connection_close_finishFn = extern(C) gboolean function(GDBusConnection* connection, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_close_finishFn c_g_dbus_connection_close_finish; ///
private alias c_g_dbus_connection_close_syncFn = extern(C) gboolean function(GDBusConnection* connection, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_close_syncFn c_g_dbus_connection_close_sync; ///
private alias c_g_dbus_connection_emit_signalFn = extern(C) gboolean function(GDBusConnection* connection, const(char)* destinationBusName, const(char)* objectPath, const(char)* interfaceName, const(char)* signalName, GVariant* parameters, GError** _err) nothrow;
__gshared c_g_dbus_connection_emit_signalFn c_g_dbus_connection_emit_signal; ///
private alias c_g_dbus_connection_export_action_groupFn = extern(C) uint function(GDBusConnection* connection, const(char)* objectPath, GActionGroup* actionGroup, GError** _err) nothrow;
__gshared c_g_dbus_connection_export_action_groupFn c_g_dbus_connection_export_action_group; ///
private alias c_g_dbus_connection_export_menu_modelFn = extern(C) uint function(GDBusConnection* connection, const(char)* objectPath, GMenuModel* menu, GError** _err) nothrow;
__gshared c_g_dbus_connection_export_menu_modelFn c_g_dbus_connection_export_menu_model; ///
private alias c_g_dbus_connection_flushFn = extern(C) void function(GDBusConnection* connection, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_flushFn c_g_dbus_connection_flush; ///
private alias c_g_dbus_connection_flush_finishFn = extern(C) gboolean function(GDBusConnection* connection, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_flush_finishFn c_g_dbus_connection_flush_finish; ///
private alias c_g_dbus_connection_flush_syncFn = extern(C) gboolean function(GDBusConnection* connection, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_flush_syncFn c_g_dbus_connection_flush_sync; ///
private alias c_g_dbus_connection_get_capabilitiesFn = extern(C) GDBusCapabilityFlags function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_capabilitiesFn c_g_dbus_connection_get_capabilities; ///
private alias c_g_dbus_connection_get_exit_on_closeFn = extern(C) gboolean function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_exit_on_closeFn c_g_dbus_connection_get_exit_on_close; ///
private alias c_g_dbus_connection_get_flagsFn = extern(C) GDBusConnectionFlags function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_flagsFn c_g_dbus_connection_get_flags; ///
private alias c_g_dbus_connection_get_guidFn = extern(C) const(char)* function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_guidFn c_g_dbus_connection_get_guid; ///
private alias c_g_dbus_connection_get_last_serialFn = extern(C) uint function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_last_serialFn c_g_dbus_connection_get_last_serial; ///
private alias c_g_dbus_connection_get_peer_credentialsFn = extern(C) GCredentials* function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_peer_credentialsFn c_g_dbus_connection_get_peer_credentials; ///
private alias c_g_dbus_connection_get_streamFn = extern(C) GIOStream* function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_streamFn c_g_dbus_connection_get_stream; ///
private alias c_g_dbus_connection_get_unique_nameFn = extern(C) const(char)* function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_get_unique_nameFn c_g_dbus_connection_get_unique_name; ///
private alias c_g_dbus_connection_is_closedFn = extern(C) gboolean function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_is_closedFn c_g_dbus_connection_is_closed; ///
private alias c_g_dbus_connection_register_objectFn = extern(C) uint function(GDBusConnection* connection, const(char)* objectPath, GDBusInterfaceInfo* interfaceInfo, const(GDBusInterfaceVTable)* vtable, void* userData, GDestroyNotify userDataFreeFunc, GError** _err) nothrow;
__gshared c_g_dbus_connection_register_objectFn c_g_dbus_connection_register_object; ///
private alias c_g_dbus_connection_register_object_with_closuresFn = extern(C) uint function(GDBusConnection* connection, const(char)* objectPath, GDBusInterfaceInfo* interfaceInfo, GClosure* methodCallClosure, GClosure* getPropertyClosure, GClosure* setPropertyClosure, GError** _err) nothrow;
__gshared c_g_dbus_connection_register_object_with_closuresFn c_g_dbus_connection_register_object_with_closures; ///
private alias c_g_dbus_connection_register_object_with_closures2Fn = extern(C) uint function(GDBusConnection* connection, const(char)* objectPath, GDBusInterfaceInfo* interfaceInfo, GClosure* methodCallClosure, GClosure* getPropertyClosure, GClosure* setPropertyClosure, GError** _err) nothrow;
__gshared c_g_dbus_connection_register_object_with_closures2Fn c_g_dbus_connection_register_object_with_closures2; ///
private alias c_g_dbus_connection_register_subtreeFn = extern(C) uint function(GDBusConnection* connection, const(char)* objectPath, const(GDBusSubtreeVTable)* vtable, GDBusSubtreeFlags flags, void* userData, GDestroyNotify userDataFreeFunc, GError** _err) nothrow;
__gshared c_g_dbus_connection_register_subtreeFn c_g_dbus_connection_register_subtree; ///
private alias c_g_dbus_connection_remove_filterFn = extern(C) void function(GDBusConnection* connection, uint filterId) nothrow;
__gshared c_g_dbus_connection_remove_filterFn c_g_dbus_connection_remove_filter; ///
private alias c_g_dbus_connection_send_messageFn = extern(C) gboolean function(GDBusConnection* connection, GDBusMessage* message, GDBusSendMessageFlags flags, uint* outSerial, GError** _err) nothrow;
__gshared c_g_dbus_connection_send_messageFn c_g_dbus_connection_send_message; ///
private alias c_g_dbus_connection_send_message_with_replyFn = extern(C) void function(GDBusConnection* connection, GDBusMessage* message, GDBusSendMessageFlags flags, int timeoutMsec, uint* outSerial, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_connection_send_message_with_replyFn c_g_dbus_connection_send_message_with_reply; ///
private alias c_g_dbus_connection_send_message_with_reply_finishFn = extern(C) GDBusMessage* function(GDBusConnection* connection, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_connection_send_message_with_reply_finishFn c_g_dbus_connection_send_message_with_reply_finish; ///
private alias c_g_dbus_connection_send_message_with_reply_syncFn = extern(C) GDBusMessage* function(GDBusConnection* connection, GDBusMessage* message, GDBusSendMessageFlags flags, int timeoutMsec, uint* outSerial, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_connection_send_message_with_reply_syncFn c_g_dbus_connection_send_message_with_reply_sync; ///
private alias c_g_dbus_connection_set_exit_on_closeFn = extern(C) void function(GDBusConnection* connection, gboolean exitOnClose) nothrow;
__gshared c_g_dbus_connection_set_exit_on_closeFn c_g_dbus_connection_set_exit_on_close; ///
private alias c_g_dbus_connection_signal_subscribeFn = extern(C) uint function(GDBusConnection* connection, const(char)* sender, const(char)* interfaceName, const(char)* member, const(char)* objectPath, const(char)* arg0, GDBusSignalFlags flags, GDBusSignalCallback callback, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_g_dbus_connection_signal_subscribeFn c_g_dbus_connection_signal_subscribe; ///
private alias c_g_dbus_connection_signal_unsubscribeFn = extern(C) void function(GDBusConnection* connection, uint subscriptionId) nothrow;
__gshared c_g_dbus_connection_signal_unsubscribeFn c_g_dbus_connection_signal_unsubscribe; ///
private alias c_g_dbus_connection_start_message_processingFn = extern(C) void function(GDBusConnection* connection) nothrow;
__gshared c_g_dbus_connection_start_message_processingFn c_g_dbus_connection_start_message_processing; ///
private alias c_g_dbus_connection_unexport_action_groupFn = extern(C) void function(GDBusConnection* connection, uint exportId) nothrow;
__gshared c_g_dbus_connection_unexport_action_groupFn c_g_dbus_connection_unexport_action_group; ///
private alias c_g_dbus_connection_unexport_menu_modelFn = extern(C) void function(GDBusConnection* connection, uint exportId) nothrow;
__gshared c_g_dbus_connection_unexport_menu_modelFn c_g_dbus_connection_unexport_menu_model; ///
private alias c_g_dbus_connection_unregister_objectFn = extern(C) gboolean function(GDBusConnection* connection, uint registrationId) nothrow;
__gshared c_g_dbus_connection_unregister_objectFn c_g_dbus_connection_unregister_object; ///
private alias c_g_dbus_connection_unregister_subtreeFn = extern(C) gboolean function(GDBusConnection* connection, uint registrationId) nothrow;
__gshared c_g_dbus_connection_unregister_subtreeFn c_g_dbus_connection_unregister_subtree; ///

// DBusInterface
private alias c_g_dbus_interface_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_interface_get_typeFn c_g_dbus_interface_get_type; ///
private alias c_g_dbus_interface_dup_objectFn = extern(C) GDBusObject* function(GDBusInterface* interface_) nothrow;
__gshared c_g_dbus_interface_dup_objectFn c_g_dbus_interface_dup_object; ///
private alias c_g_dbus_interface_get_infoFn = extern(C) GDBusInterfaceInfo* function(GDBusInterface* interface_) nothrow;
__gshared c_g_dbus_interface_get_infoFn c_g_dbus_interface_get_info; ///
private alias c_g_dbus_interface_get_objectFn = extern(C) GDBusObject* function(GDBusInterface* interface_) nothrow;
__gshared c_g_dbus_interface_get_objectFn c_g_dbus_interface_get_object; ///
private alias c_g_dbus_interface_set_objectFn = extern(C) void function(GDBusInterface* interface_, GDBusObject* object) nothrow;
__gshared c_g_dbus_interface_set_objectFn c_g_dbus_interface_set_object; ///

// DBusInterfaceInfo
private alias c_g_dbus_interface_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_interface_info_get_typeFn c_g_dbus_interface_info_get_type; ///
private alias c_g_dbus_interface_info_cache_buildFn = extern(C) void function(GDBusInterfaceInfo* info) nothrow;
__gshared c_g_dbus_interface_info_cache_buildFn c_g_dbus_interface_info_cache_build; ///
private alias c_g_dbus_interface_info_cache_releaseFn = extern(C) void function(GDBusInterfaceInfo* info) nothrow;
__gshared c_g_dbus_interface_info_cache_releaseFn c_g_dbus_interface_info_cache_release; ///
private alias c_g_dbus_interface_info_generate_xmlFn = extern(C) void function(GDBusInterfaceInfo* info, uint indent, GString* stringBuilder) nothrow;
__gshared c_g_dbus_interface_info_generate_xmlFn c_g_dbus_interface_info_generate_xml; ///
private alias c_g_dbus_interface_info_lookup_methodFn = extern(C) GDBusMethodInfo* function(GDBusInterfaceInfo* info, const(char)* name) nothrow;
__gshared c_g_dbus_interface_info_lookup_methodFn c_g_dbus_interface_info_lookup_method; ///
private alias c_g_dbus_interface_info_lookup_propertyFn = extern(C) GDBusPropertyInfo* function(GDBusInterfaceInfo* info, const(char)* name) nothrow;
__gshared c_g_dbus_interface_info_lookup_propertyFn c_g_dbus_interface_info_lookup_property; ///
private alias c_g_dbus_interface_info_lookup_signalFn = extern(C) GDBusSignalInfo* function(GDBusInterfaceInfo* info, const(char)* name) nothrow;
__gshared c_g_dbus_interface_info_lookup_signalFn c_g_dbus_interface_info_lookup_signal; ///
private alias c_g_dbus_interface_info_refFn = extern(C) GDBusInterfaceInfo* function(GDBusInterfaceInfo* info) nothrow;
__gshared c_g_dbus_interface_info_refFn c_g_dbus_interface_info_ref; ///
private alias c_g_dbus_interface_info_unrefFn = extern(C) void function(GDBusInterfaceInfo* info) nothrow;
__gshared c_g_dbus_interface_info_unrefFn c_g_dbus_interface_info_unref; ///

// DBusInterfaceSkeleton
private alias c_g_dbus_interface_skeleton_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_interface_skeleton_get_typeFn c_g_dbus_interface_skeleton_get_type; ///
private alias c_g_dbus_interface_skeleton_exportFn = extern(C) gboolean function(GDBusInterfaceSkeleton* interface_, GDBusConnection* connection, const(char)* objectPath, GError** _err) nothrow;
__gshared c_g_dbus_interface_skeleton_exportFn c_g_dbus_interface_skeleton_export; ///
private alias c_g_dbus_interface_skeleton_flushFn = extern(C) void function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_flushFn c_g_dbus_interface_skeleton_flush; ///
private alias c_g_dbus_interface_skeleton_get_connectionFn = extern(C) GDBusConnection* function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_connectionFn c_g_dbus_interface_skeleton_get_connection; ///
private alias c_g_dbus_interface_skeleton_get_connectionsFn = extern(C) GList* function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_connectionsFn c_g_dbus_interface_skeleton_get_connections; ///
private alias c_g_dbus_interface_skeleton_get_flagsFn = extern(C) GDBusInterfaceSkeletonFlags function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_flagsFn c_g_dbus_interface_skeleton_get_flags; ///
private alias c_g_dbus_interface_skeleton_get_infoFn = extern(C) GDBusInterfaceInfo* function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_infoFn c_g_dbus_interface_skeleton_get_info; ///
private alias c_g_dbus_interface_skeleton_get_object_pathFn = extern(C) const(char)* function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_object_pathFn c_g_dbus_interface_skeleton_get_object_path; ///
private alias c_g_dbus_interface_skeleton_get_propertiesFn = extern(C) GVariant* function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_propertiesFn c_g_dbus_interface_skeleton_get_properties; ///
private alias c_g_dbus_interface_skeleton_get_vtableFn = extern(C) GDBusInterfaceVTable* function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_get_vtableFn c_g_dbus_interface_skeleton_get_vtable; ///
private alias c_g_dbus_interface_skeleton_has_connectionFn = extern(C) gboolean function(GDBusInterfaceSkeleton* interface_, GDBusConnection* connection) nothrow;
__gshared c_g_dbus_interface_skeleton_has_connectionFn c_g_dbus_interface_skeleton_has_connection; ///
private alias c_g_dbus_interface_skeleton_set_flagsFn = extern(C) void function(GDBusInterfaceSkeleton* interface_, GDBusInterfaceSkeletonFlags flags) nothrow;
__gshared c_g_dbus_interface_skeleton_set_flagsFn c_g_dbus_interface_skeleton_set_flags; ///
private alias c_g_dbus_interface_skeleton_unexportFn = extern(C) void function(GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_interface_skeleton_unexportFn c_g_dbus_interface_skeleton_unexport; ///
private alias c_g_dbus_interface_skeleton_unexport_from_connectionFn = extern(C) void function(GDBusInterfaceSkeleton* interface_, GDBusConnection* connection) nothrow;
__gshared c_g_dbus_interface_skeleton_unexport_from_connectionFn c_g_dbus_interface_skeleton_unexport_from_connection; ///

// DBusMenuModel
private alias c_g_dbus_menu_model_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_menu_model_get_typeFn c_g_dbus_menu_model_get_type; ///
private alias c_g_dbus_menu_model_getFn = extern(C) GDBusMenuModel* function(GDBusConnection* connection, const(char)* busName, const(char)* objectPath) nothrow;
__gshared c_g_dbus_menu_model_getFn c_g_dbus_menu_model_get; ///

// DBusMessage
private alias c_g_dbus_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_message_get_typeFn c_g_dbus_message_get_type; ///
private alias c_g_dbus_message_newFn = extern(C) GDBusMessage* function() nothrow;
__gshared c_g_dbus_message_newFn c_g_dbus_message_new; ///
private alias c_g_dbus_message_new_from_blobFn = extern(C) GDBusMessage* function(ubyte* blob, size_t blobLen, GDBusCapabilityFlags capabilities, GError** _err) nothrow;
__gshared c_g_dbus_message_new_from_blobFn c_g_dbus_message_new_from_blob; ///
private alias c_g_dbus_message_new_method_callFn = extern(C) GDBusMessage* function(const(char)* name, const(char)* path, const(char)* interface_, const(char)* method) nothrow;
__gshared c_g_dbus_message_new_method_callFn c_g_dbus_message_new_method_call; ///
private alias c_g_dbus_message_new_signalFn = extern(C) GDBusMessage* function(const(char)* path, const(char)* interface_, const(char)* signal) nothrow;
__gshared c_g_dbus_message_new_signalFn c_g_dbus_message_new_signal; ///
private alias c_g_dbus_message_bytes_neededFn = extern(C) ptrdiff_t function(ubyte* blob, size_t blobLen, GError** _err) nothrow;
__gshared c_g_dbus_message_bytes_neededFn c_g_dbus_message_bytes_needed; ///
private alias c_g_dbus_message_copyFn = extern(C) GDBusMessage* function(GDBusMessage* message, GError** _err) nothrow;
__gshared c_g_dbus_message_copyFn c_g_dbus_message_copy; ///
private alias c_g_dbus_message_get_arg0Fn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_arg0Fn c_g_dbus_message_get_arg0; ///
private alias c_g_dbus_message_get_arg0_pathFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_arg0_pathFn c_g_dbus_message_get_arg0_path; ///
private alias c_g_dbus_message_get_bodyFn = extern(C) GVariant* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_bodyFn c_g_dbus_message_get_body; ///
private alias c_g_dbus_message_get_byte_orderFn = extern(C) GDBusMessageByteOrder function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_byte_orderFn c_g_dbus_message_get_byte_order; ///
private alias c_g_dbus_message_get_destinationFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_destinationFn c_g_dbus_message_get_destination; ///
private alias c_g_dbus_message_get_error_nameFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_error_nameFn c_g_dbus_message_get_error_name; ///
private alias c_g_dbus_message_get_flagsFn = extern(C) GDBusMessageFlags function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_flagsFn c_g_dbus_message_get_flags; ///
private alias c_g_dbus_message_get_headerFn = extern(C) GVariant* function(GDBusMessage* message, GDBusMessageHeaderField headerField) nothrow;
__gshared c_g_dbus_message_get_headerFn c_g_dbus_message_get_header; ///
private alias c_g_dbus_message_get_header_fieldsFn = extern(C) ubyte* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_header_fieldsFn c_g_dbus_message_get_header_fields; ///
private alias c_g_dbus_message_get_interfaceFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_interfaceFn c_g_dbus_message_get_interface; ///
private alias c_g_dbus_message_get_lockedFn = extern(C) gboolean function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_lockedFn c_g_dbus_message_get_locked; ///
private alias c_g_dbus_message_get_memberFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_memberFn c_g_dbus_message_get_member; ///
private alias c_g_dbus_message_get_message_typeFn = extern(C) GDBusMessageType function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_message_typeFn c_g_dbus_message_get_message_type; ///
private alias c_g_dbus_message_get_num_unix_fdsFn = extern(C) uint function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_num_unix_fdsFn c_g_dbus_message_get_num_unix_fds; ///
private alias c_g_dbus_message_get_pathFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_pathFn c_g_dbus_message_get_path; ///
private alias c_g_dbus_message_get_reply_serialFn = extern(C) uint function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_reply_serialFn c_g_dbus_message_get_reply_serial; ///
private alias c_g_dbus_message_get_senderFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_senderFn c_g_dbus_message_get_sender; ///
private alias c_g_dbus_message_get_serialFn = extern(C) uint function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_serialFn c_g_dbus_message_get_serial; ///
private alias c_g_dbus_message_get_signatureFn = extern(C) const(char)* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_signatureFn c_g_dbus_message_get_signature; ///
private alias c_g_dbus_message_get_unix_fd_listFn = extern(C) GUnixFDList* function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_get_unix_fd_listFn c_g_dbus_message_get_unix_fd_list; ///
private alias c_g_dbus_message_lockFn = extern(C) void function(GDBusMessage* message) nothrow;
__gshared c_g_dbus_message_lockFn c_g_dbus_message_lock; ///
private alias c_g_dbus_message_new_method_errorFn = extern(C) GDBusMessage* function(GDBusMessage* methodCallMessage, const(char)* errorName, const(char)* errorMessageFormat,  ...) nothrow;
__gshared c_g_dbus_message_new_method_errorFn c_g_dbus_message_new_method_error; ///
private alias c_g_dbus_message_new_method_error_literalFn = extern(C) GDBusMessage* function(GDBusMessage* methodCallMessage, const(char)* errorName, const(char)* errorMessage) nothrow;
__gshared c_g_dbus_message_new_method_error_literalFn c_g_dbus_message_new_method_error_literal; ///
private alias c_g_dbus_message_new_method_error_valistFn = extern(C) GDBusMessage* function(GDBusMessage* methodCallMessage, const(char)* errorName, const(char)* errorMessageFormat, void* varArgs) nothrow;
__gshared c_g_dbus_message_new_method_error_valistFn c_g_dbus_message_new_method_error_valist; ///
private alias c_g_dbus_message_new_method_replyFn = extern(C) GDBusMessage* function(GDBusMessage* methodCallMessage) nothrow;
__gshared c_g_dbus_message_new_method_replyFn c_g_dbus_message_new_method_reply; ///
private alias c_g_dbus_message_printFn = extern(C) char* function(GDBusMessage* message, uint indent) nothrow;
__gshared c_g_dbus_message_printFn c_g_dbus_message_print; ///
private alias c_g_dbus_message_set_bodyFn = extern(C) void function(GDBusMessage* message, GVariant* body_) nothrow;
__gshared c_g_dbus_message_set_bodyFn c_g_dbus_message_set_body; ///
private alias c_g_dbus_message_set_byte_orderFn = extern(C) void function(GDBusMessage* message, GDBusMessageByteOrder byteOrder) nothrow;
__gshared c_g_dbus_message_set_byte_orderFn c_g_dbus_message_set_byte_order; ///
private alias c_g_dbus_message_set_destinationFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_destinationFn c_g_dbus_message_set_destination; ///
private alias c_g_dbus_message_set_error_nameFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_error_nameFn c_g_dbus_message_set_error_name; ///
private alias c_g_dbus_message_set_flagsFn = extern(C) void function(GDBusMessage* message, GDBusMessageFlags flags) nothrow;
__gshared c_g_dbus_message_set_flagsFn c_g_dbus_message_set_flags; ///
private alias c_g_dbus_message_set_headerFn = extern(C) void function(GDBusMessage* message, GDBusMessageHeaderField headerField, GVariant* value) nothrow;
__gshared c_g_dbus_message_set_headerFn c_g_dbus_message_set_header; ///
private alias c_g_dbus_message_set_interfaceFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_interfaceFn c_g_dbus_message_set_interface; ///
private alias c_g_dbus_message_set_memberFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_memberFn c_g_dbus_message_set_member; ///
private alias c_g_dbus_message_set_message_typeFn = extern(C) void function(GDBusMessage* message, GDBusMessageType type) nothrow;
__gshared c_g_dbus_message_set_message_typeFn c_g_dbus_message_set_message_type; ///
private alias c_g_dbus_message_set_num_unix_fdsFn = extern(C) void function(GDBusMessage* message, uint value) nothrow;
__gshared c_g_dbus_message_set_num_unix_fdsFn c_g_dbus_message_set_num_unix_fds; ///
private alias c_g_dbus_message_set_pathFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_pathFn c_g_dbus_message_set_path; ///
private alias c_g_dbus_message_set_reply_serialFn = extern(C) void function(GDBusMessage* message, uint value) nothrow;
__gshared c_g_dbus_message_set_reply_serialFn c_g_dbus_message_set_reply_serial; ///
private alias c_g_dbus_message_set_senderFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_senderFn c_g_dbus_message_set_sender; ///
private alias c_g_dbus_message_set_serialFn = extern(C) void function(GDBusMessage* message, uint serial) nothrow;
__gshared c_g_dbus_message_set_serialFn c_g_dbus_message_set_serial; ///
private alias c_g_dbus_message_set_signatureFn = extern(C) void function(GDBusMessage* message, const(char)* value) nothrow;
__gshared c_g_dbus_message_set_signatureFn c_g_dbus_message_set_signature; ///
private alias c_g_dbus_message_set_unix_fd_listFn = extern(C) void function(GDBusMessage* message, GUnixFDList* fdList) nothrow;
__gshared c_g_dbus_message_set_unix_fd_listFn c_g_dbus_message_set_unix_fd_list; ///
private alias c_g_dbus_message_to_blobFn = extern(C) ubyte* function(GDBusMessage* message, size_t* outSize, GDBusCapabilityFlags capabilities, GError** _err) nothrow;
__gshared c_g_dbus_message_to_blobFn c_g_dbus_message_to_blob; ///
private alias c_g_dbus_message_to_gerrorFn = extern(C) gboolean function(GDBusMessage* message, GError** _err) nothrow;
__gshared c_g_dbus_message_to_gerrorFn c_g_dbus_message_to_gerror; ///

// DBusMethodInfo
private alias c_g_dbus_method_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_method_info_get_typeFn c_g_dbus_method_info_get_type; ///
private alias c_g_dbus_method_info_refFn = extern(C) GDBusMethodInfo* function(GDBusMethodInfo* info) nothrow;
__gshared c_g_dbus_method_info_refFn c_g_dbus_method_info_ref; ///
private alias c_g_dbus_method_info_unrefFn = extern(C) void function(GDBusMethodInfo* info) nothrow;
__gshared c_g_dbus_method_info_unrefFn c_g_dbus_method_info_unref; ///

// DBusMethodInvocation
private alias c_g_dbus_method_invocation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_method_invocation_get_typeFn c_g_dbus_method_invocation_get_type; ///
private alias c_g_dbus_method_invocation_get_connectionFn = extern(C) GDBusConnection* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_connectionFn c_g_dbus_method_invocation_get_connection; ///
private alias c_g_dbus_method_invocation_get_interface_nameFn = extern(C) const(char)* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_interface_nameFn c_g_dbus_method_invocation_get_interface_name; ///
private alias c_g_dbus_method_invocation_get_messageFn = extern(C) GDBusMessage* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_messageFn c_g_dbus_method_invocation_get_message; ///
private alias c_g_dbus_method_invocation_get_method_infoFn = extern(C) const(GDBusMethodInfo)* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_method_infoFn c_g_dbus_method_invocation_get_method_info; ///
private alias c_g_dbus_method_invocation_get_method_nameFn = extern(C) const(char)* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_method_nameFn c_g_dbus_method_invocation_get_method_name; ///
private alias c_g_dbus_method_invocation_get_object_pathFn = extern(C) const(char)* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_object_pathFn c_g_dbus_method_invocation_get_object_path; ///
private alias c_g_dbus_method_invocation_get_parametersFn = extern(C) GVariant* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_parametersFn c_g_dbus_method_invocation_get_parameters; ///
private alias c_g_dbus_method_invocation_get_property_infoFn = extern(C) const(GDBusPropertyInfo)* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_property_infoFn c_g_dbus_method_invocation_get_property_info; ///
private alias c_g_dbus_method_invocation_get_senderFn = extern(C) const(char)* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_senderFn c_g_dbus_method_invocation_get_sender; ///
private alias c_g_dbus_method_invocation_get_user_dataFn = extern(C) void* function(GDBusMethodInvocation* invocation) nothrow;
__gshared c_g_dbus_method_invocation_get_user_dataFn c_g_dbus_method_invocation_get_user_data; ///
private alias c_g_dbus_method_invocation_return_dbus_errorFn = extern(C) void function(GDBusMethodInvocation* invocation, const(char)* errorName, const(char)* errorMessage) nothrow;
__gshared c_g_dbus_method_invocation_return_dbus_errorFn c_g_dbus_method_invocation_return_dbus_error; ///
private alias c_g_dbus_method_invocation_return_errorFn = extern(C) void function(GDBusMethodInvocation* invocation, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_dbus_method_invocation_return_errorFn c_g_dbus_method_invocation_return_error; ///
private alias c_g_dbus_method_invocation_return_error_literalFn = extern(C) void function(GDBusMethodInvocation* invocation, GQuark domain, int code, const(char)* message) nothrow;
__gshared c_g_dbus_method_invocation_return_error_literalFn c_g_dbus_method_invocation_return_error_literal; ///
private alias c_g_dbus_method_invocation_return_error_valistFn = extern(C) void function(GDBusMethodInvocation* invocation, GQuark domain, int code, const(char)* format, void* varArgs) nothrow;
__gshared c_g_dbus_method_invocation_return_error_valistFn c_g_dbus_method_invocation_return_error_valist; ///
private alias c_g_dbus_method_invocation_return_gerrorFn = extern(C) void function(GDBusMethodInvocation* invocation, const(GError)* error) nothrow;
__gshared c_g_dbus_method_invocation_return_gerrorFn c_g_dbus_method_invocation_return_gerror; ///
private alias c_g_dbus_method_invocation_return_valueFn = extern(C) void function(GDBusMethodInvocation* invocation, GVariant* parameters) nothrow;
__gshared c_g_dbus_method_invocation_return_valueFn c_g_dbus_method_invocation_return_value; ///
private alias c_g_dbus_method_invocation_return_value_with_unix_fd_listFn = extern(C) void function(GDBusMethodInvocation* invocation, GVariant* parameters, GUnixFDList* fdList) nothrow;
__gshared c_g_dbus_method_invocation_return_value_with_unix_fd_listFn c_g_dbus_method_invocation_return_value_with_unix_fd_list; ///
private alias c_g_dbus_method_invocation_take_errorFn = extern(C) void function(GDBusMethodInvocation* invocation, GError* error) nothrow;
__gshared c_g_dbus_method_invocation_take_errorFn c_g_dbus_method_invocation_take_error; ///

// DBusNodeInfo
private alias c_g_dbus_node_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_node_info_get_typeFn c_g_dbus_node_info_get_type; ///
private alias c_g_dbus_node_info_new_for_xmlFn = extern(C) GDBusNodeInfo* function(const(char)* xmlData, GError** _err) nothrow;
__gshared c_g_dbus_node_info_new_for_xmlFn c_g_dbus_node_info_new_for_xml; ///
private alias c_g_dbus_node_info_generate_xmlFn = extern(C) void function(GDBusNodeInfo* info, uint indent, GString* stringBuilder) nothrow;
__gshared c_g_dbus_node_info_generate_xmlFn c_g_dbus_node_info_generate_xml; ///
private alias c_g_dbus_node_info_lookup_interfaceFn = extern(C) GDBusInterfaceInfo* function(GDBusNodeInfo* info, const(char)* name) nothrow;
__gshared c_g_dbus_node_info_lookup_interfaceFn c_g_dbus_node_info_lookup_interface; ///
private alias c_g_dbus_node_info_refFn = extern(C) GDBusNodeInfo* function(GDBusNodeInfo* info) nothrow;
__gshared c_g_dbus_node_info_refFn c_g_dbus_node_info_ref; ///
private alias c_g_dbus_node_info_unrefFn = extern(C) void function(GDBusNodeInfo* info) nothrow;
__gshared c_g_dbus_node_info_unrefFn c_g_dbus_node_info_unref; ///

// DBusObject
private alias c_g_dbus_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_object_get_typeFn c_g_dbus_object_get_type; ///
private alias c_g_dbus_object_get_interfaceFn = extern(C) GDBusInterface* function(GDBusObject* object, const(char)* interfaceName) nothrow;
__gshared c_g_dbus_object_get_interfaceFn c_g_dbus_object_get_interface; ///
private alias c_g_dbus_object_get_interfacesFn = extern(C) GList* function(GDBusObject* object) nothrow;
__gshared c_g_dbus_object_get_interfacesFn c_g_dbus_object_get_interfaces; ///
private alias c_g_dbus_object_get_object_pathFn = extern(C) const(char)* function(GDBusObject* object) nothrow;
__gshared c_g_dbus_object_get_object_pathFn c_g_dbus_object_get_object_path; ///

// DBusObjectManager
private alias c_g_dbus_object_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_object_manager_get_typeFn c_g_dbus_object_manager_get_type; ///
private alias c_g_dbus_object_manager_get_interfaceFn = extern(C) GDBusInterface* function(GDBusObjectManager* manager, const(char)* objectPath, const(char)* interfaceName) nothrow;
__gshared c_g_dbus_object_manager_get_interfaceFn c_g_dbus_object_manager_get_interface; ///
private alias c_g_dbus_object_manager_get_objectFn = extern(C) GDBusObject* function(GDBusObjectManager* manager, const(char)* objectPath) nothrow;
__gshared c_g_dbus_object_manager_get_objectFn c_g_dbus_object_manager_get_object; ///
private alias c_g_dbus_object_manager_get_object_pathFn = extern(C) const(char)* function(GDBusObjectManager* manager) nothrow;
__gshared c_g_dbus_object_manager_get_object_pathFn c_g_dbus_object_manager_get_object_path; ///
private alias c_g_dbus_object_manager_get_objectsFn = extern(C) GList* function(GDBusObjectManager* manager) nothrow;
__gshared c_g_dbus_object_manager_get_objectsFn c_g_dbus_object_manager_get_objects; ///

// DBusObjectManagerClient
private alias c_g_dbus_object_manager_client_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_object_manager_client_get_typeFn c_g_dbus_object_manager_client_get_type; ///
private alias c_g_dbus_object_manager_client_new_finishFn = extern(C) GDBusObjectManager* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_object_manager_client_new_finishFn c_g_dbus_object_manager_client_new_finish; ///
private alias c_g_dbus_object_manager_client_new_for_bus_finishFn = extern(C) GDBusObjectManager* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_object_manager_client_new_for_bus_finishFn c_g_dbus_object_manager_client_new_for_bus_finish; ///
private alias c_g_dbus_object_manager_client_new_for_bus_syncFn = extern(C) GDBusObjectManager* function(GBusType busType, GDBusObjectManagerClientFlags flags, const(char)* name, const(char)* objectPath, GDBusProxyTypeFunc getProxyTypeFunc, void* getProxyTypeUserData, GDestroyNotify getProxyTypeDestroyNotify, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_object_manager_client_new_for_bus_syncFn c_g_dbus_object_manager_client_new_for_bus_sync; ///
private alias c_g_dbus_object_manager_client_new_syncFn = extern(C) GDBusObjectManager* function(GDBusConnection* connection, GDBusObjectManagerClientFlags flags, const(char)* name, const(char)* objectPath, GDBusProxyTypeFunc getProxyTypeFunc, void* getProxyTypeUserData, GDestroyNotify getProxyTypeDestroyNotify, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_object_manager_client_new_syncFn c_g_dbus_object_manager_client_new_sync; ///
private alias c_g_dbus_object_manager_client_newFn = extern(C) void function(GDBusConnection* connection, GDBusObjectManagerClientFlags flags, const(char)* name, const(char)* objectPath, GDBusProxyTypeFunc getProxyTypeFunc, void* getProxyTypeUserData, GDestroyNotify getProxyTypeDestroyNotify, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_object_manager_client_newFn c_g_dbus_object_manager_client_new; ///
private alias c_g_dbus_object_manager_client_new_for_busFn = extern(C) void function(GBusType busType, GDBusObjectManagerClientFlags flags, const(char)* name, const(char)* objectPath, GDBusProxyTypeFunc getProxyTypeFunc, void* getProxyTypeUserData, GDestroyNotify getProxyTypeDestroyNotify, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_object_manager_client_new_for_busFn c_g_dbus_object_manager_client_new_for_bus; ///
private alias c_g_dbus_object_manager_client_get_connectionFn = extern(C) GDBusConnection* function(GDBusObjectManagerClient* manager) nothrow;
__gshared c_g_dbus_object_manager_client_get_connectionFn c_g_dbus_object_manager_client_get_connection; ///
private alias c_g_dbus_object_manager_client_get_flagsFn = extern(C) GDBusObjectManagerClientFlags function(GDBusObjectManagerClient* manager) nothrow;
__gshared c_g_dbus_object_manager_client_get_flagsFn c_g_dbus_object_manager_client_get_flags; ///
private alias c_g_dbus_object_manager_client_get_nameFn = extern(C) const(char)* function(GDBusObjectManagerClient* manager) nothrow;
__gshared c_g_dbus_object_manager_client_get_nameFn c_g_dbus_object_manager_client_get_name; ///
private alias c_g_dbus_object_manager_client_get_name_ownerFn = extern(C) char* function(GDBusObjectManagerClient* manager) nothrow;
__gshared c_g_dbus_object_manager_client_get_name_ownerFn c_g_dbus_object_manager_client_get_name_owner; ///

// DBusObjectManagerServer
private alias c_g_dbus_object_manager_server_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_object_manager_server_get_typeFn c_g_dbus_object_manager_server_get_type; ///
private alias c_g_dbus_object_manager_server_newFn = extern(C) GDBusObjectManagerServer* function(const(char)* objectPath) nothrow;
__gshared c_g_dbus_object_manager_server_newFn c_g_dbus_object_manager_server_new; ///
private alias c_g_dbus_object_manager_server_exportFn = extern(C) void function(GDBusObjectManagerServer* manager, GDBusObjectSkeleton* object) nothrow;
__gshared c_g_dbus_object_manager_server_exportFn c_g_dbus_object_manager_server_export; ///
private alias c_g_dbus_object_manager_server_export_uniquelyFn = extern(C) void function(GDBusObjectManagerServer* manager, GDBusObjectSkeleton* object) nothrow;
__gshared c_g_dbus_object_manager_server_export_uniquelyFn c_g_dbus_object_manager_server_export_uniquely; ///
private alias c_g_dbus_object_manager_server_get_connectionFn = extern(C) GDBusConnection* function(GDBusObjectManagerServer* manager) nothrow;
__gshared c_g_dbus_object_manager_server_get_connectionFn c_g_dbus_object_manager_server_get_connection; ///
private alias c_g_dbus_object_manager_server_is_exportedFn = extern(C) gboolean function(GDBusObjectManagerServer* manager, GDBusObjectSkeleton* object) nothrow;
__gshared c_g_dbus_object_manager_server_is_exportedFn c_g_dbus_object_manager_server_is_exported; ///
private alias c_g_dbus_object_manager_server_set_connectionFn = extern(C) void function(GDBusObjectManagerServer* manager, GDBusConnection* connection) nothrow;
__gshared c_g_dbus_object_manager_server_set_connectionFn c_g_dbus_object_manager_server_set_connection; ///
private alias c_g_dbus_object_manager_server_unexportFn = extern(C) gboolean function(GDBusObjectManagerServer* manager, const(char)* objectPath) nothrow;
__gshared c_g_dbus_object_manager_server_unexportFn c_g_dbus_object_manager_server_unexport; ///

// DBusObjectProxy
private alias c_g_dbus_object_proxy_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_object_proxy_get_typeFn c_g_dbus_object_proxy_get_type; ///
private alias c_g_dbus_object_proxy_newFn = extern(C) GDBusObjectProxy* function(GDBusConnection* connection, const(char)* objectPath) nothrow;
__gshared c_g_dbus_object_proxy_newFn c_g_dbus_object_proxy_new; ///
private alias c_g_dbus_object_proxy_get_connectionFn = extern(C) GDBusConnection* function(GDBusObjectProxy* proxy) nothrow;
__gshared c_g_dbus_object_proxy_get_connectionFn c_g_dbus_object_proxy_get_connection; ///

// DBusObjectSkeleton
private alias c_g_dbus_object_skeleton_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_object_skeleton_get_typeFn c_g_dbus_object_skeleton_get_type; ///
private alias c_g_dbus_object_skeleton_newFn = extern(C) GDBusObjectSkeleton* function(const(char)* objectPath) nothrow;
__gshared c_g_dbus_object_skeleton_newFn c_g_dbus_object_skeleton_new; ///
private alias c_g_dbus_object_skeleton_add_interfaceFn = extern(C) void function(GDBusObjectSkeleton* object, GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_object_skeleton_add_interfaceFn c_g_dbus_object_skeleton_add_interface; ///
private alias c_g_dbus_object_skeleton_flushFn = extern(C) void function(GDBusObjectSkeleton* object) nothrow;
__gshared c_g_dbus_object_skeleton_flushFn c_g_dbus_object_skeleton_flush; ///
private alias c_g_dbus_object_skeleton_remove_interfaceFn = extern(C) void function(GDBusObjectSkeleton* object, GDBusInterfaceSkeleton* interface_) nothrow;
__gshared c_g_dbus_object_skeleton_remove_interfaceFn c_g_dbus_object_skeleton_remove_interface; ///
private alias c_g_dbus_object_skeleton_remove_interface_by_nameFn = extern(C) void function(GDBusObjectSkeleton* object, const(char)* interfaceName) nothrow;
__gshared c_g_dbus_object_skeleton_remove_interface_by_nameFn c_g_dbus_object_skeleton_remove_interface_by_name; ///
private alias c_g_dbus_object_skeleton_set_object_pathFn = extern(C) void function(GDBusObjectSkeleton* object, const(char)* objectPath) nothrow;
__gshared c_g_dbus_object_skeleton_set_object_pathFn c_g_dbus_object_skeleton_set_object_path; ///

// DBusPropertyInfo
private alias c_g_dbus_property_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_property_info_get_typeFn c_g_dbus_property_info_get_type; ///
private alias c_g_dbus_property_info_refFn = extern(C) GDBusPropertyInfo* function(GDBusPropertyInfo* info) nothrow;
__gshared c_g_dbus_property_info_refFn c_g_dbus_property_info_ref; ///
private alias c_g_dbus_property_info_unrefFn = extern(C) void function(GDBusPropertyInfo* info) nothrow;
__gshared c_g_dbus_property_info_unrefFn c_g_dbus_property_info_unref; ///

// DBusProxy
private alias c_g_dbus_proxy_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_proxy_get_typeFn c_g_dbus_proxy_get_type; ///
private alias c_g_dbus_proxy_new_finishFn = extern(C) GDBusProxy* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_proxy_new_finishFn c_g_dbus_proxy_new_finish; ///
private alias c_g_dbus_proxy_new_for_bus_finishFn = extern(C) GDBusProxy* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_proxy_new_for_bus_finishFn c_g_dbus_proxy_new_for_bus_finish; ///
private alias c_g_dbus_proxy_new_for_bus_syncFn = extern(C) GDBusProxy* function(GBusType busType, GDBusProxyFlags flags, GDBusInterfaceInfo* info, const(char)* name, const(char)* objectPath, const(char)* interfaceName, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_proxy_new_for_bus_syncFn c_g_dbus_proxy_new_for_bus_sync; ///
private alias c_g_dbus_proxy_new_syncFn = extern(C) GDBusProxy* function(GDBusConnection* connection, GDBusProxyFlags flags, GDBusInterfaceInfo* info, const(char)* name, const(char)* objectPath, const(char)* interfaceName, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_proxy_new_syncFn c_g_dbus_proxy_new_sync; ///
private alias c_g_dbus_proxy_newFn = extern(C) void function(GDBusConnection* connection, GDBusProxyFlags flags, GDBusInterfaceInfo* info, const(char)* name, const(char)* objectPath, const(char)* interfaceName, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_proxy_newFn c_g_dbus_proxy_new; ///
private alias c_g_dbus_proxy_new_for_busFn = extern(C) void function(GBusType busType, GDBusProxyFlags flags, GDBusInterfaceInfo* info, const(char)* name, const(char)* objectPath, const(char)* interfaceName, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_proxy_new_for_busFn c_g_dbus_proxy_new_for_bus; ///
private alias c_g_dbus_proxy_callFn = extern(C) void function(GDBusProxy* proxy, const(char)* methodName, GVariant* parameters, GDBusCallFlags flags, int timeoutMsec, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_proxy_callFn c_g_dbus_proxy_call; ///
private alias c_g_dbus_proxy_call_finishFn = extern(C) GVariant* function(GDBusProxy* proxy, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_proxy_call_finishFn c_g_dbus_proxy_call_finish; ///
private alias c_g_dbus_proxy_call_syncFn = extern(C) GVariant* function(GDBusProxy* proxy, const(char)* methodName, GVariant* parameters, GDBusCallFlags flags, int timeoutMsec, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_proxy_call_syncFn c_g_dbus_proxy_call_sync; ///
private alias c_g_dbus_proxy_call_with_unix_fd_listFn = extern(C) void function(GDBusProxy* proxy, const(char)* methodName, GVariant* parameters, GDBusCallFlags flags, int timeoutMsec, GUnixFDList* fdList, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_proxy_call_with_unix_fd_listFn c_g_dbus_proxy_call_with_unix_fd_list; ///
private alias c_g_dbus_proxy_call_with_unix_fd_list_finishFn = extern(C) GVariant* function(GDBusProxy* proxy, GUnixFDList** outFdList, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_dbus_proxy_call_with_unix_fd_list_finishFn c_g_dbus_proxy_call_with_unix_fd_list_finish; ///
private alias c_g_dbus_proxy_call_with_unix_fd_list_syncFn = extern(C) GVariant* function(GDBusProxy* proxy, const(char)* methodName, GVariant* parameters, GDBusCallFlags flags, int timeoutMsec, GUnixFDList* fdList, GUnixFDList** outFdList, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_proxy_call_with_unix_fd_list_syncFn c_g_dbus_proxy_call_with_unix_fd_list_sync; ///
private alias c_g_dbus_proxy_get_cached_propertyFn = extern(C) GVariant* function(GDBusProxy* proxy, const(char)* propertyName) nothrow;
__gshared c_g_dbus_proxy_get_cached_propertyFn c_g_dbus_proxy_get_cached_property; ///
private alias c_g_dbus_proxy_get_cached_property_namesFn = extern(C) char** function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_cached_property_namesFn c_g_dbus_proxy_get_cached_property_names; ///
private alias c_g_dbus_proxy_get_connectionFn = extern(C) GDBusConnection* function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_connectionFn c_g_dbus_proxy_get_connection; ///
private alias c_g_dbus_proxy_get_default_timeoutFn = extern(C) int function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_default_timeoutFn c_g_dbus_proxy_get_default_timeout; ///
private alias c_g_dbus_proxy_get_flagsFn = extern(C) GDBusProxyFlags function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_flagsFn c_g_dbus_proxy_get_flags; ///
private alias c_g_dbus_proxy_get_interface_infoFn = extern(C) GDBusInterfaceInfo* function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_interface_infoFn c_g_dbus_proxy_get_interface_info; ///
private alias c_g_dbus_proxy_get_interface_nameFn = extern(C) const(char)* function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_interface_nameFn c_g_dbus_proxy_get_interface_name; ///
private alias c_g_dbus_proxy_get_nameFn = extern(C) const(char)* function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_nameFn c_g_dbus_proxy_get_name; ///
private alias c_g_dbus_proxy_get_name_ownerFn = extern(C) char* function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_name_ownerFn c_g_dbus_proxy_get_name_owner; ///
private alias c_g_dbus_proxy_get_object_pathFn = extern(C) const(char)* function(GDBusProxy* proxy) nothrow;
__gshared c_g_dbus_proxy_get_object_pathFn c_g_dbus_proxy_get_object_path; ///
private alias c_g_dbus_proxy_set_cached_propertyFn = extern(C) void function(GDBusProxy* proxy, const(char)* propertyName, GVariant* value) nothrow;
__gshared c_g_dbus_proxy_set_cached_propertyFn c_g_dbus_proxy_set_cached_property; ///
private alias c_g_dbus_proxy_set_default_timeoutFn = extern(C) void function(GDBusProxy* proxy, int timeoutMsec) nothrow;
__gshared c_g_dbus_proxy_set_default_timeoutFn c_g_dbus_proxy_set_default_timeout; ///
private alias c_g_dbus_proxy_set_interface_infoFn = extern(C) void function(GDBusProxy* proxy, GDBusInterfaceInfo* info) nothrow;
__gshared c_g_dbus_proxy_set_interface_infoFn c_g_dbus_proxy_set_interface_info; ///

// DBusServer
private alias c_g_dbus_server_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_server_get_typeFn c_g_dbus_server_get_type; ///
private alias c_g_dbus_server_new_syncFn = extern(C) GDBusServer* function(const(char)* address, GDBusServerFlags flags, const(char)* guid, GDBusAuthObserver* observer, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_server_new_syncFn c_g_dbus_server_new_sync; ///
private alias c_g_dbus_server_get_client_addressFn = extern(C) const(char)* function(GDBusServer* server) nothrow;
__gshared c_g_dbus_server_get_client_addressFn c_g_dbus_server_get_client_address; ///
private alias c_g_dbus_server_get_flagsFn = extern(C) GDBusServerFlags function(GDBusServer* server) nothrow;
__gshared c_g_dbus_server_get_flagsFn c_g_dbus_server_get_flags; ///
private alias c_g_dbus_server_get_guidFn = extern(C) const(char)* function(GDBusServer* server) nothrow;
__gshared c_g_dbus_server_get_guidFn c_g_dbus_server_get_guid; ///
private alias c_g_dbus_server_is_activeFn = extern(C) gboolean function(GDBusServer* server) nothrow;
__gshared c_g_dbus_server_is_activeFn c_g_dbus_server_is_active; ///
private alias c_g_dbus_server_startFn = extern(C) void function(GDBusServer* server) nothrow;
__gshared c_g_dbus_server_startFn c_g_dbus_server_start; ///
private alias c_g_dbus_server_stopFn = extern(C) void function(GDBusServer* server) nothrow;
__gshared c_g_dbus_server_stopFn c_g_dbus_server_stop; ///

// DBusSignalInfo
private alias c_g_dbus_signal_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dbus_signal_info_get_typeFn c_g_dbus_signal_info_get_type; ///
private alias c_g_dbus_signal_info_refFn = extern(C) GDBusSignalInfo* function(GDBusSignalInfo* info) nothrow;
__gshared c_g_dbus_signal_info_refFn c_g_dbus_signal_info_ref; ///
private alias c_g_dbus_signal_info_unrefFn = extern(C) void function(GDBusSignalInfo* info) nothrow;
__gshared c_g_dbus_signal_info_unrefFn c_g_dbus_signal_info_unref; ///

// DataInputStream
private alias c_g_data_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_data_input_stream_get_typeFn c_g_data_input_stream_get_type; ///
private alias c_g_data_input_stream_newFn = extern(C) GDataInputStream* function(GInputStream* baseStream) nothrow;
__gshared c_g_data_input_stream_newFn c_g_data_input_stream_new; ///
private alias c_g_data_input_stream_get_byte_orderFn = extern(C) GDataStreamByteOrder function(GDataInputStream* stream) nothrow;
__gshared c_g_data_input_stream_get_byte_orderFn c_g_data_input_stream_get_byte_order; ///
private alias c_g_data_input_stream_get_newline_typeFn = extern(C) GDataStreamNewlineType function(GDataInputStream* stream) nothrow;
__gshared c_g_data_input_stream_get_newline_typeFn c_g_data_input_stream_get_newline_type; ///
private alias c_g_data_input_stream_read_byteFn = extern(C) ubyte function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_byteFn c_g_data_input_stream_read_byte; ///
private alias c_g_data_input_stream_read_int16Fn = extern(C) short function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_int16Fn c_g_data_input_stream_read_int16; ///
private alias c_g_data_input_stream_read_int32Fn = extern(C) int function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_int32Fn c_g_data_input_stream_read_int32; ///
private alias c_g_data_input_stream_read_int64Fn = extern(C) long function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_int64Fn c_g_data_input_stream_read_int64; ///
private alias c_g_data_input_stream_read_lineFn = extern(C) char* function(GDataInputStream* stream, size_t* length, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_lineFn c_g_data_input_stream_read_line; ///
private alias c_g_data_input_stream_read_line_asyncFn = extern(C) void function(GDataInputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_data_input_stream_read_line_asyncFn c_g_data_input_stream_read_line_async; ///
private alias c_g_data_input_stream_read_line_finishFn = extern(C) char* function(GDataInputStream* stream, GAsyncResult* result, size_t* length, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_line_finishFn c_g_data_input_stream_read_line_finish; ///
private alias c_g_data_input_stream_read_line_finish_utf8Fn = extern(C) char* function(GDataInputStream* stream, GAsyncResult* result, size_t* length, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_line_finish_utf8Fn c_g_data_input_stream_read_line_finish_utf8; ///
private alias c_g_data_input_stream_read_line_utf8Fn = extern(C) char* function(GDataInputStream* stream, size_t* length, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_line_utf8Fn c_g_data_input_stream_read_line_utf8; ///
private alias c_g_data_input_stream_read_uint16Fn = extern(C) ushort function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_uint16Fn c_g_data_input_stream_read_uint16; ///
private alias c_g_data_input_stream_read_uint32Fn = extern(C) uint function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_uint32Fn c_g_data_input_stream_read_uint32; ///
private alias c_g_data_input_stream_read_uint64Fn = extern(C) ulong function(GDataInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_uint64Fn c_g_data_input_stream_read_uint64; ///
private alias c_g_data_input_stream_read_untilFn = extern(C) char* function(GDataInputStream* stream, const(char)* stopChars, size_t* length, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_untilFn c_g_data_input_stream_read_until; ///
private alias c_g_data_input_stream_read_until_asyncFn = extern(C) void function(GDataInputStream* stream, const(char)* stopChars, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_data_input_stream_read_until_asyncFn c_g_data_input_stream_read_until_async; ///
private alias c_g_data_input_stream_read_until_finishFn = extern(C) char* function(GDataInputStream* stream, GAsyncResult* result, size_t* length, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_until_finishFn c_g_data_input_stream_read_until_finish; ///
private alias c_g_data_input_stream_read_uptoFn = extern(C) char* function(GDataInputStream* stream, const(char)* stopChars, ptrdiff_t stopCharsLen, size_t* length, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_uptoFn c_g_data_input_stream_read_upto; ///
private alias c_g_data_input_stream_read_upto_asyncFn = extern(C) void function(GDataInputStream* stream, const(char)* stopChars, ptrdiff_t stopCharsLen, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_data_input_stream_read_upto_asyncFn c_g_data_input_stream_read_upto_async; ///
private alias c_g_data_input_stream_read_upto_finishFn = extern(C) char* function(GDataInputStream* stream, GAsyncResult* result, size_t* length, GError** _err) nothrow;
__gshared c_g_data_input_stream_read_upto_finishFn c_g_data_input_stream_read_upto_finish; ///
private alias c_g_data_input_stream_set_byte_orderFn = extern(C) void function(GDataInputStream* stream, GDataStreamByteOrder order) nothrow;
__gshared c_g_data_input_stream_set_byte_orderFn c_g_data_input_stream_set_byte_order; ///
private alias c_g_data_input_stream_set_newline_typeFn = extern(C) void function(GDataInputStream* stream, GDataStreamNewlineType type) nothrow;
__gshared c_g_data_input_stream_set_newline_typeFn c_g_data_input_stream_set_newline_type; ///

// DataOutputStream
private alias c_g_data_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_data_output_stream_get_typeFn c_g_data_output_stream_get_type; ///
private alias c_g_data_output_stream_newFn = extern(C) GDataOutputStream* function(GOutputStream* baseStream) nothrow;
__gshared c_g_data_output_stream_newFn c_g_data_output_stream_new; ///
private alias c_g_data_output_stream_get_byte_orderFn = extern(C) GDataStreamByteOrder function(GDataOutputStream* stream) nothrow;
__gshared c_g_data_output_stream_get_byte_orderFn c_g_data_output_stream_get_byte_order; ///
private alias c_g_data_output_stream_put_byteFn = extern(C) gboolean function(GDataOutputStream* stream, ubyte data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_byteFn c_g_data_output_stream_put_byte; ///
private alias c_g_data_output_stream_put_int16Fn = extern(C) gboolean function(GDataOutputStream* stream, short data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_int16Fn c_g_data_output_stream_put_int16; ///
private alias c_g_data_output_stream_put_int32Fn = extern(C) gboolean function(GDataOutputStream* stream, int data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_int32Fn c_g_data_output_stream_put_int32; ///
private alias c_g_data_output_stream_put_int64Fn = extern(C) gboolean function(GDataOutputStream* stream, long data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_int64Fn c_g_data_output_stream_put_int64; ///
private alias c_g_data_output_stream_put_stringFn = extern(C) gboolean function(GDataOutputStream* stream, const(char)* str, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_stringFn c_g_data_output_stream_put_string; ///
private alias c_g_data_output_stream_put_uint16Fn = extern(C) gboolean function(GDataOutputStream* stream, ushort data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_uint16Fn c_g_data_output_stream_put_uint16; ///
private alias c_g_data_output_stream_put_uint32Fn = extern(C) gboolean function(GDataOutputStream* stream, uint data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_uint32Fn c_g_data_output_stream_put_uint32; ///
private alias c_g_data_output_stream_put_uint64Fn = extern(C) gboolean function(GDataOutputStream* stream, ulong data, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_data_output_stream_put_uint64Fn c_g_data_output_stream_put_uint64; ///
private alias c_g_data_output_stream_set_byte_orderFn = extern(C) void function(GDataOutputStream* stream, GDataStreamByteOrder order) nothrow;
__gshared c_g_data_output_stream_set_byte_orderFn c_g_data_output_stream_set_byte_order; ///

// DatagramBased
private alias c_g_datagram_based_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_datagram_based_get_typeFn c_g_datagram_based_get_type; ///
private alias c_g_datagram_based_condition_checkFn = extern(C) GIOCondition function(GDatagramBased* datagramBased, GIOCondition condition) nothrow;
__gshared c_g_datagram_based_condition_checkFn c_g_datagram_based_condition_check; ///
private alias c_g_datagram_based_condition_waitFn = extern(C) gboolean function(GDatagramBased* datagramBased, GIOCondition condition, long timeout, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_datagram_based_condition_waitFn c_g_datagram_based_condition_wait; ///
private alias c_g_datagram_based_create_sourceFn = extern(C) GSource* function(GDatagramBased* datagramBased, GIOCondition condition, GCancellable* cancellable) nothrow;
__gshared c_g_datagram_based_create_sourceFn c_g_datagram_based_create_source; ///
private alias c_g_datagram_based_receive_messagesFn = extern(C) int function(GDatagramBased* datagramBased, GInputMessage* messages, uint numMessages, int flags, long timeout, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_datagram_based_receive_messagesFn c_g_datagram_based_receive_messages; ///
private alias c_g_datagram_based_send_messagesFn = extern(C) int function(GDatagramBased* datagramBased, GOutputMessage* messages, uint numMessages, int flags, long timeout, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_datagram_based_send_messagesFn c_g_datagram_based_send_messages; ///

// DebugController
private alias c_g_debug_controller_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_debug_controller_get_typeFn c_g_debug_controller_get_type; ///
private alias c_g_debug_controller_get_debug_enabledFn = extern(C) gboolean function(GDebugController* self) nothrow;
__gshared c_g_debug_controller_get_debug_enabledFn c_g_debug_controller_get_debug_enabled; ///
private alias c_g_debug_controller_set_debug_enabledFn = extern(C) void function(GDebugController* self, gboolean debugEnabled) nothrow;
__gshared c_g_debug_controller_set_debug_enabledFn c_g_debug_controller_set_debug_enabled; ///

// DebugControllerDBus
private alias c_g_debug_controller_dbus_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_debug_controller_dbus_get_typeFn c_g_debug_controller_dbus_get_type; ///
private alias c_g_debug_controller_dbus_newFn = extern(C) GDebugControllerDBus* function(GDBusConnection* connection, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_debug_controller_dbus_newFn c_g_debug_controller_dbus_new; ///
private alias c_g_debug_controller_dbus_stopFn = extern(C) void function(GDebugControllerDBus* self) nothrow;
__gshared c_g_debug_controller_dbus_stopFn c_g_debug_controller_dbus_stop; ///

// Drive
private alias c_g_drive_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_drive_get_typeFn c_g_drive_get_type; ///
private alias c_g_drive_can_ejectFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_can_ejectFn c_g_drive_can_eject; ///
private alias c_g_drive_can_poll_for_mediaFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_can_poll_for_mediaFn c_g_drive_can_poll_for_media; ///
private alias c_g_drive_can_startFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_can_startFn c_g_drive_can_start; ///
private alias c_g_drive_can_start_degradedFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_can_start_degradedFn c_g_drive_can_start_degraded; ///
private alias c_g_drive_can_stopFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_can_stopFn c_g_drive_can_stop; ///
private alias c_g_drive_ejectFn = extern(C) void function(GDrive* drive, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_drive_ejectFn c_g_drive_eject; ///
private alias c_g_drive_eject_finishFn = extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_drive_eject_finishFn c_g_drive_eject_finish; ///
private alias c_g_drive_eject_with_operationFn = extern(C) void function(GDrive* drive, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_drive_eject_with_operationFn c_g_drive_eject_with_operation; ///
private alias c_g_drive_eject_with_operation_finishFn = extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_drive_eject_with_operation_finishFn c_g_drive_eject_with_operation_finish; ///
private alias c_g_drive_enumerate_identifiersFn = extern(C) char** function(GDrive* drive) nothrow;
__gshared c_g_drive_enumerate_identifiersFn c_g_drive_enumerate_identifiers; ///
private alias c_g_drive_get_iconFn = extern(C) GIcon* function(GDrive* drive) nothrow;
__gshared c_g_drive_get_iconFn c_g_drive_get_icon; ///
private alias c_g_drive_get_identifierFn = extern(C) char* function(GDrive* drive, const(char)* kind) nothrow;
__gshared c_g_drive_get_identifierFn c_g_drive_get_identifier; ///
private alias c_g_drive_get_nameFn = extern(C) char* function(GDrive* drive) nothrow;
__gshared c_g_drive_get_nameFn c_g_drive_get_name; ///
private alias c_g_drive_get_sort_keyFn = extern(C) const(char)* function(GDrive* drive) nothrow;
__gshared c_g_drive_get_sort_keyFn c_g_drive_get_sort_key; ///
private alias c_g_drive_get_start_stop_typeFn = extern(C) GDriveStartStopType function(GDrive* drive) nothrow;
__gshared c_g_drive_get_start_stop_typeFn c_g_drive_get_start_stop_type; ///
private alias c_g_drive_get_symbolic_iconFn = extern(C) GIcon* function(GDrive* drive) nothrow;
__gshared c_g_drive_get_symbolic_iconFn c_g_drive_get_symbolic_icon; ///
private alias c_g_drive_get_volumesFn = extern(C) GList* function(GDrive* drive) nothrow;
__gshared c_g_drive_get_volumesFn c_g_drive_get_volumes; ///
private alias c_g_drive_has_mediaFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_has_mediaFn c_g_drive_has_media; ///
private alias c_g_drive_has_volumesFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_has_volumesFn c_g_drive_has_volumes; ///
private alias c_g_drive_is_media_check_automaticFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_is_media_check_automaticFn c_g_drive_is_media_check_automatic; ///
private alias c_g_drive_is_media_removableFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_is_media_removableFn c_g_drive_is_media_removable; ///
private alias c_g_drive_is_removableFn = extern(C) gboolean function(GDrive* drive) nothrow;
__gshared c_g_drive_is_removableFn c_g_drive_is_removable; ///
private alias c_g_drive_poll_for_mediaFn = extern(C) void function(GDrive* drive, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_drive_poll_for_mediaFn c_g_drive_poll_for_media; ///
private alias c_g_drive_poll_for_media_finishFn = extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_drive_poll_for_media_finishFn c_g_drive_poll_for_media_finish; ///
private alias c_g_drive_startFn = extern(C) void function(GDrive* drive, GDriveStartFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_drive_startFn c_g_drive_start; ///
private alias c_g_drive_start_finishFn = extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_drive_start_finishFn c_g_drive_start_finish; ///
private alias c_g_drive_stopFn = extern(C) void function(GDrive* drive, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_drive_stopFn c_g_drive_stop; ///
private alias c_g_drive_stop_finishFn = extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_drive_stop_finishFn c_g_drive_stop_finish; ///

// DtlsClientConnection
private alias c_g_dtls_client_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dtls_client_connection_get_typeFn c_g_dtls_client_connection_get_type; ///
private alias c_g_dtls_client_connection_newFn = extern(C) GDatagramBased* function(GDatagramBased* baseSocket, GSocketConnectable* serverIdentity, GError** _err) nothrow;
__gshared c_g_dtls_client_connection_newFn c_g_dtls_client_connection_new; ///
private alias c_g_dtls_client_connection_get_accepted_casFn = extern(C) GList* function(GDtlsClientConnection* conn) nothrow;
__gshared c_g_dtls_client_connection_get_accepted_casFn c_g_dtls_client_connection_get_accepted_cas; ///
private alias c_g_dtls_client_connection_get_server_identityFn = extern(C) GSocketConnectable* function(GDtlsClientConnection* conn) nothrow;
__gshared c_g_dtls_client_connection_get_server_identityFn c_g_dtls_client_connection_get_server_identity; ///
private alias c_g_dtls_client_connection_get_validation_flagsFn = extern(C) GTlsCertificateFlags function(GDtlsClientConnection* conn) nothrow;
__gshared c_g_dtls_client_connection_get_validation_flagsFn c_g_dtls_client_connection_get_validation_flags; ///
private alias c_g_dtls_client_connection_set_server_identityFn = extern(C) void function(GDtlsClientConnection* conn, GSocketConnectable* identity) nothrow;
__gshared c_g_dtls_client_connection_set_server_identityFn c_g_dtls_client_connection_set_server_identity; ///
private alias c_g_dtls_client_connection_set_validation_flagsFn = extern(C) void function(GDtlsClientConnection* conn, GTlsCertificateFlags flags) nothrow;
__gshared c_g_dtls_client_connection_set_validation_flagsFn c_g_dtls_client_connection_set_validation_flags; ///

// DtlsConnection
private alias c_g_dtls_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dtls_connection_get_typeFn c_g_dtls_connection_get_type; ///
private alias c_g_dtls_connection_closeFn = extern(C) gboolean function(GDtlsConnection* conn, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dtls_connection_closeFn c_g_dtls_connection_close; ///
private alias c_g_dtls_connection_close_asyncFn = extern(C) void function(GDtlsConnection* conn, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dtls_connection_close_asyncFn c_g_dtls_connection_close_async; ///
private alias c_g_dtls_connection_close_finishFn = extern(C) gboolean function(GDtlsConnection* conn, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_dtls_connection_close_finishFn c_g_dtls_connection_close_finish; ///
private alias c_g_dtls_connection_emit_accept_certificateFn = extern(C) gboolean function(GDtlsConnection* conn, GTlsCertificate* peerCert, GTlsCertificateFlags errors) nothrow;
__gshared c_g_dtls_connection_emit_accept_certificateFn c_g_dtls_connection_emit_accept_certificate; ///
private alias c_g_dtls_connection_get_certificateFn = extern(C) GTlsCertificate* function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_certificateFn c_g_dtls_connection_get_certificate; ///
private alias c_g_dtls_connection_get_channel_binding_dataFn = extern(C) gboolean function(GDtlsConnection* conn, GTlsChannelBindingType type, GByteArray* data, GError** _err) nothrow;
__gshared c_g_dtls_connection_get_channel_binding_dataFn c_g_dtls_connection_get_channel_binding_data; ///
private alias c_g_dtls_connection_get_ciphersuite_nameFn = extern(C) char* function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_ciphersuite_nameFn c_g_dtls_connection_get_ciphersuite_name; ///
private alias c_g_dtls_connection_get_databaseFn = extern(C) GTlsDatabase* function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_databaseFn c_g_dtls_connection_get_database; ///
private alias c_g_dtls_connection_get_interactionFn = extern(C) GTlsInteraction* function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_interactionFn c_g_dtls_connection_get_interaction; ///
private alias c_g_dtls_connection_get_negotiated_protocolFn = extern(C) const(char)* function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_negotiated_protocolFn c_g_dtls_connection_get_negotiated_protocol; ///
private alias c_g_dtls_connection_get_peer_certificateFn = extern(C) GTlsCertificate* function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_peer_certificateFn c_g_dtls_connection_get_peer_certificate; ///
private alias c_g_dtls_connection_get_peer_certificate_errorsFn = extern(C) GTlsCertificateFlags function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_peer_certificate_errorsFn c_g_dtls_connection_get_peer_certificate_errors; ///
private alias c_g_dtls_connection_get_protocol_versionFn = extern(C) GTlsProtocolVersion function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_protocol_versionFn c_g_dtls_connection_get_protocol_version; ///
private alias c_g_dtls_connection_get_rehandshake_modeFn = extern(C) GTlsRehandshakeMode function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_rehandshake_modeFn c_g_dtls_connection_get_rehandshake_mode; ///
private alias c_g_dtls_connection_get_require_close_notifyFn = extern(C) gboolean function(GDtlsConnection* conn) nothrow;
__gshared c_g_dtls_connection_get_require_close_notifyFn c_g_dtls_connection_get_require_close_notify; ///
private alias c_g_dtls_connection_handshakeFn = extern(C) gboolean function(GDtlsConnection* conn, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dtls_connection_handshakeFn c_g_dtls_connection_handshake; ///
private alias c_g_dtls_connection_handshake_asyncFn = extern(C) void function(GDtlsConnection* conn, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dtls_connection_handshake_asyncFn c_g_dtls_connection_handshake_async; ///
private alias c_g_dtls_connection_handshake_finishFn = extern(C) gboolean function(GDtlsConnection* conn, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_dtls_connection_handshake_finishFn c_g_dtls_connection_handshake_finish; ///
private alias c_g_dtls_connection_set_advertised_protocolsFn = extern(C) void function(GDtlsConnection* conn, const(char*)* protocols) nothrow;
__gshared c_g_dtls_connection_set_advertised_protocolsFn c_g_dtls_connection_set_advertised_protocols; ///
private alias c_g_dtls_connection_set_certificateFn = extern(C) void function(GDtlsConnection* conn, GTlsCertificate* certificate) nothrow;
__gshared c_g_dtls_connection_set_certificateFn c_g_dtls_connection_set_certificate; ///
private alias c_g_dtls_connection_set_databaseFn = extern(C) void function(GDtlsConnection* conn, GTlsDatabase* database) nothrow;
__gshared c_g_dtls_connection_set_databaseFn c_g_dtls_connection_set_database; ///
private alias c_g_dtls_connection_set_interactionFn = extern(C) void function(GDtlsConnection* conn, GTlsInteraction* interaction) nothrow;
__gshared c_g_dtls_connection_set_interactionFn c_g_dtls_connection_set_interaction; ///
private alias c_g_dtls_connection_set_rehandshake_modeFn = extern(C) void function(GDtlsConnection* conn, GTlsRehandshakeMode mode) nothrow;
__gshared c_g_dtls_connection_set_rehandshake_modeFn c_g_dtls_connection_set_rehandshake_mode; ///
private alias c_g_dtls_connection_set_require_close_notifyFn = extern(C) void function(GDtlsConnection* conn, gboolean requireCloseNotify) nothrow;
__gshared c_g_dtls_connection_set_require_close_notifyFn c_g_dtls_connection_set_require_close_notify; ///
private alias c_g_dtls_connection_shutdownFn = extern(C) gboolean function(GDtlsConnection* conn, gboolean shutdownRead, gboolean shutdownWrite, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dtls_connection_shutdownFn c_g_dtls_connection_shutdown; ///
private alias c_g_dtls_connection_shutdown_asyncFn = extern(C) void function(GDtlsConnection* conn, gboolean shutdownRead, gboolean shutdownWrite, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dtls_connection_shutdown_asyncFn c_g_dtls_connection_shutdown_async; ///
private alias c_g_dtls_connection_shutdown_finishFn = extern(C) gboolean function(GDtlsConnection* conn, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_dtls_connection_shutdown_finishFn c_g_dtls_connection_shutdown_finish; ///

// DtlsServerConnection
private alias c_g_dtls_server_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dtls_server_connection_get_typeFn c_g_dtls_server_connection_get_type; ///
private alias c_g_dtls_server_connection_newFn = extern(C) GDatagramBased* function(GDatagramBased* baseSocket, GTlsCertificate* certificate, GError** _err) nothrow;
__gshared c_g_dtls_server_connection_newFn c_g_dtls_server_connection_new; ///

// Emblem
private alias c_g_emblem_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_emblem_get_typeFn c_g_emblem_get_type; ///
private alias c_g_emblem_newFn = extern(C) GEmblem* function(GIcon* icon) nothrow;
__gshared c_g_emblem_newFn c_g_emblem_new; ///
private alias c_g_emblem_new_with_originFn = extern(C) GEmblem* function(GIcon* icon, GEmblemOrigin origin) nothrow;
__gshared c_g_emblem_new_with_originFn c_g_emblem_new_with_origin; ///
private alias c_g_emblem_get_iconFn = extern(C) GIcon* function(GEmblem* emblem) nothrow;
__gshared c_g_emblem_get_iconFn c_g_emblem_get_icon; ///
private alias c_g_emblem_get_originFn = extern(C) GEmblemOrigin function(GEmblem* emblem) nothrow;
__gshared c_g_emblem_get_originFn c_g_emblem_get_origin; ///

// EmblemedIcon
private alias c_g_emblemed_icon_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_emblemed_icon_get_typeFn c_g_emblemed_icon_get_type; ///
private alias c_g_emblemed_icon_newFn = extern(C) GIcon* function(GIcon* icon, GEmblem* emblem) nothrow;
__gshared c_g_emblemed_icon_newFn c_g_emblemed_icon_new; ///
private alias c_g_emblemed_icon_add_emblemFn = extern(C) void function(GEmblemedIcon* emblemed, GEmblem* emblem) nothrow;
__gshared c_g_emblemed_icon_add_emblemFn c_g_emblemed_icon_add_emblem; ///
private alias c_g_emblemed_icon_clear_emblemsFn = extern(C) void function(GEmblemedIcon* emblemed) nothrow;
__gshared c_g_emblemed_icon_clear_emblemsFn c_g_emblemed_icon_clear_emblems; ///
private alias c_g_emblemed_icon_get_emblemsFn = extern(C) GList* function(GEmblemedIcon* emblemed) nothrow;
__gshared c_g_emblemed_icon_get_emblemsFn c_g_emblemed_icon_get_emblems; ///
private alias c_g_emblemed_icon_get_iconFn = extern(C) GIcon* function(GEmblemedIcon* emblemed) nothrow;
__gshared c_g_emblemed_icon_get_iconFn c_g_emblemed_icon_get_icon; ///

// File
private alias c_g_file_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_get_typeFn c_g_file_get_type; ///
private alias c_g_file_new_build_filenameFn = extern(C) GFile* function(const(char)* firstElement,  ...) nothrow;
__gshared c_g_file_new_build_filenameFn c_g_file_new_build_filename; ///
private alias c_g_file_new_build_filenamevFn = extern(C) GFile* function(const(char*)* args) nothrow;
__gshared c_g_file_new_build_filenamevFn c_g_file_new_build_filenamev; ///
private alias c_g_file_new_for_commandline_argFn = extern(C) GFile* function(const(char)* arg) nothrow;
__gshared c_g_file_new_for_commandline_argFn c_g_file_new_for_commandline_arg; ///
private alias c_g_file_new_for_commandline_arg_and_cwdFn = extern(C) GFile* function(const(char)* arg, const(char)* cwd) nothrow;
__gshared c_g_file_new_for_commandline_arg_and_cwdFn c_g_file_new_for_commandline_arg_and_cwd; ///
private alias c_g_file_new_for_pathFn = extern(C) GFile* function(const(char)* path) nothrow;
__gshared c_g_file_new_for_pathFn c_g_file_new_for_path; ///
private alias c_g_file_new_for_uriFn = extern(C) GFile* function(const(char)* uri) nothrow;
__gshared c_g_file_new_for_uriFn c_g_file_new_for_uri; ///
private alias c_g_file_new_tmpFn = extern(C) GFile* function(const(char)* tmpl, GFileIOStream** iostream, GError** _err) nothrow;
__gshared c_g_file_new_tmpFn c_g_file_new_tmp; ///
private alias c_g_file_new_tmp_asyncFn = extern(C) void function(const(char)* tmpl, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_new_tmp_asyncFn c_g_file_new_tmp_async; ///
private alias c_g_file_new_tmp_dir_asyncFn = extern(C) void function(const(char)* tmpl, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_new_tmp_dir_asyncFn c_g_file_new_tmp_dir_async; ///
private alias c_g_file_new_tmp_dir_finishFn = extern(C) GFile* function(GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_new_tmp_dir_finishFn c_g_file_new_tmp_dir_finish; ///
private alias c_g_file_new_tmp_finishFn = extern(C) GFile* function(GAsyncResult* result, GFileIOStream** iostream, GError** _err) nothrow;
__gshared c_g_file_new_tmp_finishFn c_g_file_new_tmp_finish; ///
private alias c_g_file_parse_nameFn = extern(C) GFile* function(const(char)* parseName) nothrow;
__gshared c_g_file_parse_nameFn c_g_file_parse_name; ///
private alias c_g_file_append_toFn = extern(C) GFileOutputStream* function(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_append_toFn c_g_file_append_to; ///
private alias c_g_file_append_to_asyncFn = extern(C) void function(GFile* file, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_append_to_asyncFn c_g_file_append_to_async; ///
private alias c_g_file_append_to_finishFn = extern(C) GFileOutputStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_append_to_finishFn c_g_file_append_to_finish; ///
private alias c_g_file_build_attribute_list_for_copyFn = extern(C) char* function(GFile* file, GFileCopyFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_build_attribute_list_for_copyFn c_g_file_build_attribute_list_for_copy; ///
private alias c_g_file_copyFn = extern(C) gboolean function(GFile* source, GFile* destination, GFileCopyFlags flags, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GError** _err) nothrow;
__gshared c_g_file_copyFn c_g_file_copy; ///
private alias c_g_file_copy_asyncFn = extern(C) void function(GFile* source, GFile* destination, GFileCopyFlags flags, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_copy_asyncFn c_g_file_copy_async; ///
private alias c_g_file_copy_async_with_closuresFn = extern(C) void function(GFile* source, GFile* destination, GFileCopyFlags flags, int ioPriority, GCancellable* cancellable, GClosure* progressCallbackClosure, GClosure* readyCallbackClosure) nothrow;
__gshared c_g_file_copy_async_with_closuresFn c_g_file_copy_async_with_closures; ///
private alias c_g_file_copy_attributesFn = extern(C) gboolean function(GFile* source, GFile* destination, GFileCopyFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_copy_attributesFn c_g_file_copy_attributes; ///
private alias c_g_file_copy_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_copy_finishFn c_g_file_copy_finish; ///
private alias c_g_file_createFn = extern(C) GFileOutputStream* function(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_createFn c_g_file_create; ///
private alias c_g_file_create_asyncFn = extern(C) void function(GFile* file, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_create_asyncFn c_g_file_create_async; ///
private alias c_g_file_create_finishFn = extern(C) GFileOutputStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_create_finishFn c_g_file_create_finish; ///
private alias c_g_file_create_readwriteFn = extern(C) GFileIOStream* function(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_create_readwriteFn c_g_file_create_readwrite; ///
private alias c_g_file_create_readwrite_asyncFn = extern(C) void function(GFile* file, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_create_readwrite_asyncFn c_g_file_create_readwrite_async; ///
private alias c_g_file_create_readwrite_finishFn = extern(C) GFileIOStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_create_readwrite_finishFn c_g_file_create_readwrite_finish; ///
private alias c_g_file_deleteFn = extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_deleteFn c_g_file_delete; ///
private alias c_g_file_delete_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_delete_asyncFn c_g_file_delete_async; ///
private alias c_g_file_delete_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_delete_finishFn c_g_file_delete_finish; ///
private alias c_g_file_dupFn = extern(C) GFile* function(GFile* file) nothrow;
__gshared c_g_file_dupFn c_g_file_dup; ///
private alias c_g_file_eject_mountableFn = extern(C) void function(GFile* file, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_eject_mountableFn c_g_file_eject_mountable; ///
private alias c_g_file_eject_mountable_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_eject_mountable_finishFn c_g_file_eject_mountable_finish; ///
private alias c_g_file_eject_mountable_with_operationFn = extern(C) void function(GFile* file, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_eject_mountable_with_operationFn c_g_file_eject_mountable_with_operation; ///
private alias c_g_file_eject_mountable_with_operation_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_eject_mountable_with_operation_finishFn c_g_file_eject_mountable_with_operation_finish; ///
private alias c_g_file_enumerate_childrenFn = extern(C) GFileEnumerator* function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_enumerate_childrenFn c_g_file_enumerate_children; ///
private alias c_g_file_enumerate_children_asyncFn = extern(C) void function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_enumerate_children_asyncFn c_g_file_enumerate_children_async; ///
private alias c_g_file_enumerate_children_finishFn = extern(C) GFileEnumerator* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_enumerate_children_finishFn c_g_file_enumerate_children_finish; ///
private alias c_g_file_equalFn = extern(C) gboolean function(GFile* file1, GFile* file2) nothrow;
__gshared c_g_file_equalFn c_g_file_equal; ///
private alias c_g_file_find_enclosing_mountFn = extern(C) GMount* function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_find_enclosing_mountFn c_g_file_find_enclosing_mount; ///
private alias c_g_file_find_enclosing_mount_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_find_enclosing_mount_asyncFn c_g_file_find_enclosing_mount_async; ///
private alias c_g_file_find_enclosing_mount_finishFn = extern(C) GMount* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_find_enclosing_mount_finishFn c_g_file_find_enclosing_mount_finish; ///
private alias c_g_file_get_basenameFn = extern(C) char* function(GFile* file) nothrow;
__gshared c_g_file_get_basenameFn c_g_file_get_basename; ///
private alias c_g_file_get_childFn = extern(C) GFile* function(GFile* file, const(char)* name) nothrow;
__gshared c_g_file_get_childFn c_g_file_get_child; ///
private alias c_g_file_get_child_for_display_nameFn = extern(C) GFile* function(GFile* file, const(char)* displayName, GError** _err) nothrow;
__gshared c_g_file_get_child_for_display_nameFn c_g_file_get_child_for_display_name; ///
private alias c_g_file_get_parentFn = extern(C) GFile* function(GFile* file) nothrow;
__gshared c_g_file_get_parentFn c_g_file_get_parent; ///
private alias c_g_file_get_parse_nameFn = extern(C) char* function(GFile* file) nothrow;
__gshared c_g_file_get_parse_nameFn c_g_file_get_parse_name; ///
private alias c_g_file_get_pathFn = extern(C) char* function(GFile* file) nothrow;
__gshared c_g_file_get_pathFn c_g_file_get_path; ///
private alias c_g_file_get_relative_pathFn = extern(C) char* function(GFile* parent, GFile* descendant) nothrow;
__gshared c_g_file_get_relative_pathFn c_g_file_get_relative_path; ///
private alias c_g_file_get_uriFn = extern(C) char* function(GFile* file) nothrow;
__gshared c_g_file_get_uriFn c_g_file_get_uri; ///
private alias c_g_file_get_uri_schemeFn = extern(C) char* function(GFile* file) nothrow;
__gshared c_g_file_get_uri_schemeFn c_g_file_get_uri_scheme; ///
private alias c_g_file_has_parentFn = extern(C) gboolean function(GFile* file, GFile* parent) nothrow;
__gshared c_g_file_has_parentFn c_g_file_has_parent; ///
private alias c_g_file_has_prefixFn = extern(C) gboolean function(GFile* file, GFile* prefix) nothrow;
__gshared c_g_file_has_prefixFn c_g_file_has_prefix; ///
private alias c_g_file_has_uri_schemeFn = extern(C) gboolean function(GFile* file, const(char)* uriScheme) nothrow;
__gshared c_g_file_has_uri_schemeFn c_g_file_has_uri_scheme; ///
private alias c_g_file_hashFn = extern(C) uint function(GFile* file) nothrow;
__gshared c_g_file_hashFn c_g_file_hash; ///
private alias c_g_file_is_nativeFn = extern(C) gboolean function(GFile* file) nothrow;
__gshared c_g_file_is_nativeFn c_g_file_is_native; ///
private alias c_g_file_load_bytesFn = extern(C) GBytes* function(GFile* file, GCancellable* cancellable, char** etagOut, GError** _err) nothrow;
__gshared c_g_file_load_bytesFn c_g_file_load_bytes; ///
private alias c_g_file_load_bytes_asyncFn = extern(C) void function(GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_load_bytes_asyncFn c_g_file_load_bytes_async; ///
private alias c_g_file_load_bytes_finishFn = extern(C) GBytes* function(GFile* file, GAsyncResult* result, char** etagOut, GError** _err) nothrow;
__gshared c_g_file_load_bytes_finishFn c_g_file_load_bytes_finish; ///
private alias c_g_file_load_contentsFn = extern(C) gboolean function(GFile* file, GCancellable* cancellable, ubyte** contents, size_t* length, char** etagOut, GError** _err) nothrow;
__gshared c_g_file_load_contentsFn c_g_file_load_contents; ///
private alias c_g_file_load_contents_asyncFn = extern(C) void function(GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_load_contents_asyncFn c_g_file_load_contents_async; ///
private alias c_g_file_load_contents_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* res, ubyte** contents, size_t* length, char** etagOut, GError** _err) nothrow;
__gshared c_g_file_load_contents_finishFn c_g_file_load_contents_finish; ///
private alias c_g_file_load_partial_contents_asyncFn = extern(C) void function(GFile* file, GCancellable* cancellable, GFileReadMoreCallback readMoreCallback, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_load_partial_contents_asyncFn c_g_file_load_partial_contents_async; ///
private alias c_g_file_load_partial_contents_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* res, ubyte** contents, size_t* length, char** etagOut, GError** _err) nothrow;
__gshared c_g_file_load_partial_contents_finishFn c_g_file_load_partial_contents_finish; ///
private alias c_g_file_make_directoryFn = extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_make_directoryFn c_g_file_make_directory; ///
private alias c_g_file_make_directory_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_make_directory_asyncFn c_g_file_make_directory_async; ///
private alias c_g_file_make_directory_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_make_directory_finishFn c_g_file_make_directory_finish; ///
private alias c_g_file_make_directory_with_parentsFn = extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_make_directory_with_parentsFn c_g_file_make_directory_with_parents; ///
private alias c_g_file_make_symbolic_linkFn = extern(C) gboolean function(GFile* file, const(char)* symlinkValue, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_make_symbolic_linkFn c_g_file_make_symbolic_link; ///
private alias c_g_file_make_symbolic_link_asyncFn = extern(C) void function(GFile* file, const(char)* symlinkValue, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_make_symbolic_link_asyncFn c_g_file_make_symbolic_link_async; ///
private alias c_g_file_make_symbolic_link_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_make_symbolic_link_finishFn c_g_file_make_symbolic_link_finish; ///
private alias c_g_file_measure_disk_usageFn = extern(C) gboolean function(GFile* file, GFileMeasureFlags flags, GCancellable* cancellable, GFileMeasureProgressCallback progressCallback, void* progressData, ulong* diskUsage, ulong* numDirs, ulong* numFiles, GError** _err) nothrow;
__gshared c_g_file_measure_disk_usageFn c_g_file_measure_disk_usage; ///
private alias c_g_file_measure_disk_usage_asyncFn = extern(C) void function(GFile* file, GFileMeasureFlags flags, int ioPriority, GCancellable* cancellable, GFileMeasureProgressCallback progressCallback, void* progressData, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_measure_disk_usage_asyncFn c_g_file_measure_disk_usage_async; ///
private alias c_g_file_measure_disk_usage_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, ulong* diskUsage, ulong* numDirs, ulong* numFiles, GError** _err) nothrow;
__gshared c_g_file_measure_disk_usage_finishFn c_g_file_measure_disk_usage_finish; ///
private alias c_g_file_monitorFn = extern(C) GFileMonitor* function(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_monitorFn c_g_file_monitor; ///
private alias c_g_file_monitor_directoryFn = extern(C) GFileMonitor* function(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_monitor_directoryFn c_g_file_monitor_directory; ///
private alias c_g_file_monitor_fileFn = extern(C) GFileMonitor* function(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_monitor_fileFn c_g_file_monitor_file; ///
private alias c_g_file_mount_enclosing_volumeFn = extern(C) void function(GFile* location, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_mount_enclosing_volumeFn c_g_file_mount_enclosing_volume; ///
private alias c_g_file_mount_enclosing_volume_finishFn = extern(C) gboolean function(GFile* location, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_mount_enclosing_volume_finishFn c_g_file_mount_enclosing_volume_finish; ///
private alias c_g_file_mount_mountableFn = extern(C) void function(GFile* file, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_mount_mountableFn c_g_file_mount_mountable; ///
private alias c_g_file_mount_mountable_finishFn = extern(C) GFile* function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_mount_mountable_finishFn c_g_file_mount_mountable_finish; ///
private alias c_g_file_moveFn = extern(C) gboolean function(GFile* source, GFile* destination, GFileCopyFlags flags, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GError** _err) nothrow;
__gshared c_g_file_moveFn c_g_file_move; ///
private alias c_g_file_move_asyncFn = extern(C) void function(GFile* source, GFile* destination, GFileCopyFlags flags, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_move_asyncFn c_g_file_move_async; ///
private alias c_g_file_move_async_with_closuresFn = extern(C) void function(GFile* source, GFile* destination, GFileCopyFlags flags, int ioPriority, GCancellable* cancellable, GClosure* progressCallbackClosure, GClosure* readyCallbackClosure) nothrow;
__gshared c_g_file_move_async_with_closuresFn c_g_file_move_async_with_closures; ///
private alias c_g_file_move_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_move_finishFn c_g_file_move_finish; ///
private alias c_g_file_open_readwriteFn = extern(C) GFileIOStream* function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_open_readwriteFn c_g_file_open_readwrite; ///
private alias c_g_file_open_readwrite_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_open_readwrite_asyncFn c_g_file_open_readwrite_async; ///
private alias c_g_file_open_readwrite_finishFn = extern(C) GFileIOStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_open_readwrite_finishFn c_g_file_open_readwrite_finish; ///
private alias c_g_file_peek_pathFn = extern(C) const(char)* function(GFile* file) nothrow;
__gshared c_g_file_peek_pathFn c_g_file_peek_path; ///
private alias c_g_file_poll_mountableFn = extern(C) void function(GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_poll_mountableFn c_g_file_poll_mountable; ///
private alias c_g_file_poll_mountable_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_poll_mountable_finishFn c_g_file_poll_mountable_finish; ///
private alias c_g_file_query_default_handlerFn = extern(C) GAppInfo* function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_query_default_handlerFn c_g_file_query_default_handler; ///
private alias c_g_file_query_default_handler_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_query_default_handler_asyncFn c_g_file_query_default_handler_async; ///
private alias c_g_file_query_default_handler_finishFn = extern(C) GAppInfo* function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_query_default_handler_finishFn c_g_file_query_default_handler_finish; ///
private alias c_g_file_query_existsFn = extern(C) gboolean function(GFile* file, GCancellable* cancellable) nothrow;
__gshared c_g_file_query_existsFn c_g_file_query_exists; ///
private alias c_g_file_query_file_typeFn = extern(C) GFileType function(GFile* file, GFileQueryInfoFlags flags, GCancellable* cancellable) nothrow;
__gshared c_g_file_query_file_typeFn c_g_file_query_file_type; ///
private alias c_g_file_query_filesystem_infoFn = extern(C) GFileInfo* function(GFile* file, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_query_filesystem_infoFn c_g_file_query_filesystem_info; ///
private alias c_g_file_query_filesystem_info_asyncFn = extern(C) void function(GFile* file, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_query_filesystem_info_asyncFn c_g_file_query_filesystem_info_async; ///
private alias c_g_file_query_filesystem_info_finishFn = extern(C) GFileInfo* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_query_filesystem_info_finishFn c_g_file_query_filesystem_info_finish; ///
private alias c_g_file_query_infoFn = extern(C) GFileInfo* function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_query_infoFn c_g_file_query_info; ///
private alias c_g_file_query_info_asyncFn = extern(C) void function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_query_info_asyncFn c_g_file_query_info_async; ///
private alias c_g_file_query_info_finishFn = extern(C) GFileInfo* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_query_info_finishFn c_g_file_query_info_finish; ///
private alias c_g_file_query_settable_attributesFn = extern(C) GFileAttributeInfoList* function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_query_settable_attributesFn c_g_file_query_settable_attributes; ///
private alias c_g_file_query_writable_namespacesFn = extern(C) GFileAttributeInfoList* function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_query_writable_namespacesFn c_g_file_query_writable_namespaces; ///
private alias c_g_file_readFn = extern(C) GFileInputStream* function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_readFn c_g_file_read; ///
private alias c_g_file_read_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_read_asyncFn c_g_file_read_async; ///
private alias c_g_file_read_finishFn = extern(C) GFileInputStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_read_finishFn c_g_file_read_finish; ///
private alias c_g_file_replaceFn = extern(C) GFileOutputStream* function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_replaceFn c_g_file_replace; ///
private alias c_g_file_replace_asyncFn = extern(C) void function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_replace_asyncFn c_g_file_replace_async; ///
private alias c_g_file_replace_contentsFn = extern(C) gboolean function(GFile* file, const(ubyte)* contents, size_t length, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, char** newEtag, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_replace_contentsFn c_g_file_replace_contents; ///
private alias c_g_file_replace_contents_asyncFn = extern(C) void function(GFile* file, const(ubyte)* contents, size_t length, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_replace_contents_asyncFn c_g_file_replace_contents_async; ///
private alias c_g_file_replace_contents_bytes_asyncFn = extern(C) void function(GFile* file, GBytes* contents, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_replace_contents_bytes_asyncFn c_g_file_replace_contents_bytes_async; ///
private alias c_g_file_replace_contents_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* res, char** newEtag, GError** _err) nothrow;
__gshared c_g_file_replace_contents_finishFn c_g_file_replace_contents_finish; ///
private alias c_g_file_replace_finishFn = extern(C) GFileOutputStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_replace_finishFn c_g_file_replace_finish; ///
private alias c_g_file_replace_readwriteFn = extern(C) GFileIOStream* function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_replace_readwriteFn c_g_file_replace_readwrite; ///
private alias c_g_file_replace_readwrite_asyncFn = extern(C) void function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_replace_readwrite_asyncFn c_g_file_replace_readwrite_async; ///
private alias c_g_file_replace_readwrite_finishFn = extern(C) GFileIOStream* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_replace_readwrite_finishFn c_g_file_replace_readwrite_finish; ///
private alias c_g_file_resolve_relative_pathFn = extern(C) GFile* function(GFile* file, const(char)* relativePath) nothrow;
__gshared c_g_file_resolve_relative_pathFn c_g_file_resolve_relative_path; ///
private alias c_g_file_set_attributeFn = extern(C) gboolean function(GFile* file, const(char)* attribute, GFileAttributeType type, void* valueP, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attributeFn c_g_file_set_attribute; ///
private alias c_g_file_set_attribute_byte_stringFn = extern(C) gboolean function(GFile* file, const(char)* attribute, const(char)* value, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attribute_byte_stringFn c_g_file_set_attribute_byte_string; ///
private alias c_g_file_set_attribute_int32Fn = extern(C) gboolean function(GFile* file, const(char)* attribute, int value, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attribute_int32Fn c_g_file_set_attribute_int32; ///
private alias c_g_file_set_attribute_int64Fn = extern(C) gboolean function(GFile* file, const(char)* attribute, long value, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attribute_int64Fn c_g_file_set_attribute_int64; ///
private alias c_g_file_set_attribute_stringFn = extern(C) gboolean function(GFile* file, const(char)* attribute, const(char)* value, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attribute_stringFn c_g_file_set_attribute_string; ///
private alias c_g_file_set_attribute_uint32Fn = extern(C) gboolean function(GFile* file, const(char)* attribute, uint value, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attribute_uint32Fn c_g_file_set_attribute_uint32; ///
private alias c_g_file_set_attribute_uint64Fn = extern(C) gboolean function(GFile* file, const(char)* attribute, ulong value, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attribute_uint64Fn c_g_file_set_attribute_uint64; ///
private alias c_g_file_set_attributes_asyncFn = extern(C) void function(GFile* file, GFileInfo* info, GFileQueryInfoFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_set_attributes_asyncFn c_g_file_set_attributes_async; ///
private alias c_g_file_set_attributes_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GFileInfo** info, GError** _err) nothrow;
__gshared c_g_file_set_attributes_finishFn c_g_file_set_attributes_finish; ///
private alias c_g_file_set_attributes_from_infoFn = extern(C) gboolean function(GFile* file, GFileInfo* info, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_attributes_from_infoFn c_g_file_set_attributes_from_info; ///
private alias c_g_file_set_display_nameFn = extern(C) GFile* function(GFile* file, const(char)* displayName, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_set_display_nameFn c_g_file_set_display_name; ///
private alias c_g_file_set_display_name_asyncFn = extern(C) void function(GFile* file, const(char)* displayName, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_set_display_name_asyncFn c_g_file_set_display_name_async; ///
private alias c_g_file_set_display_name_finishFn = extern(C) GFile* function(GFile* file, GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_file_set_display_name_finishFn c_g_file_set_display_name_finish; ///
private alias c_g_file_start_mountableFn = extern(C) void function(GFile* file, GDriveStartFlags flags, GMountOperation* startOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_start_mountableFn c_g_file_start_mountable; ///
private alias c_g_file_start_mountable_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_start_mountable_finishFn c_g_file_start_mountable_finish; ///
private alias c_g_file_stop_mountableFn = extern(C) void function(GFile* file, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_stop_mountableFn c_g_file_stop_mountable; ///
private alias c_g_file_stop_mountable_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_stop_mountable_finishFn c_g_file_stop_mountable_finish; ///
private alias c_g_file_supports_thread_contextsFn = extern(C) gboolean function(GFile* file) nothrow;
__gshared c_g_file_supports_thread_contextsFn c_g_file_supports_thread_contexts; ///
private alias c_g_file_trashFn = extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_trashFn c_g_file_trash; ///
private alias c_g_file_trash_asyncFn = extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_trash_asyncFn c_g_file_trash_async; ///
private alias c_g_file_trash_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_trash_finishFn c_g_file_trash_finish; ///
private alias c_g_file_unmount_mountableFn = extern(C) void function(GFile* file, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_unmount_mountableFn c_g_file_unmount_mountable; ///
private alias c_g_file_unmount_mountable_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_unmount_mountable_finishFn c_g_file_unmount_mountable_finish; ///
private alias c_g_file_unmount_mountable_with_operationFn = extern(C) void function(GFile* file, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_unmount_mountable_with_operationFn c_g_file_unmount_mountable_with_operation; ///
private alias c_g_file_unmount_mountable_with_operation_finishFn = extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_unmount_mountable_with_operation_finishFn c_g_file_unmount_mountable_with_operation_finish; ///

// FileAttributeInfoList
private alias c_g_file_attribute_info_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_attribute_info_list_get_typeFn c_g_file_attribute_info_list_get_type; ///
private alias c_g_file_attribute_info_list_newFn = extern(C) GFileAttributeInfoList* function() nothrow;
__gshared c_g_file_attribute_info_list_newFn c_g_file_attribute_info_list_new; ///
private alias c_g_file_attribute_info_list_addFn = extern(C) void function(GFileAttributeInfoList* list, const(char)* name, GFileAttributeType type, GFileAttributeInfoFlags flags) nothrow;
__gshared c_g_file_attribute_info_list_addFn c_g_file_attribute_info_list_add; ///
private alias c_g_file_attribute_info_list_dupFn = extern(C) GFileAttributeInfoList* function(GFileAttributeInfoList* list) nothrow;
__gshared c_g_file_attribute_info_list_dupFn c_g_file_attribute_info_list_dup; ///
private alias c_g_file_attribute_info_list_lookupFn = extern(C) const(GFileAttributeInfo)* function(GFileAttributeInfoList* list, const(char)* name) nothrow;
__gshared c_g_file_attribute_info_list_lookupFn c_g_file_attribute_info_list_lookup; ///
private alias c_g_file_attribute_info_list_refFn = extern(C) GFileAttributeInfoList* function(GFileAttributeInfoList* list) nothrow;
__gshared c_g_file_attribute_info_list_refFn c_g_file_attribute_info_list_ref; ///
private alias c_g_file_attribute_info_list_unrefFn = extern(C) void function(GFileAttributeInfoList* list) nothrow;
__gshared c_g_file_attribute_info_list_unrefFn c_g_file_attribute_info_list_unref; ///

// FileAttributeMatcher
private alias c_g_file_attribute_matcher_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_attribute_matcher_get_typeFn c_g_file_attribute_matcher_get_type; ///
private alias c_g_file_attribute_matcher_newFn = extern(C) GFileAttributeMatcher* function(const(char)* attributes) nothrow;
__gshared c_g_file_attribute_matcher_newFn c_g_file_attribute_matcher_new; ///
private alias c_g_file_attribute_matcher_enumerate_namespaceFn = extern(C) gboolean function(GFileAttributeMatcher* matcher, const(char)* ns) nothrow;
__gshared c_g_file_attribute_matcher_enumerate_namespaceFn c_g_file_attribute_matcher_enumerate_namespace; ///
private alias c_g_file_attribute_matcher_enumerate_nextFn = extern(C) const(char)* function(GFileAttributeMatcher* matcher) nothrow;
__gshared c_g_file_attribute_matcher_enumerate_nextFn c_g_file_attribute_matcher_enumerate_next; ///
private alias c_g_file_attribute_matcher_matchesFn = extern(C) gboolean function(GFileAttributeMatcher* matcher, const(char)* attribute) nothrow;
__gshared c_g_file_attribute_matcher_matchesFn c_g_file_attribute_matcher_matches; ///
private alias c_g_file_attribute_matcher_matches_onlyFn = extern(C) gboolean function(GFileAttributeMatcher* matcher, const(char)* attribute) nothrow;
__gshared c_g_file_attribute_matcher_matches_onlyFn c_g_file_attribute_matcher_matches_only; ///
private alias c_g_file_attribute_matcher_refFn = extern(C) GFileAttributeMatcher* function(GFileAttributeMatcher* matcher) nothrow;
__gshared c_g_file_attribute_matcher_refFn c_g_file_attribute_matcher_ref; ///
private alias c_g_file_attribute_matcher_subtractFn = extern(C) GFileAttributeMatcher* function(GFileAttributeMatcher* matcher, GFileAttributeMatcher* subtract) nothrow;
__gshared c_g_file_attribute_matcher_subtractFn c_g_file_attribute_matcher_subtract; ///
private alias c_g_file_attribute_matcher_to_stringFn = extern(C) char* function(GFileAttributeMatcher* matcher) nothrow;
__gshared c_g_file_attribute_matcher_to_stringFn c_g_file_attribute_matcher_to_string; ///
private alias c_g_file_attribute_matcher_unrefFn = extern(C) void function(GFileAttributeMatcher* matcher) nothrow;
__gshared c_g_file_attribute_matcher_unrefFn c_g_file_attribute_matcher_unref; ///

// FileEnumerator
private alias c_g_file_enumerator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_enumerator_get_typeFn c_g_file_enumerator_get_type; ///
private alias c_g_file_enumerator_closeFn = extern(C) gboolean function(GFileEnumerator* enumerator, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_enumerator_closeFn c_g_file_enumerator_close; ///
private alias c_g_file_enumerator_close_asyncFn = extern(C) void function(GFileEnumerator* enumerator, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_enumerator_close_asyncFn c_g_file_enumerator_close_async; ///
private alias c_g_file_enumerator_close_finishFn = extern(C) gboolean function(GFileEnumerator* enumerator, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_enumerator_close_finishFn c_g_file_enumerator_close_finish; ///
private alias c_g_file_enumerator_get_childFn = extern(C) GFile* function(GFileEnumerator* enumerator, GFileInfo* info) nothrow;
__gshared c_g_file_enumerator_get_childFn c_g_file_enumerator_get_child; ///
private alias c_g_file_enumerator_get_containerFn = extern(C) GFile* function(GFileEnumerator* enumerator) nothrow;
__gshared c_g_file_enumerator_get_containerFn c_g_file_enumerator_get_container; ///
private alias c_g_file_enumerator_has_pendingFn = extern(C) gboolean function(GFileEnumerator* enumerator) nothrow;
__gshared c_g_file_enumerator_has_pendingFn c_g_file_enumerator_has_pending; ///
private alias c_g_file_enumerator_is_closedFn = extern(C) gboolean function(GFileEnumerator* enumerator) nothrow;
__gshared c_g_file_enumerator_is_closedFn c_g_file_enumerator_is_closed; ///
private alias c_g_file_enumerator_iterateFn = extern(C) gboolean function(GFileEnumerator* direnum, GFileInfo** outInfo, GFile** outChild, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_enumerator_iterateFn c_g_file_enumerator_iterate; ///
private alias c_g_file_enumerator_next_fileFn = extern(C) GFileInfo* function(GFileEnumerator* enumerator, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_enumerator_next_fileFn c_g_file_enumerator_next_file; ///
private alias c_g_file_enumerator_next_files_asyncFn = extern(C) void function(GFileEnumerator* enumerator, int numFiles, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_enumerator_next_files_asyncFn c_g_file_enumerator_next_files_async; ///
private alias c_g_file_enumerator_next_files_finishFn = extern(C) GList* function(GFileEnumerator* enumerator, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_enumerator_next_files_finishFn c_g_file_enumerator_next_files_finish; ///
private alias c_g_file_enumerator_set_pendingFn = extern(C) void function(GFileEnumerator* enumerator, gboolean pending) nothrow;
__gshared c_g_file_enumerator_set_pendingFn c_g_file_enumerator_set_pending; ///

// FileIOStream
private alias c_g_file_io_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_io_stream_get_typeFn c_g_file_io_stream_get_type; ///
private alias c_g_file_io_stream_get_etagFn = extern(C) char* function(GFileIOStream* stream) nothrow;
__gshared c_g_file_io_stream_get_etagFn c_g_file_io_stream_get_etag; ///
private alias c_g_file_io_stream_query_infoFn = extern(C) GFileInfo* function(GFileIOStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_io_stream_query_infoFn c_g_file_io_stream_query_info; ///
private alias c_g_file_io_stream_query_info_asyncFn = extern(C) void function(GFileIOStream* stream, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_io_stream_query_info_asyncFn c_g_file_io_stream_query_info_async; ///
private alias c_g_file_io_stream_query_info_finishFn = extern(C) GFileInfo* function(GFileIOStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_io_stream_query_info_finishFn c_g_file_io_stream_query_info_finish; ///

// FileIcon
private alias c_g_file_icon_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_icon_get_typeFn c_g_file_icon_get_type; ///
private alias c_g_file_icon_newFn = extern(C) GIcon* function(GFile* file) nothrow;
__gshared c_g_file_icon_newFn c_g_file_icon_new; ///
private alias c_g_file_icon_get_fileFn = extern(C) GFile* function(GFileIcon* icon) nothrow;
__gshared c_g_file_icon_get_fileFn c_g_file_icon_get_file; ///

// FileInfo
private alias c_g_file_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_info_get_typeFn c_g_file_info_get_type; ///
private alias c_g_file_info_newFn = extern(C) GFileInfo* function() nothrow;
__gshared c_g_file_info_newFn c_g_file_info_new; ///
private alias c_g_file_info_clear_statusFn = extern(C) void function(GFileInfo* info) nothrow;
__gshared c_g_file_info_clear_statusFn c_g_file_info_clear_status; ///
private alias c_g_file_info_copy_intoFn = extern(C) void function(GFileInfo* srcInfo, GFileInfo* destInfo) nothrow;
__gshared c_g_file_info_copy_intoFn c_g_file_info_copy_into; ///
private alias c_g_file_info_dupFn = extern(C) GFileInfo* function(GFileInfo* other) nothrow;
__gshared c_g_file_info_dupFn c_g_file_info_dup; ///
private alias c_g_file_info_get_access_date_timeFn = extern(C) GDateTime* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_access_date_timeFn c_g_file_info_get_access_date_time; ///
private alias c_g_file_info_get_attribute_as_stringFn = extern(C) char* function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_as_stringFn c_g_file_info_get_attribute_as_string; ///
private alias c_g_file_info_get_attribute_booleanFn = extern(C) gboolean function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_booleanFn c_g_file_info_get_attribute_boolean; ///
private alias c_g_file_info_get_attribute_byte_stringFn = extern(C) const(char)* function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_byte_stringFn c_g_file_info_get_attribute_byte_string; ///
private alias c_g_file_info_get_attribute_dataFn = extern(C) gboolean function(GFileInfo* info, const(char)* attribute, GFileAttributeType* type, void** valuePp, GFileAttributeStatus* status) nothrow;
__gshared c_g_file_info_get_attribute_dataFn c_g_file_info_get_attribute_data; ///
private alias c_g_file_info_get_attribute_file_pathFn = extern(C) const(char)* function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_file_pathFn c_g_file_info_get_attribute_file_path; ///
private alias c_g_file_info_get_attribute_int32Fn = extern(C) int function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_int32Fn c_g_file_info_get_attribute_int32; ///
private alias c_g_file_info_get_attribute_int64Fn = extern(C) long function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_int64Fn c_g_file_info_get_attribute_int64; ///
private alias c_g_file_info_get_attribute_objectFn = extern(C) GObject* function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_objectFn c_g_file_info_get_attribute_object; ///
private alias c_g_file_info_get_attribute_statusFn = extern(C) GFileAttributeStatus function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_statusFn c_g_file_info_get_attribute_status; ///
private alias c_g_file_info_get_attribute_stringFn = extern(C) const(char)* function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_stringFn c_g_file_info_get_attribute_string; ///
private alias c_g_file_info_get_attribute_stringvFn = extern(C) char** function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_stringvFn c_g_file_info_get_attribute_stringv; ///
private alias c_g_file_info_get_attribute_typeFn = extern(C) GFileAttributeType function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_typeFn c_g_file_info_get_attribute_type; ///
private alias c_g_file_info_get_attribute_uint32Fn = extern(C) uint function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_uint32Fn c_g_file_info_get_attribute_uint32; ///
private alias c_g_file_info_get_attribute_uint64Fn = extern(C) ulong function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_get_attribute_uint64Fn c_g_file_info_get_attribute_uint64; ///
private alias c_g_file_info_get_content_typeFn = extern(C) const(char)* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_content_typeFn c_g_file_info_get_content_type; ///
private alias c_g_file_info_get_creation_date_timeFn = extern(C) GDateTime* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_creation_date_timeFn c_g_file_info_get_creation_date_time; ///
private alias c_g_file_info_get_deletion_dateFn = extern(C) GDateTime* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_deletion_dateFn c_g_file_info_get_deletion_date; ///
private alias c_g_file_info_get_display_nameFn = extern(C) const(char)* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_display_nameFn c_g_file_info_get_display_name; ///
private alias c_g_file_info_get_edit_nameFn = extern(C) const(char)* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_edit_nameFn c_g_file_info_get_edit_name; ///
private alias c_g_file_info_get_etagFn = extern(C) const(char)* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_etagFn c_g_file_info_get_etag; ///
private alias c_g_file_info_get_file_typeFn = extern(C) GFileType function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_file_typeFn c_g_file_info_get_file_type; ///
private alias c_g_file_info_get_iconFn = extern(C) GIcon* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_iconFn c_g_file_info_get_icon; ///
private alias c_g_file_info_get_is_backupFn = extern(C) gboolean function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_is_backupFn c_g_file_info_get_is_backup; ///
private alias c_g_file_info_get_is_hiddenFn = extern(C) gboolean function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_is_hiddenFn c_g_file_info_get_is_hidden; ///
private alias c_g_file_info_get_is_symlinkFn = extern(C) gboolean function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_is_symlinkFn c_g_file_info_get_is_symlink; ///
private alias c_g_file_info_get_modification_date_timeFn = extern(C) GDateTime* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_modification_date_timeFn c_g_file_info_get_modification_date_time; ///
private alias c_g_file_info_get_modification_timeFn = extern(C) void function(GFileInfo* info, GTimeVal* result) nothrow;
__gshared c_g_file_info_get_modification_timeFn c_g_file_info_get_modification_time; ///
private alias c_g_file_info_get_nameFn = extern(C) const(char)* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_nameFn c_g_file_info_get_name; ///
private alias c_g_file_info_get_sizeFn = extern(C) long function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_sizeFn c_g_file_info_get_size; ///
private alias c_g_file_info_get_sort_orderFn = extern(C) int function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_sort_orderFn c_g_file_info_get_sort_order; ///
private alias c_g_file_info_get_symbolic_iconFn = extern(C) GIcon* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_symbolic_iconFn c_g_file_info_get_symbolic_icon; ///
private alias c_g_file_info_get_symlink_targetFn = extern(C) const(char)* function(GFileInfo* info) nothrow;
__gshared c_g_file_info_get_symlink_targetFn c_g_file_info_get_symlink_target; ///
private alias c_g_file_info_has_attributeFn = extern(C) gboolean function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_has_attributeFn c_g_file_info_has_attribute; ///
private alias c_g_file_info_has_namespaceFn = extern(C) gboolean function(GFileInfo* info, const(char)* nameSpace) nothrow;
__gshared c_g_file_info_has_namespaceFn c_g_file_info_has_namespace; ///
private alias c_g_file_info_list_attributesFn = extern(C) char** function(GFileInfo* info, const(char)* nameSpace) nothrow;
__gshared c_g_file_info_list_attributesFn c_g_file_info_list_attributes; ///
private alias c_g_file_info_remove_attributeFn = extern(C) void function(GFileInfo* info, const(char)* attribute) nothrow;
__gshared c_g_file_info_remove_attributeFn c_g_file_info_remove_attribute; ///
private alias c_g_file_info_set_access_date_timeFn = extern(C) void function(GFileInfo* info, GDateTime* atime) nothrow;
__gshared c_g_file_info_set_access_date_timeFn c_g_file_info_set_access_date_time; ///
private alias c_g_file_info_set_attributeFn = extern(C) void function(GFileInfo* info, const(char)* attribute, GFileAttributeType type, void* valueP) nothrow;
__gshared c_g_file_info_set_attributeFn c_g_file_info_set_attribute; ///
private alias c_g_file_info_set_attribute_booleanFn = extern(C) void function(GFileInfo* info, const(char)* attribute, gboolean attrValue) nothrow;
__gshared c_g_file_info_set_attribute_booleanFn c_g_file_info_set_attribute_boolean; ///
private alias c_g_file_info_set_attribute_byte_stringFn = extern(C) void function(GFileInfo* info, const(char)* attribute, const(char)* attrValue) nothrow;
__gshared c_g_file_info_set_attribute_byte_stringFn c_g_file_info_set_attribute_byte_string; ///
private alias c_g_file_info_set_attribute_file_pathFn = extern(C) void function(GFileInfo* info, const(char)* attribute, const(char)* attrValue) nothrow;
__gshared c_g_file_info_set_attribute_file_pathFn c_g_file_info_set_attribute_file_path; ///
private alias c_g_file_info_set_attribute_int32Fn = extern(C) void function(GFileInfo* info, const(char)* attribute, int attrValue) nothrow;
__gshared c_g_file_info_set_attribute_int32Fn c_g_file_info_set_attribute_int32; ///
private alias c_g_file_info_set_attribute_int64Fn = extern(C) void function(GFileInfo* info, const(char)* attribute, long attrValue) nothrow;
__gshared c_g_file_info_set_attribute_int64Fn c_g_file_info_set_attribute_int64; ///
private alias c_g_file_info_set_attribute_maskFn = extern(C) void function(GFileInfo* info, GFileAttributeMatcher* mask) nothrow;
__gshared c_g_file_info_set_attribute_maskFn c_g_file_info_set_attribute_mask; ///
private alias c_g_file_info_set_attribute_objectFn = extern(C) void function(GFileInfo* info, const(char)* attribute, GObject* attrValue) nothrow;
__gshared c_g_file_info_set_attribute_objectFn c_g_file_info_set_attribute_object; ///
private alias c_g_file_info_set_attribute_statusFn = extern(C) gboolean function(GFileInfo* info, const(char)* attribute, GFileAttributeStatus status) nothrow;
__gshared c_g_file_info_set_attribute_statusFn c_g_file_info_set_attribute_status; ///
private alias c_g_file_info_set_attribute_stringFn = extern(C) void function(GFileInfo* info, const(char)* attribute, const(char)* attrValue) nothrow;
__gshared c_g_file_info_set_attribute_stringFn c_g_file_info_set_attribute_string; ///
private alias c_g_file_info_set_attribute_stringvFn = extern(C) void function(GFileInfo* info, const(char)* attribute, char** attrValue) nothrow;
__gshared c_g_file_info_set_attribute_stringvFn c_g_file_info_set_attribute_stringv; ///
private alias c_g_file_info_set_attribute_uint32Fn = extern(C) void function(GFileInfo* info, const(char)* attribute, uint attrValue) nothrow;
__gshared c_g_file_info_set_attribute_uint32Fn c_g_file_info_set_attribute_uint32; ///
private alias c_g_file_info_set_attribute_uint64Fn = extern(C) void function(GFileInfo* info, const(char)* attribute, ulong attrValue) nothrow;
__gshared c_g_file_info_set_attribute_uint64Fn c_g_file_info_set_attribute_uint64; ///
private alias c_g_file_info_set_content_typeFn = extern(C) void function(GFileInfo* info, const(char)* contentType) nothrow;
__gshared c_g_file_info_set_content_typeFn c_g_file_info_set_content_type; ///
private alias c_g_file_info_set_creation_date_timeFn = extern(C) void function(GFileInfo* info, GDateTime* creationTime) nothrow;
__gshared c_g_file_info_set_creation_date_timeFn c_g_file_info_set_creation_date_time; ///
private alias c_g_file_info_set_display_nameFn = extern(C) void function(GFileInfo* info, const(char)* displayName) nothrow;
__gshared c_g_file_info_set_display_nameFn c_g_file_info_set_display_name; ///
private alias c_g_file_info_set_edit_nameFn = extern(C) void function(GFileInfo* info, const(char)* editName) nothrow;
__gshared c_g_file_info_set_edit_nameFn c_g_file_info_set_edit_name; ///
private alias c_g_file_info_set_file_typeFn = extern(C) void function(GFileInfo* info, GFileType type) nothrow;
__gshared c_g_file_info_set_file_typeFn c_g_file_info_set_file_type; ///
private alias c_g_file_info_set_iconFn = extern(C) void function(GFileInfo* info, GIcon* icon) nothrow;
__gshared c_g_file_info_set_iconFn c_g_file_info_set_icon; ///
private alias c_g_file_info_set_is_hiddenFn = extern(C) void function(GFileInfo* info, gboolean isHidden) nothrow;
__gshared c_g_file_info_set_is_hiddenFn c_g_file_info_set_is_hidden; ///
private alias c_g_file_info_set_is_symlinkFn = extern(C) void function(GFileInfo* info, gboolean isSymlink) nothrow;
__gshared c_g_file_info_set_is_symlinkFn c_g_file_info_set_is_symlink; ///
private alias c_g_file_info_set_modification_date_timeFn = extern(C) void function(GFileInfo* info, GDateTime* mtime) nothrow;
__gshared c_g_file_info_set_modification_date_timeFn c_g_file_info_set_modification_date_time; ///
private alias c_g_file_info_set_modification_timeFn = extern(C) void function(GFileInfo* info, GTimeVal* mtime) nothrow;
__gshared c_g_file_info_set_modification_timeFn c_g_file_info_set_modification_time; ///
private alias c_g_file_info_set_nameFn = extern(C) void function(GFileInfo* info, const(char)* name) nothrow;
__gshared c_g_file_info_set_nameFn c_g_file_info_set_name; ///
private alias c_g_file_info_set_sizeFn = extern(C) void function(GFileInfo* info, long size) nothrow;
__gshared c_g_file_info_set_sizeFn c_g_file_info_set_size; ///
private alias c_g_file_info_set_sort_orderFn = extern(C) void function(GFileInfo* info, int sortOrder) nothrow;
__gshared c_g_file_info_set_sort_orderFn c_g_file_info_set_sort_order; ///
private alias c_g_file_info_set_symbolic_iconFn = extern(C) void function(GFileInfo* info, GIcon* icon) nothrow;
__gshared c_g_file_info_set_symbolic_iconFn c_g_file_info_set_symbolic_icon; ///
private alias c_g_file_info_set_symlink_targetFn = extern(C) void function(GFileInfo* info, const(char)* symlinkTarget) nothrow;
__gshared c_g_file_info_set_symlink_targetFn c_g_file_info_set_symlink_target; ///
private alias c_g_file_info_unset_attribute_maskFn = extern(C) void function(GFileInfo* info) nothrow;
__gshared c_g_file_info_unset_attribute_maskFn c_g_file_info_unset_attribute_mask; ///

// FileInputStream
private alias c_g_file_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_input_stream_get_typeFn c_g_file_input_stream_get_type; ///
private alias c_g_file_input_stream_query_infoFn = extern(C) GFileInfo* function(GFileInputStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_input_stream_query_infoFn c_g_file_input_stream_query_info; ///
private alias c_g_file_input_stream_query_info_asyncFn = extern(C) void function(GFileInputStream* stream, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_input_stream_query_info_asyncFn c_g_file_input_stream_query_info_async; ///
private alias c_g_file_input_stream_query_info_finishFn = extern(C) GFileInfo* function(GFileInputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_input_stream_query_info_finishFn c_g_file_input_stream_query_info_finish; ///

// FileMonitor
private alias c_g_file_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_monitor_get_typeFn c_g_file_monitor_get_type; ///
private alias c_g_file_monitor_cancelFn = extern(C) gboolean function(GFileMonitor* monitor) nothrow;
__gshared c_g_file_monitor_cancelFn c_g_file_monitor_cancel; ///
private alias c_g_file_monitor_emit_eventFn = extern(C) void function(GFileMonitor* monitor, GFile* child, GFile* otherFile, GFileMonitorEvent eventType) nothrow;
__gshared c_g_file_monitor_emit_eventFn c_g_file_monitor_emit_event; ///
private alias c_g_file_monitor_is_cancelledFn = extern(C) gboolean function(GFileMonitor* monitor) nothrow;
__gshared c_g_file_monitor_is_cancelledFn c_g_file_monitor_is_cancelled; ///
private alias c_g_file_monitor_set_rate_limitFn = extern(C) void function(GFileMonitor* monitor, int limitMsecs) nothrow;
__gshared c_g_file_monitor_set_rate_limitFn c_g_file_monitor_set_rate_limit; ///

// FileOutputStream
private alias c_g_file_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_file_output_stream_get_typeFn c_g_file_output_stream_get_type; ///
private alias c_g_file_output_stream_get_etagFn = extern(C) char* function(GFileOutputStream* stream) nothrow;
__gshared c_g_file_output_stream_get_etagFn c_g_file_output_stream_get_etag; ///
private alias c_g_file_output_stream_query_infoFn = extern(C) GFileInfo* function(GFileOutputStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_file_output_stream_query_infoFn c_g_file_output_stream_query_info; ///
private alias c_g_file_output_stream_query_info_asyncFn = extern(C) void function(GFileOutputStream* stream, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_file_output_stream_query_info_asyncFn c_g_file_output_stream_query_info_async; ///
private alias c_g_file_output_stream_query_info_finishFn = extern(C) GFileInfo* function(GFileOutputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_file_output_stream_query_info_finishFn c_g_file_output_stream_query_info_finish; ///

// FilenameCompleter
private alias c_g_filename_completer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_filename_completer_get_typeFn c_g_filename_completer_get_type; ///
private alias c_g_filename_completer_newFn = extern(C) GFilenameCompleter* function() nothrow;
__gshared c_g_filename_completer_newFn c_g_filename_completer_new; ///
private alias c_g_filename_completer_get_completion_suffixFn = extern(C) char* function(GFilenameCompleter* completer, const(char)* initialText) nothrow;
__gshared c_g_filename_completer_get_completion_suffixFn c_g_filename_completer_get_completion_suffix; ///
private alias c_g_filename_completer_get_completionsFn = extern(C) char** function(GFilenameCompleter* completer, const(char)* initialText) nothrow;
__gshared c_g_filename_completer_get_completionsFn c_g_filename_completer_get_completions; ///
private alias c_g_filename_completer_set_dirs_onlyFn = extern(C) void function(GFilenameCompleter* completer, gboolean dirsOnly) nothrow;
__gshared c_g_filename_completer_set_dirs_onlyFn c_g_filename_completer_set_dirs_only; ///

// FilterInputStream
private alias c_g_filter_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_filter_input_stream_get_typeFn c_g_filter_input_stream_get_type; ///
private alias c_g_filter_input_stream_get_base_streamFn = extern(C) GInputStream* function(GFilterInputStream* stream) nothrow;
__gshared c_g_filter_input_stream_get_base_streamFn c_g_filter_input_stream_get_base_stream; ///
private alias c_g_filter_input_stream_get_close_base_streamFn = extern(C) gboolean function(GFilterInputStream* stream) nothrow;
__gshared c_g_filter_input_stream_get_close_base_streamFn c_g_filter_input_stream_get_close_base_stream; ///
private alias c_g_filter_input_stream_set_close_base_streamFn = extern(C) void function(GFilterInputStream* stream, gboolean closeBase) nothrow;
__gshared c_g_filter_input_stream_set_close_base_streamFn c_g_filter_input_stream_set_close_base_stream; ///

// FilterOutputStream
private alias c_g_filter_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_filter_output_stream_get_typeFn c_g_filter_output_stream_get_type; ///
private alias c_g_filter_output_stream_get_base_streamFn = extern(C) GOutputStream* function(GFilterOutputStream* stream) nothrow;
__gshared c_g_filter_output_stream_get_base_streamFn c_g_filter_output_stream_get_base_stream; ///
private alias c_g_filter_output_stream_get_close_base_streamFn = extern(C) gboolean function(GFilterOutputStream* stream) nothrow;
__gshared c_g_filter_output_stream_get_close_base_streamFn c_g_filter_output_stream_get_close_base_stream; ///
private alias c_g_filter_output_stream_set_close_base_streamFn = extern(C) void function(GFilterOutputStream* stream, gboolean closeBase) nothrow;
__gshared c_g_filter_output_stream_set_close_base_streamFn c_g_filter_output_stream_set_close_base_stream; ///

// IOExtension
private alias c_g_io_extension_get_nameFn = extern(C) const(char)* function(GIOExtension* extension) nothrow;
__gshared c_g_io_extension_get_nameFn c_g_io_extension_get_name; ///
private alias c_g_io_extension_get_priorityFn = extern(C) int function(GIOExtension* extension) nothrow;
__gshared c_g_io_extension_get_priorityFn c_g_io_extension_get_priority; ///
private alias c_g_io_extension_get_typeFn = extern(C) GType function(GIOExtension* extension) nothrow;
__gshared c_g_io_extension_get_typeFn c_g_io_extension_get_type; ///
private alias c_g_io_extension_ref_classFn = extern(C) GTypeClass* function(GIOExtension* extension) nothrow;
__gshared c_g_io_extension_ref_classFn c_g_io_extension_ref_class; ///

// IOExtensionPoint
private alias c_g_io_extension_point_get_extension_by_nameFn = extern(C) GIOExtension* function(GIOExtensionPoint* extensionPoint, const(char)* name) nothrow;
__gshared c_g_io_extension_point_get_extension_by_nameFn c_g_io_extension_point_get_extension_by_name; ///
private alias c_g_io_extension_point_get_extensionsFn = extern(C) GList* function(GIOExtensionPoint* extensionPoint) nothrow;
__gshared c_g_io_extension_point_get_extensionsFn c_g_io_extension_point_get_extensions; ///
private alias c_g_io_extension_point_get_required_typeFn = extern(C) GType function(GIOExtensionPoint* extensionPoint) nothrow;
__gshared c_g_io_extension_point_get_required_typeFn c_g_io_extension_point_get_required_type; ///
private alias c_g_io_extension_point_set_required_typeFn = extern(C) void function(GIOExtensionPoint* extensionPoint, GType type) nothrow;
__gshared c_g_io_extension_point_set_required_typeFn c_g_io_extension_point_set_required_type; ///
private alias c_g_io_extension_point_implementFn = extern(C) GIOExtension* function(const(char)* extensionPointName, GType type, const(char)* extensionName, int priority) nothrow;
__gshared c_g_io_extension_point_implementFn c_g_io_extension_point_implement; ///
private alias c_g_io_extension_point_lookupFn = extern(C) GIOExtensionPoint* function(const(char)* name) nothrow;
__gshared c_g_io_extension_point_lookupFn c_g_io_extension_point_lookup; ///
private alias c_g_io_extension_point_registerFn = extern(C) GIOExtensionPoint* function(const(char)* name) nothrow;
__gshared c_g_io_extension_point_registerFn c_g_io_extension_point_register; ///

// IOModule
private alias c_g_io_module_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_io_module_get_typeFn c_g_io_module_get_type; ///
private alias c_g_io_module_newFn = extern(C) GIOModule* function(const(char)* filename) nothrow;
__gshared c_g_io_module_newFn c_g_io_module_new; ///
private alias c_g_io_module_queryFn = extern(C) char** function() nothrow;
__gshared c_g_io_module_queryFn c_g_io_module_query; ///
private alias c_g_io_module_loadFn = extern(C) void function(GIOModule* module_) nothrow;
__gshared c_g_io_module_loadFn c_g_io_module_load; ///
private alias c_g_io_module_unloadFn = extern(C) void function(GIOModule* module_) nothrow;
__gshared c_g_io_module_unloadFn c_g_io_module_unload; ///

// IOModuleScope
private alias c_g_io_module_scope_blockFn = extern(C) void function(GIOModuleScope* scope_, const(char)* basename) nothrow;
__gshared c_g_io_module_scope_blockFn c_g_io_module_scope_block; ///
private alias c_g_io_module_scope_freeFn = extern(C) void function(GIOModuleScope* scope_) nothrow;
__gshared c_g_io_module_scope_freeFn c_g_io_module_scope_free; ///
private alias c_g_io_module_scope_newFn = extern(C) GIOModuleScope* function(GIOModuleScopeFlags flags) nothrow;
__gshared c_g_io_module_scope_newFn c_g_io_module_scope_new; ///

// IOSchedulerJob
private alias c_g_io_scheduler_job_send_to_mainloopFn = extern(C) gboolean function(GIOSchedulerJob* job, GSourceFunc func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_io_scheduler_job_send_to_mainloopFn c_g_io_scheduler_job_send_to_mainloop; ///
private alias c_g_io_scheduler_job_send_to_mainloop_asyncFn = extern(C) void function(GIOSchedulerJob* job, GSourceFunc func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_io_scheduler_job_send_to_mainloop_asyncFn c_g_io_scheduler_job_send_to_mainloop_async; ///

// IOStream
private alias c_g_io_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_io_stream_get_typeFn c_g_io_stream_get_type; ///
private alias c_g_io_stream_splice_finishFn = extern(C) gboolean function(GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_io_stream_splice_finishFn c_g_io_stream_splice_finish; ///
private alias c_g_io_stream_clear_pendingFn = extern(C) void function(GIOStream* stream) nothrow;
__gshared c_g_io_stream_clear_pendingFn c_g_io_stream_clear_pending; ///
private alias c_g_io_stream_closeFn = extern(C) gboolean function(GIOStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_io_stream_closeFn c_g_io_stream_close; ///
private alias c_g_io_stream_close_asyncFn = extern(C) void function(GIOStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_io_stream_close_asyncFn c_g_io_stream_close_async; ///
private alias c_g_io_stream_close_finishFn = extern(C) gboolean function(GIOStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_io_stream_close_finishFn c_g_io_stream_close_finish; ///
private alias c_g_io_stream_get_input_streamFn = extern(C) GInputStream* function(GIOStream* stream) nothrow;
__gshared c_g_io_stream_get_input_streamFn c_g_io_stream_get_input_stream; ///
private alias c_g_io_stream_get_output_streamFn = extern(C) GOutputStream* function(GIOStream* stream) nothrow;
__gshared c_g_io_stream_get_output_streamFn c_g_io_stream_get_output_stream; ///
private alias c_g_io_stream_has_pendingFn = extern(C) gboolean function(GIOStream* stream) nothrow;
__gshared c_g_io_stream_has_pendingFn c_g_io_stream_has_pending; ///
private alias c_g_io_stream_is_closedFn = extern(C) gboolean function(GIOStream* stream) nothrow;
__gshared c_g_io_stream_is_closedFn c_g_io_stream_is_closed; ///
private alias c_g_io_stream_set_pendingFn = extern(C) gboolean function(GIOStream* stream, GError** _err) nothrow;
__gshared c_g_io_stream_set_pendingFn c_g_io_stream_set_pending; ///
private alias c_g_io_stream_splice_asyncFn = extern(C) void function(GIOStream* stream1, GIOStream* stream2, GIOStreamSpliceFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_io_stream_splice_asyncFn c_g_io_stream_splice_async; ///

// IPTosMessage
private alias c_g_ip_tos_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_ip_tos_message_get_typeFn c_g_ip_tos_message_get_type; ///
private alias c_g_ip_tos_message_newFn = extern(C) GSocketControlMessage* function(ubyte dscp, GEcnCodePoint ecn) nothrow;
__gshared c_g_ip_tos_message_newFn c_g_ip_tos_message_new; ///
private alias c_g_ip_tos_message_get_dscpFn = extern(C) ubyte function(GIPTosMessage* message) nothrow;
__gshared c_g_ip_tos_message_get_dscpFn c_g_ip_tos_message_get_dscp; ///
private alias c_g_ip_tos_message_get_ecnFn = extern(C) GEcnCodePoint function(GIPTosMessage* message) nothrow;
__gshared c_g_ip_tos_message_get_ecnFn c_g_ip_tos_message_get_ecn; ///

// IPv6TclassMessage
private alias c_g_ipv6_tclass_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_ipv6_tclass_message_get_typeFn c_g_ipv6_tclass_message_get_type; ///
private alias c_g_ipv6_tclass_message_newFn = extern(C) GSocketControlMessage* function(ubyte dscp, GEcnCodePoint ecn) nothrow;
__gshared c_g_ipv6_tclass_message_newFn c_g_ipv6_tclass_message_new; ///
private alias c_g_ipv6_tclass_message_get_dscpFn = extern(C) ubyte function(GIPv6TclassMessage* message) nothrow;
__gshared c_g_ipv6_tclass_message_get_dscpFn c_g_ipv6_tclass_message_get_dscp; ///
private alias c_g_ipv6_tclass_message_get_ecnFn = extern(C) GEcnCodePoint function(GIPv6TclassMessage* message) nothrow;
__gshared c_g_ipv6_tclass_message_get_ecnFn c_g_ipv6_tclass_message_get_ecn; ///

// Icon
private alias c_g_icon_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_icon_get_typeFn c_g_icon_get_type; ///
private alias c_g_icon_deserializeFn = extern(C) GIcon* function(GVariant* value) nothrow;
__gshared c_g_icon_deserializeFn c_g_icon_deserialize; ///
private alias c_g_icon_new_for_stringFn = extern(C) GIcon* function(const(char)* str, GError** _err) nothrow;
__gshared c_g_icon_new_for_stringFn c_g_icon_new_for_string; ///
private alias c_g_icon_equalFn = extern(C) gboolean function(GIcon* icon1, GIcon* icon2) nothrow;
__gshared c_g_icon_equalFn c_g_icon_equal; ///
private alias c_g_icon_hashFn = extern(C) uint function(GIcon* icon) nothrow;
__gshared c_g_icon_hashFn c_g_icon_hash; ///
private alias c_g_icon_serializeFn = extern(C) GVariant* function(GIcon* icon) nothrow;
__gshared c_g_icon_serializeFn c_g_icon_serialize; ///
private alias c_g_icon_to_stringFn = extern(C) char* function(GIcon* icon) nothrow;
__gshared c_g_icon_to_stringFn c_g_icon_to_string; ///

// InetAddress
private alias c_g_inet_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_inet_address_get_typeFn c_g_inet_address_get_type; ///
private alias c_g_inet_address_new_anyFn = extern(C) GInetAddress* function(GSocketFamily family) nothrow;
__gshared c_g_inet_address_new_anyFn c_g_inet_address_new_any; ///
private alias c_g_inet_address_new_from_bytesFn = extern(C) GInetAddress* function(const(ubyte)* bytes, GSocketFamily family) nothrow;
__gshared c_g_inet_address_new_from_bytesFn c_g_inet_address_new_from_bytes; ///
private alias c_g_inet_address_new_from_bytes_with_ipv6_infoFn = extern(C) GInetAddress* function(const(ubyte)* bytes, GSocketFamily family, uint flowinfo, uint scopeId) nothrow;
__gshared c_g_inet_address_new_from_bytes_with_ipv6_infoFn c_g_inet_address_new_from_bytes_with_ipv6_info; ///
private alias c_g_inet_address_new_from_stringFn = extern(C) GInetAddress* function(const(char)* string_) nothrow;
__gshared c_g_inet_address_new_from_stringFn c_g_inet_address_new_from_string; ///
private alias c_g_inet_address_new_loopbackFn = extern(C) GInetAddress* function(GSocketFamily family) nothrow;
__gshared c_g_inet_address_new_loopbackFn c_g_inet_address_new_loopback; ///
private alias c_g_inet_address_equalFn = extern(C) gboolean function(GInetAddress* address, GInetAddress* otherAddress) nothrow;
__gshared c_g_inet_address_equalFn c_g_inet_address_equal; ///
private alias c_g_inet_address_get_familyFn = extern(C) GSocketFamily function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_familyFn c_g_inet_address_get_family; ///
private alias c_g_inet_address_get_flowinfoFn = extern(C) uint function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_flowinfoFn c_g_inet_address_get_flowinfo; ///
private alias c_g_inet_address_get_is_anyFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_anyFn c_g_inet_address_get_is_any; ///
private alias c_g_inet_address_get_is_link_localFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_link_localFn c_g_inet_address_get_is_link_local; ///
private alias c_g_inet_address_get_is_loopbackFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_loopbackFn c_g_inet_address_get_is_loopback; ///
private alias c_g_inet_address_get_is_mc_globalFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_mc_globalFn c_g_inet_address_get_is_mc_global; ///
private alias c_g_inet_address_get_is_mc_link_localFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_mc_link_localFn c_g_inet_address_get_is_mc_link_local; ///
private alias c_g_inet_address_get_is_mc_node_localFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_mc_node_localFn c_g_inet_address_get_is_mc_node_local; ///
private alias c_g_inet_address_get_is_mc_org_localFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_mc_org_localFn c_g_inet_address_get_is_mc_org_local; ///
private alias c_g_inet_address_get_is_mc_site_localFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_mc_site_localFn c_g_inet_address_get_is_mc_site_local; ///
private alias c_g_inet_address_get_is_multicastFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_multicastFn c_g_inet_address_get_is_multicast; ///
private alias c_g_inet_address_get_is_site_localFn = extern(C) gboolean function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_is_site_localFn c_g_inet_address_get_is_site_local; ///
private alias c_g_inet_address_get_native_sizeFn = extern(C) size_t function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_native_sizeFn c_g_inet_address_get_native_size; ///
private alias c_g_inet_address_get_scope_idFn = extern(C) uint function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_get_scope_idFn c_g_inet_address_get_scope_id; ///
private alias c_g_inet_address_to_bytesFn = extern(C) const(ubyte)* function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_to_bytesFn c_g_inet_address_to_bytes; ///
private alias c_g_inet_address_to_stringFn = extern(C) char* function(GInetAddress* address) nothrow;
__gshared c_g_inet_address_to_stringFn c_g_inet_address_to_string; ///

// InetAddressMask
private alias c_g_inet_address_mask_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_inet_address_mask_get_typeFn c_g_inet_address_mask_get_type; ///
private alias c_g_inet_address_mask_newFn = extern(C) GInetAddressMask* function(GInetAddress* addr, uint length, GError** _err) nothrow;
__gshared c_g_inet_address_mask_newFn c_g_inet_address_mask_new; ///
private alias c_g_inet_address_mask_new_from_stringFn = extern(C) GInetAddressMask* function(const(char)* maskString, GError** _err) nothrow;
__gshared c_g_inet_address_mask_new_from_stringFn c_g_inet_address_mask_new_from_string; ///
private alias c_g_inet_address_mask_equalFn = extern(C) gboolean function(GInetAddressMask* mask, GInetAddressMask* mask2) nothrow;
__gshared c_g_inet_address_mask_equalFn c_g_inet_address_mask_equal; ///
private alias c_g_inet_address_mask_get_addressFn = extern(C) GInetAddress* function(GInetAddressMask* mask) nothrow;
__gshared c_g_inet_address_mask_get_addressFn c_g_inet_address_mask_get_address; ///
private alias c_g_inet_address_mask_get_familyFn = extern(C) GSocketFamily function(GInetAddressMask* mask) nothrow;
__gshared c_g_inet_address_mask_get_familyFn c_g_inet_address_mask_get_family; ///
private alias c_g_inet_address_mask_get_lengthFn = extern(C) uint function(GInetAddressMask* mask) nothrow;
__gshared c_g_inet_address_mask_get_lengthFn c_g_inet_address_mask_get_length; ///
private alias c_g_inet_address_mask_matchesFn = extern(C) gboolean function(GInetAddressMask* mask, GInetAddress* address) nothrow;
__gshared c_g_inet_address_mask_matchesFn c_g_inet_address_mask_matches; ///
private alias c_g_inet_address_mask_to_stringFn = extern(C) char* function(GInetAddressMask* mask) nothrow;
__gshared c_g_inet_address_mask_to_stringFn c_g_inet_address_mask_to_string; ///

// InetSocketAddress
private alias c_g_inet_socket_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_inet_socket_address_get_typeFn c_g_inet_socket_address_get_type; ///
private alias c_g_inet_socket_address_newFn = extern(C) GSocketAddress* function(GInetAddress* address, ushort port) nothrow;
__gshared c_g_inet_socket_address_newFn c_g_inet_socket_address_new; ///
private alias c_g_inet_socket_address_new_from_stringFn = extern(C) GSocketAddress* function(const(char)* address, uint port) nothrow;
__gshared c_g_inet_socket_address_new_from_stringFn c_g_inet_socket_address_new_from_string; ///
private alias c_g_inet_socket_address_get_addressFn = extern(C) GInetAddress* function(GInetSocketAddress* address) nothrow;
__gshared c_g_inet_socket_address_get_addressFn c_g_inet_socket_address_get_address; ///
private alias c_g_inet_socket_address_get_flowinfoFn = extern(C) uint function(GInetSocketAddress* address) nothrow;
__gshared c_g_inet_socket_address_get_flowinfoFn c_g_inet_socket_address_get_flowinfo; ///
private alias c_g_inet_socket_address_get_portFn = extern(C) ushort function(GInetSocketAddress* address) nothrow;
__gshared c_g_inet_socket_address_get_portFn c_g_inet_socket_address_get_port; ///
private alias c_g_inet_socket_address_get_scope_idFn = extern(C) uint function(GInetSocketAddress* address) nothrow;
__gshared c_g_inet_socket_address_get_scope_idFn c_g_inet_socket_address_get_scope_id; ///

// Initable
private alias c_g_initable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_initable_get_typeFn c_g_initable_get_type; ///
private alias c_g_initable_newFn = extern(C) GObject* function(GType objectType, GCancellable* cancellable, GError** error, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_g_initable_newFn c_g_initable_new; ///
private alias c_g_initable_new_valistFn = extern(C) GObject* function(GType objectType, const(char)* firstPropertyName, void* varArgs, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_initable_new_valistFn c_g_initable_new_valist; ///
private alias c_g_initable_newvFn = extern(C) GObject* function(GType objectType, uint nParameters, GParameter* parameters, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_initable_newvFn c_g_initable_newv; ///
private alias c_g_initable_initFn = extern(C) gboolean function(GInitable* initable, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_initable_initFn c_g_initable_init; ///

// InputStream
private alias c_g_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_input_stream_get_typeFn c_g_input_stream_get_type; ///
private alias c_g_input_stream_clear_pendingFn = extern(C) void function(GInputStream* stream) nothrow;
__gshared c_g_input_stream_clear_pendingFn c_g_input_stream_clear_pending; ///
private alias c_g_input_stream_closeFn = extern(C) gboolean function(GInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_input_stream_closeFn c_g_input_stream_close; ///
private alias c_g_input_stream_close_asyncFn = extern(C) void function(GInputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_input_stream_close_asyncFn c_g_input_stream_close_async; ///
private alias c_g_input_stream_close_finishFn = extern(C) gboolean function(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_input_stream_close_finishFn c_g_input_stream_close_finish; ///
private alias c_g_input_stream_has_pendingFn = extern(C) gboolean function(GInputStream* stream) nothrow;
__gshared c_g_input_stream_has_pendingFn c_g_input_stream_has_pending; ///
private alias c_g_input_stream_is_closedFn = extern(C) gboolean function(GInputStream* stream) nothrow;
__gshared c_g_input_stream_is_closedFn c_g_input_stream_is_closed; ///
private alias c_g_input_stream_readFn = extern(C) ptrdiff_t function(GInputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_input_stream_readFn c_g_input_stream_read; ///
private alias c_g_input_stream_read_allFn = extern(C) gboolean function(GInputStream* stream, void* buffer, size_t count, size_t* bytesRead, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_input_stream_read_allFn c_g_input_stream_read_all; ///
private alias c_g_input_stream_read_all_asyncFn = extern(C) void function(GInputStream* stream, void* buffer, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_input_stream_read_all_asyncFn c_g_input_stream_read_all_async; ///
private alias c_g_input_stream_read_all_finishFn = extern(C) gboolean function(GInputStream* stream, GAsyncResult* result, size_t* bytesRead, GError** _err) nothrow;
__gshared c_g_input_stream_read_all_finishFn c_g_input_stream_read_all_finish; ///
private alias c_g_input_stream_read_asyncFn = extern(C) void function(GInputStream* stream, void* buffer, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_input_stream_read_asyncFn c_g_input_stream_read_async; ///
private alias c_g_input_stream_read_bytesFn = extern(C) GBytes* function(GInputStream* stream, size_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_input_stream_read_bytesFn c_g_input_stream_read_bytes; ///
private alias c_g_input_stream_read_bytes_asyncFn = extern(C) void function(GInputStream* stream, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_input_stream_read_bytes_asyncFn c_g_input_stream_read_bytes_async; ///
private alias c_g_input_stream_read_bytes_finishFn = extern(C) GBytes* function(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_input_stream_read_bytes_finishFn c_g_input_stream_read_bytes_finish; ///
private alias c_g_input_stream_read_finishFn = extern(C) ptrdiff_t function(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_input_stream_read_finishFn c_g_input_stream_read_finish; ///
private alias c_g_input_stream_set_pendingFn = extern(C) gboolean function(GInputStream* stream, GError** _err) nothrow;
__gshared c_g_input_stream_set_pendingFn c_g_input_stream_set_pending; ///
private alias c_g_input_stream_skipFn = extern(C) ptrdiff_t function(GInputStream* stream, size_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_input_stream_skipFn c_g_input_stream_skip; ///
private alias c_g_input_stream_skip_asyncFn = extern(C) void function(GInputStream* stream, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_input_stream_skip_asyncFn c_g_input_stream_skip_async; ///
private alias c_g_input_stream_skip_finishFn = extern(C) ptrdiff_t function(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_input_stream_skip_finishFn c_g_input_stream_skip_finish; ///

// ListModel
private alias c_g_list_model_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_list_model_get_typeFn c_g_list_model_get_type; ///
private alias c_g_list_model_get_itemFn = extern(C) void* function(GListModel* list, uint position) nothrow;
__gshared c_g_list_model_get_itemFn c_g_list_model_get_item; ///
private alias c_g_list_model_get_item_typeFn = extern(C) GType function(GListModel* list) nothrow;
__gshared c_g_list_model_get_item_typeFn c_g_list_model_get_item_type; ///
private alias c_g_list_model_get_n_itemsFn = extern(C) uint function(GListModel* list) nothrow;
__gshared c_g_list_model_get_n_itemsFn c_g_list_model_get_n_items; ///
private alias c_g_list_model_get_objectFn = extern(C) GObject* function(GListModel* list, uint position) nothrow;
__gshared c_g_list_model_get_objectFn c_g_list_model_get_object; ///
private alias c_g_list_model_items_changedFn = extern(C) void function(GListModel* list, uint position, uint removed, uint added) nothrow;
__gshared c_g_list_model_items_changedFn c_g_list_model_items_changed; ///

// ListStore
private alias c_g_list_store_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_list_store_get_typeFn c_g_list_store_get_type; ///
private alias c_g_list_store_newFn = extern(C) GListStore* function(GType itemType) nothrow;
__gshared c_g_list_store_newFn c_g_list_store_new; ///
private alias c_g_list_store_appendFn = extern(C) void function(GListStore* store, GObject* item) nothrow;
__gshared c_g_list_store_appendFn c_g_list_store_append; ///
private alias c_g_list_store_findFn = extern(C) gboolean function(GListStore* store, GObject* item, uint* position) nothrow;
__gshared c_g_list_store_findFn c_g_list_store_find; ///
private alias c_g_list_store_find_with_equal_funcFn = extern(C) gboolean function(GListStore* store, GObject* item, GEqualFunc equalFunc, uint* position) nothrow;
__gshared c_g_list_store_find_with_equal_funcFn c_g_list_store_find_with_equal_func; ///
private alias c_g_list_store_find_with_equal_func_fullFn = extern(C) gboolean function(GListStore* store, GObject* item, GEqualFuncFull equalFunc, void* userData, uint* position) nothrow;
__gshared c_g_list_store_find_with_equal_func_fullFn c_g_list_store_find_with_equal_func_full; ///
private alias c_g_list_store_insertFn = extern(C) void function(GListStore* store, uint position, GObject* item) nothrow;
__gshared c_g_list_store_insertFn c_g_list_store_insert; ///
private alias c_g_list_store_insert_sortedFn = extern(C) uint function(GListStore* store, GObject* item, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_list_store_insert_sortedFn c_g_list_store_insert_sorted; ///
private alias c_g_list_store_removeFn = extern(C) void function(GListStore* store, uint position) nothrow;
__gshared c_g_list_store_removeFn c_g_list_store_remove; ///
private alias c_g_list_store_remove_allFn = extern(C) void function(GListStore* store) nothrow;
__gshared c_g_list_store_remove_allFn c_g_list_store_remove_all; ///
private alias c_g_list_store_sortFn = extern(C) void function(GListStore* store, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_list_store_sortFn c_g_list_store_sort; ///
private alias c_g_list_store_spliceFn = extern(C) void function(GListStore* store, uint position, uint nRemovals, void** additions, uint nAdditions) nothrow;
__gshared c_g_list_store_spliceFn c_g_list_store_splice; ///

// LoadableIcon
private alias c_g_loadable_icon_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_loadable_icon_get_typeFn c_g_loadable_icon_get_type; ///
private alias c_g_loadable_icon_loadFn = extern(C) GInputStream* function(GLoadableIcon* icon, int size, char** type, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_loadable_icon_loadFn c_g_loadable_icon_load; ///
private alias c_g_loadable_icon_load_asyncFn = extern(C) void function(GLoadableIcon* icon, int size, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_loadable_icon_load_asyncFn c_g_loadable_icon_load_async; ///
private alias c_g_loadable_icon_load_finishFn = extern(C) GInputStream* function(GLoadableIcon* icon, GAsyncResult* res, char** type, GError** _err) nothrow;
__gshared c_g_loadable_icon_load_finishFn c_g_loadable_icon_load_finish; ///

// MemoryInputStream
private alias c_g_memory_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_memory_input_stream_get_typeFn c_g_memory_input_stream_get_type; ///
private alias c_g_memory_input_stream_newFn = extern(C) GInputStream* function() nothrow;
__gshared c_g_memory_input_stream_newFn c_g_memory_input_stream_new; ///
private alias c_g_memory_input_stream_new_from_bytesFn = extern(C) GInputStream* function(GBytes* bytes) nothrow;
__gshared c_g_memory_input_stream_new_from_bytesFn c_g_memory_input_stream_new_from_bytes; ///
private alias c_g_memory_input_stream_new_from_dataFn = extern(C) GInputStream* function(void* data, ptrdiff_t len, GDestroyNotify destroy) nothrow;
__gshared c_g_memory_input_stream_new_from_dataFn c_g_memory_input_stream_new_from_data; ///
private alias c_g_memory_input_stream_add_bytesFn = extern(C) void function(GMemoryInputStream* stream, GBytes* bytes) nothrow;
__gshared c_g_memory_input_stream_add_bytesFn c_g_memory_input_stream_add_bytes; ///
private alias c_g_memory_input_stream_add_dataFn = extern(C) void function(GMemoryInputStream* stream, void* data, ptrdiff_t len, GDestroyNotify destroy) nothrow;
__gshared c_g_memory_input_stream_add_dataFn c_g_memory_input_stream_add_data; ///

// MemoryMonitor
private alias c_g_memory_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_memory_monitor_get_typeFn c_g_memory_monitor_get_type; ///
private alias c_g_memory_monitor_dup_defaultFn = extern(C) GMemoryMonitor* function() nothrow;
__gshared c_g_memory_monitor_dup_defaultFn c_g_memory_monitor_dup_default; ///

// MemoryOutputStream
private alias c_g_memory_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_memory_output_stream_get_typeFn c_g_memory_output_stream_get_type; ///
private alias c_g_memory_output_stream_newFn = extern(C) GOutputStream* function(void* data, size_t size, GReallocFunc reallocFunction, GDestroyNotify destroyFunction) nothrow;
__gshared c_g_memory_output_stream_newFn c_g_memory_output_stream_new; ///
private alias c_g_memory_output_stream_new_resizableFn = extern(C) GOutputStream* function() nothrow;
__gshared c_g_memory_output_stream_new_resizableFn c_g_memory_output_stream_new_resizable; ///
private alias c_g_memory_output_stream_get_dataFn = extern(C) void* function(GMemoryOutputStream* ostream) nothrow;
__gshared c_g_memory_output_stream_get_dataFn c_g_memory_output_stream_get_data; ///
private alias c_g_memory_output_stream_get_data_sizeFn = extern(C) size_t function(GMemoryOutputStream* ostream) nothrow;
__gshared c_g_memory_output_stream_get_data_sizeFn c_g_memory_output_stream_get_data_size; ///
private alias c_g_memory_output_stream_get_sizeFn = extern(C) size_t function(GMemoryOutputStream* ostream) nothrow;
__gshared c_g_memory_output_stream_get_sizeFn c_g_memory_output_stream_get_size; ///
private alias c_g_memory_output_stream_steal_as_bytesFn = extern(C) GBytes* function(GMemoryOutputStream* ostream) nothrow;
__gshared c_g_memory_output_stream_steal_as_bytesFn c_g_memory_output_stream_steal_as_bytes; ///
private alias c_g_memory_output_stream_steal_dataFn = extern(C) void* function(GMemoryOutputStream* ostream) nothrow;
__gshared c_g_memory_output_stream_steal_dataFn c_g_memory_output_stream_steal_data; ///

// Menu
private alias c_g_menu_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_menu_get_typeFn c_g_menu_get_type; ///
private alias c_g_menu_newFn = extern(C) GMenu* function() nothrow;
__gshared c_g_menu_newFn c_g_menu_new; ///
private alias c_g_menu_appendFn = extern(C) void function(GMenu* menu, const(char)* label, const(char)* detailedAction) nothrow;
__gshared c_g_menu_appendFn c_g_menu_append; ///
private alias c_g_menu_append_itemFn = extern(C) void function(GMenu* menu, GMenuItem* item) nothrow;
__gshared c_g_menu_append_itemFn c_g_menu_append_item; ///
private alias c_g_menu_append_sectionFn = extern(C) void function(GMenu* menu, const(char)* label, GMenuModel* section) nothrow;
__gshared c_g_menu_append_sectionFn c_g_menu_append_section; ///
private alias c_g_menu_append_submenuFn = extern(C) void function(GMenu* menu, const(char)* label, GMenuModel* submenu) nothrow;
__gshared c_g_menu_append_submenuFn c_g_menu_append_submenu; ///
private alias c_g_menu_freezeFn = extern(C) void function(GMenu* menu) nothrow;
__gshared c_g_menu_freezeFn c_g_menu_freeze; ///
private alias c_g_menu_insertFn = extern(C) void function(GMenu* menu, int position, const(char)* label, const(char)* detailedAction) nothrow;
__gshared c_g_menu_insertFn c_g_menu_insert; ///
private alias c_g_menu_insert_itemFn = extern(C) void function(GMenu* menu, int position, GMenuItem* item) nothrow;
__gshared c_g_menu_insert_itemFn c_g_menu_insert_item; ///
private alias c_g_menu_insert_sectionFn = extern(C) void function(GMenu* menu, int position, const(char)* label, GMenuModel* section) nothrow;
__gshared c_g_menu_insert_sectionFn c_g_menu_insert_section; ///
private alias c_g_menu_insert_submenuFn = extern(C) void function(GMenu* menu, int position, const(char)* label, GMenuModel* submenu) nothrow;
__gshared c_g_menu_insert_submenuFn c_g_menu_insert_submenu; ///
private alias c_g_menu_prependFn = extern(C) void function(GMenu* menu, const(char)* label, const(char)* detailedAction) nothrow;
__gshared c_g_menu_prependFn c_g_menu_prepend; ///
private alias c_g_menu_prepend_itemFn = extern(C) void function(GMenu* menu, GMenuItem* item) nothrow;
__gshared c_g_menu_prepend_itemFn c_g_menu_prepend_item; ///
private alias c_g_menu_prepend_sectionFn = extern(C) void function(GMenu* menu, const(char)* label, GMenuModel* section) nothrow;
__gshared c_g_menu_prepend_sectionFn c_g_menu_prepend_section; ///
private alias c_g_menu_prepend_submenuFn = extern(C) void function(GMenu* menu, const(char)* label, GMenuModel* submenu) nothrow;
__gshared c_g_menu_prepend_submenuFn c_g_menu_prepend_submenu; ///
private alias c_g_menu_removeFn = extern(C) void function(GMenu* menu, int position) nothrow;
__gshared c_g_menu_removeFn c_g_menu_remove; ///
private alias c_g_menu_remove_allFn = extern(C) void function(GMenu* menu) nothrow;
__gshared c_g_menu_remove_allFn c_g_menu_remove_all; ///

// MenuAttributeIter
private alias c_g_menu_attribute_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_menu_attribute_iter_get_typeFn c_g_menu_attribute_iter_get_type; ///
private alias c_g_menu_attribute_iter_get_nameFn = extern(C) const(char)* function(GMenuAttributeIter* iter) nothrow;
__gshared c_g_menu_attribute_iter_get_nameFn c_g_menu_attribute_iter_get_name; ///
private alias c_g_menu_attribute_iter_get_nextFn = extern(C) gboolean function(GMenuAttributeIter* iter, const(char*)* outName, GVariant** value) nothrow;
__gshared c_g_menu_attribute_iter_get_nextFn c_g_menu_attribute_iter_get_next; ///
private alias c_g_menu_attribute_iter_get_valueFn = extern(C) GVariant* function(GMenuAttributeIter* iter) nothrow;
__gshared c_g_menu_attribute_iter_get_valueFn c_g_menu_attribute_iter_get_value; ///
private alias c_g_menu_attribute_iter_nextFn = extern(C) gboolean function(GMenuAttributeIter* iter) nothrow;
__gshared c_g_menu_attribute_iter_nextFn c_g_menu_attribute_iter_next; ///

// MenuItem
private alias c_g_menu_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_menu_item_get_typeFn c_g_menu_item_get_type; ///
private alias c_g_menu_item_newFn = extern(C) GMenuItem* function(const(char)* label, const(char)* detailedAction) nothrow;
__gshared c_g_menu_item_newFn c_g_menu_item_new; ///
private alias c_g_menu_item_new_from_modelFn = extern(C) GMenuItem* function(GMenuModel* model, int itemIndex) nothrow;
__gshared c_g_menu_item_new_from_modelFn c_g_menu_item_new_from_model; ///
private alias c_g_menu_item_new_sectionFn = extern(C) GMenuItem* function(const(char)* label, GMenuModel* section) nothrow;
__gshared c_g_menu_item_new_sectionFn c_g_menu_item_new_section; ///
private alias c_g_menu_item_new_submenuFn = extern(C) GMenuItem* function(const(char)* label, GMenuModel* submenu) nothrow;
__gshared c_g_menu_item_new_submenuFn c_g_menu_item_new_submenu; ///
private alias c_g_menu_item_get_attributeFn = extern(C) gboolean function(GMenuItem* menuItem, const(char)* attribute, const(char)* formatString,  ...) nothrow;
__gshared c_g_menu_item_get_attributeFn c_g_menu_item_get_attribute; ///
private alias c_g_menu_item_get_attribute_valueFn = extern(C) GVariant* function(GMenuItem* menuItem, const(char)* attribute, const(GVariantType)* expectedType) nothrow;
__gshared c_g_menu_item_get_attribute_valueFn c_g_menu_item_get_attribute_value; ///
private alias c_g_menu_item_get_linkFn = extern(C) GMenuModel* function(GMenuItem* menuItem, const(char)* link) nothrow;
__gshared c_g_menu_item_get_linkFn c_g_menu_item_get_link; ///
private alias c_g_menu_item_set_action_and_targetFn = extern(C) void function(GMenuItem* menuItem, const(char)* action, const(char)* formatString,  ...) nothrow;
__gshared c_g_menu_item_set_action_and_targetFn c_g_menu_item_set_action_and_target; ///
private alias c_g_menu_item_set_action_and_target_valueFn = extern(C) void function(GMenuItem* menuItem, const(char)* action, GVariant* targetValue) nothrow;
__gshared c_g_menu_item_set_action_and_target_valueFn c_g_menu_item_set_action_and_target_value; ///
private alias c_g_menu_item_set_attributeFn = extern(C) void function(GMenuItem* menuItem, const(char)* attribute, const(char)* formatString,  ...) nothrow;
__gshared c_g_menu_item_set_attributeFn c_g_menu_item_set_attribute; ///
private alias c_g_menu_item_set_attribute_valueFn = extern(C) void function(GMenuItem* menuItem, const(char)* attribute, GVariant* value) nothrow;
__gshared c_g_menu_item_set_attribute_valueFn c_g_menu_item_set_attribute_value; ///
private alias c_g_menu_item_set_detailed_actionFn = extern(C) void function(GMenuItem* menuItem, const(char)* detailedAction) nothrow;
__gshared c_g_menu_item_set_detailed_actionFn c_g_menu_item_set_detailed_action; ///
private alias c_g_menu_item_set_iconFn = extern(C) void function(GMenuItem* menuItem, GIcon* icon) nothrow;
__gshared c_g_menu_item_set_iconFn c_g_menu_item_set_icon; ///
private alias c_g_menu_item_set_labelFn = extern(C) void function(GMenuItem* menuItem, const(char)* label) nothrow;
__gshared c_g_menu_item_set_labelFn c_g_menu_item_set_label; ///
private alias c_g_menu_item_set_linkFn = extern(C) void function(GMenuItem* menuItem, const(char)* link, GMenuModel* model) nothrow;
__gshared c_g_menu_item_set_linkFn c_g_menu_item_set_link; ///
private alias c_g_menu_item_set_sectionFn = extern(C) void function(GMenuItem* menuItem, GMenuModel* section) nothrow;
__gshared c_g_menu_item_set_sectionFn c_g_menu_item_set_section; ///
private alias c_g_menu_item_set_submenuFn = extern(C) void function(GMenuItem* menuItem, GMenuModel* submenu) nothrow;
__gshared c_g_menu_item_set_submenuFn c_g_menu_item_set_submenu; ///

// MenuLinkIter
private alias c_g_menu_link_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_menu_link_iter_get_typeFn c_g_menu_link_iter_get_type; ///
private alias c_g_menu_link_iter_get_nameFn = extern(C) const(char)* function(GMenuLinkIter* iter) nothrow;
__gshared c_g_menu_link_iter_get_nameFn c_g_menu_link_iter_get_name; ///
private alias c_g_menu_link_iter_get_nextFn = extern(C) gboolean function(GMenuLinkIter* iter, const(char*)* outLink, GMenuModel** value) nothrow;
__gshared c_g_menu_link_iter_get_nextFn c_g_menu_link_iter_get_next; ///
private alias c_g_menu_link_iter_get_valueFn = extern(C) GMenuModel* function(GMenuLinkIter* iter) nothrow;
__gshared c_g_menu_link_iter_get_valueFn c_g_menu_link_iter_get_value; ///
private alias c_g_menu_link_iter_nextFn = extern(C) gboolean function(GMenuLinkIter* iter) nothrow;
__gshared c_g_menu_link_iter_nextFn c_g_menu_link_iter_next; ///

// MenuModel
private alias c_g_menu_model_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_menu_model_get_typeFn c_g_menu_model_get_type; ///
private alias c_g_menu_model_get_item_attributeFn = extern(C) gboolean function(GMenuModel* model, int itemIndex, const(char)* attribute, const(char)* formatString,  ...) nothrow;
__gshared c_g_menu_model_get_item_attributeFn c_g_menu_model_get_item_attribute; ///
private alias c_g_menu_model_get_item_attribute_valueFn = extern(C) GVariant* function(GMenuModel* model, int itemIndex, const(char)* attribute, const(GVariantType)* expectedType) nothrow;
__gshared c_g_menu_model_get_item_attribute_valueFn c_g_menu_model_get_item_attribute_value; ///
private alias c_g_menu_model_get_item_linkFn = extern(C) GMenuModel* function(GMenuModel* model, int itemIndex, const(char)* link) nothrow;
__gshared c_g_menu_model_get_item_linkFn c_g_menu_model_get_item_link; ///
private alias c_g_menu_model_get_n_itemsFn = extern(C) int function(GMenuModel* model) nothrow;
__gshared c_g_menu_model_get_n_itemsFn c_g_menu_model_get_n_items; ///
private alias c_g_menu_model_is_mutableFn = extern(C) gboolean function(GMenuModel* model) nothrow;
__gshared c_g_menu_model_is_mutableFn c_g_menu_model_is_mutable; ///
private alias c_g_menu_model_items_changedFn = extern(C) void function(GMenuModel* model, int position, int removed, int added) nothrow;
__gshared c_g_menu_model_items_changedFn c_g_menu_model_items_changed; ///
private alias c_g_menu_model_iterate_item_attributesFn = extern(C) GMenuAttributeIter* function(GMenuModel* model, int itemIndex) nothrow;
__gshared c_g_menu_model_iterate_item_attributesFn c_g_menu_model_iterate_item_attributes; ///
private alias c_g_menu_model_iterate_item_linksFn = extern(C) GMenuLinkIter* function(GMenuModel* model, int itemIndex) nothrow;
__gshared c_g_menu_model_iterate_item_linksFn c_g_menu_model_iterate_item_links; ///

// Mount
private alias c_g_mount_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mount_get_typeFn c_g_mount_get_type; ///
private alias c_g_mount_can_ejectFn = extern(C) gboolean function(GMount* mount) nothrow;
__gshared c_g_mount_can_ejectFn c_g_mount_can_eject; ///
private alias c_g_mount_can_unmountFn = extern(C) gboolean function(GMount* mount) nothrow;
__gshared c_g_mount_can_unmountFn c_g_mount_can_unmount; ///
private alias c_g_mount_ejectFn = extern(C) void function(GMount* mount, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_mount_ejectFn c_g_mount_eject; ///
private alias c_g_mount_eject_finishFn = extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_mount_eject_finishFn c_g_mount_eject_finish; ///
private alias c_g_mount_eject_with_operationFn = extern(C) void function(GMount* mount, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_mount_eject_with_operationFn c_g_mount_eject_with_operation; ///
private alias c_g_mount_eject_with_operation_finishFn = extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_mount_eject_with_operation_finishFn c_g_mount_eject_with_operation_finish; ///
private alias c_g_mount_get_default_locationFn = extern(C) GFile* function(GMount* mount) nothrow;
__gshared c_g_mount_get_default_locationFn c_g_mount_get_default_location; ///
private alias c_g_mount_get_driveFn = extern(C) GDrive* function(GMount* mount) nothrow;
__gshared c_g_mount_get_driveFn c_g_mount_get_drive; ///
private alias c_g_mount_get_iconFn = extern(C) GIcon* function(GMount* mount) nothrow;
__gshared c_g_mount_get_iconFn c_g_mount_get_icon; ///
private alias c_g_mount_get_nameFn = extern(C) char* function(GMount* mount) nothrow;
__gshared c_g_mount_get_nameFn c_g_mount_get_name; ///
private alias c_g_mount_get_rootFn = extern(C) GFile* function(GMount* mount) nothrow;
__gshared c_g_mount_get_rootFn c_g_mount_get_root; ///
private alias c_g_mount_get_sort_keyFn = extern(C) const(char)* function(GMount* mount) nothrow;
__gshared c_g_mount_get_sort_keyFn c_g_mount_get_sort_key; ///
private alias c_g_mount_get_symbolic_iconFn = extern(C) GIcon* function(GMount* mount) nothrow;
__gshared c_g_mount_get_symbolic_iconFn c_g_mount_get_symbolic_icon; ///
private alias c_g_mount_get_uuidFn = extern(C) char* function(GMount* mount) nothrow;
__gshared c_g_mount_get_uuidFn c_g_mount_get_uuid; ///
private alias c_g_mount_get_volumeFn = extern(C) GVolume* function(GMount* mount) nothrow;
__gshared c_g_mount_get_volumeFn c_g_mount_get_volume; ///
private alias c_g_mount_guess_content_typeFn = extern(C) void function(GMount* mount, gboolean forceRescan, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_mount_guess_content_typeFn c_g_mount_guess_content_type; ///
private alias c_g_mount_guess_content_type_finishFn = extern(C) char** function(GMount* mount, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_mount_guess_content_type_finishFn c_g_mount_guess_content_type_finish; ///
private alias c_g_mount_guess_content_type_syncFn = extern(C) char** function(GMount* mount, gboolean forceRescan, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_mount_guess_content_type_syncFn c_g_mount_guess_content_type_sync; ///
private alias c_g_mount_is_shadowedFn = extern(C) gboolean function(GMount* mount) nothrow;
__gshared c_g_mount_is_shadowedFn c_g_mount_is_shadowed; ///
private alias c_g_mount_remountFn = extern(C) void function(GMount* mount, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_mount_remountFn c_g_mount_remount; ///
private alias c_g_mount_remount_finishFn = extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_mount_remount_finishFn c_g_mount_remount_finish; ///
private alias c_g_mount_shadowFn = extern(C) void function(GMount* mount) nothrow;
__gshared c_g_mount_shadowFn c_g_mount_shadow; ///
private alias c_g_mount_unmountFn = extern(C) void function(GMount* mount, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_mount_unmountFn c_g_mount_unmount; ///
private alias c_g_mount_unmount_finishFn = extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_mount_unmount_finishFn c_g_mount_unmount_finish; ///
private alias c_g_mount_unmount_with_operationFn = extern(C) void function(GMount* mount, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_mount_unmount_with_operationFn c_g_mount_unmount_with_operation; ///
private alias c_g_mount_unmount_with_operation_finishFn = extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_mount_unmount_with_operation_finishFn c_g_mount_unmount_with_operation_finish; ///
private alias c_g_mount_unshadowFn = extern(C) void function(GMount* mount) nothrow;
__gshared c_g_mount_unshadowFn c_g_mount_unshadow; ///

// MountOperation
private alias c_g_mount_operation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mount_operation_get_typeFn c_g_mount_operation_get_type; ///
private alias c_g_mount_operation_newFn = extern(C) GMountOperation* function() nothrow;
__gshared c_g_mount_operation_newFn c_g_mount_operation_new; ///
private alias c_g_mount_operation_get_anonymousFn = extern(C) gboolean function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_anonymousFn c_g_mount_operation_get_anonymous; ///
private alias c_g_mount_operation_get_choiceFn = extern(C) int function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_choiceFn c_g_mount_operation_get_choice; ///
private alias c_g_mount_operation_get_domainFn = extern(C) const(char)* function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_domainFn c_g_mount_operation_get_domain; ///
private alias c_g_mount_operation_get_is_tcrypt_hidden_volumeFn = extern(C) gboolean function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_is_tcrypt_hidden_volumeFn c_g_mount_operation_get_is_tcrypt_hidden_volume; ///
private alias c_g_mount_operation_get_is_tcrypt_system_volumeFn = extern(C) gboolean function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_is_tcrypt_system_volumeFn c_g_mount_operation_get_is_tcrypt_system_volume; ///
private alias c_g_mount_operation_get_passwordFn = extern(C) const(char)* function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_passwordFn c_g_mount_operation_get_password; ///
private alias c_g_mount_operation_get_password_saveFn = extern(C) GPasswordSave function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_password_saveFn c_g_mount_operation_get_password_save; ///
private alias c_g_mount_operation_get_pimFn = extern(C) uint function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_pimFn c_g_mount_operation_get_pim; ///
private alias c_g_mount_operation_get_usernameFn = extern(C) const(char)* function(GMountOperation* op) nothrow;
__gshared c_g_mount_operation_get_usernameFn c_g_mount_operation_get_username; ///
private alias c_g_mount_operation_replyFn = extern(C) void function(GMountOperation* op, GMountOperationResult result) nothrow;
__gshared c_g_mount_operation_replyFn c_g_mount_operation_reply; ///
private alias c_g_mount_operation_set_anonymousFn = extern(C) void function(GMountOperation* op, gboolean anonymous) nothrow;
__gshared c_g_mount_operation_set_anonymousFn c_g_mount_operation_set_anonymous; ///
private alias c_g_mount_operation_set_choiceFn = extern(C) void function(GMountOperation* op, int choice) nothrow;
__gshared c_g_mount_operation_set_choiceFn c_g_mount_operation_set_choice; ///
private alias c_g_mount_operation_set_domainFn = extern(C) void function(GMountOperation* op, const(char)* domain) nothrow;
__gshared c_g_mount_operation_set_domainFn c_g_mount_operation_set_domain; ///
private alias c_g_mount_operation_set_is_tcrypt_hidden_volumeFn = extern(C) void function(GMountOperation* op, gboolean hiddenVolume) nothrow;
__gshared c_g_mount_operation_set_is_tcrypt_hidden_volumeFn c_g_mount_operation_set_is_tcrypt_hidden_volume; ///
private alias c_g_mount_operation_set_is_tcrypt_system_volumeFn = extern(C) void function(GMountOperation* op, gboolean systemVolume) nothrow;
__gshared c_g_mount_operation_set_is_tcrypt_system_volumeFn c_g_mount_operation_set_is_tcrypt_system_volume; ///
private alias c_g_mount_operation_set_passwordFn = extern(C) void function(GMountOperation* op, const(char)* password) nothrow;
__gshared c_g_mount_operation_set_passwordFn c_g_mount_operation_set_password; ///
private alias c_g_mount_operation_set_password_saveFn = extern(C) void function(GMountOperation* op, GPasswordSave save) nothrow;
__gshared c_g_mount_operation_set_password_saveFn c_g_mount_operation_set_password_save; ///
private alias c_g_mount_operation_set_pimFn = extern(C) void function(GMountOperation* op, uint pim) nothrow;
__gshared c_g_mount_operation_set_pimFn c_g_mount_operation_set_pim; ///
private alias c_g_mount_operation_set_usernameFn = extern(C) void function(GMountOperation* op, const(char)* username) nothrow;
__gshared c_g_mount_operation_set_usernameFn c_g_mount_operation_set_username; ///

// NativeSocketAddress
private alias c_g_native_socket_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_native_socket_address_get_typeFn c_g_native_socket_address_get_type; ///
private alias c_g_native_socket_address_newFn = extern(C) GSocketAddress* function(void* native, size_t len) nothrow;
__gshared c_g_native_socket_address_newFn c_g_native_socket_address_new; ///

// NativeVolumeMonitor
private alias c_g_native_volume_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_native_volume_monitor_get_typeFn c_g_native_volume_monitor_get_type; ///

// NetworkAddress
private alias c_g_network_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_network_address_get_typeFn c_g_network_address_get_type; ///
private alias c_g_network_address_newFn = extern(C) GSocketConnectable* function(const(char)* hostname, ushort port) nothrow;
__gshared c_g_network_address_newFn c_g_network_address_new; ///
private alias c_g_network_address_new_loopbackFn = extern(C) GSocketConnectable* function(ushort port) nothrow;
__gshared c_g_network_address_new_loopbackFn c_g_network_address_new_loopback; ///
private alias c_g_network_address_parseFn = extern(C) GSocketConnectable* function(const(char)* hostAndPort, ushort defaultPort, GError** _err) nothrow;
__gshared c_g_network_address_parseFn c_g_network_address_parse; ///
private alias c_g_network_address_parse_uriFn = extern(C) GSocketConnectable* function(const(char)* uri, ushort defaultPort, GError** _err) nothrow;
__gshared c_g_network_address_parse_uriFn c_g_network_address_parse_uri; ///
private alias c_g_network_address_get_hostnameFn = extern(C) const(char)* function(GNetworkAddress* addr) nothrow;
__gshared c_g_network_address_get_hostnameFn c_g_network_address_get_hostname; ///
private alias c_g_network_address_get_portFn = extern(C) ushort function(GNetworkAddress* addr) nothrow;
__gshared c_g_network_address_get_portFn c_g_network_address_get_port; ///
private alias c_g_network_address_get_schemeFn = extern(C) const(char)* function(GNetworkAddress* addr) nothrow;
__gshared c_g_network_address_get_schemeFn c_g_network_address_get_scheme; ///

// NetworkMonitor
private alias c_g_network_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_network_monitor_get_typeFn c_g_network_monitor_get_type; ///
private alias c_g_network_monitor_get_defaultFn = extern(C) GNetworkMonitor* function() nothrow;
__gshared c_g_network_monitor_get_defaultFn c_g_network_monitor_get_default; ///
private alias c_g_network_monitor_can_reachFn = extern(C) gboolean function(GNetworkMonitor* monitor, GSocketConnectable* connectable, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_network_monitor_can_reachFn c_g_network_monitor_can_reach; ///
private alias c_g_network_monitor_can_reach_asyncFn = extern(C) void function(GNetworkMonitor* monitor, GSocketConnectable* connectable, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_network_monitor_can_reach_asyncFn c_g_network_monitor_can_reach_async; ///
private alias c_g_network_monitor_can_reach_finishFn = extern(C) gboolean function(GNetworkMonitor* monitor, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_network_monitor_can_reach_finishFn c_g_network_monitor_can_reach_finish; ///
private alias c_g_network_monitor_get_connectivityFn = extern(C) GNetworkConnectivity function(GNetworkMonitor* monitor) nothrow;
__gshared c_g_network_monitor_get_connectivityFn c_g_network_monitor_get_connectivity; ///
private alias c_g_network_monitor_get_network_availableFn = extern(C) gboolean function(GNetworkMonitor* monitor) nothrow;
__gshared c_g_network_monitor_get_network_availableFn c_g_network_monitor_get_network_available; ///
private alias c_g_network_monitor_get_network_meteredFn = extern(C) gboolean function(GNetworkMonitor* monitor) nothrow;
__gshared c_g_network_monitor_get_network_meteredFn c_g_network_monitor_get_network_metered; ///

// NetworkService
private alias c_g_network_service_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_network_service_get_typeFn c_g_network_service_get_type; ///
private alias c_g_network_service_newFn = extern(C) GSocketConnectable* function(const(char)* service, const(char)* protocol, const(char)* domain) nothrow;
__gshared c_g_network_service_newFn c_g_network_service_new; ///
private alias c_g_network_service_get_domainFn = extern(C) const(char)* function(GNetworkService* srv) nothrow;
__gshared c_g_network_service_get_domainFn c_g_network_service_get_domain; ///
private alias c_g_network_service_get_protocolFn = extern(C) const(char)* function(GNetworkService* srv) nothrow;
__gshared c_g_network_service_get_protocolFn c_g_network_service_get_protocol; ///
private alias c_g_network_service_get_schemeFn = extern(C) const(char)* function(GNetworkService* srv) nothrow;
__gshared c_g_network_service_get_schemeFn c_g_network_service_get_scheme; ///
private alias c_g_network_service_get_serviceFn = extern(C) const(char)* function(GNetworkService* srv) nothrow;
__gshared c_g_network_service_get_serviceFn c_g_network_service_get_service; ///
private alias c_g_network_service_set_schemeFn = extern(C) void function(GNetworkService* srv, const(char)* scheme) nothrow;
__gshared c_g_network_service_set_schemeFn c_g_network_service_set_scheme; ///

// Notification
private alias c_g_notification_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_notification_get_typeFn c_g_notification_get_type; ///
private alias c_g_notification_newFn = extern(C) GNotification* function(const(char)* title) nothrow;
__gshared c_g_notification_newFn c_g_notification_new; ///
private alias c_g_notification_add_buttonFn = extern(C) void function(GNotification* notification, const(char)* label, const(char)* detailedAction) nothrow;
__gshared c_g_notification_add_buttonFn c_g_notification_add_button; ///
private alias c_g_notification_add_button_with_targetFn = extern(C) void function(GNotification* notification, const(char)* label, const(char)* action, const(char)* targetFormat,  ...) nothrow;
__gshared c_g_notification_add_button_with_targetFn c_g_notification_add_button_with_target; ///
private alias c_g_notification_add_button_with_target_valueFn = extern(C) void function(GNotification* notification, const(char)* label, const(char)* action, GVariant* target) nothrow;
__gshared c_g_notification_add_button_with_target_valueFn c_g_notification_add_button_with_target_value; ///
private alias c_g_notification_set_bodyFn = extern(C) void function(GNotification* notification, const(char)* body_) nothrow;
__gshared c_g_notification_set_bodyFn c_g_notification_set_body; ///
private alias c_g_notification_set_categoryFn = extern(C) void function(GNotification* notification, const(char)* category) nothrow;
__gshared c_g_notification_set_categoryFn c_g_notification_set_category; ///
private alias c_g_notification_set_default_actionFn = extern(C) void function(GNotification* notification, const(char)* detailedAction) nothrow;
__gshared c_g_notification_set_default_actionFn c_g_notification_set_default_action; ///
private alias c_g_notification_set_default_action_and_targetFn = extern(C) void function(GNotification* notification, const(char)* action, const(char)* targetFormat,  ...) nothrow;
__gshared c_g_notification_set_default_action_and_targetFn c_g_notification_set_default_action_and_target; ///
private alias c_g_notification_set_default_action_and_target_valueFn = extern(C) void function(GNotification* notification, const(char)* action, GVariant* target) nothrow;
__gshared c_g_notification_set_default_action_and_target_valueFn c_g_notification_set_default_action_and_target_value; ///
private alias c_g_notification_set_iconFn = extern(C) void function(GNotification* notification, GIcon* icon) nothrow;
__gshared c_g_notification_set_iconFn c_g_notification_set_icon; ///
private alias c_g_notification_set_priorityFn = extern(C) void function(GNotification* notification, GNotificationPriority priority) nothrow;
__gshared c_g_notification_set_priorityFn c_g_notification_set_priority; ///
private alias c_g_notification_set_titleFn = extern(C) void function(GNotification* notification, const(char)* title) nothrow;
__gshared c_g_notification_set_titleFn c_g_notification_set_title; ///
private alias c_g_notification_set_urgentFn = extern(C) void function(GNotification* notification, gboolean urgent) nothrow;
__gshared c_g_notification_set_urgentFn c_g_notification_set_urgent; ///

// OutputStream
private alias c_g_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_output_stream_get_typeFn c_g_output_stream_get_type; ///
private alias c_g_output_stream_clear_pendingFn = extern(C) void function(GOutputStream* stream) nothrow;
__gshared c_g_output_stream_clear_pendingFn c_g_output_stream_clear_pending; ///
private alias c_g_output_stream_closeFn = extern(C) gboolean function(GOutputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_closeFn c_g_output_stream_close; ///
private alias c_g_output_stream_close_asyncFn = extern(C) void function(GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_close_asyncFn c_g_output_stream_close_async; ///
private alias c_g_output_stream_close_finishFn = extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_output_stream_close_finishFn c_g_output_stream_close_finish; ///
private alias c_g_output_stream_flushFn = extern(C) gboolean function(GOutputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_flushFn c_g_output_stream_flush; ///
private alias c_g_output_stream_flush_asyncFn = extern(C) void function(GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_flush_asyncFn c_g_output_stream_flush_async; ///
private alias c_g_output_stream_flush_finishFn = extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_output_stream_flush_finishFn c_g_output_stream_flush_finish; ///
private alias c_g_output_stream_has_pendingFn = extern(C) gboolean function(GOutputStream* stream) nothrow;
__gshared c_g_output_stream_has_pendingFn c_g_output_stream_has_pending; ///
private alias c_g_output_stream_is_closedFn = extern(C) gboolean function(GOutputStream* stream) nothrow;
__gshared c_g_output_stream_is_closedFn c_g_output_stream_is_closed; ///
private alias c_g_output_stream_is_closingFn = extern(C) gboolean function(GOutputStream* stream) nothrow;
__gshared c_g_output_stream_is_closingFn c_g_output_stream_is_closing; ///
private alias c_g_output_stream_printfFn = extern(C) gboolean function(GOutputStream* stream, size_t* bytesWritten, GCancellable* cancellable, GError** error, const(char)* format,  ...) nothrow;
__gshared c_g_output_stream_printfFn c_g_output_stream_printf; ///
private alias c_g_output_stream_set_pendingFn = extern(C) gboolean function(GOutputStream* stream, GError** _err) nothrow;
__gshared c_g_output_stream_set_pendingFn c_g_output_stream_set_pending; ///
private alias c_g_output_stream_spliceFn = extern(C) ptrdiff_t function(GOutputStream* stream, GInputStream* source, GOutputStreamSpliceFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_spliceFn c_g_output_stream_splice; ///
private alias c_g_output_stream_splice_asyncFn = extern(C) void function(GOutputStream* stream, GInputStream* source, GOutputStreamSpliceFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_splice_asyncFn c_g_output_stream_splice_async; ///
private alias c_g_output_stream_splice_finishFn = extern(C) ptrdiff_t function(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_output_stream_splice_finishFn c_g_output_stream_splice_finish; ///
private alias c_g_output_stream_vprintfFn = extern(C) gboolean function(GOutputStream* stream, size_t* bytesWritten, GCancellable* cancellable, GError** error, const(char)* format, void* args) nothrow;
__gshared c_g_output_stream_vprintfFn c_g_output_stream_vprintf; ///
private alias c_g_output_stream_writeFn = extern(C) ptrdiff_t function(GOutputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_writeFn c_g_output_stream_write; ///
private alias c_g_output_stream_write_allFn = extern(C) gboolean function(GOutputStream* stream, void* buffer, size_t count, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_write_allFn c_g_output_stream_write_all; ///
private alias c_g_output_stream_write_all_asyncFn = extern(C) void function(GOutputStream* stream, void* buffer, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_write_all_asyncFn c_g_output_stream_write_all_async; ///
private alias c_g_output_stream_write_all_finishFn = extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_output_stream_write_all_finishFn c_g_output_stream_write_all_finish; ///
private alias c_g_output_stream_write_asyncFn = extern(C) void function(GOutputStream* stream, void* buffer, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_write_asyncFn c_g_output_stream_write_async; ///
private alias c_g_output_stream_write_bytesFn = extern(C) ptrdiff_t function(GOutputStream* stream, GBytes* bytes, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_write_bytesFn c_g_output_stream_write_bytes; ///
private alias c_g_output_stream_write_bytes_asyncFn = extern(C) void function(GOutputStream* stream, GBytes* bytes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_write_bytes_asyncFn c_g_output_stream_write_bytes_async; ///
private alias c_g_output_stream_write_bytes_finishFn = extern(C) ptrdiff_t function(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_output_stream_write_bytes_finishFn c_g_output_stream_write_bytes_finish; ///
private alias c_g_output_stream_write_finishFn = extern(C) ptrdiff_t function(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_output_stream_write_finishFn c_g_output_stream_write_finish; ///
private alias c_g_output_stream_writevFn = extern(C) gboolean function(GOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_writevFn c_g_output_stream_writev; ///
private alias c_g_output_stream_writev_allFn = extern(C) gboolean function(GOutputStream* stream, GOutputVector* vectors, size_t nVectors, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_output_stream_writev_allFn c_g_output_stream_writev_all; ///
private alias c_g_output_stream_writev_all_asyncFn = extern(C) void function(GOutputStream* stream, GOutputVector* vectors, size_t nVectors, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_writev_all_asyncFn c_g_output_stream_writev_all_async; ///
private alias c_g_output_stream_writev_all_finishFn = extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_output_stream_writev_all_finishFn c_g_output_stream_writev_all_finish; ///
private alias c_g_output_stream_writev_asyncFn = extern(C) void function(GOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_output_stream_writev_asyncFn c_g_output_stream_writev_async; ///
private alias c_g_output_stream_writev_finishFn = extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_output_stream_writev_finishFn c_g_output_stream_writev_finish; ///

// Permission
private alias c_g_permission_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_permission_get_typeFn c_g_permission_get_type; ///
private alias c_g_permission_acquireFn = extern(C) gboolean function(GPermission* permission, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_permission_acquireFn c_g_permission_acquire; ///
private alias c_g_permission_acquire_asyncFn = extern(C) void function(GPermission* permission, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_permission_acquire_asyncFn c_g_permission_acquire_async; ///
private alias c_g_permission_acquire_finishFn = extern(C) gboolean function(GPermission* permission, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_permission_acquire_finishFn c_g_permission_acquire_finish; ///
private alias c_g_permission_get_allowedFn = extern(C) gboolean function(GPermission* permission) nothrow;
__gshared c_g_permission_get_allowedFn c_g_permission_get_allowed; ///
private alias c_g_permission_get_can_acquireFn = extern(C) gboolean function(GPermission* permission) nothrow;
__gshared c_g_permission_get_can_acquireFn c_g_permission_get_can_acquire; ///
private alias c_g_permission_get_can_releaseFn = extern(C) gboolean function(GPermission* permission) nothrow;
__gshared c_g_permission_get_can_releaseFn c_g_permission_get_can_release; ///
private alias c_g_permission_impl_updateFn = extern(C) void function(GPermission* permission, gboolean allowed, gboolean canAcquire, gboolean canRelease) nothrow;
__gshared c_g_permission_impl_updateFn c_g_permission_impl_update; ///
private alias c_g_permission_releaseFn = extern(C) gboolean function(GPermission* permission, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_permission_releaseFn c_g_permission_release; ///
private alias c_g_permission_release_asyncFn = extern(C) void function(GPermission* permission, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_permission_release_asyncFn c_g_permission_release_async; ///
private alias c_g_permission_release_finishFn = extern(C) gboolean function(GPermission* permission, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_permission_release_finishFn c_g_permission_release_finish; ///

// PollableInputStream
private alias c_g_pollable_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_pollable_input_stream_get_typeFn c_g_pollable_input_stream_get_type; ///
private alias c_g_pollable_input_stream_can_pollFn = extern(C) gboolean function(GPollableInputStream* stream) nothrow;
__gshared c_g_pollable_input_stream_can_pollFn c_g_pollable_input_stream_can_poll; ///
private alias c_g_pollable_input_stream_create_sourceFn = extern(C) GSource* function(GPollableInputStream* stream, GCancellable* cancellable) nothrow;
__gshared c_g_pollable_input_stream_create_sourceFn c_g_pollable_input_stream_create_source; ///
private alias c_g_pollable_input_stream_is_readableFn = extern(C) gboolean function(GPollableInputStream* stream) nothrow;
__gshared c_g_pollable_input_stream_is_readableFn c_g_pollable_input_stream_is_readable; ///
private alias c_g_pollable_input_stream_read_nonblockingFn = extern(C) ptrdiff_t function(GPollableInputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_pollable_input_stream_read_nonblockingFn c_g_pollable_input_stream_read_nonblocking; ///

// PollableOutputStream
private alias c_g_pollable_output_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_pollable_output_stream_get_typeFn c_g_pollable_output_stream_get_type; ///
private alias c_g_pollable_output_stream_can_pollFn = extern(C) gboolean function(GPollableOutputStream* stream) nothrow;
__gshared c_g_pollable_output_stream_can_pollFn c_g_pollable_output_stream_can_poll; ///
private alias c_g_pollable_output_stream_create_sourceFn = extern(C) GSource* function(GPollableOutputStream* stream, GCancellable* cancellable) nothrow;
__gshared c_g_pollable_output_stream_create_sourceFn c_g_pollable_output_stream_create_source; ///
private alias c_g_pollable_output_stream_is_writableFn = extern(C) gboolean function(GPollableOutputStream* stream) nothrow;
__gshared c_g_pollable_output_stream_is_writableFn c_g_pollable_output_stream_is_writable; ///
private alias c_g_pollable_output_stream_write_nonblockingFn = extern(C) ptrdiff_t function(GPollableOutputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_pollable_output_stream_write_nonblockingFn c_g_pollable_output_stream_write_nonblocking; ///
private alias c_g_pollable_output_stream_writev_nonblockingFn = extern(C) GPollableReturn function(GPollableOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_pollable_output_stream_writev_nonblockingFn c_g_pollable_output_stream_writev_nonblocking; ///

// PowerProfileMonitor
private alias c_g_power_profile_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_power_profile_monitor_get_typeFn c_g_power_profile_monitor_get_type; ///
private alias c_g_power_profile_monitor_dup_defaultFn = extern(C) GPowerProfileMonitor* function() nothrow;
__gshared c_g_power_profile_monitor_dup_defaultFn c_g_power_profile_monitor_dup_default; ///
private alias c_g_power_profile_monitor_get_power_saver_enabledFn = extern(C) gboolean function(GPowerProfileMonitor* monitor) nothrow;
__gshared c_g_power_profile_monitor_get_power_saver_enabledFn c_g_power_profile_monitor_get_power_saver_enabled; ///

// PropertyAction
private alias c_g_property_action_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_property_action_get_typeFn c_g_property_action_get_type; ///
private alias c_g_property_action_newFn = extern(C) GPropertyAction* function(const(char)* name, GObject* object, const(char)* propertyName) nothrow;
__gshared c_g_property_action_newFn c_g_property_action_new; ///

// Proxy
private alias c_g_proxy_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_proxy_get_typeFn c_g_proxy_get_type; ///
private alias c_g_proxy_get_default_for_protocolFn = extern(C) GProxy* function(const(char)* protocol) nothrow;
__gshared c_g_proxy_get_default_for_protocolFn c_g_proxy_get_default_for_protocol; ///
private alias c_g_proxy_connectFn = extern(C) GIOStream* function(GProxy* proxy, GIOStream* connection, GProxyAddress* proxyAddress, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_proxy_connectFn c_g_proxy_connect; ///
private alias c_g_proxy_connect_asyncFn = extern(C) void function(GProxy* proxy, GIOStream* connection, GProxyAddress* proxyAddress, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_proxy_connect_asyncFn c_g_proxy_connect_async; ///
private alias c_g_proxy_connect_finishFn = extern(C) GIOStream* function(GProxy* proxy, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_proxy_connect_finishFn c_g_proxy_connect_finish; ///
private alias c_g_proxy_supports_hostnameFn = extern(C) gboolean function(GProxy* proxy) nothrow;
__gshared c_g_proxy_supports_hostnameFn c_g_proxy_supports_hostname; ///

// ProxyAddress
private alias c_g_proxy_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_proxy_address_get_typeFn c_g_proxy_address_get_type; ///
private alias c_g_proxy_address_newFn = extern(C) GSocketAddress* function(GInetAddress* inetaddr, ushort port, const(char)* protocol, const(char)* destHostname, ushort destPort, const(char)* username, const(char)* password) nothrow;
__gshared c_g_proxy_address_newFn c_g_proxy_address_new; ///
private alias c_g_proxy_address_get_destination_hostnameFn = extern(C) const(char)* function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_destination_hostnameFn c_g_proxy_address_get_destination_hostname; ///
private alias c_g_proxy_address_get_destination_portFn = extern(C) ushort function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_destination_portFn c_g_proxy_address_get_destination_port; ///
private alias c_g_proxy_address_get_destination_protocolFn = extern(C) const(char)* function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_destination_protocolFn c_g_proxy_address_get_destination_protocol; ///
private alias c_g_proxy_address_get_passwordFn = extern(C) const(char)* function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_passwordFn c_g_proxy_address_get_password; ///
private alias c_g_proxy_address_get_protocolFn = extern(C) const(char)* function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_protocolFn c_g_proxy_address_get_protocol; ///
private alias c_g_proxy_address_get_uriFn = extern(C) const(char)* function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_uriFn c_g_proxy_address_get_uri; ///
private alias c_g_proxy_address_get_usernameFn = extern(C) const(char)* function(GProxyAddress* proxy) nothrow;
__gshared c_g_proxy_address_get_usernameFn c_g_proxy_address_get_username; ///

// ProxyAddressEnumerator
private alias c_g_proxy_address_enumerator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_proxy_address_enumerator_get_typeFn c_g_proxy_address_enumerator_get_type; ///

// ProxyResolver
private alias c_g_proxy_resolver_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_proxy_resolver_get_typeFn c_g_proxy_resolver_get_type; ///
private alias c_g_proxy_resolver_get_defaultFn = extern(C) GProxyResolver* function() nothrow;
__gshared c_g_proxy_resolver_get_defaultFn c_g_proxy_resolver_get_default; ///
private alias c_g_proxy_resolver_is_supportedFn = extern(C) gboolean function(GProxyResolver* resolver) nothrow;
__gshared c_g_proxy_resolver_is_supportedFn c_g_proxy_resolver_is_supported; ///
private alias c_g_proxy_resolver_lookupFn = extern(C) char** function(GProxyResolver* resolver, const(char)* uri, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_proxy_resolver_lookupFn c_g_proxy_resolver_lookup; ///
private alias c_g_proxy_resolver_lookup_asyncFn = extern(C) void function(GProxyResolver* resolver, const(char)* uri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_proxy_resolver_lookup_asyncFn c_g_proxy_resolver_lookup_async; ///
private alias c_g_proxy_resolver_lookup_finishFn = extern(C) char** function(GProxyResolver* resolver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_proxy_resolver_lookup_finishFn c_g_proxy_resolver_lookup_finish; ///

// RemoteActionGroup
private alias c_g_remote_action_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_remote_action_group_get_typeFn c_g_remote_action_group_get_type; ///
private alias c_g_remote_action_group_activate_action_fullFn = extern(C) void function(GRemoteActionGroup* remote, const(char)* actionName, GVariant* parameter, GVariant* platformData) nothrow;
__gshared c_g_remote_action_group_activate_action_fullFn c_g_remote_action_group_activate_action_full; ///
private alias c_g_remote_action_group_change_action_state_fullFn = extern(C) void function(GRemoteActionGroup* remote, const(char)* actionName, GVariant* value, GVariant* platformData) nothrow;
__gshared c_g_remote_action_group_change_action_state_fullFn c_g_remote_action_group_change_action_state_full; ///

// Resolver
private alias c_g_resolver_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_resolver_get_typeFn c_g_resolver_get_type; ///
private alias c_g_resolver_free_addressesFn = extern(C) void function(GList* addresses) nothrow;
__gshared c_g_resolver_free_addressesFn c_g_resolver_free_addresses; ///
private alias c_g_resolver_free_targetsFn = extern(C) void function(GList* targets) nothrow;
__gshared c_g_resolver_free_targetsFn c_g_resolver_free_targets; ///
private alias c_g_resolver_get_defaultFn = extern(C) GResolver* function() nothrow;
__gshared c_g_resolver_get_defaultFn c_g_resolver_get_default; ///
private alias c_g_resolver_get_timeoutFn = extern(C) uint function(GResolver* resolver) nothrow;
__gshared c_g_resolver_get_timeoutFn c_g_resolver_get_timeout; ///
private alias c_g_resolver_lookup_by_addressFn = extern(C) char* function(GResolver* resolver, GInetAddress* address, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_resolver_lookup_by_addressFn c_g_resolver_lookup_by_address; ///
private alias c_g_resolver_lookup_by_address_asyncFn = extern(C) void function(GResolver* resolver, GInetAddress* address, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_resolver_lookup_by_address_asyncFn c_g_resolver_lookup_by_address_async; ///
private alias c_g_resolver_lookup_by_address_finishFn = extern(C) char* function(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_resolver_lookup_by_address_finishFn c_g_resolver_lookup_by_address_finish; ///
private alias c_g_resolver_lookup_by_nameFn = extern(C) GList* function(GResolver* resolver, const(char)* hostname, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_resolver_lookup_by_nameFn c_g_resolver_lookup_by_name; ///
private alias c_g_resolver_lookup_by_name_asyncFn = extern(C) void function(GResolver* resolver, const(char)* hostname, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_resolver_lookup_by_name_asyncFn c_g_resolver_lookup_by_name_async; ///
private alias c_g_resolver_lookup_by_name_finishFn = extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_resolver_lookup_by_name_finishFn c_g_resolver_lookup_by_name_finish; ///
private alias c_g_resolver_lookup_by_name_with_flagsFn = extern(C) GList* function(GResolver* resolver, const(char)* hostname, GResolverNameLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_resolver_lookup_by_name_with_flagsFn c_g_resolver_lookup_by_name_with_flags; ///
private alias c_g_resolver_lookup_by_name_with_flags_asyncFn = extern(C) void function(GResolver* resolver, const(char)* hostname, GResolverNameLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_resolver_lookup_by_name_with_flags_asyncFn c_g_resolver_lookup_by_name_with_flags_async; ///
private alias c_g_resolver_lookup_by_name_with_flags_finishFn = extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_resolver_lookup_by_name_with_flags_finishFn c_g_resolver_lookup_by_name_with_flags_finish; ///
private alias c_g_resolver_lookup_recordsFn = extern(C) GList* function(GResolver* resolver, const(char)* rrname, GResolverRecordType recordType, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_resolver_lookup_recordsFn c_g_resolver_lookup_records; ///
private alias c_g_resolver_lookup_records_asyncFn = extern(C) void function(GResolver* resolver, const(char)* rrname, GResolverRecordType recordType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_resolver_lookup_records_asyncFn c_g_resolver_lookup_records_async; ///
private alias c_g_resolver_lookup_records_finishFn = extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_resolver_lookup_records_finishFn c_g_resolver_lookup_records_finish; ///
private alias c_g_resolver_lookup_serviceFn = extern(C) GList* function(GResolver* resolver, const(char)* service, const(char)* protocol, const(char)* domain, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_resolver_lookup_serviceFn c_g_resolver_lookup_service; ///
private alias c_g_resolver_lookup_service_asyncFn = extern(C) void function(GResolver* resolver, const(char)* service, const(char)* protocol, const(char)* domain, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_resolver_lookup_service_asyncFn c_g_resolver_lookup_service_async; ///
private alias c_g_resolver_lookup_service_finishFn = extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_resolver_lookup_service_finishFn c_g_resolver_lookup_service_finish; ///
private alias c_g_resolver_set_defaultFn = extern(C) void function(GResolver* resolver) nothrow;
__gshared c_g_resolver_set_defaultFn c_g_resolver_set_default; ///
private alias c_g_resolver_set_timeoutFn = extern(C) void function(GResolver* resolver, uint timeoutMs) nothrow;
__gshared c_g_resolver_set_timeoutFn c_g_resolver_set_timeout; ///

// Resource
private alias c_g_resource_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_resource_get_typeFn c_g_resource_get_type; ///
private alias c_g_resource_new_from_dataFn = extern(C) GResource* function(GBytes* data, GError** _err) nothrow;
__gshared c_g_resource_new_from_dataFn c_g_resource_new_from_data; ///
private alias c_g_resource_enumerate_childrenFn = extern(C) char** function(GResource* resource, const(char)* path, GResourceLookupFlags lookupFlags, GError** _err) nothrow;
__gshared c_g_resource_enumerate_childrenFn c_g_resource_enumerate_children; ///
private alias c_g_resource_get_infoFn = extern(C) gboolean function(GResource* resource, const(char)* path, GResourceLookupFlags lookupFlags, size_t* size, uint* flags, GError** _err) nothrow;
__gshared c_g_resource_get_infoFn c_g_resource_get_info; ///
private alias c_g_resource_has_childrenFn = extern(C) gboolean function(GResource* resource, const(char)* path) nothrow;
__gshared c_g_resource_has_childrenFn c_g_resource_has_children; ///
private alias c_g_resource_lookup_dataFn = extern(C) GBytes* function(GResource* resource, const(char)* path, GResourceLookupFlags lookupFlags, GError** _err) nothrow;
__gshared c_g_resource_lookup_dataFn c_g_resource_lookup_data; ///
private alias c_g_resource_open_streamFn = extern(C) GInputStream* function(GResource* resource, const(char)* path, GResourceLookupFlags lookupFlags, GError** _err) nothrow;
__gshared c_g_resource_open_streamFn c_g_resource_open_stream; ///
private alias c_g_resource_refFn = extern(C) GResource* function(GResource* resource) nothrow;
__gshared c_g_resource_refFn c_g_resource_ref; ///
private alias c_g_resource_unrefFn = extern(C) void function(GResource* resource) nothrow;
__gshared c_g_resource_unrefFn c_g_resource_unref; ///
private alias c_g_resource_loadFn = extern(C) GResource* function(const(char)* filename, GError** _err) nothrow;
__gshared c_g_resource_loadFn c_g_resource_load; ///

// Seekable
private alias c_g_seekable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_seekable_get_typeFn c_g_seekable_get_type; ///
private alias c_g_seekable_can_seekFn = extern(C) gboolean function(GSeekable* seekable) nothrow;
__gshared c_g_seekable_can_seekFn c_g_seekable_can_seek; ///
private alias c_g_seekable_can_truncateFn = extern(C) gboolean function(GSeekable* seekable) nothrow;
__gshared c_g_seekable_can_truncateFn c_g_seekable_can_truncate; ///
private alias c_g_seekable_seekFn = extern(C) gboolean function(GSeekable* seekable, long offset, GSeekType type, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_seekable_seekFn c_g_seekable_seek; ///
private alias c_g_seekable_tellFn = extern(C) long function(GSeekable* seekable) nothrow;
__gshared c_g_seekable_tellFn c_g_seekable_tell; ///
private alias c_g_seekable_truncateFn = extern(C) gboolean function(GSeekable* seekable, long offset, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_seekable_truncateFn c_g_seekable_truncate; ///

// Settings
private alias c_g_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_settings_get_typeFn c_g_settings_get_type; ///
private alias c_g_settings_newFn = extern(C) GSettings* function(const(char)* schemaId) nothrow;
__gshared c_g_settings_newFn c_g_settings_new; ///
private alias c_g_settings_new_fullFn = extern(C) GSettings* function(GSettingsSchema* schema, GSettingsBackend* backend, const(char)* path) nothrow;
__gshared c_g_settings_new_fullFn c_g_settings_new_full; ///
private alias c_g_settings_new_with_backendFn = extern(C) GSettings* function(const(char)* schemaId, GSettingsBackend* backend) nothrow;
__gshared c_g_settings_new_with_backendFn c_g_settings_new_with_backend; ///
private alias c_g_settings_new_with_backend_and_pathFn = extern(C) GSettings* function(const(char)* schemaId, GSettingsBackend* backend, const(char)* path) nothrow;
__gshared c_g_settings_new_with_backend_and_pathFn c_g_settings_new_with_backend_and_path; ///
private alias c_g_settings_new_with_pathFn = extern(C) GSettings* function(const(char)* schemaId, const(char)* path) nothrow;
__gshared c_g_settings_new_with_pathFn c_g_settings_new_with_path; ///
private alias c_g_settings_list_relocatable_schemasFn = extern(C) const(char*)* function() nothrow;
__gshared c_g_settings_list_relocatable_schemasFn c_g_settings_list_relocatable_schemas; ///
private alias c_g_settings_list_schemasFn = extern(C) const(char*)* function() nothrow;
__gshared c_g_settings_list_schemasFn c_g_settings_list_schemas; ///
private alias c_g_settings_syncFn = extern(C) void function() nothrow;
__gshared c_g_settings_syncFn c_g_settings_sync; ///
private alias c_g_settings_unbindFn = extern(C) void function(GObject* object, const(char)* property) nothrow;
__gshared c_g_settings_unbindFn c_g_settings_unbind; ///
private alias c_g_settings_applyFn = extern(C) void function(GSettings* settings) nothrow;
__gshared c_g_settings_applyFn c_g_settings_apply; ///
private alias c_g_settings_bindFn = extern(C) void function(GSettings* settings, const(char)* key, GObject* object, const(char)* property, GSettingsBindFlags flags) nothrow;
__gshared c_g_settings_bindFn c_g_settings_bind; ///
private alias c_g_settings_bind_with_mappingFn = extern(C) void function(GSettings* settings, const(char)* key, GObject* object, const(char)* property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_g_settings_bind_with_mappingFn c_g_settings_bind_with_mapping; ///
private alias c_g_settings_bind_with_mapping_closuresFn = extern(C) void function(GSettings* settings, const(char)* key, GObject* object, const(char)* property, GSettingsBindFlags flags, GClosure* getMapping, GClosure* setMapping) nothrow;
__gshared c_g_settings_bind_with_mapping_closuresFn c_g_settings_bind_with_mapping_closures; ///
private alias c_g_settings_bind_writableFn = extern(C) void function(GSettings* settings, const(char)* key, GObject* object, const(char)* property, gboolean inverted) nothrow;
__gshared c_g_settings_bind_writableFn c_g_settings_bind_writable; ///
private alias c_g_settings_create_actionFn = extern(C) GAction* function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_create_actionFn c_g_settings_create_action; ///
private alias c_g_settings_delayFn = extern(C) void function(GSettings* settings) nothrow;
__gshared c_g_settings_delayFn c_g_settings_delay; ///
private alias c_g_settings_getFn = extern(C) void function(GSettings* settings, const(char)* key, const(char)* format,  ...) nothrow;
__gshared c_g_settings_getFn c_g_settings_get; ///
private alias c_g_settings_get_booleanFn = extern(C) gboolean function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_booleanFn c_g_settings_get_boolean; ///
private alias c_g_settings_get_childFn = extern(C) GSettings* function(GSettings* settings, const(char)* name) nothrow;
__gshared c_g_settings_get_childFn c_g_settings_get_child; ///
private alias c_g_settings_get_default_valueFn = extern(C) GVariant* function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_default_valueFn c_g_settings_get_default_value; ///
private alias c_g_settings_get_doubleFn = extern(C) double function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_doubleFn c_g_settings_get_double; ///
private alias c_g_settings_get_enumFn = extern(C) int function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_enumFn c_g_settings_get_enum; ///
private alias c_g_settings_get_flagsFn = extern(C) uint function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_flagsFn c_g_settings_get_flags; ///
private alias c_g_settings_get_has_unappliedFn = extern(C) gboolean function(GSettings* settings) nothrow;
__gshared c_g_settings_get_has_unappliedFn c_g_settings_get_has_unapplied; ///
private alias c_g_settings_get_intFn = extern(C) int function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_intFn c_g_settings_get_int; ///
private alias c_g_settings_get_int64Fn = extern(C) long function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_int64Fn c_g_settings_get_int64; ///
private alias c_g_settings_get_mappedFn = extern(C) void* function(GSettings* settings, const(char)* key, GSettingsGetMapping mapping, void* userData) nothrow;
__gshared c_g_settings_get_mappedFn c_g_settings_get_mapped; ///
private alias c_g_settings_get_rangeFn = extern(C) GVariant* function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_rangeFn c_g_settings_get_range; ///
private alias c_g_settings_get_stringFn = extern(C) char* function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_stringFn c_g_settings_get_string; ///
private alias c_g_settings_get_strvFn = extern(C) char** function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_strvFn c_g_settings_get_strv; ///
private alias c_g_settings_get_uintFn = extern(C) uint function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_uintFn c_g_settings_get_uint; ///
private alias c_g_settings_get_uint64Fn = extern(C) ulong function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_uint64Fn c_g_settings_get_uint64; ///
private alias c_g_settings_get_user_valueFn = extern(C) GVariant* function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_user_valueFn c_g_settings_get_user_value; ///
private alias c_g_settings_get_valueFn = extern(C) GVariant* function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_get_valueFn c_g_settings_get_value; ///
private alias c_g_settings_is_writableFn = extern(C) gboolean function(GSettings* settings, const(char)* name) nothrow;
__gshared c_g_settings_is_writableFn c_g_settings_is_writable; ///
private alias c_g_settings_list_childrenFn = extern(C) char** function(GSettings* settings) nothrow;
__gshared c_g_settings_list_childrenFn c_g_settings_list_children; ///
private alias c_g_settings_list_keysFn = extern(C) char** function(GSettings* settings) nothrow;
__gshared c_g_settings_list_keysFn c_g_settings_list_keys; ///
private alias c_g_settings_range_checkFn = extern(C) gboolean function(GSettings* settings, const(char)* key, GVariant* value) nothrow;
__gshared c_g_settings_range_checkFn c_g_settings_range_check; ///
private alias c_g_settings_resetFn = extern(C) void function(GSettings* settings, const(char)* key) nothrow;
__gshared c_g_settings_resetFn c_g_settings_reset; ///
private alias c_g_settings_revertFn = extern(C) void function(GSettings* settings) nothrow;
__gshared c_g_settings_revertFn c_g_settings_revert; ///
private alias c_g_settings_setFn = extern(C) gboolean function(GSettings* settings, const(char)* key, const(char)* format,  ...) nothrow;
__gshared c_g_settings_setFn c_g_settings_set; ///
private alias c_g_settings_set_booleanFn = extern(C) gboolean function(GSettings* settings, const(char)* key, gboolean value) nothrow;
__gshared c_g_settings_set_booleanFn c_g_settings_set_boolean; ///
private alias c_g_settings_set_doubleFn = extern(C) gboolean function(GSettings* settings, const(char)* key, double value) nothrow;
__gshared c_g_settings_set_doubleFn c_g_settings_set_double; ///
private alias c_g_settings_set_enumFn = extern(C) gboolean function(GSettings* settings, const(char)* key, int value) nothrow;
__gshared c_g_settings_set_enumFn c_g_settings_set_enum; ///
private alias c_g_settings_set_flagsFn = extern(C) gboolean function(GSettings* settings, const(char)* key, uint value) nothrow;
__gshared c_g_settings_set_flagsFn c_g_settings_set_flags; ///
private alias c_g_settings_set_intFn = extern(C) gboolean function(GSettings* settings, const(char)* key, int value) nothrow;
__gshared c_g_settings_set_intFn c_g_settings_set_int; ///
private alias c_g_settings_set_int64Fn = extern(C) gboolean function(GSettings* settings, const(char)* key, long value) nothrow;
__gshared c_g_settings_set_int64Fn c_g_settings_set_int64; ///
private alias c_g_settings_set_stringFn = extern(C) gboolean function(GSettings* settings, const(char)* key, const(char)* value) nothrow;
__gshared c_g_settings_set_stringFn c_g_settings_set_string; ///
private alias c_g_settings_set_strvFn = extern(C) gboolean function(GSettings* settings, const(char)* key, const(char*)* value) nothrow;
__gshared c_g_settings_set_strvFn c_g_settings_set_strv; ///
private alias c_g_settings_set_uintFn = extern(C) gboolean function(GSettings* settings, const(char)* key, uint value) nothrow;
__gshared c_g_settings_set_uintFn c_g_settings_set_uint; ///
private alias c_g_settings_set_uint64Fn = extern(C) gboolean function(GSettings* settings, const(char)* key, ulong value) nothrow;
__gshared c_g_settings_set_uint64Fn c_g_settings_set_uint64; ///
private alias c_g_settings_set_valueFn = extern(C) gboolean function(GSettings* settings, const(char)* key, GVariant* value) nothrow;
__gshared c_g_settings_set_valueFn c_g_settings_set_value; ///

// SettingsBackend
private alias c_g_settings_backend_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_settings_backend_get_typeFn c_g_settings_backend_get_type; ///
private alias c_g_settings_backend_flatten_treeFn = extern(C) void function(GTree* tree, char** path, const(char**)* keys, GVariant*** values) nothrow;
__gshared c_g_settings_backend_flatten_treeFn c_g_settings_backend_flatten_tree; ///
private alias c_g_settings_backend_get_defaultFn = extern(C) GSettingsBackend* function() nothrow;
__gshared c_g_settings_backend_get_defaultFn c_g_settings_backend_get_default; ///
private alias c_g_settings_backend_changedFn = extern(C) void function(GSettingsBackend* backend, const(char)* key, void* originTag) nothrow;
__gshared c_g_settings_backend_changedFn c_g_settings_backend_changed; ///
private alias c_g_settings_backend_changed_treeFn = extern(C) void function(GSettingsBackend* backend, GTree* tree, void* originTag) nothrow;
__gshared c_g_settings_backend_changed_treeFn c_g_settings_backend_changed_tree; ///
private alias c_g_settings_backend_keys_changedFn = extern(C) void function(GSettingsBackend* backend, const(char)* path, const(char*)* items, void* originTag) nothrow;
__gshared c_g_settings_backend_keys_changedFn c_g_settings_backend_keys_changed; ///
private alias c_g_settings_backend_path_changedFn = extern(C) void function(GSettingsBackend* backend, const(char)* path, void* originTag) nothrow;
__gshared c_g_settings_backend_path_changedFn c_g_settings_backend_path_changed; ///
private alias c_g_settings_backend_path_writable_changedFn = extern(C) void function(GSettingsBackend* backend, const(char)* path) nothrow;
__gshared c_g_settings_backend_path_writable_changedFn c_g_settings_backend_path_writable_changed; ///
private alias c_g_settings_backend_writable_changedFn = extern(C) void function(GSettingsBackend* backend, const(char)* key) nothrow;
__gshared c_g_settings_backend_writable_changedFn c_g_settings_backend_writable_changed; ///

// SettingsSchema
private alias c_g_settings_schema_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_settings_schema_get_typeFn c_g_settings_schema_get_type; ///
private alias c_g_settings_schema_get_idFn = extern(C) const(char)* function(GSettingsSchema* schema) nothrow;
__gshared c_g_settings_schema_get_idFn c_g_settings_schema_get_id; ///
private alias c_g_settings_schema_get_keyFn = extern(C) GSettingsSchemaKey* function(GSettingsSchema* schema, const(char)* name) nothrow;
__gshared c_g_settings_schema_get_keyFn c_g_settings_schema_get_key; ///
private alias c_g_settings_schema_get_pathFn = extern(C) const(char)* function(GSettingsSchema* schema) nothrow;
__gshared c_g_settings_schema_get_pathFn c_g_settings_schema_get_path; ///
private alias c_g_settings_schema_has_keyFn = extern(C) gboolean function(GSettingsSchema* schema, const(char)* name) nothrow;
__gshared c_g_settings_schema_has_keyFn c_g_settings_schema_has_key; ///
private alias c_g_settings_schema_list_childrenFn = extern(C) char** function(GSettingsSchema* schema) nothrow;
__gshared c_g_settings_schema_list_childrenFn c_g_settings_schema_list_children; ///
private alias c_g_settings_schema_list_keysFn = extern(C) char** function(GSettingsSchema* schema) nothrow;
__gshared c_g_settings_schema_list_keysFn c_g_settings_schema_list_keys; ///
private alias c_g_settings_schema_refFn = extern(C) GSettingsSchema* function(GSettingsSchema* schema) nothrow;
__gshared c_g_settings_schema_refFn c_g_settings_schema_ref; ///
private alias c_g_settings_schema_unrefFn = extern(C) void function(GSettingsSchema* schema) nothrow;
__gshared c_g_settings_schema_unrefFn c_g_settings_schema_unref; ///

// SettingsSchemaKey
private alias c_g_settings_schema_key_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_settings_schema_key_get_typeFn c_g_settings_schema_key_get_type; ///
private alias c_g_settings_schema_key_get_default_valueFn = extern(C) GVariant* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_get_default_valueFn c_g_settings_schema_key_get_default_value; ///
private alias c_g_settings_schema_key_get_descriptionFn = extern(C) const(char)* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_get_descriptionFn c_g_settings_schema_key_get_description; ///
private alias c_g_settings_schema_key_get_nameFn = extern(C) const(char)* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_get_nameFn c_g_settings_schema_key_get_name; ///
private alias c_g_settings_schema_key_get_rangeFn = extern(C) GVariant* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_get_rangeFn c_g_settings_schema_key_get_range; ///
private alias c_g_settings_schema_key_get_summaryFn = extern(C) const(char)* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_get_summaryFn c_g_settings_schema_key_get_summary; ///
private alias c_g_settings_schema_key_get_value_typeFn = extern(C) const(GVariantType)* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_get_value_typeFn c_g_settings_schema_key_get_value_type; ///
private alias c_g_settings_schema_key_range_checkFn = extern(C) gboolean function(GSettingsSchemaKey* key, GVariant* value) nothrow;
__gshared c_g_settings_schema_key_range_checkFn c_g_settings_schema_key_range_check; ///
private alias c_g_settings_schema_key_refFn = extern(C) GSettingsSchemaKey* function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_refFn c_g_settings_schema_key_ref; ///
private alias c_g_settings_schema_key_unrefFn = extern(C) void function(GSettingsSchemaKey* key) nothrow;
__gshared c_g_settings_schema_key_unrefFn c_g_settings_schema_key_unref; ///

// SettingsSchemaSource
private alias c_g_settings_schema_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_settings_schema_source_get_typeFn c_g_settings_schema_source_get_type; ///
private alias c_g_settings_schema_source_new_from_directoryFn = extern(C) GSettingsSchemaSource* function(const(char)* directory, GSettingsSchemaSource* parent, gboolean trusted, GError** _err) nothrow;
__gshared c_g_settings_schema_source_new_from_directoryFn c_g_settings_schema_source_new_from_directory; ///
private alias c_g_settings_schema_source_list_schemasFn = extern(C) void function(GSettingsSchemaSource* source, gboolean recursive, char*** nonRelocatable, char*** relocatable) nothrow;
__gshared c_g_settings_schema_source_list_schemasFn c_g_settings_schema_source_list_schemas; ///
private alias c_g_settings_schema_source_lookupFn = extern(C) GSettingsSchema* function(GSettingsSchemaSource* source, const(char)* schemaId, gboolean recursive) nothrow;
__gshared c_g_settings_schema_source_lookupFn c_g_settings_schema_source_lookup; ///
private alias c_g_settings_schema_source_refFn = extern(C) GSettingsSchemaSource* function(GSettingsSchemaSource* source) nothrow;
__gshared c_g_settings_schema_source_refFn c_g_settings_schema_source_ref; ///
private alias c_g_settings_schema_source_unrefFn = extern(C) void function(GSettingsSchemaSource* source) nothrow;
__gshared c_g_settings_schema_source_unrefFn c_g_settings_schema_source_unref; ///
private alias c_g_settings_schema_source_get_defaultFn = extern(C) GSettingsSchemaSource* function() nothrow;
__gshared c_g_settings_schema_source_get_defaultFn c_g_settings_schema_source_get_default; ///

// SimpleAction
private alias c_g_simple_action_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_simple_action_get_typeFn c_g_simple_action_get_type; ///
private alias c_g_simple_action_newFn = extern(C) GSimpleAction* function(const(char)* name, const(GVariantType)* parameterType) nothrow;
__gshared c_g_simple_action_newFn c_g_simple_action_new; ///
private alias c_g_simple_action_new_statefulFn = extern(C) GSimpleAction* function(const(char)* name, const(GVariantType)* parameterType, GVariant* state) nothrow;
__gshared c_g_simple_action_new_statefulFn c_g_simple_action_new_stateful; ///
private alias c_g_simple_action_set_enabledFn = extern(C) void function(GSimpleAction* simple, gboolean enabled) nothrow;
__gshared c_g_simple_action_set_enabledFn c_g_simple_action_set_enabled; ///
private alias c_g_simple_action_set_stateFn = extern(C) void function(GSimpleAction* simple, GVariant* value) nothrow;
__gshared c_g_simple_action_set_stateFn c_g_simple_action_set_state; ///
private alias c_g_simple_action_set_state_hintFn = extern(C) void function(GSimpleAction* simple, GVariant* stateHint) nothrow;
__gshared c_g_simple_action_set_state_hintFn c_g_simple_action_set_state_hint; ///

// SimpleActionGroup
private alias c_g_simple_action_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_simple_action_group_get_typeFn c_g_simple_action_group_get_type; ///
private alias c_g_simple_action_group_newFn = extern(C) GSimpleActionGroup* function() nothrow;
__gshared c_g_simple_action_group_newFn c_g_simple_action_group_new; ///
private alias c_g_simple_action_group_add_entriesFn = extern(C) void function(GSimpleActionGroup* simple, const(GActionEntry)* entries, int nEntries, void* userData) nothrow;
__gshared c_g_simple_action_group_add_entriesFn c_g_simple_action_group_add_entries; ///
private alias c_g_simple_action_group_insertFn = extern(C) void function(GSimpleActionGroup* simple, GAction* action) nothrow;
__gshared c_g_simple_action_group_insertFn c_g_simple_action_group_insert; ///
private alias c_g_simple_action_group_lookupFn = extern(C) GAction* function(GSimpleActionGroup* simple, const(char)* actionName) nothrow;
__gshared c_g_simple_action_group_lookupFn c_g_simple_action_group_lookup; ///
private alias c_g_simple_action_group_removeFn = extern(C) void function(GSimpleActionGroup* simple, const(char)* actionName) nothrow;
__gshared c_g_simple_action_group_removeFn c_g_simple_action_group_remove; ///

// SimpleAsyncResult
private alias c_g_simple_async_result_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_simple_async_result_get_typeFn c_g_simple_async_result_get_type; ///
private alias c_g_simple_async_result_newFn = extern(C) GSimpleAsyncResult* function(GObject* sourceObject, GAsyncReadyCallback callback, void* userData, void* sourceTag) nothrow;
__gshared c_g_simple_async_result_newFn c_g_simple_async_result_new; ///
private alias c_g_simple_async_result_new_errorFn = extern(C) GSimpleAsyncResult* function(GObject* sourceObject, GAsyncReadyCallback callback, void* userData, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_simple_async_result_new_errorFn c_g_simple_async_result_new_error; ///
private alias c_g_simple_async_result_new_from_errorFn = extern(C) GSimpleAsyncResult* function(GObject* sourceObject, GAsyncReadyCallback callback, void* userData, const(GError)* error) nothrow;
__gshared c_g_simple_async_result_new_from_errorFn c_g_simple_async_result_new_from_error; ///
private alias c_g_simple_async_result_new_take_errorFn = extern(C) GSimpleAsyncResult* function(GObject* sourceObject, GAsyncReadyCallback callback, void* userData, GError* error) nothrow;
__gshared c_g_simple_async_result_new_take_errorFn c_g_simple_async_result_new_take_error; ///
private alias c_g_simple_async_result_is_validFn = extern(C) gboolean function(GAsyncResult* result, GObject* source, void* sourceTag) nothrow;
__gshared c_g_simple_async_result_is_validFn c_g_simple_async_result_is_valid; ///
private alias c_g_simple_async_result_completeFn = extern(C) void function(GSimpleAsyncResult* simple) nothrow;
__gshared c_g_simple_async_result_completeFn c_g_simple_async_result_complete; ///
private alias c_g_simple_async_result_complete_in_idleFn = extern(C) void function(GSimpleAsyncResult* simple) nothrow;
__gshared c_g_simple_async_result_complete_in_idleFn c_g_simple_async_result_complete_in_idle; ///
private alias c_g_simple_async_result_get_op_res_gbooleanFn = extern(C) gboolean function(GSimpleAsyncResult* simple) nothrow;
__gshared c_g_simple_async_result_get_op_res_gbooleanFn c_g_simple_async_result_get_op_res_gboolean; ///
private alias c_g_simple_async_result_get_op_res_gpointerFn = extern(C) void* function(GSimpleAsyncResult* simple) nothrow;
__gshared c_g_simple_async_result_get_op_res_gpointerFn c_g_simple_async_result_get_op_res_gpointer; ///
private alias c_g_simple_async_result_get_op_res_gssizeFn = extern(C) ptrdiff_t function(GSimpleAsyncResult* simple) nothrow;
__gshared c_g_simple_async_result_get_op_res_gssizeFn c_g_simple_async_result_get_op_res_gssize; ///
private alias c_g_simple_async_result_get_source_tagFn = extern(C) void* function(GSimpleAsyncResult* simple) nothrow;
__gshared c_g_simple_async_result_get_source_tagFn c_g_simple_async_result_get_source_tag; ///
private alias c_g_simple_async_result_propagate_errorFn = extern(C) gboolean function(GSimpleAsyncResult* simple, GError** _err) nothrow;
__gshared c_g_simple_async_result_propagate_errorFn c_g_simple_async_result_propagate_error; ///
private alias c_g_simple_async_result_run_in_threadFn = extern(C) void function(GSimpleAsyncResult* simple, GSimpleAsyncThreadFunc func, int ioPriority, GCancellable* cancellable) nothrow;
__gshared c_g_simple_async_result_run_in_threadFn c_g_simple_async_result_run_in_thread; ///
private alias c_g_simple_async_result_set_check_cancellableFn = extern(C) void function(GSimpleAsyncResult* simple, GCancellable* checkCancellable) nothrow;
__gshared c_g_simple_async_result_set_check_cancellableFn c_g_simple_async_result_set_check_cancellable; ///
private alias c_g_simple_async_result_set_errorFn = extern(C) void function(GSimpleAsyncResult* simple, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_simple_async_result_set_errorFn c_g_simple_async_result_set_error; ///
private alias c_g_simple_async_result_set_error_vaFn = extern(C) void function(GSimpleAsyncResult* simple, GQuark domain, int code, const(char)* format, void* args) nothrow;
__gshared c_g_simple_async_result_set_error_vaFn c_g_simple_async_result_set_error_va; ///
private alias c_g_simple_async_result_set_from_errorFn = extern(C) void function(GSimpleAsyncResult* simple, const(GError)* error) nothrow;
__gshared c_g_simple_async_result_set_from_errorFn c_g_simple_async_result_set_from_error; ///
private alias c_g_simple_async_result_set_handle_cancellationFn = extern(C) void function(GSimpleAsyncResult* simple, gboolean handleCancellation) nothrow;
__gshared c_g_simple_async_result_set_handle_cancellationFn c_g_simple_async_result_set_handle_cancellation; ///
private alias c_g_simple_async_result_set_op_res_gbooleanFn = extern(C) void function(GSimpleAsyncResult* simple, gboolean opRes) nothrow;
__gshared c_g_simple_async_result_set_op_res_gbooleanFn c_g_simple_async_result_set_op_res_gboolean; ///
private alias c_g_simple_async_result_set_op_res_gpointerFn = extern(C) void function(GSimpleAsyncResult* simple, void* opRes, GDestroyNotify destroyOpRes) nothrow;
__gshared c_g_simple_async_result_set_op_res_gpointerFn c_g_simple_async_result_set_op_res_gpointer; ///
private alias c_g_simple_async_result_set_op_res_gssizeFn = extern(C) void function(GSimpleAsyncResult* simple, ptrdiff_t opRes) nothrow;
__gshared c_g_simple_async_result_set_op_res_gssizeFn c_g_simple_async_result_set_op_res_gssize; ///
private alias c_g_simple_async_result_take_errorFn = extern(C) void function(GSimpleAsyncResult* simple, GError* error) nothrow;
__gshared c_g_simple_async_result_take_errorFn c_g_simple_async_result_take_error; ///

// SimpleIOStream
private alias c_g_simple_io_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_simple_io_stream_get_typeFn c_g_simple_io_stream_get_type; ///
private alias c_g_simple_io_stream_newFn = extern(C) GIOStream* function(GInputStream* inputStream, GOutputStream* outputStream) nothrow;
__gshared c_g_simple_io_stream_newFn c_g_simple_io_stream_new; ///

// SimplePermission
private alias c_g_simple_permission_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_simple_permission_get_typeFn c_g_simple_permission_get_type; ///
private alias c_g_simple_permission_newFn = extern(C) GPermission* function(gboolean allowed) nothrow;
__gshared c_g_simple_permission_newFn c_g_simple_permission_new; ///

// SimpleProxyResolver
private alias c_g_simple_proxy_resolver_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_simple_proxy_resolver_get_typeFn c_g_simple_proxy_resolver_get_type; ///
private alias c_g_simple_proxy_resolver_newFn = extern(C) GProxyResolver* function(const(char)* defaultProxy, char** ignoreHosts) nothrow;
__gshared c_g_simple_proxy_resolver_newFn c_g_simple_proxy_resolver_new; ///
private alias c_g_simple_proxy_resolver_set_default_proxyFn = extern(C) void function(GSimpleProxyResolver* resolver, const(char)* defaultProxy) nothrow;
__gshared c_g_simple_proxy_resolver_set_default_proxyFn c_g_simple_proxy_resolver_set_default_proxy; ///
private alias c_g_simple_proxy_resolver_set_ignore_hostsFn = extern(C) void function(GSimpleProxyResolver* resolver, char** ignoreHosts) nothrow;
__gshared c_g_simple_proxy_resolver_set_ignore_hostsFn c_g_simple_proxy_resolver_set_ignore_hosts; ///
private alias c_g_simple_proxy_resolver_set_uri_proxyFn = extern(C) void function(GSimpleProxyResolver* resolver, const(char)* uriScheme, const(char)* proxy) nothrow;
__gshared c_g_simple_proxy_resolver_set_uri_proxyFn c_g_simple_proxy_resolver_set_uri_proxy; ///

// Socket
private alias c_g_socket_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_get_typeFn c_g_socket_get_type; ///
private alias c_g_socket_newFn = extern(C) GSocket* function(GSocketFamily family, GSocketType type, GSocketProtocol protocol, GError** _err) nothrow;
__gshared c_g_socket_newFn c_g_socket_new; ///
private alias c_g_socket_new_from_fdFn = extern(C) GSocket* function(int fd, GError** _err) nothrow;
__gshared c_g_socket_new_from_fdFn c_g_socket_new_from_fd; ///
private alias c_g_socket_acceptFn = extern(C) GSocket* function(GSocket* socket, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_acceptFn c_g_socket_accept; ///
private alias c_g_socket_bindFn = extern(C) gboolean function(GSocket* socket, GSocketAddress* address, gboolean allowReuse, GError** _err) nothrow;
__gshared c_g_socket_bindFn c_g_socket_bind; ///
private alias c_g_socket_check_connect_resultFn = extern(C) gboolean function(GSocket* socket, GError** _err) nothrow;
__gshared c_g_socket_check_connect_resultFn c_g_socket_check_connect_result; ///
private alias c_g_socket_closeFn = extern(C) gboolean function(GSocket* socket, GError** _err) nothrow;
__gshared c_g_socket_closeFn c_g_socket_close; ///
private alias c_g_socket_condition_checkFn = extern(C) GIOCondition function(GSocket* socket, GIOCondition condition) nothrow;
__gshared c_g_socket_condition_checkFn c_g_socket_condition_check; ///
private alias c_g_socket_condition_timed_waitFn = extern(C) gboolean function(GSocket* socket, GIOCondition condition, long timeoutUs, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_condition_timed_waitFn c_g_socket_condition_timed_wait; ///
private alias c_g_socket_condition_waitFn = extern(C) gboolean function(GSocket* socket, GIOCondition condition, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_condition_waitFn c_g_socket_condition_wait; ///
private alias c_g_socket_connectFn = extern(C) gboolean function(GSocket* socket, GSocketAddress* address, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_connectFn c_g_socket_connect; ///
private alias c_g_socket_connection_factory_create_connectionFn = extern(C) GSocketConnection* function(GSocket* socket) nothrow;
__gshared c_g_socket_connection_factory_create_connectionFn c_g_socket_connection_factory_create_connection; ///
private alias c_g_socket_create_sourceFn = extern(C) GSource* function(GSocket* socket, GIOCondition condition, GCancellable* cancellable) nothrow;
__gshared c_g_socket_create_sourceFn c_g_socket_create_source; ///
private alias c_g_socket_get_available_bytesFn = extern(C) ptrdiff_t function(GSocket* socket) nothrow;
__gshared c_g_socket_get_available_bytesFn c_g_socket_get_available_bytes; ///
private alias c_g_socket_get_blockingFn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_get_blockingFn c_g_socket_get_blocking; ///
private alias c_g_socket_get_broadcastFn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_get_broadcastFn c_g_socket_get_broadcast; ///
private alias c_g_socket_get_credentialsFn = extern(C) GCredentials* function(GSocket* socket, GError** _err) nothrow;
__gshared c_g_socket_get_credentialsFn c_g_socket_get_credentials; ///
private alias c_g_socket_get_familyFn = extern(C) GSocketFamily function(GSocket* socket) nothrow;
__gshared c_g_socket_get_familyFn c_g_socket_get_family; ///
private alias c_g_socket_get_fdFn = extern(C) int function(GSocket* socket) nothrow;
__gshared c_g_socket_get_fdFn c_g_socket_get_fd; ///
private alias c_g_socket_get_keepaliveFn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_get_keepaliveFn c_g_socket_get_keepalive; ///
private alias c_g_socket_get_listen_backlogFn = extern(C) int function(GSocket* socket) nothrow;
__gshared c_g_socket_get_listen_backlogFn c_g_socket_get_listen_backlog; ///
private alias c_g_socket_get_local_addressFn = extern(C) GSocketAddress* function(GSocket* socket, GError** _err) nothrow;
__gshared c_g_socket_get_local_addressFn c_g_socket_get_local_address; ///
private alias c_g_socket_get_multicast_loopbackFn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_get_multicast_loopbackFn c_g_socket_get_multicast_loopback; ///
private alias c_g_socket_get_multicast_ttlFn = extern(C) uint function(GSocket* socket) nothrow;
__gshared c_g_socket_get_multicast_ttlFn c_g_socket_get_multicast_ttl; ///
private alias c_g_socket_get_optionFn = extern(C) gboolean function(GSocket* socket, int level, int optname, int* value, GError** _err) nothrow;
__gshared c_g_socket_get_optionFn c_g_socket_get_option; ///
private alias c_g_socket_get_protocolFn = extern(C) GSocketProtocol function(GSocket* socket) nothrow;
__gshared c_g_socket_get_protocolFn c_g_socket_get_protocol; ///
private alias c_g_socket_get_remote_addressFn = extern(C) GSocketAddress* function(GSocket* socket, GError** _err) nothrow;
__gshared c_g_socket_get_remote_addressFn c_g_socket_get_remote_address; ///
private alias c_g_socket_get_socket_typeFn = extern(C) GSocketType function(GSocket* socket) nothrow;
__gshared c_g_socket_get_socket_typeFn c_g_socket_get_socket_type; ///
private alias c_g_socket_get_timeoutFn = extern(C) uint function(GSocket* socket) nothrow;
__gshared c_g_socket_get_timeoutFn c_g_socket_get_timeout; ///
private alias c_g_socket_get_ttlFn = extern(C) uint function(GSocket* socket) nothrow;
__gshared c_g_socket_get_ttlFn c_g_socket_get_ttl; ///
private alias c_g_socket_is_closedFn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_is_closedFn c_g_socket_is_closed; ///
private alias c_g_socket_is_connectedFn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_is_connectedFn c_g_socket_is_connected; ///
private alias c_g_socket_join_multicast_groupFn = extern(C) gboolean function(GSocket* socket, GInetAddress* group, gboolean sourceSpecific, const(char)* iface, GError** _err) nothrow;
__gshared c_g_socket_join_multicast_groupFn c_g_socket_join_multicast_group; ///
private alias c_g_socket_join_multicast_group_ssmFn = extern(C) gboolean function(GSocket* socket, GInetAddress* group, GInetAddress* sourceSpecific, const(char)* iface, GError** _err) nothrow;
__gshared c_g_socket_join_multicast_group_ssmFn c_g_socket_join_multicast_group_ssm; ///
private alias c_g_socket_leave_multicast_groupFn = extern(C) gboolean function(GSocket* socket, GInetAddress* group, gboolean sourceSpecific, const(char)* iface, GError** _err) nothrow;
__gshared c_g_socket_leave_multicast_groupFn c_g_socket_leave_multicast_group; ///
private alias c_g_socket_leave_multicast_group_ssmFn = extern(C) gboolean function(GSocket* socket, GInetAddress* group, GInetAddress* sourceSpecific, const(char)* iface, GError** _err) nothrow;
__gshared c_g_socket_leave_multicast_group_ssmFn c_g_socket_leave_multicast_group_ssm; ///
private alias c_g_socket_listenFn = extern(C) gboolean function(GSocket* socket, GError** _err) nothrow;
__gshared c_g_socket_listenFn c_g_socket_listen; ///
private alias c_g_socket_receiveFn = extern(C) ptrdiff_t function(GSocket* socket, ubyte* buffer, size_t size, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receiveFn c_g_socket_receive; ///
private alias c_g_socket_receive_bytesFn = extern(C) GBytes* function(GSocket* socket, size_t size, long timeoutUs, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receive_bytesFn c_g_socket_receive_bytes; ///
private alias c_g_socket_receive_bytes_fromFn = extern(C) GBytes* function(GSocket* socket, GSocketAddress** address, size_t size, long timeoutUs, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receive_bytes_fromFn c_g_socket_receive_bytes_from; ///
private alias c_g_socket_receive_fromFn = extern(C) ptrdiff_t function(GSocket* socket, GSocketAddress** address, ubyte* buffer, size_t size, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receive_fromFn c_g_socket_receive_from; ///
private alias c_g_socket_receive_messageFn = extern(C) ptrdiff_t function(GSocket* socket, GSocketAddress** address, GInputVector* vectors, int numVectors, GSocketControlMessage*** messages, int* numMessages, int* flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receive_messageFn c_g_socket_receive_message; ///
private alias c_g_socket_receive_messagesFn = extern(C) int function(GSocket* socket, GInputMessage* messages, uint numMessages, int flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receive_messagesFn c_g_socket_receive_messages; ///
private alias c_g_socket_receive_with_blockingFn = extern(C) ptrdiff_t function(GSocket* socket, ubyte* buffer, size_t size, gboolean blocking, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_receive_with_blockingFn c_g_socket_receive_with_blocking; ///
private alias c_g_socket_sendFn = extern(C) ptrdiff_t function(GSocket* socket, const(ubyte)* buffer, size_t size, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_sendFn c_g_socket_send; ///
private alias c_g_socket_send_messageFn = extern(C) ptrdiff_t function(GSocket* socket, GSocketAddress* address, GOutputVector* vectors, int numVectors, GSocketControlMessage** messages, int numMessages, int flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_send_messageFn c_g_socket_send_message; ///
private alias c_g_socket_send_message_with_timeoutFn = extern(C) GPollableReturn function(GSocket* socket, GSocketAddress* address, const(GOutputVector)* vectors, int numVectors, GSocketControlMessage** messages, int numMessages, int flags, long timeoutUs, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_send_message_with_timeoutFn c_g_socket_send_message_with_timeout; ///
private alias c_g_socket_send_messagesFn = extern(C) int function(GSocket* socket, GOutputMessage* messages, uint numMessages, int flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_send_messagesFn c_g_socket_send_messages; ///
private alias c_g_socket_send_toFn = extern(C) ptrdiff_t function(GSocket* socket, GSocketAddress* address, const(ubyte)* buffer, size_t size, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_send_toFn c_g_socket_send_to; ///
private alias c_g_socket_send_with_blockingFn = extern(C) ptrdiff_t function(GSocket* socket, const(ubyte)* buffer, size_t size, gboolean blocking, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_send_with_blockingFn c_g_socket_send_with_blocking; ///
private alias c_g_socket_set_blockingFn = extern(C) void function(GSocket* socket, gboolean blocking) nothrow;
__gshared c_g_socket_set_blockingFn c_g_socket_set_blocking; ///
private alias c_g_socket_set_broadcastFn = extern(C) void function(GSocket* socket, gboolean broadcast) nothrow;
__gshared c_g_socket_set_broadcastFn c_g_socket_set_broadcast; ///
private alias c_g_socket_set_keepaliveFn = extern(C) void function(GSocket* socket, gboolean keepalive) nothrow;
__gshared c_g_socket_set_keepaliveFn c_g_socket_set_keepalive; ///
private alias c_g_socket_set_listen_backlogFn = extern(C) void function(GSocket* socket, int backlog) nothrow;
__gshared c_g_socket_set_listen_backlogFn c_g_socket_set_listen_backlog; ///
private alias c_g_socket_set_multicast_loopbackFn = extern(C) void function(GSocket* socket, gboolean loopback) nothrow;
__gshared c_g_socket_set_multicast_loopbackFn c_g_socket_set_multicast_loopback; ///
private alias c_g_socket_set_multicast_ttlFn = extern(C) void function(GSocket* socket, uint ttl) nothrow;
__gshared c_g_socket_set_multicast_ttlFn c_g_socket_set_multicast_ttl; ///
private alias c_g_socket_set_optionFn = extern(C) gboolean function(GSocket* socket, int level, int optname, int value, GError** _err) nothrow;
__gshared c_g_socket_set_optionFn c_g_socket_set_option; ///
private alias c_g_socket_set_timeoutFn = extern(C) void function(GSocket* socket, uint timeout) nothrow;
__gshared c_g_socket_set_timeoutFn c_g_socket_set_timeout; ///
private alias c_g_socket_set_ttlFn = extern(C) void function(GSocket* socket, uint ttl) nothrow;
__gshared c_g_socket_set_ttlFn c_g_socket_set_ttl; ///
private alias c_g_socket_shutdownFn = extern(C) gboolean function(GSocket* socket, gboolean shutdownRead, gboolean shutdownWrite, GError** _err) nothrow;
__gshared c_g_socket_shutdownFn c_g_socket_shutdown; ///
private alias c_g_socket_speaks_ipv4Fn = extern(C) gboolean function(GSocket* socket) nothrow;
__gshared c_g_socket_speaks_ipv4Fn c_g_socket_speaks_ipv4; ///

// SocketAddress
private alias c_g_socket_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_address_get_typeFn c_g_socket_address_get_type; ///
private alias c_g_socket_address_new_from_nativeFn = extern(C) GSocketAddress* function(void* native, size_t len) nothrow;
__gshared c_g_socket_address_new_from_nativeFn c_g_socket_address_new_from_native; ///
private alias c_g_socket_address_get_familyFn = extern(C) GSocketFamily function(GSocketAddress* address) nothrow;
__gshared c_g_socket_address_get_familyFn c_g_socket_address_get_family; ///
private alias c_g_socket_address_get_native_sizeFn = extern(C) ptrdiff_t function(GSocketAddress* address) nothrow;
__gshared c_g_socket_address_get_native_sizeFn c_g_socket_address_get_native_size; ///
private alias c_g_socket_address_to_nativeFn = extern(C) gboolean function(GSocketAddress* address, void* dest, size_t destlen, GError** _err) nothrow;
__gshared c_g_socket_address_to_nativeFn c_g_socket_address_to_native; ///

// SocketAddressEnumerator
private alias c_g_socket_address_enumerator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_address_enumerator_get_typeFn c_g_socket_address_enumerator_get_type; ///
private alias c_g_socket_address_enumerator_nextFn = extern(C) GSocketAddress* function(GSocketAddressEnumerator* enumerator, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_address_enumerator_nextFn c_g_socket_address_enumerator_next; ///
private alias c_g_socket_address_enumerator_next_asyncFn = extern(C) void function(GSocketAddressEnumerator* enumerator, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_address_enumerator_next_asyncFn c_g_socket_address_enumerator_next_async; ///
private alias c_g_socket_address_enumerator_next_finishFn = extern(C) GSocketAddress* function(GSocketAddressEnumerator* enumerator, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_socket_address_enumerator_next_finishFn c_g_socket_address_enumerator_next_finish; ///

// SocketClient
private alias c_g_socket_client_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_client_get_typeFn c_g_socket_client_get_type; ///
private alias c_g_socket_client_newFn = extern(C) GSocketClient* function() nothrow;
__gshared c_g_socket_client_newFn c_g_socket_client_new; ///
private alias c_g_socket_client_add_application_proxyFn = extern(C) void function(GSocketClient* client, const(char)* protocol) nothrow;
__gshared c_g_socket_client_add_application_proxyFn c_g_socket_client_add_application_proxy; ///
private alias c_g_socket_client_connectFn = extern(C) GSocketConnection* function(GSocketClient* client, GSocketConnectable* connectable, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_client_connectFn c_g_socket_client_connect; ///
private alias c_g_socket_client_connect_asyncFn = extern(C) void function(GSocketClient* client, GSocketConnectable* connectable, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_client_connect_asyncFn c_g_socket_client_connect_async; ///
private alias c_g_socket_client_connect_finishFn = extern(C) GSocketConnection* function(GSocketClient* client, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_socket_client_connect_finishFn c_g_socket_client_connect_finish; ///
private alias c_g_socket_client_connect_to_hostFn = extern(C) GSocketConnection* function(GSocketClient* client, const(char)* hostAndPort, ushort defaultPort, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_client_connect_to_hostFn c_g_socket_client_connect_to_host; ///
private alias c_g_socket_client_connect_to_host_asyncFn = extern(C) void function(GSocketClient* client, const(char)* hostAndPort, ushort defaultPort, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_client_connect_to_host_asyncFn c_g_socket_client_connect_to_host_async; ///
private alias c_g_socket_client_connect_to_host_finishFn = extern(C) GSocketConnection* function(GSocketClient* client, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_socket_client_connect_to_host_finishFn c_g_socket_client_connect_to_host_finish; ///
private alias c_g_socket_client_connect_to_serviceFn = extern(C) GSocketConnection* function(GSocketClient* client, const(char)* domain, const(char)* service, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_client_connect_to_serviceFn c_g_socket_client_connect_to_service; ///
private alias c_g_socket_client_connect_to_service_asyncFn = extern(C) void function(GSocketClient* client, const(char)* domain, const(char)* service, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_client_connect_to_service_asyncFn c_g_socket_client_connect_to_service_async; ///
private alias c_g_socket_client_connect_to_service_finishFn = extern(C) GSocketConnection* function(GSocketClient* client, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_socket_client_connect_to_service_finishFn c_g_socket_client_connect_to_service_finish; ///
private alias c_g_socket_client_connect_to_uriFn = extern(C) GSocketConnection* function(GSocketClient* client, const(char)* uri, ushort defaultPort, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_client_connect_to_uriFn c_g_socket_client_connect_to_uri; ///
private alias c_g_socket_client_connect_to_uri_asyncFn = extern(C) void function(GSocketClient* client, const(char)* uri, ushort defaultPort, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_client_connect_to_uri_asyncFn c_g_socket_client_connect_to_uri_async; ///
private alias c_g_socket_client_connect_to_uri_finishFn = extern(C) GSocketConnection* function(GSocketClient* client, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_socket_client_connect_to_uri_finishFn c_g_socket_client_connect_to_uri_finish; ///
private alias c_g_socket_client_get_enable_proxyFn = extern(C) gboolean function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_enable_proxyFn c_g_socket_client_get_enable_proxy; ///
private alias c_g_socket_client_get_familyFn = extern(C) GSocketFamily function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_familyFn c_g_socket_client_get_family; ///
private alias c_g_socket_client_get_local_addressFn = extern(C) GSocketAddress* function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_local_addressFn c_g_socket_client_get_local_address; ///
private alias c_g_socket_client_get_protocolFn = extern(C) GSocketProtocol function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_protocolFn c_g_socket_client_get_protocol; ///
private alias c_g_socket_client_get_proxy_resolverFn = extern(C) GProxyResolver* function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_proxy_resolverFn c_g_socket_client_get_proxy_resolver; ///
private alias c_g_socket_client_get_socket_typeFn = extern(C) GSocketType function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_socket_typeFn c_g_socket_client_get_socket_type; ///
private alias c_g_socket_client_get_timeoutFn = extern(C) uint function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_timeoutFn c_g_socket_client_get_timeout; ///
private alias c_g_socket_client_get_tlsFn = extern(C) gboolean function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_tlsFn c_g_socket_client_get_tls; ///
private alias c_g_socket_client_get_tls_validation_flagsFn = extern(C) GTlsCertificateFlags function(GSocketClient* client) nothrow;
__gshared c_g_socket_client_get_tls_validation_flagsFn c_g_socket_client_get_tls_validation_flags; ///
private alias c_g_socket_client_set_enable_proxyFn = extern(C) void function(GSocketClient* client, gboolean enable) nothrow;
__gshared c_g_socket_client_set_enable_proxyFn c_g_socket_client_set_enable_proxy; ///
private alias c_g_socket_client_set_familyFn = extern(C) void function(GSocketClient* client, GSocketFamily family) nothrow;
__gshared c_g_socket_client_set_familyFn c_g_socket_client_set_family; ///
private alias c_g_socket_client_set_local_addressFn = extern(C) void function(GSocketClient* client, GSocketAddress* address) nothrow;
__gshared c_g_socket_client_set_local_addressFn c_g_socket_client_set_local_address; ///
private alias c_g_socket_client_set_protocolFn = extern(C) void function(GSocketClient* client, GSocketProtocol protocol) nothrow;
__gshared c_g_socket_client_set_protocolFn c_g_socket_client_set_protocol; ///
private alias c_g_socket_client_set_proxy_resolverFn = extern(C) void function(GSocketClient* client, GProxyResolver* proxyResolver) nothrow;
__gshared c_g_socket_client_set_proxy_resolverFn c_g_socket_client_set_proxy_resolver; ///
private alias c_g_socket_client_set_socket_typeFn = extern(C) void function(GSocketClient* client, GSocketType type) nothrow;
__gshared c_g_socket_client_set_socket_typeFn c_g_socket_client_set_socket_type; ///
private alias c_g_socket_client_set_timeoutFn = extern(C) void function(GSocketClient* client, uint timeout) nothrow;
__gshared c_g_socket_client_set_timeoutFn c_g_socket_client_set_timeout; ///
private alias c_g_socket_client_set_tlsFn = extern(C) void function(GSocketClient* client, gboolean tls) nothrow;
__gshared c_g_socket_client_set_tlsFn c_g_socket_client_set_tls; ///
private alias c_g_socket_client_set_tls_validation_flagsFn = extern(C) void function(GSocketClient* client, GTlsCertificateFlags flags) nothrow;
__gshared c_g_socket_client_set_tls_validation_flagsFn c_g_socket_client_set_tls_validation_flags; ///

// SocketConnectable
private alias c_g_socket_connectable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_connectable_get_typeFn c_g_socket_connectable_get_type; ///
private alias c_g_socket_connectable_enumerateFn = extern(C) GSocketAddressEnumerator* function(GSocketConnectable* connectable) nothrow;
__gshared c_g_socket_connectable_enumerateFn c_g_socket_connectable_enumerate; ///
private alias c_g_socket_connectable_proxy_enumerateFn = extern(C) GSocketAddressEnumerator* function(GSocketConnectable* connectable) nothrow;
__gshared c_g_socket_connectable_proxy_enumerateFn c_g_socket_connectable_proxy_enumerate; ///
private alias c_g_socket_connectable_to_stringFn = extern(C) char* function(GSocketConnectable* connectable) nothrow;
__gshared c_g_socket_connectable_to_stringFn c_g_socket_connectable_to_string; ///

// SocketConnection
private alias c_g_socket_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_connection_get_typeFn c_g_socket_connection_get_type; ///
private alias c_g_socket_connection_factory_lookup_typeFn = extern(C) GType function(GSocketFamily family, GSocketType type, int protocolId) nothrow;
__gshared c_g_socket_connection_factory_lookup_typeFn c_g_socket_connection_factory_lookup_type; ///
private alias c_g_socket_connection_factory_register_typeFn = extern(C) void function(GType gType, GSocketFamily family, GSocketType type, int protocol) nothrow;
__gshared c_g_socket_connection_factory_register_typeFn c_g_socket_connection_factory_register_type; ///
private alias c_g_socket_connection_connectFn = extern(C) gboolean function(GSocketConnection* connection, GSocketAddress* address, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_connection_connectFn c_g_socket_connection_connect; ///
private alias c_g_socket_connection_connect_asyncFn = extern(C) void function(GSocketConnection* connection, GSocketAddress* address, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_connection_connect_asyncFn c_g_socket_connection_connect_async; ///
private alias c_g_socket_connection_connect_finishFn = extern(C) gboolean function(GSocketConnection* connection, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_socket_connection_connect_finishFn c_g_socket_connection_connect_finish; ///
private alias c_g_socket_connection_get_local_addressFn = extern(C) GSocketAddress* function(GSocketConnection* connection, GError** _err) nothrow;
__gshared c_g_socket_connection_get_local_addressFn c_g_socket_connection_get_local_address; ///
private alias c_g_socket_connection_get_remote_addressFn = extern(C) GSocketAddress* function(GSocketConnection* connection, GError** _err) nothrow;
__gshared c_g_socket_connection_get_remote_addressFn c_g_socket_connection_get_remote_address; ///
private alias c_g_socket_connection_get_socketFn = extern(C) GSocket* function(GSocketConnection* connection) nothrow;
__gshared c_g_socket_connection_get_socketFn c_g_socket_connection_get_socket; ///
private alias c_g_socket_connection_is_connectedFn = extern(C) gboolean function(GSocketConnection* connection) nothrow;
__gshared c_g_socket_connection_is_connectedFn c_g_socket_connection_is_connected; ///

// SocketControlMessage
private alias c_g_socket_control_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_control_message_get_typeFn c_g_socket_control_message_get_type; ///
private alias c_g_socket_control_message_deserializeFn = extern(C) GSocketControlMessage* function(int level, int type, size_t size, void* data) nothrow;
__gshared c_g_socket_control_message_deserializeFn c_g_socket_control_message_deserialize; ///
private alias c_g_socket_control_message_get_levelFn = extern(C) int function(GSocketControlMessage* message) nothrow;
__gshared c_g_socket_control_message_get_levelFn c_g_socket_control_message_get_level; ///
private alias c_g_socket_control_message_get_msg_typeFn = extern(C) int function(GSocketControlMessage* message) nothrow;
__gshared c_g_socket_control_message_get_msg_typeFn c_g_socket_control_message_get_msg_type; ///
private alias c_g_socket_control_message_get_sizeFn = extern(C) size_t function(GSocketControlMessage* message) nothrow;
__gshared c_g_socket_control_message_get_sizeFn c_g_socket_control_message_get_size; ///
private alias c_g_socket_control_message_serializeFn = extern(C) void function(GSocketControlMessage* message, void* data) nothrow;
__gshared c_g_socket_control_message_serializeFn c_g_socket_control_message_serialize; ///

// SocketListener
private alias c_g_socket_listener_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_listener_get_typeFn c_g_socket_listener_get_type; ///
private alias c_g_socket_listener_newFn = extern(C) GSocketListener* function() nothrow;
__gshared c_g_socket_listener_newFn c_g_socket_listener_new; ///
private alias c_g_socket_listener_acceptFn = extern(C) GSocketConnection* function(GSocketListener* listener, GObject** sourceObject, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_listener_acceptFn c_g_socket_listener_accept; ///
private alias c_g_socket_listener_accept_asyncFn = extern(C) void function(GSocketListener* listener, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_listener_accept_asyncFn c_g_socket_listener_accept_async; ///
private alias c_g_socket_listener_accept_finishFn = extern(C) GSocketConnection* function(GSocketListener* listener, GAsyncResult* result, GObject** sourceObject, GError** _err) nothrow;
__gshared c_g_socket_listener_accept_finishFn c_g_socket_listener_accept_finish; ///
private alias c_g_socket_listener_accept_socketFn = extern(C) GSocket* function(GSocketListener* listener, GObject** sourceObject, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_socket_listener_accept_socketFn c_g_socket_listener_accept_socket; ///
private alias c_g_socket_listener_accept_socket_asyncFn = extern(C) void function(GSocketListener* listener, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_socket_listener_accept_socket_asyncFn c_g_socket_listener_accept_socket_async; ///
private alias c_g_socket_listener_accept_socket_finishFn = extern(C) GSocket* function(GSocketListener* listener, GAsyncResult* result, GObject** sourceObject, GError** _err) nothrow;
__gshared c_g_socket_listener_accept_socket_finishFn c_g_socket_listener_accept_socket_finish; ///
private alias c_g_socket_listener_add_addressFn = extern(C) gboolean function(GSocketListener* listener, GSocketAddress* address, GSocketType type, GSocketProtocol protocol, GObject* sourceObject, GSocketAddress** effectiveAddress, GError** _err) nothrow;
__gshared c_g_socket_listener_add_addressFn c_g_socket_listener_add_address; ///
private alias c_g_socket_listener_add_any_inet_portFn = extern(C) ushort function(GSocketListener* listener, GObject* sourceObject, GError** _err) nothrow;
__gshared c_g_socket_listener_add_any_inet_portFn c_g_socket_listener_add_any_inet_port; ///
private alias c_g_socket_listener_add_inet_portFn = extern(C) gboolean function(GSocketListener* listener, ushort port, GObject* sourceObject, GError** _err) nothrow;
__gshared c_g_socket_listener_add_inet_portFn c_g_socket_listener_add_inet_port; ///
private alias c_g_socket_listener_add_socketFn = extern(C) gboolean function(GSocketListener* listener, GSocket* socket, GObject* sourceObject, GError** _err) nothrow;
__gshared c_g_socket_listener_add_socketFn c_g_socket_listener_add_socket; ///
private alias c_g_socket_listener_closeFn = extern(C) void function(GSocketListener* listener) nothrow;
__gshared c_g_socket_listener_closeFn c_g_socket_listener_close; ///
private alias c_g_socket_listener_set_backlogFn = extern(C) void function(GSocketListener* listener, int listenBacklog) nothrow;
__gshared c_g_socket_listener_set_backlogFn c_g_socket_listener_set_backlog; ///

// SocketService
private alias c_g_socket_service_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_socket_service_get_typeFn c_g_socket_service_get_type; ///
private alias c_g_socket_service_newFn = extern(C) GSocketService* function() nothrow;
__gshared c_g_socket_service_newFn c_g_socket_service_new; ///
private alias c_g_socket_service_is_activeFn = extern(C) gboolean function(GSocketService* service) nothrow;
__gshared c_g_socket_service_is_activeFn c_g_socket_service_is_active; ///
private alias c_g_socket_service_startFn = extern(C) void function(GSocketService* service) nothrow;
__gshared c_g_socket_service_startFn c_g_socket_service_start; ///
private alias c_g_socket_service_stopFn = extern(C) void function(GSocketService* service) nothrow;
__gshared c_g_socket_service_stopFn c_g_socket_service_stop; ///

// SrvTarget
private alias c_g_srv_target_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_srv_target_get_typeFn c_g_srv_target_get_type; ///
private alias c_g_srv_target_newFn = extern(C) GSrvTarget* function(const(char)* hostname, ushort port, ushort priority, ushort weight) nothrow;
__gshared c_g_srv_target_newFn c_g_srv_target_new; ///
private alias c_g_srv_target_copyFn = extern(C) GSrvTarget* function(GSrvTarget* target) nothrow;
__gshared c_g_srv_target_copyFn c_g_srv_target_copy; ///
private alias c_g_srv_target_freeFn = extern(C) void function(GSrvTarget* target) nothrow;
__gshared c_g_srv_target_freeFn c_g_srv_target_free; ///
private alias c_g_srv_target_get_hostnameFn = extern(C) const(char)* function(GSrvTarget* target) nothrow;
__gshared c_g_srv_target_get_hostnameFn c_g_srv_target_get_hostname; ///
private alias c_g_srv_target_get_portFn = extern(C) ushort function(GSrvTarget* target) nothrow;
__gshared c_g_srv_target_get_portFn c_g_srv_target_get_port; ///
private alias c_g_srv_target_get_priorityFn = extern(C) ushort function(GSrvTarget* target) nothrow;
__gshared c_g_srv_target_get_priorityFn c_g_srv_target_get_priority; ///
private alias c_g_srv_target_get_weightFn = extern(C) ushort function(GSrvTarget* target) nothrow;
__gshared c_g_srv_target_get_weightFn c_g_srv_target_get_weight; ///
private alias c_g_srv_target_list_sortFn = extern(C) GList* function(GList* targets) nothrow;
__gshared c_g_srv_target_list_sortFn c_g_srv_target_list_sort; ///

// StaticResource
private alias c_g_static_resource_finiFn = extern(C) void function(GStaticResource* staticResource) nothrow;
__gshared c_g_static_resource_finiFn c_g_static_resource_fini; ///
private alias c_g_static_resource_get_resourceFn = extern(C) GResource* function(GStaticResource* staticResource) nothrow;
__gshared c_g_static_resource_get_resourceFn c_g_static_resource_get_resource; ///
private alias c_g_static_resource_initFn = extern(C) void function(GStaticResource* staticResource) nothrow;
__gshared c_g_static_resource_initFn c_g_static_resource_init; ///

// Subprocess
private alias c_g_subprocess_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_subprocess_get_typeFn c_g_subprocess_get_type; ///
private alias c_g_subprocess_newFn = extern(C) GSubprocess* function(GSubprocessFlags flags, GError** error, const(char)* argv0,  ...) nothrow;
__gshared c_g_subprocess_newFn c_g_subprocess_new; ///
private alias c_g_subprocess_newvFn = extern(C) GSubprocess* function(const(char*)* argv, GSubprocessFlags flags, GError** _err) nothrow;
__gshared c_g_subprocess_newvFn c_g_subprocess_newv; ///
private alias c_g_subprocess_communicateFn = extern(C) gboolean function(GSubprocess* subprocess, GBytes* stdinBuf, GCancellable* cancellable, GBytes** stdoutBuf, GBytes** stderrBuf, GError** _err) nothrow;
__gshared c_g_subprocess_communicateFn c_g_subprocess_communicate; ///
private alias c_g_subprocess_communicate_asyncFn = extern(C) void function(GSubprocess* subprocess, GBytes* stdinBuf, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_subprocess_communicate_asyncFn c_g_subprocess_communicate_async; ///
private alias c_g_subprocess_communicate_finishFn = extern(C) gboolean function(GSubprocess* subprocess, GAsyncResult* result, GBytes** stdoutBuf, GBytes** stderrBuf, GError** _err) nothrow;
__gshared c_g_subprocess_communicate_finishFn c_g_subprocess_communicate_finish; ///
private alias c_g_subprocess_communicate_utf8Fn = extern(C) gboolean function(GSubprocess* subprocess, const(char)* stdinBuf, GCancellable* cancellable, char** stdoutBuf, char** stderrBuf, GError** _err) nothrow;
__gshared c_g_subprocess_communicate_utf8Fn c_g_subprocess_communicate_utf8; ///
private alias c_g_subprocess_communicate_utf8_asyncFn = extern(C) void function(GSubprocess* subprocess, const(char)* stdinBuf, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_subprocess_communicate_utf8_asyncFn c_g_subprocess_communicate_utf8_async; ///
private alias c_g_subprocess_communicate_utf8_finishFn = extern(C) gboolean function(GSubprocess* subprocess, GAsyncResult* result, char** stdoutBuf, char** stderrBuf, GError** _err) nothrow;
__gshared c_g_subprocess_communicate_utf8_finishFn c_g_subprocess_communicate_utf8_finish; ///
private alias c_g_subprocess_force_exitFn = extern(C) void function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_force_exitFn c_g_subprocess_force_exit; ///
private alias c_g_subprocess_get_exit_statusFn = extern(C) int function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_exit_statusFn c_g_subprocess_get_exit_status; ///
private alias c_g_subprocess_get_identifierFn = extern(C) const(char)* function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_identifierFn c_g_subprocess_get_identifier; ///
private alias c_g_subprocess_get_if_exitedFn = extern(C) gboolean function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_if_exitedFn c_g_subprocess_get_if_exited; ///
private alias c_g_subprocess_get_if_signaledFn = extern(C) gboolean function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_if_signaledFn c_g_subprocess_get_if_signaled; ///
private alias c_g_subprocess_get_statusFn = extern(C) int function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_statusFn c_g_subprocess_get_status; ///
private alias c_g_subprocess_get_stderr_pipeFn = extern(C) GInputStream* function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_stderr_pipeFn c_g_subprocess_get_stderr_pipe; ///
private alias c_g_subprocess_get_stdin_pipeFn = extern(C) GOutputStream* function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_stdin_pipeFn c_g_subprocess_get_stdin_pipe; ///
private alias c_g_subprocess_get_stdout_pipeFn = extern(C) GInputStream* function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_stdout_pipeFn c_g_subprocess_get_stdout_pipe; ///
private alias c_g_subprocess_get_successfulFn = extern(C) gboolean function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_successfulFn c_g_subprocess_get_successful; ///
private alias c_g_subprocess_get_term_sigFn = extern(C) int function(GSubprocess* subprocess) nothrow;
__gshared c_g_subprocess_get_term_sigFn c_g_subprocess_get_term_sig; ///
private alias c_g_subprocess_send_signalFn = extern(C) void function(GSubprocess* subprocess, int signalNum) nothrow;
__gshared c_g_subprocess_send_signalFn c_g_subprocess_send_signal; ///
private alias c_g_subprocess_waitFn = extern(C) gboolean function(GSubprocess* subprocess, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_subprocess_waitFn c_g_subprocess_wait; ///
private alias c_g_subprocess_wait_asyncFn = extern(C) void function(GSubprocess* subprocess, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_subprocess_wait_asyncFn c_g_subprocess_wait_async; ///
private alias c_g_subprocess_wait_checkFn = extern(C) gboolean function(GSubprocess* subprocess, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_subprocess_wait_checkFn c_g_subprocess_wait_check; ///
private alias c_g_subprocess_wait_check_asyncFn = extern(C) void function(GSubprocess* subprocess, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_subprocess_wait_check_asyncFn c_g_subprocess_wait_check_async; ///
private alias c_g_subprocess_wait_check_finishFn = extern(C) gboolean function(GSubprocess* subprocess, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_subprocess_wait_check_finishFn c_g_subprocess_wait_check_finish; ///
private alias c_g_subprocess_wait_finishFn = extern(C) gboolean function(GSubprocess* subprocess, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_subprocess_wait_finishFn c_g_subprocess_wait_finish; ///

// SubprocessLauncher
private alias c_g_subprocess_launcher_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_subprocess_launcher_get_typeFn c_g_subprocess_launcher_get_type; ///
private alias c_g_subprocess_launcher_newFn = extern(C) GSubprocessLauncher* function(GSubprocessFlags flags) nothrow;
__gshared c_g_subprocess_launcher_newFn c_g_subprocess_launcher_new; ///
private alias c_g_subprocess_launcher_closeFn = extern(C) void function(GSubprocessLauncher* self) nothrow;
__gshared c_g_subprocess_launcher_closeFn c_g_subprocess_launcher_close; ///
private alias c_g_subprocess_launcher_getenvFn = extern(C) const(char)* function(GSubprocessLauncher* self, const(char)* variable) nothrow;
__gshared c_g_subprocess_launcher_getenvFn c_g_subprocess_launcher_getenv; ///
private alias c_g_subprocess_launcher_set_child_setupFn = extern(C) void function(GSubprocessLauncher* self, GSpawnChildSetupFunc childSetup, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_g_subprocess_launcher_set_child_setupFn c_g_subprocess_launcher_set_child_setup; ///
private alias c_g_subprocess_launcher_set_cwdFn = extern(C) void function(GSubprocessLauncher* self, const(char)* cwd) nothrow;
__gshared c_g_subprocess_launcher_set_cwdFn c_g_subprocess_launcher_set_cwd; ///
private alias c_g_subprocess_launcher_set_environFn = extern(C) void function(GSubprocessLauncher* self, char** env) nothrow;
__gshared c_g_subprocess_launcher_set_environFn c_g_subprocess_launcher_set_environ; ///
private alias c_g_subprocess_launcher_set_flagsFn = extern(C) void function(GSubprocessLauncher* self, GSubprocessFlags flags) nothrow;
__gshared c_g_subprocess_launcher_set_flagsFn c_g_subprocess_launcher_set_flags; ///
private alias c_g_subprocess_launcher_set_stderr_file_pathFn = extern(C) void function(GSubprocessLauncher* self, const(char)* path) nothrow;
__gshared c_g_subprocess_launcher_set_stderr_file_pathFn c_g_subprocess_launcher_set_stderr_file_path; ///
private alias c_g_subprocess_launcher_set_stdin_file_pathFn = extern(C) void function(GSubprocessLauncher* self, const(char)* path) nothrow;
__gshared c_g_subprocess_launcher_set_stdin_file_pathFn c_g_subprocess_launcher_set_stdin_file_path; ///
private alias c_g_subprocess_launcher_set_stdout_file_pathFn = extern(C) void function(GSubprocessLauncher* self, const(char)* path) nothrow;
__gshared c_g_subprocess_launcher_set_stdout_file_pathFn c_g_subprocess_launcher_set_stdout_file_path; ///
private alias c_g_subprocess_launcher_setenvFn = extern(C) void function(GSubprocessLauncher* self, const(char)* variable, const(char)* value, gboolean overwrite) nothrow;
__gshared c_g_subprocess_launcher_setenvFn c_g_subprocess_launcher_setenv; ///
private alias c_g_subprocess_launcher_spawnFn = extern(C) GSubprocess* function(GSubprocessLauncher* self, GError** error, const(char)* argv0,  ...) nothrow;
__gshared c_g_subprocess_launcher_spawnFn c_g_subprocess_launcher_spawn; ///
private alias c_g_subprocess_launcher_spawnvFn = extern(C) GSubprocess* function(GSubprocessLauncher* self, const(char*)* argv, GError** _err) nothrow;
__gshared c_g_subprocess_launcher_spawnvFn c_g_subprocess_launcher_spawnv; ///
private alias c_g_subprocess_launcher_take_fdFn = extern(C) void function(GSubprocessLauncher* self, int sourceFd, int targetFd) nothrow;
__gshared c_g_subprocess_launcher_take_fdFn c_g_subprocess_launcher_take_fd; ///
private alias c_g_subprocess_launcher_take_stderr_fdFn = extern(C) void function(GSubprocessLauncher* self, int fd) nothrow;
__gshared c_g_subprocess_launcher_take_stderr_fdFn c_g_subprocess_launcher_take_stderr_fd; ///
private alias c_g_subprocess_launcher_take_stdin_fdFn = extern(C) void function(GSubprocessLauncher* self, int fd) nothrow;
__gshared c_g_subprocess_launcher_take_stdin_fdFn c_g_subprocess_launcher_take_stdin_fd; ///
private alias c_g_subprocess_launcher_take_stdout_fdFn = extern(C) void function(GSubprocessLauncher* self, int fd) nothrow;
__gshared c_g_subprocess_launcher_take_stdout_fdFn c_g_subprocess_launcher_take_stdout_fd; ///
private alias c_g_subprocess_launcher_unsetenvFn = extern(C) void function(GSubprocessLauncher* self, const(char)* variable) nothrow;
__gshared c_g_subprocess_launcher_unsetenvFn c_g_subprocess_launcher_unsetenv; ///

// Task
private alias c_g_task_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_task_get_typeFn c_g_task_get_type; ///
private alias c_g_task_newFn = extern(C) GTask* function(GObject* sourceObject, GCancellable* cancellable, GAsyncReadyCallback callback, void* callbackData) nothrow;
__gshared c_g_task_newFn c_g_task_new; ///
private alias c_g_task_is_validFn = extern(C) gboolean function(GAsyncResult* result, GObject* sourceObject) nothrow;
__gshared c_g_task_is_validFn c_g_task_is_valid; ///
private alias c_g_task_report_errorFn = extern(C) void function(GObject* sourceObject, GAsyncReadyCallback callback, void* callbackData, void* sourceTag, GError* error) nothrow;
__gshared c_g_task_report_errorFn c_g_task_report_error; ///
private alias c_g_task_report_new_errorFn = extern(C) void function(GObject* sourceObject, GAsyncReadyCallback callback, void* callbackData, void* sourceTag, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_task_report_new_errorFn c_g_task_report_new_error; ///
private alias c_g_task_attach_sourceFn = extern(C) void function(GTask* task, GSource* source, GSourceFunc callback) nothrow;
__gshared c_g_task_attach_sourceFn c_g_task_attach_source; ///
private alias c_g_task_get_cancellableFn = extern(C) GCancellable* function(GTask* task) nothrow;
__gshared c_g_task_get_cancellableFn c_g_task_get_cancellable; ///
private alias c_g_task_get_check_cancellableFn = extern(C) gboolean function(GTask* task) nothrow;
__gshared c_g_task_get_check_cancellableFn c_g_task_get_check_cancellable; ///
private alias c_g_task_get_completedFn = extern(C) gboolean function(GTask* task) nothrow;
__gshared c_g_task_get_completedFn c_g_task_get_completed; ///
private alias c_g_task_get_contextFn = extern(C) GMainContext* function(GTask* task) nothrow;
__gshared c_g_task_get_contextFn c_g_task_get_context; ///
private alias c_g_task_get_nameFn = extern(C) const(char)* function(GTask* task) nothrow;
__gshared c_g_task_get_nameFn c_g_task_get_name; ///
private alias c_g_task_get_priorityFn = extern(C) int function(GTask* task) nothrow;
__gshared c_g_task_get_priorityFn c_g_task_get_priority; ///
private alias c_g_task_get_return_on_cancelFn = extern(C) gboolean function(GTask* task) nothrow;
__gshared c_g_task_get_return_on_cancelFn c_g_task_get_return_on_cancel; ///
private alias c_g_task_get_source_objectFn = extern(C) GObject* function(GTask* task) nothrow;
__gshared c_g_task_get_source_objectFn c_g_task_get_source_object; ///
private alias c_g_task_get_source_tagFn = extern(C) void* function(GTask* task) nothrow;
__gshared c_g_task_get_source_tagFn c_g_task_get_source_tag; ///
private alias c_g_task_get_task_dataFn = extern(C) void* function(GTask* task) nothrow;
__gshared c_g_task_get_task_dataFn c_g_task_get_task_data; ///
private alias c_g_task_had_errorFn = extern(C) gboolean function(GTask* task) nothrow;
__gshared c_g_task_had_errorFn c_g_task_had_error; ///
private alias c_g_task_propagate_booleanFn = extern(C) gboolean function(GTask* task, GError** _err) nothrow;
__gshared c_g_task_propagate_booleanFn c_g_task_propagate_boolean; ///
private alias c_g_task_propagate_intFn = extern(C) ptrdiff_t function(GTask* task, GError** _err) nothrow;
__gshared c_g_task_propagate_intFn c_g_task_propagate_int; ///
private alias c_g_task_propagate_pointerFn = extern(C) void* function(GTask* task, GError** _err) nothrow;
__gshared c_g_task_propagate_pointerFn c_g_task_propagate_pointer; ///
private alias c_g_task_propagate_valueFn = extern(C) gboolean function(GTask* task, GValue* value, GError** _err) nothrow;
__gshared c_g_task_propagate_valueFn c_g_task_propagate_value; ///
private alias c_g_task_return_booleanFn = extern(C) void function(GTask* task, gboolean result) nothrow;
__gshared c_g_task_return_booleanFn c_g_task_return_boolean; ///
private alias c_g_task_return_errorFn = extern(C) void function(GTask* task, GError* error) nothrow;
__gshared c_g_task_return_errorFn c_g_task_return_error; ///
private alias c_g_task_return_error_if_cancelledFn = extern(C) gboolean function(GTask* task) nothrow;
__gshared c_g_task_return_error_if_cancelledFn c_g_task_return_error_if_cancelled; ///
private alias c_g_task_return_intFn = extern(C) void function(GTask* task, ptrdiff_t result) nothrow;
__gshared c_g_task_return_intFn c_g_task_return_int; ///
private alias c_g_task_return_new_errorFn = extern(C) void function(GTask* task, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_task_return_new_errorFn c_g_task_return_new_error; ///
private alias c_g_task_return_new_error_literalFn = extern(C) void function(GTask* task, GQuark domain, int code, const(char)* message) nothrow;
__gshared c_g_task_return_new_error_literalFn c_g_task_return_new_error_literal; ///
private alias c_g_task_return_pointerFn = extern(C) void function(GTask* task, void* result, GDestroyNotify resultDestroy) nothrow;
__gshared c_g_task_return_pointerFn c_g_task_return_pointer; ///
private alias c_g_task_return_prefixed_errorFn = extern(C) void function(GTask* task, GError* error, const(char)* format,  ...) nothrow;
__gshared c_g_task_return_prefixed_errorFn c_g_task_return_prefixed_error; ///
private alias c_g_task_return_valueFn = extern(C) void function(GTask* task, GValue* result) nothrow;
__gshared c_g_task_return_valueFn c_g_task_return_value; ///
private alias c_g_task_run_in_threadFn = extern(C) void function(GTask* task, GTaskThreadFunc taskFunc) nothrow;
__gshared c_g_task_run_in_threadFn c_g_task_run_in_thread; ///
private alias c_g_task_run_in_thread_syncFn = extern(C) void function(GTask* task, GTaskThreadFunc taskFunc) nothrow;
__gshared c_g_task_run_in_thread_syncFn c_g_task_run_in_thread_sync; ///
private alias c_g_task_set_check_cancellableFn = extern(C) void function(GTask* task, gboolean checkCancellable) nothrow;
__gshared c_g_task_set_check_cancellableFn c_g_task_set_check_cancellable; ///
private alias c_g_task_set_nameFn = extern(C) void function(GTask* task, const(char)* name) nothrow;
__gshared c_g_task_set_nameFn c_g_task_set_name; ///
private alias c_g_task_set_priorityFn = extern(C) void function(GTask* task, int priority) nothrow;
__gshared c_g_task_set_priorityFn c_g_task_set_priority; ///
private alias c_g_task_set_return_on_cancelFn = extern(C) gboolean function(GTask* task, gboolean returnOnCancel) nothrow;
__gshared c_g_task_set_return_on_cancelFn c_g_task_set_return_on_cancel; ///
private alias c_g_task_set_source_tagFn = extern(C) void function(GTask* task, void* sourceTag) nothrow;
__gshared c_g_task_set_source_tagFn c_g_task_set_source_tag; ///
private alias c_g_task_set_static_nameFn = extern(C) void function(GTask* task, const(char)* name) nothrow;
__gshared c_g_task_set_static_nameFn c_g_task_set_static_name; ///
private alias c_g_task_set_task_dataFn = extern(C) void function(GTask* task, void* taskData, GDestroyNotify taskDataDestroy) nothrow;
__gshared c_g_task_set_task_dataFn c_g_task_set_task_data; ///

// TcpConnection
private alias c_g_tcp_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tcp_connection_get_typeFn c_g_tcp_connection_get_type; ///
private alias c_g_tcp_connection_get_graceful_disconnectFn = extern(C) gboolean function(GTcpConnection* connection) nothrow;
__gshared c_g_tcp_connection_get_graceful_disconnectFn c_g_tcp_connection_get_graceful_disconnect; ///
private alias c_g_tcp_connection_set_graceful_disconnectFn = extern(C) void function(GTcpConnection* connection, gboolean gracefulDisconnect) nothrow;
__gshared c_g_tcp_connection_set_graceful_disconnectFn c_g_tcp_connection_set_graceful_disconnect; ///

// TcpWrapperConnection
private alias c_g_tcp_wrapper_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tcp_wrapper_connection_get_typeFn c_g_tcp_wrapper_connection_get_type; ///
private alias c_g_tcp_wrapper_connection_newFn = extern(C) GSocketConnection* function(GIOStream* baseIoStream, GSocket* socket) nothrow;
__gshared c_g_tcp_wrapper_connection_newFn c_g_tcp_wrapper_connection_new; ///
private alias c_g_tcp_wrapper_connection_get_base_io_streamFn = extern(C) GIOStream* function(GTcpWrapperConnection* conn) nothrow;
__gshared c_g_tcp_wrapper_connection_get_base_io_streamFn c_g_tcp_wrapper_connection_get_base_io_stream; ///

// TestDBus
private alias c_g_test_dbus_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_test_dbus_get_typeFn c_g_test_dbus_get_type; ///
private alias c_g_test_dbus_newFn = extern(C) GTestDBus* function(GTestDBusFlags flags) nothrow;
__gshared c_g_test_dbus_newFn c_g_test_dbus_new; ///
private alias c_g_test_dbus_unsetFn = extern(C) void function() nothrow;
__gshared c_g_test_dbus_unsetFn c_g_test_dbus_unset; ///
private alias c_g_test_dbus_add_service_dirFn = extern(C) void function(GTestDBus* self, const(char)* path) nothrow;
__gshared c_g_test_dbus_add_service_dirFn c_g_test_dbus_add_service_dir; ///
private alias c_g_test_dbus_downFn = extern(C) void function(GTestDBus* self) nothrow;
__gshared c_g_test_dbus_downFn c_g_test_dbus_down; ///
private alias c_g_test_dbus_get_bus_addressFn = extern(C) const(char)* function(GTestDBus* self) nothrow;
__gshared c_g_test_dbus_get_bus_addressFn c_g_test_dbus_get_bus_address; ///
private alias c_g_test_dbus_get_flagsFn = extern(C) GTestDBusFlags function(GTestDBus* self) nothrow;
__gshared c_g_test_dbus_get_flagsFn c_g_test_dbus_get_flags; ///
private alias c_g_test_dbus_stopFn = extern(C) void function(GTestDBus* self) nothrow;
__gshared c_g_test_dbus_stopFn c_g_test_dbus_stop; ///
private alias c_g_test_dbus_upFn = extern(C) void function(GTestDBus* self) nothrow;
__gshared c_g_test_dbus_upFn c_g_test_dbus_up; ///

// ThemedIcon
private alias c_g_themed_icon_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_themed_icon_get_typeFn c_g_themed_icon_get_type; ///
private alias c_g_themed_icon_newFn = extern(C) GIcon* function(const(char)* iconname) nothrow;
__gshared c_g_themed_icon_newFn c_g_themed_icon_new; ///
private alias c_g_themed_icon_new_from_namesFn = extern(C) GIcon* function(char** iconnames, int len) nothrow;
__gshared c_g_themed_icon_new_from_namesFn c_g_themed_icon_new_from_names; ///
private alias c_g_themed_icon_new_with_default_fallbacksFn = extern(C) GIcon* function(const(char)* iconname) nothrow;
__gshared c_g_themed_icon_new_with_default_fallbacksFn c_g_themed_icon_new_with_default_fallbacks; ///
private alias c_g_themed_icon_append_nameFn = extern(C) void function(GThemedIcon* icon, const(char)* iconname) nothrow;
__gshared c_g_themed_icon_append_nameFn c_g_themed_icon_append_name; ///
private alias c_g_themed_icon_get_namesFn = extern(C) const(char*)* function(GThemedIcon* icon) nothrow;
__gshared c_g_themed_icon_get_namesFn c_g_themed_icon_get_names; ///
private alias c_g_themed_icon_prepend_nameFn = extern(C) void function(GThemedIcon* icon, const(char)* iconname) nothrow;
__gshared c_g_themed_icon_prepend_nameFn c_g_themed_icon_prepend_name; ///

// ThreadedResolver
private alias c_g_threaded_resolver_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_threaded_resolver_get_typeFn c_g_threaded_resolver_get_type; ///

// ThreadedSocketService
private alias c_g_threaded_socket_service_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_threaded_socket_service_get_typeFn c_g_threaded_socket_service_get_type; ///
private alias c_g_threaded_socket_service_newFn = extern(C) GSocketService* function(int maxThreads) nothrow;
__gshared c_g_threaded_socket_service_newFn c_g_threaded_socket_service_new; ///

// TlsBackend
private alias c_g_tls_backend_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_backend_get_typeFn c_g_tls_backend_get_type; ///
private alias c_g_tls_backend_get_defaultFn = extern(C) GTlsBackend* function() nothrow;
__gshared c_g_tls_backend_get_defaultFn c_g_tls_backend_get_default; ///
private alias c_g_tls_backend_get_certificate_typeFn = extern(C) GType function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_certificate_typeFn c_g_tls_backend_get_certificate_type; ///
private alias c_g_tls_backend_get_client_connection_typeFn = extern(C) GType function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_client_connection_typeFn c_g_tls_backend_get_client_connection_type; ///
private alias c_g_tls_backend_get_default_databaseFn = extern(C) GTlsDatabase* function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_default_databaseFn c_g_tls_backend_get_default_database; ///
private alias c_g_tls_backend_get_dtls_client_connection_typeFn = extern(C) GType function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_dtls_client_connection_typeFn c_g_tls_backend_get_dtls_client_connection_type; ///
private alias c_g_tls_backend_get_dtls_server_connection_typeFn = extern(C) GType function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_dtls_server_connection_typeFn c_g_tls_backend_get_dtls_server_connection_type; ///
private alias c_g_tls_backend_get_file_database_typeFn = extern(C) GType function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_file_database_typeFn c_g_tls_backend_get_file_database_type; ///
private alias c_g_tls_backend_get_server_connection_typeFn = extern(C) GType function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_get_server_connection_typeFn c_g_tls_backend_get_server_connection_type; ///
private alias c_g_tls_backend_set_default_databaseFn = extern(C) void function(GTlsBackend* backend, GTlsDatabase* database) nothrow;
__gshared c_g_tls_backend_set_default_databaseFn c_g_tls_backend_set_default_database; ///
private alias c_g_tls_backend_supports_dtlsFn = extern(C) gboolean function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_supports_dtlsFn c_g_tls_backend_supports_dtls; ///
private alias c_g_tls_backend_supports_tlsFn = extern(C) gboolean function(GTlsBackend* backend) nothrow;
__gshared c_g_tls_backend_supports_tlsFn c_g_tls_backend_supports_tls; ///

// TlsCertificate
private alias c_g_tls_certificate_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_certificate_get_typeFn c_g_tls_certificate_get_type; ///
private alias c_g_tls_certificate_new_from_fileFn = extern(C) GTlsCertificate* function(const(char)* file, GError** _err) nothrow;
__gshared c_g_tls_certificate_new_from_fileFn c_g_tls_certificate_new_from_file; ///
private alias c_g_tls_certificate_new_from_file_with_passwordFn = extern(C) GTlsCertificate* function(const(char)* file, const(char)* password, GError** _err) nothrow;
__gshared c_g_tls_certificate_new_from_file_with_passwordFn c_g_tls_certificate_new_from_file_with_password; ///
private alias c_g_tls_certificate_new_from_filesFn = extern(C) GTlsCertificate* function(const(char)* certFile, const(char)* keyFile, GError** _err) nothrow;
__gshared c_g_tls_certificate_new_from_filesFn c_g_tls_certificate_new_from_files; ///
private alias c_g_tls_certificate_new_from_pemFn = extern(C) GTlsCertificate* function(const(char)* data, ptrdiff_t length, GError** _err) nothrow;
__gshared c_g_tls_certificate_new_from_pemFn c_g_tls_certificate_new_from_pem; ///
private alias c_g_tls_certificate_new_from_pkcs11_urisFn = extern(C) GTlsCertificate* function(const(char)* pkcs11Uri, const(char)* privateKeyPkcs11Uri, GError** _err) nothrow;
__gshared c_g_tls_certificate_new_from_pkcs11_urisFn c_g_tls_certificate_new_from_pkcs11_uris; ///
private alias c_g_tls_certificate_new_from_pkcs12Fn = extern(C) GTlsCertificate* function(const(ubyte)* data, size_t length, const(char)* password, GError** _err) nothrow;
__gshared c_g_tls_certificate_new_from_pkcs12Fn c_g_tls_certificate_new_from_pkcs12; ///
private alias c_g_tls_certificate_list_new_from_fileFn = extern(C) GList* function(const(char)* file, GError** _err) nothrow;
__gshared c_g_tls_certificate_list_new_from_fileFn c_g_tls_certificate_list_new_from_file; ///
private alias c_g_tls_certificate_get_dns_namesFn = extern(C) GPtrArray* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_dns_namesFn c_g_tls_certificate_get_dns_names; ///
private alias c_g_tls_certificate_get_ip_addressesFn = extern(C) GPtrArray* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_ip_addressesFn c_g_tls_certificate_get_ip_addresses; ///
private alias c_g_tls_certificate_get_issuerFn = extern(C) GTlsCertificate* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_issuerFn c_g_tls_certificate_get_issuer; ///
private alias c_g_tls_certificate_get_issuer_nameFn = extern(C) char* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_issuer_nameFn c_g_tls_certificate_get_issuer_name; ///
private alias c_g_tls_certificate_get_not_valid_afterFn = extern(C) GDateTime* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_not_valid_afterFn c_g_tls_certificate_get_not_valid_after; ///
private alias c_g_tls_certificate_get_not_valid_beforeFn = extern(C) GDateTime* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_not_valid_beforeFn c_g_tls_certificate_get_not_valid_before; ///
private alias c_g_tls_certificate_get_subject_nameFn = extern(C) char* function(GTlsCertificate* cert) nothrow;
__gshared c_g_tls_certificate_get_subject_nameFn c_g_tls_certificate_get_subject_name; ///
private alias c_g_tls_certificate_is_sameFn = extern(C) gboolean function(GTlsCertificate* certOne, GTlsCertificate* certTwo) nothrow;
__gshared c_g_tls_certificate_is_sameFn c_g_tls_certificate_is_same; ///
private alias c_g_tls_certificate_verifyFn = extern(C) GTlsCertificateFlags function(GTlsCertificate* cert, GSocketConnectable* identity, GTlsCertificate* trustedCa) nothrow;
__gshared c_g_tls_certificate_verifyFn c_g_tls_certificate_verify; ///

// TlsClientConnection
private alias c_g_tls_client_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_client_connection_get_typeFn c_g_tls_client_connection_get_type; ///
private alias c_g_tls_client_connection_newFn = extern(C) GIOStream* function(GIOStream* baseIoStream, GSocketConnectable* serverIdentity, GError** _err) nothrow;
__gshared c_g_tls_client_connection_newFn c_g_tls_client_connection_new; ///
private alias c_g_tls_client_connection_copy_session_stateFn = extern(C) void function(GTlsClientConnection* conn, GTlsClientConnection* source) nothrow;
__gshared c_g_tls_client_connection_copy_session_stateFn c_g_tls_client_connection_copy_session_state; ///
private alias c_g_tls_client_connection_get_accepted_casFn = extern(C) GList* function(GTlsClientConnection* conn) nothrow;
__gshared c_g_tls_client_connection_get_accepted_casFn c_g_tls_client_connection_get_accepted_cas; ///
private alias c_g_tls_client_connection_get_server_identityFn = extern(C) GSocketConnectable* function(GTlsClientConnection* conn) nothrow;
__gshared c_g_tls_client_connection_get_server_identityFn c_g_tls_client_connection_get_server_identity; ///
private alias c_g_tls_client_connection_get_use_ssl3Fn = extern(C) gboolean function(GTlsClientConnection* conn) nothrow;
__gshared c_g_tls_client_connection_get_use_ssl3Fn c_g_tls_client_connection_get_use_ssl3; ///
private alias c_g_tls_client_connection_get_validation_flagsFn = extern(C) GTlsCertificateFlags function(GTlsClientConnection* conn) nothrow;
__gshared c_g_tls_client_connection_get_validation_flagsFn c_g_tls_client_connection_get_validation_flags; ///
private alias c_g_tls_client_connection_set_server_identityFn = extern(C) void function(GTlsClientConnection* conn, GSocketConnectable* identity) nothrow;
__gshared c_g_tls_client_connection_set_server_identityFn c_g_tls_client_connection_set_server_identity; ///
private alias c_g_tls_client_connection_set_use_ssl3Fn = extern(C) void function(GTlsClientConnection* conn, gboolean useSsl3) nothrow;
__gshared c_g_tls_client_connection_set_use_ssl3Fn c_g_tls_client_connection_set_use_ssl3; ///
private alias c_g_tls_client_connection_set_validation_flagsFn = extern(C) void function(GTlsClientConnection* conn, GTlsCertificateFlags flags) nothrow;
__gshared c_g_tls_client_connection_set_validation_flagsFn c_g_tls_client_connection_set_validation_flags; ///

// TlsConnection
private alias c_g_tls_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_connection_get_typeFn c_g_tls_connection_get_type; ///
private alias c_g_tls_connection_emit_accept_certificateFn = extern(C) gboolean function(GTlsConnection* conn, GTlsCertificate* peerCert, GTlsCertificateFlags errors) nothrow;
__gshared c_g_tls_connection_emit_accept_certificateFn c_g_tls_connection_emit_accept_certificate; ///
private alias c_g_tls_connection_get_certificateFn = extern(C) GTlsCertificate* function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_certificateFn c_g_tls_connection_get_certificate; ///
private alias c_g_tls_connection_get_channel_binding_dataFn = extern(C) gboolean function(GTlsConnection* conn, GTlsChannelBindingType type, GByteArray* data, GError** _err) nothrow;
__gshared c_g_tls_connection_get_channel_binding_dataFn c_g_tls_connection_get_channel_binding_data; ///
private alias c_g_tls_connection_get_ciphersuite_nameFn = extern(C) char* function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_ciphersuite_nameFn c_g_tls_connection_get_ciphersuite_name; ///
private alias c_g_tls_connection_get_databaseFn = extern(C) GTlsDatabase* function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_databaseFn c_g_tls_connection_get_database; ///
private alias c_g_tls_connection_get_interactionFn = extern(C) GTlsInteraction* function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_interactionFn c_g_tls_connection_get_interaction; ///
private alias c_g_tls_connection_get_negotiated_protocolFn = extern(C) const(char)* function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_negotiated_protocolFn c_g_tls_connection_get_negotiated_protocol; ///
private alias c_g_tls_connection_get_peer_certificateFn = extern(C) GTlsCertificate* function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_peer_certificateFn c_g_tls_connection_get_peer_certificate; ///
private alias c_g_tls_connection_get_peer_certificate_errorsFn = extern(C) GTlsCertificateFlags function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_peer_certificate_errorsFn c_g_tls_connection_get_peer_certificate_errors; ///
private alias c_g_tls_connection_get_protocol_versionFn = extern(C) GTlsProtocolVersion function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_protocol_versionFn c_g_tls_connection_get_protocol_version; ///
private alias c_g_tls_connection_get_rehandshake_modeFn = extern(C) GTlsRehandshakeMode function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_rehandshake_modeFn c_g_tls_connection_get_rehandshake_mode; ///
private alias c_g_tls_connection_get_require_close_notifyFn = extern(C) gboolean function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_require_close_notifyFn c_g_tls_connection_get_require_close_notify; ///
private alias c_g_tls_connection_get_use_system_certdbFn = extern(C) gboolean function(GTlsConnection* conn) nothrow;
__gshared c_g_tls_connection_get_use_system_certdbFn c_g_tls_connection_get_use_system_certdb; ///
private alias c_g_tls_connection_handshakeFn = extern(C) gboolean function(GTlsConnection* conn, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_connection_handshakeFn c_g_tls_connection_handshake; ///
private alias c_g_tls_connection_handshake_asyncFn = extern(C) void function(GTlsConnection* conn, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_connection_handshake_asyncFn c_g_tls_connection_handshake_async; ///
private alias c_g_tls_connection_handshake_finishFn = extern(C) gboolean function(GTlsConnection* conn, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_connection_handshake_finishFn c_g_tls_connection_handshake_finish; ///
private alias c_g_tls_connection_set_advertised_protocolsFn = extern(C) void function(GTlsConnection* conn, const(char*)* protocols) nothrow;
__gshared c_g_tls_connection_set_advertised_protocolsFn c_g_tls_connection_set_advertised_protocols; ///
private alias c_g_tls_connection_set_certificateFn = extern(C) void function(GTlsConnection* conn, GTlsCertificate* certificate) nothrow;
__gshared c_g_tls_connection_set_certificateFn c_g_tls_connection_set_certificate; ///
private alias c_g_tls_connection_set_databaseFn = extern(C) void function(GTlsConnection* conn, GTlsDatabase* database) nothrow;
__gshared c_g_tls_connection_set_databaseFn c_g_tls_connection_set_database; ///
private alias c_g_tls_connection_set_interactionFn = extern(C) void function(GTlsConnection* conn, GTlsInteraction* interaction) nothrow;
__gshared c_g_tls_connection_set_interactionFn c_g_tls_connection_set_interaction; ///
private alias c_g_tls_connection_set_rehandshake_modeFn = extern(C) void function(GTlsConnection* conn, GTlsRehandshakeMode mode) nothrow;
__gshared c_g_tls_connection_set_rehandshake_modeFn c_g_tls_connection_set_rehandshake_mode; ///
private alias c_g_tls_connection_set_require_close_notifyFn = extern(C) void function(GTlsConnection* conn, gboolean requireCloseNotify) nothrow;
__gshared c_g_tls_connection_set_require_close_notifyFn c_g_tls_connection_set_require_close_notify; ///
private alias c_g_tls_connection_set_use_system_certdbFn = extern(C) void function(GTlsConnection* conn, gboolean useSystemCertdb) nothrow;
__gshared c_g_tls_connection_set_use_system_certdbFn c_g_tls_connection_set_use_system_certdb; ///

// TlsDatabase
private alias c_g_tls_database_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_database_get_typeFn c_g_tls_database_get_type; ///
private alias c_g_tls_database_create_certificate_handleFn = extern(C) char* function(GTlsDatabase* self, GTlsCertificate* certificate) nothrow;
__gshared c_g_tls_database_create_certificate_handleFn c_g_tls_database_create_certificate_handle; ///
private alias c_g_tls_database_lookup_certificate_for_handleFn = extern(C) GTlsCertificate* function(GTlsDatabase* self, const(char)* handle, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_database_lookup_certificate_for_handleFn c_g_tls_database_lookup_certificate_for_handle; ///
private alias c_g_tls_database_lookup_certificate_for_handle_asyncFn = extern(C) void function(GTlsDatabase* self, const(char)* handle, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_database_lookup_certificate_for_handle_asyncFn c_g_tls_database_lookup_certificate_for_handle_async; ///
private alias c_g_tls_database_lookup_certificate_for_handle_finishFn = extern(C) GTlsCertificate* function(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_database_lookup_certificate_for_handle_finishFn c_g_tls_database_lookup_certificate_for_handle_finish; ///
private alias c_g_tls_database_lookup_certificate_issuerFn = extern(C) GTlsCertificate* function(GTlsDatabase* self, GTlsCertificate* certificate, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_database_lookup_certificate_issuerFn c_g_tls_database_lookup_certificate_issuer; ///
private alias c_g_tls_database_lookup_certificate_issuer_asyncFn = extern(C) void function(GTlsDatabase* self, GTlsCertificate* certificate, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_database_lookup_certificate_issuer_asyncFn c_g_tls_database_lookup_certificate_issuer_async; ///
private alias c_g_tls_database_lookup_certificate_issuer_finishFn = extern(C) GTlsCertificate* function(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_database_lookup_certificate_issuer_finishFn c_g_tls_database_lookup_certificate_issuer_finish; ///
private alias c_g_tls_database_lookup_certificates_issued_byFn = extern(C) GList* function(GTlsDatabase* self, GByteArray* issuerRawDn, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_database_lookup_certificates_issued_byFn c_g_tls_database_lookup_certificates_issued_by; ///
private alias c_g_tls_database_lookup_certificates_issued_by_asyncFn = extern(C) void function(GTlsDatabase* self, GByteArray* issuerRawDn, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_database_lookup_certificates_issued_by_asyncFn c_g_tls_database_lookup_certificates_issued_by_async; ///
private alias c_g_tls_database_lookup_certificates_issued_by_finishFn = extern(C) GList* function(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_database_lookup_certificates_issued_by_finishFn c_g_tls_database_lookup_certificates_issued_by_finish; ///
private alias c_g_tls_database_verify_chainFn = extern(C) GTlsCertificateFlags function(GTlsDatabase* self, GTlsCertificate* chain, const(char)* purpose, GSocketConnectable* identity, GTlsInteraction* interaction, GTlsDatabaseVerifyFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_database_verify_chainFn c_g_tls_database_verify_chain; ///
private alias c_g_tls_database_verify_chain_asyncFn = extern(C) void function(GTlsDatabase* self, GTlsCertificate* chain, const(char)* purpose, GSocketConnectable* identity, GTlsInteraction* interaction, GTlsDatabaseVerifyFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_database_verify_chain_asyncFn c_g_tls_database_verify_chain_async; ///
private alias c_g_tls_database_verify_chain_finishFn = extern(C) GTlsCertificateFlags function(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_database_verify_chain_finishFn c_g_tls_database_verify_chain_finish; ///

// TlsFileDatabase
private alias c_g_tls_file_database_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_file_database_get_typeFn c_g_tls_file_database_get_type; ///
private alias c_g_tls_file_database_newFn = extern(C) GTlsDatabase* function(const(char)* anchors, GError** _err) nothrow;
__gshared c_g_tls_file_database_newFn c_g_tls_file_database_new; ///

// TlsInteraction
private alias c_g_tls_interaction_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_interaction_get_typeFn c_g_tls_interaction_get_type; ///
private alias c_g_tls_interaction_ask_passwordFn = extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GTlsPassword* password, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_interaction_ask_passwordFn c_g_tls_interaction_ask_password; ///
private alias c_g_tls_interaction_ask_password_asyncFn = extern(C) void function(GTlsInteraction* interaction, GTlsPassword* password, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_interaction_ask_password_asyncFn c_g_tls_interaction_ask_password_async; ///
private alias c_g_tls_interaction_ask_password_finishFn = extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_interaction_ask_password_finishFn c_g_tls_interaction_ask_password_finish; ///
private alias c_g_tls_interaction_invoke_ask_passwordFn = extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GTlsPassword* password, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_interaction_invoke_ask_passwordFn c_g_tls_interaction_invoke_ask_password; ///
private alias c_g_tls_interaction_invoke_request_certificateFn = extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GTlsConnection* connection, GTlsCertificateRequestFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_interaction_invoke_request_certificateFn c_g_tls_interaction_invoke_request_certificate; ///
private alias c_g_tls_interaction_request_certificateFn = extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GTlsConnection* connection, GTlsCertificateRequestFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_tls_interaction_request_certificateFn c_g_tls_interaction_request_certificate; ///
private alias c_g_tls_interaction_request_certificate_asyncFn = extern(C) void function(GTlsInteraction* interaction, GTlsConnection* connection, GTlsCertificateRequestFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_tls_interaction_request_certificate_asyncFn c_g_tls_interaction_request_certificate_async; ///
private alias c_g_tls_interaction_request_certificate_finishFn = extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_tls_interaction_request_certificate_finishFn c_g_tls_interaction_request_certificate_finish; ///

// TlsPassword
private alias c_g_tls_password_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_password_get_typeFn c_g_tls_password_get_type; ///
private alias c_g_tls_password_newFn = extern(C) GTlsPassword* function(GTlsPasswordFlags flags, const(char)* description) nothrow;
__gshared c_g_tls_password_newFn c_g_tls_password_new; ///
private alias c_g_tls_password_get_descriptionFn = extern(C) const(char)* function(GTlsPassword* password) nothrow;
__gshared c_g_tls_password_get_descriptionFn c_g_tls_password_get_description; ///
private alias c_g_tls_password_get_flagsFn = extern(C) GTlsPasswordFlags function(GTlsPassword* password) nothrow;
__gshared c_g_tls_password_get_flagsFn c_g_tls_password_get_flags; ///
private alias c_g_tls_password_get_valueFn = extern(C) const(ubyte)* function(GTlsPassword* password, size_t* length) nothrow;
__gshared c_g_tls_password_get_valueFn c_g_tls_password_get_value; ///
private alias c_g_tls_password_get_warningFn = extern(C) const(char)* function(GTlsPassword* password) nothrow;
__gshared c_g_tls_password_get_warningFn c_g_tls_password_get_warning; ///
private alias c_g_tls_password_set_descriptionFn = extern(C) void function(GTlsPassword* password, const(char)* description) nothrow;
__gshared c_g_tls_password_set_descriptionFn c_g_tls_password_set_description; ///
private alias c_g_tls_password_set_flagsFn = extern(C) void function(GTlsPassword* password, GTlsPasswordFlags flags) nothrow;
__gshared c_g_tls_password_set_flagsFn c_g_tls_password_set_flags; ///
private alias c_g_tls_password_set_valueFn = extern(C) void function(GTlsPassword* password, const(ubyte)* value, ptrdiff_t length) nothrow;
__gshared c_g_tls_password_set_valueFn c_g_tls_password_set_value; ///
private alias c_g_tls_password_set_value_fullFn = extern(C) void function(GTlsPassword* password, ubyte* value, ptrdiff_t length, GDestroyNotify destroy) nothrow;
__gshared c_g_tls_password_set_value_fullFn c_g_tls_password_set_value_full; ///
private alias c_g_tls_password_set_warningFn = extern(C) void function(GTlsPassword* password, const(char)* warning) nothrow;
__gshared c_g_tls_password_set_warningFn c_g_tls_password_set_warning; ///

// TlsServerConnection
private alias c_g_tls_server_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tls_server_connection_get_typeFn c_g_tls_server_connection_get_type; ///
private alias c_g_tls_server_connection_newFn = extern(C) GIOStream* function(GIOStream* baseIoStream, GTlsCertificate* certificate, GError** _err) nothrow;
__gshared c_g_tls_server_connection_newFn c_g_tls_server_connection_new; ///

// UnixConnection
private alias c_g_unix_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_connection_get_typeFn c_g_unix_connection_get_type; ///
private alias c_g_unix_connection_receive_credentialsFn = extern(C) GCredentials* function(GUnixConnection* connection, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_unix_connection_receive_credentialsFn c_g_unix_connection_receive_credentials; ///
private alias c_g_unix_connection_receive_credentials_asyncFn = extern(C) void function(GUnixConnection* connection, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_unix_connection_receive_credentials_asyncFn c_g_unix_connection_receive_credentials_async; ///
private alias c_g_unix_connection_receive_credentials_finishFn = extern(C) GCredentials* function(GUnixConnection* connection, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_unix_connection_receive_credentials_finishFn c_g_unix_connection_receive_credentials_finish; ///
private alias c_g_unix_connection_receive_fdFn = extern(C) int function(GUnixConnection* connection, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_unix_connection_receive_fdFn c_g_unix_connection_receive_fd; ///
private alias c_g_unix_connection_send_credentialsFn = extern(C) gboolean function(GUnixConnection* connection, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_unix_connection_send_credentialsFn c_g_unix_connection_send_credentials; ///
private alias c_g_unix_connection_send_credentials_asyncFn = extern(C) void function(GUnixConnection* connection, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_unix_connection_send_credentials_asyncFn c_g_unix_connection_send_credentials_async; ///
private alias c_g_unix_connection_send_credentials_finishFn = extern(C) gboolean function(GUnixConnection* connection, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_unix_connection_send_credentials_finishFn c_g_unix_connection_send_credentials_finish; ///
private alias c_g_unix_connection_send_fdFn = extern(C) gboolean function(GUnixConnection* connection, int fd, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_unix_connection_send_fdFn c_g_unix_connection_send_fd; ///

// UnixCredentialsMessage
private alias c_g_unix_credentials_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_credentials_message_get_typeFn c_g_unix_credentials_message_get_type; ///
private alias c_g_unix_credentials_message_newFn = extern(C) GSocketControlMessage* function() nothrow;
__gshared c_g_unix_credentials_message_newFn c_g_unix_credentials_message_new; ///
private alias c_g_unix_credentials_message_new_with_credentialsFn = extern(C) GSocketControlMessage* function(GCredentials* credentials) nothrow;
__gshared c_g_unix_credentials_message_new_with_credentialsFn c_g_unix_credentials_message_new_with_credentials; ///
private alias c_g_unix_credentials_message_is_supportedFn = extern(C) gboolean function() nothrow;
__gshared c_g_unix_credentials_message_is_supportedFn c_g_unix_credentials_message_is_supported; ///
private alias c_g_unix_credentials_message_get_credentialsFn = extern(C) GCredentials* function(GUnixCredentialsMessage* message) nothrow;
__gshared c_g_unix_credentials_message_get_credentialsFn c_g_unix_credentials_message_get_credentials; ///

// UnixFDList
private alias c_g_unix_fd_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_fd_list_get_typeFn c_g_unix_fd_list_get_type; ///
private alias c_g_unix_fd_list_newFn = extern(C) GUnixFDList* function() nothrow;
__gshared c_g_unix_fd_list_newFn c_g_unix_fd_list_new; ///
private alias c_g_unix_fd_list_new_from_arrayFn = extern(C) GUnixFDList* function(const(int)* fds, int nFds) nothrow;
__gshared c_g_unix_fd_list_new_from_arrayFn c_g_unix_fd_list_new_from_array; ///
private alias c_g_unix_fd_list_appendFn = extern(C) int function(GUnixFDList* list, int fd, GError** _err) nothrow;
__gshared c_g_unix_fd_list_appendFn c_g_unix_fd_list_append; ///
private alias c_g_unix_fd_list_getFn = extern(C) int function(GUnixFDList* list, int index, GError** _err) nothrow;
__gshared c_g_unix_fd_list_getFn c_g_unix_fd_list_get; ///
private alias c_g_unix_fd_list_get_lengthFn = extern(C) int function(GUnixFDList* list) nothrow;
__gshared c_g_unix_fd_list_get_lengthFn c_g_unix_fd_list_get_length; ///
private alias c_g_unix_fd_list_peek_fdsFn = extern(C) const(int)* function(GUnixFDList* list, int* length) nothrow;
__gshared c_g_unix_fd_list_peek_fdsFn c_g_unix_fd_list_peek_fds; ///
private alias c_g_unix_fd_list_steal_fdsFn = extern(C) int* function(GUnixFDList* list, int* length) nothrow;
__gshared c_g_unix_fd_list_steal_fdsFn c_g_unix_fd_list_steal_fds; ///

// UnixSocketAddress
private alias c_g_unix_socket_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_unix_socket_address_get_typeFn c_g_unix_socket_address_get_type; ///
private alias c_g_unix_socket_address_newFn = extern(C) GSocketAddress* function(const(char)* path) nothrow;
__gshared c_g_unix_socket_address_newFn c_g_unix_socket_address_new; ///
private alias c_g_unix_socket_address_new_abstractFn = extern(C) GSocketAddress* function(const(char)* path, int pathLen) nothrow;
__gshared c_g_unix_socket_address_new_abstractFn c_g_unix_socket_address_new_abstract; ///
private alias c_g_unix_socket_address_new_with_typeFn = extern(C) GSocketAddress* function(const(char)* path, int pathLen, GUnixSocketAddressType type) nothrow;
__gshared c_g_unix_socket_address_new_with_typeFn c_g_unix_socket_address_new_with_type; ///
private alias c_g_unix_socket_address_abstract_names_supportedFn = extern(C) gboolean function() nothrow;
__gshared c_g_unix_socket_address_abstract_names_supportedFn c_g_unix_socket_address_abstract_names_supported; ///
private alias c_g_unix_socket_address_get_address_typeFn = extern(C) GUnixSocketAddressType function(GUnixSocketAddress* address) nothrow;
__gshared c_g_unix_socket_address_get_address_typeFn c_g_unix_socket_address_get_address_type; ///
private alias c_g_unix_socket_address_get_is_abstractFn = extern(C) gboolean function(GUnixSocketAddress* address) nothrow;
__gshared c_g_unix_socket_address_get_is_abstractFn c_g_unix_socket_address_get_is_abstract; ///
private alias c_g_unix_socket_address_get_pathFn = extern(C) const(char)* function(GUnixSocketAddress* address) nothrow;
__gshared c_g_unix_socket_address_get_pathFn c_g_unix_socket_address_get_path; ///
private alias c_g_unix_socket_address_get_path_lenFn = extern(C) size_t function(GUnixSocketAddress* address) nothrow;
__gshared c_g_unix_socket_address_get_path_lenFn c_g_unix_socket_address_get_path_len; ///

// Vfs
private alias c_g_vfs_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_vfs_get_typeFn c_g_vfs_get_type; ///
private alias c_g_vfs_get_defaultFn = extern(C) GVfs* function() nothrow;
__gshared c_g_vfs_get_defaultFn c_g_vfs_get_default; ///
private alias c_g_vfs_get_localFn = extern(C) GVfs* function() nothrow;
__gshared c_g_vfs_get_localFn c_g_vfs_get_local; ///
private alias c_g_vfs_get_file_for_pathFn = extern(C) GFile* function(GVfs* vfs, const(char)* path) nothrow;
__gshared c_g_vfs_get_file_for_pathFn c_g_vfs_get_file_for_path; ///
private alias c_g_vfs_get_file_for_uriFn = extern(C) GFile* function(GVfs* vfs, const(char)* uri) nothrow;
__gshared c_g_vfs_get_file_for_uriFn c_g_vfs_get_file_for_uri; ///
private alias c_g_vfs_get_supported_uri_schemesFn = extern(C) const(char*)* function(GVfs* vfs) nothrow;
__gshared c_g_vfs_get_supported_uri_schemesFn c_g_vfs_get_supported_uri_schemes; ///
private alias c_g_vfs_is_activeFn = extern(C) gboolean function(GVfs* vfs) nothrow;
__gshared c_g_vfs_is_activeFn c_g_vfs_is_active; ///
private alias c_g_vfs_parse_nameFn = extern(C) GFile* function(GVfs* vfs, const(char)* parseName) nothrow;
__gshared c_g_vfs_parse_nameFn c_g_vfs_parse_name; ///
private alias c_g_vfs_register_uri_schemeFn = extern(C) gboolean function(GVfs* vfs, const(char)* scheme, GVfsFileLookupFunc uriFunc, void* uriData, GDestroyNotify uriDestroy, GVfsFileLookupFunc parseNameFunc, void* parseNameData, GDestroyNotify parseNameDestroy) nothrow;
__gshared c_g_vfs_register_uri_schemeFn c_g_vfs_register_uri_scheme; ///
private alias c_g_vfs_unregister_uri_schemeFn = extern(C) gboolean function(GVfs* vfs, const(char)* scheme) nothrow;
__gshared c_g_vfs_unregister_uri_schemeFn c_g_vfs_unregister_uri_scheme; ///

// Volume
private alias c_g_volume_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_volume_get_typeFn c_g_volume_get_type; ///
private alias c_g_volume_can_ejectFn = extern(C) gboolean function(GVolume* volume) nothrow;
__gshared c_g_volume_can_ejectFn c_g_volume_can_eject; ///
private alias c_g_volume_can_mountFn = extern(C) gboolean function(GVolume* volume) nothrow;
__gshared c_g_volume_can_mountFn c_g_volume_can_mount; ///
private alias c_g_volume_ejectFn = extern(C) void function(GVolume* volume, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_volume_ejectFn c_g_volume_eject; ///
private alias c_g_volume_eject_finishFn = extern(C) gboolean function(GVolume* volume, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_volume_eject_finishFn c_g_volume_eject_finish; ///
private alias c_g_volume_eject_with_operationFn = extern(C) void function(GVolume* volume, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_volume_eject_with_operationFn c_g_volume_eject_with_operation; ///
private alias c_g_volume_eject_with_operation_finishFn = extern(C) gboolean function(GVolume* volume, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_volume_eject_with_operation_finishFn c_g_volume_eject_with_operation_finish; ///
private alias c_g_volume_enumerate_identifiersFn = extern(C) char** function(GVolume* volume) nothrow;
__gshared c_g_volume_enumerate_identifiersFn c_g_volume_enumerate_identifiers; ///
private alias c_g_volume_get_activation_rootFn = extern(C) GFile* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_activation_rootFn c_g_volume_get_activation_root; ///
private alias c_g_volume_get_driveFn = extern(C) GDrive* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_driveFn c_g_volume_get_drive; ///
private alias c_g_volume_get_iconFn = extern(C) GIcon* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_iconFn c_g_volume_get_icon; ///
private alias c_g_volume_get_identifierFn = extern(C) char* function(GVolume* volume, const(char)* kind) nothrow;
__gshared c_g_volume_get_identifierFn c_g_volume_get_identifier; ///
private alias c_g_volume_get_mountFn = extern(C) GMount* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_mountFn c_g_volume_get_mount; ///
private alias c_g_volume_get_nameFn = extern(C) char* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_nameFn c_g_volume_get_name; ///
private alias c_g_volume_get_sort_keyFn = extern(C) const(char)* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_sort_keyFn c_g_volume_get_sort_key; ///
private alias c_g_volume_get_symbolic_iconFn = extern(C) GIcon* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_symbolic_iconFn c_g_volume_get_symbolic_icon; ///
private alias c_g_volume_get_uuidFn = extern(C) char* function(GVolume* volume) nothrow;
__gshared c_g_volume_get_uuidFn c_g_volume_get_uuid; ///
private alias c_g_volume_mountFn = extern(C) void function(GVolume* volume, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_volume_mountFn c_g_volume_mount; ///
private alias c_g_volume_mount_finishFn = extern(C) gboolean function(GVolume* volume, GAsyncResult* result, GError** _err) nothrow;
__gshared c_g_volume_mount_finishFn c_g_volume_mount_finish; ///
private alias c_g_volume_should_automountFn = extern(C) gboolean function(GVolume* volume) nothrow;
__gshared c_g_volume_should_automountFn c_g_volume_should_automount; ///

// VolumeMonitor
private alias c_g_volume_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_volume_monitor_get_typeFn c_g_volume_monitor_get_type; ///
private alias c_g_volume_monitor_adopt_orphan_mountFn = extern(C) GVolume* function(GMount* mount) nothrow;
__gshared c_g_volume_monitor_adopt_orphan_mountFn c_g_volume_monitor_adopt_orphan_mount; ///
private alias c_g_volume_monitor_getFn = extern(C) GVolumeMonitor* function() nothrow;
__gshared c_g_volume_monitor_getFn c_g_volume_monitor_get; ///
private alias c_g_volume_monitor_get_connected_drivesFn = extern(C) GList* function(GVolumeMonitor* volumeMonitor) nothrow;
__gshared c_g_volume_monitor_get_connected_drivesFn c_g_volume_monitor_get_connected_drives; ///
private alias c_g_volume_monitor_get_mount_for_uuidFn = extern(C) GMount* function(GVolumeMonitor* volumeMonitor, const(char)* uuid) nothrow;
__gshared c_g_volume_monitor_get_mount_for_uuidFn c_g_volume_monitor_get_mount_for_uuid; ///
private alias c_g_volume_monitor_get_mountsFn = extern(C) GList* function(GVolumeMonitor* volumeMonitor) nothrow;
__gshared c_g_volume_monitor_get_mountsFn c_g_volume_monitor_get_mounts; ///
private alias c_g_volume_monitor_get_volume_for_uuidFn = extern(C) GVolume* function(GVolumeMonitor* volumeMonitor, const(char)* uuid) nothrow;
__gshared c_g_volume_monitor_get_volume_for_uuidFn c_g_volume_monitor_get_volume_for_uuid; ///
private alias c_g_volume_monitor_get_volumesFn = extern(C) GList* function(GVolumeMonitor* volumeMonitor) nothrow;
__gshared c_g_volume_monitor_get_volumesFn c_g_volume_monitor_get_volumes; ///

// ZlibCompressor
private alias c_g_zlib_compressor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_zlib_compressor_get_typeFn c_g_zlib_compressor_get_type; ///
private alias c_g_zlib_compressor_newFn = extern(C) GZlibCompressor* function(GZlibCompressorFormat format, int level) nothrow;
__gshared c_g_zlib_compressor_newFn c_g_zlib_compressor_new; ///
private alias c_g_zlib_compressor_get_file_infoFn = extern(C) GFileInfo* function(GZlibCompressor* compressor) nothrow;
__gshared c_g_zlib_compressor_get_file_infoFn c_g_zlib_compressor_get_file_info; ///
private alias c_g_zlib_compressor_get_osFn = extern(C) int function(GZlibCompressor* compressor) nothrow;
__gshared c_g_zlib_compressor_get_osFn c_g_zlib_compressor_get_os; ///
private alias c_g_zlib_compressor_set_file_infoFn = extern(C) void function(GZlibCompressor* compressor, GFileInfo* fileInfo) nothrow;
__gshared c_g_zlib_compressor_set_file_infoFn c_g_zlib_compressor_set_file_info; ///
private alias c_g_zlib_compressor_set_osFn = extern(C) void function(GZlibCompressor* compressor, int os) nothrow;
__gshared c_g_zlib_compressor_set_osFn c_g_zlib_compressor_set_os; ///

// ZlibDecompressor
private alias c_g_zlib_decompressor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_zlib_decompressor_get_typeFn c_g_zlib_decompressor_get_type; ///
private alias c_g_zlib_decompressor_newFn = extern(C) GZlibDecompressor* function(GZlibCompressorFormat format) nothrow;
__gshared c_g_zlib_decompressor_newFn c_g_zlib_decompressor_new; ///
private alias c_g_zlib_decompressor_get_file_infoFn = extern(C) GFileInfo* function(GZlibDecompressor* decompressor) nothrow;
__gshared c_g_zlib_decompressor_get_file_infoFn c_g_zlib_decompressor_get_file_info; ///

// global
private alias c_g_bus_getFn = extern(C) void function(GBusType busType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_bus_getFn c_g_bus_get; ///
private alias c_g_bus_get_finishFn = extern(C) GDBusConnection* function(GAsyncResult* res, GError** _err) nothrow;
__gshared c_g_bus_get_finishFn c_g_bus_get_finish; ///
private alias c_g_bus_get_syncFn = extern(C) GDBusConnection* function(GBusType busType, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_bus_get_syncFn c_g_bus_get_sync; ///
private alias c_g_bus_own_nameFn = extern(C) uint function(GBusType busType, const(char)* name, GBusNameOwnerFlags flags, GBusAcquiredCallback busAcquiredHandler, GBusNameAcquiredCallback nameAcquiredHandler, GBusNameLostCallback nameLostHandler, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_g_bus_own_nameFn c_g_bus_own_name; ///
private alias c_g_bus_own_name_on_connectionFn = extern(C) uint function(GDBusConnection* connection, const(char)* name, GBusNameOwnerFlags flags, GBusNameAcquiredCallback nameAcquiredHandler, GBusNameLostCallback nameLostHandler, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_g_bus_own_name_on_connectionFn c_g_bus_own_name_on_connection; ///
private alias c_g_bus_own_name_on_connection_with_closuresFn = extern(C) uint function(GDBusConnection* connection, const(char)* name, GBusNameOwnerFlags flags, GClosure* nameAcquiredClosure, GClosure* nameLostClosure) nothrow;
__gshared c_g_bus_own_name_on_connection_with_closuresFn c_g_bus_own_name_on_connection_with_closures; ///
private alias c_g_bus_own_name_with_closuresFn = extern(C) uint function(GBusType busType, const(char)* name, GBusNameOwnerFlags flags, GClosure* busAcquiredClosure, GClosure* nameAcquiredClosure, GClosure* nameLostClosure) nothrow;
__gshared c_g_bus_own_name_with_closuresFn c_g_bus_own_name_with_closures; ///
private alias c_g_bus_unown_nameFn = extern(C) void function(uint ownerId) nothrow;
__gshared c_g_bus_unown_nameFn c_g_bus_unown_name; ///
private alias c_g_bus_unwatch_nameFn = extern(C) void function(uint watcherId) nothrow;
__gshared c_g_bus_unwatch_nameFn c_g_bus_unwatch_name; ///
private alias c_g_bus_watch_nameFn = extern(C) uint function(GBusType busType, const(char)* name, GBusNameWatcherFlags flags, GBusNameAppearedCallback nameAppearedHandler, GBusNameVanishedCallback nameVanishedHandler, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_g_bus_watch_nameFn c_g_bus_watch_name; ///
private alias c_g_bus_watch_name_on_connectionFn = extern(C) uint function(GDBusConnection* connection, const(char)* name, GBusNameWatcherFlags flags, GBusNameAppearedCallback nameAppearedHandler, GBusNameVanishedCallback nameVanishedHandler, void* userData, GDestroyNotify userDataFreeFunc) nothrow;
__gshared c_g_bus_watch_name_on_connectionFn c_g_bus_watch_name_on_connection; ///
private alias c_g_bus_watch_name_on_connection_with_closuresFn = extern(C) uint function(GDBusConnection* connection, const(char)* name, GBusNameWatcherFlags flags, GClosure* nameAppearedClosure, GClosure* nameVanishedClosure) nothrow;
__gshared c_g_bus_watch_name_on_connection_with_closuresFn c_g_bus_watch_name_on_connection_with_closures; ///
private alias c_g_bus_watch_name_with_closuresFn = extern(C) uint function(GBusType busType, const(char)* name, GBusNameWatcherFlags flags, GClosure* nameAppearedClosure, GClosure* nameVanishedClosure) nothrow;
__gshared c_g_bus_watch_name_with_closuresFn c_g_bus_watch_name_with_closures; ///
private alias c_g_content_type_can_be_executableFn = extern(C) gboolean function(const(char)* type) nothrow;
__gshared c_g_content_type_can_be_executableFn c_g_content_type_can_be_executable; ///
private alias c_g_content_type_equalsFn = extern(C) gboolean function(const(char)* type1, const(char)* type2) nothrow;
__gshared c_g_content_type_equalsFn c_g_content_type_equals; ///
private alias c_g_content_type_from_mime_typeFn = extern(C) char* function(const(char)* mimeType) nothrow;
__gshared c_g_content_type_from_mime_typeFn c_g_content_type_from_mime_type; ///
private alias c_g_content_type_get_descriptionFn = extern(C) char* function(const(char)* type) nothrow;
__gshared c_g_content_type_get_descriptionFn c_g_content_type_get_description; ///
private alias c_g_content_type_get_generic_icon_nameFn = extern(C) char* function(const(char)* type) nothrow;
__gshared c_g_content_type_get_generic_icon_nameFn c_g_content_type_get_generic_icon_name; ///
private alias c_g_content_type_get_iconFn = extern(C) GIcon* function(const(char)* type) nothrow;
__gshared c_g_content_type_get_iconFn c_g_content_type_get_icon; ///
private alias c_g_content_type_get_mime_dirsFn = extern(C) const(char*)* function() nothrow;
__gshared c_g_content_type_get_mime_dirsFn c_g_content_type_get_mime_dirs; ///
private alias c_g_content_type_get_mime_typeFn = extern(C) char* function(const(char)* type) nothrow;
__gshared c_g_content_type_get_mime_typeFn c_g_content_type_get_mime_type; ///
private alias c_g_content_type_get_symbolic_iconFn = extern(C) GIcon* function(const(char)* type) nothrow;
__gshared c_g_content_type_get_symbolic_iconFn c_g_content_type_get_symbolic_icon; ///
private alias c_g_content_type_guessFn = extern(C) char* function(const(char)* filename, const(ubyte)* data, size_t dataSize, gboolean* resultUncertain) nothrow;
__gshared c_g_content_type_guessFn c_g_content_type_guess; ///
private alias c_g_content_type_guess_for_treeFn = extern(C) char** function(GFile* root) nothrow;
__gshared c_g_content_type_guess_for_treeFn c_g_content_type_guess_for_tree; ///
private alias c_g_content_type_is_aFn = extern(C) gboolean function(const(char)* type, const(char)* supertype) nothrow;
__gshared c_g_content_type_is_aFn c_g_content_type_is_a; ///
private alias c_g_content_type_is_mime_typeFn = extern(C) gboolean function(const(char)* type, const(char)* mimeType) nothrow;
__gshared c_g_content_type_is_mime_typeFn c_g_content_type_is_mime_type; ///
private alias c_g_content_type_is_unknownFn = extern(C) gboolean function(const(char)* type) nothrow;
__gshared c_g_content_type_is_unknownFn c_g_content_type_is_unknown; ///
private alias c_g_content_type_set_mime_dirsFn = extern(C) void function(const(char*)* dirs) nothrow;
__gshared c_g_content_type_set_mime_dirsFn c_g_content_type_set_mime_dirs; ///
private alias c_g_content_types_get_registeredFn = extern(C) GList* function() nothrow;
__gshared c_g_content_types_get_registeredFn c_g_content_types_get_registered; ///
private alias c_g_dbus_address_escape_valueFn = extern(C) char* function(const(char)* string_) nothrow;
__gshared c_g_dbus_address_escape_valueFn c_g_dbus_address_escape_value; ///
private alias c_g_dbus_address_get_for_bus_syncFn = extern(C) char* function(GBusType busType, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_address_get_for_bus_syncFn c_g_dbus_address_get_for_bus_sync; ///
private alias c_g_dbus_address_get_streamFn = extern(C) void function(const(char)* address, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_g_dbus_address_get_streamFn c_g_dbus_address_get_stream; ///
private alias c_g_dbus_address_get_stream_finishFn = extern(C) GIOStream* function(GAsyncResult* res, char** outGuid, GError** _err) nothrow;
__gshared c_g_dbus_address_get_stream_finishFn c_g_dbus_address_get_stream_finish; ///
private alias c_g_dbus_address_get_stream_syncFn = extern(C) GIOStream* function(const(char)* address, char** outGuid, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_dbus_address_get_stream_syncFn c_g_dbus_address_get_stream_sync; ///
private alias c_g_dbus_escape_object_pathFn = extern(C) char* function(const(char)* s) nothrow;
__gshared c_g_dbus_escape_object_pathFn c_g_dbus_escape_object_path; ///
private alias c_g_dbus_escape_object_path_bytestringFn = extern(C) char* function(const(ubyte)* bytes) nothrow;
__gshared c_g_dbus_escape_object_path_bytestringFn c_g_dbus_escape_object_path_bytestring; ///
private alias c_g_dbus_generate_guidFn = extern(C) char* function() nothrow;
__gshared c_g_dbus_generate_guidFn c_g_dbus_generate_guid; ///
private alias c_g_dbus_gvalue_to_gvariantFn = extern(C) GVariant* function(const(GValue)* gvalue, const(GVariantType)* type) nothrow;
__gshared c_g_dbus_gvalue_to_gvariantFn c_g_dbus_gvalue_to_gvariant; ///
private alias c_g_dbus_gvariant_to_gvalueFn = extern(C) void function(GVariant* value, GValue* outGvalue) nothrow;
__gshared c_g_dbus_gvariant_to_gvalueFn c_g_dbus_gvariant_to_gvalue; ///
private alias c_g_dbus_is_addressFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_addressFn c_g_dbus_is_address; ///
private alias c_g_dbus_is_error_nameFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_error_nameFn c_g_dbus_is_error_name; ///
private alias c_g_dbus_is_guidFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_guidFn c_g_dbus_is_guid; ///
private alias c_g_dbus_is_interface_nameFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_interface_nameFn c_g_dbus_is_interface_name; ///
private alias c_g_dbus_is_member_nameFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_member_nameFn c_g_dbus_is_member_name; ///
private alias c_g_dbus_is_nameFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_nameFn c_g_dbus_is_name; ///
private alias c_g_dbus_is_supported_addressFn = extern(C) gboolean function(const(char)* string_, GError** _err) nothrow;
__gshared c_g_dbus_is_supported_addressFn c_g_dbus_is_supported_address; ///
private alias c_g_dbus_is_unique_nameFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_dbus_is_unique_nameFn c_g_dbus_is_unique_name; ///
private alias c_g_dbus_unescape_object_pathFn = extern(C) ubyte* function(const(char)* s) nothrow;
__gshared c_g_dbus_unescape_object_pathFn c_g_dbus_unescape_object_path; ///
private alias c_g_io_error_from_errnoFn = extern(C) GIOErrorEnum function(int errNo) nothrow;
__gshared c_g_io_error_from_errnoFn c_g_io_error_from_errno; ///
private alias c_g_io_error_from_file_errorFn = extern(C) GIOErrorEnum function(GFileError fileError) nothrow;
__gshared c_g_io_error_from_file_errorFn c_g_io_error_from_file_error; ///
private alias c_g_io_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_io_error_quarkFn c_g_io_error_quark; ///
private alias c_g_io_modules_load_all_in_directoryFn = extern(C) GList* function(const(char)* dirname) nothrow;
__gshared c_g_io_modules_load_all_in_directoryFn c_g_io_modules_load_all_in_directory; ///
private alias c_g_io_modules_load_all_in_directory_with_scopeFn = extern(C) GList* function(const(char)* dirname, GIOModuleScope* scope_) nothrow;
__gshared c_g_io_modules_load_all_in_directory_with_scopeFn c_g_io_modules_load_all_in_directory_with_scope; ///
private alias c_g_io_modules_scan_all_in_directoryFn = extern(C) void function(const(char)* dirname) nothrow;
__gshared c_g_io_modules_scan_all_in_directoryFn c_g_io_modules_scan_all_in_directory; ///
private alias c_g_io_modules_scan_all_in_directory_with_scopeFn = extern(C) void function(const(char)* dirname, GIOModuleScope* scope_) nothrow;
__gshared c_g_io_modules_scan_all_in_directory_with_scopeFn c_g_io_modules_scan_all_in_directory_with_scope; ///
private alias c_g_io_scheduler_cancel_all_jobsFn = extern(C) void function() nothrow;
__gshared c_g_io_scheduler_cancel_all_jobsFn c_g_io_scheduler_cancel_all_jobs; ///
private alias c_g_io_scheduler_push_jobFn = extern(C) void function(GIOSchedulerJobFunc jobFunc, void* userData, GDestroyNotify notify, int ioPriority, GCancellable* cancellable) nothrow;
__gshared c_g_io_scheduler_push_jobFn c_g_io_scheduler_push_job; ///
private alias c_g_keyfile_settings_backend_newFn = extern(C) GSettingsBackend* function(const(char)* filename, const(char)* rootPath, const(char)* rootGroup) nothrow;
__gshared c_g_keyfile_settings_backend_newFn c_g_keyfile_settings_backend_new; ///
private alias c_g_memory_settings_backend_newFn = extern(C) GSettingsBackend* function() nothrow;
__gshared c_g_memory_settings_backend_newFn c_g_memory_settings_backend_new; ///
private alias c_g_networking_initFn = extern(C) void function() nothrow;
__gshared c_g_networking_initFn c_g_networking_init; ///
private alias c_g_null_settings_backend_newFn = extern(C) GSettingsBackend* function() nothrow;
__gshared c_g_null_settings_backend_newFn c_g_null_settings_backend_new; ///
private alias c_g_pollable_source_newFn = extern(C) GSource* function(GObject* pollableStream) nothrow;
__gshared c_g_pollable_source_newFn c_g_pollable_source_new; ///
private alias c_g_pollable_source_new_fullFn = extern(C) GSource* function(GObject* pollableStream, GSource* childSource, GCancellable* cancellable) nothrow;
__gshared c_g_pollable_source_new_fullFn c_g_pollable_source_new_full; ///
private alias c_g_pollable_stream_readFn = extern(C) ptrdiff_t function(GInputStream* stream, void* buffer, size_t count, gboolean blocking, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_pollable_stream_readFn c_g_pollable_stream_read; ///
private alias c_g_pollable_stream_writeFn = extern(C) ptrdiff_t function(GOutputStream* stream, void* buffer, size_t count, gboolean blocking, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_pollable_stream_writeFn c_g_pollable_stream_write; ///
private alias c_g_pollable_stream_write_allFn = extern(C) gboolean function(GOutputStream* stream, void* buffer, size_t count, gboolean blocking, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_g_pollable_stream_write_allFn c_g_pollable_stream_write_all; ///
private alias c_g_resources_enumerate_childrenFn = extern(C) char** function(const(char)* path, GResourceLookupFlags lookupFlags, GError** _err) nothrow;
__gshared c_g_resources_enumerate_childrenFn c_g_resources_enumerate_children; ///
private alias c_g_resources_get_infoFn = extern(C) gboolean function(const(char)* path, GResourceLookupFlags lookupFlags, size_t* size, uint* flags, GError** _err) nothrow;
__gshared c_g_resources_get_infoFn c_g_resources_get_info; ///
private alias c_g_resources_has_childrenFn = extern(C) gboolean function(const(char)* path) nothrow;
__gshared c_g_resources_has_childrenFn c_g_resources_has_children; ///
private alias c_g_resources_lookup_dataFn = extern(C) GBytes* function(const(char)* path, GResourceLookupFlags lookupFlags, GError** _err) nothrow;
__gshared c_g_resources_lookup_dataFn c_g_resources_lookup_data; ///
private alias c_g_resources_open_streamFn = extern(C) GInputStream* function(const(char)* path, GResourceLookupFlags lookupFlags, GError** _err) nothrow;
__gshared c_g_resources_open_streamFn c_g_resources_open_stream; ///
private alias c_g_resources_registerFn = extern(C) void function(GResource* resource) nothrow;
__gshared c_g_resources_registerFn c_g_resources_register; ///
private alias c_g_resources_unregisterFn = extern(C) void function(GResource* resource) nothrow;
__gshared c_g_resources_unregisterFn c_g_resources_unregister; ///
private alias c_g_simple_async_report_error_in_idleFn = extern(C) void function(GObject* object, GAsyncReadyCallback callback, void* userData, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_simple_async_report_error_in_idleFn c_g_simple_async_report_error_in_idle; ///
private alias c_g_simple_async_report_gerror_in_idleFn = extern(C) void function(GObject* object, GAsyncReadyCallback callback, void* userData, const(GError)* error) nothrow;
__gshared c_g_simple_async_report_gerror_in_idleFn c_g_simple_async_report_gerror_in_idle; ///
private alias c_g_simple_async_report_take_gerror_in_idleFn = extern(C) void function(GObject* object, GAsyncReadyCallback callback, void* userData, GError* error) nothrow;
__gshared c_g_simple_async_report_take_gerror_in_idleFn c_g_simple_async_report_take_gerror_in_idle; ///

// DBusError
private alias c_g_dbus_error_encode_gerrorFn = extern(C) char* function(const(GError)* error) nothrow;
__gshared c_g_dbus_error_encode_gerrorFn c_g_dbus_error_encode_gerror; ///
private alias c_g_dbus_error_get_remote_errorFn = extern(C) char* function(const(GError)* error) nothrow;
__gshared c_g_dbus_error_get_remote_errorFn c_g_dbus_error_get_remote_error; ///
private alias c_g_dbus_error_is_remote_errorFn = extern(C) gboolean function(const(GError)* error) nothrow;
__gshared c_g_dbus_error_is_remote_errorFn c_g_dbus_error_is_remote_error; ///
private alias c_g_dbus_error_new_for_dbus_errorFn = extern(C) GError* function(const(char)* dbusErrorName, const(char)* dbusErrorMessage) nothrow;
__gshared c_g_dbus_error_new_for_dbus_errorFn c_g_dbus_error_new_for_dbus_error; ///
private alias c_g_dbus_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_dbus_error_quarkFn c_g_dbus_error_quark; ///
private alias c_g_dbus_error_register_errorFn = extern(C) gboolean function(GQuark errorDomain, int errorCode, const(char)* dbusErrorName) nothrow;
__gshared c_g_dbus_error_register_errorFn c_g_dbus_error_register_error; ///
private alias c_g_dbus_error_register_error_domainFn = extern(C) void function(const(char)* errorDomainQuarkName, size_t* quarkVolatile, const(GDBusErrorEntry)* entries, uint numEntries) nothrow;
__gshared c_g_dbus_error_register_error_domainFn c_g_dbus_error_register_error_domain; ///
private alias c_g_dbus_error_set_dbus_errorFn = extern(C) void function(GError** error, const(char)* dbusErrorName, const(char)* dbusErrorMessage, const(char)* format,  ...) nothrow;
__gshared c_g_dbus_error_set_dbus_errorFn c_g_dbus_error_set_dbus_error; ///
private alias c_g_dbus_error_set_dbus_error_valistFn = extern(C) void function(GError** error, const(char)* dbusErrorName, const(char)* dbusErrorMessage, const(char)* format, void* varArgs) nothrow;
__gshared c_g_dbus_error_set_dbus_error_valistFn c_g_dbus_error_set_dbus_error_valist; ///
private alias c_g_dbus_error_strip_remote_errorFn = extern(C) gboolean function(GError* error) nothrow;
__gshared c_g_dbus_error_strip_remote_errorFn c_g_dbus_error_strip_remote_error; ///
private alias c_g_dbus_error_unregister_errorFn = extern(C) gboolean function(GQuark errorDomain, int errorCode, const(char)* dbusErrorName) nothrow;
__gshared c_g_dbus_error_unregister_errorFn c_g_dbus_error_unregister_error; ///

// ResolverError
private alias c_g_resolver_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_resolver_error_quarkFn c_g_resolver_error_quark; ///

// ResourceError
private alias c_g_resource_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_resource_error_quarkFn c_g_resource_error_quark; ///

// TlsChannelBindingError
private alias c_g_tls_channel_binding_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_tls_channel_binding_error_quarkFn c_g_tls_channel_binding_error_quark; ///

// TlsError
private alias c_g_tls_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_tls_error_quarkFn c_g_tls_error_quark; ///

// Action

/** */
alias g_action_get_type = c_g_action_get_type;

/** */
alias g_action_name_is_valid = c_g_action_name_is_valid;

/** */
alias g_action_parse_detailed_name = c_g_action_parse_detailed_name;

/** */
alias g_action_print_detailed_name = c_g_action_print_detailed_name;

/** */
alias g_action_activate = c_g_action_activate;

/** */
alias g_action_change_state = c_g_action_change_state;

/** */
alias g_action_get_enabled = c_g_action_get_enabled;

/** */
alias g_action_get_name = c_g_action_get_name;

/** */
alias g_action_get_parameter_type = c_g_action_get_parameter_type;

/** */
alias g_action_get_state = c_g_action_get_state;

/** */
alias g_action_get_state_hint = c_g_action_get_state_hint;

/** */
alias g_action_get_state_type = c_g_action_get_state_type;

// ActionGroup

/** */
alias g_action_group_get_type = c_g_action_group_get_type;

/** */
alias g_action_group_action_added = c_g_action_group_action_added;

/** */
alias g_action_group_action_enabled_changed = c_g_action_group_action_enabled_changed;

/** */
alias g_action_group_action_removed = c_g_action_group_action_removed;

/** */
alias g_action_group_action_state_changed = c_g_action_group_action_state_changed;

/** */
alias g_action_group_activate_action = c_g_action_group_activate_action;

/** */
alias g_action_group_change_action_state = c_g_action_group_change_action_state;

/** */
alias g_action_group_get_action_enabled = c_g_action_group_get_action_enabled;

/** */
alias g_action_group_get_action_parameter_type = c_g_action_group_get_action_parameter_type;

/** */
alias g_action_group_get_action_state = c_g_action_group_get_action_state;

/** */
alias g_action_group_get_action_state_hint = c_g_action_group_get_action_state_hint;

/** */
alias g_action_group_get_action_state_type = c_g_action_group_get_action_state_type;

/** */
alias g_action_group_has_action = c_g_action_group_has_action;

/** */
alias g_action_group_list_actions = c_g_action_group_list_actions;

/** */
alias g_action_group_query_action = c_g_action_group_query_action;

// ActionMap

/** */
alias g_action_map_get_type = c_g_action_map_get_type;

/** */
alias g_action_map_add_action = c_g_action_map_add_action;

/** */
alias g_action_map_add_action_entries = c_g_action_map_add_action_entries;

/** */
alias g_action_map_lookup_action = c_g_action_map_lookup_action;

/** */
alias g_action_map_remove_action = c_g_action_map_remove_action;

/** */
alias g_action_map_remove_action_entries = c_g_action_map_remove_action_entries;

// AppInfo

/** */
alias g_app_info_get_type = c_g_app_info_get_type;

/** */
alias g_app_info_create_from_commandline = c_g_app_info_create_from_commandline;

/** */
alias g_app_info_get_all = c_g_app_info_get_all;

/** */
alias g_app_info_get_all_for_type = c_g_app_info_get_all_for_type;

/** */
alias g_app_info_get_default_for_type = c_g_app_info_get_default_for_type;

/** */
alias g_app_info_get_default_for_type_async = c_g_app_info_get_default_for_type_async;

/** */
alias g_app_info_get_default_for_type_finish = c_g_app_info_get_default_for_type_finish;

/** */
alias g_app_info_get_default_for_uri_scheme = c_g_app_info_get_default_for_uri_scheme;

/** */
alias g_app_info_get_default_for_uri_scheme_async = c_g_app_info_get_default_for_uri_scheme_async;

/** */
alias g_app_info_get_default_for_uri_scheme_finish = c_g_app_info_get_default_for_uri_scheme_finish;

/** */
alias g_app_info_get_fallback_for_type = c_g_app_info_get_fallback_for_type;

/** */
alias g_app_info_get_recommended_for_type = c_g_app_info_get_recommended_for_type;

/** */
alias g_app_info_launch_default_for_uri = c_g_app_info_launch_default_for_uri;

/** */
alias g_app_info_launch_default_for_uri_async = c_g_app_info_launch_default_for_uri_async;

/** */
alias g_app_info_launch_default_for_uri_finish = c_g_app_info_launch_default_for_uri_finish;

/** */
alias g_app_info_reset_type_associations = c_g_app_info_reset_type_associations;

/** */
alias g_app_info_add_supports_type = c_g_app_info_add_supports_type;

/** */
alias g_app_info_can_delete = c_g_app_info_can_delete;

/** */
alias g_app_info_can_remove_supports_type = c_g_app_info_can_remove_supports_type;

/** */
alias g_app_info_delete = c_g_app_info_delete;

/** */
alias g_app_info_dup = c_g_app_info_dup;

/** */
alias g_app_info_equal = c_g_app_info_equal;

/** */
alias g_app_info_get_commandline = c_g_app_info_get_commandline;

/** */
alias g_app_info_get_description = c_g_app_info_get_description;

/** */
alias g_app_info_get_display_name = c_g_app_info_get_display_name;

/** */
alias g_app_info_get_executable = c_g_app_info_get_executable;

/** */
alias g_app_info_get_icon = c_g_app_info_get_icon;

/** */
alias g_app_info_get_id = c_g_app_info_get_id;

/** */
alias g_app_info_get_name = c_g_app_info_get_name;

/** */
alias g_app_info_get_supported_types = c_g_app_info_get_supported_types;

/** */
alias g_app_info_launch = c_g_app_info_launch;

/** */
alias g_app_info_launch_uris = c_g_app_info_launch_uris;

/** */
alias g_app_info_launch_uris_async = c_g_app_info_launch_uris_async;

/** */
alias g_app_info_launch_uris_finish = c_g_app_info_launch_uris_finish;

/** */
alias g_app_info_remove_supports_type = c_g_app_info_remove_supports_type;

/** */
alias g_app_info_set_as_default_for_extension = c_g_app_info_set_as_default_for_extension;

/** */
alias g_app_info_set_as_default_for_type = c_g_app_info_set_as_default_for_type;

/** */
alias g_app_info_set_as_last_used_for_type = c_g_app_info_set_as_last_used_for_type;

/** */
alias g_app_info_should_show = c_g_app_info_should_show;

/** */
alias g_app_info_supports_files = c_g_app_info_supports_files;

/** */
alias g_app_info_supports_uris = c_g_app_info_supports_uris;

// AppInfoMonitor

/** */
alias g_app_info_monitor_get_type = c_g_app_info_monitor_get_type;

/** */
alias g_app_info_monitor_get = c_g_app_info_monitor_get;

// AppLaunchContext

/** */
alias g_app_launch_context_get_type = c_g_app_launch_context_get_type;

/** */
alias g_app_launch_context_new = c_g_app_launch_context_new;

/** */
alias g_app_launch_context_get_display = c_g_app_launch_context_get_display;

/** */
alias g_app_launch_context_get_environment = c_g_app_launch_context_get_environment;

/** */
alias g_app_launch_context_get_startup_notify_id = c_g_app_launch_context_get_startup_notify_id;

/** */
alias g_app_launch_context_launch_failed = c_g_app_launch_context_launch_failed;

/** */
alias g_app_launch_context_setenv = c_g_app_launch_context_setenv;

/** */
alias g_app_launch_context_unsetenv = c_g_app_launch_context_unsetenv;

// Application

/** */
alias g_application_get_type = c_g_application_get_type;

/** */
alias g_application_new = c_g_application_new;

/** */
alias g_application_get_default = c_g_application_get_default;

/** */
alias g_application_id_is_valid = c_g_application_id_is_valid;

/** */
alias g_application_activate = c_g_application_activate;

/** */
alias g_application_add_main_option = c_g_application_add_main_option;

/** */
alias g_application_add_main_option_entries = c_g_application_add_main_option_entries;

/** */
alias g_application_add_option_group = c_g_application_add_option_group;

/** */
alias g_application_bind_busy_property = c_g_application_bind_busy_property;

/** */
alias g_application_get_application_id = c_g_application_get_application_id;

/** */
alias g_application_get_dbus_connection = c_g_application_get_dbus_connection;

/** */
alias g_application_get_dbus_object_path = c_g_application_get_dbus_object_path;

/** */
alias g_application_get_flags = c_g_application_get_flags;

/** */
alias g_application_get_inactivity_timeout = c_g_application_get_inactivity_timeout;

/** */
alias g_application_get_is_busy = c_g_application_get_is_busy;

/** */
alias g_application_get_is_registered = c_g_application_get_is_registered;

/** */
alias g_application_get_is_remote = c_g_application_get_is_remote;

/** */
alias g_application_get_resource_base_path = c_g_application_get_resource_base_path;

/** */
alias g_application_get_version = c_g_application_get_version;

/** */
alias g_application_hold = c_g_application_hold;

/** */
alias g_application_mark_busy = c_g_application_mark_busy;

/** */
alias g_application_open = c_g_application_open;

/** */
alias g_application_quit = c_g_application_quit;

/** */
alias g_application_register = c_g_application_register;

/** */
alias g_application_release = c_g_application_release;

/** */
alias g_application_run = c_g_application_run;

/** */
alias g_application_send_notification = c_g_application_send_notification;

/** */
alias g_application_set_action_group = c_g_application_set_action_group;

/** */
alias g_application_set_application_id = c_g_application_set_application_id;

/** */
alias g_application_set_default = c_g_application_set_default;

/** */
alias g_application_set_flags = c_g_application_set_flags;

/** */
alias g_application_set_inactivity_timeout = c_g_application_set_inactivity_timeout;

/** */
alias g_application_set_option_context_description = c_g_application_set_option_context_description;

/** */
alias g_application_set_option_context_parameter_string = c_g_application_set_option_context_parameter_string;

/** */
alias g_application_set_option_context_summary = c_g_application_set_option_context_summary;

/** */
alias g_application_set_resource_base_path = c_g_application_set_resource_base_path;

/** */
alias g_application_set_version = c_g_application_set_version;

/** */
alias g_application_unbind_busy_property = c_g_application_unbind_busy_property;

/** */
alias g_application_unmark_busy = c_g_application_unmark_busy;

/** */
alias g_application_withdraw_notification = c_g_application_withdraw_notification;

// ApplicationCommandLine

/** */
alias g_application_command_line_get_type = c_g_application_command_line_get_type;

/** */
alias g_application_command_line_create_file_for_arg = c_g_application_command_line_create_file_for_arg;

/** */
alias g_application_command_line_done = c_g_application_command_line_done;

/** */
alias g_application_command_line_get_arguments = c_g_application_command_line_get_arguments;

/** */
alias g_application_command_line_get_cwd = c_g_application_command_line_get_cwd;

/** */
alias g_application_command_line_get_environ = c_g_application_command_line_get_environ;

/** */
alias g_application_command_line_get_exit_status = c_g_application_command_line_get_exit_status;

/** */
alias g_application_command_line_get_is_remote = c_g_application_command_line_get_is_remote;

/** */
alias g_application_command_line_get_options_dict = c_g_application_command_line_get_options_dict;

/** */
alias g_application_command_line_get_platform_data = c_g_application_command_line_get_platform_data;

/** */
alias g_application_command_line_get_stdin = c_g_application_command_line_get_stdin;

/** */
alias g_application_command_line_getenv = c_g_application_command_line_getenv;

/** */
alias g_application_command_line_print = c_g_application_command_line_print;

/** */
alias g_application_command_line_print_literal = c_g_application_command_line_print_literal;

/** */
alias g_application_command_line_printerr = c_g_application_command_line_printerr;

/** */
alias g_application_command_line_printerr_literal = c_g_application_command_line_printerr_literal;

/** */
alias g_application_command_line_set_exit_status = c_g_application_command_line_set_exit_status;

// AsyncInitable

/** */
alias g_async_initable_get_type = c_g_async_initable_get_type;

/** */
alias g_async_initable_new_async = c_g_async_initable_new_async;

/** */
alias g_async_initable_new_valist_async = c_g_async_initable_new_valist_async;

/** */
alias g_async_initable_newv_async = c_g_async_initable_newv_async;

/** */
alias g_async_initable_init_async = c_g_async_initable_init_async;

/** */
alias g_async_initable_init_finish = c_g_async_initable_init_finish;

/** */
alias g_async_initable_new_finish = c_g_async_initable_new_finish;

// AsyncResult

/** */
alias g_async_result_get_type = c_g_async_result_get_type;

/** */
alias g_async_result_get_source_object = c_g_async_result_get_source_object;

/** */
alias g_async_result_get_user_data = c_g_async_result_get_user_data;

/** */
alias g_async_result_is_tagged = c_g_async_result_is_tagged;

/** */
alias g_async_result_legacy_propagate_error = c_g_async_result_legacy_propagate_error;

// BufferedInputStream

/** */
alias g_buffered_input_stream_get_type = c_g_buffered_input_stream_get_type;

/** */
alias g_buffered_input_stream_new = c_g_buffered_input_stream_new;

/** */
alias g_buffered_input_stream_new_sized = c_g_buffered_input_stream_new_sized;

/** */
alias g_buffered_input_stream_fill = c_g_buffered_input_stream_fill;

/** */
alias g_buffered_input_stream_fill_async = c_g_buffered_input_stream_fill_async;

/** */
alias g_buffered_input_stream_fill_finish = c_g_buffered_input_stream_fill_finish;

/** */
alias g_buffered_input_stream_get_available = c_g_buffered_input_stream_get_available;

/** */
alias g_buffered_input_stream_get_buffer_size = c_g_buffered_input_stream_get_buffer_size;

/** */
alias g_buffered_input_stream_peek = c_g_buffered_input_stream_peek;

/** */
alias g_buffered_input_stream_peek_buffer = c_g_buffered_input_stream_peek_buffer;

/** */
alias g_buffered_input_stream_read_byte = c_g_buffered_input_stream_read_byte;

/** */
alias g_buffered_input_stream_set_buffer_size = c_g_buffered_input_stream_set_buffer_size;

// BufferedOutputStream

/** */
alias g_buffered_output_stream_get_type = c_g_buffered_output_stream_get_type;

/** */
alias g_buffered_output_stream_new = c_g_buffered_output_stream_new;

/** */
alias g_buffered_output_stream_new_sized = c_g_buffered_output_stream_new_sized;

/** */
alias g_buffered_output_stream_get_auto_grow = c_g_buffered_output_stream_get_auto_grow;

/** */
alias g_buffered_output_stream_get_buffer_size = c_g_buffered_output_stream_get_buffer_size;

/** */
alias g_buffered_output_stream_set_auto_grow = c_g_buffered_output_stream_set_auto_grow;

/** */
alias g_buffered_output_stream_set_buffer_size = c_g_buffered_output_stream_set_buffer_size;

// BytesIcon

/** */
alias g_bytes_icon_get_type = c_g_bytes_icon_get_type;

/** */
alias g_bytes_icon_new = c_g_bytes_icon_new;

/** */
alias g_bytes_icon_get_bytes = c_g_bytes_icon_get_bytes;

// Cancellable

/** */
alias g_cancellable_get_type = c_g_cancellable_get_type;

/** */
alias g_cancellable_new = c_g_cancellable_new;

/** */
alias g_cancellable_get_current = c_g_cancellable_get_current;

/** */
alias g_cancellable_cancel = c_g_cancellable_cancel;

/** */
alias g_cancellable_connect = c_g_cancellable_connect;

/** */
alias g_cancellable_disconnect = c_g_cancellable_disconnect;

/** */
alias g_cancellable_get_fd = c_g_cancellable_get_fd;

/** */
alias g_cancellable_is_cancelled = c_g_cancellable_is_cancelled;

/** */
alias g_cancellable_make_pollfd = c_g_cancellable_make_pollfd;

/** */
alias g_cancellable_pop_current = c_g_cancellable_pop_current;

/** */
alias g_cancellable_push_current = c_g_cancellable_push_current;

/** */
alias g_cancellable_release_fd = c_g_cancellable_release_fd;

/** */
alias g_cancellable_reset = c_g_cancellable_reset;

/** */
alias g_cancellable_set_error_if_cancelled = c_g_cancellable_set_error_if_cancelled;

/** */
alias g_cancellable_source_new = c_g_cancellable_source_new;

// CharsetConverter

/** */
alias g_charset_converter_get_type = c_g_charset_converter_get_type;

/** */
alias g_charset_converter_new = c_g_charset_converter_new;

/** */
alias g_charset_converter_get_num_fallbacks = c_g_charset_converter_get_num_fallbacks;

/** */
alias g_charset_converter_get_use_fallback = c_g_charset_converter_get_use_fallback;

/** */
alias g_charset_converter_set_use_fallback = c_g_charset_converter_set_use_fallback;

// Converter

/** */
alias g_converter_get_type = c_g_converter_get_type;

/** */
alias g_converter_convert = c_g_converter_convert;

/** */
alias g_converter_convert_bytes = c_g_converter_convert_bytes;

/** */
alias g_converter_reset = c_g_converter_reset;

// ConverterInputStream

/** */
alias g_converter_input_stream_get_type = c_g_converter_input_stream_get_type;

/** */
alias g_converter_input_stream_new = c_g_converter_input_stream_new;

/** */
alias g_converter_input_stream_get_converter = c_g_converter_input_stream_get_converter;

// ConverterOutputStream

/** */
alias g_converter_output_stream_get_type = c_g_converter_output_stream_get_type;

/** */
alias g_converter_output_stream_new = c_g_converter_output_stream_new;

/** */
alias g_converter_output_stream_get_converter = c_g_converter_output_stream_get_converter;

// Credentials

/** */
alias g_credentials_get_type = c_g_credentials_get_type;

/** */
alias g_credentials_new = c_g_credentials_new;

/** */
alias g_credentials_get_native = c_g_credentials_get_native;

/** */
alias g_credentials_get_unix_pid = c_g_credentials_get_unix_pid;

/** */
alias g_credentials_get_unix_user = c_g_credentials_get_unix_user;

/** */
alias g_credentials_is_same_user = c_g_credentials_is_same_user;

/** */
alias g_credentials_set_native = c_g_credentials_set_native;

/** */
alias g_credentials_set_unix_user = c_g_credentials_set_unix_user;

/** */
alias g_credentials_to_string = c_g_credentials_to_string;

// DBusActionGroup

/** */
alias g_dbus_action_group_get_type = c_g_dbus_action_group_get_type;

/** */
alias g_dbus_action_group_get = c_g_dbus_action_group_get;

// DBusAnnotationInfo

/** */
alias g_dbus_annotation_info_get_type = c_g_dbus_annotation_info_get_type;

/** */
alias g_dbus_annotation_info_ref = c_g_dbus_annotation_info_ref;

/** */
alias g_dbus_annotation_info_unref = c_g_dbus_annotation_info_unref;

/** */
alias g_dbus_annotation_info_lookup = c_g_dbus_annotation_info_lookup;

// DBusArgInfo

/** */
alias g_dbus_arg_info_get_type = c_g_dbus_arg_info_get_type;

/** */
alias g_dbus_arg_info_ref = c_g_dbus_arg_info_ref;

/** */
alias g_dbus_arg_info_unref = c_g_dbus_arg_info_unref;

// DBusAuthObserver

/** */
alias g_dbus_auth_observer_get_type = c_g_dbus_auth_observer_get_type;

/** */
alias g_dbus_auth_observer_new = c_g_dbus_auth_observer_new;

/** */
alias g_dbus_auth_observer_allow_mechanism = c_g_dbus_auth_observer_allow_mechanism;

/** */
alias g_dbus_auth_observer_authorize_authenticated_peer = c_g_dbus_auth_observer_authorize_authenticated_peer;

// DBusConnection

/** */
alias g_dbus_connection_get_type = c_g_dbus_connection_get_type;

/** */
alias g_dbus_connection_new_finish = c_g_dbus_connection_new_finish;

/** */
alias g_dbus_connection_new_for_address_finish = c_g_dbus_connection_new_for_address_finish;

/** */
alias g_dbus_connection_new_for_address_sync = c_g_dbus_connection_new_for_address_sync;

/** */
alias g_dbus_connection_new_sync = c_g_dbus_connection_new_sync;

/** */
alias g_dbus_connection_new = c_g_dbus_connection_new;

/** */
alias g_dbus_connection_new_for_address = c_g_dbus_connection_new_for_address;

/** */
alias g_dbus_connection_add_filter = c_g_dbus_connection_add_filter;

/** */
alias g_dbus_connection_call = c_g_dbus_connection_call;

/** */
alias g_dbus_connection_call_finish = c_g_dbus_connection_call_finish;

/** */
alias g_dbus_connection_call_sync = c_g_dbus_connection_call_sync;

/** */
alias g_dbus_connection_call_with_unix_fd_list = c_g_dbus_connection_call_with_unix_fd_list;

/** */
alias g_dbus_connection_call_with_unix_fd_list_finish = c_g_dbus_connection_call_with_unix_fd_list_finish;

/** */
alias g_dbus_connection_call_with_unix_fd_list_sync = c_g_dbus_connection_call_with_unix_fd_list_sync;

/** */
alias g_dbus_connection_close = c_g_dbus_connection_close;

/** */
alias g_dbus_connection_close_finish = c_g_dbus_connection_close_finish;

/** */
alias g_dbus_connection_close_sync = c_g_dbus_connection_close_sync;

/** */
alias g_dbus_connection_emit_signal = c_g_dbus_connection_emit_signal;

/** */
alias g_dbus_connection_export_action_group = c_g_dbus_connection_export_action_group;

/** */
alias g_dbus_connection_export_menu_model = c_g_dbus_connection_export_menu_model;

/** */
alias g_dbus_connection_flush = c_g_dbus_connection_flush;

/** */
alias g_dbus_connection_flush_finish = c_g_dbus_connection_flush_finish;

/** */
alias g_dbus_connection_flush_sync = c_g_dbus_connection_flush_sync;

/** */
alias g_dbus_connection_get_capabilities = c_g_dbus_connection_get_capabilities;

/** */
alias g_dbus_connection_get_exit_on_close = c_g_dbus_connection_get_exit_on_close;

/** */
alias g_dbus_connection_get_flags = c_g_dbus_connection_get_flags;

/** */
alias g_dbus_connection_get_guid = c_g_dbus_connection_get_guid;

/** */
alias g_dbus_connection_get_last_serial = c_g_dbus_connection_get_last_serial;

/** */
alias g_dbus_connection_get_peer_credentials = c_g_dbus_connection_get_peer_credentials;

/** */
alias g_dbus_connection_get_stream = c_g_dbus_connection_get_stream;

/** */
alias g_dbus_connection_get_unique_name = c_g_dbus_connection_get_unique_name;

/** */
alias g_dbus_connection_is_closed = c_g_dbus_connection_is_closed;

/** */
alias g_dbus_connection_register_object = c_g_dbus_connection_register_object;

/** */
alias g_dbus_connection_register_object_with_closures = c_g_dbus_connection_register_object_with_closures;

/** */
alias g_dbus_connection_register_object_with_closures2 = c_g_dbus_connection_register_object_with_closures2;

/** */
alias g_dbus_connection_register_subtree = c_g_dbus_connection_register_subtree;

/** */
alias g_dbus_connection_remove_filter = c_g_dbus_connection_remove_filter;

/** */
alias g_dbus_connection_send_message = c_g_dbus_connection_send_message;

/** */
alias g_dbus_connection_send_message_with_reply = c_g_dbus_connection_send_message_with_reply;

/** */
alias g_dbus_connection_send_message_with_reply_finish = c_g_dbus_connection_send_message_with_reply_finish;

/** */
alias g_dbus_connection_send_message_with_reply_sync = c_g_dbus_connection_send_message_with_reply_sync;

/** */
alias g_dbus_connection_set_exit_on_close = c_g_dbus_connection_set_exit_on_close;

/** */
alias g_dbus_connection_signal_subscribe = c_g_dbus_connection_signal_subscribe;

/** */
alias g_dbus_connection_signal_unsubscribe = c_g_dbus_connection_signal_unsubscribe;

/** */
alias g_dbus_connection_start_message_processing = c_g_dbus_connection_start_message_processing;

/** */
alias g_dbus_connection_unexport_action_group = c_g_dbus_connection_unexport_action_group;

/** */
alias g_dbus_connection_unexport_menu_model = c_g_dbus_connection_unexport_menu_model;

/** */
alias g_dbus_connection_unregister_object = c_g_dbus_connection_unregister_object;

/** */
alias g_dbus_connection_unregister_subtree = c_g_dbus_connection_unregister_subtree;

// DBusInterface

/** */
alias g_dbus_interface_get_type = c_g_dbus_interface_get_type;

/** */
alias g_dbus_interface_dup_object = c_g_dbus_interface_dup_object;

/** */
alias g_dbus_interface_get_info = c_g_dbus_interface_get_info;

/** */
alias g_dbus_interface_get_object = c_g_dbus_interface_get_object;

/** */
alias g_dbus_interface_set_object = c_g_dbus_interface_set_object;

// DBusInterfaceInfo

/** */
alias g_dbus_interface_info_get_type = c_g_dbus_interface_info_get_type;

/** */
alias g_dbus_interface_info_cache_build = c_g_dbus_interface_info_cache_build;

/** */
alias g_dbus_interface_info_cache_release = c_g_dbus_interface_info_cache_release;

/** */
alias g_dbus_interface_info_generate_xml = c_g_dbus_interface_info_generate_xml;

/** */
alias g_dbus_interface_info_lookup_method = c_g_dbus_interface_info_lookup_method;

/** */
alias g_dbus_interface_info_lookup_property = c_g_dbus_interface_info_lookup_property;

/** */
alias g_dbus_interface_info_lookup_signal = c_g_dbus_interface_info_lookup_signal;

/** */
alias g_dbus_interface_info_ref = c_g_dbus_interface_info_ref;

/** */
alias g_dbus_interface_info_unref = c_g_dbus_interface_info_unref;

// DBusInterfaceSkeleton

/** */
alias g_dbus_interface_skeleton_get_type = c_g_dbus_interface_skeleton_get_type;

/** */
alias g_dbus_interface_skeleton_export = c_g_dbus_interface_skeleton_export;

/** */
alias g_dbus_interface_skeleton_flush = c_g_dbus_interface_skeleton_flush;

/** */
alias g_dbus_interface_skeleton_get_connection = c_g_dbus_interface_skeleton_get_connection;

/** */
alias g_dbus_interface_skeleton_get_connections = c_g_dbus_interface_skeleton_get_connections;

/** */
alias g_dbus_interface_skeleton_get_flags = c_g_dbus_interface_skeleton_get_flags;

/** */
alias g_dbus_interface_skeleton_get_info = c_g_dbus_interface_skeleton_get_info;

/** */
alias g_dbus_interface_skeleton_get_object_path = c_g_dbus_interface_skeleton_get_object_path;

/** */
alias g_dbus_interface_skeleton_get_properties = c_g_dbus_interface_skeleton_get_properties;

/** */
alias g_dbus_interface_skeleton_get_vtable = c_g_dbus_interface_skeleton_get_vtable;

/** */
alias g_dbus_interface_skeleton_has_connection = c_g_dbus_interface_skeleton_has_connection;

/** */
alias g_dbus_interface_skeleton_set_flags = c_g_dbus_interface_skeleton_set_flags;

/** */
alias g_dbus_interface_skeleton_unexport = c_g_dbus_interface_skeleton_unexport;

/** */
alias g_dbus_interface_skeleton_unexport_from_connection = c_g_dbus_interface_skeleton_unexport_from_connection;

// DBusMenuModel

/** */
alias g_dbus_menu_model_get_type = c_g_dbus_menu_model_get_type;

/** */
alias g_dbus_menu_model_get = c_g_dbus_menu_model_get;

// DBusMessage

/** */
alias g_dbus_message_get_type = c_g_dbus_message_get_type;

/** */
alias g_dbus_message_new = c_g_dbus_message_new;

/** */
alias g_dbus_message_new_from_blob = c_g_dbus_message_new_from_blob;

/** */
alias g_dbus_message_new_method_call = c_g_dbus_message_new_method_call;

/** */
alias g_dbus_message_new_signal = c_g_dbus_message_new_signal;

/** */
alias g_dbus_message_bytes_needed = c_g_dbus_message_bytes_needed;

/** */
alias g_dbus_message_copy = c_g_dbus_message_copy;

/** */
alias g_dbus_message_get_arg0 = c_g_dbus_message_get_arg0;

/** */
alias g_dbus_message_get_arg0_path = c_g_dbus_message_get_arg0_path;

/** */
alias g_dbus_message_get_body = c_g_dbus_message_get_body;

/** */
alias g_dbus_message_get_byte_order = c_g_dbus_message_get_byte_order;

/** */
alias g_dbus_message_get_destination = c_g_dbus_message_get_destination;

/** */
alias g_dbus_message_get_error_name = c_g_dbus_message_get_error_name;

/** */
alias g_dbus_message_get_flags = c_g_dbus_message_get_flags;

/** */
alias g_dbus_message_get_header = c_g_dbus_message_get_header;

/** */
alias g_dbus_message_get_header_fields = c_g_dbus_message_get_header_fields;

/** */
alias g_dbus_message_get_interface = c_g_dbus_message_get_interface;

/** */
alias g_dbus_message_get_locked = c_g_dbus_message_get_locked;

/** */
alias g_dbus_message_get_member = c_g_dbus_message_get_member;

/** */
alias g_dbus_message_get_message_type = c_g_dbus_message_get_message_type;

/** */
alias g_dbus_message_get_num_unix_fds = c_g_dbus_message_get_num_unix_fds;

/** */
alias g_dbus_message_get_path = c_g_dbus_message_get_path;

/** */
alias g_dbus_message_get_reply_serial = c_g_dbus_message_get_reply_serial;

/** */
alias g_dbus_message_get_sender = c_g_dbus_message_get_sender;

/** */
alias g_dbus_message_get_serial = c_g_dbus_message_get_serial;

/** */
alias g_dbus_message_get_signature = c_g_dbus_message_get_signature;

/** */
alias g_dbus_message_get_unix_fd_list = c_g_dbus_message_get_unix_fd_list;

/** */
alias g_dbus_message_lock = c_g_dbus_message_lock;

/** */
alias g_dbus_message_new_method_error = c_g_dbus_message_new_method_error;

/** */
alias g_dbus_message_new_method_error_literal = c_g_dbus_message_new_method_error_literal;

/** */
alias g_dbus_message_new_method_error_valist = c_g_dbus_message_new_method_error_valist;

/** */
alias g_dbus_message_new_method_reply = c_g_dbus_message_new_method_reply;

/** */
alias g_dbus_message_print = c_g_dbus_message_print;

/** */
alias g_dbus_message_set_body = c_g_dbus_message_set_body;

/** */
alias g_dbus_message_set_byte_order = c_g_dbus_message_set_byte_order;

/** */
alias g_dbus_message_set_destination = c_g_dbus_message_set_destination;

/** */
alias g_dbus_message_set_error_name = c_g_dbus_message_set_error_name;

/** */
alias g_dbus_message_set_flags = c_g_dbus_message_set_flags;

/** */
alias g_dbus_message_set_header = c_g_dbus_message_set_header;

/** */
alias g_dbus_message_set_interface = c_g_dbus_message_set_interface;

/** */
alias g_dbus_message_set_member = c_g_dbus_message_set_member;

/** */
alias g_dbus_message_set_message_type = c_g_dbus_message_set_message_type;

/** */
alias g_dbus_message_set_num_unix_fds = c_g_dbus_message_set_num_unix_fds;

/** */
alias g_dbus_message_set_path = c_g_dbus_message_set_path;

/** */
alias g_dbus_message_set_reply_serial = c_g_dbus_message_set_reply_serial;

/** */
alias g_dbus_message_set_sender = c_g_dbus_message_set_sender;

/** */
alias g_dbus_message_set_serial = c_g_dbus_message_set_serial;

/** */
alias g_dbus_message_set_signature = c_g_dbus_message_set_signature;

/** */
alias g_dbus_message_set_unix_fd_list = c_g_dbus_message_set_unix_fd_list;

/** */
alias g_dbus_message_to_blob = c_g_dbus_message_to_blob;

/** */
alias g_dbus_message_to_gerror = c_g_dbus_message_to_gerror;

// DBusMethodInfo

/** */
alias g_dbus_method_info_get_type = c_g_dbus_method_info_get_type;

/** */
alias g_dbus_method_info_ref = c_g_dbus_method_info_ref;

/** */
alias g_dbus_method_info_unref = c_g_dbus_method_info_unref;

// DBusMethodInvocation

/** */
alias g_dbus_method_invocation_get_type = c_g_dbus_method_invocation_get_type;

/** */
alias g_dbus_method_invocation_get_connection = c_g_dbus_method_invocation_get_connection;

/** */
alias g_dbus_method_invocation_get_interface_name = c_g_dbus_method_invocation_get_interface_name;

/** */
alias g_dbus_method_invocation_get_message = c_g_dbus_method_invocation_get_message;

/** */
alias g_dbus_method_invocation_get_method_info = c_g_dbus_method_invocation_get_method_info;

/** */
alias g_dbus_method_invocation_get_method_name = c_g_dbus_method_invocation_get_method_name;

/** */
alias g_dbus_method_invocation_get_object_path = c_g_dbus_method_invocation_get_object_path;

/** */
alias g_dbus_method_invocation_get_parameters = c_g_dbus_method_invocation_get_parameters;

/** */
alias g_dbus_method_invocation_get_property_info = c_g_dbus_method_invocation_get_property_info;

/** */
alias g_dbus_method_invocation_get_sender = c_g_dbus_method_invocation_get_sender;

/** */
alias g_dbus_method_invocation_get_user_data = c_g_dbus_method_invocation_get_user_data;

/** */
alias g_dbus_method_invocation_return_dbus_error = c_g_dbus_method_invocation_return_dbus_error;

/** */
alias g_dbus_method_invocation_return_error = c_g_dbus_method_invocation_return_error;

/** */
alias g_dbus_method_invocation_return_error_literal = c_g_dbus_method_invocation_return_error_literal;

/** */
alias g_dbus_method_invocation_return_error_valist = c_g_dbus_method_invocation_return_error_valist;

/** */
alias g_dbus_method_invocation_return_gerror = c_g_dbus_method_invocation_return_gerror;

/** */
alias g_dbus_method_invocation_return_value = c_g_dbus_method_invocation_return_value;

/** */
alias g_dbus_method_invocation_return_value_with_unix_fd_list = c_g_dbus_method_invocation_return_value_with_unix_fd_list;

/** */
alias g_dbus_method_invocation_take_error = c_g_dbus_method_invocation_take_error;

// DBusNodeInfo

/** */
alias g_dbus_node_info_get_type = c_g_dbus_node_info_get_type;

/** */
alias g_dbus_node_info_new_for_xml = c_g_dbus_node_info_new_for_xml;

/** */
alias g_dbus_node_info_generate_xml = c_g_dbus_node_info_generate_xml;

/** */
alias g_dbus_node_info_lookup_interface = c_g_dbus_node_info_lookup_interface;

/** */
alias g_dbus_node_info_ref = c_g_dbus_node_info_ref;

/** */
alias g_dbus_node_info_unref = c_g_dbus_node_info_unref;

// DBusObject

/** */
alias g_dbus_object_get_type = c_g_dbus_object_get_type;

/** */
alias g_dbus_object_get_interface = c_g_dbus_object_get_interface;

/** */
alias g_dbus_object_get_interfaces = c_g_dbus_object_get_interfaces;

/** */
alias g_dbus_object_get_object_path = c_g_dbus_object_get_object_path;

// DBusObjectManager

/** */
alias g_dbus_object_manager_get_type = c_g_dbus_object_manager_get_type;

/** */
alias g_dbus_object_manager_get_interface = c_g_dbus_object_manager_get_interface;

/** */
alias g_dbus_object_manager_get_object = c_g_dbus_object_manager_get_object;

/** */
alias g_dbus_object_manager_get_object_path = c_g_dbus_object_manager_get_object_path;

/** */
alias g_dbus_object_manager_get_objects = c_g_dbus_object_manager_get_objects;

// DBusObjectManagerClient

/** */
alias g_dbus_object_manager_client_get_type = c_g_dbus_object_manager_client_get_type;

/** */
alias g_dbus_object_manager_client_new_finish = c_g_dbus_object_manager_client_new_finish;

/** */
alias g_dbus_object_manager_client_new_for_bus_finish = c_g_dbus_object_manager_client_new_for_bus_finish;

/** */
alias g_dbus_object_manager_client_new_for_bus_sync = c_g_dbus_object_manager_client_new_for_bus_sync;

/** */
alias g_dbus_object_manager_client_new_sync = c_g_dbus_object_manager_client_new_sync;

/** */
alias g_dbus_object_manager_client_new = c_g_dbus_object_manager_client_new;

/** */
alias g_dbus_object_manager_client_new_for_bus = c_g_dbus_object_manager_client_new_for_bus;

/** */
alias g_dbus_object_manager_client_get_connection = c_g_dbus_object_manager_client_get_connection;

/** */
alias g_dbus_object_manager_client_get_flags = c_g_dbus_object_manager_client_get_flags;

/** */
alias g_dbus_object_manager_client_get_name = c_g_dbus_object_manager_client_get_name;

/** */
alias g_dbus_object_manager_client_get_name_owner = c_g_dbus_object_manager_client_get_name_owner;

// DBusObjectManagerServer

/** */
alias g_dbus_object_manager_server_get_type = c_g_dbus_object_manager_server_get_type;

/** */
alias g_dbus_object_manager_server_new = c_g_dbus_object_manager_server_new;

/** */
alias g_dbus_object_manager_server_export = c_g_dbus_object_manager_server_export;

/** */
alias g_dbus_object_manager_server_export_uniquely = c_g_dbus_object_manager_server_export_uniquely;

/** */
alias g_dbus_object_manager_server_get_connection = c_g_dbus_object_manager_server_get_connection;

/** */
alias g_dbus_object_manager_server_is_exported = c_g_dbus_object_manager_server_is_exported;

/** */
alias g_dbus_object_manager_server_set_connection = c_g_dbus_object_manager_server_set_connection;

/** */
alias g_dbus_object_manager_server_unexport = c_g_dbus_object_manager_server_unexport;

// DBusObjectProxy

/** */
alias g_dbus_object_proxy_get_type = c_g_dbus_object_proxy_get_type;

/** */
alias g_dbus_object_proxy_new = c_g_dbus_object_proxy_new;

/** */
alias g_dbus_object_proxy_get_connection = c_g_dbus_object_proxy_get_connection;

// DBusObjectSkeleton

/** */
alias g_dbus_object_skeleton_get_type = c_g_dbus_object_skeleton_get_type;

/** */
alias g_dbus_object_skeleton_new = c_g_dbus_object_skeleton_new;

/** */
alias g_dbus_object_skeleton_add_interface = c_g_dbus_object_skeleton_add_interface;

/** */
alias g_dbus_object_skeleton_flush = c_g_dbus_object_skeleton_flush;

/** */
alias g_dbus_object_skeleton_remove_interface = c_g_dbus_object_skeleton_remove_interface;

/** */
alias g_dbus_object_skeleton_remove_interface_by_name = c_g_dbus_object_skeleton_remove_interface_by_name;

/** */
alias g_dbus_object_skeleton_set_object_path = c_g_dbus_object_skeleton_set_object_path;

// DBusPropertyInfo

/** */
alias g_dbus_property_info_get_type = c_g_dbus_property_info_get_type;

/** */
alias g_dbus_property_info_ref = c_g_dbus_property_info_ref;

/** */
alias g_dbus_property_info_unref = c_g_dbus_property_info_unref;

// DBusProxy

/** */
alias g_dbus_proxy_get_type = c_g_dbus_proxy_get_type;

/** */
alias g_dbus_proxy_new_finish = c_g_dbus_proxy_new_finish;

/** */
alias g_dbus_proxy_new_for_bus_finish = c_g_dbus_proxy_new_for_bus_finish;

/** */
alias g_dbus_proxy_new_for_bus_sync = c_g_dbus_proxy_new_for_bus_sync;

/** */
alias g_dbus_proxy_new_sync = c_g_dbus_proxy_new_sync;

/** */
alias g_dbus_proxy_new = c_g_dbus_proxy_new;

/** */
alias g_dbus_proxy_new_for_bus = c_g_dbus_proxy_new_for_bus;

/** */
alias g_dbus_proxy_call = c_g_dbus_proxy_call;

/** */
alias g_dbus_proxy_call_finish = c_g_dbus_proxy_call_finish;

/** */
alias g_dbus_proxy_call_sync = c_g_dbus_proxy_call_sync;

/** */
alias g_dbus_proxy_call_with_unix_fd_list = c_g_dbus_proxy_call_with_unix_fd_list;

/** */
alias g_dbus_proxy_call_with_unix_fd_list_finish = c_g_dbus_proxy_call_with_unix_fd_list_finish;

/** */
alias g_dbus_proxy_call_with_unix_fd_list_sync = c_g_dbus_proxy_call_with_unix_fd_list_sync;

/** */
alias g_dbus_proxy_get_cached_property = c_g_dbus_proxy_get_cached_property;

/** */
alias g_dbus_proxy_get_cached_property_names = c_g_dbus_proxy_get_cached_property_names;

/** */
alias g_dbus_proxy_get_connection = c_g_dbus_proxy_get_connection;

/** */
alias g_dbus_proxy_get_default_timeout = c_g_dbus_proxy_get_default_timeout;

/** */
alias g_dbus_proxy_get_flags = c_g_dbus_proxy_get_flags;

/** */
alias g_dbus_proxy_get_interface_info = c_g_dbus_proxy_get_interface_info;

/** */
alias g_dbus_proxy_get_interface_name = c_g_dbus_proxy_get_interface_name;

/** */
alias g_dbus_proxy_get_name = c_g_dbus_proxy_get_name;

/** */
alias g_dbus_proxy_get_name_owner = c_g_dbus_proxy_get_name_owner;

/** */
alias g_dbus_proxy_get_object_path = c_g_dbus_proxy_get_object_path;

/** */
alias g_dbus_proxy_set_cached_property = c_g_dbus_proxy_set_cached_property;

/** */
alias g_dbus_proxy_set_default_timeout = c_g_dbus_proxy_set_default_timeout;

/** */
alias g_dbus_proxy_set_interface_info = c_g_dbus_proxy_set_interface_info;

// DBusServer

/** */
alias g_dbus_server_get_type = c_g_dbus_server_get_type;

/** */
alias g_dbus_server_new_sync = c_g_dbus_server_new_sync;

/** */
alias g_dbus_server_get_client_address = c_g_dbus_server_get_client_address;

/** */
alias g_dbus_server_get_flags = c_g_dbus_server_get_flags;

/** */
alias g_dbus_server_get_guid = c_g_dbus_server_get_guid;

/** */
alias g_dbus_server_is_active = c_g_dbus_server_is_active;

/** */
alias g_dbus_server_start = c_g_dbus_server_start;

/** */
alias g_dbus_server_stop = c_g_dbus_server_stop;

// DBusSignalInfo

/** */
alias g_dbus_signal_info_get_type = c_g_dbus_signal_info_get_type;

/** */
alias g_dbus_signal_info_ref = c_g_dbus_signal_info_ref;

/** */
alias g_dbus_signal_info_unref = c_g_dbus_signal_info_unref;

// DataInputStream

/** */
alias g_data_input_stream_get_type = c_g_data_input_stream_get_type;

/** */
alias g_data_input_stream_new = c_g_data_input_stream_new;

/** */
alias g_data_input_stream_get_byte_order = c_g_data_input_stream_get_byte_order;

/** */
alias g_data_input_stream_get_newline_type = c_g_data_input_stream_get_newline_type;

/** */
alias g_data_input_stream_read_byte = c_g_data_input_stream_read_byte;

/** */
alias g_data_input_stream_read_int16 = c_g_data_input_stream_read_int16;

/** */
alias g_data_input_stream_read_int32 = c_g_data_input_stream_read_int32;

/** */
alias g_data_input_stream_read_int64 = c_g_data_input_stream_read_int64;

/** */
alias g_data_input_stream_read_line = c_g_data_input_stream_read_line;

/** */
alias g_data_input_stream_read_line_async = c_g_data_input_stream_read_line_async;

/** */
alias g_data_input_stream_read_line_finish = c_g_data_input_stream_read_line_finish;

/** */
alias g_data_input_stream_read_line_finish_utf8 = c_g_data_input_stream_read_line_finish_utf8;

/** */
alias g_data_input_stream_read_line_utf8 = c_g_data_input_stream_read_line_utf8;

/** */
alias g_data_input_stream_read_uint16 = c_g_data_input_stream_read_uint16;

/** */
alias g_data_input_stream_read_uint32 = c_g_data_input_stream_read_uint32;

/** */
alias g_data_input_stream_read_uint64 = c_g_data_input_stream_read_uint64;

/** */
alias g_data_input_stream_read_until = c_g_data_input_stream_read_until;

/** */
alias g_data_input_stream_read_until_async = c_g_data_input_stream_read_until_async;

/** */
alias g_data_input_stream_read_until_finish = c_g_data_input_stream_read_until_finish;

/** */
alias g_data_input_stream_read_upto = c_g_data_input_stream_read_upto;

/** */
alias g_data_input_stream_read_upto_async = c_g_data_input_stream_read_upto_async;

/** */
alias g_data_input_stream_read_upto_finish = c_g_data_input_stream_read_upto_finish;

/** */
alias g_data_input_stream_set_byte_order = c_g_data_input_stream_set_byte_order;

/** */
alias g_data_input_stream_set_newline_type = c_g_data_input_stream_set_newline_type;

// DataOutputStream

/** */
alias g_data_output_stream_get_type = c_g_data_output_stream_get_type;

/** */
alias g_data_output_stream_new = c_g_data_output_stream_new;

/** */
alias g_data_output_stream_get_byte_order = c_g_data_output_stream_get_byte_order;

/** */
alias g_data_output_stream_put_byte = c_g_data_output_stream_put_byte;

/** */
alias g_data_output_stream_put_int16 = c_g_data_output_stream_put_int16;

/** */
alias g_data_output_stream_put_int32 = c_g_data_output_stream_put_int32;

/** */
alias g_data_output_stream_put_int64 = c_g_data_output_stream_put_int64;

/** */
alias g_data_output_stream_put_string = c_g_data_output_stream_put_string;

/** */
alias g_data_output_stream_put_uint16 = c_g_data_output_stream_put_uint16;

/** */
alias g_data_output_stream_put_uint32 = c_g_data_output_stream_put_uint32;

/** */
alias g_data_output_stream_put_uint64 = c_g_data_output_stream_put_uint64;

/** */
alias g_data_output_stream_set_byte_order = c_g_data_output_stream_set_byte_order;

// DatagramBased

/** */
alias g_datagram_based_get_type = c_g_datagram_based_get_type;

/** */
alias g_datagram_based_condition_check = c_g_datagram_based_condition_check;

/** */
alias g_datagram_based_condition_wait = c_g_datagram_based_condition_wait;

/** */
alias g_datagram_based_create_source = c_g_datagram_based_create_source;

/** */
alias g_datagram_based_receive_messages = c_g_datagram_based_receive_messages;

/** */
alias g_datagram_based_send_messages = c_g_datagram_based_send_messages;

// DebugController

/** */
alias g_debug_controller_get_type = c_g_debug_controller_get_type;

/** */
alias g_debug_controller_get_debug_enabled = c_g_debug_controller_get_debug_enabled;

/** */
alias g_debug_controller_set_debug_enabled = c_g_debug_controller_set_debug_enabled;

// DebugControllerDBus

/** */
alias g_debug_controller_dbus_get_type = c_g_debug_controller_dbus_get_type;

/** */
alias g_debug_controller_dbus_new = c_g_debug_controller_dbus_new;

/** */
alias g_debug_controller_dbus_stop = c_g_debug_controller_dbus_stop;

// Drive

/** */
alias g_drive_get_type = c_g_drive_get_type;

/** */
alias g_drive_can_eject = c_g_drive_can_eject;

/** */
alias g_drive_can_poll_for_media = c_g_drive_can_poll_for_media;

/** */
alias g_drive_can_start = c_g_drive_can_start;

/** */
alias g_drive_can_start_degraded = c_g_drive_can_start_degraded;

/** */
alias g_drive_can_stop = c_g_drive_can_stop;

/** */
alias g_drive_eject = c_g_drive_eject;

/** */
alias g_drive_eject_finish = c_g_drive_eject_finish;

/** */
alias g_drive_eject_with_operation = c_g_drive_eject_with_operation;

/** */
alias g_drive_eject_with_operation_finish = c_g_drive_eject_with_operation_finish;

/** */
alias g_drive_enumerate_identifiers = c_g_drive_enumerate_identifiers;

/** */
alias g_drive_get_icon = c_g_drive_get_icon;

/** */
alias g_drive_get_identifier = c_g_drive_get_identifier;

/** */
alias g_drive_get_name = c_g_drive_get_name;

/** */
alias g_drive_get_sort_key = c_g_drive_get_sort_key;

/** */
alias g_drive_get_start_stop_type = c_g_drive_get_start_stop_type;

/** */
alias g_drive_get_symbolic_icon = c_g_drive_get_symbolic_icon;

/** */
alias g_drive_get_volumes = c_g_drive_get_volumes;

/** */
alias g_drive_has_media = c_g_drive_has_media;

/** */
alias g_drive_has_volumes = c_g_drive_has_volumes;

/** */
alias g_drive_is_media_check_automatic = c_g_drive_is_media_check_automatic;

/** */
alias g_drive_is_media_removable = c_g_drive_is_media_removable;

/** */
alias g_drive_is_removable = c_g_drive_is_removable;

/** */
alias g_drive_poll_for_media = c_g_drive_poll_for_media;

/** */
alias g_drive_poll_for_media_finish = c_g_drive_poll_for_media_finish;

/** */
alias g_drive_start = c_g_drive_start;

/** */
alias g_drive_start_finish = c_g_drive_start_finish;

/** */
alias g_drive_stop = c_g_drive_stop;

/** */
alias g_drive_stop_finish = c_g_drive_stop_finish;

// DtlsClientConnection

/** */
alias g_dtls_client_connection_get_type = c_g_dtls_client_connection_get_type;

/** */
alias g_dtls_client_connection_new = c_g_dtls_client_connection_new;

/** */
alias g_dtls_client_connection_get_accepted_cas = c_g_dtls_client_connection_get_accepted_cas;

/** */
alias g_dtls_client_connection_get_server_identity = c_g_dtls_client_connection_get_server_identity;

/** */
alias g_dtls_client_connection_get_validation_flags = c_g_dtls_client_connection_get_validation_flags;

/** */
alias g_dtls_client_connection_set_server_identity = c_g_dtls_client_connection_set_server_identity;

/** */
alias g_dtls_client_connection_set_validation_flags = c_g_dtls_client_connection_set_validation_flags;

// DtlsConnection

/** */
alias g_dtls_connection_get_type = c_g_dtls_connection_get_type;

/** */
alias g_dtls_connection_close = c_g_dtls_connection_close;

/** */
alias g_dtls_connection_close_async = c_g_dtls_connection_close_async;

/** */
alias g_dtls_connection_close_finish = c_g_dtls_connection_close_finish;

/** */
alias g_dtls_connection_emit_accept_certificate = c_g_dtls_connection_emit_accept_certificate;

/** */
alias g_dtls_connection_get_certificate = c_g_dtls_connection_get_certificate;

/** */
alias g_dtls_connection_get_channel_binding_data = c_g_dtls_connection_get_channel_binding_data;

/** */
alias g_dtls_connection_get_ciphersuite_name = c_g_dtls_connection_get_ciphersuite_name;

/** */
alias g_dtls_connection_get_database = c_g_dtls_connection_get_database;

/** */
alias g_dtls_connection_get_interaction = c_g_dtls_connection_get_interaction;

/** */
alias g_dtls_connection_get_negotiated_protocol = c_g_dtls_connection_get_negotiated_protocol;

/** */
alias g_dtls_connection_get_peer_certificate = c_g_dtls_connection_get_peer_certificate;

/** */
alias g_dtls_connection_get_peer_certificate_errors = c_g_dtls_connection_get_peer_certificate_errors;

/** */
alias g_dtls_connection_get_protocol_version = c_g_dtls_connection_get_protocol_version;

/** */
alias g_dtls_connection_get_rehandshake_mode = c_g_dtls_connection_get_rehandshake_mode;

/** */
alias g_dtls_connection_get_require_close_notify = c_g_dtls_connection_get_require_close_notify;

/** */
alias g_dtls_connection_handshake = c_g_dtls_connection_handshake;

/** */
alias g_dtls_connection_handshake_async = c_g_dtls_connection_handshake_async;

/** */
alias g_dtls_connection_handshake_finish = c_g_dtls_connection_handshake_finish;

/** */
alias g_dtls_connection_set_advertised_protocols = c_g_dtls_connection_set_advertised_protocols;

/** */
alias g_dtls_connection_set_certificate = c_g_dtls_connection_set_certificate;

/** */
alias g_dtls_connection_set_database = c_g_dtls_connection_set_database;

/** */
alias g_dtls_connection_set_interaction = c_g_dtls_connection_set_interaction;

/** */
alias g_dtls_connection_set_rehandshake_mode = c_g_dtls_connection_set_rehandshake_mode;

/** */
alias g_dtls_connection_set_require_close_notify = c_g_dtls_connection_set_require_close_notify;

/** */
alias g_dtls_connection_shutdown = c_g_dtls_connection_shutdown;

/** */
alias g_dtls_connection_shutdown_async = c_g_dtls_connection_shutdown_async;

/** */
alias g_dtls_connection_shutdown_finish = c_g_dtls_connection_shutdown_finish;

// DtlsServerConnection

/** */
alias g_dtls_server_connection_get_type = c_g_dtls_server_connection_get_type;

/** */
alias g_dtls_server_connection_new = c_g_dtls_server_connection_new;

// Emblem

/** */
alias g_emblem_get_type = c_g_emblem_get_type;

/** */
alias g_emblem_new = c_g_emblem_new;

/** */
alias g_emblem_new_with_origin = c_g_emblem_new_with_origin;

/** */
alias g_emblem_get_icon = c_g_emblem_get_icon;

/** */
alias g_emblem_get_origin = c_g_emblem_get_origin;

// EmblemedIcon

/** */
alias g_emblemed_icon_get_type = c_g_emblemed_icon_get_type;

/** */
alias g_emblemed_icon_new = c_g_emblemed_icon_new;

/** */
alias g_emblemed_icon_add_emblem = c_g_emblemed_icon_add_emblem;

/** */
alias g_emblemed_icon_clear_emblems = c_g_emblemed_icon_clear_emblems;

/** */
alias g_emblemed_icon_get_emblems = c_g_emblemed_icon_get_emblems;

/** */
alias g_emblemed_icon_get_icon = c_g_emblemed_icon_get_icon;

// File

/** */
alias g_file_get_type = c_g_file_get_type;

/** */
alias g_file_new_build_filename = c_g_file_new_build_filename;

/** */
alias g_file_new_build_filenamev = c_g_file_new_build_filenamev;

/** */
alias g_file_new_for_commandline_arg = c_g_file_new_for_commandline_arg;

/** */
alias g_file_new_for_commandline_arg_and_cwd = c_g_file_new_for_commandline_arg_and_cwd;

/** */
alias g_file_new_for_path = c_g_file_new_for_path;

/** */
alias g_file_new_for_uri = c_g_file_new_for_uri;

/** */
alias g_file_new_tmp = c_g_file_new_tmp;

/** */
alias g_file_new_tmp_async = c_g_file_new_tmp_async;

/** */
alias g_file_new_tmp_dir_async = c_g_file_new_tmp_dir_async;

/** */
alias g_file_new_tmp_dir_finish = c_g_file_new_tmp_dir_finish;

/** */
alias g_file_new_tmp_finish = c_g_file_new_tmp_finish;

/** */
alias g_file_parse_name = c_g_file_parse_name;

/** */
alias g_file_append_to = c_g_file_append_to;

/** */
alias g_file_append_to_async = c_g_file_append_to_async;

/** */
alias g_file_append_to_finish = c_g_file_append_to_finish;

/** */
alias g_file_build_attribute_list_for_copy = c_g_file_build_attribute_list_for_copy;

/** */
alias g_file_copy = c_g_file_copy;

/** */
alias g_file_copy_async = c_g_file_copy_async;

/** */
alias g_file_copy_async_with_closures = c_g_file_copy_async_with_closures;

/** */
alias g_file_copy_attributes = c_g_file_copy_attributes;

/** */
alias g_file_copy_finish = c_g_file_copy_finish;

/** */
alias g_file_create = c_g_file_create;

/** */
alias g_file_create_async = c_g_file_create_async;

/** */
alias g_file_create_finish = c_g_file_create_finish;

/** */
alias g_file_create_readwrite = c_g_file_create_readwrite;

/** */
alias g_file_create_readwrite_async = c_g_file_create_readwrite_async;

/** */
alias g_file_create_readwrite_finish = c_g_file_create_readwrite_finish;

/** */
alias g_file_delete = c_g_file_delete;

/** */
alias g_file_delete_async = c_g_file_delete_async;

/** */
alias g_file_delete_finish = c_g_file_delete_finish;

/** */
alias g_file_dup = c_g_file_dup;

/** */
alias g_file_eject_mountable = c_g_file_eject_mountable;

/** */
alias g_file_eject_mountable_finish = c_g_file_eject_mountable_finish;

/** */
alias g_file_eject_mountable_with_operation = c_g_file_eject_mountable_with_operation;

/** */
alias g_file_eject_mountable_with_operation_finish = c_g_file_eject_mountable_with_operation_finish;

/** */
alias g_file_enumerate_children = c_g_file_enumerate_children;

/** */
alias g_file_enumerate_children_async = c_g_file_enumerate_children_async;

/** */
alias g_file_enumerate_children_finish = c_g_file_enumerate_children_finish;

/** */
alias g_file_equal = c_g_file_equal;

/** */
alias g_file_find_enclosing_mount = c_g_file_find_enclosing_mount;

/** */
alias g_file_find_enclosing_mount_async = c_g_file_find_enclosing_mount_async;

/** */
alias g_file_find_enclosing_mount_finish = c_g_file_find_enclosing_mount_finish;

/** */
alias g_file_get_basename = c_g_file_get_basename;

/** */
alias g_file_get_child = c_g_file_get_child;

/** */
alias g_file_get_child_for_display_name = c_g_file_get_child_for_display_name;

/** */
alias g_file_get_parent = c_g_file_get_parent;

/** */
alias g_file_get_parse_name = c_g_file_get_parse_name;

/** */
alias g_file_get_path = c_g_file_get_path;

/** */
alias g_file_get_relative_path = c_g_file_get_relative_path;

/** */
alias g_file_get_uri = c_g_file_get_uri;

/** */
alias g_file_get_uri_scheme = c_g_file_get_uri_scheme;

/** */
alias g_file_has_parent = c_g_file_has_parent;

/** */
alias g_file_has_prefix = c_g_file_has_prefix;

/** */
alias g_file_has_uri_scheme = c_g_file_has_uri_scheme;

/** */
alias g_file_hash = c_g_file_hash;

/** */
alias g_file_is_native = c_g_file_is_native;

/** */
alias g_file_load_bytes = c_g_file_load_bytes;

/** */
alias g_file_load_bytes_async = c_g_file_load_bytes_async;

/** */
alias g_file_load_bytes_finish = c_g_file_load_bytes_finish;

/** */
alias g_file_load_contents = c_g_file_load_contents;

/** */
alias g_file_load_contents_async = c_g_file_load_contents_async;

/** */
alias g_file_load_contents_finish = c_g_file_load_contents_finish;

/** */
alias g_file_load_partial_contents_async = c_g_file_load_partial_contents_async;

/** */
alias g_file_load_partial_contents_finish = c_g_file_load_partial_contents_finish;

/** */
alias g_file_make_directory = c_g_file_make_directory;

/** */
alias g_file_make_directory_async = c_g_file_make_directory_async;

/** */
alias g_file_make_directory_finish = c_g_file_make_directory_finish;

/** */
alias g_file_make_directory_with_parents = c_g_file_make_directory_with_parents;

/** */
alias g_file_make_symbolic_link = c_g_file_make_symbolic_link;

/** */
alias g_file_make_symbolic_link_async = c_g_file_make_symbolic_link_async;

/** */
alias g_file_make_symbolic_link_finish = c_g_file_make_symbolic_link_finish;

/** */
alias g_file_measure_disk_usage = c_g_file_measure_disk_usage;

/** */
alias g_file_measure_disk_usage_async = c_g_file_measure_disk_usage_async;

/** */
alias g_file_measure_disk_usage_finish = c_g_file_measure_disk_usage_finish;

/** */
alias g_file_monitor = c_g_file_monitor;

/** */
alias g_file_monitor_directory = c_g_file_monitor_directory;

/** */
alias g_file_monitor_file = c_g_file_monitor_file;

/** */
alias g_file_mount_enclosing_volume = c_g_file_mount_enclosing_volume;

/** */
alias g_file_mount_enclosing_volume_finish = c_g_file_mount_enclosing_volume_finish;

/** */
alias g_file_mount_mountable = c_g_file_mount_mountable;

/** */
alias g_file_mount_mountable_finish = c_g_file_mount_mountable_finish;

/** */
alias g_file_move = c_g_file_move;

/** */
alias g_file_move_async = c_g_file_move_async;

/** */
alias g_file_move_async_with_closures = c_g_file_move_async_with_closures;

/** */
alias g_file_move_finish = c_g_file_move_finish;

/** */
alias g_file_open_readwrite = c_g_file_open_readwrite;

/** */
alias g_file_open_readwrite_async = c_g_file_open_readwrite_async;

/** */
alias g_file_open_readwrite_finish = c_g_file_open_readwrite_finish;

/** */
alias g_file_peek_path = c_g_file_peek_path;

/** */
alias g_file_poll_mountable = c_g_file_poll_mountable;

/** */
alias g_file_poll_mountable_finish = c_g_file_poll_mountable_finish;

/** */
alias g_file_query_default_handler = c_g_file_query_default_handler;

/** */
alias g_file_query_default_handler_async = c_g_file_query_default_handler_async;

/** */
alias g_file_query_default_handler_finish = c_g_file_query_default_handler_finish;

/** */
alias g_file_query_exists = c_g_file_query_exists;

/** */
alias g_file_query_file_type = c_g_file_query_file_type;

/** */
alias g_file_query_filesystem_info = c_g_file_query_filesystem_info;

/** */
alias g_file_query_filesystem_info_async = c_g_file_query_filesystem_info_async;

/** */
alias g_file_query_filesystem_info_finish = c_g_file_query_filesystem_info_finish;

/** */
alias g_file_query_info = c_g_file_query_info;

/** */
alias g_file_query_info_async = c_g_file_query_info_async;

/** */
alias g_file_query_info_finish = c_g_file_query_info_finish;

/** */
alias g_file_query_settable_attributes = c_g_file_query_settable_attributes;

/** */
alias g_file_query_writable_namespaces = c_g_file_query_writable_namespaces;

/** */
alias g_file_read = c_g_file_read;

/** */
alias g_file_read_async = c_g_file_read_async;

/** */
alias g_file_read_finish = c_g_file_read_finish;

/** */
alias g_file_replace = c_g_file_replace;

/** */
alias g_file_replace_async = c_g_file_replace_async;

/** */
alias g_file_replace_contents = c_g_file_replace_contents;

/** */
alias g_file_replace_contents_async = c_g_file_replace_contents_async;

/** */
alias g_file_replace_contents_bytes_async = c_g_file_replace_contents_bytes_async;

/** */
alias g_file_replace_contents_finish = c_g_file_replace_contents_finish;

/** */
alias g_file_replace_finish = c_g_file_replace_finish;

/** */
alias g_file_replace_readwrite = c_g_file_replace_readwrite;

/** */
alias g_file_replace_readwrite_async = c_g_file_replace_readwrite_async;

/** */
alias g_file_replace_readwrite_finish = c_g_file_replace_readwrite_finish;

/** */
alias g_file_resolve_relative_path = c_g_file_resolve_relative_path;

/** */
alias g_file_set_attribute = c_g_file_set_attribute;

/** */
alias g_file_set_attribute_byte_string = c_g_file_set_attribute_byte_string;

/** */
alias g_file_set_attribute_int32 = c_g_file_set_attribute_int32;

/** */
alias g_file_set_attribute_int64 = c_g_file_set_attribute_int64;

/** */
alias g_file_set_attribute_string = c_g_file_set_attribute_string;

/** */
alias g_file_set_attribute_uint32 = c_g_file_set_attribute_uint32;

/** */
alias g_file_set_attribute_uint64 = c_g_file_set_attribute_uint64;

/** */
alias g_file_set_attributes_async = c_g_file_set_attributes_async;

/** */
alias g_file_set_attributes_finish = c_g_file_set_attributes_finish;

/** */
alias g_file_set_attributes_from_info = c_g_file_set_attributes_from_info;

/** */
alias g_file_set_display_name = c_g_file_set_display_name;

/** */
alias g_file_set_display_name_async = c_g_file_set_display_name_async;

/** */
alias g_file_set_display_name_finish = c_g_file_set_display_name_finish;

/** */
alias g_file_start_mountable = c_g_file_start_mountable;

/** */
alias g_file_start_mountable_finish = c_g_file_start_mountable_finish;

/** */
alias g_file_stop_mountable = c_g_file_stop_mountable;

/** */
alias g_file_stop_mountable_finish = c_g_file_stop_mountable_finish;

/** */
alias g_file_supports_thread_contexts = c_g_file_supports_thread_contexts;

/** */
alias g_file_trash = c_g_file_trash;

/** */
alias g_file_trash_async = c_g_file_trash_async;

/** */
alias g_file_trash_finish = c_g_file_trash_finish;

/** */
alias g_file_unmount_mountable = c_g_file_unmount_mountable;

/** */
alias g_file_unmount_mountable_finish = c_g_file_unmount_mountable_finish;

/** */
alias g_file_unmount_mountable_with_operation = c_g_file_unmount_mountable_with_operation;

/** */
alias g_file_unmount_mountable_with_operation_finish = c_g_file_unmount_mountable_with_operation_finish;

// FileAttributeInfoList

/** */
alias g_file_attribute_info_list_get_type = c_g_file_attribute_info_list_get_type;

/** */
alias g_file_attribute_info_list_new = c_g_file_attribute_info_list_new;

/** */
alias g_file_attribute_info_list_add = c_g_file_attribute_info_list_add;

/** */
alias g_file_attribute_info_list_dup = c_g_file_attribute_info_list_dup;

/** */
alias g_file_attribute_info_list_lookup = c_g_file_attribute_info_list_lookup;

/** */
alias g_file_attribute_info_list_ref = c_g_file_attribute_info_list_ref;

/** */
alias g_file_attribute_info_list_unref = c_g_file_attribute_info_list_unref;

// FileAttributeMatcher

/** */
alias g_file_attribute_matcher_get_type = c_g_file_attribute_matcher_get_type;

/** */
alias g_file_attribute_matcher_new = c_g_file_attribute_matcher_new;

/** */
alias g_file_attribute_matcher_enumerate_namespace = c_g_file_attribute_matcher_enumerate_namespace;

/** */
alias g_file_attribute_matcher_enumerate_next = c_g_file_attribute_matcher_enumerate_next;

/** */
alias g_file_attribute_matcher_matches = c_g_file_attribute_matcher_matches;

/** */
alias g_file_attribute_matcher_matches_only = c_g_file_attribute_matcher_matches_only;

/** */
alias g_file_attribute_matcher_ref = c_g_file_attribute_matcher_ref;

/** */
alias g_file_attribute_matcher_subtract = c_g_file_attribute_matcher_subtract;

/** */
alias g_file_attribute_matcher_to_string = c_g_file_attribute_matcher_to_string;

/** */
alias g_file_attribute_matcher_unref = c_g_file_attribute_matcher_unref;

// FileEnumerator

/** */
alias g_file_enumerator_get_type = c_g_file_enumerator_get_type;

/** */
alias g_file_enumerator_close = c_g_file_enumerator_close;

/** */
alias g_file_enumerator_close_async = c_g_file_enumerator_close_async;

/** */
alias g_file_enumerator_close_finish = c_g_file_enumerator_close_finish;

/** */
alias g_file_enumerator_get_child = c_g_file_enumerator_get_child;

/** */
alias g_file_enumerator_get_container = c_g_file_enumerator_get_container;

/** */
alias g_file_enumerator_has_pending = c_g_file_enumerator_has_pending;

/** */
alias g_file_enumerator_is_closed = c_g_file_enumerator_is_closed;

/** */
alias g_file_enumerator_iterate = c_g_file_enumerator_iterate;

/** */
alias g_file_enumerator_next_file = c_g_file_enumerator_next_file;

/** */
alias g_file_enumerator_next_files_async = c_g_file_enumerator_next_files_async;

/** */
alias g_file_enumerator_next_files_finish = c_g_file_enumerator_next_files_finish;

/** */
alias g_file_enumerator_set_pending = c_g_file_enumerator_set_pending;

// FileIOStream

/** */
alias g_file_io_stream_get_type = c_g_file_io_stream_get_type;

/** */
alias g_file_io_stream_get_etag = c_g_file_io_stream_get_etag;

/** */
alias g_file_io_stream_query_info = c_g_file_io_stream_query_info;

/** */
alias g_file_io_stream_query_info_async = c_g_file_io_stream_query_info_async;

/** */
alias g_file_io_stream_query_info_finish = c_g_file_io_stream_query_info_finish;

// FileIcon

/** */
alias g_file_icon_get_type = c_g_file_icon_get_type;

/** */
alias g_file_icon_new = c_g_file_icon_new;

/** */
alias g_file_icon_get_file = c_g_file_icon_get_file;

// FileInfo

/** */
alias g_file_info_get_type = c_g_file_info_get_type;

/** */
alias g_file_info_new = c_g_file_info_new;

/** */
alias g_file_info_clear_status = c_g_file_info_clear_status;

/** */
alias g_file_info_copy_into = c_g_file_info_copy_into;

/** */
alias g_file_info_dup = c_g_file_info_dup;

/** */
alias g_file_info_get_access_date_time = c_g_file_info_get_access_date_time;

/** */
alias g_file_info_get_attribute_as_string = c_g_file_info_get_attribute_as_string;

/** */
alias g_file_info_get_attribute_boolean = c_g_file_info_get_attribute_boolean;

/** */
alias g_file_info_get_attribute_byte_string = c_g_file_info_get_attribute_byte_string;

/** */
alias g_file_info_get_attribute_data = c_g_file_info_get_attribute_data;

/** */
alias g_file_info_get_attribute_file_path = c_g_file_info_get_attribute_file_path;

/** */
alias g_file_info_get_attribute_int32 = c_g_file_info_get_attribute_int32;

/** */
alias g_file_info_get_attribute_int64 = c_g_file_info_get_attribute_int64;

/** */
alias g_file_info_get_attribute_object = c_g_file_info_get_attribute_object;

/** */
alias g_file_info_get_attribute_status = c_g_file_info_get_attribute_status;

/** */
alias g_file_info_get_attribute_string = c_g_file_info_get_attribute_string;

/** */
alias g_file_info_get_attribute_stringv = c_g_file_info_get_attribute_stringv;

/** */
alias g_file_info_get_attribute_type = c_g_file_info_get_attribute_type;

/** */
alias g_file_info_get_attribute_uint32 = c_g_file_info_get_attribute_uint32;

/** */
alias g_file_info_get_attribute_uint64 = c_g_file_info_get_attribute_uint64;

/** */
alias g_file_info_get_content_type = c_g_file_info_get_content_type;

/** */
alias g_file_info_get_creation_date_time = c_g_file_info_get_creation_date_time;

/** */
alias g_file_info_get_deletion_date = c_g_file_info_get_deletion_date;

/** */
alias g_file_info_get_display_name = c_g_file_info_get_display_name;

/** */
alias g_file_info_get_edit_name = c_g_file_info_get_edit_name;

/** */
alias g_file_info_get_etag = c_g_file_info_get_etag;

/** */
alias g_file_info_get_file_type = c_g_file_info_get_file_type;

/** */
alias g_file_info_get_icon = c_g_file_info_get_icon;

/** */
alias g_file_info_get_is_backup = c_g_file_info_get_is_backup;

/** */
alias g_file_info_get_is_hidden = c_g_file_info_get_is_hidden;

/** */
alias g_file_info_get_is_symlink = c_g_file_info_get_is_symlink;

/** */
alias g_file_info_get_modification_date_time = c_g_file_info_get_modification_date_time;

/** */
alias g_file_info_get_modification_time = c_g_file_info_get_modification_time;

/** */
alias g_file_info_get_name = c_g_file_info_get_name;

/** */
alias g_file_info_get_size = c_g_file_info_get_size;

/** */
alias g_file_info_get_sort_order = c_g_file_info_get_sort_order;

/** */
alias g_file_info_get_symbolic_icon = c_g_file_info_get_symbolic_icon;

/** */
alias g_file_info_get_symlink_target = c_g_file_info_get_symlink_target;

/** */
alias g_file_info_has_attribute = c_g_file_info_has_attribute;

/** */
alias g_file_info_has_namespace = c_g_file_info_has_namespace;

/** */
alias g_file_info_list_attributes = c_g_file_info_list_attributes;

/** */
alias g_file_info_remove_attribute = c_g_file_info_remove_attribute;

/** */
alias g_file_info_set_access_date_time = c_g_file_info_set_access_date_time;

/** */
alias g_file_info_set_attribute = c_g_file_info_set_attribute;

/** */
alias g_file_info_set_attribute_boolean = c_g_file_info_set_attribute_boolean;

/** */
alias g_file_info_set_attribute_byte_string = c_g_file_info_set_attribute_byte_string;

/** */
alias g_file_info_set_attribute_file_path = c_g_file_info_set_attribute_file_path;

/** */
alias g_file_info_set_attribute_int32 = c_g_file_info_set_attribute_int32;

/** */
alias g_file_info_set_attribute_int64 = c_g_file_info_set_attribute_int64;

/** */
alias g_file_info_set_attribute_mask = c_g_file_info_set_attribute_mask;

/** */
alias g_file_info_set_attribute_object = c_g_file_info_set_attribute_object;

/** */
alias g_file_info_set_attribute_status = c_g_file_info_set_attribute_status;

/** */
alias g_file_info_set_attribute_string = c_g_file_info_set_attribute_string;

/** */
alias g_file_info_set_attribute_stringv = c_g_file_info_set_attribute_stringv;

/** */
alias g_file_info_set_attribute_uint32 = c_g_file_info_set_attribute_uint32;

/** */
alias g_file_info_set_attribute_uint64 = c_g_file_info_set_attribute_uint64;

/** */
alias g_file_info_set_content_type = c_g_file_info_set_content_type;

/** */
alias g_file_info_set_creation_date_time = c_g_file_info_set_creation_date_time;

/** */
alias g_file_info_set_display_name = c_g_file_info_set_display_name;

/** */
alias g_file_info_set_edit_name = c_g_file_info_set_edit_name;

/** */
alias g_file_info_set_file_type = c_g_file_info_set_file_type;

/** */
alias g_file_info_set_icon = c_g_file_info_set_icon;

/** */
alias g_file_info_set_is_hidden = c_g_file_info_set_is_hidden;

/** */
alias g_file_info_set_is_symlink = c_g_file_info_set_is_symlink;

/** */
alias g_file_info_set_modification_date_time = c_g_file_info_set_modification_date_time;

/** */
alias g_file_info_set_modification_time = c_g_file_info_set_modification_time;

/** */
alias g_file_info_set_name = c_g_file_info_set_name;

/** */
alias g_file_info_set_size = c_g_file_info_set_size;

/** */
alias g_file_info_set_sort_order = c_g_file_info_set_sort_order;

/** */
alias g_file_info_set_symbolic_icon = c_g_file_info_set_symbolic_icon;

/** */
alias g_file_info_set_symlink_target = c_g_file_info_set_symlink_target;

/** */
alias g_file_info_unset_attribute_mask = c_g_file_info_unset_attribute_mask;

// FileInputStream

/** */
alias g_file_input_stream_get_type = c_g_file_input_stream_get_type;

/** */
alias g_file_input_stream_query_info = c_g_file_input_stream_query_info;

/** */
alias g_file_input_stream_query_info_async = c_g_file_input_stream_query_info_async;

/** */
alias g_file_input_stream_query_info_finish = c_g_file_input_stream_query_info_finish;

// FileMonitor

/** */
alias g_file_monitor_get_type = c_g_file_monitor_get_type;

/** */
alias g_file_monitor_cancel = c_g_file_monitor_cancel;

/** */
alias g_file_monitor_emit_event = c_g_file_monitor_emit_event;

/** */
alias g_file_monitor_is_cancelled = c_g_file_monitor_is_cancelled;

/** */
alias g_file_monitor_set_rate_limit = c_g_file_monitor_set_rate_limit;

// FileOutputStream

/** */
alias g_file_output_stream_get_type = c_g_file_output_stream_get_type;

/** */
alias g_file_output_stream_get_etag = c_g_file_output_stream_get_etag;

/** */
alias g_file_output_stream_query_info = c_g_file_output_stream_query_info;

/** */
alias g_file_output_stream_query_info_async = c_g_file_output_stream_query_info_async;

/** */
alias g_file_output_stream_query_info_finish = c_g_file_output_stream_query_info_finish;

// FilenameCompleter

/** */
alias g_filename_completer_get_type = c_g_filename_completer_get_type;

/** */
alias g_filename_completer_new = c_g_filename_completer_new;

/** */
alias g_filename_completer_get_completion_suffix = c_g_filename_completer_get_completion_suffix;

/** */
alias g_filename_completer_get_completions = c_g_filename_completer_get_completions;

/** */
alias g_filename_completer_set_dirs_only = c_g_filename_completer_set_dirs_only;

// FilterInputStream

/** */
alias g_filter_input_stream_get_type = c_g_filter_input_stream_get_type;

/** */
alias g_filter_input_stream_get_base_stream = c_g_filter_input_stream_get_base_stream;

/** */
alias g_filter_input_stream_get_close_base_stream = c_g_filter_input_stream_get_close_base_stream;

/** */
alias g_filter_input_stream_set_close_base_stream = c_g_filter_input_stream_set_close_base_stream;

// FilterOutputStream

/** */
alias g_filter_output_stream_get_type = c_g_filter_output_stream_get_type;

/** */
alias g_filter_output_stream_get_base_stream = c_g_filter_output_stream_get_base_stream;

/** */
alias g_filter_output_stream_get_close_base_stream = c_g_filter_output_stream_get_close_base_stream;

/** */
alias g_filter_output_stream_set_close_base_stream = c_g_filter_output_stream_set_close_base_stream;

// IOExtension

/** */
alias g_io_extension_get_name = c_g_io_extension_get_name;

/** */
alias g_io_extension_get_priority = c_g_io_extension_get_priority;

/** */
alias g_io_extension_get_type = c_g_io_extension_get_type;

/** */
alias g_io_extension_ref_class = c_g_io_extension_ref_class;

// IOExtensionPoint

/** */
alias g_io_extension_point_get_extension_by_name = c_g_io_extension_point_get_extension_by_name;

/** */
alias g_io_extension_point_get_extensions = c_g_io_extension_point_get_extensions;

/** */
alias g_io_extension_point_get_required_type = c_g_io_extension_point_get_required_type;

/** */
alias g_io_extension_point_set_required_type = c_g_io_extension_point_set_required_type;

/** */
alias g_io_extension_point_implement = c_g_io_extension_point_implement;

/** */
alias g_io_extension_point_lookup = c_g_io_extension_point_lookup;

/** */
alias g_io_extension_point_register = c_g_io_extension_point_register;

// IOModule

/** */
alias g_io_module_get_type = c_g_io_module_get_type;

/** */
alias g_io_module_new = c_g_io_module_new;

/** */
alias g_io_module_query = c_g_io_module_query;

/** */
alias g_io_module_load = c_g_io_module_load;

/** */
alias g_io_module_unload = c_g_io_module_unload;

// IOModuleScope

/** */
alias g_io_module_scope_block = c_g_io_module_scope_block;

/** */
alias g_io_module_scope_free = c_g_io_module_scope_free;

/** */
alias g_io_module_scope_new = c_g_io_module_scope_new;

// IOSchedulerJob

/** */
alias g_io_scheduler_job_send_to_mainloop = c_g_io_scheduler_job_send_to_mainloop;

/** */
alias g_io_scheduler_job_send_to_mainloop_async = c_g_io_scheduler_job_send_to_mainloop_async;

// IOStream

/** */
alias g_io_stream_get_type = c_g_io_stream_get_type;

/** */
alias g_io_stream_splice_finish = c_g_io_stream_splice_finish;

/** */
alias g_io_stream_clear_pending = c_g_io_stream_clear_pending;

/** */
alias g_io_stream_close = c_g_io_stream_close;

/** */
alias g_io_stream_close_async = c_g_io_stream_close_async;

/** */
alias g_io_stream_close_finish = c_g_io_stream_close_finish;

/** */
alias g_io_stream_get_input_stream = c_g_io_stream_get_input_stream;

/** */
alias g_io_stream_get_output_stream = c_g_io_stream_get_output_stream;

/** */
alias g_io_stream_has_pending = c_g_io_stream_has_pending;

/** */
alias g_io_stream_is_closed = c_g_io_stream_is_closed;

/** */
alias g_io_stream_set_pending = c_g_io_stream_set_pending;

/** */
alias g_io_stream_splice_async = c_g_io_stream_splice_async;

// IPTosMessage

/** */
alias g_ip_tos_message_get_type = c_g_ip_tos_message_get_type;

/** */
alias g_ip_tos_message_new = c_g_ip_tos_message_new;

/** */
alias g_ip_tos_message_get_dscp = c_g_ip_tos_message_get_dscp;

/** */
alias g_ip_tos_message_get_ecn = c_g_ip_tos_message_get_ecn;

// IPv6TclassMessage

/** */
alias g_ipv6_tclass_message_get_type = c_g_ipv6_tclass_message_get_type;

/** */
alias g_ipv6_tclass_message_new = c_g_ipv6_tclass_message_new;

/** */
alias g_ipv6_tclass_message_get_dscp = c_g_ipv6_tclass_message_get_dscp;

/** */
alias g_ipv6_tclass_message_get_ecn = c_g_ipv6_tclass_message_get_ecn;

// Icon

/** */
alias g_icon_get_type = c_g_icon_get_type;

/** */
alias g_icon_deserialize = c_g_icon_deserialize;

/** */
alias g_icon_new_for_string = c_g_icon_new_for_string;

/** */
alias g_icon_equal = c_g_icon_equal;

/** */
alias g_icon_hash = c_g_icon_hash;

/** */
alias g_icon_serialize = c_g_icon_serialize;

/** */
alias g_icon_to_string = c_g_icon_to_string;

// InetAddress

/** */
alias g_inet_address_get_type = c_g_inet_address_get_type;

/** */
alias g_inet_address_new_any = c_g_inet_address_new_any;

/** */
alias g_inet_address_new_from_bytes = c_g_inet_address_new_from_bytes;

/** */
alias g_inet_address_new_from_bytes_with_ipv6_info = c_g_inet_address_new_from_bytes_with_ipv6_info;

/** */
alias g_inet_address_new_from_string = c_g_inet_address_new_from_string;

/** */
alias g_inet_address_new_loopback = c_g_inet_address_new_loopback;

/** */
alias g_inet_address_equal = c_g_inet_address_equal;

/** */
alias g_inet_address_get_family = c_g_inet_address_get_family;

/** */
alias g_inet_address_get_flowinfo = c_g_inet_address_get_flowinfo;

/** */
alias g_inet_address_get_is_any = c_g_inet_address_get_is_any;

/** */
alias g_inet_address_get_is_link_local = c_g_inet_address_get_is_link_local;

/** */
alias g_inet_address_get_is_loopback = c_g_inet_address_get_is_loopback;

/** */
alias g_inet_address_get_is_mc_global = c_g_inet_address_get_is_mc_global;

/** */
alias g_inet_address_get_is_mc_link_local = c_g_inet_address_get_is_mc_link_local;

/** */
alias g_inet_address_get_is_mc_node_local = c_g_inet_address_get_is_mc_node_local;

/** */
alias g_inet_address_get_is_mc_org_local = c_g_inet_address_get_is_mc_org_local;

/** */
alias g_inet_address_get_is_mc_site_local = c_g_inet_address_get_is_mc_site_local;

/** */
alias g_inet_address_get_is_multicast = c_g_inet_address_get_is_multicast;

/** */
alias g_inet_address_get_is_site_local = c_g_inet_address_get_is_site_local;

/** */
alias g_inet_address_get_native_size = c_g_inet_address_get_native_size;

/** */
alias g_inet_address_get_scope_id = c_g_inet_address_get_scope_id;

/** */
alias g_inet_address_to_bytes = c_g_inet_address_to_bytes;

/** */
alias g_inet_address_to_string = c_g_inet_address_to_string;

// InetAddressMask

/** */
alias g_inet_address_mask_get_type = c_g_inet_address_mask_get_type;

/** */
alias g_inet_address_mask_new = c_g_inet_address_mask_new;

/** */
alias g_inet_address_mask_new_from_string = c_g_inet_address_mask_new_from_string;

/** */
alias g_inet_address_mask_equal = c_g_inet_address_mask_equal;

/** */
alias g_inet_address_mask_get_address = c_g_inet_address_mask_get_address;

/** */
alias g_inet_address_mask_get_family = c_g_inet_address_mask_get_family;

/** */
alias g_inet_address_mask_get_length = c_g_inet_address_mask_get_length;

/** */
alias g_inet_address_mask_matches = c_g_inet_address_mask_matches;

/** */
alias g_inet_address_mask_to_string = c_g_inet_address_mask_to_string;

// InetSocketAddress

/** */
alias g_inet_socket_address_get_type = c_g_inet_socket_address_get_type;

/** */
alias g_inet_socket_address_new = c_g_inet_socket_address_new;

/** */
alias g_inet_socket_address_new_from_string = c_g_inet_socket_address_new_from_string;

/** */
alias g_inet_socket_address_get_address = c_g_inet_socket_address_get_address;

/** */
alias g_inet_socket_address_get_flowinfo = c_g_inet_socket_address_get_flowinfo;

/** */
alias g_inet_socket_address_get_port = c_g_inet_socket_address_get_port;

/** */
alias g_inet_socket_address_get_scope_id = c_g_inet_socket_address_get_scope_id;

// Initable

/** */
alias g_initable_get_type = c_g_initable_get_type;

/** */
alias g_initable_new = c_g_initable_new;

/** */
alias g_initable_new_valist = c_g_initable_new_valist;

/** */
alias g_initable_newv = c_g_initable_newv;

/** */
alias g_initable_init = c_g_initable_init;

// InputStream

/** */
alias g_input_stream_get_type = c_g_input_stream_get_type;

/** */
alias g_input_stream_clear_pending = c_g_input_stream_clear_pending;

/** */
alias g_input_stream_close = c_g_input_stream_close;

/** */
alias g_input_stream_close_async = c_g_input_stream_close_async;

/** */
alias g_input_stream_close_finish = c_g_input_stream_close_finish;

/** */
alias g_input_stream_has_pending = c_g_input_stream_has_pending;

/** */
alias g_input_stream_is_closed = c_g_input_stream_is_closed;

/** */
alias g_input_stream_read = c_g_input_stream_read;

/** */
alias g_input_stream_read_all = c_g_input_stream_read_all;

/** */
alias g_input_stream_read_all_async = c_g_input_stream_read_all_async;

/** */
alias g_input_stream_read_all_finish = c_g_input_stream_read_all_finish;

/** */
alias g_input_stream_read_async = c_g_input_stream_read_async;

/** */
alias g_input_stream_read_bytes = c_g_input_stream_read_bytes;

/** */
alias g_input_stream_read_bytes_async = c_g_input_stream_read_bytes_async;

/** */
alias g_input_stream_read_bytes_finish = c_g_input_stream_read_bytes_finish;

/** */
alias g_input_stream_read_finish = c_g_input_stream_read_finish;

/** */
alias g_input_stream_set_pending = c_g_input_stream_set_pending;

/** */
alias g_input_stream_skip = c_g_input_stream_skip;

/** */
alias g_input_stream_skip_async = c_g_input_stream_skip_async;

/** */
alias g_input_stream_skip_finish = c_g_input_stream_skip_finish;

// ListModel

/** */
alias g_list_model_get_type = c_g_list_model_get_type;

/** */
alias g_list_model_get_item = c_g_list_model_get_item;

/** */
alias g_list_model_get_item_type = c_g_list_model_get_item_type;

/** */
alias g_list_model_get_n_items = c_g_list_model_get_n_items;

/** */
alias g_list_model_get_object = c_g_list_model_get_object;

/** */
alias g_list_model_items_changed = c_g_list_model_items_changed;

// ListStore

/** */
alias g_list_store_get_type = c_g_list_store_get_type;

/** */
alias g_list_store_new = c_g_list_store_new;

/** */
alias g_list_store_append = c_g_list_store_append;

/** */
alias g_list_store_find = c_g_list_store_find;

/** */
alias g_list_store_find_with_equal_func = c_g_list_store_find_with_equal_func;

/** */
alias g_list_store_find_with_equal_func_full = c_g_list_store_find_with_equal_func_full;

/** */
alias g_list_store_insert = c_g_list_store_insert;

/** */
alias g_list_store_insert_sorted = c_g_list_store_insert_sorted;

/** */
alias g_list_store_remove = c_g_list_store_remove;

/** */
alias g_list_store_remove_all = c_g_list_store_remove_all;

/** */
alias g_list_store_sort = c_g_list_store_sort;

/** */
alias g_list_store_splice = c_g_list_store_splice;

// LoadableIcon

/** */
alias g_loadable_icon_get_type = c_g_loadable_icon_get_type;

/** */
alias g_loadable_icon_load = c_g_loadable_icon_load;

/** */
alias g_loadable_icon_load_async = c_g_loadable_icon_load_async;

/** */
alias g_loadable_icon_load_finish = c_g_loadable_icon_load_finish;

// MemoryInputStream

/** */
alias g_memory_input_stream_get_type = c_g_memory_input_stream_get_type;

/** */
alias g_memory_input_stream_new = c_g_memory_input_stream_new;

/** */
alias g_memory_input_stream_new_from_bytes = c_g_memory_input_stream_new_from_bytes;

/** */
alias g_memory_input_stream_new_from_data = c_g_memory_input_stream_new_from_data;

/** */
alias g_memory_input_stream_add_bytes = c_g_memory_input_stream_add_bytes;

/** */
alias g_memory_input_stream_add_data = c_g_memory_input_stream_add_data;

// MemoryMonitor

/** */
alias g_memory_monitor_get_type = c_g_memory_monitor_get_type;

/** */
alias g_memory_monitor_dup_default = c_g_memory_monitor_dup_default;

// MemoryOutputStream

/** */
alias g_memory_output_stream_get_type = c_g_memory_output_stream_get_type;

/** */
alias g_memory_output_stream_new = c_g_memory_output_stream_new;

/** */
alias g_memory_output_stream_new_resizable = c_g_memory_output_stream_new_resizable;

/** */
alias g_memory_output_stream_get_data = c_g_memory_output_stream_get_data;

/** */
alias g_memory_output_stream_get_data_size = c_g_memory_output_stream_get_data_size;

/** */
alias g_memory_output_stream_get_size = c_g_memory_output_stream_get_size;

/** */
alias g_memory_output_stream_steal_as_bytes = c_g_memory_output_stream_steal_as_bytes;

/** */
alias g_memory_output_stream_steal_data = c_g_memory_output_stream_steal_data;

// Menu

/** */
alias g_menu_get_type = c_g_menu_get_type;

/** */
alias g_menu_new = c_g_menu_new;

/** */
alias g_menu_append = c_g_menu_append;

/** */
alias g_menu_append_item = c_g_menu_append_item;

/** */
alias g_menu_append_section = c_g_menu_append_section;

/** */
alias g_menu_append_submenu = c_g_menu_append_submenu;

/** */
alias g_menu_freeze = c_g_menu_freeze;

/** */
alias g_menu_insert = c_g_menu_insert;

/** */
alias g_menu_insert_item = c_g_menu_insert_item;

/** */
alias g_menu_insert_section = c_g_menu_insert_section;

/** */
alias g_menu_insert_submenu = c_g_menu_insert_submenu;

/** */
alias g_menu_prepend = c_g_menu_prepend;

/** */
alias g_menu_prepend_item = c_g_menu_prepend_item;

/** */
alias g_menu_prepend_section = c_g_menu_prepend_section;

/** */
alias g_menu_prepend_submenu = c_g_menu_prepend_submenu;

/** */
alias g_menu_remove = c_g_menu_remove;

/** */
alias g_menu_remove_all = c_g_menu_remove_all;

// MenuAttributeIter

/** */
alias g_menu_attribute_iter_get_type = c_g_menu_attribute_iter_get_type;

/** */
alias g_menu_attribute_iter_get_name = c_g_menu_attribute_iter_get_name;

/** */
alias g_menu_attribute_iter_get_next = c_g_menu_attribute_iter_get_next;

/** */
alias g_menu_attribute_iter_get_value = c_g_menu_attribute_iter_get_value;

/** */
alias g_menu_attribute_iter_next = c_g_menu_attribute_iter_next;

// MenuItem

/** */
alias g_menu_item_get_type = c_g_menu_item_get_type;

/** */
alias g_menu_item_new = c_g_menu_item_new;

/** */
alias g_menu_item_new_from_model = c_g_menu_item_new_from_model;

/** */
alias g_menu_item_new_section = c_g_menu_item_new_section;

/** */
alias g_menu_item_new_submenu = c_g_menu_item_new_submenu;

/** */
alias g_menu_item_get_attribute = c_g_menu_item_get_attribute;

/** */
alias g_menu_item_get_attribute_value = c_g_menu_item_get_attribute_value;

/** */
alias g_menu_item_get_link = c_g_menu_item_get_link;

/** */
alias g_menu_item_set_action_and_target = c_g_menu_item_set_action_and_target;

/** */
alias g_menu_item_set_action_and_target_value = c_g_menu_item_set_action_and_target_value;

/** */
alias g_menu_item_set_attribute = c_g_menu_item_set_attribute;

/** */
alias g_menu_item_set_attribute_value = c_g_menu_item_set_attribute_value;

/** */
alias g_menu_item_set_detailed_action = c_g_menu_item_set_detailed_action;

/** */
alias g_menu_item_set_icon = c_g_menu_item_set_icon;

/** */
alias g_menu_item_set_label = c_g_menu_item_set_label;

/** */
alias g_menu_item_set_link = c_g_menu_item_set_link;

/** */
alias g_menu_item_set_section = c_g_menu_item_set_section;

/** */
alias g_menu_item_set_submenu = c_g_menu_item_set_submenu;

// MenuLinkIter

/** */
alias g_menu_link_iter_get_type = c_g_menu_link_iter_get_type;

/** */
alias g_menu_link_iter_get_name = c_g_menu_link_iter_get_name;

/** */
alias g_menu_link_iter_get_next = c_g_menu_link_iter_get_next;

/** */
alias g_menu_link_iter_get_value = c_g_menu_link_iter_get_value;

/** */
alias g_menu_link_iter_next = c_g_menu_link_iter_next;

// MenuModel

/** */
alias g_menu_model_get_type = c_g_menu_model_get_type;

/** */
alias g_menu_model_get_item_attribute = c_g_menu_model_get_item_attribute;

/** */
alias g_menu_model_get_item_attribute_value = c_g_menu_model_get_item_attribute_value;

/** */
alias g_menu_model_get_item_link = c_g_menu_model_get_item_link;

/** */
alias g_menu_model_get_n_items = c_g_menu_model_get_n_items;

/** */
alias g_menu_model_is_mutable = c_g_menu_model_is_mutable;

/** */
alias g_menu_model_items_changed = c_g_menu_model_items_changed;

/** */
alias g_menu_model_iterate_item_attributes = c_g_menu_model_iterate_item_attributes;

/** */
alias g_menu_model_iterate_item_links = c_g_menu_model_iterate_item_links;

// Mount

/** */
alias g_mount_get_type = c_g_mount_get_type;

/** */
alias g_mount_can_eject = c_g_mount_can_eject;

/** */
alias g_mount_can_unmount = c_g_mount_can_unmount;

/** */
alias g_mount_eject = c_g_mount_eject;

/** */
alias g_mount_eject_finish = c_g_mount_eject_finish;

/** */
alias g_mount_eject_with_operation = c_g_mount_eject_with_operation;

/** */
alias g_mount_eject_with_operation_finish = c_g_mount_eject_with_operation_finish;

/** */
alias g_mount_get_default_location = c_g_mount_get_default_location;

/** */
alias g_mount_get_drive = c_g_mount_get_drive;

/** */
alias g_mount_get_icon = c_g_mount_get_icon;

/** */
alias g_mount_get_name = c_g_mount_get_name;

/** */
alias g_mount_get_root = c_g_mount_get_root;

/** */
alias g_mount_get_sort_key = c_g_mount_get_sort_key;

/** */
alias g_mount_get_symbolic_icon = c_g_mount_get_symbolic_icon;

/** */
alias g_mount_get_uuid = c_g_mount_get_uuid;

/** */
alias g_mount_get_volume = c_g_mount_get_volume;

/** */
alias g_mount_guess_content_type = c_g_mount_guess_content_type;

/** */
alias g_mount_guess_content_type_finish = c_g_mount_guess_content_type_finish;

/** */
alias g_mount_guess_content_type_sync = c_g_mount_guess_content_type_sync;

/** */
alias g_mount_is_shadowed = c_g_mount_is_shadowed;

/** */
alias g_mount_remount = c_g_mount_remount;

/** */
alias g_mount_remount_finish = c_g_mount_remount_finish;

/** */
alias g_mount_shadow = c_g_mount_shadow;

/** */
alias g_mount_unmount = c_g_mount_unmount;

/** */
alias g_mount_unmount_finish = c_g_mount_unmount_finish;

/** */
alias g_mount_unmount_with_operation = c_g_mount_unmount_with_operation;

/** */
alias g_mount_unmount_with_operation_finish = c_g_mount_unmount_with_operation_finish;

/** */
alias g_mount_unshadow = c_g_mount_unshadow;

// MountOperation

/** */
alias g_mount_operation_get_type = c_g_mount_operation_get_type;

/** */
alias g_mount_operation_new = c_g_mount_operation_new;

/** */
alias g_mount_operation_get_anonymous = c_g_mount_operation_get_anonymous;

/** */
alias g_mount_operation_get_choice = c_g_mount_operation_get_choice;

/** */
alias g_mount_operation_get_domain = c_g_mount_operation_get_domain;

/** */
alias g_mount_operation_get_is_tcrypt_hidden_volume = c_g_mount_operation_get_is_tcrypt_hidden_volume;

/** */
alias g_mount_operation_get_is_tcrypt_system_volume = c_g_mount_operation_get_is_tcrypt_system_volume;

/** */
alias g_mount_operation_get_password = c_g_mount_operation_get_password;

/** */
alias g_mount_operation_get_password_save = c_g_mount_operation_get_password_save;

/** */
alias g_mount_operation_get_pim = c_g_mount_operation_get_pim;

/** */
alias g_mount_operation_get_username = c_g_mount_operation_get_username;

/** */
alias g_mount_operation_reply = c_g_mount_operation_reply;

/** */
alias g_mount_operation_set_anonymous = c_g_mount_operation_set_anonymous;

/** */
alias g_mount_operation_set_choice = c_g_mount_operation_set_choice;

/** */
alias g_mount_operation_set_domain = c_g_mount_operation_set_domain;

/** */
alias g_mount_operation_set_is_tcrypt_hidden_volume = c_g_mount_operation_set_is_tcrypt_hidden_volume;

/** */
alias g_mount_operation_set_is_tcrypt_system_volume = c_g_mount_operation_set_is_tcrypt_system_volume;

/** */
alias g_mount_operation_set_password = c_g_mount_operation_set_password;

/** */
alias g_mount_operation_set_password_save = c_g_mount_operation_set_password_save;

/** */
alias g_mount_operation_set_pim = c_g_mount_operation_set_pim;

/** */
alias g_mount_operation_set_username = c_g_mount_operation_set_username;

// NativeSocketAddress

/** */
alias g_native_socket_address_get_type = c_g_native_socket_address_get_type;

/** */
alias g_native_socket_address_new = c_g_native_socket_address_new;

// NativeVolumeMonitor

/** */
alias g_native_volume_monitor_get_type = c_g_native_volume_monitor_get_type;

// NetworkAddress

/** */
alias g_network_address_get_type = c_g_network_address_get_type;

/** */
alias g_network_address_new = c_g_network_address_new;

/** */
alias g_network_address_new_loopback = c_g_network_address_new_loopback;

/** */
alias g_network_address_parse = c_g_network_address_parse;

/** */
alias g_network_address_parse_uri = c_g_network_address_parse_uri;

/** */
alias g_network_address_get_hostname = c_g_network_address_get_hostname;

/** */
alias g_network_address_get_port = c_g_network_address_get_port;

/** */
alias g_network_address_get_scheme = c_g_network_address_get_scheme;

// NetworkMonitor

/** */
alias g_network_monitor_get_type = c_g_network_monitor_get_type;

/** */
alias g_network_monitor_get_default = c_g_network_monitor_get_default;

/** */
alias g_network_monitor_can_reach = c_g_network_monitor_can_reach;

/** */
alias g_network_monitor_can_reach_async = c_g_network_monitor_can_reach_async;

/** */
alias g_network_monitor_can_reach_finish = c_g_network_monitor_can_reach_finish;

/** */
alias g_network_monitor_get_connectivity = c_g_network_monitor_get_connectivity;

/** */
alias g_network_monitor_get_network_available = c_g_network_monitor_get_network_available;

/** */
alias g_network_monitor_get_network_metered = c_g_network_monitor_get_network_metered;

// NetworkService

/** */
alias g_network_service_get_type = c_g_network_service_get_type;

/** */
alias g_network_service_new = c_g_network_service_new;

/** */
alias g_network_service_get_domain = c_g_network_service_get_domain;

/** */
alias g_network_service_get_protocol = c_g_network_service_get_protocol;

/** */
alias g_network_service_get_scheme = c_g_network_service_get_scheme;

/** */
alias g_network_service_get_service = c_g_network_service_get_service;

/** */
alias g_network_service_set_scheme = c_g_network_service_set_scheme;

// Notification

/** */
alias g_notification_get_type = c_g_notification_get_type;

/** */
alias g_notification_new = c_g_notification_new;

/** */
alias g_notification_add_button = c_g_notification_add_button;

/** */
alias g_notification_add_button_with_target = c_g_notification_add_button_with_target;

/** */
alias g_notification_add_button_with_target_value = c_g_notification_add_button_with_target_value;

/** */
alias g_notification_set_body = c_g_notification_set_body;

/** */
alias g_notification_set_category = c_g_notification_set_category;

/** */
alias g_notification_set_default_action = c_g_notification_set_default_action;

/** */
alias g_notification_set_default_action_and_target = c_g_notification_set_default_action_and_target;

/** */
alias g_notification_set_default_action_and_target_value = c_g_notification_set_default_action_and_target_value;

/** */
alias g_notification_set_icon = c_g_notification_set_icon;

/** */
alias g_notification_set_priority = c_g_notification_set_priority;

/** */
alias g_notification_set_title = c_g_notification_set_title;

/** */
alias g_notification_set_urgent = c_g_notification_set_urgent;

// OutputStream

/** */
alias g_output_stream_get_type = c_g_output_stream_get_type;

/** */
alias g_output_stream_clear_pending = c_g_output_stream_clear_pending;

/** */
alias g_output_stream_close = c_g_output_stream_close;

/** */
alias g_output_stream_close_async = c_g_output_stream_close_async;

/** */
alias g_output_stream_close_finish = c_g_output_stream_close_finish;

/** */
alias g_output_stream_flush = c_g_output_stream_flush;

/** */
alias g_output_stream_flush_async = c_g_output_stream_flush_async;

/** */
alias g_output_stream_flush_finish = c_g_output_stream_flush_finish;

/** */
alias g_output_stream_has_pending = c_g_output_stream_has_pending;

/** */
alias g_output_stream_is_closed = c_g_output_stream_is_closed;

/** */
alias g_output_stream_is_closing = c_g_output_stream_is_closing;

/** */
alias g_output_stream_printf = c_g_output_stream_printf;

/** */
alias g_output_stream_set_pending = c_g_output_stream_set_pending;

/** */
alias g_output_stream_splice = c_g_output_stream_splice;

/** */
alias g_output_stream_splice_async = c_g_output_stream_splice_async;

/** */
alias g_output_stream_splice_finish = c_g_output_stream_splice_finish;

/** */
alias g_output_stream_vprintf = c_g_output_stream_vprintf;

/** */
alias g_output_stream_write = c_g_output_stream_write;

/** */
alias g_output_stream_write_all = c_g_output_stream_write_all;

/** */
alias g_output_stream_write_all_async = c_g_output_stream_write_all_async;

/** */
alias g_output_stream_write_all_finish = c_g_output_stream_write_all_finish;

/** */
alias g_output_stream_write_async = c_g_output_stream_write_async;

/** */
alias g_output_stream_write_bytes = c_g_output_stream_write_bytes;

/** */
alias g_output_stream_write_bytes_async = c_g_output_stream_write_bytes_async;

/** */
alias g_output_stream_write_bytes_finish = c_g_output_stream_write_bytes_finish;

/** */
alias g_output_stream_write_finish = c_g_output_stream_write_finish;

/** */
alias g_output_stream_writev = c_g_output_stream_writev;

/** */
alias g_output_stream_writev_all = c_g_output_stream_writev_all;

/** */
alias g_output_stream_writev_all_async = c_g_output_stream_writev_all_async;

/** */
alias g_output_stream_writev_all_finish = c_g_output_stream_writev_all_finish;

/** */
alias g_output_stream_writev_async = c_g_output_stream_writev_async;

/** */
alias g_output_stream_writev_finish = c_g_output_stream_writev_finish;

// Permission

/** */
alias g_permission_get_type = c_g_permission_get_type;

/** */
alias g_permission_acquire = c_g_permission_acquire;

/** */
alias g_permission_acquire_async = c_g_permission_acquire_async;

/** */
alias g_permission_acquire_finish = c_g_permission_acquire_finish;

/** */
alias g_permission_get_allowed = c_g_permission_get_allowed;

/** */
alias g_permission_get_can_acquire = c_g_permission_get_can_acquire;

/** */
alias g_permission_get_can_release = c_g_permission_get_can_release;

/** */
alias g_permission_impl_update = c_g_permission_impl_update;

/** */
alias g_permission_release = c_g_permission_release;

/** */
alias g_permission_release_async = c_g_permission_release_async;

/** */
alias g_permission_release_finish = c_g_permission_release_finish;

// PollableInputStream

/** */
alias g_pollable_input_stream_get_type = c_g_pollable_input_stream_get_type;

/** */
alias g_pollable_input_stream_can_poll = c_g_pollable_input_stream_can_poll;

/** */
alias g_pollable_input_stream_create_source = c_g_pollable_input_stream_create_source;

/** */
alias g_pollable_input_stream_is_readable = c_g_pollable_input_stream_is_readable;

/** */
alias g_pollable_input_stream_read_nonblocking = c_g_pollable_input_stream_read_nonblocking;

// PollableOutputStream

/** */
alias g_pollable_output_stream_get_type = c_g_pollable_output_stream_get_type;

/** */
alias g_pollable_output_stream_can_poll = c_g_pollable_output_stream_can_poll;

/** */
alias g_pollable_output_stream_create_source = c_g_pollable_output_stream_create_source;

/** */
alias g_pollable_output_stream_is_writable = c_g_pollable_output_stream_is_writable;

/** */
alias g_pollable_output_stream_write_nonblocking = c_g_pollable_output_stream_write_nonblocking;

/** */
alias g_pollable_output_stream_writev_nonblocking = c_g_pollable_output_stream_writev_nonblocking;

// PowerProfileMonitor

/** */
alias g_power_profile_monitor_get_type = c_g_power_profile_monitor_get_type;

/** */
alias g_power_profile_monitor_dup_default = c_g_power_profile_monitor_dup_default;

/** */
alias g_power_profile_monitor_get_power_saver_enabled = c_g_power_profile_monitor_get_power_saver_enabled;

// PropertyAction

/** */
alias g_property_action_get_type = c_g_property_action_get_type;

/** */
alias g_property_action_new = c_g_property_action_new;

// Proxy

/** */
alias g_proxy_get_type = c_g_proxy_get_type;

/** */
alias g_proxy_get_default_for_protocol = c_g_proxy_get_default_for_protocol;

/** */
alias g_proxy_connect = c_g_proxy_connect;

/** */
alias g_proxy_connect_async = c_g_proxy_connect_async;

/** */
alias g_proxy_connect_finish = c_g_proxy_connect_finish;

/** */
alias g_proxy_supports_hostname = c_g_proxy_supports_hostname;

// ProxyAddress

/** */
alias g_proxy_address_get_type = c_g_proxy_address_get_type;

/** */
alias g_proxy_address_new = c_g_proxy_address_new;

/** */
alias g_proxy_address_get_destination_hostname = c_g_proxy_address_get_destination_hostname;

/** */
alias g_proxy_address_get_destination_port = c_g_proxy_address_get_destination_port;

/** */
alias g_proxy_address_get_destination_protocol = c_g_proxy_address_get_destination_protocol;

/** */
alias g_proxy_address_get_password = c_g_proxy_address_get_password;

/** */
alias g_proxy_address_get_protocol = c_g_proxy_address_get_protocol;

/** */
alias g_proxy_address_get_uri = c_g_proxy_address_get_uri;

/** */
alias g_proxy_address_get_username = c_g_proxy_address_get_username;

// ProxyAddressEnumerator

/** */
alias g_proxy_address_enumerator_get_type = c_g_proxy_address_enumerator_get_type;

// ProxyResolver

/** */
alias g_proxy_resolver_get_type = c_g_proxy_resolver_get_type;

/** */
alias g_proxy_resolver_get_default = c_g_proxy_resolver_get_default;

/** */
alias g_proxy_resolver_is_supported = c_g_proxy_resolver_is_supported;

/** */
alias g_proxy_resolver_lookup = c_g_proxy_resolver_lookup;

/** */
alias g_proxy_resolver_lookup_async = c_g_proxy_resolver_lookup_async;

/** */
alias g_proxy_resolver_lookup_finish = c_g_proxy_resolver_lookup_finish;

// RemoteActionGroup

/** */
alias g_remote_action_group_get_type = c_g_remote_action_group_get_type;

/** */
alias g_remote_action_group_activate_action_full = c_g_remote_action_group_activate_action_full;

/** */
alias g_remote_action_group_change_action_state_full = c_g_remote_action_group_change_action_state_full;

// Resolver

/** */
alias g_resolver_get_type = c_g_resolver_get_type;

/** */
alias g_resolver_free_addresses = c_g_resolver_free_addresses;

/** */
alias g_resolver_free_targets = c_g_resolver_free_targets;

/** */
alias g_resolver_get_default = c_g_resolver_get_default;

/** */
alias g_resolver_get_timeout = c_g_resolver_get_timeout;

/** */
alias g_resolver_lookup_by_address = c_g_resolver_lookup_by_address;

/** */
alias g_resolver_lookup_by_address_async = c_g_resolver_lookup_by_address_async;

/** */
alias g_resolver_lookup_by_address_finish = c_g_resolver_lookup_by_address_finish;

/** */
alias g_resolver_lookup_by_name = c_g_resolver_lookup_by_name;

/** */
alias g_resolver_lookup_by_name_async = c_g_resolver_lookup_by_name_async;

/** */
alias g_resolver_lookup_by_name_finish = c_g_resolver_lookup_by_name_finish;

/** */
alias g_resolver_lookup_by_name_with_flags = c_g_resolver_lookup_by_name_with_flags;

/** */
alias g_resolver_lookup_by_name_with_flags_async = c_g_resolver_lookup_by_name_with_flags_async;

/** */
alias g_resolver_lookup_by_name_with_flags_finish = c_g_resolver_lookup_by_name_with_flags_finish;

/** */
alias g_resolver_lookup_records = c_g_resolver_lookup_records;

/** */
alias g_resolver_lookup_records_async = c_g_resolver_lookup_records_async;

/** */
alias g_resolver_lookup_records_finish = c_g_resolver_lookup_records_finish;

/** */
alias g_resolver_lookup_service = c_g_resolver_lookup_service;

/** */
alias g_resolver_lookup_service_async = c_g_resolver_lookup_service_async;

/** */
alias g_resolver_lookup_service_finish = c_g_resolver_lookup_service_finish;

/** */
alias g_resolver_set_default = c_g_resolver_set_default;

/** */
alias g_resolver_set_timeout = c_g_resolver_set_timeout;

// Resource

/** */
alias g_resource_get_type = c_g_resource_get_type;

/** */
alias g_resource_new_from_data = c_g_resource_new_from_data;

/** */
alias g_resource_enumerate_children = c_g_resource_enumerate_children;

/** */
alias g_resource_get_info = c_g_resource_get_info;

/** */
alias g_resource_has_children = c_g_resource_has_children;

/** */
alias g_resource_lookup_data = c_g_resource_lookup_data;

/** */
alias g_resource_open_stream = c_g_resource_open_stream;

/** */
alias g_resource_ref = c_g_resource_ref;

/** */
alias g_resource_unref = c_g_resource_unref;

/** */
alias g_resource_load = c_g_resource_load;

// Seekable

/** */
alias g_seekable_get_type = c_g_seekable_get_type;

/** */
alias g_seekable_can_seek = c_g_seekable_can_seek;

/** */
alias g_seekable_can_truncate = c_g_seekable_can_truncate;

/** */
alias g_seekable_seek = c_g_seekable_seek;

/** */
alias g_seekable_tell = c_g_seekable_tell;

/** */
alias g_seekable_truncate = c_g_seekable_truncate;

// Settings

/** */
alias g_settings_get_type = c_g_settings_get_type;

/** */
alias g_settings_new = c_g_settings_new;

/** */
alias g_settings_new_full = c_g_settings_new_full;

/** */
alias g_settings_new_with_backend = c_g_settings_new_with_backend;

/** */
alias g_settings_new_with_backend_and_path = c_g_settings_new_with_backend_and_path;

/** */
alias g_settings_new_with_path = c_g_settings_new_with_path;

/** */
alias g_settings_list_relocatable_schemas = c_g_settings_list_relocatable_schemas;

/** */
alias g_settings_list_schemas = c_g_settings_list_schemas;

/** */
alias g_settings_sync = c_g_settings_sync;

/** */
alias g_settings_unbind = c_g_settings_unbind;

/** */
alias g_settings_apply = c_g_settings_apply;

/** */
alias g_settings_bind = c_g_settings_bind;

/** */
alias g_settings_bind_with_mapping = c_g_settings_bind_with_mapping;

/** */
alias g_settings_bind_with_mapping_closures = c_g_settings_bind_with_mapping_closures;

/** */
alias g_settings_bind_writable = c_g_settings_bind_writable;

/** */
alias g_settings_create_action = c_g_settings_create_action;

/** */
alias g_settings_delay = c_g_settings_delay;

/** */
alias g_settings_get = c_g_settings_get;

/** */
alias g_settings_get_boolean = c_g_settings_get_boolean;

/** */
alias g_settings_get_child = c_g_settings_get_child;

/** */
alias g_settings_get_default_value = c_g_settings_get_default_value;

/** */
alias g_settings_get_double = c_g_settings_get_double;

/** */
alias g_settings_get_enum = c_g_settings_get_enum;

/** */
alias g_settings_get_flags = c_g_settings_get_flags;

/** */
alias g_settings_get_has_unapplied = c_g_settings_get_has_unapplied;

/** */
alias g_settings_get_int = c_g_settings_get_int;

/** */
alias g_settings_get_int64 = c_g_settings_get_int64;

/** */
alias g_settings_get_mapped = c_g_settings_get_mapped;

/** */
alias g_settings_get_range = c_g_settings_get_range;

/** */
alias g_settings_get_string = c_g_settings_get_string;

/** */
alias g_settings_get_strv = c_g_settings_get_strv;

/** */
alias g_settings_get_uint = c_g_settings_get_uint;

/** */
alias g_settings_get_uint64 = c_g_settings_get_uint64;

/** */
alias g_settings_get_user_value = c_g_settings_get_user_value;

/** */
alias g_settings_get_value = c_g_settings_get_value;

/** */
alias g_settings_is_writable = c_g_settings_is_writable;

/** */
alias g_settings_list_children = c_g_settings_list_children;

/** */
alias g_settings_list_keys = c_g_settings_list_keys;

/** */
alias g_settings_range_check = c_g_settings_range_check;

/** */
alias g_settings_reset = c_g_settings_reset;

/** */
alias g_settings_revert = c_g_settings_revert;

/** */
alias g_settings_set = c_g_settings_set;

/** */
alias g_settings_set_boolean = c_g_settings_set_boolean;

/** */
alias g_settings_set_double = c_g_settings_set_double;

/** */
alias g_settings_set_enum = c_g_settings_set_enum;

/** */
alias g_settings_set_flags = c_g_settings_set_flags;

/** */
alias g_settings_set_int = c_g_settings_set_int;

/** */
alias g_settings_set_int64 = c_g_settings_set_int64;

/** */
alias g_settings_set_string = c_g_settings_set_string;

/** */
alias g_settings_set_strv = c_g_settings_set_strv;

/** */
alias g_settings_set_uint = c_g_settings_set_uint;

/** */
alias g_settings_set_uint64 = c_g_settings_set_uint64;

/** */
alias g_settings_set_value = c_g_settings_set_value;

// SettingsBackend

/** */
alias g_settings_backend_get_type = c_g_settings_backend_get_type;

/** */
alias g_settings_backend_flatten_tree = c_g_settings_backend_flatten_tree;

/** */
alias g_settings_backend_get_default = c_g_settings_backend_get_default;

/** */
alias g_settings_backend_changed = c_g_settings_backend_changed;

/** */
alias g_settings_backend_changed_tree = c_g_settings_backend_changed_tree;

/** */
alias g_settings_backend_keys_changed = c_g_settings_backend_keys_changed;

/** */
alias g_settings_backend_path_changed = c_g_settings_backend_path_changed;

/** */
alias g_settings_backend_path_writable_changed = c_g_settings_backend_path_writable_changed;

/** */
alias g_settings_backend_writable_changed = c_g_settings_backend_writable_changed;

// SettingsSchema

/** */
alias g_settings_schema_get_type = c_g_settings_schema_get_type;

/** */
alias g_settings_schema_get_id = c_g_settings_schema_get_id;

/** */
alias g_settings_schema_get_key = c_g_settings_schema_get_key;

/** */
alias g_settings_schema_get_path = c_g_settings_schema_get_path;

/** */
alias g_settings_schema_has_key = c_g_settings_schema_has_key;

/** */
alias g_settings_schema_list_children = c_g_settings_schema_list_children;

/** */
alias g_settings_schema_list_keys = c_g_settings_schema_list_keys;

/** */
alias g_settings_schema_ref = c_g_settings_schema_ref;

/** */
alias g_settings_schema_unref = c_g_settings_schema_unref;

// SettingsSchemaKey

/** */
alias g_settings_schema_key_get_type = c_g_settings_schema_key_get_type;

/** */
alias g_settings_schema_key_get_default_value = c_g_settings_schema_key_get_default_value;

/** */
alias g_settings_schema_key_get_description = c_g_settings_schema_key_get_description;

/** */
alias g_settings_schema_key_get_name = c_g_settings_schema_key_get_name;

/** */
alias g_settings_schema_key_get_range = c_g_settings_schema_key_get_range;

/** */
alias g_settings_schema_key_get_summary = c_g_settings_schema_key_get_summary;

/** */
alias g_settings_schema_key_get_value_type = c_g_settings_schema_key_get_value_type;

/** */
alias g_settings_schema_key_range_check = c_g_settings_schema_key_range_check;

/** */
alias g_settings_schema_key_ref = c_g_settings_schema_key_ref;

/** */
alias g_settings_schema_key_unref = c_g_settings_schema_key_unref;

// SettingsSchemaSource

/** */
alias g_settings_schema_source_get_type = c_g_settings_schema_source_get_type;

/** */
alias g_settings_schema_source_new_from_directory = c_g_settings_schema_source_new_from_directory;

/** */
alias g_settings_schema_source_list_schemas = c_g_settings_schema_source_list_schemas;

/** */
alias g_settings_schema_source_lookup = c_g_settings_schema_source_lookup;

/** */
alias g_settings_schema_source_ref = c_g_settings_schema_source_ref;

/** */
alias g_settings_schema_source_unref = c_g_settings_schema_source_unref;

/** */
alias g_settings_schema_source_get_default = c_g_settings_schema_source_get_default;

// SimpleAction

/** */
alias g_simple_action_get_type = c_g_simple_action_get_type;

/** */
alias g_simple_action_new = c_g_simple_action_new;

/** */
alias g_simple_action_new_stateful = c_g_simple_action_new_stateful;

/** */
alias g_simple_action_set_enabled = c_g_simple_action_set_enabled;

/** */
alias g_simple_action_set_state = c_g_simple_action_set_state;

/** */
alias g_simple_action_set_state_hint = c_g_simple_action_set_state_hint;

// SimpleActionGroup

/** */
alias g_simple_action_group_get_type = c_g_simple_action_group_get_type;

/** */
alias g_simple_action_group_new = c_g_simple_action_group_new;

/** */
alias g_simple_action_group_add_entries = c_g_simple_action_group_add_entries;

/** */
alias g_simple_action_group_insert = c_g_simple_action_group_insert;

/** */
alias g_simple_action_group_lookup = c_g_simple_action_group_lookup;

/** */
alias g_simple_action_group_remove = c_g_simple_action_group_remove;

// SimpleAsyncResult

/** */
alias g_simple_async_result_get_type = c_g_simple_async_result_get_type;

/** */
alias g_simple_async_result_new = c_g_simple_async_result_new;

/** */
alias g_simple_async_result_new_error = c_g_simple_async_result_new_error;

/** */
alias g_simple_async_result_new_from_error = c_g_simple_async_result_new_from_error;

/** */
alias g_simple_async_result_new_take_error = c_g_simple_async_result_new_take_error;

/** */
alias g_simple_async_result_is_valid = c_g_simple_async_result_is_valid;

/** */
alias g_simple_async_result_complete = c_g_simple_async_result_complete;

/** */
alias g_simple_async_result_complete_in_idle = c_g_simple_async_result_complete_in_idle;

/** */
alias g_simple_async_result_get_op_res_gboolean = c_g_simple_async_result_get_op_res_gboolean;

/** */
alias g_simple_async_result_get_op_res_gpointer = c_g_simple_async_result_get_op_res_gpointer;

/** */
alias g_simple_async_result_get_op_res_gssize = c_g_simple_async_result_get_op_res_gssize;

/** */
alias g_simple_async_result_get_source_tag = c_g_simple_async_result_get_source_tag;

/** */
alias g_simple_async_result_propagate_error = c_g_simple_async_result_propagate_error;

/** */
alias g_simple_async_result_run_in_thread = c_g_simple_async_result_run_in_thread;

/** */
alias g_simple_async_result_set_check_cancellable = c_g_simple_async_result_set_check_cancellable;

/** */
alias g_simple_async_result_set_error = c_g_simple_async_result_set_error;

/** */
alias g_simple_async_result_set_error_va = c_g_simple_async_result_set_error_va;

/** */
alias g_simple_async_result_set_from_error = c_g_simple_async_result_set_from_error;

/** */
alias g_simple_async_result_set_handle_cancellation = c_g_simple_async_result_set_handle_cancellation;

/** */
alias g_simple_async_result_set_op_res_gboolean = c_g_simple_async_result_set_op_res_gboolean;

/** */
alias g_simple_async_result_set_op_res_gpointer = c_g_simple_async_result_set_op_res_gpointer;

/** */
alias g_simple_async_result_set_op_res_gssize = c_g_simple_async_result_set_op_res_gssize;

/** */
alias g_simple_async_result_take_error = c_g_simple_async_result_take_error;

// SimpleIOStream

/** */
alias g_simple_io_stream_get_type = c_g_simple_io_stream_get_type;

/** */
alias g_simple_io_stream_new = c_g_simple_io_stream_new;

// SimplePermission

/** */
alias g_simple_permission_get_type = c_g_simple_permission_get_type;

/** */
alias g_simple_permission_new = c_g_simple_permission_new;

// SimpleProxyResolver

/** */
alias g_simple_proxy_resolver_get_type = c_g_simple_proxy_resolver_get_type;

/** */
alias g_simple_proxy_resolver_new = c_g_simple_proxy_resolver_new;

/** */
alias g_simple_proxy_resolver_set_default_proxy = c_g_simple_proxy_resolver_set_default_proxy;

/** */
alias g_simple_proxy_resolver_set_ignore_hosts = c_g_simple_proxy_resolver_set_ignore_hosts;

/** */
alias g_simple_proxy_resolver_set_uri_proxy = c_g_simple_proxy_resolver_set_uri_proxy;

// Socket

/** */
alias g_socket_get_type = c_g_socket_get_type;

/** */
alias g_socket_new = c_g_socket_new;

/** */
alias g_socket_new_from_fd = c_g_socket_new_from_fd;

/** */
alias g_socket_accept = c_g_socket_accept;

/** */
alias g_socket_bind = c_g_socket_bind;

/** */
alias g_socket_check_connect_result = c_g_socket_check_connect_result;

/** */
alias g_socket_close = c_g_socket_close;

/** */
alias g_socket_condition_check = c_g_socket_condition_check;

/** */
alias g_socket_condition_timed_wait = c_g_socket_condition_timed_wait;

/** */
alias g_socket_condition_wait = c_g_socket_condition_wait;

/** */
alias g_socket_connect = c_g_socket_connect;

/** */
alias g_socket_connection_factory_create_connection = c_g_socket_connection_factory_create_connection;

/** */
alias g_socket_create_source = c_g_socket_create_source;

/** */
alias g_socket_get_available_bytes = c_g_socket_get_available_bytes;

/** */
alias g_socket_get_blocking = c_g_socket_get_blocking;

/** */
alias g_socket_get_broadcast = c_g_socket_get_broadcast;

/** */
alias g_socket_get_credentials = c_g_socket_get_credentials;

/** */
alias g_socket_get_family = c_g_socket_get_family;

/** */
alias g_socket_get_fd = c_g_socket_get_fd;

/** */
alias g_socket_get_keepalive = c_g_socket_get_keepalive;

/** */
alias g_socket_get_listen_backlog = c_g_socket_get_listen_backlog;

/** */
alias g_socket_get_local_address = c_g_socket_get_local_address;

/** */
alias g_socket_get_multicast_loopback = c_g_socket_get_multicast_loopback;

/** */
alias g_socket_get_multicast_ttl = c_g_socket_get_multicast_ttl;

/** */
alias g_socket_get_option = c_g_socket_get_option;

/** */
alias g_socket_get_protocol = c_g_socket_get_protocol;

/** */
alias g_socket_get_remote_address = c_g_socket_get_remote_address;

/** */
alias g_socket_get_socket_type = c_g_socket_get_socket_type;

/** */
alias g_socket_get_timeout = c_g_socket_get_timeout;

/** */
alias g_socket_get_ttl = c_g_socket_get_ttl;

/** */
alias g_socket_is_closed = c_g_socket_is_closed;

/** */
alias g_socket_is_connected = c_g_socket_is_connected;

/** */
alias g_socket_join_multicast_group = c_g_socket_join_multicast_group;

/** */
alias g_socket_join_multicast_group_ssm = c_g_socket_join_multicast_group_ssm;

/** */
alias g_socket_leave_multicast_group = c_g_socket_leave_multicast_group;

/** */
alias g_socket_leave_multicast_group_ssm = c_g_socket_leave_multicast_group_ssm;

/** */
alias g_socket_listen = c_g_socket_listen;

/** */
alias g_socket_receive = c_g_socket_receive;

/** */
alias g_socket_receive_bytes = c_g_socket_receive_bytes;

/** */
alias g_socket_receive_bytes_from = c_g_socket_receive_bytes_from;

/** */
alias g_socket_receive_from = c_g_socket_receive_from;

/** */
alias g_socket_receive_message = c_g_socket_receive_message;

/** */
alias g_socket_receive_messages = c_g_socket_receive_messages;

/** */
alias g_socket_receive_with_blocking = c_g_socket_receive_with_blocking;

/** */
alias g_socket_send = c_g_socket_send;

/** */
alias g_socket_send_message = c_g_socket_send_message;

/** */
alias g_socket_send_message_with_timeout = c_g_socket_send_message_with_timeout;

/** */
alias g_socket_send_messages = c_g_socket_send_messages;

/** */
alias g_socket_send_to = c_g_socket_send_to;

/** */
alias g_socket_send_with_blocking = c_g_socket_send_with_blocking;

/** */
alias g_socket_set_blocking = c_g_socket_set_blocking;

/** */
alias g_socket_set_broadcast = c_g_socket_set_broadcast;

/** */
alias g_socket_set_keepalive = c_g_socket_set_keepalive;

/** */
alias g_socket_set_listen_backlog = c_g_socket_set_listen_backlog;

/** */
alias g_socket_set_multicast_loopback = c_g_socket_set_multicast_loopback;

/** */
alias g_socket_set_multicast_ttl = c_g_socket_set_multicast_ttl;

/** */
alias g_socket_set_option = c_g_socket_set_option;

/** */
alias g_socket_set_timeout = c_g_socket_set_timeout;

/** */
alias g_socket_set_ttl = c_g_socket_set_ttl;

/** */
alias g_socket_shutdown = c_g_socket_shutdown;

/** */
alias g_socket_speaks_ipv4 = c_g_socket_speaks_ipv4;

// SocketAddress

/** */
alias g_socket_address_get_type = c_g_socket_address_get_type;

/** */
alias g_socket_address_new_from_native = c_g_socket_address_new_from_native;

/** */
alias g_socket_address_get_family = c_g_socket_address_get_family;

/** */
alias g_socket_address_get_native_size = c_g_socket_address_get_native_size;

/** */
alias g_socket_address_to_native = c_g_socket_address_to_native;

// SocketAddressEnumerator

/** */
alias g_socket_address_enumerator_get_type = c_g_socket_address_enumerator_get_type;

/** */
alias g_socket_address_enumerator_next = c_g_socket_address_enumerator_next;

/** */
alias g_socket_address_enumerator_next_async = c_g_socket_address_enumerator_next_async;

/** */
alias g_socket_address_enumerator_next_finish = c_g_socket_address_enumerator_next_finish;

// SocketClient

/** */
alias g_socket_client_get_type = c_g_socket_client_get_type;

/** */
alias g_socket_client_new = c_g_socket_client_new;

/** */
alias g_socket_client_add_application_proxy = c_g_socket_client_add_application_proxy;

/** */
alias g_socket_client_connect = c_g_socket_client_connect;

/** */
alias g_socket_client_connect_async = c_g_socket_client_connect_async;

/** */
alias g_socket_client_connect_finish = c_g_socket_client_connect_finish;

/** */
alias g_socket_client_connect_to_host = c_g_socket_client_connect_to_host;

/** */
alias g_socket_client_connect_to_host_async = c_g_socket_client_connect_to_host_async;

/** */
alias g_socket_client_connect_to_host_finish = c_g_socket_client_connect_to_host_finish;

/** */
alias g_socket_client_connect_to_service = c_g_socket_client_connect_to_service;

/** */
alias g_socket_client_connect_to_service_async = c_g_socket_client_connect_to_service_async;

/** */
alias g_socket_client_connect_to_service_finish = c_g_socket_client_connect_to_service_finish;

/** */
alias g_socket_client_connect_to_uri = c_g_socket_client_connect_to_uri;

/** */
alias g_socket_client_connect_to_uri_async = c_g_socket_client_connect_to_uri_async;

/** */
alias g_socket_client_connect_to_uri_finish = c_g_socket_client_connect_to_uri_finish;

/** */
alias g_socket_client_get_enable_proxy = c_g_socket_client_get_enable_proxy;

/** */
alias g_socket_client_get_family = c_g_socket_client_get_family;

/** */
alias g_socket_client_get_local_address = c_g_socket_client_get_local_address;

/** */
alias g_socket_client_get_protocol = c_g_socket_client_get_protocol;

/** */
alias g_socket_client_get_proxy_resolver = c_g_socket_client_get_proxy_resolver;

/** */
alias g_socket_client_get_socket_type = c_g_socket_client_get_socket_type;

/** */
alias g_socket_client_get_timeout = c_g_socket_client_get_timeout;

/** */
alias g_socket_client_get_tls = c_g_socket_client_get_tls;

/** */
alias g_socket_client_get_tls_validation_flags = c_g_socket_client_get_tls_validation_flags;

/** */
alias g_socket_client_set_enable_proxy = c_g_socket_client_set_enable_proxy;

/** */
alias g_socket_client_set_family = c_g_socket_client_set_family;

/** */
alias g_socket_client_set_local_address = c_g_socket_client_set_local_address;

/** */
alias g_socket_client_set_protocol = c_g_socket_client_set_protocol;

/** */
alias g_socket_client_set_proxy_resolver = c_g_socket_client_set_proxy_resolver;

/** */
alias g_socket_client_set_socket_type = c_g_socket_client_set_socket_type;

/** */
alias g_socket_client_set_timeout = c_g_socket_client_set_timeout;

/** */
alias g_socket_client_set_tls = c_g_socket_client_set_tls;

/** */
alias g_socket_client_set_tls_validation_flags = c_g_socket_client_set_tls_validation_flags;

// SocketConnectable

/** */
alias g_socket_connectable_get_type = c_g_socket_connectable_get_type;

/** */
alias g_socket_connectable_enumerate = c_g_socket_connectable_enumerate;

/** */
alias g_socket_connectable_proxy_enumerate = c_g_socket_connectable_proxy_enumerate;

/** */
alias g_socket_connectable_to_string = c_g_socket_connectable_to_string;

// SocketConnection

/** */
alias g_socket_connection_get_type = c_g_socket_connection_get_type;

/** */
alias g_socket_connection_factory_lookup_type = c_g_socket_connection_factory_lookup_type;

/** */
alias g_socket_connection_factory_register_type = c_g_socket_connection_factory_register_type;

/** */
alias g_socket_connection_connect = c_g_socket_connection_connect;

/** */
alias g_socket_connection_connect_async = c_g_socket_connection_connect_async;

/** */
alias g_socket_connection_connect_finish = c_g_socket_connection_connect_finish;

/** */
alias g_socket_connection_get_local_address = c_g_socket_connection_get_local_address;

/** */
alias g_socket_connection_get_remote_address = c_g_socket_connection_get_remote_address;

/** */
alias g_socket_connection_get_socket = c_g_socket_connection_get_socket;

/** */
alias g_socket_connection_is_connected = c_g_socket_connection_is_connected;

// SocketControlMessage

/** */
alias g_socket_control_message_get_type = c_g_socket_control_message_get_type;

/** */
alias g_socket_control_message_deserialize = c_g_socket_control_message_deserialize;

/** */
alias g_socket_control_message_get_level = c_g_socket_control_message_get_level;

/** */
alias g_socket_control_message_get_msg_type = c_g_socket_control_message_get_msg_type;

/** */
alias g_socket_control_message_get_size = c_g_socket_control_message_get_size;

/** */
alias g_socket_control_message_serialize = c_g_socket_control_message_serialize;

// SocketListener

/** */
alias g_socket_listener_get_type = c_g_socket_listener_get_type;

/** */
alias g_socket_listener_new = c_g_socket_listener_new;

/** */
alias g_socket_listener_accept = c_g_socket_listener_accept;

/** */
alias g_socket_listener_accept_async = c_g_socket_listener_accept_async;

/** */
alias g_socket_listener_accept_finish = c_g_socket_listener_accept_finish;

/** */
alias g_socket_listener_accept_socket = c_g_socket_listener_accept_socket;

/** */
alias g_socket_listener_accept_socket_async = c_g_socket_listener_accept_socket_async;

/** */
alias g_socket_listener_accept_socket_finish = c_g_socket_listener_accept_socket_finish;

/** */
alias g_socket_listener_add_address = c_g_socket_listener_add_address;

/** */
alias g_socket_listener_add_any_inet_port = c_g_socket_listener_add_any_inet_port;

/** */
alias g_socket_listener_add_inet_port = c_g_socket_listener_add_inet_port;

/** */
alias g_socket_listener_add_socket = c_g_socket_listener_add_socket;

/** */
alias g_socket_listener_close = c_g_socket_listener_close;

/** */
alias g_socket_listener_set_backlog = c_g_socket_listener_set_backlog;

// SocketService

/** */
alias g_socket_service_get_type = c_g_socket_service_get_type;

/** */
alias g_socket_service_new = c_g_socket_service_new;

/** */
alias g_socket_service_is_active = c_g_socket_service_is_active;

/** */
alias g_socket_service_start = c_g_socket_service_start;

/** */
alias g_socket_service_stop = c_g_socket_service_stop;

// SrvTarget

/** */
alias g_srv_target_get_type = c_g_srv_target_get_type;

/** */
alias g_srv_target_new = c_g_srv_target_new;

/** */
alias g_srv_target_copy = c_g_srv_target_copy;

/** */
alias g_srv_target_free = c_g_srv_target_free;

/** */
alias g_srv_target_get_hostname = c_g_srv_target_get_hostname;

/** */
alias g_srv_target_get_port = c_g_srv_target_get_port;

/** */
alias g_srv_target_get_priority = c_g_srv_target_get_priority;

/** */
alias g_srv_target_get_weight = c_g_srv_target_get_weight;

/** */
alias g_srv_target_list_sort = c_g_srv_target_list_sort;

// StaticResource

/** */
alias g_static_resource_fini = c_g_static_resource_fini;

/** */
alias g_static_resource_get_resource = c_g_static_resource_get_resource;

/** */
alias g_static_resource_init = c_g_static_resource_init;

// Subprocess

/** */
alias g_subprocess_get_type = c_g_subprocess_get_type;

/** */
alias g_subprocess_new = c_g_subprocess_new;

/** */
alias g_subprocess_newv = c_g_subprocess_newv;

/** */
alias g_subprocess_communicate = c_g_subprocess_communicate;

/** */
alias g_subprocess_communicate_async = c_g_subprocess_communicate_async;

/** */
alias g_subprocess_communicate_finish = c_g_subprocess_communicate_finish;

/** */
alias g_subprocess_communicate_utf8 = c_g_subprocess_communicate_utf8;

/** */
alias g_subprocess_communicate_utf8_async = c_g_subprocess_communicate_utf8_async;

/** */
alias g_subprocess_communicate_utf8_finish = c_g_subprocess_communicate_utf8_finish;

/** */
alias g_subprocess_force_exit = c_g_subprocess_force_exit;

/** */
alias g_subprocess_get_exit_status = c_g_subprocess_get_exit_status;

/** */
alias g_subprocess_get_identifier = c_g_subprocess_get_identifier;

/** */
alias g_subprocess_get_if_exited = c_g_subprocess_get_if_exited;

/** */
alias g_subprocess_get_if_signaled = c_g_subprocess_get_if_signaled;

/** */
alias g_subprocess_get_status = c_g_subprocess_get_status;

/** */
alias g_subprocess_get_stderr_pipe = c_g_subprocess_get_stderr_pipe;

/** */
alias g_subprocess_get_stdin_pipe = c_g_subprocess_get_stdin_pipe;

/** */
alias g_subprocess_get_stdout_pipe = c_g_subprocess_get_stdout_pipe;

/** */
alias g_subprocess_get_successful = c_g_subprocess_get_successful;

/** */
alias g_subprocess_get_term_sig = c_g_subprocess_get_term_sig;

/** */
alias g_subprocess_send_signal = c_g_subprocess_send_signal;

/** */
alias g_subprocess_wait = c_g_subprocess_wait;

/** */
alias g_subprocess_wait_async = c_g_subprocess_wait_async;

/** */
alias g_subprocess_wait_check = c_g_subprocess_wait_check;

/** */
alias g_subprocess_wait_check_async = c_g_subprocess_wait_check_async;

/** */
alias g_subprocess_wait_check_finish = c_g_subprocess_wait_check_finish;

/** */
alias g_subprocess_wait_finish = c_g_subprocess_wait_finish;

// SubprocessLauncher

/** */
alias g_subprocess_launcher_get_type = c_g_subprocess_launcher_get_type;

/** */
alias g_subprocess_launcher_new = c_g_subprocess_launcher_new;

/** */
alias g_subprocess_launcher_close = c_g_subprocess_launcher_close;

/** */
alias g_subprocess_launcher_getenv = c_g_subprocess_launcher_getenv;

/** */
alias g_subprocess_launcher_set_child_setup = c_g_subprocess_launcher_set_child_setup;

/** */
alias g_subprocess_launcher_set_cwd = c_g_subprocess_launcher_set_cwd;

/** */
alias g_subprocess_launcher_set_environ = c_g_subprocess_launcher_set_environ;

/** */
alias g_subprocess_launcher_set_flags = c_g_subprocess_launcher_set_flags;

/** */
alias g_subprocess_launcher_set_stderr_file_path = c_g_subprocess_launcher_set_stderr_file_path;

/** */
alias g_subprocess_launcher_set_stdin_file_path = c_g_subprocess_launcher_set_stdin_file_path;

/** */
alias g_subprocess_launcher_set_stdout_file_path = c_g_subprocess_launcher_set_stdout_file_path;

/** */
alias g_subprocess_launcher_setenv = c_g_subprocess_launcher_setenv;

/** */
alias g_subprocess_launcher_spawn = c_g_subprocess_launcher_spawn;

/** */
alias g_subprocess_launcher_spawnv = c_g_subprocess_launcher_spawnv;

/** */
alias g_subprocess_launcher_take_fd = c_g_subprocess_launcher_take_fd;

/** */
alias g_subprocess_launcher_take_stderr_fd = c_g_subprocess_launcher_take_stderr_fd;

/** */
alias g_subprocess_launcher_take_stdin_fd = c_g_subprocess_launcher_take_stdin_fd;

/** */
alias g_subprocess_launcher_take_stdout_fd = c_g_subprocess_launcher_take_stdout_fd;

/** */
alias g_subprocess_launcher_unsetenv = c_g_subprocess_launcher_unsetenv;

// Task

/** */
alias g_task_get_type = c_g_task_get_type;

/** */
alias g_task_new = c_g_task_new;

/** */
alias g_task_is_valid = c_g_task_is_valid;

/** */
alias g_task_report_error = c_g_task_report_error;

/** */
alias g_task_report_new_error = c_g_task_report_new_error;

/** */
alias g_task_attach_source = c_g_task_attach_source;

/** */
alias g_task_get_cancellable = c_g_task_get_cancellable;

/** */
alias g_task_get_check_cancellable = c_g_task_get_check_cancellable;

/** */
alias g_task_get_completed = c_g_task_get_completed;

/** */
alias g_task_get_context = c_g_task_get_context;

/** */
alias g_task_get_name = c_g_task_get_name;

/** */
alias g_task_get_priority = c_g_task_get_priority;

/** */
alias g_task_get_return_on_cancel = c_g_task_get_return_on_cancel;

/** */
alias g_task_get_source_object = c_g_task_get_source_object;

/** */
alias g_task_get_source_tag = c_g_task_get_source_tag;

/** */
alias g_task_get_task_data = c_g_task_get_task_data;

/** */
alias g_task_had_error = c_g_task_had_error;

/** */
alias g_task_propagate_boolean = c_g_task_propagate_boolean;

/** */
alias g_task_propagate_int = c_g_task_propagate_int;

/** */
alias g_task_propagate_pointer = c_g_task_propagate_pointer;

/** */
alias g_task_propagate_value = c_g_task_propagate_value;

/** */
alias g_task_return_boolean = c_g_task_return_boolean;

/** */
alias g_task_return_error = c_g_task_return_error;

/** */
alias g_task_return_error_if_cancelled = c_g_task_return_error_if_cancelled;

/** */
alias g_task_return_int = c_g_task_return_int;

/** */
alias g_task_return_new_error = c_g_task_return_new_error;

/** */
alias g_task_return_new_error_literal = c_g_task_return_new_error_literal;

/** */
alias g_task_return_pointer = c_g_task_return_pointer;

/** */
alias g_task_return_prefixed_error = c_g_task_return_prefixed_error;

/** */
alias g_task_return_value = c_g_task_return_value;

/** */
alias g_task_run_in_thread = c_g_task_run_in_thread;

/** */
alias g_task_run_in_thread_sync = c_g_task_run_in_thread_sync;

/** */
alias g_task_set_check_cancellable = c_g_task_set_check_cancellable;

/** */
alias g_task_set_name = c_g_task_set_name;

/** */
alias g_task_set_priority = c_g_task_set_priority;

/** */
alias g_task_set_return_on_cancel = c_g_task_set_return_on_cancel;

/** */
alias g_task_set_source_tag = c_g_task_set_source_tag;

/** */
alias g_task_set_static_name = c_g_task_set_static_name;

/** */
alias g_task_set_task_data = c_g_task_set_task_data;

// TcpConnection

/** */
alias g_tcp_connection_get_type = c_g_tcp_connection_get_type;

/** */
alias g_tcp_connection_get_graceful_disconnect = c_g_tcp_connection_get_graceful_disconnect;

/** */
alias g_tcp_connection_set_graceful_disconnect = c_g_tcp_connection_set_graceful_disconnect;

// TcpWrapperConnection

/** */
alias g_tcp_wrapper_connection_get_type = c_g_tcp_wrapper_connection_get_type;

/** */
alias g_tcp_wrapper_connection_new = c_g_tcp_wrapper_connection_new;

/** */
alias g_tcp_wrapper_connection_get_base_io_stream = c_g_tcp_wrapper_connection_get_base_io_stream;

// TestDBus

/** */
alias g_test_dbus_get_type = c_g_test_dbus_get_type;

/** */
alias g_test_dbus_new = c_g_test_dbus_new;

/** */
alias g_test_dbus_unset = c_g_test_dbus_unset;

/** */
alias g_test_dbus_add_service_dir = c_g_test_dbus_add_service_dir;

/** */
alias g_test_dbus_down = c_g_test_dbus_down;

/** */
alias g_test_dbus_get_bus_address = c_g_test_dbus_get_bus_address;

/** */
alias g_test_dbus_get_flags = c_g_test_dbus_get_flags;

/** */
alias g_test_dbus_stop = c_g_test_dbus_stop;

/** */
alias g_test_dbus_up = c_g_test_dbus_up;

// ThemedIcon

/** */
alias g_themed_icon_get_type = c_g_themed_icon_get_type;

/** */
alias g_themed_icon_new = c_g_themed_icon_new;

/** */
alias g_themed_icon_new_from_names = c_g_themed_icon_new_from_names;

/** */
alias g_themed_icon_new_with_default_fallbacks = c_g_themed_icon_new_with_default_fallbacks;

/** */
alias g_themed_icon_append_name = c_g_themed_icon_append_name;

/** */
alias g_themed_icon_get_names = c_g_themed_icon_get_names;

/** */
alias g_themed_icon_prepend_name = c_g_themed_icon_prepend_name;

// ThreadedResolver

/** */
alias g_threaded_resolver_get_type = c_g_threaded_resolver_get_type;

// ThreadedSocketService

/** */
alias g_threaded_socket_service_get_type = c_g_threaded_socket_service_get_type;

/** */
alias g_threaded_socket_service_new = c_g_threaded_socket_service_new;

// TlsBackend

/** */
alias g_tls_backend_get_type = c_g_tls_backend_get_type;

/** */
alias g_tls_backend_get_default = c_g_tls_backend_get_default;

/** */
alias g_tls_backend_get_certificate_type = c_g_tls_backend_get_certificate_type;

/** */
alias g_tls_backend_get_client_connection_type = c_g_tls_backend_get_client_connection_type;

/** */
alias g_tls_backend_get_default_database = c_g_tls_backend_get_default_database;

/** */
alias g_tls_backend_get_dtls_client_connection_type = c_g_tls_backend_get_dtls_client_connection_type;

/** */
alias g_tls_backend_get_dtls_server_connection_type = c_g_tls_backend_get_dtls_server_connection_type;

/** */
alias g_tls_backend_get_file_database_type = c_g_tls_backend_get_file_database_type;

/** */
alias g_tls_backend_get_server_connection_type = c_g_tls_backend_get_server_connection_type;

/** */
alias g_tls_backend_set_default_database = c_g_tls_backend_set_default_database;

/** */
alias g_tls_backend_supports_dtls = c_g_tls_backend_supports_dtls;

/** */
alias g_tls_backend_supports_tls = c_g_tls_backend_supports_tls;

// TlsCertificate

/** */
alias g_tls_certificate_get_type = c_g_tls_certificate_get_type;

/** */
alias g_tls_certificate_new_from_file = c_g_tls_certificate_new_from_file;

/** */
alias g_tls_certificate_new_from_file_with_password = c_g_tls_certificate_new_from_file_with_password;

/** */
alias g_tls_certificate_new_from_files = c_g_tls_certificate_new_from_files;

/** */
alias g_tls_certificate_new_from_pem = c_g_tls_certificate_new_from_pem;

/** */
alias g_tls_certificate_new_from_pkcs11_uris = c_g_tls_certificate_new_from_pkcs11_uris;

/** */
alias g_tls_certificate_new_from_pkcs12 = c_g_tls_certificate_new_from_pkcs12;

/** */
alias g_tls_certificate_list_new_from_file = c_g_tls_certificate_list_new_from_file;

/** */
alias g_tls_certificate_get_dns_names = c_g_tls_certificate_get_dns_names;

/** */
alias g_tls_certificate_get_ip_addresses = c_g_tls_certificate_get_ip_addresses;

/** */
alias g_tls_certificate_get_issuer = c_g_tls_certificate_get_issuer;

/** */
alias g_tls_certificate_get_issuer_name = c_g_tls_certificate_get_issuer_name;

/** */
alias g_tls_certificate_get_not_valid_after = c_g_tls_certificate_get_not_valid_after;

/** */
alias g_tls_certificate_get_not_valid_before = c_g_tls_certificate_get_not_valid_before;

/** */
alias g_tls_certificate_get_subject_name = c_g_tls_certificate_get_subject_name;

/** */
alias g_tls_certificate_is_same = c_g_tls_certificate_is_same;

/** */
alias g_tls_certificate_verify = c_g_tls_certificate_verify;

// TlsClientConnection

/** */
alias g_tls_client_connection_get_type = c_g_tls_client_connection_get_type;

/** */
alias g_tls_client_connection_new = c_g_tls_client_connection_new;

/** */
alias g_tls_client_connection_copy_session_state = c_g_tls_client_connection_copy_session_state;

/** */
alias g_tls_client_connection_get_accepted_cas = c_g_tls_client_connection_get_accepted_cas;

/** */
alias g_tls_client_connection_get_server_identity = c_g_tls_client_connection_get_server_identity;

/** */
alias g_tls_client_connection_get_use_ssl3 = c_g_tls_client_connection_get_use_ssl3;

/** */
alias g_tls_client_connection_get_validation_flags = c_g_tls_client_connection_get_validation_flags;

/** */
alias g_tls_client_connection_set_server_identity = c_g_tls_client_connection_set_server_identity;

/** */
alias g_tls_client_connection_set_use_ssl3 = c_g_tls_client_connection_set_use_ssl3;

/** */
alias g_tls_client_connection_set_validation_flags = c_g_tls_client_connection_set_validation_flags;

// TlsConnection

/** */
alias g_tls_connection_get_type = c_g_tls_connection_get_type;

/** */
alias g_tls_connection_emit_accept_certificate = c_g_tls_connection_emit_accept_certificate;

/** */
alias g_tls_connection_get_certificate = c_g_tls_connection_get_certificate;

/** */
alias g_tls_connection_get_channel_binding_data = c_g_tls_connection_get_channel_binding_data;

/** */
alias g_tls_connection_get_ciphersuite_name = c_g_tls_connection_get_ciphersuite_name;

/** */
alias g_tls_connection_get_database = c_g_tls_connection_get_database;

/** */
alias g_tls_connection_get_interaction = c_g_tls_connection_get_interaction;

/** */
alias g_tls_connection_get_negotiated_protocol = c_g_tls_connection_get_negotiated_protocol;

/** */
alias g_tls_connection_get_peer_certificate = c_g_tls_connection_get_peer_certificate;

/** */
alias g_tls_connection_get_peer_certificate_errors = c_g_tls_connection_get_peer_certificate_errors;

/** */
alias g_tls_connection_get_protocol_version = c_g_tls_connection_get_protocol_version;

/** */
alias g_tls_connection_get_rehandshake_mode = c_g_tls_connection_get_rehandshake_mode;

/** */
alias g_tls_connection_get_require_close_notify = c_g_tls_connection_get_require_close_notify;

/** */
alias g_tls_connection_get_use_system_certdb = c_g_tls_connection_get_use_system_certdb;

/** */
alias g_tls_connection_handshake = c_g_tls_connection_handshake;

/** */
alias g_tls_connection_handshake_async = c_g_tls_connection_handshake_async;

/** */
alias g_tls_connection_handshake_finish = c_g_tls_connection_handshake_finish;

/** */
alias g_tls_connection_set_advertised_protocols = c_g_tls_connection_set_advertised_protocols;

/** */
alias g_tls_connection_set_certificate = c_g_tls_connection_set_certificate;

/** */
alias g_tls_connection_set_database = c_g_tls_connection_set_database;

/** */
alias g_tls_connection_set_interaction = c_g_tls_connection_set_interaction;

/** */
alias g_tls_connection_set_rehandshake_mode = c_g_tls_connection_set_rehandshake_mode;

/** */
alias g_tls_connection_set_require_close_notify = c_g_tls_connection_set_require_close_notify;

/** */
alias g_tls_connection_set_use_system_certdb = c_g_tls_connection_set_use_system_certdb;

// TlsDatabase

/** */
alias g_tls_database_get_type = c_g_tls_database_get_type;

/** */
alias g_tls_database_create_certificate_handle = c_g_tls_database_create_certificate_handle;

/** */
alias g_tls_database_lookup_certificate_for_handle = c_g_tls_database_lookup_certificate_for_handle;

/** */
alias g_tls_database_lookup_certificate_for_handle_async = c_g_tls_database_lookup_certificate_for_handle_async;

/** */
alias g_tls_database_lookup_certificate_for_handle_finish = c_g_tls_database_lookup_certificate_for_handle_finish;

/** */
alias g_tls_database_lookup_certificate_issuer = c_g_tls_database_lookup_certificate_issuer;

/** */
alias g_tls_database_lookup_certificate_issuer_async = c_g_tls_database_lookup_certificate_issuer_async;

/** */
alias g_tls_database_lookup_certificate_issuer_finish = c_g_tls_database_lookup_certificate_issuer_finish;

/** */
alias g_tls_database_lookup_certificates_issued_by = c_g_tls_database_lookup_certificates_issued_by;

/** */
alias g_tls_database_lookup_certificates_issued_by_async = c_g_tls_database_lookup_certificates_issued_by_async;

/** */
alias g_tls_database_lookup_certificates_issued_by_finish = c_g_tls_database_lookup_certificates_issued_by_finish;

/** */
alias g_tls_database_verify_chain = c_g_tls_database_verify_chain;

/** */
alias g_tls_database_verify_chain_async = c_g_tls_database_verify_chain_async;

/** */
alias g_tls_database_verify_chain_finish = c_g_tls_database_verify_chain_finish;

// TlsFileDatabase

/** */
alias g_tls_file_database_get_type = c_g_tls_file_database_get_type;

/** */
alias g_tls_file_database_new = c_g_tls_file_database_new;

// TlsInteraction

/** */
alias g_tls_interaction_get_type = c_g_tls_interaction_get_type;

/** */
alias g_tls_interaction_ask_password = c_g_tls_interaction_ask_password;

/** */
alias g_tls_interaction_ask_password_async = c_g_tls_interaction_ask_password_async;

/** */
alias g_tls_interaction_ask_password_finish = c_g_tls_interaction_ask_password_finish;

/** */
alias g_tls_interaction_invoke_ask_password = c_g_tls_interaction_invoke_ask_password;

/** */
alias g_tls_interaction_invoke_request_certificate = c_g_tls_interaction_invoke_request_certificate;

/** */
alias g_tls_interaction_request_certificate = c_g_tls_interaction_request_certificate;

/** */
alias g_tls_interaction_request_certificate_async = c_g_tls_interaction_request_certificate_async;

/** */
alias g_tls_interaction_request_certificate_finish = c_g_tls_interaction_request_certificate_finish;

// TlsPassword

/** */
alias g_tls_password_get_type = c_g_tls_password_get_type;

/** */
alias g_tls_password_new = c_g_tls_password_new;

/** */
alias g_tls_password_get_description = c_g_tls_password_get_description;

/** */
alias g_tls_password_get_flags = c_g_tls_password_get_flags;

/** */
alias g_tls_password_get_value = c_g_tls_password_get_value;

/** */
alias g_tls_password_get_warning = c_g_tls_password_get_warning;

/** */
alias g_tls_password_set_description = c_g_tls_password_set_description;

/** */
alias g_tls_password_set_flags = c_g_tls_password_set_flags;

/** */
alias g_tls_password_set_value = c_g_tls_password_set_value;

/** */
alias g_tls_password_set_value_full = c_g_tls_password_set_value_full;

/** */
alias g_tls_password_set_warning = c_g_tls_password_set_warning;

// TlsServerConnection

/** */
alias g_tls_server_connection_get_type = c_g_tls_server_connection_get_type;

/** */
alias g_tls_server_connection_new = c_g_tls_server_connection_new;

// UnixConnection

/** */
alias g_unix_connection_get_type = c_g_unix_connection_get_type;

/** */
alias g_unix_connection_receive_credentials = c_g_unix_connection_receive_credentials;

/** */
alias g_unix_connection_receive_credentials_async = c_g_unix_connection_receive_credentials_async;

/** */
alias g_unix_connection_receive_credentials_finish = c_g_unix_connection_receive_credentials_finish;

/** */
alias g_unix_connection_receive_fd = c_g_unix_connection_receive_fd;

/** */
alias g_unix_connection_send_credentials = c_g_unix_connection_send_credentials;

/** */
alias g_unix_connection_send_credentials_async = c_g_unix_connection_send_credentials_async;

/** */
alias g_unix_connection_send_credentials_finish = c_g_unix_connection_send_credentials_finish;

/** */
alias g_unix_connection_send_fd = c_g_unix_connection_send_fd;

// UnixCredentialsMessage

/** */
alias g_unix_credentials_message_get_type = c_g_unix_credentials_message_get_type;

/** */
alias g_unix_credentials_message_new = c_g_unix_credentials_message_new;

/** */
alias g_unix_credentials_message_new_with_credentials = c_g_unix_credentials_message_new_with_credentials;

/** */
alias g_unix_credentials_message_is_supported = c_g_unix_credentials_message_is_supported;

/** */
alias g_unix_credentials_message_get_credentials = c_g_unix_credentials_message_get_credentials;

// UnixFDList

/** */
alias g_unix_fd_list_get_type = c_g_unix_fd_list_get_type;

/** */
alias g_unix_fd_list_new = c_g_unix_fd_list_new;

/** */
alias g_unix_fd_list_new_from_array = c_g_unix_fd_list_new_from_array;

/** */
alias g_unix_fd_list_append = c_g_unix_fd_list_append;

/** */
alias g_unix_fd_list_get = c_g_unix_fd_list_get;

/** */
alias g_unix_fd_list_get_length = c_g_unix_fd_list_get_length;

/** */
alias g_unix_fd_list_peek_fds = c_g_unix_fd_list_peek_fds;

/** */
alias g_unix_fd_list_steal_fds = c_g_unix_fd_list_steal_fds;

// UnixSocketAddress

/** */
alias g_unix_socket_address_get_type = c_g_unix_socket_address_get_type;

/** */
alias g_unix_socket_address_new = c_g_unix_socket_address_new;

/** */
alias g_unix_socket_address_new_abstract = c_g_unix_socket_address_new_abstract;

/** */
alias g_unix_socket_address_new_with_type = c_g_unix_socket_address_new_with_type;

/** */
alias g_unix_socket_address_abstract_names_supported = c_g_unix_socket_address_abstract_names_supported;

/** */
alias g_unix_socket_address_get_address_type = c_g_unix_socket_address_get_address_type;

/** */
alias g_unix_socket_address_get_is_abstract = c_g_unix_socket_address_get_is_abstract;

/** */
alias g_unix_socket_address_get_path = c_g_unix_socket_address_get_path;

/** */
alias g_unix_socket_address_get_path_len = c_g_unix_socket_address_get_path_len;

// Vfs

/** */
alias g_vfs_get_type = c_g_vfs_get_type;

/** */
alias g_vfs_get_default = c_g_vfs_get_default;

/** */
alias g_vfs_get_local = c_g_vfs_get_local;

/** */
alias g_vfs_get_file_for_path = c_g_vfs_get_file_for_path;

/** */
alias g_vfs_get_file_for_uri = c_g_vfs_get_file_for_uri;

/** */
alias g_vfs_get_supported_uri_schemes = c_g_vfs_get_supported_uri_schemes;

/** */
alias g_vfs_is_active = c_g_vfs_is_active;

/** */
alias g_vfs_parse_name = c_g_vfs_parse_name;

/** */
alias g_vfs_register_uri_scheme = c_g_vfs_register_uri_scheme;

/** */
alias g_vfs_unregister_uri_scheme = c_g_vfs_unregister_uri_scheme;

// Volume

/** */
alias g_volume_get_type = c_g_volume_get_type;

/** */
alias g_volume_can_eject = c_g_volume_can_eject;

/** */
alias g_volume_can_mount = c_g_volume_can_mount;

/** */
alias g_volume_eject = c_g_volume_eject;

/** */
alias g_volume_eject_finish = c_g_volume_eject_finish;

/** */
alias g_volume_eject_with_operation = c_g_volume_eject_with_operation;

/** */
alias g_volume_eject_with_operation_finish = c_g_volume_eject_with_operation_finish;

/** */
alias g_volume_enumerate_identifiers = c_g_volume_enumerate_identifiers;

/** */
alias g_volume_get_activation_root = c_g_volume_get_activation_root;

/** */
alias g_volume_get_drive = c_g_volume_get_drive;

/** */
alias g_volume_get_icon = c_g_volume_get_icon;

/** */
alias g_volume_get_identifier = c_g_volume_get_identifier;

/** */
alias g_volume_get_mount = c_g_volume_get_mount;

/** */
alias g_volume_get_name = c_g_volume_get_name;

/** */
alias g_volume_get_sort_key = c_g_volume_get_sort_key;

/** */
alias g_volume_get_symbolic_icon = c_g_volume_get_symbolic_icon;

/** */
alias g_volume_get_uuid = c_g_volume_get_uuid;

/** */
alias g_volume_mount = c_g_volume_mount;

/** */
alias g_volume_mount_finish = c_g_volume_mount_finish;

/** */
alias g_volume_should_automount = c_g_volume_should_automount;

// VolumeMonitor

/** */
alias g_volume_monitor_get_type = c_g_volume_monitor_get_type;

/** */
alias g_volume_monitor_adopt_orphan_mount = c_g_volume_monitor_adopt_orphan_mount;

/** */
alias g_volume_monitor_get = c_g_volume_monitor_get;

/** */
alias g_volume_monitor_get_connected_drives = c_g_volume_monitor_get_connected_drives;

/** */
alias g_volume_monitor_get_mount_for_uuid = c_g_volume_monitor_get_mount_for_uuid;

/** */
alias g_volume_monitor_get_mounts = c_g_volume_monitor_get_mounts;

/** */
alias g_volume_monitor_get_volume_for_uuid = c_g_volume_monitor_get_volume_for_uuid;

/** */
alias g_volume_monitor_get_volumes = c_g_volume_monitor_get_volumes;

// ZlibCompressor

/** */
alias g_zlib_compressor_get_type = c_g_zlib_compressor_get_type;

/** */
alias g_zlib_compressor_new = c_g_zlib_compressor_new;

/** */
alias g_zlib_compressor_get_file_info = c_g_zlib_compressor_get_file_info;

/** */
alias g_zlib_compressor_get_os = c_g_zlib_compressor_get_os;

/** */
alias g_zlib_compressor_set_file_info = c_g_zlib_compressor_set_file_info;

/** */
alias g_zlib_compressor_set_os = c_g_zlib_compressor_set_os;

// ZlibDecompressor

/** */
alias g_zlib_decompressor_get_type = c_g_zlib_decompressor_get_type;

/** */
alias g_zlib_decompressor_new = c_g_zlib_decompressor_new;

/** */
alias g_zlib_decompressor_get_file_info = c_g_zlib_decompressor_get_file_info;

// global

/** */
alias g_bus_get = c_g_bus_get;

/** */
alias g_bus_get_finish = c_g_bus_get_finish;

/** */
alias g_bus_get_sync = c_g_bus_get_sync;

/** */
alias g_bus_own_name = c_g_bus_own_name;

/** */
alias g_bus_own_name_on_connection = c_g_bus_own_name_on_connection;

/** */
alias g_bus_own_name_on_connection_with_closures = c_g_bus_own_name_on_connection_with_closures;

/** */
alias g_bus_own_name_with_closures = c_g_bus_own_name_with_closures;

/** */
alias g_bus_unown_name = c_g_bus_unown_name;

/** */
alias g_bus_unwatch_name = c_g_bus_unwatch_name;

/** */
alias g_bus_watch_name = c_g_bus_watch_name;

/** */
alias g_bus_watch_name_on_connection = c_g_bus_watch_name_on_connection;

/** */
alias g_bus_watch_name_on_connection_with_closures = c_g_bus_watch_name_on_connection_with_closures;

/** */
alias g_bus_watch_name_with_closures = c_g_bus_watch_name_with_closures;

/** */
alias g_content_type_can_be_executable = c_g_content_type_can_be_executable;

/** */
alias g_content_type_equals = c_g_content_type_equals;

/** */
alias g_content_type_from_mime_type = c_g_content_type_from_mime_type;

/** */
alias g_content_type_get_description = c_g_content_type_get_description;

/** */
alias g_content_type_get_generic_icon_name = c_g_content_type_get_generic_icon_name;

/** */
alias g_content_type_get_icon = c_g_content_type_get_icon;

/** */
alias g_content_type_get_mime_dirs = c_g_content_type_get_mime_dirs;

/** */
alias g_content_type_get_mime_type = c_g_content_type_get_mime_type;

/** */
alias g_content_type_get_symbolic_icon = c_g_content_type_get_symbolic_icon;

/** */
alias g_content_type_guess = c_g_content_type_guess;

/** */
alias g_content_type_guess_for_tree = c_g_content_type_guess_for_tree;

/** */
alias g_content_type_is_a = c_g_content_type_is_a;

/** */
alias g_content_type_is_mime_type = c_g_content_type_is_mime_type;

/** */
alias g_content_type_is_unknown = c_g_content_type_is_unknown;

/** */
alias g_content_type_set_mime_dirs = c_g_content_type_set_mime_dirs;

/** */
alias g_content_types_get_registered = c_g_content_types_get_registered;

/** */
alias g_dbus_address_escape_value = c_g_dbus_address_escape_value;

/** */
alias g_dbus_address_get_for_bus_sync = c_g_dbus_address_get_for_bus_sync;

/** */
alias g_dbus_address_get_stream = c_g_dbus_address_get_stream;

/** */
alias g_dbus_address_get_stream_finish = c_g_dbus_address_get_stream_finish;

/** */
alias g_dbus_address_get_stream_sync = c_g_dbus_address_get_stream_sync;

/** */
alias g_dbus_escape_object_path = c_g_dbus_escape_object_path;

/** */
alias g_dbus_escape_object_path_bytestring = c_g_dbus_escape_object_path_bytestring;

/** */
alias g_dbus_generate_guid = c_g_dbus_generate_guid;

/** */
alias g_dbus_gvalue_to_gvariant = c_g_dbus_gvalue_to_gvariant;

/** */
alias g_dbus_gvariant_to_gvalue = c_g_dbus_gvariant_to_gvalue;

/** */
alias g_dbus_is_address = c_g_dbus_is_address;

/** */
alias g_dbus_is_error_name = c_g_dbus_is_error_name;

/** */
alias g_dbus_is_guid = c_g_dbus_is_guid;

/** */
alias g_dbus_is_interface_name = c_g_dbus_is_interface_name;

/** */
alias g_dbus_is_member_name = c_g_dbus_is_member_name;

/** */
alias g_dbus_is_name = c_g_dbus_is_name;

/** */
alias g_dbus_is_supported_address = c_g_dbus_is_supported_address;

/** */
alias g_dbus_is_unique_name = c_g_dbus_is_unique_name;

/** */
alias g_dbus_unescape_object_path = c_g_dbus_unescape_object_path;

/** */
alias g_io_error_from_errno = c_g_io_error_from_errno;

/** */
alias g_io_error_from_file_error = c_g_io_error_from_file_error;

/** */
alias g_io_error_quark = c_g_io_error_quark;

/** */
alias g_io_modules_load_all_in_directory = c_g_io_modules_load_all_in_directory;

/** */
alias g_io_modules_load_all_in_directory_with_scope = c_g_io_modules_load_all_in_directory_with_scope;

/** */
alias g_io_modules_scan_all_in_directory = c_g_io_modules_scan_all_in_directory;

/** */
alias g_io_modules_scan_all_in_directory_with_scope = c_g_io_modules_scan_all_in_directory_with_scope;

/** */
alias g_io_scheduler_cancel_all_jobs = c_g_io_scheduler_cancel_all_jobs;

/** */
alias g_io_scheduler_push_job = c_g_io_scheduler_push_job;

/** */
alias g_keyfile_settings_backend_new = c_g_keyfile_settings_backend_new;

/** */
alias g_memory_settings_backend_new = c_g_memory_settings_backend_new;

/** */
alias g_networking_init = c_g_networking_init;

/** */
alias g_null_settings_backend_new = c_g_null_settings_backend_new;

/** */
alias g_pollable_source_new = c_g_pollable_source_new;

/** */
alias g_pollable_source_new_full = c_g_pollable_source_new_full;

/** */
alias g_pollable_stream_read = c_g_pollable_stream_read;

/** */
alias g_pollable_stream_write = c_g_pollable_stream_write;

/** */
alias g_pollable_stream_write_all = c_g_pollable_stream_write_all;

/** */
alias g_resources_enumerate_children = c_g_resources_enumerate_children;

/** */
alias g_resources_get_info = c_g_resources_get_info;

/** */
alias g_resources_has_children = c_g_resources_has_children;

/** */
alias g_resources_lookup_data = c_g_resources_lookup_data;

/** */
alias g_resources_open_stream = c_g_resources_open_stream;

/** */
alias g_resources_register = c_g_resources_register;

/** */
alias g_resources_unregister = c_g_resources_unregister;

/** */
alias g_simple_async_report_error_in_idle = c_g_simple_async_report_error_in_idle;

/** */
alias g_simple_async_report_gerror_in_idle = c_g_simple_async_report_gerror_in_idle;

/** */
alias g_simple_async_report_take_gerror_in_idle = c_g_simple_async_report_take_gerror_in_idle;

// DBusError

/** */
alias g_dbus_error_encode_gerror = c_g_dbus_error_encode_gerror;

/** */
alias g_dbus_error_get_remote_error = c_g_dbus_error_get_remote_error;

/** */
alias g_dbus_error_is_remote_error = c_g_dbus_error_is_remote_error;

/** */
alias g_dbus_error_new_for_dbus_error = c_g_dbus_error_new_for_dbus_error;

/** */
alias g_dbus_error_quark = c_g_dbus_error_quark;

/** */
alias g_dbus_error_register_error = c_g_dbus_error_register_error;

/** */
alias g_dbus_error_register_error_domain = c_g_dbus_error_register_error_domain;

/** */
alias g_dbus_error_set_dbus_error = c_g_dbus_error_set_dbus_error;

/** */
alias g_dbus_error_set_dbus_error_valist = c_g_dbus_error_set_dbus_error_valist;

/** */
alias g_dbus_error_strip_remote_error = c_g_dbus_error_strip_remote_error;

/** */
alias g_dbus_error_unregister_error = c_g_dbus_error_unregister_error;

// ResolverError

/** */
alias g_resolver_error_quark = c_g_resolver_error_quark;

// ResourceError

/** */
alias g_resource_error_quark = c_g_resource_error_quark;

// TlsChannelBindingError

/** */
alias g_tls_channel_binding_error_quark = c_g_tls_channel_binding_error_quark;

// TlsError

/** */
alias g_tls_error_quark = c_g_tls_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Action
  gidLink(cast(void**)&g_action_get_type, "g_action_get_type", libs);
  gidLink(cast(void**)&g_action_name_is_valid, "g_action_name_is_valid", libs);
  gidLink(cast(void**)&g_action_parse_detailed_name, "g_action_parse_detailed_name", libs);
  gidLink(cast(void**)&g_action_print_detailed_name, "g_action_print_detailed_name", libs);
  gidLink(cast(void**)&g_action_activate, "g_action_activate", libs);
  gidLink(cast(void**)&g_action_change_state, "g_action_change_state", libs);
  gidLink(cast(void**)&g_action_get_enabled, "g_action_get_enabled", libs);
  gidLink(cast(void**)&g_action_get_name, "g_action_get_name", libs);
  gidLink(cast(void**)&g_action_get_parameter_type, "g_action_get_parameter_type", libs);
  gidLink(cast(void**)&g_action_get_state, "g_action_get_state", libs);
  gidLink(cast(void**)&g_action_get_state_hint, "g_action_get_state_hint", libs);
  gidLink(cast(void**)&g_action_get_state_type, "g_action_get_state_type", libs);

  // ActionGroup
  gidLink(cast(void**)&g_action_group_get_type, "g_action_group_get_type", libs);
  gidLink(cast(void**)&g_action_group_action_added, "g_action_group_action_added", libs);
  gidLink(cast(void**)&g_action_group_action_enabled_changed, "g_action_group_action_enabled_changed", libs);
  gidLink(cast(void**)&g_action_group_action_removed, "g_action_group_action_removed", libs);
  gidLink(cast(void**)&g_action_group_action_state_changed, "g_action_group_action_state_changed", libs);
  gidLink(cast(void**)&g_action_group_activate_action, "g_action_group_activate_action", libs);
  gidLink(cast(void**)&g_action_group_change_action_state, "g_action_group_change_action_state", libs);
  gidLink(cast(void**)&g_action_group_get_action_enabled, "g_action_group_get_action_enabled", libs);
  gidLink(cast(void**)&g_action_group_get_action_parameter_type, "g_action_group_get_action_parameter_type", libs);
  gidLink(cast(void**)&g_action_group_get_action_state, "g_action_group_get_action_state", libs);
  gidLink(cast(void**)&g_action_group_get_action_state_hint, "g_action_group_get_action_state_hint", libs);
  gidLink(cast(void**)&g_action_group_get_action_state_type, "g_action_group_get_action_state_type", libs);
  gidLink(cast(void**)&g_action_group_has_action, "g_action_group_has_action", libs);
  gidLink(cast(void**)&g_action_group_list_actions, "g_action_group_list_actions", libs);
  gidLink(cast(void**)&g_action_group_query_action, "g_action_group_query_action", libs);

  // ActionMap
  gidLink(cast(void**)&g_action_map_get_type, "g_action_map_get_type", libs);
  gidLink(cast(void**)&g_action_map_add_action, "g_action_map_add_action", libs);
  gidLink(cast(void**)&g_action_map_add_action_entries, "g_action_map_add_action_entries", libs);
  gidLink(cast(void**)&g_action_map_lookup_action, "g_action_map_lookup_action", libs);
  gidLink(cast(void**)&g_action_map_remove_action, "g_action_map_remove_action", libs);
  gidLink(cast(void**)&g_action_map_remove_action_entries, "g_action_map_remove_action_entries", libs);

  // AppInfo
  gidLink(cast(void**)&g_app_info_get_type, "g_app_info_get_type", libs);
  gidLink(cast(void**)&g_app_info_create_from_commandline, "g_app_info_create_from_commandline", libs);
  gidLink(cast(void**)&g_app_info_get_all, "g_app_info_get_all", libs);
  gidLink(cast(void**)&g_app_info_get_all_for_type, "g_app_info_get_all_for_type", libs);
  gidLink(cast(void**)&g_app_info_get_default_for_type, "g_app_info_get_default_for_type", libs);
  gidLink(cast(void**)&g_app_info_get_default_for_type_async, "g_app_info_get_default_for_type_async", libs);
  gidLink(cast(void**)&g_app_info_get_default_for_type_finish, "g_app_info_get_default_for_type_finish", libs);
  gidLink(cast(void**)&g_app_info_get_default_for_uri_scheme, "g_app_info_get_default_for_uri_scheme", libs);
  gidLink(cast(void**)&g_app_info_get_default_for_uri_scheme_async, "g_app_info_get_default_for_uri_scheme_async", libs);
  gidLink(cast(void**)&g_app_info_get_default_for_uri_scheme_finish, "g_app_info_get_default_for_uri_scheme_finish", libs);
  gidLink(cast(void**)&g_app_info_get_fallback_for_type, "g_app_info_get_fallback_for_type", libs);
  gidLink(cast(void**)&g_app_info_get_recommended_for_type, "g_app_info_get_recommended_for_type", libs);
  gidLink(cast(void**)&g_app_info_launch_default_for_uri, "g_app_info_launch_default_for_uri", libs);
  gidLink(cast(void**)&g_app_info_launch_default_for_uri_async, "g_app_info_launch_default_for_uri_async", libs);
  gidLink(cast(void**)&g_app_info_launch_default_for_uri_finish, "g_app_info_launch_default_for_uri_finish", libs);
  gidLink(cast(void**)&g_app_info_reset_type_associations, "g_app_info_reset_type_associations", libs);
  gidLink(cast(void**)&g_app_info_add_supports_type, "g_app_info_add_supports_type", libs);
  gidLink(cast(void**)&g_app_info_can_delete, "g_app_info_can_delete", libs);
  gidLink(cast(void**)&g_app_info_can_remove_supports_type, "g_app_info_can_remove_supports_type", libs);
  gidLink(cast(void**)&g_app_info_delete, "g_app_info_delete", libs);
  gidLink(cast(void**)&g_app_info_dup, "g_app_info_dup", libs);
  gidLink(cast(void**)&g_app_info_equal, "g_app_info_equal", libs);
  gidLink(cast(void**)&g_app_info_get_commandline, "g_app_info_get_commandline", libs);
  gidLink(cast(void**)&g_app_info_get_description, "g_app_info_get_description", libs);
  gidLink(cast(void**)&g_app_info_get_display_name, "g_app_info_get_display_name", libs);
  gidLink(cast(void**)&g_app_info_get_executable, "g_app_info_get_executable", libs);
  gidLink(cast(void**)&g_app_info_get_icon, "g_app_info_get_icon", libs);
  gidLink(cast(void**)&g_app_info_get_id, "g_app_info_get_id", libs);
  gidLink(cast(void**)&g_app_info_get_name, "g_app_info_get_name", libs);
  gidLink(cast(void**)&g_app_info_get_supported_types, "g_app_info_get_supported_types", libs);
  gidLink(cast(void**)&g_app_info_launch, "g_app_info_launch", libs);
  gidLink(cast(void**)&g_app_info_launch_uris, "g_app_info_launch_uris", libs);
  gidLink(cast(void**)&g_app_info_launch_uris_async, "g_app_info_launch_uris_async", libs);
  gidLink(cast(void**)&g_app_info_launch_uris_finish, "g_app_info_launch_uris_finish", libs);
  gidLink(cast(void**)&g_app_info_remove_supports_type, "g_app_info_remove_supports_type", libs);
  gidLink(cast(void**)&g_app_info_set_as_default_for_extension, "g_app_info_set_as_default_for_extension", libs);
  gidLink(cast(void**)&g_app_info_set_as_default_for_type, "g_app_info_set_as_default_for_type", libs);
  gidLink(cast(void**)&g_app_info_set_as_last_used_for_type, "g_app_info_set_as_last_used_for_type", libs);
  gidLink(cast(void**)&g_app_info_should_show, "g_app_info_should_show", libs);
  gidLink(cast(void**)&g_app_info_supports_files, "g_app_info_supports_files", libs);
  gidLink(cast(void**)&g_app_info_supports_uris, "g_app_info_supports_uris", libs);

  // AppInfoMonitor
  gidLink(cast(void**)&g_app_info_monitor_get_type, "g_app_info_monitor_get_type", libs);
  gidLink(cast(void**)&g_app_info_monitor_get, "g_app_info_monitor_get", libs);

  // AppLaunchContext
  gidLink(cast(void**)&g_app_launch_context_get_type, "g_app_launch_context_get_type", libs);
  gidLink(cast(void**)&g_app_launch_context_new, "g_app_launch_context_new", libs);
  gidLink(cast(void**)&g_app_launch_context_get_display, "g_app_launch_context_get_display", libs);
  gidLink(cast(void**)&g_app_launch_context_get_environment, "g_app_launch_context_get_environment", libs);
  gidLink(cast(void**)&g_app_launch_context_get_startup_notify_id, "g_app_launch_context_get_startup_notify_id", libs);
  gidLink(cast(void**)&g_app_launch_context_launch_failed, "g_app_launch_context_launch_failed", libs);
  gidLink(cast(void**)&g_app_launch_context_setenv, "g_app_launch_context_setenv", libs);
  gidLink(cast(void**)&g_app_launch_context_unsetenv, "g_app_launch_context_unsetenv", libs);

  // Application
  gidLink(cast(void**)&g_application_get_type, "g_application_get_type", libs);
  gidLink(cast(void**)&g_application_new, "g_application_new", libs);
  gidLink(cast(void**)&g_application_get_default, "g_application_get_default", libs);
  gidLink(cast(void**)&g_application_id_is_valid, "g_application_id_is_valid", libs);
  gidLink(cast(void**)&g_application_activate, "g_application_activate", libs);
  gidLink(cast(void**)&g_application_add_main_option, "g_application_add_main_option", libs);
  gidLink(cast(void**)&g_application_add_main_option_entries, "g_application_add_main_option_entries", libs);
  gidLink(cast(void**)&g_application_add_option_group, "g_application_add_option_group", libs);
  gidLink(cast(void**)&g_application_bind_busy_property, "g_application_bind_busy_property", libs);
  gidLink(cast(void**)&g_application_get_application_id, "g_application_get_application_id", libs);
  gidLink(cast(void**)&g_application_get_dbus_connection, "g_application_get_dbus_connection", libs);
  gidLink(cast(void**)&g_application_get_dbus_object_path, "g_application_get_dbus_object_path", libs);
  gidLink(cast(void**)&g_application_get_flags, "g_application_get_flags", libs);
  gidLink(cast(void**)&g_application_get_inactivity_timeout, "g_application_get_inactivity_timeout", libs);
  gidLink(cast(void**)&g_application_get_is_busy, "g_application_get_is_busy", libs);
  gidLink(cast(void**)&g_application_get_is_registered, "g_application_get_is_registered", libs);
  gidLink(cast(void**)&g_application_get_is_remote, "g_application_get_is_remote", libs);
  gidLink(cast(void**)&g_application_get_resource_base_path, "g_application_get_resource_base_path", libs);
  gidLink(cast(void**)&g_application_get_version, "g_application_get_version", libs);
  gidLink(cast(void**)&g_application_hold, "g_application_hold", libs);
  gidLink(cast(void**)&g_application_mark_busy, "g_application_mark_busy", libs);
  gidLink(cast(void**)&g_application_open, "g_application_open", libs);
  gidLink(cast(void**)&g_application_quit, "g_application_quit", libs);
  gidLink(cast(void**)&g_application_register, "g_application_register", libs);
  gidLink(cast(void**)&g_application_release, "g_application_release", libs);
  gidLink(cast(void**)&g_application_run, "g_application_run", libs);
  gidLink(cast(void**)&g_application_send_notification, "g_application_send_notification", libs);
  gidLink(cast(void**)&g_application_set_action_group, "g_application_set_action_group", libs);
  gidLink(cast(void**)&g_application_set_application_id, "g_application_set_application_id", libs);
  gidLink(cast(void**)&g_application_set_default, "g_application_set_default", libs);
  gidLink(cast(void**)&g_application_set_flags, "g_application_set_flags", libs);
  gidLink(cast(void**)&g_application_set_inactivity_timeout, "g_application_set_inactivity_timeout", libs);
  gidLink(cast(void**)&g_application_set_option_context_description, "g_application_set_option_context_description", libs);
  gidLink(cast(void**)&g_application_set_option_context_parameter_string, "g_application_set_option_context_parameter_string", libs);
  gidLink(cast(void**)&g_application_set_option_context_summary, "g_application_set_option_context_summary", libs);
  gidLink(cast(void**)&g_application_set_resource_base_path, "g_application_set_resource_base_path", libs);
  gidLink(cast(void**)&g_application_set_version, "g_application_set_version", libs);
  gidLink(cast(void**)&g_application_unbind_busy_property, "g_application_unbind_busy_property", libs);
  gidLink(cast(void**)&g_application_unmark_busy, "g_application_unmark_busy", libs);
  gidLink(cast(void**)&g_application_withdraw_notification, "g_application_withdraw_notification", libs);

  // ApplicationCommandLine
  gidLink(cast(void**)&g_application_command_line_get_type, "g_application_command_line_get_type", libs);
  gidLink(cast(void**)&g_application_command_line_create_file_for_arg, "g_application_command_line_create_file_for_arg", libs);
  gidLink(cast(void**)&g_application_command_line_done, "g_application_command_line_done", libs);
  gidLink(cast(void**)&g_application_command_line_get_arguments, "g_application_command_line_get_arguments", libs);
  gidLink(cast(void**)&g_application_command_line_get_cwd, "g_application_command_line_get_cwd", libs);
  gidLink(cast(void**)&g_application_command_line_get_environ, "g_application_command_line_get_environ", libs);
  gidLink(cast(void**)&g_application_command_line_get_exit_status, "g_application_command_line_get_exit_status", libs);
  gidLink(cast(void**)&g_application_command_line_get_is_remote, "g_application_command_line_get_is_remote", libs);
  gidLink(cast(void**)&g_application_command_line_get_options_dict, "g_application_command_line_get_options_dict", libs);
  gidLink(cast(void**)&g_application_command_line_get_platform_data, "g_application_command_line_get_platform_data", libs);
  gidLink(cast(void**)&g_application_command_line_get_stdin, "g_application_command_line_get_stdin", libs);
  gidLink(cast(void**)&g_application_command_line_getenv, "g_application_command_line_getenv", libs);
  gidLink(cast(void**)&g_application_command_line_print, "g_application_command_line_print", libs);
  gidLink(cast(void**)&g_application_command_line_print_literal, "g_application_command_line_print_literal", libs);
  gidLink(cast(void**)&g_application_command_line_printerr, "g_application_command_line_printerr", libs);
  gidLink(cast(void**)&g_application_command_line_printerr_literal, "g_application_command_line_printerr_literal", libs);
  gidLink(cast(void**)&g_application_command_line_set_exit_status, "g_application_command_line_set_exit_status", libs);

  // AsyncInitable
  gidLink(cast(void**)&g_async_initable_get_type, "g_async_initable_get_type", libs);
  gidLink(cast(void**)&g_async_initable_new_async, "g_async_initable_new_async", libs);
  gidLink(cast(void**)&g_async_initable_new_valist_async, "g_async_initable_new_valist_async", libs);
  gidLink(cast(void**)&g_async_initable_newv_async, "g_async_initable_newv_async", libs);
  gidLink(cast(void**)&g_async_initable_init_async, "g_async_initable_init_async", libs);
  gidLink(cast(void**)&g_async_initable_init_finish, "g_async_initable_init_finish", libs);
  gidLink(cast(void**)&g_async_initable_new_finish, "g_async_initable_new_finish", libs);

  // AsyncResult
  gidLink(cast(void**)&g_async_result_get_type, "g_async_result_get_type", libs);
  gidLink(cast(void**)&g_async_result_get_source_object, "g_async_result_get_source_object", libs);
  gidLink(cast(void**)&g_async_result_get_user_data, "g_async_result_get_user_data", libs);
  gidLink(cast(void**)&g_async_result_is_tagged, "g_async_result_is_tagged", libs);
  gidLink(cast(void**)&g_async_result_legacy_propagate_error, "g_async_result_legacy_propagate_error", libs);

  // BufferedInputStream
  gidLink(cast(void**)&g_buffered_input_stream_get_type, "g_buffered_input_stream_get_type", libs);
  gidLink(cast(void**)&g_buffered_input_stream_new, "g_buffered_input_stream_new", libs);
  gidLink(cast(void**)&g_buffered_input_stream_new_sized, "g_buffered_input_stream_new_sized", libs);
  gidLink(cast(void**)&g_buffered_input_stream_fill, "g_buffered_input_stream_fill", libs);
  gidLink(cast(void**)&g_buffered_input_stream_fill_async, "g_buffered_input_stream_fill_async", libs);
  gidLink(cast(void**)&g_buffered_input_stream_fill_finish, "g_buffered_input_stream_fill_finish", libs);
  gidLink(cast(void**)&g_buffered_input_stream_get_available, "g_buffered_input_stream_get_available", libs);
  gidLink(cast(void**)&g_buffered_input_stream_get_buffer_size, "g_buffered_input_stream_get_buffer_size", libs);
  gidLink(cast(void**)&g_buffered_input_stream_peek, "g_buffered_input_stream_peek", libs);
  gidLink(cast(void**)&g_buffered_input_stream_peek_buffer, "g_buffered_input_stream_peek_buffer", libs);
  gidLink(cast(void**)&g_buffered_input_stream_read_byte, "g_buffered_input_stream_read_byte", libs);
  gidLink(cast(void**)&g_buffered_input_stream_set_buffer_size, "g_buffered_input_stream_set_buffer_size", libs);

  // BufferedOutputStream
  gidLink(cast(void**)&g_buffered_output_stream_get_type, "g_buffered_output_stream_get_type", libs);
  gidLink(cast(void**)&g_buffered_output_stream_new, "g_buffered_output_stream_new", libs);
  gidLink(cast(void**)&g_buffered_output_stream_new_sized, "g_buffered_output_stream_new_sized", libs);
  gidLink(cast(void**)&g_buffered_output_stream_get_auto_grow, "g_buffered_output_stream_get_auto_grow", libs);
  gidLink(cast(void**)&g_buffered_output_stream_get_buffer_size, "g_buffered_output_stream_get_buffer_size", libs);
  gidLink(cast(void**)&g_buffered_output_stream_set_auto_grow, "g_buffered_output_stream_set_auto_grow", libs);
  gidLink(cast(void**)&g_buffered_output_stream_set_buffer_size, "g_buffered_output_stream_set_buffer_size", libs);

  // BytesIcon
  gidLink(cast(void**)&g_bytes_icon_get_type, "g_bytes_icon_get_type", libs);
  gidLink(cast(void**)&g_bytes_icon_new, "g_bytes_icon_new", libs);
  gidLink(cast(void**)&g_bytes_icon_get_bytes, "g_bytes_icon_get_bytes", libs);

  // Cancellable
  gidLink(cast(void**)&g_cancellable_get_type, "g_cancellable_get_type", libs);
  gidLink(cast(void**)&g_cancellable_new, "g_cancellable_new", libs);
  gidLink(cast(void**)&g_cancellable_get_current, "g_cancellable_get_current", libs);
  gidLink(cast(void**)&g_cancellable_cancel, "g_cancellable_cancel", libs);
  gidLink(cast(void**)&g_cancellable_connect, "g_cancellable_connect", libs);
  gidLink(cast(void**)&g_cancellable_disconnect, "g_cancellable_disconnect", libs);
  gidLink(cast(void**)&g_cancellable_get_fd, "g_cancellable_get_fd", libs);
  gidLink(cast(void**)&g_cancellable_is_cancelled, "g_cancellable_is_cancelled", libs);
  gidLink(cast(void**)&g_cancellable_make_pollfd, "g_cancellable_make_pollfd", libs);
  gidLink(cast(void**)&g_cancellable_pop_current, "g_cancellable_pop_current", libs);
  gidLink(cast(void**)&g_cancellable_push_current, "g_cancellable_push_current", libs);
  gidLink(cast(void**)&g_cancellable_release_fd, "g_cancellable_release_fd", libs);
  gidLink(cast(void**)&g_cancellable_reset, "g_cancellable_reset", libs);
  gidLink(cast(void**)&g_cancellable_set_error_if_cancelled, "g_cancellable_set_error_if_cancelled", libs);
  gidLink(cast(void**)&g_cancellable_source_new, "g_cancellable_source_new", libs);

  // CharsetConverter
  gidLink(cast(void**)&g_charset_converter_get_type, "g_charset_converter_get_type", libs);
  gidLink(cast(void**)&g_charset_converter_new, "g_charset_converter_new", libs);
  gidLink(cast(void**)&g_charset_converter_get_num_fallbacks, "g_charset_converter_get_num_fallbacks", libs);
  gidLink(cast(void**)&g_charset_converter_get_use_fallback, "g_charset_converter_get_use_fallback", libs);
  gidLink(cast(void**)&g_charset_converter_set_use_fallback, "g_charset_converter_set_use_fallback", libs);

  // Converter
  gidLink(cast(void**)&g_converter_get_type, "g_converter_get_type", libs);
  gidLink(cast(void**)&g_converter_convert, "g_converter_convert", libs);
  gidLink(cast(void**)&g_converter_convert_bytes, "g_converter_convert_bytes", libs);
  gidLink(cast(void**)&g_converter_reset, "g_converter_reset", libs);

  // ConverterInputStream
  gidLink(cast(void**)&g_converter_input_stream_get_type, "g_converter_input_stream_get_type", libs);
  gidLink(cast(void**)&g_converter_input_stream_new, "g_converter_input_stream_new", libs);
  gidLink(cast(void**)&g_converter_input_stream_get_converter, "g_converter_input_stream_get_converter", libs);

  // ConverterOutputStream
  gidLink(cast(void**)&g_converter_output_stream_get_type, "g_converter_output_stream_get_type", libs);
  gidLink(cast(void**)&g_converter_output_stream_new, "g_converter_output_stream_new", libs);
  gidLink(cast(void**)&g_converter_output_stream_get_converter, "g_converter_output_stream_get_converter", libs);

  // Credentials
  gidLink(cast(void**)&g_credentials_get_type, "g_credentials_get_type", libs);
  gidLink(cast(void**)&g_credentials_new, "g_credentials_new", libs);
  gidLink(cast(void**)&g_credentials_get_native, "g_credentials_get_native", libs);
  gidLink(cast(void**)&g_credentials_get_unix_pid, "g_credentials_get_unix_pid", libs);
  gidLink(cast(void**)&g_credentials_get_unix_user, "g_credentials_get_unix_user", libs);
  gidLink(cast(void**)&g_credentials_is_same_user, "g_credentials_is_same_user", libs);
  gidLink(cast(void**)&g_credentials_set_native, "g_credentials_set_native", libs);
  gidLink(cast(void**)&g_credentials_set_unix_user, "g_credentials_set_unix_user", libs);
  gidLink(cast(void**)&g_credentials_to_string, "g_credentials_to_string", libs);

  // DBusActionGroup
  gidLink(cast(void**)&g_dbus_action_group_get_type, "g_dbus_action_group_get_type", libs);
  gidLink(cast(void**)&g_dbus_action_group_get, "g_dbus_action_group_get", libs);

  // DBusAnnotationInfo
  gidLink(cast(void**)&g_dbus_annotation_info_get_type, "g_dbus_annotation_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_annotation_info_ref, "g_dbus_annotation_info_ref", libs);
  gidLink(cast(void**)&g_dbus_annotation_info_unref, "g_dbus_annotation_info_unref", libs);
  gidLink(cast(void**)&g_dbus_annotation_info_lookup, "g_dbus_annotation_info_lookup", libs);

  // DBusArgInfo
  gidLink(cast(void**)&g_dbus_arg_info_get_type, "g_dbus_arg_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_arg_info_ref, "g_dbus_arg_info_ref", libs);
  gidLink(cast(void**)&g_dbus_arg_info_unref, "g_dbus_arg_info_unref", libs);

  // DBusAuthObserver
  gidLink(cast(void**)&g_dbus_auth_observer_get_type, "g_dbus_auth_observer_get_type", libs);
  gidLink(cast(void**)&g_dbus_auth_observer_new, "g_dbus_auth_observer_new", libs);
  gidLink(cast(void**)&g_dbus_auth_observer_allow_mechanism, "g_dbus_auth_observer_allow_mechanism", libs);
  gidLink(cast(void**)&g_dbus_auth_observer_authorize_authenticated_peer, "g_dbus_auth_observer_authorize_authenticated_peer", libs);

  // DBusConnection
  gidLink(cast(void**)&g_dbus_connection_get_type, "g_dbus_connection_get_type", libs);
  gidLink(cast(void**)&g_dbus_connection_new_finish, "g_dbus_connection_new_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_new_for_address_finish, "g_dbus_connection_new_for_address_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_new_for_address_sync, "g_dbus_connection_new_for_address_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_new_sync, "g_dbus_connection_new_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_new, "g_dbus_connection_new", libs);
  gidLink(cast(void**)&g_dbus_connection_new_for_address, "g_dbus_connection_new_for_address", libs);
  gidLink(cast(void**)&g_dbus_connection_add_filter, "g_dbus_connection_add_filter", libs);
  gidLink(cast(void**)&g_dbus_connection_call, "g_dbus_connection_call", libs);
  gidLink(cast(void**)&g_dbus_connection_call_finish, "g_dbus_connection_call_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_call_sync, "g_dbus_connection_call_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_call_with_unix_fd_list, "g_dbus_connection_call_with_unix_fd_list", libs);
  gidLink(cast(void**)&g_dbus_connection_call_with_unix_fd_list_finish, "g_dbus_connection_call_with_unix_fd_list_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_call_with_unix_fd_list_sync, "g_dbus_connection_call_with_unix_fd_list_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_close, "g_dbus_connection_close", libs);
  gidLink(cast(void**)&g_dbus_connection_close_finish, "g_dbus_connection_close_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_close_sync, "g_dbus_connection_close_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_emit_signal, "g_dbus_connection_emit_signal", libs);
  gidLink(cast(void**)&g_dbus_connection_export_action_group, "g_dbus_connection_export_action_group", libs);
  gidLink(cast(void**)&g_dbus_connection_export_menu_model, "g_dbus_connection_export_menu_model", libs);
  gidLink(cast(void**)&g_dbus_connection_flush, "g_dbus_connection_flush", libs);
  gidLink(cast(void**)&g_dbus_connection_flush_finish, "g_dbus_connection_flush_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_flush_sync, "g_dbus_connection_flush_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_get_capabilities, "g_dbus_connection_get_capabilities", libs);
  gidLink(cast(void**)&g_dbus_connection_get_exit_on_close, "g_dbus_connection_get_exit_on_close", libs);
  gidLink(cast(void**)&g_dbus_connection_get_flags, "g_dbus_connection_get_flags", libs);
  gidLink(cast(void**)&g_dbus_connection_get_guid, "g_dbus_connection_get_guid", libs);
  gidLink(cast(void**)&g_dbus_connection_get_last_serial, "g_dbus_connection_get_last_serial", libs);
  gidLink(cast(void**)&g_dbus_connection_get_peer_credentials, "g_dbus_connection_get_peer_credentials", libs);
  gidLink(cast(void**)&g_dbus_connection_get_stream, "g_dbus_connection_get_stream", libs);
  gidLink(cast(void**)&g_dbus_connection_get_unique_name, "g_dbus_connection_get_unique_name", libs);
  gidLink(cast(void**)&g_dbus_connection_is_closed, "g_dbus_connection_is_closed", libs);
  gidLink(cast(void**)&g_dbus_connection_register_object, "g_dbus_connection_register_object", libs);
  gidLink(cast(void**)&g_dbus_connection_register_object_with_closures, "g_dbus_connection_register_object_with_closures", libs);
  gidLink(cast(void**)&g_dbus_connection_register_object_with_closures2, "g_dbus_connection_register_object_with_closures2", libs);
  gidLink(cast(void**)&g_dbus_connection_register_subtree, "g_dbus_connection_register_subtree", libs);
  gidLink(cast(void**)&g_dbus_connection_remove_filter, "g_dbus_connection_remove_filter", libs);
  gidLink(cast(void**)&g_dbus_connection_send_message, "g_dbus_connection_send_message", libs);
  gidLink(cast(void**)&g_dbus_connection_send_message_with_reply, "g_dbus_connection_send_message_with_reply", libs);
  gidLink(cast(void**)&g_dbus_connection_send_message_with_reply_finish, "g_dbus_connection_send_message_with_reply_finish", libs);
  gidLink(cast(void**)&g_dbus_connection_send_message_with_reply_sync, "g_dbus_connection_send_message_with_reply_sync", libs);
  gidLink(cast(void**)&g_dbus_connection_set_exit_on_close, "g_dbus_connection_set_exit_on_close", libs);
  gidLink(cast(void**)&g_dbus_connection_signal_subscribe, "g_dbus_connection_signal_subscribe", libs);
  gidLink(cast(void**)&g_dbus_connection_signal_unsubscribe, "g_dbus_connection_signal_unsubscribe", libs);
  gidLink(cast(void**)&g_dbus_connection_start_message_processing, "g_dbus_connection_start_message_processing", libs);
  gidLink(cast(void**)&g_dbus_connection_unexport_action_group, "g_dbus_connection_unexport_action_group", libs);
  gidLink(cast(void**)&g_dbus_connection_unexport_menu_model, "g_dbus_connection_unexport_menu_model", libs);
  gidLink(cast(void**)&g_dbus_connection_unregister_object, "g_dbus_connection_unregister_object", libs);
  gidLink(cast(void**)&g_dbus_connection_unregister_subtree, "g_dbus_connection_unregister_subtree", libs);

  // DBusInterface
  gidLink(cast(void**)&g_dbus_interface_get_type, "g_dbus_interface_get_type", libs);
  gidLink(cast(void**)&g_dbus_interface_dup_object, "g_dbus_interface_dup_object", libs);
  gidLink(cast(void**)&g_dbus_interface_get_info, "g_dbus_interface_get_info", libs);
  gidLink(cast(void**)&g_dbus_interface_get_object, "g_dbus_interface_get_object", libs);
  gidLink(cast(void**)&g_dbus_interface_set_object, "g_dbus_interface_set_object", libs);

  // DBusInterfaceInfo
  gidLink(cast(void**)&g_dbus_interface_info_get_type, "g_dbus_interface_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_interface_info_cache_build, "g_dbus_interface_info_cache_build", libs);
  gidLink(cast(void**)&g_dbus_interface_info_cache_release, "g_dbus_interface_info_cache_release", libs);
  gidLink(cast(void**)&g_dbus_interface_info_generate_xml, "g_dbus_interface_info_generate_xml", libs);
  gidLink(cast(void**)&g_dbus_interface_info_lookup_method, "g_dbus_interface_info_lookup_method", libs);
  gidLink(cast(void**)&g_dbus_interface_info_lookup_property, "g_dbus_interface_info_lookup_property", libs);
  gidLink(cast(void**)&g_dbus_interface_info_lookup_signal, "g_dbus_interface_info_lookup_signal", libs);
  gidLink(cast(void**)&g_dbus_interface_info_ref, "g_dbus_interface_info_ref", libs);
  gidLink(cast(void**)&g_dbus_interface_info_unref, "g_dbus_interface_info_unref", libs);

  // DBusInterfaceSkeleton
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_type, "g_dbus_interface_skeleton_get_type", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_export, "g_dbus_interface_skeleton_export", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_flush, "g_dbus_interface_skeleton_flush", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_connection, "g_dbus_interface_skeleton_get_connection", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_connections, "g_dbus_interface_skeleton_get_connections", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_flags, "g_dbus_interface_skeleton_get_flags", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_info, "g_dbus_interface_skeleton_get_info", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_object_path, "g_dbus_interface_skeleton_get_object_path", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_properties, "g_dbus_interface_skeleton_get_properties", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_get_vtable, "g_dbus_interface_skeleton_get_vtable", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_has_connection, "g_dbus_interface_skeleton_has_connection", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_set_flags, "g_dbus_interface_skeleton_set_flags", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_unexport, "g_dbus_interface_skeleton_unexport", libs);
  gidLink(cast(void**)&g_dbus_interface_skeleton_unexport_from_connection, "g_dbus_interface_skeleton_unexport_from_connection", libs);

  // DBusMenuModel
  gidLink(cast(void**)&g_dbus_menu_model_get_type, "g_dbus_menu_model_get_type", libs);
  gidLink(cast(void**)&g_dbus_menu_model_get, "g_dbus_menu_model_get", libs);

  // DBusMessage
  gidLink(cast(void**)&g_dbus_message_get_type, "g_dbus_message_get_type", libs);
  gidLink(cast(void**)&g_dbus_message_new, "g_dbus_message_new", libs);
  gidLink(cast(void**)&g_dbus_message_new_from_blob, "g_dbus_message_new_from_blob", libs);
  gidLink(cast(void**)&g_dbus_message_new_method_call, "g_dbus_message_new_method_call", libs);
  gidLink(cast(void**)&g_dbus_message_new_signal, "g_dbus_message_new_signal", libs);
  gidLink(cast(void**)&g_dbus_message_bytes_needed, "g_dbus_message_bytes_needed", libs);
  gidLink(cast(void**)&g_dbus_message_copy, "g_dbus_message_copy", libs);
  gidLink(cast(void**)&g_dbus_message_get_arg0, "g_dbus_message_get_arg0", libs);
  gidLink(cast(void**)&g_dbus_message_get_arg0_path, "g_dbus_message_get_arg0_path", libs);
  gidLink(cast(void**)&g_dbus_message_get_body, "g_dbus_message_get_body", libs);
  gidLink(cast(void**)&g_dbus_message_get_byte_order, "g_dbus_message_get_byte_order", libs);
  gidLink(cast(void**)&g_dbus_message_get_destination, "g_dbus_message_get_destination", libs);
  gidLink(cast(void**)&g_dbus_message_get_error_name, "g_dbus_message_get_error_name", libs);
  gidLink(cast(void**)&g_dbus_message_get_flags, "g_dbus_message_get_flags", libs);
  gidLink(cast(void**)&g_dbus_message_get_header, "g_dbus_message_get_header", libs);
  gidLink(cast(void**)&g_dbus_message_get_header_fields, "g_dbus_message_get_header_fields", libs);
  gidLink(cast(void**)&g_dbus_message_get_interface, "g_dbus_message_get_interface", libs);
  gidLink(cast(void**)&g_dbus_message_get_locked, "g_dbus_message_get_locked", libs);
  gidLink(cast(void**)&g_dbus_message_get_member, "g_dbus_message_get_member", libs);
  gidLink(cast(void**)&g_dbus_message_get_message_type, "g_dbus_message_get_message_type", libs);
  gidLink(cast(void**)&g_dbus_message_get_num_unix_fds, "g_dbus_message_get_num_unix_fds", libs);
  gidLink(cast(void**)&g_dbus_message_get_path, "g_dbus_message_get_path", libs);
  gidLink(cast(void**)&g_dbus_message_get_reply_serial, "g_dbus_message_get_reply_serial", libs);
  gidLink(cast(void**)&g_dbus_message_get_sender, "g_dbus_message_get_sender", libs);
  gidLink(cast(void**)&g_dbus_message_get_serial, "g_dbus_message_get_serial", libs);
  gidLink(cast(void**)&g_dbus_message_get_signature, "g_dbus_message_get_signature", libs);
  gidLink(cast(void**)&g_dbus_message_get_unix_fd_list, "g_dbus_message_get_unix_fd_list", libs);
  gidLink(cast(void**)&g_dbus_message_lock, "g_dbus_message_lock", libs);
  gidLink(cast(void**)&g_dbus_message_new_method_error, "g_dbus_message_new_method_error", libs);
  gidLink(cast(void**)&g_dbus_message_new_method_error_literal, "g_dbus_message_new_method_error_literal", libs);
  gidLink(cast(void**)&g_dbus_message_new_method_error_valist, "g_dbus_message_new_method_error_valist", libs);
  gidLink(cast(void**)&g_dbus_message_new_method_reply, "g_dbus_message_new_method_reply", libs);
  gidLink(cast(void**)&g_dbus_message_print, "g_dbus_message_print", libs);
  gidLink(cast(void**)&g_dbus_message_set_body, "g_dbus_message_set_body", libs);
  gidLink(cast(void**)&g_dbus_message_set_byte_order, "g_dbus_message_set_byte_order", libs);
  gidLink(cast(void**)&g_dbus_message_set_destination, "g_dbus_message_set_destination", libs);
  gidLink(cast(void**)&g_dbus_message_set_error_name, "g_dbus_message_set_error_name", libs);
  gidLink(cast(void**)&g_dbus_message_set_flags, "g_dbus_message_set_flags", libs);
  gidLink(cast(void**)&g_dbus_message_set_header, "g_dbus_message_set_header", libs);
  gidLink(cast(void**)&g_dbus_message_set_interface, "g_dbus_message_set_interface", libs);
  gidLink(cast(void**)&g_dbus_message_set_member, "g_dbus_message_set_member", libs);
  gidLink(cast(void**)&g_dbus_message_set_message_type, "g_dbus_message_set_message_type", libs);
  gidLink(cast(void**)&g_dbus_message_set_num_unix_fds, "g_dbus_message_set_num_unix_fds", libs);
  gidLink(cast(void**)&g_dbus_message_set_path, "g_dbus_message_set_path", libs);
  gidLink(cast(void**)&g_dbus_message_set_reply_serial, "g_dbus_message_set_reply_serial", libs);
  gidLink(cast(void**)&g_dbus_message_set_sender, "g_dbus_message_set_sender", libs);
  gidLink(cast(void**)&g_dbus_message_set_serial, "g_dbus_message_set_serial", libs);
  gidLink(cast(void**)&g_dbus_message_set_signature, "g_dbus_message_set_signature", libs);
  gidLink(cast(void**)&g_dbus_message_set_unix_fd_list, "g_dbus_message_set_unix_fd_list", libs);
  gidLink(cast(void**)&g_dbus_message_to_blob, "g_dbus_message_to_blob", libs);
  gidLink(cast(void**)&g_dbus_message_to_gerror, "g_dbus_message_to_gerror", libs);

  // DBusMethodInfo
  gidLink(cast(void**)&g_dbus_method_info_get_type, "g_dbus_method_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_method_info_ref, "g_dbus_method_info_ref", libs);
  gidLink(cast(void**)&g_dbus_method_info_unref, "g_dbus_method_info_unref", libs);

  // DBusMethodInvocation
  gidLink(cast(void**)&g_dbus_method_invocation_get_type, "g_dbus_method_invocation_get_type", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_connection, "g_dbus_method_invocation_get_connection", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_interface_name, "g_dbus_method_invocation_get_interface_name", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_message, "g_dbus_method_invocation_get_message", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_method_info, "g_dbus_method_invocation_get_method_info", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_method_name, "g_dbus_method_invocation_get_method_name", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_object_path, "g_dbus_method_invocation_get_object_path", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_parameters, "g_dbus_method_invocation_get_parameters", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_property_info, "g_dbus_method_invocation_get_property_info", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_sender, "g_dbus_method_invocation_get_sender", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_get_user_data, "g_dbus_method_invocation_get_user_data", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_dbus_error, "g_dbus_method_invocation_return_dbus_error", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_error, "g_dbus_method_invocation_return_error", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_error_literal, "g_dbus_method_invocation_return_error_literal", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_error_valist, "g_dbus_method_invocation_return_error_valist", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_gerror, "g_dbus_method_invocation_return_gerror", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_value, "g_dbus_method_invocation_return_value", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_return_value_with_unix_fd_list, "g_dbus_method_invocation_return_value_with_unix_fd_list", libs);
  gidLink(cast(void**)&g_dbus_method_invocation_take_error, "g_dbus_method_invocation_take_error", libs);

  // DBusNodeInfo
  gidLink(cast(void**)&g_dbus_node_info_get_type, "g_dbus_node_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_node_info_new_for_xml, "g_dbus_node_info_new_for_xml", libs);
  gidLink(cast(void**)&g_dbus_node_info_generate_xml, "g_dbus_node_info_generate_xml", libs);
  gidLink(cast(void**)&g_dbus_node_info_lookup_interface, "g_dbus_node_info_lookup_interface", libs);
  gidLink(cast(void**)&g_dbus_node_info_ref, "g_dbus_node_info_ref", libs);
  gidLink(cast(void**)&g_dbus_node_info_unref, "g_dbus_node_info_unref", libs);

  // DBusObject
  gidLink(cast(void**)&g_dbus_object_get_type, "g_dbus_object_get_type", libs);
  gidLink(cast(void**)&g_dbus_object_get_interface, "g_dbus_object_get_interface", libs);
  gidLink(cast(void**)&g_dbus_object_get_interfaces, "g_dbus_object_get_interfaces", libs);
  gidLink(cast(void**)&g_dbus_object_get_object_path, "g_dbus_object_get_object_path", libs);

  // DBusObjectManager
  gidLink(cast(void**)&g_dbus_object_manager_get_type, "g_dbus_object_manager_get_type", libs);
  gidLink(cast(void**)&g_dbus_object_manager_get_interface, "g_dbus_object_manager_get_interface", libs);
  gidLink(cast(void**)&g_dbus_object_manager_get_object, "g_dbus_object_manager_get_object", libs);
  gidLink(cast(void**)&g_dbus_object_manager_get_object_path, "g_dbus_object_manager_get_object_path", libs);
  gidLink(cast(void**)&g_dbus_object_manager_get_objects, "g_dbus_object_manager_get_objects", libs);

  // DBusObjectManagerClient
  gidLink(cast(void**)&g_dbus_object_manager_client_get_type, "g_dbus_object_manager_client_get_type", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_new_finish, "g_dbus_object_manager_client_new_finish", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_new_for_bus_finish, "g_dbus_object_manager_client_new_for_bus_finish", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_new_for_bus_sync, "g_dbus_object_manager_client_new_for_bus_sync", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_new_sync, "g_dbus_object_manager_client_new_sync", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_new, "g_dbus_object_manager_client_new", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_new_for_bus, "g_dbus_object_manager_client_new_for_bus", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_get_connection, "g_dbus_object_manager_client_get_connection", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_get_flags, "g_dbus_object_manager_client_get_flags", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_get_name, "g_dbus_object_manager_client_get_name", libs);
  gidLink(cast(void**)&g_dbus_object_manager_client_get_name_owner, "g_dbus_object_manager_client_get_name_owner", libs);

  // DBusObjectManagerServer
  gidLink(cast(void**)&g_dbus_object_manager_server_get_type, "g_dbus_object_manager_server_get_type", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_new, "g_dbus_object_manager_server_new", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_export, "g_dbus_object_manager_server_export", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_export_uniquely, "g_dbus_object_manager_server_export_uniquely", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_get_connection, "g_dbus_object_manager_server_get_connection", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_is_exported, "g_dbus_object_manager_server_is_exported", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_set_connection, "g_dbus_object_manager_server_set_connection", libs);
  gidLink(cast(void**)&g_dbus_object_manager_server_unexport, "g_dbus_object_manager_server_unexport", libs);

  // DBusObjectProxy
  gidLink(cast(void**)&g_dbus_object_proxy_get_type, "g_dbus_object_proxy_get_type", libs);
  gidLink(cast(void**)&g_dbus_object_proxy_new, "g_dbus_object_proxy_new", libs);
  gidLink(cast(void**)&g_dbus_object_proxy_get_connection, "g_dbus_object_proxy_get_connection", libs);

  // DBusObjectSkeleton
  gidLink(cast(void**)&g_dbus_object_skeleton_get_type, "g_dbus_object_skeleton_get_type", libs);
  gidLink(cast(void**)&g_dbus_object_skeleton_new, "g_dbus_object_skeleton_new", libs);
  gidLink(cast(void**)&g_dbus_object_skeleton_add_interface, "g_dbus_object_skeleton_add_interface", libs);
  gidLink(cast(void**)&g_dbus_object_skeleton_flush, "g_dbus_object_skeleton_flush", libs);
  gidLink(cast(void**)&g_dbus_object_skeleton_remove_interface, "g_dbus_object_skeleton_remove_interface", libs);
  gidLink(cast(void**)&g_dbus_object_skeleton_remove_interface_by_name, "g_dbus_object_skeleton_remove_interface_by_name", libs);
  gidLink(cast(void**)&g_dbus_object_skeleton_set_object_path, "g_dbus_object_skeleton_set_object_path", libs);

  // DBusPropertyInfo
  gidLink(cast(void**)&g_dbus_property_info_get_type, "g_dbus_property_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_property_info_ref, "g_dbus_property_info_ref", libs);
  gidLink(cast(void**)&g_dbus_property_info_unref, "g_dbus_property_info_unref", libs);

  // DBusProxy
  gidLink(cast(void**)&g_dbus_proxy_get_type, "g_dbus_proxy_get_type", libs);
  gidLink(cast(void**)&g_dbus_proxy_new_finish, "g_dbus_proxy_new_finish", libs);
  gidLink(cast(void**)&g_dbus_proxy_new_for_bus_finish, "g_dbus_proxy_new_for_bus_finish", libs);
  gidLink(cast(void**)&g_dbus_proxy_new_for_bus_sync, "g_dbus_proxy_new_for_bus_sync", libs);
  gidLink(cast(void**)&g_dbus_proxy_new_sync, "g_dbus_proxy_new_sync", libs);
  gidLink(cast(void**)&g_dbus_proxy_new, "g_dbus_proxy_new", libs);
  gidLink(cast(void**)&g_dbus_proxy_new_for_bus, "g_dbus_proxy_new_for_bus", libs);
  gidLink(cast(void**)&g_dbus_proxy_call, "g_dbus_proxy_call", libs);
  gidLink(cast(void**)&g_dbus_proxy_call_finish, "g_dbus_proxy_call_finish", libs);
  gidLink(cast(void**)&g_dbus_proxy_call_sync, "g_dbus_proxy_call_sync", libs);
  gidLink(cast(void**)&g_dbus_proxy_call_with_unix_fd_list, "g_dbus_proxy_call_with_unix_fd_list", libs);
  gidLink(cast(void**)&g_dbus_proxy_call_with_unix_fd_list_finish, "g_dbus_proxy_call_with_unix_fd_list_finish", libs);
  gidLink(cast(void**)&g_dbus_proxy_call_with_unix_fd_list_sync, "g_dbus_proxy_call_with_unix_fd_list_sync", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_cached_property, "g_dbus_proxy_get_cached_property", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_cached_property_names, "g_dbus_proxy_get_cached_property_names", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_connection, "g_dbus_proxy_get_connection", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_default_timeout, "g_dbus_proxy_get_default_timeout", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_flags, "g_dbus_proxy_get_flags", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_interface_info, "g_dbus_proxy_get_interface_info", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_interface_name, "g_dbus_proxy_get_interface_name", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_name, "g_dbus_proxy_get_name", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_name_owner, "g_dbus_proxy_get_name_owner", libs);
  gidLink(cast(void**)&g_dbus_proxy_get_object_path, "g_dbus_proxy_get_object_path", libs);
  gidLink(cast(void**)&g_dbus_proxy_set_cached_property, "g_dbus_proxy_set_cached_property", libs);
  gidLink(cast(void**)&g_dbus_proxy_set_default_timeout, "g_dbus_proxy_set_default_timeout", libs);
  gidLink(cast(void**)&g_dbus_proxy_set_interface_info, "g_dbus_proxy_set_interface_info", libs);

  // DBusServer
  gidLink(cast(void**)&g_dbus_server_get_type, "g_dbus_server_get_type", libs);
  gidLink(cast(void**)&g_dbus_server_new_sync, "g_dbus_server_new_sync", libs);
  gidLink(cast(void**)&g_dbus_server_get_client_address, "g_dbus_server_get_client_address", libs);
  gidLink(cast(void**)&g_dbus_server_get_flags, "g_dbus_server_get_flags", libs);
  gidLink(cast(void**)&g_dbus_server_get_guid, "g_dbus_server_get_guid", libs);
  gidLink(cast(void**)&g_dbus_server_is_active, "g_dbus_server_is_active", libs);
  gidLink(cast(void**)&g_dbus_server_start, "g_dbus_server_start", libs);
  gidLink(cast(void**)&g_dbus_server_stop, "g_dbus_server_stop", libs);

  // DBusSignalInfo
  gidLink(cast(void**)&g_dbus_signal_info_get_type, "g_dbus_signal_info_get_type", libs);
  gidLink(cast(void**)&g_dbus_signal_info_ref, "g_dbus_signal_info_ref", libs);
  gidLink(cast(void**)&g_dbus_signal_info_unref, "g_dbus_signal_info_unref", libs);

  // DataInputStream
  gidLink(cast(void**)&g_data_input_stream_get_type, "g_data_input_stream_get_type", libs);
  gidLink(cast(void**)&g_data_input_stream_new, "g_data_input_stream_new", libs);
  gidLink(cast(void**)&g_data_input_stream_get_byte_order, "g_data_input_stream_get_byte_order", libs);
  gidLink(cast(void**)&g_data_input_stream_get_newline_type, "g_data_input_stream_get_newline_type", libs);
  gidLink(cast(void**)&g_data_input_stream_read_byte, "g_data_input_stream_read_byte", libs);
  gidLink(cast(void**)&g_data_input_stream_read_int16, "g_data_input_stream_read_int16", libs);
  gidLink(cast(void**)&g_data_input_stream_read_int32, "g_data_input_stream_read_int32", libs);
  gidLink(cast(void**)&g_data_input_stream_read_int64, "g_data_input_stream_read_int64", libs);
  gidLink(cast(void**)&g_data_input_stream_read_line, "g_data_input_stream_read_line", libs);
  gidLink(cast(void**)&g_data_input_stream_read_line_async, "g_data_input_stream_read_line_async", libs);
  gidLink(cast(void**)&g_data_input_stream_read_line_finish, "g_data_input_stream_read_line_finish", libs);
  gidLink(cast(void**)&g_data_input_stream_read_line_finish_utf8, "g_data_input_stream_read_line_finish_utf8", libs);
  gidLink(cast(void**)&g_data_input_stream_read_line_utf8, "g_data_input_stream_read_line_utf8", libs);
  gidLink(cast(void**)&g_data_input_stream_read_uint16, "g_data_input_stream_read_uint16", libs);
  gidLink(cast(void**)&g_data_input_stream_read_uint32, "g_data_input_stream_read_uint32", libs);
  gidLink(cast(void**)&g_data_input_stream_read_uint64, "g_data_input_stream_read_uint64", libs);
  gidLink(cast(void**)&g_data_input_stream_read_until, "g_data_input_stream_read_until", libs);
  gidLink(cast(void**)&g_data_input_stream_read_until_async, "g_data_input_stream_read_until_async", libs);
  gidLink(cast(void**)&g_data_input_stream_read_until_finish, "g_data_input_stream_read_until_finish", libs);
  gidLink(cast(void**)&g_data_input_stream_read_upto, "g_data_input_stream_read_upto", libs);
  gidLink(cast(void**)&g_data_input_stream_read_upto_async, "g_data_input_stream_read_upto_async", libs);
  gidLink(cast(void**)&g_data_input_stream_read_upto_finish, "g_data_input_stream_read_upto_finish", libs);
  gidLink(cast(void**)&g_data_input_stream_set_byte_order, "g_data_input_stream_set_byte_order", libs);
  gidLink(cast(void**)&g_data_input_stream_set_newline_type, "g_data_input_stream_set_newline_type", libs);

  // DataOutputStream
  gidLink(cast(void**)&g_data_output_stream_get_type, "g_data_output_stream_get_type", libs);
  gidLink(cast(void**)&g_data_output_stream_new, "g_data_output_stream_new", libs);
  gidLink(cast(void**)&g_data_output_stream_get_byte_order, "g_data_output_stream_get_byte_order", libs);
  gidLink(cast(void**)&g_data_output_stream_put_byte, "g_data_output_stream_put_byte", libs);
  gidLink(cast(void**)&g_data_output_stream_put_int16, "g_data_output_stream_put_int16", libs);
  gidLink(cast(void**)&g_data_output_stream_put_int32, "g_data_output_stream_put_int32", libs);
  gidLink(cast(void**)&g_data_output_stream_put_int64, "g_data_output_stream_put_int64", libs);
  gidLink(cast(void**)&g_data_output_stream_put_string, "g_data_output_stream_put_string", libs);
  gidLink(cast(void**)&g_data_output_stream_put_uint16, "g_data_output_stream_put_uint16", libs);
  gidLink(cast(void**)&g_data_output_stream_put_uint32, "g_data_output_stream_put_uint32", libs);
  gidLink(cast(void**)&g_data_output_stream_put_uint64, "g_data_output_stream_put_uint64", libs);
  gidLink(cast(void**)&g_data_output_stream_set_byte_order, "g_data_output_stream_set_byte_order", libs);

  // DatagramBased
  gidLink(cast(void**)&g_datagram_based_get_type, "g_datagram_based_get_type", libs);
  gidLink(cast(void**)&g_datagram_based_condition_check, "g_datagram_based_condition_check", libs);
  gidLink(cast(void**)&g_datagram_based_condition_wait, "g_datagram_based_condition_wait", libs);
  gidLink(cast(void**)&g_datagram_based_create_source, "g_datagram_based_create_source", libs);
  gidLink(cast(void**)&g_datagram_based_receive_messages, "g_datagram_based_receive_messages", libs);
  gidLink(cast(void**)&g_datagram_based_send_messages, "g_datagram_based_send_messages", libs);

  // DebugController
  gidLink(cast(void**)&g_debug_controller_get_type, "g_debug_controller_get_type", libs);
  gidLink(cast(void**)&g_debug_controller_get_debug_enabled, "g_debug_controller_get_debug_enabled", libs);
  gidLink(cast(void**)&g_debug_controller_set_debug_enabled, "g_debug_controller_set_debug_enabled", libs);

  // DebugControllerDBus
  gidLink(cast(void**)&g_debug_controller_dbus_get_type, "g_debug_controller_dbus_get_type", libs);
  gidLink(cast(void**)&g_debug_controller_dbus_new, "g_debug_controller_dbus_new", libs);
  gidLink(cast(void**)&g_debug_controller_dbus_stop, "g_debug_controller_dbus_stop", libs);

  // Drive
  gidLink(cast(void**)&g_drive_get_type, "g_drive_get_type", libs);
  gidLink(cast(void**)&g_drive_can_eject, "g_drive_can_eject", libs);
  gidLink(cast(void**)&g_drive_can_poll_for_media, "g_drive_can_poll_for_media", libs);
  gidLink(cast(void**)&g_drive_can_start, "g_drive_can_start", libs);
  gidLink(cast(void**)&g_drive_can_start_degraded, "g_drive_can_start_degraded", libs);
  gidLink(cast(void**)&g_drive_can_stop, "g_drive_can_stop", libs);
  gidLink(cast(void**)&g_drive_eject, "g_drive_eject", libs);
  gidLink(cast(void**)&g_drive_eject_finish, "g_drive_eject_finish", libs);
  gidLink(cast(void**)&g_drive_eject_with_operation, "g_drive_eject_with_operation", libs);
  gidLink(cast(void**)&g_drive_eject_with_operation_finish, "g_drive_eject_with_operation_finish", libs);
  gidLink(cast(void**)&g_drive_enumerate_identifiers, "g_drive_enumerate_identifiers", libs);
  gidLink(cast(void**)&g_drive_get_icon, "g_drive_get_icon", libs);
  gidLink(cast(void**)&g_drive_get_identifier, "g_drive_get_identifier", libs);
  gidLink(cast(void**)&g_drive_get_name, "g_drive_get_name", libs);
  gidLink(cast(void**)&g_drive_get_sort_key, "g_drive_get_sort_key", libs);
  gidLink(cast(void**)&g_drive_get_start_stop_type, "g_drive_get_start_stop_type", libs);
  gidLink(cast(void**)&g_drive_get_symbolic_icon, "g_drive_get_symbolic_icon", libs);
  gidLink(cast(void**)&g_drive_get_volumes, "g_drive_get_volumes", libs);
  gidLink(cast(void**)&g_drive_has_media, "g_drive_has_media", libs);
  gidLink(cast(void**)&g_drive_has_volumes, "g_drive_has_volumes", libs);
  gidLink(cast(void**)&g_drive_is_media_check_automatic, "g_drive_is_media_check_automatic", libs);
  gidLink(cast(void**)&g_drive_is_media_removable, "g_drive_is_media_removable", libs);
  gidLink(cast(void**)&g_drive_is_removable, "g_drive_is_removable", libs);
  gidLink(cast(void**)&g_drive_poll_for_media, "g_drive_poll_for_media", libs);
  gidLink(cast(void**)&g_drive_poll_for_media_finish, "g_drive_poll_for_media_finish", libs);
  gidLink(cast(void**)&g_drive_start, "g_drive_start", libs);
  gidLink(cast(void**)&g_drive_start_finish, "g_drive_start_finish", libs);
  gidLink(cast(void**)&g_drive_stop, "g_drive_stop", libs);
  gidLink(cast(void**)&g_drive_stop_finish, "g_drive_stop_finish", libs);

  // DtlsClientConnection
  gidLink(cast(void**)&g_dtls_client_connection_get_type, "g_dtls_client_connection_get_type", libs);
  gidLink(cast(void**)&g_dtls_client_connection_new, "g_dtls_client_connection_new", libs);
  gidLink(cast(void**)&g_dtls_client_connection_get_accepted_cas, "g_dtls_client_connection_get_accepted_cas", libs);
  gidLink(cast(void**)&g_dtls_client_connection_get_server_identity, "g_dtls_client_connection_get_server_identity", libs);
  gidLink(cast(void**)&g_dtls_client_connection_get_validation_flags, "g_dtls_client_connection_get_validation_flags", libs);
  gidLink(cast(void**)&g_dtls_client_connection_set_server_identity, "g_dtls_client_connection_set_server_identity", libs);
  gidLink(cast(void**)&g_dtls_client_connection_set_validation_flags, "g_dtls_client_connection_set_validation_flags", libs);

  // DtlsConnection
  gidLink(cast(void**)&g_dtls_connection_get_type, "g_dtls_connection_get_type", libs);
  gidLink(cast(void**)&g_dtls_connection_close, "g_dtls_connection_close", libs);
  gidLink(cast(void**)&g_dtls_connection_close_async, "g_dtls_connection_close_async", libs);
  gidLink(cast(void**)&g_dtls_connection_close_finish, "g_dtls_connection_close_finish", libs);
  gidLink(cast(void**)&g_dtls_connection_emit_accept_certificate, "g_dtls_connection_emit_accept_certificate", libs);
  gidLink(cast(void**)&g_dtls_connection_get_certificate, "g_dtls_connection_get_certificate", libs);
  gidLink(cast(void**)&g_dtls_connection_get_channel_binding_data, "g_dtls_connection_get_channel_binding_data", libs);
  gidLink(cast(void**)&g_dtls_connection_get_ciphersuite_name, "g_dtls_connection_get_ciphersuite_name", libs);
  gidLink(cast(void**)&g_dtls_connection_get_database, "g_dtls_connection_get_database", libs);
  gidLink(cast(void**)&g_dtls_connection_get_interaction, "g_dtls_connection_get_interaction", libs);
  gidLink(cast(void**)&g_dtls_connection_get_negotiated_protocol, "g_dtls_connection_get_negotiated_protocol", libs);
  gidLink(cast(void**)&g_dtls_connection_get_peer_certificate, "g_dtls_connection_get_peer_certificate", libs);
  gidLink(cast(void**)&g_dtls_connection_get_peer_certificate_errors, "g_dtls_connection_get_peer_certificate_errors", libs);
  gidLink(cast(void**)&g_dtls_connection_get_protocol_version, "g_dtls_connection_get_protocol_version", libs);
  gidLink(cast(void**)&g_dtls_connection_get_rehandshake_mode, "g_dtls_connection_get_rehandshake_mode", libs);
  gidLink(cast(void**)&g_dtls_connection_get_require_close_notify, "g_dtls_connection_get_require_close_notify", libs);
  gidLink(cast(void**)&g_dtls_connection_handshake, "g_dtls_connection_handshake", libs);
  gidLink(cast(void**)&g_dtls_connection_handshake_async, "g_dtls_connection_handshake_async", libs);
  gidLink(cast(void**)&g_dtls_connection_handshake_finish, "g_dtls_connection_handshake_finish", libs);
  gidLink(cast(void**)&g_dtls_connection_set_advertised_protocols, "g_dtls_connection_set_advertised_protocols", libs);
  gidLink(cast(void**)&g_dtls_connection_set_certificate, "g_dtls_connection_set_certificate", libs);
  gidLink(cast(void**)&g_dtls_connection_set_database, "g_dtls_connection_set_database", libs);
  gidLink(cast(void**)&g_dtls_connection_set_interaction, "g_dtls_connection_set_interaction", libs);
  gidLink(cast(void**)&g_dtls_connection_set_rehandshake_mode, "g_dtls_connection_set_rehandshake_mode", libs);
  gidLink(cast(void**)&g_dtls_connection_set_require_close_notify, "g_dtls_connection_set_require_close_notify", libs);
  gidLink(cast(void**)&g_dtls_connection_shutdown, "g_dtls_connection_shutdown", libs);
  gidLink(cast(void**)&g_dtls_connection_shutdown_async, "g_dtls_connection_shutdown_async", libs);
  gidLink(cast(void**)&g_dtls_connection_shutdown_finish, "g_dtls_connection_shutdown_finish", libs);

  // DtlsServerConnection
  gidLink(cast(void**)&g_dtls_server_connection_get_type, "g_dtls_server_connection_get_type", libs);
  gidLink(cast(void**)&g_dtls_server_connection_new, "g_dtls_server_connection_new", libs);

  // Emblem
  gidLink(cast(void**)&g_emblem_get_type, "g_emblem_get_type", libs);
  gidLink(cast(void**)&g_emblem_new, "g_emblem_new", libs);
  gidLink(cast(void**)&g_emblem_new_with_origin, "g_emblem_new_with_origin", libs);
  gidLink(cast(void**)&g_emblem_get_icon, "g_emblem_get_icon", libs);
  gidLink(cast(void**)&g_emblem_get_origin, "g_emblem_get_origin", libs);

  // EmblemedIcon
  gidLink(cast(void**)&g_emblemed_icon_get_type, "g_emblemed_icon_get_type", libs);
  gidLink(cast(void**)&g_emblemed_icon_new, "g_emblemed_icon_new", libs);
  gidLink(cast(void**)&g_emblemed_icon_add_emblem, "g_emblemed_icon_add_emblem", libs);
  gidLink(cast(void**)&g_emblemed_icon_clear_emblems, "g_emblemed_icon_clear_emblems", libs);
  gidLink(cast(void**)&g_emblemed_icon_get_emblems, "g_emblemed_icon_get_emblems", libs);
  gidLink(cast(void**)&g_emblemed_icon_get_icon, "g_emblemed_icon_get_icon", libs);

  // File
  gidLink(cast(void**)&g_file_get_type, "g_file_get_type", libs);
  gidLink(cast(void**)&g_file_new_build_filename, "g_file_new_build_filename", libs);
  gidLink(cast(void**)&g_file_new_build_filenamev, "g_file_new_build_filenamev", libs);
  gidLink(cast(void**)&g_file_new_for_commandline_arg, "g_file_new_for_commandline_arg", libs);
  gidLink(cast(void**)&g_file_new_for_commandline_arg_and_cwd, "g_file_new_for_commandline_arg_and_cwd", libs);
  gidLink(cast(void**)&g_file_new_for_path, "g_file_new_for_path", libs);
  gidLink(cast(void**)&g_file_new_for_uri, "g_file_new_for_uri", libs);
  gidLink(cast(void**)&g_file_new_tmp, "g_file_new_tmp", libs);
  gidLink(cast(void**)&g_file_new_tmp_async, "g_file_new_tmp_async", libs);
  gidLink(cast(void**)&g_file_new_tmp_dir_async, "g_file_new_tmp_dir_async", libs);
  gidLink(cast(void**)&g_file_new_tmp_dir_finish, "g_file_new_tmp_dir_finish", libs);
  gidLink(cast(void**)&g_file_new_tmp_finish, "g_file_new_tmp_finish", libs);
  gidLink(cast(void**)&g_file_parse_name, "g_file_parse_name", libs);
  gidLink(cast(void**)&g_file_append_to, "g_file_append_to", libs);
  gidLink(cast(void**)&g_file_append_to_async, "g_file_append_to_async", libs);
  gidLink(cast(void**)&g_file_append_to_finish, "g_file_append_to_finish", libs);
  gidLink(cast(void**)&g_file_build_attribute_list_for_copy, "g_file_build_attribute_list_for_copy", libs);
  gidLink(cast(void**)&g_file_copy, "g_file_copy", libs);
  gidLink(cast(void**)&g_file_copy_async, "g_file_copy_async", libs);
  gidLink(cast(void**)&g_file_copy_async_with_closures, "g_file_copy_async_with_closures", libs);
  gidLink(cast(void**)&g_file_copy_attributes, "g_file_copy_attributes", libs);
  gidLink(cast(void**)&g_file_copy_finish, "g_file_copy_finish", libs);
  gidLink(cast(void**)&g_file_create, "g_file_create", libs);
  gidLink(cast(void**)&g_file_create_async, "g_file_create_async", libs);
  gidLink(cast(void**)&g_file_create_finish, "g_file_create_finish", libs);
  gidLink(cast(void**)&g_file_create_readwrite, "g_file_create_readwrite", libs);
  gidLink(cast(void**)&g_file_create_readwrite_async, "g_file_create_readwrite_async", libs);
  gidLink(cast(void**)&g_file_create_readwrite_finish, "g_file_create_readwrite_finish", libs);
  gidLink(cast(void**)&g_file_delete, "g_file_delete", libs);
  gidLink(cast(void**)&g_file_delete_async, "g_file_delete_async", libs);
  gidLink(cast(void**)&g_file_delete_finish, "g_file_delete_finish", libs);
  gidLink(cast(void**)&g_file_dup, "g_file_dup", libs);
  gidLink(cast(void**)&g_file_eject_mountable, "g_file_eject_mountable", libs);
  gidLink(cast(void**)&g_file_eject_mountable_finish, "g_file_eject_mountable_finish", libs);
  gidLink(cast(void**)&g_file_eject_mountable_with_operation, "g_file_eject_mountable_with_operation", libs);
  gidLink(cast(void**)&g_file_eject_mountable_with_operation_finish, "g_file_eject_mountable_with_operation_finish", libs);
  gidLink(cast(void**)&g_file_enumerate_children, "g_file_enumerate_children", libs);
  gidLink(cast(void**)&g_file_enumerate_children_async, "g_file_enumerate_children_async", libs);
  gidLink(cast(void**)&g_file_enumerate_children_finish, "g_file_enumerate_children_finish", libs);
  gidLink(cast(void**)&g_file_equal, "g_file_equal", libs);
  gidLink(cast(void**)&g_file_find_enclosing_mount, "g_file_find_enclosing_mount", libs);
  gidLink(cast(void**)&g_file_find_enclosing_mount_async, "g_file_find_enclosing_mount_async", libs);
  gidLink(cast(void**)&g_file_find_enclosing_mount_finish, "g_file_find_enclosing_mount_finish", libs);
  gidLink(cast(void**)&g_file_get_basename, "g_file_get_basename", libs);
  gidLink(cast(void**)&g_file_get_child, "g_file_get_child", libs);
  gidLink(cast(void**)&g_file_get_child_for_display_name, "g_file_get_child_for_display_name", libs);
  gidLink(cast(void**)&g_file_get_parent, "g_file_get_parent", libs);
  gidLink(cast(void**)&g_file_get_parse_name, "g_file_get_parse_name", libs);
  gidLink(cast(void**)&g_file_get_path, "g_file_get_path", libs);
  gidLink(cast(void**)&g_file_get_relative_path, "g_file_get_relative_path", libs);
  gidLink(cast(void**)&g_file_get_uri, "g_file_get_uri", libs);
  gidLink(cast(void**)&g_file_get_uri_scheme, "g_file_get_uri_scheme", libs);
  gidLink(cast(void**)&g_file_has_parent, "g_file_has_parent", libs);
  gidLink(cast(void**)&g_file_has_prefix, "g_file_has_prefix", libs);
  gidLink(cast(void**)&g_file_has_uri_scheme, "g_file_has_uri_scheme", libs);
  gidLink(cast(void**)&g_file_hash, "g_file_hash", libs);
  gidLink(cast(void**)&g_file_is_native, "g_file_is_native", libs);
  gidLink(cast(void**)&g_file_load_bytes, "g_file_load_bytes", libs);
  gidLink(cast(void**)&g_file_load_bytes_async, "g_file_load_bytes_async", libs);
  gidLink(cast(void**)&g_file_load_bytes_finish, "g_file_load_bytes_finish", libs);
  gidLink(cast(void**)&g_file_load_contents, "g_file_load_contents", libs);
  gidLink(cast(void**)&g_file_load_contents_async, "g_file_load_contents_async", libs);
  gidLink(cast(void**)&g_file_load_contents_finish, "g_file_load_contents_finish", libs);
  gidLink(cast(void**)&g_file_load_partial_contents_async, "g_file_load_partial_contents_async", libs);
  gidLink(cast(void**)&g_file_load_partial_contents_finish, "g_file_load_partial_contents_finish", libs);
  gidLink(cast(void**)&g_file_make_directory, "g_file_make_directory", libs);
  gidLink(cast(void**)&g_file_make_directory_async, "g_file_make_directory_async", libs);
  gidLink(cast(void**)&g_file_make_directory_finish, "g_file_make_directory_finish", libs);
  gidLink(cast(void**)&g_file_make_directory_with_parents, "g_file_make_directory_with_parents", libs);
  gidLink(cast(void**)&g_file_make_symbolic_link, "g_file_make_symbolic_link", libs);
  gidLink(cast(void**)&g_file_make_symbolic_link_async, "g_file_make_symbolic_link_async", libs);
  gidLink(cast(void**)&g_file_make_symbolic_link_finish, "g_file_make_symbolic_link_finish", libs);
  gidLink(cast(void**)&g_file_measure_disk_usage, "g_file_measure_disk_usage", libs);
  gidLink(cast(void**)&g_file_measure_disk_usage_async, "g_file_measure_disk_usage_async", libs);
  gidLink(cast(void**)&g_file_measure_disk_usage_finish, "g_file_measure_disk_usage_finish", libs);
  gidLink(cast(void**)&g_file_monitor, "g_file_monitor", libs);
  gidLink(cast(void**)&g_file_monitor_directory, "g_file_monitor_directory", libs);
  gidLink(cast(void**)&g_file_monitor_file, "g_file_monitor_file", libs);
  gidLink(cast(void**)&g_file_mount_enclosing_volume, "g_file_mount_enclosing_volume", libs);
  gidLink(cast(void**)&g_file_mount_enclosing_volume_finish, "g_file_mount_enclosing_volume_finish", libs);
  gidLink(cast(void**)&g_file_mount_mountable, "g_file_mount_mountable", libs);
  gidLink(cast(void**)&g_file_mount_mountable_finish, "g_file_mount_mountable_finish", libs);
  gidLink(cast(void**)&g_file_move, "g_file_move", libs);
  gidLink(cast(void**)&g_file_move_async, "g_file_move_async", libs);
  gidLink(cast(void**)&g_file_move_async_with_closures, "g_file_move_async_with_closures", libs);
  gidLink(cast(void**)&g_file_move_finish, "g_file_move_finish", libs);
  gidLink(cast(void**)&g_file_open_readwrite, "g_file_open_readwrite", libs);
  gidLink(cast(void**)&g_file_open_readwrite_async, "g_file_open_readwrite_async", libs);
  gidLink(cast(void**)&g_file_open_readwrite_finish, "g_file_open_readwrite_finish", libs);
  gidLink(cast(void**)&g_file_peek_path, "g_file_peek_path", libs);
  gidLink(cast(void**)&g_file_poll_mountable, "g_file_poll_mountable", libs);
  gidLink(cast(void**)&g_file_poll_mountable_finish, "g_file_poll_mountable_finish", libs);
  gidLink(cast(void**)&g_file_query_default_handler, "g_file_query_default_handler", libs);
  gidLink(cast(void**)&g_file_query_default_handler_async, "g_file_query_default_handler_async", libs);
  gidLink(cast(void**)&g_file_query_default_handler_finish, "g_file_query_default_handler_finish", libs);
  gidLink(cast(void**)&g_file_query_exists, "g_file_query_exists", libs);
  gidLink(cast(void**)&g_file_query_file_type, "g_file_query_file_type", libs);
  gidLink(cast(void**)&g_file_query_filesystem_info, "g_file_query_filesystem_info", libs);
  gidLink(cast(void**)&g_file_query_filesystem_info_async, "g_file_query_filesystem_info_async", libs);
  gidLink(cast(void**)&g_file_query_filesystem_info_finish, "g_file_query_filesystem_info_finish", libs);
  gidLink(cast(void**)&g_file_query_info, "g_file_query_info", libs);
  gidLink(cast(void**)&g_file_query_info_async, "g_file_query_info_async", libs);
  gidLink(cast(void**)&g_file_query_info_finish, "g_file_query_info_finish", libs);
  gidLink(cast(void**)&g_file_query_settable_attributes, "g_file_query_settable_attributes", libs);
  gidLink(cast(void**)&g_file_query_writable_namespaces, "g_file_query_writable_namespaces", libs);
  gidLink(cast(void**)&g_file_read, "g_file_read", libs);
  gidLink(cast(void**)&g_file_read_async, "g_file_read_async", libs);
  gidLink(cast(void**)&g_file_read_finish, "g_file_read_finish", libs);
  gidLink(cast(void**)&g_file_replace, "g_file_replace", libs);
  gidLink(cast(void**)&g_file_replace_async, "g_file_replace_async", libs);
  gidLink(cast(void**)&g_file_replace_contents, "g_file_replace_contents", libs);
  gidLink(cast(void**)&g_file_replace_contents_async, "g_file_replace_contents_async", libs);
  gidLink(cast(void**)&g_file_replace_contents_bytes_async, "g_file_replace_contents_bytes_async", libs);
  gidLink(cast(void**)&g_file_replace_contents_finish, "g_file_replace_contents_finish", libs);
  gidLink(cast(void**)&g_file_replace_finish, "g_file_replace_finish", libs);
  gidLink(cast(void**)&g_file_replace_readwrite, "g_file_replace_readwrite", libs);
  gidLink(cast(void**)&g_file_replace_readwrite_async, "g_file_replace_readwrite_async", libs);
  gidLink(cast(void**)&g_file_replace_readwrite_finish, "g_file_replace_readwrite_finish", libs);
  gidLink(cast(void**)&g_file_resolve_relative_path, "g_file_resolve_relative_path", libs);
  gidLink(cast(void**)&g_file_set_attribute, "g_file_set_attribute", libs);
  gidLink(cast(void**)&g_file_set_attribute_byte_string, "g_file_set_attribute_byte_string", libs);
  gidLink(cast(void**)&g_file_set_attribute_int32, "g_file_set_attribute_int32", libs);
  gidLink(cast(void**)&g_file_set_attribute_int64, "g_file_set_attribute_int64", libs);
  gidLink(cast(void**)&g_file_set_attribute_string, "g_file_set_attribute_string", libs);
  gidLink(cast(void**)&g_file_set_attribute_uint32, "g_file_set_attribute_uint32", libs);
  gidLink(cast(void**)&g_file_set_attribute_uint64, "g_file_set_attribute_uint64", libs);
  gidLink(cast(void**)&g_file_set_attributes_async, "g_file_set_attributes_async", libs);
  gidLink(cast(void**)&g_file_set_attributes_finish, "g_file_set_attributes_finish", libs);
  gidLink(cast(void**)&g_file_set_attributes_from_info, "g_file_set_attributes_from_info", libs);
  gidLink(cast(void**)&g_file_set_display_name, "g_file_set_display_name", libs);
  gidLink(cast(void**)&g_file_set_display_name_async, "g_file_set_display_name_async", libs);
  gidLink(cast(void**)&g_file_set_display_name_finish, "g_file_set_display_name_finish", libs);
  gidLink(cast(void**)&g_file_start_mountable, "g_file_start_mountable", libs);
  gidLink(cast(void**)&g_file_start_mountable_finish, "g_file_start_mountable_finish", libs);
  gidLink(cast(void**)&g_file_stop_mountable, "g_file_stop_mountable", libs);
  gidLink(cast(void**)&g_file_stop_mountable_finish, "g_file_stop_mountable_finish", libs);
  gidLink(cast(void**)&g_file_supports_thread_contexts, "g_file_supports_thread_contexts", libs);
  gidLink(cast(void**)&g_file_trash, "g_file_trash", libs);
  gidLink(cast(void**)&g_file_trash_async, "g_file_trash_async", libs);
  gidLink(cast(void**)&g_file_trash_finish, "g_file_trash_finish", libs);
  gidLink(cast(void**)&g_file_unmount_mountable, "g_file_unmount_mountable", libs);
  gidLink(cast(void**)&g_file_unmount_mountable_finish, "g_file_unmount_mountable_finish", libs);
  gidLink(cast(void**)&g_file_unmount_mountable_with_operation, "g_file_unmount_mountable_with_operation", libs);
  gidLink(cast(void**)&g_file_unmount_mountable_with_operation_finish, "g_file_unmount_mountable_with_operation_finish", libs);

  // FileAttributeInfoList
  gidLink(cast(void**)&g_file_attribute_info_list_get_type, "g_file_attribute_info_list_get_type", libs);
  gidLink(cast(void**)&g_file_attribute_info_list_new, "g_file_attribute_info_list_new", libs);
  gidLink(cast(void**)&g_file_attribute_info_list_add, "g_file_attribute_info_list_add", libs);
  gidLink(cast(void**)&g_file_attribute_info_list_dup, "g_file_attribute_info_list_dup", libs);
  gidLink(cast(void**)&g_file_attribute_info_list_lookup, "g_file_attribute_info_list_lookup", libs);
  gidLink(cast(void**)&g_file_attribute_info_list_ref, "g_file_attribute_info_list_ref", libs);
  gidLink(cast(void**)&g_file_attribute_info_list_unref, "g_file_attribute_info_list_unref", libs);

  // FileAttributeMatcher
  gidLink(cast(void**)&g_file_attribute_matcher_get_type, "g_file_attribute_matcher_get_type", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_new, "g_file_attribute_matcher_new", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_enumerate_namespace, "g_file_attribute_matcher_enumerate_namespace", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_enumerate_next, "g_file_attribute_matcher_enumerate_next", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_matches, "g_file_attribute_matcher_matches", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_matches_only, "g_file_attribute_matcher_matches_only", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_ref, "g_file_attribute_matcher_ref", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_subtract, "g_file_attribute_matcher_subtract", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_to_string, "g_file_attribute_matcher_to_string", libs);
  gidLink(cast(void**)&g_file_attribute_matcher_unref, "g_file_attribute_matcher_unref", libs);

  // FileEnumerator
  gidLink(cast(void**)&g_file_enumerator_get_type, "g_file_enumerator_get_type", libs);
  gidLink(cast(void**)&g_file_enumerator_close, "g_file_enumerator_close", libs);
  gidLink(cast(void**)&g_file_enumerator_close_async, "g_file_enumerator_close_async", libs);
  gidLink(cast(void**)&g_file_enumerator_close_finish, "g_file_enumerator_close_finish", libs);
  gidLink(cast(void**)&g_file_enumerator_get_child, "g_file_enumerator_get_child", libs);
  gidLink(cast(void**)&g_file_enumerator_get_container, "g_file_enumerator_get_container", libs);
  gidLink(cast(void**)&g_file_enumerator_has_pending, "g_file_enumerator_has_pending", libs);
  gidLink(cast(void**)&g_file_enumerator_is_closed, "g_file_enumerator_is_closed", libs);
  gidLink(cast(void**)&g_file_enumerator_iterate, "g_file_enumerator_iterate", libs);
  gidLink(cast(void**)&g_file_enumerator_next_file, "g_file_enumerator_next_file", libs);
  gidLink(cast(void**)&g_file_enumerator_next_files_async, "g_file_enumerator_next_files_async", libs);
  gidLink(cast(void**)&g_file_enumerator_next_files_finish, "g_file_enumerator_next_files_finish", libs);
  gidLink(cast(void**)&g_file_enumerator_set_pending, "g_file_enumerator_set_pending", libs);

  // FileIOStream
  gidLink(cast(void**)&g_file_io_stream_get_type, "g_file_io_stream_get_type", libs);
  gidLink(cast(void**)&g_file_io_stream_get_etag, "g_file_io_stream_get_etag", libs);
  gidLink(cast(void**)&g_file_io_stream_query_info, "g_file_io_stream_query_info", libs);
  gidLink(cast(void**)&g_file_io_stream_query_info_async, "g_file_io_stream_query_info_async", libs);
  gidLink(cast(void**)&g_file_io_stream_query_info_finish, "g_file_io_stream_query_info_finish", libs);

  // FileIcon
  gidLink(cast(void**)&g_file_icon_get_type, "g_file_icon_get_type", libs);
  gidLink(cast(void**)&g_file_icon_new, "g_file_icon_new", libs);
  gidLink(cast(void**)&g_file_icon_get_file, "g_file_icon_get_file", libs);

  // FileInfo
  gidLink(cast(void**)&g_file_info_get_type, "g_file_info_get_type", libs);
  gidLink(cast(void**)&g_file_info_new, "g_file_info_new", libs);
  gidLink(cast(void**)&g_file_info_clear_status, "g_file_info_clear_status", libs);
  gidLink(cast(void**)&g_file_info_copy_into, "g_file_info_copy_into", libs);
  gidLink(cast(void**)&g_file_info_dup, "g_file_info_dup", libs);
  gidLink(cast(void**)&g_file_info_get_access_date_time, "g_file_info_get_access_date_time", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_as_string, "g_file_info_get_attribute_as_string", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_boolean, "g_file_info_get_attribute_boolean", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_byte_string, "g_file_info_get_attribute_byte_string", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_data, "g_file_info_get_attribute_data", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_file_path, "g_file_info_get_attribute_file_path", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_int32, "g_file_info_get_attribute_int32", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_int64, "g_file_info_get_attribute_int64", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_object, "g_file_info_get_attribute_object", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_status, "g_file_info_get_attribute_status", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_string, "g_file_info_get_attribute_string", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_stringv, "g_file_info_get_attribute_stringv", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_type, "g_file_info_get_attribute_type", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_uint32, "g_file_info_get_attribute_uint32", libs);
  gidLink(cast(void**)&g_file_info_get_attribute_uint64, "g_file_info_get_attribute_uint64", libs);
  gidLink(cast(void**)&g_file_info_get_content_type, "g_file_info_get_content_type", libs);
  gidLink(cast(void**)&g_file_info_get_creation_date_time, "g_file_info_get_creation_date_time", libs);
  gidLink(cast(void**)&g_file_info_get_deletion_date, "g_file_info_get_deletion_date", libs);
  gidLink(cast(void**)&g_file_info_get_display_name, "g_file_info_get_display_name", libs);
  gidLink(cast(void**)&g_file_info_get_edit_name, "g_file_info_get_edit_name", libs);
  gidLink(cast(void**)&g_file_info_get_etag, "g_file_info_get_etag", libs);
  gidLink(cast(void**)&g_file_info_get_file_type, "g_file_info_get_file_type", libs);
  gidLink(cast(void**)&g_file_info_get_icon, "g_file_info_get_icon", libs);
  gidLink(cast(void**)&g_file_info_get_is_backup, "g_file_info_get_is_backup", libs);
  gidLink(cast(void**)&g_file_info_get_is_hidden, "g_file_info_get_is_hidden", libs);
  gidLink(cast(void**)&g_file_info_get_is_symlink, "g_file_info_get_is_symlink", libs);
  gidLink(cast(void**)&g_file_info_get_modification_date_time, "g_file_info_get_modification_date_time", libs);
  gidLink(cast(void**)&g_file_info_get_modification_time, "g_file_info_get_modification_time", libs);
  gidLink(cast(void**)&g_file_info_get_name, "g_file_info_get_name", libs);
  gidLink(cast(void**)&g_file_info_get_size, "g_file_info_get_size", libs);
  gidLink(cast(void**)&g_file_info_get_sort_order, "g_file_info_get_sort_order", libs);
  gidLink(cast(void**)&g_file_info_get_symbolic_icon, "g_file_info_get_symbolic_icon", libs);
  gidLink(cast(void**)&g_file_info_get_symlink_target, "g_file_info_get_symlink_target", libs);
  gidLink(cast(void**)&g_file_info_has_attribute, "g_file_info_has_attribute", libs);
  gidLink(cast(void**)&g_file_info_has_namespace, "g_file_info_has_namespace", libs);
  gidLink(cast(void**)&g_file_info_list_attributes, "g_file_info_list_attributes", libs);
  gidLink(cast(void**)&g_file_info_remove_attribute, "g_file_info_remove_attribute", libs);
  gidLink(cast(void**)&g_file_info_set_access_date_time, "g_file_info_set_access_date_time", libs);
  gidLink(cast(void**)&g_file_info_set_attribute, "g_file_info_set_attribute", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_boolean, "g_file_info_set_attribute_boolean", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_byte_string, "g_file_info_set_attribute_byte_string", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_file_path, "g_file_info_set_attribute_file_path", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_int32, "g_file_info_set_attribute_int32", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_int64, "g_file_info_set_attribute_int64", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_mask, "g_file_info_set_attribute_mask", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_object, "g_file_info_set_attribute_object", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_status, "g_file_info_set_attribute_status", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_string, "g_file_info_set_attribute_string", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_stringv, "g_file_info_set_attribute_stringv", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_uint32, "g_file_info_set_attribute_uint32", libs);
  gidLink(cast(void**)&g_file_info_set_attribute_uint64, "g_file_info_set_attribute_uint64", libs);
  gidLink(cast(void**)&g_file_info_set_content_type, "g_file_info_set_content_type", libs);
  gidLink(cast(void**)&g_file_info_set_creation_date_time, "g_file_info_set_creation_date_time", libs);
  gidLink(cast(void**)&g_file_info_set_display_name, "g_file_info_set_display_name", libs);
  gidLink(cast(void**)&g_file_info_set_edit_name, "g_file_info_set_edit_name", libs);
  gidLink(cast(void**)&g_file_info_set_file_type, "g_file_info_set_file_type", libs);
  gidLink(cast(void**)&g_file_info_set_icon, "g_file_info_set_icon", libs);
  gidLink(cast(void**)&g_file_info_set_is_hidden, "g_file_info_set_is_hidden", libs);
  gidLink(cast(void**)&g_file_info_set_is_symlink, "g_file_info_set_is_symlink", libs);
  gidLink(cast(void**)&g_file_info_set_modification_date_time, "g_file_info_set_modification_date_time", libs);
  gidLink(cast(void**)&g_file_info_set_modification_time, "g_file_info_set_modification_time", libs);
  gidLink(cast(void**)&g_file_info_set_name, "g_file_info_set_name", libs);
  gidLink(cast(void**)&g_file_info_set_size, "g_file_info_set_size", libs);
  gidLink(cast(void**)&g_file_info_set_sort_order, "g_file_info_set_sort_order", libs);
  gidLink(cast(void**)&g_file_info_set_symbolic_icon, "g_file_info_set_symbolic_icon", libs);
  gidLink(cast(void**)&g_file_info_set_symlink_target, "g_file_info_set_symlink_target", libs);
  gidLink(cast(void**)&g_file_info_unset_attribute_mask, "g_file_info_unset_attribute_mask", libs);

  // FileInputStream
  gidLink(cast(void**)&g_file_input_stream_get_type, "g_file_input_stream_get_type", libs);
  gidLink(cast(void**)&g_file_input_stream_query_info, "g_file_input_stream_query_info", libs);
  gidLink(cast(void**)&g_file_input_stream_query_info_async, "g_file_input_stream_query_info_async", libs);
  gidLink(cast(void**)&g_file_input_stream_query_info_finish, "g_file_input_stream_query_info_finish", libs);

  // FileMonitor
  gidLink(cast(void**)&g_file_monitor_get_type, "g_file_monitor_get_type", libs);
  gidLink(cast(void**)&g_file_monitor_cancel, "g_file_monitor_cancel", libs);
  gidLink(cast(void**)&g_file_monitor_emit_event, "g_file_monitor_emit_event", libs);
  gidLink(cast(void**)&g_file_monitor_is_cancelled, "g_file_monitor_is_cancelled", libs);
  gidLink(cast(void**)&g_file_monitor_set_rate_limit, "g_file_monitor_set_rate_limit", libs);

  // FileOutputStream
  gidLink(cast(void**)&g_file_output_stream_get_type, "g_file_output_stream_get_type", libs);
  gidLink(cast(void**)&g_file_output_stream_get_etag, "g_file_output_stream_get_etag", libs);
  gidLink(cast(void**)&g_file_output_stream_query_info, "g_file_output_stream_query_info", libs);
  gidLink(cast(void**)&g_file_output_stream_query_info_async, "g_file_output_stream_query_info_async", libs);
  gidLink(cast(void**)&g_file_output_stream_query_info_finish, "g_file_output_stream_query_info_finish", libs);

  // FilenameCompleter
  gidLink(cast(void**)&g_filename_completer_get_type, "g_filename_completer_get_type", libs);
  gidLink(cast(void**)&g_filename_completer_new, "g_filename_completer_new", libs);
  gidLink(cast(void**)&g_filename_completer_get_completion_suffix, "g_filename_completer_get_completion_suffix", libs);
  gidLink(cast(void**)&g_filename_completer_get_completions, "g_filename_completer_get_completions", libs);
  gidLink(cast(void**)&g_filename_completer_set_dirs_only, "g_filename_completer_set_dirs_only", libs);

  // FilterInputStream
  gidLink(cast(void**)&g_filter_input_stream_get_type, "g_filter_input_stream_get_type", libs);
  gidLink(cast(void**)&g_filter_input_stream_get_base_stream, "g_filter_input_stream_get_base_stream", libs);
  gidLink(cast(void**)&g_filter_input_stream_get_close_base_stream, "g_filter_input_stream_get_close_base_stream", libs);
  gidLink(cast(void**)&g_filter_input_stream_set_close_base_stream, "g_filter_input_stream_set_close_base_stream", libs);

  // FilterOutputStream
  gidLink(cast(void**)&g_filter_output_stream_get_type, "g_filter_output_stream_get_type", libs);
  gidLink(cast(void**)&g_filter_output_stream_get_base_stream, "g_filter_output_stream_get_base_stream", libs);
  gidLink(cast(void**)&g_filter_output_stream_get_close_base_stream, "g_filter_output_stream_get_close_base_stream", libs);
  gidLink(cast(void**)&g_filter_output_stream_set_close_base_stream, "g_filter_output_stream_set_close_base_stream", libs);

  // IOExtension
  gidLink(cast(void**)&g_io_extension_get_name, "g_io_extension_get_name", libs);
  gidLink(cast(void**)&g_io_extension_get_priority, "g_io_extension_get_priority", libs);
  gidLink(cast(void**)&g_io_extension_get_type, "g_io_extension_get_type", libs);
  gidLink(cast(void**)&g_io_extension_ref_class, "g_io_extension_ref_class", libs);

  // IOExtensionPoint
  gidLink(cast(void**)&g_io_extension_point_get_extension_by_name, "g_io_extension_point_get_extension_by_name", libs);
  gidLink(cast(void**)&g_io_extension_point_get_extensions, "g_io_extension_point_get_extensions", libs);
  gidLink(cast(void**)&g_io_extension_point_get_required_type, "g_io_extension_point_get_required_type", libs);
  gidLink(cast(void**)&g_io_extension_point_set_required_type, "g_io_extension_point_set_required_type", libs);
  gidLink(cast(void**)&g_io_extension_point_implement, "g_io_extension_point_implement", libs);
  gidLink(cast(void**)&g_io_extension_point_lookup, "g_io_extension_point_lookup", libs);
  gidLink(cast(void**)&g_io_extension_point_register, "g_io_extension_point_register", libs);

  // IOModule
  gidLink(cast(void**)&g_io_module_get_type, "g_io_module_get_type", libs);
  gidLink(cast(void**)&g_io_module_new, "g_io_module_new", libs);
  gidLink(cast(void**)&g_io_module_query, "g_io_module_query", libs);
  gidLink(cast(void**)&g_io_module_load, "g_io_module_load", libs);
  gidLink(cast(void**)&g_io_module_unload, "g_io_module_unload", libs);

  // IOModuleScope
  gidLink(cast(void**)&g_io_module_scope_block, "g_io_module_scope_block", libs);
  gidLink(cast(void**)&g_io_module_scope_free, "g_io_module_scope_free", libs);
  gidLink(cast(void**)&g_io_module_scope_new, "g_io_module_scope_new", libs);

  // IOSchedulerJob
  gidLink(cast(void**)&g_io_scheduler_job_send_to_mainloop, "g_io_scheduler_job_send_to_mainloop", libs);
  gidLink(cast(void**)&g_io_scheduler_job_send_to_mainloop_async, "g_io_scheduler_job_send_to_mainloop_async", libs);

  // IOStream
  gidLink(cast(void**)&g_io_stream_get_type, "g_io_stream_get_type", libs);
  gidLink(cast(void**)&g_io_stream_splice_finish, "g_io_stream_splice_finish", libs);
  gidLink(cast(void**)&g_io_stream_clear_pending, "g_io_stream_clear_pending", libs);
  gidLink(cast(void**)&g_io_stream_close, "g_io_stream_close", libs);
  gidLink(cast(void**)&g_io_stream_close_async, "g_io_stream_close_async", libs);
  gidLink(cast(void**)&g_io_stream_close_finish, "g_io_stream_close_finish", libs);
  gidLink(cast(void**)&g_io_stream_get_input_stream, "g_io_stream_get_input_stream", libs);
  gidLink(cast(void**)&g_io_stream_get_output_stream, "g_io_stream_get_output_stream", libs);
  gidLink(cast(void**)&g_io_stream_has_pending, "g_io_stream_has_pending", libs);
  gidLink(cast(void**)&g_io_stream_is_closed, "g_io_stream_is_closed", libs);
  gidLink(cast(void**)&g_io_stream_set_pending, "g_io_stream_set_pending", libs);
  gidLink(cast(void**)&g_io_stream_splice_async, "g_io_stream_splice_async", libs);

  // IPTosMessage
  gidLink(cast(void**)&g_ip_tos_message_get_type, "g_ip_tos_message_get_type", libs);
  gidLink(cast(void**)&g_ip_tos_message_new, "g_ip_tos_message_new", libs);
  gidLink(cast(void**)&g_ip_tos_message_get_dscp, "g_ip_tos_message_get_dscp", libs);
  gidLink(cast(void**)&g_ip_tos_message_get_ecn, "g_ip_tos_message_get_ecn", libs);

  // IPv6TclassMessage
  gidLink(cast(void**)&g_ipv6_tclass_message_get_type, "g_ipv6_tclass_message_get_type", libs);
  gidLink(cast(void**)&g_ipv6_tclass_message_new, "g_ipv6_tclass_message_new", libs);
  gidLink(cast(void**)&g_ipv6_tclass_message_get_dscp, "g_ipv6_tclass_message_get_dscp", libs);
  gidLink(cast(void**)&g_ipv6_tclass_message_get_ecn, "g_ipv6_tclass_message_get_ecn", libs);

  // Icon
  gidLink(cast(void**)&g_icon_get_type, "g_icon_get_type", libs);
  gidLink(cast(void**)&g_icon_deserialize, "g_icon_deserialize", libs);
  gidLink(cast(void**)&g_icon_new_for_string, "g_icon_new_for_string", libs);
  gidLink(cast(void**)&g_icon_equal, "g_icon_equal", libs);
  gidLink(cast(void**)&g_icon_hash, "g_icon_hash", libs);
  gidLink(cast(void**)&g_icon_serialize, "g_icon_serialize", libs);
  gidLink(cast(void**)&g_icon_to_string, "g_icon_to_string", libs);

  // InetAddress
  gidLink(cast(void**)&g_inet_address_get_type, "g_inet_address_get_type", libs);
  gidLink(cast(void**)&g_inet_address_new_any, "g_inet_address_new_any", libs);
  gidLink(cast(void**)&g_inet_address_new_from_bytes, "g_inet_address_new_from_bytes", libs);
  gidLink(cast(void**)&g_inet_address_new_from_bytes_with_ipv6_info, "g_inet_address_new_from_bytes_with_ipv6_info", libs);
  gidLink(cast(void**)&g_inet_address_new_from_string, "g_inet_address_new_from_string", libs);
  gidLink(cast(void**)&g_inet_address_new_loopback, "g_inet_address_new_loopback", libs);
  gidLink(cast(void**)&g_inet_address_equal, "g_inet_address_equal", libs);
  gidLink(cast(void**)&g_inet_address_get_family, "g_inet_address_get_family", libs);
  gidLink(cast(void**)&g_inet_address_get_flowinfo, "g_inet_address_get_flowinfo", libs);
  gidLink(cast(void**)&g_inet_address_get_is_any, "g_inet_address_get_is_any", libs);
  gidLink(cast(void**)&g_inet_address_get_is_link_local, "g_inet_address_get_is_link_local", libs);
  gidLink(cast(void**)&g_inet_address_get_is_loopback, "g_inet_address_get_is_loopback", libs);
  gidLink(cast(void**)&g_inet_address_get_is_mc_global, "g_inet_address_get_is_mc_global", libs);
  gidLink(cast(void**)&g_inet_address_get_is_mc_link_local, "g_inet_address_get_is_mc_link_local", libs);
  gidLink(cast(void**)&g_inet_address_get_is_mc_node_local, "g_inet_address_get_is_mc_node_local", libs);
  gidLink(cast(void**)&g_inet_address_get_is_mc_org_local, "g_inet_address_get_is_mc_org_local", libs);
  gidLink(cast(void**)&g_inet_address_get_is_mc_site_local, "g_inet_address_get_is_mc_site_local", libs);
  gidLink(cast(void**)&g_inet_address_get_is_multicast, "g_inet_address_get_is_multicast", libs);
  gidLink(cast(void**)&g_inet_address_get_is_site_local, "g_inet_address_get_is_site_local", libs);
  gidLink(cast(void**)&g_inet_address_get_native_size, "g_inet_address_get_native_size", libs);
  gidLink(cast(void**)&g_inet_address_get_scope_id, "g_inet_address_get_scope_id", libs);
  gidLink(cast(void**)&g_inet_address_to_bytes, "g_inet_address_to_bytes", libs);
  gidLink(cast(void**)&g_inet_address_to_string, "g_inet_address_to_string", libs);

  // InetAddressMask
  gidLink(cast(void**)&g_inet_address_mask_get_type, "g_inet_address_mask_get_type", libs);
  gidLink(cast(void**)&g_inet_address_mask_new, "g_inet_address_mask_new", libs);
  gidLink(cast(void**)&g_inet_address_mask_new_from_string, "g_inet_address_mask_new_from_string", libs);
  gidLink(cast(void**)&g_inet_address_mask_equal, "g_inet_address_mask_equal", libs);
  gidLink(cast(void**)&g_inet_address_mask_get_address, "g_inet_address_mask_get_address", libs);
  gidLink(cast(void**)&g_inet_address_mask_get_family, "g_inet_address_mask_get_family", libs);
  gidLink(cast(void**)&g_inet_address_mask_get_length, "g_inet_address_mask_get_length", libs);
  gidLink(cast(void**)&g_inet_address_mask_matches, "g_inet_address_mask_matches", libs);
  gidLink(cast(void**)&g_inet_address_mask_to_string, "g_inet_address_mask_to_string", libs);

  // InetSocketAddress
  gidLink(cast(void**)&g_inet_socket_address_get_type, "g_inet_socket_address_get_type", libs);
  gidLink(cast(void**)&g_inet_socket_address_new, "g_inet_socket_address_new", libs);
  gidLink(cast(void**)&g_inet_socket_address_new_from_string, "g_inet_socket_address_new_from_string", libs);
  gidLink(cast(void**)&g_inet_socket_address_get_address, "g_inet_socket_address_get_address", libs);
  gidLink(cast(void**)&g_inet_socket_address_get_flowinfo, "g_inet_socket_address_get_flowinfo", libs);
  gidLink(cast(void**)&g_inet_socket_address_get_port, "g_inet_socket_address_get_port", libs);
  gidLink(cast(void**)&g_inet_socket_address_get_scope_id, "g_inet_socket_address_get_scope_id", libs);

  // Initable
  gidLink(cast(void**)&g_initable_get_type, "g_initable_get_type", libs);
  gidLink(cast(void**)&g_initable_new, "g_initable_new", libs);
  gidLink(cast(void**)&g_initable_new_valist, "g_initable_new_valist", libs);
  gidLink(cast(void**)&g_initable_newv, "g_initable_newv", libs);
  gidLink(cast(void**)&g_initable_init, "g_initable_init", libs);

  // InputStream
  gidLink(cast(void**)&g_input_stream_get_type, "g_input_stream_get_type", libs);
  gidLink(cast(void**)&g_input_stream_clear_pending, "g_input_stream_clear_pending", libs);
  gidLink(cast(void**)&g_input_stream_close, "g_input_stream_close", libs);
  gidLink(cast(void**)&g_input_stream_close_async, "g_input_stream_close_async", libs);
  gidLink(cast(void**)&g_input_stream_close_finish, "g_input_stream_close_finish", libs);
  gidLink(cast(void**)&g_input_stream_has_pending, "g_input_stream_has_pending", libs);
  gidLink(cast(void**)&g_input_stream_is_closed, "g_input_stream_is_closed", libs);
  gidLink(cast(void**)&g_input_stream_read, "g_input_stream_read", libs);
  gidLink(cast(void**)&g_input_stream_read_all, "g_input_stream_read_all", libs);
  gidLink(cast(void**)&g_input_stream_read_all_async, "g_input_stream_read_all_async", libs);
  gidLink(cast(void**)&g_input_stream_read_all_finish, "g_input_stream_read_all_finish", libs);
  gidLink(cast(void**)&g_input_stream_read_async, "g_input_stream_read_async", libs);
  gidLink(cast(void**)&g_input_stream_read_bytes, "g_input_stream_read_bytes", libs);
  gidLink(cast(void**)&g_input_stream_read_bytes_async, "g_input_stream_read_bytes_async", libs);
  gidLink(cast(void**)&g_input_stream_read_bytes_finish, "g_input_stream_read_bytes_finish", libs);
  gidLink(cast(void**)&g_input_stream_read_finish, "g_input_stream_read_finish", libs);
  gidLink(cast(void**)&g_input_stream_set_pending, "g_input_stream_set_pending", libs);
  gidLink(cast(void**)&g_input_stream_skip, "g_input_stream_skip", libs);
  gidLink(cast(void**)&g_input_stream_skip_async, "g_input_stream_skip_async", libs);
  gidLink(cast(void**)&g_input_stream_skip_finish, "g_input_stream_skip_finish", libs);

  // ListModel
  gidLink(cast(void**)&g_list_model_get_type, "g_list_model_get_type", libs);
  gidLink(cast(void**)&g_list_model_get_item, "g_list_model_get_item", libs);
  gidLink(cast(void**)&g_list_model_get_item_type, "g_list_model_get_item_type", libs);
  gidLink(cast(void**)&g_list_model_get_n_items, "g_list_model_get_n_items", libs);
  gidLink(cast(void**)&g_list_model_get_object, "g_list_model_get_object", libs);
  gidLink(cast(void**)&g_list_model_items_changed, "g_list_model_items_changed", libs);

  // ListStore
  gidLink(cast(void**)&g_list_store_get_type, "g_list_store_get_type", libs);
  gidLink(cast(void**)&g_list_store_new, "g_list_store_new", libs);
  gidLink(cast(void**)&g_list_store_append, "g_list_store_append", libs);
  gidLink(cast(void**)&g_list_store_find, "g_list_store_find", libs);
  gidLink(cast(void**)&g_list_store_find_with_equal_func, "g_list_store_find_with_equal_func", libs);
  gidLink(cast(void**)&g_list_store_find_with_equal_func_full, "g_list_store_find_with_equal_func_full", libs);
  gidLink(cast(void**)&g_list_store_insert, "g_list_store_insert", libs);
  gidLink(cast(void**)&g_list_store_insert_sorted, "g_list_store_insert_sorted", libs);
  gidLink(cast(void**)&g_list_store_remove, "g_list_store_remove", libs);
  gidLink(cast(void**)&g_list_store_remove_all, "g_list_store_remove_all", libs);
  gidLink(cast(void**)&g_list_store_sort, "g_list_store_sort", libs);
  gidLink(cast(void**)&g_list_store_splice, "g_list_store_splice", libs);

  // LoadableIcon
  gidLink(cast(void**)&g_loadable_icon_get_type, "g_loadable_icon_get_type", libs);
  gidLink(cast(void**)&g_loadable_icon_load, "g_loadable_icon_load", libs);
  gidLink(cast(void**)&g_loadable_icon_load_async, "g_loadable_icon_load_async", libs);
  gidLink(cast(void**)&g_loadable_icon_load_finish, "g_loadable_icon_load_finish", libs);

  // MemoryInputStream
  gidLink(cast(void**)&g_memory_input_stream_get_type, "g_memory_input_stream_get_type", libs);
  gidLink(cast(void**)&g_memory_input_stream_new, "g_memory_input_stream_new", libs);
  gidLink(cast(void**)&g_memory_input_stream_new_from_bytes, "g_memory_input_stream_new_from_bytes", libs);
  gidLink(cast(void**)&g_memory_input_stream_new_from_data, "g_memory_input_stream_new_from_data", libs);
  gidLink(cast(void**)&g_memory_input_stream_add_bytes, "g_memory_input_stream_add_bytes", libs);
  gidLink(cast(void**)&g_memory_input_stream_add_data, "g_memory_input_stream_add_data", libs);

  // MemoryMonitor
  gidLink(cast(void**)&g_memory_monitor_get_type, "g_memory_monitor_get_type", libs);
  gidLink(cast(void**)&g_memory_monitor_dup_default, "g_memory_monitor_dup_default", libs);

  // MemoryOutputStream
  gidLink(cast(void**)&g_memory_output_stream_get_type, "g_memory_output_stream_get_type", libs);
  gidLink(cast(void**)&g_memory_output_stream_new, "g_memory_output_stream_new", libs);
  gidLink(cast(void**)&g_memory_output_stream_new_resizable, "g_memory_output_stream_new_resizable", libs);
  gidLink(cast(void**)&g_memory_output_stream_get_data, "g_memory_output_stream_get_data", libs);
  gidLink(cast(void**)&g_memory_output_stream_get_data_size, "g_memory_output_stream_get_data_size", libs);
  gidLink(cast(void**)&g_memory_output_stream_get_size, "g_memory_output_stream_get_size", libs);
  gidLink(cast(void**)&g_memory_output_stream_steal_as_bytes, "g_memory_output_stream_steal_as_bytes", libs);
  gidLink(cast(void**)&g_memory_output_stream_steal_data, "g_memory_output_stream_steal_data", libs);

  // Menu
  gidLink(cast(void**)&g_menu_get_type, "g_menu_get_type", libs);
  gidLink(cast(void**)&g_menu_new, "g_menu_new", libs);
  gidLink(cast(void**)&g_menu_append, "g_menu_append", libs);
  gidLink(cast(void**)&g_menu_append_item, "g_menu_append_item", libs);
  gidLink(cast(void**)&g_menu_append_section, "g_menu_append_section", libs);
  gidLink(cast(void**)&g_menu_append_submenu, "g_menu_append_submenu", libs);
  gidLink(cast(void**)&g_menu_freeze, "g_menu_freeze", libs);
  gidLink(cast(void**)&g_menu_insert, "g_menu_insert", libs);
  gidLink(cast(void**)&g_menu_insert_item, "g_menu_insert_item", libs);
  gidLink(cast(void**)&g_menu_insert_section, "g_menu_insert_section", libs);
  gidLink(cast(void**)&g_menu_insert_submenu, "g_menu_insert_submenu", libs);
  gidLink(cast(void**)&g_menu_prepend, "g_menu_prepend", libs);
  gidLink(cast(void**)&g_menu_prepend_item, "g_menu_prepend_item", libs);
  gidLink(cast(void**)&g_menu_prepend_section, "g_menu_prepend_section", libs);
  gidLink(cast(void**)&g_menu_prepend_submenu, "g_menu_prepend_submenu", libs);
  gidLink(cast(void**)&g_menu_remove, "g_menu_remove", libs);
  gidLink(cast(void**)&g_menu_remove_all, "g_menu_remove_all", libs);

  // MenuAttributeIter
  gidLink(cast(void**)&g_menu_attribute_iter_get_type, "g_menu_attribute_iter_get_type", libs);
  gidLink(cast(void**)&g_menu_attribute_iter_get_name, "g_menu_attribute_iter_get_name", libs);
  gidLink(cast(void**)&g_menu_attribute_iter_get_next, "g_menu_attribute_iter_get_next", libs);
  gidLink(cast(void**)&g_menu_attribute_iter_get_value, "g_menu_attribute_iter_get_value", libs);
  gidLink(cast(void**)&g_menu_attribute_iter_next, "g_menu_attribute_iter_next", libs);

  // MenuItem
  gidLink(cast(void**)&g_menu_item_get_type, "g_menu_item_get_type", libs);
  gidLink(cast(void**)&g_menu_item_new, "g_menu_item_new", libs);
  gidLink(cast(void**)&g_menu_item_new_from_model, "g_menu_item_new_from_model", libs);
  gidLink(cast(void**)&g_menu_item_new_section, "g_menu_item_new_section", libs);
  gidLink(cast(void**)&g_menu_item_new_submenu, "g_menu_item_new_submenu", libs);
  gidLink(cast(void**)&g_menu_item_get_attribute, "g_menu_item_get_attribute", libs);
  gidLink(cast(void**)&g_menu_item_get_attribute_value, "g_menu_item_get_attribute_value", libs);
  gidLink(cast(void**)&g_menu_item_get_link, "g_menu_item_get_link", libs);
  gidLink(cast(void**)&g_menu_item_set_action_and_target, "g_menu_item_set_action_and_target", libs);
  gidLink(cast(void**)&g_menu_item_set_action_and_target_value, "g_menu_item_set_action_and_target_value", libs);
  gidLink(cast(void**)&g_menu_item_set_attribute, "g_menu_item_set_attribute", libs);
  gidLink(cast(void**)&g_menu_item_set_attribute_value, "g_menu_item_set_attribute_value", libs);
  gidLink(cast(void**)&g_menu_item_set_detailed_action, "g_menu_item_set_detailed_action", libs);
  gidLink(cast(void**)&g_menu_item_set_icon, "g_menu_item_set_icon", libs);
  gidLink(cast(void**)&g_menu_item_set_label, "g_menu_item_set_label", libs);
  gidLink(cast(void**)&g_menu_item_set_link, "g_menu_item_set_link", libs);
  gidLink(cast(void**)&g_menu_item_set_section, "g_menu_item_set_section", libs);
  gidLink(cast(void**)&g_menu_item_set_submenu, "g_menu_item_set_submenu", libs);

  // MenuLinkIter
  gidLink(cast(void**)&g_menu_link_iter_get_type, "g_menu_link_iter_get_type", libs);
  gidLink(cast(void**)&g_menu_link_iter_get_name, "g_menu_link_iter_get_name", libs);
  gidLink(cast(void**)&g_menu_link_iter_get_next, "g_menu_link_iter_get_next", libs);
  gidLink(cast(void**)&g_menu_link_iter_get_value, "g_menu_link_iter_get_value", libs);
  gidLink(cast(void**)&g_menu_link_iter_next, "g_menu_link_iter_next", libs);

  // MenuModel
  gidLink(cast(void**)&g_menu_model_get_type, "g_menu_model_get_type", libs);
  gidLink(cast(void**)&g_menu_model_get_item_attribute, "g_menu_model_get_item_attribute", libs);
  gidLink(cast(void**)&g_menu_model_get_item_attribute_value, "g_menu_model_get_item_attribute_value", libs);
  gidLink(cast(void**)&g_menu_model_get_item_link, "g_menu_model_get_item_link", libs);
  gidLink(cast(void**)&g_menu_model_get_n_items, "g_menu_model_get_n_items", libs);
  gidLink(cast(void**)&g_menu_model_is_mutable, "g_menu_model_is_mutable", libs);
  gidLink(cast(void**)&g_menu_model_items_changed, "g_menu_model_items_changed", libs);
  gidLink(cast(void**)&g_menu_model_iterate_item_attributes, "g_menu_model_iterate_item_attributes", libs);
  gidLink(cast(void**)&g_menu_model_iterate_item_links, "g_menu_model_iterate_item_links", libs);

  // Mount
  gidLink(cast(void**)&g_mount_get_type, "g_mount_get_type", libs);
  gidLink(cast(void**)&g_mount_can_eject, "g_mount_can_eject", libs);
  gidLink(cast(void**)&g_mount_can_unmount, "g_mount_can_unmount", libs);
  gidLink(cast(void**)&g_mount_eject, "g_mount_eject", libs);
  gidLink(cast(void**)&g_mount_eject_finish, "g_mount_eject_finish", libs);
  gidLink(cast(void**)&g_mount_eject_with_operation, "g_mount_eject_with_operation", libs);
  gidLink(cast(void**)&g_mount_eject_with_operation_finish, "g_mount_eject_with_operation_finish", libs);
  gidLink(cast(void**)&g_mount_get_default_location, "g_mount_get_default_location", libs);
  gidLink(cast(void**)&g_mount_get_drive, "g_mount_get_drive", libs);
  gidLink(cast(void**)&g_mount_get_icon, "g_mount_get_icon", libs);
  gidLink(cast(void**)&g_mount_get_name, "g_mount_get_name", libs);
  gidLink(cast(void**)&g_mount_get_root, "g_mount_get_root", libs);
  gidLink(cast(void**)&g_mount_get_sort_key, "g_mount_get_sort_key", libs);
  gidLink(cast(void**)&g_mount_get_symbolic_icon, "g_mount_get_symbolic_icon", libs);
  gidLink(cast(void**)&g_mount_get_uuid, "g_mount_get_uuid", libs);
  gidLink(cast(void**)&g_mount_get_volume, "g_mount_get_volume", libs);
  gidLink(cast(void**)&g_mount_guess_content_type, "g_mount_guess_content_type", libs);
  gidLink(cast(void**)&g_mount_guess_content_type_finish, "g_mount_guess_content_type_finish", libs);
  gidLink(cast(void**)&g_mount_guess_content_type_sync, "g_mount_guess_content_type_sync", libs);
  gidLink(cast(void**)&g_mount_is_shadowed, "g_mount_is_shadowed", libs);
  gidLink(cast(void**)&g_mount_remount, "g_mount_remount", libs);
  gidLink(cast(void**)&g_mount_remount_finish, "g_mount_remount_finish", libs);
  gidLink(cast(void**)&g_mount_shadow, "g_mount_shadow", libs);
  gidLink(cast(void**)&g_mount_unmount, "g_mount_unmount", libs);
  gidLink(cast(void**)&g_mount_unmount_finish, "g_mount_unmount_finish", libs);
  gidLink(cast(void**)&g_mount_unmount_with_operation, "g_mount_unmount_with_operation", libs);
  gidLink(cast(void**)&g_mount_unmount_with_operation_finish, "g_mount_unmount_with_operation_finish", libs);
  gidLink(cast(void**)&g_mount_unshadow, "g_mount_unshadow", libs);

  // MountOperation
  gidLink(cast(void**)&g_mount_operation_get_type, "g_mount_operation_get_type", libs);
  gidLink(cast(void**)&g_mount_operation_new, "g_mount_operation_new", libs);
  gidLink(cast(void**)&g_mount_operation_get_anonymous, "g_mount_operation_get_anonymous", libs);
  gidLink(cast(void**)&g_mount_operation_get_choice, "g_mount_operation_get_choice", libs);
  gidLink(cast(void**)&g_mount_operation_get_domain, "g_mount_operation_get_domain", libs);
  gidLink(cast(void**)&g_mount_operation_get_is_tcrypt_hidden_volume, "g_mount_operation_get_is_tcrypt_hidden_volume", libs);
  gidLink(cast(void**)&g_mount_operation_get_is_tcrypt_system_volume, "g_mount_operation_get_is_tcrypt_system_volume", libs);
  gidLink(cast(void**)&g_mount_operation_get_password, "g_mount_operation_get_password", libs);
  gidLink(cast(void**)&g_mount_operation_get_password_save, "g_mount_operation_get_password_save", libs);
  gidLink(cast(void**)&g_mount_operation_get_pim, "g_mount_operation_get_pim", libs);
  gidLink(cast(void**)&g_mount_operation_get_username, "g_mount_operation_get_username", libs);
  gidLink(cast(void**)&g_mount_operation_reply, "g_mount_operation_reply", libs);
  gidLink(cast(void**)&g_mount_operation_set_anonymous, "g_mount_operation_set_anonymous", libs);
  gidLink(cast(void**)&g_mount_operation_set_choice, "g_mount_operation_set_choice", libs);
  gidLink(cast(void**)&g_mount_operation_set_domain, "g_mount_operation_set_domain", libs);
  gidLink(cast(void**)&g_mount_operation_set_is_tcrypt_hidden_volume, "g_mount_operation_set_is_tcrypt_hidden_volume", libs);
  gidLink(cast(void**)&g_mount_operation_set_is_tcrypt_system_volume, "g_mount_operation_set_is_tcrypt_system_volume", libs);
  gidLink(cast(void**)&g_mount_operation_set_password, "g_mount_operation_set_password", libs);
  gidLink(cast(void**)&g_mount_operation_set_password_save, "g_mount_operation_set_password_save", libs);
  gidLink(cast(void**)&g_mount_operation_set_pim, "g_mount_operation_set_pim", libs);
  gidLink(cast(void**)&g_mount_operation_set_username, "g_mount_operation_set_username", libs);

  // NativeSocketAddress
  gidLink(cast(void**)&g_native_socket_address_get_type, "g_native_socket_address_get_type", libs);
  gidLink(cast(void**)&g_native_socket_address_new, "g_native_socket_address_new", libs);

  // NativeVolumeMonitor
  gidLink(cast(void**)&g_native_volume_monitor_get_type, "g_native_volume_monitor_get_type", libs);

  // NetworkAddress
  gidLink(cast(void**)&g_network_address_get_type, "g_network_address_get_type", libs);
  gidLink(cast(void**)&g_network_address_new, "g_network_address_new", libs);
  gidLink(cast(void**)&g_network_address_new_loopback, "g_network_address_new_loopback", libs);
  gidLink(cast(void**)&g_network_address_parse, "g_network_address_parse", libs);
  gidLink(cast(void**)&g_network_address_parse_uri, "g_network_address_parse_uri", libs);
  gidLink(cast(void**)&g_network_address_get_hostname, "g_network_address_get_hostname", libs);
  gidLink(cast(void**)&g_network_address_get_port, "g_network_address_get_port", libs);
  gidLink(cast(void**)&g_network_address_get_scheme, "g_network_address_get_scheme", libs);

  // NetworkMonitor
  gidLink(cast(void**)&g_network_monitor_get_type, "g_network_monitor_get_type", libs);
  gidLink(cast(void**)&g_network_monitor_get_default, "g_network_monitor_get_default", libs);
  gidLink(cast(void**)&g_network_monitor_can_reach, "g_network_monitor_can_reach", libs);
  gidLink(cast(void**)&g_network_monitor_can_reach_async, "g_network_monitor_can_reach_async", libs);
  gidLink(cast(void**)&g_network_monitor_can_reach_finish, "g_network_monitor_can_reach_finish", libs);
  gidLink(cast(void**)&g_network_monitor_get_connectivity, "g_network_monitor_get_connectivity", libs);
  gidLink(cast(void**)&g_network_monitor_get_network_available, "g_network_monitor_get_network_available", libs);
  gidLink(cast(void**)&g_network_monitor_get_network_metered, "g_network_monitor_get_network_metered", libs);

  // NetworkService
  gidLink(cast(void**)&g_network_service_get_type, "g_network_service_get_type", libs);
  gidLink(cast(void**)&g_network_service_new, "g_network_service_new", libs);
  gidLink(cast(void**)&g_network_service_get_domain, "g_network_service_get_domain", libs);
  gidLink(cast(void**)&g_network_service_get_protocol, "g_network_service_get_protocol", libs);
  gidLink(cast(void**)&g_network_service_get_scheme, "g_network_service_get_scheme", libs);
  gidLink(cast(void**)&g_network_service_get_service, "g_network_service_get_service", libs);
  gidLink(cast(void**)&g_network_service_set_scheme, "g_network_service_set_scheme", libs);

  // Notification
  gidLink(cast(void**)&g_notification_get_type, "g_notification_get_type", libs);
  gidLink(cast(void**)&g_notification_new, "g_notification_new", libs);
  gidLink(cast(void**)&g_notification_add_button, "g_notification_add_button", libs);
  gidLink(cast(void**)&g_notification_add_button_with_target, "g_notification_add_button_with_target", libs);
  gidLink(cast(void**)&g_notification_add_button_with_target_value, "g_notification_add_button_with_target_value", libs);
  gidLink(cast(void**)&g_notification_set_body, "g_notification_set_body", libs);
  gidLink(cast(void**)&g_notification_set_category, "g_notification_set_category", libs);
  gidLink(cast(void**)&g_notification_set_default_action, "g_notification_set_default_action", libs);
  gidLink(cast(void**)&g_notification_set_default_action_and_target, "g_notification_set_default_action_and_target", libs);
  gidLink(cast(void**)&g_notification_set_default_action_and_target_value, "g_notification_set_default_action_and_target_value", libs);
  gidLink(cast(void**)&g_notification_set_icon, "g_notification_set_icon", libs);
  gidLink(cast(void**)&g_notification_set_priority, "g_notification_set_priority", libs);
  gidLink(cast(void**)&g_notification_set_title, "g_notification_set_title", libs);
  gidLink(cast(void**)&g_notification_set_urgent, "g_notification_set_urgent", libs);

  // OutputStream
  gidLink(cast(void**)&g_output_stream_get_type, "g_output_stream_get_type", libs);
  gidLink(cast(void**)&g_output_stream_clear_pending, "g_output_stream_clear_pending", libs);
  gidLink(cast(void**)&g_output_stream_close, "g_output_stream_close", libs);
  gidLink(cast(void**)&g_output_stream_close_async, "g_output_stream_close_async", libs);
  gidLink(cast(void**)&g_output_stream_close_finish, "g_output_stream_close_finish", libs);
  gidLink(cast(void**)&g_output_stream_flush, "g_output_stream_flush", libs);
  gidLink(cast(void**)&g_output_stream_flush_async, "g_output_stream_flush_async", libs);
  gidLink(cast(void**)&g_output_stream_flush_finish, "g_output_stream_flush_finish", libs);
  gidLink(cast(void**)&g_output_stream_has_pending, "g_output_stream_has_pending", libs);
  gidLink(cast(void**)&g_output_stream_is_closed, "g_output_stream_is_closed", libs);
  gidLink(cast(void**)&g_output_stream_is_closing, "g_output_stream_is_closing", libs);
  gidLink(cast(void**)&g_output_stream_printf, "g_output_stream_printf", libs);
  gidLink(cast(void**)&g_output_stream_set_pending, "g_output_stream_set_pending", libs);
  gidLink(cast(void**)&g_output_stream_splice, "g_output_stream_splice", libs);
  gidLink(cast(void**)&g_output_stream_splice_async, "g_output_stream_splice_async", libs);
  gidLink(cast(void**)&g_output_stream_splice_finish, "g_output_stream_splice_finish", libs);
  gidLink(cast(void**)&g_output_stream_vprintf, "g_output_stream_vprintf", libs);
  gidLink(cast(void**)&g_output_stream_write, "g_output_stream_write", libs);
  gidLink(cast(void**)&g_output_stream_write_all, "g_output_stream_write_all", libs);
  gidLink(cast(void**)&g_output_stream_write_all_async, "g_output_stream_write_all_async", libs);
  gidLink(cast(void**)&g_output_stream_write_all_finish, "g_output_stream_write_all_finish", libs);
  gidLink(cast(void**)&g_output_stream_write_async, "g_output_stream_write_async", libs);
  gidLink(cast(void**)&g_output_stream_write_bytes, "g_output_stream_write_bytes", libs);
  gidLink(cast(void**)&g_output_stream_write_bytes_async, "g_output_stream_write_bytes_async", libs);
  gidLink(cast(void**)&g_output_stream_write_bytes_finish, "g_output_stream_write_bytes_finish", libs);
  gidLink(cast(void**)&g_output_stream_write_finish, "g_output_stream_write_finish", libs);
  gidLink(cast(void**)&g_output_stream_writev, "g_output_stream_writev", libs);
  gidLink(cast(void**)&g_output_stream_writev_all, "g_output_stream_writev_all", libs);
  gidLink(cast(void**)&g_output_stream_writev_all_async, "g_output_stream_writev_all_async", libs);
  gidLink(cast(void**)&g_output_stream_writev_all_finish, "g_output_stream_writev_all_finish", libs);
  gidLink(cast(void**)&g_output_stream_writev_async, "g_output_stream_writev_async", libs);
  gidLink(cast(void**)&g_output_stream_writev_finish, "g_output_stream_writev_finish", libs);

  // Permission
  gidLink(cast(void**)&g_permission_get_type, "g_permission_get_type", libs);
  gidLink(cast(void**)&g_permission_acquire, "g_permission_acquire", libs);
  gidLink(cast(void**)&g_permission_acquire_async, "g_permission_acquire_async", libs);
  gidLink(cast(void**)&g_permission_acquire_finish, "g_permission_acquire_finish", libs);
  gidLink(cast(void**)&g_permission_get_allowed, "g_permission_get_allowed", libs);
  gidLink(cast(void**)&g_permission_get_can_acquire, "g_permission_get_can_acquire", libs);
  gidLink(cast(void**)&g_permission_get_can_release, "g_permission_get_can_release", libs);
  gidLink(cast(void**)&g_permission_impl_update, "g_permission_impl_update", libs);
  gidLink(cast(void**)&g_permission_release, "g_permission_release", libs);
  gidLink(cast(void**)&g_permission_release_async, "g_permission_release_async", libs);
  gidLink(cast(void**)&g_permission_release_finish, "g_permission_release_finish", libs);

  // PollableInputStream
  gidLink(cast(void**)&g_pollable_input_stream_get_type, "g_pollable_input_stream_get_type", libs);
  gidLink(cast(void**)&g_pollable_input_stream_can_poll, "g_pollable_input_stream_can_poll", libs);
  gidLink(cast(void**)&g_pollable_input_stream_create_source, "g_pollable_input_stream_create_source", libs);
  gidLink(cast(void**)&g_pollable_input_stream_is_readable, "g_pollable_input_stream_is_readable", libs);
  gidLink(cast(void**)&g_pollable_input_stream_read_nonblocking, "g_pollable_input_stream_read_nonblocking", libs);

  // PollableOutputStream
  gidLink(cast(void**)&g_pollable_output_stream_get_type, "g_pollable_output_stream_get_type", libs);
  gidLink(cast(void**)&g_pollable_output_stream_can_poll, "g_pollable_output_stream_can_poll", libs);
  gidLink(cast(void**)&g_pollable_output_stream_create_source, "g_pollable_output_stream_create_source", libs);
  gidLink(cast(void**)&g_pollable_output_stream_is_writable, "g_pollable_output_stream_is_writable", libs);
  gidLink(cast(void**)&g_pollable_output_stream_write_nonblocking, "g_pollable_output_stream_write_nonblocking", libs);
  gidLink(cast(void**)&g_pollable_output_stream_writev_nonblocking, "g_pollable_output_stream_writev_nonblocking", libs);

  // PowerProfileMonitor
  gidLink(cast(void**)&g_power_profile_monitor_get_type, "g_power_profile_monitor_get_type", libs);
  gidLink(cast(void**)&g_power_profile_monitor_dup_default, "g_power_profile_monitor_dup_default", libs);
  gidLink(cast(void**)&g_power_profile_monitor_get_power_saver_enabled, "g_power_profile_monitor_get_power_saver_enabled", libs);

  // PropertyAction
  gidLink(cast(void**)&g_property_action_get_type, "g_property_action_get_type", libs);
  gidLink(cast(void**)&g_property_action_new, "g_property_action_new", libs);

  // Proxy
  gidLink(cast(void**)&g_proxy_get_type, "g_proxy_get_type", libs);
  gidLink(cast(void**)&g_proxy_get_default_for_protocol, "g_proxy_get_default_for_protocol", libs);
  gidLink(cast(void**)&g_proxy_connect, "g_proxy_connect", libs);
  gidLink(cast(void**)&g_proxy_connect_async, "g_proxy_connect_async", libs);
  gidLink(cast(void**)&g_proxy_connect_finish, "g_proxy_connect_finish", libs);
  gidLink(cast(void**)&g_proxy_supports_hostname, "g_proxy_supports_hostname", libs);

  // ProxyAddress
  gidLink(cast(void**)&g_proxy_address_get_type, "g_proxy_address_get_type", libs);
  gidLink(cast(void**)&g_proxy_address_new, "g_proxy_address_new", libs);
  gidLink(cast(void**)&g_proxy_address_get_destination_hostname, "g_proxy_address_get_destination_hostname", libs);
  gidLink(cast(void**)&g_proxy_address_get_destination_port, "g_proxy_address_get_destination_port", libs);
  gidLink(cast(void**)&g_proxy_address_get_destination_protocol, "g_proxy_address_get_destination_protocol", libs);
  gidLink(cast(void**)&g_proxy_address_get_password, "g_proxy_address_get_password", libs);
  gidLink(cast(void**)&g_proxy_address_get_protocol, "g_proxy_address_get_protocol", libs);
  gidLink(cast(void**)&g_proxy_address_get_uri, "g_proxy_address_get_uri", libs);
  gidLink(cast(void**)&g_proxy_address_get_username, "g_proxy_address_get_username", libs);

  // ProxyAddressEnumerator
  gidLink(cast(void**)&g_proxy_address_enumerator_get_type, "g_proxy_address_enumerator_get_type", libs);

  // ProxyResolver
  gidLink(cast(void**)&g_proxy_resolver_get_type, "g_proxy_resolver_get_type", libs);
  gidLink(cast(void**)&g_proxy_resolver_get_default, "g_proxy_resolver_get_default", libs);
  gidLink(cast(void**)&g_proxy_resolver_is_supported, "g_proxy_resolver_is_supported", libs);
  gidLink(cast(void**)&g_proxy_resolver_lookup, "g_proxy_resolver_lookup", libs);
  gidLink(cast(void**)&g_proxy_resolver_lookup_async, "g_proxy_resolver_lookup_async", libs);
  gidLink(cast(void**)&g_proxy_resolver_lookup_finish, "g_proxy_resolver_lookup_finish", libs);

  // RemoteActionGroup
  gidLink(cast(void**)&g_remote_action_group_get_type, "g_remote_action_group_get_type", libs);
  gidLink(cast(void**)&g_remote_action_group_activate_action_full, "g_remote_action_group_activate_action_full", libs);
  gidLink(cast(void**)&g_remote_action_group_change_action_state_full, "g_remote_action_group_change_action_state_full", libs);

  // Resolver
  gidLink(cast(void**)&g_resolver_get_type, "g_resolver_get_type", libs);
  gidLink(cast(void**)&g_resolver_free_addresses, "g_resolver_free_addresses", libs);
  gidLink(cast(void**)&g_resolver_free_targets, "g_resolver_free_targets", libs);
  gidLink(cast(void**)&g_resolver_get_default, "g_resolver_get_default", libs);
  gidLink(cast(void**)&g_resolver_get_timeout, "g_resolver_get_timeout", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_address, "g_resolver_lookup_by_address", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_address_async, "g_resolver_lookup_by_address_async", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_address_finish, "g_resolver_lookup_by_address_finish", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_name, "g_resolver_lookup_by_name", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_name_async, "g_resolver_lookup_by_name_async", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_name_finish, "g_resolver_lookup_by_name_finish", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_name_with_flags, "g_resolver_lookup_by_name_with_flags", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_name_with_flags_async, "g_resolver_lookup_by_name_with_flags_async", libs);
  gidLink(cast(void**)&g_resolver_lookup_by_name_with_flags_finish, "g_resolver_lookup_by_name_with_flags_finish", libs);
  gidLink(cast(void**)&g_resolver_lookup_records, "g_resolver_lookup_records", libs);
  gidLink(cast(void**)&g_resolver_lookup_records_async, "g_resolver_lookup_records_async", libs);
  gidLink(cast(void**)&g_resolver_lookup_records_finish, "g_resolver_lookup_records_finish", libs);
  gidLink(cast(void**)&g_resolver_lookup_service, "g_resolver_lookup_service", libs);
  gidLink(cast(void**)&g_resolver_lookup_service_async, "g_resolver_lookup_service_async", libs);
  gidLink(cast(void**)&g_resolver_lookup_service_finish, "g_resolver_lookup_service_finish", libs);
  gidLink(cast(void**)&g_resolver_set_default, "g_resolver_set_default", libs);
  gidLink(cast(void**)&g_resolver_set_timeout, "g_resolver_set_timeout", libs);

  // Resource
  gidLink(cast(void**)&g_resource_get_type, "g_resource_get_type", libs);
  gidLink(cast(void**)&g_resource_new_from_data, "g_resource_new_from_data", libs);
  gidLink(cast(void**)&g_resource_enumerate_children, "g_resource_enumerate_children", libs);
  gidLink(cast(void**)&g_resource_get_info, "g_resource_get_info", libs);
  gidLink(cast(void**)&g_resource_has_children, "g_resource_has_children", libs);
  gidLink(cast(void**)&g_resource_lookup_data, "g_resource_lookup_data", libs);
  gidLink(cast(void**)&g_resource_open_stream, "g_resource_open_stream", libs);
  gidLink(cast(void**)&g_resource_ref, "g_resource_ref", libs);
  gidLink(cast(void**)&g_resource_unref, "g_resource_unref", libs);
  gidLink(cast(void**)&g_resource_load, "g_resource_load", libs);

  // Seekable
  gidLink(cast(void**)&g_seekable_get_type, "g_seekable_get_type", libs);
  gidLink(cast(void**)&g_seekable_can_seek, "g_seekable_can_seek", libs);
  gidLink(cast(void**)&g_seekable_can_truncate, "g_seekable_can_truncate", libs);
  gidLink(cast(void**)&g_seekable_seek, "g_seekable_seek", libs);
  gidLink(cast(void**)&g_seekable_tell, "g_seekable_tell", libs);
  gidLink(cast(void**)&g_seekable_truncate, "g_seekable_truncate", libs);

  // Settings
  gidLink(cast(void**)&g_settings_get_type, "g_settings_get_type", libs);
  gidLink(cast(void**)&g_settings_new, "g_settings_new", libs);
  gidLink(cast(void**)&g_settings_new_full, "g_settings_new_full", libs);
  gidLink(cast(void**)&g_settings_new_with_backend, "g_settings_new_with_backend", libs);
  gidLink(cast(void**)&g_settings_new_with_backend_and_path, "g_settings_new_with_backend_and_path", libs);
  gidLink(cast(void**)&g_settings_new_with_path, "g_settings_new_with_path", libs);
  gidLink(cast(void**)&g_settings_list_relocatable_schemas, "g_settings_list_relocatable_schemas", libs);
  gidLink(cast(void**)&g_settings_list_schemas, "g_settings_list_schemas", libs);
  gidLink(cast(void**)&g_settings_sync, "g_settings_sync", libs);
  gidLink(cast(void**)&g_settings_unbind, "g_settings_unbind", libs);
  gidLink(cast(void**)&g_settings_apply, "g_settings_apply", libs);
  gidLink(cast(void**)&g_settings_bind, "g_settings_bind", libs);
  gidLink(cast(void**)&g_settings_bind_with_mapping, "g_settings_bind_with_mapping", libs);
  gidLink(cast(void**)&g_settings_bind_with_mapping_closures, "g_settings_bind_with_mapping_closures", libs);
  gidLink(cast(void**)&g_settings_bind_writable, "g_settings_bind_writable", libs);
  gidLink(cast(void**)&g_settings_create_action, "g_settings_create_action", libs);
  gidLink(cast(void**)&g_settings_delay, "g_settings_delay", libs);
  gidLink(cast(void**)&g_settings_get, "g_settings_get", libs);
  gidLink(cast(void**)&g_settings_get_boolean, "g_settings_get_boolean", libs);
  gidLink(cast(void**)&g_settings_get_child, "g_settings_get_child", libs);
  gidLink(cast(void**)&g_settings_get_default_value, "g_settings_get_default_value", libs);
  gidLink(cast(void**)&g_settings_get_double, "g_settings_get_double", libs);
  gidLink(cast(void**)&g_settings_get_enum, "g_settings_get_enum", libs);
  gidLink(cast(void**)&g_settings_get_flags, "g_settings_get_flags", libs);
  gidLink(cast(void**)&g_settings_get_has_unapplied, "g_settings_get_has_unapplied", libs);
  gidLink(cast(void**)&g_settings_get_int, "g_settings_get_int", libs);
  gidLink(cast(void**)&g_settings_get_int64, "g_settings_get_int64", libs);
  gidLink(cast(void**)&g_settings_get_mapped, "g_settings_get_mapped", libs);
  gidLink(cast(void**)&g_settings_get_range, "g_settings_get_range", libs);
  gidLink(cast(void**)&g_settings_get_string, "g_settings_get_string", libs);
  gidLink(cast(void**)&g_settings_get_strv, "g_settings_get_strv", libs);
  gidLink(cast(void**)&g_settings_get_uint, "g_settings_get_uint", libs);
  gidLink(cast(void**)&g_settings_get_uint64, "g_settings_get_uint64", libs);
  gidLink(cast(void**)&g_settings_get_user_value, "g_settings_get_user_value", libs);
  gidLink(cast(void**)&g_settings_get_value, "g_settings_get_value", libs);
  gidLink(cast(void**)&g_settings_is_writable, "g_settings_is_writable", libs);
  gidLink(cast(void**)&g_settings_list_children, "g_settings_list_children", libs);
  gidLink(cast(void**)&g_settings_list_keys, "g_settings_list_keys", libs);
  gidLink(cast(void**)&g_settings_range_check, "g_settings_range_check", libs);
  gidLink(cast(void**)&g_settings_reset, "g_settings_reset", libs);
  gidLink(cast(void**)&g_settings_revert, "g_settings_revert", libs);
  gidLink(cast(void**)&g_settings_set, "g_settings_set", libs);
  gidLink(cast(void**)&g_settings_set_boolean, "g_settings_set_boolean", libs);
  gidLink(cast(void**)&g_settings_set_double, "g_settings_set_double", libs);
  gidLink(cast(void**)&g_settings_set_enum, "g_settings_set_enum", libs);
  gidLink(cast(void**)&g_settings_set_flags, "g_settings_set_flags", libs);
  gidLink(cast(void**)&g_settings_set_int, "g_settings_set_int", libs);
  gidLink(cast(void**)&g_settings_set_int64, "g_settings_set_int64", libs);
  gidLink(cast(void**)&g_settings_set_string, "g_settings_set_string", libs);
  gidLink(cast(void**)&g_settings_set_strv, "g_settings_set_strv", libs);
  gidLink(cast(void**)&g_settings_set_uint, "g_settings_set_uint", libs);
  gidLink(cast(void**)&g_settings_set_uint64, "g_settings_set_uint64", libs);
  gidLink(cast(void**)&g_settings_set_value, "g_settings_set_value", libs);

  // SettingsBackend
  gidLink(cast(void**)&g_settings_backend_get_type, "g_settings_backend_get_type", libs);
  gidLink(cast(void**)&g_settings_backend_flatten_tree, "g_settings_backend_flatten_tree", libs);
  gidLink(cast(void**)&g_settings_backend_get_default, "g_settings_backend_get_default", libs);
  gidLink(cast(void**)&g_settings_backend_changed, "g_settings_backend_changed", libs);
  gidLink(cast(void**)&g_settings_backend_changed_tree, "g_settings_backend_changed_tree", libs);
  gidLink(cast(void**)&g_settings_backend_keys_changed, "g_settings_backend_keys_changed", libs);
  gidLink(cast(void**)&g_settings_backend_path_changed, "g_settings_backend_path_changed", libs);
  gidLink(cast(void**)&g_settings_backend_path_writable_changed, "g_settings_backend_path_writable_changed", libs);
  gidLink(cast(void**)&g_settings_backend_writable_changed, "g_settings_backend_writable_changed", libs);

  // SettingsSchema
  gidLink(cast(void**)&g_settings_schema_get_type, "g_settings_schema_get_type", libs);
  gidLink(cast(void**)&g_settings_schema_get_id, "g_settings_schema_get_id", libs);
  gidLink(cast(void**)&g_settings_schema_get_key, "g_settings_schema_get_key", libs);
  gidLink(cast(void**)&g_settings_schema_get_path, "g_settings_schema_get_path", libs);
  gidLink(cast(void**)&g_settings_schema_has_key, "g_settings_schema_has_key", libs);
  gidLink(cast(void**)&g_settings_schema_list_children, "g_settings_schema_list_children", libs);
  gidLink(cast(void**)&g_settings_schema_list_keys, "g_settings_schema_list_keys", libs);
  gidLink(cast(void**)&g_settings_schema_ref, "g_settings_schema_ref", libs);
  gidLink(cast(void**)&g_settings_schema_unref, "g_settings_schema_unref", libs);

  // SettingsSchemaKey
  gidLink(cast(void**)&g_settings_schema_key_get_type, "g_settings_schema_key_get_type", libs);
  gidLink(cast(void**)&g_settings_schema_key_get_default_value, "g_settings_schema_key_get_default_value", libs);
  gidLink(cast(void**)&g_settings_schema_key_get_description, "g_settings_schema_key_get_description", libs);
  gidLink(cast(void**)&g_settings_schema_key_get_name, "g_settings_schema_key_get_name", libs);
  gidLink(cast(void**)&g_settings_schema_key_get_range, "g_settings_schema_key_get_range", libs);
  gidLink(cast(void**)&g_settings_schema_key_get_summary, "g_settings_schema_key_get_summary", libs);
  gidLink(cast(void**)&g_settings_schema_key_get_value_type, "g_settings_schema_key_get_value_type", libs);
  gidLink(cast(void**)&g_settings_schema_key_range_check, "g_settings_schema_key_range_check", libs);
  gidLink(cast(void**)&g_settings_schema_key_ref, "g_settings_schema_key_ref", libs);
  gidLink(cast(void**)&g_settings_schema_key_unref, "g_settings_schema_key_unref", libs);

  // SettingsSchemaSource
  gidLink(cast(void**)&g_settings_schema_source_get_type, "g_settings_schema_source_get_type", libs);
  gidLink(cast(void**)&g_settings_schema_source_new_from_directory, "g_settings_schema_source_new_from_directory", libs);
  gidLink(cast(void**)&g_settings_schema_source_list_schemas, "g_settings_schema_source_list_schemas", libs);
  gidLink(cast(void**)&g_settings_schema_source_lookup, "g_settings_schema_source_lookup", libs);
  gidLink(cast(void**)&g_settings_schema_source_ref, "g_settings_schema_source_ref", libs);
  gidLink(cast(void**)&g_settings_schema_source_unref, "g_settings_schema_source_unref", libs);
  gidLink(cast(void**)&g_settings_schema_source_get_default, "g_settings_schema_source_get_default", libs);

  // SimpleAction
  gidLink(cast(void**)&g_simple_action_get_type, "g_simple_action_get_type", libs);
  gidLink(cast(void**)&g_simple_action_new, "g_simple_action_new", libs);
  gidLink(cast(void**)&g_simple_action_new_stateful, "g_simple_action_new_stateful", libs);
  gidLink(cast(void**)&g_simple_action_set_enabled, "g_simple_action_set_enabled", libs);
  gidLink(cast(void**)&g_simple_action_set_state, "g_simple_action_set_state", libs);
  gidLink(cast(void**)&g_simple_action_set_state_hint, "g_simple_action_set_state_hint", libs);

  // SimpleActionGroup
  gidLink(cast(void**)&g_simple_action_group_get_type, "g_simple_action_group_get_type", libs);
  gidLink(cast(void**)&g_simple_action_group_new, "g_simple_action_group_new", libs);
  gidLink(cast(void**)&g_simple_action_group_add_entries, "g_simple_action_group_add_entries", libs);
  gidLink(cast(void**)&g_simple_action_group_insert, "g_simple_action_group_insert", libs);
  gidLink(cast(void**)&g_simple_action_group_lookup, "g_simple_action_group_lookup", libs);
  gidLink(cast(void**)&g_simple_action_group_remove, "g_simple_action_group_remove", libs);

  // SimpleAsyncResult
  gidLink(cast(void**)&g_simple_async_result_get_type, "g_simple_async_result_get_type", libs);
  gidLink(cast(void**)&g_simple_async_result_new, "g_simple_async_result_new", libs);
  gidLink(cast(void**)&g_simple_async_result_new_error, "g_simple_async_result_new_error", libs);
  gidLink(cast(void**)&g_simple_async_result_new_from_error, "g_simple_async_result_new_from_error", libs);
  gidLink(cast(void**)&g_simple_async_result_new_take_error, "g_simple_async_result_new_take_error", libs);
  gidLink(cast(void**)&g_simple_async_result_is_valid, "g_simple_async_result_is_valid", libs);
  gidLink(cast(void**)&g_simple_async_result_complete, "g_simple_async_result_complete", libs);
  gidLink(cast(void**)&g_simple_async_result_complete_in_idle, "g_simple_async_result_complete_in_idle", libs);
  gidLink(cast(void**)&g_simple_async_result_get_op_res_gboolean, "g_simple_async_result_get_op_res_gboolean", libs);
  gidLink(cast(void**)&g_simple_async_result_get_op_res_gpointer, "g_simple_async_result_get_op_res_gpointer", libs);
  gidLink(cast(void**)&g_simple_async_result_get_op_res_gssize, "g_simple_async_result_get_op_res_gssize", libs);
  gidLink(cast(void**)&g_simple_async_result_get_source_tag, "g_simple_async_result_get_source_tag", libs);
  gidLink(cast(void**)&g_simple_async_result_propagate_error, "g_simple_async_result_propagate_error", libs);
  gidLink(cast(void**)&g_simple_async_result_run_in_thread, "g_simple_async_result_run_in_thread", libs);
  gidLink(cast(void**)&g_simple_async_result_set_check_cancellable, "g_simple_async_result_set_check_cancellable", libs);
  gidLink(cast(void**)&g_simple_async_result_set_error, "g_simple_async_result_set_error", libs);
  gidLink(cast(void**)&g_simple_async_result_set_error_va, "g_simple_async_result_set_error_va", libs);
  gidLink(cast(void**)&g_simple_async_result_set_from_error, "g_simple_async_result_set_from_error", libs);
  gidLink(cast(void**)&g_simple_async_result_set_handle_cancellation, "g_simple_async_result_set_handle_cancellation", libs);
  gidLink(cast(void**)&g_simple_async_result_set_op_res_gboolean, "g_simple_async_result_set_op_res_gboolean", libs);
  gidLink(cast(void**)&g_simple_async_result_set_op_res_gpointer, "g_simple_async_result_set_op_res_gpointer", libs);
  gidLink(cast(void**)&g_simple_async_result_set_op_res_gssize, "g_simple_async_result_set_op_res_gssize", libs);
  gidLink(cast(void**)&g_simple_async_result_take_error, "g_simple_async_result_take_error", libs);

  // SimpleIOStream
  gidLink(cast(void**)&g_simple_io_stream_get_type, "g_simple_io_stream_get_type", libs);
  gidLink(cast(void**)&g_simple_io_stream_new, "g_simple_io_stream_new", libs);

  // SimplePermission
  gidLink(cast(void**)&g_simple_permission_get_type, "g_simple_permission_get_type", libs);
  gidLink(cast(void**)&g_simple_permission_new, "g_simple_permission_new", libs);

  // SimpleProxyResolver
  gidLink(cast(void**)&g_simple_proxy_resolver_get_type, "g_simple_proxy_resolver_get_type", libs);
  gidLink(cast(void**)&g_simple_proxy_resolver_new, "g_simple_proxy_resolver_new", libs);
  gidLink(cast(void**)&g_simple_proxy_resolver_set_default_proxy, "g_simple_proxy_resolver_set_default_proxy", libs);
  gidLink(cast(void**)&g_simple_proxy_resolver_set_ignore_hosts, "g_simple_proxy_resolver_set_ignore_hosts", libs);
  gidLink(cast(void**)&g_simple_proxy_resolver_set_uri_proxy, "g_simple_proxy_resolver_set_uri_proxy", libs);

  // Socket
  gidLink(cast(void**)&g_socket_get_type, "g_socket_get_type", libs);
  gidLink(cast(void**)&g_socket_new, "g_socket_new", libs);
  gidLink(cast(void**)&g_socket_new_from_fd, "g_socket_new_from_fd", libs);
  gidLink(cast(void**)&g_socket_accept, "g_socket_accept", libs);
  gidLink(cast(void**)&g_socket_bind, "g_socket_bind", libs);
  gidLink(cast(void**)&g_socket_check_connect_result, "g_socket_check_connect_result", libs);
  gidLink(cast(void**)&g_socket_close, "g_socket_close", libs);
  gidLink(cast(void**)&g_socket_condition_check, "g_socket_condition_check", libs);
  gidLink(cast(void**)&g_socket_condition_timed_wait, "g_socket_condition_timed_wait", libs);
  gidLink(cast(void**)&g_socket_condition_wait, "g_socket_condition_wait", libs);
  gidLink(cast(void**)&g_socket_connect, "g_socket_connect", libs);
  gidLink(cast(void**)&g_socket_connection_factory_create_connection, "g_socket_connection_factory_create_connection", libs);
  gidLink(cast(void**)&g_socket_create_source, "g_socket_create_source", libs);
  gidLink(cast(void**)&g_socket_get_available_bytes, "g_socket_get_available_bytes", libs);
  gidLink(cast(void**)&g_socket_get_blocking, "g_socket_get_blocking", libs);
  gidLink(cast(void**)&g_socket_get_broadcast, "g_socket_get_broadcast", libs);
  gidLink(cast(void**)&g_socket_get_credentials, "g_socket_get_credentials", libs);
  gidLink(cast(void**)&g_socket_get_family, "g_socket_get_family", libs);
  gidLink(cast(void**)&g_socket_get_fd, "g_socket_get_fd", libs);
  gidLink(cast(void**)&g_socket_get_keepalive, "g_socket_get_keepalive", libs);
  gidLink(cast(void**)&g_socket_get_listen_backlog, "g_socket_get_listen_backlog", libs);
  gidLink(cast(void**)&g_socket_get_local_address, "g_socket_get_local_address", libs);
  gidLink(cast(void**)&g_socket_get_multicast_loopback, "g_socket_get_multicast_loopback", libs);
  gidLink(cast(void**)&g_socket_get_multicast_ttl, "g_socket_get_multicast_ttl", libs);
  gidLink(cast(void**)&g_socket_get_option, "g_socket_get_option", libs);
  gidLink(cast(void**)&g_socket_get_protocol, "g_socket_get_protocol", libs);
  gidLink(cast(void**)&g_socket_get_remote_address, "g_socket_get_remote_address", libs);
  gidLink(cast(void**)&g_socket_get_socket_type, "g_socket_get_socket_type", libs);
  gidLink(cast(void**)&g_socket_get_timeout, "g_socket_get_timeout", libs);
  gidLink(cast(void**)&g_socket_get_ttl, "g_socket_get_ttl", libs);
  gidLink(cast(void**)&g_socket_is_closed, "g_socket_is_closed", libs);
  gidLink(cast(void**)&g_socket_is_connected, "g_socket_is_connected", libs);
  gidLink(cast(void**)&g_socket_join_multicast_group, "g_socket_join_multicast_group", libs);
  gidLink(cast(void**)&g_socket_join_multicast_group_ssm, "g_socket_join_multicast_group_ssm", libs);
  gidLink(cast(void**)&g_socket_leave_multicast_group, "g_socket_leave_multicast_group", libs);
  gidLink(cast(void**)&g_socket_leave_multicast_group_ssm, "g_socket_leave_multicast_group_ssm", libs);
  gidLink(cast(void**)&g_socket_listen, "g_socket_listen", libs);
  gidLink(cast(void**)&g_socket_receive, "g_socket_receive", libs);
  gidLink(cast(void**)&g_socket_receive_bytes, "g_socket_receive_bytes", libs);
  gidLink(cast(void**)&g_socket_receive_bytes_from, "g_socket_receive_bytes_from", libs);
  gidLink(cast(void**)&g_socket_receive_from, "g_socket_receive_from", libs);
  gidLink(cast(void**)&g_socket_receive_message, "g_socket_receive_message", libs);
  gidLink(cast(void**)&g_socket_receive_messages, "g_socket_receive_messages", libs);
  gidLink(cast(void**)&g_socket_receive_with_blocking, "g_socket_receive_with_blocking", libs);
  gidLink(cast(void**)&g_socket_send, "g_socket_send", libs);
  gidLink(cast(void**)&g_socket_send_message, "g_socket_send_message", libs);
  gidLink(cast(void**)&g_socket_send_message_with_timeout, "g_socket_send_message_with_timeout", libs);
  gidLink(cast(void**)&g_socket_send_messages, "g_socket_send_messages", libs);
  gidLink(cast(void**)&g_socket_send_to, "g_socket_send_to", libs);
  gidLink(cast(void**)&g_socket_send_with_blocking, "g_socket_send_with_blocking", libs);
  gidLink(cast(void**)&g_socket_set_blocking, "g_socket_set_blocking", libs);
  gidLink(cast(void**)&g_socket_set_broadcast, "g_socket_set_broadcast", libs);
  gidLink(cast(void**)&g_socket_set_keepalive, "g_socket_set_keepalive", libs);
  gidLink(cast(void**)&g_socket_set_listen_backlog, "g_socket_set_listen_backlog", libs);
  gidLink(cast(void**)&g_socket_set_multicast_loopback, "g_socket_set_multicast_loopback", libs);
  gidLink(cast(void**)&g_socket_set_multicast_ttl, "g_socket_set_multicast_ttl", libs);
  gidLink(cast(void**)&g_socket_set_option, "g_socket_set_option", libs);
  gidLink(cast(void**)&g_socket_set_timeout, "g_socket_set_timeout", libs);
  gidLink(cast(void**)&g_socket_set_ttl, "g_socket_set_ttl", libs);
  gidLink(cast(void**)&g_socket_shutdown, "g_socket_shutdown", libs);
  gidLink(cast(void**)&g_socket_speaks_ipv4, "g_socket_speaks_ipv4", libs);

  // SocketAddress
  gidLink(cast(void**)&g_socket_address_get_type, "g_socket_address_get_type", libs);
  gidLink(cast(void**)&g_socket_address_new_from_native, "g_socket_address_new_from_native", libs);
  gidLink(cast(void**)&g_socket_address_get_family, "g_socket_address_get_family", libs);
  gidLink(cast(void**)&g_socket_address_get_native_size, "g_socket_address_get_native_size", libs);
  gidLink(cast(void**)&g_socket_address_to_native, "g_socket_address_to_native", libs);

  // SocketAddressEnumerator
  gidLink(cast(void**)&g_socket_address_enumerator_get_type, "g_socket_address_enumerator_get_type", libs);
  gidLink(cast(void**)&g_socket_address_enumerator_next, "g_socket_address_enumerator_next", libs);
  gidLink(cast(void**)&g_socket_address_enumerator_next_async, "g_socket_address_enumerator_next_async", libs);
  gidLink(cast(void**)&g_socket_address_enumerator_next_finish, "g_socket_address_enumerator_next_finish", libs);

  // SocketClient
  gidLink(cast(void**)&g_socket_client_get_type, "g_socket_client_get_type", libs);
  gidLink(cast(void**)&g_socket_client_new, "g_socket_client_new", libs);
  gidLink(cast(void**)&g_socket_client_add_application_proxy, "g_socket_client_add_application_proxy", libs);
  gidLink(cast(void**)&g_socket_client_connect, "g_socket_client_connect", libs);
  gidLink(cast(void**)&g_socket_client_connect_async, "g_socket_client_connect_async", libs);
  gidLink(cast(void**)&g_socket_client_connect_finish, "g_socket_client_connect_finish", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_host, "g_socket_client_connect_to_host", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_host_async, "g_socket_client_connect_to_host_async", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_host_finish, "g_socket_client_connect_to_host_finish", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_service, "g_socket_client_connect_to_service", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_service_async, "g_socket_client_connect_to_service_async", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_service_finish, "g_socket_client_connect_to_service_finish", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_uri, "g_socket_client_connect_to_uri", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_uri_async, "g_socket_client_connect_to_uri_async", libs);
  gidLink(cast(void**)&g_socket_client_connect_to_uri_finish, "g_socket_client_connect_to_uri_finish", libs);
  gidLink(cast(void**)&g_socket_client_get_enable_proxy, "g_socket_client_get_enable_proxy", libs);
  gidLink(cast(void**)&g_socket_client_get_family, "g_socket_client_get_family", libs);
  gidLink(cast(void**)&g_socket_client_get_local_address, "g_socket_client_get_local_address", libs);
  gidLink(cast(void**)&g_socket_client_get_protocol, "g_socket_client_get_protocol", libs);
  gidLink(cast(void**)&g_socket_client_get_proxy_resolver, "g_socket_client_get_proxy_resolver", libs);
  gidLink(cast(void**)&g_socket_client_get_socket_type, "g_socket_client_get_socket_type", libs);
  gidLink(cast(void**)&g_socket_client_get_timeout, "g_socket_client_get_timeout", libs);
  gidLink(cast(void**)&g_socket_client_get_tls, "g_socket_client_get_tls", libs);
  gidLink(cast(void**)&g_socket_client_get_tls_validation_flags, "g_socket_client_get_tls_validation_flags", libs);
  gidLink(cast(void**)&g_socket_client_set_enable_proxy, "g_socket_client_set_enable_proxy", libs);
  gidLink(cast(void**)&g_socket_client_set_family, "g_socket_client_set_family", libs);
  gidLink(cast(void**)&g_socket_client_set_local_address, "g_socket_client_set_local_address", libs);
  gidLink(cast(void**)&g_socket_client_set_protocol, "g_socket_client_set_protocol", libs);
  gidLink(cast(void**)&g_socket_client_set_proxy_resolver, "g_socket_client_set_proxy_resolver", libs);
  gidLink(cast(void**)&g_socket_client_set_socket_type, "g_socket_client_set_socket_type", libs);
  gidLink(cast(void**)&g_socket_client_set_timeout, "g_socket_client_set_timeout", libs);
  gidLink(cast(void**)&g_socket_client_set_tls, "g_socket_client_set_tls", libs);
  gidLink(cast(void**)&g_socket_client_set_tls_validation_flags, "g_socket_client_set_tls_validation_flags", libs);

  // SocketConnectable
  gidLink(cast(void**)&g_socket_connectable_get_type, "g_socket_connectable_get_type", libs);
  gidLink(cast(void**)&g_socket_connectable_enumerate, "g_socket_connectable_enumerate", libs);
  gidLink(cast(void**)&g_socket_connectable_proxy_enumerate, "g_socket_connectable_proxy_enumerate", libs);
  gidLink(cast(void**)&g_socket_connectable_to_string, "g_socket_connectable_to_string", libs);

  // SocketConnection
  gidLink(cast(void**)&g_socket_connection_get_type, "g_socket_connection_get_type", libs);
  gidLink(cast(void**)&g_socket_connection_factory_lookup_type, "g_socket_connection_factory_lookup_type", libs);
  gidLink(cast(void**)&g_socket_connection_factory_register_type, "g_socket_connection_factory_register_type", libs);
  gidLink(cast(void**)&g_socket_connection_connect, "g_socket_connection_connect", libs);
  gidLink(cast(void**)&g_socket_connection_connect_async, "g_socket_connection_connect_async", libs);
  gidLink(cast(void**)&g_socket_connection_connect_finish, "g_socket_connection_connect_finish", libs);
  gidLink(cast(void**)&g_socket_connection_get_local_address, "g_socket_connection_get_local_address", libs);
  gidLink(cast(void**)&g_socket_connection_get_remote_address, "g_socket_connection_get_remote_address", libs);
  gidLink(cast(void**)&g_socket_connection_get_socket, "g_socket_connection_get_socket", libs);
  gidLink(cast(void**)&g_socket_connection_is_connected, "g_socket_connection_is_connected", libs);

  // SocketControlMessage
  gidLink(cast(void**)&g_socket_control_message_get_type, "g_socket_control_message_get_type", libs);
  gidLink(cast(void**)&g_socket_control_message_deserialize, "g_socket_control_message_deserialize", libs);
  gidLink(cast(void**)&g_socket_control_message_get_level, "g_socket_control_message_get_level", libs);
  gidLink(cast(void**)&g_socket_control_message_get_msg_type, "g_socket_control_message_get_msg_type", libs);
  gidLink(cast(void**)&g_socket_control_message_get_size, "g_socket_control_message_get_size", libs);
  gidLink(cast(void**)&g_socket_control_message_serialize, "g_socket_control_message_serialize", libs);

  // SocketListener
  gidLink(cast(void**)&g_socket_listener_get_type, "g_socket_listener_get_type", libs);
  gidLink(cast(void**)&g_socket_listener_new, "g_socket_listener_new", libs);
  gidLink(cast(void**)&g_socket_listener_accept, "g_socket_listener_accept", libs);
  gidLink(cast(void**)&g_socket_listener_accept_async, "g_socket_listener_accept_async", libs);
  gidLink(cast(void**)&g_socket_listener_accept_finish, "g_socket_listener_accept_finish", libs);
  gidLink(cast(void**)&g_socket_listener_accept_socket, "g_socket_listener_accept_socket", libs);
  gidLink(cast(void**)&g_socket_listener_accept_socket_async, "g_socket_listener_accept_socket_async", libs);
  gidLink(cast(void**)&g_socket_listener_accept_socket_finish, "g_socket_listener_accept_socket_finish", libs);
  gidLink(cast(void**)&g_socket_listener_add_address, "g_socket_listener_add_address", libs);
  gidLink(cast(void**)&g_socket_listener_add_any_inet_port, "g_socket_listener_add_any_inet_port", libs);
  gidLink(cast(void**)&g_socket_listener_add_inet_port, "g_socket_listener_add_inet_port", libs);
  gidLink(cast(void**)&g_socket_listener_add_socket, "g_socket_listener_add_socket", libs);
  gidLink(cast(void**)&g_socket_listener_close, "g_socket_listener_close", libs);
  gidLink(cast(void**)&g_socket_listener_set_backlog, "g_socket_listener_set_backlog", libs);

  // SocketService
  gidLink(cast(void**)&g_socket_service_get_type, "g_socket_service_get_type", libs);
  gidLink(cast(void**)&g_socket_service_new, "g_socket_service_new", libs);
  gidLink(cast(void**)&g_socket_service_is_active, "g_socket_service_is_active", libs);
  gidLink(cast(void**)&g_socket_service_start, "g_socket_service_start", libs);
  gidLink(cast(void**)&g_socket_service_stop, "g_socket_service_stop", libs);

  // SrvTarget
  gidLink(cast(void**)&g_srv_target_get_type, "g_srv_target_get_type", libs);
  gidLink(cast(void**)&g_srv_target_new, "g_srv_target_new", libs);
  gidLink(cast(void**)&g_srv_target_copy, "g_srv_target_copy", libs);
  gidLink(cast(void**)&g_srv_target_free, "g_srv_target_free", libs);
  gidLink(cast(void**)&g_srv_target_get_hostname, "g_srv_target_get_hostname", libs);
  gidLink(cast(void**)&g_srv_target_get_port, "g_srv_target_get_port", libs);
  gidLink(cast(void**)&g_srv_target_get_priority, "g_srv_target_get_priority", libs);
  gidLink(cast(void**)&g_srv_target_get_weight, "g_srv_target_get_weight", libs);
  gidLink(cast(void**)&g_srv_target_list_sort, "g_srv_target_list_sort", libs);

  // StaticResource
  gidLink(cast(void**)&g_static_resource_fini, "g_static_resource_fini", libs);
  gidLink(cast(void**)&g_static_resource_get_resource, "g_static_resource_get_resource", libs);
  gidLink(cast(void**)&g_static_resource_init, "g_static_resource_init", libs);

  // Subprocess
  gidLink(cast(void**)&g_subprocess_get_type, "g_subprocess_get_type", libs);
  gidLink(cast(void**)&g_subprocess_new, "g_subprocess_new", libs);
  gidLink(cast(void**)&g_subprocess_newv, "g_subprocess_newv", libs);
  gidLink(cast(void**)&g_subprocess_communicate, "g_subprocess_communicate", libs);
  gidLink(cast(void**)&g_subprocess_communicate_async, "g_subprocess_communicate_async", libs);
  gidLink(cast(void**)&g_subprocess_communicate_finish, "g_subprocess_communicate_finish", libs);
  gidLink(cast(void**)&g_subprocess_communicate_utf8, "g_subprocess_communicate_utf8", libs);
  gidLink(cast(void**)&g_subprocess_communicate_utf8_async, "g_subprocess_communicate_utf8_async", libs);
  gidLink(cast(void**)&g_subprocess_communicate_utf8_finish, "g_subprocess_communicate_utf8_finish", libs);
  gidLink(cast(void**)&g_subprocess_force_exit, "g_subprocess_force_exit", libs);
  gidLink(cast(void**)&g_subprocess_get_exit_status, "g_subprocess_get_exit_status", libs);
  gidLink(cast(void**)&g_subprocess_get_identifier, "g_subprocess_get_identifier", libs);
  gidLink(cast(void**)&g_subprocess_get_if_exited, "g_subprocess_get_if_exited", libs);
  gidLink(cast(void**)&g_subprocess_get_if_signaled, "g_subprocess_get_if_signaled", libs);
  gidLink(cast(void**)&g_subprocess_get_status, "g_subprocess_get_status", libs);
  gidLink(cast(void**)&g_subprocess_get_stderr_pipe, "g_subprocess_get_stderr_pipe", libs);
  gidLink(cast(void**)&g_subprocess_get_stdin_pipe, "g_subprocess_get_stdin_pipe", libs);
  gidLink(cast(void**)&g_subprocess_get_stdout_pipe, "g_subprocess_get_stdout_pipe", libs);
  gidLink(cast(void**)&g_subprocess_get_successful, "g_subprocess_get_successful", libs);
  gidLink(cast(void**)&g_subprocess_get_term_sig, "g_subprocess_get_term_sig", libs);
  gidLink(cast(void**)&g_subprocess_send_signal, "g_subprocess_send_signal", libs);
  gidLink(cast(void**)&g_subprocess_wait, "g_subprocess_wait", libs);
  gidLink(cast(void**)&g_subprocess_wait_async, "g_subprocess_wait_async", libs);
  gidLink(cast(void**)&g_subprocess_wait_check, "g_subprocess_wait_check", libs);
  gidLink(cast(void**)&g_subprocess_wait_check_async, "g_subprocess_wait_check_async", libs);
  gidLink(cast(void**)&g_subprocess_wait_check_finish, "g_subprocess_wait_check_finish", libs);
  gidLink(cast(void**)&g_subprocess_wait_finish, "g_subprocess_wait_finish", libs);

  // SubprocessLauncher
  gidLink(cast(void**)&g_subprocess_launcher_get_type, "g_subprocess_launcher_get_type", libs);
  gidLink(cast(void**)&g_subprocess_launcher_new, "g_subprocess_launcher_new", libs);
  gidLink(cast(void**)&g_subprocess_launcher_close, "g_subprocess_launcher_close", libs);
  gidLink(cast(void**)&g_subprocess_launcher_getenv, "g_subprocess_launcher_getenv", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_child_setup, "g_subprocess_launcher_set_child_setup", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_cwd, "g_subprocess_launcher_set_cwd", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_environ, "g_subprocess_launcher_set_environ", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_flags, "g_subprocess_launcher_set_flags", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_stderr_file_path, "g_subprocess_launcher_set_stderr_file_path", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_stdin_file_path, "g_subprocess_launcher_set_stdin_file_path", libs);
  gidLink(cast(void**)&g_subprocess_launcher_set_stdout_file_path, "g_subprocess_launcher_set_stdout_file_path", libs);
  gidLink(cast(void**)&g_subprocess_launcher_setenv, "g_subprocess_launcher_setenv", libs);
  gidLink(cast(void**)&g_subprocess_launcher_spawn, "g_subprocess_launcher_spawn", libs);
  gidLink(cast(void**)&g_subprocess_launcher_spawnv, "g_subprocess_launcher_spawnv", libs);
  gidLink(cast(void**)&g_subprocess_launcher_take_fd, "g_subprocess_launcher_take_fd", libs);
  gidLink(cast(void**)&g_subprocess_launcher_take_stderr_fd, "g_subprocess_launcher_take_stderr_fd", libs);
  gidLink(cast(void**)&g_subprocess_launcher_take_stdin_fd, "g_subprocess_launcher_take_stdin_fd", libs);
  gidLink(cast(void**)&g_subprocess_launcher_take_stdout_fd, "g_subprocess_launcher_take_stdout_fd", libs);
  gidLink(cast(void**)&g_subprocess_launcher_unsetenv, "g_subprocess_launcher_unsetenv", libs);

  // Task
  gidLink(cast(void**)&g_task_get_type, "g_task_get_type", libs);
  gidLink(cast(void**)&g_task_new, "g_task_new", libs);
  gidLink(cast(void**)&g_task_is_valid, "g_task_is_valid", libs);
  gidLink(cast(void**)&g_task_report_error, "g_task_report_error", libs);
  gidLink(cast(void**)&g_task_report_new_error, "g_task_report_new_error", libs);
  gidLink(cast(void**)&g_task_attach_source, "g_task_attach_source", libs);
  gidLink(cast(void**)&g_task_get_cancellable, "g_task_get_cancellable", libs);
  gidLink(cast(void**)&g_task_get_check_cancellable, "g_task_get_check_cancellable", libs);
  gidLink(cast(void**)&g_task_get_completed, "g_task_get_completed", libs);
  gidLink(cast(void**)&g_task_get_context, "g_task_get_context", libs);
  gidLink(cast(void**)&g_task_get_name, "g_task_get_name", libs);
  gidLink(cast(void**)&g_task_get_priority, "g_task_get_priority", libs);
  gidLink(cast(void**)&g_task_get_return_on_cancel, "g_task_get_return_on_cancel", libs);
  gidLink(cast(void**)&g_task_get_source_object, "g_task_get_source_object", libs);
  gidLink(cast(void**)&g_task_get_source_tag, "g_task_get_source_tag", libs);
  gidLink(cast(void**)&g_task_get_task_data, "g_task_get_task_data", libs);
  gidLink(cast(void**)&g_task_had_error, "g_task_had_error", libs);
  gidLink(cast(void**)&g_task_propagate_boolean, "g_task_propagate_boolean", libs);
  gidLink(cast(void**)&g_task_propagate_int, "g_task_propagate_int", libs);
  gidLink(cast(void**)&g_task_propagate_pointer, "g_task_propagate_pointer", libs);
  gidLink(cast(void**)&g_task_propagate_value, "g_task_propagate_value", libs);
  gidLink(cast(void**)&g_task_return_boolean, "g_task_return_boolean", libs);
  gidLink(cast(void**)&g_task_return_error, "g_task_return_error", libs);
  gidLink(cast(void**)&g_task_return_error_if_cancelled, "g_task_return_error_if_cancelled", libs);
  gidLink(cast(void**)&g_task_return_int, "g_task_return_int", libs);
  gidLink(cast(void**)&g_task_return_new_error, "g_task_return_new_error", libs);
  gidLink(cast(void**)&g_task_return_new_error_literal, "g_task_return_new_error_literal", libs);
  gidLink(cast(void**)&g_task_return_pointer, "g_task_return_pointer", libs);
  gidLink(cast(void**)&g_task_return_prefixed_error, "g_task_return_prefixed_error", libs);
  gidLink(cast(void**)&g_task_return_value, "g_task_return_value", libs);
  gidLink(cast(void**)&g_task_run_in_thread, "g_task_run_in_thread", libs);
  gidLink(cast(void**)&g_task_run_in_thread_sync, "g_task_run_in_thread_sync", libs);
  gidLink(cast(void**)&g_task_set_check_cancellable, "g_task_set_check_cancellable", libs);
  gidLink(cast(void**)&g_task_set_name, "g_task_set_name", libs);
  gidLink(cast(void**)&g_task_set_priority, "g_task_set_priority", libs);
  gidLink(cast(void**)&g_task_set_return_on_cancel, "g_task_set_return_on_cancel", libs);
  gidLink(cast(void**)&g_task_set_source_tag, "g_task_set_source_tag", libs);
  gidLink(cast(void**)&g_task_set_static_name, "g_task_set_static_name", libs);
  gidLink(cast(void**)&g_task_set_task_data, "g_task_set_task_data", libs);

  // TcpConnection
  gidLink(cast(void**)&g_tcp_connection_get_type, "g_tcp_connection_get_type", libs);
  gidLink(cast(void**)&g_tcp_connection_get_graceful_disconnect, "g_tcp_connection_get_graceful_disconnect", libs);
  gidLink(cast(void**)&g_tcp_connection_set_graceful_disconnect, "g_tcp_connection_set_graceful_disconnect", libs);

  // TcpWrapperConnection
  gidLink(cast(void**)&g_tcp_wrapper_connection_get_type, "g_tcp_wrapper_connection_get_type", libs);
  gidLink(cast(void**)&g_tcp_wrapper_connection_new, "g_tcp_wrapper_connection_new", libs);
  gidLink(cast(void**)&g_tcp_wrapper_connection_get_base_io_stream, "g_tcp_wrapper_connection_get_base_io_stream", libs);

  // TestDBus
  gidLink(cast(void**)&g_test_dbus_get_type, "g_test_dbus_get_type", libs);
  gidLink(cast(void**)&g_test_dbus_new, "g_test_dbus_new", libs);
  gidLink(cast(void**)&g_test_dbus_unset, "g_test_dbus_unset", libs);
  gidLink(cast(void**)&g_test_dbus_add_service_dir, "g_test_dbus_add_service_dir", libs);
  gidLink(cast(void**)&g_test_dbus_down, "g_test_dbus_down", libs);
  gidLink(cast(void**)&g_test_dbus_get_bus_address, "g_test_dbus_get_bus_address", libs);
  gidLink(cast(void**)&g_test_dbus_get_flags, "g_test_dbus_get_flags", libs);
  gidLink(cast(void**)&g_test_dbus_stop, "g_test_dbus_stop", libs);
  gidLink(cast(void**)&g_test_dbus_up, "g_test_dbus_up", libs);

  // ThemedIcon
  gidLink(cast(void**)&g_themed_icon_get_type, "g_themed_icon_get_type", libs);
  gidLink(cast(void**)&g_themed_icon_new, "g_themed_icon_new", libs);
  gidLink(cast(void**)&g_themed_icon_new_from_names, "g_themed_icon_new_from_names", libs);
  gidLink(cast(void**)&g_themed_icon_new_with_default_fallbacks, "g_themed_icon_new_with_default_fallbacks", libs);
  gidLink(cast(void**)&g_themed_icon_append_name, "g_themed_icon_append_name", libs);
  gidLink(cast(void**)&g_themed_icon_get_names, "g_themed_icon_get_names", libs);
  gidLink(cast(void**)&g_themed_icon_prepend_name, "g_themed_icon_prepend_name", libs);

  // ThreadedResolver
  gidLink(cast(void**)&g_threaded_resolver_get_type, "g_threaded_resolver_get_type", libs);

  // ThreadedSocketService
  gidLink(cast(void**)&g_threaded_socket_service_get_type, "g_threaded_socket_service_get_type", libs);
  gidLink(cast(void**)&g_threaded_socket_service_new, "g_threaded_socket_service_new", libs);

  // TlsBackend
  gidLink(cast(void**)&g_tls_backend_get_type, "g_tls_backend_get_type", libs);
  gidLink(cast(void**)&g_tls_backend_get_default, "g_tls_backend_get_default", libs);
  gidLink(cast(void**)&g_tls_backend_get_certificate_type, "g_tls_backend_get_certificate_type", libs);
  gidLink(cast(void**)&g_tls_backend_get_client_connection_type, "g_tls_backend_get_client_connection_type", libs);
  gidLink(cast(void**)&g_tls_backend_get_default_database, "g_tls_backend_get_default_database", libs);
  gidLink(cast(void**)&g_tls_backend_get_dtls_client_connection_type, "g_tls_backend_get_dtls_client_connection_type", libs);
  gidLink(cast(void**)&g_tls_backend_get_dtls_server_connection_type, "g_tls_backend_get_dtls_server_connection_type", libs);
  gidLink(cast(void**)&g_tls_backend_get_file_database_type, "g_tls_backend_get_file_database_type", libs);
  gidLink(cast(void**)&g_tls_backend_get_server_connection_type, "g_tls_backend_get_server_connection_type", libs);
  gidLink(cast(void**)&g_tls_backend_set_default_database, "g_tls_backend_set_default_database", libs);
  gidLink(cast(void**)&g_tls_backend_supports_dtls, "g_tls_backend_supports_dtls", libs);
  gidLink(cast(void**)&g_tls_backend_supports_tls, "g_tls_backend_supports_tls", libs);

  // TlsCertificate
  gidLink(cast(void**)&g_tls_certificate_get_type, "g_tls_certificate_get_type", libs);
  gidLink(cast(void**)&g_tls_certificate_new_from_file, "g_tls_certificate_new_from_file", libs);
  gidLink(cast(void**)&g_tls_certificate_new_from_file_with_password, "g_tls_certificate_new_from_file_with_password", libs);
  gidLink(cast(void**)&g_tls_certificate_new_from_files, "g_tls_certificate_new_from_files", libs);
  gidLink(cast(void**)&g_tls_certificate_new_from_pem, "g_tls_certificate_new_from_pem", libs);
  gidLink(cast(void**)&g_tls_certificate_new_from_pkcs11_uris, "g_tls_certificate_new_from_pkcs11_uris", libs);
  gidLink(cast(void**)&g_tls_certificate_new_from_pkcs12, "g_tls_certificate_new_from_pkcs12", libs);
  gidLink(cast(void**)&g_tls_certificate_list_new_from_file, "g_tls_certificate_list_new_from_file", libs);
  gidLink(cast(void**)&g_tls_certificate_get_dns_names, "g_tls_certificate_get_dns_names", libs);
  gidLink(cast(void**)&g_tls_certificate_get_ip_addresses, "g_tls_certificate_get_ip_addresses", libs);
  gidLink(cast(void**)&g_tls_certificate_get_issuer, "g_tls_certificate_get_issuer", libs);
  gidLink(cast(void**)&g_tls_certificate_get_issuer_name, "g_tls_certificate_get_issuer_name", libs);
  gidLink(cast(void**)&g_tls_certificate_get_not_valid_after, "g_tls_certificate_get_not_valid_after", libs);
  gidLink(cast(void**)&g_tls_certificate_get_not_valid_before, "g_tls_certificate_get_not_valid_before", libs);
  gidLink(cast(void**)&g_tls_certificate_get_subject_name, "g_tls_certificate_get_subject_name", libs);
  gidLink(cast(void**)&g_tls_certificate_is_same, "g_tls_certificate_is_same", libs);
  gidLink(cast(void**)&g_tls_certificate_verify, "g_tls_certificate_verify", libs);

  // TlsClientConnection
  gidLink(cast(void**)&g_tls_client_connection_get_type, "g_tls_client_connection_get_type", libs);
  gidLink(cast(void**)&g_tls_client_connection_new, "g_tls_client_connection_new", libs);
  gidLink(cast(void**)&g_tls_client_connection_copy_session_state, "g_tls_client_connection_copy_session_state", libs);
  gidLink(cast(void**)&g_tls_client_connection_get_accepted_cas, "g_tls_client_connection_get_accepted_cas", libs);
  gidLink(cast(void**)&g_tls_client_connection_get_server_identity, "g_tls_client_connection_get_server_identity", libs);
  gidLink(cast(void**)&g_tls_client_connection_get_use_ssl3, "g_tls_client_connection_get_use_ssl3", libs);
  gidLink(cast(void**)&g_tls_client_connection_get_validation_flags, "g_tls_client_connection_get_validation_flags", libs);
  gidLink(cast(void**)&g_tls_client_connection_set_server_identity, "g_tls_client_connection_set_server_identity", libs);
  gidLink(cast(void**)&g_tls_client_connection_set_use_ssl3, "g_tls_client_connection_set_use_ssl3", libs);
  gidLink(cast(void**)&g_tls_client_connection_set_validation_flags, "g_tls_client_connection_set_validation_flags", libs);

  // TlsConnection
  gidLink(cast(void**)&g_tls_connection_get_type, "g_tls_connection_get_type", libs);
  gidLink(cast(void**)&g_tls_connection_emit_accept_certificate, "g_tls_connection_emit_accept_certificate", libs);
  gidLink(cast(void**)&g_tls_connection_get_certificate, "g_tls_connection_get_certificate", libs);
  gidLink(cast(void**)&g_tls_connection_get_channel_binding_data, "g_tls_connection_get_channel_binding_data", libs);
  gidLink(cast(void**)&g_tls_connection_get_ciphersuite_name, "g_tls_connection_get_ciphersuite_name", libs);
  gidLink(cast(void**)&g_tls_connection_get_database, "g_tls_connection_get_database", libs);
  gidLink(cast(void**)&g_tls_connection_get_interaction, "g_tls_connection_get_interaction", libs);
  gidLink(cast(void**)&g_tls_connection_get_negotiated_protocol, "g_tls_connection_get_negotiated_protocol", libs);
  gidLink(cast(void**)&g_tls_connection_get_peer_certificate, "g_tls_connection_get_peer_certificate", libs);
  gidLink(cast(void**)&g_tls_connection_get_peer_certificate_errors, "g_tls_connection_get_peer_certificate_errors", libs);
  gidLink(cast(void**)&g_tls_connection_get_protocol_version, "g_tls_connection_get_protocol_version", libs);
  gidLink(cast(void**)&g_tls_connection_get_rehandshake_mode, "g_tls_connection_get_rehandshake_mode", libs);
  gidLink(cast(void**)&g_tls_connection_get_require_close_notify, "g_tls_connection_get_require_close_notify", libs);
  gidLink(cast(void**)&g_tls_connection_get_use_system_certdb, "g_tls_connection_get_use_system_certdb", libs);
  gidLink(cast(void**)&g_tls_connection_handshake, "g_tls_connection_handshake", libs);
  gidLink(cast(void**)&g_tls_connection_handshake_async, "g_tls_connection_handshake_async", libs);
  gidLink(cast(void**)&g_tls_connection_handshake_finish, "g_tls_connection_handshake_finish", libs);
  gidLink(cast(void**)&g_tls_connection_set_advertised_protocols, "g_tls_connection_set_advertised_protocols", libs);
  gidLink(cast(void**)&g_tls_connection_set_certificate, "g_tls_connection_set_certificate", libs);
  gidLink(cast(void**)&g_tls_connection_set_database, "g_tls_connection_set_database", libs);
  gidLink(cast(void**)&g_tls_connection_set_interaction, "g_tls_connection_set_interaction", libs);
  gidLink(cast(void**)&g_tls_connection_set_rehandshake_mode, "g_tls_connection_set_rehandshake_mode", libs);
  gidLink(cast(void**)&g_tls_connection_set_require_close_notify, "g_tls_connection_set_require_close_notify", libs);
  gidLink(cast(void**)&g_tls_connection_set_use_system_certdb, "g_tls_connection_set_use_system_certdb", libs);

  // TlsDatabase
  gidLink(cast(void**)&g_tls_database_get_type, "g_tls_database_get_type", libs);
  gidLink(cast(void**)&g_tls_database_create_certificate_handle, "g_tls_database_create_certificate_handle", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificate_for_handle, "g_tls_database_lookup_certificate_for_handle", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificate_for_handle_async, "g_tls_database_lookup_certificate_for_handle_async", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificate_for_handle_finish, "g_tls_database_lookup_certificate_for_handle_finish", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificate_issuer, "g_tls_database_lookup_certificate_issuer", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificate_issuer_async, "g_tls_database_lookup_certificate_issuer_async", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificate_issuer_finish, "g_tls_database_lookup_certificate_issuer_finish", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificates_issued_by, "g_tls_database_lookup_certificates_issued_by", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificates_issued_by_async, "g_tls_database_lookup_certificates_issued_by_async", libs);
  gidLink(cast(void**)&g_tls_database_lookup_certificates_issued_by_finish, "g_tls_database_lookup_certificates_issued_by_finish", libs);
  gidLink(cast(void**)&g_tls_database_verify_chain, "g_tls_database_verify_chain", libs);
  gidLink(cast(void**)&g_tls_database_verify_chain_async, "g_tls_database_verify_chain_async", libs);
  gidLink(cast(void**)&g_tls_database_verify_chain_finish, "g_tls_database_verify_chain_finish", libs);

  // TlsFileDatabase
  gidLink(cast(void**)&g_tls_file_database_get_type, "g_tls_file_database_get_type", libs);
  gidLink(cast(void**)&g_tls_file_database_new, "g_tls_file_database_new", libs);

  // TlsInteraction
  gidLink(cast(void**)&g_tls_interaction_get_type, "g_tls_interaction_get_type", libs);
  gidLink(cast(void**)&g_tls_interaction_ask_password, "g_tls_interaction_ask_password", libs);
  gidLink(cast(void**)&g_tls_interaction_ask_password_async, "g_tls_interaction_ask_password_async", libs);
  gidLink(cast(void**)&g_tls_interaction_ask_password_finish, "g_tls_interaction_ask_password_finish", libs);
  gidLink(cast(void**)&g_tls_interaction_invoke_ask_password, "g_tls_interaction_invoke_ask_password", libs);
  gidLink(cast(void**)&g_tls_interaction_invoke_request_certificate, "g_tls_interaction_invoke_request_certificate", libs);
  gidLink(cast(void**)&g_tls_interaction_request_certificate, "g_tls_interaction_request_certificate", libs);
  gidLink(cast(void**)&g_tls_interaction_request_certificate_async, "g_tls_interaction_request_certificate_async", libs);
  gidLink(cast(void**)&g_tls_interaction_request_certificate_finish, "g_tls_interaction_request_certificate_finish", libs);

  // TlsPassword
  gidLink(cast(void**)&g_tls_password_get_type, "g_tls_password_get_type", libs);
  gidLink(cast(void**)&g_tls_password_new, "g_tls_password_new", libs);
  gidLink(cast(void**)&g_tls_password_get_description, "g_tls_password_get_description", libs);
  gidLink(cast(void**)&g_tls_password_get_flags, "g_tls_password_get_flags", libs);
  gidLink(cast(void**)&g_tls_password_get_value, "g_tls_password_get_value", libs);
  gidLink(cast(void**)&g_tls_password_get_warning, "g_tls_password_get_warning", libs);
  gidLink(cast(void**)&g_tls_password_set_description, "g_tls_password_set_description", libs);
  gidLink(cast(void**)&g_tls_password_set_flags, "g_tls_password_set_flags", libs);
  gidLink(cast(void**)&g_tls_password_set_value, "g_tls_password_set_value", libs);
  gidLink(cast(void**)&g_tls_password_set_value_full, "g_tls_password_set_value_full", libs);
  gidLink(cast(void**)&g_tls_password_set_warning, "g_tls_password_set_warning", libs);

  // TlsServerConnection
  gidLink(cast(void**)&g_tls_server_connection_get_type, "g_tls_server_connection_get_type", libs);
  gidLink(cast(void**)&g_tls_server_connection_new, "g_tls_server_connection_new", libs);

  // UnixConnection
  gidLink(cast(void**)&g_unix_connection_get_type, "g_unix_connection_get_type", libs);
  gidLink(cast(void**)&g_unix_connection_receive_credentials, "g_unix_connection_receive_credentials", libs);
  gidLink(cast(void**)&g_unix_connection_receive_credentials_async, "g_unix_connection_receive_credentials_async", libs);
  gidLink(cast(void**)&g_unix_connection_receive_credentials_finish, "g_unix_connection_receive_credentials_finish", libs);
  gidLink(cast(void**)&g_unix_connection_receive_fd, "g_unix_connection_receive_fd", libs);
  gidLink(cast(void**)&g_unix_connection_send_credentials, "g_unix_connection_send_credentials", libs);
  gidLink(cast(void**)&g_unix_connection_send_credentials_async, "g_unix_connection_send_credentials_async", libs);
  gidLink(cast(void**)&g_unix_connection_send_credentials_finish, "g_unix_connection_send_credentials_finish", libs);
  gidLink(cast(void**)&g_unix_connection_send_fd, "g_unix_connection_send_fd", libs);

  // UnixCredentialsMessage
  gidLink(cast(void**)&g_unix_credentials_message_get_type, "g_unix_credentials_message_get_type", libs);
  gidLink(cast(void**)&g_unix_credentials_message_new, "g_unix_credentials_message_new", libs);
  gidLink(cast(void**)&g_unix_credentials_message_new_with_credentials, "g_unix_credentials_message_new_with_credentials", libs);
  gidLink(cast(void**)&g_unix_credentials_message_is_supported, "g_unix_credentials_message_is_supported", libs);
  gidLink(cast(void**)&g_unix_credentials_message_get_credentials, "g_unix_credentials_message_get_credentials", libs);

  // UnixFDList
  gidLink(cast(void**)&g_unix_fd_list_get_type, "g_unix_fd_list_get_type", libs);
  gidLink(cast(void**)&g_unix_fd_list_new, "g_unix_fd_list_new", libs);
  gidLink(cast(void**)&g_unix_fd_list_new_from_array, "g_unix_fd_list_new_from_array", libs);
  gidLink(cast(void**)&g_unix_fd_list_append, "g_unix_fd_list_append", libs);
  gidLink(cast(void**)&g_unix_fd_list_get, "g_unix_fd_list_get", libs);
  gidLink(cast(void**)&g_unix_fd_list_get_length, "g_unix_fd_list_get_length", libs);
  gidLink(cast(void**)&g_unix_fd_list_peek_fds, "g_unix_fd_list_peek_fds", libs);
  gidLink(cast(void**)&g_unix_fd_list_steal_fds, "g_unix_fd_list_steal_fds", libs);

  // UnixSocketAddress
  gidLink(cast(void**)&g_unix_socket_address_get_type, "g_unix_socket_address_get_type", libs);
  gidLink(cast(void**)&g_unix_socket_address_new, "g_unix_socket_address_new", libs);
  gidLink(cast(void**)&g_unix_socket_address_new_abstract, "g_unix_socket_address_new_abstract", libs);
  gidLink(cast(void**)&g_unix_socket_address_new_with_type, "g_unix_socket_address_new_with_type", libs);
  gidLink(cast(void**)&g_unix_socket_address_abstract_names_supported, "g_unix_socket_address_abstract_names_supported", libs);
  gidLink(cast(void**)&g_unix_socket_address_get_address_type, "g_unix_socket_address_get_address_type", libs);
  gidLink(cast(void**)&g_unix_socket_address_get_is_abstract, "g_unix_socket_address_get_is_abstract", libs);
  gidLink(cast(void**)&g_unix_socket_address_get_path, "g_unix_socket_address_get_path", libs);
  gidLink(cast(void**)&g_unix_socket_address_get_path_len, "g_unix_socket_address_get_path_len", libs);

  // Vfs
  gidLink(cast(void**)&g_vfs_get_type, "g_vfs_get_type", libs);
  gidLink(cast(void**)&g_vfs_get_default, "g_vfs_get_default", libs);
  gidLink(cast(void**)&g_vfs_get_local, "g_vfs_get_local", libs);
  gidLink(cast(void**)&g_vfs_get_file_for_path, "g_vfs_get_file_for_path", libs);
  gidLink(cast(void**)&g_vfs_get_file_for_uri, "g_vfs_get_file_for_uri", libs);
  gidLink(cast(void**)&g_vfs_get_supported_uri_schemes, "g_vfs_get_supported_uri_schemes", libs);
  gidLink(cast(void**)&g_vfs_is_active, "g_vfs_is_active", libs);
  gidLink(cast(void**)&g_vfs_parse_name, "g_vfs_parse_name", libs);
  gidLink(cast(void**)&g_vfs_register_uri_scheme, "g_vfs_register_uri_scheme", libs);
  gidLink(cast(void**)&g_vfs_unregister_uri_scheme, "g_vfs_unregister_uri_scheme", libs);

  // Volume
  gidLink(cast(void**)&g_volume_get_type, "g_volume_get_type", libs);
  gidLink(cast(void**)&g_volume_can_eject, "g_volume_can_eject", libs);
  gidLink(cast(void**)&g_volume_can_mount, "g_volume_can_mount", libs);
  gidLink(cast(void**)&g_volume_eject, "g_volume_eject", libs);
  gidLink(cast(void**)&g_volume_eject_finish, "g_volume_eject_finish", libs);
  gidLink(cast(void**)&g_volume_eject_with_operation, "g_volume_eject_with_operation", libs);
  gidLink(cast(void**)&g_volume_eject_with_operation_finish, "g_volume_eject_with_operation_finish", libs);
  gidLink(cast(void**)&g_volume_enumerate_identifiers, "g_volume_enumerate_identifiers", libs);
  gidLink(cast(void**)&g_volume_get_activation_root, "g_volume_get_activation_root", libs);
  gidLink(cast(void**)&g_volume_get_drive, "g_volume_get_drive", libs);
  gidLink(cast(void**)&g_volume_get_icon, "g_volume_get_icon", libs);
  gidLink(cast(void**)&g_volume_get_identifier, "g_volume_get_identifier", libs);
  gidLink(cast(void**)&g_volume_get_mount, "g_volume_get_mount", libs);
  gidLink(cast(void**)&g_volume_get_name, "g_volume_get_name", libs);
  gidLink(cast(void**)&g_volume_get_sort_key, "g_volume_get_sort_key", libs);
  gidLink(cast(void**)&g_volume_get_symbolic_icon, "g_volume_get_symbolic_icon", libs);
  gidLink(cast(void**)&g_volume_get_uuid, "g_volume_get_uuid", libs);
  gidLink(cast(void**)&g_volume_mount, "g_volume_mount", libs);
  gidLink(cast(void**)&g_volume_mount_finish, "g_volume_mount_finish", libs);
  gidLink(cast(void**)&g_volume_should_automount, "g_volume_should_automount", libs);

  // VolumeMonitor
  gidLink(cast(void**)&g_volume_monitor_get_type, "g_volume_monitor_get_type", libs);
  gidLink(cast(void**)&g_volume_monitor_adopt_orphan_mount, "g_volume_monitor_adopt_orphan_mount", libs);
  gidLink(cast(void**)&g_volume_monitor_get, "g_volume_monitor_get", libs);
  gidLink(cast(void**)&g_volume_monitor_get_connected_drives, "g_volume_monitor_get_connected_drives", libs);
  gidLink(cast(void**)&g_volume_monitor_get_mount_for_uuid, "g_volume_monitor_get_mount_for_uuid", libs);
  gidLink(cast(void**)&g_volume_monitor_get_mounts, "g_volume_monitor_get_mounts", libs);
  gidLink(cast(void**)&g_volume_monitor_get_volume_for_uuid, "g_volume_monitor_get_volume_for_uuid", libs);
  gidLink(cast(void**)&g_volume_monitor_get_volumes, "g_volume_monitor_get_volumes", libs);

  // ZlibCompressor
  gidLink(cast(void**)&g_zlib_compressor_get_type, "g_zlib_compressor_get_type", libs);
  gidLink(cast(void**)&g_zlib_compressor_new, "g_zlib_compressor_new", libs);
  gidLink(cast(void**)&g_zlib_compressor_get_file_info, "g_zlib_compressor_get_file_info", libs);
  gidLink(cast(void**)&g_zlib_compressor_get_os, "g_zlib_compressor_get_os", libs);
  gidLink(cast(void**)&g_zlib_compressor_set_file_info, "g_zlib_compressor_set_file_info", libs);
  gidLink(cast(void**)&g_zlib_compressor_set_os, "g_zlib_compressor_set_os", libs);

  // ZlibDecompressor
  gidLink(cast(void**)&g_zlib_decompressor_get_type, "g_zlib_decompressor_get_type", libs);
  gidLink(cast(void**)&g_zlib_decompressor_new, "g_zlib_decompressor_new", libs);
  gidLink(cast(void**)&g_zlib_decompressor_get_file_info, "g_zlib_decompressor_get_file_info", libs);

  // global
  gidLink(cast(void**)&g_bus_get, "g_bus_get", libs);
  gidLink(cast(void**)&g_bus_get_finish, "g_bus_get_finish", libs);
  gidLink(cast(void**)&g_bus_get_sync, "g_bus_get_sync", libs);
  gidLink(cast(void**)&g_bus_own_name, "g_bus_own_name", libs);
  gidLink(cast(void**)&g_bus_own_name_on_connection, "g_bus_own_name_on_connection", libs);
  gidLink(cast(void**)&g_bus_own_name_on_connection_with_closures, "g_bus_own_name_on_connection_with_closures", libs);
  gidLink(cast(void**)&g_bus_own_name_with_closures, "g_bus_own_name_with_closures", libs);
  gidLink(cast(void**)&g_bus_unown_name, "g_bus_unown_name", libs);
  gidLink(cast(void**)&g_bus_unwatch_name, "g_bus_unwatch_name", libs);
  gidLink(cast(void**)&g_bus_watch_name, "g_bus_watch_name", libs);
  gidLink(cast(void**)&g_bus_watch_name_on_connection, "g_bus_watch_name_on_connection", libs);
  gidLink(cast(void**)&g_bus_watch_name_on_connection_with_closures, "g_bus_watch_name_on_connection_with_closures", libs);
  gidLink(cast(void**)&g_bus_watch_name_with_closures, "g_bus_watch_name_with_closures", libs);
  gidLink(cast(void**)&g_content_type_can_be_executable, "g_content_type_can_be_executable", libs);
  gidLink(cast(void**)&g_content_type_equals, "g_content_type_equals", libs);
  gidLink(cast(void**)&g_content_type_from_mime_type, "g_content_type_from_mime_type", libs);
  gidLink(cast(void**)&g_content_type_get_description, "g_content_type_get_description", libs);
  gidLink(cast(void**)&g_content_type_get_generic_icon_name, "g_content_type_get_generic_icon_name", libs);
  gidLink(cast(void**)&g_content_type_get_icon, "g_content_type_get_icon", libs);
  gidLink(cast(void**)&g_content_type_get_mime_dirs, "g_content_type_get_mime_dirs", libs);
  gidLink(cast(void**)&g_content_type_get_mime_type, "g_content_type_get_mime_type", libs);
  gidLink(cast(void**)&g_content_type_get_symbolic_icon, "g_content_type_get_symbolic_icon", libs);
  gidLink(cast(void**)&g_content_type_guess, "g_content_type_guess", libs);
  gidLink(cast(void**)&g_content_type_guess_for_tree, "g_content_type_guess_for_tree", libs);
  gidLink(cast(void**)&g_content_type_is_a, "g_content_type_is_a", libs);
  gidLink(cast(void**)&g_content_type_is_mime_type, "g_content_type_is_mime_type", libs);
  gidLink(cast(void**)&g_content_type_is_unknown, "g_content_type_is_unknown", libs);
  gidLink(cast(void**)&g_content_type_set_mime_dirs, "g_content_type_set_mime_dirs", libs);
  gidLink(cast(void**)&g_content_types_get_registered, "g_content_types_get_registered", libs);
  gidLink(cast(void**)&g_dbus_address_escape_value, "g_dbus_address_escape_value", libs);
  gidLink(cast(void**)&g_dbus_address_get_for_bus_sync, "g_dbus_address_get_for_bus_sync", libs);
  gidLink(cast(void**)&g_dbus_address_get_stream, "g_dbus_address_get_stream", libs);
  gidLink(cast(void**)&g_dbus_address_get_stream_finish, "g_dbus_address_get_stream_finish", libs);
  gidLink(cast(void**)&g_dbus_address_get_stream_sync, "g_dbus_address_get_stream_sync", libs);
  gidLink(cast(void**)&g_dbus_escape_object_path, "g_dbus_escape_object_path", libs);
  gidLink(cast(void**)&g_dbus_escape_object_path_bytestring, "g_dbus_escape_object_path_bytestring", libs);
  gidLink(cast(void**)&g_dbus_generate_guid, "g_dbus_generate_guid", libs);
  gidLink(cast(void**)&g_dbus_gvalue_to_gvariant, "g_dbus_gvalue_to_gvariant", libs);
  gidLink(cast(void**)&g_dbus_gvariant_to_gvalue, "g_dbus_gvariant_to_gvalue", libs);
  gidLink(cast(void**)&g_dbus_is_address, "g_dbus_is_address", libs);
  gidLink(cast(void**)&g_dbus_is_error_name, "g_dbus_is_error_name", libs);
  gidLink(cast(void**)&g_dbus_is_guid, "g_dbus_is_guid", libs);
  gidLink(cast(void**)&g_dbus_is_interface_name, "g_dbus_is_interface_name", libs);
  gidLink(cast(void**)&g_dbus_is_member_name, "g_dbus_is_member_name", libs);
  gidLink(cast(void**)&g_dbus_is_name, "g_dbus_is_name", libs);
  gidLink(cast(void**)&g_dbus_is_supported_address, "g_dbus_is_supported_address", libs);
  gidLink(cast(void**)&g_dbus_is_unique_name, "g_dbus_is_unique_name", libs);
  gidLink(cast(void**)&g_dbus_unescape_object_path, "g_dbus_unescape_object_path", libs);
  gidLink(cast(void**)&g_io_error_from_errno, "g_io_error_from_errno", libs);
  gidLink(cast(void**)&g_io_error_from_file_error, "g_io_error_from_file_error", libs);
  gidLink(cast(void**)&g_io_error_quark, "g_io_error_quark", libs);
  gidLink(cast(void**)&g_io_modules_load_all_in_directory, "g_io_modules_load_all_in_directory", libs);
  gidLink(cast(void**)&g_io_modules_load_all_in_directory_with_scope, "g_io_modules_load_all_in_directory_with_scope", libs);
  gidLink(cast(void**)&g_io_modules_scan_all_in_directory, "g_io_modules_scan_all_in_directory", libs);
  gidLink(cast(void**)&g_io_modules_scan_all_in_directory_with_scope, "g_io_modules_scan_all_in_directory_with_scope", libs);
  gidLink(cast(void**)&g_io_scheduler_cancel_all_jobs, "g_io_scheduler_cancel_all_jobs", libs);
  gidLink(cast(void**)&g_io_scheduler_push_job, "g_io_scheduler_push_job", libs);
  gidLink(cast(void**)&g_keyfile_settings_backend_new, "g_keyfile_settings_backend_new", libs);
  gidLink(cast(void**)&g_memory_settings_backend_new, "g_memory_settings_backend_new", libs);
  gidLink(cast(void**)&g_networking_init, "g_networking_init", libs);
  gidLink(cast(void**)&g_null_settings_backend_new, "g_null_settings_backend_new", libs);
  gidLink(cast(void**)&g_pollable_source_new, "g_pollable_source_new", libs);
  gidLink(cast(void**)&g_pollable_source_new_full, "g_pollable_source_new_full", libs);
  gidLink(cast(void**)&g_pollable_stream_read, "g_pollable_stream_read", libs);
  gidLink(cast(void**)&g_pollable_stream_write, "g_pollable_stream_write", libs);
  gidLink(cast(void**)&g_pollable_stream_write_all, "g_pollable_stream_write_all", libs);
  gidLink(cast(void**)&g_resources_enumerate_children, "g_resources_enumerate_children", libs);
  gidLink(cast(void**)&g_resources_get_info, "g_resources_get_info", libs);
  gidLink(cast(void**)&g_resources_has_children, "g_resources_has_children", libs);
  gidLink(cast(void**)&g_resources_lookup_data, "g_resources_lookup_data", libs);
  gidLink(cast(void**)&g_resources_open_stream, "g_resources_open_stream", libs);
  gidLink(cast(void**)&g_resources_register, "g_resources_register", libs);
  gidLink(cast(void**)&g_resources_unregister, "g_resources_unregister", libs);
  gidLink(cast(void**)&g_simple_async_report_error_in_idle, "g_simple_async_report_error_in_idle", libs);
  gidLink(cast(void**)&g_simple_async_report_gerror_in_idle, "g_simple_async_report_gerror_in_idle", libs);
  gidLink(cast(void**)&g_simple_async_report_take_gerror_in_idle, "g_simple_async_report_take_gerror_in_idle", libs);

  // DBusError
  gidLink(cast(void**)&g_dbus_error_encode_gerror, "g_dbus_error_encode_gerror", libs);
  gidLink(cast(void**)&g_dbus_error_get_remote_error, "g_dbus_error_get_remote_error", libs);
  gidLink(cast(void**)&g_dbus_error_is_remote_error, "g_dbus_error_is_remote_error", libs);
  gidLink(cast(void**)&g_dbus_error_new_for_dbus_error, "g_dbus_error_new_for_dbus_error", libs);
  gidLink(cast(void**)&g_dbus_error_quark, "g_dbus_error_quark", libs);
  gidLink(cast(void**)&g_dbus_error_register_error, "g_dbus_error_register_error", libs);
  gidLink(cast(void**)&g_dbus_error_register_error_domain, "g_dbus_error_register_error_domain", libs);
  gidLink(cast(void**)&g_dbus_error_set_dbus_error, "g_dbus_error_set_dbus_error", libs);
  gidLink(cast(void**)&g_dbus_error_set_dbus_error_valist, "g_dbus_error_set_dbus_error_valist", libs);
  gidLink(cast(void**)&g_dbus_error_strip_remote_error, "g_dbus_error_strip_remote_error", libs);
  gidLink(cast(void**)&g_dbus_error_unregister_error, "g_dbus_error_unregister_error", libs);

  // ResolverError
  gidLink(cast(void**)&g_resolver_error_quark, "g_resolver_error_quark", libs);

  // ResourceError
  gidLink(cast(void**)&g_resource_error_quark, "g_resource_error_quark", libs);

  // TlsChannelBindingError
  gidLink(cast(void**)&g_tls_channel_binding_error_quark, "g_tls_channel_binding_error_quark", libs);

  // TlsError
  gidLink(cast(void**)&g_tls_error_quark, "g_tls_error_quark", libs);
}
