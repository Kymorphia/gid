/// C functions for gdk3 library
module gid.gdk3.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gdk3.c.types;
public import gid.cairo1.c.types;
public import gid.gdkpixbuf2.c.types;
public import gid.gio2.c.types;
public import gid.pango1.c.types;

private immutable LIBS = ["gdk-3_0"];

// AppLaunchContext
private alias c_gdk_app_launch_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_app_launch_context_get_typeFn c_gdk_app_launch_context_get_type; ///
private alias c_gdk_app_launch_context_newFn = extern(C) GdkAppLaunchContext* function() nothrow;
__gshared c_gdk_app_launch_context_newFn c_gdk_app_launch_context_new; ///
private alias c_gdk_app_launch_context_set_desktopFn = extern(C) void function(GdkAppLaunchContext* context, int desktop) nothrow;
__gshared c_gdk_app_launch_context_set_desktopFn c_gdk_app_launch_context_set_desktop; ///
private alias c_gdk_app_launch_context_set_displayFn = extern(C) void function(GdkAppLaunchContext* context, GdkDisplay* display) nothrow;
__gshared c_gdk_app_launch_context_set_displayFn c_gdk_app_launch_context_set_display; ///
private alias c_gdk_app_launch_context_set_iconFn = extern(C) void function(GdkAppLaunchContext* context, GIcon* icon) nothrow;
__gshared c_gdk_app_launch_context_set_iconFn c_gdk_app_launch_context_set_icon; ///
private alias c_gdk_app_launch_context_set_icon_nameFn = extern(C) void function(GdkAppLaunchContext* context, const(char)* iconName) nothrow;
__gshared c_gdk_app_launch_context_set_icon_nameFn c_gdk_app_launch_context_set_icon_name; ///
private alias c_gdk_app_launch_context_set_screenFn = extern(C) void function(GdkAppLaunchContext* context, GdkScreen* screen) nothrow;
__gshared c_gdk_app_launch_context_set_screenFn c_gdk_app_launch_context_set_screen; ///
private alias c_gdk_app_launch_context_set_timestampFn = extern(C) void function(GdkAppLaunchContext* context, uint timestamp) nothrow;
__gshared c_gdk_app_launch_context_set_timestampFn c_gdk_app_launch_context_set_timestamp; ///

// Atom
private alias c_gdk_atom_nameFn = extern(C) char* function(GdkAtom atom) nothrow;
__gshared c_gdk_atom_nameFn c_gdk_atom_name; ///
private alias c_gdk_atom_internFn = extern(C) GdkAtom function(const(char)* atomName, gboolean onlyIfExists) nothrow;
__gshared c_gdk_atom_internFn c_gdk_atom_intern; ///
private alias c_gdk_atom_intern_static_stringFn = extern(C) GdkAtom function(const(char)* atomName) nothrow;
__gshared c_gdk_atom_intern_static_stringFn c_gdk_atom_intern_static_string; ///

// Color
private alias c_gdk_color_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_color_get_typeFn c_gdk_color_get_type; ///
private alias c_gdk_color_copyFn = extern(C) GdkColor* function(const(GdkColor)* color) nothrow;
__gshared c_gdk_color_copyFn c_gdk_color_copy; ///
private alias c_gdk_color_equalFn = extern(C) gboolean function(const(GdkColor)* colora, const(GdkColor)* colorb) nothrow;
__gshared c_gdk_color_equalFn c_gdk_color_equal; ///
private alias c_gdk_color_freeFn = extern(C) void function(GdkColor* color) nothrow;
__gshared c_gdk_color_freeFn c_gdk_color_free; ///
private alias c_gdk_color_hashFn = extern(C) uint function(const(GdkColor)* color) nothrow;
__gshared c_gdk_color_hashFn c_gdk_color_hash; ///
private alias c_gdk_color_to_stringFn = extern(C) char* function(const(GdkColor)* color) nothrow;
__gshared c_gdk_color_to_stringFn c_gdk_color_to_string; ///
private alias c_gdk_color_parseFn = extern(C) gboolean function(const(char)* spec, GdkColor* color) nothrow;
__gshared c_gdk_color_parseFn c_gdk_color_parse; ///

// Cursor
private alias c_gdk_cursor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_cursor_get_typeFn c_gdk_cursor_get_type; ///
private alias c_gdk_cursor_newFn = extern(C) GdkCursor* function(GdkCursorType cursorType) nothrow;
__gshared c_gdk_cursor_newFn c_gdk_cursor_new; ///
private alias c_gdk_cursor_new_for_displayFn = extern(C) GdkCursor* function(GdkDisplay* display, GdkCursorType cursorType) nothrow;
__gshared c_gdk_cursor_new_for_displayFn c_gdk_cursor_new_for_display; ///
private alias c_gdk_cursor_new_from_nameFn = extern(C) GdkCursor* function(GdkDisplay* display, const(char)* name) nothrow;
__gshared c_gdk_cursor_new_from_nameFn c_gdk_cursor_new_from_name; ///
private alias c_gdk_cursor_new_from_pixbufFn = extern(C) GdkCursor* function(GdkDisplay* display, GdkPixbuf* pixbuf, int x, int y) nothrow;
__gshared c_gdk_cursor_new_from_pixbufFn c_gdk_cursor_new_from_pixbuf; ///
private alias c_gdk_cursor_new_from_surfaceFn = extern(C) GdkCursor* function(GdkDisplay* display, cairo_surface_t* surface, double x, double y) nothrow;
__gshared c_gdk_cursor_new_from_surfaceFn c_gdk_cursor_new_from_surface; ///
private alias c_gdk_cursor_get_cursor_typeFn = extern(C) GdkCursorType function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_cursor_typeFn c_gdk_cursor_get_cursor_type; ///
private alias c_gdk_cursor_get_displayFn = extern(C) GdkDisplay* function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_displayFn c_gdk_cursor_get_display; ///
private alias c_gdk_cursor_get_imageFn = extern(C) GdkPixbuf* function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_imageFn c_gdk_cursor_get_image; ///
private alias c_gdk_cursor_get_surfaceFn = extern(C) cairo_surface_t* function(GdkCursor* cursor, double* xHot, double* yHot) nothrow;
__gshared c_gdk_cursor_get_surfaceFn c_gdk_cursor_get_surface; ///
private alias c_gdk_cursor_refFn = extern(C) GdkCursor* function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_refFn c_gdk_cursor_ref; ///
private alias c_gdk_cursor_unrefFn = extern(C) void function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_unrefFn c_gdk_cursor_unref; ///

// Device
private alias c_gdk_device_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_device_get_typeFn c_gdk_device_get_type; ///
private alias c_gdk_device_free_historyFn = extern(C) void function(GdkTimeCoord** events, int nEvents) nothrow;
__gshared c_gdk_device_free_historyFn c_gdk_device_free_history; ///
private alias c_gdk_device_grab_info_libgtk_onlyFn = extern(C) gboolean function(GdkDisplay* display, GdkDevice* device, GdkWindow** grabWindow, gboolean* ownerEvents) nothrow;
__gshared c_gdk_device_grab_info_libgtk_onlyFn c_gdk_device_grab_info_libgtk_only; ///
private alias c_gdk_device_get_associated_deviceFn = extern(C) GdkDevice* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_associated_deviceFn c_gdk_device_get_associated_device; ///
private alias c_gdk_device_get_axesFn = extern(C) GdkAxisFlags function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_axesFn c_gdk_device_get_axes; ///
private alias c_gdk_device_get_axisFn = extern(C) gboolean function(GdkDevice* device, double* axes, GdkAxisUse use, double* value) nothrow;
__gshared c_gdk_device_get_axisFn c_gdk_device_get_axis; ///
private alias c_gdk_device_get_axis_useFn = extern(C) GdkAxisUse function(GdkDevice* device, uint index) nothrow;
__gshared c_gdk_device_get_axis_useFn c_gdk_device_get_axis_use; ///
private alias c_gdk_device_get_axis_valueFn = extern(C) gboolean function(GdkDevice* device, double* axes, GdkAtom axisLabel, double* value) nothrow;
__gshared c_gdk_device_get_axis_valueFn c_gdk_device_get_axis_value; ///
private alias c_gdk_device_get_device_typeFn = extern(C) GdkDeviceType function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_device_typeFn c_gdk_device_get_device_type; ///
private alias c_gdk_device_get_displayFn = extern(C) GdkDisplay* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_displayFn c_gdk_device_get_display; ///
private alias c_gdk_device_get_has_cursorFn = extern(C) gboolean function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_has_cursorFn c_gdk_device_get_has_cursor; ///
private alias c_gdk_device_get_historyFn = extern(C) gboolean function(GdkDevice* device, GdkWindow* window, uint start, uint stop, GdkTimeCoord*** events, int* nEvents) nothrow;
__gshared c_gdk_device_get_historyFn c_gdk_device_get_history; ///
private alias c_gdk_device_get_keyFn = extern(C) gboolean function(GdkDevice* device, uint index, uint* keyval, GdkModifierType* modifiers) nothrow;
__gshared c_gdk_device_get_keyFn c_gdk_device_get_key; ///
private alias c_gdk_device_get_last_event_windowFn = extern(C) GdkWindow* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_last_event_windowFn c_gdk_device_get_last_event_window; ///
private alias c_gdk_device_get_modeFn = extern(C) GdkInputMode function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_modeFn c_gdk_device_get_mode; ///
private alias c_gdk_device_get_n_axesFn = extern(C) int function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_n_axesFn c_gdk_device_get_n_axes; ///
private alias c_gdk_device_get_n_keysFn = extern(C) int function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_n_keysFn c_gdk_device_get_n_keys; ///
private alias c_gdk_device_get_nameFn = extern(C) const(char)* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_nameFn c_gdk_device_get_name; ///
private alias c_gdk_device_get_positionFn = extern(C) void function(GdkDevice* device, GdkScreen** screen, int* x, int* y) nothrow;
__gshared c_gdk_device_get_positionFn c_gdk_device_get_position; ///
private alias c_gdk_device_get_position_doubleFn = extern(C) void function(GdkDevice* device, GdkScreen** screen, double* x, double* y) nothrow;
__gshared c_gdk_device_get_position_doubleFn c_gdk_device_get_position_double; ///
private alias c_gdk_device_get_product_idFn = extern(C) const(char)* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_product_idFn c_gdk_device_get_product_id; ///
private alias c_gdk_device_get_seatFn = extern(C) GdkSeat* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_seatFn c_gdk_device_get_seat; ///
private alias c_gdk_device_get_sourceFn = extern(C) GdkInputSource function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_sourceFn c_gdk_device_get_source; ///
private alias c_gdk_device_get_stateFn = extern(C) void function(GdkDevice* device, GdkWindow* window, double* axes, GdkModifierType* mask) nothrow;
__gshared c_gdk_device_get_stateFn c_gdk_device_get_state; ///
private alias c_gdk_device_get_vendor_idFn = extern(C) const(char)* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_vendor_idFn c_gdk_device_get_vendor_id; ///
private alias c_gdk_device_get_window_at_positionFn = extern(C) GdkWindow* function(GdkDevice* device, int* winX, int* winY) nothrow;
__gshared c_gdk_device_get_window_at_positionFn c_gdk_device_get_window_at_position; ///
private alias c_gdk_device_get_window_at_position_doubleFn = extern(C) GdkWindow* function(GdkDevice* device, double* winX, double* winY) nothrow;
__gshared c_gdk_device_get_window_at_position_doubleFn c_gdk_device_get_window_at_position_double; ///
private alias c_gdk_device_grabFn = extern(C) GdkGrabStatus function(GdkDevice* device, GdkWindow* window, GdkGrabOwnership grabOwnership, gboolean ownerEvents, GdkEventMask eventMask, GdkCursor* cursor, uint time) nothrow;
__gshared c_gdk_device_grabFn c_gdk_device_grab; ///
private alias c_gdk_device_list_axesFn = extern(C) GList* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_list_axesFn c_gdk_device_list_axes; ///
private alias c_gdk_device_list_slave_devicesFn = extern(C) GList* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_list_slave_devicesFn c_gdk_device_list_slave_devices; ///
private alias c_gdk_device_set_axis_useFn = extern(C) void function(GdkDevice* device, uint index, GdkAxisUse use) nothrow;
__gshared c_gdk_device_set_axis_useFn c_gdk_device_set_axis_use; ///
private alias c_gdk_device_set_keyFn = extern(C) void function(GdkDevice* device, uint index, uint keyval, GdkModifierType modifiers) nothrow;
__gshared c_gdk_device_set_keyFn c_gdk_device_set_key; ///
private alias c_gdk_device_set_modeFn = extern(C) gboolean function(GdkDevice* device, GdkInputMode mode) nothrow;
__gshared c_gdk_device_set_modeFn c_gdk_device_set_mode; ///
private alias c_gdk_device_ungrabFn = extern(C) void function(GdkDevice* device, uint time) nothrow;
__gshared c_gdk_device_ungrabFn c_gdk_device_ungrab; ///
private alias c_gdk_device_warpFn = extern(C) void function(GdkDevice* device, GdkScreen* screen, int x, int y) nothrow;
__gshared c_gdk_device_warpFn c_gdk_device_warp; ///

// DeviceManager
private alias c_gdk_device_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_device_manager_get_typeFn c_gdk_device_manager_get_type; ///
private alias c_gdk_device_manager_get_client_pointerFn = extern(C) GdkDevice* function(GdkDeviceManager* deviceManager) nothrow;
__gshared c_gdk_device_manager_get_client_pointerFn c_gdk_device_manager_get_client_pointer; ///
private alias c_gdk_device_manager_get_displayFn = extern(C) GdkDisplay* function(GdkDeviceManager* deviceManager) nothrow;
__gshared c_gdk_device_manager_get_displayFn c_gdk_device_manager_get_display; ///
private alias c_gdk_device_manager_list_devicesFn = extern(C) GList* function(GdkDeviceManager* deviceManager, GdkDeviceType type) nothrow;
__gshared c_gdk_device_manager_list_devicesFn c_gdk_device_manager_list_devices; ///

// DevicePad
private alias c_gdk_device_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_device_pad_get_typeFn c_gdk_device_pad_get_type; ///
private alias c_gdk_device_pad_get_feature_groupFn = extern(C) int function(GdkDevicePad* pad, GdkDevicePadFeature feature, int featureIdx) nothrow;
__gshared c_gdk_device_pad_get_feature_groupFn c_gdk_device_pad_get_feature_group; ///
private alias c_gdk_device_pad_get_group_n_modesFn = extern(C) int function(GdkDevicePad* pad, int groupIdx) nothrow;
__gshared c_gdk_device_pad_get_group_n_modesFn c_gdk_device_pad_get_group_n_modes; ///
private alias c_gdk_device_pad_get_n_featuresFn = extern(C) int function(GdkDevicePad* pad, GdkDevicePadFeature feature) nothrow;
__gshared c_gdk_device_pad_get_n_featuresFn c_gdk_device_pad_get_n_features; ///
private alias c_gdk_device_pad_get_n_groupsFn = extern(C) int function(GdkDevicePad* pad) nothrow;
__gshared c_gdk_device_pad_get_n_groupsFn c_gdk_device_pad_get_n_groups; ///

// DeviceTool
private alias c_gdk_device_tool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_device_tool_get_typeFn c_gdk_device_tool_get_type; ///
private alias c_gdk_device_tool_get_hardware_idFn = extern(C) ulong function(GdkDeviceTool* tool) nothrow;
__gshared c_gdk_device_tool_get_hardware_idFn c_gdk_device_tool_get_hardware_id; ///
private alias c_gdk_device_tool_get_serialFn = extern(C) ulong function(GdkDeviceTool* tool) nothrow;
__gshared c_gdk_device_tool_get_serialFn c_gdk_device_tool_get_serial; ///
private alias c_gdk_device_tool_get_tool_typeFn = extern(C) GdkDeviceToolType function(GdkDeviceTool* tool) nothrow;
__gshared c_gdk_device_tool_get_tool_typeFn c_gdk_device_tool_get_tool_type; ///

// Display
private alias c_gdk_display_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_display_get_typeFn c_gdk_display_get_type; ///
private alias c_gdk_display_get_defaultFn = extern(C) GdkDisplay* function() nothrow;
__gshared c_gdk_display_get_defaultFn c_gdk_display_get_default; ///
private alias c_gdk_display_openFn = extern(C) GdkDisplay* function(const(char)* displayName) nothrow;
__gshared c_gdk_display_openFn c_gdk_display_open; ///
private alias c_gdk_display_open_default_libgtk_onlyFn = extern(C) GdkDisplay* function() nothrow;
__gshared c_gdk_display_open_default_libgtk_onlyFn c_gdk_display_open_default_libgtk_only; ///
private alias c_gdk_display_beepFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_beepFn c_gdk_display_beep; ///
private alias c_gdk_display_closeFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_closeFn c_gdk_display_close; ///
private alias c_gdk_display_device_is_grabbedFn = extern(C) gboolean function(GdkDisplay* display, GdkDevice* device) nothrow;
__gshared c_gdk_display_device_is_grabbedFn c_gdk_display_device_is_grabbed; ///
private alias c_gdk_display_flushFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_flushFn c_gdk_display_flush; ///
private alias c_gdk_display_get_app_launch_contextFn = extern(C) GdkAppLaunchContext* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_app_launch_contextFn c_gdk_display_get_app_launch_context; ///
private alias c_gdk_display_get_default_cursor_sizeFn = extern(C) uint function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_default_cursor_sizeFn c_gdk_display_get_default_cursor_size; ///
private alias c_gdk_display_get_default_groupFn = extern(C) GdkWindow* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_default_groupFn c_gdk_display_get_default_group; ///
private alias c_gdk_display_get_default_screenFn = extern(C) GdkScreen* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_default_screenFn c_gdk_display_get_default_screen; ///
private alias c_gdk_display_get_default_seatFn = extern(C) GdkSeat* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_default_seatFn c_gdk_display_get_default_seat; ///
private alias c_gdk_display_get_device_managerFn = extern(C) GdkDeviceManager* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_device_managerFn c_gdk_display_get_device_manager; ///
private alias c_gdk_display_get_eventFn = extern(C) GdkEvent* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_eventFn c_gdk_display_get_event; ///
private alias c_gdk_display_get_maximal_cursor_sizeFn = extern(C) void function(GdkDisplay* display, uint* width, uint* height) nothrow;
__gshared c_gdk_display_get_maximal_cursor_sizeFn c_gdk_display_get_maximal_cursor_size; ///
private alias c_gdk_display_get_monitorFn = extern(C) GdkMonitor* function(GdkDisplay* display, int monitorNum) nothrow;
__gshared c_gdk_display_get_monitorFn c_gdk_display_get_monitor; ///
private alias c_gdk_display_get_monitor_at_pointFn = extern(C) GdkMonitor* function(GdkDisplay* display, int x, int y) nothrow;
__gshared c_gdk_display_get_monitor_at_pointFn c_gdk_display_get_monitor_at_point; ///
private alias c_gdk_display_get_monitor_at_windowFn = extern(C) GdkMonitor* function(GdkDisplay* display, GdkWindow* window) nothrow;
__gshared c_gdk_display_get_monitor_at_windowFn c_gdk_display_get_monitor_at_window; ///
private alias c_gdk_display_get_n_monitorsFn = extern(C) int function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_n_monitorsFn c_gdk_display_get_n_monitors; ///
private alias c_gdk_display_get_n_screensFn = extern(C) int function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_n_screensFn c_gdk_display_get_n_screens; ///
private alias c_gdk_display_get_nameFn = extern(C) const(char)* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_nameFn c_gdk_display_get_name; ///
private alias c_gdk_display_get_pointerFn = extern(C) void function(GdkDisplay* display, GdkScreen** screen, int* x, int* y, GdkModifierType* mask) nothrow;
__gshared c_gdk_display_get_pointerFn c_gdk_display_get_pointer; ///
private alias c_gdk_display_get_primary_monitorFn = extern(C) GdkMonitor* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_primary_monitorFn c_gdk_display_get_primary_monitor; ///
private alias c_gdk_display_get_screenFn = extern(C) GdkScreen* function(GdkDisplay* display, int screenNum) nothrow;
__gshared c_gdk_display_get_screenFn c_gdk_display_get_screen; ///
private alias c_gdk_display_get_window_at_pointerFn = extern(C) GdkWindow* function(GdkDisplay* display, int* winX, int* winY) nothrow;
__gshared c_gdk_display_get_window_at_pointerFn c_gdk_display_get_window_at_pointer; ///
private alias c_gdk_display_has_pendingFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_has_pendingFn c_gdk_display_has_pending; ///
private alias c_gdk_display_is_closedFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_is_closedFn c_gdk_display_is_closed; ///
private alias c_gdk_display_keyboard_ungrabFn = extern(C) void function(GdkDisplay* display, uint time) nothrow;
__gshared c_gdk_display_keyboard_ungrabFn c_gdk_display_keyboard_ungrab; ///
private alias c_gdk_display_list_devicesFn = extern(C) GList* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_list_devicesFn c_gdk_display_list_devices; ///
private alias c_gdk_display_list_seatsFn = extern(C) GList* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_list_seatsFn c_gdk_display_list_seats; ///
private alias c_gdk_display_notify_startup_completeFn = extern(C) void function(GdkDisplay* display, const(char)* startupId) nothrow;
__gshared c_gdk_display_notify_startup_completeFn c_gdk_display_notify_startup_complete; ///
private alias c_gdk_display_peek_eventFn = extern(C) GdkEvent* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_peek_eventFn c_gdk_display_peek_event; ///
private alias c_gdk_display_pointer_is_grabbedFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_pointer_is_grabbedFn c_gdk_display_pointer_is_grabbed; ///
private alias c_gdk_display_pointer_ungrabFn = extern(C) void function(GdkDisplay* display, uint time) nothrow;
__gshared c_gdk_display_pointer_ungrabFn c_gdk_display_pointer_ungrab; ///
private alias c_gdk_display_put_eventFn = extern(C) void function(GdkDisplay* display, const(GdkEvent)* event) nothrow;
__gshared c_gdk_display_put_eventFn c_gdk_display_put_event; ///
private alias c_gdk_display_request_selection_notificationFn = extern(C) gboolean function(GdkDisplay* display, GdkAtom selection) nothrow;
__gshared c_gdk_display_request_selection_notificationFn c_gdk_display_request_selection_notification; ///
private alias c_gdk_display_set_double_click_distanceFn = extern(C) void function(GdkDisplay* display, uint distance) nothrow;
__gshared c_gdk_display_set_double_click_distanceFn c_gdk_display_set_double_click_distance; ///
private alias c_gdk_display_set_double_click_timeFn = extern(C) void function(GdkDisplay* display, uint msec) nothrow;
__gshared c_gdk_display_set_double_click_timeFn c_gdk_display_set_double_click_time; ///
private alias c_gdk_display_store_clipboardFn = extern(C) void function(GdkDisplay* display, GdkWindow* clipboardWindow, uint time, const(GdkAtom)* targets, int nTargets) nothrow;
__gshared c_gdk_display_store_clipboardFn c_gdk_display_store_clipboard; ///
private alias c_gdk_display_supports_clipboard_persistenceFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_clipboard_persistenceFn c_gdk_display_supports_clipboard_persistence; ///
private alias c_gdk_display_supports_compositeFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_compositeFn c_gdk_display_supports_composite; ///
private alias c_gdk_display_supports_cursor_alphaFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_cursor_alphaFn c_gdk_display_supports_cursor_alpha; ///
private alias c_gdk_display_supports_cursor_colorFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_cursor_colorFn c_gdk_display_supports_cursor_color; ///
private alias c_gdk_display_supports_input_shapesFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_input_shapesFn c_gdk_display_supports_input_shapes; ///
private alias c_gdk_display_supports_selection_notificationFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_selection_notificationFn c_gdk_display_supports_selection_notification; ///
private alias c_gdk_display_supports_shapesFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_shapesFn c_gdk_display_supports_shapes; ///
private alias c_gdk_display_syncFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_syncFn c_gdk_display_sync; ///
private alias c_gdk_display_warp_pointerFn = extern(C) void function(GdkDisplay* display, GdkScreen* screen, int x, int y) nothrow;
__gshared c_gdk_display_warp_pointerFn c_gdk_display_warp_pointer; ///

// DisplayManager
private alias c_gdk_display_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_display_manager_get_typeFn c_gdk_display_manager_get_type; ///
private alias c_gdk_display_manager_getFn = extern(C) GdkDisplayManager* function() nothrow;
__gshared c_gdk_display_manager_getFn c_gdk_display_manager_get; ///
private alias c_gdk_display_manager_get_default_displayFn = extern(C) GdkDisplay* function(GdkDisplayManager* manager) nothrow;
__gshared c_gdk_display_manager_get_default_displayFn c_gdk_display_manager_get_default_display; ///
private alias c_gdk_display_manager_list_displaysFn = extern(C) GSList* function(GdkDisplayManager* manager) nothrow;
__gshared c_gdk_display_manager_list_displaysFn c_gdk_display_manager_list_displays; ///
private alias c_gdk_display_manager_open_displayFn = extern(C) GdkDisplay* function(GdkDisplayManager* manager, const(char)* name) nothrow;
__gshared c_gdk_display_manager_open_displayFn c_gdk_display_manager_open_display; ///
private alias c_gdk_display_manager_set_default_displayFn = extern(C) void function(GdkDisplayManager* manager, GdkDisplay* display) nothrow;
__gshared c_gdk_display_manager_set_default_displayFn c_gdk_display_manager_set_default_display; ///

// DragContext
private alias c_gdk_drag_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_drag_context_get_typeFn c_gdk_drag_context_get_type; ///
private alias c_gdk_drag_context_get_actionsFn = extern(C) GdkDragAction function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_actionsFn c_gdk_drag_context_get_actions; ///
private alias c_gdk_drag_context_get_dest_windowFn = extern(C) GdkWindow* function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_dest_windowFn c_gdk_drag_context_get_dest_window; ///
private alias c_gdk_drag_context_get_deviceFn = extern(C) GdkDevice* function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_deviceFn c_gdk_drag_context_get_device; ///
private alias c_gdk_drag_context_get_drag_windowFn = extern(C) GdkWindow* function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_drag_windowFn c_gdk_drag_context_get_drag_window; ///
private alias c_gdk_drag_context_get_protocolFn = extern(C) GdkDragProtocol function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_protocolFn c_gdk_drag_context_get_protocol; ///
private alias c_gdk_drag_context_get_selected_actionFn = extern(C) GdkDragAction function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_selected_actionFn c_gdk_drag_context_get_selected_action; ///
private alias c_gdk_drag_context_get_source_windowFn = extern(C) GdkWindow* function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_source_windowFn c_gdk_drag_context_get_source_window; ///
private alias c_gdk_drag_context_get_suggested_actionFn = extern(C) GdkDragAction function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_get_suggested_actionFn c_gdk_drag_context_get_suggested_action; ///
private alias c_gdk_drag_context_list_targetsFn = extern(C) GList* function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_context_list_targetsFn c_gdk_drag_context_list_targets; ///
private alias c_gdk_drag_context_manage_dndFn = extern(C) gboolean function(GdkDragContext* context, GdkWindow* ipcWindow, GdkDragAction actions) nothrow;
__gshared c_gdk_drag_context_manage_dndFn c_gdk_drag_context_manage_dnd; ///
private alias c_gdk_drag_context_set_deviceFn = extern(C) void function(GdkDragContext* context, GdkDevice* device) nothrow;
__gshared c_gdk_drag_context_set_deviceFn c_gdk_drag_context_set_device; ///
private alias c_gdk_drag_context_set_hotspotFn = extern(C) void function(GdkDragContext* context, int hotX, int hotY) nothrow;
__gshared c_gdk_drag_context_set_hotspotFn c_gdk_drag_context_set_hotspot; ///

// DrawingContext
private alias c_gdk_drawing_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_drawing_context_get_typeFn c_gdk_drawing_context_get_type; ///
private alias c_gdk_drawing_context_get_cairo_contextFn = extern(C) cairo_t* function(GdkDrawingContext* context) nothrow;
__gshared c_gdk_drawing_context_get_cairo_contextFn c_gdk_drawing_context_get_cairo_context; ///
private alias c_gdk_drawing_context_get_clipFn = extern(C) cairo_region_t* function(GdkDrawingContext* context) nothrow;
__gshared c_gdk_drawing_context_get_clipFn c_gdk_drawing_context_get_clip; ///
private alias c_gdk_drawing_context_get_windowFn = extern(C) GdkWindow* function(GdkDrawingContext* context) nothrow;
__gshared c_gdk_drawing_context_get_windowFn c_gdk_drawing_context_get_window; ///
private alias c_gdk_drawing_context_is_validFn = extern(C) gboolean function(GdkDrawingContext* context) nothrow;
__gshared c_gdk_drawing_context_is_validFn c_gdk_drawing_context_is_valid; ///

