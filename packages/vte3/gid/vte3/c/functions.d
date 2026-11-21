/// C functions for vte3 library
module gid.vte3.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.vte3.c.types;
public import gid.cairo1.c.types;
public import gid.gdk4.c.types;
public import gid.graphene1.c.types;
public import gid.gsk4.c.types;
public import gid.gtk4.c.types;
public import gid.pango1.c.types;

private immutable LIBS = ["vte-2.91-gtk4_0"];

// EventContext
private alias c_vte_event_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_vte_event_context_get_typeFn c_vte_event_context_get_type; ///
private alias c_vte_event_context_get_coordinatesFn = extern(C) gboolean function(const(VteEventContext)* context, double* x, double* y) nothrow;
__gshared c_vte_event_context_get_coordinatesFn c_vte_event_context_get_coordinates; ///

// Pty
private alias c_vte_pty_get_typeFn = extern(C) GType function() nothrow;
__gshared c_vte_pty_get_typeFn c_vte_pty_get_type; ///
private alias c_vte_pty_new_foreign_syncFn = extern(C) VtePty* function(int fd, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_vte_pty_new_foreign_syncFn c_vte_pty_new_foreign_sync; ///
private alias c_vte_pty_new_syncFn = extern(C) VtePty* function(VtePtyFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_vte_pty_new_syncFn c_vte_pty_new_sync; ///
private alias c_vte_pty_child_setupFn = extern(C) void function(VtePty* pty) nothrow;
__gshared c_vte_pty_child_setupFn c_vte_pty_child_setup; ///
private alias c_vte_pty_closeFn = extern(C) void function(VtePty* pty) nothrow;
__gshared c_vte_pty_closeFn c_vte_pty_close; ///
private alias c_vte_pty_get_fdFn = extern(C) int function(VtePty* pty) nothrow;
__gshared c_vte_pty_get_fdFn c_vte_pty_get_fd; ///
private alias c_vte_pty_get_sizeFn = extern(C) gboolean function(VtePty* pty, int* rows, int* columns, GError** _err) nothrow;
__gshared c_vte_pty_get_sizeFn c_vte_pty_get_size; ///
private alias c_vte_pty_set_sizeFn = extern(C) gboolean function(VtePty* pty, int rows, int columns, GError** _err) nothrow;
__gshared c_vte_pty_set_sizeFn c_vte_pty_set_size; ///
private alias c_vte_pty_set_utf8Fn = extern(C) gboolean function(VtePty* pty, gboolean utf8, GError** _err) nothrow;
__gshared c_vte_pty_set_utf8Fn c_vte_pty_set_utf8; ///
private alias c_vte_pty_spawn_asyncFn = extern(C) void function(VtePty* pty, const(char)* workingDirectory, char** argv, char** envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_vte_pty_spawn_asyncFn c_vte_pty_spawn_async; ///
private alias c_vte_pty_spawn_finishFn = extern(C) gboolean function(VtePty* pty, GAsyncResult* result, GPid* childPid, GError** _err) nothrow;
__gshared c_vte_pty_spawn_finishFn c_vte_pty_spawn_finish; ///
private alias c_vte_pty_spawn_with_fds_asyncFn = extern(C) void function(VtePty* pty, const(char)* workingDirectory, const(char*)* argv, const(char*)* envv, const(int)* fds, int nFds, const(int)* mapFds, int nMapFds, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_vte_pty_spawn_with_fds_asyncFn c_vte_pty_spawn_with_fds_async; ///

// Regex
private alias c_vte_regex_get_typeFn = extern(C) GType function() nothrow;
__gshared c_vte_regex_get_typeFn c_vte_regex_get_type; ///
private alias c_vte_regex_new_for_matchFn = extern(C) VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, GError** _err) nothrow;
__gshared c_vte_regex_new_for_matchFn c_vte_regex_new_for_match; ///
private alias c_vte_regex_new_for_match_fullFn = extern(C) VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, uint extraFlags, size_t* errorOffset, GError** _err) nothrow;
__gshared c_vte_regex_new_for_match_fullFn c_vte_regex_new_for_match_full; ///
private alias c_vte_regex_new_for_searchFn = extern(C) VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, GError** _err) nothrow;
__gshared c_vte_regex_new_for_searchFn c_vte_regex_new_for_search; ///
private alias c_vte_regex_new_for_search_fullFn = extern(C) VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, uint extraFlags, size_t* errorOffset, GError** _err) nothrow;
__gshared c_vte_regex_new_for_search_fullFn c_vte_regex_new_for_search_full; ///
private alias c_vte_regex_jitFn = extern(C) gboolean function(VteRegex* regex, uint flags, GError** _err) nothrow;
__gshared c_vte_regex_jitFn c_vte_regex_jit; ///
private alias c_vte_regex_refFn = extern(C) VteRegex* function(VteRegex* regex) nothrow;
__gshared c_vte_regex_refFn c_vte_regex_ref; ///
private alias c_vte_regex_substituteFn = extern(C) char* function(VteRegex* regex, const(char)* subject, const(char)* replacement, uint flags, GError** _err) nothrow;
__gshared c_vte_regex_substituteFn c_vte_regex_substitute; ///
private alias c_vte_regex_unrefFn = extern(C) VteRegex* function(VteRegex* regex) nothrow;
__gshared c_vte_regex_unrefFn c_vte_regex_unref; ///

