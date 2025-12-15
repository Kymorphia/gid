/// C functions for vte2 library
module vte.c.functions;

public import gid.basictypes;
import gid.loader;
import vte.c.types;
public import gdk.c.types;
public import gtk.c.types;
public import pango.c.types;
public import cairo.c.types;

version(Windows)
  private immutable LIBS = ["libvte-2.91-0.dll;vte-2.91-0.dll;vte-2.dll"];
else version(OSX)
  private immutable LIBS = ["libvte-2.91.0.dylib"];
else
  private immutable LIBS = ["libvte-2.91.so.0"];

__gshared extern(C)
{
  // EventContext
  GdkEvent* function(const(VteEventContext)* context) c_vte_event_context_get_event; ///

  // Pty
  GType function() c_vte_pty_get_type; ///
  VtePty* function(int fd, GCancellable* cancellable, GError** _err) c_vte_pty_new_foreign_sync; ///
  VtePty* function(VtePtyFlags flags, GCancellable* cancellable, GError** _err) c_vte_pty_new_sync; ///
  void function(VtePty* pty) c_vte_pty_child_setup; ///
  void function(VtePty* pty) c_vte_pty_close; ///
  int function(VtePty* pty) c_vte_pty_get_fd; ///
  gboolean function(VtePty* pty, int* rows, int* columns, GError** _err) c_vte_pty_get_size; ///
  gboolean function(VtePty* pty, int rows, int columns, GError** _err) c_vte_pty_set_size; ///
  gboolean function(VtePty* pty, gboolean utf8, GError** _err) c_vte_pty_set_utf8; ///
  void function(VtePty* pty, const(char)* workingDirectory, char** argv, char** envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_vte_pty_spawn_async; ///
  gboolean function(VtePty* pty, GAsyncResult* result, GPid* childPid, GError** _err) c_vte_pty_spawn_finish; ///
  void function(VtePty* pty, const(char)* workingDirectory, const(char*)* argv, const(char*)* envv, const(int)* fds, int nFds, const(int)* mapFds, int nMapFds, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_vte_pty_spawn_with_fds_async; ///

  // Regex
  GType function() c_vte_regex_get_type; ///
  VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, GError** _err) c_vte_regex_new_for_match; ///
  VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, uint extraFlags, size_t* errorOffset, GError** _err) c_vte_regex_new_for_match_full; ///
  VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, GError** _err) c_vte_regex_new_for_search; ///
  VteRegex* function(const(char)* pattern, ptrdiff_t patternLength, uint flags, uint extraFlags, size_t* errorOffset, GError** _err) c_vte_regex_new_for_search_full; ///
  gboolean function(VteRegex* regex, uint flags, GError** _err) c_vte_regex_jit; ///
  VteRegex* function(VteRegex* regex) c_vte_regex_ref; ///
  char* function(VteRegex* regex, const(char)* subject, const(char)* replacement, uint flags, GError** _err) c_vte_regex_substitute; ///
  VteRegex* function(VteRegex* regex) c_vte_regex_unref; ///

  // Terminal
  GType function() c_vte_terminal_get_type; ///
  GtkWidget* function() c_vte_terminal_new; ///
  void function(VteTerminal* terminal) c_vte_terminal_copy_clipboard; ///
  void function(VteTerminal* terminal, VteFormat format) c_vte_terminal_copy_clipboard_format; ///
  void function(VteTerminal* terminal) c_vte_terminal_copy_primary; ///
  gboolean function(VteTerminal* terminal, GdkEvent* event, GRegex** regexes, size_t nRegexes, GRegexMatchFlags matchFlags, char** matches) c_vte_terminal_event_check_gregex_simple; ///
  char** function(VteTerminal* terminal, GdkEvent* event, VteRegex** regexes, size_t nRegexes, uint matchFlags, size_t* nMatches) c_vte_terminal_event_check_regex_array; ///
  gboolean function(VteTerminal* terminal, GdkEvent* event, VteRegex** regexes, size_t nRegexes, uint matchFlags, char** matches) c_vte_terminal_event_check_regex_simple; ///
  void function(VteTerminal* terminal, const(ubyte)* data, ptrdiff_t length) c_vte_terminal_feed; ///
  void function(VteTerminal* terminal, const(ubyte)* text, ptrdiff_t length) c_vte_terminal_feed_child; ///
  void function(VteTerminal* terminal, const(ubyte)* data, size_t length) c_vte_terminal_feed_child_binary; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_allow_bold; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_allow_hyperlink; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_audible_bell; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_bold_is_bright; ///
  double function(VteTerminal* terminal) c_vte_terminal_get_cell_height_scale; ///
  double function(VteTerminal* terminal) c_vte_terminal_get_cell_width_scale; ///
  glong function(VteTerminal* terminal) c_vte_terminal_get_char_height; ///
  glong function(VteTerminal* terminal) c_vte_terminal_get_char_width; ///
  int function(VteTerminal* terminal) c_vte_terminal_get_cjk_ambiguous_width; ///
  void function(VteTerminal* terminal, GdkRGBA* color) c_vte_terminal_get_color_background_for_draw; ///
  glong function(VteTerminal* terminal) c_vte_terminal_get_column_count; ///
  GtkWidget* function(VteTerminal* terminal) c_vte_terminal_get_context_menu; ///
  GMenuModel* function(VteTerminal* terminal) c_vte_terminal_get_context_menu_model; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_current_container_name; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_current_container_runtime; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_current_directory_uri; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_current_file_uri; ///
  VteCursorBlinkMode function(VteTerminal* terminal) c_vte_terminal_get_cursor_blink_mode; ///
  void function(VteTerminal* terminal, glong* column, glong* row) c_vte_terminal_get_cursor_position; ///
  VteCursorShape function(VteTerminal* terminal) c_vte_terminal_get_cursor_shape; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_enable_a11y; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_enable_bidi; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_enable_fallback_scrolling; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_enable_shaping; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_enable_sixel; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_encoding; ///
  const(PangoFontDescription)* function(VteTerminal* terminal) c_vte_terminal_get_font; ///
  const(cairo_font_options_t)* function(VteTerminal* terminal) c_vte_terminal_get_font_options; ///
  double function(VteTerminal* terminal) c_vte_terminal_get_font_scale; ///
  void function(VteTerminal* terminal, GdkGeometry* hints, int minRows, int minColumns) c_vte_terminal_get_geometry_hints; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_has_selection; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_icon_title; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_input_enabled; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_mouse_autohide; ///
  VtePty* function(VteTerminal* terminal) c_vte_terminal_get_pty; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_rewrap_on_resize; ///
  glong function(VteTerminal* terminal) c_vte_terminal_get_row_count; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_scroll_on_insert; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_scroll_on_keystroke; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_scroll_on_output; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_scroll_unit_is_pixels; ///
  glong function(VteTerminal* terminal) c_vte_terminal_get_scrollback_lines; ///
  char* function(VteTerminal* terminal, VteSelectionFunc isSelected, void* userData, GArray* attributes) c_vte_terminal_get_text; ///
  VteTextBlinkMode function(VteTerminal* terminal) c_vte_terminal_get_text_blink_mode; ///
  char* function(VteTerminal* terminal, VteFormat format) c_vte_terminal_get_text_format; ///
  char* function(VteTerminal* terminal, VteSelectionFunc isSelected, void* userData, GArray* attributes) c_vte_terminal_get_text_include_trailing_spaces; ///
  char* function(VteTerminal* terminal, glong startRow, glong startCol, glong endRow, glong endCol, VteSelectionFunc isSelected, void* userData, GArray* attributes) c_vte_terminal_get_text_range; ///
  char* function(VteTerminal* terminal, VteFormat format, long startRow, long startCol, long endRow, long endCol, size_t* length) c_vte_terminal_get_text_range_format; ///
  char* function(VteTerminal* terminal, VteFormat format) c_vte_terminal_get_text_selected; ///
  char* function(VteTerminal* terminal, VteFormat format, size_t* length) c_vte_terminal_get_text_selected_full; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_window_title; ///
  const(char)* function(VteTerminal* terminal) c_vte_terminal_get_word_char_exceptions; ///
  VteAlign function(VteTerminal* terminal) c_vte_terminal_get_xalign; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_xfill; ///
  VteAlign function(VteTerminal* terminal) c_vte_terminal_get_yalign; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_get_yfill; ///
  char* function(VteTerminal* terminal, GdkEvent* event) c_vte_terminal_hyperlink_check_event; ///
  int function(VteTerminal* terminal, GRegex* gregex, GRegexMatchFlags gflags) c_vte_terminal_match_add_gregex; ///
  int function(VteTerminal* terminal, VteRegex* regex, uint flags) c_vte_terminal_match_add_regex; ///
  char* function(VteTerminal* terminal, glong column, glong row, int* tag) c_vte_terminal_match_check; ///
  char* function(VteTerminal* terminal, GdkEvent* event, int* tag) c_vte_terminal_match_check_event; ///
  void function(VteTerminal* terminal, int tag) c_vte_terminal_match_remove; ///
  void function(VteTerminal* terminal) c_vte_terminal_match_remove_all; ///
  void function(VteTerminal* terminal, int tag, GdkCursor* cursor) c_vte_terminal_match_set_cursor; ///
  void function(VteTerminal* terminal, int tag, const(char)* cursorName) c_vte_terminal_match_set_cursor_name; ///
  void function(VteTerminal* terminal, int tag, GdkCursorType cursorType) c_vte_terminal_match_set_cursor_type; ///
  void function(VteTerminal* terminal) c_vte_terminal_paste_clipboard; ///
  void function(VteTerminal* terminal) c_vte_terminal_paste_primary; ///
  void function(VteTerminal* terminal, const(char)* text) c_vte_terminal_paste_text; ///
  VtePty* function(VteTerminal* terminal, VtePtyFlags flags, GCancellable* cancellable, GError** _err) c_vte_terminal_pty_new_sync; ///
  void function(VteTerminal* terminal, gboolean clearTabstops, gboolean clearHistory) c_vte_terminal_reset; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_search_find_next; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_search_find_previous; ///
  GRegex* function(VteTerminal* terminal) c_vte_terminal_search_get_gregex; ///
  VteRegex* function(VteTerminal* terminal) c_vte_terminal_search_get_regex; ///
  gboolean function(VteTerminal* terminal) c_vte_terminal_search_get_wrap_around; ///
  void function(VteTerminal* terminal, GRegex* gregex, GRegexMatchFlags gflags) c_vte_terminal_search_set_gregex; ///
  void function(VteTerminal* terminal, VteRegex* regex, uint flags) c_vte_terminal_search_set_regex; ///
  void function(VteTerminal* terminal, gboolean wrapAround) c_vte_terminal_search_set_wrap_around; ///
  void function(VteTerminal* terminal) c_vte_terminal_select_all; ///
  void function(VteTerminal* terminal, gboolean allowBold) c_vte_terminal_set_allow_bold; ///
  void function(VteTerminal* terminal, gboolean allowHyperlink) c_vte_terminal_set_allow_hyperlink; ///
  void function(VteTerminal* terminal, gboolean isAudible) c_vte_terminal_set_audible_bell; ///
  void function(VteTerminal* terminal, VteEraseBinding binding) c_vte_terminal_set_backspace_binding; ///
  void function(VteTerminal* terminal, gboolean boldIsBright) c_vte_terminal_set_bold_is_bright; ///
  void function(VteTerminal* terminal, double scale) c_vte_terminal_set_cell_height_scale; ///
  void function(VteTerminal* terminal, double scale) c_vte_terminal_set_cell_width_scale; ///
  void function(VteTerminal* terminal, int width) c_vte_terminal_set_cjk_ambiguous_width; ///
  void function(VteTerminal* terminal, gboolean setting) c_vte_terminal_set_clear_background; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* background) c_vte_terminal_set_color_background; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* bold) c_vte_terminal_set_color_bold; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* cursorBackground) c_vte_terminal_set_color_cursor; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* cursorForeground) c_vte_terminal_set_color_cursor_foreground; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* foreground) c_vte_terminal_set_color_foreground; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* highlightBackground) c_vte_terminal_set_color_highlight; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* highlightForeground) c_vte_terminal_set_color_highlight_foreground; ///
  void function(VteTerminal* terminal, const(GdkRGBA)* foreground, const(GdkRGBA)* background, const(GdkRGBA)* palette, size_t paletteSize) c_vte_terminal_set_colors; ///
  void function(VteTerminal* terminal, GtkWidget* menu) c_vte_terminal_set_context_menu; ///
  void function(VteTerminal* terminal, GMenuModel* model) c_vte_terminal_set_context_menu_model; ///
  void function(VteTerminal* terminal, VteCursorBlinkMode mode) c_vte_terminal_set_cursor_blink_mode; ///
  void function(VteTerminal* terminal, VteCursorShape shape) c_vte_terminal_set_cursor_shape; ///
  void function(VteTerminal* terminal) c_vte_terminal_set_default_colors; ///
  void function(VteTerminal* terminal, VteEraseBinding binding) c_vte_terminal_set_delete_binding; ///
  void function(VteTerminal* terminal, gboolean enableA11y) c_vte_terminal_set_enable_a11y; ///
  void function(VteTerminal* terminal, gboolean enableBidi) c_vte_terminal_set_enable_bidi; ///
  void function(VteTerminal* terminal, gboolean enable) c_vte_terminal_set_enable_fallback_scrolling; ///
  void function(VteTerminal* terminal, gboolean enableShaping) c_vte_terminal_set_enable_shaping; ///
  void function(VteTerminal* terminal, gboolean enabled) c_vte_terminal_set_enable_sixel; ///
  gboolean function(VteTerminal* terminal, const(char)* codeset, GError** _err) c_vte_terminal_set_encoding; ///
  void function(VteTerminal* terminal, const(PangoFontDescription)* fontDesc) c_vte_terminal_set_font; ///
  void function(VteTerminal* terminal, const(cairo_font_options_t)* fontOptions) c_vte_terminal_set_font_options; ///
  void function(VteTerminal* terminal, double scale) c_vte_terminal_set_font_scale; ///
  void function(VteTerminal* terminal, GtkWindow* window) c_vte_terminal_set_geometry_hints_for_window; ///
  void function(VteTerminal* terminal, gboolean enabled) c_vte_terminal_set_input_enabled; ///
  void function(VteTerminal* terminal, gboolean setting) c_vte_terminal_set_mouse_autohide; ///
  void function(VteTerminal* terminal, VtePty* pty) c_vte_terminal_set_pty; ///
  void function(VteTerminal* terminal, gboolean rewrap) c_vte_terminal_set_rewrap_on_resize; ///
  void function(VteTerminal* terminal, gboolean scroll) c_vte_terminal_set_scroll_on_insert; ///
  void function(VteTerminal* terminal, gboolean scroll) c_vte_terminal_set_scroll_on_keystroke; ///
  void function(VteTerminal* terminal, gboolean scroll) c_vte_terminal_set_scroll_on_output; ///
  void function(VteTerminal* terminal, gboolean enable) c_vte_terminal_set_scroll_unit_is_pixels; ///
  void function(VteTerminal* terminal, glong lines) c_vte_terminal_set_scrollback_lines; ///
  void function(VteTerminal* terminal, glong columns, glong rows) c_vte_terminal_set_size; ///
  void function(VteTerminal* terminal, VteTextBlinkMode textBlinkMode) c_vte_terminal_set_text_blink_mode; ///
  void function(VteTerminal* terminal, const(char)* exceptions) c_vte_terminal_set_word_char_exceptions; ///
  void function(VteTerminal* terminal, VteAlign align_) c_vte_terminal_set_xalign; ///
  void function(VteTerminal* terminal, gboolean fill) c_vte_terminal_set_xfill; ///
  void function(VteTerminal* terminal, VteAlign align_) c_vte_terminal_set_yalign; ///
  void function(VteTerminal* terminal, gboolean fill) c_vte_terminal_set_yfill; ///
  void function(VteTerminal* terminal, VtePtyFlags ptyFlags, const(char)* workingDirectory, char** argv, char** envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, VteTerminalSpawnAsyncCallback callback, void* userData) c_vte_terminal_spawn_async; ///
  gboolean function(VteTerminal* terminal, VtePtyFlags ptyFlags, const(char)* workingDirectory, char** argv, char** envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GPid* childPid, GCancellable* cancellable, GError** _err) c_vte_terminal_spawn_sync; ///
  void function(VteTerminal* terminal, VtePtyFlags ptyFlags, const(char)* workingDirectory, const(char*)* argv, const(char*)* envv, const(int)* fds, int nFds, const(int)* mapFds, int nMapFds, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, GCancellable* cancellable, VteTerminalSpawnAsyncCallback callback, void* userData) c_vte_terminal_spawn_with_fds_async; ///
  void function(VteTerminal* terminal) c_vte_terminal_unselect_all; ///
  void function(VteTerminal* terminal, GPid childPid) c_vte_terminal_watch_child; ///
  gboolean function(VteTerminal* terminal, GOutputStream* stream, VteWriteFlags flags, GCancellable* cancellable, GError** _err) c_vte_terminal_write_contents_sync; ///

  // global
  GType function() c_vte_event_context_get_type; ///
  gboolean function(const(char)* encoding) c_vte_get_encoding_supported; ///
  char** function(gboolean includeAliases) c_vte_get_encodings; ///
  VteFeatureFlags function() c_vte_get_feature_flags; ///
  const(char)* function() c_vte_get_features; ///
  uint function() c_vte_get_major_version; ///
  uint function() c_vte_get_micro_version; ///
  uint function() c_vte_get_minor_version; ///
  char* function() c_vte_get_user_shell; ///
  void function(ulong flags) c_vte_set_test_flags; ///

  // PtyError
  GQuark function() c_vte_pty_error_quark; ///

  // RegexError
  GQuark function() c_vte_regex_error_quark; ///
}

