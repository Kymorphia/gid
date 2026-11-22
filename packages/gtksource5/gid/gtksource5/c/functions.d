/// C functions for gtksource5 library
module gid.gtksource5.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gtksource5.c.types;
public import gid.gtk4.c.types;

private immutable LIBS = ["gtksourceview-5_0"];

// Annotation
private alias c_gtk_source_annotation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_annotation_get_typeFn c_gtk_source_annotation_get_type; ///
private alias c_gtk_source_annotation_newFn = extern(C) GtkSourceAnnotation* function(const(char)* description, GIcon* icon, int line, GtkSourceAnnotationStyle style) nothrow;
__gshared c_gtk_source_annotation_newFn c_gtk_source_annotation_new; ///
private alias c_gtk_source_annotation_get_descriptionFn = extern(C) const(char)* function(GtkSourceAnnotation* self) nothrow;
__gshared c_gtk_source_annotation_get_descriptionFn c_gtk_source_annotation_get_description; ///
private alias c_gtk_source_annotation_get_iconFn = extern(C) GIcon* function(GtkSourceAnnotation* self) nothrow;
__gshared c_gtk_source_annotation_get_iconFn c_gtk_source_annotation_get_icon; ///
private alias c_gtk_source_annotation_get_lineFn = extern(C) int function(GtkSourceAnnotation* self) nothrow;
__gshared c_gtk_source_annotation_get_lineFn c_gtk_source_annotation_get_line; ///
private alias c_gtk_source_annotation_get_styleFn = extern(C) GtkSourceAnnotationStyle function(GtkSourceAnnotation* self) nothrow;
__gshared c_gtk_source_annotation_get_styleFn c_gtk_source_annotation_get_style; ///

// AnnotationProvider
private alias c_gtk_source_annotation_provider_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_annotation_provider_get_typeFn c_gtk_source_annotation_provider_get_type; ///
private alias c_gtk_source_annotation_provider_newFn = extern(C) GtkSourceAnnotationProvider* function() nothrow;
__gshared c_gtk_source_annotation_provider_newFn c_gtk_source_annotation_provider_new; ///
private alias c_gtk_source_annotation_provider_add_annotationFn = extern(C) void function(GtkSourceAnnotationProvider* self, GtkSourceAnnotation* annotation) nothrow;
__gshared c_gtk_source_annotation_provider_add_annotationFn c_gtk_source_annotation_provider_add_annotation; ///
private alias c_gtk_source_annotation_provider_populate_hover_asyncFn = extern(C) void function(GtkSourceAnnotationProvider* self, GtkSourceAnnotation* annotation, GtkSourceHoverDisplay* display, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_annotation_provider_populate_hover_asyncFn c_gtk_source_annotation_provider_populate_hover_async; ///
private alias c_gtk_source_annotation_provider_populate_hover_finishFn = extern(C) gboolean function(GtkSourceAnnotationProvider* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gtk_source_annotation_provider_populate_hover_finishFn c_gtk_source_annotation_provider_populate_hover_finish; ///
private alias c_gtk_source_annotation_provider_remove_allFn = extern(C) void function(GtkSourceAnnotationProvider* self) nothrow;
__gshared c_gtk_source_annotation_provider_remove_allFn c_gtk_source_annotation_provider_remove_all; ///
private alias c_gtk_source_annotation_provider_remove_annotationFn = extern(C) gboolean function(GtkSourceAnnotationProvider* self, GtkSourceAnnotation* annotation) nothrow;
__gshared c_gtk_source_annotation_provider_remove_annotationFn c_gtk_source_annotation_provider_remove_annotation; ///

// Annotations
private alias c_gtk_source_annotations_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_annotations_get_typeFn c_gtk_source_annotations_get_type; ///
private alias c_gtk_source_annotations_add_providerFn = extern(C) void function(GtkSourceAnnotations* self, GtkSourceAnnotationProvider* provider) nothrow;
__gshared c_gtk_source_annotations_add_providerFn c_gtk_source_annotations_add_provider; ///
private alias c_gtk_source_annotations_remove_providerFn = extern(C) gboolean function(GtkSourceAnnotations* self, GtkSourceAnnotationProvider* provider) nothrow;
__gshared c_gtk_source_annotations_remove_providerFn c_gtk_source_annotations_remove_provider; ///

// Buffer
private alias c_gtk_source_buffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_buffer_get_typeFn c_gtk_source_buffer_get_type; ///
private alias c_gtk_source_buffer_newFn = extern(C) GtkSourceBuffer* function(GtkTextTagTable* table) nothrow;
__gshared c_gtk_source_buffer_newFn c_gtk_source_buffer_new; ///
private alias c_gtk_source_buffer_new_with_languageFn = extern(C) GtkSourceBuffer* function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_buffer_new_with_languageFn c_gtk_source_buffer_new_with_language; ///
private alias c_gtk_source_buffer_backward_iter_to_source_markFn = extern(C) gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) nothrow;
__gshared c_gtk_source_buffer_backward_iter_to_source_markFn c_gtk_source_buffer_backward_iter_to_source_mark; ///
private alias c_gtk_source_buffer_change_caseFn = extern(C) void function(GtkSourceBuffer* buffer, GtkSourceChangeCaseType caseType, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_buffer_change_caseFn c_gtk_source_buffer_change_case; ///
private alias c_gtk_source_buffer_create_source_markFn = extern(C) GtkSourceMark* function(GtkSourceBuffer* buffer, const(char)* name, const(char)* category, const(GtkTextIter)* where) nothrow;
__gshared c_gtk_source_buffer_create_source_markFn c_gtk_source_buffer_create_source_mark; ///
private alias c_gtk_source_buffer_create_source_tagFn = extern(C) GtkTextTag* function(GtkSourceBuffer* buffer, const(char)* tagName, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_gtk_source_buffer_create_source_tagFn c_gtk_source_buffer_create_source_tag; ///
private alias c_gtk_source_buffer_ensure_highlightFn = extern(C) void function(GtkSourceBuffer* buffer, const(GtkTextIter)* start, const(GtkTextIter)* end) nothrow;
__gshared c_gtk_source_buffer_ensure_highlightFn c_gtk_source_buffer_ensure_highlight; ///
private alias c_gtk_source_buffer_forward_iter_to_source_markFn = extern(C) gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) nothrow;
__gshared c_gtk_source_buffer_forward_iter_to_source_markFn c_gtk_source_buffer_forward_iter_to_source_mark; ///
private alias c_gtk_source_buffer_get_context_classes_at_iterFn = extern(C) char** function(GtkSourceBuffer* buffer, const(GtkTextIter)* iter) nothrow;
__gshared c_gtk_source_buffer_get_context_classes_at_iterFn c_gtk_source_buffer_get_context_classes_at_iter; ///
private alias c_gtk_source_buffer_get_highlight_matching_bracketsFn = extern(C) gboolean function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_buffer_get_highlight_matching_bracketsFn c_gtk_source_buffer_get_highlight_matching_brackets; ///
private alias c_gtk_source_buffer_get_highlight_syntaxFn = extern(C) gboolean function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_buffer_get_highlight_syntaxFn c_gtk_source_buffer_get_highlight_syntax; ///
private alias c_gtk_source_buffer_get_implicit_trailing_newlineFn = extern(C) gboolean function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_buffer_get_implicit_trailing_newlineFn c_gtk_source_buffer_get_implicit_trailing_newline; ///
private alias c_gtk_source_buffer_get_languageFn = extern(C) GtkSourceLanguage* function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_buffer_get_languageFn c_gtk_source_buffer_get_language; ///
private alias c_gtk_source_buffer_get_loadingFn = extern(C) gboolean function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_buffer_get_loadingFn c_gtk_source_buffer_get_loading; ///
private alias c_gtk_source_buffer_get_markupFn = extern(C) char* function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_buffer_get_markupFn c_gtk_source_buffer_get_markup; ///
private alias c_gtk_source_buffer_get_source_marks_at_iterFn = extern(C) GSList* function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* category) nothrow;
__gshared c_gtk_source_buffer_get_source_marks_at_iterFn c_gtk_source_buffer_get_source_marks_at_iter; ///
private alias c_gtk_source_buffer_get_source_marks_at_lineFn = extern(C) GSList* function(GtkSourceBuffer* buffer, int line, const(char)* category) nothrow;
__gshared c_gtk_source_buffer_get_source_marks_at_lineFn c_gtk_source_buffer_get_source_marks_at_line; ///
private alias c_gtk_source_buffer_get_style_schemeFn = extern(C) GtkSourceStyleScheme* function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_buffer_get_style_schemeFn c_gtk_source_buffer_get_style_scheme; ///
private alias c_gtk_source_buffer_iter_backward_to_context_class_toggleFn = extern(C) gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* contextClass) nothrow;
__gshared c_gtk_source_buffer_iter_backward_to_context_class_toggleFn c_gtk_source_buffer_iter_backward_to_context_class_toggle; ///
private alias c_gtk_source_buffer_iter_forward_to_context_class_toggleFn = extern(C) gboolean function(GtkSourceBuffer* buffer, GtkTextIter* iter, const(char)* contextClass) nothrow;
__gshared c_gtk_source_buffer_iter_forward_to_context_class_toggleFn c_gtk_source_buffer_iter_forward_to_context_class_toggle; ///
private alias c_gtk_source_buffer_iter_has_context_classFn = extern(C) gboolean function(GtkSourceBuffer* buffer, const(GtkTextIter)* iter, const(char)* contextClass) nothrow;
__gshared c_gtk_source_buffer_iter_has_context_classFn c_gtk_source_buffer_iter_has_context_class; ///
private alias c_gtk_source_buffer_join_linesFn = extern(C) void function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_buffer_join_linesFn c_gtk_source_buffer_join_lines; ///
private alias c_gtk_source_buffer_remove_source_marksFn = extern(C) void function(GtkSourceBuffer* buffer, const(GtkTextIter)* start, const(GtkTextIter)* end, const(char)* category) nothrow;
__gshared c_gtk_source_buffer_remove_source_marksFn c_gtk_source_buffer_remove_source_marks; ///
private alias c_gtk_source_buffer_set_highlight_matching_bracketsFn = extern(C) void function(GtkSourceBuffer* buffer, gboolean highlight) nothrow;
__gshared c_gtk_source_buffer_set_highlight_matching_bracketsFn c_gtk_source_buffer_set_highlight_matching_brackets; ///
private alias c_gtk_source_buffer_set_highlight_syntaxFn = extern(C) void function(GtkSourceBuffer* buffer, gboolean highlight) nothrow;
__gshared c_gtk_source_buffer_set_highlight_syntaxFn c_gtk_source_buffer_set_highlight_syntax; ///
private alias c_gtk_source_buffer_set_implicit_trailing_newlineFn = extern(C) void function(GtkSourceBuffer* buffer, gboolean implicitTrailingNewline) nothrow;
__gshared c_gtk_source_buffer_set_implicit_trailing_newlineFn c_gtk_source_buffer_set_implicit_trailing_newline; ///
private alias c_gtk_source_buffer_set_languageFn = extern(C) void function(GtkSourceBuffer* buffer, GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_buffer_set_languageFn c_gtk_source_buffer_set_language; ///
private alias c_gtk_source_buffer_set_style_schemeFn = extern(C) void function(GtkSourceBuffer* buffer, GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_buffer_set_style_schemeFn c_gtk_source_buffer_set_style_scheme; ///
private alias c_gtk_source_buffer_sort_linesFn = extern(C) void function(GtkSourceBuffer* buffer, GtkTextIter* start, GtkTextIter* end, GtkSourceSortFlags flags, int column) nothrow;
__gshared c_gtk_source_buffer_sort_linesFn c_gtk_source_buffer_sort_lines; ///

// Completion
private alias c_gtk_source_completion_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_get_typeFn c_gtk_source_completion_get_type; ///
private alias c_gtk_source_completion_fuzzy_highlightFn = extern(C) PangoAttrList* function(const(char)* haystack, const(char)* casefoldQuery) nothrow;
__gshared c_gtk_source_completion_fuzzy_highlightFn c_gtk_source_completion_fuzzy_highlight; ///
private alias c_gtk_source_completion_fuzzy_matchFn = extern(C) gboolean function(const(char)* haystack, const(char)* casefoldNeedle, uint* priority) nothrow;
__gshared c_gtk_source_completion_fuzzy_matchFn c_gtk_source_completion_fuzzy_match; ///
private alias c_gtk_source_completion_add_providerFn = extern(C) void function(GtkSourceCompletion* self, GtkSourceCompletionProvider* provider) nothrow;
__gshared c_gtk_source_completion_add_providerFn c_gtk_source_completion_add_provider; ///
private alias c_gtk_source_completion_block_interactiveFn = extern(C) void function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_block_interactiveFn c_gtk_source_completion_block_interactive; ///
private alias c_gtk_source_completion_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_get_bufferFn c_gtk_source_completion_get_buffer; ///
private alias c_gtk_source_completion_get_page_sizeFn = extern(C) uint function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_get_page_sizeFn c_gtk_source_completion_get_page_size; ///
private alias c_gtk_source_completion_get_viewFn = extern(C) GtkSourceView* function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_get_viewFn c_gtk_source_completion_get_view; ///
private alias c_gtk_source_completion_hideFn = extern(C) void function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_hideFn c_gtk_source_completion_hide; ///
private alias c_gtk_source_completion_remove_providerFn = extern(C) void function(GtkSourceCompletion* self, GtkSourceCompletionProvider* provider) nothrow;
__gshared c_gtk_source_completion_remove_providerFn c_gtk_source_completion_remove_provider; ///
private alias c_gtk_source_completion_set_page_sizeFn = extern(C) void function(GtkSourceCompletion* self, uint pageSize) nothrow;
__gshared c_gtk_source_completion_set_page_sizeFn c_gtk_source_completion_set_page_size; ///
private alias c_gtk_source_completion_showFn = extern(C) void function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_showFn c_gtk_source_completion_show; ///
private alias c_gtk_source_completion_unblock_interactiveFn = extern(C) void function(GtkSourceCompletion* self) nothrow;
__gshared c_gtk_source_completion_unblock_interactiveFn c_gtk_source_completion_unblock_interactive; ///

// CompletionCell
private alias c_gtk_source_completion_cell_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_cell_get_typeFn c_gtk_source_completion_cell_get_type; ///
private alias c_gtk_source_completion_cell_get_columnFn = extern(C) GtkSourceCompletionColumn function(GtkSourceCompletionCell* self) nothrow;
__gshared c_gtk_source_completion_cell_get_columnFn c_gtk_source_completion_cell_get_column; ///
private alias c_gtk_source_completion_cell_get_widgetFn = extern(C) GtkWidget* function(GtkSourceCompletionCell* self) nothrow;
__gshared c_gtk_source_completion_cell_get_widgetFn c_gtk_source_completion_cell_get_widget; ///
private alias c_gtk_source_completion_cell_set_giconFn = extern(C) void function(GtkSourceCompletionCell* self, GIcon* gicon) nothrow;
__gshared c_gtk_source_completion_cell_set_giconFn c_gtk_source_completion_cell_set_gicon; ///
private alias c_gtk_source_completion_cell_set_icon_nameFn = extern(C) void function(GtkSourceCompletionCell* self, const(char)* iconName) nothrow;
__gshared c_gtk_source_completion_cell_set_icon_nameFn c_gtk_source_completion_cell_set_icon_name; ///
private alias c_gtk_source_completion_cell_set_markupFn = extern(C) void function(GtkSourceCompletionCell* self, const(char)* markup) nothrow;
__gshared c_gtk_source_completion_cell_set_markupFn c_gtk_source_completion_cell_set_markup; ///
private alias c_gtk_source_completion_cell_set_paintableFn = extern(C) void function(GtkSourceCompletionCell* self, GdkPaintable* paintable) nothrow;
__gshared c_gtk_source_completion_cell_set_paintableFn c_gtk_source_completion_cell_set_paintable; ///
private alias c_gtk_source_completion_cell_set_textFn = extern(C) void function(GtkSourceCompletionCell* self, const(char)* text) nothrow;
__gshared c_gtk_source_completion_cell_set_textFn c_gtk_source_completion_cell_set_text; ///
private alias c_gtk_source_completion_cell_set_text_with_attributesFn = extern(C) void function(GtkSourceCompletionCell* self, const(char)* text, PangoAttrList* attrs) nothrow;
__gshared c_gtk_source_completion_cell_set_text_with_attributesFn c_gtk_source_completion_cell_set_text_with_attributes; ///
private alias c_gtk_source_completion_cell_set_widgetFn = extern(C) void function(GtkSourceCompletionCell* self, GtkWidget* child) nothrow;
__gshared c_gtk_source_completion_cell_set_widgetFn c_gtk_source_completion_cell_set_widget; ///

// CompletionContext
private alias c_gtk_source_completion_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_context_get_typeFn c_gtk_source_completion_context_get_type; ///
private alias c_gtk_source_completion_context_get_activationFn = extern(C) GtkSourceCompletionActivation function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_activationFn c_gtk_source_completion_context_get_activation; ///
private alias c_gtk_source_completion_context_get_boundsFn = extern(C) gboolean function(GtkSourceCompletionContext* self, GtkTextIter* begin, GtkTextIter* end) nothrow;
__gshared c_gtk_source_completion_context_get_boundsFn c_gtk_source_completion_context_get_bounds; ///
private alias c_gtk_source_completion_context_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_bufferFn c_gtk_source_completion_context_get_buffer; ///
private alias c_gtk_source_completion_context_get_busyFn = extern(C) gboolean function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_busyFn c_gtk_source_completion_context_get_busy; ///
private alias c_gtk_source_completion_context_get_completionFn = extern(C) GtkSourceCompletion* function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_completionFn c_gtk_source_completion_context_get_completion; ///
private alias c_gtk_source_completion_context_get_emptyFn = extern(C) gboolean function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_emptyFn c_gtk_source_completion_context_get_empty; ///
private alias c_gtk_source_completion_context_get_languageFn = extern(C) GtkSourceLanguage* function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_languageFn c_gtk_source_completion_context_get_language; ///
private alias c_gtk_source_completion_context_get_proposals_for_providerFn = extern(C) GListModel* function(GtkSourceCompletionContext* self, GtkSourceCompletionProvider* provider) nothrow;
__gshared c_gtk_source_completion_context_get_proposals_for_providerFn c_gtk_source_completion_context_get_proposals_for_provider; ///
private alias c_gtk_source_completion_context_get_viewFn = extern(C) GtkSourceView* function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_viewFn c_gtk_source_completion_context_get_view; ///
private alias c_gtk_source_completion_context_get_wordFn = extern(C) char* function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_get_wordFn c_gtk_source_completion_context_get_word; ///
private alias c_gtk_source_completion_context_list_providersFn = extern(C) GListModel* function(GtkSourceCompletionContext* self) nothrow;
__gshared c_gtk_source_completion_context_list_providersFn c_gtk_source_completion_context_list_providers; ///
private alias c_gtk_source_completion_context_set_proposals_for_providerFn = extern(C) void function(GtkSourceCompletionContext* self, GtkSourceCompletionProvider* provider, GListModel* results) nothrow;
__gshared c_gtk_source_completion_context_set_proposals_for_providerFn c_gtk_source_completion_context_set_proposals_for_provider; ///

// CompletionProposal
private alias c_gtk_source_completion_proposal_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_proposal_get_typeFn c_gtk_source_completion_proposal_get_type; ///
private alias c_gtk_source_completion_proposal_get_typed_textFn = extern(C) char* function(GtkSourceCompletionProposal* proposal) nothrow;
__gshared c_gtk_source_completion_proposal_get_typed_textFn c_gtk_source_completion_proposal_get_typed_text; ///

// CompletionProvider
private alias c_gtk_source_completion_provider_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_provider_get_typeFn c_gtk_source_completion_provider_get_type; ///
private alias c_gtk_source_completion_provider_activateFn = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) nothrow;
__gshared c_gtk_source_completion_provider_activateFn c_gtk_source_completion_provider_activate; ///
private alias c_gtk_source_completion_provider_displayFn = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkSourceCompletionCell* cell) nothrow;
__gshared c_gtk_source_completion_provider_displayFn c_gtk_source_completion_provider_display; ///
private alias c_gtk_source_completion_provider_get_priorityFn = extern(C) int function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context) nothrow;
__gshared c_gtk_source_completion_provider_get_priorityFn c_gtk_source_completion_provider_get_priority; ///
private alias c_gtk_source_completion_provider_get_titleFn = extern(C) char* function(GtkSourceCompletionProvider* self) nothrow;
__gshared c_gtk_source_completion_provider_get_titleFn c_gtk_source_completion_provider_get_title; ///
private alias c_gtk_source_completion_provider_is_triggerFn = extern(C) gboolean function(GtkSourceCompletionProvider* self, const(GtkTextIter)* iter, dchar ch) nothrow;
__gshared c_gtk_source_completion_provider_is_triggerFn c_gtk_source_completion_provider_is_trigger; ///
private alias c_gtk_source_completion_provider_key_activatesFn = extern(C) gboolean function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, uint keyval, GdkModifierType state) nothrow;
__gshared c_gtk_source_completion_provider_key_activatesFn c_gtk_source_completion_provider_key_activates; ///
private alias c_gtk_source_completion_provider_list_alternatesFn = extern(C) GPtrArray* function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) nothrow;
__gshared c_gtk_source_completion_provider_list_alternatesFn c_gtk_source_completion_provider_list_alternates; ///
private alias c_gtk_source_completion_provider_populate_asyncFn = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_completion_provider_populate_asyncFn c_gtk_source_completion_provider_populate_async; ///
private alias c_gtk_source_completion_provider_populate_finishFn = extern(C) GListModel* function(GtkSourceCompletionProvider* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gtk_source_completion_provider_populate_finishFn c_gtk_source_completion_provider_populate_finish; ///
private alias c_gtk_source_completion_provider_refilterFn = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GListModel* model) nothrow;
__gshared c_gtk_source_completion_provider_refilterFn c_gtk_source_completion_provider_refilter; ///

