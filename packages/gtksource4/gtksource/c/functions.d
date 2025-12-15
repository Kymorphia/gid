/// C functions for gtksource4 library
module gtksource.c.functions;

public import gid.basictypes;
import gid.loader;
import gtksource.c.types;
public import gdk.c.types;
public import gtk.c.types;

version(Windows)
  private immutable LIBS = ["libgtksourceview-4-0.dll;gtksourceview-4-0.dll;gtksourceview-4.dll"];
else version(OSX)
  private immutable LIBS = ["libgtksourceview-4.0.dylib"];
else
  private immutable LIBS = ["libgtksourceview-4.so.0"];

__gshared extern(C)
{
  // Buffer
  GType function() c_gtk_source_buffer_get_type; ///
  GtkSourceBuffer* function(GtkTextTagTable* table) c_gtk_source_buffer_new; ///
  GtkSourceBuffer* function(GtkSourceLanguage* language) c_gtk_source_buffer_new_with_language; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) c_gtk_source_buffer_backward_iter_to_source_mark; ///
  void function(GtkSourceBuffer* buffer) c_gtk_source_buffer_begin_not_undoable_action; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_can_redo; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_can_undo; ///
  void function(GtkSourceBuffer* buffer, GtkSourceChangeCaseType caseType, GtkTextIter* start, GtkTextIter* end) c_gtk_source_buffer_change_case; ///
  GtkSourceMark* function(GtkSourceBuffer* buffer, const(char)* name, const(char)* category, const(GtkTextIter)* where) c_gtk_source_buffer_create_source_mark; ///
  GtkTextTag* function(GtkSourceBuffer* buffer, const(char)* tagName, const(char)* firstPropertyName,  ...) c_gtk_source_buffer_create_source_tag; ///
  void function(GtkSourceBuffer* buffer) c_gtk_source_buffer_end_not_undoable_action; ///
  void function(GtkSourceBuffer* buffer, const(GtkTextIter)* start, const(GtkTextIter)* end) c_gtk_source_buffer_ensure_highlight; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) c_gtk_source_buffer_forward_iter_to_source_mark; ///
  char** function(GtkSourceBuffer* buffer, const(GtkTextIter)* iter) c_gtk_source_buffer_get_context_classes_at_iter; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_highlight_matching_brackets; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_highlight_syntax; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_implicit_trailing_newline; ///
  GtkSourceLanguage* function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_language; ///
  int function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_max_undo_levels; ///
  GSList* function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) c_gtk_source_buffer_get_source_marks_at_iter; ///
  GSList* function(GtkSourceBuffer* buffer, int line, const(char)* category) c_gtk_source_buffer_get_source_marks_at_line; ///
  GtkSourceStyleScheme* function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_style_scheme; ///
  GtkSourceUndoManager* function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_undo_manager; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* contextClass) c_gtk_source_buffer_iter_backward_to_context_class_toggle; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* contextClass) c_gtk_source_buffer_iter_forward_to_context_class_toggle; ///
  gboolean function(GtkSourceBuffer* buffer, const(GtkTextIter)* iter, const(char)* contextClass) c_gtk_source_buffer_iter_has_context_class; ///
  void function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end) c_gtk_source_buffer_join_lines; ///
  void function(GtkSourceBuffer* buffer) c_gtk_source_buffer_redo; ///
  void function(GtkSourceBuffer* buffer, const(GtkTextIter)* start, const(GtkTextIter)* end, const(char)* category) c_gtk_source_buffer_remove_source_marks; ///
  void function(GtkSourceBuffer* buffer, gboolean highlight) c_gtk_source_buffer_set_highlight_matching_brackets; ///
  void function(GtkSourceBuffer* buffer, gboolean highlight) c_gtk_source_buffer_set_highlight_syntax; ///
  void function(GtkSourceBuffer* buffer, gboolean implicitTrailingNewline) c_gtk_source_buffer_set_implicit_trailing_newline; ///
  void function(GtkSourceBuffer* buffer, GtkSourceLanguage* language) c_gtk_source_buffer_set_language; ///
  void function(GtkSourceBuffer* buffer, int maxUndoLevels) c_gtk_source_buffer_set_max_undo_levels; ///
  void function(GtkSourceBuffer* buffer, GtkSourceStyleScheme* scheme) c_gtk_source_buffer_set_style_scheme; ///
  void function(GtkSourceBuffer* buffer, GtkSourceUndoManager* manager) c_gtk_source_buffer_set_undo_manager; ///
  void function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end, GtkSourceSortFlags flags, int column) c_gtk_source_buffer_sort_lines; ///
  void function(GtkSourceBuffer* buffer) c_gtk_source_buffer_undo; ///

  // Completion
  GType function() c_gtk_source_completion_get_type; ///
  gboolean function(GtkSourceCompletion* completion, GtkSourceCompletionProvider* provider, GError** _err) c_gtk_source_completion_add_provider; ///
  void function(GtkSourceCompletion* completion) c_gtk_source_completion_block_interactive; ///
  GtkSourceCompletionContext* function(GtkSourceCompletion* completion, GtkTextIter* position) c_gtk_source_completion_create_context; ///
  GtkSourceCompletionInfo* function(GtkSourceCompletion* completion) c_gtk_source_completion_get_info_window; ///
  GList* function(GtkSourceCompletion* completion) c_gtk_source_completion_get_providers; ///
  GtkSourceView* function(GtkSourceCompletion* completion) c_gtk_source_completion_get_view; ///
  void function(GtkSourceCompletion* completion) c_gtk_source_completion_hide; ///
  gboolean function(GtkSourceCompletion* completion, GtkSourceCompletionProvider* provider, GError** _err) c_gtk_source_completion_remove_provider; ///
  gboolean function(GtkSourceCompletion* completion, GList* providers, GtkSourceCompletionContext* context) c_gtk_source_completion_start; ///
  void function(GtkSourceCompletion* completion) c_gtk_source_completion_unblock_interactive; ///

  // CompletionContext
  GType function() c_gtk_source_completion_context_get_type; ///
  void function(GtkSourceCompletionContext* context, GtkSourceCompletionProvider* provider, GList* proposals, gboolean finished) c_gtk_source_completion_context_add_proposals; ///
  GtkSourceCompletionActivation function(GtkSourceCompletionContext* context) c_gtk_source_completion_context_get_activation; ///
  gboolean function(GtkSourceCompletionContext* context, GtkTextIter* iter) c_gtk_source_completion_context_get_iter; ///

  // CompletionInfo
  GType function() c_gtk_source_completion_info_get_type; ///
  GtkSourceCompletionInfo* function() c_gtk_source_completion_info_new; ///
  void function(GtkSourceCompletionInfo* info, GtkTextView* view, GtkTextIter* iter) c_gtk_source_completion_info_move_to_iter; ///

  // CompletionItem
  GType function() c_gtk_source_completion_item_get_type; ///
  GtkSourceCompletionItem* function() c_gtk_source_completion_item_new; ///
  void function(GtkSourceCompletionItem* item, GIcon* gicon) c_gtk_source_completion_item_set_gicon; ///
  void function(GtkSourceCompletionItem* item, GdkPixbuf* icon) c_gtk_source_completion_item_set_icon; ///
  void function(GtkSourceCompletionItem* item, const(char)* iconName) c_gtk_source_completion_item_set_icon_name; ///
  void function(GtkSourceCompletionItem* item, const(char)* info) c_gtk_source_completion_item_set_info; ///
  void function(GtkSourceCompletionItem* item, const(char)* label) c_gtk_source_completion_item_set_label; ///
  void function(GtkSourceCompletionItem* item, const(char)* markup) c_gtk_source_completion_item_set_markup; ///
  void function(GtkSourceCompletionItem* item, const(char)* text) c_gtk_source_completion_item_set_text; ///

  // CompletionProposal
  GType function() c_gtk_source_completion_proposal_get_type; ///
  void function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_changed; ///
  gboolean function(GtkSourceCompletionProposal* proposal, GtkSourceCompletionProposal* other) c_gtk_source_completion_proposal_equal; ///
  GIcon* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_gicon; ///
  GdkPixbuf* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_icon; ///
  const(char)* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_icon_name; ///
  char* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_info; ///
  char* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_label; ///
  char* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_markup; ///
  char* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_text; ///
  uint function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_hash; ///

  // CompletionProvider
  GType function() c_gtk_source_completion_provider_get_type; ///
  gboolean function(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal, GtkTextIter* iter) c_gtk_source_completion_provider_activate_proposal; ///
  GtkSourceCompletionActivation function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_activation; ///
  GIcon* function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_gicon; ///
  GdkPixbuf* function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_icon; ///
  const(char)* function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_icon_name; ///
  GtkWidget* function(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal) c_gtk_source_completion_provider_get_info_widget; ///
  int function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_interactive_delay; ///
  char* function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_name; ///
  int function(GtkSourceCompletionProvider* provider) c_gtk_source_completion_provider_get_priority; ///
  gboolean function(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkTextIter* iter) c_gtk_source_completion_provider_get_start_iter; ///
  gboolean function(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context) c_gtk_source_completion_provider_match; ///
  void function(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context) c_gtk_source_completion_provider_populate; ///
  void function(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal, GtkSourceCompletionInfo* info) c_gtk_source_completion_provider_update_info; ///

  // CompletionWords
  GType function() c_gtk_source_completion_words_get_type; ///
  GtkSourceCompletionWords* function(const(char)* name, GdkPixbuf* icon) c_gtk_source_completion_words_new; ///
  void function(GtkSourceCompletionWords* words, GtkTextBuffer* buffer) c_gtk_source_completion_words_register; ///
  void function(GtkSourceCompletionWords* words, GtkTextBuffer* buffer) c_gtk_source_completion_words_unregister; ///

  // Encoding
  GType function() c_gtk_source_encoding_get_type; ///
  GtkSourceEncoding* function(const(GtkSourceEncoding)* enc) c_gtk_source_encoding_copy; ///
  void function(GtkSourceEncoding* enc) c_gtk_source_encoding_free; ///
  const(char)* function(const(GtkSourceEncoding)* enc) c_gtk_source_encoding_get_charset; ///
  const(char)* function(const(GtkSourceEncoding)* enc) c_gtk_source_encoding_get_name; ///
  char* function(const(GtkSourceEncoding)* enc) c_gtk_source_encoding_to_string; ///
  GSList* function() c_gtk_source_encoding_get_all; ///
  const(GtkSourceEncoding)* function() c_gtk_source_encoding_get_current; ///
  GSList* function() c_gtk_source_encoding_get_default_candidates; ///
  const(GtkSourceEncoding)* function(const(char)* charset) c_gtk_source_encoding_get_from_charset; ///
  const(GtkSourceEncoding)* function() c_gtk_source_encoding_get_utf8; ///

  // File
  GType function() c_gtk_source_file_get_type; ///
  GtkSourceFile* function() c_gtk_source_file_new; ///
  void function(GtkSourceFile* file) c_gtk_source_file_check_file_on_disk; ///
  GtkSourceCompressionType function(GtkSourceFile* file) c_gtk_source_file_get_compression_type; ///
  const(GtkSourceEncoding)* function(GtkSourceFile* file) c_gtk_source_file_get_encoding; ///
  GFile* function(GtkSourceFile* file) c_gtk_source_file_get_location; ///
  GtkSourceNewlineType function(GtkSourceFile* file) c_gtk_source_file_get_newline_type; ///
  gboolean function(GtkSourceFile* file) c_gtk_source_file_is_deleted; ///
  gboolean function(GtkSourceFile* file) c_gtk_source_file_is_externally_modified; ///
  gboolean function(GtkSourceFile* file) c_gtk_source_file_is_local; ///
  gboolean function(GtkSourceFile* file) c_gtk_source_file_is_readonly; ///
  void function(GtkSourceFile* file, GFile* location) c_gtk_source_file_set_location; ///
  void function(GtkSourceFile* file, GtkSourceMountOperationFactory callback, void* userData, GDestroyNotify notify) c_gtk_source_file_set_mount_operation_factory; ///

  // FileLoader
  GType function() c_gtk_source_file_loader_get_type; ///
  GtkSourceFileLoader* function(GtkSourceBuffer* buffer, GtkSourceFile* file) c_gtk_source_file_loader_new; ///
  GtkSourceFileLoader* function(GtkSourceBuffer* buffer, GtkSourceFile* file, GInputStream* stream) c_gtk_source_file_loader_new_from_stream; ///
  GtkSourceBuffer* function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_buffer; ///
  GtkSourceCompressionType function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_compression_type; ///
  const(GtkSourceEncoding)* function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_encoding; ///
  GtkSourceFile* function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_file; ///
  GInputStream* function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_input_stream; ///
  GFile* function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_location; ///
  GtkSourceNewlineType function(GtkSourceFileLoader* loader) c_gtk_source_file_loader_get_newline_type; ///
  void function(GtkSourceFileLoader* loader, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GDestroyNotify progressCallbackNotify, GAsyncReadyCallback callback, void* userData) c_gtk_source_file_loader_load_async; ///
  gboolean function(GtkSourceFileLoader* loader, GAsyncResult* result, GError** _err) c_gtk_source_file_loader_load_finish; ///
  void function(GtkSourceFileLoader* loader, GSList* candidateEncodings) c_gtk_source_file_loader_set_candidate_encodings; ///

  // FileSaver
  GType function() c_gtk_source_file_saver_get_type; ///
  GtkSourceFileSaver* function(GtkSourceBuffer* buffer, GtkSourceFile* file) c_gtk_source_file_saver_new; ///
  GtkSourceFileSaver* function(GtkSourceBuffer* buffer, GtkSourceFile* file, GFile* targetLocation) c_gtk_source_file_saver_new_with_target; ///
  GtkSourceBuffer* function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_buffer; ///
  GtkSourceCompressionType function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_compression_type; ///
  const(GtkSourceEncoding)* function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_encoding; ///
  GtkSourceFile* function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_file; ///
  GtkSourceFileSaverFlags function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_flags; ///
  GFile* function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_location; ///
  GtkSourceNewlineType function(GtkSourceFileSaver* saver) c_gtk_source_file_saver_get_newline_type; ///
  void function(GtkSourceFileSaver* saver, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GDestroyNotify progressCallbackNotify, GAsyncReadyCallback callback, void* userData) c_gtk_source_file_saver_save_async; ///
  gboolean function(GtkSourceFileSaver* saver, GAsyncResult* result, GError** _err) c_gtk_source_file_saver_save_finish; ///
  void function(GtkSourceFileSaver* saver, GtkSourceCompressionType compressionType) c_gtk_source_file_saver_set_compression_type; ///
  void function(GtkSourceFileSaver* saver, const(GtkSourceEncoding)* encoding) c_gtk_source_file_saver_set_encoding; ///
  void function(GtkSourceFileSaver* saver, GtkSourceFileSaverFlags flags) c_gtk_source_file_saver_set_flags; ///
  void function(GtkSourceFileSaver* saver, GtkSourceNewlineType newlineType) c_gtk_source_file_saver_set_newline_type; ///

  // Gutter
  GType function() c_gtk_source_gutter_get_type; ///
  GtkSourceGutterRenderer* function(GtkSourceGutter* gutter, int x, int y) c_gtk_source_gutter_get_renderer_at_pos; ///
  GtkSourceView* function(GtkSourceGutter* gutter) c_gtk_source_gutter_get_view; ///
  GtkTextWindowType function(GtkSourceGutter* gutter) c_gtk_source_gutter_get_window_type; ///
  gboolean function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer, int position) c_gtk_source_gutter_insert; ///
  void function(GtkSourceGutter* gutter) c_gtk_source_gutter_queue_draw; ///
  void function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_remove; ///
  void function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer, int position) c_gtk_source_gutter_reorder; ///

  // GutterRenderer
  GType function() c_gtk_source_gutter_renderer_get_type; ///
  void function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event) c_gtk_source_gutter_renderer_activate; ///
  void function(GtkSourceGutterRenderer* renderer, cairo_t* cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, GtkTextIter* start, GtkTextIter* end) c_gtk_source_gutter_renderer_begin; ///
  void function(GtkSourceGutterRenderer* renderer, cairo_t* cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state) c_gtk_source_gutter_renderer_draw; ///
  void function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_end; ///
  void function(GtkSourceGutterRenderer* renderer, float* xalign, float* yalign) c_gtk_source_gutter_renderer_get_alignment; ///
  GtkSourceGutterRendererAlignmentMode function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_alignment_mode; ///
  gboolean function(GtkSourceGutterRenderer* renderer, GdkRGBA* color) c_gtk_source_gutter_renderer_get_background; ///
  void function(GtkSourceGutterRenderer* renderer, int* xpad, int* ypad) c_gtk_source_gutter_renderer_get_padding; ///
  int function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_size; ///
  GtkTextView* function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_view; ///
  gboolean function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_visible; ///
  GtkTextWindowType function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_window_type; ///
  gboolean function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event) c_gtk_source_gutter_renderer_query_activatable; ///
  void function(GtkSourceGutterRenderer* renderer, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state) c_gtk_source_gutter_renderer_query_data; ///
  gboolean function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, int x, int y, GtkTooltip* tooltip) c_gtk_source_gutter_renderer_query_tooltip; ///
  void function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_queue_draw; ///
  void function(GtkSourceGutterRenderer* renderer, float xalign, float yalign) c_gtk_source_gutter_renderer_set_alignment; ///
  void function(GtkSourceGutterRenderer* renderer, GtkSourceGutterRendererAlignmentMode mode) c_gtk_source_gutter_renderer_set_alignment_mode; ///
  void function(GtkSourceGutterRenderer* renderer, const(GdkRGBA)* color) c_gtk_source_gutter_renderer_set_background; ///
  void function(GtkSourceGutterRenderer* renderer, int xpad, int ypad) c_gtk_source_gutter_renderer_set_padding; ///
  void function(GtkSourceGutterRenderer* renderer, int size) c_gtk_source_gutter_renderer_set_size; ///
  void function(GtkSourceGutterRenderer* renderer, gboolean visible) c_gtk_source_gutter_renderer_set_visible; ///

  // GutterRendererPixbuf
  GType function() c_gtk_source_gutter_renderer_pixbuf_get_type; ///
  GtkSourceGutterRenderer* function() c_gtk_source_gutter_renderer_pixbuf_new; ///
  GIcon* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_gicon; ///
  const(char)* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_icon_name; ///
  GdkPixbuf* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_pixbuf; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, GIcon* icon) c_gtk_source_gutter_renderer_pixbuf_set_gicon; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, const(char)* iconName) c_gtk_source_gutter_renderer_pixbuf_set_icon_name; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, GdkPixbuf* pixbuf) c_gtk_source_gutter_renderer_pixbuf_set_pixbuf; ///

  // GutterRendererText
  GType function() c_gtk_source_gutter_renderer_text_get_type; ///
  GtkSourceGutterRenderer* function() c_gtk_source_gutter_renderer_text_new; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* text, int* width, int* height) c_gtk_source_gutter_renderer_text_measure; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* markup, int* width, int* height) c_gtk_source_gutter_renderer_text_measure_markup; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* markup, int length) c_gtk_source_gutter_renderer_text_set_markup; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* text, int length) c_gtk_source_gutter_renderer_text_set_text; ///

  // Language
  GType function() c_gtk_source_language_get_type; ///
  char** function(GtkSourceLanguage* language) c_gtk_source_language_get_globs; ///
  gboolean function(GtkSourceLanguage* language) c_gtk_source_language_get_hidden; ///
  const(char)* function(GtkSourceLanguage* language) c_gtk_source_language_get_id; ///
  const(char)* function(GtkSourceLanguage* language, const(char)* name) c_gtk_source_language_get_metadata; ///
  char** function(GtkSourceLanguage* language) c_gtk_source_language_get_mime_types; ///
  const(char)* function(GtkSourceLanguage* language) c_gtk_source_language_get_name; ///
  const(char)* function(GtkSourceLanguage* language) c_gtk_source_language_get_section; ///
  const(char)* function(GtkSourceLanguage* language, const(char)* styleId) c_gtk_source_language_get_style_fallback; ///
  char** function(GtkSourceLanguage* language) c_gtk_source_language_get_style_ids; ///
  const(char)* function(GtkSourceLanguage* language, const(char)* styleId) c_gtk_source_language_get_style_name; ///

  // LanguageManager
  GType function() c_gtk_source_language_manager_get_type; ///
  GtkSourceLanguageManager* function() c_gtk_source_language_manager_new; ///
  GtkSourceLanguageManager* function() c_gtk_source_language_manager_get_default; ///
  GtkSourceLanguage* function(GtkSourceLanguageManager* lm, const(char)* id) c_gtk_source_language_manager_get_language; ///
  const(char*)* function(GtkSourceLanguageManager* lm) c_gtk_source_language_manager_get_language_ids; ///
  const(char*)* function(GtkSourceLanguageManager* lm) c_gtk_source_language_manager_get_search_path; ///
  GtkSourceLanguage* function(GtkSourceLanguageManager* lm, const(char)* filename, const(char)* contentType) c_gtk_source_language_manager_guess_language; ///
  void function(GtkSourceLanguageManager* lm, char** dirs) c_gtk_source_language_manager_set_search_path; ///

  // Map
  GType function() c_gtk_source_map_get_type; ///
  GtkWidget* function() c_gtk_source_map_new; ///
  GtkSourceView* function(GtkSourceMap* map) c_gtk_source_map_get_view; ///
  void function(GtkSourceMap* map, GtkSourceView* view) c_gtk_source_map_set_view; ///

  // Mark
  GType function() c_gtk_source_mark_get_type; ///
  GtkSourceMark* function(const(char)* name, const(char)* category) c_gtk_source_mark_new; ///
  const(char)* function(GtkSourceMark* mark) c_gtk_source_mark_get_category; ///
  GtkSourceMark* function(GtkSourceMark* mark, const(char)* category) c_gtk_source_mark_next; ///
  GtkSourceMark* function(GtkSourceMark* mark, const(char)* category) c_gtk_source_mark_prev; ///

  // MarkAttributes
  GType function() c_gtk_source_mark_attributes_get_type; ///
  GtkSourceMarkAttributes* function() c_gtk_source_mark_attributes_new; ///
  gboolean function(GtkSourceMarkAttributes* attributes, GdkRGBA* background) c_gtk_source_mark_attributes_get_background; ///
  GIcon* function(GtkSourceMarkAttributes* attributes) c_gtk_source_mark_attributes_get_gicon; ///
  const(char)* function(GtkSourceMarkAttributes* attributes) c_gtk_source_mark_attributes_get_icon_name; ///
  const(GdkPixbuf)* function(GtkSourceMarkAttributes* attributes) c_gtk_source_mark_attributes_get_pixbuf; ///
  char* function(GtkSourceMarkAttributes* attributes, GtkSourceMark* mark) c_gtk_source_mark_attributes_get_tooltip_markup; ///
  char* function(GtkSourceMarkAttributes* attributes, GtkSourceMark* mark) c_gtk_source_mark_attributes_get_tooltip_text; ///
  const(GdkPixbuf)* function(GtkSourceMarkAttributes* attributes, GtkWidget* widget, int size) c_gtk_source_mark_attributes_render_icon; ///
  void function(GtkSourceMarkAttributes* attributes, const(GdkRGBA)* background) c_gtk_source_mark_attributes_set_background; ///
  void function(GtkSourceMarkAttributes* attributes, GIcon* gicon) c_gtk_source_mark_attributes_set_gicon; ///
  void function(GtkSourceMarkAttributes* attributes, const(char)* iconName) c_gtk_source_mark_attributes_set_icon_name; ///
  void function(GtkSourceMarkAttributes* attributes, const(GdkPixbuf)* pixbuf) c_gtk_source_mark_attributes_set_pixbuf; ///

  // PrintCompositor
  GType function() c_gtk_source_print_compositor_get_type; ///
  GtkSourcePrintCompositor* function(GtkSourceBuffer* buffer) c_gtk_source_print_compositor_new; ///
  GtkSourcePrintCompositor* function(GtkSourceView* view) c_gtk_source_print_compositor_new_from_view; ///
  void function(GtkSourcePrintCompositor* compositor, GtkPrintContext* context, int pageNr) c_gtk_source_print_compositor_draw_page; ///
  char* function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_body_font_name; ///
  double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) c_gtk_source_print_compositor_get_bottom_margin; ///
  GtkSourceBuffer* function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_buffer; ///
  char* function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_footer_font_name; ///
  char* function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_header_font_name; ///
  gboolean function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_highlight_syntax; ///
  double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) c_gtk_source_print_compositor_get_left_margin; ///
  char* function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_line_numbers_font_name; ///
  int function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_n_pages; ///
  double function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_pagination_progress; ///
  gboolean function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_print_footer; ///
  gboolean function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_print_header; ///
  uint function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_print_line_numbers; ///
  double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) c_gtk_source_print_compositor_get_right_margin; ///
  uint function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_tab_width; ///
  double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) c_gtk_source_print_compositor_get_top_margin; ///
  GtkWrapMode function(GtkSourcePrintCompositor* compositor) c_gtk_source_print_compositor_get_wrap_mode; ///
  gboolean function(GtkSourcePrintCompositor* compositor, GtkPrintContext* context) c_gtk_source_print_compositor_paginate; ///
  void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) c_gtk_source_print_compositor_set_body_font_name; ///
  void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) c_gtk_source_print_compositor_set_bottom_margin; ///
  void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) c_gtk_source_print_compositor_set_footer_font_name; ///
  void function(GtkSourcePrintCompositor* compositor, gboolean separator, const(char)* left, const(char)* center, const(char)* right) c_gtk_source_print_compositor_set_footer_format; ///
  void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) c_gtk_source_print_compositor_set_header_font_name; ///
  void function(GtkSourcePrintCompositor* compositor, gboolean separator, const(char)* left, const(char)* center, const(char)* right) c_gtk_source_print_compositor_set_header_format; ///
  void function(GtkSourcePrintCompositor* compositor, gboolean highlight) c_gtk_source_print_compositor_set_highlight_syntax; ///
  void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) c_gtk_source_print_compositor_set_left_margin; ///
  void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) c_gtk_source_print_compositor_set_line_numbers_font_name; ///
  void function(GtkSourcePrintCompositor* compositor, gboolean print) c_gtk_source_print_compositor_set_print_footer; ///
  void function(GtkSourcePrintCompositor* compositor, gboolean print) c_gtk_source_print_compositor_set_print_header; ///
  void function(GtkSourcePrintCompositor* compositor, uint interval) c_gtk_source_print_compositor_set_print_line_numbers; ///
  void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) c_gtk_source_print_compositor_set_right_margin; ///
  void function(GtkSourcePrintCompositor* compositor, uint width) c_gtk_source_print_compositor_set_tab_width; ///
  void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) c_gtk_source_print_compositor_set_top_margin; ///
  void function(GtkSourcePrintCompositor* compositor, GtkWrapMode wrapMode) c_gtk_source_print_compositor_set_wrap_mode; ///

  // Region
  GType function() c_gtk_source_region_get_type; ///
  GtkSourceRegion* function(GtkTextBuffer* buffer) c_gtk_source_region_new; ///
  void function(GtkSourceRegion* region, GtkSourceRegion* regionToAdd) c_gtk_source_region_add_region; ///
  void function(GtkSourceRegion* region, const(GtkTextIter)* Start, const(GtkTextIter)* End) c_gtk_source_region_add_subregion; ///
  gboolean function(GtkSourceRegion* region, GtkTextIter* start, GtkTextIter* end) c_gtk_source_region_get_bounds; ///
  GtkTextBuffer* function(GtkSourceRegion* region) c_gtk_source_region_get_buffer; ///
  void function(GtkSourceRegion* region, GtkSourceRegionIter* iter) c_gtk_source_region_get_start_region_iter; ///
  GtkSourceRegion* function(GtkSourceRegion* region1, GtkSourceRegion* region2) c_gtk_source_region_intersect_region; ///
  GtkSourceRegion* function(GtkSourceRegion* region, const(GtkTextIter)* Start, const(GtkTextIter)* End) c_gtk_source_region_intersect_subregion; ///
  gboolean function(GtkSourceRegion* region) c_gtk_source_region_is_empty; ///
  void function(GtkSourceRegion* region, GtkSourceRegion* regionToSubtract) c_gtk_source_region_subtract_region; ///
  void function(GtkSourceRegion* region, const(GtkTextIter)* Start, const(GtkTextIter)* End) c_gtk_source_region_subtract_subregion; ///
  char* function(GtkSourceRegion* region) c_gtk_source_region_to_string; ///

  // RegionIter
  gboolean function(GtkSourceRegionIter* iter, GtkTextIter* start, GtkTextIter* end) c_gtk_source_region_iter_get_subregion; ///
  gboolean function(GtkSourceRegionIter* iter) c_gtk_source_region_iter_is_end; ///
  gboolean function(GtkSourceRegionIter* iter) c_gtk_source_region_iter_next; ///

  // SearchContext
  GType function() c_gtk_source_search_context_get_type; ///
  GtkSourceSearchContext* function(GtkSourceBuffer* buffer, GtkSourceSearchSettings* settings) c_gtk_source_search_context_new; ///
  gboolean function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround) c_gtk_source_search_context_backward; ///
  void function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gtk_source_search_context_backward_async; ///
  gboolean function(GtkSourceSearchContext* search, GAsyncResult* result, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround, GError** _err) c_gtk_source_search_context_backward_finish; ///
  gboolean function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround) c_gtk_source_search_context_forward; ///
  void function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gtk_source_search_context_forward_async; ///
  gboolean function(GtkSourceSearchContext* search, GAsyncResult* result, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround, GError** _err) c_gtk_source_search_context_forward_finish; ///
  GtkSourceBuffer* function(GtkSourceSearchContext* search) c_gtk_source_search_context_get_buffer; ///
  gboolean function(GtkSourceSearchContext* search) c_gtk_source_search_context_get_highlight; ///
  GtkSourceStyle* function(GtkSourceSearchContext* search) c_gtk_source_search_context_get_match_style; ///
  int function(GtkSourceSearchContext* search, const(GtkTextIter)* matchStart, const(GtkTextIter)* matchEnd) c_gtk_source_search_context_get_occurrence_position; ///
  int function(GtkSourceSearchContext* search) c_gtk_source_search_context_get_occurrences_count; ///
  GError* function(GtkSourceSearchContext* search) c_gtk_source_search_context_get_regex_error; ///
  GtkSourceSearchSettings* function(GtkSourceSearchContext* search) c_gtk_source_search_context_get_settings; ///
  gboolean function(GtkSourceSearchContext* search, GtkTextIter* matchStart, GtkTextIter* matchEnd, const(char)* replace, int replaceLength, GError** _err) c_gtk_source_search_context_replace; ///
  uint function(GtkSourceSearchContext* search, const(char)* replace, int replaceLength, GError** _err) c_gtk_source_search_context_replace_all; ///
  void function(GtkSourceSearchContext* search, gboolean highlight) c_gtk_source_search_context_set_highlight; ///
  void function(GtkSourceSearchContext* search, GtkSourceStyle* matchStyle) c_gtk_source_search_context_set_match_style; ///

  // SearchSettings
  GType function() c_gtk_source_search_settings_get_type; ///
  GtkSourceSearchSettings* function() c_gtk_source_search_settings_new; ///
  gboolean function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_at_word_boundaries; ///
  gboolean function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_case_sensitive; ///
  gboolean function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_regex_enabled; ///
  const(char)* function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_search_text; ///
  gboolean function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_wrap_around; ///
  void function(GtkSourceSearchSettings* settings, gboolean atWordBoundaries) c_gtk_source_search_settings_set_at_word_boundaries; ///
  void function(GtkSourceSearchSettings* settings, gboolean caseSensitive) c_gtk_source_search_settings_set_case_sensitive; ///
  void function(GtkSourceSearchSettings* settings, gboolean regexEnabled) c_gtk_source_search_settings_set_regex_enabled; ///
  void function(GtkSourceSearchSettings* settings, const(char)* searchText) c_gtk_source_search_settings_set_search_text; ///
  void function(GtkSourceSearchSettings* settings, gboolean wrapAround) c_gtk_source_search_settings_set_wrap_around; ///

  // SpaceDrawer
  GType function() c_gtk_source_space_drawer_get_type; ///
  GtkSourceSpaceDrawer* function() c_gtk_source_space_drawer_new; ///
  void function(GtkSourceSpaceDrawer* drawer, GSettings* settings, const(char)* key, GSettingsBindFlags flags) c_gtk_source_space_drawer_bind_matrix_setting; ///
  gboolean function(GtkSourceSpaceDrawer* drawer) c_gtk_source_space_drawer_get_enable_matrix; ///
  GVariant* function(GtkSourceSpaceDrawer* drawer) c_gtk_source_space_drawer_get_matrix; ///
  GtkSourceSpaceTypeFlags function(GtkSourceSpaceDrawer* drawer, GtkSourceSpaceLocationFlags locations) c_gtk_source_space_drawer_get_types_for_locations; ///
  void function(GtkSourceSpaceDrawer* drawer, gboolean enableMatrix) c_gtk_source_space_drawer_set_enable_matrix; ///
  void function(GtkSourceSpaceDrawer* drawer, GVariant* matrix) c_gtk_source_space_drawer_set_matrix; ///
  void function(GtkSourceSpaceDrawer* drawer, GtkSourceSpaceLocationFlags locations, GtkSourceSpaceTypeFlags types) c_gtk_source_space_drawer_set_types_for_locations; ///

  // Style
  GType function() c_gtk_source_style_get_type; ///
  void function(const(GtkSourceStyle)* style, GtkTextTag* tag) c_gtk_source_style_apply; ///
  GtkSourceStyle* function(const(GtkSourceStyle)* style) c_gtk_source_style_copy; ///

  // StyleScheme
  GType function() c_gtk_source_style_scheme_get_type; ///
  const(char*)* function(GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_get_authors; ///
  const(char)* function(GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_get_description; ///
  const(char)* function(GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_get_filename; ///
  const(char)* function(GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_get_id; ///
  const(char)* function(GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_get_name; ///
  GtkSourceStyle* function(GtkSourceStyleScheme* scheme, const(char)* styleId) c_gtk_source_style_scheme_get_style; ///

  // StyleSchemeChooser
  GType function() c_gtk_source_style_scheme_chooser_get_type; ///
  GtkSourceStyleScheme* function(GtkSourceStyleSchemeChooser* chooser) c_gtk_source_style_scheme_chooser_get_style_scheme; ///
  void function(GtkSourceStyleSchemeChooser* chooser, GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_chooser_set_style_scheme; ///

  // StyleSchemeChooserButton
  GType function() c_gtk_source_style_scheme_chooser_button_get_type; ///
  GtkWidget* function() c_gtk_source_style_scheme_chooser_button_new; ///

  // StyleSchemeChooserWidget
  GType function() c_gtk_source_style_scheme_chooser_widget_get_type; ///
  GtkWidget* function() c_gtk_source_style_scheme_chooser_widget_new; ///

  // StyleSchemeManager
  GType function() c_gtk_source_style_scheme_manager_get_type; ///
  GtkSourceStyleSchemeManager* function() c_gtk_source_style_scheme_manager_new; ///
  GtkSourceStyleSchemeManager* function() c_gtk_source_style_scheme_manager_get_default; ///
  void function(GtkSourceStyleSchemeManager* manager, const(char)* path) c_gtk_source_style_scheme_manager_append_search_path; ///
  void function(GtkSourceStyleSchemeManager* manager) c_gtk_source_style_scheme_manager_force_rescan; ///
  GtkSourceStyleScheme* function(GtkSourceStyleSchemeManager* manager, const(char)* schemeId) c_gtk_source_style_scheme_manager_get_scheme; ///
  const(char*)* function(GtkSourceStyleSchemeManager* manager) c_gtk_source_style_scheme_manager_get_scheme_ids; ///
  const(char*)* function(GtkSourceStyleSchemeManager* manager) c_gtk_source_style_scheme_manager_get_search_path; ///
  void function(GtkSourceStyleSchemeManager* manager, const(char)* path) c_gtk_source_style_scheme_manager_prepend_search_path; ///
  void function(GtkSourceStyleSchemeManager* manager, char** path) c_gtk_source_style_scheme_manager_set_search_path; ///

  // Tag
  GType function() c_gtk_source_tag_get_type; ///
  GtkTextTag* function(const(char)* name) c_gtk_source_tag_new; ///

  // UndoManager
  GType function() c_gtk_source_undo_manager_get_type; ///
  void function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_begin_not_undoable_action; ///
  gboolean function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_can_redo; ///
  void function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_can_redo_changed; ///
  gboolean function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_can_undo; ///
  void function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_can_undo_changed; ///
  void function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_end_not_undoable_action; ///
  void function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_redo; ///
  void function(GtkSourceUndoManager* manager) c_gtk_source_undo_manager_undo; ///

  // View
  GType function() c_gtk_source_view_get_type; ///
  GtkWidget* function() c_gtk_source_view_new; ///
  GtkWidget* function(GtkSourceBuffer* buffer) c_gtk_source_view_new_with_buffer; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_auto_indent; ///
  GtkSourceBackgroundPatternType function(GtkSourceView* view) c_gtk_source_view_get_background_pattern; ///
  GtkSourceCompletion* function(GtkSourceView* view) c_gtk_source_view_get_completion; ///
  GtkSourceGutter* function(GtkSourceView* view, GtkTextWindowType windowType) c_gtk_source_view_get_gutter; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_highlight_current_line; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_indent_on_tab; ///
  int function(GtkSourceView* view) c_gtk_source_view_get_indent_width; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_insert_spaces_instead_of_tabs; ///
  GtkSourceMarkAttributes* function(GtkSourceView* view, const(char)* category, int* priority) c_gtk_source_view_get_mark_attributes; ///
  uint function(GtkSourceView* view) c_gtk_source_view_get_right_margin_position; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_show_line_marks; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_show_line_numbers; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_show_right_margin; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_smart_backspace; ///
  GtkSourceSmartHomeEndType function(GtkSourceView* view) c_gtk_source_view_get_smart_home_end; ///
  GtkSourceSpaceDrawer* function(GtkSourceView* view) c_gtk_source_view_get_space_drawer; ///
  uint function(GtkSourceView* view) c_gtk_source_view_get_tab_width; ///
  uint function(GtkSourceView* view, const(GtkTextIter)* iter) c_gtk_source_view_get_visual_column; ///
  void function(GtkSourceView* view, GtkTextIter* start, GtkTextIter* end) c_gtk_source_view_indent_lines; ///
  void function(GtkSourceView* view, gboolean enable) c_gtk_source_view_set_auto_indent; ///
  void function(GtkSourceView* view, GtkSourceBackgroundPatternType backgroundPattern) c_gtk_source_view_set_background_pattern; ///
  void function(GtkSourceView* view, gboolean highlight) c_gtk_source_view_set_highlight_current_line; ///
  void function(GtkSourceView* view, gboolean enable) c_gtk_source_view_set_indent_on_tab; ///
  void function(GtkSourceView* view, int width) c_gtk_source_view_set_indent_width; ///
  void function(GtkSourceView* view, gboolean enable) c_gtk_source_view_set_insert_spaces_instead_of_tabs; ///
  void function(GtkSourceView* view, const(char)* category, GtkSourceMarkAttributes* attributes, int priority) c_gtk_source_view_set_mark_attributes; ///
  void function(GtkSourceView* view, uint pos) c_gtk_source_view_set_right_margin_position; ///
  void function(GtkSourceView* view, gboolean show) c_gtk_source_view_set_show_line_marks; ///
  void function(GtkSourceView* view, gboolean show) c_gtk_source_view_set_show_line_numbers; ///
  void function(GtkSourceView* view, gboolean show) c_gtk_source_view_set_show_right_margin; ///
  void function(GtkSourceView* view, gboolean smartBackspace) c_gtk_source_view_set_smart_backspace; ///
  void function(GtkSourceView* view, GtkSourceSmartHomeEndType smartHomeEnd) c_gtk_source_view_set_smart_home_end; ///
  void function(GtkSourceView* view, uint width) c_gtk_source_view_set_tab_width; ///
  void function(GtkSourceView* view, GtkTextIter* start, GtkTextIter* end) c_gtk_source_view_unindent_lines; ///

  // global
  void function() c_gtk_source_finalize; ///
  void function() c_gtk_source_init; ///
  char* function(const(char)* text) c_gtk_source_utils_escape_search_text; ///
  char* function(const(char)* text) c_gtk_source_utils_unescape_search_text; ///

  // CompletionError
  GQuark function() c_gtk_source_completion_error_quark; ///

  // FileLoaderError
  GQuark function() c_gtk_source_file_loader_error_quark; ///

  // FileSaverError
  GQuark function() c_gtk_source_file_saver_error_quark; ///
}

// Buffer

/** */
alias gtk_source_buffer_get_type = c_gtk_source_buffer_get_type;

/** */
alias gtk_source_buffer_new = c_gtk_source_buffer_new;

/** */
alias gtk_source_buffer_new_with_language = c_gtk_source_buffer_new_with_language;

/** */
alias gtk_source_buffer_backward_iter_to_source_mark = c_gtk_source_buffer_backward_iter_to_source_mark;

/** */
alias gtk_source_buffer_begin_not_undoable_action = c_gtk_source_buffer_begin_not_undoable_action;

/** */
alias gtk_source_buffer_can_redo = c_gtk_source_buffer_can_redo;

/** */
alias gtk_source_buffer_can_undo = c_gtk_source_buffer_can_undo;

/** */
alias gtk_source_buffer_change_case = c_gtk_source_buffer_change_case;

/** */
alias gtk_source_buffer_create_source_mark = c_gtk_source_buffer_create_source_mark;

/** */
alias gtk_source_buffer_create_source_tag = c_gtk_source_buffer_create_source_tag;

/** */
alias gtk_source_buffer_end_not_undoable_action = c_gtk_source_buffer_end_not_undoable_action;

/** */
alias gtk_source_buffer_ensure_highlight = c_gtk_source_buffer_ensure_highlight;

/** */
alias gtk_source_buffer_forward_iter_to_source_mark = c_gtk_source_buffer_forward_iter_to_source_mark;

/** */
alias gtk_source_buffer_get_context_classes_at_iter = c_gtk_source_buffer_get_context_classes_at_iter;

/** */
alias gtk_source_buffer_get_highlight_matching_brackets = c_gtk_source_buffer_get_highlight_matching_brackets;

/** */
alias gtk_source_buffer_get_highlight_syntax = c_gtk_source_buffer_get_highlight_syntax;

/** */
alias gtk_source_buffer_get_implicit_trailing_newline = c_gtk_source_buffer_get_implicit_trailing_newline;

/** */
alias gtk_source_buffer_get_language = c_gtk_source_buffer_get_language;

/** */
alias gtk_source_buffer_get_max_undo_levels = c_gtk_source_buffer_get_max_undo_levels;

/** */
alias gtk_source_buffer_get_source_marks_at_iter = c_gtk_source_buffer_get_source_marks_at_iter;

/** */
alias gtk_source_buffer_get_source_marks_at_line = c_gtk_source_buffer_get_source_marks_at_line;

/** */
alias gtk_source_buffer_get_style_scheme = c_gtk_source_buffer_get_style_scheme;

/** */
alias gtk_source_buffer_get_undo_manager = c_gtk_source_buffer_get_undo_manager;

/** */
alias gtk_source_buffer_iter_backward_to_context_class_toggle = c_gtk_source_buffer_iter_backward_to_context_class_toggle;

/** */
alias gtk_source_buffer_iter_forward_to_context_class_toggle = c_gtk_source_buffer_iter_forward_to_context_class_toggle;

/** */
alias gtk_source_buffer_iter_has_context_class = c_gtk_source_buffer_iter_has_context_class;

/** */
alias gtk_source_buffer_join_lines = c_gtk_source_buffer_join_lines;

/** */
alias gtk_source_buffer_redo = c_gtk_source_buffer_redo;

/** */
alias gtk_source_buffer_remove_source_marks = c_gtk_source_buffer_remove_source_marks;

/** */
alias gtk_source_buffer_set_highlight_matching_brackets = c_gtk_source_buffer_set_highlight_matching_brackets;

/** */
alias gtk_source_buffer_set_highlight_syntax = c_gtk_source_buffer_set_highlight_syntax;

/** */
alias gtk_source_buffer_set_implicit_trailing_newline = c_gtk_source_buffer_set_implicit_trailing_newline;

/** */
alias gtk_source_buffer_set_language = c_gtk_source_buffer_set_language;

/** */
alias gtk_source_buffer_set_max_undo_levels = c_gtk_source_buffer_set_max_undo_levels;

/** */
alias gtk_source_buffer_set_style_scheme = c_gtk_source_buffer_set_style_scheme;

/** */
alias gtk_source_buffer_set_undo_manager = c_gtk_source_buffer_set_undo_manager;

/** */
alias gtk_source_buffer_sort_lines = c_gtk_source_buffer_sort_lines;

/** */
alias gtk_source_buffer_undo = c_gtk_source_buffer_undo;

// Completion

/** */
alias gtk_source_completion_get_type = c_gtk_source_completion_get_type;

/** */
alias gtk_source_completion_add_provider = c_gtk_source_completion_add_provider;

/** */
alias gtk_source_completion_block_interactive = c_gtk_source_completion_block_interactive;

/** */
alias gtk_source_completion_create_context = c_gtk_source_completion_create_context;

/** */
alias gtk_source_completion_get_info_window = c_gtk_source_completion_get_info_window;

/** */
alias gtk_source_completion_get_providers = c_gtk_source_completion_get_providers;

/** */
alias gtk_source_completion_get_view = c_gtk_source_completion_get_view;

/** */
alias gtk_source_completion_hide = c_gtk_source_completion_hide;

/** */
alias gtk_source_completion_remove_provider = c_gtk_source_completion_remove_provider;

/** */
alias gtk_source_completion_start = c_gtk_source_completion_start;

/** */
alias gtk_source_completion_unblock_interactive = c_gtk_source_completion_unblock_interactive;

// CompletionContext

/** */
alias gtk_source_completion_context_get_type = c_gtk_source_completion_context_get_type;

/** */
alias gtk_source_completion_context_add_proposals = c_gtk_source_completion_context_add_proposals;

/** */
alias gtk_source_completion_context_get_activation = c_gtk_source_completion_context_get_activation;

/** */
alias gtk_source_completion_context_get_iter = c_gtk_source_completion_context_get_iter;

// CompletionInfo

/** */
alias gtk_source_completion_info_get_type = c_gtk_source_completion_info_get_type;

/** */
alias gtk_source_completion_info_new = c_gtk_source_completion_info_new;

/** */
alias gtk_source_completion_info_move_to_iter = c_gtk_source_completion_info_move_to_iter;

// CompletionItem

/** */
alias gtk_source_completion_item_get_type = c_gtk_source_completion_item_get_type;

/** */
alias gtk_source_completion_item_new = c_gtk_source_completion_item_new;

/** */
alias gtk_source_completion_item_set_gicon = c_gtk_source_completion_item_set_gicon;

/** */
alias gtk_source_completion_item_set_icon = c_gtk_source_completion_item_set_icon;

/** */
alias gtk_source_completion_item_set_icon_name = c_gtk_source_completion_item_set_icon_name;

/** */
alias gtk_source_completion_item_set_info = c_gtk_source_completion_item_set_info;

/** */
alias gtk_source_completion_item_set_label = c_gtk_source_completion_item_set_label;

/** */
alias gtk_source_completion_item_set_markup = c_gtk_source_completion_item_set_markup;

/** */
alias gtk_source_completion_item_set_text = c_gtk_source_completion_item_set_text;

// CompletionProposal

/** */
alias gtk_source_completion_proposal_get_type = c_gtk_source_completion_proposal_get_type;

/** */
alias gtk_source_completion_proposal_changed = c_gtk_source_completion_proposal_changed;

/** */
alias gtk_source_completion_proposal_equal = c_gtk_source_completion_proposal_equal;

/** */
alias gtk_source_completion_proposal_get_gicon = c_gtk_source_completion_proposal_get_gicon;

/** */
alias gtk_source_completion_proposal_get_icon = c_gtk_source_completion_proposal_get_icon;

/** */
alias gtk_source_completion_proposal_get_icon_name = c_gtk_source_completion_proposal_get_icon_name;

/** */
alias gtk_source_completion_proposal_get_info = c_gtk_source_completion_proposal_get_info;

/** */
alias gtk_source_completion_proposal_get_label = c_gtk_source_completion_proposal_get_label;

/** */
alias gtk_source_completion_proposal_get_markup = c_gtk_source_completion_proposal_get_markup;

/** */
alias gtk_source_completion_proposal_get_text = c_gtk_source_completion_proposal_get_text;

/** */
alias gtk_source_completion_proposal_hash = c_gtk_source_completion_proposal_hash;

// CompletionProvider

/** */
alias gtk_source_completion_provider_get_type = c_gtk_source_completion_provider_get_type;

/** */
alias gtk_source_completion_provider_activate_proposal = c_gtk_source_completion_provider_activate_proposal;

/** */
alias gtk_source_completion_provider_get_activation = c_gtk_source_completion_provider_get_activation;

/** */
alias gtk_source_completion_provider_get_gicon = c_gtk_source_completion_provider_get_gicon;

/** */
alias gtk_source_completion_provider_get_icon = c_gtk_source_completion_provider_get_icon;

/** */
alias gtk_source_completion_provider_get_icon_name = c_gtk_source_completion_provider_get_icon_name;

/** */
alias gtk_source_completion_provider_get_info_widget = c_gtk_source_completion_provider_get_info_widget;

/** */
alias gtk_source_completion_provider_get_interactive_delay = c_gtk_source_completion_provider_get_interactive_delay;

/** */
alias gtk_source_completion_provider_get_name = c_gtk_source_completion_provider_get_name;

/** */
alias gtk_source_completion_provider_get_priority = c_gtk_source_completion_provider_get_priority;

/** */
alias gtk_source_completion_provider_get_start_iter = c_gtk_source_completion_provider_get_start_iter;

/** */
alias gtk_source_completion_provider_match = c_gtk_source_completion_provider_match;

/** */
alias gtk_source_completion_provider_populate = c_gtk_source_completion_provider_populate;

/** */
alias gtk_source_completion_provider_update_info = c_gtk_source_completion_provider_update_info;

// CompletionWords

/** */
alias gtk_source_completion_words_get_type = c_gtk_source_completion_words_get_type;

/** */
alias gtk_source_completion_words_new = c_gtk_source_completion_words_new;

/** */
alias gtk_source_completion_words_register = c_gtk_source_completion_words_register;

/** */
alias gtk_source_completion_words_unregister = c_gtk_source_completion_words_unregister;

// Encoding

/** */
alias gtk_source_encoding_get_type = c_gtk_source_encoding_get_type;

/** */
alias gtk_source_encoding_copy = c_gtk_source_encoding_copy;

/** */
alias gtk_source_encoding_free = c_gtk_source_encoding_free;

/** */
alias gtk_source_encoding_get_charset = c_gtk_source_encoding_get_charset;

/** */
alias gtk_source_encoding_get_name = c_gtk_source_encoding_get_name;

/** */
alias gtk_source_encoding_to_string = c_gtk_source_encoding_to_string;

/** */
alias gtk_source_encoding_get_all = c_gtk_source_encoding_get_all;

/** */
alias gtk_source_encoding_get_current = c_gtk_source_encoding_get_current;

/** */
alias gtk_source_encoding_get_default_candidates = c_gtk_source_encoding_get_default_candidates;

/** */
alias gtk_source_encoding_get_from_charset = c_gtk_source_encoding_get_from_charset;

/** */
alias gtk_source_encoding_get_utf8 = c_gtk_source_encoding_get_utf8;

// File

/** */
alias gtk_source_file_get_type = c_gtk_source_file_get_type;

/** */
alias gtk_source_file_new = c_gtk_source_file_new;

/** */
alias gtk_source_file_check_file_on_disk = c_gtk_source_file_check_file_on_disk;

/** */
alias gtk_source_file_get_compression_type = c_gtk_source_file_get_compression_type;

/** */
alias gtk_source_file_get_encoding = c_gtk_source_file_get_encoding;

/** */
alias gtk_source_file_get_location = c_gtk_source_file_get_location;

/** */
alias gtk_source_file_get_newline_type = c_gtk_source_file_get_newline_type;

/** */
alias gtk_source_file_is_deleted = c_gtk_source_file_is_deleted;

/** */
alias gtk_source_file_is_externally_modified = c_gtk_source_file_is_externally_modified;

/** */
alias gtk_source_file_is_local = c_gtk_source_file_is_local;

/** */
alias gtk_source_file_is_readonly = c_gtk_source_file_is_readonly;

/** */
alias gtk_source_file_set_location = c_gtk_source_file_set_location;

/** */
alias gtk_source_file_set_mount_operation_factory = c_gtk_source_file_set_mount_operation_factory;

// FileLoader

/** */
alias gtk_source_file_loader_get_type = c_gtk_source_file_loader_get_type;

/** */
alias gtk_source_file_loader_new = c_gtk_source_file_loader_new;

/** */
alias gtk_source_file_loader_new_from_stream = c_gtk_source_file_loader_new_from_stream;

/** */
alias gtk_source_file_loader_get_buffer = c_gtk_source_file_loader_get_buffer;

/** */
alias gtk_source_file_loader_get_compression_type = c_gtk_source_file_loader_get_compression_type;

/** */
alias gtk_source_file_loader_get_encoding = c_gtk_source_file_loader_get_encoding;

/** */
alias gtk_source_file_loader_get_file = c_gtk_source_file_loader_get_file;

/** */
alias gtk_source_file_loader_get_input_stream = c_gtk_source_file_loader_get_input_stream;

/** */
alias gtk_source_file_loader_get_location = c_gtk_source_file_loader_get_location;

/** */
alias gtk_source_file_loader_get_newline_type = c_gtk_source_file_loader_get_newline_type;

/** */
alias gtk_source_file_loader_load_async = c_gtk_source_file_loader_load_async;

/** */
alias gtk_source_file_loader_load_finish = c_gtk_source_file_loader_load_finish;

/** */
alias gtk_source_file_loader_set_candidate_encodings = c_gtk_source_file_loader_set_candidate_encodings;

// FileSaver

/** */
alias gtk_source_file_saver_get_type = c_gtk_source_file_saver_get_type;

/** */
alias gtk_source_file_saver_new = c_gtk_source_file_saver_new;

/** */
alias gtk_source_file_saver_new_with_target = c_gtk_source_file_saver_new_with_target;

/** */
alias gtk_source_file_saver_get_buffer = c_gtk_source_file_saver_get_buffer;

/** */
alias gtk_source_file_saver_get_compression_type = c_gtk_source_file_saver_get_compression_type;

/** */
alias gtk_source_file_saver_get_encoding = c_gtk_source_file_saver_get_encoding;

/** */
alias gtk_source_file_saver_get_file = c_gtk_source_file_saver_get_file;

/** */
alias gtk_source_file_saver_get_flags = c_gtk_source_file_saver_get_flags;

/** */
alias gtk_source_file_saver_get_location = c_gtk_source_file_saver_get_location;

/** */
alias gtk_source_file_saver_get_newline_type = c_gtk_source_file_saver_get_newline_type;

/** */
alias gtk_source_file_saver_save_async = c_gtk_source_file_saver_save_async;

/** */
alias gtk_source_file_saver_save_finish = c_gtk_source_file_saver_save_finish;

/** */
alias gtk_source_file_saver_set_compression_type = c_gtk_source_file_saver_set_compression_type;

/** */
alias gtk_source_file_saver_set_encoding = c_gtk_source_file_saver_set_encoding;

/** */
alias gtk_source_file_saver_set_flags = c_gtk_source_file_saver_set_flags;

/** */
alias gtk_source_file_saver_set_newline_type = c_gtk_source_file_saver_set_newline_type;

// Gutter

/** */
alias gtk_source_gutter_get_type = c_gtk_source_gutter_get_type;

/** */
alias gtk_source_gutter_get_renderer_at_pos = c_gtk_source_gutter_get_renderer_at_pos;

/** */
alias gtk_source_gutter_get_view = c_gtk_source_gutter_get_view;

/** */
alias gtk_source_gutter_get_window_type = c_gtk_source_gutter_get_window_type;

/** */
alias gtk_source_gutter_insert = c_gtk_source_gutter_insert;

/** */
alias gtk_source_gutter_queue_draw = c_gtk_source_gutter_queue_draw;

/** */
alias gtk_source_gutter_remove = c_gtk_source_gutter_remove;

/** */
alias gtk_source_gutter_reorder = c_gtk_source_gutter_reorder;

// GutterRenderer

/** */
alias gtk_source_gutter_renderer_get_type = c_gtk_source_gutter_renderer_get_type;

/** */
alias gtk_source_gutter_renderer_activate = c_gtk_source_gutter_renderer_activate;

/** */
alias gtk_source_gutter_renderer_begin = c_gtk_source_gutter_renderer_begin;

/** */
alias gtk_source_gutter_renderer_draw = c_gtk_source_gutter_renderer_draw;

/** */
alias gtk_source_gutter_renderer_end = c_gtk_source_gutter_renderer_end;

/** */
alias gtk_source_gutter_renderer_get_alignment = c_gtk_source_gutter_renderer_get_alignment;

/** */
alias gtk_source_gutter_renderer_get_alignment_mode = c_gtk_source_gutter_renderer_get_alignment_mode;

/** */
alias gtk_source_gutter_renderer_get_background = c_gtk_source_gutter_renderer_get_background;

/** */
alias gtk_source_gutter_renderer_get_padding = c_gtk_source_gutter_renderer_get_padding;

/** */
alias gtk_source_gutter_renderer_get_size = c_gtk_source_gutter_renderer_get_size;

/** */
alias gtk_source_gutter_renderer_get_view = c_gtk_source_gutter_renderer_get_view;

/** */
alias gtk_source_gutter_renderer_get_visible = c_gtk_source_gutter_renderer_get_visible;

/** */
alias gtk_source_gutter_renderer_get_window_type = c_gtk_source_gutter_renderer_get_window_type;

/** */
alias gtk_source_gutter_renderer_query_activatable = c_gtk_source_gutter_renderer_query_activatable;

/** */
alias gtk_source_gutter_renderer_query_data = c_gtk_source_gutter_renderer_query_data;

/** */
alias gtk_source_gutter_renderer_query_tooltip = c_gtk_source_gutter_renderer_query_tooltip;

/** */
alias gtk_source_gutter_renderer_queue_draw = c_gtk_source_gutter_renderer_queue_draw;

/** */
alias gtk_source_gutter_renderer_set_alignment = c_gtk_source_gutter_renderer_set_alignment;

/** */
alias gtk_source_gutter_renderer_set_alignment_mode = c_gtk_source_gutter_renderer_set_alignment_mode;

/** */
alias gtk_source_gutter_renderer_set_background = c_gtk_source_gutter_renderer_set_background;

/** */
alias gtk_source_gutter_renderer_set_padding = c_gtk_source_gutter_renderer_set_padding;

/** */
alias gtk_source_gutter_renderer_set_size = c_gtk_source_gutter_renderer_set_size;

/** */
alias gtk_source_gutter_renderer_set_visible = c_gtk_source_gutter_renderer_set_visible;

// GutterRendererPixbuf

/** */
alias gtk_source_gutter_renderer_pixbuf_get_type = c_gtk_source_gutter_renderer_pixbuf_get_type;

/** */
alias gtk_source_gutter_renderer_pixbuf_new = c_gtk_source_gutter_renderer_pixbuf_new;

/** */
alias gtk_source_gutter_renderer_pixbuf_get_gicon = c_gtk_source_gutter_renderer_pixbuf_get_gicon;

/** */
alias gtk_source_gutter_renderer_pixbuf_get_icon_name = c_gtk_source_gutter_renderer_pixbuf_get_icon_name;

/** */
alias gtk_source_gutter_renderer_pixbuf_get_pixbuf = c_gtk_source_gutter_renderer_pixbuf_get_pixbuf;

/** */
alias gtk_source_gutter_renderer_pixbuf_set_gicon = c_gtk_source_gutter_renderer_pixbuf_set_gicon;

/** */
alias gtk_source_gutter_renderer_pixbuf_set_icon_name = c_gtk_source_gutter_renderer_pixbuf_set_icon_name;

/** */
alias gtk_source_gutter_renderer_pixbuf_set_pixbuf = c_gtk_source_gutter_renderer_pixbuf_set_pixbuf;

// GutterRendererText

/** */
alias gtk_source_gutter_renderer_text_get_type = c_gtk_source_gutter_renderer_text_get_type;

/** */
alias gtk_source_gutter_renderer_text_new = c_gtk_source_gutter_renderer_text_new;

/** */
alias gtk_source_gutter_renderer_text_measure = c_gtk_source_gutter_renderer_text_measure;

/** */
alias gtk_source_gutter_renderer_text_measure_markup = c_gtk_source_gutter_renderer_text_measure_markup;

/** */
alias gtk_source_gutter_renderer_text_set_markup = c_gtk_source_gutter_renderer_text_set_markup;

/** */
alias gtk_source_gutter_renderer_text_set_text = c_gtk_source_gutter_renderer_text_set_text;

// Language

/** */
alias gtk_source_language_get_type = c_gtk_source_language_get_type;

/** */
alias gtk_source_language_get_globs = c_gtk_source_language_get_globs;

/** */
alias gtk_source_language_get_hidden = c_gtk_source_language_get_hidden;

/** */
alias gtk_source_language_get_id = c_gtk_source_language_get_id;

/** */
alias gtk_source_language_get_metadata = c_gtk_source_language_get_metadata;

/** */
alias gtk_source_language_get_mime_types = c_gtk_source_language_get_mime_types;

/** */
alias gtk_source_language_get_name = c_gtk_source_language_get_name;

/** */
alias gtk_source_language_get_section = c_gtk_source_language_get_section;

/** */
alias gtk_source_language_get_style_fallback = c_gtk_source_language_get_style_fallback;

/** */
alias gtk_source_language_get_style_ids = c_gtk_source_language_get_style_ids;

/** */
alias gtk_source_language_get_style_name = c_gtk_source_language_get_style_name;

// LanguageManager

/** */
alias gtk_source_language_manager_get_type = c_gtk_source_language_manager_get_type;

/** */
alias gtk_source_language_manager_new = c_gtk_source_language_manager_new;

/** */
alias gtk_source_language_manager_get_default = c_gtk_source_language_manager_get_default;

/** */
alias gtk_source_language_manager_get_language = c_gtk_source_language_manager_get_language;

/** */
alias gtk_source_language_manager_get_language_ids = c_gtk_source_language_manager_get_language_ids;

/** */
alias gtk_source_language_manager_get_search_path = c_gtk_source_language_manager_get_search_path;

/** */
alias gtk_source_language_manager_guess_language = c_gtk_source_language_manager_guess_language;

/** */
alias gtk_source_language_manager_set_search_path = c_gtk_source_language_manager_set_search_path;

// Map

/** */
alias gtk_source_map_get_type = c_gtk_source_map_get_type;

/** */
alias gtk_source_map_new = c_gtk_source_map_new;

/** */
alias gtk_source_map_get_view = c_gtk_source_map_get_view;

/** */
alias gtk_source_map_set_view = c_gtk_source_map_set_view;

// Mark

/** */
alias gtk_source_mark_get_type = c_gtk_source_mark_get_type;

/** */
alias gtk_source_mark_new = c_gtk_source_mark_new;

/** */
alias gtk_source_mark_get_category = c_gtk_source_mark_get_category;

/** */
alias gtk_source_mark_next = c_gtk_source_mark_next;

/** */
alias gtk_source_mark_prev = c_gtk_source_mark_prev;

// MarkAttributes

/** */
alias gtk_source_mark_attributes_get_type = c_gtk_source_mark_attributes_get_type;

/** */
alias gtk_source_mark_attributes_new = c_gtk_source_mark_attributes_new;

/** */
alias gtk_source_mark_attributes_get_background = c_gtk_source_mark_attributes_get_background;

/** */
alias gtk_source_mark_attributes_get_gicon = c_gtk_source_mark_attributes_get_gicon;

/** */
alias gtk_source_mark_attributes_get_icon_name = c_gtk_source_mark_attributes_get_icon_name;

/** */
alias gtk_source_mark_attributes_get_pixbuf = c_gtk_source_mark_attributes_get_pixbuf;

/** */
alias gtk_source_mark_attributes_get_tooltip_markup = c_gtk_source_mark_attributes_get_tooltip_markup;

/** */
alias gtk_source_mark_attributes_get_tooltip_text = c_gtk_source_mark_attributes_get_tooltip_text;

/** */
alias gtk_source_mark_attributes_render_icon = c_gtk_source_mark_attributes_render_icon;

/** */
alias gtk_source_mark_attributes_set_background = c_gtk_source_mark_attributes_set_background;

/** */
alias gtk_source_mark_attributes_set_gicon = c_gtk_source_mark_attributes_set_gicon;

/** */
alias gtk_source_mark_attributes_set_icon_name = c_gtk_source_mark_attributes_set_icon_name;

/** */
alias gtk_source_mark_attributes_set_pixbuf = c_gtk_source_mark_attributes_set_pixbuf;

// PrintCompositor

/** */
alias gtk_source_print_compositor_get_type = c_gtk_source_print_compositor_get_type;

/** */
alias gtk_source_print_compositor_new = c_gtk_source_print_compositor_new;

/** */
alias gtk_source_print_compositor_new_from_view = c_gtk_source_print_compositor_new_from_view;

/** */
alias gtk_source_print_compositor_draw_page = c_gtk_source_print_compositor_draw_page;

/** */
alias gtk_source_print_compositor_get_body_font_name = c_gtk_source_print_compositor_get_body_font_name;

/** */
alias gtk_source_print_compositor_get_bottom_margin = c_gtk_source_print_compositor_get_bottom_margin;

/** */
alias gtk_source_print_compositor_get_buffer = c_gtk_source_print_compositor_get_buffer;

/** */
alias gtk_source_print_compositor_get_footer_font_name = c_gtk_source_print_compositor_get_footer_font_name;

/** */
alias gtk_source_print_compositor_get_header_font_name = c_gtk_source_print_compositor_get_header_font_name;

/** */
alias gtk_source_print_compositor_get_highlight_syntax = c_gtk_source_print_compositor_get_highlight_syntax;

/** */
alias gtk_source_print_compositor_get_left_margin = c_gtk_source_print_compositor_get_left_margin;

/** */
alias gtk_source_print_compositor_get_line_numbers_font_name = c_gtk_source_print_compositor_get_line_numbers_font_name;

/** */
alias gtk_source_print_compositor_get_n_pages = c_gtk_source_print_compositor_get_n_pages;

/** */
alias gtk_source_print_compositor_get_pagination_progress = c_gtk_source_print_compositor_get_pagination_progress;

/** */
alias gtk_source_print_compositor_get_print_footer = c_gtk_source_print_compositor_get_print_footer;

/** */
alias gtk_source_print_compositor_get_print_header = c_gtk_source_print_compositor_get_print_header;

/** */
alias gtk_source_print_compositor_get_print_line_numbers = c_gtk_source_print_compositor_get_print_line_numbers;

/** */
alias gtk_source_print_compositor_get_right_margin = c_gtk_source_print_compositor_get_right_margin;

/** */
alias gtk_source_print_compositor_get_tab_width = c_gtk_source_print_compositor_get_tab_width;

/** */
alias gtk_source_print_compositor_get_top_margin = c_gtk_source_print_compositor_get_top_margin;

/** */
alias gtk_source_print_compositor_get_wrap_mode = c_gtk_source_print_compositor_get_wrap_mode;

/** */
alias gtk_source_print_compositor_paginate = c_gtk_source_print_compositor_paginate;

/** */
alias gtk_source_print_compositor_set_body_font_name = c_gtk_source_print_compositor_set_body_font_name;

/** */
alias gtk_source_print_compositor_set_bottom_margin = c_gtk_source_print_compositor_set_bottom_margin;

/** */
alias gtk_source_print_compositor_set_footer_font_name = c_gtk_source_print_compositor_set_footer_font_name;

/** */
alias gtk_source_print_compositor_set_footer_format = c_gtk_source_print_compositor_set_footer_format;

/** */
alias gtk_source_print_compositor_set_header_font_name = c_gtk_source_print_compositor_set_header_font_name;

/** */
alias gtk_source_print_compositor_set_header_format = c_gtk_source_print_compositor_set_header_format;

/** */
alias gtk_source_print_compositor_set_highlight_syntax = c_gtk_source_print_compositor_set_highlight_syntax;

/** */
alias gtk_source_print_compositor_set_left_margin = c_gtk_source_print_compositor_set_left_margin;

/** */
alias gtk_source_print_compositor_set_line_numbers_font_name = c_gtk_source_print_compositor_set_line_numbers_font_name;

/** */
alias gtk_source_print_compositor_set_print_footer = c_gtk_source_print_compositor_set_print_footer;

/** */
alias gtk_source_print_compositor_set_print_header = c_gtk_source_print_compositor_set_print_header;

/** */
alias gtk_source_print_compositor_set_print_line_numbers = c_gtk_source_print_compositor_set_print_line_numbers;

/** */
alias gtk_source_print_compositor_set_right_margin = c_gtk_source_print_compositor_set_right_margin;

/** */
alias gtk_source_print_compositor_set_tab_width = c_gtk_source_print_compositor_set_tab_width;

/** */
alias gtk_source_print_compositor_set_top_margin = c_gtk_source_print_compositor_set_top_margin;

/** */
alias gtk_source_print_compositor_set_wrap_mode = c_gtk_source_print_compositor_set_wrap_mode;

// Region

/** */
alias gtk_source_region_get_type = c_gtk_source_region_get_type;

/** */
alias gtk_source_region_new = c_gtk_source_region_new;

/** */
alias gtk_source_region_add_region = c_gtk_source_region_add_region;

/** */
alias gtk_source_region_add_subregion = c_gtk_source_region_add_subregion;

/** */
alias gtk_source_region_get_bounds = c_gtk_source_region_get_bounds;

/** */
alias gtk_source_region_get_buffer = c_gtk_source_region_get_buffer;

/** */
alias gtk_source_region_get_start_region_iter = c_gtk_source_region_get_start_region_iter;

/** */
alias gtk_source_region_intersect_region = c_gtk_source_region_intersect_region;

/** */
alias gtk_source_region_intersect_subregion = c_gtk_source_region_intersect_subregion;

/** */
alias gtk_source_region_is_empty = c_gtk_source_region_is_empty;

/** */
alias gtk_source_region_subtract_region = c_gtk_source_region_subtract_region;

/** */
alias gtk_source_region_subtract_subregion = c_gtk_source_region_subtract_subregion;

/** */
alias gtk_source_region_to_string = c_gtk_source_region_to_string;

// RegionIter

/** */
alias gtk_source_region_iter_get_subregion = c_gtk_source_region_iter_get_subregion;

/** */
alias gtk_source_region_iter_is_end = c_gtk_source_region_iter_is_end;

/** */
alias gtk_source_region_iter_next = c_gtk_source_region_iter_next;

// SearchContext

/** */
alias gtk_source_search_context_get_type = c_gtk_source_search_context_get_type;

/** */
alias gtk_source_search_context_new = c_gtk_source_search_context_new;

/** */
alias gtk_source_search_context_backward = c_gtk_source_search_context_backward;

/** */
alias gtk_source_search_context_backward_async = c_gtk_source_search_context_backward_async;

/** */
alias gtk_source_search_context_backward_finish = c_gtk_source_search_context_backward_finish;

/** */
alias gtk_source_search_context_forward = c_gtk_source_search_context_forward;

/** */
alias gtk_source_search_context_forward_async = c_gtk_source_search_context_forward_async;

/** */
alias gtk_source_search_context_forward_finish = c_gtk_source_search_context_forward_finish;

/** */
alias gtk_source_search_context_get_buffer = c_gtk_source_search_context_get_buffer;

/** */
alias gtk_source_search_context_get_highlight = c_gtk_source_search_context_get_highlight;

/** */
alias gtk_source_search_context_get_match_style = c_gtk_source_search_context_get_match_style;

/** */
alias gtk_source_search_context_get_occurrence_position = c_gtk_source_search_context_get_occurrence_position;

/** */
alias gtk_source_search_context_get_occurrences_count = c_gtk_source_search_context_get_occurrences_count;

/** */
alias gtk_source_search_context_get_regex_error = c_gtk_source_search_context_get_regex_error;

/** */
alias gtk_source_search_context_get_settings = c_gtk_source_search_context_get_settings;

/** */
alias gtk_source_search_context_replace = c_gtk_source_search_context_replace;

/** */
alias gtk_source_search_context_replace_all = c_gtk_source_search_context_replace_all;

/** */
alias gtk_source_search_context_set_highlight = c_gtk_source_search_context_set_highlight;

/** */
alias gtk_source_search_context_set_match_style = c_gtk_source_search_context_set_match_style;

// SearchSettings

/** */
alias gtk_source_search_settings_get_type = c_gtk_source_search_settings_get_type;

/** */
alias gtk_source_search_settings_new = c_gtk_source_search_settings_new;

/** */
alias gtk_source_search_settings_get_at_word_boundaries = c_gtk_source_search_settings_get_at_word_boundaries;

/** */
alias gtk_source_search_settings_get_case_sensitive = c_gtk_source_search_settings_get_case_sensitive;

/** */
alias gtk_source_search_settings_get_regex_enabled = c_gtk_source_search_settings_get_regex_enabled;

/** */
alias gtk_source_search_settings_get_search_text = c_gtk_source_search_settings_get_search_text;

/** */
alias gtk_source_search_settings_get_wrap_around = c_gtk_source_search_settings_get_wrap_around;

/** */
alias gtk_source_search_settings_set_at_word_boundaries = c_gtk_source_search_settings_set_at_word_boundaries;

/** */
alias gtk_source_search_settings_set_case_sensitive = c_gtk_source_search_settings_set_case_sensitive;

/** */
alias gtk_source_search_settings_set_regex_enabled = c_gtk_source_search_settings_set_regex_enabled;

/** */
alias gtk_source_search_settings_set_search_text = c_gtk_source_search_settings_set_search_text;

/** */
alias gtk_source_search_settings_set_wrap_around = c_gtk_source_search_settings_set_wrap_around;

// SpaceDrawer

/** */
alias gtk_source_space_drawer_get_type = c_gtk_source_space_drawer_get_type;

/** */
alias gtk_source_space_drawer_new = c_gtk_source_space_drawer_new;

/** */
alias gtk_source_space_drawer_bind_matrix_setting = c_gtk_source_space_drawer_bind_matrix_setting;

/** */
alias gtk_source_space_drawer_get_enable_matrix = c_gtk_source_space_drawer_get_enable_matrix;

/** */
alias gtk_source_space_drawer_get_matrix = c_gtk_source_space_drawer_get_matrix;

/** */
alias gtk_source_space_drawer_get_types_for_locations = c_gtk_source_space_drawer_get_types_for_locations;

/** */
alias gtk_source_space_drawer_set_enable_matrix = c_gtk_source_space_drawer_set_enable_matrix;

/** */
alias gtk_source_space_drawer_set_matrix = c_gtk_source_space_drawer_set_matrix;

/** */
alias gtk_source_space_drawer_set_types_for_locations = c_gtk_source_space_drawer_set_types_for_locations;

// Style

/** */
alias gtk_source_style_get_type = c_gtk_source_style_get_type;

/** */
alias gtk_source_style_apply = c_gtk_source_style_apply;

/** */
alias gtk_source_style_copy = c_gtk_source_style_copy;

// StyleScheme

/** */
alias gtk_source_style_scheme_get_type = c_gtk_source_style_scheme_get_type;

/** */
alias gtk_source_style_scheme_get_authors = c_gtk_source_style_scheme_get_authors;

/** */
alias gtk_source_style_scheme_get_description = c_gtk_source_style_scheme_get_description;

/** */
alias gtk_source_style_scheme_get_filename = c_gtk_source_style_scheme_get_filename;

/** */
alias gtk_source_style_scheme_get_id = c_gtk_source_style_scheme_get_id;

/** */
alias gtk_source_style_scheme_get_name = c_gtk_source_style_scheme_get_name;

/** */
alias gtk_source_style_scheme_get_style = c_gtk_source_style_scheme_get_style;

// StyleSchemeChooser

/** */
alias gtk_source_style_scheme_chooser_get_type = c_gtk_source_style_scheme_chooser_get_type;

/** */
alias gtk_source_style_scheme_chooser_get_style_scheme = c_gtk_source_style_scheme_chooser_get_style_scheme;

/** */
alias gtk_source_style_scheme_chooser_set_style_scheme = c_gtk_source_style_scheme_chooser_set_style_scheme;

// StyleSchemeChooserButton

/** */
alias gtk_source_style_scheme_chooser_button_get_type = c_gtk_source_style_scheme_chooser_button_get_type;

/** */
alias gtk_source_style_scheme_chooser_button_new = c_gtk_source_style_scheme_chooser_button_new;

// StyleSchemeChooserWidget

/** */
alias gtk_source_style_scheme_chooser_widget_get_type = c_gtk_source_style_scheme_chooser_widget_get_type;

/** */
alias gtk_source_style_scheme_chooser_widget_new = c_gtk_source_style_scheme_chooser_widget_new;

// StyleSchemeManager

/** */
alias gtk_source_style_scheme_manager_get_type = c_gtk_source_style_scheme_manager_get_type;

/** */
alias gtk_source_style_scheme_manager_new = c_gtk_source_style_scheme_manager_new;

/** */
alias gtk_source_style_scheme_manager_get_default = c_gtk_source_style_scheme_manager_get_default;

/** */
alias gtk_source_style_scheme_manager_append_search_path = c_gtk_source_style_scheme_manager_append_search_path;

/** */
alias gtk_source_style_scheme_manager_force_rescan = c_gtk_source_style_scheme_manager_force_rescan;

/** */
alias gtk_source_style_scheme_manager_get_scheme = c_gtk_source_style_scheme_manager_get_scheme;

/** */
alias gtk_source_style_scheme_manager_get_scheme_ids = c_gtk_source_style_scheme_manager_get_scheme_ids;

/** */
alias gtk_source_style_scheme_manager_get_search_path = c_gtk_source_style_scheme_manager_get_search_path;

/** */
alias gtk_source_style_scheme_manager_prepend_search_path = c_gtk_source_style_scheme_manager_prepend_search_path;

/** */
alias gtk_source_style_scheme_manager_set_search_path = c_gtk_source_style_scheme_manager_set_search_path;

// Tag

/** */
alias gtk_source_tag_get_type = c_gtk_source_tag_get_type;

/** */
alias gtk_source_tag_new = c_gtk_source_tag_new;

// UndoManager

/** */
alias gtk_source_undo_manager_get_type = c_gtk_source_undo_manager_get_type;

/** */
alias gtk_source_undo_manager_begin_not_undoable_action = c_gtk_source_undo_manager_begin_not_undoable_action;

/** */
alias gtk_source_undo_manager_can_redo = c_gtk_source_undo_manager_can_redo;

/** */
alias gtk_source_undo_manager_can_redo_changed = c_gtk_source_undo_manager_can_redo_changed;

/** */
alias gtk_source_undo_manager_can_undo = c_gtk_source_undo_manager_can_undo;

/** */
alias gtk_source_undo_manager_can_undo_changed = c_gtk_source_undo_manager_can_undo_changed;

/** */
alias gtk_source_undo_manager_end_not_undoable_action = c_gtk_source_undo_manager_end_not_undoable_action;

/** */
alias gtk_source_undo_manager_redo = c_gtk_source_undo_manager_redo;

/** */
alias gtk_source_undo_manager_undo = c_gtk_source_undo_manager_undo;

// View

/** */
alias gtk_source_view_get_type = c_gtk_source_view_get_type;

/** */
alias gtk_source_view_new = c_gtk_source_view_new;

/** */
alias gtk_source_view_new_with_buffer = c_gtk_source_view_new_with_buffer;

/** */
alias gtk_source_view_get_auto_indent = c_gtk_source_view_get_auto_indent;

/** */
alias gtk_source_view_get_background_pattern = c_gtk_source_view_get_background_pattern;

/** */
alias gtk_source_view_get_completion = c_gtk_source_view_get_completion;

/** */
alias gtk_source_view_get_gutter = c_gtk_source_view_get_gutter;

/** */
alias gtk_source_view_get_highlight_current_line = c_gtk_source_view_get_highlight_current_line;

/** */
alias gtk_source_view_get_indent_on_tab = c_gtk_source_view_get_indent_on_tab;

/** */
alias gtk_source_view_get_indent_width = c_gtk_source_view_get_indent_width;

/** */
alias gtk_source_view_get_insert_spaces_instead_of_tabs = c_gtk_source_view_get_insert_spaces_instead_of_tabs;

/** */
alias gtk_source_view_get_mark_attributes = c_gtk_source_view_get_mark_attributes;

/** */
alias gtk_source_view_get_right_margin_position = c_gtk_source_view_get_right_margin_position;

/** */
alias gtk_source_view_get_show_line_marks = c_gtk_source_view_get_show_line_marks;

/** */
alias gtk_source_view_get_show_line_numbers = c_gtk_source_view_get_show_line_numbers;

/** */
alias gtk_source_view_get_show_right_margin = c_gtk_source_view_get_show_right_margin;

/** */
alias gtk_source_view_get_smart_backspace = c_gtk_source_view_get_smart_backspace;

/** */
alias gtk_source_view_get_smart_home_end = c_gtk_source_view_get_smart_home_end;

/** */
alias gtk_source_view_get_space_drawer = c_gtk_source_view_get_space_drawer;

/** */
alias gtk_source_view_get_tab_width = c_gtk_source_view_get_tab_width;

/** */
alias gtk_source_view_get_visual_column = c_gtk_source_view_get_visual_column;

/** */
alias gtk_source_view_indent_lines = c_gtk_source_view_indent_lines;

/** */
alias gtk_source_view_set_auto_indent = c_gtk_source_view_set_auto_indent;

/** */
alias gtk_source_view_set_background_pattern = c_gtk_source_view_set_background_pattern;

/** */
alias gtk_source_view_set_highlight_current_line = c_gtk_source_view_set_highlight_current_line;

/** */
alias gtk_source_view_set_indent_on_tab = c_gtk_source_view_set_indent_on_tab;

/** */
alias gtk_source_view_set_indent_width = c_gtk_source_view_set_indent_width;

/** */
alias gtk_source_view_set_insert_spaces_instead_of_tabs = c_gtk_source_view_set_insert_spaces_instead_of_tabs;

/** */
alias gtk_source_view_set_mark_attributes = c_gtk_source_view_set_mark_attributes;

/** */
alias gtk_source_view_set_right_margin_position = c_gtk_source_view_set_right_margin_position;

/** */
alias gtk_source_view_set_show_line_marks = c_gtk_source_view_set_show_line_marks;

/** */
alias gtk_source_view_set_show_line_numbers = c_gtk_source_view_set_show_line_numbers;

/** */
alias gtk_source_view_set_show_right_margin = c_gtk_source_view_set_show_right_margin;

/** */
alias gtk_source_view_set_smart_backspace = c_gtk_source_view_set_smart_backspace;

/** */
alias gtk_source_view_set_smart_home_end = c_gtk_source_view_set_smart_home_end;

/** */
alias gtk_source_view_set_tab_width = c_gtk_source_view_set_tab_width;

/** */
alias gtk_source_view_unindent_lines = c_gtk_source_view_unindent_lines;

// global

/** */
alias gtk_source_finalize = c_gtk_source_finalize;

/** */
alias gtk_source_init = c_gtk_source_init;

/** */
alias gtk_source_utils_escape_search_text = c_gtk_source_utils_escape_search_text;

/** */
alias gtk_source_utils_unescape_search_text = c_gtk_source_utils_unescape_search_text;

// CompletionError

/** */
alias gtk_source_completion_error_quark = c_gtk_source_completion_error_quark;

// FileLoaderError

/** */
alias gtk_source_file_loader_error_quark = c_gtk_source_file_loader_error_quark;

// FileSaverError

/** */
alias gtk_source_file_saver_error_quark = c_gtk_source_file_saver_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Buffer
  gidLink(cast(void**)&gtk_source_buffer_get_type, "gtk_source_buffer_get_type", libs);
  gidLink(cast(void**)&gtk_source_buffer_new, "gtk_source_buffer_new", libs);
  gidLink(cast(void**)&gtk_source_buffer_new_with_language, "gtk_source_buffer_new_with_language", libs);
  gidLink(cast(void**)&gtk_source_buffer_backward_iter_to_source_mark, "gtk_source_buffer_backward_iter_to_source_mark", libs);
  gidLink(cast(void**)&gtk_source_buffer_begin_not_undoable_action, "gtk_source_buffer_begin_not_undoable_action", libs);
  gidLink(cast(void**)&gtk_source_buffer_can_redo, "gtk_source_buffer_can_redo", libs);
  gidLink(cast(void**)&gtk_source_buffer_can_undo, "gtk_source_buffer_can_undo", libs);
  gidLink(cast(void**)&gtk_source_buffer_change_case, "gtk_source_buffer_change_case", libs);
  gidLink(cast(void**)&gtk_source_buffer_create_source_mark, "gtk_source_buffer_create_source_mark", libs);
  gidLink(cast(void**)&gtk_source_buffer_create_source_tag, "gtk_source_buffer_create_source_tag", libs);
  gidLink(cast(void**)&gtk_source_buffer_end_not_undoable_action, "gtk_source_buffer_end_not_undoable_action", libs);
  gidLink(cast(void**)&gtk_source_buffer_ensure_highlight, "gtk_source_buffer_ensure_highlight", libs);
  gidLink(cast(void**)&gtk_source_buffer_forward_iter_to_source_mark, "gtk_source_buffer_forward_iter_to_source_mark", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_context_classes_at_iter, "gtk_source_buffer_get_context_classes_at_iter", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_highlight_matching_brackets, "gtk_source_buffer_get_highlight_matching_brackets", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_highlight_syntax, "gtk_source_buffer_get_highlight_syntax", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_implicit_trailing_newline, "gtk_source_buffer_get_implicit_trailing_newline", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_language, "gtk_source_buffer_get_language", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_max_undo_levels, "gtk_source_buffer_get_max_undo_levels", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_source_marks_at_iter, "gtk_source_buffer_get_source_marks_at_iter", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_source_marks_at_line, "gtk_source_buffer_get_source_marks_at_line", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_style_scheme, "gtk_source_buffer_get_style_scheme", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_undo_manager, "gtk_source_buffer_get_undo_manager", libs);
  gidLink(cast(void**)&gtk_source_buffer_iter_backward_to_context_class_toggle, "gtk_source_buffer_iter_backward_to_context_class_toggle", libs);
  gidLink(cast(void**)&gtk_source_buffer_iter_forward_to_context_class_toggle, "gtk_source_buffer_iter_forward_to_context_class_toggle", libs);
  gidLink(cast(void**)&gtk_source_buffer_iter_has_context_class, "gtk_source_buffer_iter_has_context_class", libs);
  gidLink(cast(void**)&gtk_source_buffer_join_lines, "gtk_source_buffer_join_lines", libs);
  gidLink(cast(void**)&gtk_source_buffer_redo, "gtk_source_buffer_redo", libs);
  gidLink(cast(void**)&gtk_source_buffer_remove_source_marks, "gtk_source_buffer_remove_source_marks", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_highlight_matching_brackets, "gtk_source_buffer_set_highlight_matching_brackets", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_highlight_syntax, "gtk_source_buffer_set_highlight_syntax", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_implicit_trailing_newline, "gtk_source_buffer_set_implicit_trailing_newline", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_language, "gtk_source_buffer_set_language", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_max_undo_levels, "gtk_source_buffer_set_max_undo_levels", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_style_scheme, "gtk_source_buffer_set_style_scheme", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_undo_manager, "gtk_source_buffer_set_undo_manager", libs);
  gidLink(cast(void**)&gtk_source_buffer_sort_lines, "gtk_source_buffer_sort_lines", libs);
  gidLink(cast(void**)&gtk_source_buffer_undo, "gtk_source_buffer_undo", libs);

  // Completion
  gidLink(cast(void**)&gtk_source_completion_get_type, "gtk_source_completion_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_add_provider, "gtk_source_completion_add_provider", libs);
  gidLink(cast(void**)&gtk_source_completion_block_interactive, "gtk_source_completion_block_interactive", libs);
  gidLink(cast(void**)&gtk_source_completion_create_context, "gtk_source_completion_create_context", libs);
  gidLink(cast(void**)&gtk_source_completion_get_info_window, "gtk_source_completion_get_info_window", libs);
  gidLink(cast(void**)&gtk_source_completion_get_providers, "gtk_source_completion_get_providers", libs);
  gidLink(cast(void**)&gtk_source_completion_get_view, "gtk_source_completion_get_view", libs);
  gidLink(cast(void**)&gtk_source_completion_hide, "gtk_source_completion_hide", libs);
  gidLink(cast(void**)&gtk_source_completion_remove_provider, "gtk_source_completion_remove_provider", libs);
  gidLink(cast(void**)&gtk_source_completion_start, "gtk_source_completion_start", libs);
  gidLink(cast(void**)&gtk_source_completion_unblock_interactive, "gtk_source_completion_unblock_interactive", libs);

  // CompletionContext
  gidLink(cast(void**)&gtk_source_completion_context_get_type, "gtk_source_completion_context_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_context_add_proposals, "gtk_source_completion_context_add_proposals", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_activation, "gtk_source_completion_context_get_activation", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_iter, "gtk_source_completion_context_get_iter", libs);

  // CompletionInfo
  gidLink(cast(void**)&gtk_source_completion_info_get_type, "gtk_source_completion_info_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_info_new, "gtk_source_completion_info_new", libs);
  gidLink(cast(void**)&gtk_source_completion_info_move_to_iter, "gtk_source_completion_info_move_to_iter", libs);

  // CompletionItem
  gidLink(cast(void**)&gtk_source_completion_item_get_type, "gtk_source_completion_item_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_item_new, "gtk_source_completion_item_new", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_gicon, "gtk_source_completion_item_set_gicon", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_icon, "gtk_source_completion_item_set_icon", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_icon_name, "gtk_source_completion_item_set_icon_name", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_info, "gtk_source_completion_item_set_info", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_label, "gtk_source_completion_item_set_label", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_markup, "gtk_source_completion_item_set_markup", libs);
  gidLink(cast(void**)&gtk_source_completion_item_set_text, "gtk_source_completion_item_set_text", libs);

  // CompletionProposal
  gidLink(cast(void**)&gtk_source_completion_proposal_get_type, "gtk_source_completion_proposal_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_changed, "gtk_source_completion_proposal_changed", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_equal, "gtk_source_completion_proposal_equal", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_gicon, "gtk_source_completion_proposal_get_gicon", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_icon, "gtk_source_completion_proposal_get_icon", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_icon_name, "gtk_source_completion_proposal_get_icon_name", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_info, "gtk_source_completion_proposal_get_info", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_label, "gtk_source_completion_proposal_get_label", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_markup, "gtk_source_completion_proposal_get_markup", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_text, "gtk_source_completion_proposal_get_text", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_hash, "gtk_source_completion_proposal_hash", libs);

  // CompletionProvider
  gidLink(cast(void**)&gtk_source_completion_provider_get_type, "gtk_source_completion_provider_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_activate_proposal, "gtk_source_completion_provider_activate_proposal", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_activation, "gtk_source_completion_provider_get_activation", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_gicon, "gtk_source_completion_provider_get_gicon", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_icon, "gtk_source_completion_provider_get_icon", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_icon_name, "gtk_source_completion_provider_get_icon_name", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_info_widget, "gtk_source_completion_provider_get_info_widget", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_interactive_delay, "gtk_source_completion_provider_get_interactive_delay", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_name, "gtk_source_completion_provider_get_name", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_priority, "gtk_source_completion_provider_get_priority", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_start_iter, "gtk_source_completion_provider_get_start_iter", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_match, "gtk_source_completion_provider_match", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_populate, "gtk_source_completion_provider_populate", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_update_info, "gtk_source_completion_provider_update_info", libs);

  // CompletionWords
  gidLink(cast(void**)&gtk_source_completion_words_get_type, "gtk_source_completion_words_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_words_new, "gtk_source_completion_words_new", libs);
  gidLink(cast(void**)&gtk_source_completion_words_register, "gtk_source_completion_words_register", libs);
  gidLink(cast(void**)&gtk_source_completion_words_unregister, "gtk_source_completion_words_unregister", libs);

  // Encoding
  gidLink(cast(void**)&gtk_source_encoding_get_type, "gtk_source_encoding_get_type", libs);
  gidLink(cast(void**)&gtk_source_encoding_copy, "gtk_source_encoding_copy", libs);
  gidLink(cast(void**)&gtk_source_encoding_free, "gtk_source_encoding_free", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_charset, "gtk_source_encoding_get_charset", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_name, "gtk_source_encoding_get_name", libs);
  gidLink(cast(void**)&gtk_source_encoding_to_string, "gtk_source_encoding_to_string", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_all, "gtk_source_encoding_get_all", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_current, "gtk_source_encoding_get_current", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_default_candidates, "gtk_source_encoding_get_default_candidates", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_from_charset, "gtk_source_encoding_get_from_charset", libs);
  gidLink(cast(void**)&gtk_source_encoding_get_utf8, "gtk_source_encoding_get_utf8", libs);

  // File
  gidLink(cast(void**)&gtk_source_file_get_type, "gtk_source_file_get_type", libs);
  gidLink(cast(void**)&gtk_source_file_new, "gtk_source_file_new", libs);
  gidLink(cast(void**)&gtk_source_file_check_file_on_disk, "gtk_source_file_check_file_on_disk", libs);
  gidLink(cast(void**)&gtk_source_file_get_compression_type, "gtk_source_file_get_compression_type", libs);
  gidLink(cast(void**)&gtk_source_file_get_encoding, "gtk_source_file_get_encoding", libs);
  gidLink(cast(void**)&gtk_source_file_get_location, "gtk_source_file_get_location", libs);
  gidLink(cast(void**)&gtk_source_file_get_newline_type, "gtk_source_file_get_newline_type", libs);
  gidLink(cast(void**)&gtk_source_file_is_deleted, "gtk_source_file_is_deleted", libs);
  gidLink(cast(void**)&gtk_source_file_is_externally_modified, "gtk_source_file_is_externally_modified", libs);
  gidLink(cast(void**)&gtk_source_file_is_local, "gtk_source_file_is_local", libs);
  gidLink(cast(void**)&gtk_source_file_is_readonly, "gtk_source_file_is_readonly", libs);
  gidLink(cast(void**)&gtk_source_file_set_location, "gtk_source_file_set_location", libs);
  gidLink(cast(void**)&gtk_source_file_set_mount_operation_factory, "gtk_source_file_set_mount_operation_factory", libs);

  // FileLoader
  gidLink(cast(void**)&gtk_source_file_loader_get_type, "gtk_source_file_loader_get_type", libs);
  gidLink(cast(void**)&gtk_source_file_loader_new, "gtk_source_file_loader_new", libs);
  gidLink(cast(void**)&gtk_source_file_loader_new_from_stream, "gtk_source_file_loader_new_from_stream", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_buffer, "gtk_source_file_loader_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_compression_type, "gtk_source_file_loader_get_compression_type", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_encoding, "gtk_source_file_loader_get_encoding", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_file, "gtk_source_file_loader_get_file", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_input_stream, "gtk_source_file_loader_get_input_stream", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_location, "gtk_source_file_loader_get_location", libs);
  gidLink(cast(void**)&gtk_source_file_loader_get_newline_type, "gtk_source_file_loader_get_newline_type", libs);
  gidLink(cast(void**)&gtk_source_file_loader_load_async, "gtk_source_file_loader_load_async", libs);
  gidLink(cast(void**)&gtk_source_file_loader_load_finish, "gtk_source_file_loader_load_finish", libs);
  gidLink(cast(void**)&gtk_source_file_loader_set_candidate_encodings, "gtk_source_file_loader_set_candidate_encodings", libs);

  // FileSaver
  gidLink(cast(void**)&gtk_source_file_saver_get_type, "gtk_source_file_saver_get_type", libs);
  gidLink(cast(void**)&gtk_source_file_saver_new, "gtk_source_file_saver_new", libs);
  gidLink(cast(void**)&gtk_source_file_saver_new_with_target, "gtk_source_file_saver_new_with_target", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_buffer, "gtk_source_file_saver_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_compression_type, "gtk_source_file_saver_get_compression_type", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_encoding, "gtk_source_file_saver_get_encoding", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_file, "gtk_source_file_saver_get_file", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_flags, "gtk_source_file_saver_get_flags", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_location, "gtk_source_file_saver_get_location", libs);
  gidLink(cast(void**)&gtk_source_file_saver_get_newline_type, "gtk_source_file_saver_get_newline_type", libs);
  gidLink(cast(void**)&gtk_source_file_saver_save_async, "gtk_source_file_saver_save_async", libs);
  gidLink(cast(void**)&gtk_source_file_saver_save_finish, "gtk_source_file_saver_save_finish", libs);
  gidLink(cast(void**)&gtk_source_file_saver_set_compression_type, "gtk_source_file_saver_set_compression_type", libs);
  gidLink(cast(void**)&gtk_source_file_saver_set_encoding, "gtk_source_file_saver_set_encoding", libs);
  gidLink(cast(void**)&gtk_source_file_saver_set_flags, "gtk_source_file_saver_set_flags", libs);
  gidLink(cast(void**)&gtk_source_file_saver_set_newline_type, "gtk_source_file_saver_set_newline_type", libs);

  // Gutter
  gidLink(cast(void**)&gtk_source_gutter_get_type, "gtk_source_gutter_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_get_renderer_at_pos, "gtk_source_gutter_get_renderer_at_pos", libs);
  gidLink(cast(void**)&gtk_source_gutter_get_view, "gtk_source_gutter_get_view", libs);
  gidLink(cast(void**)&gtk_source_gutter_get_window_type, "gtk_source_gutter_get_window_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_insert, "gtk_source_gutter_insert", libs);
  gidLink(cast(void**)&gtk_source_gutter_queue_draw, "gtk_source_gutter_queue_draw", libs);
  gidLink(cast(void**)&gtk_source_gutter_remove, "gtk_source_gutter_remove", libs);
  gidLink(cast(void**)&gtk_source_gutter_reorder, "gtk_source_gutter_reorder", libs);

  // GutterRenderer
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_type, "gtk_source_gutter_renderer_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_activate, "gtk_source_gutter_renderer_activate", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_begin, "gtk_source_gutter_renderer_begin", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_draw, "gtk_source_gutter_renderer_draw", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_end, "gtk_source_gutter_renderer_end", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_alignment, "gtk_source_gutter_renderer_get_alignment", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_alignment_mode, "gtk_source_gutter_renderer_get_alignment_mode", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_background, "gtk_source_gutter_renderer_get_background", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_padding, "gtk_source_gutter_renderer_get_padding", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_size, "gtk_source_gutter_renderer_get_size", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_view, "gtk_source_gutter_renderer_get_view", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_visible, "gtk_source_gutter_renderer_get_visible", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_window_type, "gtk_source_gutter_renderer_get_window_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_query_activatable, "gtk_source_gutter_renderer_query_activatable", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_query_data, "gtk_source_gutter_renderer_query_data", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_query_tooltip, "gtk_source_gutter_renderer_query_tooltip", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_queue_draw, "gtk_source_gutter_renderer_queue_draw", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_alignment, "gtk_source_gutter_renderer_set_alignment", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_alignment_mode, "gtk_source_gutter_renderer_set_alignment_mode", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_background, "gtk_source_gutter_renderer_set_background", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_padding, "gtk_source_gutter_renderer_set_padding", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_size, "gtk_source_gutter_renderer_set_size", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_visible, "gtk_source_gutter_renderer_set_visible", libs);

  // GutterRendererPixbuf
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_type, "gtk_source_gutter_renderer_pixbuf_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_new, "gtk_source_gutter_renderer_pixbuf_new", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_gicon, "gtk_source_gutter_renderer_pixbuf_get_gicon", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_icon_name, "gtk_source_gutter_renderer_pixbuf_get_icon_name", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_pixbuf, "gtk_source_gutter_renderer_pixbuf_get_pixbuf", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_gicon, "gtk_source_gutter_renderer_pixbuf_set_gicon", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_icon_name, "gtk_source_gutter_renderer_pixbuf_set_icon_name", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_pixbuf, "gtk_source_gutter_renderer_pixbuf_set_pixbuf", libs);

  // GutterRendererText
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_get_type, "gtk_source_gutter_renderer_text_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_new, "gtk_source_gutter_renderer_text_new", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_measure, "gtk_source_gutter_renderer_text_measure", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_measure_markup, "gtk_source_gutter_renderer_text_measure_markup", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_set_markup, "gtk_source_gutter_renderer_text_set_markup", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_set_text, "gtk_source_gutter_renderer_text_set_text", libs);

  // Language
  gidLink(cast(void**)&gtk_source_language_get_type, "gtk_source_language_get_type", libs);
  gidLink(cast(void**)&gtk_source_language_get_globs, "gtk_source_language_get_globs", libs);
  gidLink(cast(void**)&gtk_source_language_get_hidden, "gtk_source_language_get_hidden", libs);
  gidLink(cast(void**)&gtk_source_language_get_id, "gtk_source_language_get_id", libs);
  gidLink(cast(void**)&gtk_source_language_get_metadata, "gtk_source_language_get_metadata", libs);
  gidLink(cast(void**)&gtk_source_language_get_mime_types, "gtk_source_language_get_mime_types", libs);
  gidLink(cast(void**)&gtk_source_language_get_name, "gtk_source_language_get_name", libs);
  gidLink(cast(void**)&gtk_source_language_get_section, "gtk_source_language_get_section", libs);
  gidLink(cast(void**)&gtk_source_language_get_style_fallback, "gtk_source_language_get_style_fallback", libs);
  gidLink(cast(void**)&gtk_source_language_get_style_ids, "gtk_source_language_get_style_ids", libs);
  gidLink(cast(void**)&gtk_source_language_get_style_name, "gtk_source_language_get_style_name", libs);

  // LanguageManager
  gidLink(cast(void**)&gtk_source_language_manager_get_type, "gtk_source_language_manager_get_type", libs);
  gidLink(cast(void**)&gtk_source_language_manager_new, "gtk_source_language_manager_new", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_default, "gtk_source_language_manager_get_default", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_language, "gtk_source_language_manager_get_language", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_language_ids, "gtk_source_language_manager_get_language_ids", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_search_path, "gtk_source_language_manager_get_search_path", libs);
  gidLink(cast(void**)&gtk_source_language_manager_guess_language, "gtk_source_language_manager_guess_language", libs);
  gidLink(cast(void**)&gtk_source_language_manager_set_search_path, "gtk_source_language_manager_set_search_path", libs);

  // Map
  gidLink(cast(void**)&gtk_source_map_get_type, "gtk_source_map_get_type", libs);
  gidLink(cast(void**)&gtk_source_map_new, "gtk_source_map_new", libs);
  gidLink(cast(void**)&gtk_source_map_get_view, "gtk_source_map_get_view", libs);
  gidLink(cast(void**)&gtk_source_map_set_view, "gtk_source_map_set_view", libs);

  // Mark
  gidLink(cast(void**)&gtk_source_mark_get_type, "gtk_source_mark_get_type", libs);
  gidLink(cast(void**)&gtk_source_mark_new, "gtk_source_mark_new", libs);
  gidLink(cast(void**)&gtk_source_mark_get_category, "gtk_source_mark_get_category", libs);
  gidLink(cast(void**)&gtk_source_mark_next, "gtk_source_mark_next", libs);
  gidLink(cast(void**)&gtk_source_mark_prev, "gtk_source_mark_prev", libs);

  // MarkAttributes
  gidLink(cast(void**)&gtk_source_mark_attributes_get_type, "gtk_source_mark_attributes_get_type", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_new, "gtk_source_mark_attributes_new", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_get_background, "gtk_source_mark_attributes_get_background", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_get_gicon, "gtk_source_mark_attributes_get_gicon", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_get_icon_name, "gtk_source_mark_attributes_get_icon_name", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_get_pixbuf, "gtk_source_mark_attributes_get_pixbuf", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_get_tooltip_markup, "gtk_source_mark_attributes_get_tooltip_markup", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_get_tooltip_text, "gtk_source_mark_attributes_get_tooltip_text", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_render_icon, "gtk_source_mark_attributes_render_icon", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_set_background, "gtk_source_mark_attributes_set_background", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_set_gicon, "gtk_source_mark_attributes_set_gicon", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_set_icon_name, "gtk_source_mark_attributes_set_icon_name", libs);
  gidLink(cast(void**)&gtk_source_mark_attributes_set_pixbuf, "gtk_source_mark_attributes_set_pixbuf", libs);

  // PrintCompositor
  gidLink(cast(void**)&gtk_source_print_compositor_get_type, "gtk_source_print_compositor_get_type", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_new, "gtk_source_print_compositor_new", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_new_from_view, "gtk_source_print_compositor_new_from_view", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_draw_page, "gtk_source_print_compositor_draw_page", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_body_font_name, "gtk_source_print_compositor_get_body_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_bottom_margin, "gtk_source_print_compositor_get_bottom_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_buffer, "gtk_source_print_compositor_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_footer_font_name, "gtk_source_print_compositor_get_footer_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_header_font_name, "gtk_source_print_compositor_get_header_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_highlight_syntax, "gtk_source_print_compositor_get_highlight_syntax", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_left_margin, "gtk_source_print_compositor_get_left_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_line_numbers_font_name, "gtk_source_print_compositor_get_line_numbers_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_n_pages, "gtk_source_print_compositor_get_n_pages", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_pagination_progress, "gtk_source_print_compositor_get_pagination_progress", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_print_footer, "gtk_source_print_compositor_get_print_footer", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_print_header, "gtk_source_print_compositor_get_print_header", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_print_line_numbers, "gtk_source_print_compositor_get_print_line_numbers", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_right_margin, "gtk_source_print_compositor_get_right_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_tab_width, "gtk_source_print_compositor_get_tab_width", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_top_margin, "gtk_source_print_compositor_get_top_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_get_wrap_mode, "gtk_source_print_compositor_get_wrap_mode", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_paginate, "gtk_source_print_compositor_paginate", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_body_font_name, "gtk_source_print_compositor_set_body_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_bottom_margin, "gtk_source_print_compositor_set_bottom_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_footer_font_name, "gtk_source_print_compositor_set_footer_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_footer_format, "gtk_source_print_compositor_set_footer_format", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_header_font_name, "gtk_source_print_compositor_set_header_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_header_format, "gtk_source_print_compositor_set_header_format", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_highlight_syntax, "gtk_source_print_compositor_set_highlight_syntax", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_left_margin, "gtk_source_print_compositor_set_left_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_line_numbers_font_name, "gtk_source_print_compositor_set_line_numbers_font_name", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_print_footer, "gtk_source_print_compositor_set_print_footer", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_print_header, "gtk_source_print_compositor_set_print_header", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_print_line_numbers, "gtk_source_print_compositor_set_print_line_numbers", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_right_margin, "gtk_source_print_compositor_set_right_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_tab_width, "gtk_source_print_compositor_set_tab_width", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_top_margin, "gtk_source_print_compositor_set_top_margin", libs);
  gidLink(cast(void**)&gtk_source_print_compositor_set_wrap_mode, "gtk_source_print_compositor_set_wrap_mode", libs);

  // Region
  gidLink(cast(void**)&gtk_source_region_get_type, "gtk_source_region_get_type", libs);
  gidLink(cast(void**)&gtk_source_region_new, "gtk_source_region_new", libs);
  gidLink(cast(void**)&gtk_source_region_add_region, "gtk_source_region_add_region", libs);
  gidLink(cast(void**)&gtk_source_region_add_subregion, "gtk_source_region_add_subregion", libs);
  gidLink(cast(void**)&gtk_source_region_get_bounds, "gtk_source_region_get_bounds", libs);
  gidLink(cast(void**)&gtk_source_region_get_buffer, "gtk_source_region_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_region_get_start_region_iter, "gtk_source_region_get_start_region_iter", libs);
  gidLink(cast(void**)&gtk_source_region_intersect_region, "gtk_source_region_intersect_region", libs);
  gidLink(cast(void**)&gtk_source_region_intersect_subregion, "gtk_source_region_intersect_subregion", libs);
  gidLink(cast(void**)&gtk_source_region_is_empty, "gtk_source_region_is_empty", libs);
  gidLink(cast(void**)&gtk_source_region_subtract_region, "gtk_source_region_subtract_region", libs);
  gidLink(cast(void**)&gtk_source_region_subtract_subregion, "gtk_source_region_subtract_subregion", libs);
  gidLink(cast(void**)&gtk_source_region_to_string, "gtk_source_region_to_string", libs);

  // RegionIter
  gidLink(cast(void**)&gtk_source_region_iter_get_subregion, "gtk_source_region_iter_get_subregion", libs);
  gidLink(cast(void**)&gtk_source_region_iter_is_end, "gtk_source_region_iter_is_end", libs);
  gidLink(cast(void**)&gtk_source_region_iter_next, "gtk_source_region_iter_next", libs);

  // SearchContext
  gidLink(cast(void**)&gtk_source_search_context_get_type, "gtk_source_search_context_get_type", libs);
  gidLink(cast(void**)&gtk_source_search_context_new, "gtk_source_search_context_new", libs);
  gidLink(cast(void**)&gtk_source_search_context_backward, "gtk_source_search_context_backward", libs);
  gidLink(cast(void**)&gtk_source_search_context_backward_async, "gtk_source_search_context_backward_async", libs);
  gidLink(cast(void**)&gtk_source_search_context_backward_finish, "gtk_source_search_context_backward_finish", libs);
  gidLink(cast(void**)&gtk_source_search_context_forward, "gtk_source_search_context_forward", libs);
  gidLink(cast(void**)&gtk_source_search_context_forward_async, "gtk_source_search_context_forward_async", libs);
  gidLink(cast(void**)&gtk_source_search_context_forward_finish, "gtk_source_search_context_forward_finish", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_buffer, "gtk_source_search_context_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_highlight, "gtk_source_search_context_get_highlight", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_match_style, "gtk_source_search_context_get_match_style", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_occurrence_position, "gtk_source_search_context_get_occurrence_position", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_occurrences_count, "gtk_source_search_context_get_occurrences_count", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_regex_error, "gtk_source_search_context_get_regex_error", libs);
  gidLink(cast(void**)&gtk_source_search_context_get_settings, "gtk_source_search_context_get_settings", libs);
  gidLink(cast(void**)&gtk_source_search_context_replace, "gtk_source_search_context_replace", libs);
  gidLink(cast(void**)&gtk_source_search_context_replace_all, "gtk_source_search_context_replace_all", libs);
  gidLink(cast(void**)&gtk_source_search_context_set_highlight, "gtk_source_search_context_set_highlight", libs);
  gidLink(cast(void**)&gtk_source_search_context_set_match_style, "gtk_source_search_context_set_match_style", libs);

  // SearchSettings
  gidLink(cast(void**)&gtk_source_search_settings_get_type, "gtk_source_search_settings_get_type", libs);
  gidLink(cast(void**)&gtk_source_search_settings_new, "gtk_source_search_settings_new", libs);
  gidLink(cast(void**)&gtk_source_search_settings_get_at_word_boundaries, "gtk_source_search_settings_get_at_word_boundaries", libs);
  gidLink(cast(void**)&gtk_source_search_settings_get_case_sensitive, "gtk_source_search_settings_get_case_sensitive", libs);
  gidLink(cast(void**)&gtk_source_search_settings_get_regex_enabled, "gtk_source_search_settings_get_regex_enabled", libs);
  gidLink(cast(void**)&gtk_source_search_settings_get_search_text, "gtk_source_search_settings_get_search_text", libs);
  gidLink(cast(void**)&gtk_source_search_settings_get_wrap_around, "gtk_source_search_settings_get_wrap_around", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_at_word_boundaries, "gtk_source_search_settings_set_at_word_boundaries", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_case_sensitive, "gtk_source_search_settings_set_case_sensitive", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_regex_enabled, "gtk_source_search_settings_set_regex_enabled", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_search_text, "gtk_source_search_settings_set_search_text", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_wrap_around, "gtk_source_search_settings_set_wrap_around", libs);

  // SpaceDrawer
  gidLink(cast(void**)&gtk_source_space_drawer_get_type, "gtk_source_space_drawer_get_type", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_new, "gtk_source_space_drawer_new", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_bind_matrix_setting, "gtk_source_space_drawer_bind_matrix_setting", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_get_enable_matrix, "gtk_source_space_drawer_get_enable_matrix", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_get_matrix, "gtk_source_space_drawer_get_matrix", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_get_types_for_locations, "gtk_source_space_drawer_get_types_for_locations", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_set_enable_matrix, "gtk_source_space_drawer_set_enable_matrix", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_set_matrix, "gtk_source_space_drawer_set_matrix", libs);
  gidLink(cast(void**)&gtk_source_space_drawer_set_types_for_locations, "gtk_source_space_drawer_set_types_for_locations", libs);

  // Style
  gidLink(cast(void**)&gtk_source_style_get_type, "gtk_source_style_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_apply, "gtk_source_style_apply", libs);
  gidLink(cast(void**)&gtk_source_style_copy, "gtk_source_style_copy", libs);

  // StyleScheme
  gidLink(cast(void**)&gtk_source_style_scheme_get_type, "gtk_source_style_scheme_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_get_authors, "gtk_source_style_scheme_get_authors", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_get_description, "gtk_source_style_scheme_get_description", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_get_filename, "gtk_source_style_scheme_get_filename", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_get_id, "gtk_source_style_scheme_get_id", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_get_name, "gtk_source_style_scheme_get_name", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_get_style, "gtk_source_style_scheme_get_style", libs);

  // StyleSchemeChooser
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_get_type, "gtk_source_style_scheme_chooser_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_get_style_scheme, "gtk_source_style_scheme_chooser_get_style_scheme", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_set_style_scheme, "gtk_source_style_scheme_chooser_set_style_scheme", libs);

  // StyleSchemeChooserButton
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_button_get_type, "gtk_source_style_scheme_chooser_button_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_button_new, "gtk_source_style_scheme_chooser_button_new", libs);

  // StyleSchemeChooserWidget
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_widget_get_type, "gtk_source_style_scheme_chooser_widget_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_chooser_widget_new, "gtk_source_style_scheme_chooser_widget_new", libs);

  // StyleSchemeManager
  gidLink(cast(void**)&gtk_source_style_scheme_manager_get_type, "gtk_source_style_scheme_manager_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_new, "gtk_source_style_scheme_manager_new", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_get_default, "gtk_source_style_scheme_manager_get_default", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_append_search_path, "gtk_source_style_scheme_manager_append_search_path", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_force_rescan, "gtk_source_style_scheme_manager_force_rescan", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_get_scheme, "gtk_source_style_scheme_manager_get_scheme", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_get_scheme_ids, "gtk_source_style_scheme_manager_get_scheme_ids", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_get_search_path, "gtk_source_style_scheme_manager_get_search_path", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_prepend_search_path, "gtk_source_style_scheme_manager_prepend_search_path", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_manager_set_search_path, "gtk_source_style_scheme_manager_set_search_path", libs);

  // Tag
  gidLink(cast(void**)&gtk_source_tag_get_type, "gtk_source_tag_get_type", libs);
  gidLink(cast(void**)&gtk_source_tag_new, "gtk_source_tag_new", libs);

  // UndoManager
  gidLink(cast(void**)&gtk_source_undo_manager_get_type, "gtk_source_undo_manager_get_type", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_begin_not_undoable_action, "gtk_source_undo_manager_begin_not_undoable_action", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_can_redo, "gtk_source_undo_manager_can_redo", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_can_redo_changed, "gtk_source_undo_manager_can_redo_changed", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_can_undo, "gtk_source_undo_manager_can_undo", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_can_undo_changed, "gtk_source_undo_manager_can_undo_changed", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_end_not_undoable_action, "gtk_source_undo_manager_end_not_undoable_action", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_redo, "gtk_source_undo_manager_redo", libs);
  gidLink(cast(void**)&gtk_source_undo_manager_undo, "gtk_source_undo_manager_undo", libs);

  // View
  gidLink(cast(void**)&gtk_source_view_get_type, "gtk_source_view_get_type", libs);
  gidLink(cast(void**)&gtk_source_view_new, "gtk_source_view_new", libs);
  gidLink(cast(void**)&gtk_source_view_new_with_buffer, "gtk_source_view_new_with_buffer", libs);
  gidLink(cast(void**)&gtk_source_view_get_auto_indent, "gtk_source_view_get_auto_indent", libs);
  gidLink(cast(void**)&gtk_source_view_get_background_pattern, "gtk_source_view_get_background_pattern", libs);
  gidLink(cast(void**)&gtk_source_view_get_completion, "gtk_source_view_get_completion", libs);
  gidLink(cast(void**)&gtk_source_view_get_gutter, "gtk_source_view_get_gutter", libs);
  gidLink(cast(void**)&gtk_source_view_get_highlight_current_line, "gtk_source_view_get_highlight_current_line", libs);
  gidLink(cast(void**)&gtk_source_view_get_indent_on_tab, "gtk_source_view_get_indent_on_tab", libs);
  gidLink(cast(void**)&gtk_source_view_get_indent_width, "gtk_source_view_get_indent_width", libs);
  gidLink(cast(void**)&gtk_source_view_get_insert_spaces_instead_of_tabs, "gtk_source_view_get_insert_spaces_instead_of_tabs", libs);
  gidLink(cast(void**)&gtk_source_view_get_mark_attributes, "gtk_source_view_get_mark_attributes", libs);
  gidLink(cast(void**)&gtk_source_view_get_right_margin_position, "gtk_source_view_get_right_margin_position", libs);
  gidLink(cast(void**)&gtk_source_view_get_show_line_marks, "gtk_source_view_get_show_line_marks", libs);
  gidLink(cast(void**)&gtk_source_view_get_show_line_numbers, "gtk_source_view_get_show_line_numbers", libs);
  gidLink(cast(void**)&gtk_source_view_get_show_right_margin, "gtk_source_view_get_show_right_margin", libs);
  gidLink(cast(void**)&gtk_source_view_get_smart_backspace, "gtk_source_view_get_smart_backspace", libs);
  gidLink(cast(void**)&gtk_source_view_get_smart_home_end, "gtk_source_view_get_smart_home_end", libs);
  gidLink(cast(void**)&gtk_source_view_get_space_drawer, "gtk_source_view_get_space_drawer", libs);
  gidLink(cast(void**)&gtk_source_view_get_tab_width, "gtk_source_view_get_tab_width", libs);
  gidLink(cast(void**)&gtk_source_view_get_visual_column, "gtk_source_view_get_visual_column", libs);
  gidLink(cast(void**)&gtk_source_view_indent_lines, "gtk_source_view_indent_lines", libs);
  gidLink(cast(void**)&gtk_source_view_set_auto_indent, "gtk_source_view_set_auto_indent", libs);
  gidLink(cast(void**)&gtk_source_view_set_background_pattern, "gtk_source_view_set_background_pattern", libs);
  gidLink(cast(void**)&gtk_source_view_set_highlight_current_line, "gtk_source_view_set_highlight_current_line", libs);
  gidLink(cast(void**)&gtk_source_view_set_indent_on_tab, "gtk_source_view_set_indent_on_tab", libs);
  gidLink(cast(void**)&gtk_source_view_set_indent_width, "gtk_source_view_set_indent_width", libs);
  gidLink(cast(void**)&gtk_source_view_set_insert_spaces_instead_of_tabs, "gtk_source_view_set_insert_spaces_instead_of_tabs", libs);
  gidLink(cast(void**)&gtk_source_view_set_mark_attributes, "gtk_source_view_set_mark_attributes", libs);
  gidLink(cast(void**)&gtk_source_view_set_right_margin_position, "gtk_source_view_set_right_margin_position", libs);
  gidLink(cast(void**)&gtk_source_view_set_show_line_marks, "gtk_source_view_set_show_line_marks", libs);
  gidLink(cast(void**)&gtk_source_view_set_show_line_numbers, "gtk_source_view_set_show_line_numbers", libs);
  gidLink(cast(void**)&gtk_source_view_set_show_right_margin, "gtk_source_view_set_show_right_margin", libs);
  gidLink(cast(void**)&gtk_source_view_set_smart_backspace, "gtk_source_view_set_smart_backspace", libs);
  gidLink(cast(void**)&gtk_source_view_set_smart_home_end, "gtk_source_view_set_smart_home_end", libs);
  gidLink(cast(void**)&gtk_source_view_set_tab_width, "gtk_source_view_set_tab_width", libs);
  gidLink(cast(void**)&gtk_source_view_unindent_lines, "gtk_source_view_unindent_lines", libs);

  // global
  gidLink(cast(void**)&gtk_source_finalize, "gtk_source_finalize", libs);
  gidLink(cast(void**)&gtk_source_init, "gtk_source_init", libs);
  gidLink(cast(void**)&gtk_source_utils_escape_search_text, "gtk_source_utils_escape_search_text", libs);
  gidLink(cast(void**)&gtk_source_utils_unescape_search_text, "gtk_source_utils_unescape_search_text", libs);

  // CompletionError
  gidLink(cast(void**)&gtk_source_completion_error_quark, "gtk_source_completion_error_quark", libs);

  // FileLoaderError
  gidLink(cast(void**)&gtk_source_file_loader_error_quark, "gtk_source_file_loader_error_quark", libs);

  // FileSaverError
  gidLink(cast(void**)&gtk_source_file_saver_error_quark, "gtk_source_file_saver_error_quark", libs);
}