// EventContext

/** */
alias vte_event_context_get_event = c_vte_event_context_get_event;

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
alias vte_terminal_copy_clipboard = c_vte_terminal_copy_clipboard;

/** */
alias vte_terminal_copy_clipboard_format = c_vte_terminal_copy_clipboard_format;

/** */
alias vte_terminal_copy_primary = c_vte_terminal_copy_primary;

/** */
alias vte_terminal_event_check_gregex_simple = c_vte_terminal_event_check_gregex_simple;

/** */
alias vte_terminal_event_check_regex_array = c_vte_terminal_event_check_regex_array;

/** */
alias vte_terminal_event_check_regex_simple = c_vte_terminal_event_check_regex_simple;

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
alias vte_terminal_get_current_container_name = c_vte_terminal_get_current_container_name;

/** */
alias vte_terminal_get_current_container_runtime = c_vte_terminal_get_current_container_runtime;

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
alias vte_terminal_get_geometry_hints = c_vte_terminal_get_geometry_hints;

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
alias vte_terminal_hyperlink_check_event = c_vte_terminal_hyperlink_check_event;

/** */
alias vte_terminal_match_add_gregex = c_vte_terminal_match_add_gregex;

/** */
alias vte_terminal_match_add_regex = c_vte_terminal_match_add_regex;

