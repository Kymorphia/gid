/// C functions for gdk3 library
module gdk.c.functions;

public import gid.basictypes;
import gid.loader;
import gdk.c.types;
public import gdkpixbuf.c.types;
public import gio.c.types;
public import pango.c.types;
public import cairo.c.types;

version(Windows)
  private immutable LIBS = ["libgdk-3-0.dll;gdk-3-0.dll;gdk-3.dll"];
else version(OSX)
  private immutable LIBS = ["libgdk-3.0.dylib"];
else
  private immutable LIBS = ["libgdk-3.so.0"];

__gshared extern(C)
{
  // AppLaunchContext
  GType function() c_gdk_app_launch_context_get_type; ///
  GdkAppLaunchContext* function() c_gdk_app_launch_context_new; ///
  void function(GdkAppLaunchContext* context, int desktop) c_gdk_app_launch_context_set_desktop; ///
  void function(GdkAppLaunchContext* context, GdkDisplay* display) c_gdk_app_launch_context_set_display; ///
  void function(GdkAppLaunchContext* context, GIcon* icon) c_gdk_app_launch_context_set_icon; ///
  void function(GdkAppLaunchContext* context, const(char)* iconName) c_gdk_app_launch_context_set_icon_name; ///
  void function(GdkAppLaunchContext* context, GdkScreen* screen) c_gdk_app_launch_context_set_screen; ///
  void function(GdkAppLaunchContext* context, uint timestamp) c_gdk_app_launch_context_set_timestamp; ///

  // Atom
  char* function(GdkAtom atom) c_gdk_atom_name; ///
  GdkAtom function(const(char)* atomName, gboolean onlyIfExists) c_gdk_atom_intern; ///
  GdkAtom function(const(char)* atomName) c_gdk_atom_intern_static_string; ///

  // Color
  GType function() c_gdk_color_get_type; ///
  GdkColor* function(const(GdkColor)* color) c_gdk_color_copy; ///
  gboolean function(const(GdkColor)* colora, const(GdkColor)* colorb) c_gdk_color_equal; ///
  void function(GdkColor* color) c_gdk_color_free; ///
  uint function(const(GdkColor)* color) c_gdk_color_hash; ///
  char* function(const(GdkColor)* color) c_gdk_color_to_string; ///
  gboolean function(const(char)* spec, GdkColor* color) c_gdk_color_parse; ///

  // Cursor
  GType function() c_gdk_cursor_get_type; ///
  GdkCursor* function(GdkCursorType cursorType) c_gdk_cursor_new; ///
  GdkCursor* function(GdkDisplay* display, GdkCursorType cursorType) c_gdk_cursor_new_for_display; ///
  GdkCursor* function(GdkDisplay* display, const(char)* name) c_gdk_cursor_new_from_name; ///
  GdkCursor* function(GdkDisplay* display, GdkPixbuf* pixbuf, int x, int y) c_gdk_cursor_new_from_pixbuf; ///
  GdkCursor* function(GdkDisplay* display, cairo_surface_t* surface, double x, double y) c_gdk_cursor_new_from_surface; ///
  GdkCursorType function(GdkCursor* cursor) c_gdk_cursor_get_cursor_type; ///
  GdkDisplay* function(GdkCursor* cursor) c_gdk_cursor_get_display; ///
  GdkPixbuf* function(GdkCursor* cursor) c_gdk_cursor_get_image; ///
  cairo_surface_t* function(GdkCursor* cursor, double* xHot, double* yHot) c_gdk_cursor_get_surface; ///
  GdkCursor* function(GdkCursor* cursor) c_gdk_cursor_ref; ///
  void function(GdkCursor* cursor) c_gdk_cursor_unref; ///

  // Device
  GType function() c_gdk_device_get_type; ///
  void function(GdkTimeCoord** events, int nEvents) c_gdk_device_free_history; ///
  gboolean function(GdkDisplay* display, GdkDevice* device, GdkWindow** grabWindow, gboolean* ownerEvents) c_gdk_device_grab_info_libgtk_only; ///
  GdkDevice* function(GdkDevice* device) c_gdk_device_get_associated_device; ///
  GdkAxisFlags function(GdkDevice* device) c_gdk_device_get_axes; ///
  gboolean function(GdkDevice* device, double* axes, GdkAxisUse use, double* value) c_gdk_device_get_axis; ///
  GdkAxisUse function(GdkDevice* device, uint index) c_gdk_device_get_axis_use; ///
  gboolean function(GdkDevice* device, double* axes, GdkAtom axisLabel, double* value) c_gdk_device_get_axis_value; ///
  GdkDeviceType function(GdkDevice* device) c_gdk_device_get_device_type; ///
  GdkDisplay* function(GdkDevice* device) c_gdk_device_get_display; ///
  gboolean function(GdkDevice* device) c_gdk_device_get_has_cursor; ///
  gboolean function(GdkDevice* device, GdkWindow* window, uint start, uint stop, GdkTimeCoord*** events, int* nEvents) c_gdk_device_get_history; ///
  gboolean function(GdkDevice* device, uint index, uint* keyval, GdkModifierType* modifiers) c_gdk_device_get_key; ///
  GdkWindow* function(GdkDevice* device) c_gdk_device_get_last_event_window; ///
  GdkInputMode function(GdkDevice* device) c_gdk_device_get_mode; ///
  int function(GdkDevice* device) c_gdk_device_get_n_axes; ///
  int function(GdkDevice* device) c_gdk_device_get_n_keys; ///
  const(char)* function(GdkDevice* device) c_gdk_device_get_name; ///
  void function(GdkDevice* device, GdkScreen** screen, int* x, int* y) c_gdk_device_get_position; ///
  void function(GdkDevice* device, GdkScreen** screen, double* x, double* y) c_gdk_device_get_position_double; ///
  const(char)* function(GdkDevice* device) c_gdk_device_get_product_id; ///
  GdkSeat* function(GdkDevice* device) c_gdk_device_get_seat; ///
  GdkInputSource function(GdkDevice* device) c_gdk_device_get_source; ///
  void function(GdkDevice* device, GdkWindow* window, double* axes, GdkModifierType* mask) c_gdk_device_get_state; ///
  const(char)* function(GdkDevice* device) c_gdk_device_get_vendor_id; ///
  GdkWindow* function(GdkDevice* device, int* winX, int* winY) c_gdk_device_get_window_at_position; ///
  GdkWindow* function(GdkDevice* device, double* winX, double* winY) c_gdk_device_get_window_at_position_double; ///
  GdkGrabStatus function(GdkDevice* device, GdkWindow* window, GdkGrabOwnership grabOwnership, gboolean ownerEvents, GdkEventMask eventMask, GdkCursor* cursor, uint time) c_gdk_device_grab; ///
  GList* function(GdkDevice* device) c_gdk_device_list_axes; ///
  GList* function(GdkDevice* device) c_gdk_device_list_slave_devices; ///
  void function(GdkDevice* device, uint index, GdkAxisUse use) c_gdk_device_set_axis_use; ///
  void function(GdkDevice* device, uint index, uint keyval, GdkModifierType modifiers) c_gdk_device_set_key; ///
  gboolean function(GdkDevice* device, GdkInputMode mode) c_gdk_device_set_mode; ///
  void function(GdkDevice* device, uint time) c_gdk_device_ungrab; ///
  void function(GdkDevice* device, GdkScreen* screen, int x, int y) c_gdk_device_warp; ///

  // DeviceManager
  GType function() c_gdk_device_manager_get_type; ///
  GdkDevice* function(GdkDeviceManager* deviceManager) c_gdk_device_manager_get_client_pointer; ///
  GdkDisplay* function(GdkDeviceManager* deviceManager) c_gdk_device_manager_get_display; ///
  GList* function(GdkDeviceManager* deviceManager, GdkDeviceType type) c_gdk_device_manager_list_devices; ///

  // DevicePad
  GType function() c_gdk_device_pad_get_type; ///
  int function(GdkDevicePad* pad, GdkDevicePadFeature feature, int featureIdx) c_gdk_device_pad_get_feature_group; ///
  int function(GdkDevicePad* pad, int groupIdx) c_gdk_device_pad_get_group_n_modes; ///
  int function(GdkDevicePad* pad, GdkDevicePadFeature feature) c_gdk_device_pad_get_n_features; ///
  int function(GdkDevicePad* pad) c_gdk_device_pad_get_n_groups; ///

  // DeviceTool
  GType function() c_gdk_device_tool_get_type; ///
  ulong function(GdkDeviceTool* tool) c_gdk_device_tool_get_hardware_id; ///
  ulong function(GdkDeviceTool* tool) c_gdk_device_tool_get_serial; ///
  GdkDeviceToolType function(GdkDeviceTool* tool) c_gdk_device_tool_get_tool_type; ///

  // Display
  GType function() c_gdk_display_get_type; ///
  GdkDisplay* function() c_gdk_display_get_default; ///
  GdkDisplay* function(const(char)* displayName) c_gdk_display_open; ///
  GdkDisplay* function() c_gdk_display_open_default_libgtk_only; ///
  void function(GdkDisplay* display) c_gdk_display_beep; ///
  void function(GdkDisplay* display) c_gdk_display_close; ///
  gboolean function(GdkDisplay* display, GdkDevice* device) c_gdk_display_device_is_grabbed; ///
  void function(GdkDisplay* display) c_gdk_display_flush; ///
  GdkAppLaunchContext* function(GdkDisplay* display) c_gdk_display_get_app_launch_context; ///
  uint function(GdkDisplay* display) c_gdk_display_get_default_cursor_size; ///
  GdkWindow* function(GdkDisplay* display) c_gdk_display_get_default_group; ///
  GdkScreen* function(GdkDisplay* display) c_gdk_display_get_default_screen; ///
  GdkSeat* function(GdkDisplay* display) c_gdk_display_get_default_seat; ///
  GdkDeviceManager* function(GdkDisplay* display) c_gdk_display_get_device_manager; ///
  GdkEvent* function(GdkDisplay* display) c_gdk_display_get_event; ///
  void function(GdkDisplay* display, uint* width, uint* height) c_gdk_display_get_maximal_cursor_size; ///
  GdkMonitor* function(GdkDisplay* display, int monitorNum) c_gdk_display_get_monitor; ///
  GdkMonitor* function(GdkDisplay* display, int x, int y) c_gdk_display_get_monitor_at_point; ///
  GdkMonitor* function(GdkDisplay* display, GdkWindow* window) c_gdk_display_get_monitor_at_window; ///
  int function(GdkDisplay* display) c_gdk_display_get_n_monitors; ///
  int function(GdkDisplay* display) c_gdk_display_get_n_screens; ///
  const(char)* function(GdkDisplay* display) c_gdk_display_get_name; ///
  void function(GdkDisplay* display, GdkScreen** screen, int* x, int* y, GdkModifierType* mask) c_gdk_display_get_pointer; ///
  GdkMonitor* function(GdkDisplay* display) c_gdk_display_get_primary_monitor; ///
  GdkScreen* function(GdkDisplay* display, int screenNum) c_gdk_display_get_screen; ///
  GdkWindow* function(GdkDisplay* display, int* winX, int* winY) c_gdk_display_get_window_at_pointer; ///
  gboolean function(GdkDisplay* display) c_gdk_display_has_pending; ///
  gboolean function(GdkDisplay* display) c_gdk_display_is_closed; ///
  void function(GdkDisplay* display, uint time) c_gdk_display_keyboard_ungrab; ///
  GList* function(GdkDisplay* display) c_gdk_display_list_devices; ///
  GList* function(GdkDisplay* display) c_gdk_display_list_seats; ///
  void function(GdkDisplay* display, const(char)* startupId) c_gdk_display_notify_startup_complete; ///
  GdkEvent* function(GdkDisplay* display) c_gdk_display_peek_event; ///
  gboolean function(GdkDisplay* display) c_gdk_display_pointer_is_grabbed; ///
  void function(GdkDisplay* display, uint time) c_gdk_display_pointer_ungrab; ///
  void function(GdkDisplay* display, const(GdkEvent)* event) c_gdk_display_put_event; ///
  gboolean function(GdkDisplay* display, GdkAtom selection) c_gdk_display_request_selection_notification; ///
  void function(GdkDisplay* display, uint distance) c_gdk_display_set_double_click_distance; ///
  void function(GdkDisplay* display, uint msec) c_gdk_display_set_double_click_time; ///
  void function(GdkDisplay* display, GdkWindow* clipboardWindow, uint time, const(GdkAtom)* targets, int nTargets) c_gdk_display_store_clipboard; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_clipboard_persistence; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_composite; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_cursor_alpha; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_cursor_color; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_input_shapes; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_selection_notification; ///
  gboolean function(GdkDisplay* display) c_gdk_display_supports_shapes; ///
  void function(GdkDisplay* display) c_gdk_display_sync; ///
  void function(GdkDisplay* display, GdkScreen* screen, int x, int y) c_gdk_display_warp_pointer; ///

  // DisplayManager
  GType function() c_gdk_display_manager_get_type; ///
  GdkDisplayManager* function() c_gdk_display_manager_get; ///
  GdkDisplay* function(GdkDisplayManager* manager) c_gdk_display_manager_get_default_display; ///
  GSList* function(GdkDisplayManager* manager) c_gdk_display_manager_list_displays; ///
  GdkDisplay* function(GdkDisplayManager* manager, const(char)* name) c_gdk_display_manager_open_display; ///
  void function(GdkDisplayManager* manager, GdkDisplay* display) c_gdk_display_manager_set_default_display; ///

  // DragContext
  GType function() c_gdk_drag_context_get_type; ///
  GdkDragAction function(GdkDragContext* context) c_gdk_drag_context_get_actions; ///
  GdkWindow* function(GdkDragContext* context) c_gdk_drag_context_get_dest_window; ///
  GdkDevice* function(GdkDragContext* context) c_gdk_drag_context_get_device; ///
  GdkWindow* function(GdkDragContext* context) c_gdk_drag_context_get_drag_window; ///
  GdkDragProtocol function(GdkDragContext* context) c_gdk_drag_context_get_protocol; ///
  GdkDragAction function(GdkDragContext* context) c_gdk_drag_context_get_selected_action; ///
  GdkWindow* function(GdkDragContext* context) c_gdk_drag_context_get_source_window; ///
  GdkDragAction function(GdkDragContext* context) c_gdk_drag_context_get_suggested_action; ///
  GList* function(GdkDragContext* context) c_gdk_drag_context_list_targets; ///
  gboolean function(GdkDragContext* context, GdkWindow* ipcWindow, GdkDragAction actions) c_gdk_drag_context_manage_dnd; ///
  void function(GdkDragContext* context, GdkDevice* device) c_gdk_drag_context_set_device; ///
  void function(GdkDragContext* context, int hotX, int hotY) c_gdk_drag_context_set_hotspot; ///

  // DrawingContext
  GType function() c_gdk_drawing_context_get_type; ///
  cairo_t* function(GdkDrawingContext* context) c_gdk_drawing_context_get_cairo_context; ///
  cairo_region_t* function(GdkDrawingContext* context) c_gdk_drawing_context_get_clip; ///
  GdkWindow* function(GdkDrawingContext* context) c_gdk_drawing_context_get_window; ///
  gboolean function(GdkDrawingContext* context) c_gdk_drawing_context_is_valid; ///

  // Event
  GType function() c_gdk_event_get_type; ///
  GdkEvent* function(GdkEventType type) c_gdk_event_new; ///
  GdkEvent* function(const(GdkEvent)* event) c_gdk_event_copy; ///
  void function(GdkEvent* event) c_gdk_event_free; ///
  gboolean function(const(GdkEvent)* event, GdkAxisUse axisUse, double* value) c_gdk_event_get_axis; ///
  gboolean function(const(GdkEvent)* event, uint* button) c_gdk_event_get_button; ///
  gboolean function(const(GdkEvent)* event, uint* clickCount) c_gdk_event_get_click_count; ///
  gboolean function(const(GdkEvent)* event, double* xWin, double* yWin) c_gdk_event_get_coords; ///
  GdkDevice* function(const(GdkEvent)* event) c_gdk_event_get_device; ///
  GdkDeviceTool* function(const(GdkEvent)* event) c_gdk_event_get_device_tool; ///
  GdkEventSequence* function(const(GdkEvent)* event) c_gdk_event_get_event_sequence; ///
  GdkEventType function(const(GdkEvent)* event) c_gdk_event_get_event_type; ///
  gboolean function(const(GdkEvent)* event, ushort* keycode) c_gdk_event_get_keycode; ///
  gboolean function(const(GdkEvent)* event, uint* keyval) c_gdk_event_get_keyval; ///
  gboolean function(GdkEvent* event) c_gdk_event_get_pointer_emulated; ///
  gboolean function(const(GdkEvent)* event, double* xRoot, double* yRoot) c_gdk_event_get_root_coords; ///
  int function(GdkEvent* event) c_gdk_event_get_scancode; ///
  GdkScreen* function(const(GdkEvent)* event) c_gdk_event_get_screen; ///
  gboolean function(const(GdkEvent)* event, double* deltaX, double* deltaY) c_gdk_event_get_scroll_deltas; ///
  gboolean function(const(GdkEvent)* event, GdkScrollDirection* direction) c_gdk_event_get_scroll_direction; ///
  GdkSeat* function(const(GdkEvent)* event) c_gdk_event_get_seat; ///
  GdkDevice* function(const(GdkEvent)* event) c_gdk_event_get_source_device; ///
  gboolean function(const(GdkEvent)* event, GdkModifierType* state) c_gdk_event_get_state; ///
  uint function(const(GdkEvent)* event) c_gdk_event_get_time; ///
  GdkWindow* function(const(GdkEvent)* event) c_gdk_event_get_window; ///
  gboolean function(const(GdkEvent)* event) c_gdk_event_is_scroll_stop_event; ///
  void function(const(GdkEvent)* event) c_gdk_event_put; ///
  void function(GdkEvent* event, GdkDevice* device) c_gdk_event_set_device; ///
  void function(GdkEvent* event, GdkDeviceTool* tool) c_gdk_event_set_device_tool; ///
  void function(GdkEvent* event, GdkScreen* screen) c_gdk_event_set_screen; ///
  void function(GdkEvent* event, GdkDevice* device) c_gdk_event_set_source_device; ///
  gboolean function(const(GdkEvent)* event) c_gdk_event_triggers_context_menu; ///
  GdkEvent* function() c_gdk_event_get; ///
  void function(GdkEventFunc func, void* data, GDestroyNotify notify) c_gdk_event_handler_set; ///
  GdkEvent* function() c_gdk_event_peek; ///
  void function(const(GdkEventMotion)* event) c_gdk_event_request_motions; ///

  // EventSequence
  GType function() c_gdk_event_sequence_get_type; ///

  // FrameClock
  GType function() c_gdk_frame_clock_get_type; ///
  void function(GdkFrameClock* frameClock) c_gdk_frame_clock_begin_updating; ///
  void function(GdkFrameClock* frameClock) c_gdk_frame_clock_end_updating; ///
  GdkFrameTimings* function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_current_timings; ///
  long function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_frame_counter; ///
  long function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_frame_time; ///
  long function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_history_start; ///
  void function(GdkFrameClock* frameClock, long baseTime, long* refreshIntervalReturn, long* presentationTimeReturn) c_gdk_frame_clock_get_refresh_info; ///
  GdkFrameTimings* function(GdkFrameClock* frameClock, long frameCounter) c_gdk_frame_clock_get_timings; ///
  void function(GdkFrameClock* frameClock, GdkFrameClockPhase phase) c_gdk_frame_clock_request_phase; ///

  // FrameTimings
  GType function() c_gdk_frame_timings_get_type; ///
  gboolean function(GdkFrameTimings* timings) c_gdk_frame_timings_get_complete; ///
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_frame_counter; ///
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_frame_time; ///
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_predicted_presentation_time; ///
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_presentation_time; ///
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_refresh_interval; ///
  GdkFrameTimings* function(GdkFrameTimings* timings) c_gdk_frame_timings_ref; ///
  void function(GdkFrameTimings* timings) c_gdk_frame_timings_unref; ///

  // GLContext
  GType function() c_gdk_gl_context_get_type; ///
  void function() c_gdk_gl_context_clear_current; ///
  GdkGLContext* function() c_gdk_gl_context_get_current; ///
  gboolean function(GdkGLContext* context) c_gdk_gl_context_get_debug_enabled; ///
  GdkDisplay* function(GdkGLContext* context) c_gdk_gl_context_get_display; ///
  gboolean function(GdkGLContext* context) c_gdk_gl_context_get_forward_compatible; ///
  void function(GdkGLContext* context, int* major, int* minor) c_gdk_gl_context_get_required_version; ///
  GdkGLContext* function(GdkGLContext* context) c_gdk_gl_context_get_shared_context; ///
  gboolean function(GdkGLContext* context) c_gdk_gl_context_get_use_es; ///
  void function(GdkGLContext* context, int* major, int* minor) c_gdk_gl_context_get_version; ///
  GdkWindow* function(GdkGLContext* context) c_gdk_gl_context_get_window; ///
  gboolean function(GdkGLContext* context) c_gdk_gl_context_is_legacy; ///
  void function(GdkGLContext* context) c_gdk_gl_context_make_current; ///
  gboolean function(GdkGLContext* context, GError** _err) c_gdk_gl_context_realize; ///
  void function(GdkGLContext* context, gboolean enabled) c_gdk_gl_context_set_debug_enabled; ///
  void function(GdkGLContext* context, gboolean compatible) c_gdk_gl_context_set_forward_compatible; ///
  void function(GdkGLContext* context, int major, int minor) c_gdk_gl_context_set_required_version; ///
  void function(GdkGLContext* context, int useEs) c_gdk_gl_context_set_use_es; ///

  // Keymap
  GType function() c_gdk_keymap_get_type; ///
  GdkKeymap* function() c_gdk_keymap_get_default; ///
  GdkKeymap* function(GdkDisplay* display) c_gdk_keymap_get_for_display; ///
  void function(GdkKeymap* keymap, GdkModifierType* state) c_gdk_keymap_add_virtual_modifiers; ///
  gboolean function(GdkKeymap* keymap) c_gdk_keymap_get_caps_lock_state; ///
  PangoDirection function(GdkKeymap* keymap) c_gdk_keymap_get_direction; ///
  gboolean function(GdkKeymap* keymap, uint hardwareKeycode, GdkKeymapKey** keys, uint** keyvals, int* nEntries) c_gdk_keymap_get_entries_for_keycode; ///
  gboolean function(GdkKeymap* keymap, uint keyval, GdkKeymapKey** keys, int* nKeys) c_gdk_keymap_get_entries_for_keyval; ///
  GdkModifierType function(GdkKeymap* keymap, GdkModifierIntent intent) c_gdk_keymap_get_modifier_mask; ///
  uint function(GdkKeymap* keymap) c_gdk_keymap_get_modifier_state; ///
  gboolean function(GdkKeymap* keymap) c_gdk_keymap_get_num_lock_state; ///
  gboolean function(GdkKeymap* keymap) c_gdk_keymap_get_scroll_lock_state; ///
  gboolean function(GdkKeymap* keymap) c_gdk_keymap_have_bidi_layouts; ///
  uint function(GdkKeymap* keymap, const(GdkKeymapKey)* key) c_gdk_keymap_lookup_key; ///
  gboolean function(GdkKeymap* keymap, GdkModifierType* state) c_gdk_keymap_map_virtual_modifiers; ///
  gboolean function(GdkKeymap* keymap, uint hardwareKeycode, GdkModifierType state, int group, uint* keyval, int* effectiveGroup, int* level, GdkModifierType* consumedModifiers) c_gdk_keymap_translate_keyboard_state; ///

  // MonitorWrap
  GType function() c_gdk_monitor_get_type; ///
  GdkDisplay* function(GdkMonitor* monitor) c_gdk_monitor_get_display; ///
  void function(GdkMonitor* monitor, GdkRectangle* geometry) c_gdk_monitor_get_geometry; ///
  int function(GdkMonitor* monitor) c_gdk_monitor_get_height_mm; ///
  const(char)* function(GdkMonitor* monitor) c_gdk_monitor_get_manufacturer; ///
  const(char)* function(GdkMonitor* monitor) c_gdk_monitor_get_model; ///
  int function(GdkMonitor* monitor) c_gdk_monitor_get_refresh_rate; ///
  int function(GdkMonitor* monitor) c_gdk_monitor_get_scale_factor; ///
  GdkSubpixelLayout function(GdkMonitor* monitor) c_gdk_monitor_get_subpixel_layout; ///
  int function(GdkMonitor* monitor) c_gdk_monitor_get_width_mm; ///
  void function(GdkMonitor* monitor, GdkRectangle* workarea) c_gdk_monitor_get_workarea; ///
  gboolean function(GdkMonitor* monitor) c_gdk_monitor_is_primary; ///

  // RGBA
  GType function() c_gdk_rgba_get_type; ///
  GdkRGBA* function(const(GdkRGBA)* rgba) c_gdk_rgba_copy; ///
  gboolean function(GdkRGBA* p1, GdkRGBA* p2) c_gdk_rgba_equal; ///
  void function(GdkRGBA* rgba) c_gdk_rgba_free; ///
  uint function(GdkRGBA* p) c_gdk_rgba_hash; ///
  gboolean function(GdkRGBA* rgba, const(char)* spec) c_gdk_rgba_parse; ///
  char* function(const(GdkRGBA)* rgba) c_gdk_rgba_to_string; ///

  // Rectangle
  GType function() c_gdk_rectangle_get_type; ///
  gboolean function(const(GdkRectangle)* rect1, const(GdkRectangle)* rect2) c_gdk_rectangle_equal; ///
  gboolean function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) c_gdk_rectangle_intersect; ///
  void function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) c_gdk_rectangle_union; ///

  // Screen
  GType function() c_gdk_screen_get_type; ///
  GdkScreen* function() c_gdk_screen_get_default; ///
  int function() c_gdk_screen_height; ///
  int function() c_gdk_screen_height_mm; ///
  int function() c_gdk_screen_width; ///
  int function() c_gdk_screen_width_mm; ///
  GdkWindow* function(GdkScreen* screen) c_gdk_screen_get_active_window; ///
  GdkDisplay* function(GdkScreen* screen) c_gdk_screen_get_display; ///
  const(cairo_font_options_t)* function(GdkScreen* screen) c_gdk_screen_get_font_options; ///
  int function(GdkScreen* screen) c_gdk_screen_get_height; ///
  int function(GdkScreen* screen) c_gdk_screen_get_height_mm; ///
  int function(GdkScreen* screen, int x, int y) c_gdk_screen_get_monitor_at_point; ///
  int function(GdkScreen* screen, GdkWindow* window) c_gdk_screen_get_monitor_at_window; ///
  void function(GdkScreen* screen, int monitorNum, GdkRectangle* dest) c_gdk_screen_get_monitor_geometry; ///
  int function(GdkScreen* screen, int monitorNum) c_gdk_screen_get_monitor_height_mm; ///
  char* function(GdkScreen* screen, int monitorNum) c_gdk_screen_get_monitor_plug_name; ///
  int function(GdkScreen* screen, int monitorNum) c_gdk_screen_get_monitor_scale_factor; ///
  int function(GdkScreen* screen, int monitorNum) c_gdk_screen_get_monitor_width_mm; ///
  void function(GdkScreen* screen, int monitorNum, GdkRectangle* dest) c_gdk_screen_get_monitor_workarea; ///
  int function(GdkScreen* screen) c_gdk_screen_get_n_monitors; ///
  int function(GdkScreen* screen) c_gdk_screen_get_number; ///
  int function(GdkScreen* screen) c_gdk_screen_get_primary_monitor; ///
  double function(GdkScreen* screen) c_gdk_screen_get_resolution; ///
  GdkVisual* function(GdkScreen* screen) c_gdk_screen_get_rgba_visual; ///
  GdkWindow* function(GdkScreen* screen) c_gdk_screen_get_root_window; ///
  gboolean function(GdkScreen* screen, const(char)* name, GValue* value) c_gdk_screen_get_setting; ///
  GdkVisual* function(GdkScreen* screen) c_gdk_screen_get_system_visual; ///
  GList* function(GdkScreen* screen) c_gdk_screen_get_toplevel_windows; ///
  int function(GdkScreen* screen) c_gdk_screen_get_width; ///
  int function(GdkScreen* screen) c_gdk_screen_get_width_mm; ///
  GList* function(GdkScreen* screen) c_gdk_screen_get_window_stack; ///
  gboolean function(GdkScreen* screen) c_gdk_screen_is_composited; ///
  GList* function(GdkScreen* screen) c_gdk_screen_list_visuals; ///
  char* function(GdkScreen* screen) c_gdk_screen_make_display_name; ///
  void function(GdkScreen* screen, const(cairo_font_options_t)* options) c_gdk_screen_set_font_options; ///
  void function(GdkScreen* screen, double dpi) c_gdk_screen_set_resolution; ///

  // Seat
  GType function() c_gdk_seat_get_type; ///
  GdkSeatCapabilities function(GdkSeat* seat) c_gdk_seat_get_capabilities; ///
  GdkDisplay* function(GdkSeat* seat) c_gdk_seat_get_display; ///
  GdkDevice* function(GdkSeat* seat) c_gdk_seat_get_keyboard; ///
  GdkDevice* function(GdkSeat* seat) c_gdk_seat_get_pointer; ///
  GList* function(GdkSeat* seat, GdkSeatCapabilities capabilities) c_gdk_seat_get_slaves; ///
  GdkGrabStatus function(GdkSeat* seat, GdkWindow* window, GdkSeatCapabilities capabilities, gboolean ownerEvents, GdkCursor* cursor, const(GdkEvent)* event, GdkSeatGrabPrepareFunc prepareFunc, void* prepareFuncData) c_gdk_seat_grab; ///
  void function(GdkSeat* seat) c_gdk_seat_ungrab; ///

  // Visual
  GType function() c_gdk_visual_get_type; ///
  GdkVisual* function() c_gdk_visual_get_best; ///
  int function() c_gdk_visual_get_best_depth; ///
  GdkVisualType function() c_gdk_visual_get_best_type; ///
  GdkVisual* function(int depth, GdkVisualType visualType) c_gdk_visual_get_best_with_both; ///
  GdkVisual* function(int depth) c_gdk_visual_get_best_with_depth; ///
  GdkVisual* function(GdkVisualType visualType) c_gdk_visual_get_best_with_type; ///
  GdkVisual* function() c_gdk_visual_get_system; ///
  int function(GdkVisual* visual) c_gdk_visual_get_bits_per_rgb; ///
  void function(GdkVisual* visual, uint* mask, int* shift, int* precision) c_gdk_visual_get_blue_pixel_details; ///
  GdkByteOrder function(GdkVisual* visual) c_gdk_visual_get_byte_order; ///
  int function(GdkVisual* visual) c_gdk_visual_get_colormap_size; ///
  int function(GdkVisual* visual) c_gdk_visual_get_depth; ///
  void function(GdkVisual* visual, uint* mask, int* shift, int* precision) c_gdk_visual_get_green_pixel_details; ///
  void function(GdkVisual* visual, uint* mask, int* shift, int* precision) c_gdk_visual_get_red_pixel_details; ///
  GdkScreen* function(GdkVisual* visual) c_gdk_visual_get_screen; ///
  GdkVisualType function(GdkVisual* visual) c_gdk_visual_get_visual_type; ///

  // Window
  GType function() c_gdk_window_get_type; ///
  GdkWindow* function(GdkWindow* parent, GdkWindowAttr* attributes, int attributesMask) c_gdk_window_new; ///
  GdkWindow* function(int* winX, int* winY) c_gdk_window_at_pointer; ///
  void function(GdkGeometry* geometry, GdkWindowHints flags, int width, int height, int* newWidth, int* newHeight) c_gdk_window_constrain_size; ///
  void function() c_gdk_window_process_all_updates; ///
  void function(gboolean setting) c_gdk_window_set_debug_updates; ///
  void function(GdkWindow* window, GdkFilterFunc function_, void* data) c_gdk_window_add_filter; ///
  void function(GdkWindow* window) c_gdk_window_beep; ///
  GdkDrawingContext* function(GdkWindow* window, const(cairo_region_t)* region) c_gdk_window_begin_draw_frame; ///
  void function(GdkWindow* window, int button, int rootX, int rootY, uint timestamp) c_gdk_window_begin_move_drag; ///
  void function(GdkWindow* window, GdkDevice* device, int button, int rootX, int rootY, uint timestamp) c_gdk_window_begin_move_drag_for_device; ///
  void function(GdkWindow* window, const(GdkRectangle)* rectangle) c_gdk_window_begin_paint_rect; ///
  void function(GdkWindow* window, const(cairo_region_t)* region) c_gdk_window_begin_paint_region; ///
  void function(GdkWindow* window, GdkWindowEdge edge, int button, int rootX, int rootY, uint timestamp) c_gdk_window_begin_resize_drag; ///
  void function(GdkWindow* window, GdkWindowEdge edge, GdkDevice* device, int button, int rootX, int rootY, uint timestamp) c_gdk_window_begin_resize_drag_for_device; ///
  void function(GdkWindow* window) c_gdk_window_configure_finished; ///
  void function(GdkWindow* window, double parentX, double parentY, double* x, double* y) c_gdk_window_coords_from_parent; ///
  void function(GdkWindow* window, double x, double y, double* parentX, double* parentY) c_gdk_window_coords_to_parent; ///
  GdkGLContext* function(GdkWindow* window, GError** _err) c_gdk_window_create_gl_context; ///
  cairo_surface_t* function(GdkWindow* window, cairo_format_t format, int width, int height, int scale) c_gdk_window_create_similar_image_surface; ///
  cairo_surface_t* function(GdkWindow* window, cairo_content_t content, int width, int height) c_gdk_window_create_similar_surface; ///
  void function(GdkWindow* window) c_gdk_window_deiconify; ///
  void function(GdkWindow* window) c_gdk_window_destroy; ///
  void function(GdkWindow* window) c_gdk_window_destroy_notify; ///
  void function(GdkWindow* window) c_gdk_window_enable_synchronized_configure; ///
  void function(GdkWindow* window, GdkDrawingContext* context) c_gdk_window_end_draw_frame; ///
  void function(GdkWindow* window) c_gdk_window_end_paint; ///
  gboolean function(GdkWindow* window) c_gdk_window_ensure_native; ///
  void function(GdkWindow* window) c_gdk_window_flush; ///
  void function(GdkWindow* window, uint timestamp) c_gdk_window_focus; ///
  void function(GdkWindow* window) c_gdk_window_freeze_toplevel_updates_libgtk_only; ///
  void function(GdkWindow* window) c_gdk_window_freeze_updates; ///
  void function(GdkWindow* window) c_gdk_window_fullscreen; ///
  void function(GdkWindow* window, int monitor) c_gdk_window_fullscreen_on_monitor; ///
  void function(GdkWindow* window) c_gdk_window_geometry_changed; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_accept_focus; ///
  cairo_pattern_t* function(GdkWindow* window) c_gdk_window_get_background_pattern; ///
  GList* function(GdkWindow* window) c_gdk_window_get_children; ///
  GList* function(GdkWindow* window, void* userData) c_gdk_window_get_children_with_user_data; ///
  cairo_region_t* function(GdkWindow* window) c_gdk_window_get_clip_region; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_composited; ///
  GdkCursor* function(GdkWindow* window) c_gdk_window_get_cursor; ///
  gboolean function(GdkWindow* window, GdkWMDecoration* decorations) c_gdk_window_get_decorations; ///
  GdkCursor* function(GdkWindow* window, GdkDevice* device) c_gdk_window_get_device_cursor; ///
  GdkEventMask function(GdkWindow* window, GdkDevice* device) c_gdk_window_get_device_events; ///
  GdkWindow* function(GdkWindow* window, GdkDevice* device, int* x, int* y, GdkModifierType* mask) c_gdk_window_get_device_position; ///
  GdkWindow* function(GdkWindow* window, GdkDevice* device, double* x, double* y, GdkModifierType* mask) c_gdk_window_get_device_position_double; ///
  GdkDisplay* function(GdkWindow* window) c_gdk_window_get_display; ///
  GdkDragProtocol function(GdkWindow* window, GdkWindow** target) c_gdk_window_get_drag_protocol; ///
  GdkWindow* function(GdkWindow* window) c_gdk_window_get_effective_parent; ///
  GdkWindow* function(GdkWindow* window) c_gdk_window_get_effective_toplevel; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_event_compression; ///
  GdkEventMask function(GdkWindow* window) c_gdk_window_get_events; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_focus_on_map; ///
  GdkFrameClock* function(GdkWindow* window) c_gdk_window_get_frame_clock; ///
  void function(GdkWindow* window, GdkRectangle* rect) c_gdk_window_get_frame_extents; ///
  GdkFullscreenMode function(GdkWindow* window) c_gdk_window_get_fullscreen_mode; ///
  void function(GdkWindow* window, int* x, int* y, int* width, int* height) c_gdk_window_get_geometry; ///
  GdkWindow* function(GdkWindow* window) c_gdk_window_get_group; ///
  int function(GdkWindow* window) c_gdk_window_get_height; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_modal_hint; ///
  int function(GdkWindow* window, int* x, int* y) c_gdk_window_get_origin; ///
  GdkWindow* function(GdkWindow* window) c_gdk_window_get_parent; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_pass_through; ///
  GdkWindow* function(GdkWindow* window, int* x, int* y, GdkModifierType* mask) c_gdk_window_get_pointer; ///
  void function(GdkWindow* window, int* x, int* y) c_gdk_window_get_position; ///
  void function(GdkWindow* window, int x, int y, int* rootX, int* rootY) c_gdk_window_get_root_coords; ///
  void function(GdkWindow* window, int* x, int* y) c_gdk_window_get_root_origin; ///
  int function(GdkWindow* window) c_gdk_window_get_scale_factor; ///
  GdkScreen* function(GdkWindow* window) c_gdk_window_get_screen; ///
  GdkEventMask function(GdkWindow* window, GdkInputSource source) c_gdk_window_get_source_events; ///
  GdkWindowState function(GdkWindow* window) c_gdk_window_get_state; ///
  gboolean function(GdkWindow* window) c_gdk_window_get_support_multidevice; ///
  GdkWindow* function(GdkWindow* window) c_gdk_window_get_toplevel; ///
  GdkWindowTypeHint function(GdkWindow* window) c_gdk_window_get_type_hint; ///
  cairo_region_t* function(GdkWindow* window) c_gdk_window_get_update_area; ///
  void function(GdkWindow* window, void** data) c_gdk_window_get_user_data; ///
  cairo_region_t* function(GdkWindow* window) c_gdk_window_get_visible_region; ///
  GdkVisual* function(GdkWindow* window) c_gdk_window_get_visual; ///
  int function(GdkWindow* window) c_gdk_window_get_width; ///
  GdkWindowType function(GdkWindow* window) c_gdk_window_get_window_type; ///
  gboolean function(GdkWindow* window) c_gdk_window_has_native; ///
  void function(GdkWindow* window) c_gdk_window_hide; ///
  void function(GdkWindow* window) c_gdk_window_iconify; ///
  void function(GdkWindow* window, const(cairo_region_t)* shapeRegion, int offsetX, int offsetY) c_gdk_window_input_shape_combine_region; ///
  void function(GdkWindow* window, const(cairo_region_t)* region, GdkWindowChildFunc childFunc, void* userData) c_gdk_window_invalidate_maybe_recurse; ///
  void function(GdkWindow* window, const(GdkRectangle)* rect, gboolean invalidateChildren) c_gdk_window_invalidate_rect; ///
  void function(GdkWindow* window, const(cairo_region_t)* region, gboolean invalidateChildren) c_gdk_window_invalidate_region; ///
  gboolean function(GdkWindow* window) c_gdk_window_is_destroyed; ///
  gboolean function(GdkWindow* window) c_gdk_window_is_input_only; ///
  gboolean function(GdkWindow* window) c_gdk_window_is_shaped; ///
  gboolean function(GdkWindow* window) c_gdk_window_is_viewable; ///
  gboolean function(GdkWindow* window) c_gdk_window_is_visible; ///
  void function(GdkWindow* window) c_gdk_window_lower; ///
  void function(GdkWindow* window, cairo_t* cr) c_gdk_window_mark_paint_from_clip; ///
  void function(GdkWindow* window) c_gdk_window_maximize; ///
  void function(GdkWindow* window) c_gdk_window_merge_child_input_shapes; ///
  void function(GdkWindow* window) c_gdk_window_merge_child_shapes; ///
  void function(GdkWindow* window, int x, int y) c_gdk_window_move; ///
  void function(GdkWindow* window, const(cairo_region_t)* region, int dx, int dy) c_gdk_window_move_region; ///
  void function(GdkWindow* window, int x, int y, int width, int height) c_gdk_window_move_resize; ///
  void function(GdkWindow* window, const(GdkRectangle)* rect, GdkGravity rectAnchor, GdkGravity windowAnchor, GdkAnchorHints anchorHints, int rectAnchorDx, int rectAnchorDy) c_gdk_window_move_to_rect; ///
  GList* function(GdkWindow* window) c_gdk_window_peek_children; ///
  void function(GdkWindow* window, gboolean updateChildren) c_gdk_window_process_updates; ///
  void function(GdkWindow* window) c_gdk_window_raise; ///
  void function(GdkWindow* window) c_gdk_window_register_dnd; ///
  void function(GdkWindow* window, GdkFilterFunc function_, void* data) c_gdk_window_remove_filter; ///
  void function(GdkWindow* window, GdkWindow* newParent, int x, int y) c_gdk_window_reparent; ///
  void function(GdkWindow* window, int width, int height) c_gdk_window_resize; ///
  void function(GdkWindow* window, GdkWindow* sibling, gboolean above) c_gdk_window_restack; ///
  void function(GdkWindow* window, int dx, int dy) c_gdk_window_scroll; ///
  void function(GdkWindow* window, gboolean acceptFocus) c_gdk_window_set_accept_focus; ///
  void function(GdkWindow* window, const(GdkColor)* color) c_gdk_window_set_background; ///
  void function(GdkWindow* window, cairo_pattern_t* pattern) c_gdk_window_set_background_pattern; ///
  void function(GdkWindow* window, const(GdkRGBA)* rgba) c_gdk_window_set_background_rgba; ///
  void function(GdkWindow* window) c_gdk_window_set_child_input_shapes; ///
  void function(GdkWindow* window) c_gdk_window_set_child_shapes; ///
  void function(GdkWindow* window, gboolean composited) c_gdk_window_set_composited; ///
  void function(GdkWindow* window, GdkCursor* cursor) c_gdk_window_set_cursor; ///
  void function(GdkWindow* window, GdkWMDecoration decorations) c_gdk_window_set_decorations; ///
  void function(GdkWindow* window, GdkDevice* device, GdkCursor* cursor) c_gdk_window_set_device_cursor; ///
  void function(GdkWindow* window, GdkDevice* device, GdkEventMask eventMask) c_gdk_window_set_device_events; ///
  void function(GdkWindow* window, gboolean eventCompression) c_gdk_window_set_event_compression; ///
  void function(GdkWindow* window, GdkEventMask eventMask) c_gdk_window_set_events; ///
  void function(GdkWindow* window, gboolean focusOnMap) c_gdk_window_set_focus_on_map; ///
  void function(GdkWindow* window, GdkFullscreenMode mode) c_gdk_window_set_fullscreen_mode; ///
  void function(GdkWindow* window, GdkWMFunction functions) c_gdk_window_set_functions; ///
  void function(GdkWindow* window, const(GdkGeometry)* geometry, GdkWindowHints geomMask) c_gdk_window_set_geometry_hints; ///
  void function(GdkWindow* window, GdkWindow* leader) c_gdk_window_set_group; ///
  void function(GdkWindow* window, GList* pixbufs) c_gdk_window_set_icon_list; ///
  void function(GdkWindow* window, const(char)* name) c_gdk_window_set_icon_name; ///
  void function(GdkWindow* window, GdkWindowInvalidateHandlerFunc handler) c_gdk_window_set_invalidate_handler; ///
  void function(GdkWindow* window, gboolean setting) c_gdk_window_set_keep_above; ///
  void function(GdkWindow* window, gboolean setting) c_gdk_window_set_keep_below; ///
  void function(GdkWindow* window, gboolean modal) c_gdk_window_set_modal_hint; ///
  void function(GdkWindow* window, double opacity) c_gdk_window_set_opacity; ///
  void function(GdkWindow* window, cairo_region_t* region) c_gdk_window_set_opaque_region; ///
  void function(GdkWindow* window, gboolean overrideRedirect) c_gdk_window_set_override_redirect; ///
  void function(GdkWindow* window, gboolean passThrough) c_gdk_window_set_pass_through; ///
  void function(GdkWindow* window, const(char)* role) c_gdk_window_set_role; ///
  void function(GdkWindow* window, int left, int right, int top, int bottom) c_gdk_window_set_shadow_width; ///
  void function(GdkWindow* window, gboolean skipsPager) c_gdk_window_set_skip_pager_hint; ///
  void function(GdkWindow* window, gboolean skipsTaskbar) c_gdk_window_set_skip_taskbar_hint; ///
  void function(GdkWindow* window, GdkInputSource source, GdkEventMask eventMask) c_gdk_window_set_source_events; ///
  void function(GdkWindow* window, const(char)* startupId) c_gdk_window_set_startup_id; ///
  gboolean function(GdkWindow* window, gboolean useStatic) c_gdk_window_set_static_gravities; ///
  void function(GdkWindow* window, gboolean supportMultidevice) c_gdk_window_set_support_multidevice; ///
  void function(GdkWindow* window, const(char)* title) c_gdk_window_set_title; ///
  void function(GdkWindow* window, GdkWindow* parent) c_gdk_window_set_transient_for; ///
  void function(GdkWindow* window, GdkWindowTypeHint hint) c_gdk_window_set_type_hint; ///
  void function(GdkWindow* window, gboolean urgent) c_gdk_window_set_urgency_hint; ///
  void function(GdkWindow* window, GObject* userData) c_gdk_window_set_user_data; ///
  void function(GdkWindow* window, const(cairo_region_t)* shapeRegion, int offsetX, int offsetY) c_gdk_window_shape_combine_region; ///
  void function(GdkWindow* window) c_gdk_window_show; ///
  void function(GdkWindow* window) c_gdk_window_show_unraised; ///
  gboolean function(GdkWindow* window, GdkEvent* event) c_gdk_window_show_window_menu; ///
  void function(GdkWindow* window) c_gdk_window_stick; ///
  void function(GdkWindow* window) c_gdk_window_thaw_toplevel_updates_libgtk_only; ///
  void function(GdkWindow* window) c_gdk_window_thaw_updates; ///
  void function(GdkWindow* window) c_gdk_window_unfullscreen; ///
  void function(GdkWindow* window) c_gdk_window_unmaximize; ///
  void function(GdkWindow* window) c_gdk_window_unstick; ///
  void function(GdkWindow* window) c_gdk_window_withdraw; ///

  // global
  void function(GOptionGroup* group) c_gdk_add_option_entries_libgtk_only; ///
  void function() c_gdk_beep; ///
  cairo_t* function(GdkWindow* window) c_gdk_cairo_create; ///
  void function(cairo_t* cr, GdkWindow* window, int source, int sourceType, int bufferScale, int x, int y, int width, int height) c_gdk_cairo_draw_from_gl; ///
  gboolean function(cairo_t* cr, GdkRectangle* rect) c_gdk_cairo_get_clip_rectangle; ///
  GdkDrawingContext* function(cairo_t* cr) c_gdk_cairo_get_drawing_context; ///
  void function(cairo_t* cr, const(GdkRectangle)* rectangle) c_gdk_cairo_rectangle; ///
  void function(cairo_t* cr, const(cairo_region_t)* region) c_gdk_cairo_region; ///
  cairo_region_t* function(cairo_surface_t* surface) c_gdk_cairo_region_create_from_surface; ///
  void function(cairo_t* cr, const(GdkColor)* color) c_gdk_cairo_set_source_color; ///
  void function(cairo_t* cr, const(GdkPixbuf)* pixbuf, double pixbufX, double pixbufY) c_gdk_cairo_set_source_pixbuf; ///
  void function(cairo_t* cr, const(GdkRGBA)* rgba) c_gdk_cairo_set_source_rgba; ///
  void function(cairo_t* cr, GdkWindow* window, double x, double y) c_gdk_cairo_set_source_window; ///
  cairo_surface_t* function(const(GdkPixbuf)* pixbuf, int scale, GdkWindow* forWindow) c_gdk_cairo_surface_create_from_pixbuf; ///
  void function() c_gdk_disable_multidevice; ///
  void function(GdkDragContext* context, uint time) c_gdk_drag_abort; ///
  GdkDragContext* function(GdkWindow* window, GList* targets) c_gdk_drag_begin; ///
  GdkDragContext* function(GdkWindow* window, GdkDevice* device, GList* targets) c_gdk_drag_begin_for_device; ///
  GdkDragContext* function(GdkWindow* window, GdkDevice* device, GList* targets, int xRoot, int yRoot) c_gdk_drag_begin_from_point; ///
  void function(GdkDragContext* context, uint time) c_gdk_drag_drop; ///
  void function(GdkDragContext* context, gboolean success) c_gdk_drag_drop_done; ///
  gboolean function(GdkDragContext* context) c_gdk_drag_drop_succeeded; ///
  void function(GdkDragContext* context, GdkWindow* dragWindow, GdkScreen* screen, int xRoot, int yRoot, GdkWindow** destWindow, GdkDragProtocol* protocol) c_gdk_drag_find_window_for_screen; ///
  GdkAtom function(GdkDragContext* context) c_gdk_drag_get_selection; ///
  gboolean function(GdkDragContext* context, GdkWindow* destWindow, GdkDragProtocol protocol, int xRoot, int yRoot, GdkDragAction suggestedAction, GdkDragAction possibleActions, uint time) c_gdk_drag_motion; ///
  void function(GdkDragContext* context, GdkDragAction action, uint time) c_gdk_drag_status; ///
  void function(GdkDragContext* context, gboolean success, uint time) c_gdk_drop_finish; ///
  void function(GdkDragContext* context, gboolean accepted, uint time) c_gdk_drop_reply; ///
  int function() c_gdk_error_trap_pop; ///
  void function() c_gdk_error_trap_pop_ignored; ///
  void function() c_gdk_error_trap_push; ///
  gboolean function(GdkEvent* event1, GdkEvent* event2, double* angle) c_gdk_events_get_angle; ///
  gboolean function(GdkEvent* event1, GdkEvent* event2, double* x, double* y) c_gdk_events_get_center; ///
  gboolean function(GdkEvent* event1, GdkEvent* event2, double* distance) c_gdk_events_get_distance; ///
  gboolean function() c_gdk_events_pending; ///
  void function() c_gdk_flush; ///
  GdkWindow* function() c_gdk_get_default_root_window; ///
  char* function() c_gdk_get_display; ///
  const(char)* function() c_gdk_get_display_arg_name; ///
  const(char)* function() c_gdk_get_program_class; ///
  gboolean function() c_gdk_get_show_events; ///
  void function(int* argc, char*** argv) c_gdk_init; ///
  gboolean function(int* argc, char*** argv) c_gdk_init_check; ///
  GdkGrabStatus function(GdkWindow* window, gboolean ownerEvents, uint time) c_gdk_keyboard_grab; ///
  void function(uint time) c_gdk_keyboard_ungrab; ///
  void function(uint symbol, uint* lower, uint* upper) c_gdk_keyval_convert_case; ///
  uint function(const(char)* keyvalName) c_gdk_keyval_from_name; ///
  gboolean function(uint keyval) c_gdk_keyval_is_lower; ///
  gboolean function(uint keyval) c_gdk_keyval_is_upper; ///
  char* function(uint keyval) c_gdk_keyval_name; ///
  uint function(uint keyval) c_gdk_keyval_to_lower; ///
  uint function(uint keyval) c_gdk_keyval_to_unicode; ///
  uint function(uint keyval) c_gdk_keyval_to_upper; ///
  GList* function() c_gdk_list_visuals; ///
  void function() c_gdk_notify_startup_complete; ///
  void function(const(char)* startupId) c_gdk_notify_startup_complete_with_id; ///
  GdkWindow* function(GdkWindow* window) c_gdk_offscreen_window_get_embedder; ///
  cairo_surface_t* function(GdkWindow* window) c_gdk_offscreen_window_get_surface; ///
  void function(GdkWindow* window, GdkWindow* embedder) c_gdk_offscreen_window_set_embedder; ///
  PangoContext* function() c_gdk_pango_context_get; ///
  PangoContext* function(GdkDisplay* display) c_gdk_pango_context_get_for_display; ///
  PangoContext* function(GdkScreen* screen) c_gdk_pango_context_get_for_screen; ///
  cairo_region_t* function(PangoLayout* layout, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) c_gdk_pango_layout_get_clip_region; ///
  cairo_region_t* function(PangoLayoutLine* line, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) c_gdk_pango_layout_line_get_clip_region; ///
  void function(int* argc, char*** argv) c_gdk_parse_args; ///
  GdkPixbuf* function(cairo_surface_t* surface, int srcX, int srcY, int width, int height) c_gdk_pixbuf_get_from_surface; ///
  GdkPixbuf* function(GdkWindow* window, int srcX, int srcY, int width, int height) c_gdk_pixbuf_get_from_window; ///
  GdkGrabStatus function(GdkWindow* window, gboolean ownerEvents, GdkEventMask eventMask, GdkWindow* confineTo, GdkCursor* cursor, uint time) c_gdk_pointer_grab; ///
  gboolean function() c_gdk_pointer_is_grabbed; ///
  void function(uint time) c_gdk_pointer_ungrab; ///
  void function() c_gdk_pre_parse_libgtk_only; ///
  void function(GdkWindow* window, GdkAtom property, GdkAtom type, int format, GdkPropMode mode, const(ubyte)* data, int nelements) c_gdk_property_change; ///
  void function(GdkWindow* window, GdkAtom property) c_gdk_property_delete; ///
  gboolean function(GdkWindow* window, GdkAtom property, GdkAtom type, gulong offset, gulong length, int pdelete, GdkAtom* actualPropertyType, int* actualFormat, int* actualLength, ubyte** data) c_gdk_property_get; ///
  void function(int** depths, int* count) c_gdk_query_depths; ///
  void function(GdkVisualType** visualTypes, int* count) c_gdk_query_visual_types; ///
  void function(GdkWindow* requestor, GdkAtom selection, GdkAtom target, uint time) c_gdk_selection_convert; ///
  GdkWindow* function(GdkAtom selection) c_gdk_selection_owner_get; ///
  GdkWindow* function(GdkDisplay* display, GdkAtom selection) c_gdk_selection_owner_get_for_display; ///
  gboolean function(GdkWindow* owner, GdkAtom selection, uint time, gboolean sendEvent) c_gdk_selection_owner_set; ///
  gboolean function(GdkDisplay* display, GdkWindow* owner, GdkAtom selection, uint time, gboolean sendEvent) c_gdk_selection_owner_set_for_display; ///
  int function(GdkWindow* requestor, ubyte** data, GdkAtom* propType, int* propFormat) c_gdk_selection_property_get; ///
  void function(GdkWindow* requestor, GdkAtom selection, GdkAtom target, GdkAtom property, uint time) c_gdk_selection_send_notify; ///
  void function(GdkDisplay* display, GdkWindow* requestor, GdkAtom selection, GdkAtom target, GdkAtom property, uint time) c_gdk_selection_send_notify_for_display; ///
  void function(const(char)* backends) c_gdk_set_allowed_backends; ///
  void function(uint msec) c_gdk_set_double_click_time; ///
  void function(const(char)* programClass) c_gdk_set_program_class; ///
  void function(gboolean showEvents) c_gdk_set_show_events; ///
  gboolean function(const(char)* name, GValue* value) c_gdk_setting_get; ///
  void function(GdkWindow* window, GdkWindowState unsetFlags, GdkWindowState setFlags) c_gdk_synthesize_window_state; ///
  void function(GdkWindow* window) c_gdk_test_render_sync; ///
  gboolean function(GdkWindow* window, int x, int y, uint button, GdkModifierType modifiers, GdkEventType buttonPressrelease) c_gdk_test_simulate_button; ///
  gboolean function(GdkWindow* window, int x, int y, uint keyval, GdkModifierType modifiers, GdkEventType keyPressrelease) c_gdk_test_simulate_key; ///
  int function(GdkDisplay* display, GdkAtom encoding, int format, const(ubyte)* text, int length, char*** list) c_gdk_text_property_to_utf8_list_for_display; ///
  uint function(GSourceFunc function_, void* data) c_gdk_threads_add_idle; ///
  uint function(int priority, GSourceFunc function_, void* data, GDestroyNotify notify) c_gdk_threads_add_idle_full; ///
  uint function(uint interval, GSourceFunc function_, void* data) c_gdk_threads_add_timeout; ///
  uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) c_gdk_threads_add_timeout_full; ///
  uint function(uint interval, GSourceFunc function_, void* data) c_gdk_threads_add_timeout_seconds; ///
  uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) c_gdk_threads_add_timeout_seconds_full; ///
  void function() c_gdk_threads_enter; ///
  void function() c_gdk_threads_init; ///
  void function() c_gdk_threads_leave; ///
  void function(GCallback enterFn, GCallback leaveFn) c_gdk_threads_set_lock_functions; ///
  uint function(uint wc) c_gdk_unicode_to_keyval; ///
  char* function(const(char)* str) c_gdk_utf8_to_string_target; ///

  // GLError
  GQuark function() c_gdk_gl_error_quark; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