// Terminal
private alias c_vte_terminal_get_typeFn = extern(C) GType function() nothrow;
__gshared c_vte_terminal_get_typeFn c_vte_terminal_get_type; ///
private alias c_vte_terminal_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_vte_terminal_newFn c_vte_terminal_new; ///
private alias c_vte_terminal_check_hyperlink_atFn = extern(C) char* function(VteTerminal* terminal, double x, double y) nothrow;
__gshared c_vte_terminal_check_hyperlink_atFn c_vte_terminal_check_hyperlink_at; ///
private alias c_vte_terminal_check_match_atFn = extern(C) char* function(VteTerminal* terminal, double x, double y, int* tag) nothrow;
__gshared c_vte_terminal_check_match_atFn c_vte_terminal_check_match_at; ///
private alias c_vte_terminal_check_regex_array_atFn = extern(C) char** function(VteTerminal* terminal, double x, double y, VteRegex** regexes, size_t nRegexes, uint matchFlags, size_t* nMatches) nothrow;
__gshared c_vte_terminal_check_regex_array_atFn c_vte_terminal_check_regex_array_at; ///
private alias c_vte_terminal_check_regex_simple_atFn = extern(C) gboolean function(VteTerminal* terminal, double x, double y, VteRegex** regexes, size_t nRegexes, uint matchFlags, char** matches) nothrow;
__gshared c_vte_terminal_check_regex_simple_atFn c_vte_terminal_check_regex_simple_at; ///
private alias c_vte_terminal_copy_clipboardFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_copy_clipboardFn c_vte_terminal_copy_clipboard; ///
private alias c_vte_terminal_copy_clipboard_formatFn = extern(C) void function(VteTerminal* terminal, VteFormat format) nothrow;
__gshared c_vte_terminal_copy_clipboard_formatFn c_vte_terminal_copy_clipboard_format; ///
private alias c_vte_terminal_copy_primaryFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_copy_primaryFn c_vte_terminal_copy_primary; ///
private alias c_vte_terminal_dup_termprop_stringFn = extern(C) char* function(VteTerminal* terminal, const(char)* prop, size_t* size) nothrow;
__gshared c_vte_terminal_dup_termprop_stringFn c_vte_terminal_dup_termprop_string; ///
private alias c_vte_terminal_dup_termprop_string_by_idFn = extern(C) char* function(VteTerminal* terminal, int prop, size_t* size) nothrow;
__gshared c_vte_terminal_dup_termprop_string_by_idFn c_vte_terminal_dup_termprop_string_by_id; ///
private alias c_vte_terminal_dup_termprop_uuidFn = extern(C) VteUuid* function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_dup_termprop_uuidFn c_vte_terminal_dup_termprop_uuid; ///
private alias c_vte_terminal_dup_termprop_uuid_by_idFn = extern(C) VteUuid* function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_dup_termprop_uuid_by_idFn c_vte_terminal_dup_termprop_uuid_by_id; ///
private alias c_vte_terminal_feedFn = extern(C) void function(VteTerminal* terminal, const(ubyte)* data, ptrdiff_t length) nothrow;
__gshared c_vte_terminal_feedFn c_vte_terminal_feed; ///
private alias c_vte_terminal_feed_childFn = extern(C) void function(VteTerminal* terminal, const(ubyte)* text, ptrdiff_t length) nothrow;
__gshared c_vte_terminal_feed_childFn c_vte_terminal_feed_child; ///
private alias c_vte_terminal_feed_child_binaryFn = extern(C) void function(VteTerminal* terminal, const(ubyte)* data, size_t length) nothrow;
__gshared c_vte_terminal_feed_child_binaryFn c_vte_terminal_feed_child_binary; ///
private alias c_vte_terminal_get_allow_boldFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_allow_boldFn c_vte_terminal_get_allow_bold; ///
private alias c_vte_terminal_get_allow_hyperlinkFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_allow_hyperlinkFn c_vte_terminal_get_allow_hyperlink; ///
private alias c_vte_terminal_get_audible_bellFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_audible_bellFn c_vte_terminal_get_audible_bell; ///
private alias c_vte_terminal_get_bold_is_brightFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_bold_is_brightFn c_vte_terminal_get_bold_is_bright; ///
private alias c_vte_terminal_get_cell_height_scaleFn = extern(C) double function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_cell_height_scaleFn c_vte_terminal_get_cell_height_scale; ///
private alias c_vte_terminal_get_cell_width_scaleFn = extern(C) double function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_cell_width_scaleFn c_vte_terminal_get_cell_width_scale; ///
private alias c_vte_terminal_get_char_heightFn = extern(C) glong function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_char_heightFn c_vte_terminal_get_char_height; ///
private alias c_vte_terminal_get_char_widthFn = extern(C) glong function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_char_widthFn c_vte_terminal_get_char_width; ///
private alias c_vte_terminal_get_cjk_ambiguous_widthFn = extern(C) int function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_cjk_ambiguous_widthFn c_vte_terminal_get_cjk_ambiguous_width; ///
private alias c_vte_terminal_get_color_background_for_drawFn = extern(C) void function(VteTerminal* terminal, GdkRGBA* color) nothrow;
__gshared c_vte_terminal_get_color_background_for_drawFn c_vte_terminal_get_color_background_for_draw; ///
private alias c_vte_terminal_get_column_countFn = extern(C) glong function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_column_countFn c_vte_terminal_get_column_count; ///
private alias c_vte_terminal_get_context_menuFn = extern(C) GtkWidget* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_context_menuFn c_vte_terminal_get_context_menu; ///
private alias c_vte_terminal_get_context_menu_modelFn = extern(C) GMenuModel* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_context_menu_modelFn c_vte_terminal_get_context_menu_model; ///
private alias c_vte_terminal_get_current_directory_uriFn = extern(C) const(char)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_current_directory_uriFn c_vte_terminal_get_current_directory_uri; ///
private alias c_vte_terminal_get_current_file_uriFn = extern(C) const(char)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_current_file_uriFn c_vte_terminal_get_current_file_uri; ///
private alias c_vte_terminal_get_cursor_blink_modeFn = extern(C) VteCursorBlinkMode function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_cursor_blink_modeFn c_vte_terminal_get_cursor_blink_mode; ///
private alias c_vte_terminal_get_cursor_positionFn = extern(C) void function(VteTerminal* terminal, glong* column, glong* row) nothrow;
__gshared c_vte_terminal_get_cursor_positionFn c_vte_terminal_get_cursor_position; ///
private alias c_vte_terminal_get_cursor_shapeFn = extern(C) VteCursorShape function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_cursor_shapeFn c_vte_terminal_get_cursor_shape; ///
private alias c_vte_terminal_get_enable_a11yFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_enable_a11yFn c_vte_terminal_get_enable_a11y; ///
private alias c_vte_terminal_get_enable_bidiFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_enable_bidiFn c_vte_terminal_get_enable_bidi; ///
private alias c_vte_terminal_get_enable_fallback_scrollingFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_enable_fallback_scrollingFn c_vte_terminal_get_enable_fallback_scrolling; ///
private alias c_vte_terminal_get_enable_legacy_osc777Fn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_enable_legacy_osc777Fn c_vte_terminal_get_enable_legacy_osc777; ///
private alias c_vte_terminal_get_enable_shapingFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_enable_shapingFn c_vte_terminal_get_enable_shaping; ///
private alias c_vte_terminal_get_enable_sixelFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_enable_sixelFn c_vte_terminal_get_enable_sixel; ///
private alias c_vte_terminal_get_encodingFn = extern(C) const(char)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_encodingFn c_vte_terminal_get_encoding; ///
private alias c_vte_terminal_get_fontFn = extern(C) const(PangoFontDescription)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_fontFn c_vte_terminal_get_font; ///
private alias c_vte_terminal_get_font_optionsFn = extern(C) const(cairo_font_options_t)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_font_optionsFn c_vte_terminal_get_font_options; ///
private alias c_vte_terminal_get_font_scaleFn = extern(C) double function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_font_scaleFn c_vte_terminal_get_font_scale; ///
private alias c_vte_terminal_get_has_selectionFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_has_selectionFn c_vte_terminal_get_has_selection; ///
private alias c_vte_terminal_get_icon_titleFn = extern(C) const(char)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_icon_titleFn c_vte_terminal_get_icon_title; ///
private alias c_vte_terminal_get_input_enabledFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_input_enabledFn c_vte_terminal_get_input_enabled; ///
private alias c_vte_terminal_get_mouse_autohideFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_mouse_autohideFn c_vte_terminal_get_mouse_autohide; ///
private alias c_vte_terminal_get_ptyFn = extern(C) VtePty* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_ptyFn c_vte_terminal_get_pty; ///
private alias c_vte_terminal_get_rewrap_on_resizeFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_rewrap_on_resizeFn c_vte_terminal_get_rewrap_on_resize; ///
private alias c_vte_terminal_get_row_countFn = extern(C) glong function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_row_countFn c_vte_terminal_get_row_count; ///
private alias c_vte_terminal_get_scroll_on_insertFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_scroll_on_insertFn c_vte_terminal_get_scroll_on_insert; ///
private alias c_vte_terminal_get_scroll_on_keystrokeFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_scroll_on_keystrokeFn c_vte_terminal_get_scroll_on_keystroke; ///
private alias c_vte_terminal_get_scroll_on_outputFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_scroll_on_outputFn c_vte_terminal_get_scroll_on_output; ///
private alias c_vte_terminal_get_scroll_unit_is_pixelsFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_scroll_unit_is_pixelsFn c_vte_terminal_get_scroll_unit_is_pixels; ///
private alias c_vte_terminal_get_scrollback_linesFn = extern(C) glong function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_scrollback_linesFn c_vte_terminal_get_scrollback_lines; ///
private alias c_vte_terminal_get_termprop_boolFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, gboolean* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_boolFn c_vte_terminal_get_termprop_bool; ///
private alias c_vte_terminal_get_termprop_bool_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, gboolean* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_bool_by_idFn c_vte_terminal_get_termprop_bool_by_id; ///
private alias c_vte_terminal_get_termprop_dataFn = extern(C) const(ubyte)* function(VteTerminal* terminal, const(char)* prop, size_t* size) nothrow;
__gshared c_vte_terminal_get_termprop_dataFn c_vte_terminal_get_termprop_data; ///
private alias c_vte_terminal_get_termprop_data_by_idFn = extern(C) const(ubyte)* function(VteTerminal* terminal, int prop, size_t* size) nothrow;
__gshared c_vte_terminal_get_termprop_data_by_idFn c_vte_terminal_get_termprop_data_by_id; ///
private alias c_vte_terminal_get_termprop_doubleFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, double* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_doubleFn c_vte_terminal_get_termprop_double; ///
private alias c_vte_terminal_get_termprop_double_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, double* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_double_by_idFn c_vte_terminal_get_termprop_double_by_id; ///
private alias c_vte_terminal_get_termprop_enumFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, GType gtype, long* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_enumFn c_vte_terminal_get_termprop_enum; ///
private alias c_vte_terminal_get_termprop_enum_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, GType gtype, long* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_enum_by_idFn c_vte_terminal_get_termprop_enum_by_id; ///
private alias c_vte_terminal_get_termprop_flagsFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, GType gtype, gboolean ignoreUnknownFlags, ulong* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_flagsFn c_vte_terminal_get_termprop_flags; ///
private alias c_vte_terminal_get_termprop_flags_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, GType gtype, gboolean ignoreUnknownFlags, ulong* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_flags_by_idFn c_vte_terminal_get_termprop_flags_by_id; ///
private alias c_vte_terminal_get_termprop_intFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, long* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_intFn c_vte_terminal_get_termprop_int; ///
private alias c_vte_terminal_get_termprop_int_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, long* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_int_by_idFn c_vte_terminal_get_termprop_int_by_id; ///
private alias c_vte_terminal_get_termprop_rgbaFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, GdkRGBA* color) nothrow;
__gshared c_vte_terminal_get_termprop_rgbaFn c_vte_terminal_get_termprop_rgba; ///
private alias c_vte_terminal_get_termprop_rgba_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, GdkRGBA* color) nothrow;
__gshared c_vte_terminal_get_termprop_rgba_by_idFn c_vte_terminal_get_termprop_rgba_by_id; ///
private alias c_vte_terminal_get_termprop_stringFn = extern(C) const(char)* function(VteTerminal* terminal, const(char)* prop, size_t* size) nothrow;
__gshared c_vte_terminal_get_termprop_stringFn c_vte_terminal_get_termprop_string; ///
private alias c_vte_terminal_get_termprop_string_by_idFn = extern(C) const(char)* function(VteTerminal* terminal, int prop, size_t* size) nothrow;
__gshared c_vte_terminal_get_termprop_string_by_idFn c_vte_terminal_get_termprop_string_by_id; ///
private alias c_vte_terminal_get_termprop_uintFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, ulong* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_uintFn c_vte_terminal_get_termprop_uint; ///
private alias c_vte_terminal_get_termprop_uint_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, ulong* valuep) nothrow;
__gshared c_vte_terminal_get_termprop_uint_by_idFn c_vte_terminal_get_termprop_uint_by_id; ///
private alias c_vte_terminal_get_termprop_valueFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* prop, GValue* gvalue) nothrow;
__gshared c_vte_terminal_get_termprop_valueFn c_vte_terminal_get_termprop_value; ///
private alias c_vte_terminal_get_termprop_value_by_idFn = extern(C) gboolean function(VteTerminal* terminal, int prop, GValue* gvalue) nothrow;
__gshared c_vte_terminal_get_termprop_value_by_idFn c_vte_terminal_get_termprop_value_by_id; ///
private alias c_vte_terminal_get_textFn = extern(C) char* function(VteTerminal* terminal, VteSelectionFunc isSelected, void* userData, GArray* attributes) nothrow;
__gshared c_vte_terminal_get_textFn c_vte_terminal_get_text; ///
private alias c_vte_terminal_get_text_blink_modeFn = extern(C) VteTextBlinkMode function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_text_blink_modeFn c_vte_terminal_get_text_blink_mode; ///
private alias c_vte_terminal_get_text_formatFn = extern(C) char* function(VteTerminal* terminal, VteFormat format) nothrow;
__gshared c_vte_terminal_get_text_formatFn c_vte_terminal_get_text_format; ///
private alias c_vte_terminal_get_text_include_trailing_spacesFn = extern(C) char* function(VteTerminal* terminal, VteSelectionFunc isSelected, void* userData, GArray* attributes) nothrow;
__gshared c_vte_terminal_get_text_include_trailing_spacesFn c_vte_terminal_get_text_include_trailing_spaces; ///
private alias c_vte_terminal_get_text_rangeFn = extern(C) char* function(VteTerminal* terminal, glong startRow, glong startCol, glong endRow, glong endCol, VteSelectionFunc isSelected, void* userData, GArray* attributes) nothrow;
__gshared c_vte_terminal_get_text_rangeFn c_vte_terminal_get_text_range; ///
private alias c_vte_terminal_get_text_range_formatFn = extern(C) char* function(VteTerminal* terminal, VteFormat format, long startRow, long startCol, long endRow, long endCol, size_t* length) nothrow;
__gshared c_vte_terminal_get_text_range_formatFn c_vte_terminal_get_text_range_format; ///
private alias c_vte_terminal_get_text_selectedFn = extern(C) char* function(VteTerminal* terminal, VteFormat format) nothrow;
__gshared c_vte_terminal_get_text_selectedFn c_vte_terminal_get_text_selected; ///
private alias c_vte_terminal_get_text_selected_fullFn = extern(C) char* function(VteTerminal* terminal, VteFormat format, size_t* length) nothrow;
__gshared c_vte_terminal_get_text_selected_fullFn c_vte_terminal_get_text_selected_full; ///
private alias c_vte_terminal_get_window_titleFn = extern(C) const(char)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_window_titleFn c_vte_terminal_get_window_title; ///
private alias c_vte_terminal_get_word_char_exceptionsFn = extern(C) const(char)* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_word_char_exceptionsFn c_vte_terminal_get_word_char_exceptions; ///
private alias c_vte_terminal_get_xalignFn = extern(C) VteAlign function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_xalignFn c_vte_terminal_get_xalign; ///
private alias c_vte_terminal_get_xfillFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_xfillFn c_vte_terminal_get_xfill; ///
private alias c_vte_terminal_get_yalignFn = extern(C) VteAlign function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_yalignFn c_vte_terminal_get_yalign; ///
private alias c_vte_terminal_get_yfillFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_get_yfillFn c_vte_terminal_get_yfill; ///
private alias c_vte_terminal_match_add_regexFn = extern(C) int function(VteTerminal* terminal, VteRegex* regex, uint flags) nothrow;
__gshared c_vte_terminal_match_add_regexFn c_vte_terminal_match_add_regex; ///
private alias c_vte_terminal_match_checkFn = extern(C) char* function(VteTerminal* terminal, glong column, glong row, int* tag) nothrow;
__gshared c_vte_terminal_match_checkFn c_vte_terminal_match_check; ///
private alias c_vte_terminal_match_removeFn = extern(C) void function(VteTerminal* terminal, int tag) nothrow;
__gshared c_vte_terminal_match_removeFn c_vte_terminal_match_remove; ///
private alias c_vte_terminal_match_remove_allFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_match_remove_allFn c_vte_terminal_match_remove_all; ///
private alias c_vte_terminal_match_set_cursorFn = extern(C) void function(VteTerminal* terminal, int tag, GdkCursor* cursor) nothrow;
__gshared c_vte_terminal_match_set_cursorFn c_vte_terminal_match_set_cursor; ///
private alias c_vte_terminal_match_set_cursor_nameFn = extern(C) void function(VteTerminal* terminal, int tag, const(char)* cursorName) nothrow;
__gshared c_vte_terminal_match_set_cursor_nameFn c_vte_terminal_match_set_cursor_name; ///
private alias c_vte_terminal_paste_clipboardFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_paste_clipboardFn c_vte_terminal_paste_clipboard; ///
private alias c_vte_terminal_paste_primaryFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_paste_primaryFn c_vte_terminal_paste_primary; ///
private alias c_vte_terminal_paste_textFn = extern(C) void function(VteTerminal* terminal, const(char)* text) nothrow;
__gshared c_vte_terminal_paste_textFn c_vte_terminal_paste_text; ///
private alias c_vte_terminal_pty_new_syncFn = extern(C) VtePty* function(VteTerminal* terminal, VtePtyFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_vte_terminal_pty_new_syncFn c_vte_terminal_pty_new_sync; ///
private alias c_vte_terminal_ref_termprop_data_bytesFn = extern(C) GBytes* function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_ref_termprop_data_bytesFn c_vte_terminal_ref_termprop_data_bytes; ///
private alias c_vte_terminal_ref_termprop_data_bytes_by_idFn = extern(C) GBytes* function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_ref_termprop_data_bytes_by_idFn c_vte_terminal_ref_termprop_data_bytes_by_id; ///
private alias c_vte_terminal_ref_termprop_image_surfaceFn = extern(C) cairo_surface_t* function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_ref_termprop_image_surfaceFn c_vte_terminal_ref_termprop_image_surface; ///
private alias c_vte_terminal_ref_termprop_image_surface_by_idFn = extern(C) cairo_surface_t* function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_ref_termprop_image_surface_by_idFn c_vte_terminal_ref_termprop_image_surface_by_id; ///
private alias c_vte_terminal_ref_termprop_image_textureFn = extern(C) GdkTexture* function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_ref_termprop_image_textureFn c_vte_terminal_ref_termprop_image_texture; ///
private alias c_vte_terminal_ref_termprop_image_texture_by_idFn = extern(C) GdkTexture* function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_ref_termprop_image_texture_by_idFn c_vte_terminal_ref_termprop_image_texture_by_id; ///
private alias c_vte_terminal_ref_termprop_uriFn = extern(C) GUri* function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_ref_termprop_uriFn c_vte_terminal_ref_termprop_uri; ///
private alias c_vte_terminal_ref_termprop_uri_by_idFn = extern(C) GUri* function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_ref_termprop_uri_by_idFn c_vte_terminal_ref_termprop_uri_by_id; ///
private alias c_vte_terminal_ref_termprop_variantFn = extern(C) GVariant* function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_ref_termprop_variantFn c_vte_terminal_ref_termprop_variant; ///
private alias c_vte_terminal_ref_termprop_variant_by_idFn = extern(C) GVariant* function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_ref_termprop_variant_by_idFn c_vte_terminal_ref_termprop_variant_by_id; ///
private alias c_vte_terminal_resetFn = extern(C) void function(VteTerminal* terminal, gboolean clearTabstops, gboolean clearHistory) nothrow;
__gshared c_vte_terminal_resetFn c_vte_terminal_reset; ///
private alias c_vte_terminal_reset_termpropFn = extern(C) void function(VteTerminal* terminal, const(char)* prop) nothrow;
__gshared c_vte_terminal_reset_termpropFn c_vte_terminal_reset_termprop; ///
private alias c_vte_terminal_reset_termprop_by_idFn = extern(C) void function(VteTerminal* terminal, int prop) nothrow;
__gshared c_vte_terminal_reset_termprop_by_idFn c_vte_terminal_reset_termprop_by_id; ///
private alias c_vte_terminal_search_find_nextFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_search_find_nextFn c_vte_terminal_search_find_next; ///
private alias c_vte_terminal_search_find_previousFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_search_find_previousFn c_vte_terminal_search_find_previous; ///
private alias c_vte_terminal_search_get_regexFn = extern(C) VteRegex* function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_search_get_regexFn c_vte_terminal_search_get_regex; ///
private alias c_vte_terminal_search_get_wrap_aroundFn = extern(C) gboolean function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_search_get_wrap_aroundFn c_vte_terminal_search_get_wrap_around; ///
private alias c_vte_terminal_search_set_regexFn = extern(C) void function(VteTerminal* terminal, VteRegex* regex, uint flags) nothrow;
__gshared c_vte_terminal_search_set_regexFn c_vte_terminal_search_set_regex; ///
private alias c_vte_terminal_search_set_wrap_aroundFn = extern(C) void function(VteTerminal* terminal, gboolean wrapAround) nothrow;
__gshared c_vte_terminal_search_set_wrap_aroundFn c_vte_terminal_search_set_wrap_around; ///
private alias c_vte_terminal_select_allFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_select_allFn c_vte_terminal_select_all; ///
private alias c_vte_terminal_set_allow_boldFn = extern(C) void function(VteTerminal* terminal, gboolean allowBold) nothrow;
__gshared c_vte_terminal_set_allow_boldFn c_vte_terminal_set_allow_bold; ///
private alias c_vte_terminal_set_allow_hyperlinkFn = extern(C) void function(VteTerminal* terminal, gboolean allowHyperlink) nothrow;
__gshared c_vte_terminal_set_allow_hyperlinkFn c_vte_terminal_set_allow_hyperlink; ///
private alias c_vte_terminal_set_audible_bellFn = extern(C) void function(VteTerminal* terminal, gboolean isAudible) nothrow;
__gshared c_vte_terminal_set_audible_bellFn c_vte_terminal_set_audible_bell; ///
private alias c_vte_terminal_set_backspace_bindingFn = extern(C) void function(VteTerminal* terminal, VteEraseBinding binding) nothrow;
__gshared c_vte_terminal_set_backspace_bindingFn c_vte_terminal_set_backspace_binding; ///
private alias c_vte_terminal_set_bold_is_brightFn = extern(C) void function(VteTerminal* terminal, gboolean boldIsBright) nothrow;
__gshared c_vte_terminal_set_bold_is_brightFn c_vte_terminal_set_bold_is_bright; ///
private alias c_vte_terminal_set_cell_height_scaleFn = extern(C) void function(VteTerminal* terminal, double scale) nothrow;
__gshared c_vte_terminal_set_cell_height_scaleFn c_vte_terminal_set_cell_height_scale; ///
private alias c_vte_terminal_set_cell_width_scaleFn = extern(C) void function(VteTerminal* terminal, double scale) nothrow;
__gshared c_vte_terminal_set_cell_width_scaleFn c_vte_terminal_set_cell_width_scale; ///
private alias c_vte_terminal_set_cjk_ambiguous_widthFn = extern(C) void function(VteTerminal* terminal, int width) nothrow;
__gshared c_vte_terminal_set_cjk_ambiguous_widthFn c_vte_terminal_set_cjk_ambiguous_width; ///
private alias c_vte_terminal_set_clear_backgroundFn = extern(C) void function(VteTerminal* terminal, gboolean setting) nothrow;
__gshared c_vte_terminal_set_clear_backgroundFn c_vte_terminal_set_clear_background; ///
private alias c_vte_terminal_set_color_backgroundFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* background) nothrow;
__gshared c_vte_terminal_set_color_backgroundFn c_vte_terminal_set_color_background; ///
private alias c_vte_terminal_set_color_boldFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* bold) nothrow;
__gshared c_vte_terminal_set_color_boldFn c_vte_terminal_set_color_bold; ///
private alias c_vte_terminal_set_color_cursorFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* cursorBackground) nothrow;
__gshared c_vte_terminal_set_color_cursorFn c_vte_terminal_set_color_cursor; ///
private alias c_vte_terminal_set_color_cursor_foregroundFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* cursorForeground) nothrow;
__gshared c_vte_terminal_set_color_cursor_foregroundFn c_vte_terminal_set_color_cursor_foreground; ///
private alias c_vte_terminal_set_color_foregroundFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* foreground) nothrow;
__gshared c_vte_terminal_set_color_foregroundFn c_vte_terminal_set_color_foreground; ///
private alias c_vte_terminal_set_color_highlightFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* highlightBackground) nothrow;
__gshared c_vte_terminal_set_color_highlightFn c_vte_terminal_set_color_highlight; ///
private alias c_vte_terminal_set_color_highlight_foregroundFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* highlightForeground) nothrow;
__gshared c_vte_terminal_set_color_highlight_foregroundFn c_vte_terminal_set_color_highlight_foreground; ///
private alias c_vte_terminal_set_colorsFn = extern(C) void function(VteTerminal* terminal, const(GdkRGBA)* foreground, const(GdkRGBA)* background, const(GdkRGBA)* palette, size_t paletteSize) nothrow;
__gshared c_vte_terminal_set_colorsFn c_vte_terminal_set_colors; ///
private alias c_vte_terminal_set_context_menuFn = extern(C) void function(VteTerminal* terminal, GtkWidget* menu) nothrow;
__gshared c_vte_terminal_set_context_menuFn c_vte_terminal_set_context_menu; ///
private alias c_vte_terminal_set_context_menu_modelFn = extern(C) void function(VteTerminal* terminal, GMenuModel* model) nothrow;
__gshared c_vte_terminal_set_context_menu_modelFn c_vte_terminal_set_context_menu_model; ///
private alias c_vte_terminal_set_cursor_blink_modeFn = extern(C) void function(VteTerminal* terminal, VteCursorBlinkMode mode) nothrow;
__gshared c_vte_terminal_set_cursor_blink_modeFn c_vte_terminal_set_cursor_blink_mode; ///
private alias c_vte_terminal_set_cursor_shapeFn = extern(C) void function(VteTerminal* terminal, VteCursorShape shape) nothrow;
__gshared c_vte_terminal_set_cursor_shapeFn c_vte_terminal_set_cursor_shape; ///
private alias c_vte_terminal_set_default_colorsFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_set_default_colorsFn c_vte_terminal_set_default_colors; ///
private alias c_vte_terminal_set_delete_bindingFn = extern(C) void function(VteTerminal* terminal, VteEraseBinding binding) nothrow;
__gshared c_vte_terminal_set_delete_bindingFn c_vte_terminal_set_delete_binding; ///
private alias c_vte_terminal_set_enable_a11yFn = extern(C) void function(VteTerminal* terminal, gboolean enableA11y) nothrow;
__gshared c_vte_terminal_set_enable_a11yFn c_vte_terminal_set_enable_a11y; ///
private alias c_vte_terminal_set_enable_bidiFn = extern(C) void function(VteTerminal* terminal, gboolean enableBidi) nothrow;
__gshared c_vte_terminal_set_enable_bidiFn c_vte_terminal_set_enable_bidi; ///
private alias c_vte_terminal_set_enable_fallback_scrollingFn = extern(C) void function(VteTerminal* terminal, gboolean enable) nothrow;
__gshared c_vte_terminal_set_enable_fallback_scrollingFn c_vte_terminal_set_enable_fallback_scrolling; ///
private alias c_vte_terminal_set_enable_legacy_osc777Fn = extern(C) void function(VteTerminal* terminal, gboolean enable) nothrow;
__gshared c_vte_terminal_set_enable_legacy_osc777Fn c_vte_terminal_set_enable_legacy_osc777; ///
private alias c_vte_terminal_set_enable_shapingFn = extern(C) void function(VteTerminal* terminal, gboolean enableShaping) nothrow;
__gshared c_vte_terminal_set_enable_shapingFn c_vte_terminal_set_enable_shaping; ///
private alias c_vte_terminal_set_enable_sixelFn = extern(C) void function(VteTerminal* terminal, gboolean enabled) nothrow;
__gshared c_vte_terminal_set_enable_sixelFn c_vte_terminal_set_enable_sixel; ///
private alias c_vte_terminal_set_encodingFn = extern(C) gboolean function(VteTerminal* terminal, const(char)* codeset, GError** _err) nothrow;
__gshared c_vte_terminal_set_encodingFn c_vte_terminal_set_encoding; ///
private alias c_vte_terminal_set_fontFn = extern(C) void function(VteTerminal* terminal, const(PangoFontDescription)* fontDesc) nothrow;
__gshared c_vte_terminal_set_fontFn c_vte_terminal_set_font; ///
private alias c_vte_terminal_set_font_optionsFn = extern(C) void function(VteTerminal* terminal, const(cairo_font_options_t)* fontOptions) nothrow;
__gshared c_vte_terminal_set_font_optionsFn c_vte_terminal_set_font_options; ///
private alias c_vte_terminal_set_font_scaleFn = extern(C) void function(VteTerminal* terminal, double scale) nothrow;
__gshared c_vte_terminal_set_font_scaleFn c_vte_terminal_set_font_scale; ///
private alias c_vte_terminal_set_input_enabledFn = extern(C) void function(VteTerminal* terminal, gboolean enabled) nothrow;
__gshared c_vte_terminal_set_input_enabledFn c_vte_terminal_set_input_enabled; ///
private alias c_vte_terminal_set_mouse_autohideFn = extern(C) void function(VteTerminal* terminal, gboolean setting) nothrow;
__gshared c_vte_terminal_set_mouse_autohideFn c_vte_terminal_set_mouse_autohide; ///
private alias c_vte_terminal_set_ptyFn = extern(C) void function(VteTerminal* terminal, VtePty* pty) nothrow;
__gshared c_vte_terminal_set_ptyFn c_vte_terminal_set_pty; ///
private alias c_vte_terminal_set_rewrap_on_resizeFn = extern(C) void function(VteTerminal* terminal, gboolean rewrap) nothrow;
__gshared c_vte_terminal_set_rewrap_on_resizeFn c_vte_terminal_set_rewrap_on_resize; ///
private alias c_vte_terminal_set_scroll_on_insertFn = extern(C) void function(VteTerminal* terminal, gboolean scroll) nothrow;
__gshared c_vte_terminal_set_scroll_on_insertFn c_vte_terminal_set_scroll_on_insert; ///
private alias c_vte_terminal_set_scroll_on_keystrokeFn = extern(C) void function(VteTerminal* terminal, gboolean scroll) nothrow;
__gshared c_vte_terminal_set_scroll_on_keystrokeFn c_vte_terminal_set_scroll_on_keystroke; ///
private alias c_vte_terminal_set_scroll_on_outputFn = extern(C) void function(VteTerminal* terminal, gboolean scroll) nothrow;
__gshared c_vte_terminal_set_scroll_on_outputFn c_vte_terminal_set_scroll_on_output; ///
private alias c_vte_terminal_set_scroll_unit_is_pixelsFn = extern(C) void function(VteTerminal* terminal, gboolean enable) nothrow;
__gshared c_vte_terminal_set_scroll_unit_is_pixelsFn c_vte_terminal_set_scroll_unit_is_pixels; ///
private alias c_vte_terminal_set_scrollback_linesFn = extern(C) void function(VteTerminal* terminal, glong lines) nothrow;
__gshared c_vte_terminal_set_scrollback_linesFn c_vte_terminal_set_scrollback_lines; ///
private alias c_vte_terminal_set_sizeFn = extern(C) void function(VteTerminal* terminal, glong columns, glong rows) nothrow;
__gshared c_vte_terminal_set_sizeFn c_vte_terminal_set_size; ///
private alias c_vte_terminal_set_suppress_legacy_signalsFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_set_suppress_legacy_signalsFn c_vte_terminal_set_suppress_legacy_signals; ///
private alias c_vte_terminal_set_text_blink_modeFn = extern(C) void function(VteTerminal* terminal, VteTextBlinkMode textBlinkMode) nothrow;
__gshared c_vte_terminal_set_text_blink_modeFn c_vte_terminal_set_text_blink_mode; ///
private alias c_vte_terminal_set_word_char_exceptionsFn = extern(C) void function(VteTerminal* terminal, const(char)* exceptions) nothrow;
__gshared c_vte_terminal_set_word_char_exceptionsFn c_vte_terminal_set_word_char_exceptions; ///
private alias c_vte_terminal_set_xalignFn = extern(C) void function(VteTerminal* terminal, VteAlign align_) nothrow;
__gshared c_vte_terminal_set_xalignFn c_vte_terminal_set_xalign; ///
private alias c_vte_terminal_set_xfillFn = extern(C) void function(VteTerminal* terminal, gboolean fill) nothrow;
__gshared c_vte_terminal_set_xfillFn c_vte_terminal_set_xfill; ///
private alias c_vte_terminal_set_yalignFn = extern(C) void function(VteTerminal* terminal, VteAlign align_) nothrow;
__gshared c_vte_terminal_set_yalignFn c_vte_terminal_set_yalign; ///
private alias c_vte_terminal_set_yfillFn = extern(C) void function(VteTerminal* terminal, gboolean fill) nothrow;
__gshared c_vte_terminal_set_yfillFn c_vte_terminal_set_yfill; ///
private alias c_vte_terminal_spawn_asyncFn = extern(C) void function(VteTerminal* terminal, VtePtyFlags ptyFlags, const(char)* workingDirectory, char** argv, char** envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, VteTerminalSpawnAsyncCallback callback, void* userData) nothrow;
__gshared c_vte_terminal_spawn_asyncFn c_vte_terminal_spawn_async; ///
private alias c_vte_terminal_spawn_syncFn = extern(C) gboolean function(VteTerminal* terminal, VtePtyFlags ptyFlags, const(char)* workingDirectory, char** argv, char** envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GPid* childPid, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_vte_terminal_spawn_syncFn c_vte_terminal_spawn_sync; ///
private alias c_vte_terminal_spawn_with_fds_asyncFn = extern(C) void function(VteTerminal* terminal, VtePtyFlags ptyFlags, const(char)* workingDirectory, const(char*)* argv, const(char*)* envv, const(int)* fds, int nFds, const(int)* mapFds, int nMapFds, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, VteTerminalSpawnAsyncCallback callback, void* userData) nothrow;
__gshared c_vte_terminal_spawn_with_fds_asyncFn c_vte_terminal_spawn_with_fds_async; ///
private alias c_vte_terminal_unselect_allFn = extern(C) void function(VteTerminal* terminal) nothrow;
__gshared c_vte_terminal_unselect_allFn c_vte_terminal_unselect_all; ///
private alias c_vte_terminal_watch_childFn = extern(C) void function(VteTerminal* terminal, GPid childPid) nothrow;
__gshared c_vte_terminal_watch_childFn c_vte_terminal_watch_child; ///
private alias c_vte_terminal_write_contents_syncFn = extern(C) gboolean function(VteTerminal* terminal, GOutputStream* stream, VteWriteFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_vte_terminal_write_contents_syncFn c_vte_terminal_write_contents_sync; ///

// Uuid
private alias c_vte_uuid_get_typeFn = extern(C) GType function() nothrow;
__gshared c_vte_uuid_get_typeFn c_vte_uuid_get_type; ///
private alias c_vte_uuid_new_from_stringFn = extern(C) VteUuid* function(const(char)* str, ptrdiff_t len, VteUuidFormat fmt) nothrow;
__gshared c_vte_uuid_new_from_stringFn c_vte_uuid_new_from_string; ///
private alias c_vte_uuid_new_v4Fn = extern(C) VteUuid* function() nothrow;
__gshared c_vte_uuid_new_v4Fn c_vte_uuid_new_v4; ///
private alias c_vte_uuid_dupFn = extern(C) VteUuid* function(const(VteUuid)* uuid) nothrow;
__gshared c_vte_uuid_dupFn c_vte_uuid_dup; ///
private alias c_vte_uuid_equalFn = extern(C) gboolean function(const(VteUuid)* uuid, const(VteUuid)* other) nothrow;
__gshared c_vte_uuid_equalFn c_vte_uuid_equal; ///
private alias c_vte_uuid_freeFn = extern(C) void function(VteUuid* uuid) nothrow;
__gshared c_vte_uuid_freeFn c_vte_uuid_free; ///
private alias c_vte_uuid_free_to_stringFn = extern(C) char* function(VteUuid* uuid, VteUuidFormat fmt, size_t* len) nothrow;
__gshared c_vte_uuid_free_to_stringFn c_vte_uuid_free_to_string; ///
private alias c_vte_uuid_new_v5Fn = extern(C) VteUuid* function(const(VteUuid)* ns, const(char)* data, ptrdiff_t len) nothrow;
__gshared c_vte_uuid_new_v5Fn c_vte_uuid_new_v5; ///
private alias c_vte_uuid_to_stringFn = extern(C) char* function(const(VteUuid)* uuid, VteUuidFormat fmt, size_t* len) nothrow;
__gshared c_vte_uuid_to_stringFn c_vte_uuid_to_string; ///
private alias c_vte_uuid_validate_stringFn = extern(C) gboolean function(const(char)* str, ptrdiff_t len, VteUuidFormat fmt) nothrow;
__gshared c_vte_uuid_validate_stringFn c_vte_uuid_validate_string; ///

// global
private alias c_vte_get_encoding_supportedFn = extern(C) gboolean function(const(char)* encoding) nothrow;
__gshared c_vte_get_encoding_supportedFn c_vte_get_encoding_supported; ///
private alias c_vte_get_encodingsFn = extern(C) char** function(gboolean includeAliases) nothrow;
__gshared c_vte_get_encodingsFn c_vte_get_encodings; ///
private alias c_vte_get_feature_flagsFn = extern(C) VteFeatureFlags function() nothrow;
__gshared c_vte_get_feature_flagsFn c_vte_get_feature_flags; ///
private alias c_vte_get_featuresFn = extern(C) const(char)* function() nothrow;
__gshared c_vte_get_featuresFn c_vte_get_features; ///
private alias c_vte_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_vte_get_major_versionFn c_vte_get_major_version; ///
private alias c_vte_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_vte_get_micro_versionFn c_vte_get_micro_version; ///
private alias c_vte_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_vte_get_minor_versionFn c_vte_get_minor_version; ///
private alias c_vte_get_termpropsFn = extern(C) const(char*)* function(size_t* length) nothrow;
__gshared c_vte_get_termpropsFn c_vte_get_termprops; ///
private alias c_vte_get_test_flagsFn = extern(C) ulong function() nothrow;
__gshared c_vte_get_test_flagsFn c_vte_get_test_flags; ///
private alias c_vte_get_user_shellFn = extern(C) char* function() nothrow;
__gshared c_vte_get_user_shellFn c_vte_get_user_shell; ///
private alias c_vte_install_termpropFn = extern(C) int function(const(char)* name, VtePropertyType type, VtePropertyFlags flags) nothrow;
__gshared c_vte_install_termpropFn c_vte_install_termprop; ///
private alias c_vte_install_termprop_aliasFn = extern(C) int function(const(char)* name, const(char)* targetName) nothrow;
__gshared c_vte_install_termprop_aliasFn c_vte_install_termprop_alias; ///
private alias c_vte_query_termpropFn = extern(C) gboolean function(const(char)* name, const(char*)* resolvedName, int* prop, VtePropertyType* type, VtePropertyFlags* flags) nothrow;
__gshared c_vte_query_termpropFn c_vte_query_termprop; ///
private alias c_vte_query_termprop_by_idFn = extern(C) gboolean function(int prop, const(char*)* name, VtePropertyType* type, VtePropertyFlags* flags) nothrow;
__gshared c_vte_query_termprop_by_idFn c_vte_query_termprop_by_id; ///
private alias c_vte_set_test_flagsFn = extern(C) void function(ulong flags) nothrow;
__gshared c_vte_set_test_flagsFn c_vte_set_test_flags; ///

// PtyError
private alias c_vte_pty_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_vte_pty_error_quarkFn c_vte_pty_error_quark; ///

// RegexError
private alias c_vte_regex_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_vte_regex_error_quarkFn c_vte_regex_error_quark; ///

// EventContext

/** */
alias vte_event_context_get_type = c_vte_event_context_get_type;

/** */
alias vte_event_context_get_coordinates = c_vte_event_context_get_coordinates;

// Pty

/** */
alias vte_pty_get_type = c_vte_pty_get_type;

/** */
alias vte_pty_new_foreign_sync = c_vte_pty_new_foreign_sync;

/** */
alias vte_pty_new_sync = c_vte_pty_new_sync;

/** */
alias vte_pty_child_setup = c_vte_pty_child_setup;

/** */
alias vte_pty_close = c_vte_pty_close;

/** */
alias vte_pty_get_fd = c_vte_pty_get_fd;

/** */
alias vte_pty_get_size = c_vte_pty_get_size;

/** */
alias vte_pty_set_size = c_vte_pty_set_size;

/** */
alias vte_pty_set_utf8 = c_vte_pty_set_utf8;

/** */
alias vte_pty_spawn_async = c_vte_pty_spawn_async;

/** */
alias vte_pty_spawn_finish = c_vte_pty_spawn_finish;

/** */
alias vte_pty_spawn_with_fds_async = c_vte_pty_spawn_with_fds_async;

// Regex

/** */
alias vte_regex_get_type = c_vte_regex_get_type;

/** */
alias vte_regex_new_for_match = c_vte_regex_new_for_match;

/** */
alias vte_regex_new_for_match_full = c_vte_regex_new_for_match_full;

/** */
alias vte_regex_new_for_search = c_vte_regex_new_for_search;

/** */
alias vte_regex_new_for_search_full = c_vte_regex_new_for_search_full;

/** */
alias vte_regex_jit = c_vte_regex_jit;

/** */
alias vte_regex_ref = c_vte_regex_ref;

/** */
alias vte_regex_substitute = c_vte_regex_substitute;

/** */
alias vte_regex_unref = c_vte_regex_unref;

// Terminal

/** */
alias vte_terminal_get_type = c_vte_terminal_get_type;

/** */
alias vte_terminal_new = c_vte_terminal_new;

/** */
alias vte_terminal_check_hyperlink_at = c_vte_terminal_check_hyperlink_at;

/** */
alias vte_terminal_check_match_at = c_vte_terminal_check_match_at;

/** */
alias vte_terminal_check_regex_array_at = c_vte_terminal_check_regex_array_at;

/** */
alias vte_terminal_check_regex_simple_at = c_vte_terminal_check_regex_simple_at;

/** */
alias vte_terminal_copy_clipboard = c_vte_terminal_copy_clipboard;

/** */
alias vte_terminal_copy_clipboard_format = c_vte_terminal_copy_clipboard_format;

/** */
alias vte_terminal_copy_primary = c_vte_terminal_copy_primary;

/** */
alias vte_terminal_dup_termprop_string = c_vte_terminal_dup_termprop_string;

/** */
alias vte_terminal_dup_termprop_string_by_id = c_vte_terminal_dup_termprop_string_by_id;

/** */
alias vte_terminal_dup_termprop_uuid = c_vte_terminal_dup_termprop_uuid;

/** */
alias vte_terminal_dup_termprop_uuid_by_id = c_vte_terminal_dup_termprop_uuid_by_id;

/** */
alias vte_terminal_feed = c_vte_terminal_feed;

/** */
alias vte_terminal_feed_child = c_vte_terminal_feed_child;

/** */
alias vte_terminal_feed_child_binary = c_vte_terminal_feed_child_binary;

/** */
alias vte_terminal_get_allow_bold = c_vte_terminal_get_allow_bold;

/** */
alias vte_terminal_get_allow_hyperlink = c_vte_terminal_get_allow_hyperlink;

/** */
alias vte_terminal_get_audible_bell = c_vte_terminal_get_audible_bell;

/** */
alias vte_terminal_get_bold_is_bright = c_vte_terminal_get_bold_is_bright;

/** */
alias vte_terminal_get_cell_height_scale = c_vte_terminal_get_cell_height_scale;

/** */
alias vte_terminal_get_cell_width_scale = c_vte_terminal_get_cell_width_scale;

/** */
alias vte_terminal_get_char_height = c_vte_terminal_get_char_height;

/** */
alias vte_terminal_get_char_width = c_vte_terminal_get_char_width;

/** */
alias vte_terminal_get_cjk_ambiguous_width = c_vte_terminal_get_cjk_ambiguous_width;

/** */
alias vte_terminal_get_color_background_for_draw = c_vte_terminal_get_color_background_for_draw;

/** */
alias vte_terminal_get_column_count = c_vte_terminal_get_column_count;

/** */
alias vte_terminal_get_context_menu = c_vte_terminal_get_context_menu;

/** */
alias vte_terminal_get_context_menu_model = c_vte_terminal_get_context_menu_model;

/** */
alias vte_terminal_get_current_directory_uri = c_vte_terminal_get_current_directory_uri;

/** */
alias vte_terminal_get_current_file_uri = c_vte_terminal_get_current_file_uri;

/** */
alias vte_terminal_get_cursor_blink_mode = c_vte_terminal_get_cursor_blink_mode;

/** */
alias vte_terminal_get_cursor_position = c_vte_terminal_get_cursor_position;

/** */
alias vte_terminal_get_cursor_shape = c_vte_terminal_get_cursor_shape;

/** */
alias vte_terminal_get_enable_a11y = c_vte_terminal_get_enable_a11y;

/** */
alias vte_terminal_get_enable_bidi = c_vte_terminal_get_enable_bidi;

/** */
alias vte_terminal_get_enable_fallback_scrolling = c_vte_terminal_get_enable_fallback_scrolling;

/** */
alias vte_terminal_get_enable_legacy_osc777 = c_vte_terminal_get_enable_legacy_osc777;

/** */
alias vte_terminal_get_enable_shaping = c_vte_terminal_get_enable_shaping;

/** */
alias vte_terminal_get_enable_sixel = c_vte_terminal_get_enable_sixel;

/** */
alias vte_terminal_get_encoding = c_vte_terminal_get_encoding;

/** */
alias vte_terminal_get_font = c_vte_terminal_get_font;

/** */
alias vte_terminal_get_font_options = c_vte_terminal_get_font_options;

/** */
alias vte_terminal_get_font_scale = c_vte_terminal_get_font_scale;

/** */
alias vte_terminal_get_has_selection = c_vte_terminal_get_has_selection;

/** */
alias vte_terminal_get_icon_title = c_vte_terminal_get_icon_title;

/** */
alias vte_terminal_get_input_enabled = c_vte_terminal_get_input_enabled;

/** */
alias vte_terminal_get_mouse_autohide = c_vte_terminal_get_mouse_autohide;

/** */
alias vte_terminal_get_pty = c_vte_terminal_get_pty;

/** */
alias vte_terminal_get_rewrap_on_resize = c_vte_terminal_get_rewrap_on_resize;

/** */
alias vte_terminal_get_row_count = c_vte_terminal_get_row_count;

/** */
alias vte_terminal_get_scroll_on_insert = c_vte_terminal_get_scroll_on_insert;

/** */
alias vte_terminal_get_scroll_on_keystroke = c_vte_terminal_get_scroll_on_keystroke;

/** */
alias vte_terminal_get_scroll_on_output = c_vte_terminal_get_scroll_on_output;

/** */
alias vte_terminal_get_scroll_unit_is_pixels = c_vte_terminal_get_scroll_unit_is_pixels;

/** */
alias vte_terminal_get_scrollback_lines = c_vte_terminal_get_scrollback_lines;

/** */
alias vte_terminal_get_termprop_bool = c_vte_terminal_get_termprop_bool;

/** */
alias vte_terminal_get_termprop_bool_by_id = c_vte_terminal_get_termprop_bool_by_id;

/** */
alias vte_terminal_get_termprop_data = c_vte_terminal_get_termprop_data;

/** */
alias vte_terminal_get_termprop_data_by_id = c_vte_terminal_get_termprop_data_by_id;

/** */
alias vte_terminal_get_termprop_double = c_vte_terminal_get_termprop_double;

/** */
alias vte_terminal_get_termprop_double_by_id = c_vte_terminal_get_termprop_double_by_id;

/** */
alias vte_terminal_get_termprop_enum = c_vte_terminal_get_termprop_enum;

/** */
alias vte_terminal_get_termprop_enum_by_id = c_vte_terminal_get_termprop_enum_by_id;

/** */
alias vte_terminal_get_termprop_flags = c_vte_terminal_get_termprop_flags;

/** */
alias vte_terminal_get_termprop_flags_by_id = c_vte_terminal_get_termprop_flags_by_id;

/** */
alias vte_terminal_get_termprop_int = c_vte_terminal_get_termprop_int;

/** */
alias vte_terminal_get_termprop_int_by_id = c_vte_terminal_get_termprop_int_by_id;

/** */
alias vte_terminal_get_termprop_rgba = c_vte_terminal_get_termprop_rgba;

/** */
alias vte_terminal_get_termprop_rgba_by_id = c_vte_terminal_get_termprop_rgba_by_id;

/** */
alias vte_terminal_get_termprop_string = c_vte_terminal_get_termprop_string;

/** */
alias vte_terminal_get_termprop_string_by_id = c_vte_terminal_get_termprop_string_by_id;

/** */
alias vte_terminal_get_termprop_uint = c_vte_terminal_get_termprop_uint;

/** */
alias vte_terminal_get_termprop_uint_by_id = c_vte_terminal_get_termprop_uint_by_id;

/** */
alias vte_terminal_get_termprop_value = c_vte_terminal_get_termprop_value;

/** */
alias vte_terminal_get_termprop_value_by_id = c_vte_terminal_get_termprop_value_by_id;

/** */
alias vte_terminal_get_text = c_vte_terminal_get_text;

/** */
alias vte_terminal_get_text_blink_mode = c_vte_terminal_get_text_blink_mode;

/** */
alias vte_terminal_get_text_format = c_vte_terminal_get_text_format;

/** */
alias vte_terminal_get_text_include_trailing_spaces = c_vte_terminal_get_text_include_trailing_spaces;

/** */
alias vte_terminal_get_text_range = c_vte_terminal_get_text_range;

/** */
alias vte_terminal_get_text_range_format = c_vte_terminal_get_text_range_format;

/** */
alias vte_terminal_get_text_selected = c_vte_terminal_get_text_selected;

/** */
alias vte_terminal_get_text_selected_full = c_vte_terminal_get_text_selected_full;

/** */
alias vte_terminal_get_window_title = c_vte_terminal_get_window_title;

/** */
alias vte_terminal_get_word_char_exceptions = c_vte_terminal_get_word_char_exceptions;

/** */
alias vte_terminal_get_xalign = c_vte_terminal_get_xalign;

/** */
alias vte_terminal_get_xfill = c_vte_terminal_get_xfill;

/** */
alias vte_terminal_get_yalign = c_vte_terminal_get_yalign;

/** */
alias vte_terminal_get_yfill = c_vte_terminal_get_yfill;

/** */
alias vte_terminal_match_add_regex = c_vte_terminal_match_add_regex;

/** */
alias vte_terminal_match_check = c_vte_terminal_match_check;

/** */
alias vte_terminal_match_remove = c_vte_terminal_match_remove;

/** */
alias vte_terminal_match_remove_all = c_vte_terminal_match_remove_all;

/** */
alias vte_terminal_match_set_cursor = c_vte_terminal_match_set_cursor;

/** */
alias vte_terminal_match_set_cursor_name = c_vte_terminal_match_set_cursor_name;

/** */
alias vte_terminal_paste_clipboard = c_vte_terminal_paste_clipboard;

/** */
alias vte_terminal_paste_primary = c_vte_terminal_paste_primary;

/** */
alias vte_terminal_paste_text = c_vte_terminal_paste_text;

/** */
alias vte_terminal_pty_new_sync = c_vte_terminal_pty_new_sync;

/** */
alias vte_terminal_ref_termprop_data_bytes = c_vte_terminal_ref_termprop_data_bytes;

/** */
alias vte_terminal_ref_termprop_data_bytes_by_id = c_vte_terminal_ref_termprop_data_bytes_by_id;

/** */
alias vte_terminal_ref_termprop_image_surface = c_vte_terminal_ref_termprop_image_surface;

/** */
alias vte_terminal_ref_termprop_image_surface_by_id = c_vte_terminal_ref_termprop_image_surface_by_id;

/** */
alias vte_terminal_ref_termprop_image_texture = c_vte_terminal_ref_termprop_image_texture;

/** */
alias vte_terminal_ref_termprop_image_texture_by_id = c_vte_terminal_ref_termprop_image_texture_by_id;

/** */
alias vte_terminal_ref_termprop_uri = c_vte_terminal_ref_termprop_uri;

/** */
alias vte_terminal_ref_termprop_uri_by_id = c_vte_terminal_ref_termprop_uri_by_id;

/** */
alias vte_terminal_ref_termprop_variant = c_vte_terminal_ref_termprop_variant;

/** */
alias vte_terminal_ref_termprop_variant_by_id = c_vte_terminal_ref_termprop_variant_by_id;

/** */
alias vte_terminal_reset = c_vte_terminal_reset;

/** */
alias vte_terminal_reset_termprop = c_vte_terminal_reset_termprop;

/** */
alias vte_terminal_reset_termprop_by_id = c_vte_terminal_reset_termprop_by_id;

/** */
alias vte_terminal_search_find_next = c_vte_terminal_search_find_next;

/** */
alias vte_terminal_search_find_previous = c_vte_terminal_search_find_previous;

/** */
alias vte_terminal_search_get_regex = c_vte_terminal_search_get_regex;

/** */
alias vte_terminal_search_get_wrap_around = c_vte_terminal_search_get_wrap_around;

/** */
alias vte_terminal_search_set_regex = c_vte_terminal_search_set_regex;

/** */
alias vte_terminal_search_set_wrap_around = c_vte_terminal_search_set_wrap_around;

/** */
alias vte_terminal_select_all = c_vte_terminal_select_all;

/** */
alias vte_terminal_set_allow_bold = c_vte_terminal_set_allow_bold;

/** */
alias vte_terminal_set_allow_hyperlink = c_vte_terminal_set_allow_hyperlink;

/** */
alias vte_terminal_set_audible_bell = c_vte_terminal_set_audible_bell;

/** */
alias vte_terminal_set_backspace_binding = c_vte_terminal_set_backspace_binding;

/** */
alias vte_terminal_set_bold_is_bright = c_vte_terminal_set_bold_is_bright;

/** */
alias vte_terminal_set_cell_height_scale = c_vte_terminal_set_cell_height_scale;

/** */
alias vte_terminal_set_cell_width_scale = c_vte_terminal_set_cell_width_scale;

/** */
alias vte_terminal_set_cjk_ambiguous_width = c_vte_terminal_set_cjk_ambiguous_width;

/** */
alias vte_terminal_set_clear_background = c_vte_terminal_set_clear_background;

/** */
alias vte_terminal_set_color_background = c_vte_terminal_set_color_background;

/** */
alias vte_terminal_set_color_bold = c_vte_terminal_set_color_bold;

/** */
alias vte_terminal_set_color_cursor = c_vte_terminal_set_color_cursor;

/** */
alias vte_terminal_set_color_cursor_foreground = c_vte_terminal_set_color_cursor_foreground;

/** */
alias vte_terminal_set_color_foreground = c_vte_terminal_set_color_foreground;

/** */
alias vte_terminal_set_color_highlight = c_vte_terminal_set_color_highlight;

/** */
alias vte_terminal_set_color_highlight_foreground = c_vte_terminal_set_color_highlight_foreground;

/** */
alias vte_terminal_set_colors = c_vte_terminal_set_colors;

/** */
alias vte_terminal_set_context_menu = c_vte_terminal_set_context_menu;

/** */
alias vte_terminal_set_context_menu_model = c_vte_terminal_set_context_menu_model;

/** */
alias vte_terminal_set_cursor_blink_mode = c_vte_terminal_set_cursor_blink_mode;

/** */
alias vte_terminal_set_cursor_shape = c_vte_terminal_set_cursor_shape;

/** */
alias vte_terminal_set_default_colors = c_vte_terminal_set_default_colors;

/** */
alias vte_terminal_set_delete_binding = c_vte_terminal_set_delete_binding;

/** */
alias vte_terminal_set_enable_a11y = c_vte_terminal_set_enable_a11y;

/** */
alias vte_terminal_set_enable_bidi = c_vte_terminal_set_enable_bidi;

/** */
alias vte_terminal_set_enable_fallback_scrolling = c_vte_terminal_set_enable_fallback_scrolling;

/** */
alias vte_terminal_set_enable_legacy_osc777 = c_vte_terminal_set_enable_legacy_osc777;

/** */
alias vte_terminal_set_enable_shaping = c_vte_terminal_set_enable_shaping;

/** */
alias vte_terminal_set_enable_sixel = c_vte_terminal_set_enable_sixel;

/** */
alias vte_terminal_set_encoding = c_vte_terminal_set_encoding;

/** */
alias vte_terminal_set_font = c_vte_terminal_set_font;

/** */
alias vte_terminal_set_font_options = c_vte_terminal_set_font_options;

/** */
alias vte_terminal_set_font_scale = c_vte_terminal_set_font_scale;

/** */
alias vte_terminal_set_input_enabled = c_vte_terminal_set_input_enabled;

/** */
alias vte_terminal_set_mouse_autohide = c_vte_terminal_set_mouse_autohide;

/** */
alias vte_terminal_set_pty = c_vte_terminal_set_pty;

/** */
alias vte_terminal_set_rewrap_on_resize = c_vte_terminal_set_rewrap_on_resize;

/** */
alias vte_terminal_set_scroll_on_insert = c_vte_terminal_set_scroll_on_insert;

/** */
alias vte_terminal_set_scroll_on_keystroke = c_vte_terminal_set_scroll_on_keystroke;

/** */
alias vte_terminal_set_scroll_on_output = c_vte_terminal_set_scroll_on_output;

/** */
alias vte_terminal_set_scroll_unit_is_pixels = c_vte_terminal_set_scroll_unit_is_pixels;

/** */
alias vte_terminal_set_scrollback_lines = c_vte_terminal_set_scrollback_lines;

/** */
alias vte_terminal_set_size = c_vte_terminal_set_size;

/** */
alias vte_terminal_set_suppress_legacy_signals = c_vte_terminal_set_suppress_legacy_signals;

/** */
alias vte_terminal_set_text_blink_mode = c_vte_terminal_set_text_blink_mode;

/** */
alias vte_terminal_set_word_char_exceptions = c_vte_terminal_set_word_char_exceptions;

/** */
alias vte_terminal_set_xalign = c_vte_terminal_set_xalign;

/** */
alias vte_terminal_set_xfill = c_vte_terminal_set_xfill;

/** */
alias vte_terminal_set_yalign = c_vte_terminal_set_yalign;

/** */
alias vte_terminal_set_yfill = c_vte_terminal_set_yfill;

/** */
alias vte_terminal_spawn_async = c_vte_terminal_spawn_async;

/** */
alias vte_terminal_spawn_sync = c_vte_terminal_spawn_sync;

/** */
alias vte_terminal_spawn_with_fds_async = c_vte_terminal_spawn_with_fds_async;

/** */
alias vte_terminal_unselect_all = c_vte_terminal_unselect_all;

/** */
alias vte_terminal_watch_child = c_vte_terminal_watch_child;

/** */
alias vte_terminal_write_contents_sync = c_vte_terminal_write_contents_sync;

// Uuid

/** */
alias vte_uuid_get_type = c_vte_uuid_get_type;

/** */
alias vte_uuid_new_from_string = c_vte_uuid_new_from_string;

/** */
alias vte_uuid_new_v4 = c_vte_uuid_new_v4;

/** */
alias vte_uuid_dup = c_vte_uuid_dup;

/** */
alias vte_uuid_equal = c_vte_uuid_equal;

/** */
alias vte_uuid_free = c_vte_uuid_free;

/** */
alias vte_uuid_free_to_string = c_vte_uuid_free_to_string;

/** */
alias vte_uuid_new_v5 = c_vte_uuid_new_v5;

/** */
alias vte_uuid_to_string = c_vte_uuid_to_string;

/** */
alias vte_uuid_validate_string = c_vte_uuid_validate_string;

// global

/** */
alias vte_get_encoding_supported = c_vte_get_encoding_supported;

/** */
alias vte_get_encodings = c_vte_get_encodings;

/** */
alias vte_get_feature_flags = c_vte_get_feature_flags;

/** */
alias vte_get_features = c_vte_get_features;

/** */
alias vte_get_major_version = c_vte_get_major_version;

/** */
alias vte_get_micro_version = c_vte_get_micro_version;

/** */
alias vte_get_minor_version = c_vte_get_minor_version;

/** */
alias vte_get_termprops = c_vte_get_termprops;

/** */
alias vte_get_test_flags = c_vte_get_test_flags;

/** */
alias vte_get_user_shell = c_vte_get_user_shell;

/** */
alias vte_install_termprop = c_vte_install_termprop;

/** */
alias vte_install_termprop_alias = c_vte_install_termprop_alias;

/** */
alias vte_query_termprop = c_vte_query_termprop;

/** */
alias vte_query_termprop_by_id = c_vte_query_termprop_by_id;

/** */
alias vte_set_test_flags = c_vte_set_test_flags;

// PtyError

/** */
alias vte_pty_error_quark = c_vte_pty_error_quark;

// RegexError

/** */
alias vte_regex_error_quark = c_vte_regex_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // EventContext
  gidLink(cast(void**)&vte_event_context_get_type, "vte_event_context_get_type", libs);
  gidLink(cast(void**)&vte_event_context_get_coordinates, "vte_event_context_get_coordinates", libs);

  // Pty
  gidLink(cast(void**)&vte_pty_get_type, "vte_pty_get_type", libs);
  gidLink(cast(void**)&vte_pty_new_foreign_sync, "vte_pty_new_foreign_sync", libs);
  gidLink(cast(void**)&vte_pty_new_sync, "vte_pty_new_sync", libs);
  gidLink(cast(void**)&vte_pty_child_setup, "vte_pty_child_setup", libs);
  gidLink(cast(void**)&vte_pty_close, "vte_pty_close", libs);
  gidLink(cast(void**)&vte_pty_get_fd, "vte_pty_get_fd", libs);
  gidLink(cast(void**)&vte_pty_get_size, "vte_pty_get_size", libs);
  gidLink(cast(void**)&vte_pty_set_size, "vte_pty_set_size", libs);
  gidLink(cast(void**)&vte_pty_set_utf8, "vte_pty_set_utf8", libs);
  gidLink(cast(void**)&vte_pty_spawn_async, "vte_pty_spawn_async", libs);
  gidLink(cast(void**)&vte_pty_spawn_finish, "vte_pty_spawn_finish", libs);
  gidLink(cast(void**)&vte_pty_spawn_with_fds_async, "vte_pty_spawn_with_fds_async", libs);

  // Regex
  gidLink(cast(void**)&vte_regex_get_type, "vte_regex_get_type", libs);
  gidLink(cast(void**)&vte_regex_new_for_match, "vte_regex_new_for_match", libs);
  gidLink(cast(void**)&vte_regex_new_for_match_full, "vte_regex_new_for_match_full", libs);
  gidLink(cast(void**)&vte_regex_new_for_search, "vte_regex_new_for_search", libs);
  gidLink(cast(void**)&vte_regex_new_for_search_full, "vte_regex_new_for_search_full", libs);
  gidLink(cast(void**)&vte_regex_jit, "vte_regex_jit", libs);
  gidLink(cast(void**)&vte_regex_ref, "vte_regex_ref", libs);
  gidLink(cast(void**)&vte_regex_substitute, "vte_regex_substitute", libs);
  gidLink(cast(void**)&vte_regex_unref, "vte_regex_unref", libs);

  // Terminal
  gidLink(cast(void**)&vte_terminal_get_type, "vte_terminal_get_type", libs);
  gidLink(cast(void**)&vte_terminal_new, "vte_terminal_new", libs);
  gidLink(cast(void**)&vte_terminal_check_hyperlink_at, "vte_terminal_check_hyperlink_at", libs);
  gidLink(cast(void**)&vte_terminal_check_match_at, "vte_terminal_check_match_at", libs);
  gidLink(cast(void**)&vte_terminal_check_regex_array_at, "vte_terminal_check_regex_array_at", libs);
  gidLink(cast(void**)&vte_terminal_check_regex_simple_at, "vte_terminal_check_regex_simple_at", libs);
  gidLink(cast(void**)&vte_terminal_copy_clipboard, "vte_terminal_copy_clipboard", libs);
  gidLink(cast(void**)&vte_terminal_copy_clipboard_format, "vte_terminal_copy_clipboard_format", libs);
  gidLink(cast(void**)&vte_terminal_copy_primary, "vte_terminal_copy_primary", libs);
  gidLink(cast(void**)&vte_terminal_dup_termprop_string, "vte_terminal_dup_termprop_string", libs);
  gidLink(cast(void**)&vte_terminal_dup_termprop_string_by_id, "vte_terminal_dup_termprop_string_by_id", libs);
  gidLink(cast(void**)&vte_terminal_dup_termprop_uuid, "vte_terminal_dup_termprop_uuid", libs);
  gidLink(cast(void**)&vte_terminal_dup_termprop_uuid_by_id, "vte_terminal_dup_termprop_uuid_by_id", libs);
  gidLink(cast(void**)&vte_terminal_feed, "vte_terminal_feed", libs);
  gidLink(cast(void**)&vte_terminal_feed_child, "vte_terminal_feed_child", libs);
  gidLink(cast(void**)&vte_terminal_feed_child_binary, "vte_terminal_feed_child_binary", libs);
  gidLink(cast(void**)&vte_terminal_get_allow_bold, "vte_terminal_get_allow_bold", libs);
  gidLink(cast(void**)&vte_terminal_get_allow_hyperlink, "vte_terminal_get_allow_hyperlink", libs);
  gidLink(cast(void**)&vte_terminal_get_audible_bell, "vte_terminal_get_audible_bell", libs);
  gidLink(cast(void**)&vte_terminal_get_bold_is_bright, "vte_terminal_get_bold_is_bright", libs);
  gidLink(cast(void**)&vte_terminal_get_cell_height_scale, "vte_terminal_get_cell_height_scale", libs);
  gidLink(cast(void**)&vte_terminal_get_cell_width_scale, "vte_terminal_get_cell_width_scale", libs);
  gidLink(cast(void**)&vte_terminal_get_char_height, "vte_terminal_get_char_height", libs);
  gidLink(cast(void**)&vte_terminal_get_char_width, "vte_terminal_get_char_width", libs);
  gidLink(cast(void**)&vte_terminal_get_cjk_ambiguous_width, "vte_terminal_get_cjk_ambiguous_width", libs);
  gidLink(cast(void**)&vte_terminal_get_color_background_for_draw, "vte_terminal_get_color_background_for_draw", libs);
  gidLink(cast(void**)&vte_terminal_get_column_count, "vte_terminal_get_column_count", libs);
  gidLink(cast(void**)&vte_terminal_get_context_menu, "vte_terminal_get_context_menu", libs);
  gidLink(cast(void**)&vte_terminal_get_context_menu_model, "vte_terminal_get_context_menu_model", libs);
  gidLink(cast(void**)&vte_terminal_get_current_directory_uri, "vte_terminal_get_current_directory_uri", libs);
  gidLink(cast(void**)&vte_terminal_get_current_file_uri, "vte_terminal_get_current_file_uri", libs);
  gidLink(cast(void**)&vte_terminal_get_cursor_blink_mode, "vte_terminal_get_cursor_blink_mode", libs);
  gidLink(cast(void**)&vte_terminal_get_cursor_position, "vte_terminal_get_cursor_position", libs);
  gidLink(cast(void**)&vte_terminal_get_cursor_shape, "vte_terminal_get_cursor_shape", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_a11y, "vte_terminal_get_enable_a11y", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_bidi, "vte_terminal_get_enable_bidi", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_fallback_scrolling, "vte_terminal_get_enable_fallback_scrolling", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_legacy_osc777, "vte_terminal_get_enable_legacy_osc777", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_shaping, "vte_terminal_get_enable_shaping", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_sixel, "vte_terminal_get_enable_sixel", libs);
  gidLink(cast(void**)&vte_terminal_get_encoding, "vte_terminal_get_encoding", libs);
  gidLink(cast(void**)&vte_terminal_get_font, "vte_terminal_get_font", libs);
  gidLink(cast(void**)&vte_terminal_get_font_options, "vte_terminal_get_font_options", libs);
  gidLink(cast(void**)&vte_terminal_get_font_scale, "vte_terminal_get_font_scale", libs);
  gidLink(cast(void**)&vte_terminal_get_has_selection, "vte_terminal_get_has_selection", libs);
  gidLink(cast(void**)&vte_terminal_get_icon_title, "vte_terminal_get_icon_title", libs);
  gidLink(cast(void**)&vte_terminal_get_input_enabled, "vte_terminal_get_input_enabled", libs);
  gidLink(cast(void**)&vte_terminal_get_mouse_autohide, "vte_terminal_get_mouse_autohide", libs);
  gidLink(cast(void**)&vte_terminal_get_pty, "vte_terminal_get_pty", libs);
  gidLink(cast(void**)&vte_terminal_get_rewrap_on_resize, "vte_terminal_get_rewrap_on_resize", libs);
  gidLink(cast(void**)&vte_terminal_get_row_count, "vte_terminal_get_row_count", libs);
  gidLink(cast(void**)&vte_terminal_get_scroll_on_insert, "vte_terminal_get_scroll_on_insert", libs);
  gidLink(cast(void**)&vte_terminal_get_scroll_on_keystroke, "vte_terminal_get_scroll_on_keystroke", libs);
  gidLink(cast(void**)&vte_terminal_get_scroll_on_output, "vte_terminal_get_scroll_on_output", libs);
  gidLink(cast(void**)&vte_terminal_get_scroll_unit_is_pixels, "vte_terminal_get_scroll_unit_is_pixels", libs);
  gidLink(cast(void**)&vte_terminal_get_scrollback_lines, "vte_terminal_get_scrollback_lines", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_bool, "vte_terminal_get_termprop_bool", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_bool_by_id, "vte_terminal_get_termprop_bool_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_data, "vte_terminal_get_termprop_data", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_data_by_id, "vte_terminal_get_termprop_data_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_double, "vte_terminal_get_termprop_double", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_double_by_id, "vte_terminal_get_termprop_double_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_enum, "vte_terminal_get_termprop_enum", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_enum_by_id, "vte_terminal_get_termprop_enum_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_flags, "vte_terminal_get_termprop_flags", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_flags_by_id, "vte_terminal_get_termprop_flags_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_int, "vte_terminal_get_termprop_int", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_int_by_id, "vte_terminal_get_termprop_int_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_rgba, "vte_terminal_get_termprop_rgba", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_rgba_by_id, "vte_terminal_get_termprop_rgba_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_string, "vte_terminal_get_termprop_string", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_string_by_id, "vte_terminal_get_termprop_string_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_uint, "vte_terminal_get_termprop_uint", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_uint_by_id, "vte_terminal_get_termprop_uint_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_value, "vte_terminal_get_termprop_value", libs);
  gidLink(cast(void**)&vte_terminal_get_termprop_value_by_id, "vte_terminal_get_termprop_value_by_id", libs);
  gidLink(cast(void**)&vte_terminal_get_text, "vte_terminal_get_text", libs);
  gidLink(cast(void**)&vte_terminal_get_text_blink_mode, "vte_terminal_get_text_blink_mode", libs);
  gidLink(cast(void**)&vte_terminal_get_text_format, "vte_terminal_get_text_format", libs);
  gidLink(cast(void**)&vte_terminal_get_text_include_trailing_spaces, "vte_terminal_get_text_include_trailing_spaces", libs);
  gidLink(cast(void**)&vte_terminal_get_text_range, "vte_terminal_get_text_range", libs);
  gidLink(cast(void**)&vte_terminal_get_text_range_format, "vte_terminal_get_text_range_format", libs);
  gidLink(cast(void**)&vte_terminal_get_text_selected, "vte_terminal_get_text_selected", libs);
  gidLink(cast(void**)&vte_terminal_get_text_selected_full, "vte_terminal_get_text_selected_full", libs);
  gidLink(cast(void**)&vte_terminal_get_window_title, "vte_terminal_get_window_title", libs);
  gidLink(cast(void**)&vte_terminal_get_word_char_exceptions, "vte_terminal_get_word_char_exceptions", libs);
  gidLink(cast(void**)&vte_terminal_get_xalign, "vte_terminal_get_xalign", libs);
  gidLink(cast(void**)&vte_terminal_get_xfill, "vte_terminal_get_xfill", libs);
  gidLink(cast(void**)&vte_terminal_get_yalign, "vte_terminal_get_yalign", libs);
  gidLink(cast(void**)&vte_terminal_get_yfill, "vte_terminal_get_yfill", libs);
  gidLink(cast(void**)&vte_terminal_match_add_regex, "vte_terminal_match_add_regex", libs);
  gidLink(cast(void**)&vte_terminal_match_check, "vte_terminal_match_check", libs);
  gidLink(cast(void**)&vte_terminal_match_remove, "vte_terminal_match_remove", libs);
  gidLink(cast(void**)&vte_terminal_match_remove_all, "vte_terminal_match_remove_all", libs);
  gidLink(cast(void**)&vte_terminal_match_set_cursor, "vte_terminal_match_set_cursor", libs);
  gidLink(cast(void**)&vte_terminal_match_set_cursor_name, "vte_terminal_match_set_cursor_name", libs);
  gidLink(cast(void**)&vte_terminal_paste_clipboard, "vte_terminal_paste_clipboard", libs);
  gidLink(cast(void**)&vte_terminal_paste_primary, "vte_terminal_paste_primary", libs);
  gidLink(cast(void**)&vte_terminal_paste_text, "vte_terminal_paste_text", libs);
  gidLink(cast(void**)&vte_terminal_pty_new_sync, "vte_terminal_pty_new_sync", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_data_bytes, "vte_terminal_ref_termprop_data_bytes", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_data_bytes_by_id, "vte_terminal_ref_termprop_data_bytes_by_id", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_image_surface, "vte_terminal_ref_termprop_image_surface", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_image_surface_by_id, "vte_terminal_ref_termprop_image_surface_by_id", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_image_texture, "vte_terminal_ref_termprop_image_texture", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_image_texture_by_id, "vte_terminal_ref_termprop_image_texture_by_id", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_uri, "vte_terminal_ref_termprop_uri", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_uri_by_id, "vte_terminal_ref_termprop_uri_by_id", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_variant, "vte_terminal_ref_termprop_variant", libs);
  gidLink(cast(void**)&vte_terminal_ref_termprop_variant_by_id, "vte_terminal_ref_termprop_variant_by_id", libs);
  gidLink(cast(void**)&vte_terminal_reset, "vte_terminal_reset", libs);
  gidLink(cast(void**)&vte_terminal_reset_termprop, "vte_terminal_reset_termprop", libs);
  gidLink(cast(void**)&vte_terminal_reset_termprop_by_id, "vte_terminal_reset_termprop_by_id", libs);
  gidLink(cast(void**)&vte_terminal_search_find_next, "vte_terminal_search_find_next", libs);
  gidLink(cast(void**)&vte_terminal_search_find_previous, "vte_terminal_search_find_previous", libs);
  gidLink(cast(void**)&vte_terminal_search_get_regex, "vte_terminal_search_get_regex", libs);
  gidLink(cast(void**)&vte_terminal_search_get_wrap_around, "vte_terminal_search_get_wrap_around", libs);
  gidLink(cast(void**)&vte_terminal_search_set_regex, "vte_terminal_search_set_regex", libs);
  gidLink(cast(void**)&vte_terminal_search_set_wrap_around, "vte_terminal_search_set_wrap_around", libs);
  gidLink(cast(void**)&vte_terminal_select_all, "vte_terminal_select_all", libs);
  gidLink(cast(void**)&vte_terminal_set_allow_bold, "vte_terminal_set_allow_bold", libs);
  gidLink(cast(void**)&vte_terminal_set_allow_hyperlink, "vte_terminal_set_allow_hyperlink", libs);
  gidLink(cast(void**)&vte_terminal_set_audible_bell, "vte_terminal_set_audible_bell", libs);
  gidLink(cast(void**)&vte_terminal_set_backspace_binding, "vte_terminal_set_backspace_binding", libs);
  gidLink(cast(void**)&vte_terminal_set_bold_is_bright, "vte_terminal_set_bold_is_bright", libs);
  gidLink(cast(void**)&vte_terminal_set_cell_height_scale, "vte_terminal_set_cell_height_scale", libs);
  gidLink(cast(void**)&vte_terminal_set_cell_width_scale, "vte_terminal_set_cell_width_scale", libs);
  gidLink(cast(void**)&vte_terminal_set_cjk_ambiguous_width, "vte_terminal_set_cjk_ambiguous_width", libs);
  gidLink(cast(void**)&vte_terminal_set_clear_background, "vte_terminal_set_clear_background", libs);
  gidLink(cast(void**)&vte_terminal_set_color_background, "vte_terminal_set_color_background", libs);
  gidLink(cast(void**)&vte_terminal_set_color_bold, "vte_terminal_set_color_bold", libs);
  gidLink(cast(void**)&vte_terminal_set_color_cursor, "vte_terminal_set_color_cursor", libs);
  gidLink(cast(void**)&vte_terminal_set_color_cursor_foreground, "vte_terminal_set_color_cursor_foreground", libs);
  gidLink(cast(void**)&vte_terminal_set_color_foreground, "vte_terminal_set_color_foreground", libs);
  gidLink(cast(void**)&vte_terminal_set_color_highlight, "vte_terminal_set_color_highlight", libs);
  gidLink(cast(void**)&vte_terminal_set_color_highlight_foreground, "vte_terminal_set_color_highlight_foreground", libs);
  gidLink(cast(void**)&vte_terminal_set_colors, "vte_terminal_set_colors", libs);
  gidLink(cast(void**)&vte_terminal_set_context_menu, "vte_terminal_set_context_menu", libs);
  gidLink(cast(void**)&vte_terminal_set_context_menu_model, "vte_terminal_set_context_menu_model", libs);
  gidLink(cast(void**)&vte_terminal_set_cursor_blink_mode, "vte_terminal_set_cursor_blink_mode", libs);
  gidLink(cast(void**)&vte_terminal_set_cursor_shape, "vte_terminal_set_cursor_shape", libs);
  gidLink(cast(void**)&vte_terminal_set_default_colors, "vte_terminal_set_default_colors", libs);
  gidLink(cast(void**)&vte_terminal_set_delete_binding, "vte_terminal_set_delete_binding", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_a11y, "vte_terminal_set_enable_a11y", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_bidi, "vte_terminal_set_enable_bidi", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_fallback_scrolling, "vte_terminal_set_enable_fallback_scrolling", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_legacy_osc777, "vte_terminal_set_enable_legacy_osc777", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_shaping, "vte_terminal_set_enable_shaping", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_sixel, "vte_terminal_set_enable_sixel", libs);
  gidLink(cast(void**)&vte_terminal_set_encoding, "vte_terminal_set_encoding", libs);
  gidLink(cast(void**)&vte_terminal_set_font, "vte_terminal_set_font", libs);
  gidLink(cast(void**)&vte_terminal_set_font_options, "vte_terminal_set_font_options", libs);
  gidLink(cast(void**)&vte_terminal_set_font_scale, "vte_terminal_set_font_scale", libs);
  gidLink(cast(void**)&vte_terminal_set_input_enabled, "vte_terminal_set_input_enabled", libs);
  gidLink(cast(void**)&vte_terminal_set_mouse_autohide, "vte_terminal_set_mouse_autohide", libs);
  gidLink(cast(void**)&vte_terminal_set_pty, "vte_terminal_set_pty", libs);
  gidLink(cast(void**)&vte_terminal_set_rewrap_on_resize, "vte_terminal_set_rewrap_on_resize", libs);
  gidLink(cast(void**)&vte_terminal_set_scroll_on_insert, "vte_terminal_set_scroll_on_insert", libs);
  gidLink(cast(void**)&vte_terminal_set_scroll_on_keystroke, "vte_terminal_set_scroll_on_keystroke", libs);
  gidLink(cast(void**)&vte_terminal_set_scroll_on_output, "vte_terminal_set_scroll_on_output", libs);
  gidLink(cast(void**)&vte_terminal_set_scroll_unit_is_pixels, "vte_terminal_set_scroll_unit_is_pixels", libs);
  gidLink(cast(void**)&vte_terminal_set_scrollback_lines, "vte_terminal_set_scrollback_lines", libs);
  gidLink(cast(void**)&vte_terminal_set_size, "vte_terminal_set_size", libs);
  gidLink(cast(void**)&vte_terminal_set_suppress_legacy_signals, "vte_terminal_set_suppress_legacy_signals", libs);
  gidLink(cast(void**)&vte_terminal_set_text_blink_mode, "vte_terminal_set_text_blink_mode", libs);
  gidLink(cast(void**)&vte_terminal_set_word_char_exceptions, "vte_terminal_set_word_char_exceptions", libs);
  gidLink(cast(void**)&vte_terminal_set_xalign, "vte_terminal_set_xalign", libs);
  gidLink(cast(void**)&vte_terminal_set_xfill, "vte_terminal_set_xfill", libs);
  gidLink(cast(void**)&vte_terminal_set_yalign, "vte_terminal_set_yalign", libs);
  gidLink(cast(void**)&vte_terminal_set_yfill, "vte_terminal_set_yfill", libs);
  gidLink(cast(void**)&vte_terminal_spawn_async, "vte_terminal_spawn_async", libs);
  gidLink(cast(void**)&vte_terminal_spawn_sync, "vte_terminal_spawn_sync", libs);
  gidLink(cast(void**)&vte_terminal_spawn_with_fds_async, "vte_terminal_spawn_with_fds_async", libs);
  gidLink(cast(void**)&vte_terminal_unselect_all, "vte_terminal_unselect_all", libs);
  gidLink(cast(void**)&vte_terminal_watch_child, "vte_terminal_watch_child", libs);
  gidLink(cast(void**)&vte_terminal_write_contents_sync, "vte_terminal_write_contents_sync", libs);

  // Uuid
  gidLink(cast(void**)&vte_uuid_get_type, "vte_uuid_get_type", libs);
  gidLink(cast(void**)&vte_uuid_new_from_string, "vte_uuid_new_from_string", libs);
  gidLink(cast(void**)&vte_uuid_new_v4, "vte_uuid_new_v4", libs);
  gidLink(cast(void**)&vte_uuid_dup, "vte_uuid_dup", libs);
  gidLink(cast(void**)&vte_uuid_equal, "vte_uuid_equal", libs);
  gidLink(cast(void**)&vte_uuid_free, "vte_uuid_free", libs);
  gidLink(cast(void**)&vte_uuid_free_to_string, "vte_uuid_free_to_string", libs);
  gidLink(cast(void**)&vte_uuid_new_v5, "vte_uuid_new_v5", libs);
  gidLink(cast(void**)&vte_uuid_to_string, "vte_uuid_to_string", libs);
  gidLink(cast(void**)&vte_uuid_validate_string, "vte_uuid_validate_string", libs);

  // global
  gidLink(cast(void**)&vte_get_encoding_supported, "vte_get_encoding_supported", libs);
  gidLink(cast(void**)&vte_get_encodings, "vte_get_encodings", libs);
  gidLink(cast(void**)&vte_get_feature_flags, "vte_get_feature_flags", libs);
  gidLink(cast(void**)&vte_get_features, "vte_get_features", libs);
  gidLink(cast(void**)&vte_get_major_version, "vte_get_major_version", libs);
  gidLink(cast(void**)&vte_get_micro_version, "vte_get_micro_version", libs);
  gidLink(cast(void**)&vte_get_minor_version, "vte_get_minor_version", libs);
  gidLink(cast(void**)&vte_get_termprops, "vte_get_termprops", libs);
  gidLink(cast(void**)&vte_get_test_flags, "vte_get_test_flags", libs);
  gidLink(cast(void**)&vte_get_user_shell, "vte_get_user_shell", libs);
  gidLink(cast(void**)&vte_install_termprop, "vte_install_termprop", libs);
  gidLink(cast(void**)&vte_install_termprop_alias, "vte_install_termprop_alias", libs);
  gidLink(cast(void**)&vte_query_termprop, "vte_query_termprop", libs);
  gidLink(cast(void**)&vte_query_termprop_by_id, "vte_query_termprop_by_id", libs);
  gidLink(cast(void**)&vte_set_test_flags, "vte_set_test_flags", libs);

  // PtyError
  gidLink(cast(void**)&vte_pty_error_quark, "vte_pty_error_quark", libs);

  // RegexError
  gidLink(cast(void**)&vte_regex_error_quark, "vte_regex_error_quark", libs);
}