/** */
alias vte_terminal_match_check = c_vte_terminal_match_check;

/** */
alias vte_terminal_match_check_event = c_vte_terminal_match_check_event;

/** */
alias vte_terminal_match_remove = c_vte_terminal_match_remove;

/** */
alias vte_terminal_match_remove_all = c_vte_terminal_match_remove_all;

/** */
alias vte_terminal_match_set_cursor = c_vte_terminal_match_set_cursor;

/** */
alias vte_terminal_match_set_cursor_name = c_vte_terminal_match_set_cursor_name;

/** */
alias vte_terminal_match_set_cursor_type = c_vte_terminal_match_set_cursor_type;

/** */
alias vte_terminal_paste_clipboard = c_vte_terminal_paste_clipboard;

/** */
alias vte_terminal_paste_primary = c_vte_terminal_paste_primary;

/** */
alias vte_terminal_paste_text = c_vte_terminal_paste_text;

/** */
alias vte_terminal_pty_new_sync = c_vte_terminal_pty_new_sync;

/** */
alias vte_terminal_reset = c_vte_terminal_reset;

/** */
alias vte_terminal_search_find_next = c_vte_terminal_search_find_next;

/** */
alias vte_terminal_search_find_previous = c_vte_terminal_search_find_previous;

/** */
alias vte_terminal_search_get_gregex = c_vte_terminal_search_get_gregex;