// CompletionSnippets
private alias c_gtk_source_completion_snippets_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_snippets_get_typeFn c_gtk_source_completion_snippets_get_type; ///
private alias c_gtk_source_completion_snippets_newFn = extern(C) GtkSourceCompletionSnippets* function() nothrow;
__gshared c_gtk_source_completion_snippets_newFn c_gtk_source_completion_snippets_new; ///

// CompletionWords
private alias c_gtk_source_completion_words_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_completion_words_get_typeFn c_gtk_source_completion_words_get_type; ///
private alias c_gtk_source_completion_words_newFn = extern(C) GtkSourceCompletionWords* function(const(char)* title) nothrow;
__gshared c_gtk_source_completion_words_newFn c_gtk_source_completion_words_new; ///
private alias c_gtk_source_completion_words_registerFn = extern(C) void function(GtkSourceCompletionWords* words, GtkTextBuffer* buffer) nothrow;
__gshared c_gtk_source_completion_words_registerFn c_gtk_source_completion_words_register; ///
private alias c_gtk_source_completion_words_unregisterFn = extern(C) void function(GtkSourceCompletionWords* words, GtkTextBuffer* buffer) nothrow;
__gshared c_gtk_source_completion_words_unregisterFn c_gtk_source_completion_words_unregister; ///

// Encoding
private alias c_gtk_source_encoding_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_encoding_get_typeFn c_gtk_source_encoding_get_type; ///
private alias c_gtk_source_encoding_copyFn = extern(C) GtkSourceEncoding* function(const(GtkSourceEncoding)* enc) nothrow;
__gshared c_gtk_source_encoding_copyFn c_gtk_source_encoding_copy; ///
private alias c_gtk_source_encoding_freeFn = extern(C) void function(GtkSourceEncoding* enc) nothrow;
__gshared c_gtk_source_encoding_freeFn c_gtk_source_encoding_free; ///
private alias c_gtk_source_encoding_get_charsetFn = extern(C) const(char)* function(const(GtkSourceEncoding)* enc) nothrow;
__gshared c_gtk_source_encoding_get_charsetFn c_gtk_source_encoding_get_charset; ///
private alias c_gtk_source_encoding_get_nameFn = extern(C) const(char)* function(const(GtkSourceEncoding)* enc) nothrow;
__gshared c_gtk_source_encoding_get_nameFn c_gtk_source_encoding_get_name; ///
private alias c_gtk_source_encoding_to_stringFn = extern(C) char* function(const(GtkSourceEncoding)* enc) nothrow;
__gshared c_gtk_source_encoding_to_stringFn c_gtk_source_encoding_to_string; ///
private alias c_gtk_source_encoding_get_allFn = extern(C) GSList* function() nothrow;
__gshared c_gtk_source_encoding_get_allFn c_gtk_source_encoding_get_all; ///
private alias c_gtk_source_encoding_get_currentFn = extern(C) const(GtkSourceEncoding)* function() nothrow;
__gshared c_gtk_source_encoding_get_currentFn c_gtk_source_encoding_get_current; ///
private alias c_gtk_source_encoding_get_default_candidatesFn = extern(C) GSList* function() nothrow;
__gshared c_gtk_source_encoding_get_default_candidatesFn c_gtk_source_encoding_get_default_candidates; ///
private alias c_gtk_source_encoding_get_from_charsetFn = extern(C) const(GtkSourceEncoding)* function(const(char)* charset) nothrow;
__gshared c_gtk_source_encoding_get_from_charsetFn c_gtk_source_encoding_get_from_charset; ///
private alias c_gtk_source_encoding_get_utf8Fn = extern(C) const(GtkSourceEncoding)* function() nothrow;
__gshared c_gtk_source_encoding_get_utf8Fn c_gtk_source_encoding_get_utf8; ///

