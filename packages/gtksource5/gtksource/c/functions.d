/// C functions for gtksource5 library
module gtksource.c.functions;

public import gid.basictypes;
import gid.loader;
import gtksource.c.types;
public import gtk.c.types;

version(Windows)
  private immutable LIBS = ["libgtksourceview-5-0.dll;gtksourceview-5-0.dll;gtksourceview-5.dll"];
else version(OSX)
  private immutable LIBS = ["libgtksourceview-5.0.dylib"];
else
  private immutable LIBS = ["libgtksourceview-5.so.0"];

__gshared extern(C)
{
  // Buffer
  GType function() c_gtk_source_buffer_get_type; ///
  GtkSourceBuffer* function(GtkTextTagTable* table) c_gtk_source_buffer_new; ///
  GtkSourceBuffer* function(GtkSourceLanguage* language) c_gtk_source_buffer_new_with_language; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) c_gtk_source_buffer_backward_iter_to_source_mark; ///
  void function(GtkSourceBuffer* buffer, GtkSourceChangeCaseType caseType, GtkTextIter* start, GtkTextIter* end) c_gtk_source_buffer_change_case; ///
  GtkSourceMark* function(GtkSourceBuffer* buffer, const(char)* name, const(char)* category, const(GtkTextIter)* where) c_gtk_source_buffer_create_source_mark; ///
  GtkTextTag* function(GtkSourceBuffer* buffer, const(char)* tagName, const(char)* firstPropertyName,  ...) c_gtk_source_buffer_create_source_tag; ///
  void function(GtkSourceBuffer* buffer, const(GtkTextIter)* start, const(GtkTextIter)* end) c_gtk_source_buffer_ensure_highlight; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) c_gtk_source_buffer_forward_iter_to_source_mark; ///
  char** function(GtkSourceBuffer* buffer, const(GtkTextIter)* iter) c_gtk_source_buffer_get_context_classes_at_iter; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_highlight_matching_brackets; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_highlight_syntax; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_implicit_trailing_newline; ///
  GtkSourceLanguage* function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_language; ///
  gboolean function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_loading; ///
  GSList* function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) c_gtk_source_buffer_get_source_marks_at_iter; ///
  GSList* function(GtkSourceBuffer* buffer, int line, const(char)* category) c_gtk_source_buffer_get_source_marks_at_line; ///
  GtkSourceStyleScheme* function(GtkSourceBuffer* buffer) c_gtk_source_buffer_get_style_scheme; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* contextClass) c_gtk_source_buffer_iter_backward_to_context_class_toggle; ///
  gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* contextClass) c_gtk_source_buffer_iter_forward_to_context_class_toggle; ///
  gboolean function(GtkSourceBuffer* buffer, const(GtkTextIter)* iter, const(char)* contextClass) c_gtk_source_buffer_iter_has_context_class; ///
  void function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end) c_gtk_source_buffer_join_lines; ///
  void function(GtkSourceBuffer* buffer, const(GtkTextIter)* start, const(GtkTextIter)* end, const(char)* category) c_gtk_source_buffer_remove_source_marks; ///
  void function(GtkSourceBuffer* buffer, gboolean highlight) c_gtk_source_buffer_set_highlight_matching_brackets; ///
  void function(GtkSourceBuffer* buffer, gboolean highlight) c_gtk_source_buffer_set_highlight_syntax; ///
  void function(GtkSourceBuffer* buffer, gboolean implicitTrailingNewline) c_gtk_source_buffer_set_implicit_trailing_newline; ///
  void function(GtkSourceBuffer* buffer, GtkSourceLanguage* language) c_gtk_source_buffer_set_language; ///
  void function(GtkSourceBuffer* buffer, GtkSourceStyleScheme* scheme) c_gtk_source_buffer_set_style_scheme; ///
  void function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end, GtkSourceSortFlags flags, int column) c_gtk_source_buffer_sort_lines; ///

  // Completion
  GType function() c_gtk_source_completion_get_type; ///
  PangoAttrList* function(const(char)* haystack, const(char)* casefoldQuery) c_gtk_source_completion_fuzzy_highlight; ///
  gboolean function(const(char)* haystack, const(char)* casefoldNeedle, uint* priority) c_gtk_source_completion_fuzzy_match; ///
  void function(GtkSourceCompletion* self, GtkSourceCompletionProvider* provider) c_gtk_source_completion_add_provider; ///
  void function(GtkSourceCompletion* self) c_gtk_source_completion_block_interactive; ///
  GtkSourceBuffer* function(GtkSourceCompletion* self) c_gtk_source_completion_get_buffer; ///
  uint function(GtkSourceCompletion* self) c_gtk_source_completion_get_page_size; ///
  GtkSourceView* function(GtkSourceCompletion* self) c_gtk_source_completion_get_view; ///
  void function(GtkSourceCompletion* self) c_gtk_source_completion_hide; ///
  void function(GtkSourceCompletion* self, GtkSourceCompletionProvider* provider) c_gtk_source_completion_remove_provider; ///
  void function(GtkSourceCompletion* self, uint pageSize) c_gtk_source_completion_set_page_size; ///
  void function(GtkSourceCompletion* self) c_gtk_source_completion_show; ///
  void function(GtkSourceCompletion* self) c_gtk_source_completion_unblock_interactive; ///

  // CompletionCell
  GType function() c_gtk_source_completion_cell_get_type; ///
  GtkSourceCompletionColumn function(GtkSourceCompletionCell* self) c_gtk_source_completion_cell_get_column; ///
  GtkWidget* function(GtkSourceCompletionCell* self) c_gtk_source_completion_cell_get_widget; ///
  void function(GtkSourceCompletionCell* self, GIcon* gicon) c_gtk_source_completion_cell_set_gicon; ///
  void function(GtkSourceCompletionCell* self, const(char)* iconName) c_gtk_source_completion_cell_set_icon_name; ///
  void function(GtkSourceCompletionCell* self, const(char)* markup) c_gtk_source_completion_cell_set_markup; ///
  void function(GtkSourceCompletionCell* self, GdkPaintable* paintable) c_gtk_source_completion_cell_set_paintable; ///
  void function(GtkSourceCompletionCell* self, const(char)* text) c_gtk_source_completion_cell_set_text; ///
  void function(GtkSourceCompletionCell* self, const(char)* text, PangoAttrList* attrs) c_gtk_source_completion_cell_set_text_with_attributes; ///
  void function(GtkSourceCompletionCell* self, GtkWidget* child) c_gtk_source_completion_cell_set_widget; ///

  // CompletionContext
  GType function() c_gtk_source_completion_context_get_type; ///
  GtkSourceCompletionActivation function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_activation; ///
  gboolean function(GtkSourceCompletionContext* self, GtkTextIter* begin, GtkTextIter* end) c_gtk_source_completion_context_get_bounds; ///
  GtkSourceBuffer* function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_buffer; ///
  gboolean function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_busy; ///
  GtkSourceCompletion* function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_completion; ///
  gboolean function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_empty; ///
  GtkSourceLanguage* function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_language; ///
  GListModel* function(GtkSourceCompletionContext* self, GtkSourceCompletionProvider* provider) c_gtk_source_completion_context_get_proposals_for_provider; ///
  GtkSourceView* function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_view; ///
  char* function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_get_word; ///
  GListModel* function(GtkSourceCompletionContext* self) c_gtk_source_completion_context_list_providers; ///
  void function(GtkSourceCompletionContext* self, GtkSourceCompletionProvider* provider, GListModel* results) c_gtk_source_completion_context_set_proposals_for_provider; ///

  // CompletionProposal
  GType function() c_gtk_source_completion_proposal_get_type; ///
  char* function(GtkSourceCompletionProposal* proposal) c_gtk_source_completion_proposal_get_typed_text; ///

  // CompletionProvider
  GType function() c_gtk_source_completion_provider_get_type; ///
  void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) c_gtk_source_completion_provider_activate; ///
  void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkSourceCompletionCell* cell) c_gtk_source_completion_provider_display; ///
  int function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context) c_gtk_source_completion_provider_get_priority; ///
  char* function(GtkSourceCompletionProvider* self) c_gtk_source_completion_provider_get_title; ///
  gboolean function(GtkSourceCompletionProvider* self, const(GtkTextIter)* iter, dchar ch) c_gtk_source_completion_provider_is_trigger; ///
  gboolean function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, uint keyval, GdkModifierType state) c_gtk_source_completion_provider_key_activates; ///
  GPtrArray* function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) c_gtk_source_completion_provider_list_alternates; ///
  void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gtk_source_completion_provider_populate_async; ///
  GListModel* function(GtkSourceCompletionProvider* self, GAsyncResult* result, GError** _err) c_gtk_source_completion_provider_populate_finish; ///
  void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GListModel* model) c_gtk_source_completion_provider_refilter; ///

  // CompletionSnippets
  GType function() c_gtk_source_completion_snippets_get_type; ///
  GtkSourceCompletionSnippets* function() c_gtk_source_completion_snippets_new; ///

  // CompletionWords
  GType function() c_gtk_source_completion_words_get_type; ///
  GtkSourceCompletionWords* function(const(char)* title) c_gtk_source_completion_words_new; ///
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
  GtkSourceView* function(GtkSourceGutter* gutter) c_gtk_source_gutter_get_view; ///
  gboolean function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer, int position) c_gtk_source_gutter_insert; ///
  void function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_remove; ///
  void function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer, int position) c_gtk_source_gutter_reorder; ///

  // GutterLines
  GType function() c_gtk_source_gutter_lines_get_type; ///
  void function(GtkSourceGutterLines* lines, uint line, const(char)* name) c_gtk_source_gutter_lines_add_class; ///
  void function(GtkSourceGutterLines* lines, uint line, GQuark qname) c_gtk_source_gutter_lines_add_qclass; ///
  GtkTextBuffer* function(GtkSourceGutterLines* lines) c_gtk_source_gutter_lines_get_buffer; ///
  uint function(GtkSourceGutterLines* lines) c_gtk_source_gutter_lines_get_first; ///
  void function(GtkSourceGutterLines* lines, GtkTextIter* iter, uint line) c_gtk_source_gutter_lines_get_iter_at_line; ///
  uint function(GtkSourceGutterLines* lines) c_gtk_source_gutter_lines_get_last; ///
  void function(GtkSourceGutterLines* lines, uint line, GtkSourceGutterRendererAlignmentMode mode, int* y, int* height) c_gtk_source_gutter_lines_get_line_yrange; ///
  GtkTextView* function(GtkSourceGutterLines* lines) c_gtk_source_gutter_lines_get_view; ///
  gboolean function(GtkSourceGutterLines* lines, uint line) c_gtk_source_gutter_lines_has_any_class; ///
  gboolean function(GtkSourceGutterLines* lines, uint line, const(char)* name) c_gtk_source_gutter_lines_has_class; ///
  gboolean function(GtkSourceGutterLines* lines, uint line, GQuark qname) c_gtk_source_gutter_lines_has_qclass; ///
  gboolean function(GtkSourceGutterLines* lines, uint line) c_gtk_source_gutter_lines_is_cursor; ///
  gboolean function(GtkSourceGutterLines* lines, uint line) c_gtk_source_gutter_lines_is_prelit; ///
  gboolean function(GtkSourceGutterLines* lines, uint line) c_gtk_source_gutter_lines_is_selected; ///
  void function(GtkSourceGutterLines* lines, uint line, const(char)* name) c_gtk_source_gutter_lines_remove_class; ///
  void function(GtkSourceGutterLines* lines, uint line, GQuark qname) c_gtk_source_gutter_lines_remove_qclass; ///

  // GutterRenderer
  GType function() c_gtk_source_gutter_renderer_get_type; ///
  void function(GtkSourceGutterRenderer* renderer, const(GtkTextIter)* iter, const(GdkRectangle)* area, uint button, GdkModifierType state, int nPresses) c_gtk_source_gutter_renderer_activate; ///
  void function(GtkSourceGutterRenderer* renderer, uint line, float width, float height, float* x, float* y) c_gtk_source_gutter_renderer_align_cell; ///
  GtkSourceGutterRendererAlignmentMode function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_alignment_mode; ///
  GtkSourceBuffer* function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_buffer; ///
  GtkSourceView* function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_view; ///
  float function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_xalign; ///
  int function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_xpad; ///
  float function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_yalign; ///
  int function(GtkSourceGutterRenderer* renderer) c_gtk_source_gutter_renderer_get_ypad; ///
  gboolean function(GtkSourceGutterRenderer* renderer, const(GtkTextIter)* iter, const(GdkRectangle)* area) c_gtk_source_gutter_renderer_query_activatable; ///
  void function(GtkSourceGutterRenderer* renderer, GtkSourceGutterRendererAlignmentMode mode) c_gtk_source_gutter_renderer_set_alignment_mode; ///
  void function(GtkSourceGutterRenderer* renderer, float xalign) c_gtk_source_gutter_renderer_set_xalign; ///
  void function(GtkSourceGutterRenderer* renderer, int xpad) c_gtk_source_gutter_renderer_set_xpad; ///
  void function(GtkSourceGutterRenderer* renderer, float yalign) c_gtk_source_gutter_renderer_set_yalign; ///
  void function(GtkSourceGutterRenderer* renderer, int ypad) c_gtk_source_gutter_renderer_set_ypad; ///

  // GutterRendererPixbuf
  GType function() c_gtk_source_gutter_renderer_pixbuf_get_type; ///
  GtkSourceGutterRenderer* function() c_gtk_source_gutter_renderer_pixbuf_new; ///
  GIcon* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_gicon; ///
  const(char)* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_icon_name; ///
  GdkPaintable* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_paintable; ///
  GdkPixbuf* function(GtkSourceGutterRendererPixbuf* renderer) c_gtk_source_gutter_renderer_pixbuf_get_pixbuf; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, GdkPaintable* paintable) c_gtk_source_gutter_renderer_pixbuf_overlay_paintable; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, GIcon* icon) c_gtk_source_gutter_renderer_pixbuf_set_gicon; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, const(char)* iconName) c_gtk_source_gutter_renderer_pixbuf_set_icon_name; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, GdkPaintable* paintable) c_gtk_source_gutter_renderer_pixbuf_set_paintable; ///
  void function(GtkSourceGutterRendererPixbuf* renderer, GdkPixbuf* pixbuf) c_gtk_source_gutter_renderer_pixbuf_set_pixbuf; ///

  // GutterRendererText
  GType function() c_gtk_source_gutter_renderer_text_get_type; ///
  GtkSourceGutterRenderer* function() c_gtk_source_gutter_renderer_text_new; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* text, int* width, int* height) c_gtk_source_gutter_renderer_text_measure; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* markup, int* width, int* height) c_gtk_source_gutter_renderer_text_measure_markup; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* markup, int length) c_gtk_source_gutter_renderer_text_set_markup; ///
  void function(GtkSourceGutterRendererText* renderer, const(char)* text, int length) c_gtk_source_gutter_renderer_text_set_text; ///

  // Hover
  GType function() c_gtk_source_hover_get_type; ///
  void function(GtkSourceHover* self, GtkSourceHoverProvider* provider) c_gtk_source_hover_add_provider; ///
  void function(GtkSourceHover* self, GtkSourceHoverProvider* provider) c_gtk_source_hover_remove_provider; ///

  // HoverContext
  GType function() c_gtk_source_hover_context_get_type; ///
  gboolean function(GtkSourceHoverContext* self, GtkTextIter* begin, GtkTextIter* end) c_gtk_source_hover_context_get_bounds; ///
  GtkSourceBuffer* function(GtkSourceHoverContext* self) c_gtk_source_hover_context_get_buffer; ///
  gboolean function(GtkSourceHoverContext* self, GtkTextIter* iter) c_gtk_source_hover_context_get_iter; ///
  GtkSourceView* function(GtkSourceHoverContext* self) c_gtk_source_hover_context_get_view; ///

  // HoverDisplay
  GType function() c_gtk_source_hover_display_get_type; ///
  void function(GtkSourceHoverDisplay* self, GtkWidget* child) c_gtk_source_hover_display_append; ///
  void function(GtkSourceHoverDisplay* self, GtkWidget* child, GtkWidget* sibling) c_gtk_source_hover_display_insert_after; ///
  void function(GtkSourceHoverDisplay* self, GtkWidget* child) c_gtk_source_hover_display_prepend; ///
  void function(GtkSourceHoverDisplay* self, GtkWidget* child) c_gtk_source_hover_display_remove; ///

  // HoverProvider
  GType function() c_gtk_source_hover_provider_get_type; ///
  void function(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gtk_source_hover_provider_populate_async; ///
  gboolean function(GtkSourceHoverProvider* self, GAsyncResult* result, GError** _err) c_gtk_source_hover_provider_populate_finish; ///

  // Indenter
  GType function() c_gtk_source_indenter_get_type; ///
  void function(GtkSourceIndenter* self, GtkSourceView* view, GtkTextIter* iter) c_gtk_source_indenter_indent; ///
  gboolean function(GtkSourceIndenter* self, GtkSourceView* view, const(GtkTextIter)* location, GdkModifierType state, uint keyval) c_gtk_source_indenter_is_trigger; ///

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
  void function(GtkSourceLanguageManager* lm, const(char)* path) c_gtk_source_language_manager_append_search_path; ///
  GtkSourceLanguage* function(GtkSourceLanguageManager* lm, const(char)* id) c_gtk_source_language_manager_get_language; ///
  const(char*)* function(GtkSourceLanguageManager* lm) c_gtk_source_language_manager_get_language_ids; ///
  const(char*)* function(GtkSourceLanguageManager* lm) c_gtk_source_language_manager_get_search_path; ///
  GtkSourceLanguage* function(GtkSourceLanguageManager* lm, const(char)* filename, const(char)* contentType) c_gtk_source_language_manager_guess_language; ///
  void function(GtkSourceLanguageManager* lm, const(char)* path) c_gtk_source_language_manager_prepend_search_path; ///
  void function(GtkSourceLanguageManager* lm, const(char*)* dirs) c_gtk_source_language_manager_set_search_path; ///

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
  GdkPaintable* function(GtkSourceMarkAttributes* attributes, GtkWidget* widget, int size) c_gtk_source_mark_attributes_render_icon; ///
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
  void function(GtkSourcePrintCompositor* compositor, GtkTextTag* tag) c_gtk_source_print_compositor_ignore_tag; ///
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
  gboolean function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_visible_only; ///
  gboolean function(GtkSourceSearchSettings* settings) c_gtk_source_search_settings_get_wrap_around; ///
  void function(GtkSourceSearchSettings* settings, gboolean atWordBoundaries) c_gtk_source_search_settings_set_at_word_boundaries; ///
  void function(GtkSourceSearchSettings* settings, gboolean caseSensitive) c_gtk_source_search_settings_set_case_sensitive; ///
  void function(GtkSourceSearchSettings* settings, gboolean regexEnabled) c_gtk_source_search_settings_set_regex_enabled; ///
  void function(GtkSourceSearchSettings* settings, const(char)* searchText) c_gtk_source_search_settings_set_search_text; ///
  void function(GtkSourceSearchSettings* settings, gboolean visibleOnly) c_gtk_source_search_settings_set_visible_only; ///
  void function(GtkSourceSearchSettings* settings, gboolean wrapAround) c_gtk_source_search_settings_set_wrap_around; ///

  // Snippet
  GType function() c_gtk_source_snippet_get_type; ///
  GtkSourceSnippet* function(const(char)* trigger, const(char)* languageId) c_gtk_source_snippet_new; ///
  GtkSourceSnippet* function(const(char)* text, GError** _err) c_gtk_source_snippet_new_parsed; ///
  void function(GtkSourceSnippet* snippet, GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_add_chunk; ///
  GtkSourceSnippet* function(GtkSourceSnippet* snippet) c_gtk_source_snippet_copy; ///
  GtkSourceSnippetContext* function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_context; ///
  const(char)* function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_description; ///
  int function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_focus_position; ///
  const(char)* function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_language_id; ///
  uint function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_n_chunks; ///
  const(char)* function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_name; ///
  GtkSourceSnippetChunk* function(GtkSourceSnippet* snippet, uint nth) c_gtk_source_snippet_get_nth_chunk; ///
  const(char)* function(GtkSourceSnippet* snippet) c_gtk_source_snippet_get_trigger; ///
  void function(GtkSourceSnippet* snippet, const(char)* description) c_gtk_source_snippet_set_description; ///
  void function(GtkSourceSnippet* snippet, const(char)* languageId) c_gtk_source_snippet_set_language_id; ///
  void function(GtkSourceSnippet* snippet, const(char)* name) c_gtk_source_snippet_set_name; ///
  void function(GtkSourceSnippet* snippet, const(char)* trigger) c_gtk_source_snippet_set_trigger; ///

  // SnippetChunk
  GType function() c_gtk_source_snippet_chunk_get_type; ///
  GtkSourceSnippetChunk* function() c_gtk_source_snippet_chunk_new; ///
  GtkSourceSnippetChunk* function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_copy; ///
  GtkSourceSnippetContext* function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_get_context; ///
  int function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_get_focus_position; ///
  const(char)* function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_get_spec; ///
  const(char)* function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_get_text; ///
  gboolean function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_get_text_set; ///
  const(char)* function(GtkSourceSnippetChunk* chunk) c_gtk_source_snippet_chunk_get_tooltip_text; ///
  void function(GtkSourceSnippetChunk* chunk, GtkSourceSnippetContext* context) c_gtk_source_snippet_chunk_set_context; ///
  void function(GtkSourceSnippetChunk* chunk, int focusPosition) c_gtk_source_snippet_chunk_set_focus_position; ///
  void function(GtkSourceSnippetChunk* chunk, const(char)* spec) c_gtk_source_snippet_chunk_set_spec; ///
  void function(GtkSourceSnippetChunk* chunk, const(char)* text) c_gtk_source_snippet_chunk_set_text; ///
  void function(GtkSourceSnippetChunk* chunk, gboolean textSet) c_gtk_source_snippet_chunk_set_text_set; ///
  void function(GtkSourceSnippetChunk* chunk, const(char)* tooltipText) c_gtk_source_snippet_chunk_set_tooltip_text; ///

  // SnippetContext
  GType function() c_gtk_source_snippet_context_get_type; ///
  GtkSourceSnippetContext* function() c_gtk_source_snippet_context_new; ///
  void function(GtkSourceSnippetContext* self) c_gtk_source_snippet_context_clear_variables; ///
  char* function(GtkSourceSnippetContext* self, const(char)* input) c_gtk_source_snippet_context_expand; ///
  const(char)* function(GtkSourceSnippetContext* self, const(char)* key) c_gtk_source_snippet_context_get_variable; ///
  void function(GtkSourceSnippetContext* self, const(char)* key, const(char)* value) c_gtk_source_snippet_context_set_constant; ///
  void function(GtkSourceSnippetContext* self, const(char)* linePrefix) c_gtk_source_snippet_context_set_line_prefix; ///
  void function(GtkSourceSnippetContext* self, int tabWidth) c_gtk_source_snippet_context_set_tab_width; ///
  void function(GtkSourceSnippetContext* self, gboolean useSpaces) c_gtk_source_snippet_context_set_use_spaces; ///
  void function(GtkSourceSnippetContext* self, const(char)* key, const(char)* value) c_gtk_source_snippet_context_set_variable; ///

  // SnippetManager
  GType function() c_gtk_source_snippet_manager_get_type; ///
  GtkSourceSnippetManager* function() c_gtk_source_snippet_manager_get_default; ///
  const(char*)* function(GtkSourceSnippetManager* self) c_gtk_source_snippet_manager_get_search_path; ///
  GtkSourceSnippet* function(GtkSourceSnippetManager* self, const(char)* group, const(char)* languageId, const(char)* trigger) c_gtk_source_snippet_manager_get_snippet; ///
  GListModel* function(GtkSourceSnippetManager* self) c_gtk_source_snippet_manager_list_all; ///
  const(char*)* function(GtkSourceSnippetManager* self) c_gtk_source_snippet_manager_list_groups; ///
  GListModel* function(GtkSourceSnippetManager* self, const(char)* group, const(char)* languageId, const(char)* triggerPrefix) c_gtk_source_snippet_manager_list_matching; ///
  void function(GtkSourceSnippetManager* self, const(char*)* dirs) c_gtk_source_snippet_manager_set_search_path; ///

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
  const(char)* function(GtkSourceStyleScheme* scheme, const(char)* name) c_gtk_source_style_scheme_get_metadata; ///
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
  void function(GtkSourceStyleSchemeManager* manager, const(char*)* path) c_gtk_source_style_scheme_manager_set_search_path; ///

  // StyleSchemePreview
  GType function() c_gtk_source_style_scheme_preview_get_type; ///
  GtkWidget* function(GtkSourceStyleScheme* scheme) c_gtk_source_style_scheme_preview_new; ///
  GtkSourceStyleScheme* function(GtkSourceStyleSchemePreview* self) c_gtk_source_style_scheme_preview_get_scheme; ///
  gboolean function(GtkSourceStyleSchemePreview* self) c_gtk_source_style_scheme_preview_get_selected; ///
  void function(GtkSourceStyleSchemePreview* self, gboolean selected) c_gtk_source_style_scheme_preview_set_selected; ///

  // Tag
  GType function() c_gtk_source_tag_get_type; ///
  GtkTextTag* function(const(char)* name) c_gtk_source_tag_new; ///

  // View
  GType function() c_gtk_source_view_get_type; ///
  GtkWidget* function() c_gtk_source_view_new; ///
  GtkWidget* function(GtkSourceBuffer* buffer) c_gtk_source_view_new_with_buffer; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_auto_indent; ///
  GtkSourceBackgroundPatternType function(GtkSourceView* view) c_gtk_source_view_get_background_pattern; ///
  GtkSourceCompletion* function(GtkSourceView* view) c_gtk_source_view_get_completion; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_enable_snippets; ///
  GtkSourceGutter* function(GtkSourceView* view, GtkTextWindowType windowType) c_gtk_source_view_get_gutter; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_highlight_current_line; ///
  GtkSourceHover* function(GtkSourceView* view) c_gtk_source_view_get_hover; ///
  gboolean function(GtkSourceView* view) c_gtk_source_view_get_indent_on_tab; ///
  int function(GtkSourceView* view) c_gtk_source_view_get_indent_width; ///
  GtkSourceIndenter* function(GtkSourceView* view) c_gtk_source_view_get_indenter; ///
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
  void function(GtkSourceView* view, GtkSourceSnippet* snippet, GtkTextIter* location) c_gtk_source_view_push_snippet; ///
  void function(GtkSourceView* view, gboolean enable) c_gtk_source_view_set_auto_indent; ///
  void function(GtkSourceView* view, GtkSourceBackgroundPatternType backgroundPattern) c_gtk_source_view_set_background_pattern; ///
  void function(GtkSourceView* view, gboolean enableSnippets) c_gtk_source_view_set_enable_snippets; ///
  void function(GtkSourceView* view, gboolean highlight) c_gtk_source_view_set_highlight_current_line; ///
  void function(GtkSourceView* view, gboolean enable) c_gtk_source_view_set_indent_on_tab; ///
  void function(GtkSourceView* view, int width) c_gtk_source_view_set_indent_width; ///
  void function(GtkSourceView* view, GtkSourceIndenter* indenter) c_gtk_source_view_set_indenter; ///
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

  // VimIMContext
  GType function() c_gtk_source_vim_im_context_get_type; ///
  GtkIMContext* function() c_gtk_source_vim_im_context_new; ///
  void function(GtkSourceVimIMContext* self, const(char)* command) c_gtk_source_vim_im_context_execute_command; ///
  const(char)* function(GtkSourceVimIMContext* self) c_gtk_source_vim_im_context_get_command_bar_text; ///
  const(char)* function(GtkSourceVimIMContext* self) c_gtk_source_vim_im_context_get_command_text; ///

  // global
  gboolean function(uint major, uint minor, uint micro) c_gtk_source_check_version; ///
  void function() c_gtk_source_finalize; ///
  uint function() c_gtk_source_get_major_version; ///
  uint function() c_gtk_source_get_micro_version; ///
  uint function() c_gtk_source_get_minor_version; ///
  void function() c_gtk_source_init; ///
  size_t function(GtkSourceSchedulerCallback callback, void* userData) c_gtk_source_scheduler_add; ///
  size_t function(GtkSourceSchedulerCallback callback, void* userData, GDestroyNotify notify) c_gtk_source_scheduler_add_full; ///
  void function(size_t handlerId) c_gtk_source_scheduler_remove; ///
  char* function(const(char)* text) c_gtk_source_utils_escape_search_text; ///
  char* function(const(char)* text) c_gtk_source_utils_unescape_search_text; ///

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
alias gtk_source_buffer_change_case = c_gtk_source_buffer_change_case;

/** */
alias gtk_source_buffer_create_source_mark = c_gtk_source_buffer_create_source_mark;

/** */
alias gtk_source_buffer_create_source_tag = c_gtk_source_buffer_create_source_tag;

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
alias gtk_source_buffer_get_loading = c_gtk_source_buffer_get_loading;

/** */
alias gtk_source_buffer_get_source_marks_at_iter = c_gtk_source_buffer_get_source_marks_at_iter;

/** */
alias gtk_source_buffer_get_source_marks_at_line = c_gtk_source_buffer_get_source_marks_at_line;

/** */
alias gtk_source_buffer_get_style_scheme = c_gtk_source_buffer_get_style_scheme;

/** */
alias gtk_source_buffer_iter_backward_to_context_class_toggle = c_gtk_source_buffer_iter_backward_to_context_class_toggle;

/** */
alias gtk_source_buffer_iter_forward_to_context_class_toggle = c_gtk_source_buffer_iter_forward_to_context_class_toggle;

/** */
alias gtk_source_buffer_iter_has_context_class = c_gtk_source_buffer_iter_has_context_class;

/** */
alias gtk_source_buffer_join_lines = c_gtk_source_buffer_join_lines;

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
alias gtk_source_buffer_set_style_scheme = c_gtk_source_buffer_set_style_scheme;

/** */
alias gtk_source_buffer_sort_lines = c_gtk_source_buffer_sort_lines;

// Completion

/** */
alias gtk_source_completion_get_type = c_gtk_source_completion_get_type;

/** */
alias gtk_source_completion_fuzzy_highlight = c_gtk_source_completion_fuzzy_highlight;

/** */
alias gtk_source_completion_fuzzy_match = c_gtk_source_completion_fuzzy_match;

/** */
alias gtk_source_completion_add_provider = c_gtk_source_completion_add_provider;

/** */
alias gtk_source_completion_block_interactive = c_gtk_source_completion_block_interactive;

/** */
alias gtk_source_completion_get_buffer = c_gtk_source_completion_get_buffer;

/** */
alias gtk_source_completion_get_page_size = c_gtk_source_completion_get_page_size;

/** */
alias gtk_source_completion_get_view = c_gtk_source_completion_get_view;

/** */
alias gtk_source_completion_hide = c_gtk_source_completion_hide;

/** */
alias gtk_source_completion_remove_provider = c_gtk_source_completion_remove_provider;

/** */
alias gtk_source_completion_set_page_size = c_gtk_source_completion_set_page_size;

/** */
alias gtk_source_completion_show = c_gtk_source_completion_show;

/** */
alias gtk_source_completion_unblock_interactive = c_gtk_source_completion_unblock_interactive;

// CompletionCell

/** */
alias gtk_source_completion_cell_get_type = c_gtk_source_completion_cell_get_type;

/** */
alias gtk_source_completion_cell_get_column = c_gtk_source_completion_cell_get_column;

/** */
alias gtk_source_completion_cell_get_widget = c_gtk_source_completion_cell_get_widget;

/** */
alias gtk_source_completion_cell_set_gicon = c_gtk_source_completion_cell_set_gicon;

/** */
alias gtk_source_completion_cell_set_icon_name = c_gtk_source_completion_cell_set_icon_name;

/** */
alias gtk_source_completion_cell_set_markup = c_gtk_source_completion_cell_set_markup;

/** */
alias gtk_source_completion_cell_set_paintable = c_gtk_source_completion_cell_set_paintable;

/** */
alias gtk_source_completion_cell_set_text = c_gtk_source_completion_cell_set_text;

/** */
alias gtk_source_completion_cell_set_text_with_attributes = c_gtk_source_completion_cell_set_text_with_attributes;

/** */
alias gtk_source_completion_cell_set_widget = c_gtk_source_completion_cell_set_widget;

// CompletionContext

/** */
alias gtk_source_completion_context_get_type = c_gtk_source_completion_context_get_type;

/** */
alias gtk_source_completion_context_get_activation = c_gtk_source_completion_context_get_activation;

/** */
alias gtk_source_completion_context_get_bounds = c_gtk_source_completion_context_get_bounds;

/** */
alias gtk_source_completion_context_get_buffer = c_gtk_source_completion_context_get_buffer;

/** */
alias gtk_source_completion_context_get_busy = c_gtk_source_completion_context_get_busy;

/** */
alias gtk_source_completion_context_get_completion = c_gtk_source_completion_context_get_completion;

/** */
alias gtk_source_completion_context_get_empty = c_gtk_source_completion_context_get_empty;

/** */
alias gtk_source_completion_context_get_language = c_gtk_source_completion_context_get_language;

/** */
alias gtk_source_completion_context_get_proposals_for_provider = c_gtk_source_completion_context_get_proposals_for_provider;

/** */
alias gtk_source_completion_context_get_view = c_gtk_source_completion_context_get_view;

/** */
alias gtk_source_completion_context_get_word = c_gtk_source_completion_context_get_word;

/** */
alias gtk_source_completion_context_list_providers = c_gtk_source_completion_context_list_providers;

/** */
alias gtk_source_completion_context_set_proposals_for_provider = c_gtk_source_completion_context_set_proposals_for_provider;

// CompletionProposal

/** */
alias gtk_source_completion_proposal_get_type = c_gtk_source_completion_proposal_get_type;

/** */
alias gtk_source_completion_proposal_get_typed_text = c_gtk_source_completion_proposal_get_typed_text;

// CompletionProvider

/** */
alias gtk_source_completion_provider_get_type = c_gtk_source_completion_provider_get_type;

/** */
alias gtk_source_completion_provider_activate = c_gtk_source_completion_provider_activate;

/** */
alias gtk_source_completion_provider_display = c_gtk_source_completion_provider_display;

/** */
alias gtk_source_completion_provider_get_priority = c_gtk_source_completion_provider_get_priority;

/** */
alias gtk_source_completion_provider_get_title = c_gtk_source_completion_provider_get_title;

/** */
alias gtk_source_completion_provider_is_trigger = c_gtk_source_completion_provider_is_trigger;

/** */
alias gtk_source_completion_provider_key_activates = c_gtk_source_completion_provider_key_activates;

/** */
alias gtk_source_completion_provider_list_alternates = c_gtk_source_completion_provider_list_alternates;

/** */
alias gtk_source_completion_provider_populate_async = c_gtk_source_completion_provider_populate_async;

/** */
alias gtk_source_completion_provider_populate_finish = c_gtk_source_completion_provider_populate_finish;

/** */
alias gtk_source_completion_provider_refilter = c_gtk_source_completion_provider_refilter;

// CompletionSnippets

/** */
alias gtk_source_completion_snippets_get_type = c_gtk_source_completion_snippets_get_type;

/** */
alias gtk_source_completion_snippets_new = c_gtk_source_completion_snippets_new;

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
alias gtk_source_gutter_get_view = c_gtk_source_gutter_get_view;

/** */
alias gtk_source_gutter_insert = c_gtk_source_gutter_insert;

/** */
alias gtk_source_gutter_remove = c_gtk_source_gutter_remove;

/** */
alias gtk_source_gutter_reorder = c_gtk_source_gutter_reorder;

// GutterLines

/** */
alias gtk_source_gutter_lines_get_type = c_gtk_source_gutter_lines_get_type;

/** */
alias gtk_source_gutter_lines_add_class = c_gtk_source_gutter_lines_add_class;

/** */
alias gtk_source_gutter_lines_add_qclass = c_gtk_source_gutter_lines_add_qclass;

/** */
alias gtk_source_gutter_lines_get_buffer = c_gtk_source_gutter_lines_get_buffer;

/** */
alias gtk_source_gutter_lines_get_first = c_gtk_source_gutter_lines_get_first;

/** */
alias gtk_source_gutter_lines_get_iter_at_line = c_gtk_source_gutter_lines_get_iter_at_line;

/** */
alias gtk_source_gutter_lines_get_last = c_gtk_source_gutter_lines_get_last;

/** */
alias gtk_source_gutter_lines_get_line_yrange = c_gtk_source_gutter_lines_get_line_yrange;

/** */
alias gtk_source_gutter_lines_get_view = c_gtk_source_gutter_lines_get_view;

/** */
alias gtk_source_gutter_lines_has_any_class = c_gtk_source_gutter_lines_has_any_class;

/** */
alias gtk_source_gutter_lines_has_class = c_gtk_source_gutter_lines_has_class;

/** */
alias gtk_source_gutter_lines_has_qclass = c_gtk_source_gutter_lines_has_qclass;

/** */
alias gtk_source_gutter_lines_is_cursor = c_gtk_source_gutter_lines_is_cursor;

/** */
alias gtk_source_gutter_lines_is_prelit = c_gtk_source_gutter_lines_is_prelit;

/** */
alias gtk_source_gutter_lines_is_selected = c_gtk_source_gutter_lines_is_selected;

/** */
alias gtk_source_gutter_lines_remove_class = c_gtk_source_gutter_lines_remove_class;

/** */
alias gtk_source_gutter_lines_remove_qclass = c_gtk_source_gutter_lines_remove_qclass;

// GutterRenderer

/** */
alias gtk_source_gutter_renderer_get_type = c_gtk_source_gutter_renderer_get_type;

/** */
alias gtk_source_gutter_renderer_activate = c_gtk_source_gutter_renderer_activate;

/** */
alias gtk_source_gutter_renderer_align_cell = c_gtk_source_gutter_renderer_align_cell;

/** */
alias gtk_source_gutter_renderer_get_alignment_mode = c_gtk_source_gutter_renderer_get_alignment_mode;

/** */
alias gtk_source_gutter_renderer_get_buffer = c_gtk_source_gutter_renderer_get_buffer;

/** */
alias gtk_source_gutter_renderer_get_view = c_gtk_source_gutter_renderer_get_view;

/** */
alias gtk_source_gutter_renderer_get_xalign = c_gtk_source_gutter_renderer_get_xalign;

/** */
alias gtk_source_gutter_renderer_get_xpad = c_gtk_source_gutter_renderer_get_xpad;

/** */
alias gtk_source_gutter_renderer_get_yalign = c_gtk_source_gutter_renderer_get_yalign;

/** */
alias gtk_source_gutter_renderer_get_ypad = c_gtk_source_gutter_renderer_get_ypad;

/** */
alias gtk_source_gutter_renderer_query_activatable = c_gtk_source_gutter_renderer_query_activatable;

/** */
alias gtk_source_gutter_renderer_set_alignment_mode = c_gtk_source_gutter_renderer_set_alignment_mode;

/** */
alias gtk_source_gutter_renderer_set_xalign = c_gtk_source_gutter_renderer_set_xalign;

/** */
alias gtk_source_gutter_renderer_set_xpad = c_gtk_source_gutter_renderer_set_xpad;

/** */
alias gtk_source_gutter_renderer_set_yalign = c_gtk_source_gutter_renderer_set_yalign;

/** */
alias gtk_source_gutter_renderer_set_ypad = c_gtk_source_gutter_renderer_set_ypad;

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
alias gtk_source_gutter_renderer_pixbuf_get_paintable = c_gtk_source_gutter_renderer_pixbuf_get_paintable;

/** */
alias gtk_source_gutter_renderer_pixbuf_get_pixbuf = c_gtk_source_gutter_renderer_pixbuf_get_pixbuf;

/** */
alias gtk_source_gutter_renderer_pixbuf_overlay_paintable = c_gtk_source_gutter_renderer_pixbuf_overlay_paintable;

/** */
alias gtk_source_gutter_renderer_pixbuf_set_gicon = c_gtk_source_gutter_renderer_pixbuf_set_gicon;

/** */
alias gtk_source_gutter_renderer_pixbuf_set_icon_name = c_gtk_source_gutter_renderer_pixbuf_set_icon_name;

/** */
alias gtk_source_gutter_renderer_pixbuf_set_paintable = c_gtk_source_gutter_renderer_pixbuf_set_paintable;

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

// Hover

/** */
alias gtk_source_hover_get_type = c_gtk_source_hover_get_type;

/** */
alias gtk_source_hover_add_provider = c_gtk_source_hover_add_provider;

/** */
alias gtk_source_hover_remove_provider = c_gtk_source_hover_remove_provider;

// HoverContext

/** */
alias gtk_source_hover_context_get_type = c_gtk_source_hover_context_get_type;

/** */
alias gtk_source_hover_context_get_bounds = c_gtk_source_hover_context_get_bounds;

/** */
alias gtk_source_hover_context_get_buffer = c_gtk_source_hover_context_get_buffer;

/** */
alias gtk_source_hover_context_get_iter = c_gtk_source_hover_context_get_iter;

/** */
alias gtk_source_hover_context_get_view = c_gtk_source_hover_context_get_view;

// HoverDisplay

/** */
alias gtk_source_hover_display_get_type = c_gtk_source_hover_display_get_type;

/** */
alias gtk_source_hover_display_append = c_gtk_source_hover_display_append;

/** */
alias gtk_source_hover_display_insert_after = c_gtk_source_hover_display_insert_after;

/** */
alias gtk_source_hover_display_prepend = c_gtk_source_hover_display_prepend;

/** */
alias gtk_source_hover_display_remove = c_gtk_source_hover_display_remove;

// HoverProvider

/** */
alias gtk_source_hover_provider_get_type = c_gtk_source_hover_provider_get_type;

/** */
alias gtk_source_hover_provider_populate_async = c_gtk_source_hover_provider_populate_async;

/** */
alias gtk_source_hover_provider_populate_finish = c_gtk_source_hover_provider_populate_finish;

// Indenter

/** */
alias gtk_source_indenter_get_type = c_gtk_source_indenter_get_type;

/** */
alias gtk_source_indenter_indent = c_gtk_source_indenter_indent;

/** */
alias gtk_source_indenter_is_trigger = c_gtk_source_indenter_is_trigger;

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
alias gtk_source_language_manager_append_search_path = c_gtk_source_language_manager_append_search_path;

/** */
alias gtk_source_language_manager_get_language = c_gtk_source_language_manager_get_language;

/** */
alias gtk_source_language_manager_get_language_ids = c_gtk_source_language_manager_get_language_ids;

/** */
alias gtk_source_language_manager_get_search_path = c_gtk_source_language_manager_get_search_path;

/** */
alias gtk_source_language_manager_guess_language = c_gtk_source_language_manager_guess_language;

/** */
alias gtk_source_language_manager_prepend_search_path = c_gtk_source_language_manager_prepend_search_path;

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
alias gtk_source_print_compositor_ignore_tag = c_gtk_source_print_compositor_ignore_tag;

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
alias gtk_source_search_settings_get_visible_only = c_gtk_source_search_settings_get_visible_only;

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
alias gtk_source_search_settings_set_visible_only = c_gtk_source_search_settings_set_visible_only;

/** */
alias gtk_source_search_settings_set_wrap_around = c_gtk_source_search_settings_set_wrap_around;

// Snippet

/** */
alias gtk_source_snippet_get_type = c_gtk_source_snippet_get_type;

/** */
alias gtk_source_snippet_new = c_gtk_source_snippet_new;

/** */
alias gtk_source_snippet_new_parsed = c_gtk_source_snippet_new_parsed;

/** */
alias gtk_source_snippet_add_chunk = c_gtk_source_snippet_add_chunk;

/** */
alias gtk_source_snippet_copy = c_gtk_source_snippet_copy;

/** */
alias gtk_source_snippet_get_context = c_gtk_source_snippet_get_context;

/** */
alias gtk_source_snippet_get_description = c_gtk_source_snippet_get_description;

/** */
alias gtk_source_snippet_get_focus_position = c_gtk_source_snippet_get_focus_position;

/** */
alias gtk_source_snippet_get_language_id = c_gtk_source_snippet_get_language_id;

/** */
alias gtk_source_snippet_get_n_chunks = c_gtk_source_snippet_get_n_chunks;

/** */
alias gtk_source_snippet_get_name = c_gtk_source_snippet_get_name;

/** */
alias gtk_source_snippet_get_nth_chunk = c_gtk_source_snippet_get_nth_chunk;

/** */
alias gtk_source_snippet_get_trigger = c_gtk_source_snippet_get_trigger;

/** */
alias gtk_source_snippet_set_description = c_gtk_source_snippet_set_description;

/** */
alias gtk_source_snippet_set_language_id = c_gtk_source_snippet_set_language_id;

/** */
alias gtk_source_snippet_set_name = c_gtk_source_snippet_set_name;

/** */
alias gtk_source_snippet_set_trigger = c_gtk_source_snippet_set_trigger;

// SnippetChunk

/** */
alias gtk_source_snippet_chunk_get_type = c_gtk_source_snippet_chunk_get_type;

/** */
alias gtk_source_snippet_chunk_new = c_gtk_source_snippet_chunk_new;

/** */
alias gtk_source_snippet_chunk_copy = c_gtk_source_snippet_chunk_copy;

/** */
alias gtk_source_snippet_chunk_get_context = c_gtk_source_snippet_chunk_get_context;

/** */
alias gtk_source_snippet_chunk_get_focus_position = c_gtk_source_snippet_chunk_get_focus_position;

/** */
alias gtk_source_snippet_chunk_get_spec = c_gtk_source_snippet_chunk_get_spec;

/** */
alias gtk_source_snippet_chunk_get_text = c_gtk_source_snippet_chunk_get_text;

/** */
alias gtk_source_snippet_chunk_get_text_set = c_gtk_source_snippet_chunk_get_text_set;

/** */
alias gtk_source_snippet_chunk_get_tooltip_text = c_gtk_source_snippet_chunk_get_tooltip_text;

/** */
alias gtk_source_snippet_chunk_set_context = c_gtk_source_snippet_chunk_set_context;

/** */
alias gtk_source_snippet_chunk_set_focus_position = c_gtk_source_snippet_chunk_set_focus_position;

/** */
alias gtk_source_snippet_chunk_set_spec = c_gtk_source_snippet_chunk_set_spec;

/** */
alias gtk_source_snippet_chunk_set_text = c_gtk_source_snippet_chunk_set_text;

/** */
alias gtk_source_snippet_chunk_set_text_set = c_gtk_source_snippet_chunk_set_text_set;

/** */
alias gtk_source_snippet_chunk_set_tooltip_text = c_gtk_source_snippet_chunk_set_tooltip_text;

// SnippetContext

/** */
alias gtk_source_snippet_context_get_type = c_gtk_source_snippet_context_get_type;

/** */
alias gtk_source_snippet_context_new = c_gtk_source_snippet_context_new;

/** */
alias gtk_source_snippet_context_clear_variables = c_gtk_source_snippet_context_clear_variables;

/** */
alias gtk_source_snippet_context_expand = c_gtk_source_snippet_context_expand;

/** */
alias gtk_source_snippet_context_get_variable = c_gtk_source_snippet_context_get_variable;

/** */
alias gtk_source_snippet_context_set_constant = c_gtk_source_snippet_context_set_constant;

/** */
alias gtk_source_snippet_context_set_line_prefix = c_gtk_source_snippet_context_set_line_prefix;

/** */
alias gtk_source_snippet_context_set_tab_width = c_gtk_source_snippet_context_set_tab_width;

/** */
alias gtk_source_snippet_context_set_use_spaces = c_gtk_source_snippet_context_set_use_spaces;

/** */
alias gtk_source_snippet_context_set_variable = c_gtk_source_snippet_context_set_variable;

// SnippetManager

/** */
alias gtk_source_snippet_manager_get_type = c_gtk_source_snippet_manager_get_type;

/** */
alias gtk_source_snippet_manager_get_default = c_gtk_source_snippet_manager_get_default;

/** */
alias gtk_source_snippet_manager_get_search_path = c_gtk_source_snippet_manager_get_search_path;

/** */
alias gtk_source_snippet_manager_get_snippet = c_gtk_source_snippet_manager_get_snippet;

/** */
alias gtk_source_snippet_manager_list_all = c_gtk_source_snippet_manager_list_all;

/** */
alias gtk_source_snippet_manager_list_groups = c_gtk_source_snippet_manager_list_groups;

/** */
alias gtk_source_snippet_manager_list_matching = c_gtk_source_snippet_manager_list_matching;

/** */
alias gtk_source_snippet_manager_set_search_path = c_gtk_source_snippet_manager_set_search_path;

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
alias gtk_source_style_scheme_get_metadata = c_gtk_source_style_scheme_get_metadata;

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

// StyleSchemePreview

/** */
alias gtk_source_style_scheme_preview_get_type = c_gtk_source_style_scheme_preview_get_type;

/** */
alias gtk_source_style_scheme_preview_new = c_gtk_source_style_scheme_preview_new;

/** */
alias gtk_source_style_scheme_preview_get_scheme = c_gtk_source_style_scheme_preview_get_scheme;

/** */
alias gtk_source_style_scheme_preview_get_selected = c_gtk_source_style_scheme_preview_get_selected;

/** */
alias gtk_source_style_scheme_preview_set_selected = c_gtk_source_style_scheme_preview_set_selected;

// Tag

/** */
alias gtk_source_tag_get_type = c_gtk_source_tag_get_type;

/** */
alias gtk_source_tag_new = c_gtk_source_tag_new;

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
alias gtk_source_view_get_enable_snippets = c_gtk_source_view_get_enable_snippets;

/** */
alias gtk_source_view_get_gutter = c_gtk_source_view_get_gutter;

/** */
alias gtk_source_view_get_highlight_current_line = c_gtk_source_view_get_highlight_current_line;

/** */
alias gtk_source_view_get_hover = c_gtk_source_view_get_hover;

/** */
alias gtk_source_view_get_indent_on_tab = c_gtk_source_view_get_indent_on_tab;

/** */
alias gtk_source_view_get_indent_width = c_gtk_source_view_get_indent_width;

/** */
alias gtk_source_view_get_indenter = c_gtk_source_view_get_indenter;

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
alias gtk_source_view_push_snippet = c_gtk_source_view_push_snippet;

/** */
alias gtk_source_view_set_auto_indent = c_gtk_source_view_set_auto_indent;

/** */
alias gtk_source_view_set_background_pattern = c_gtk_source_view_set_background_pattern;

/** */
alias gtk_source_view_set_enable_snippets = c_gtk_source_view_set_enable_snippets;

/** */
alias gtk_source_view_set_highlight_current_line = c_gtk_source_view_set_highlight_current_line;

/** */
alias gtk_source_view_set_indent_on_tab = c_gtk_source_view_set_indent_on_tab;

/** */
alias gtk_source_view_set_indent_width = c_gtk_source_view_set_indent_width;

/** */
alias gtk_source_view_set_indenter = c_gtk_source_view_set_indenter;

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

// VimIMContext

/** */
alias gtk_source_vim_im_context_get_type = c_gtk_source_vim_im_context_get_type;

/** */
alias gtk_source_vim_im_context_new = c_gtk_source_vim_im_context_new;

/** */
alias gtk_source_vim_im_context_execute_command = c_gtk_source_vim_im_context_execute_command;

/** */
alias gtk_source_vim_im_context_get_command_bar_text = c_gtk_source_vim_im_context_get_command_bar_text;

/** */
alias gtk_source_vim_im_context_get_command_text = c_gtk_source_vim_im_context_get_command_text;

// global

/** */
alias gtk_source_check_version = c_gtk_source_check_version;

/** */
alias gtk_source_finalize = c_gtk_source_finalize;

/** */
alias gtk_source_get_major_version = c_gtk_source_get_major_version;

/** */
alias gtk_source_get_micro_version = c_gtk_source_get_micro_version;

/** */
alias gtk_source_get_minor_version = c_gtk_source_get_minor_version;

/** */
alias gtk_source_init = c_gtk_source_init;

/** */
alias gtk_source_scheduler_add = c_gtk_source_scheduler_add;

/** */
alias gtk_source_scheduler_add_full = c_gtk_source_scheduler_add_full;

/** */
alias gtk_source_scheduler_remove = c_gtk_source_scheduler_remove;

/** */
alias gtk_source_utils_escape_search_text = c_gtk_source_utils_escape_search_text;

/** */
alias gtk_source_utils_unescape_search_text = c_gtk_source_utils_unescape_search_text;

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
  gidLink(cast(void**)&gtk_source_buffer_change_case, "gtk_source_buffer_change_case", libs);
  gidLink(cast(void**)&gtk_source_buffer_create_source_mark, "gtk_source_buffer_create_source_mark", libs);
  gidLink(cast(void**)&gtk_source_buffer_create_source_tag, "gtk_source_buffer_create_source_tag", libs);
  gidLink(cast(void**)&gtk_source_buffer_ensure_highlight, "gtk_source_buffer_ensure_highlight", libs);
  gidLink(cast(void**)&gtk_source_buffer_forward_iter_to_source_mark, "gtk_source_buffer_forward_iter_to_source_mark", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_context_classes_at_iter, "gtk_source_buffer_get_context_classes_at_iter", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_highlight_matching_brackets, "gtk_source_buffer_get_highlight_matching_brackets", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_highlight_syntax, "gtk_source_buffer_get_highlight_syntax", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_implicit_trailing_newline, "gtk_source_buffer_get_implicit_trailing_newline", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_language, "gtk_source_buffer_get_language", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_loading, "gtk_source_buffer_get_loading", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_source_marks_at_iter, "gtk_source_buffer_get_source_marks_at_iter", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_source_marks_at_line, "gtk_source_buffer_get_source_marks_at_line", libs);
  gidLink(cast(void**)&gtk_source_buffer_get_style_scheme, "gtk_source_buffer_get_style_scheme", libs);
  gidLink(cast(void**)&gtk_source_buffer_iter_backward_to_context_class_toggle, "gtk_source_buffer_iter_backward_to_context_class_toggle", libs);
  gidLink(cast(void**)&gtk_source_buffer_iter_forward_to_context_class_toggle, "gtk_source_buffer_iter_forward_to_context_class_toggle", libs);
  gidLink(cast(void**)&gtk_source_buffer_iter_has_context_class, "gtk_source_buffer_iter_has_context_class", libs);
  gidLink(cast(void**)&gtk_source_buffer_join_lines, "gtk_source_buffer_join_lines", libs);
  gidLink(cast(void**)&gtk_source_buffer_remove_source_marks, "gtk_source_buffer_remove_source_marks", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_highlight_matching_brackets, "gtk_source_buffer_set_highlight_matching_brackets", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_highlight_syntax, "gtk_source_buffer_set_highlight_syntax", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_implicit_trailing_newline, "gtk_source_buffer_set_implicit_trailing_newline", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_language, "gtk_source_buffer_set_language", libs);
  gidLink(cast(void**)&gtk_source_buffer_set_style_scheme, "gtk_source_buffer_set_style_scheme", libs);
  gidLink(cast(void**)&gtk_source_buffer_sort_lines, "gtk_source_buffer_sort_lines", libs);

  // Completion
  gidLink(cast(void**)&gtk_source_completion_get_type, "gtk_source_completion_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_fuzzy_highlight, "gtk_source_completion_fuzzy_highlight", libs);
  gidLink(cast(void**)&gtk_source_completion_fuzzy_match, "gtk_source_completion_fuzzy_match", libs);
  gidLink(cast(void**)&gtk_source_completion_add_provider, "gtk_source_completion_add_provider", libs);
  gidLink(cast(void**)&gtk_source_completion_block_interactive, "gtk_source_completion_block_interactive", libs);
  gidLink(cast(void**)&gtk_source_completion_get_buffer, "gtk_source_completion_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_completion_get_page_size, "gtk_source_completion_get_page_size", libs);
  gidLink(cast(void**)&gtk_source_completion_get_view, "gtk_source_completion_get_view", libs);
  gidLink(cast(void**)&gtk_source_completion_hide, "gtk_source_completion_hide", libs);
  gidLink(cast(void**)&gtk_source_completion_remove_provider, "gtk_source_completion_remove_provider", libs);
  gidLink(cast(void**)&gtk_source_completion_set_page_size, "gtk_source_completion_set_page_size", libs);
  gidLink(cast(void**)&gtk_source_completion_show, "gtk_source_completion_show", libs);
  gidLink(cast(void**)&gtk_source_completion_unblock_interactive, "gtk_source_completion_unblock_interactive", libs);

  // CompletionCell
  gidLink(cast(void**)&gtk_source_completion_cell_get_type, "gtk_source_completion_cell_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_get_column, "gtk_source_completion_cell_get_column", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_get_widget, "gtk_source_completion_cell_get_widget", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_gicon, "gtk_source_completion_cell_set_gicon", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_icon_name, "gtk_source_completion_cell_set_icon_name", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_markup, "gtk_source_completion_cell_set_markup", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_paintable, "gtk_source_completion_cell_set_paintable", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_text, "gtk_source_completion_cell_set_text", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_text_with_attributes, "gtk_source_completion_cell_set_text_with_attributes", libs);
  gidLink(cast(void**)&gtk_source_completion_cell_set_widget, "gtk_source_completion_cell_set_widget", libs);

  // CompletionContext
  gidLink(cast(void**)&gtk_source_completion_context_get_type, "gtk_source_completion_context_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_activation, "gtk_source_completion_context_get_activation", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_bounds, "gtk_source_completion_context_get_bounds", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_buffer, "gtk_source_completion_context_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_busy, "gtk_source_completion_context_get_busy", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_completion, "gtk_source_completion_context_get_completion", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_empty, "gtk_source_completion_context_get_empty", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_language, "gtk_source_completion_context_get_language", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_proposals_for_provider, "gtk_source_completion_context_get_proposals_for_provider", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_view, "gtk_source_completion_context_get_view", libs);
  gidLink(cast(void**)&gtk_source_completion_context_get_word, "gtk_source_completion_context_get_word", libs);
  gidLink(cast(void**)&gtk_source_completion_context_list_providers, "gtk_source_completion_context_list_providers", libs);
  gidLink(cast(void**)&gtk_source_completion_context_set_proposals_for_provider, "gtk_source_completion_context_set_proposals_for_provider", libs);

  // CompletionProposal
  gidLink(cast(void**)&gtk_source_completion_proposal_get_type, "gtk_source_completion_proposal_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_proposal_get_typed_text, "gtk_source_completion_proposal_get_typed_text", libs);

  // CompletionProvider
  gidLink(cast(void**)&gtk_source_completion_provider_get_type, "gtk_source_completion_provider_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_activate, "gtk_source_completion_provider_activate", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_display, "gtk_source_completion_provider_display", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_priority, "gtk_source_completion_provider_get_priority", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_get_title, "gtk_source_completion_provider_get_title", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_is_trigger, "gtk_source_completion_provider_is_trigger", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_key_activates, "gtk_source_completion_provider_key_activates", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_list_alternates, "gtk_source_completion_provider_list_alternates", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_populate_async, "gtk_source_completion_provider_populate_async", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_populate_finish, "gtk_source_completion_provider_populate_finish", libs);
  gidLink(cast(void**)&gtk_source_completion_provider_refilter, "gtk_source_completion_provider_refilter", libs);

  // CompletionSnippets
  gidLink(cast(void**)&gtk_source_completion_snippets_get_type, "gtk_source_completion_snippets_get_type", libs);
  gidLink(cast(void**)&gtk_source_completion_snippets_new, "gtk_source_completion_snippets_new", libs);

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
  gidLink(cast(void**)&gtk_source_gutter_get_view, "gtk_source_gutter_get_view", libs);
  gidLink(cast(void**)&gtk_source_gutter_insert, "gtk_source_gutter_insert", libs);
  gidLink(cast(void**)&gtk_source_gutter_remove, "gtk_source_gutter_remove", libs);
  gidLink(cast(void**)&gtk_source_gutter_reorder, "gtk_source_gutter_reorder", libs);

  // GutterLines
  gidLink(cast(void**)&gtk_source_gutter_lines_get_type, "gtk_source_gutter_lines_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_add_class, "gtk_source_gutter_lines_add_class", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_add_qclass, "gtk_source_gutter_lines_add_qclass", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_get_buffer, "gtk_source_gutter_lines_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_get_first, "gtk_source_gutter_lines_get_first", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_get_iter_at_line, "gtk_source_gutter_lines_get_iter_at_line", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_get_last, "gtk_source_gutter_lines_get_last", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_get_line_yrange, "gtk_source_gutter_lines_get_line_yrange", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_get_view, "gtk_source_gutter_lines_get_view", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_has_any_class, "gtk_source_gutter_lines_has_any_class", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_has_class, "gtk_source_gutter_lines_has_class", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_has_qclass, "gtk_source_gutter_lines_has_qclass", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_is_cursor, "gtk_source_gutter_lines_is_cursor", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_is_prelit, "gtk_source_gutter_lines_is_prelit", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_is_selected, "gtk_source_gutter_lines_is_selected", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_remove_class, "gtk_source_gutter_lines_remove_class", libs);
  gidLink(cast(void**)&gtk_source_gutter_lines_remove_qclass, "gtk_source_gutter_lines_remove_qclass", libs);

  // GutterRenderer
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_type, "gtk_source_gutter_renderer_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_activate, "gtk_source_gutter_renderer_activate", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_align_cell, "gtk_source_gutter_renderer_align_cell", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_alignment_mode, "gtk_source_gutter_renderer_get_alignment_mode", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_buffer, "gtk_source_gutter_renderer_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_view, "gtk_source_gutter_renderer_get_view", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_xalign, "gtk_source_gutter_renderer_get_xalign", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_xpad, "gtk_source_gutter_renderer_get_xpad", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_yalign, "gtk_source_gutter_renderer_get_yalign", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_get_ypad, "gtk_source_gutter_renderer_get_ypad", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_query_activatable, "gtk_source_gutter_renderer_query_activatable", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_alignment_mode, "gtk_source_gutter_renderer_set_alignment_mode", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_xalign, "gtk_source_gutter_renderer_set_xalign", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_xpad, "gtk_source_gutter_renderer_set_xpad", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_yalign, "gtk_source_gutter_renderer_set_yalign", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_set_ypad, "gtk_source_gutter_renderer_set_ypad", libs);

  // GutterRendererPixbuf
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_type, "gtk_source_gutter_renderer_pixbuf_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_new, "gtk_source_gutter_renderer_pixbuf_new", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_gicon, "gtk_source_gutter_renderer_pixbuf_get_gicon", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_icon_name, "gtk_source_gutter_renderer_pixbuf_get_icon_name", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_paintable, "gtk_source_gutter_renderer_pixbuf_get_paintable", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_get_pixbuf, "gtk_source_gutter_renderer_pixbuf_get_pixbuf", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_overlay_paintable, "gtk_source_gutter_renderer_pixbuf_overlay_paintable", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_gicon, "gtk_source_gutter_renderer_pixbuf_set_gicon", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_icon_name, "gtk_source_gutter_renderer_pixbuf_set_icon_name", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_paintable, "gtk_source_gutter_renderer_pixbuf_set_paintable", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_pixbuf_set_pixbuf, "gtk_source_gutter_renderer_pixbuf_set_pixbuf", libs);

  // GutterRendererText
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_get_type, "gtk_source_gutter_renderer_text_get_type", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_new, "gtk_source_gutter_renderer_text_new", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_measure, "gtk_source_gutter_renderer_text_measure", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_measure_markup, "gtk_source_gutter_renderer_text_measure_markup", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_set_markup, "gtk_source_gutter_renderer_text_set_markup", libs);
  gidLink(cast(void**)&gtk_source_gutter_renderer_text_set_text, "gtk_source_gutter_renderer_text_set_text", libs);

  // Hover
  gidLink(cast(void**)&gtk_source_hover_get_type, "gtk_source_hover_get_type", libs);
  gidLink(cast(void**)&gtk_source_hover_add_provider, "gtk_source_hover_add_provider", libs);
  gidLink(cast(void**)&gtk_source_hover_remove_provider, "gtk_source_hover_remove_provider", libs);

  // HoverContext
  gidLink(cast(void**)&gtk_source_hover_context_get_type, "gtk_source_hover_context_get_type", libs);
  gidLink(cast(void**)&gtk_source_hover_context_get_bounds, "gtk_source_hover_context_get_bounds", libs);
  gidLink(cast(void**)&gtk_source_hover_context_get_buffer, "gtk_source_hover_context_get_buffer", libs);
  gidLink(cast(void**)&gtk_source_hover_context_get_iter, "gtk_source_hover_context_get_iter", libs);
  gidLink(cast(void**)&gtk_source_hover_context_get_view, "gtk_source_hover_context_get_view", libs);

  // HoverDisplay
  gidLink(cast(void**)&gtk_source_hover_display_get_type, "gtk_source_hover_display_get_type", libs);
  gidLink(cast(void**)&gtk_source_hover_display_append, "gtk_source_hover_display_append", libs);
  gidLink(cast(void**)&gtk_source_hover_display_insert_after, "gtk_source_hover_display_insert_after", libs);
  gidLink(cast(void**)&gtk_source_hover_display_prepend, "gtk_source_hover_display_prepend", libs);
  gidLink(cast(void**)&gtk_source_hover_display_remove, "gtk_source_hover_display_remove", libs);

  // HoverProvider
  gidLink(cast(void**)&gtk_source_hover_provider_get_type, "gtk_source_hover_provider_get_type", libs);
  gidLink(cast(void**)&gtk_source_hover_provider_populate_async, "gtk_source_hover_provider_populate_async", libs);
  gidLink(cast(void**)&gtk_source_hover_provider_populate_finish, "gtk_source_hover_provider_populate_finish", libs);

  // Indenter
  gidLink(cast(void**)&gtk_source_indenter_get_type, "gtk_source_indenter_get_type", libs);
  gidLink(cast(void**)&gtk_source_indenter_indent, "gtk_source_indenter_indent", libs);
  gidLink(cast(void**)&gtk_source_indenter_is_trigger, "gtk_source_indenter_is_trigger", libs);

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
  gidLink(cast(void**)&gtk_source_language_manager_append_search_path, "gtk_source_language_manager_append_search_path", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_language, "gtk_source_language_manager_get_language", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_language_ids, "gtk_source_language_manager_get_language_ids", libs);
  gidLink(cast(void**)&gtk_source_language_manager_get_search_path, "gtk_source_language_manager_get_search_path", libs);
  gidLink(cast(void**)&gtk_source_language_manager_guess_language, "gtk_source_language_manager_guess_language", libs);
  gidLink(cast(void**)&gtk_source_language_manager_prepend_search_path, "gtk_source_language_manager_prepend_search_path", libs);
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
  gidLink(cast(void**)&gtk_source_print_compositor_ignore_tag, "gtk_source_print_compositor_ignore_tag", libs);
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
  gidLink(cast(void**)&gtk_source_search_settings_get_visible_only, "gtk_source_search_settings_get_visible_only", libs);
  gidLink(cast(void**)&gtk_source_search_settings_get_wrap_around, "gtk_source_search_settings_get_wrap_around", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_at_word_boundaries, "gtk_source_search_settings_set_at_word_boundaries", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_case_sensitive, "gtk_source_search_settings_set_case_sensitive", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_regex_enabled, "gtk_source_search_settings_set_regex_enabled", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_search_text, "gtk_source_search_settings_set_search_text", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_visible_only, "gtk_source_search_settings_set_visible_only", libs);
  gidLink(cast(void**)&gtk_source_search_settings_set_wrap_around, "gtk_source_search_settings_set_wrap_around", libs);

  // Snippet
  gidLink(cast(void**)&gtk_source_snippet_get_type, "gtk_source_snippet_get_type", libs);
  gidLink(cast(void**)&gtk_source_snippet_new, "gtk_source_snippet_new", libs);
  gidLink(cast(void**)&gtk_source_snippet_new_parsed, "gtk_source_snippet_new_parsed", libs);
  gidLink(cast(void**)&gtk_source_snippet_add_chunk, "gtk_source_snippet_add_chunk", libs);
  gidLink(cast(void**)&gtk_source_snippet_copy, "gtk_source_snippet_copy", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_context, "gtk_source_snippet_get_context", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_description, "gtk_source_snippet_get_description", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_focus_position, "gtk_source_snippet_get_focus_position", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_language_id, "gtk_source_snippet_get_language_id", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_n_chunks, "gtk_source_snippet_get_n_chunks", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_name, "gtk_source_snippet_get_name", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_nth_chunk, "gtk_source_snippet_get_nth_chunk", libs);
  gidLink(cast(void**)&gtk_source_snippet_get_trigger, "gtk_source_snippet_get_trigger", libs);
  gidLink(cast(void**)&gtk_source_snippet_set_description, "gtk_source_snippet_set_description", libs);
  gidLink(cast(void**)&gtk_source_snippet_set_language_id, "gtk_source_snippet_set_language_id", libs);
  gidLink(cast(void**)&gtk_source_snippet_set_name, "gtk_source_snippet_set_name", libs);
  gidLink(cast(void**)&gtk_source_snippet_set_trigger, "gtk_source_snippet_set_trigger", libs);

  // SnippetChunk
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_type, "gtk_source_snippet_chunk_get_type", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_new, "gtk_source_snippet_chunk_new", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_copy, "gtk_source_snippet_chunk_copy", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_context, "gtk_source_snippet_chunk_get_context", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_focus_position, "gtk_source_snippet_chunk_get_focus_position", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_spec, "gtk_source_snippet_chunk_get_spec", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_text, "gtk_source_snippet_chunk_get_text", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_text_set, "gtk_source_snippet_chunk_get_text_set", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_get_tooltip_text, "gtk_source_snippet_chunk_get_tooltip_text", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_set_context, "gtk_source_snippet_chunk_set_context", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_set_focus_position, "gtk_source_snippet_chunk_set_focus_position", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_set_spec, "gtk_source_snippet_chunk_set_spec", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_set_text, "gtk_source_snippet_chunk_set_text", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_set_text_set, "gtk_source_snippet_chunk_set_text_set", libs);
  gidLink(cast(void**)&gtk_source_snippet_chunk_set_tooltip_text, "gtk_source_snippet_chunk_set_tooltip_text", libs);

  // SnippetContext
  gidLink(cast(void**)&gtk_source_snippet_context_get_type, "gtk_source_snippet_context_get_type", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_new, "gtk_source_snippet_context_new", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_clear_variables, "gtk_source_snippet_context_clear_variables", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_expand, "gtk_source_snippet_context_expand", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_get_variable, "gtk_source_snippet_context_get_variable", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_set_constant, "gtk_source_snippet_context_set_constant", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_set_line_prefix, "gtk_source_snippet_context_set_line_prefix", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_set_tab_width, "gtk_source_snippet_context_set_tab_width", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_set_use_spaces, "gtk_source_snippet_context_set_use_spaces", libs);
  gidLink(cast(void**)&gtk_source_snippet_context_set_variable, "gtk_source_snippet_context_set_variable", libs);

  // SnippetManager
  gidLink(cast(void**)&gtk_source_snippet_manager_get_type, "gtk_source_snippet_manager_get_type", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_get_default, "gtk_source_snippet_manager_get_default", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_get_search_path, "gtk_source_snippet_manager_get_search_path", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_get_snippet, "gtk_source_snippet_manager_get_snippet", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_list_all, "gtk_source_snippet_manager_list_all", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_list_groups, "gtk_source_snippet_manager_list_groups", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_list_matching, "gtk_source_snippet_manager_list_matching", libs);
  gidLink(cast(void**)&gtk_source_snippet_manager_set_search_path, "gtk_source_snippet_manager_set_search_path", libs);

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
  gidLink(cast(void**)&gtk_source_style_scheme_get_metadata, "gtk_source_style_scheme_get_metadata", libs);
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

  // StyleSchemePreview
  gidLink(cast(void**)&gtk_source_style_scheme_preview_get_type, "gtk_source_style_scheme_preview_get_type", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_preview_new, "gtk_source_style_scheme_preview_new", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_preview_get_scheme, "gtk_source_style_scheme_preview_get_scheme", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_preview_get_selected, "gtk_source_style_scheme_preview_get_selected", libs);
  gidLink(cast(void**)&gtk_source_style_scheme_preview_set_selected, "gtk_source_style_scheme_preview_set_selected", libs);

  // Tag
  gidLink(cast(void**)&gtk_source_tag_get_type, "gtk_source_tag_get_type", libs);
  gidLink(cast(void**)&gtk_source_tag_new, "gtk_source_tag_new", libs);

  // View
  gidLink(cast(void**)&gtk_source_view_get_type, "gtk_source_view_get_type", libs);
  gidLink(cast(void**)&gtk_source_view_new, "gtk_source_view_new", libs);
  gidLink(cast(void**)&gtk_source_view_new_with_buffer, "gtk_source_view_new_with_buffer", libs);
  gidLink(cast(void**)&gtk_source_view_get_auto_indent, "gtk_source_view_get_auto_indent", libs);
  gidLink(cast(void**)&gtk_source_view_get_background_pattern, "gtk_source_view_get_background_pattern", libs);
  gidLink(cast(void**)&gtk_source_view_get_completion, "gtk_source_view_get_completion", libs);
  gidLink(cast(void**)&gtk_source_view_get_enable_snippets, "gtk_source_view_get_enable_snippets", libs);
  gidLink(cast(void**)&gtk_source_view_get_gutter, "gtk_source_view_get_gutter", libs);
  gidLink(cast(void**)&gtk_source_view_get_highlight_current_line, "gtk_source_view_get_highlight_current_line", libs);
  gidLink(cast(void**)&gtk_source_view_get_hover, "gtk_source_view_get_hover", libs);
  gidLink(cast(void**)&gtk_source_view_get_indent_on_tab, "gtk_source_view_get_indent_on_tab", libs);
  gidLink(cast(void**)&gtk_source_view_get_indent_width, "gtk_source_view_get_indent_width", libs);
  gidLink(cast(void**)&gtk_source_view_get_indenter, "gtk_source_view_get_indenter", libs);
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
  gidLink(cast(void**)&gtk_source_view_push_snippet, "gtk_source_view_push_snippet", libs);
  gidLink(cast(void**)&gtk_source_view_set_auto_indent, "gtk_source_view_set_auto_indent", libs);
  gidLink(cast(void**)&gtk_source_view_set_background_pattern, "gtk_source_view_set_background_pattern", libs);
  gidLink(cast(void**)&gtk_source_view_set_enable_snippets, "gtk_source_view_set_enable_snippets", libs);
  gidLink(cast(void**)&gtk_source_view_set_highlight_current_line, "gtk_source_view_set_highlight_current_line", libs);
  gidLink(cast(void**)&gtk_source_view_set_indent_on_tab, "gtk_source_view_set_indent_on_tab", libs);
  gidLink(cast(void**)&gtk_source_view_set_indent_width, "gtk_source_view_set_indent_width", libs);
  gidLink(cast(void**)&gtk_source_view_set_indenter, "gtk_source_view_set_indenter", libs);
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

  // VimIMContext
  gidLink(cast(void**)&gtk_source_vim_im_context_get_type, "gtk_source_vim_im_context_get_type", libs);
  gidLink(cast(void**)&gtk_source_vim_im_context_new, "gtk_source_vim_im_context_new", libs);
  gidLink(cast(void**)&gtk_source_vim_im_context_execute_command, "gtk_source_vim_im_context_execute_command", libs);
  gidLink(cast(void**)&gtk_source_vim_im_context_get_command_bar_text, "gtk_source_vim_im_context_get_command_bar_text", libs);
  gidLink(cast(void**)&gtk_source_vim_im_context_get_command_text, "gtk_source_vim_im_context_get_command_text", libs);

  // global
  gidLink(cast(void**)&gtk_source_check_version, "gtk_source_check_version", libs);
  gidLink(cast(void**)&gtk_source_finalize, "gtk_source_finalize", libs);
  gidLink(cast(void**)&gtk_source_get_major_version, "gtk_source_get_major_version", libs);
  gidLink(cast(void**)&gtk_source_get_micro_version, "gtk_source_get_micro_version", libs);
  gidLink(cast(void**)&gtk_source_get_minor_version, "gtk_source_get_minor_version", libs);
  gidLink(cast(void**)&gtk_source_init, "gtk_source_init", libs);
  gidLink(cast(void**)&gtk_source_scheduler_add, "gtk_source_scheduler_add", libs);
  gidLink(cast(void**)&gtk_source_scheduler_add_full, "gtk_source_scheduler_add_full", libs);
  gidLink(cast(void**)&gtk_source_scheduler_remove, "gtk_source_scheduler_remove", libs);
  gidLink(cast(void**)&gtk_source_utils_escape_search_text, "gtk_source_utils_escape_search_text", libs);
  gidLink(cast(void**)&gtk_source_utils_unescape_search_text, "gtk_source_utils_unescape_search_text", libs);

  // FileLoaderError
  gidLink(cast(void**)&gtk_source_file_loader_error_quark, "gtk_source_file_loader_error_quark", libs);

  // FileSaverError
  gidLink(cast(void**)&gtk_source_file_saver_error_quark, "gtk_source_file_saver_error_quark", libs);
}