/** */
alias vte_terminal_search_get_regex = c_vte_terminal_search_get_regex;

/** */
alias vte_terminal_search_get_wrap_around = c_vte_terminal_search_get_wrap_around;

/** */
alias vte_terminal_search_set_gregex = c_vte_terminal_search_set_gregex;

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
alias vte_terminal_set_geometry_hints_for_window = c_vte_terminal_set_geometry_hints_for_window;

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

// global

/** */
alias vte_event_context_get_type = c_vte_event_context_get_type;

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
alias vte_get_user_shell = c_vte_get_user_shell;

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
  gidLink(cast(void**)&vte_event_context_get_event, "vte_event_context_get_event", libs);

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
  gidLink(cast(void**)&vte_terminal_copy_clipboard, "vte_terminal_copy_clipboard", libs);
  gidLink(cast(void**)&vte_terminal_copy_clipboard_format, "vte_terminal_copy_clipboard_format", libs);
  gidLink(cast(void**)&vte_terminal_copy_primary, "vte_terminal_copy_primary", libs);
  gidLink(cast(void**)&vte_terminal_event_check_gregex_simple, "vte_terminal_event_check_gregex_simple", libs);
  gidLink(cast(void**)&vte_terminal_event_check_regex_array, "vte_terminal_event_check_regex_array", libs);
  gidLink(cast(void**)&vte_terminal_event_check_regex_simple, "vte_terminal_event_check_regex_simple", libs);
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
  gidLink(cast(void**)&vte_terminal_get_current_container_name, "vte_terminal_get_current_container_name", libs);
  gidLink(cast(void**)&vte_terminal_get_current_container_runtime, "vte_terminal_get_current_container_runtime", libs);
  gidLink(cast(void**)&vte_terminal_get_current_directory_uri, "vte_terminal_get_current_directory_uri", libs);
  gidLink(cast(void**)&vte_terminal_get_current_file_uri, "vte_terminal_get_current_file_uri", libs);
  gidLink(cast(void**)&vte_terminal_get_cursor_blink_mode, "vte_terminal_get_cursor_blink_mode", libs);
  gidLink(cast(void**)&vte_terminal_get_cursor_position, "vte_terminal_get_cursor_position", libs);
  gidLink(cast(void**)&vte_terminal_get_cursor_shape, "vte_terminal_get_cursor_shape", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_a11y, "vte_terminal_get_enable_a11y", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_bidi, "vte_terminal_get_enable_bidi", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_fallback_scrolling, "vte_terminal_get_enable_fallback_scrolling", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_shaping, "vte_terminal_get_enable_shaping", libs);
  gidLink(cast(void**)&vte_terminal_get_enable_sixel, "vte_terminal_get_enable_sixel", libs);
  gidLink(cast(void**)&vte_terminal_get_encoding, "vte_terminal_get_encoding", libs);
  gidLink(cast(void**)&vte_terminal_get_font, "vte_terminal_get_font", libs);
  gidLink(cast(void**)&vte_terminal_get_font_options, "vte_terminal_get_font_options", libs);
  gidLink(cast(void**)&vte_terminal_get_font_scale, "vte_terminal_get_font_scale", libs);
  gidLink(cast(void**)&vte_terminal_get_geometry_hints, "vte_terminal_get_geometry_hints", libs);
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
  gidLink(cast(void**)&vte_terminal_hyperlink_check_event, "vte_terminal_hyperlink_check_event", libs);
  gidLink(cast(void**)&vte_terminal_match_add_gregex, "vte_terminal_match_add_gregex", libs);
  gidLink(cast(void**)&vte_terminal_match_add_regex, "vte_terminal_match_add_regex", libs);
  gidLink(cast(void**)&vte_terminal_match_check, "vte_terminal_match_check", libs);
  gidLink(cast(void**)&vte_terminal_match_check_event, "vte_terminal_match_check_event", libs);
  gidLink(cast(void**)&vte_terminal_match_remove, "vte_terminal_match_remove", libs);
  gidLink(cast(void**)&vte_terminal_match_remove_all, "vte_terminal_match_remove_all", libs);
  gidLink(cast(void**)&vte_terminal_match_set_cursor, "vte_terminal_match_set_cursor", libs);
  gidLink(cast(void**)&vte_terminal_match_set_cursor_name, "vte_terminal_match_set_cursor_name", libs);
  gidLink(cast(void**)&vte_terminal_match_set_cursor_type, "vte_terminal_match_set_cursor_type", libs);
  gidLink(cast(void**)&vte_terminal_paste_clipboard, "vte_terminal_paste_clipboard", libs);
  gidLink(cast(void**)&vte_terminal_paste_primary, "vte_terminal_paste_primary", libs);
  gidLink(cast(void**)&vte_terminal_paste_text, "vte_terminal_paste_text", libs);
  gidLink(cast(void**)&vte_terminal_pty_new_sync, "vte_terminal_pty_new_sync", libs);
  gidLink(cast(void**)&vte_terminal_reset, "vte_terminal_reset", libs);
  gidLink(cast(void**)&vte_terminal_search_find_next, "vte_terminal_search_find_next", libs);
  gidLink(cast(void**)&vte_terminal_search_find_previous, "vte_terminal_search_find_previous", libs);
  gidLink(cast(void**)&vte_terminal_search_get_gregex, "vte_terminal_search_get_gregex", libs);
  gidLink(cast(void**)&vte_terminal_search_get_regex, "vte_terminal_search_get_regex", libs);
  gidLink(cast(void**)&vte_terminal_search_get_wrap_around, "vte_terminal_search_get_wrap_around", libs);
  gidLink(cast(void**)&vte_terminal_search_set_gregex, "vte_terminal_search_set_gregex", libs);
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
  gidLink(cast(void**)&vte_terminal_set_enable_shaping, "vte_terminal_set_enable_shaping", libs);
  gidLink(cast(void**)&vte_terminal_set_enable_sixel, "vte_terminal_set_enable_sixel", libs);
  gidLink(cast(void**)&vte_terminal_set_encoding, "vte_terminal_set_encoding", libs);
  gidLink(cast(void**)&vte_terminal_set_font, "vte_terminal_set_font", libs);
  gidLink(cast(void**)&vte_terminal_set_font_options, "vte_terminal_set_font_options", libs);
  gidLink(cast(void**)&vte_terminal_set_font_scale, "vte_terminal_set_font_scale", libs);
  gidLink(cast(void**)&vte_terminal_set_geometry_hints_for_window, "vte_terminal_set_geometry_hints_for_window", libs);
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

  // global
  gidLink(cast(void**)&vte_event_context_get_type, "vte_event_context_get_type", libs);
  gidLink(cast(void**)&vte_get_encoding_supported, "vte_get_encoding_supported", libs);
  gidLink(cast(void**)&vte_get_encodings, "vte_get_encodings", libs);
  gidLink(cast(void**)&vte_get_feature_flags, "vte_get_feature_flags", libs);
  gidLink(cast(void**)&vte_get_features, "vte_get_features", libs);
  gidLink(cast(void**)&vte_get_major_version, "vte_get_major_version", libs);
  gidLink(cast(void**)&vte_get_micro_version, "vte_get_micro_version", libs);
  gidLink(cast(void**)&vte_get_minor_version, "vte_get_minor_version", libs);
  gidLink(cast(void**)&vte_get_user_shell, "vte_get_user_shell", libs);
  gidLink(cast(void**)&vte_set_test_flags, "vte_set_test_flags", libs);

  // PtyError
  gidLink(cast(void**)&vte_pty_error_quark, "vte_pty_error_quark", libs);

  // RegexError
  gidLink(cast(void**)&vte_regex_error_quark, "vte_regex_error_quark", libs);
}