// File
private alias c_gtk_source_file_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_file_get_typeFn c_gtk_source_file_get_type; ///
private alias c_gtk_source_file_newFn = extern(C) GtkSourceFile* function() nothrow;
__gshared c_gtk_source_file_newFn c_gtk_source_file_new; ///
private alias c_gtk_source_file_check_file_on_diskFn = extern(C) void function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_check_file_on_diskFn c_gtk_source_file_check_file_on_disk; ///
private alias c_gtk_source_file_get_compression_typeFn = extern(C) GtkSourceCompressionType function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_get_compression_typeFn c_gtk_source_file_get_compression_type; ///
private alias c_gtk_source_file_get_encodingFn = extern(C) const(GtkSourceEncoding)* function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_get_encodingFn c_gtk_source_file_get_encoding; ///
private alias c_gtk_source_file_get_locationFn = extern(C) GFile* function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_get_locationFn c_gtk_source_file_get_location; ///
private alias c_gtk_source_file_get_newline_typeFn = extern(C) GtkSourceNewlineType function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_get_newline_typeFn c_gtk_source_file_get_newline_type; ///
private alias c_gtk_source_file_is_deletedFn = extern(C) gboolean function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_is_deletedFn c_gtk_source_file_is_deleted; ///
private alias c_gtk_source_file_is_externally_modifiedFn = extern(C) gboolean function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_is_externally_modifiedFn c_gtk_source_file_is_externally_modified; ///
private alias c_gtk_source_file_is_localFn = extern(C) gboolean function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_is_localFn c_gtk_source_file_is_local; ///
private alias c_gtk_source_file_is_readonlyFn = extern(C) gboolean function(GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_is_readonlyFn c_gtk_source_file_is_readonly; ///
private alias c_gtk_source_file_set_locationFn = extern(C) void function(GtkSourceFile* file, GFile* location) nothrow;
__gshared c_gtk_source_file_set_locationFn c_gtk_source_file_set_location; ///
private alias c_gtk_source_file_set_mount_operation_factoryFn = extern(C) void function(GtkSourceFile* file, GtkSourceMountOperationFactory callback, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gtk_source_file_set_mount_operation_factoryFn c_gtk_source_file_set_mount_operation_factory; ///

// FileLoader
private alias c_gtk_source_file_loader_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_file_loader_get_typeFn c_gtk_source_file_loader_get_type; ///
private alias c_gtk_source_file_loader_newFn = extern(C) GtkSourceFileLoader* function(GtkSourceBuffer* buffer, GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_loader_newFn c_gtk_source_file_loader_new; ///
private alias c_gtk_source_file_loader_new_from_streamFn = extern(C) GtkSourceFileLoader* function(GtkSourceBuffer* buffer, GtkSourceFile* file, GInputStream* stream) nothrow;
__gshared c_gtk_source_file_loader_new_from_streamFn c_gtk_source_file_loader_new_from_stream; ///
private alias c_gtk_source_file_loader_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_bufferFn c_gtk_source_file_loader_get_buffer; ///
private alias c_gtk_source_file_loader_get_compression_typeFn = extern(C) GtkSourceCompressionType function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_compression_typeFn c_gtk_source_file_loader_get_compression_type; ///
private alias c_gtk_source_file_loader_get_encodingFn = extern(C) const(GtkSourceEncoding)* function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_encodingFn c_gtk_source_file_loader_get_encoding; ///
private alias c_gtk_source_file_loader_get_fileFn = extern(C) GtkSourceFile* function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_fileFn c_gtk_source_file_loader_get_file; ///
private alias c_gtk_source_file_loader_get_input_streamFn = extern(C) GInputStream* function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_input_streamFn c_gtk_source_file_loader_get_input_stream; ///
private alias c_gtk_source_file_loader_get_locationFn = extern(C) GFile* function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_locationFn c_gtk_source_file_loader_get_location; ///
private alias c_gtk_source_file_loader_get_newline_typeFn = extern(C) GtkSourceNewlineType function(GtkSourceFileLoader* loader) nothrow;
__gshared c_gtk_source_file_loader_get_newline_typeFn c_gtk_source_file_loader_get_newline_type; ///
private alias c_gtk_source_file_loader_load_asyncFn = extern(C) void function(GtkSourceFileLoader* loader, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GDestroyNotify progressCallbackNotify, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_file_loader_load_asyncFn c_gtk_source_file_loader_load_async; ///
private alias c_gtk_source_file_loader_load_finishFn = extern(C) gboolean function(GtkSourceFileLoader* loader, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gtk_source_file_loader_load_finishFn c_gtk_source_file_loader_load_finish; ///
private alias c_gtk_source_file_loader_set_candidate_encodingsFn = extern(C) void function(GtkSourceFileLoader* loader, GSList* candidateEncodings) nothrow;
__gshared c_gtk_source_file_loader_set_candidate_encodingsFn c_gtk_source_file_loader_set_candidate_encodings; ///

// FileSaver
private alias c_gtk_source_file_saver_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_file_saver_get_typeFn c_gtk_source_file_saver_get_type; ///
private alias c_gtk_source_file_saver_newFn = extern(C) GtkSourceFileSaver* function(GtkSourceBuffer* buffer, GtkSourceFile* file) nothrow;
__gshared c_gtk_source_file_saver_newFn c_gtk_source_file_saver_new; ///
private alias c_gtk_source_file_saver_new_with_targetFn = extern(C) GtkSourceFileSaver* function(GtkSourceBuffer* buffer, GtkSourceFile* file, GFile* targetLocation) nothrow;
__gshared c_gtk_source_file_saver_new_with_targetFn c_gtk_source_file_saver_new_with_target; ///
private alias c_gtk_source_file_saver_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_bufferFn c_gtk_source_file_saver_get_buffer; ///
private alias c_gtk_source_file_saver_get_compression_typeFn = extern(C) GtkSourceCompressionType function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_compression_typeFn c_gtk_source_file_saver_get_compression_type; ///
private alias c_gtk_source_file_saver_get_encodingFn = extern(C) const(GtkSourceEncoding)* function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_encodingFn c_gtk_source_file_saver_get_encoding; ///
private alias c_gtk_source_file_saver_get_fileFn = extern(C) GtkSourceFile* function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_fileFn c_gtk_source_file_saver_get_file; ///
private alias c_gtk_source_file_saver_get_flagsFn = extern(C) GtkSourceFileSaverFlags function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_flagsFn c_gtk_source_file_saver_get_flags; ///
private alias c_gtk_source_file_saver_get_locationFn = extern(C) GFile* function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_locationFn c_gtk_source_file_saver_get_location; ///
private alias c_gtk_source_file_saver_get_newline_typeFn = extern(C) GtkSourceNewlineType function(GtkSourceFileSaver* saver) nothrow;
__gshared c_gtk_source_file_saver_get_newline_typeFn c_gtk_source_file_saver_get_newline_type; ///
private alias c_gtk_source_file_saver_save_asyncFn = extern(C) void function(GtkSourceFileSaver* saver, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GDestroyNotify progressCallbackNotify, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_file_saver_save_asyncFn c_gtk_source_file_saver_save_async; ///
private alias c_gtk_source_file_saver_save_finishFn = extern(C) gboolean function(GtkSourceFileSaver* saver, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gtk_source_file_saver_save_finishFn c_gtk_source_file_saver_save_finish; ///
private alias c_gtk_source_file_saver_set_compression_typeFn = extern(C) void function(GtkSourceFileSaver* saver, GtkSourceCompressionType compressionType) nothrow;
__gshared c_gtk_source_file_saver_set_compression_typeFn c_gtk_source_file_saver_set_compression_type; ///
private alias c_gtk_source_file_saver_set_encodingFn = extern(C) void function(GtkSourceFileSaver* saver, const(GtkSourceEncoding)* encoding) nothrow;
__gshared c_gtk_source_file_saver_set_encodingFn c_gtk_source_file_saver_set_encoding; ///
private alias c_gtk_source_file_saver_set_flagsFn = extern(C) void function(GtkSourceFileSaver* saver, GtkSourceFileSaverFlags flags) nothrow;
__gshared c_gtk_source_file_saver_set_flagsFn c_gtk_source_file_saver_set_flags; ///
private alias c_gtk_source_file_saver_set_newline_typeFn = extern(C) void function(GtkSourceFileSaver* saver, GtkSourceNewlineType newlineType) nothrow;
__gshared c_gtk_source_file_saver_set_newline_typeFn c_gtk_source_file_saver_set_newline_type; ///

// Gutter
private alias c_gtk_source_gutter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_gutter_get_typeFn c_gtk_source_gutter_get_type; ///
private alias c_gtk_source_gutter_get_viewFn = extern(C) GtkSourceView* function(GtkSourceGutter* gutter) nothrow;
__gshared c_gtk_source_gutter_get_viewFn c_gtk_source_gutter_get_view; ///
private alias c_gtk_source_gutter_insertFn = extern(C) gboolean function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer, int position) nothrow;
__gshared c_gtk_source_gutter_insertFn c_gtk_source_gutter_insert; ///
private alias c_gtk_source_gutter_removeFn = extern(C) void function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_removeFn c_gtk_source_gutter_remove; ///
private alias c_gtk_source_gutter_reorderFn = extern(C) void function(GtkSourceGutter* gutter, GtkSourceGutterRenderer* renderer, int position) nothrow;
__gshared c_gtk_source_gutter_reorderFn c_gtk_source_gutter_reorder; ///

// GutterLines
private alias c_gtk_source_gutter_lines_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_gutter_lines_get_typeFn c_gtk_source_gutter_lines_get_type; ///
private alias c_gtk_source_gutter_lines_add_classFn = extern(C) void function(GtkSourceGutterLines* lines, uint line, const(char)* name) nothrow;
__gshared c_gtk_source_gutter_lines_add_classFn c_gtk_source_gutter_lines_add_class; ///
private alias c_gtk_source_gutter_lines_add_qclassFn = extern(C) void function(GtkSourceGutterLines* lines, uint line, GQuark qname) nothrow;
__gshared c_gtk_source_gutter_lines_add_qclassFn c_gtk_source_gutter_lines_add_qclass; ///
private alias c_gtk_source_gutter_lines_get_bufferFn = extern(C) GtkTextBuffer* function(GtkSourceGutterLines* lines) nothrow;
__gshared c_gtk_source_gutter_lines_get_bufferFn c_gtk_source_gutter_lines_get_buffer; ///
private alias c_gtk_source_gutter_lines_get_firstFn = extern(C) uint function(GtkSourceGutterLines* lines) nothrow;
__gshared c_gtk_source_gutter_lines_get_firstFn c_gtk_source_gutter_lines_get_first; ///
private alias c_gtk_source_gutter_lines_get_iter_at_lineFn = extern(C) void function(GtkSourceGutterLines* lines, GtkTextIter* iter, uint line) nothrow;
__gshared c_gtk_source_gutter_lines_get_iter_at_lineFn c_gtk_source_gutter_lines_get_iter_at_line; ///
private alias c_gtk_source_gutter_lines_get_lastFn = extern(C) uint function(GtkSourceGutterLines* lines) nothrow;
__gshared c_gtk_source_gutter_lines_get_lastFn c_gtk_source_gutter_lines_get_last; ///
private alias c_gtk_source_gutter_lines_get_line_extentFn = extern(C) void function(GtkSourceGutterLines* lines, uint line, GtkSourceGutterRendererAlignmentMode mode, double* y, double* height) nothrow;
__gshared c_gtk_source_gutter_lines_get_line_extentFn c_gtk_source_gutter_lines_get_line_extent; ///
private alias c_gtk_source_gutter_lines_get_line_yrangeFn = extern(C) void function(GtkSourceGutterLines* lines, uint line, GtkSourceGutterRendererAlignmentMode mode, int* y, int* height) nothrow;
__gshared c_gtk_source_gutter_lines_get_line_yrangeFn c_gtk_source_gutter_lines_get_line_yrange; ///
private alias c_gtk_source_gutter_lines_get_viewFn = extern(C) GtkTextView* function(GtkSourceGutterLines* lines) nothrow;
__gshared c_gtk_source_gutter_lines_get_viewFn c_gtk_source_gutter_lines_get_view; ///
private alias c_gtk_source_gutter_lines_has_any_classFn = extern(C) gboolean function(GtkSourceGutterLines* lines, uint line) nothrow;
__gshared c_gtk_source_gutter_lines_has_any_classFn c_gtk_source_gutter_lines_has_any_class; ///
private alias c_gtk_source_gutter_lines_has_classFn = extern(C) gboolean function(GtkSourceGutterLines* lines, uint line, const(char)* name) nothrow;
__gshared c_gtk_source_gutter_lines_has_classFn c_gtk_source_gutter_lines_has_class; ///
private alias c_gtk_source_gutter_lines_has_qclassFn = extern(C) gboolean function(GtkSourceGutterLines* lines, uint line, GQuark qname) nothrow;
__gshared c_gtk_source_gutter_lines_has_qclassFn c_gtk_source_gutter_lines_has_qclass; ///
private alias c_gtk_source_gutter_lines_is_cursorFn = extern(C) gboolean function(GtkSourceGutterLines* lines, uint line) nothrow;
__gshared c_gtk_source_gutter_lines_is_cursorFn c_gtk_source_gutter_lines_is_cursor; ///
private alias c_gtk_source_gutter_lines_is_prelitFn = extern(C) gboolean function(GtkSourceGutterLines* lines, uint line) nothrow;
__gshared c_gtk_source_gutter_lines_is_prelitFn c_gtk_source_gutter_lines_is_prelit; ///
private alias c_gtk_source_gutter_lines_is_selectedFn = extern(C) gboolean function(GtkSourceGutterLines* lines, uint line) nothrow;
__gshared c_gtk_source_gutter_lines_is_selectedFn c_gtk_source_gutter_lines_is_selected; ///
private alias c_gtk_source_gutter_lines_remove_classFn = extern(C) void function(GtkSourceGutterLines* lines, uint line, const(char)* name) nothrow;
__gshared c_gtk_source_gutter_lines_remove_classFn c_gtk_source_gutter_lines_remove_class; ///
private alias c_gtk_source_gutter_lines_remove_qclassFn = extern(C) void function(GtkSourceGutterLines* lines, uint line, GQuark qname) nothrow;
__gshared c_gtk_source_gutter_lines_remove_qclassFn c_gtk_source_gutter_lines_remove_qclass; ///

// GutterRenderer
private alias c_gtk_source_gutter_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_gutter_renderer_get_typeFn c_gtk_source_gutter_renderer_get_type; ///
private alias c_gtk_source_gutter_renderer_activateFn = extern(C) void function(GtkSourceGutterRenderer* renderer, const(GtkTextIter)* iter, const(GdkRectangle)* area, uint button, GdkModifierType state, int nPresses) nothrow;
__gshared c_gtk_source_gutter_renderer_activateFn c_gtk_source_gutter_renderer_activate; ///
private alias c_gtk_source_gutter_renderer_align_cellFn = extern(C) void function(GtkSourceGutterRenderer* renderer, uint line, float width, float height, float* x, float* y) nothrow;
__gshared c_gtk_source_gutter_renderer_align_cellFn c_gtk_source_gutter_renderer_align_cell; ///
private alias c_gtk_source_gutter_renderer_get_alignment_modeFn = extern(C) GtkSourceGutterRendererAlignmentMode function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_alignment_modeFn c_gtk_source_gutter_renderer_get_alignment_mode; ///
private alias c_gtk_source_gutter_renderer_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_bufferFn c_gtk_source_gutter_renderer_get_buffer; ///
private alias c_gtk_source_gutter_renderer_get_viewFn = extern(C) GtkSourceView* function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_viewFn c_gtk_source_gutter_renderer_get_view; ///
private alias c_gtk_source_gutter_renderer_get_xalignFn = extern(C) float function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_xalignFn c_gtk_source_gutter_renderer_get_xalign; ///
private alias c_gtk_source_gutter_renderer_get_xpadFn = extern(C) int function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_xpadFn c_gtk_source_gutter_renderer_get_xpad; ///
private alias c_gtk_source_gutter_renderer_get_yalignFn = extern(C) float function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_yalignFn c_gtk_source_gutter_renderer_get_yalign; ///
private alias c_gtk_source_gutter_renderer_get_ypadFn = extern(C) int function(GtkSourceGutterRenderer* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_get_ypadFn c_gtk_source_gutter_renderer_get_ypad; ///
private alias c_gtk_source_gutter_renderer_query_activatableFn = extern(C) gboolean function(GtkSourceGutterRenderer* renderer, const(GtkTextIter)* iter, const(GdkRectangle)* area) nothrow;
__gshared c_gtk_source_gutter_renderer_query_activatableFn c_gtk_source_gutter_renderer_query_activatable; ///
private alias c_gtk_source_gutter_renderer_set_alignment_modeFn = extern(C) void function(GtkSourceGutterRenderer* renderer, GtkSourceGutterRendererAlignmentMode mode) nothrow;
__gshared c_gtk_source_gutter_renderer_set_alignment_modeFn c_gtk_source_gutter_renderer_set_alignment_mode; ///
private alias c_gtk_source_gutter_renderer_set_xalignFn = extern(C) void function(GtkSourceGutterRenderer* renderer, float xalign) nothrow;
__gshared c_gtk_source_gutter_renderer_set_xalignFn c_gtk_source_gutter_renderer_set_xalign; ///
private alias c_gtk_source_gutter_renderer_set_xpadFn = extern(C) void function(GtkSourceGutterRenderer* renderer, int xpad) nothrow;
__gshared c_gtk_source_gutter_renderer_set_xpadFn c_gtk_source_gutter_renderer_set_xpad; ///
private alias c_gtk_source_gutter_renderer_set_yalignFn = extern(C) void function(GtkSourceGutterRenderer* renderer, float yalign) nothrow;
__gshared c_gtk_source_gutter_renderer_set_yalignFn c_gtk_source_gutter_renderer_set_yalign; ///
private alias c_gtk_source_gutter_renderer_set_ypadFn = extern(C) void function(GtkSourceGutterRenderer* renderer, int ypad) nothrow;
__gshared c_gtk_source_gutter_renderer_set_ypadFn c_gtk_source_gutter_renderer_set_ypad; ///

// GutterRendererPixbuf
private alias c_gtk_source_gutter_renderer_pixbuf_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_get_typeFn c_gtk_source_gutter_renderer_pixbuf_get_type; ///
private alias c_gtk_source_gutter_renderer_pixbuf_newFn = extern(C) GtkSourceGutterRenderer* function() nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_newFn c_gtk_source_gutter_renderer_pixbuf_new; ///
private alias c_gtk_source_gutter_renderer_pixbuf_get_giconFn = extern(C) GIcon* function(GtkSourceGutterRendererPixbuf* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_get_giconFn c_gtk_source_gutter_renderer_pixbuf_get_gicon; ///
private alias c_gtk_source_gutter_renderer_pixbuf_get_icon_nameFn = extern(C) const(char)* function(GtkSourceGutterRendererPixbuf* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_get_icon_nameFn c_gtk_source_gutter_renderer_pixbuf_get_icon_name; ///
private alias c_gtk_source_gutter_renderer_pixbuf_get_paintableFn = extern(C) GdkPaintable* function(GtkSourceGutterRendererPixbuf* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_get_paintableFn c_gtk_source_gutter_renderer_pixbuf_get_paintable; ///
private alias c_gtk_source_gutter_renderer_pixbuf_get_pixbufFn = extern(C) GdkPixbuf* function(GtkSourceGutterRendererPixbuf* renderer) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_get_pixbufFn c_gtk_source_gutter_renderer_pixbuf_get_pixbuf; ///
private alias c_gtk_source_gutter_renderer_pixbuf_overlay_paintableFn = extern(C) void function(GtkSourceGutterRendererPixbuf* renderer, GdkPaintable* paintable) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_overlay_paintableFn c_gtk_source_gutter_renderer_pixbuf_overlay_paintable; ///
private alias c_gtk_source_gutter_renderer_pixbuf_set_giconFn = extern(C) void function(GtkSourceGutterRendererPixbuf* renderer, GIcon* icon) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_set_giconFn c_gtk_source_gutter_renderer_pixbuf_set_gicon; ///
private alias c_gtk_source_gutter_renderer_pixbuf_set_icon_nameFn = extern(C) void function(GtkSourceGutterRendererPixbuf* renderer, const(char)* iconName) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_set_icon_nameFn c_gtk_source_gutter_renderer_pixbuf_set_icon_name; ///
private alias c_gtk_source_gutter_renderer_pixbuf_set_paintableFn = extern(C) void function(GtkSourceGutterRendererPixbuf* renderer, GdkPaintable* paintable) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_set_paintableFn c_gtk_source_gutter_renderer_pixbuf_set_paintable; ///
private alias c_gtk_source_gutter_renderer_pixbuf_set_pixbufFn = extern(C) void function(GtkSourceGutterRendererPixbuf* renderer, GdkPixbuf* pixbuf) nothrow;
__gshared c_gtk_source_gutter_renderer_pixbuf_set_pixbufFn c_gtk_source_gutter_renderer_pixbuf_set_pixbuf; ///

// GutterRendererText
private alias c_gtk_source_gutter_renderer_text_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_gutter_renderer_text_get_typeFn c_gtk_source_gutter_renderer_text_get_type; ///
private alias c_gtk_source_gutter_renderer_text_newFn = extern(C) GtkSourceGutterRenderer* function() nothrow;
__gshared c_gtk_source_gutter_renderer_text_newFn c_gtk_source_gutter_renderer_text_new; ///
private alias c_gtk_source_gutter_renderer_text_measureFn = extern(C) void function(GtkSourceGutterRendererText* renderer, const(char)* text, int* width, int* height) nothrow;
__gshared c_gtk_source_gutter_renderer_text_measureFn c_gtk_source_gutter_renderer_text_measure; ///
private alias c_gtk_source_gutter_renderer_text_measure_markupFn = extern(C) void function(GtkSourceGutterRendererText* renderer, const(char)* markup, int* width, int* height) nothrow;
__gshared c_gtk_source_gutter_renderer_text_measure_markupFn c_gtk_source_gutter_renderer_text_measure_markup; ///
private alias c_gtk_source_gutter_renderer_text_set_markupFn = extern(C) void function(GtkSourceGutterRendererText* renderer, const(char)* markup, int length) nothrow;
__gshared c_gtk_source_gutter_renderer_text_set_markupFn c_gtk_source_gutter_renderer_text_set_markup; ///
private alias c_gtk_source_gutter_renderer_text_set_textFn = extern(C) void function(GtkSourceGutterRendererText* renderer, const(char)* text, int length) nothrow;
__gshared c_gtk_source_gutter_renderer_text_set_textFn c_gtk_source_gutter_renderer_text_set_text; ///

// Hover
private alias c_gtk_source_hover_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_hover_get_typeFn c_gtk_source_hover_get_type; ///
private alias c_gtk_source_hover_add_providerFn = extern(C) void function(GtkSourceHover* self, GtkSourceHoverProvider* provider) nothrow;
__gshared c_gtk_source_hover_add_providerFn c_gtk_source_hover_add_provider; ///
private alias c_gtk_source_hover_remove_providerFn = extern(C) void function(GtkSourceHover* self, GtkSourceHoverProvider* provider) nothrow;
__gshared c_gtk_source_hover_remove_providerFn c_gtk_source_hover_remove_provider; ///

// HoverContext
private alias c_gtk_source_hover_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_hover_context_get_typeFn c_gtk_source_hover_context_get_type; ///
private alias c_gtk_source_hover_context_get_boundsFn = extern(C) gboolean function(GtkSourceHoverContext* self, GtkTextIter* begin, GtkTextIter* end) nothrow;
__gshared c_gtk_source_hover_context_get_boundsFn c_gtk_source_hover_context_get_bounds; ///
private alias c_gtk_source_hover_context_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceHoverContext* self) nothrow;
__gshared c_gtk_source_hover_context_get_bufferFn c_gtk_source_hover_context_get_buffer; ///
private alias c_gtk_source_hover_context_get_iterFn = extern(C) gboolean function(GtkSourceHoverContext* self, GtkTextIter* iter) nothrow;
__gshared c_gtk_source_hover_context_get_iterFn c_gtk_source_hover_context_get_iter; ///
private alias c_gtk_source_hover_context_get_viewFn = extern(C) GtkSourceView* function(GtkSourceHoverContext* self) nothrow;
__gshared c_gtk_source_hover_context_get_viewFn c_gtk_source_hover_context_get_view; ///

// HoverDisplay
private alias c_gtk_source_hover_display_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_hover_display_get_typeFn c_gtk_source_hover_display_get_type; ///
private alias c_gtk_source_hover_display_appendFn = extern(C) void function(GtkSourceHoverDisplay* self, GtkWidget* child) nothrow;
__gshared c_gtk_source_hover_display_appendFn c_gtk_source_hover_display_append; ///
private alias c_gtk_source_hover_display_insert_afterFn = extern(C) void function(GtkSourceHoverDisplay* self, GtkWidget* child, GtkWidget* sibling) nothrow;
__gshared c_gtk_source_hover_display_insert_afterFn c_gtk_source_hover_display_insert_after; ///
private alias c_gtk_source_hover_display_prependFn = extern(C) void function(GtkSourceHoverDisplay* self, GtkWidget* child) nothrow;
__gshared c_gtk_source_hover_display_prependFn c_gtk_source_hover_display_prepend; ///
private alias c_gtk_source_hover_display_removeFn = extern(C) void function(GtkSourceHoverDisplay* self, GtkWidget* child) nothrow;
__gshared c_gtk_source_hover_display_removeFn c_gtk_source_hover_display_remove; ///

// HoverProvider
private alias c_gtk_source_hover_provider_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_hover_provider_get_typeFn c_gtk_source_hover_provider_get_type; ///
private alias c_gtk_source_hover_provider_populate_asyncFn = extern(C) void function(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_hover_provider_populate_asyncFn c_gtk_source_hover_provider_populate_async; ///
private alias c_gtk_source_hover_provider_populate_finishFn = extern(C) gboolean function(GtkSourceHoverProvider* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gtk_source_hover_provider_populate_finishFn c_gtk_source_hover_provider_populate_finish; ///

// Indenter
private alias c_gtk_source_indenter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_indenter_get_typeFn c_gtk_source_indenter_get_type; ///
private alias c_gtk_source_indenter_indentFn = extern(C) void function(GtkSourceIndenter* self, GtkSourceView* view, GtkTextIter* iter) nothrow;
__gshared c_gtk_source_indenter_indentFn c_gtk_source_indenter_indent; ///
private alias c_gtk_source_indenter_is_triggerFn = extern(C) gboolean function(GtkSourceIndenter* self, GtkSourceView* view, const(GtkTextIter)* location, GdkModifierType state, uint keyval) nothrow;
__gshared c_gtk_source_indenter_is_triggerFn c_gtk_source_indenter_is_trigger; ///

// Language
private alias c_gtk_source_language_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_language_get_typeFn c_gtk_source_language_get_type; ///
private alias c_gtk_source_language_get_globsFn = extern(C) char** function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_globsFn c_gtk_source_language_get_globs; ///
private alias c_gtk_source_language_get_hiddenFn = extern(C) gboolean function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_hiddenFn c_gtk_source_language_get_hidden; ///
private alias c_gtk_source_language_get_idFn = extern(C) const(char)* function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_idFn c_gtk_source_language_get_id; ///
private alias c_gtk_source_language_get_metadataFn = extern(C) const(char)* function(GtkSourceLanguage* language, const(char)* name) nothrow;
__gshared c_gtk_source_language_get_metadataFn c_gtk_source_language_get_metadata; ///
private alias c_gtk_source_language_get_mime_typesFn = extern(C) char** function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_mime_typesFn c_gtk_source_language_get_mime_types; ///
private alias c_gtk_source_language_get_nameFn = extern(C) const(char)* function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_nameFn c_gtk_source_language_get_name; ///
private alias c_gtk_source_language_get_sectionFn = extern(C) const(char)* function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_sectionFn c_gtk_source_language_get_section; ///
private alias c_gtk_source_language_get_style_fallbackFn = extern(C) const(char)* function(GtkSourceLanguage* language, const(char)* styleId) nothrow;
__gshared c_gtk_source_language_get_style_fallbackFn c_gtk_source_language_get_style_fallback; ///
private alias c_gtk_source_language_get_style_idsFn = extern(C) char** function(GtkSourceLanguage* language) nothrow;
__gshared c_gtk_source_language_get_style_idsFn c_gtk_source_language_get_style_ids; ///
private alias c_gtk_source_language_get_style_nameFn = extern(C) const(char)* function(GtkSourceLanguage* language, const(char)* styleId) nothrow;
__gshared c_gtk_source_language_get_style_nameFn c_gtk_source_language_get_style_name; ///

// LanguageManager
private alias c_gtk_source_language_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_language_manager_get_typeFn c_gtk_source_language_manager_get_type; ///
private alias c_gtk_source_language_manager_newFn = extern(C) GtkSourceLanguageManager* function() nothrow;
__gshared c_gtk_source_language_manager_newFn c_gtk_source_language_manager_new; ///
private alias c_gtk_source_language_manager_get_defaultFn = extern(C) GtkSourceLanguageManager* function() nothrow;
__gshared c_gtk_source_language_manager_get_defaultFn c_gtk_source_language_manager_get_default; ///
private alias c_gtk_source_language_manager_append_search_pathFn = extern(C) void function(GtkSourceLanguageManager* lm, const(char)* path) nothrow;
__gshared c_gtk_source_language_manager_append_search_pathFn c_gtk_source_language_manager_append_search_path; ///
private alias c_gtk_source_language_manager_get_languageFn = extern(C) GtkSourceLanguage* function(GtkSourceLanguageManager* lm, const(char)* id) nothrow;
__gshared c_gtk_source_language_manager_get_languageFn c_gtk_source_language_manager_get_language; ///
private alias c_gtk_source_language_manager_get_language_idsFn = extern(C) const(char*)* function(GtkSourceLanguageManager* lm) nothrow;
__gshared c_gtk_source_language_manager_get_language_idsFn c_gtk_source_language_manager_get_language_ids; ///
private alias c_gtk_source_language_manager_get_search_pathFn = extern(C) const(char*)* function(GtkSourceLanguageManager* lm) nothrow;
__gshared c_gtk_source_language_manager_get_search_pathFn c_gtk_source_language_manager_get_search_path; ///
private alias c_gtk_source_language_manager_guess_languageFn = extern(C) GtkSourceLanguage* function(GtkSourceLanguageManager* lm, const(char)* filename, const(char)* contentType) nothrow;
__gshared c_gtk_source_language_manager_guess_languageFn c_gtk_source_language_manager_guess_language; ///
private alias c_gtk_source_language_manager_prepend_search_pathFn = extern(C) void function(GtkSourceLanguageManager* lm, const(char)* path) nothrow;
__gshared c_gtk_source_language_manager_prepend_search_pathFn c_gtk_source_language_manager_prepend_search_path; ///
private alias c_gtk_source_language_manager_set_search_pathFn = extern(C) void function(GtkSourceLanguageManager* lm, const(char*)* dirs) nothrow;
__gshared c_gtk_source_language_manager_set_search_pathFn c_gtk_source_language_manager_set_search_path; ///

// Map
private alias c_gtk_source_map_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_map_get_typeFn c_gtk_source_map_get_type; ///
private alias c_gtk_source_map_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_gtk_source_map_newFn c_gtk_source_map_new; ///
private alias c_gtk_source_map_get_viewFn = extern(C) GtkSourceView* function(GtkSourceMap* map) nothrow;
__gshared c_gtk_source_map_get_viewFn c_gtk_source_map_get_view; ///
private alias c_gtk_source_map_set_viewFn = extern(C) void function(GtkSourceMap* map, GtkSourceView* view) nothrow;
__gshared c_gtk_source_map_set_viewFn c_gtk_source_map_set_view; ///

// Mark
private alias c_gtk_source_mark_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_mark_get_typeFn c_gtk_source_mark_get_type; ///
private alias c_gtk_source_mark_newFn = extern(C) GtkSourceMark* function(const(char)* name, const(char)* category) nothrow;
__gshared c_gtk_source_mark_newFn c_gtk_source_mark_new; ///
private alias c_gtk_source_mark_get_categoryFn = extern(C) const(char)* function(GtkSourceMark* mark) nothrow;
__gshared c_gtk_source_mark_get_categoryFn c_gtk_source_mark_get_category; ///
private alias c_gtk_source_mark_nextFn = extern(C) GtkSourceMark* function(GtkSourceMark* mark, const(char)* category) nothrow;
__gshared c_gtk_source_mark_nextFn c_gtk_source_mark_next; ///
private alias c_gtk_source_mark_prevFn = extern(C) GtkSourceMark* function(GtkSourceMark* mark, const(char)* category) nothrow;
__gshared c_gtk_source_mark_prevFn c_gtk_source_mark_prev; ///

// MarkAttributes
private alias c_gtk_source_mark_attributes_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_mark_attributes_get_typeFn c_gtk_source_mark_attributes_get_type; ///
private alias c_gtk_source_mark_attributes_newFn = extern(C) GtkSourceMarkAttributes* function() nothrow;
__gshared c_gtk_source_mark_attributes_newFn c_gtk_source_mark_attributes_new; ///
private alias c_gtk_source_mark_attributes_get_backgroundFn = extern(C) gboolean function(GtkSourceMarkAttributes* attributes, GdkRGBA* background) nothrow;
__gshared c_gtk_source_mark_attributes_get_backgroundFn c_gtk_source_mark_attributes_get_background; ///
private alias c_gtk_source_mark_attributes_get_giconFn = extern(C) GIcon* function(GtkSourceMarkAttributes* attributes) nothrow;
__gshared c_gtk_source_mark_attributes_get_giconFn c_gtk_source_mark_attributes_get_gicon; ///
private alias c_gtk_source_mark_attributes_get_icon_nameFn = extern(C) const(char)* function(GtkSourceMarkAttributes* attributes) nothrow;
__gshared c_gtk_source_mark_attributes_get_icon_nameFn c_gtk_source_mark_attributes_get_icon_name; ///
private alias c_gtk_source_mark_attributes_get_pixbufFn = extern(C) const(GdkPixbuf)* function(GtkSourceMarkAttributes* attributes) nothrow;
__gshared c_gtk_source_mark_attributes_get_pixbufFn c_gtk_source_mark_attributes_get_pixbuf; ///
private alias c_gtk_source_mark_attributes_get_tooltip_markupFn = extern(C) char* function(GtkSourceMarkAttributes* attributes, GtkSourceMark* mark) nothrow;
__gshared c_gtk_source_mark_attributes_get_tooltip_markupFn c_gtk_source_mark_attributes_get_tooltip_markup; ///
private alias c_gtk_source_mark_attributes_get_tooltip_textFn = extern(C) char* function(GtkSourceMarkAttributes* attributes, GtkSourceMark* mark) nothrow;
__gshared c_gtk_source_mark_attributes_get_tooltip_textFn c_gtk_source_mark_attributes_get_tooltip_text; ///
private alias c_gtk_source_mark_attributes_render_iconFn = extern(C) GdkPaintable* function(GtkSourceMarkAttributes* attributes, GtkWidget* widget, int size) nothrow;
__gshared c_gtk_source_mark_attributes_render_iconFn c_gtk_source_mark_attributes_render_icon; ///
private alias c_gtk_source_mark_attributes_set_backgroundFn = extern(C) void function(GtkSourceMarkAttributes* attributes, const(GdkRGBA)* background) nothrow;
__gshared c_gtk_source_mark_attributes_set_backgroundFn c_gtk_source_mark_attributes_set_background; ///
private alias c_gtk_source_mark_attributes_set_giconFn = extern(C) void function(GtkSourceMarkAttributes* attributes, GIcon* gicon) nothrow;
__gshared c_gtk_source_mark_attributes_set_giconFn c_gtk_source_mark_attributes_set_gicon; ///
private alias c_gtk_source_mark_attributes_set_icon_nameFn = extern(C) void function(GtkSourceMarkAttributes* attributes, const(char)* iconName) nothrow;
__gshared c_gtk_source_mark_attributes_set_icon_nameFn c_gtk_source_mark_attributes_set_icon_name; ///
private alias c_gtk_source_mark_attributes_set_pixbufFn = extern(C) void function(GtkSourceMarkAttributes* attributes, const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gtk_source_mark_attributes_set_pixbufFn c_gtk_source_mark_attributes_set_pixbuf; ///

// PrintCompositor
private alias c_gtk_source_print_compositor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_print_compositor_get_typeFn c_gtk_source_print_compositor_get_type; ///
private alias c_gtk_source_print_compositor_newFn = extern(C) GtkSourcePrintCompositor* function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_print_compositor_newFn c_gtk_source_print_compositor_new; ///
private alias c_gtk_source_print_compositor_new_from_viewFn = extern(C) GtkSourcePrintCompositor* function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_print_compositor_new_from_viewFn c_gtk_source_print_compositor_new_from_view; ///
private alias c_gtk_source_print_compositor_draw_pageFn = extern(C) void function(GtkSourcePrintCompositor* compositor, GtkPrintContext* context, int pageNr) nothrow;
__gshared c_gtk_source_print_compositor_draw_pageFn c_gtk_source_print_compositor_draw_page; ///
private alias c_gtk_source_print_compositor_get_body_font_nameFn = extern(C) char* function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_body_font_nameFn c_gtk_source_print_compositor_get_body_font_name; ///
private alias c_gtk_source_print_compositor_get_bottom_marginFn = extern(C) double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_get_bottom_marginFn c_gtk_source_print_compositor_get_bottom_margin; ///
private alias c_gtk_source_print_compositor_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_bufferFn c_gtk_source_print_compositor_get_buffer; ///
private alias c_gtk_source_print_compositor_get_footer_font_nameFn = extern(C) char* function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_footer_font_nameFn c_gtk_source_print_compositor_get_footer_font_name; ///
private alias c_gtk_source_print_compositor_get_header_font_nameFn = extern(C) char* function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_header_font_nameFn c_gtk_source_print_compositor_get_header_font_name; ///
private alias c_gtk_source_print_compositor_get_highlight_syntaxFn = extern(C) gboolean function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_highlight_syntaxFn c_gtk_source_print_compositor_get_highlight_syntax; ///
private alias c_gtk_source_print_compositor_get_left_marginFn = extern(C) double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_get_left_marginFn c_gtk_source_print_compositor_get_left_margin; ///
private alias c_gtk_source_print_compositor_get_line_numbers_font_nameFn = extern(C) char* function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_line_numbers_font_nameFn c_gtk_source_print_compositor_get_line_numbers_font_name; ///
private alias c_gtk_source_print_compositor_get_n_pagesFn = extern(C) int function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_n_pagesFn c_gtk_source_print_compositor_get_n_pages; ///
private alias c_gtk_source_print_compositor_get_pagination_progressFn = extern(C) double function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_pagination_progressFn c_gtk_source_print_compositor_get_pagination_progress; ///
private alias c_gtk_source_print_compositor_get_print_footerFn = extern(C) gboolean function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_print_footerFn c_gtk_source_print_compositor_get_print_footer; ///
private alias c_gtk_source_print_compositor_get_print_headerFn = extern(C) gboolean function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_print_headerFn c_gtk_source_print_compositor_get_print_header; ///
private alias c_gtk_source_print_compositor_get_print_line_numbersFn = extern(C) uint function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_print_line_numbersFn c_gtk_source_print_compositor_get_print_line_numbers; ///
private alias c_gtk_source_print_compositor_get_right_marginFn = extern(C) double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_get_right_marginFn c_gtk_source_print_compositor_get_right_margin; ///
private alias c_gtk_source_print_compositor_get_tab_widthFn = extern(C) uint function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_tab_widthFn c_gtk_source_print_compositor_get_tab_width; ///
private alias c_gtk_source_print_compositor_get_top_marginFn = extern(C) double function(GtkSourcePrintCompositor* compositor, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_get_top_marginFn c_gtk_source_print_compositor_get_top_margin; ///
private alias c_gtk_source_print_compositor_get_wrap_modeFn = extern(C) GtkWrapMode function(GtkSourcePrintCompositor* compositor) nothrow;
__gshared c_gtk_source_print_compositor_get_wrap_modeFn c_gtk_source_print_compositor_get_wrap_mode; ///
private alias c_gtk_source_print_compositor_ignore_tagFn = extern(C) void function(GtkSourcePrintCompositor* compositor, GtkTextTag* tag) nothrow;
__gshared c_gtk_source_print_compositor_ignore_tagFn c_gtk_source_print_compositor_ignore_tag; ///
private alias c_gtk_source_print_compositor_paginateFn = extern(C) gboolean function(GtkSourcePrintCompositor* compositor, GtkPrintContext* context) nothrow;
__gshared c_gtk_source_print_compositor_paginateFn c_gtk_source_print_compositor_paginate; ///
private alias c_gtk_source_print_compositor_set_body_font_nameFn = extern(C) void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) nothrow;
__gshared c_gtk_source_print_compositor_set_body_font_nameFn c_gtk_source_print_compositor_set_body_font_name; ///
private alias c_gtk_source_print_compositor_set_bottom_marginFn = extern(C) void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_set_bottom_marginFn c_gtk_source_print_compositor_set_bottom_margin; ///
private alias c_gtk_source_print_compositor_set_footer_font_nameFn = extern(C) void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) nothrow;
__gshared c_gtk_source_print_compositor_set_footer_font_nameFn c_gtk_source_print_compositor_set_footer_font_name; ///
private alias c_gtk_source_print_compositor_set_footer_formatFn = extern(C) void function(GtkSourcePrintCompositor* compositor, gboolean separator, const(char)* left, const(char)* center, const(char)* right) nothrow;
__gshared c_gtk_source_print_compositor_set_footer_formatFn c_gtk_source_print_compositor_set_footer_format; ///
private alias c_gtk_source_print_compositor_set_header_font_nameFn = extern(C) void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) nothrow;
__gshared c_gtk_source_print_compositor_set_header_font_nameFn c_gtk_source_print_compositor_set_header_font_name; ///
private alias c_gtk_source_print_compositor_set_header_formatFn = extern(C) void function(GtkSourcePrintCompositor* compositor, gboolean separator, const(char)* left, const(char)* center, const(char)* right) nothrow;
__gshared c_gtk_source_print_compositor_set_header_formatFn c_gtk_source_print_compositor_set_header_format; ///
private alias c_gtk_source_print_compositor_set_highlight_syntaxFn = extern(C) void function(GtkSourcePrintCompositor* compositor, gboolean highlight) nothrow;
__gshared c_gtk_source_print_compositor_set_highlight_syntaxFn c_gtk_source_print_compositor_set_highlight_syntax; ///
private alias c_gtk_source_print_compositor_set_left_marginFn = extern(C) void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_set_left_marginFn c_gtk_source_print_compositor_set_left_margin; ///
private alias c_gtk_source_print_compositor_set_line_numbers_font_nameFn = extern(C) void function(GtkSourcePrintCompositor* compositor, const(char)* fontName) nothrow;
__gshared c_gtk_source_print_compositor_set_line_numbers_font_nameFn c_gtk_source_print_compositor_set_line_numbers_font_name; ///
private alias c_gtk_source_print_compositor_set_print_footerFn = extern(C) void function(GtkSourcePrintCompositor* compositor, gboolean print) nothrow;
__gshared c_gtk_source_print_compositor_set_print_footerFn c_gtk_source_print_compositor_set_print_footer; ///
private alias c_gtk_source_print_compositor_set_print_headerFn = extern(C) void function(GtkSourcePrintCompositor* compositor, gboolean print) nothrow;
__gshared c_gtk_source_print_compositor_set_print_headerFn c_gtk_source_print_compositor_set_print_header; ///
private alias c_gtk_source_print_compositor_set_print_line_numbersFn = extern(C) void function(GtkSourcePrintCompositor* compositor, uint interval) nothrow;
__gshared c_gtk_source_print_compositor_set_print_line_numbersFn c_gtk_source_print_compositor_set_print_line_numbers; ///
private alias c_gtk_source_print_compositor_set_right_marginFn = extern(C) void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_set_right_marginFn c_gtk_source_print_compositor_set_right_margin; ///
private alias c_gtk_source_print_compositor_set_tab_widthFn = extern(C) void function(GtkSourcePrintCompositor* compositor, uint width) nothrow;
__gshared c_gtk_source_print_compositor_set_tab_widthFn c_gtk_source_print_compositor_set_tab_width; ///
private alias c_gtk_source_print_compositor_set_top_marginFn = extern(C) void function(GtkSourcePrintCompositor* compositor, double margin, GtkUnit unit) nothrow;
__gshared c_gtk_source_print_compositor_set_top_marginFn c_gtk_source_print_compositor_set_top_margin; ///
private alias c_gtk_source_print_compositor_set_wrap_modeFn = extern(C) void function(GtkSourcePrintCompositor* compositor, GtkWrapMode wrapMode) nothrow;
__gshared c_gtk_source_print_compositor_set_wrap_modeFn c_gtk_source_print_compositor_set_wrap_mode; ///

// Region
private alias c_gtk_source_region_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_region_get_typeFn c_gtk_source_region_get_type; ///
private alias c_gtk_source_region_newFn = extern(C) GtkSourceRegion* function(GtkTextBuffer* buffer) nothrow;
__gshared c_gtk_source_region_newFn c_gtk_source_region_new; ///
private alias c_gtk_source_region_add_regionFn = extern(C) void function(GtkSourceRegion* region, GtkSourceRegion* regionToAdd) nothrow;
__gshared c_gtk_source_region_add_regionFn c_gtk_source_region_add_region; ///
private alias c_gtk_source_region_add_subregionFn = extern(C) void function(GtkSourceRegion* region, const(GtkTextIter)* Start, const(GtkTextIter)* End) nothrow;
__gshared c_gtk_source_region_add_subregionFn c_gtk_source_region_add_subregion; ///
private alias c_gtk_source_region_get_boundsFn = extern(C) gboolean function(GtkSourceRegion* region, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_region_get_boundsFn c_gtk_source_region_get_bounds; ///
private alias c_gtk_source_region_get_bufferFn = extern(C) GtkTextBuffer* function(GtkSourceRegion* region) nothrow;
__gshared c_gtk_source_region_get_bufferFn c_gtk_source_region_get_buffer; ///
private alias c_gtk_source_region_get_start_region_iterFn = extern(C) void function(GtkSourceRegion* region, GtkSourceRegionIter* iter) nothrow;
__gshared c_gtk_source_region_get_start_region_iterFn c_gtk_source_region_get_start_region_iter; ///
private alias c_gtk_source_region_intersect_regionFn = extern(C) GtkSourceRegion* function(GtkSourceRegion* region1, GtkSourceRegion* region2) nothrow;
__gshared c_gtk_source_region_intersect_regionFn c_gtk_source_region_intersect_region; ///
private alias c_gtk_source_region_intersect_subregionFn = extern(C) GtkSourceRegion* function(GtkSourceRegion* region, const(GtkTextIter)* Start, const(GtkTextIter)* End) nothrow;
__gshared c_gtk_source_region_intersect_subregionFn c_gtk_source_region_intersect_subregion; ///
private alias c_gtk_source_region_is_emptyFn = extern(C) gboolean function(GtkSourceRegion* region) nothrow;
__gshared c_gtk_source_region_is_emptyFn c_gtk_source_region_is_empty; ///
private alias c_gtk_source_region_subtract_regionFn = extern(C) void function(GtkSourceRegion* region, GtkSourceRegion* regionToSubtract) nothrow;
__gshared c_gtk_source_region_subtract_regionFn c_gtk_source_region_subtract_region; ///
private alias c_gtk_source_region_subtract_subregionFn = extern(C) void function(GtkSourceRegion* region, const(GtkTextIter)* Start, const(GtkTextIter)* End) nothrow;
__gshared c_gtk_source_region_subtract_subregionFn c_gtk_source_region_subtract_subregion; ///
private alias c_gtk_source_region_to_stringFn = extern(C) char* function(GtkSourceRegion* region) nothrow;
__gshared c_gtk_source_region_to_stringFn c_gtk_source_region_to_string; ///

// RegionIter
private alias c_gtk_source_region_iter_get_subregionFn = extern(C) gboolean function(GtkSourceRegionIter* iter, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_region_iter_get_subregionFn c_gtk_source_region_iter_get_subregion; ///
private alias c_gtk_source_region_iter_is_endFn = extern(C) gboolean function(GtkSourceRegionIter* iter) nothrow;
__gshared c_gtk_source_region_iter_is_endFn c_gtk_source_region_iter_is_end; ///
private alias c_gtk_source_region_iter_nextFn = extern(C) gboolean function(GtkSourceRegionIter* iter) nothrow;
__gshared c_gtk_source_region_iter_nextFn c_gtk_source_region_iter_next; ///

// SearchContext
private alias c_gtk_source_search_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_search_context_get_typeFn c_gtk_source_search_context_get_type; ///
private alias c_gtk_source_search_context_newFn = extern(C) GtkSourceSearchContext* function(GtkSourceBuffer* buffer, GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_context_newFn c_gtk_source_search_context_new; ///
private alias c_gtk_source_search_context_backwardFn = extern(C) gboolean function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround) nothrow;
__gshared c_gtk_source_search_context_backwardFn c_gtk_source_search_context_backward; ///
private alias c_gtk_source_search_context_backward_asyncFn = extern(C) void function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_search_context_backward_asyncFn c_gtk_source_search_context_backward_async; ///
private alias c_gtk_source_search_context_backward_finishFn = extern(C) gboolean function(GtkSourceSearchContext* search, GAsyncResult* result, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround, GError** _err) nothrow;
__gshared c_gtk_source_search_context_backward_finishFn c_gtk_source_search_context_backward_finish; ///
private alias c_gtk_source_search_context_forwardFn = extern(C) gboolean function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround) nothrow;
__gshared c_gtk_source_search_context_forwardFn c_gtk_source_search_context_forward; ///
private alias c_gtk_source_search_context_forward_asyncFn = extern(C) void function(GtkSourceSearchContext* search, const(GtkTextIter)* iter, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gtk_source_search_context_forward_asyncFn c_gtk_source_search_context_forward_async; ///
private alias c_gtk_source_search_context_forward_finishFn = extern(C) gboolean function(GtkSourceSearchContext* search, GAsyncResult* result, GtkTextIter* matchStart, GtkTextIter* matchEnd, gboolean* hasWrappedAround, GError** _err) nothrow;
__gshared c_gtk_source_search_context_forward_finishFn c_gtk_source_search_context_forward_finish; ///
private alias c_gtk_source_search_context_get_bufferFn = extern(C) GtkSourceBuffer* function(GtkSourceSearchContext* search) nothrow;
__gshared c_gtk_source_search_context_get_bufferFn c_gtk_source_search_context_get_buffer; ///
private alias c_gtk_source_search_context_get_highlightFn = extern(C) gboolean function(GtkSourceSearchContext* search) nothrow;
__gshared c_gtk_source_search_context_get_highlightFn c_gtk_source_search_context_get_highlight; ///
private alias c_gtk_source_search_context_get_match_styleFn = extern(C) GtkSourceStyle* function(GtkSourceSearchContext* search) nothrow;
__gshared c_gtk_source_search_context_get_match_styleFn c_gtk_source_search_context_get_match_style; ///
private alias c_gtk_source_search_context_get_occurrence_positionFn = extern(C) int function(GtkSourceSearchContext* search, const(GtkTextIter)* matchStart, const(GtkTextIter)* matchEnd) nothrow;
__gshared c_gtk_source_search_context_get_occurrence_positionFn c_gtk_source_search_context_get_occurrence_position; ///
private alias c_gtk_source_search_context_get_occurrences_countFn = extern(C) int function(GtkSourceSearchContext* search) nothrow;
__gshared c_gtk_source_search_context_get_occurrences_countFn c_gtk_source_search_context_get_occurrences_count; ///
private alias c_gtk_source_search_context_get_regex_errorFn = extern(C) GError* function(GtkSourceSearchContext* search) nothrow;
__gshared c_gtk_source_search_context_get_regex_errorFn c_gtk_source_search_context_get_regex_error; ///
private alias c_gtk_source_search_context_get_settingsFn = extern(C) GtkSourceSearchSettings* function(GtkSourceSearchContext* search) nothrow;
__gshared c_gtk_source_search_context_get_settingsFn c_gtk_source_search_context_get_settings; ///
private alias c_gtk_source_search_context_replaceFn = extern(C) gboolean function(GtkSourceSearchContext* search, GtkTextIter* matchStart, GtkTextIter* matchEnd, const(char)* replace, int replaceLength, GError** _err) nothrow;
__gshared c_gtk_source_search_context_replaceFn c_gtk_source_search_context_replace; ///
private alias c_gtk_source_search_context_replace_allFn = extern(C) uint function(GtkSourceSearchContext* search, const(char)* replace, int replaceLength, GError** _err) nothrow;
__gshared c_gtk_source_search_context_replace_allFn c_gtk_source_search_context_replace_all; ///
private alias c_gtk_source_search_context_set_highlightFn = extern(C) void function(GtkSourceSearchContext* search, gboolean highlight) nothrow;
__gshared c_gtk_source_search_context_set_highlightFn c_gtk_source_search_context_set_highlight; ///
private alias c_gtk_source_search_context_set_match_styleFn = extern(C) void function(GtkSourceSearchContext* search, GtkSourceStyle* matchStyle) nothrow;
__gshared c_gtk_source_search_context_set_match_styleFn c_gtk_source_search_context_set_match_style; ///

// SearchSettings
private alias c_gtk_source_search_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_search_settings_get_typeFn c_gtk_source_search_settings_get_type; ///
private alias c_gtk_source_search_settings_newFn = extern(C) GtkSourceSearchSettings* function() nothrow;
__gshared c_gtk_source_search_settings_newFn c_gtk_source_search_settings_new; ///
private alias c_gtk_source_search_settings_get_at_word_boundariesFn = extern(C) gboolean function(GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_settings_get_at_word_boundariesFn c_gtk_source_search_settings_get_at_word_boundaries; ///
private alias c_gtk_source_search_settings_get_case_sensitiveFn = extern(C) gboolean function(GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_settings_get_case_sensitiveFn c_gtk_source_search_settings_get_case_sensitive; ///
private alias c_gtk_source_search_settings_get_regex_enabledFn = extern(C) gboolean function(GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_settings_get_regex_enabledFn c_gtk_source_search_settings_get_regex_enabled; ///
private alias c_gtk_source_search_settings_get_search_textFn = extern(C) const(char)* function(GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_settings_get_search_textFn c_gtk_source_search_settings_get_search_text; ///
private alias c_gtk_source_search_settings_get_visible_onlyFn = extern(C) gboolean function(GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_settings_get_visible_onlyFn c_gtk_source_search_settings_get_visible_only; ///
private alias c_gtk_source_search_settings_get_wrap_aroundFn = extern(C) gboolean function(GtkSourceSearchSettings* settings) nothrow;
__gshared c_gtk_source_search_settings_get_wrap_aroundFn c_gtk_source_search_settings_get_wrap_around; ///
private alias c_gtk_source_search_settings_set_at_word_boundariesFn = extern(C) void function(GtkSourceSearchSettings* settings, gboolean atWordBoundaries) nothrow;
__gshared c_gtk_source_search_settings_set_at_word_boundariesFn c_gtk_source_search_settings_set_at_word_boundaries; ///
private alias c_gtk_source_search_settings_set_case_sensitiveFn = extern(C) void function(GtkSourceSearchSettings* settings, gboolean caseSensitive) nothrow;
__gshared c_gtk_source_search_settings_set_case_sensitiveFn c_gtk_source_search_settings_set_case_sensitive; ///
private alias c_gtk_source_search_settings_set_regex_enabledFn = extern(C) void function(GtkSourceSearchSettings* settings, gboolean regexEnabled) nothrow;
__gshared c_gtk_source_search_settings_set_regex_enabledFn c_gtk_source_search_settings_set_regex_enabled; ///
private alias c_gtk_source_search_settings_set_search_textFn = extern(C) void function(GtkSourceSearchSettings* settings, const(char)* searchText) nothrow;
__gshared c_gtk_source_search_settings_set_search_textFn c_gtk_source_search_settings_set_search_text; ///
private alias c_gtk_source_search_settings_set_visible_onlyFn = extern(C) void function(GtkSourceSearchSettings* settings, gboolean visibleOnly) nothrow;
__gshared c_gtk_source_search_settings_set_visible_onlyFn c_gtk_source_search_settings_set_visible_only; ///
private alias c_gtk_source_search_settings_set_wrap_aroundFn = extern(C) void function(GtkSourceSearchSettings* settings, gboolean wrapAround) nothrow;
__gshared c_gtk_source_search_settings_set_wrap_aroundFn c_gtk_source_search_settings_set_wrap_around; ///

// Snippet
private alias c_gtk_source_snippet_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_snippet_get_typeFn c_gtk_source_snippet_get_type; ///
private alias c_gtk_source_snippet_newFn = extern(C) GtkSourceSnippet* function(const(char)* trigger, const(char)* languageId) nothrow;
__gshared c_gtk_source_snippet_newFn c_gtk_source_snippet_new; ///
private alias c_gtk_source_snippet_new_parsedFn = extern(C) GtkSourceSnippet* function(const(char)* text, GError** _err) nothrow;
__gshared c_gtk_source_snippet_new_parsedFn c_gtk_source_snippet_new_parsed; ///
private alias c_gtk_source_snippet_add_chunkFn = extern(C) void function(GtkSourceSnippet* snippet, GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_add_chunkFn c_gtk_source_snippet_add_chunk; ///
private alias c_gtk_source_snippet_copyFn = extern(C) GtkSourceSnippet* function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_copyFn c_gtk_source_snippet_copy; ///
private alias c_gtk_source_snippet_get_contextFn = extern(C) GtkSourceSnippetContext* function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_contextFn c_gtk_source_snippet_get_context; ///
private alias c_gtk_source_snippet_get_descriptionFn = extern(C) const(char)* function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_descriptionFn c_gtk_source_snippet_get_description; ///
private alias c_gtk_source_snippet_get_focus_positionFn = extern(C) int function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_focus_positionFn c_gtk_source_snippet_get_focus_position; ///
private alias c_gtk_source_snippet_get_language_idFn = extern(C) const(char)* function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_language_idFn c_gtk_source_snippet_get_language_id; ///
private alias c_gtk_source_snippet_get_n_chunksFn = extern(C) uint function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_n_chunksFn c_gtk_source_snippet_get_n_chunks; ///
private alias c_gtk_source_snippet_get_nameFn = extern(C) const(char)* function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_nameFn c_gtk_source_snippet_get_name; ///
private alias c_gtk_source_snippet_get_nth_chunkFn = extern(C) GtkSourceSnippetChunk* function(GtkSourceSnippet* snippet, uint nth) nothrow;
__gshared c_gtk_source_snippet_get_nth_chunkFn c_gtk_source_snippet_get_nth_chunk; ///
private alias c_gtk_source_snippet_get_triggerFn = extern(C) const(char)* function(GtkSourceSnippet* snippet) nothrow;
__gshared c_gtk_source_snippet_get_triggerFn c_gtk_source_snippet_get_trigger; ///
private alias c_gtk_source_snippet_set_descriptionFn = extern(C) void function(GtkSourceSnippet* snippet, const(char)* description) nothrow;
__gshared c_gtk_source_snippet_set_descriptionFn c_gtk_source_snippet_set_description; ///
private alias c_gtk_source_snippet_set_language_idFn = extern(C) void function(GtkSourceSnippet* snippet, const(char)* languageId) nothrow;
__gshared c_gtk_source_snippet_set_language_idFn c_gtk_source_snippet_set_language_id; ///
private alias c_gtk_source_snippet_set_nameFn = extern(C) void function(GtkSourceSnippet* snippet, const(char)* name) nothrow;
__gshared c_gtk_source_snippet_set_nameFn c_gtk_source_snippet_set_name; ///
private alias c_gtk_source_snippet_set_triggerFn = extern(C) void function(GtkSourceSnippet* snippet, const(char)* trigger) nothrow;
__gshared c_gtk_source_snippet_set_triggerFn c_gtk_source_snippet_set_trigger; ///

// SnippetChunk
private alias c_gtk_source_snippet_chunk_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_snippet_chunk_get_typeFn c_gtk_source_snippet_chunk_get_type; ///
private alias c_gtk_source_snippet_chunk_newFn = extern(C) GtkSourceSnippetChunk* function() nothrow;
__gshared c_gtk_source_snippet_chunk_newFn c_gtk_source_snippet_chunk_new; ///
private alias c_gtk_source_snippet_chunk_copyFn = extern(C) GtkSourceSnippetChunk* function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_copyFn c_gtk_source_snippet_chunk_copy; ///
private alias c_gtk_source_snippet_chunk_get_contextFn = extern(C) GtkSourceSnippetContext* function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_get_contextFn c_gtk_source_snippet_chunk_get_context; ///
private alias c_gtk_source_snippet_chunk_get_focus_positionFn = extern(C) int function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_get_focus_positionFn c_gtk_source_snippet_chunk_get_focus_position; ///
private alias c_gtk_source_snippet_chunk_get_specFn = extern(C) const(char)* function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_get_specFn c_gtk_source_snippet_chunk_get_spec; ///
private alias c_gtk_source_snippet_chunk_get_textFn = extern(C) const(char)* function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_get_textFn c_gtk_source_snippet_chunk_get_text; ///
private alias c_gtk_source_snippet_chunk_get_text_setFn = extern(C) gboolean function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_get_text_setFn c_gtk_source_snippet_chunk_get_text_set; ///
private alias c_gtk_source_snippet_chunk_get_tooltip_textFn = extern(C) const(char)* function(GtkSourceSnippetChunk* chunk) nothrow;
__gshared c_gtk_source_snippet_chunk_get_tooltip_textFn c_gtk_source_snippet_chunk_get_tooltip_text; ///
private alias c_gtk_source_snippet_chunk_set_contextFn = extern(C) void function(GtkSourceSnippetChunk* chunk, GtkSourceSnippetContext* context) nothrow;
__gshared c_gtk_source_snippet_chunk_set_contextFn c_gtk_source_snippet_chunk_set_context; ///
private alias c_gtk_source_snippet_chunk_set_focus_positionFn = extern(C) void function(GtkSourceSnippetChunk* chunk, int focusPosition) nothrow;
__gshared c_gtk_source_snippet_chunk_set_focus_positionFn c_gtk_source_snippet_chunk_set_focus_position; ///
private alias c_gtk_source_snippet_chunk_set_specFn = extern(C) void function(GtkSourceSnippetChunk* chunk, const(char)* spec) nothrow;
__gshared c_gtk_source_snippet_chunk_set_specFn c_gtk_source_snippet_chunk_set_spec; ///
private alias c_gtk_source_snippet_chunk_set_textFn = extern(C) void function(GtkSourceSnippetChunk* chunk, const(char)* text) nothrow;
__gshared c_gtk_source_snippet_chunk_set_textFn c_gtk_source_snippet_chunk_set_text; ///
private alias c_gtk_source_snippet_chunk_set_text_setFn = extern(C) void function(GtkSourceSnippetChunk* chunk, gboolean textSet) nothrow;
__gshared c_gtk_source_snippet_chunk_set_text_setFn c_gtk_source_snippet_chunk_set_text_set; ///
private alias c_gtk_source_snippet_chunk_set_tooltip_textFn = extern(C) void function(GtkSourceSnippetChunk* chunk, const(char)* tooltipText) nothrow;
__gshared c_gtk_source_snippet_chunk_set_tooltip_textFn c_gtk_source_snippet_chunk_set_tooltip_text; ///

// SnippetContext
private alias c_gtk_source_snippet_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_snippet_context_get_typeFn c_gtk_source_snippet_context_get_type; ///
private alias c_gtk_source_snippet_context_newFn = extern(C) GtkSourceSnippetContext* function() nothrow;
__gshared c_gtk_source_snippet_context_newFn c_gtk_source_snippet_context_new; ///
private alias c_gtk_source_snippet_context_clear_variablesFn = extern(C) void function(GtkSourceSnippetContext* self) nothrow;
__gshared c_gtk_source_snippet_context_clear_variablesFn c_gtk_source_snippet_context_clear_variables; ///
private alias c_gtk_source_snippet_context_expandFn = extern(C) char* function(GtkSourceSnippetContext* self, const(char)* input) nothrow;
__gshared c_gtk_source_snippet_context_expandFn c_gtk_source_snippet_context_expand; ///
private alias c_gtk_source_snippet_context_get_variableFn = extern(C) const(char)* function(GtkSourceSnippetContext* self, const(char)* key) nothrow;
__gshared c_gtk_source_snippet_context_get_variableFn c_gtk_source_snippet_context_get_variable; ///
private alias c_gtk_source_snippet_context_set_constantFn = extern(C) void function(GtkSourceSnippetContext* self, const(char)* key, const(char)* value) nothrow;
__gshared c_gtk_source_snippet_context_set_constantFn c_gtk_source_snippet_context_set_constant; ///
private alias c_gtk_source_snippet_context_set_line_prefixFn = extern(C) void function(GtkSourceSnippetContext* self, const(char)* linePrefix) nothrow;
__gshared c_gtk_source_snippet_context_set_line_prefixFn c_gtk_source_snippet_context_set_line_prefix; ///
private alias c_gtk_source_snippet_context_set_tab_widthFn = extern(C) void function(GtkSourceSnippetContext* self, int tabWidth) nothrow;
__gshared c_gtk_source_snippet_context_set_tab_widthFn c_gtk_source_snippet_context_set_tab_width; ///
private alias c_gtk_source_snippet_context_set_use_spacesFn = extern(C) void function(GtkSourceSnippetContext* self, gboolean useSpaces) nothrow;
__gshared c_gtk_source_snippet_context_set_use_spacesFn c_gtk_source_snippet_context_set_use_spaces; ///
private alias c_gtk_source_snippet_context_set_variableFn = extern(C) void function(GtkSourceSnippetContext* self, const(char)* key, const(char)* value) nothrow;
__gshared c_gtk_source_snippet_context_set_variableFn c_gtk_source_snippet_context_set_variable; ///

// SnippetManager
private alias c_gtk_source_snippet_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_snippet_manager_get_typeFn c_gtk_source_snippet_manager_get_type; ///
private alias c_gtk_source_snippet_manager_get_defaultFn = extern(C) GtkSourceSnippetManager* function() nothrow;
__gshared c_gtk_source_snippet_manager_get_defaultFn c_gtk_source_snippet_manager_get_default; ///
private alias c_gtk_source_snippet_manager_get_search_pathFn = extern(C) const(char*)* function(GtkSourceSnippetManager* self) nothrow;
__gshared c_gtk_source_snippet_manager_get_search_pathFn c_gtk_source_snippet_manager_get_search_path; ///
private alias c_gtk_source_snippet_manager_get_snippetFn = extern(C) GtkSourceSnippet* function(GtkSourceSnippetManager* self, const(char)* group, const(char)* languageId, const(char)* trigger) nothrow;
__gshared c_gtk_source_snippet_manager_get_snippetFn c_gtk_source_snippet_manager_get_snippet; ///
private alias c_gtk_source_snippet_manager_list_allFn = extern(C) GListModel* function(GtkSourceSnippetManager* self) nothrow;
__gshared c_gtk_source_snippet_manager_list_allFn c_gtk_source_snippet_manager_list_all; ///
private alias c_gtk_source_snippet_manager_list_groupsFn = extern(C) const(char*)* function(GtkSourceSnippetManager* self) nothrow;
__gshared c_gtk_source_snippet_manager_list_groupsFn c_gtk_source_snippet_manager_list_groups; ///
private alias c_gtk_source_snippet_manager_list_matchingFn = extern(C) GListModel* function(GtkSourceSnippetManager* self, const(char)* group, const(char)* languageId, const(char)* triggerPrefix) nothrow;
__gshared c_gtk_source_snippet_manager_list_matchingFn c_gtk_source_snippet_manager_list_matching; ///
private alias c_gtk_source_snippet_manager_set_search_pathFn = extern(C) void function(GtkSourceSnippetManager* self, const(char*)* dirs) nothrow;
__gshared c_gtk_source_snippet_manager_set_search_pathFn c_gtk_source_snippet_manager_set_search_path; ///

// SpaceDrawer
private alias c_gtk_source_space_drawer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_space_drawer_get_typeFn c_gtk_source_space_drawer_get_type; ///
private alias c_gtk_source_space_drawer_newFn = extern(C) GtkSourceSpaceDrawer* function() nothrow;
__gshared c_gtk_source_space_drawer_newFn c_gtk_source_space_drawer_new; ///
private alias c_gtk_source_space_drawer_bind_matrix_settingFn = extern(C) void function(GtkSourceSpaceDrawer* drawer, GSettings* settings, const(char)* key, GSettingsBindFlags flags) nothrow;
__gshared c_gtk_source_space_drawer_bind_matrix_settingFn c_gtk_source_space_drawer_bind_matrix_setting; ///
private alias c_gtk_source_space_drawer_get_enable_matrixFn = extern(C) gboolean function(GtkSourceSpaceDrawer* drawer) nothrow;
__gshared c_gtk_source_space_drawer_get_enable_matrixFn c_gtk_source_space_drawer_get_enable_matrix; ///
private alias c_gtk_source_space_drawer_get_matrixFn = extern(C) GVariant* function(GtkSourceSpaceDrawer* drawer) nothrow;
__gshared c_gtk_source_space_drawer_get_matrixFn c_gtk_source_space_drawer_get_matrix; ///
private alias c_gtk_source_space_drawer_get_types_for_locationsFn = extern(C) GtkSourceSpaceTypeFlags function(GtkSourceSpaceDrawer* drawer, GtkSourceSpaceLocationFlags locations) nothrow;
__gshared c_gtk_source_space_drawer_get_types_for_locationsFn c_gtk_source_space_drawer_get_types_for_locations; ///
private alias c_gtk_source_space_drawer_set_enable_matrixFn = extern(C) void function(GtkSourceSpaceDrawer* drawer, gboolean enableMatrix) nothrow;
__gshared c_gtk_source_space_drawer_set_enable_matrixFn c_gtk_source_space_drawer_set_enable_matrix; ///
private alias c_gtk_source_space_drawer_set_matrixFn = extern(C) void function(GtkSourceSpaceDrawer* drawer, GVariant* matrix) nothrow;
__gshared c_gtk_source_space_drawer_set_matrixFn c_gtk_source_space_drawer_set_matrix; ///
private alias c_gtk_source_space_drawer_set_types_for_locationsFn = extern(C) void function(GtkSourceSpaceDrawer* drawer, GtkSourceSpaceLocationFlags locations, GtkSourceSpaceTypeFlags types) nothrow;
__gshared c_gtk_source_space_drawer_set_types_for_locationsFn c_gtk_source_space_drawer_set_types_for_locations; ///

// Style
private alias c_gtk_source_style_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_get_typeFn c_gtk_source_style_get_type; ///
private alias c_gtk_source_style_applyFn = extern(C) void function(const(GtkSourceStyle)* style, GtkTextTag* tag) nothrow;
__gshared c_gtk_source_style_applyFn c_gtk_source_style_apply; ///
private alias c_gtk_source_style_copyFn = extern(C) GtkSourceStyle* function(const(GtkSourceStyle)* style) nothrow;
__gshared c_gtk_source_style_copyFn c_gtk_source_style_copy; ///

// StyleScheme
private alias c_gtk_source_style_scheme_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_scheme_get_typeFn c_gtk_source_style_scheme_get_type; ///
private alias c_gtk_source_style_scheme_get_authorsFn = extern(C) const(char*)* function(GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_get_authorsFn c_gtk_source_style_scheme_get_authors; ///
private alias c_gtk_source_style_scheme_get_descriptionFn = extern(C) const(char)* function(GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_get_descriptionFn c_gtk_source_style_scheme_get_description; ///
private alias c_gtk_source_style_scheme_get_filenameFn = extern(C) const(char)* function(GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_get_filenameFn c_gtk_source_style_scheme_get_filename; ///
private alias c_gtk_source_style_scheme_get_idFn = extern(C) const(char)* function(GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_get_idFn c_gtk_source_style_scheme_get_id; ///
private alias c_gtk_source_style_scheme_get_metadataFn = extern(C) const(char)* function(GtkSourceStyleScheme* scheme, const(char)* name) nothrow;
__gshared c_gtk_source_style_scheme_get_metadataFn c_gtk_source_style_scheme_get_metadata; ///
private alias c_gtk_source_style_scheme_get_nameFn = extern(C) const(char)* function(GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_get_nameFn c_gtk_source_style_scheme_get_name; ///
private alias c_gtk_source_style_scheme_get_styleFn = extern(C) GtkSourceStyle* function(GtkSourceStyleScheme* scheme, const(char)* styleId) nothrow;
__gshared c_gtk_source_style_scheme_get_styleFn c_gtk_source_style_scheme_get_style; ///

// StyleSchemeChooser
private alias c_gtk_source_style_scheme_chooser_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_scheme_chooser_get_typeFn c_gtk_source_style_scheme_chooser_get_type; ///
private alias c_gtk_source_style_scheme_chooser_get_style_schemeFn = extern(C) GtkSourceStyleScheme* function(GtkSourceStyleSchemeChooser* chooser) nothrow;
__gshared c_gtk_source_style_scheme_chooser_get_style_schemeFn c_gtk_source_style_scheme_chooser_get_style_scheme; ///
private alias c_gtk_source_style_scheme_chooser_set_style_schemeFn = extern(C) void function(GtkSourceStyleSchemeChooser* chooser, GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_chooser_set_style_schemeFn c_gtk_source_style_scheme_chooser_set_style_scheme; ///

// StyleSchemeChooserButton
private alias c_gtk_source_style_scheme_chooser_button_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_scheme_chooser_button_get_typeFn c_gtk_source_style_scheme_chooser_button_get_type; ///
private alias c_gtk_source_style_scheme_chooser_button_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_gtk_source_style_scheme_chooser_button_newFn c_gtk_source_style_scheme_chooser_button_new; ///

// StyleSchemeChooserWidget
private alias c_gtk_source_style_scheme_chooser_widget_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_scheme_chooser_widget_get_typeFn c_gtk_source_style_scheme_chooser_widget_get_type; ///
private alias c_gtk_source_style_scheme_chooser_widget_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_gtk_source_style_scheme_chooser_widget_newFn c_gtk_source_style_scheme_chooser_widget_new; ///

// StyleSchemeManager
private alias c_gtk_source_style_scheme_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_scheme_manager_get_typeFn c_gtk_source_style_scheme_manager_get_type; ///
private alias c_gtk_source_style_scheme_manager_newFn = extern(C) GtkSourceStyleSchemeManager* function() nothrow;
__gshared c_gtk_source_style_scheme_manager_newFn c_gtk_source_style_scheme_manager_new; ///
private alias c_gtk_source_style_scheme_manager_get_defaultFn = extern(C) GtkSourceStyleSchemeManager* function() nothrow;
__gshared c_gtk_source_style_scheme_manager_get_defaultFn c_gtk_source_style_scheme_manager_get_default; ///
private alias c_gtk_source_style_scheme_manager_append_search_pathFn = extern(C) void function(GtkSourceStyleSchemeManager* manager, const(char)* path) nothrow;
__gshared c_gtk_source_style_scheme_manager_append_search_pathFn c_gtk_source_style_scheme_manager_append_search_path; ///
private alias c_gtk_source_style_scheme_manager_force_rescanFn = extern(C) void function(GtkSourceStyleSchemeManager* manager) nothrow;
__gshared c_gtk_source_style_scheme_manager_force_rescanFn c_gtk_source_style_scheme_manager_force_rescan; ///
private alias c_gtk_source_style_scheme_manager_get_schemeFn = extern(C) GtkSourceStyleScheme* function(GtkSourceStyleSchemeManager* manager, const(char)* schemeId) nothrow;
__gshared c_gtk_source_style_scheme_manager_get_schemeFn c_gtk_source_style_scheme_manager_get_scheme; ///
private alias c_gtk_source_style_scheme_manager_get_scheme_idsFn = extern(C) const(char*)* function(GtkSourceStyleSchemeManager* manager) nothrow;
__gshared c_gtk_source_style_scheme_manager_get_scheme_idsFn c_gtk_source_style_scheme_manager_get_scheme_ids; ///
private alias c_gtk_source_style_scheme_manager_get_search_pathFn = extern(C) const(char*)* function(GtkSourceStyleSchemeManager* manager) nothrow;
__gshared c_gtk_source_style_scheme_manager_get_search_pathFn c_gtk_source_style_scheme_manager_get_search_path; ///
private alias c_gtk_source_style_scheme_manager_prepend_search_pathFn = extern(C) void function(GtkSourceStyleSchemeManager* manager, const(char)* path) nothrow;
__gshared c_gtk_source_style_scheme_manager_prepend_search_pathFn c_gtk_source_style_scheme_manager_prepend_search_path; ///
private alias c_gtk_source_style_scheme_manager_set_search_pathFn = extern(C) void function(GtkSourceStyleSchemeManager* manager, const(char*)* path) nothrow;
__gshared c_gtk_source_style_scheme_manager_set_search_pathFn c_gtk_source_style_scheme_manager_set_search_path; ///

// StyleSchemePreview
private alias c_gtk_source_style_scheme_preview_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_style_scheme_preview_get_typeFn c_gtk_source_style_scheme_preview_get_type; ///
private alias c_gtk_source_style_scheme_preview_newFn = extern(C) GtkWidget* function(GtkSourceStyleScheme* scheme) nothrow;
__gshared c_gtk_source_style_scheme_preview_newFn c_gtk_source_style_scheme_preview_new; ///
private alias c_gtk_source_style_scheme_preview_get_schemeFn = extern(C) GtkSourceStyleScheme* function(GtkSourceStyleSchemePreview* self) nothrow;
__gshared c_gtk_source_style_scheme_preview_get_schemeFn c_gtk_source_style_scheme_preview_get_scheme; ///
private alias c_gtk_source_style_scheme_preview_get_selectedFn = extern(C) gboolean function(GtkSourceStyleSchemePreview* self) nothrow;
__gshared c_gtk_source_style_scheme_preview_get_selectedFn c_gtk_source_style_scheme_preview_get_selected; ///
private alias c_gtk_source_style_scheme_preview_set_selectedFn = extern(C) void function(GtkSourceStyleSchemePreview* self, gboolean selected) nothrow;
__gshared c_gtk_source_style_scheme_preview_set_selectedFn c_gtk_source_style_scheme_preview_set_selected; ///

// Tag
private alias c_gtk_source_tag_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_tag_get_typeFn c_gtk_source_tag_get_type; ///
private alias c_gtk_source_tag_newFn = extern(C) GtkTextTag* function(const(char)* name) nothrow;
__gshared c_gtk_source_tag_newFn c_gtk_source_tag_new; ///

// View
private alias c_gtk_source_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_view_get_typeFn c_gtk_source_view_get_type; ///
private alias c_gtk_source_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_gtk_source_view_newFn c_gtk_source_view_new; ///
private alias c_gtk_source_view_new_with_bufferFn = extern(C) GtkWidget* function(GtkSourceBuffer* buffer) nothrow;
__gshared c_gtk_source_view_new_with_bufferFn c_gtk_source_view_new_with_buffer; ///
private alias c_gtk_source_view_get_annotationsFn = extern(C) GtkSourceAnnotations* function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_annotationsFn c_gtk_source_view_get_annotations; ///
private alias c_gtk_source_view_get_auto_indentFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_auto_indentFn c_gtk_source_view_get_auto_indent; ///
private alias c_gtk_source_view_get_background_patternFn = extern(C) GtkSourceBackgroundPatternType function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_background_patternFn c_gtk_source_view_get_background_pattern; ///
private alias c_gtk_source_view_get_completionFn = extern(C) GtkSourceCompletion* function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_completionFn c_gtk_source_view_get_completion; ///
private alias c_gtk_source_view_get_enable_snippetsFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_enable_snippetsFn c_gtk_source_view_get_enable_snippets; ///
private alias c_gtk_source_view_get_gutterFn = extern(C) GtkSourceGutter* function(GtkSourceView* view, GtkTextWindowType windowType) nothrow;
__gshared c_gtk_source_view_get_gutterFn c_gtk_source_view_get_gutter; ///
private alias c_gtk_source_view_get_highlight_current_lineFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_highlight_current_lineFn c_gtk_source_view_get_highlight_current_line; ///
private alias c_gtk_source_view_get_hoverFn = extern(C) GtkSourceHover* function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_hoverFn c_gtk_source_view_get_hover; ///
private alias c_gtk_source_view_get_indent_on_tabFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_indent_on_tabFn c_gtk_source_view_get_indent_on_tab; ///
private alias c_gtk_source_view_get_indent_widthFn = extern(C) int function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_indent_widthFn c_gtk_source_view_get_indent_width; ///
private alias c_gtk_source_view_get_indenterFn = extern(C) GtkSourceIndenter* function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_indenterFn c_gtk_source_view_get_indenter; ///
private alias c_gtk_source_view_get_insert_spaces_instead_of_tabsFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_insert_spaces_instead_of_tabsFn c_gtk_source_view_get_insert_spaces_instead_of_tabs; ///
private alias c_gtk_source_view_get_mark_attributesFn = extern(C) GtkSourceMarkAttributes* function(GtkSourceView* view, const(char)* category, int* priority) nothrow;
__gshared c_gtk_source_view_get_mark_attributesFn c_gtk_source_view_get_mark_attributes; ///
private alias c_gtk_source_view_get_right_margin_positionFn = extern(C) uint function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_right_margin_positionFn c_gtk_source_view_get_right_margin_position; ///
private alias c_gtk_source_view_get_show_line_marksFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_show_line_marksFn c_gtk_source_view_get_show_line_marks; ///
private alias c_gtk_source_view_get_show_line_numbersFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_show_line_numbersFn c_gtk_source_view_get_show_line_numbers; ///
private alias c_gtk_source_view_get_show_right_marginFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_show_right_marginFn c_gtk_source_view_get_show_right_margin; ///
private alias c_gtk_source_view_get_smart_backspaceFn = extern(C) gboolean function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_smart_backspaceFn c_gtk_source_view_get_smart_backspace; ///
private alias c_gtk_source_view_get_smart_home_endFn = extern(C) GtkSourceSmartHomeEndType function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_smart_home_endFn c_gtk_source_view_get_smart_home_end; ///
private alias c_gtk_source_view_get_space_drawerFn = extern(C) GtkSourceSpaceDrawer* function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_space_drawerFn c_gtk_source_view_get_space_drawer; ///
private alias c_gtk_source_view_get_tab_widthFn = extern(C) uint function(GtkSourceView* view) nothrow;
__gshared c_gtk_source_view_get_tab_widthFn c_gtk_source_view_get_tab_width; ///
private alias c_gtk_source_view_get_visual_columnFn = extern(C) uint function(GtkSourceView* view, const(GtkTextIter)* iter) nothrow;
__gshared c_gtk_source_view_get_visual_columnFn c_gtk_source_view_get_visual_column; ///
private alias c_gtk_source_view_indent_linesFn = extern(C) void function(GtkSourceView* view, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_view_indent_linesFn c_gtk_source_view_indent_lines; ///
private alias c_gtk_source_view_push_snippetFn = extern(C) void function(GtkSourceView* view, GtkSourceSnippet* snippet, GtkTextIter* location) nothrow;
__gshared c_gtk_source_view_push_snippetFn c_gtk_source_view_push_snippet; ///
private alias c_gtk_source_view_set_auto_indentFn = extern(C) void function(GtkSourceView* view, gboolean enable) nothrow;
__gshared c_gtk_source_view_set_auto_indentFn c_gtk_source_view_set_auto_indent; ///
private alias c_gtk_source_view_set_background_patternFn = extern(C) void function(GtkSourceView* view, GtkSourceBackgroundPatternType backgroundPattern) nothrow;
__gshared c_gtk_source_view_set_background_patternFn c_gtk_source_view_set_background_pattern; ///
private alias c_gtk_source_view_set_enable_snippetsFn = extern(C) void function(GtkSourceView* view, gboolean enableSnippets) nothrow;
__gshared c_gtk_source_view_set_enable_snippetsFn c_gtk_source_view_set_enable_snippets; ///
private alias c_gtk_source_view_set_highlight_current_lineFn = extern(C) void function(GtkSourceView* view, gboolean highlight) nothrow;
__gshared c_gtk_source_view_set_highlight_current_lineFn c_gtk_source_view_set_highlight_current_line; ///
private alias c_gtk_source_view_set_indent_on_tabFn = extern(C) void function(GtkSourceView* view, gboolean enable) nothrow;
__gshared c_gtk_source_view_set_indent_on_tabFn c_gtk_source_view_set_indent_on_tab; ///
private alias c_gtk_source_view_set_indent_widthFn = extern(C) void function(GtkSourceView* view, int width) nothrow;
__gshared c_gtk_source_view_set_indent_widthFn c_gtk_source_view_set_indent_width; ///
private alias c_gtk_source_view_set_indenterFn = extern(C) void function(GtkSourceView* view, GtkSourceIndenter* indenter) nothrow;
__gshared c_gtk_source_view_set_indenterFn c_gtk_source_view_set_indenter; ///
private alias c_gtk_source_view_set_insert_spaces_instead_of_tabsFn = extern(C) void function(GtkSourceView* view, gboolean enable) nothrow;
__gshared c_gtk_source_view_set_insert_spaces_instead_of_tabsFn c_gtk_source_view_set_insert_spaces_instead_of_tabs; ///
private alias c_gtk_source_view_set_mark_attributesFn = extern(C) void function(GtkSourceView* view, const(char)* category, GtkSourceMarkAttributes* attributes, int priority) nothrow;
__gshared c_gtk_source_view_set_mark_attributesFn c_gtk_source_view_set_mark_attributes; ///
private alias c_gtk_source_view_set_right_margin_positionFn = extern(C) void function(GtkSourceView* view, uint pos) nothrow;
__gshared c_gtk_source_view_set_right_margin_positionFn c_gtk_source_view_set_right_margin_position; ///
private alias c_gtk_source_view_set_show_line_marksFn = extern(C) void function(GtkSourceView* view, gboolean show) nothrow;
__gshared c_gtk_source_view_set_show_line_marksFn c_gtk_source_view_set_show_line_marks; ///
private alias c_gtk_source_view_set_show_line_numbersFn = extern(C) void function(GtkSourceView* view, gboolean show) nothrow;
__gshared c_gtk_source_view_set_show_line_numbersFn c_gtk_source_view_set_show_line_numbers; ///
private alias c_gtk_source_view_set_show_right_marginFn = extern(C) void function(GtkSourceView* view, gboolean show) nothrow;
__gshared c_gtk_source_view_set_show_right_marginFn c_gtk_source_view_set_show_right_margin; ///
private alias c_gtk_source_view_set_smart_backspaceFn = extern(C) void function(GtkSourceView* view, gboolean smartBackspace) nothrow;
__gshared c_gtk_source_view_set_smart_backspaceFn c_gtk_source_view_set_smart_backspace; ///
private alias c_gtk_source_view_set_smart_home_endFn = extern(C) void function(GtkSourceView* view, GtkSourceSmartHomeEndType smartHomeEnd) nothrow;
__gshared c_gtk_source_view_set_smart_home_endFn c_gtk_source_view_set_smart_home_end; ///
private alias c_gtk_source_view_set_tab_widthFn = extern(C) void function(GtkSourceView* view, uint width) nothrow;
__gshared c_gtk_source_view_set_tab_widthFn c_gtk_source_view_set_tab_width; ///
private alias c_gtk_source_view_unindent_linesFn = extern(C) void function(GtkSourceView* view, GtkTextIter* start, GtkTextIter* end) nothrow;
__gshared c_gtk_source_view_unindent_linesFn c_gtk_source_view_unindent_lines; ///

// VimIMContext
private alias c_gtk_source_vim_im_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gtk_source_vim_im_context_get_typeFn c_gtk_source_vim_im_context_get_type; ///
private alias c_gtk_source_vim_im_context_newFn = extern(C) GtkIMContext* function() nothrow;
__gshared c_gtk_source_vim_im_context_newFn c_gtk_source_vim_im_context_new; ///
private alias c_gtk_source_vim_im_context_execute_commandFn = extern(C) void function(GtkSourceVimIMContext* self, const(char)* command) nothrow;
__gshared c_gtk_source_vim_im_context_execute_commandFn c_gtk_source_vim_im_context_execute_command; ///
private alias c_gtk_source_vim_im_context_get_command_bar_textFn = extern(C) const(char)* function(GtkSourceVimIMContext* self) nothrow;
__gshared c_gtk_source_vim_im_context_get_command_bar_textFn c_gtk_source_vim_im_context_get_command_bar_text; ///
private alias c_gtk_source_vim_im_context_get_command_textFn = extern(C) const(char)* function(GtkSourceVimIMContext* self) nothrow;
__gshared c_gtk_source_vim_im_context_get_command_textFn c_gtk_source_vim_im_context_get_command_text; ///

// global
private alias c_gtk_source_check_versionFn = extern(C) gboolean function(uint major, uint minor, uint micro) nothrow;
__gshared c_gtk_source_check_versionFn c_gtk_source_check_version; ///
private alias c_gtk_source_finalizeFn = extern(C) void function() nothrow;
__gshared c_gtk_source_finalizeFn c_gtk_source_finalize; ///
private alias c_gtk_source_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_gtk_source_get_major_versionFn c_gtk_source_get_major_version; ///
private alias c_gtk_source_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_gtk_source_get_micro_versionFn c_gtk_source_get_micro_version; ///
private alias c_gtk_source_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_gtk_source_get_minor_versionFn c_gtk_source_get_minor_version; ///
private alias c_gtk_source_initFn = extern(C) void function() nothrow;
__gshared c_gtk_source_initFn c_gtk_source_init; ///
private alias c_gtk_source_scheduler_addFn = extern(C) size_t function(GtkSourceSchedulerCallback callback, void* userData) nothrow;
__gshared c_gtk_source_scheduler_addFn c_gtk_source_scheduler_add; ///
private alias c_gtk_source_scheduler_add_fullFn = extern(C) size_t function(GtkSourceSchedulerCallback callback, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gtk_source_scheduler_add_fullFn c_gtk_source_scheduler_add_full; ///
private alias c_gtk_source_scheduler_removeFn = extern(C) void function(size_t handlerId) nothrow;
__gshared c_gtk_source_scheduler_removeFn c_gtk_source_scheduler_remove; ///
private alias c_gtk_source_utils_escape_search_textFn = extern(C) char* function(const(char)* text) nothrow;
__gshared c_gtk_source_utils_escape_search_textFn c_gtk_source_utils_escape_search_text; ///
private alias c_gtk_source_utils_unescape_search_textFn = extern(C) char* function(const(char)* text) nothrow;
__gshared c_gtk_source_utils_unescape_search_textFn c_gtk_source_utils_unescape_search_text; ///

// FileLoaderError
private alias c_gtk_source_file_loader_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gtk_source_file_loader_error_quarkFn c_gtk_source_file_loader_error_quark; ///

// FileSaverError
private alias c_gtk_source_file_saver_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gtk_source_file_saver_error_quarkFn c_gtk_source_file_saver_error_quark; ///

// Annotation

/** */
alias gtk_source_annotation_get_type = c_gtk_source_annotation_get_type;

/** */
alias gtk_source_annotation_new = c_gtk_source_annotation_new;

/** */
alias gtk_source_annotation_get_description = c_gtk_source_annotation_get_description;

/** */
alias gtk_source_annotation_get_icon = c_gtk_source_annotation_get_icon;

/** */
alias gtk_source_annotation_get_line = c_gtk_source_annotation_get_line;

/** */
alias gtk_source_annotation_get_style = c_gtk_source_annotation_get_style;

// AnnotationProvider

/** */
alias gtk_source_annotation_provider_get_type = c_gtk_source_annotation_provider_get_type;

/** */
alias gtk_source_annotation_provider_new = c_gtk_source_annotation_provider_new;

/** */
alias gtk_source_annotation_provider_add_annotation = c_gtk_source_annotation_provider_add_annotation;

/** */
alias gtk_source_annotation_provider_populate_hover_async = c_gtk_source_annotation_provider_populate_hover_async;

/** */
alias gtk_source_annotation_provider_populate_hover_finish = c_gtk_source_annotation_provider_populate_hover_finish;

/** */
alias gtk_source_annotation_provider_remove_all = c_gtk_source_annotation_provider_remove_all;

/** */
alias gtk_source_annotation_provider_remove_annotation = c_gtk_source_annotation_provider_remove_annotation;

// Annotations

/** */
alias gtk_source_annotations_get_type = c_gtk_source_annotations_get_type;

/** */
alias gtk_source_annotations_add_provider = c_gtk_source_annotations_add_provider;

/** */
alias gtk_source_annotations_remove_provider = c_gtk_source_annotations_remove_provider;

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
alias gtk_source_buffer_get_markup = c_gtk_source_buffer_get_markup;

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
alias gtk_source_gutter_lines_get_line_extent = c_gtk_source_gutter_lines_get_line_extent;

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
alias gtk_source_view_get_annotations = c_gtk_source_view_get_annotations;

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
  auto libs = gidResolveLibs(LIBS, "gid.gtksource5");

  // Annotation
  gidLink(cast(void**)&gtk_source_annotation_get_type, "gtk_source_annotation_get_type", libs);
  gidLink(cast(void**)&gtk_source_annotation_new, "gtk_source_annotation_new", libs);
  gidLink(cast(void**)&gtk_source_annotation_get_description, "gtk_source_annotation_get_description", libs);
  gidLink(cast(void**)&gtk_source_annotation_get_icon, "gtk_source_annotation_get_icon", libs);
  gidLink(cast(void**)&gtk_source_annotation_get_line, "gtk_source_annotation_get_line", libs);
  gidLink(cast(void**)&gtk_source_annotation_get_style, "gtk_source_annotation_get_style", libs);

  // AnnotationProvider
  gidLink(cast(void**)&gtk_source_annotation_provider_get_type, "gtk_source_annotation_provider_get_type", libs);
  gidLink(cast(void**)&gtk_source_annotation_provider_new, "gtk_source_annotation_provider_new", libs);
  gidLink(cast(void**)&gtk_source_annotation_provider_add_annotation, "gtk_source_annotation_provider_add_annotation", libs);
  gidLink(cast(void**)&gtk_source_annotation_provider_populate_hover_async, "gtk_source_annotation_provider_populate_hover_async", libs);
  gidLink(cast(void**)&gtk_source_annotation_provider_populate_hover_finish, "gtk_source_annotation_provider_populate_hover_finish", libs);
  gidLink(cast(void**)&gtk_source_annotation_provider_remove_all, "gtk_source_annotation_provider_remove_all", libs);
  gidLink(cast(void**)&gtk_source_annotation_provider_remove_annotation, "gtk_source_annotation_provider_remove_annotation", libs);

  // Annotations
  gidLink(cast(void**)&gtk_source_annotations_get_type, "gtk_source_annotations_get_type", libs);
  gidLink(cast(void**)&gtk_source_annotations_add_provider, "gtk_source_annotations_add_provider", libs);
  gidLink(cast(void**)&gtk_source_annotations_remove_provider, "gtk_source_annotations_remove_provider", libs);

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
  gidLink(cast(void**)&gtk_source_buffer_get_markup, "gtk_source_buffer_get_markup", libs);
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
  gidLink(cast(void**)&gtk_source_gutter_lines_get_line_extent, "gtk_source_gutter_lines_get_line_extent", libs);
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
  gidLink(cast(void**)&gtk_source_view_get_annotations, "gtk_source_view_get_annotations", libs);
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