// Event
private alias c_gdk_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_event_get_typeFn c_gdk_event_get_type; ///
private alias c_gdk_event_newFn = extern(C) GdkEvent* function(GdkEventType type) nothrow;
__gshared c_gdk_event_newFn c_gdk_event_new; ///
private alias c_gdk_event_copyFn = extern(C) GdkEvent* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_copyFn c_gdk_event_copy; ///
private alias c_gdk_event_freeFn = extern(C) void function(GdkEvent* event) nothrow;
__gshared c_gdk_event_freeFn c_gdk_event_free; ///
private alias c_gdk_event_get_axisFn = extern(C) gboolean function(const(GdkEvent)* event, GdkAxisUse axisUse, double* value) nothrow;
__gshared c_gdk_event_get_axisFn c_gdk_event_get_axis; ///
private alias c_gdk_event_get_buttonFn = extern(C) gboolean function(const(GdkEvent)* event, uint* button) nothrow;
__gshared c_gdk_event_get_buttonFn c_gdk_event_get_button; ///
private alias c_gdk_event_get_click_countFn = extern(C) gboolean function(const(GdkEvent)* event, uint* clickCount) nothrow;
__gshared c_gdk_event_get_click_countFn c_gdk_event_get_click_count; ///
private alias c_gdk_event_get_coordsFn = extern(C) gboolean function(const(GdkEvent)* event, double* xWin, double* yWin) nothrow;
__gshared c_gdk_event_get_coordsFn c_gdk_event_get_coords; ///
private alias c_gdk_event_get_deviceFn = extern(C) GdkDevice* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_deviceFn c_gdk_event_get_device; ///
private alias c_gdk_event_get_device_toolFn = extern(C) GdkDeviceTool* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_device_toolFn c_gdk_event_get_device_tool; ///
private alias c_gdk_event_get_event_sequenceFn = extern(C) GdkEventSequence* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_event_sequenceFn c_gdk_event_get_event_sequence; ///
private alias c_gdk_event_get_event_typeFn = extern(C) GdkEventType function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_event_typeFn c_gdk_event_get_event_type; ///
private alias c_gdk_event_get_keycodeFn = extern(C) gboolean function(const(GdkEvent)* event, ushort* keycode) nothrow;
__gshared c_gdk_event_get_keycodeFn c_gdk_event_get_keycode; ///
private alias c_gdk_event_get_keyvalFn = extern(C) gboolean function(const(GdkEvent)* event, uint* keyval) nothrow;
__gshared c_gdk_event_get_keyvalFn c_gdk_event_get_keyval; ///
private alias c_gdk_event_get_pointer_emulatedFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_pointer_emulatedFn c_gdk_event_get_pointer_emulated; ///
private alias c_gdk_event_get_root_coordsFn = extern(C) gboolean function(const(GdkEvent)* event, double* xRoot, double* yRoot) nothrow;
__gshared c_gdk_event_get_root_coordsFn c_gdk_event_get_root_coords; ///
private alias c_gdk_event_get_scancodeFn = extern(C) int function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_scancodeFn c_gdk_event_get_scancode; ///
private alias c_gdk_event_get_screenFn = extern(C) GdkScreen* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_screenFn c_gdk_event_get_screen; ///
private alias c_gdk_event_get_scroll_deltasFn = extern(C) gboolean function(const(GdkEvent)* event, double* deltaX, double* deltaY) nothrow;
__gshared c_gdk_event_get_scroll_deltasFn c_gdk_event_get_scroll_deltas; ///
private alias c_gdk_event_get_scroll_directionFn = extern(C) gboolean function(const(GdkEvent)* event, GdkScrollDirection* direction) nothrow;
__gshared c_gdk_event_get_scroll_directionFn c_gdk_event_get_scroll_direction; ///
private alias c_gdk_event_get_seatFn = extern(C) GdkSeat* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_seatFn c_gdk_event_get_seat; ///
private alias c_gdk_event_get_source_deviceFn = extern(C) GdkDevice* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_source_deviceFn c_gdk_event_get_source_device; ///
private alias c_gdk_event_get_stateFn = extern(C) gboolean function(const(GdkEvent)* event, GdkModifierType* state) nothrow;
__gshared c_gdk_event_get_stateFn c_gdk_event_get_state; ///
private alias c_gdk_event_get_timeFn = extern(C) uint function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_timeFn c_gdk_event_get_time; ///
private alias c_gdk_event_get_windowFn = extern(C) GdkWindow* function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_get_windowFn c_gdk_event_get_window; ///
private alias c_gdk_event_is_scroll_stop_eventFn = extern(C) gboolean function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_is_scroll_stop_eventFn c_gdk_event_is_scroll_stop_event; ///
private alias c_gdk_event_putFn = extern(C) void function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_putFn c_gdk_event_put; ///
private alias c_gdk_event_set_deviceFn = extern(C) void function(GdkEvent* event, GdkDevice* device) nothrow;
__gshared c_gdk_event_set_deviceFn c_gdk_event_set_device; ///
private alias c_gdk_event_set_device_toolFn = extern(C) void function(GdkEvent* event, GdkDeviceTool* tool) nothrow;
__gshared c_gdk_event_set_device_toolFn c_gdk_event_set_device_tool; ///
private alias c_gdk_event_set_screenFn = extern(C) void function(GdkEvent* event, GdkScreen* screen) nothrow;
__gshared c_gdk_event_set_screenFn c_gdk_event_set_screen; ///
private alias c_gdk_event_set_source_deviceFn = extern(C) void function(GdkEvent* event, GdkDevice* device) nothrow;
__gshared c_gdk_event_set_source_deviceFn c_gdk_event_set_source_device; ///
private alias c_gdk_event_triggers_context_menuFn = extern(C) gboolean function(const(GdkEvent)* event) nothrow;
__gshared c_gdk_event_triggers_context_menuFn c_gdk_event_triggers_context_menu; ///
private alias c_gdk_event_getFn = extern(C) GdkEvent* function() nothrow;
__gshared c_gdk_event_getFn c_gdk_event_get; ///
private alias c_gdk_event_handler_setFn = extern(C) void function(GdkEventFunc func, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_event_handler_setFn c_gdk_event_handler_set; ///
private alias c_gdk_event_peekFn = extern(C) GdkEvent* function() nothrow;
__gshared c_gdk_event_peekFn c_gdk_event_peek; ///
private alias c_gdk_event_request_motionsFn = extern(C) void function(const(GdkEventMotion)* event) nothrow;
__gshared c_gdk_event_request_motionsFn c_gdk_event_request_motions; ///

// EventSequence
private alias c_gdk_event_sequence_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_event_sequence_get_typeFn c_gdk_event_sequence_get_type; ///

// FrameClock
private alias c_gdk_frame_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_frame_clock_get_typeFn c_gdk_frame_clock_get_type; ///
private alias c_gdk_frame_clock_begin_updatingFn = extern(C) void function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_begin_updatingFn c_gdk_frame_clock_begin_updating; ///
private alias c_gdk_frame_clock_end_updatingFn = extern(C) void function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_end_updatingFn c_gdk_frame_clock_end_updating; ///
private alias c_gdk_frame_clock_get_current_timingsFn = extern(C) GdkFrameTimings* function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_get_current_timingsFn c_gdk_frame_clock_get_current_timings; ///
private alias c_gdk_frame_clock_get_frame_counterFn = extern(C) long function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_get_frame_counterFn c_gdk_frame_clock_get_frame_counter; ///
private alias c_gdk_frame_clock_get_frame_timeFn = extern(C) long function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_get_frame_timeFn c_gdk_frame_clock_get_frame_time; ///
private alias c_gdk_frame_clock_get_history_startFn = extern(C) long function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_get_history_startFn c_gdk_frame_clock_get_history_start; ///
private alias c_gdk_frame_clock_get_refresh_infoFn = extern(C) void function(GdkFrameClock* frameClock, long baseTime, long* refreshIntervalReturn, long* presentationTimeReturn) nothrow;
__gshared c_gdk_frame_clock_get_refresh_infoFn c_gdk_frame_clock_get_refresh_info; ///
private alias c_gdk_frame_clock_get_timingsFn = extern(C) GdkFrameTimings* function(GdkFrameClock* frameClock, long frameCounter) nothrow;
__gshared c_gdk_frame_clock_get_timingsFn c_gdk_frame_clock_get_timings; ///
private alias c_gdk_frame_clock_request_phaseFn = extern(C) void function(GdkFrameClock* frameClock, GdkFrameClockPhase phase) nothrow;
__gshared c_gdk_frame_clock_request_phaseFn c_gdk_frame_clock_request_phase; ///

// FrameTimings
private alias c_gdk_frame_timings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_frame_timings_get_typeFn c_gdk_frame_timings_get_type; ///
private alias c_gdk_frame_timings_get_completeFn = extern(C) gboolean function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_get_completeFn c_gdk_frame_timings_get_complete; ///
private alias c_gdk_frame_timings_get_frame_counterFn = extern(C) long function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_get_frame_counterFn c_gdk_frame_timings_get_frame_counter; ///
private alias c_gdk_frame_timings_get_frame_timeFn = extern(C) long function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_get_frame_timeFn c_gdk_frame_timings_get_frame_time; ///
private alias c_gdk_frame_timings_get_predicted_presentation_timeFn = extern(C) long function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_get_predicted_presentation_timeFn c_gdk_frame_timings_get_predicted_presentation_time; ///
private alias c_gdk_frame_timings_get_presentation_timeFn = extern(C) long function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_get_presentation_timeFn c_gdk_frame_timings_get_presentation_time; ///
private alias c_gdk_frame_timings_get_refresh_intervalFn = extern(C) long function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_get_refresh_intervalFn c_gdk_frame_timings_get_refresh_interval; ///
private alias c_gdk_frame_timings_refFn = extern(C) GdkFrameTimings* function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_refFn c_gdk_frame_timings_ref; ///
private alias c_gdk_frame_timings_unrefFn = extern(C) void function(GdkFrameTimings* timings) nothrow;
__gshared c_gdk_frame_timings_unrefFn c_gdk_frame_timings_unref; ///

// GLContext
private alias c_gdk_gl_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_gl_context_get_typeFn c_gdk_gl_context_get_type; ///
private alias c_gdk_gl_context_clear_currentFn = extern(C) void function() nothrow;
__gshared c_gdk_gl_context_clear_currentFn c_gdk_gl_context_clear_current; ///
private alias c_gdk_gl_context_get_currentFn = extern(C) GdkGLContext* function() nothrow;
__gshared c_gdk_gl_context_get_currentFn c_gdk_gl_context_get_current; ///
private alias c_gdk_gl_context_get_debug_enabledFn = extern(C) gboolean function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_debug_enabledFn c_gdk_gl_context_get_debug_enabled; ///
private alias c_gdk_gl_context_get_displayFn = extern(C) GdkDisplay* function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_displayFn c_gdk_gl_context_get_display; ///
private alias c_gdk_gl_context_get_forward_compatibleFn = extern(C) gboolean function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_forward_compatibleFn c_gdk_gl_context_get_forward_compatible; ///
private alias c_gdk_gl_context_get_required_versionFn = extern(C) void function(GdkGLContext* context, int* major, int* minor) nothrow;
__gshared c_gdk_gl_context_get_required_versionFn c_gdk_gl_context_get_required_version; ///
private alias c_gdk_gl_context_get_shared_contextFn = extern(C) GdkGLContext* function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_shared_contextFn c_gdk_gl_context_get_shared_context; ///
private alias c_gdk_gl_context_get_use_esFn = extern(C) gboolean function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_use_esFn c_gdk_gl_context_get_use_es; ///
private alias c_gdk_gl_context_get_versionFn = extern(C) void function(GdkGLContext* context, int* major, int* minor) nothrow;
__gshared c_gdk_gl_context_get_versionFn c_gdk_gl_context_get_version; ///
private alias c_gdk_gl_context_get_windowFn = extern(C) GdkWindow* function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_windowFn c_gdk_gl_context_get_window; ///
private alias c_gdk_gl_context_is_legacyFn = extern(C) gboolean function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_is_legacyFn c_gdk_gl_context_is_legacy; ///
private alias c_gdk_gl_context_make_currentFn = extern(C) void function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_make_currentFn c_gdk_gl_context_make_current; ///
private alias c_gdk_gl_context_realizeFn = extern(C) gboolean function(GdkGLContext* context, GError** _err) nothrow;
__gshared c_gdk_gl_context_realizeFn c_gdk_gl_context_realize; ///
private alias c_gdk_gl_context_set_debug_enabledFn = extern(C) void function(GdkGLContext* context, gboolean enabled) nothrow;
__gshared c_gdk_gl_context_set_debug_enabledFn c_gdk_gl_context_set_debug_enabled; ///
private alias c_gdk_gl_context_set_forward_compatibleFn = extern(C) void function(GdkGLContext* context, gboolean compatible) nothrow;
__gshared c_gdk_gl_context_set_forward_compatibleFn c_gdk_gl_context_set_forward_compatible; ///
private alias c_gdk_gl_context_set_required_versionFn = extern(C) void function(GdkGLContext* context, int major, int minor) nothrow;
__gshared c_gdk_gl_context_set_required_versionFn c_gdk_gl_context_set_required_version; ///
private alias c_gdk_gl_context_set_use_esFn = extern(C) void function(GdkGLContext* context, int useEs) nothrow;
__gshared c_gdk_gl_context_set_use_esFn c_gdk_gl_context_set_use_es; ///

// Keymap
private alias c_gdk_keymap_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_keymap_get_typeFn c_gdk_keymap_get_type; ///
private alias c_gdk_keymap_get_defaultFn = extern(C) GdkKeymap* function() nothrow;
__gshared c_gdk_keymap_get_defaultFn c_gdk_keymap_get_default; ///
private alias c_gdk_keymap_get_for_displayFn = extern(C) GdkKeymap* function(GdkDisplay* display) nothrow;
__gshared c_gdk_keymap_get_for_displayFn c_gdk_keymap_get_for_display; ///
private alias c_gdk_keymap_add_virtual_modifiersFn = extern(C) void function(GdkKeymap* keymap, GdkModifierType* state) nothrow;
__gshared c_gdk_keymap_add_virtual_modifiersFn c_gdk_keymap_add_virtual_modifiers; ///
private alias c_gdk_keymap_get_caps_lock_stateFn = extern(C) gboolean function(GdkKeymap* keymap) nothrow;
__gshared c_gdk_keymap_get_caps_lock_stateFn c_gdk_keymap_get_caps_lock_state; ///
private alias c_gdk_keymap_get_directionFn = extern(C) PangoDirection function(GdkKeymap* keymap) nothrow;
__gshared c_gdk_keymap_get_directionFn c_gdk_keymap_get_direction; ///
private alias c_gdk_keymap_get_entries_for_keycodeFn = extern(C) gboolean function(GdkKeymap* keymap, uint hardwareKeycode, GdkKeymapKey** keys, uint** keyvals, int* nEntries) nothrow;
__gshared c_gdk_keymap_get_entries_for_keycodeFn c_gdk_keymap_get_entries_for_keycode; ///
private alias c_gdk_keymap_get_entries_for_keyvalFn = extern(C) gboolean function(GdkKeymap* keymap, uint keyval, GdkKeymapKey** keys, int* nKeys) nothrow;
__gshared c_gdk_keymap_get_entries_for_keyvalFn c_gdk_keymap_get_entries_for_keyval; ///
private alias c_gdk_keymap_get_modifier_maskFn = extern(C) GdkModifierType function(GdkKeymap* keymap, GdkModifierIntent intent) nothrow;
__gshared c_gdk_keymap_get_modifier_maskFn c_gdk_keymap_get_modifier_mask; ///
private alias c_gdk_keymap_get_modifier_stateFn = extern(C) uint function(GdkKeymap* keymap) nothrow;
__gshared c_gdk_keymap_get_modifier_stateFn c_gdk_keymap_get_modifier_state; ///
private alias c_gdk_keymap_get_num_lock_stateFn = extern(C) gboolean function(GdkKeymap* keymap) nothrow;
__gshared c_gdk_keymap_get_num_lock_stateFn c_gdk_keymap_get_num_lock_state; ///
private alias c_gdk_keymap_get_scroll_lock_stateFn = extern(C) gboolean function(GdkKeymap* keymap) nothrow;
__gshared c_gdk_keymap_get_scroll_lock_stateFn c_gdk_keymap_get_scroll_lock_state; ///
private alias c_gdk_keymap_have_bidi_layoutsFn = extern(C) gboolean function(GdkKeymap* keymap) nothrow;
__gshared c_gdk_keymap_have_bidi_layoutsFn c_gdk_keymap_have_bidi_layouts; ///
private alias c_gdk_keymap_lookup_keyFn = extern(C) uint function(GdkKeymap* keymap, const(GdkKeymapKey)* key) nothrow;
__gshared c_gdk_keymap_lookup_keyFn c_gdk_keymap_lookup_key; ///
private alias c_gdk_keymap_map_virtual_modifiersFn = extern(C) gboolean function(GdkKeymap* keymap, GdkModifierType* state) nothrow;
__gshared c_gdk_keymap_map_virtual_modifiersFn c_gdk_keymap_map_virtual_modifiers; ///
private alias c_gdk_keymap_translate_keyboard_stateFn = extern(C) gboolean function(GdkKeymap* keymap, uint hardwareKeycode, GdkModifierType state, int group, uint* keyval, int* effectiveGroup, int* level, GdkModifierType* consumedModifiers) nothrow;
__gshared c_gdk_keymap_translate_keyboard_stateFn c_gdk_keymap_translate_keyboard_state; ///

// MonitorWrap
private alias c_gdk_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_monitor_get_typeFn c_gdk_monitor_get_type; ///
private alias c_gdk_monitor_get_displayFn = extern(C) GdkDisplay* function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_displayFn c_gdk_monitor_get_display; ///
private alias c_gdk_monitor_get_geometryFn = extern(C) void function(GdkMonitor* monitor, GdkRectangle* geometry) nothrow;
__gshared c_gdk_monitor_get_geometryFn c_gdk_monitor_get_geometry; ///
private alias c_gdk_monitor_get_height_mmFn = extern(C) int function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_height_mmFn c_gdk_monitor_get_height_mm; ///
private alias c_gdk_monitor_get_manufacturerFn = extern(C) const(char)* function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_manufacturerFn c_gdk_monitor_get_manufacturer; ///
private alias c_gdk_monitor_get_modelFn = extern(C) const(char)* function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_modelFn c_gdk_monitor_get_model; ///
private alias c_gdk_monitor_get_refresh_rateFn = extern(C) int function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_refresh_rateFn c_gdk_monitor_get_refresh_rate; ///
private alias c_gdk_monitor_get_scale_factorFn = extern(C) int function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_scale_factorFn c_gdk_monitor_get_scale_factor; ///
private alias c_gdk_monitor_get_subpixel_layoutFn = extern(C) GdkSubpixelLayout function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_subpixel_layoutFn c_gdk_monitor_get_subpixel_layout; ///
private alias c_gdk_monitor_get_width_mmFn = extern(C) int function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_width_mmFn c_gdk_monitor_get_width_mm; ///
private alias c_gdk_monitor_get_workareaFn = extern(C) void function(GdkMonitor* monitor, GdkRectangle* workarea) nothrow;
__gshared c_gdk_monitor_get_workareaFn c_gdk_monitor_get_workarea; ///
private alias c_gdk_monitor_is_primaryFn = extern(C) gboolean function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_is_primaryFn c_gdk_monitor_is_primary; ///

// RGBA
private alias c_gdk_rgba_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_rgba_get_typeFn c_gdk_rgba_get_type; ///
private alias c_gdk_rgba_copyFn = extern(C) GdkRGBA* function(const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_rgba_copyFn c_gdk_rgba_copy; ///
private alias c_gdk_rgba_equalFn = extern(C) gboolean function(GdkRGBA* p1, GdkRGBA* p2) nothrow;
__gshared c_gdk_rgba_equalFn c_gdk_rgba_equal; ///
private alias c_gdk_rgba_freeFn = extern(C) void function(GdkRGBA* rgba) nothrow;
__gshared c_gdk_rgba_freeFn c_gdk_rgba_free; ///
private alias c_gdk_rgba_hashFn = extern(C) uint function(GdkRGBA* p) nothrow;
__gshared c_gdk_rgba_hashFn c_gdk_rgba_hash; ///
private alias c_gdk_rgba_parseFn = extern(C) gboolean function(GdkRGBA* rgba, const(char)* spec) nothrow;
__gshared c_gdk_rgba_parseFn c_gdk_rgba_parse; ///
private alias c_gdk_rgba_to_stringFn = extern(C) char* function(const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_rgba_to_stringFn c_gdk_rgba_to_string; ///

// Rectangle
private alias c_gdk_rectangle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_rectangle_get_typeFn c_gdk_rectangle_get_type; ///
private alias c_gdk_rectangle_equalFn = extern(C) gboolean function(const(GdkRectangle)* rect1, const(GdkRectangle)* rect2) nothrow;
__gshared c_gdk_rectangle_equalFn c_gdk_rectangle_equal; ///
private alias c_gdk_rectangle_intersectFn = extern(C) gboolean function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) nothrow;
__gshared c_gdk_rectangle_intersectFn c_gdk_rectangle_intersect; ///
private alias c_gdk_rectangle_unionFn = extern(C) void function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) nothrow;
__gshared c_gdk_rectangle_unionFn c_gdk_rectangle_union; ///

// Screen
private alias c_gdk_screen_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_screen_get_typeFn c_gdk_screen_get_type; ///
private alias c_gdk_screen_get_defaultFn = extern(C) GdkScreen* function() nothrow;
__gshared c_gdk_screen_get_defaultFn c_gdk_screen_get_default; ///
private alias c_gdk_screen_heightFn = extern(C) int function() nothrow;
__gshared c_gdk_screen_heightFn c_gdk_screen_height; ///
private alias c_gdk_screen_height_mmFn = extern(C) int function() nothrow;
__gshared c_gdk_screen_height_mmFn c_gdk_screen_height_mm; ///
private alias c_gdk_screen_widthFn = extern(C) int function() nothrow;
__gshared c_gdk_screen_widthFn c_gdk_screen_width; ///
private alias c_gdk_screen_width_mmFn = extern(C) int function() nothrow;
__gshared c_gdk_screen_width_mmFn c_gdk_screen_width_mm; ///
private alias c_gdk_screen_get_active_windowFn = extern(C) GdkWindow* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_active_windowFn c_gdk_screen_get_active_window; ///
private alias c_gdk_screen_get_displayFn = extern(C) GdkDisplay* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_displayFn c_gdk_screen_get_display; ///
private alias c_gdk_screen_get_font_optionsFn = extern(C) const(cairo_font_options_t)* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_font_optionsFn c_gdk_screen_get_font_options; ///
private alias c_gdk_screen_get_heightFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_heightFn c_gdk_screen_get_height; ///
private alias c_gdk_screen_get_height_mmFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_height_mmFn c_gdk_screen_get_height_mm; ///
private alias c_gdk_screen_get_monitor_at_pointFn = extern(C) int function(GdkScreen* screen, int x, int y) nothrow;
__gshared c_gdk_screen_get_monitor_at_pointFn c_gdk_screen_get_monitor_at_point; ///
private alias c_gdk_screen_get_monitor_at_windowFn = extern(C) int function(GdkScreen* screen, GdkWindow* window) nothrow;
__gshared c_gdk_screen_get_monitor_at_windowFn c_gdk_screen_get_monitor_at_window; ///
private alias c_gdk_screen_get_monitor_geometryFn = extern(C) void function(GdkScreen* screen, int monitorNum, GdkRectangle* dest) nothrow;
__gshared c_gdk_screen_get_monitor_geometryFn c_gdk_screen_get_monitor_geometry; ///
private alias c_gdk_screen_get_monitor_height_mmFn = extern(C) int function(GdkScreen* screen, int monitorNum) nothrow;
__gshared c_gdk_screen_get_monitor_height_mmFn c_gdk_screen_get_monitor_height_mm; ///
private alias c_gdk_screen_get_monitor_plug_nameFn = extern(C) char* function(GdkScreen* screen, int monitorNum) nothrow;
__gshared c_gdk_screen_get_monitor_plug_nameFn c_gdk_screen_get_monitor_plug_name; ///
private alias c_gdk_screen_get_monitor_scale_factorFn = extern(C) int function(GdkScreen* screen, int monitorNum) nothrow;
__gshared c_gdk_screen_get_monitor_scale_factorFn c_gdk_screen_get_monitor_scale_factor; ///
private alias c_gdk_screen_get_monitor_width_mmFn = extern(C) int function(GdkScreen* screen, int monitorNum) nothrow;
__gshared c_gdk_screen_get_monitor_width_mmFn c_gdk_screen_get_monitor_width_mm; ///
private alias c_gdk_screen_get_monitor_workareaFn = extern(C) void function(GdkScreen* screen, int monitorNum, GdkRectangle* dest) nothrow;
__gshared c_gdk_screen_get_monitor_workareaFn c_gdk_screen_get_monitor_workarea; ///
private alias c_gdk_screen_get_n_monitorsFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_n_monitorsFn c_gdk_screen_get_n_monitors; ///
private alias c_gdk_screen_get_numberFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_numberFn c_gdk_screen_get_number; ///
private alias c_gdk_screen_get_primary_monitorFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_primary_monitorFn c_gdk_screen_get_primary_monitor; ///
private alias c_gdk_screen_get_resolutionFn = extern(C) double function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_resolutionFn c_gdk_screen_get_resolution; ///
private alias c_gdk_screen_get_rgba_visualFn = extern(C) GdkVisual* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_rgba_visualFn c_gdk_screen_get_rgba_visual; ///
private alias c_gdk_screen_get_root_windowFn = extern(C) GdkWindow* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_root_windowFn c_gdk_screen_get_root_window; ///
private alias c_gdk_screen_get_settingFn = extern(C) gboolean function(GdkScreen* screen, const(char)* name, GValue* value) nothrow;
__gshared c_gdk_screen_get_settingFn c_gdk_screen_get_setting; ///
private alias c_gdk_screen_get_system_visualFn = extern(C) GdkVisual* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_system_visualFn c_gdk_screen_get_system_visual; ///
private alias c_gdk_screen_get_toplevel_windowsFn = extern(C) GList* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_toplevel_windowsFn c_gdk_screen_get_toplevel_windows; ///
private alias c_gdk_screen_get_widthFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_widthFn c_gdk_screen_get_width; ///
private alias c_gdk_screen_get_width_mmFn = extern(C) int function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_width_mmFn c_gdk_screen_get_width_mm; ///
private alias c_gdk_screen_get_window_stackFn = extern(C) GList* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_get_window_stackFn c_gdk_screen_get_window_stack; ///
private alias c_gdk_screen_is_compositedFn = extern(C) gboolean function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_is_compositedFn c_gdk_screen_is_composited; ///
private alias c_gdk_screen_list_visualsFn = extern(C) GList* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_list_visualsFn c_gdk_screen_list_visuals; ///
private alias c_gdk_screen_make_display_nameFn = extern(C) char* function(GdkScreen* screen) nothrow;
__gshared c_gdk_screen_make_display_nameFn c_gdk_screen_make_display_name; ///
private alias c_gdk_screen_set_font_optionsFn = extern(C) void function(GdkScreen* screen, const(cairo_font_options_t)* options) nothrow;
__gshared c_gdk_screen_set_font_optionsFn c_gdk_screen_set_font_options; ///
private alias c_gdk_screen_set_resolutionFn = extern(C) void function(GdkScreen* screen, double dpi) nothrow;
__gshared c_gdk_screen_set_resolutionFn c_gdk_screen_set_resolution; ///

// Seat
private alias c_gdk_seat_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_seat_get_typeFn c_gdk_seat_get_type; ///
private alias c_gdk_seat_get_capabilitiesFn = extern(C) GdkSeatCapabilities function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_capabilitiesFn c_gdk_seat_get_capabilities; ///
private alias c_gdk_seat_get_displayFn = extern(C) GdkDisplay* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_displayFn c_gdk_seat_get_display; ///
private alias c_gdk_seat_get_keyboardFn = extern(C) GdkDevice* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_keyboardFn c_gdk_seat_get_keyboard; ///
private alias c_gdk_seat_get_pointerFn = extern(C) GdkDevice* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_pointerFn c_gdk_seat_get_pointer; ///
private alias c_gdk_seat_get_slavesFn = extern(C) GList* function(GdkSeat* seat, GdkSeatCapabilities capabilities) nothrow;
__gshared c_gdk_seat_get_slavesFn c_gdk_seat_get_slaves; ///
private alias c_gdk_seat_grabFn = extern(C) GdkGrabStatus function(GdkSeat* seat, GdkWindow* window, GdkSeatCapabilities capabilities, gboolean ownerEvents, GdkCursor* cursor, const(GdkEvent)* event, GdkSeatGrabPrepareFunc prepareFunc, void* prepareFuncData) nothrow;
__gshared c_gdk_seat_grabFn c_gdk_seat_grab; ///
private alias c_gdk_seat_ungrabFn = extern(C) void function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_ungrabFn c_gdk_seat_ungrab; ///

// Visual
private alias c_gdk_visual_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_visual_get_typeFn c_gdk_visual_get_type; ///
private alias c_gdk_visual_get_bestFn = extern(C) GdkVisual* function() nothrow;
__gshared c_gdk_visual_get_bestFn c_gdk_visual_get_best; ///
private alias c_gdk_visual_get_best_depthFn = extern(C) int function() nothrow;
__gshared c_gdk_visual_get_best_depthFn c_gdk_visual_get_best_depth; ///
private alias c_gdk_visual_get_best_typeFn = extern(C) GdkVisualType function() nothrow;
__gshared c_gdk_visual_get_best_typeFn c_gdk_visual_get_best_type; ///
private alias c_gdk_visual_get_best_with_bothFn = extern(C) GdkVisual* function(int depth, GdkVisualType visualType) nothrow;
__gshared c_gdk_visual_get_best_with_bothFn c_gdk_visual_get_best_with_both; ///
private alias c_gdk_visual_get_best_with_depthFn = extern(C) GdkVisual* function(int depth) nothrow;
__gshared c_gdk_visual_get_best_with_depthFn c_gdk_visual_get_best_with_depth; ///
private alias c_gdk_visual_get_best_with_typeFn = extern(C) GdkVisual* function(GdkVisualType visualType) nothrow;
__gshared c_gdk_visual_get_best_with_typeFn c_gdk_visual_get_best_with_type; ///
private alias c_gdk_visual_get_systemFn = extern(C) GdkVisual* function() nothrow;
__gshared c_gdk_visual_get_systemFn c_gdk_visual_get_system; ///
private alias c_gdk_visual_get_bits_per_rgbFn = extern(C) int function(GdkVisual* visual) nothrow;
__gshared c_gdk_visual_get_bits_per_rgbFn c_gdk_visual_get_bits_per_rgb; ///
private alias c_gdk_visual_get_blue_pixel_detailsFn = extern(C) void function(GdkVisual* visual, uint* mask, int* shift, int* precision) nothrow;
__gshared c_gdk_visual_get_blue_pixel_detailsFn c_gdk_visual_get_blue_pixel_details; ///
private alias c_gdk_visual_get_byte_orderFn = extern(C) GdkByteOrder function(GdkVisual* visual) nothrow;
__gshared c_gdk_visual_get_byte_orderFn c_gdk_visual_get_byte_order; ///
private alias c_gdk_visual_get_colormap_sizeFn = extern(C) int function(GdkVisual* visual) nothrow;
__gshared c_gdk_visual_get_colormap_sizeFn c_gdk_visual_get_colormap_size; ///
private alias c_gdk_visual_get_depthFn = extern(C) int function(GdkVisual* visual) nothrow;
__gshared c_gdk_visual_get_depthFn c_gdk_visual_get_depth; ///
private alias c_gdk_visual_get_green_pixel_detailsFn = extern(C) void function(GdkVisual* visual, uint* mask, int* shift, int* precision) nothrow;
__gshared c_gdk_visual_get_green_pixel_detailsFn c_gdk_visual_get_green_pixel_details; ///
private alias c_gdk_visual_get_red_pixel_detailsFn = extern(C) void function(GdkVisual* visual, uint* mask, int* shift, int* precision) nothrow;
__gshared c_gdk_visual_get_red_pixel_detailsFn c_gdk_visual_get_red_pixel_details; ///
private alias c_gdk_visual_get_screenFn = extern(C) GdkScreen* function(GdkVisual* visual) nothrow;
__gshared c_gdk_visual_get_screenFn c_gdk_visual_get_screen; ///
private alias c_gdk_visual_get_visual_typeFn = extern(C) GdkVisualType function(GdkVisual* visual) nothrow;
__gshared c_gdk_visual_get_visual_typeFn c_gdk_visual_get_visual_type; ///

// Window
private alias c_gdk_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_window_get_typeFn c_gdk_window_get_type; ///
private alias c_gdk_window_newFn = extern(C) GdkWindow* function(GdkWindow* parent, GdkWindowAttr* attributes, int attributesMask) nothrow;
__gshared c_gdk_window_newFn c_gdk_window_new; ///
private alias c_gdk_window_at_pointerFn = extern(C) GdkWindow* function(int* winX, int* winY) nothrow;
__gshared c_gdk_window_at_pointerFn c_gdk_window_at_pointer; ///
private alias c_gdk_window_constrain_sizeFn = extern(C) void function(GdkGeometry* geometry, GdkWindowHints flags, int width, int height, int* newWidth, int* newHeight) nothrow;
__gshared c_gdk_window_constrain_sizeFn c_gdk_window_constrain_size; ///
private alias c_gdk_window_process_all_updatesFn = extern(C) void function() nothrow;
__gshared c_gdk_window_process_all_updatesFn c_gdk_window_process_all_updates; ///
private alias c_gdk_window_set_debug_updatesFn = extern(C) void function(gboolean setting) nothrow;
__gshared c_gdk_window_set_debug_updatesFn c_gdk_window_set_debug_updates; ///
private alias c_gdk_window_add_filterFn = extern(C) void function(GdkWindow* window, GdkFilterFunc function_, void* data) nothrow;
__gshared c_gdk_window_add_filterFn c_gdk_window_add_filter; ///
private alias c_gdk_window_beepFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_beepFn c_gdk_window_beep; ///
private alias c_gdk_window_begin_draw_frameFn = extern(C) GdkDrawingContext* function(GdkWindow* window, const(cairo_region_t)* region) nothrow;
__gshared c_gdk_window_begin_draw_frameFn c_gdk_window_begin_draw_frame; ///
private alias c_gdk_window_begin_move_dragFn = extern(C) void function(GdkWindow* window, int button, int rootX, int rootY, uint timestamp) nothrow;
__gshared c_gdk_window_begin_move_dragFn c_gdk_window_begin_move_drag; ///
private alias c_gdk_window_begin_move_drag_for_deviceFn = extern(C) void function(GdkWindow* window, GdkDevice* device, int button, int rootX, int rootY, uint timestamp) nothrow;
__gshared c_gdk_window_begin_move_drag_for_deviceFn c_gdk_window_begin_move_drag_for_device; ///
private alias c_gdk_window_begin_paint_rectFn = extern(C) void function(GdkWindow* window, const(GdkRectangle)* rectangle) nothrow;
__gshared c_gdk_window_begin_paint_rectFn c_gdk_window_begin_paint_rect; ///
private alias c_gdk_window_begin_paint_regionFn = extern(C) void function(GdkWindow* window, const(cairo_region_t)* region) nothrow;
__gshared c_gdk_window_begin_paint_regionFn c_gdk_window_begin_paint_region; ///
private alias c_gdk_window_begin_resize_dragFn = extern(C) void function(GdkWindow* window, GdkWindowEdge edge, int button, int rootX, int rootY, uint timestamp) nothrow;
__gshared c_gdk_window_begin_resize_dragFn c_gdk_window_begin_resize_drag; ///
private alias c_gdk_window_begin_resize_drag_for_deviceFn = extern(C) void function(GdkWindow* window, GdkWindowEdge edge, GdkDevice* device, int button, int rootX, int rootY, uint timestamp) nothrow;
__gshared c_gdk_window_begin_resize_drag_for_deviceFn c_gdk_window_begin_resize_drag_for_device; ///
private alias c_gdk_window_configure_finishedFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_configure_finishedFn c_gdk_window_configure_finished; ///
private alias c_gdk_window_coords_from_parentFn = extern(C) void function(GdkWindow* window, double parentX, double parentY, double* x, double* y) nothrow;
__gshared c_gdk_window_coords_from_parentFn c_gdk_window_coords_from_parent; ///
private alias c_gdk_window_coords_to_parentFn = extern(C) void function(GdkWindow* window, double x, double y, double* parentX, double* parentY) nothrow;
__gshared c_gdk_window_coords_to_parentFn c_gdk_window_coords_to_parent; ///
private alias c_gdk_window_create_gl_contextFn = extern(C) GdkGLContext* function(GdkWindow* window, GError** _err) nothrow;
__gshared c_gdk_window_create_gl_contextFn c_gdk_window_create_gl_context; ///
private alias c_gdk_window_create_similar_image_surfaceFn = extern(C) cairo_surface_t* function(GdkWindow* window, cairo_format_t format, int width, int height, int scale) nothrow;
__gshared c_gdk_window_create_similar_image_surfaceFn c_gdk_window_create_similar_image_surface; ///
private alias c_gdk_window_create_similar_surfaceFn = extern(C) cairo_surface_t* function(GdkWindow* window, cairo_content_t content, int width, int height) nothrow;
__gshared c_gdk_window_create_similar_surfaceFn c_gdk_window_create_similar_surface; ///
private alias c_gdk_window_deiconifyFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_deiconifyFn c_gdk_window_deiconify; ///
private alias c_gdk_window_destroyFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_destroyFn c_gdk_window_destroy; ///
private alias c_gdk_window_destroy_notifyFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_destroy_notifyFn c_gdk_window_destroy_notify; ///
private alias c_gdk_window_enable_synchronized_configureFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_enable_synchronized_configureFn c_gdk_window_enable_synchronized_configure; ///
private alias c_gdk_window_end_draw_frameFn = extern(C) void function(GdkWindow* window, GdkDrawingContext* context) nothrow;
__gshared c_gdk_window_end_draw_frameFn c_gdk_window_end_draw_frame; ///
private alias c_gdk_window_end_paintFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_end_paintFn c_gdk_window_end_paint; ///
private alias c_gdk_window_ensure_nativeFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_ensure_nativeFn c_gdk_window_ensure_native; ///
private alias c_gdk_window_flushFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_flushFn c_gdk_window_flush; ///
private alias c_gdk_window_focusFn = extern(C) void function(GdkWindow* window, uint timestamp) nothrow;
__gshared c_gdk_window_focusFn c_gdk_window_focus; ///
private alias c_gdk_window_freeze_toplevel_updates_libgtk_onlyFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_freeze_toplevel_updates_libgtk_onlyFn c_gdk_window_freeze_toplevel_updates_libgtk_only; ///
private alias c_gdk_window_freeze_updatesFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_freeze_updatesFn c_gdk_window_freeze_updates; ///
private alias c_gdk_window_fullscreenFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_fullscreenFn c_gdk_window_fullscreen; ///
private alias c_gdk_window_fullscreen_on_monitorFn = extern(C) void function(GdkWindow* window, int monitor) nothrow;
__gshared c_gdk_window_fullscreen_on_monitorFn c_gdk_window_fullscreen_on_monitor; ///
private alias c_gdk_window_geometry_changedFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_geometry_changedFn c_gdk_window_geometry_changed; ///
private alias c_gdk_window_get_accept_focusFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_accept_focusFn c_gdk_window_get_accept_focus; ///
private alias c_gdk_window_get_background_patternFn = extern(C) cairo_pattern_t* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_background_patternFn c_gdk_window_get_background_pattern; ///
private alias c_gdk_window_get_childrenFn = extern(C) GList* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_childrenFn c_gdk_window_get_children; ///
private alias c_gdk_window_get_children_with_user_dataFn = extern(C) GList* function(GdkWindow* window, void* userData) nothrow;
__gshared c_gdk_window_get_children_with_user_dataFn c_gdk_window_get_children_with_user_data; ///
private alias c_gdk_window_get_clip_regionFn = extern(C) cairo_region_t* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_clip_regionFn c_gdk_window_get_clip_region; ///
private alias c_gdk_window_get_compositedFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_compositedFn c_gdk_window_get_composited; ///
private alias c_gdk_window_get_cursorFn = extern(C) GdkCursor* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_cursorFn c_gdk_window_get_cursor; ///
private alias c_gdk_window_get_decorationsFn = extern(C) gboolean function(GdkWindow* window, GdkWMDecoration* decorations) nothrow;
__gshared c_gdk_window_get_decorationsFn c_gdk_window_get_decorations; ///
private alias c_gdk_window_get_device_cursorFn = extern(C) GdkCursor* function(GdkWindow* window, GdkDevice* device) nothrow;
__gshared c_gdk_window_get_device_cursorFn c_gdk_window_get_device_cursor; ///
private alias c_gdk_window_get_device_eventsFn = extern(C) GdkEventMask function(GdkWindow* window, GdkDevice* device) nothrow;
__gshared c_gdk_window_get_device_eventsFn c_gdk_window_get_device_events; ///
private alias c_gdk_window_get_device_positionFn = extern(C) GdkWindow* function(GdkWindow* window, GdkDevice* device, int* x, int* y, GdkModifierType* mask) nothrow;
__gshared c_gdk_window_get_device_positionFn c_gdk_window_get_device_position; ///
private alias c_gdk_window_get_device_position_doubleFn = extern(C) GdkWindow* function(GdkWindow* window, GdkDevice* device, double* x, double* y, GdkModifierType* mask) nothrow;
__gshared c_gdk_window_get_device_position_doubleFn c_gdk_window_get_device_position_double; ///
private alias c_gdk_window_get_displayFn = extern(C) GdkDisplay* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_displayFn c_gdk_window_get_display; ///
private alias c_gdk_window_get_drag_protocolFn = extern(C) GdkDragProtocol function(GdkWindow* window, GdkWindow** target) nothrow;
__gshared c_gdk_window_get_drag_protocolFn c_gdk_window_get_drag_protocol; ///
private alias c_gdk_window_get_effective_parentFn = extern(C) GdkWindow* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_effective_parentFn c_gdk_window_get_effective_parent; ///
private alias c_gdk_window_get_effective_toplevelFn = extern(C) GdkWindow* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_effective_toplevelFn c_gdk_window_get_effective_toplevel; ///
private alias c_gdk_window_get_event_compressionFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_event_compressionFn c_gdk_window_get_event_compression; ///
private alias c_gdk_window_get_eventsFn = extern(C) GdkEventMask function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_eventsFn c_gdk_window_get_events; ///
private alias c_gdk_window_get_focus_on_mapFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_focus_on_mapFn c_gdk_window_get_focus_on_map; ///
private alias c_gdk_window_get_frame_clockFn = extern(C) GdkFrameClock* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_frame_clockFn c_gdk_window_get_frame_clock; ///
private alias c_gdk_window_get_frame_extentsFn = extern(C) void function(GdkWindow* window, GdkRectangle* rect) nothrow;
__gshared c_gdk_window_get_frame_extentsFn c_gdk_window_get_frame_extents; ///
private alias c_gdk_window_get_fullscreen_modeFn = extern(C) GdkFullscreenMode function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_fullscreen_modeFn c_gdk_window_get_fullscreen_mode; ///
private alias c_gdk_window_get_geometryFn = extern(C) void function(GdkWindow* window, int* x, int* y, int* width, int* height) nothrow;
__gshared c_gdk_window_get_geometryFn c_gdk_window_get_geometry; ///
private alias c_gdk_window_get_groupFn = extern(C) GdkWindow* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_groupFn c_gdk_window_get_group; ///
private alias c_gdk_window_get_heightFn = extern(C) int function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_heightFn c_gdk_window_get_height; ///
private alias c_gdk_window_get_modal_hintFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_modal_hintFn c_gdk_window_get_modal_hint; ///
private alias c_gdk_window_get_originFn = extern(C) int function(GdkWindow* window, int* x, int* y) nothrow;
__gshared c_gdk_window_get_originFn c_gdk_window_get_origin; ///
private alias c_gdk_window_get_parentFn = extern(C) GdkWindow* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_parentFn c_gdk_window_get_parent; ///
private alias c_gdk_window_get_pass_throughFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_pass_throughFn c_gdk_window_get_pass_through; ///
private alias c_gdk_window_get_pointerFn = extern(C) GdkWindow* function(GdkWindow* window, int* x, int* y, GdkModifierType* mask) nothrow;
__gshared c_gdk_window_get_pointerFn c_gdk_window_get_pointer; ///
private alias c_gdk_window_get_positionFn = extern(C) void function(GdkWindow* window, int* x, int* y) nothrow;
__gshared c_gdk_window_get_positionFn c_gdk_window_get_position; ///
private alias c_gdk_window_get_root_coordsFn = extern(C) void function(GdkWindow* window, int x, int y, int* rootX, int* rootY) nothrow;
__gshared c_gdk_window_get_root_coordsFn c_gdk_window_get_root_coords; ///
private alias c_gdk_window_get_root_originFn = extern(C) void function(GdkWindow* window, int* x, int* y) nothrow;
__gshared c_gdk_window_get_root_originFn c_gdk_window_get_root_origin; ///
private alias c_gdk_window_get_scale_factorFn = extern(C) int function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_scale_factorFn c_gdk_window_get_scale_factor; ///
private alias c_gdk_window_get_screenFn = extern(C) GdkScreen* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_screenFn c_gdk_window_get_screen; ///
private alias c_gdk_window_get_source_eventsFn = extern(C) GdkEventMask function(GdkWindow* window, GdkInputSource source) nothrow;
__gshared c_gdk_window_get_source_eventsFn c_gdk_window_get_source_events; ///
private alias c_gdk_window_get_stateFn = extern(C) GdkWindowState function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_stateFn c_gdk_window_get_state; ///
private alias c_gdk_window_get_support_multideviceFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_support_multideviceFn c_gdk_window_get_support_multidevice; ///
private alias c_gdk_window_get_toplevelFn = extern(C) GdkWindow* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_toplevelFn c_gdk_window_get_toplevel; ///
private alias c_gdk_window_get_type_hintFn = extern(C) GdkWindowTypeHint function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_type_hintFn c_gdk_window_get_type_hint; ///
private alias c_gdk_window_get_update_areaFn = extern(C) cairo_region_t* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_update_areaFn c_gdk_window_get_update_area; ///
private alias c_gdk_window_get_user_dataFn = extern(C) void function(GdkWindow* window, void** data) nothrow;
__gshared c_gdk_window_get_user_dataFn c_gdk_window_get_user_data; ///
private alias c_gdk_window_get_visible_regionFn = extern(C) cairo_region_t* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_visible_regionFn c_gdk_window_get_visible_region; ///
private alias c_gdk_window_get_visualFn = extern(C) GdkVisual* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_visualFn c_gdk_window_get_visual; ///
private alias c_gdk_window_get_widthFn = extern(C) int function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_widthFn c_gdk_window_get_width; ///
private alias c_gdk_window_get_window_typeFn = extern(C) GdkWindowType function(GdkWindow* window) nothrow;
__gshared c_gdk_window_get_window_typeFn c_gdk_window_get_window_type; ///
private alias c_gdk_window_has_nativeFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_has_nativeFn c_gdk_window_has_native; ///
private alias c_gdk_window_hideFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_hideFn c_gdk_window_hide; ///
private alias c_gdk_window_iconifyFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_iconifyFn c_gdk_window_iconify; ///
private alias c_gdk_window_input_shape_combine_regionFn = extern(C) void function(GdkWindow* window, const(cairo_region_t)* shapeRegion, int offsetX, int offsetY) nothrow;
__gshared c_gdk_window_input_shape_combine_regionFn c_gdk_window_input_shape_combine_region; ///
private alias c_gdk_window_invalidate_maybe_recurseFn = extern(C) void function(GdkWindow* window, const(cairo_region_t)* region, GdkWindowChildFunc childFunc, void* userData) nothrow;
__gshared c_gdk_window_invalidate_maybe_recurseFn c_gdk_window_invalidate_maybe_recurse; ///
private alias c_gdk_window_invalidate_rectFn = extern(C) void function(GdkWindow* window, const(GdkRectangle)* rect, gboolean invalidateChildren) nothrow;
__gshared c_gdk_window_invalidate_rectFn c_gdk_window_invalidate_rect; ///
private alias c_gdk_window_invalidate_regionFn = extern(C) void function(GdkWindow* window, const(cairo_region_t)* region, gboolean invalidateChildren) nothrow;
__gshared c_gdk_window_invalidate_regionFn c_gdk_window_invalidate_region; ///
private alias c_gdk_window_is_destroyedFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_is_destroyedFn c_gdk_window_is_destroyed; ///
private alias c_gdk_window_is_input_onlyFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_is_input_onlyFn c_gdk_window_is_input_only; ///
private alias c_gdk_window_is_shapedFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_is_shapedFn c_gdk_window_is_shaped; ///
private alias c_gdk_window_is_viewableFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_is_viewableFn c_gdk_window_is_viewable; ///
private alias c_gdk_window_is_visibleFn = extern(C) gboolean function(GdkWindow* window) nothrow;
__gshared c_gdk_window_is_visibleFn c_gdk_window_is_visible; ///
private alias c_gdk_window_lowerFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_lowerFn c_gdk_window_lower; ///
private alias c_gdk_window_mark_paint_from_clipFn = extern(C) void function(GdkWindow* window, cairo_t* cr) nothrow;
__gshared c_gdk_window_mark_paint_from_clipFn c_gdk_window_mark_paint_from_clip; ///
private alias c_gdk_window_maximizeFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_maximizeFn c_gdk_window_maximize; ///
private alias c_gdk_window_merge_child_input_shapesFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_merge_child_input_shapesFn c_gdk_window_merge_child_input_shapes; ///
private alias c_gdk_window_merge_child_shapesFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_merge_child_shapesFn c_gdk_window_merge_child_shapes; ///
private alias c_gdk_window_moveFn = extern(C) void function(GdkWindow* window, int x, int y) nothrow;
__gshared c_gdk_window_moveFn c_gdk_window_move; ///
private alias c_gdk_window_move_regionFn = extern(C) void function(GdkWindow* window, const(cairo_region_t)* region, int dx, int dy) nothrow;
__gshared c_gdk_window_move_regionFn c_gdk_window_move_region; ///
private alias c_gdk_window_move_resizeFn = extern(C) void function(GdkWindow* window, int x, int y, int width, int height) nothrow;
__gshared c_gdk_window_move_resizeFn c_gdk_window_move_resize; ///
private alias c_gdk_window_move_to_rectFn = extern(C) void function(GdkWindow* window, const(GdkRectangle)* rect, GdkGravity rectAnchor, GdkGravity windowAnchor, GdkAnchorHints anchorHints, int rectAnchorDx, int rectAnchorDy) nothrow;
__gshared c_gdk_window_move_to_rectFn c_gdk_window_move_to_rect; ///
private alias c_gdk_window_peek_childrenFn = extern(C) GList* function(GdkWindow* window) nothrow;
__gshared c_gdk_window_peek_childrenFn c_gdk_window_peek_children; ///
private alias c_gdk_window_process_updatesFn = extern(C) void function(GdkWindow* window, gboolean updateChildren) nothrow;
__gshared c_gdk_window_process_updatesFn c_gdk_window_process_updates; ///
private alias c_gdk_window_raiseFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_raiseFn c_gdk_window_raise; ///
private alias c_gdk_window_register_dndFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_register_dndFn c_gdk_window_register_dnd; ///
private alias c_gdk_window_remove_filterFn = extern(C) void function(GdkWindow* window, GdkFilterFunc function_, void* data) nothrow;
__gshared c_gdk_window_remove_filterFn c_gdk_window_remove_filter; ///
private alias c_gdk_window_reparentFn = extern(C) void function(GdkWindow* window, GdkWindow* newParent, int x, int y) nothrow;
__gshared c_gdk_window_reparentFn c_gdk_window_reparent; ///
private alias c_gdk_window_resizeFn = extern(C) void function(GdkWindow* window, int width, int height) nothrow;
__gshared c_gdk_window_resizeFn c_gdk_window_resize; ///
private alias c_gdk_window_restackFn = extern(C) void function(GdkWindow* window, GdkWindow* sibling, gboolean above) nothrow;
__gshared c_gdk_window_restackFn c_gdk_window_restack; ///
private alias c_gdk_window_scrollFn = extern(C) void function(GdkWindow* window, int dx, int dy) nothrow;
__gshared c_gdk_window_scrollFn c_gdk_window_scroll; ///
private alias c_gdk_window_set_accept_focusFn = extern(C) void function(GdkWindow* window, gboolean acceptFocus) nothrow;
__gshared c_gdk_window_set_accept_focusFn c_gdk_window_set_accept_focus; ///
private alias c_gdk_window_set_backgroundFn = extern(C) void function(GdkWindow* window, const(GdkColor)* color) nothrow;
__gshared c_gdk_window_set_backgroundFn c_gdk_window_set_background; ///
private alias c_gdk_window_set_background_patternFn = extern(C) void function(GdkWindow* window, cairo_pattern_t* pattern) nothrow;
__gshared c_gdk_window_set_background_patternFn c_gdk_window_set_background_pattern; ///
private alias c_gdk_window_set_background_rgbaFn = extern(C) void function(GdkWindow* window, const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_window_set_background_rgbaFn c_gdk_window_set_background_rgba; ///
private alias c_gdk_window_set_child_input_shapesFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_set_child_input_shapesFn c_gdk_window_set_child_input_shapes; ///
private alias c_gdk_window_set_child_shapesFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_set_child_shapesFn c_gdk_window_set_child_shapes; ///
private alias c_gdk_window_set_compositedFn = extern(C) void function(GdkWindow* window, gboolean composited) nothrow;
__gshared c_gdk_window_set_compositedFn c_gdk_window_set_composited; ///
private alias c_gdk_window_set_cursorFn = extern(C) void function(GdkWindow* window, GdkCursor* cursor) nothrow;
__gshared c_gdk_window_set_cursorFn c_gdk_window_set_cursor; ///
private alias c_gdk_window_set_decorationsFn = extern(C) void function(GdkWindow* window, GdkWMDecoration decorations) nothrow;
__gshared c_gdk_window_set_decorationsFn c_gdk_window_set_decorations; ///
private alias c_gdk_window_set_device_cursorFn = extern(C) void function(GdkWindow* window, GdkDevice* device, GdkCursor* cursor) nothrow;
__gshared c_gdk_window_set_device_cursorFn c_gdk_window_set_device_cursor; ///
private alias c_gdk_window_set_device_eventsFn = extern(C) void function(GdkWindow* window, GdkDevice* device, GdkEventMask eventMask) nothrow;
__gshared c_gdk_window_set_device_eventsFn c_gdk_window_set_device_events; ///
private alias c_gdk_window_set_event_compressionFn = extern(C) void function(GdkWindow* window, gboolean eventCompression) nothrow;
__gshared c_gdk_window_set_event_compressionFn c_gdk_window_set_event_compression; ///
private alias c_gdk_window_set_eventsFn = extern(C) void function(GdkWindow* window, GdkEventMask eventMask) nothrow;
__gshared c_gdk_window_set_eventsFn c_gdk_window_set_events; ///
private alias c_gdk_window_set_focus_on_mapFn = extern(C) void function(GdkWindow* window, gboolean focusOnMap) nothrow;
__gshared c_gdk_window_set_focus_on_mapFn c_gdk_window_set_focus_on_map; ///
private alias c_gdk_window_set_fullscreen_modeFn = extern(C) void function(GdkWindow* window, GdkFullscreenMode mode) nothrow;
__gshared c_gdk_window_set_fullscreen_modeFn c_gdk_window_set_fullscreen_mode; ///
private alias c_gdk_window_set_functionsFn = extern(C) void function(GdkWindow* window, GdkWMFunction functions) nothrow;
__gshared c_gdk_window_set_functionsFn c_gdk_window_set_functions; ///
private alias c_gdk_window_set_geometry_hintsFn = extern(C) void function(GdkWindow* window, const(GdkGeometry)* geometry, GdkWindowHints geomMask) nothrow;
__gshared c_gdk_window_set_geometry_hintsFn c_gdk_window_set_geometry_hints; ///
private alias c_gdk_window_set_groupFn = extern(C) void function(GdkWindow* window, GdkWindow* leader) nothrow;
__gshared c_gdk_window_set_groupFn c_gdk_window_set_group; ///
private alias c_gdk_window_set_icon_listFn = extern(C) void function(GdkWindow* window, GList* pixbufs) nothrow;
__gshared c_gdk_window_set_icon_listFn c_gdk_window_set_icon_list; ///
private alias c_gdk_window_set_icon_nameFn = extern(C) void function(GdkWindow* window, const(char)* name) nothrow;
__gshared c_gdk_window_set_icon_nameFn c_gdk_window_set_icon_name; ///
private alias c_gdk_window_set_invalidate_handlerFn = extern(C) void function(GdkWindow* window, GdkWindowInvalidateHandlerFunc handler) nothrow;
__gshared c_gdk_window_set_invalidate_handlerFn c_gdk_window_set_invalidate_handler; ///
private alias c_gdk_window_set_keep_aboveFn = extern(C) void function(GdkWindow* window, gboolean setting) nothrow;
__gshared c_gdk_window_set_keep_aboveFn c_gdk_window_set_keep_above; ///
private alias c_gdk_window_set_keep_belowFn = extern(C) void function(GdkWindow* window, gboolean setting) nothrow;
__gshared c_gdk_window_set_keep_belowFn c_gdk_window_set_keep_below; ///
private alias c_gdk_window_set_modal_hintFn = extern(C) void function(GdkWindow* window, gboolean modal) nothrow;
__gshared c_gdk_window_set_modal_hintFn c_gdk_window_set_modal_hint; ///
private alias c_gdk_window_set_opacityFn = extern(C) void function(GdkWindow* window, double opacity) nothrow;
__gshared c_gdk_window_set_opacityFn c_gdk_window_set_opacity; ///
private alias c_gdk_window_set_opaque_regionFn = extern(C) void function(GdkWindow* window, cairo_region_t* region) nothrow;
__gshared c_gdk_window_set_opaque_regionFn c_gdk_window_set_opaque_region; ///
private alias c_gdk_window_set_override_redirectFn = extern(C) void function(GdkWindow* window, gboolean overrideRedirect) nothrow;
__gshared c_gdk_window_set_override_redirectFn c_gdk_window_set_override_redirect; ///
private alias c_gdk_window_set_pass_throughFn = extern(C) void function(GdkWindow* window, gboolean passThrough) nothrow;
__gshared c_gdk_window_set_pass_throughFn c_gdk_window_set_pass_through; ///
private alias c_gdk_window_set_roleFn = extern(C) void function(GdkWindow* window, const(char)* role) nothrow;
__gshared c_gdk_window_set_roleFn c_gdk_window_set_role; ///
private alias c_gdk_window_set_shadow_widthFn = extern(C) void function(GdkWindow* window, int left, int right, int top, int bottom) nothrow;
__gshared c_gdk_window_set_shadow_widthFn c_gdk_window_set_shadow_width; ///
private alias c_gdk_window_set_skip_pager_hintFn = extern(C) void function(GdkWindow* window, gboolean skipsPager) nothrow;
__gshared c_gdk_window_set_skip_pager_hintFn c_gdk_window_set_skip_pager_hint; ///
private alias c_gdk_window_set_skip_taskbar_hintFn = extern(C) void function(GdkWindow* window, gboolean skipsTaskbar) nothrow;
__gshared c_gdk_window_set_skip_taskbar_hintFn c_gdk_window_set_skip_taskbar_hint; ///
private alias c_gdk_window_set_source_eventsFn = extern(C) void function(GdkWindow* window, GdkInputSource source, GdkEventMask eventMask) nothrow;
__gshared c_gdk_window_set_source_eventsFn c_gdk_window_set_source_events; ///
private alias c_gdk_window_set_startup_idFn = extern(C) void function(GdkWindow* window, const(char)* startupId) nothrow;
__gshared c_gdk_window_set_startup_idFn c_gdk_window_set_startup_id; ///
private alias c_gdk_window_set_static_gravitiesFn = extern(C) gboolean function(GdkWindow* window, gboolean useStatic) nothrow;
__gshared c_gdk_window_set_static_gravitiesFn c_gdk_window_set_static_gravities; ///
private alias c_gdk_window_set_support_multideviceFn = extern(C) void function(GdkWindow* window, gboolean supportMultidevice) nothrow;
__gshared c_gdk_window_set_support_multideviceFn c_gdk_window_set_support_multidevice; ///
private alias c_gdk_window_set_titleFn = extern(C) void function(GdkWindow* window, const(char)* title) nothrow;
__gshared c_gdk_window_set_titleFn c_gdk_window_set_title; ///
private alias c_gdk_window_set_transient_forFn = extern(C) void function(GdkWindow* window, GdkWindow* parent) nothrow;
__gshared c_gdk_window_set_transient_forFn c_gdk_window_set_transient_for; ///
private alias c_gdk_window_set_type_hintFn = extern(C) void function(GdkWindow* window, GdkWindowTypeHint hint) nothrow;
__gshared c_gdk_window_set_type_hintFn c_gdk_window_set_type_hint; ///
private alias c_gdk_window_set_urgency_hintFn = extern(C) void function(GdkWindow* window, gboolean urgent) nothrow;
__gshared c_gdk_window_set_urgency_hintFn c_gdk_window_set_urgency_hint; ///
private alias c_gdk_window_set_user_dataFn = extern(C) void function(GdkWindow* window, GObject* userData) nothrow;
__gshared c_gdk_window_set_user_dataFn c_gdk_window_set_user_data; ///
private alias c_gdk_window_shape_combine_regionFn = extern(C) void function(GdkWindow* window, const(cairo_region_t)* shapeRegion, int offsetX, int offsetY) nothrow;
__gshared c_gdk_window_shape_combine_regionFn c_gdk_window_shape_combine_region; ///
private alias c_gdk_window_showFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_showFn c_gdk_window_show; ///
private alias c_gdk_window_show_unraisedFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_show_unraisedFn c_gdk_window_show_unraised; ///
private alias c_gdk_window_show_window_menuFn = extern(C) gboolean function(GdkWindow* window, GdkEvent* event) nothrow;
__gshared c_gdk_window_show_window_menuFn c_gdk_window_show_window_menu; ///
private alias c_gdk_window_stickFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_stickFn c_gdk_window_stick; ///
private alias c_gdk_window_thaw_toplevel_updates_libgtk_onlyFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_thaw_toplevel_updates_libgtk_onlyFn c_gdk_window_thaw_toplevel_updates_libgtk_only; ///
private alias c_gdk_window_thaw_updatesFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_thaw_updatesFn c_gdk_window_thaw_updates; ///
private alias c_gdk_window_unfullscreenFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_unfullscreenFn c_gdk_window_unfullscreen; ///
private alias c_gdk_window_unmaximizeFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_unmaximizeFn c_gdk_window_unmaximize; ///
private alias c_gdk_window_unstickFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_unstickFn c_gdk_window_unstick; ///
private alias c_gdk_window_withdrawFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_window_withdrawFn c_gdk_window_withdraw; ///

// global
private alias c_gdk_add_option_entries_libgtk_onlyFn = extern(C) void function(GOptionGroup* group) nothrow;
__gshared c_gdk_add_option_entries_libgtk_onlyFn c_gdk_add_option_entries_libgtk_only; ///
private alias c_gdk_beepFn = extern(C) void function() nothrow;
__gshared c_gdk_beepFn c_gdk_beep; ///
private alias c_gdk_cairo_createFn = extern(C) cairo_t* function(GdkWindow* window) nothrow;
__gshared c_gdk_cairo_createFn c_gdk_cairo_create; ///
private alias c_gdk_cairo_draw_from_glFn = extern(C) void function(cairo_t* cr, GdkWindow* window, int source, int sourceType, int bufferScale, int x, int y, int width, int height) nothrow;
__gshared c_gdk_cairo_draw_from_glFn c_gdk_cairo_draw_from_gl; ///
private alias c_gdk_cairo_get_clip_rectangleFn = extern(C) gboolean function(cairo_t* cr, GdkRectangle* rect) nothrow;
__gshared c_gdk_cairo_get_clip_rectangleFn c_gdk_cairo_get_clip_rectangle; ///
private alias c_gdk_cairo_get_drawing_contextFn = extern(C) GdkDrawingContext* function(cairo_t* cr) nothrow;
__gshared c_gdk_cairo_get_drawing_contextFn c_gdk_cairo_get_drawing_context; ///
private alias c_gdk_cairo_rectangleFn = extern(C) void function(cairo_t* cr, const(GdkRectangle)* rectangle) nothrow;
__gshared c_gdk_cairo_rectangleFn c_gdk_cairo_rectangle; ///
private alias c_gdk_cairo_regionFn = extern(C) void function(cairo_t* cr, const(cairo_region_t)* region) nothrow;
__gshared c_gdk_cairo_regionFn c_gdk_cairo_region; ///
private alias c_gdk_cairo_region_create_from_surfaceFn = extern(C) cairo_region_t* function(cairo_surface_t* surface) nothrow;
__gshared c_gdk_cairo_region_create_from_surfaceFn c_gdk_cairo_region_create_from_surface; ///
private alias c_gdk_cairo_set_source_colorFn = extern(C) void function(cairo_t* cr, const(GdkColor)* color) nothrow;
__gshared c_gdk_cairo_set_source_colorFn c_gdk_cairo_set_source_color; ///
private alias c_gdk_cairo_set_source_pixbufFn = extern(C) void function(cairo_t* cr, const(GdkPixbuf)* pixbuf, double pixbufX, double pixbufY) nothrow;
__gshared c_gdk_cairo_set_source_pixbufFn c_gdk_cairo_set_source_pixbuf; ///
private alias c_gdk_cairo_set_source_rgbaFn = extern(C) void function(cairo_t* cr, const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_cairo_set_source_rgbaFn c_gdk_cairo_set_source_rgba; ///
private alias c_gdk_cairo_set_source_windowFn = extern(C) void function(cairo_t* cr, GdkWindow* window, double x, double y) nothrow;
__gshared c_gdk_cairo_set_source_windowFn c_gdk_cairo_set_source_window; ///
private alias c_gdk_cairo_surface_create_from_pixbufFn = extern(C) cairo_surface_t* function(const(GdkPixbuf)* pixbuf, int scale, GdkWindow* forWindow) nothrow;
__gshared c_gdk_cairo_surface_create_from_pixbufFn c_gdk_cairo_surface_create_from_pixbuf; ///
private alias c_gdk_disable_multideviceFn = extern(C) void function() nothrow;
__gshared c_gdk_disable_multideviceFn c_gdk_disable_multidevice; ///
private alias c_gdk_drag_abortFn = extern(C) void function(GdkDragContext* context, uint time) nothrow;
__gshared c_gdk_drag_abortFn c_gdk_drag_abort; ///
private alias c_gdk_drag_beginFn = extern(C) GdkDragContext* function(GdkWindow* window, GList* targets) nothrow;
__gshared c_gdk_drag_beginFn c_gdk_drag_begin; ///
private alias c_gdk_drag_begin_for_deviceFn = extern(C) GdkDragContext* function(GdkWindow* window, GdkDevice* device, GList* targets) nothrow;
__gshared c_gdk_drag_begin_for_deviceFn c_gdk_drag_begin_for_device; ///
private alias c_gdk_drag_begin_from_pointFn = extern(C) GdkDragContext* function(GdkWindow* window, GdkDevice* device, GList* targets, int xRoot, int yRoot) nothrow;
__gshared c_gdk_drag_begin_from_pointFn c_gdk_drag_begin_from_point; ///
private alias c_gdk_drag_dropFn = extern(C) void function(GdkDragContext* context, uint time) nothrow;
__gshared c_gdk_drag_dropFn c_gdk_drag_drop; ///
private alias c_gdk_drag_drop_doneFn = extern(C) void function(GdkDragContext* context, gboolean success) nothrow;
__gshared c_gdk_drag_drop_doneFn c_gdk_drag_drop_done; ///
private alias c_gdk_drag_drop_succeededFn = extern(C) gboolean function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_drop_succeededFn c_gdk_drag_drop_succeeded; ///
private alias c_gdk_drag_find_window_for_screenFn = extern(C) void function(GdkDragContext* context, GdkWindow* dragWindow, GdkScreen* screen, int xRoot, int yRoot, GdkWindow** destWindow, GdkDragProtocol* protocol) nothrow;
__gshared c_gdk_drag_find_window_for_screenFn c_gdk_drag_find_window_for_screen; ///
private alias c_gdk_drag_get_selectionFn = extern(C) GdkAtom function(GdkDragContext* context) nothrow;
__gshared c_gdk_drag_get_selectionFn c_gdk_drag_get_selection; ///
private alias c_gdk_drag_motionFn = extern(C) gboolean function(GdkDragContext* context, GdkWindow* destWindow, GdkDragProtocol protocol, int xRoot, int yRoot, GdkDragAction suggestedAction, GdkDragAction possibleActions, uint time) nothrow;
__gshared c_gdk_drag_motionFn c_gdk_drag_motion; ///
private alias c_gdk_drag_statusFn = extern(C) void function(GdkDragContext* context, GdkDragAction action, uint time) nothrow;
__gshared c_gdk_drag_statusFn c_gdk_drag_status; ///
private alias c_gdk_drop_finishFn = extern(C) void function(GdkDragContext* context, gboolean success, uint time) nothrow;
__gshared c_gdk_drop_finishFn c_gdk_drop_finish; ///
private alias c_gdk_drop_replyFn = extern(C) void function(GdkDragContext* context, gboolean accepted, uint time) nothrow;
__gshared c_gdk_drop_replyFn c_gdk_drop_reply; ///
private alias c_gdk_error_trap_popFn = extern(C) int function() nothrow;
__gshared c_gdk_error_trap_popFn c_gdk_error_trap_pop; ///
private alias c_gdk_error_trap_pop_ignoredFn = extern(C) void function() nothrow;
__gshared c_gdk_error_trap_pop_ignoredFn c_gdk_error_trap_pop_ignored; ///
private alias c_gdk_error_trap_pushFn = extern(C) void function() nothrow;
__gshared c_gdk_error_trap_pushFn c_gdk_error_trap_push; ///
private alias c_gdk_events_get_angleFn = extern(C) gboolean function(GdkEvent* event1, GdkEvent* event2, double* angle) nothrow;
__gshared c_gdk_events_get_angleFn c_gdk_events_get_angle; ///
private alias c_gdk_events_get_centerFn = extern(C) gboolean function(GdkEvent* event1, GdkEvent* event2, double* x, double* y) nothrow;
__gshared c_gdk_events_get_centerFn c_gdk_events_get_center; ///
private alias c_gdk_events_get_distanceFn = extern(C) gboolean function(GdkEvent* event1, GdkEvent* event2, double* distance) nothrow;
__gshared c_gdk_events_get_distanceFn c_gdk_events_get_distance; ///
private alias c_gdk_events_pendingFn = extern(C) gboolean function() nothrow;
__gshared c_gdk_events_pendingFn c_gdk_events_pending; ///
private alias c_gdk_flushFn = extern(C) void function() nothrow;
__gshared c_gdk_flushFn c_gdk_flush; ///
private alias c_gdk_get_default_root_windowFn = extern(C) GdkWindow* function() nothrow;
__gshared c_gdk_get_default_root_windowFn c_gdk_get_default_root_window; ///
private alias c_gdk_get_displayFn = extern(C) char* function() nothrow;
__gshared c_gdk_get_displayFn c_gdk_get_display; ///
private alias c_gdk_get_display_arg_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_gdk_get_display_arg_nameFn c_gdk_get_display_arg_name; ///
private alias c_gdk_get_program_classFn = extern(C) const(char)* function() nothrow;
__gshared c_gdk_get_program_classFn c_gdk_get_program_class; ///
private alias c_gdk_get_show_eventsFn = extern(C) gboolean function() nothrow;
__gshared c_gdk_get_show_eventsFn c_gdk_get_show_events; ///
private alias c_gdk_initFn = extern(C) void function(int* argc, char*** argv) nothrow;
__gshared c_gdk_initFn c_gdk_init; ///
private alias c_gdk_init_checkFn = extern(C) gboolean function(int* argc, char*** argv) nothrow;
__gshared c_gdk_init_checkFn c_gdk_init_check; ///
private alias c_gdk_keyboard_grabFn = extern(C) GdkGrabStatus function(GdkWindow* window, gboolean ownerEvents, uint time) nothrow;
__gshared c_gdk_keyboard_grabFn c_gdk_keyboard_grab; ///
private alias c_gdk_keyboard_ungrabFn = extern(C) void function(uint time) nothrow;
__gshared c_gdk_keyboard_ungrabFn c_gdk_keyboard_ungrab; ///
private alias c_gdk_keyval_convert_caseFn = extern(C) void function(uint symbol, uint* lower, uint* upper) nothrow;
__gshared c_gdk_keyval_convert_caseFn c_gdk_keyval_convert_case; ///
private alias c_gdk_keyval_from_nameFn = extern(C) uint function(const(char)* keyvalName) nothrow;
__gshared c_gdk_keyval_from_nameFn c_gdk_keyval_from_name; ///
private alias c_gdk_keyval_is_lowerFn = extern(C) gboolean function(uint keyval) nothrow;
__gshared c_gdk_keyval_is_lowerFn c_gdk_keyval_is_lower; ///
private alias c_gdk_keyval_is_upperFn = extern(C) gboolean function(uint keyval) nothrow;
__gshared c_gdk_keyval_is_upperFn c_gdk_keyval_is_upper; ///
private alias c_gdk_keyval_nameFn = extern(C) char* function(uint keyval) nothrow;
__gshared c_gdk_keyval_nameFn c_gdk_keyval_name; ///
private alias c_gdk_keyval_to_lowerFn = extern(C) uint function(uint keyval) nothrow;
__gshared c_gdk_keyval_to_lowerFn c_gdk_keyval_to_lower; ///
private alias c_gdk_keyval_to_unicodeFn = extern(C) uint function(uint keyval) nothrow;
__gshared c_gdk_keyval_to_unicodeFn c_gdk_keyval_to_unicode; ///
private alias c_gdk_keyval_to_upperFn = extern(C) uint function(uint keyval) nothrow;
__gshared c_gdk_keyval_to_upperFn c_gdk_keyval_to_upper; ///
private alias c_gdk_list_visualsFn = extern(C) GList* function() nothrow;
__gshared c_gdk_list_visualsFn c_gdk_list_visuals; ///
private alias c_gdk_notify_startup_completeFn = extern(C) void function() nothrow;
__gshared c_gdk_notify_startup_completeFn c_gdk_notify_startup_complete; ///
private alias c_gdk_notify_startup_complete_with_idFn = extern(C) void function(const(char)* startupId) nothrow;
__gshared c_gdk_notify_startup_complete_with_idFn c_gdk_notify_startup_complete_with_id; ///
private alias c_gdk_offscreen_window_get_embedderFn = extern(C) GdkWindow* function(GdkWindow* window) nothrow;
__gshared c_gdk_offscreen_window_get_embedderFn c_gdk_offscreen_window_get_embedder; ///
private alias c_gdk_offscreen_window_get_surfaceFn = extern(C) cairo_surface_t* function(GdkWindow* window) nothrow;
__gshared c_gdk_offscreen_window_get_surfaceFn c_gdk_offscreen_window_get_surface; ///
private alias c_gdk_offscreen_window_set_embedderFn = extern(C) void function(GdkWindow* window, GdkWindow* embedder) nothrow;
__gshared c_gdk_offscreen_window_set_embedderFn c_gdk_offscreen_window_set_embedder; ///
private alias c_gdk_pango_context_getFn = extern(C) PangoContext* function() nothrow;
__gshared c_gdk_pango_context_getFn c_gdk_pango_context_get; ///
private alias c_gdk_pango_context_get_for_displayFn = extern(C) PangoContext* function(GdkDisplay* display) nothrow;
__gshared c_gdk_pango_context_get_for_displayFn c_gdk_pango_context_get_for_display; ///
private alias c_gdk_pango_context_get_for_screenFn = extern(C) PangoContext* function(GdkScreen* screen) nothrow;
__gshared c_gdk_pango_context_get_for_screenFn c_gdk_pango_context_get_for_screen; ///
private alias c_gdk_pango_layout_get_clip_regionFn = extern(C) cairo_region_t* function(PangoLayout* layout, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) nothrow;
__gshared c_gdk_pango_layout_get_clip_regionFn c_gdk_pango_layout_get_clip_region; ///
private alias c_gdk_pango_layout_line_get_clip_regionFn = extern(C) cairo_region_t* function(PangoLayoutLine* line, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) nothrow;
__gshared c_gdk_pango_layout_line_get_clip_regionFn c_gdk_pango_layout_line_get_clip_region; ///
private alias c_gdk_parse_argsFn = extern(C) void function(int* argc, char*** argv) nothrow;
__gshared c_gdk_parse_argsFn c_gdk_parse_args; ///
private alias c_gdk_pixbuf_get_from_surfaceFn = extern(C) GdkPixbuf* function(cairo_surface_t* surface, int srcX, int srcY, int width, int height) nothrow;
__gshared c_gdk_pixbuf_get_from_surfaceFn c_gdk_pixbuf_get_from_surface; ///
private alias c_gdk_pixbuf_get_from_windowFn = extern(C) GdkPixbuf* function(GdkWindow* window, int srcX, int srcY, int width, int height) nothrow;
__gshared c_gdk_pixbuf_get_from_windowFn c_gdk_pixbuf_get_from_window; ///
private alias c_gdk_pointer_grabFn = extern(C) GdkGrabStatus function(GdkWindow* window, gboolean ownerEvents, GdkEventMask eventMask, GdkWindow* confineTo, GdkCursor* cursor, uint time) nothrow;
__gshared c_gdk_pointer_grabFn c_gdk_pointer_grab; ///
private alias c_gdk_pointer_is_grabbedFn = extern(C) gboolean function() nothrow;
__gshared c_gdk_pointer_is_grabbedFn c_gdk_pointer_is_grabbed; ///
private alias c_gdk_pointer_ungrabFn = extern(C) void function(uint time) nothrow;
__gshared c_gdk_pointer_ungrabFn c_gdk_pointer_ungrab; ///
private alias c_gdk_pre_parse_libgtk_onlyFn = extern(C) void function() nothrow;
__gshared c_gdk_pre_parse_libgtk_onlyFn c_gdk_pre_parse_libgtk_only; ///
private alias c_gdk_property_changeFn = extern(C) void function(GdkWindow* window, GdkAtom property, GdkAtom type, int format, GdkPropMode mode, const(ubyte)* data, int nelements) nothrow;
__gshared c_gdk_property_changeFn c_gdk_property_change; ///
private alias c_gdk_property_deleteFn = extern(C) void function(GdkWindow* window, GdkAtom property) nothrow;
__gshared c_gdk_property_deleteFn c_gdk_property_delete; ///
private alias c_gdk_property_getFn = extern(C) gboolean function(GdkWindow* window, GdkAtom property, GdkAtom type, gulong offset, gulong length, int pdelete, GdkAtom* actualPropertyType, int* actualFormat, int* actualLength, ubyte** data) nothrow;
__gshared c_gdk_property_getFn c_gdk_property_get; ///
private alias c_gdk_query_depthsFn = extern(C) void function(int** depths, int* count) nothrow;
__gshared c_gdk_query_depthsFn c_gdk_query_depths; ///
private alias c_gdk_query_visual_typesFn = extern(C) void function(GdkVisualType** visualTypes, int* count) nothrow;
__gshared c_gdk_query_visual_typesFn c_gdk_query_visual_types; ///
private alias c_gdk_selection_convertFn = extern(C) void function(GdkWindow* requestor, GdkAtom selection, GdkAtom target, uint time) nothrow;
__gshared c_gdk_selection_convertFn c_gdk_selection_convert; ///
private alias c_gdk_selection_owner_getFn = extern(C) GdkWindow* function(GdkAtom selection) nothrow;
__gshared c_gdk_selection_owner_getFn c_gdk_selection_owner_get; ///
private alias c_gdk_selection_owner_get_for_displayFn = extern(C) GdkWindow* function(GdkDisplay* display, GdkAtom selection) nothrow;
__gshared c_gdk_selection_owner_get_for_displayFn c_gdk_selection_owner_get_for_display; ///
private alias c_gdk_selection_owner_setFn = extern(C) gboolean function(GdkWindow* owner, GdkAtom selection, uint time, gboolean sendEvent) nothrow;
__gshared c_gdk_selection_owner_setFn c_gdk_selection_owner_set; ///
private alias c_gdk_selection_owner_set_for_displayFn = extern(C) gboolean function(GdkDisplay* display, GdkWindow* owner, GdkAtom selection, uint time, gboolean sendEvent) nothrow;
__gshared c_gdk_selection_owner_set_for_displayFn c_gdk_selection_owner_set_for_display; ///
private alias c_gdk_selection_property_getFn = extern(C) int function(GdkWindow* requestor, ubyte** data, GdkAtom* propType, int* propFormat) nothrow;
__gshared c_gdk_selection_property_getFn c_gdk_selection_property_get; ///
private alias c_gdk_selection_send_notifyFn = extern(C) void function(GdkWindow* requestor, GdkAtom selection, GdkAtom target, GdkAtom property, uint time) nothrow;
__gshared c_gdk_selection_send_notifyFn c_gdk_selection_send_notify; ///
private alias c_gdk_selection_send_notify_for_displayFn = extern(C) void function(GdkDisplay* display, GdkWindow* requestor, GdkAtom selection, GdkAtom target, GdkAtom property, uint time) nothrow;
__gshared c_gdk_selection_send_notify_for_displayFn c_gdk_selection_send_notify_for_display; ///
private alias c_gdk_set_allowed_backendsFn = extern(C) void function(const(char)* backends) nothrow;
__gshared c_gdk_set_allowed_backendsFn c_gdk_set_allowed_backends; ///
private alias c_gdk_set_double_click_timeFn = extern(C) void function(uint msec) nothrow;
__gshared c_gdk_set_double_click_timeFn c_gdk_set_double_click_time; ///
private alias c_gdk_set_program_classFn = extern(C) void function(const(char)* programClass) nothrow;
__gshared c_gdk_set_program_classFn c_gdk_set_program_class; ///
private alias c_gdk_set_show_eventsFn = extern(C) void function(gboolean showEvents) nothrow;
__gshared c_gdk_set_show_eventsFn c_gdk_set_show_events; ///
private alias c_gdk_setting_getFn = extern(C) gboolean function(const(char)* name, GValue* value) nothrow;
__gshared c_gdk_setting_getFn c_gdk_setting_get; ///
private alias c_gdk_synthesize_window_stateFn = extern(C) void function(GdkWindow* window, GdkWindowState unsetFlags, GdkWindowState setFlags) nothrow;
__gshared c_gdk_synthesize_window_stateFn c_gdk_synthesize_window_state; ///
private alias c_gdk_test_render_syncFn = extern(C) void function(GdkWindow* window) nothrow;
__gshared c_gdk_test_render_syncFn c_gdk_test_render_sync; ///
private alias c_gdk_test_simulate_buttonFn = extern(C) gboolean function(GdkWindow* window, int x, int y, uint button, GdkModifierType modifiers, GdkEventType buttonPressrelease) nothrow;
__gshared c_gdk_test_simulate_buttonFn c_gdk_test_simulate_button; ///
private alias c_gdk_test_simulate_keyFn = extern(C) gboolean function(GdkWindow* window, int x, int y, uint keyval, GdkModifierType modifiers, GdkEventType keyPressrelease) nothrow;
__gshared c_gdk_test_simulate_keyFn c_gdk_test_simulate_key; ///
private alias c_gdk_text_property_to_utf8_list_for_displayFn = extern(C) int function(GdkDisplay* display, GdkAtom encoding, int format, const(ubyte)* text, int length, char*** list) nothrow;
__gshared c_gdk_text_property_to_utf8_list_for_displayFn c_gdk_text_property_to_utf8_list_for_display; ///
private alias c_gdk_threads_add_idleFn = extern(C) uint function(GSourceFunc function_, void* data) nothrow;
__gshared c_gdk_threads_add_idleFn c_gdk_threads_add_idle; ///
private alias c_gdk_threads_add_idle_fullFn = extern(C) uint function(int priority, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_threads_add_idle_fullFn c_gdk_threads_add_idle_full; ///
private alias c_gdk_threads_add_timeoutFn = extern(C) uint function(uint interval, GSourceFunc function_, void* data) nothrow;
__gshared c_gdk_threads_add_timeoutFn c_gdk_threads_add_timeout; ///
private alias c_gdk_threads_add_timeout_fullFn = extern(C) uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_threads_add_timeout_fullFn c_gdk_threads_add_timeout_full; ///
private alias c_gdk_threads_add_timeout_secondsFn = extern(C) uint function(uint interval, GSourceFunc function_, void* data) nothrow;
__gshared c_gdk_threads_add_timeout_secondsFn c_gdk_threads_add_timeout_seconds; ///
private alias c_gdk_threads_add_timeout_seconds_fullFn = extern(C) uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_threads_add_timeout_seconds_fullFn c_gdk_threads_add_timeout_seconds_full; ///
private alias c_gdk_threads_enterFn = extern(C) void function() nothrow;
__gshared c_gdk_threads_enterFn c_gdk_threads_enter; ///
private alias c_gdk_threads_initFn = extern(C) void function() nothrow;
__gshared c_gdk_threads_initFn c_gdk_threads_init; ///
private alias c_gdk_threads_leaveFn = extern(C) void function() nothrow;
__gshared c_gdk_threads_leaveFn c_gdk_threads_leave; ///
private alias c_gdk_threads_set_lock_functionsFn = extern(C) void function(GCallback enterFn, GCallback leaveFn) nothrow;
__gshared c_gdk_threads_set_lock_functionsFn c_gdk_threads_set_lock_functions; ///
private alias c_gdk_unicode_to_keyvalFn = extern(C) uint function(uint wc) nothrow;
__gshared c_gdk_unicode_to_keyvalFn c_gdk_unicode_to_keyval; ///
private alias c_gdk_utf8_to_string_targetFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_gdk_utf8_to_string_targetFn c_gdk_utf8_to_string_target; ///

// GLError
private alias c_gdk_gl_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gdk_gl_error_quarkFn c_gdk_gl_error_quark; ///

// AppLaunchContext

/** */
alias gdk_app_launch_context_get_type = c_gdk_app_launch_context_get_type;

/** */
alias gdk_app_launch_context_new = c_gdk_app_launch_context_new;

/** */
alias gdk_app_launch_context_set_desktop = c_gdk_app_launch_context_set_desktop;

/** */
alias gdk_app_launch_context_set_display = c_gdk_app_launch_context_set_display;

/** */
alias gdk_app_launch_context_set_icon = c_gdk_app_launch_context_set_icon;

/** */
alias gdk_app_launch_context_set_icon_name = c_gdk_app_launch_context_set_icon_name;

/** */
alias gdk_app_launch_context_set_screen = c_gdk_app_launch_context_set_screen;

/** */
alias gdk_app_launch_context_set_timestamp = c_gdk_app_launch_context_set_timestamp;

// Atom

/** */
alias gdk_atom_name = c_gdk_atom_name;

/** */
alias gdk_atom_intern = c_gdk_atom_intern;

/** */
alias gdk_atom_intern_static_string = c_gdk_atom_intern_static_string;

// Color

/** */
alias gdk_color_get_type = c_gdk_color_get_type;

/** */
alias gdk_color_copy = c_gdk_color_copy;

/** */
alias gdk_color_equal = c_gdk_color_equal;

/** */
alias gdk_color_free = c_gdk_color_free;

/** */
alias gdk_color_hash = c_gdk_color_hash;

/** */
alias gdk_color_to_string = c_gdk_color_to_string;

/** */
alias gdk_color_parse = c_gdk_color_parse;

// Cursor

/** */
alias gdk_cursor_get_type = c_gdk_cursor_get_type;

/** */
alias gdk_cursor_new = c_gdk_cursor_new;

/** */
alias gdk_cursor_new_for_display = c_gdk_cursor_new_for_display;

/** */
alias gdk_cursor_new_from_name = c_gdk_cursor_new_from_name;

/** */
alias gdk_cursor_new_from_pixbuf = c_gdk_cursor_new_from_pixbuf;

/** */
alias gdk_cursor_new_from_surface = c_gdk_cursor_new_from_surface;

/** */
alias gdk_cursor_get_cursor_type = c_gdk_cursor_get_cursor_type;

/** */
alias gdk_cursor_get_display = c_gdk_cursor_get_display;

/** */
alias gdk_cursor_get_image = c_gdk_cursor_get_image;

/** */
alias gdk_cursor_get_surface = c_gdk_cursor_get_surface;

/** */
alias gdk_cursor_ref = c_gdk_cursor_ref;

/** */
alias gdk_cursor_unref = c_gdk_cursor_unref;

// Device

/** */
alias gdk_device_get_type = c_gdk_device_get_type;

/** */
alias gdk_device_free_history = c_gdk_device_free_history;

/** */
alias gdk_device_grab_info_libgtk_only = c_gdk_device_grab_info_libgtk_only;

/** */
alias gdk_device_get_associated_device = c_gdk_device_get_associated_device;

/** */
alias gdk_device_get_axes = c_gdk_device_get_axes;

/** */
alias gdk_device_get_axis = c_gdk_device_get_axis;

/** */
alias gdk_device_get_axis_use = c_gdk_device_get_axis_use;

/** */
alias gdk_device_get_axis_value = c_gdk_device_get_axis_value;

/** */
alias gdk_device_get_device_type = c_gdk_device_get_device_type;

/** */
alias gdk_device_get_display = c_gdk_device_get_display;

/** */
alias gdk_device_get_has_cursor = c_gdk_device_get_has_cursor;

/** */
alias gdk_device_get_history = c_gdk_device_get_history;

/** */
alias gdk_device_get_key = c_gdk_device_get_key;

/** */
alias gdk_device_get_last_event_window = c_gdk_device_get_last_event_window;

/** */
alias gdk_device_get_mode = c_gdk_device_get_mode;

/** */
alias gdk_device_get_n_axes = c_gdk_device_get_n_axes;

/** */
alias gdk_device_get_n_keys = c_gdk_device_get_n_keys;

/** */
alias gdk_device_get_name = c_gdk_device_get_name;

/** */
alias gdk_device_get_position = c_gdk_device_get_position;

/** */
alias gdk_device_get_position_double = c_gdk_device_get_position_double;

/** */
alias gdk_device_get_product_id = c_gdk_device_get_product_id;

/** */
alias gdk_device_get_seat = c_gdk_device_get_seat;

/** */
alias gdk_device_get_source = c_gdk_device_get_source;

/** */
alias gdk_device_get_state = c_gdk_device_get_state;

/** */
alias gdk_device_get_vendor_id = c_gdk_device_get_vendor_id;

/** */
alias gdk_device_get_window_at_position = c_gdk_device_get_window_at_position;

/** */
alias gdk_device_get_window_at_position_double = c_gdk_device_get_window_at_position_double;

/** */
alias gdk_device_grab = c_gdk_device_grab;

/** */
alias gdk_device_list_axes = c_gdk_device_list_axes;

/** */
alias gdk_device_list_slave_devices = c_gdk_device_list_slave_devices;

/** */
alias gdk_device_set_axis_use = c_gdk_device_set_axis_use;

/** */
alias gdk_device_set_key = c_gdk_device_set_key;

/** */
alias gdk_device_set_mode = c_gdk_device_set_mode;

/** */
alias gdk_device_ungrab = c_gdk_device_ungrab;

/** */
alias gdk_device_warp = c_gdk_device_warp;

// DeviceManager

/** */
alias gdk_device_manager_get_type = c_gdk_device_manager_get_type;

/** */
alias gdk_device_manager_get_client_pointer = c_gdk_device_manager_get_client_pointer;

/** */
alias gdk_device_manager_get_display = c_gdk_device_manager_get_display;

/** */
alias gdk_device_manager_list_devices = c_gdk_device_manager_list_devices;

// DevicePad

/** */
alias gdk_device_pad_get_type = c_gdk_device_pad_get_type;

/** */
alias gdk_device_pad_get_feature_group = c_gdk_device_pad_get_feature_group;

/** */
alias gdk_device_pad_get_group_n_modes = c_gdk_device_pad_get_group_n_modes;

/** */
alias gdk_device_pad_get_n_features = c_gdk_device_pad_get_n_features;

/** */
alias gdk_device_pad_get_n_groups = c_gdk_device_pad_get_n_groups;

// DeviceTool

/** */
alias gdk_device_tool_get_type = c_gdk_device_tool_get_type;

/** */
alias gdk_device_tool_get_hardware_id = c_gdk_device_tool_get_hardware_id;

/** */
alias gdk_device_tool_get_serial = c_gdk_device_tool_get_serial;

/** */
alias gdk_device_tool_get_tool_type = c_gdk_device_tool_get_tool_type;

// Display

/** */
alias gdk_display_get_type = c_gdk_display_get_type;

/** */
alias gdk_display_get_default = c_gdk_display_get_default;

/** */
alias gdk_display_open = c_gdk_display_open;

/** */
alias gdk_display_open_default_libgtk_only = c_gdk_display_open_default_libgtk_only;

/** */
alias gdk_display_beep = c_gdk_display_beep;

/** */
alias gdk_display_close = c_gdk_display_close;

/** */
alias gdk_display_device_is_grabbed = c_gdk_display_device_is_grabbed;

/** */
alias gdk_display_flush = c_gdk_display_flush;

/** */
alias gdk_display_get_app_launch_context = c_gdk_display_get_app_launch_context;

/** */
alias gdk_display_get_default_cursor_size = c_gdk_display_get_default_cursor_size;

/** */
alias gdk_display_get_default_group = c_gdk_display_get_default_group;

/** */
alias gdk_display_get_default_screen = c_gdk_display_get_default_screen;

/** */
alias gdk_display_get_default_seat = c_gdk_display_get_default_seat;

/** */
alias gdk_display_get_device_manager = c_gdk_display_get_device_manager;

/** */
alias gdk_display_get_event = c_gdk_display_get_event;

/** */
alias gdk_display_get_maximal_cursor_size = c_gdk_display_get_maximal_cursor_size;

/** */
alias gdk_display_get_monitor = c_gdk_display_get_monitor;

/** */
alias gdk_display_get_monitor_at_point = c_gdk_display_get_monitor_at_point;

/** */
alias gdk_display_get_monitor_at_window = c_gdk_display_get_monitor_at_window;

/** */
alias gdk_display_get_n_monitors = c_gdk_display_get_n_monitors;

/** */
alias gdk_display_get_n_screens = c_gdk_display_get_n_screens;

/** */
alias gdk_display_get_name = c_gdk_display_get_name;

/** */
alias gdk_display_get_pointer = c_gdk_display_get_pointer;

/** */
alias gdk_display_get_primary_monitor = c_gdk_display_get_primary_monitor;

/** */
alias gdk_display_get_screen = c_gdk_display_get_screen;

/** */
alias gdk_display_get_window_at_pointer = c_gdk_display_get_window_at_pointer;

/** */
alias gdk_display_has_pending = c_gdk_display_has_pending;

/** */
alias gdk_display_is_closed = c_gdk_display_is_closed;

/** */
alias gdk_display_keyboard_ungrab = c_gdk_display_keyboard_ungrab;

/** */
alias gdk_display_list_devices = c_gdk_display_list_devices;

/** */
alias gdk_display_list_seats = c_gdk_display_list_seats;

/** */
alias gdk_display_notify_startup_complete = c_gdk_display_notify_startup_complete;

/** */
alias gdk_display_peek_event = c_gdk_display_peek_event;

/** */
alias gdk_display_pointer_is_grabbed = c_gdk_display_pointer_is_grabbed;

/** */
alias gdk_display_pointer_ungrab = c_gdk_display_pointer_ungrab;

/** */
alias gdk_display_put_event = c_gdk_display_put_event;

/** */
alias gdk_display_request_selection_notification = c_gdk_display_request_selection_notification;

/** */
alias gdk_display_set_double_click_distance = c_gdk_display_set_double_click_distance;

/** */
alias gdk_display_set_double_click_time = c_gdk_display_set_double_click_time;

/** */
alias gdk_display_store_clipboard = c_gdk_display_store_clipboard;

/** */
alias gdk_display_supports_clipboard_persistence = c_gdk_display_supports_clipboard_persistence;

/** */
alias gdk_display_supports_composite = c_gdk_display_supports_composite;

/** */
alias gdk_display_supports_cursor_alpha = c_gdk_display_supports_cursor_alpha;

/** */
alias gdk_display_supports_cursor_color = c_gdk_display_supports_cursor_color;

/** */
alias gdk_display_supports_input_shapes = c_gdk_display_supports_input_shapes;

/** */
alias gdk_display_supports_selection_notification = c_gdk_display_supports_selection_notification;

/** */
alias gdk_display_supports_shapes = c_gdk_display_supports_shapes;

/** */
alias gdk_display_sync = c_gdk_display_sync;

/** */
alias gdk_display_warp_pointer = c_gdk_display_warp_pointer;

// DisplayManager

/** */
alias gdk_display_manager_get_type = c_gdk_display_manager_get_type;

/** */
alias gdk_display_manager_get = c_gdk_display_manager_get;

/** */
alias gdk_display_manager_get_default_display = c_gdk_display_manager_get_default_display;

/** */
alias gdk_display_manager_list_displays = c_gdk_display_manager_list_displays;

/** */
alias gdk_display_manager_open_display = c_gdk_display_manager_open_display;

/** */
alias gdk_display_manager_set_default_display = c_gdk_display_manager_set_default_display;

// DragContext

/** */
alias gdk_drag_context_get_type = c_gdk_drag_context_get_type;

/** */
alias gdk_drag_context_get_actions = c_gdk_drag_context_get_actions;

/** */
alias gdk_drag_context_get_dest_window = c_gdk_drag_context_get_dest_window;

/** */
alias gdk_drag_context_get_device = c_gdk_drag_context_get_device;

/** */
alias gdk_drag_context_get_drag_window = c_gdk_drag_context_get_drag_window;

/** */
alias gdk_drag_context_get_protocol = c_gdk_drag_context_get_protocol;

/** */
alias gdk_drag_context_get_selected_action = c_gdk_drag_context_get_selected_action;

/** */
alias gdk_drag_context_get_source_window = c_gdk_drag_context_get_source_window;

/** */
alias gdk_drag_context_get_suggested_action = c_gdk_drag_context_get_suggested_action;

/** */
alias gdk_drag_context_list_targets = c_gdk_drag_context_list_targets;

/** */
alias gdk_drag_context_manage_dnd = c_gdk_drag_context_manage_dnd;

/** */
alias gdk_drag_context_set_device = c_gdk_drag_context_set_device;

/** */
alias gdk_drag_context_set_hotspot = c_gdk_drag_context_set_hotspot;

// DrawingContext

/** */
alias gdk_drawing_context_get_type = c_gdk_drawing_context_get_type;

/** */
alias gdk_drawing_context_get_cairo_context = c_gdk_drawing_context_get_cairo_context;

/** */
alias gdk_drawing_context_get_clip = c_gdk_drawing_context_get_clip;

/** */
alias gdk_drawing_context_get_window = c_gdk_drawing_context_get_window;

/** */
alias gdk_drawing_context_is_valid = c_gdk_drawing_context_is_valid;

// Event

/** */
alias gdk_event_get_type = c_gdk_event_get_type;

/** */
alias gdk_event_new = c_gdk_event_new;

/** */
alias gdk_event_copy = c_gdk_event_copy;

/** */
alias gdk_event_free = c_gdk_event_free;

/** */
alias gdk_event_get_axis = c_gdk_event_get_axis;

/** */
alias gdk_event_get_button = c_gdk_event_get_button;

/** */
alias gdk_event_get_click_count = c_gdk_event_get_click_count;

/** */
alias gdk_event_get_coords = c_gdk_event_get_coords;

/** */
alias gdk_event_get_device = c_gdk_event_get_device;

/** */
alias gdk_event_get_device_tool = c_gdk_event_get_device_tool;

/** */
alias gdk_event_get_event_sequence = c_gdk_event_get_event_sequence;

/** */
alias gdk_event_get_event_type = c_gdk_event_get_event_type;

/** */
alias gdk_event_get_keycode = c_gdk_event_get_keycode;

/** */
alias gdk_event_get_keyval = c_gdk_event_get_keyval;

/** */
alias gdk_event_get_pointer_emulated = c_gdk_event_get_pointer_emulated;

/** */
alias gdk_event_get_root_coords = c_gdk_event_get_root_coords;

/** */
alias gdk_event_get_scancode = c_gdk_event_get_scancode;

/** */
alias gdk_event_get_screen = c_gdk_event_get_screen;

/** */
alias gdk_event_get_scroll_deltas = c_gdk_event_get_scroll_deltas;

/** */
alias gdk_event_get_scroll_direction = c_gdk_event_get_scroll_direction;

/** */
alias gdk_event_get_seat = c_gdk_event_get_seat;

/** */
alias gdk_event_get_source_device = c_gdk_event_get_source_device;

/** */
alias gdk_event_get_state = c_gdk_event_get_state;

/** */
alias gdk_event_get_time = c_gdk_event_get_time;

/** */
alias gdk_event_get_window = c_gdk_event_get_window;

/** */
alias gdk_event_is_scroll_stop_event = c_gdk_event_is_scroll_stop_event;

/** */
alias gdk_event_put = c_gdk_event_put;

/** */
alias gdk_event_set_device = c_gdk_event_set_device;

/** */
alias gdk_event_set_device_tool = c_gdk_event_set_device_tool;

/** */
alias gdk_event_set_screen = c_gdk_event_set_screen;

/** */
alias gdk_event_set_source_device = c_gdk_event_set_source_device;

/** */
alias gdk_event_triggers_context_menu = c_gdk_event_triggers_context_menu;

/** */
alias gdk_event_get = c_gdk_event_get;

/** */
alias gdk_event_handler_set = c_gdk_event_handler_set;

/** */
alias gdk_event_peek = c_gdk_event_peek;

/** */
alias gdk_event_request_motions = c_gdk_event_request_motions;

// EventSequence

/** */
alias gdk_event_sequence_get_type = c_gdk_event_sequence_get_type;

// FrameClock

/** */
alias gdk_frame_clock_get_type = c_gdk_frame_clock_get_type;

/** */
alias gdk_frame_clock_begin_updating = c_gdk_frame_clock_begin_updating;

/** */
alias gdk_frame_clock_end_updating = c_gdk_frame_clock_end_updating;

/** */
alias gdk_frame_clock_get_current_timings = c_gdk_frame_clock_get_current_timings;

/** */
alias gdk_frame_clock_get_frame_counter = c_gdk_frame_clock_get_frame_counter;

/** */
alias gdk_frame_clock_get_frame_time = c_gdk_frame_clock_get_frame_time;

/** */
alias gdk_frame_clock_get_history_start = c_gdk_frame_clock_get_history_start;

/** */
alias gdk_frame_clock_get_refresh_info = c_gdk_frame_clock_get_refresh_info;

/** */
alias gdk_frame_clock_get_timings = c_gdk_frame_clock_get_timings;

/** */
alias gdk_frame_clock_request_phase = c_gdk_frame_clock_request_phase;

// FrameTimings

/** */
alias gdk_frame_timings_get_type = c_gdk_frame_timings_get_type;

/** */
alias gdk_frame_timings_get_complete = c_gdk_frame_timings_get_complete;

/** */
alias gdk_frame_timings_get_frame_counter = c_gdk_frame_timings_get_frame_counter;

/** */
alias gdk_frame_timings_get_frame_time = c_gdk_frame_timings_get_frame_time;

/** */
alias gdk_frame_timings_get_predicted_presentation_time = c_gdk_frame_timings_get_predicted_presentation_time;

/** */
alias gdk_frame_timings_get_presentation_time = c_gdk_frame_timings_get_presentation_time;

/** */
alias gdk_frame_timings_get_refresh_interval = c_gdk_frame_timings_get_refresh_interval;

/** */
alias gdk_frame_timings_ref = c_gdk_frame_timings_ref;

/** */
alias gdk_frame_timings_unref = c_gdk_frame_timings_unref;

// GLContext

/** */
alias gdk_gl_context_get_type = c_gdk_gl_context_get_type;

/** */
alias gdk_gl_context_clear_current = c_gdk_gl_context_clear_current;

/** */
alias gdk_gl_context_get_current = c_gdk_gl_context_get_current;

/** */
alias gdk_gl_context_get_debug_enabled = c_gdk_gl_context_get_debug_enabled;

/** */
alias gdk_gl_context_get_display = c_gdk_gl_context_get_display;

/** */
alias gdk_gl_context_get_forward_compatible = c_gdk_gl_context_get_forward_compatible;

/** */
alias gdk_gl_context_get_required_version = c_gdk_gl_context_get_required_version;

/** */
alias gdk_gl_context_get_shared_context = c_gdk_gl_context_get_shared_context;

/** */
alias gdk_gl_context_get_use_es = c_gdk_gl_context_get_use_es;

/** */
alias gdk_gl_context_get_version = c_gdk_gl_context_get_version;

/** */
alias gdk_gl_context_get_window = c_gdk_gl_context_get_window;

/** */
alias gdk_gl_context_is_legacy = c_gdk_gl_context_is_legacy;

/** */
alias gdk_gl_context_make_current = c_gdk_gl_context_make_current;

/** */
alias gdk_gl_context_realize = c_gdk_gl_context_realize;

/** */
alias gdk_gl_context_set_debug_enabled = c_gdk_gl_context_set_debug_enabled;

/** */
alias gdk_gl_context_set_forward_compatible = c_gdk_gl_context_set_forward_compatible;

/** */
alias gdk_gl_context_set_required_version = c_gdk_gl_context_set_required_version;

/** */
alias gdk_gl_context_set_use_es = c_gdk_gl_context_set_use_es;

// Keymap

/** */
alias gdk_keymap_get_type = c_gdk_keymap_get_type;

/** */
alias gdk_keymap_get_default = c_gdk_keymap_get_default;

/** */
alias gdk_keymap_get_for_display = c_gdk_keymap_get_for_display;

/** */
alias gdk_keymap_add_virtual_modifiers = c_gdk_keymap_add_virtual_modifiers;

/** */
alias gdk_keymap_get_caps_lock_state = c_gdk_keymap_get_caps_lock_state;

/** */
alias gdk_keymap_get_direction = c_gdk_keymap_get_direction;

/** */
alias gdk_keymap_get_entries_for_keycode = c_gdk_keymap_get_entries_for_keycode;

/** */
alias gdk_keymap_get_entries_for_keyval = c_gdk_keymap_get_entries_for_keyval;

/** */
alias gdk_keymap_get_modifier_mask = c_gdk_keymap_get_modifier_mask;

/** */
alias gdk_keymap_get_modifier_state = c_gdk_keymap_get_modifier_state;

/** */
alias gdk_keymap_get_num_lock_state = c_gdk_keymap_get_num_lock_state;

/** */
alias gdk_keymap_get_scroll_lock_state = c_gdk_keymap_get_scroll_lock_state;

/** */
alias gdk_keymap_have_bidi_layouts = c_gdk_keymap_have_bidi_layouts;

/** */
alias gdk_keymap_lookup_key = c_gdk_keymap_lookup_key;

/** */
alias gdk_keymap_map_virtual_modifiers = c_gdk_keymap_map_virtual_modifiers;

/** */
alias gdk_keymap_translate_keyboard_state = c_gdk_keymap_translate_keyboard_state;

// MonitorWrap

/** */
alias gdk_monitor_get_type = c_gdk_monitor_get_type;

/** */
alias gdk_monitor_get_display = c_gdk_monitor_get_display;

/** */
alias gdk_monitor_get_geometry = c_gdk_monitor_get_geometry;

/** */
alias gdk_monitor_get_height_mm = c_gdk_monitor_get_height_mm;

/** */
alias gdk_monitor_get_manufacturer = c_gdk_monitor_get_manufacturer;

/** */
alias gdk_monitor_get_model = c_gdk_monitor_get_model;

/** */
alias gdk_monitor_get_refresh_rate = c_gdk_monitor_get_refresh_rate;

/** */
alias gdk_monitor_get_scale_factor = c_gdk_monitor_get_scale_factor;

/** */
alias gdk_monitor_get_subpixel_layout = c_gdk_monitor_get_subpixel_layout;

/** */
alias gdk_monitor_get_width_mm = c_gdk_monitor_get_width_mm;

/** */
alias gdk_monitor_get_workarea = c_gdk_monitor_get_workarea;

/** */
alias gdk_monitor_is_primary = c_gdk_monitor_is_primary;

// RGBA

/** */
alias gdk_rgba_get_type = c_gdk_rgba_get_type;

/** */
alias gdk_rgba_copy = c_gdk_rgba_copy;

/** */
alias gdk_rgba_equal = c_gdk_rgba_equal;

/** */
alias gdk_rgba_free = c_gdk_rgba_free;

/** */
alias gdk_rgba_hash = c_gdk_rgba_hash;

/** */
alias gdk_rgba_parse = c_gdk_rgba_parse;

/** */
alias gdk_rgba_to_string = c_gdk_rgba_to_string;

// Rectangle

/** */
alias gdk_rectangle_get_type = c_gdk_rectangle_get_type;

/** */
alias gdk_rectangle_equal = c_gdk_rectangle_equal;

/** */
alias gdk_rectangle_intersect = c_gdk_rectangle_intersect;

/** */
alias gdk_rectangle_union = c_gdk_rectangle_union;

// Screen

/** */
alias gdk_screen_get_type = c_gdk_screen_get_type;

/** */
alias gdk_screen_get_default = c_gdk_screen_get_default;

/** */
alias gdk_screen_height = c_gdk_screen_height;

/** */
alias gdk_screen_height_mm = c_gdk_screen_height_mm;

/** */
alias gdk_screen_width = c_gdk_screen_width;

/** */
alias gdk_screen_width_mm = c_gdk_screen_width_mm;

/** */
alias gdk_screen_get_active_window = c_gdk_screen_get_active_window;

/** */
alias gdk_screen_get_display = c_gdk_screen_get_display;

/** */
alias gdk_screen_get_font_options = c_gdk_screen_get_font_options;

/** */
alias gdk_screen_get_height = c_gdk_screen_get_height;

/** */
alias gdk_screen_get_height_mm = c_gdk_screen_get_height_mm;

/** */
alias gdk_screen_get_monitor_at_point = c_gdk_screen_get_monitor_at_point;

/** */
alias gdk_screen_get_monitor_at_window = c_gdk_screen_get_monitor_at_window;

/** */
alias gdk_screen_get_monitor_geometry = c_gdk_screen_get_monitor_geometry;

/** */
alias gdk_screen_get_monitor_height_mm = c_gdk_screen_get_monitor_height_mm;

/** */
alias gdk_screen_get_monitor_plug_name = c_gdk_screen_get_monitor_plug_name;

/** */
alias gdk_screen_get_monitor_scale_factor = c_gdk_screen_get_monitor_scale_factor;

/** */
alias gdk_screen_get_monitor_width_mm = c_gdk_screen_get_monitor_width_mm;

/** */
alias gdk_screen_get_monitor_workarea = c_gdk_screen_get_monitor_workarea;

/** */
alias gdk_screen_get_n_monitors = c_gdk_screen_get_n_monitors;

/** */
alias gdk_screen_get_number = c_gdk_screen_get_number;

/** */
alias gdk_screen_get_primary_monitor = c_gdk_screen_get_primary_monitor;

/** */
alias gdk_screen_get_resolution = c_gdk_screen_get_resolution;

/** */
alias gdk_screen_get_rgba_visual = c_gdk_screen_get_rgba_visual;

/** */
alias gdk_screen_get_root_window = c_gdk_screen_get_root_window;

/** */
alias gdk_screen_get_setting = c_gdk_screen_get_setting;

/** */
alias gdk_screen_get_system_visual = c_gdk_screen_get_system_visual;

/** */
alias gdk_screen_get_toplevel_windows = c_gdk_screen_get_toplevel_windows;

/** */
alias gdk_screen_get_width = c_gdk_screen_get_width;

/** */
alias gdk_screen_get_width_mm = c_gdk_screen_get_width_mm;

/** */
alias gdk_screen_get_window_stack = c_gdk_screen_get_window_stack;

/** */
alias gdk_screen_is_composited = c_gdk_screen_is_composited;

/** */
alias gdk_screen_list_visuals = c_gdk_screen_list_visuals;

/** */
alias gdk_screen_make_display_name = c_gdk_screen_make_display_name;

/** */
alias gdk_screen_set_font_options = c_gdk_screen_set_font_options;

/** */
alias gdk_screen_set_resolution = c_gdk_screen_set_resolution;

// Seat

/** */
alias gdk_seat_get_type = c_gdk_seat_get_type;

/** */
alias gdk_seat_get_capabilities = c_gdk_seat_get_capabilities;

/** */
alias gdk_seat_get_display = c_gdk_seat_get_display;

/** */
alias gdk_seat_get_keyboard = c_gdk_seat_get_keyboard;

/** */
alias gdk_seat_get_pointer = c_gdk_seat_get_pointer;

/** */
alias gdk_seat_get_slaves = c_gdk_seat_get_slaves;

/** */
alias gdk_seat_grab = c_gdk_seat_grab;

/** */
alias gdk_seat_ungrab = c_gdk_seat_ungrab;

// Visual

/** */
alias gdk_visual_get_type = c_gdk_visual_get_type;

/** */
alias gdk_visual_get_best = c_gdk_visual_get_best;

/** */
alias gdk_visual_get_best_depth = c_gdk_visual_get_best_depth;

/** */
alias gdk_visual_get_best_type = c_gdk_visual_get_best_type;

/** */
alias gdk_visual_get_best_with_both = c_gdk_visual_get_best_with_both;

/** */
alias gdk_visual_get_best_with_depth = c_gdk_visual_get_best_with_depth;

/** */
alias gdk_visual_get_best_with_type = c_gdk_visual_get_best_with_type;

/** */
alias gdk_visual_get_system = c_gdk_visual_get_system;

/** */
alias gdk_visual_get_bits_per_rgb = c_gdk_visual_get_bits_per_rgb;

/** */
alias gdk_visual_get_blue_pixel_details = c_gdk_visual_get_blue_pixel_details;

/** */
alias gdk_visual_get_byte_order = c_gdk_visual_get_byte_order;

/** */
alias gdk_visual_get_colormap_size = c_gdk_visual_get_colormap_size;

/** */
alias gdk_visual_get_depth = c_gdk_visual_get_depth;

/** */
alias gdk_visual_get_green_pixel_details = c_gdk_visual_get_green_pixel_details;

/** */
alias gdk_visual_get_red_pixel_details = c_gdk_visual_get_red_pixel_details;

/** */
alias gdk_visual_get_screen = c_gdk_visual_get_screen;

/** */
alias gdk_visual_get_visual_type = c_gdk_visual_get_visual_type;

// Window

/** */
alias gdk_window_get_type = c_gdk_window_get_type;

/** */
alias gdk_window_new = c_gdk_window_new;

/** */
alias gdk_window_at_pointer = c_gdk_window_at_pointer;

/** */
alias gdk_window_constrain_size = c_gdk_window_constrain_size;

/** */
alias gdk_window_process_all_updates = c_gdk_window_process_all_updates;

/** */
alias gdk_window_set_debug_updates = c_gdk_window_set_debug_updates;

/** */
alias gdk_window_add_filter = c_gdk_window_add_filter;

/** */
alias gdk_window_beep = c_gdk_window_beep;

/** */
alias gdk_window_begin_draw_frame = c_gdk_window_begin_draw_frame;

/** */
alias gdk_window_begin_move_drag = c_gdk_window_begin_move_drag;

/** */
alias gdk_window_begin_move_drag_for_device = c_gdk_window_begin_move_drag_for_device;

/** */
alias gdk_window_begin_paint_rect = c_gdk_window_begin_paint_rect;

/** */
alias gdk_window_begin_paint_region = c_gdk_window_begin_paint_region;

/** */
alias gdk_window_begin_resize_drag = c_gdk_window_begin_resize_drag;

/** */
alias gdk_window_begin_resize_drag_for_device = c_gdk_window_begin_resize_drag_for_device;

/** */
alias gdk_window_configure_finished = c_gdk_window_configure_finished;

/** */
alias gdk_window_coords_from_parent = c_gdk_window_coords_from_parent;

/** */
alias gdk_window_coords_to_parent = c_gdk_window_coords_to_parent;

/** */
alias gdk_window_create_gl_context = c_gdk_window_create_gl_context;

/** */
alias gdk_window_create_similar_image_surface = c_gdk_window_create_similar_image_surface;

/** */
alias gdk_window_create_similar_surface = c_gdk_window_create_similar_surface;

/** */
alias gdk_window_deiconify = c_gdk_window_deiconify;

/** */
alias gdk_window_destroy = c_gdk_window_destroy;

/** */
alias gdk_window_destroy_notify = c_gdk_window_destroy_notify;

/** */
alias gdk_window_enable_synchronized_configure = c_gdk_window_enable_synchronized_configure;

/** */
alias gdk_window_end_draw_frame = c_gdk_window_end_draw_frame;

/** */
alias gdk_window_end_paint = c_gdk_window_end_paint;

/** */
alias gdk_window_ensure_native = c_gdk_window_ensure_native;

/** */
alias gdk_window_flush = c_gdk_window_flush;

/** */
alias gdk_window_focus = c_gdk_window_focus;

/** */
alias gdk_window_freeze_toplevel_updates_libgtk_only = c_gdk_window_freeze_toplevel_updates_libgtk_only;

/** */
alias gdk_window_freeze_updates = c_gdk_window_freeze_updates;

/** */
alias gdk_window_fullscreen = c_gdk_window_fullscreen;

/** */
alias gdk_window_fullscreen_on_monitor = c_gdk_window_fullscreen_on_monitor;

/** */
alias gdk_window_geometry_changed = c_gdk_window_geometry_changed;

/** */
alias gdk_window_get_accept_focus = c_gdk_window_get_accept_focus;

/** */
alias gdk_window_get_background_pattern = c_gdk_window_get_background_pattern;

/** */
alias gdk_window_get_children = c_gdk_window_get_children;

/** */
alias gdk_window_get_children_with_user_data = c_gdk_window_get_children_with_user_data;

/** */
alias gdk_window_get_clip_region = c_gdk_window_get_clip_region;

/** */
alias gdk_window_get_composited = c_gdk_window_get_composited;

/** */
alias gdk_window_get_cursor = c_gdk_window_get_cursor;

/** */
alias gdk_window_get_decorations = c_gdk_window_get_decorations;

/** */
alias gdk_window_get_device_cursor = c_gdk_window_get_device_cursor;

/** */
alias gdk_window_get_device_events = c_gdk_window_get_device_events;

/** */
alias gdk_window_get_device_position = c_gdk_window_get_device_position;

/** */
alias gdk_window_get_device_position_double = c_gdk_window_get_device_position_double;

/** */
alias gdk_window_get_display = c_gdk_window_get_display;

/** */
alias gdk_window_get_drag_protocol = c_gdk_window_get_drag_protocol;

/** */
alias gdk_window_get_effective_parent = c_gdk_window_get_effective_parent;

/** */
alias gdk_window_get_effective_toplevel = c_gdk_window_get_effective_toplevel;

/** */
alias gdk_window_get_event_compression = c_gdk_window_get_event_compression;

/** */
alias gdk_window_get_events = c_gdk_window_get_events;

/** */
alias gdk_window_get_focus_on_map = c_gdk_window_get_focus_on_map;

/** */
alias gdk_window_get_frame_clock = c_gdk_window_get_frame_clock;

/** */
alias gdk_window_get_frame_extents = c_gdk_window_get_frame_extents;

/** */
alias gdk_window_get_fullscreen_mode = c_gdk_window_get_fullscreen_mode;

/** */
alias gdk_window_get_geometry = c_gdk_window_get_geometry;

/** */
alias gdk_window_get_group = c_gdk_window_get_group;

/** */
alias gdk_window_get_height = c_gdk_window_get_height;

/** */
alias gdk_window_get_modal_hint = c_gdk_window_get_modal_hint;

/** */
alias gdk_window_get_origin = c_gdk_window_get_origin;

/** */
alias gdk_window_get_parent = c_gdk_window_get_parent;

/** */
alias gdk_window_get_pass_through = c_gdk_window_get_pass_through;

/** */
alias gdk_window_get_pointer = c_gdk_window_get_pointer;

/** */
alias gdk_window_get_position = c_gdk_window_get_position;

/** */
alias gdk_window_get_root_coords = c_gdk_window_get_root_coords;

/** */
alias gdk_window_get_root_origin = c_gdk_window_get_root_origin;

/** */
alias gdk_window_get_scale_factor = c_gdk_window_get_scale_factor;

/** */
alias gdk_window_get_screen = c_gdk_window_get_screen;

/** */
alias gdk_window_get_source_events = c_gdk_window_get_source_events;

/** */
alias gdk_window_get_state = c_gdk_window_get_state;

/** */
alias gdk_window_get_support_multidevice = c_gdk_window_get_support_multidevice;

/** */
alias gdk_window_get_toplevel = c_gdk_window_get_toplevel;

/** */
alias gdk_window_get_type_hint = c_gdk_window_get_type_hint;

/** */
alias gdk_window_get_update_area = c_gdk_window_get_update_area;

/** */
alias gdk_window_get_user_data = c_gdk_window_get_user_data;

/** */
alias gdk_window_get_visible_region = c_gdk_window_get_visible_region;

/** */
alias gdk_window_get_visual = c_gdk_window_get_visual;

/** */
alias gdk_window_get_width = c_gdk_window_get_width;

/** */
alias gdk_window_get_window_type = c_gdk_window_get_window_type;

/** */
alias gdk_window_has_native = c_gdk_window_has_native;

/** */
alias gdk_window_hide = c_gdk_window_hide;

/** */
alias gdk_window_iconify = c_gdk_window_iconify;

/** */
alias gdk_window_input_shape_combine_region = c_gdk_window_input_shape_combine_region;

/** */
alias gdk_window_invalidate_maybe_recurse = c_gdk_window_invalidate_maybe_recurse;

/** */
alias gdk_window_invalidate_rect = c_gdk_window_invalidate_rect;

/** */
alias gdk_window_invalidate_region = c_gdk_window_invalidate_region;

/** */
alias gdk_window_is_destroyed = c_gdk_window_is_destroyed;

/** */
alias gdk_window_is_input_only = c_gdk_window_is_input_only;

/** */
alias gdk_window_is_shaped = c_gdk_window_is_shaped;

/** */
alias gdk_window_is_viewable = c_gdk_window_is_viewable;

/** */
alias gdk_window_is_visible = c_gdk_window_is_visible;

/** */
alias gdk_window_lower = c_gdk_window_lower;

/** */
alias gdk_window_mark_paint_from_clip = c_gdk_window_mark_paint_from_clip;

/** */
alias gdk_window_maximize = c_gdk_window_maximize;

/** */
alias gdk_window_merge_child_input_shapes = c_gdk_window_merge_child_input_shapes;

/** */
alias gdk_window_merge_child_shapes = c_gdk_window_merge_child_shapes;

/** */
alias gdk_window_move = c_gdk_window_move;

/** */
alias gdk_window_move_region = c_gdk_window_move_region;

/** */
alias gdk_window_move_resize = c_gdk_window_move_resize;

/** */
alias gdk_window_move_to_rect = c_gdk_window_move_to_rect;

/** */
alias gdk_window_peek_children = c_gdk_window_peek_children;

/** */
alias gdk_window_process_updates = c_gdk_window_process_updates;

/** */
alias gdk_window_raise = c_gdk_window_raise;

/** */
alias gdk_window_register_dnd = c_gdk_window_register_dnd;

/** */
alias gdk_window_remove_filter = c_gdk_window_remove_filter;

/** */
alias gdk_window_reparent = c_gdk_window_reparent;

/** */
alias gdk_window_resize = c_gdk_window_resize;

/** */
alias gdk_window_restack = c_gdk_window_restack;

/** */
alias gdk_window_scroll = c_gdk_window_scroll;

/** */
alias gdk_window_set_accept_focus = c_gdk_window_set_accept_focus;

/** */
alias gdk_window_set_background = c_gdk_window_set_background;

/** */
alias gdk_window_set_background_pattern = c_gdk_window_set_background_pattern;

/** */
alias gdk_window_set_background_rgba = c_gdk_window_set_background_rgba;

/** */
alias gdk_window_set_child_input_shapes = c_gdk_window_set_child_input_shapes;

/** */
alias gdk_window_set_child_shapes = c_gdk_window_set_child_shapes;

/** */
alias gdk_window_set_composited = c_gdk_window_set_composited;

/** */
alias gdk_window_set_cursor = c_gdk_window_set_cursor;

/** */
alias gdk_window_set_decorations = c_gdk_window_set_decorations;

/** */
alias gdk_window_set_device_cursor = c_gdk_window_set_device_cursor;

/** */
alias gdk_window_set_device_events = c_gdk_window_set_device_events;

/** */
alias gdk_window_set_event_compression = c_gdk_window_set_event_compression;

/** */
alias gdk_window_set_events = c_gdk_window_set_events;

/** */
alias gdk_window_set_focus_on_map = c_gdk_window_set_focus_on_map;

/** */
alias gdk_window_set_fullscreen_mode = c_gdk_window_set_fullscreen_mode;

/** */
alias gdk_window_set_functions = c_gdk_window_set_functions;

/** */
alias gdk_window_set_geometry_hints = c_gdk_window_set_geometry_hints;

/** */
alias gdk_window_set_group = c_gdk_window_set_group;

/** */
alias gdk_window_set_icon_list = c_gdk_window_set_icon_list;

/** */
alias gdk_window_set_icon_name = c_gdk_window_set_icon_name;

/** */
alias gdk_window_set_invalidate_handler = c_gdk_window_set_invalidate_handler;

/** */
alias gdk_window_set_keep_above = c_gdk_window_set_keep_above;

/** */
alias gdk_window_set_keep_below = c_gdk_window_set_keep_below;

/** */
alias gdk_window_set_modal_hint = c_gdk_window_set_modal_hint;

/** */
alias gdk_window_set_opacity = c_gdk_window_set_opacity;

/** */
alias gdk_window_set_opaque_region = c_gdk_window_set_opaque_region;

/** */
alias gdk_window_set_override_redirect = c_gdk_window_set_override_redirect;

/** */
alias gdk_window_set_pass_through = c_gdk_window_set_pass_through;

/** */
alias gdk_window_set_role = c_gdk_window_set_role;

/** */
alias gdk_window_set_shadow_width = c_gdk_window_set_shadow_width;

/** */
alias gdk_window_set_skip_pager_hint = c_gdk_window_set_skip_pager_hint;

/** */
alias gdk_window_set_skip_taskbar_hint = c_gdk_window_set_skip_taskbar_hint;

/** */
alias gdk_window_set_source_events = c_gdk_window_set_source_events;

/** */
alias gdk_window_set_startup_id = c_gdk_window_set_startup_id;

/** */
alias gdk_window_set_static_gravities = c_gdk_window_set_static_gravities;

/** */
alias gdk_window_set_support_multidevice = c_gdk_window_set_support_multidevice;

/** */
alias gdk_window_set_title = c_gdk_window_set_title;

/** */
alias gdk_window_set_transient_for = c_gdk_window_set_transient_for;

/** */
alias gdk_window_set_type_hint = c_gdk_window_set_type_hint;

/** */
alias gdk_window_set_urgency_hint = c_gdk_window_set_urgency_hint;

/** */
alias gdk_window_set_user_data = c_gdk_window_set_user_data;

/** */
alias gdk_window_shape_combine_region = c_gdk_window_shape_combine_region;

/** */
alias gdk_window_show = c_gdk_window_show;

/** */
alias gdk_window_show_unraised = c_gdk_window_show_unraised;

/** */
alias gdk_window_show_window_menu = c_gdk_window_show_window_menu;

/** */
alias gdk_window_stick = c_gdk_window_stick;

/** */
alias gdk_window_thaw_toplevel_updates_libgtk_only = c_gdk_window_thaw_toplevel_updates_libgtk_only;

/** */
alias gdk_window_thaw_updates = c_gdk_window_thaw_updates;

/** */
alias gdk_window_unfullscreen = c_gdk_window_unfullscreen;

/** */
alias gdk_window_unmaximize = c_gdk_window_unmaximize;

/** */
alias gdk_window_unstick = c_gdk_window_unstick;

/** */
alias gdk_window_withdraw = c_gdk_window_withdraw;

// global

/** */
alias gdk_add_option_entries_libgtk_only = c_gdk_add_option_entries_libgtk_only;

/** */
alias gdk_beep = c_gdk_beep;

/** */
alias gdk_cairo_create = c_gdk_cairo_create;

/** */
alias gdk_cairo_draw_from_gl = c_gdk_cairo_draw_from_gl;

/** */
alias gdk_cairo_get_clip_rectangle = c_gdk_cairo_get_clip_rectangle;

/** */
alias gdk_cairo_get_drawing_context = c_gdk_cairo_get_drawing_context;

/** */
alias gdk_cairo_rectangle = c_gdk_cairo_rectangle;

/** */
alias gdk_cairo_region = c_gdk_cairo_region;

/** */
alias gdk_cairo_region_create_from_surface = c_gdk_cairo_region_create_from_surface;

/** */
alias gdk_cairo_set_source_color = c_gdk_cairo_set_source_color;

/** */
alias gdk_cairo_set_source_pixbuf = c_gdk_cairo_set_source_pixbuf;

/** */
alias gdk_cairo_set_source_rgba = c_gdk_cairo_set_source_rgba;

/** */
alias gdk_cairo_set_source_window = c_gdk_cairo_set_source_window;

/** */
alias gdk_cairo_surface_create_from_pixbuf = c_gdk_cairo_surface_create_from_pixbuf;

/** */
alias gdk_disable_multidevice = c_gdk_disable_multidevice;

/** */
alias gdk_drag_abort = c_gdk_drag_abort;

/** */
alias gdk_drag_begin = c_gdk_drag_begin;

/** */
alias gdk_drag_begin_for_device = c_gdk_drag_begin_for_device;

/** */
alias gdk_drag_begin_from_point = c_gdk_drag_begin_from_point;

/** */
alias gdk_drag_drop = c_gdk_drag_drop;

/** */
alias gdk_drag_drop_done = c_gdk_drag_drop_done;

/** */
alias gdk_drag_drop_succeeded = c_gdk_drag_drop_succeeded;

/** */
alias gdk_drag_find_window_for_screen = c_gdk_drag_find_window_for_screen;

/** */
alias gdk_drag_get_selection = c_gdk_drag_get_selection;

/** */
alias gdk_drag_motion = c_gdk_drag_motion;

/** */
alias gdk_drag_status = c_gdk_drag_status;

/** */
alias gdk_drop_finish = c_gdk_drop_finish;

/** */
alias gdk_drop_reply = c_gdk_drop_reply;

/** */
alias gdk_error_trap_pop = c_gdk_error_trap_pop;

/** */
alias gdk_error_trap_pop_ignored = c_gdk_error_trap_pop_ignored;

/** */
alias gdk_error_trap_push = c_gdk_error_trap_push;

/** */
alias gdk_events_get_angle = c_gdk_events_get_angle;

/** */
alias gdk_events_get_center = c_gdk_events_get_center;

/** */
alias gdk_events_get_distance = c_gdk_events_get_distance;

/** */
alias gdk_events_pending = c_gdk_events_pending;

/** */
alias gdk_flush = c_gdk_flush;

/** */
alias gdk_get_default_root_window = c_gdk_get_default_root_window;

/** */
alias gdk_get_display = c_gdk_get_display;

/** */
alias gdk_get_display_arg_name = c_gdk_get_display_arg_name;

/** */
alias gdk_get_program_class = c_gdk_get_program_class;

/** */
alias gdk_get_show_events = c_gdk_get_show_events;

/** */
alias gdk_init = c_gdk_init;

/** */
alias gdk_init_check = c_gdk_init_check;

/** */
alias gdk_keyboard_grab = c_gdk_keyboard_grab;

/** */
alias gdk_keyboard_ungrab = c_gdk_keyboard_ungrab;

/** */
alias gdk_keyval_convert_case = c_gdk_keyval_convert_case;

/** */
alias gdk_keyval_from_name = c_gdk_keyval_from_name;

/** */
alias gdk_keyval_is_lower = c_gdk_keyval_is_lower;

/** */
alias gdk_keyval_is_upper = c_gdk_keyval_is_upper;

/** */
alias gdk_keyval_name = c_gdk_keyval_name;

/** */
alias gdk_keyval_to_lower = c_gdk_keyval_to_lower;

/** */
alias gdk_keyval_to_unicode = c_gdk_keyval_to_unicode;

/** */
alias gdk_keyval_to_upper = c_gdk_keyval_to_upper;

/** */
alias gdk_list_visuals = c_gdk_list_visuals;

/** */
alias gdk_notify_startup_complete = c_gdk_notify_startup_complete;

/** */
alias gdk_notify_startup_complete_with_id = c_gdk_notify_startup_complete_with_id;

/** */
alias gdk_offscreen_window_get_embedder = c_gdk_offscreen_window_get_embedder;

/** */
alias gdk_offscreen_window_get_surface = c_gdk_offscreen_window_get_surface;

/** */
alias gdk_offscreen_window_set_embedder = c_gdk_offscreen_window_set_embedder;

/** */
alias gdk_pango_context_get = c_gdk_pango_context_get;

/** */
alias gdk_pango_context_get_for_display = c_gdk_pango_context_get_for_display;

/** */
alias gdk_pango_context_get_for_screen = c_gdk_pango_context_get_for_screen;

/** */
alias gdk_pango_layout_get_clip_region = c_gdk_pango_layout_get_clip_region;

/** */
alias gdk_pango_layout_line_get_clip_region = c_gdk_pango_layout_line_get_clip_region;

/** */
alias gdk_parse_args = c_gdk_parse_args;

/** */
alias gdk_pixbuf_get_from_surface = c_gdk_pixbuf_get_from_surface;

/** */
alias gdk_pixbuf_get_from_window = c_gdk_pixbuf_get_from_window;

/** */
alias gdk_pointer_grab = c_gdk_pointer_grab;

/** */
alias gdk_pointer_is_grabbed = c_gdk_pointer_is_grabbed;

/** */
alias gdk_pointer_ungrab = c_gdk_pointer_ungrab;

/** */
alias gdk_pre_parse_libgtk_only = c_gdk_pre_parse_libgtk_only;

/** */
alias gdk_property_change = c_gdk_property_change;

/** */
alias gdk_property_delete = c_gdk_property_delete;

/** */
alias gdk_property_get = c_gdk_property_get;

/** */
alias gdk_query_depths = c_gdk_query_depths;

/** */
alias gdk_query_visual_types = c_gdk_query_visual_types;

/** */
alias gdk_selection_convert = c_gdk_selection_convert;

/** */
alias gdk_selection_owner_get = c_gdk_selection_owner_get;

/** */
alias gdk_selection_owner_get_for_display = c_gdk_selection_owner_get_for_display;

/** */
alias gdk_selection_owner_set = c_gdk_selection_owner_set;

/** */
alias gdk_selection_owner_set_for_display = c_gdk_selection_owner_set_for_display;

/** */
alias gdk_selection_property_get = c_gdk_selection_property_get;

/** */
alias gdk_selection_send_notify = c_gdk_selection_send_notify;

/** */
alias gdk_selection_send_notify_for_display = c_gdk_selection_send_notify_for_display;

/** */
alias gdk_set_allowed_backends = c_gdk_set_allowed_backends;

/** */
alias gdk_set_double_click_time = c_gdk_set_double_click_time;

/** */
alias gdk_set_program_class = c_gdk_set_program_class;

/** */
alias gdk_set_show_events = c_gdk_set_show_events;

/** */
alias gdk_setting_get = c_gdk_setting_get;

/** */
alias gdk_synthesize_window_state = c_gdk_synthesize_window_state;

/** */
alias gdk_test_render_sync = c_gdk_test_render_sync;

/** */
alias gdk_test_simulate_button = c_gdk_test_simulate_button;

/** */
alias gdk_test_simulate_key = c_gdk_test_simulate_key;

/** */
alias gdk_text_property_to_utf8_list_for_display = c_gdk_text_property_to_utf8_list_for_display;

/** */
alias gdk_threads_add_idle = c_gdk_threads_add_idle;

/** */
alias gdk_threads_add_idle_full = c_gdk_threads_add_idle_full;

/** */
alias gdk_threads_add_timeout = c_gdk_threads_add_timeout;

/** */
alias gdk_threads_add_timeout_full = c_gdk_threads_add_timeout_full;

/** */
alias gdk_threads_add_timeout_seconds = c_gdk_threads_add_timeout_seconds;

/** */
alias gdk_threads_add_timeout_seconds_full = c_gdk_threads_add_timeout_seconds_full;

/** */
alias gdk_threads_enter = c_gdk_threads_enter;

/** */
alias gdk_threads_init = c_gdk_threads_init;

/** */
alias gdk_threads_leave = c_gdk_threads_leave;

/** */
alias gdk_threads_set_lock_functions = c_gdk_threads_set_lock_functions;

/** */
alias gdk_unicode_to_keyval = c_gdk_unicode_to_keyval;

/** */
alias gdk_utf8_to_string_target = c_gdk_utf8_to_string_target;

// GLError

/** */
alias gdk_gl_error_quark = c_gdk_gl_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gdk3");

  // AppLaunchContext
  gidLink(cast(void**)&gdk_app_launch_context_get_type, "gdk_app_launch_context_get_type", libs);
  gidLink(cast(void**)&gdk_app_launch_context_new, "gdk_app_launch_context_new", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_desktop, "gdk_app_launch_context_set_desktop", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_display, "gdk_app_launch_context_set_display", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_icon, "gdk_app_launch_context_set_icon", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_icon_name, "gdk_app_launch_context_set_icon_name", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_screen, "gdk_app_launch_context_set_screen", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_timestamp, "gdk_app_launch_context_set_timestamp", libs);

  // Atom
  gidLink(cast(void**)&gdk_atom_name, "gdk_atom_name", libs);
  gidLink(cast(void**)&gdk_atom_intern, "gdk_atom_intern", libs);
  gidLink(cast(void**)&gdk_atom_intern_static_string, "gdk_atom_intern_static_string", libs);

  // Color
  gidLink(cast(void**)&gdk_color_get_type, "gdk_color_get_type", libs);
  gidLink(cast(void**)&gdk_color_copy, "gdk_color_copy", libs);
  gidLink(cast(void**)&gdk_color_equal, "gdk_color_equal", libs);
  gidLink(cast(void**)&gdk_color_free, "gdk_color_free", libs);
  gidLink(cast(void**)&gdk_color_hash, "gdk_color_hash", libs);
  gidLink(cast(void**)&gdk_color_to_string, "gdk_color_to_string", libs);
  gidLink(cast(void**)&gdk_color_parse, "gdk_color_parse", libs);

  // Cursor
  gidLink(cast(void**)&gdk_cursor_get_type, "gdk_cursor_get_type", libs);
  gidLink(cast(void**)&gdk_cursor_new, "gdk_cursor_new", libs);
  gidLink(cast(void**)&gdk_cursor_new_for_display, "gdk_cursor_new_for_display", libs);
  gidLink(cast(void**)&gdk_cursor_new_from_name, "gdk_cursor_new_from_name", libs);
  gidLink(cast(void**)&gdk_cursor_new_from_pixbuf, "gdk_cursor_new_from_pixbuf", libs);
  gidLink(cast(void**)&gdk_cursor_new_from_surface, "gdk_cursor_new_from_surface", libs);
  gidLink(cast(void**)&gdk_cursor_get_cursor_type, "gdk_cursor_get_cursor_type", libs);
  gidLink(cast(void**)&gdk_cursor_get_display, "gdk_cursor_get_display", libs);
  gidLink(cast(void**)&gdk_cursor_get_image, "gdk_cursor_get_image", libs);
  gidLink(cast(void**)&gdk_cursor_get_surface, "gdk_cursor_get_surface", libs);
  gidLink(cast(void**)&gdk_cursor_ref, "gdk_cursor_ref", libs);
  gidLink(cast(void**)&gdk_cursor_unref, "gdk_cursor_unref", libs);

  // Device
  gidLink(cast(void**)&gdk_device_get_type, "gdk_device_get_type", libs);
  gidLink(cast(void**)&gdk_device_free_history, "gdk_device_free_history", libs);
  gidLink(cast(void**)&gdk_device_grab_info_libgtk_only, "gdk_device_grab_info_libgtk_only", libs);
  gidLink(cast(void**)&gdk_device_get_associated_device, "gdk_device_get_associated_device", libs);
  gidLink(cast(void**)&gdk_device_get_axes, "gdk_device_get_axes", libs);
  gidLink(cast(void**)&gdk_device_get_axis, "gdk_device_get_axis", libs);
  gidLink(cast(void**)&gdk_device_get_axis_use, "gdk_device_get_axis_use", libs);
  gidLink(cast(void**)&gdk_device_get_axis_value, "gdk_device_get_axis_value", libs);
  gidLink(cast(void**)&gdk_device_get_device_type, "gdk_device_get_device_type", libs);
  gidLink(cast(void**)&gdk_device_get_display, "gdk_device_get_display", libs);
  gidLink(cast(void**)&gdk_device_get_has_cursor, "gdk_device_get_has_cursor", libs);
  gidLink(cast(void**)&gdk_device_get_history, "gdk_device_get_history", libs);
  gidLink(cast(void**)&gdk_device_get_key, "gdk_device_get_key", libs);
  gidLink(cast(void**)&gdk_device_get_last_event_window, "gdk_device_get_last_event_window", libs);
  gidLink(cast(void**)&gdk_device_get_mode, "gdk_device_get_mode", libs);
  gidLink(cast(void**)&gdk_device_get_n_axes, "gdk_device_get_n_axes", libs);
  gidLink(cast(void**)&gdk_device_get_n_keys, "gdk_device_get_n_keys", libs);
  gidLink(cast(void**)&gdk_device_get_name, "gdk_device_get_name", libs);
  gidLink(cast(void**)&gdk_device_get_position, "gdk_device_get_position", libs);
  gidLink(cast(void**)&gdk_device_get_position_double, "gdk_device_get_position_double", libs);
  gidLink(cast(void**)&gdk_device_get_product_id, "gdk_device_get_product_id", libs);
  gidLink(cast(void**)&gdk_device_get_seat, "gdk_device_get_seat", libs);
  gidLink(cast(void**)&gdk_device_get_source, "gdk_device_get_source", libs);
  gidLink(cast(void**)&gdk_device_get_state, "gdk_device_get_state", libs);
  gidLink(cast(void**)&gdk_device_get_vendor_id, "gdk_device_get_vendor_id", libs);
  gidLink(cast(void**)&gdk_device_get_window_at_position, "gdk_device_get_window_at_position", libs);
  gidLink(cast(void**)&gdk_device_get_window_at_position_double, "gdk_device_get_window_at_position_double", libs);
  gidLink(cast(void**)&gdk_device_grab, "gdk_device_grab", libs);
  gidLink(cast(void**)&gdk_device_list_axes, "gdk_device_list_axes", libs);
  gidLink(cast(void**)&gdk_device_list_slave_devices, "gdk_device_list_slave_devices", libs);
  gidLink(cast(void**)&gdk_device_set_axis_use, "gdk_device_set_axis_use", libs);
  gidLink(cast(void**)&gdk_device_set_key, "gdk_device_set_key", libs);
  gidLink(cast(void**)&gdk_device_set_mode, "gdk_device_set_mode", libs);
  gidLink(cast(void**)&gdk_device_ungrab, "gdk_device_ungrab", libs);
  gidLink(cast(void**)&gdk_device_warp, "gdk_device_warp", libs);

  // DeviceManager
  gidLink(cast(void**)&gdk_device_manager_get_type, "gdk_device_manager_get_type", libs);
  gidLink(cast(void**)&gdk_device_manager_get_client_pointer, "gdk_device_manager_get_client_pointer", libs);
  gidLink(cast(void**)&gdk_device_manager_get_display, "gdk_device_manager_get_display", libs);
  gidLink(cast(void**)&gdk_device_manager_list_devices, "gdk_device_manager_list_devices", libs);

  // DevicePad
  gidLink(cast(void**)&gdk_device_pad_get_type, "gdk_device_pad_get_type", libs);
  gidLink(cast(void**)&gdk_device_pad_get_feature_group, "gdk_device_pad_get_feature_group", libs);
  gidLink(cast(void**)&gdk_device_pad_get_group_n_modes, "gdk_device_pad_get_group_n_modes", libs);
  gidLink(cast(void**)&gdk_device_pad_get_n_features, "gdk_device_pad_get_n_features", libs);
  gidLink(cast(void**)&gdk_device_pad_get_n_groups, "gdk_device_pad_get_n_groups", libs);

  // DeviceTool
  gidLink(cast(void**)&gdk_device_tool_get_type, "gdk_device_tool_get_type", libs);
  gidLink(cast(void**)&gdk_device_tool_get_hardware_id, "gdk_device_tool_get_hardware_id", libs);
  gidLink(cast(void**)&gdk_device_tool_get_serial, "gdk_device_tool_get_serial", libs);
  gidLink(cast(void**)&gdk_device_tool_get_tool_type, "gdk_device_tool_get_tool_type", libs);

  // Display
  gidLink(cast(void**)&gdk_display_get_type, "gdk_display_get_type", libs);
  gidLink(cast(void**)&gdk_display_get_default, "gdk_display_get_default", libs);
  gidLink(cast(void**)&gdk_display_open, "gdk_display_open", libs);
  gidLink(cast(void**)&gdk_display_open_default_libgtk_only, "gdk_display_open_default_libgtk_only", libs);
  gidLink(cast(void**)&gdk_display_beep, "gdk_display_beep", libs);
  gidLink(cast(void**)&gdk_display_close, "gdk_display_close", libs);
  gidLink(cast(void**)&gdk_display_device_is_grabbed, "gdk_display_device_is_grabbed", libs);
  gidLink(cast(void**)&gdk_display_flush, "gdk_display_flush", libs);
  gidLink(cast(void**)&gdk_display_get_app_launch_context, "gdk_display_get_app_launch_context", libs);
  gidLink(cast(void**)&gdk_display_get_default_cursor_size, "gdk_display_get_default_cursor_size", libs);
  gidLink(cast(void**)&gdk_display_get_default_group, "gdk_display_get_default_group", libs);
  gidLink(cast(void**)&gdk_display_get_default_screen, "gdk_display_get_default_screen", libs);
  gidLink(cast(void**)&gdk_display_get_default_seat, "gdk_display_get_default_seat", libs);
  gidLink(cast(void**)&gdk_display_get_device_manager, "gdk_display_get_device_manager", libs);
  gidLink(cast(void**)&gdk_display_get_event, "gdk_display_get_event", libs);
  gidLink(cast(void**)&gdk_display_get_maximal_cursor_size, "gdk_display_get_maximal_cursor_size", libs);
  gidLink(cast(void**)&gdk_display_get_monitor, "gdk_display_get_monitor", libs);
  gidLink(cast(void**)&gdk_display_get_monitor_at_point, "gdk_display_get_monitor_at_point", libs);
  gidLink(cast(void**)&gdk_display_get_monitor_at_window, "gdk_display_get_monitor_at_window", libs);
  gidLink(cast(void**)&gdk_display_get_n_monitors, "gdk_display_get_n_monitors", libs);
  gidLink(cast(void**)&gdk_display_get_n_screens, "gdk_display_get_n_screens", libs);
  gidLink(cast(void**)&gdk_display_get_name, "gdk_display_get_name", libs);
  gidLink(cast(void**)&gdk_display_get_pointer, "gdk_display_get_pointer", libs);
  gidLink(cast(void**)&gdk_display_get_primary_monitor, "gdk_display_get_primary_monitor", libs);
  gidLink(cast(void**)&gdk_display_get_screen, "gdk_display_get_screen", libs);
  gidLink(cast(void**)&gdk_display_get_window_at_pointer, "gdk_display_get_window_at_pointer", libs);
  gidLink(cast(void**)&gdk_display_has_pending, "gdk_display_has_pending", libs);
  gidLink(cast(void**)&gdk_display_is_closed, "gdk_display_is_closed", libs);
  gidLink(cast(void**)&gdk_display_keyboard_ungrab, "gdk_display_keyboard_ungrab", libs);
  gidLink(cast(void**)&gdk_display_list_devices, "gdk_display_list_devices", libs);
  gidLink(cast(void**)&gdk_display_list_seats, "gdk_display_list_seats", libs);
  gidLink(cast(void**)&gdk_display_notify_startup_complete, "gdk_display_notify_startup_complete", libs);
  gidLink(cast(void**)&gdk_display_peek_event, "gdk_display_peek_event", libs);
  gidLink(cast(void**)&gdk_display_pointer_is_grabbed, "gdk_display_pointer_is_grabbed", libs);
  gidLink(cast(void**)&gdk_display_pointer_ungrab, "gdk_display_pointer_ungrab", libs);
  gidLink(cast(void**)&gdk_display_put_event, "gdk_display_put_event", libs);
  gidLink(cast(void**)&gdk_display_request_selection_notification, "gdk_display_request_selection_notification", libs);
  gidLink(cast(void**)&gdk_display_set_double_click_distance, "gdk_display_set_double_click_distance", libs);
  gidLink(cast(void**)&gdk_display_set_double_click_time, "gdk_display_set_double_click_time", libs);
  gidLink(cast(void**)&gdk_display_store_clipboard, "gdk_display_store_clipboard", libs);
  gidLink(cast(void**)&gdk_display_supports_clipboard_persistence, "gdk_display_supports_clipboard_persistence", libs);
  gidLink(cast(void**)&gdk_display_supports_composite, "gdk_display_supports_composite", libs);
  gidLink(cast(void**)&gdk_display_supports_cursor_alpha, "gdk_display_supports_cursor_alpha", libs);
  gidLink(cast(void**)&gdk_display_supports_cursor_color, "gdk_display_supports_cursor_color", libs);
  gidLink(cast(void**)&gdk_display_supports_input_shapes, "gdk_display_supports_input_shapes", libs);
  gidLink(cast(void**)&gdk_display_supports_selection_notification, "gdk_display_supports_selection_notification", libs);
  gidLink(cast(void**)&gdk_display_supports_shapes, "gdk_display_supports_shapes", libs);
  gidLink(cast(void**)&gdk_display_sync, "gdk_display_sync", libs);
  gidLink(cast(void**)&gdk_display_warp_pointer, "gdk_display_warp_pointer", libs);

  // DisplayManager
  gidLink(cast(void**)&gdk_display_manager_get_type, "gdk_display_manager_get_type", libs);
  gidLink(cast(void**)&gdk_display_manager_get, "gdk_display_manager_get", libs);
  gidLink(cast(void**)&gdk_display_manager_get_default_display, "gdk_display_manager_get_default_display", libs);
  gidLink(cast(void**)&gdk_display_manager_list_displays, "gdk_display_manager_list_displays", libs);
  gidLink(cast(void**)&gdk_display_manager_open_display, "gdk_display_manager_open_display", libs);
  gidLink(cast(void**)&gdk_display_manager_set_default_display, "gdk_display_manager_set_default_display", libs);

  // DragContext
  gidLink(cast(void**)&gdk_drag_context_get_type, "gdk_drag_context_get_type", libs);
  gidLink(cast(void**)&gdk_drag_context_get_actions, "gdk_drag_context_get_actions", libs);
  gidLink(cast(void**)&gdk_drag_context_get_dest_window, "gdk_drag_context_get_dest_window", libs);
  gidLink(cast(void**)&gdk_drag_context_get_device, "gdk_drag_context_get_device", libs);
  gidLink(cast(void**)&gdk_drag_context_get_drag_window, "gdk_drag_context_get_drag_window", libs);
  gidLink(cast(void**)&gdk_drag_context_get_protocol, "gdk_drag_context_get_protocol", libs);
  gidLink(cast(void**)&gdk_drag_context_get_selected_action, "gdk_drag_context_get_selected_action", libs);
  gidLink(cast(void**)&gdk_drag_context_get_source_window, "gdk_drag_context_get_source_window", libs);
  gidLink(cast(void**)&gdk_drag_context_get_suggested_action, "gdk_drag_context_get_suggested_action", libs);
  gidLink(cast(void**)&gdk_drag_context_list_targets, "gdk_drag_context_list_targets", libs);
  gidLink(cast(void**)&gdk_drag_context_manage_dnd, "gdk_drag_context_manage_dnd", libs);
  gidLink(cast(void**)&gdk_drag_context_set_device, "gdk_drag_context_set_device", libs);
  gidLink(cast(void**)&gdk_drag_context_set_hotspot, "gdk_drag_context_set_hotspot", libs);

  // DrawingContext
  gidLink(cast(void**)&gdk_drawing_context_get_type, "gdk_drawing_context_get_type", libs);
  gidLink(cast(void**)&gdk_drawing_context_get_cairo_context, "gdk_drawing_context_get_cairo_context", libs);
  gidLink(cast(void**)&gdk_drawing_context_get_clip, "gdk_drawing_context_get_clip", libs);
  gidLink(cast(void**)&gdk_drawing_context_get_window, "gdk_drawing_context_get_window", libs);
  gidLink(cast(void**)&gdk_drawing_context_is_valid, "gdk_drawing_context_is_valid", libs);

  // Event
  gidLink(cast(void**)&gdk_event_get_type, "gdk_event_get_type", libs);
  gidLink(cast(void**)&gdk_event_new, "gdk_event_new", libs);
  gidLink(cast(void**)&gdk_event_copy, "gdk_event_copy", libs);
  gidLink(cast(void**)&gdk_event_free, "gdk_event_free", libs);
  gidLink(cast(void**)&gdk_event_get_axis, "gdk_event_get_axis", libs);
  gidLink(cast(void**)&gdk_event_get_button, "gdk_event_get_button", libs);
  gidLink(cast(void**)&gdk_event_get_click_count, "gdk_event_get_click_count", libs);
  gidLink(cast(void**)&gdk_event_get_coords, "gdk_event_get_coords", libs);
  gidLink(cast(void**)&gdk_event_get_device, "gdk_event_get_device", libs);
  gidLink(cast(void**)&gdk_event_get_device_tool, "gdk_event_get_device_tool", libs);
  gidLink(cast(void**)&gdk_event_get_event_sequence, "gdk_event_get_event_sequence", libs);
  gidLink(cast(void**)&gdk_event_get_event_type, "gdk_event_get_event_type", libs);
  gidLink(cast(void**)&gdk_event_get_keycode, "gdk_event_get_keycode", libs);
  gidLink(cast(void**)&gdk_event_get_keyval, "gdk_event_get_keyval", libs);
  gidLink(cast(void**)&gdk_event_get_pointer_emulated, "gdk_event_get_pointer_emulated", libs);
  gidLink(cast(void**)&gdk_event_get_root_coords, "gdk_event_get_root_coords", libs);
  gidLink(cast(void**)&gdk_event_get_scancode, "gdk_event_get_scancode", libs);
  gidLink(cast(void**)&gdk_event_get_screen, "gdk_event_get_screen", libs);
  gidLink(cast(void**)&gdk_event_get_scroll_deltas, "gdk_event_get_scroll_deltas", libs);
  gidLink(cast(void**)&gdk_event_get_scroll_direction, "gdk_event_get_scroll_direction", libs);
  gidLink(cast(void**)&gdk_event_get_seat, "gdk_event_get_seat", libs);
  gidLink(cast(void**)&gdk_event_get_source_device, "gdk_event_get_source_device", libs);
  gidLink(cast(void**)&gdk_event_get_state, "gdk_event_get_state", libs);
  gidLink(cast(void**)&gdk_event_get_time, "gdk_event_get_time", libs);
  gidLink(cast(void**)&gdk_event_get_window, "gdk_event_get_window", libs);
  gidLink(cast(void**)&gdk_event_is_scroll_stop_event, "gdk_event_is_scroll_stop_event", libs);
  gidLink(cast(void**)&gdk_event_put, "gdk_event_put", libs);
  gidLink(cast(void**)&gdk_event_set_device, "gdk_event_set_device", libs);
  gidLink(cast(void**)&gdk_event_set_device_tool, "gdk_event_set_device_tool", libs);
  gidLink(cast(void**)&gdk_event_set_screen, "gdk_event_set_screen", libs);
  gidLink(cast(void**)&gdk_event_set_source_device, "gdk_event_set_source_device", libs);
  gidLink(cast(void**)&gdk_event_triggers_context_menu, "gdk_event_triggers_context_menu", libs);
  gidLink(cast(void**)&gdk_event_get, "gdk_event_get", libs);
  gidLink(cast(void**)&gdk_event_handler_set, "gdk_event_handler_set", libs);
  gidLink(cast(void**)&gdk_event_peek, "gdk_event_peek", libs);
  gidLink(cast(void**)&gdk_event_request_motions, "gdk_event_request_motions", libs);

  // EventSequence
  gidLink(cast(void**)&gdk_event_sequence_get_type, "gdk_event_sequence_get_type", libs);

  // FrameClock
  gidLink(cast(void**)&gdk_frame_clock_get_type, "gdk_frame_clock_get_type", libs);
  gidLink(cast(void**)&gdk_frame_clock_begin_updating, "gdk_frame_clock_begin_updating", libs);
  gidLink(cast(void**)&gdk_frame_clock_end_updating, "gdk_frame_clock_end_updating", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_current_timings, "gdk_frame_clock_get_current_timings", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_frame_counter, "gdk_frame_clock_get_frame_counter", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_frame_time, "gdk_frame_clock_get_frame_time", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_history_start, "gdk_frame_clock_get_history_start", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_refresh_info, "gdk_frame_clock_get_refresh_info", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_timings, "gdk_frame_clock_get_timings", libs);
  gidLink(cast(void**)&gdk_frame_clock_request_phase, "gdk_frame_clock_request_phase", libs);

  // FrameTimings
  gidLink(cast(void**)&gdk_frame_timings_get_type, "gdk_frame_timings_get_type", libs);
  gidLink(cast(void**)&gdk_frame_timings_get_complete, "gdk_frame_timings_get_complete", libs);
  gidLink(cast(void**)&gdk_frame_timings_get_frame_counter, "gdk_frame_timings_get_frame_counter", libs);
  gidLink(cast(void**)&gdk_frame_timings_get_frame_time, "gdk_frame_timings_get_frame_time", libs);
  gidLink(cast(void**)&gdk_frame_timings_get_predicted_presentation_time, "gdk_frame_timings_get_predicted_presentation_time", libs);
  gidLink(cast(void**)&gdk_frame_timings_get_presentation_time, "gdk_frame_timings_get_presentation_time", libs);
  gidLink(cast(void**)&gdk_frame_timings_get_refresh_interval, "gdk_frame_timings_get_refresh_interval", libs);
  gidLink(cast(void**)&gdk_frame_timings_ref, "gdk_frame_timings_ref", libs);
  gidLink(cast(void**)&gdk_frame_timings_unref, "gdk_frame_timings_unref", libs);

  // GLContext
  gidLink(cast(void**)&gdk_gl_context_get_type, "gdk_gl_context_get_type", libs);
  gidLink(cast(void**)&gdk_gl_context_clear_current, "gdk_gl_context_clear_current", libs);
  gidLink(cast(void**)&gdk_gl_context_get_current, "gdk_gl_context_get_current", libs);
  gidLink(cast(void**)&gdk_gl_context_get_debug_enabled, "gdk_gl_context_get_debug_enabled", libs);
  gidLink(cast(void**)&gdk_gl_context_get_display, "gdk_gl_context_get_display", libs);
  gidLink(cast(void**)&gdk_gl_context_get_forward_compatible, "gdk_gl_context_get_forward_compatible", libs);
  gidLink(cast(void**)&gdk_gl_context_get_required_version, "gdk_gl_context_get_required_version", libs);
  gidLink(cast(void**)&gdk_gl_context_get_shared_context, "gdk_gl_context_get_shared_context", libs);
  gidLink(cast(void**)&gdk_gl_context_get_use_es, "gdk_gl_context_get_use_es", libs);
  gidLink(cast(void**)&gdk_gl_context_get_version, "gdk_gl_context_get_version", libs);
  gidLink(cast(void**)&gdk_gl_context_get_window, "gdk_gl_context_get_window", libs);
  gidLink(cast(void**)&gdk_gl_context_is_legacy, "gdk_gl_context_is_legacy", libs);
  gidLink(cast(void**)&gdk_gl_context_make_current, "gdk_gl_context_make_current", libs);
  gidLink(cast(void**)&gdk_gl_context_realize, "gdk_gl_context_realize", libs);
  gidLink(cast(void**)&gdk_gl_context_set_debug_enabled, "gdk_gl_context_set_debug_enabled", libs);
  gidLink(cast(void**)&gdk_gl_context_set_forward_compatible, "gdk_gl_context_set_forward_compatible", libs);
  gidLink(cast(void**)&gdk_gl_context_set_required_version, "gdk_gl_context_set_required_version", libs);
  gidLink(cast(void**)&gdk_gl_context_set_use_es, "gdk_gl_context_set_use_es", libs);

  // Keymap
  gidLink(cast(void**)&gdk_keymap_get_type, "gdk_keymap_get_type", libs);
  gidLink(cast(void**)&gdk_keymap_get_default, "gdk_keymap_get_default", libs);
  gidLink(cast(void**)&gdk_keymap_get_for_display, "gdk_keymap_get_for_display", libs);
  gidLink(cast(void**)&gdk_keymap_add_virtual_modifiers, "gdk_keymap_add_virtual_modifiers", libs);
  gidLink(cast(void**)&gdk_keymap_get_caps_lock_state, "gdk_keymap_get_caps_lock_state", libs);
  gidLink(cast(void**)&gdk_keymap_get_direction, "gdk_keymap_get_direction", libs);
  gidLink(cast(void**)&gdk_keymap_get_entries_for_keycode, "gdk_keymap_get_entries_for_keycode", libs);
  gidLink(cast(void**)&gdk_keymap_get_entries_for_keyval, "gdk_keymap_get_entries_for_keyval", libs);
  gidLink(cast(void**)&gdk_keymap_get_modifier_mask, "gdk_keymap_get_modifier_mask", libs);
  gidLink(cast(void**)&gdk_keymap_get_modifier_state, "gdk_keymap_get_modifier_state", libs);
  gidLink(cast(void**)&gdk_keymap_get_num_lock_state, "gdk_keymap_get_num_lock_state", libs);
  gidLink(cast(void**)&gdk_keymap_get_scroll_lock_state, "gdk_keymap_get_scroll_lock_state", libs);
  gidLink(cast(void**)&gdk_keymap_have_bidi_layouts, "gdk_keymap_have_bidi_layouts", libs);
  gidLink(cast(void**)&gdk_keymap_lookup_key, "gdk_keymap_lookup_key", libs);
  gidLink(cast(void**)&gdk_keymap_map_virtual_modifiers, "gdk_keymap_map_virtual_modifiers", libs);
  gidLink(cast(void**)&gdk_keymap_translate_keyboard_state, "gdk_keymap_translate_keyboard_state", libs);

  // MonitorWrap
  gidLink(cast(void**)&gdk_monitor_get_type, "gdk_monitor_get_type", libs);
  gidLink(cast(void**)&gdk_monitor_get_display, "gdk_monitor_get_display", libs);
  gidLink(cast(void**)&gdk_monitor_get_geometry, "gdk_monitor_get_geometry", libs);
  gidLink(cast(void**)&gdk_monitor_get_height_mm, "gdk_monitor_get_height_mm", libs);
  gidLink(cast(void**)&gdk_monitor_get_manufacturer, "gdk_monitor_get_manufacturer", libs);
  gidLink(cast(void**)&gdk_monitor_get_model, "gdk_monitor_get_model", libs);
  gidLink(cast(void**)&gdk_monitor_get_refresh_rate, "gdk_monitor_get_refresh_rate", libs);
  gidLink(cast(void**)&gdk_monitor_get_scale_factor, "gdk_monitor_get_scale_factor", libs);
  gidLink(cast(void**)&gdk_monitor_get_subpixel_layout, "gdk_monitor_get_subpixel_layout", libs);
  gidLink(cast(void**)&gdk_monitor_get_width_mm, "gdk_monitor_get_width_mm", libs);
  gidLink(cast(void**)&gdk_monitor_get_workarea, "gdk_monitor_get_workarea", libs);
  gidLink(cast(void**)&gdk_monitor_is_primary, "gdk_monitor_is_primary", libs);

  // RGBA
  gidLink(cast(void**)&gdk_rgba_get_type, "gdk_rgba_get_type", libs);
  gidLink(cast(void**)&gdk_rgba_copy, "gdk_rgba_copy", libs);
  gidLink(cast(void**)&gdk_rgba_equal, "gdk_rgba_equal", libs);
  gidLink(cast(void**)&gdk_rgba_free, "gdk_rgba_free", libs);
  gidLink(cast(void**)&gdk_rgba_hash, "gdk_rgba_hash", libs);
  gidLink(cast(void**)&gdk_rgba_parse, "gdk_rgba_parse", libs);
  gidLink(cast(void**)&gdk_rgba_to_string, "gdk_rgba_to_string", libs);

  // Rectangle
  gidLink(cast(void**)&gdk_rectangle_get_type, "gdk_rectangle_get_type", libs);
  gidLink(cast(void**)&gdk_rectangle_equal, "gdk_rectangle_equal", libs);
  gidLink(cast(void**)&gdk_rectangle_intersect, "gdk_rectangle_intersect", libs);
  gidLink(cast(void**)&gdk_rectangle_union, "gdk_rectangle_union", libs);

  // Screen
  gidLink(cast(void**)&gdk_screen_get_type, "gdk_screen_get_type", libs);
  gidLink(cast(void**)&gdk_screen_get_default, "gdk_screen_get_default", libs);
  gidLink(cast(void**)&gdk_screen_height, "gdk_screen_height", libs);
  gidLink(cast(void**)&gdk_screen_height_mm, "gdk_screen_height_mm", libs);
  gidLink(cast(void**)&gdk_screen_width, "gdk_screen_width", libs);
  gidLink(cast(void**)&gdk_screen_width_mm, "gdk_screen_width_mm", libs);
  gidLink(cast(void**)&gdk_screen_get_active_window, "gdk_screen_get_active_window", libs);
  gidLink(cast(void**)&gdk_screen_get_display, "gdk_screen_get_display", libs);
  gidLink(cast(void**)&gdk_screen_get_font_options, "gdk_screen_get_font_options", libs);
  gidLink(cast(void**)&gdk_screen_get_height, "gdk_screen_get_height", libs);
  gidLink(cast(void**)&gdk_screen_get_height_mm, "gdk_screen_get_height_mm", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_at_point, "gdk_screen_get_monitor_at_point", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_at_window, "gdk_screen_get_monitor_at_window", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_geometry, "gdk_screen_get_monitor_geometry", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_height_mm, "gdk_screen_get_monitor_height_mm", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_plug_name, "gdk_screen_get_monitor_plug_name", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_scale_factor, "gdk_screen_get_monitor_scale_factor", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_width_mm, "gdk_screen_get_monitor_width_mm", libs);
  gidLink(cast(void**)&gdk_screen_get_monitor_workarea, "gdk_screen_get_monitor_workarea", libs);
  gidLink(cast(void**)&gdk_screen_get_n_monitors, "gdk_screen_get_n_monitors", libs);
  gidLink(cast(void**)&gdk_screen_get_number, "gdk_screen_get_number", libs);
  gidLink(cast(void**)&gdk_screen_get_primary_monitor, "gdk_screen_get_primary_monitor", libs);
  gidLink(cast(void**)&gdk_screen_get_resolution, "gdk_screen_get_resolution", libs);
  gidLink(cast(void**)&gdk_screen_get_rgba_visual, "gdk_screen_get_rgba_visual", libs);
  gidLink(cast(void**)&gdk_screen_get_root_window, "gdk_screen_get_root_window", libs);
  gidLink(cast(void**)&gdk_screen_get_setting, "gdk_screen_get_setting", libs);
  gidLink(cast(void**)&gdk_screen_get_system_visual, "gdk_screen_get_system_visual", libs);
  gidLink(cast(void**)&gdk_screen_get_toplevel_windows, "gdk_screen_get_toplevel_windows", libs);
  gidLink(cast(void**)&gdk_screen_get_width, "gdk_screen_get_width", libs);
  gidLink(cast(void**)&gdk_screen_get_width_mm, "gdk_screen_get_width_mm", libs);
  gidLink(cast(void**)&gdk_screen_get_window_stack, "gdk_screen_get_window_stack", libs);
  gidLink(cast(void**)&gdk_screen_is_composited, "gdk_screen_is_composited", libs);
  gidLink(cast(void**)&gdk_screen_list_visuals, "gdk_screen_list_visuals", libs);
  gidLink(cast(void**)&gdk_screen_make_display_name, "gdk_screen_make_display_name", libs);
  gidLink(cast(void**)&gdk_screen_set_font_options, "gdk_screen_set_font_options", libs);
  gidLink(cast(void**)&gdk_screen_set_resolution, "gdk_screen_set_resolution", libs);

  // Seat
  gidLink(cast(void**)&gdk_seat_get_type, "gdk_seat_get_type", libs);
  gidLink(cast(void**)&gdk_seat_get_capabilities, "gdk_seat_get_capabilities", libs);
  gidLink(cast(void**)&gdk_seat_get_display, "gdk_seat_get_display", libs);
  gidLink(cast(void**)&gdk_seat_get_keyboard, "gdk_seat_get_keyboard", libs);
  gidLink(cast(void**)&gdk_seat_get_pointer, "gdk_seat_get_pointer", libs);
  gidLink(cast(void**)&gdk_seat_get_slaves, "gdk_seat_get_slaves", libs);
  gidLink(cast(void**)&gdk_seat_grab, "gdk_seat_grab", libs);
  gidLink(cast(void**)&gdk_seat_ungrab, "gdk_seat_ungrab", libs);

  // Visual
  gidLink(cast(void**)&gdk_visual_get_type, "gdk_visual_get_type", libs);
  gidLink(cast(void**)&gdk_visual_get_best, "gdk_visual_get_best", libs);
  gidLink(cast(void**)&gdk_visual_get_best_depth, "gdk_visual_get_best_depth", libs);
  gidLink(cast(void**)&gdk_visual_get_best_type, "gdk_visual_get_best_type", libs);
  gidLink(cast(void**)&gdk_visual_get_best_with_both, "gdk_visual_get_best_with_both", libs);
  gidLink(cast(void**)&gdk_visual_get_best_with_depth, "gdk_visual_get_best_with_depth", libs);
  gidLink(cast(void**)&gdk_visual_get_best_with_type, "gdk_visual_get_best_with_type", libs);
  gidLink(cast(void**)&gdk_visual_get_system, "gdk_visual_get_system", libs);
  gidLink(cast(void**)&gdk_visual_get_bits_per_rgb, "gdk_visual_get_bits_per_rgb", libs);
  gidLink(cast(void**)&gdk_visual_get_blue_pixel_details, "gdk_visual_get_blue_pixel_details", libs);
  gidLink(cast(void**)&gdk_visual_get_byte_order, "gdk_visual_get_byte_order", libs);
  gidLink(cast(void**)&gdk_visual_get_colormap_size, "gdk_visual_get_colormap_size", libs);
  gidLink(cast(void**)&gdk_visual_get_depth, "gdk_visual_get_depth", libs);
  gidLink(cast(void**)&gdk_visual_get_green_pixel_details, "gdk_visual_get_green_pixel_details", libs);
  gidLink(cast(void**)&gdk_visual_get_red_pixel_details, "gdk_visual_get_red_pixel_details", libs);
  gidLink(cast(void**)&gdk_visual_get_screen, "gdk_visual_get_screen", libs);
  gidLink(cast(void**)&gdk_visual_get_visual_type, "gdk_visual_get_visual_type", libs);

  // Window
  gidLink(cast(void**)&gdk_window_get_type, "gdk_window_get_type", libs);
  gidLink(cast(void**)&gdk_window_new, "gdk_window_new", libs);
  gidLink(cast(void**)&gdk_window_at_pointer, "gdk_window_at_pointer", libs);
  gidLink(cast(void**)&gdk_window_constrain_size, "gdk_window_constrain_size", libs);
  gidLink(cast(void**)&gdk_window_process_all_updates, "gdk_window_process_all_updates", libs);
  gidLink(cast(void**)&gdk_window_set_debug_updates, "gdk_window_set_debug_updates", libs);
  gidLink(cast(void**)&gdk_window_add_filter, "gdk_window_add_filter", libs);
  gidLink(cast(void**)&gdk_window_beep, "gdk_window_beep", libs);
  gidLink(cast(void**)&gdk_window_begin_draw_frame, "gdk_window_begin_draw_frame", libs);
  gidLink(cast(void**)&gdk_window_begin_move_drag, "gdk_window_begin_move_drag", libs);
  gidLink(cast(void**)&gdk_window_begin_move_drag_for_device, "gdk_window_begin_move_drag_for_device", libs);
  gidLink(cast(void**)&gdk_window_begin_paint_rect, "gdk_window_begin_paint_rect", libs);
  gidLink(cast(void**)&gdk_window_begin_paint_region, "gdk_window_begin_paint_region", libs);
  gidLink(cast(void**)&gdk_window_begin_resize_drag, "gdk_window_begin_resize_drag", libs);
  gidLink(cast(void**)&gdk_window_begin_resize_drag_for_device, "gdk_window_begin_resize_drag_for_device", libs);
  gidLink(cast(void**)&gdk_window_configure_finished, "gdk_window_configure_finished", libs);
  gidLink(cast(void**)&gdk_window_coords_from_parent, "gdk_window_coords_from_parent", libs);
  gidLink(cast(void**)&gdk_window_coords_to_parent, "gdk_window_coords_to_parent", libs);
  gidLink(cast(void**)&gdk_window_create_gl_context, "gdk_window_create_gl_context", libs);
  gidLink(cast(void**)&gdk_window_create_similar_image_surface, "gdk_window_create_similar_image_surface", libs);
  gidLink(cast(void**)&gdk_window_create_similar_surface, "gdk_window_create_similar_surface", libs);
  gidLink(cast(void**)&gdk_window_deiconify, "gdk_window_deiconify", libs);
  gidLink(cast(void**)&gdk_window_destroy, "gdk_window_destroy", libs);
  gidLink(cast(void**)&gdk_window_destroy_notify, "gdk_window_destroy_notify", libs);
  gidLink(cast(void**)&gdk_window_enable_synchronized_configure, "gdk_window_enable_synchronized_configure", libs);
  gidLink(cast(void**)&gdk_window_end_draw_frame, "gdk_window_end_draw_frame", libs);
  gidLink(cast(void**)&gdk_window_end_paint, "gdk_window_end_paint", libs);
  gidLink(cast(void**)&gdk_window_ensure_native, "gdk_window_ensure_native", libs);
  gidLink(cast(void**)&gdk_window_flush, "gdk_window_flush", libs);
  gidLink(cast(void**)&gdk_window_focus, "gdk_window_focus", libs);
  gidLink(cast(void**)&gdk_window_freeze_toplevel_updates_libgtk_only, "gdk_window_freeze_toplevel_updates_libgtk_only", libs);
  gidLink(cast(void**)&gdk_window_freeze_updates, "gdk_window_freeze_updates", libs);
  gidLink(cast(void**)&gdk_window_fullscreen, "gdk_window_fullscreen", libs);
  gidLink(cast(void**)&gdk_window_fullscreen_on_monitor, "gdk_window_fullscreen_on_monitor", libs);
  gidLink(cast(void**)&gdk_window_geometry_changed, "gdk_window_geometry_changed", libs);
  gidLink(cast(void**)&gdk_window_get_accept_focus, "gdk_window_get_accept_focus", libs);
  gidLink(cast(void**)&gdk_window_get_background_pattern, "gdk_window_get_background_pattern", libs);
  gidLink(cast(void**)&gdk_window_get_children, "gdk_window_get_children", libs);
  gidLink(cast(void**)&gdk_window_get_children_with_user_data, "gdk_window_get_children_with_user_data", libs);
  gidLink(cast(void**)&gdk_window_get_clip_region, "gdk_window_get_clip_region", libs);
  gidLink(cast(void**)&gdk_window_get_composited, "gdk_window_get_composited", libs);
  gidLink(cast(void**)&gdk_window_get_cursor, "gdk_window_get_cursor", libs);
  gidLink(cast(void**)&gdk_window_get_decorations, "gdk_window_get_decorations", libs);
  gidLink(cast(void**)&gdk_window_get_device_cursor, "gdk_window_get_device_cursor", libs);
  gidLink(cast(void**)&gdk_window_get_device_events, "gdk_window_get_device_events", libs);
  gidLink(cast(void**)&gdk_window_get_device_position, "gdk_window_get_device_position", libs);
  gidLink(cast(void**)&gdk_window_get_device_position_double, "gdk_window_get_device_position_double", libs);
  gidLink(cast(void**)&gdk_window_get_display, "gdk_window_get_display", libs);
  gidLink(cast(void**)&gdk_window_get_drag_protocol, "gdk_window_get_drag_protocol", libs);
  gidLink(cast(void**)&gdk_window_get_effective_parent, "gdk_window_get_effective_parent", libs);
  gidLink(cast(void**)&gdk_window_get_effective_toplevel, "gdk_window_get_effective_toplevel", libs);
  gidLink(cast(void**)&gdk_window_get_event_compression, "gdk_window_get_event_compression", libs);
  gidLink(cast(void**)&gdk_window_get_events, "gdk_window_get_events", libs);
  gidLink(cast(void**)&gdk_window_get_focus_on_map, "gdk_window_get_focus_on_map", libs);
  gidLink(cast(void**)&gdk_window_get_frame_clock, "gdk_window_get_frame_clock", libs);
  gidLink(cast(void**)&gdk_window_get_frame_extents, "gdk_window_get_frame_extents", libs);
  gidLink(cast(void**)&gdk_window_get_fullscreen_mode, "gdk_window_get_fullscreen_mode", libs);
  gidLink(cast(void**)&gdk_window_get_geometry, "gdk_window_get_geometry", libs);
  gidLink(cast(void**)&gdk_window_get_group, "gdk_window_get_group", libs);
  gidLink(cast(void**)&gdk_window_get_height, "gdk_window_get_height", libs);
  gidLink(cast(void**)&gdk_window_get_modal_hint, "gdk_window_get_modal_hint", libs);
  gidLink(cast(void**)&gdk_window_get_origin, "gdk_window_get_origin", libs);
  gidLink(cast(void**)&gdk_window_get_parent, "gdk_window_get_parent", libs);
  gidLink(cast(void**)&gdk_window_get_pass_through, "gdk_window_get_pass_through", libs);
  gidLink(cast(void**)&gdk_window_get_pointer, "gdk_window_get_pointer", libs);
  gidLink(cast(void**)&gdk_window_get_position, "gdk_window_get_position", libs);
  gidLink(cast(void**)&gdk_window_get_root_coords, "gdk_window_get_root_coords", libs);
  gidLink(cast(void**)&gdk_window_get_root_origin, "gdk_window_get_root_origin", libs);
  gidLink(cast(void**)&gdk_window_get_scale_factor, "gdk_window_get_scale_factor", libs);
  gidLink(cast(void**)&gdk_window_get_screen, "gdk_window_get_screen", libs);
  gidLink(cast(void**)&gdk_window_get_source_events, "gdk_window_get_source_events", libs);
  gidLink(cast(void**)&gdk_window_get_state, "gdk_window_get_state", libs);
  gidLink(cast(void**)&gdk_window_get_support_multidevice, "gdk_window_get_support_multidevice", libs);
  gidLink(cast(void**)&gdk_window_get_toplevel, "gdk_window_get_toplevel", libs);
  gidLink(cast(void**)&gdk_window_get_type_hint, "gdk_window_get_type_hint", libs);
  gidLink(cast(void**)&gdk_window_get_update_area, "gdk_window_get_update_area", libs);
  gidLink(cast(void**)&gdk_window_get_user_data, "gdk_window_get_user_data", libs);
  gidLink(cast(void**)&gdk_window_get_visible_region, "gdk_window_get_visible_region", libs);
  gidLink(cast(void**)&gdk_window_get_visual, "gdk_window_get_visual", libs);
  gidLink(cast(void**)&gdk_window_get_width, "gdk_window_get_width", libs);
  gidLink(cast(void**)&gdk_window_get_window_type, "gdk_window_get_window_type", libs);
  gidLink(cast(void**)&gdk_window_has_native, "gdk_window_has_native", libs);
  gidLink(cast(void**)&gdk_window_hide, "gdk_window_hide", libs);
  gidLink(cast(void**)&gdk_window_iconify, "gdk_window_iconify", libs);
  gidLink(cast(void**)&gdk_window_input_shape_combine_region, "gdk_window_input_shape_combine_region", libs);
  gidLink(cast(void**)&gdk_window_invalidate_maybe_recurse, "gdk_window_invalidate_maybe_recurse", libs);
  gidLink(cast(void**)&gdk_window_invalidate_rect, "gdk_window_invalidate_rect", libs);
  gidLink(cast(void**)&gdk_window_invalidate_region, "gdk_window_invalidate_region", libs);
  gidLink(cast(void**)&gdk_window_is_destroyed, "gdk_window_is_destroyed", libs);
  gidLink(cast(void**)&gdk_window_is_input_only, "gdk_window_is_input_only", libs);
  gidLink(cast(void**)&gdk_window_is_shaped, "gdk_window_is_shaped", libs);
  gidLink(cast(void**)&gdk_window_is_viewable, "gdk_window_is_viewable", libs);
  gidLink(cast(void**)&gdk_window_is_visible, "gdk_window_is_visible", libs);
  gidLink(cast(void**)&gdk_window_lower, "gdk_window_lower", libs);
  gidLink(cast(void**)&gdk_window_mark_paint_from_clip, "gdk_window_mark_paint_from_clip", libs);
  gidLink(cast(void**)&gdk_window_maximize, "gdk_window_maximize", libs);
  gidLink(cast(void**)&gdk_window_merge_child_input_shapes, "gdk_window_merge_child_input_shapes", libs);
  gidLink(cast(void**)&gdk_window_merge_child_shapes, "gdk_window_merge_child_shapes", libs);
  gidLink(cast(void**)&gdk_window_move, "gdk_window_move", libs);
  gidLink(cast(void**)&gdk_window_move_region, "gdk_window_move_region", libs);
  gidLink(cast(void**)&gdk_window_move_resize, "gdk_window_move_resize", libs);
  gidLink(cast(void**)&gdk_window_move_to_rect, "gdk_window_move_to_rect", libs);
  gidLink(cast(void**)&gdk_window_peek_children, "gdk_window_peek_children", libs);
  gidLink(cast(void**)&gdk_window_process_updates, "gdk_window_process_updates", libs);
  gidLink(cast(void**)&gdk_window_raise, "gdk_window_raise", libs);
  gidLink(cast(void**)&gdk_window_register_dnd, "gdk_window_register_dnd", libs);
  gidLink(cast(void**)&gdk_window_remove_filter, "gdk_window_remove_filter", libs);
  gidLink(cast(void**)&gdk_window_reparent, "gdk_window_reparent", libs);
  gidLink(cast(void**)&gdk_window_resize, "gdk_window_resize", libs);
  gidLink(cast(void**)&gdk_window_restack, "gdk_window_restack", libs);
  gidLink(cast(void**)&gdk_window_scroll, "gdk_window_scroll", libs);
  gidLink(cast(void**)&gdk_window_set_accept_focus, "gdk_window_set_accept_focus", libs);
  gidLink(cast(void**)&gdk_window_set_background, "gdk_window_set_background", libs);
  gidLink(cast(void**)&gdk_window_set_background_pattern, "gdk_window_set_background_pattern", libs);
  gidLink(cast(void**)&gdk_window_set_background_rgba, "gdk_window_set_background_rgba", libs);
  gidLink(cast(void**)&gdk_window_set_child_input_shapes, "gdk_window_set_child_input_shapes", libs);
  gidLink(cast(void**)&gdk_window_set_child_shapes, "gdk_window_set_child_shapes", libs);
  gidLink(cast(void**)&gdk_window_set_composited, "gdk_window_set_composited", libs);
  gidLink(cast(void**)&gdk_window_set_cursor, "gdk_window_set_cursor", libs);
  gidLink(cast(void**)&gdk_window_set_decorations, "gdk_window_set_decorations", libs);
  gidLink(cast(void**)&gdk_window_set_device_cursor, "gdk_window_set_device_cursor", libs);
  gidLink(cast(void**)&gdk_window_set_device_events, "gdk_window_set_device_events", libs);
  gidLink(cast(void**)&gdk_window_set_event_compression, "gdk_window_set_event_compression", libs);
  gidLink(cast(void**)&gdk_window_set_events, "gdk_window_set_events", libs);
  gidLink(cast(void**)&gdk_window_set_focus_on_map, "gdk_window_set_focus_on_map", libs);
  gidLink(cast(void**)&gdk_window_set_fullscreen_mode, "gdk_window_set_fullscreen_mode", libs);
  gidLink(cast(void**)&gdk_window_set_functions, "gdk_window_set_functions", libs);
  gidLink(cast(void**)&gdk_window_set_geometry_hints, "gdk_window_set_geometry_hints", libs);
  gidLink(cast(void**)&gdk_window_set_group, "gdk_window_set_group", libs);
  gidLink(cast(void**)&gdk_window_set_icon_list, "gdk_window_set_icon_list", libs);
  gidLink(cast(void**)&gdk_window_set_icon_name, "gdk_window_set_icon_name", libs);
  gidLink(cast(void**)&gdk_window_set_invalidate_handler, "gdk_window_set_invalidate_handler", libs);
  gidLink(cast(void**)&gdk_window_set_keep_above, "gdk_window_set_keep_above", libs);
  gidLink(cast(void**)&gdk_window_set_keep_below, "gdk_window_set_keep_below", libs);
  gidLink(cast(void**)&gdk_window_set_modal_hint, "gdk_window_set_modal_hint", libs);
  gidLink(cast(void**)&gdk_window_set_opacity, "gdk_window_set_opacity", libs);
  gidLink(cast(void**)&gdk_window_set_opaque_region, "gdk_window_set_opaque_region", libs);
  gidLink(cast(void**)&gdk_window_set_override_redirect, "gdk_window_set_override_redirect", libs);
  gidLink(cast(void**)&gdk_window_set_pass_through, "gdk_window_set_pass_through", libs);
  gidLink(cast(void**)&gdk_window_set_role, "gdk_window_set_role", libs);
  gidLink(cast(void**)&gdk_window_set_shadow_width, "gdk_window_set_shadow_width", libs);
  gidLink(cast(void**)&gdk_window_set_skip_pager_hint, "gdk_window_set_skip_pager_hint", libs);
  gidLink(cast(void**)&gdk_window_set_skip_taskbar_hint, "gdk_window_set_skip_taskbar_hint", libs);
  gidLink(cast(void**)&gdk_window_set_source_events, "gdk_window_set_source_events", libs);
  gidLink(cast(void**)&gdk_window_set_startup_id, "gdk_window_set_startup_id", libs);
  gidLink(cast(void**)&gdk_window_set_static_gravities, "gdk_window_set_static_gravities", libs);
  gidLink(cast(void**)&gdk_window_set_support_multidevice, "gdk_window_set_support_multidevice", libs);
  gidLink(cast(void**)&gdk_window_set_title, "gdk_window_set_title", libs);
  gidLink(cast(void**)&gdk_window_set_transient_for, "gdk_window_set_transient_for", libs);
  gidLink(cast(void**)&gdk_window_set_type_hint, "gdk_window_set_type_hint", libs);
  gidLink(cast(void**)&gdk_window_set_urgency_hint, "gdk_window_set_urgency_hint", libs);
  gidLink(cast(void**)&gdk_window_set_user_data, "gdk_window_set_user_data", libs);
  gidLink(cast(void**)&gdk_window_shape_combine_region, "gdk_window_shape_combine_region", libs);
  gidLink(cast(void**)&gdk_window_show, "gdk_window_show", libs);
  gidLink(cast(void**)&gdk_window_show_unraised, "gdk_window_show_unraised", libs);
  gidLink(cast(void**)&gdk_window_show_window_menu, "gdk_window_show_window_menu", libs);
  gidLink(cast(void**)&gdk_window_stick, "gdk_window_stick", libs);
  gidLink(cast(void**)&gdk_window_thaw_toplevel_updates_libgtk_only, "gdk_window_thaw_toplevel_updates_libgtk_only", libs);
  gidLink(cast(void**)&gdk_window_thaw_updates, "gdk_window_thaw_updates", libs);
  gidLink(cast(void**)&gdk_window_unfullscreen, "gdk_window_unfullscreen", libs);
  gidLink(cast(void**)&gdk_window_unmaximize, "gdk_window_unmaximize", libs);
  gidLink(cast(void**)&gdk_window_unstick, "gdk_window_unstick", libs);
  gidLink(cast(void**)&gdk_window_withdraw, "gdk_window_withdraw", libs);

  // global
  gidLink(cast(void**)&gdk_add_option_entries_libgtk_only, "gdk_add_option_entries_libgtk_only", libs);
  gidLink(cast(void**)&gdk_beep, "gdk_beep", libs);
  gidLink(cast(void**)&gdk_cairo_create, "gdk_cairo_create", libs);
  gidLink(cast(void**)&gdk_cairo_draw_from_gl, "gdk_cairo_draw_from_gl", libs);
  gidLink(cast(void**)&gdk_cairo_get_clip_rectangle, "gdk_cairo_get_clip_rectangle", libs);
  gidLink(cast(void**)&gdk_cairo_get_drawing_context, "gdk_cairo_get_drawing_context", libs);
  gidLink(cast(void**)&gdk_cairo_rectangle, "gdk_cairo_rectangle", libs);
  gidLink(cast(void**)&gdk_cairo_region, "gdk_cairo_region", libs);
  gidLink(cast(void**)&gdk_cairo_region_create_from_surface, "gdk_cairo_region_create_from_surface", libs);
  gidLink(cast(void**)&gdk_cairo_set_source_color, "gdk_cairo_set_source_color", libs);
  gidLink(cast(void**)&gdk_cairo_set_source_pixbuf, "gdk_cairo_set_source_pixbuf", libs);
  gidLink(cast(void**)&gdk_cairo_set_source_rgba, "gdk_cairo_set_source_rgba", libs);
  gidLink(cast(void**)&gdk_cairo_set_source_window, "gdk_cairo_set_source_window", libs);
  gidLink(cast(void**)&gdk_cairo_surface_create_from_pixbuf, "gdk_cairo_surface_create_from_pixbuf", libs);
  gidLink(cast(void**)&gdk_disable_multidevice, "gdk_disable_multidevice", libs);
  gidLink(cast(void**)&gdk_drag_abort, "gdk_drag_abort", libs);
  gidLink(cast(void**)&gdk_drag_begin, "gdk_drag_begin", libs);
  gidLink(cast(void**)&gdk_drag_begin_for_device, "gdk_drag_begin_for_device", libs);
  gidLink(cast(void**)&gdk_drag_begin_from_point, "gdk_drag_begin_from_point", libs);
  gidLink(cast(void**)&gdk_drag_drop, "gdk_drag_drop", libs);
  gidLink(cast(void**)&gdk_drag_drop_done, "gdk_drag_drop_done", libs);
  gidLink(cast(void**)&gdk_drag_drop_succeeded, "gdk_drag_drop_succeeded", libs);
  gidLink(cast(void**)&gdk_drag_find_window_for_screen, "gdk_drag_find_window_for_screen", libs);
  gidLink(cast(void**)&gdk_drag_get_selection, "gdk_drag_get_selection", libs);
  gidLink(cast(void**)&gdk_drag_motion, "gdk_drag_motion", libs);
  gidLink(cast(void**)&gdk_drag_status, "gdk_drag_status", libs);
  gidLink(cast(void**)&gdk_drop_finish, "gdk_drop_finish", libs);
  gidLink(cast(void**)&gdk_drop_reply, "gdk_drop_reply", libs);
  gidLink(cast(void**)&gdk_error_trap_pop, "gdk_error_trap_pop", libs);
  gidLink(cast(void**)&gdk_error_trap_pop_ignored, "gdk_error_trap_pop_ignored", libs);
  gidLink(cast(void**)&gdk_error_trap_push, "gdk_error_trap_push", libs);
  gidLink(cast(void**)&gdk_events_get_angle, "gdk_events_get_angle", libs);
  gidLink(cast(void**)&gdk_events_get_center, "gdk_events_get_center", libs);
  gidLink(cast(void**)&gdk_events_get_distance, "gdk_events_get_distance", libs);
  gidLink(cast(void**)&gdk_events_pending, "gdk_events_pending", libs);
  gidLink(cast(void**)&gdk_flush, "gdk_flush", libs);
  gidLink(cast(void**)&gdk_get_default_root_window, "gdk_get_default_root_window", libs);
  gidLink(cast(void**)&gdk_get_display, "gdk_get_display", libs);
  gidLink(cast(void**)&gdk_get_display_arg_name, "gdk_get_display_arg_name", libs);
  gidLink(cast(void**)&gdk_get_program_class, "gdk_get_program_class", libs);
  gidLink(cast(void**)&gdk_get_show_events, "gdk_get_show_events", libs);
  gidLink(cast(void**)&gdk_init, "gdk_init", libs);
  gidLink(cast(void**)&gdk_init_check, "gdk_init_check", libs);
  gidLink(cast(void**)&gdk_keyboard_grab, "gdk_keyboard_grab", libs);
  gidLink(cast(void**)&gdk_keyboard_ungrab, "gdk_keyboard_ungrab", libs);
  gidLink(cast(void**)&gdk_keyval_convert_case, "gdk_keyval_convert_case", libs);
  gidLink(cast(void**)&gdk_keyval_from_name, "gdk_keyval_from_name", libs);
  gidLink(cast(void**)&gdk_keyval_is_lower, "gdk_keyval_is_lower", libs);
  gidLink(cast(void**)&gdk_keyval_is_upper, "gdk_keyval_is_upper", libs);
  gidLink(cast(void**)&gdk_keyval_name, "gdk_keyval_name", libs);
  gidLink(cast(void**)&gdk_keyval_to_lower, "gdk_keyval_to_lower", libs);
  gidLink(cast(void**)&gdk_keyval_to_unicode, "gdk_keyval_to_unicode", libs);
  gidLink(cast(void**)&gdk_keyval_to_upper, "gdk_keyval_to_upper", libs);
  gidLink(cast(void**)&gdk_list_visuals, "gdk_list_visuals", libs);
  gidLink(cast(void**)&gdk_notify_startup_complete, "gdk_notify_startup_complete", libs);
  gidLink(cast(void**)&gdk_notify_startup_complete_with_id, "gdk_notify_startup_complete_with_id", libs);
  gidLink(cast(void**)&gdk_offscreen_window_get_embedder, "gdk_offscreen_window_get_embedder", libs);
  gidLink(cast(void**)&gdk_offscreen_window_get_surface, "gdk_offscreen_window_get_surface", libs);
  gidLink(cast(void**)&gdk_offscreen_window_set_embedder, "gdk_offscreen_window_set_embedder", libs);
  gidLink(cast(void**)&gdk_pango_context_get, "gdk_pango_context_get", libs);
  gidLink(cast(void**)&gdk_pango_context_get_for_display, "gdk_pango_context_get_for_display", libs);
  gidLink(cast(void**)&gdk_pango_context_get_for_screen, "gdk_pango_context_get_for_screen", libs);
  gidLink(cast(void**)&gdk_pango_layout_get_clip_region, "gdk_pango_layout_get_clip_region", libs);
  gidLink(cast(void**)&gdk_pango_layout_line_get_clip_region, "gdk_pango_layout_line_get_clip_region", libs);
  gidLink(cast(void**)&gdk_parse_args, "gdk_parse_args", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_from_surface, "gdk_pixbuf_get_from_surface", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_from_window, "gdk_pixbuf_get_from_window", libs);
  gidLink(cast(void**)&gdk_pointer_grab, "gdk_pointer_grab", libs);
  gidLink(cast(void**)&gdk_pointer_is_grabbed, "gdk_pointer_is_grabbed", libs);
  gidLink(cast(void**)&gdk_pointer_ungrab, "gdk_pointer_ungrab", libs);
  gidLink(cast(void**)&gdk_pre_parse_libgtk_only, "gdk_pre_parse_libgtk_only", libs);
  gidLink(cast(void**)&gdk_property_change, "gdk_property_change", libs);
  gidLink(cast(void**)&gdk_property_delete, "gdk_property_delete", libs);
  gidLink(cast(void**)&gdk_property_get, "gdk_property_get", libs);
  gidLink(cast(void**)&gdk_query_depths, "gdk_query_depths", libs);
  gidLink(cast(void**)&gdk_query_visual_types, "gdk_query_visual_types", libs);
  gidLink(cast(void**)&gdk_selection_convert, "gdk_selection_convert", libs);
  gidLink(cast(void**)&gdk_selection_owner_get, "gdk_selection_owner_get", libs);
  gidLink(cast(void**)&gdk_selection_owner_get_for_display, "gdk_selection_owner_get_for_display", libs);
  gidLink(cast(void**)&gdk_selection_owner_set, "gdk_selection_owner_set", libs);
  gidLink(cast(void**)&gdk_selection_owner_set_for_display, "gdk_selection_owner_set_for_display", libs);
  gidLink(cast(void**)&gdk_selection_property_get, "gdk_selection_property_get", libs);
  gidLink(cast(void**)&gdk_selection_send_notify, "gdk_selection_send_notify", libs);
  gidLink(cast(void**)&gdk_selection_send_notify_for_display, "gdk_selection_send_notify_for_display", libs);
  gidLink(cast(void**)&gdk_set_allowed_backends, "gdk_set_allowed_backends", libs);
  gidLink(cast(void**)&gdk_set_double_click_time, "gdk_set_double_click_time", libs);
  gidLink(cast(void**)&gdk_set_program_class, "gdk_set_program_class", libs);
  gidLink(cast(void**)&gdk_set_show_events, "gdk_set_show_events", libs);
  gidLink(cast(void**)&gdk_setting_get, "gdk_setting_get", libs);
  gidLink(cast(void**)&gdk_synthesize_window_state, "gdk_synthesize_window_state", libs);
  gidLink(cast(void**)&gdk_test_render_sync, "gdk_test_render_sync", libs);
  gidLink(cast(void**)&gdk_test_simulate_button, "gdk_test_simulate_button", libs);
  gidLink(cast(void**)&gdk_test_simulate_key, "gdk_test_simulate_key", libs);
  gidLink(cast(void**)&gdk_text_property_to_utf8_list_for_display, "gdk_text_property_to_utf8_list_for_display", libs);
  gidLink(cast(void**)&gdk_threads_add_idle, "gdk_threads_add_idle", libs);
  gidLink(cast(void**)&gdk_threads_add_idle_full, "gdk_threads_add_idle_full", libs);
  gidLink(cast(void**)&gdk_threads_add_timeout, "gdk_threads_add_timeout", libs);
  gidLink(cast(void**)&gdk_threads_add_timeout_full, "gdk_threads_add_timeout_full", libs);
  gidLink(cast(void**)&gdk_threads_add_timeout_seconds, "gdk_threads_add_timeout_seconds", libs);
  gidLink(cast(void**)&gdk_threads_add_timeout_seconds_full, "gdk_threads_add_timeout_seconds_full", libs);
  gidLink(cast(void**)&gdk_threads_enter, "gdk_threads_enter", libs);
  gidLink(cast(void**)&gdk_threads_init, "gdk_threads_init", libs);
  gidLink(cast(void**)&gdk_threads_leave, "gdk_threads_leave", libs);
  gidLink(cast(void**)&gdk_threads_set_lock_functions, "gdk_threads_set_lock_functions", libs);
  gidLink(cast(void**)&gdk_unicode_to_keyval, "gdk_unicode_to_keyval", libs);
  gidLink(cast(void**)&gdk_utf8_to_string_target, "gdk_utf8_to_string_target", libs);

  // GLError
  gidLink(cast(void**)&gdk_gl_error_quark, "gdk_gl_error_quark", libs);
}
