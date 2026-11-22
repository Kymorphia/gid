/// C functions for gdk4 library
module gid.gdk4.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gdk4.c.types;
static import gid.gdk4.c._gidlib_Gdk;
public import gid.cairo1.c.types;
public import gid.gdkpixbuf2.c.types;
public import gid.gio2.c.types;
public import gid.pango1.c.types;
public import gid.pangocairo1.c.types;

private immutable LIBS = ["gtk-4_1"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gdk4.c._gidlib_Gdk.gidLibLinked;

// AppLaunchContext
private alias c_gdk_app_launch_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_app_launch_context_get_typeFn c_gdk_app_launch_context_get_type; ///
private alias c_gdk_app_launch_context_get_displayFn = extern(C) GdkDisplay* function(GdkAppLaunchContext* context) nothrow;
__gshared c_gdk_app_launch_context_get_displayFn c_gdk_app_launch_context_get_display; ///
private alias c_gdk_app_launch_context_set_desktopFn = extern(C) void function(GdkAppLaunchContext* context, int desktop) nothrow;
__gshared c_gdk_app_launch_context_set_desktopFn c_gdk_app_launch_context_set_desktop; ///
private alias c_gdk_app_launch_context_set_iconFn = extern(C) void function(GdkAppLaunchContext* context, GIcon* icon) nothrow;
__gshared c_gdk_app_launch_context_set_iconFn c_gdk_app_launch_context_set_icon; ///
private alias c_gdk_app_launch_context_set_icon_nameFn = extern(C) void function(GdkAppLaunchContext* context, const(char)* iconName) nothrow;
__gshared c_gdk_app_launch_context_set_icon_nameFn c_gdk_app_launch_context_set_icon_name; ///
private alias c_gdk_app_launch_context_set_timestampFn = extern(C) void function(GdkAppLaunchContext* context, uint timestamp) nothrow;
__gshared c_gdk_app_launch_context_set_timestampFn c_gdk_app_launch_context_set_timestamp; ///

// ButtonEvent
private alias c_gdk_button_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_button_event_get_typeFn c_gdk_button_event_get_type; ///
private alias c_gdk_button_event_get_buttonFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_button_event_get_buttonFn c_gdk_button_event_get_button; ///

// CairoContext
private alias c_gdk_cairo_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_cairo_context_get_typeFn c_gdk_cairo_context_get_type; ///
private alias c_gdk_cairo_context_cairo_createFn = extern(C) cairo_t* function(GdkCairoContext* self) nothrow;
__gshared c_gdk_cairo_context_cairo_createFn c_gdk_cairo_context_cairo_create; ///

// CicpParams
private alias c_gdk_cicp_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_cicp_params_get_typeFn c_gdk_cicp_params_get_type; ///
private alias c_gdk_cicp_params_newFn = extern(C) GdkCicpParams* function() nothrow;
__gshared c_gdk_cicp_params_newFn c_gdk_cicp_params_new; ///
private alias c_gdk_cicp_params_build_color_stateFn = extern(C) GdkColorState* function(GdkCicpParams* self, GError** _err) nothrow;
__gshared c_gdk_cicp_params_build_color_stateFn c_gdk_cicp_params_build_color_state; ///
private alias c_gdk_cicp_params_get_color_primariesFn = extern(C) uint function(GdkCicpParams* self) nothrow;
__gshared c_gdk_cicp_params_get_color_primariesFn c_gdk_cicp_params_get_color_primaries; ///
private alias c_gdk_cicp_params_get_matrix_coefficientsFn = extern(C) uint function(GdkCicpParams* self) nothrow;
__gshared c_gdk_cicp_params_get_matrix_coefficientsFn c_gdk_cicp_params_get_matrix_coefficients; ///
private alias c_gdk_cicp_params_get_rangeFn = extern(C) GdkCicpRange function(GdkCicpParams* self) nothrow;
__gshared c_gdk_cicp_params_get_rangeFn c_gdk_cicp_params_get_range; ///
private alias c_gdk_cicp_params_get_transfer_functionFn = extern(C) uint function(GdkCicpParams* self) nothrow;
__gshared c_gdk_cicp_params_get_transfer_functionFn c_gdk_cicp_params_get_transfer_function; ///
private alias c_gdk_cicp_params_set_color_primariesFn = extern(C) void function(GdkCicpParams* self, uint colorPrimaries) nothrow;
__gshared c_gdk_cicp_params_set_color_primariesFn c_gdk_cicp_params_set_color_primaries; ///
private alias c_gdk_cicp_params_set_matrix_coefficientsFn = extern(C) void function(GdkCicpParams* self, uint matrixCoefficients) nothrow;
__gshared c_gdk_cicp_params_set_matrix_coefficientsFn c_gdk_cicp_params_set_matrix_coefficients; ///
private alias c_gdk_cicp_params_set_rangeFn = extern(C) void function(GdkCicpParams* self, GdkCicpRange range) nothrow;
__gshared c_gdk_cicp_params_set_rangeFn c_gdk_cicp_params_set_range; ///
private alias c_gdk_cicp_params_set_transfer_functionFn = extern(C) void function(GdkCicpParams* self, uint transferFunction) nothrow;
__gshared c_gdk_cicp_params_set_transfer_functionFn c_gdk_cicp_params_set_transfer_function; ///

// Clipboard
private alias c_gdk_clipboard_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_clipboard_get_typeFn c_gdk_clipboard_get_type; ///
private alias c_gdk_clipboard_get_contentFn = extern(C) GdkContentProvider* function(GdkClipboard* clipboard) nothrow;
__gshared c_gdk_clipboard_get_contentFn c_gdk_clipboard_get_content; ///
private alias c_gdk_clipboard_get_displayFn = extern(C) GdkDisplay* function(GdkClipboard* clipboard) nothrow;
__gshared c_gdk_clipboard_get_displayFn c_gdk_clipboard_get_display; ///
private alias c_gdk_clipboard_get_formatsFn = extern(C) GdkContentFormats* function(GdkClipboard* clipboard) nothrow;
__gshared c_gdk_clipboard_get_formatsFn c_gdk_clipboard_get_formats; ///
private alias c_gdk_clipboard_is_localFn = extern(C) gboolean function(GdkClipboard* clipboard) nothrow;
__gshared c_gdk_clipboard_is_localFn c_gdk_clipboard_is_local; ///
private alias c_gdk_clipboard_read_asyncFn = extern(C) void function(GdkClipboard* clipboard, const(char*)* mimeTypes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_clipboard_read_asyncFn c_gdk_clipboard_read_async; ///
private alias c_gdk_clipboard_read_finishFn = extern(C) GInputStream* function(GdkClipboard* clipboard, GAsyncResult* result, const(char*)* outMimeType, GError** _err) nothrow;
__gshared c_gdk_clipboard_read_finishFn c_gdk_clipboard_read_finish; ///
private alias c_gdk_clipboard_read_text_asyncFn = extern(C) void function(GdkClipboard* clipboard, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_clipboard_read_text_asyncFn c_gdk_clipboard_read_text_async; ///
private alias c_gdk_clipboard_read_text_finishFn = extern(C) char* function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_clipboard_read_text_finishFn c_gdk_clipboard_read_text_finish; ///
private alias c_gdk_clipboard_read_texture_asyncFn = extern(C) void function(GdkClipboard* clipboard, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_clipboard_read_texture_asyncFn c_gdk_clipboard_read_texture_async; ///
private alias c_gdk_clipboard_read_texture_finishFn = extern(C) GdkTexture* function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_clipboard_read_texture_finishFn c_gdk_clipboard_read_texture_finish; ///
private alias c_gdk_clipboard_read_value_asyncFn = extern(C) void function(GdkClipboard* clipboard, GType type, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_clipboard_read_value_asyncFn c_gdk_clipboard_read_value_async; ///
private alias c_gdk_clipboard_read_value_finishFn = extern(C) const(GValue)* function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_clipboard_read_value_finishFn c_gdk_clipboard_read_value_finish; ///
private alias c_gdk_clipboard_setFn = extern(C) void function(GdkClipboard* clipboard, GType type,  ...) nothrow;
__gshared c_gdk_clipboard_setFn c_gdk_clipboard_set; ///
private alias c_gdk_clipboard_set_contentFn = extern(C) gboolean function(GdkClipboard* clipboard, GdkContentProvider* provider) nothrow;
__gshared c_gdk_clipboard_set_contentFn c_gdk_clipboard_set_content; ///
private alias c_gdk_clipboard_set_textFn = extern(C) void function(GdkClipboard* clipboard, const(char)* text) nothrow;
__gshared c_gdk_clipboard_set_textFn c_gdk_clipboard_set_text; ///
private alias c_gdk_clipboard_set_textureFn = extern(C) void function(GdkClipboard* clipboard, GdkTexture* texture) nothrow;
__gshared c_gdk_clipboard_set_textureFn c_gdk_clipboard_set_texture; ///
private alias c_gdk_clipboard_set_valistFn = extern(C) void function(GdkClipboard* clipboard, GType type, void* args) nothrow;
__gshared c_gdk_clipboard_set_valistFn c_gdk_clipboard_set_valist; ///
private alias c_gdk_clipboard_set_valueFn = extern(C) void function(GdkClipboard* clipboard, const(GValue)* value) nothrow;
__gshared c_gdk_clipboard_set_valueFn c_gdk_clipboard_set_value; ///
private alias c_gdk_clipboard_store_asyncFn = extern(C) void function(GdkClipboard* clipboard, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_clipboard_store_asyncFn c_gdk_clipboard_store_async; ///
private alias c_gdk_clipboard_store_finishFn = extern(C) gboolean function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_clipboard_store_finishFn c_gdk_clipboard_store_finish; ///

// ColorState
private alias c_gdk_color_state_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_color_state_get_typeFn c_gdk_color_state_get_type; ///
private alias c_gdk_color_state_create_cicp_paramsFn = extern(C) GdkCicpParams* function(GdkColorState* self) nothrow;
__gshared c_gdk_color_state_create_cicp_paramsFn c_gdk_color_state_create_cicp_params; ///
private alias c_gdk_color_state_equalFn = extern(C) gboolean function(GdkColorState* self, GdkColorState* other) nothrow;
__gshared c_gdk_color_state_equalFn c_gdk_color_state_equal; ///
private alias c_gdk_color_state_equivalentFn = extern(C) gboolean function(GdkColorState* self, GdkColorState* other) nothrow;
__gshared c_gdk_color_state_equivalentFn c_gdk_color_state_equivalent; ///
private alias c_gdk_color_state_refFn = extern(C) GdkColorState* function(GdkColorState* self) nothrow;
__gshared c_gdk_color_state_refFn c_gdk_color_state_ref; ///
private alias c_gdk_color_state_unrefFn = extern(C) void function(GdkColorState* self) nothrow;
__gshared c_gdk_color_state_unrefFn c_gdk_color_state_unref; ///
private alias c_gdk_color_state_get_oklabFn = extern(C) GdkColorState* function() nothrow;
__gshared c_gdk_color_state_get_oklabFn c_gdk_color_state_get_oklab; ///
private alias c_gdk_color_state_get_oklchFn = extern(C) GdkColorState* function() nothrow;
__gshared c_gdk_color_state_get_oklchFn c_gdk_color_state_get_oklch; ///
private alias c_gdk_color_state_get_rec2100_linearFn = extern(C) GdkColorState* function() nothrow;
__gshared c_gdk_color_state_get_rec2100_linearFn c_gdk_color_state_get_rec2100_linear; ///
private alias c_gdk_color_state_get_rec2100_pqFn = extern(C) GdkColorState* function() nothrow;
__gshared c_gdk_color_state_get_rec2100_pqFn c_gdk_color_state_get_rec2100_pq; ///
private alias c_gdk_color_state_get_srgbFn = extern(C) GdkColorState* function() nothrow;
__gshared c_gdk_color_state_get_srgbFn c_gdk_color_state_get_srgb; ///
private alias c_gdk_color_state_get_srgb_linearFn = extern(C) GdkColorState* function() nothrow;
__gshared c_gdk_color_state_get_srgb_linearFn c_gdk_color_state_get_srgb_linear; ///

// ContentDeserializer
private alias c_gdk_content_deserializer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_content_deserializer_get_typeFn c_gdk_content_deserializer_get_type; ///
private alias c_gdk_content_deserializer_get_cancellableFn = extern(C) GCancellable* function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_cancellableFn c_gdk_content_deserializer_get_cancellable; ///
private alias c_gdk_content_deserializer_get_gtypeFn = extern(C) GType function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_gtypeFn c_gdk_content_deserializer_get_gtype; ///
private alias c_gdk_content_deserializer_get_input_streamFn = extern(C) GInputStream* function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_input_streamFn c_gdk_content_deserializer_get_input_stream; ///
private alias c_gdk_content_deserializer_get_mime_typeFn = extern(C) const(char)* function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_mime_typeFn c_gdk_content_deserializer_get_mime_type; ///
private alias c_gdk_content_deserializer_get_priorityFn = extern(C) int function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_priorityFn c_gdk_content_deserializer_get_priority; ///
private alias c_gdk_content_deserializer_get_task_dataFn = extern(C) void* function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_task_dataFn c_gdk_content_deserializer_get_task_data; ///
private alias c_gdk_content_deserializer_get_user_dataFn = extern(C) void* function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_user_dataFn c_gdk_content_deserializer_get_user_data; ///
private alias c_gdk_content_deserializer_get_valueFn = extern(C) GValue* function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_get_valueFn c_gdk_content_deserializer_get_value; ///
private alias c_gdk_content_deserializer_return_errorFn = extern(C) void function(GdkContentDeserializer* deserializer, GError* error) nothrow;
__gshared c_gdk_content_deserializer_return_errorFn c_gdk_content_deserializer_return_error; ///
private alias c_gdk_content_deserializer_return_successFn = extern(C) void function(GdkContentDeserializer* deserializer) nothrow;
__gshared c_gdk_content_deserializer_return_successFn c_gdk_content_deserializer_return_success; ///
private alias c_gdk_content_deserializer_set_task_dataFn = extern(C) void function(GdkContentDeserializer* deserializer, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_content_deserializer_set_task_dataFn c_gdk_content_deserializer_set_task_data; ///

// ContentFormats
private alias c_gdk_content_formats_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_content_formats_get_typeFn c_gdk_content_formats_get_type; ///
private alias c_gdk_content_formats_newFn = extern(C) GdkContentFormats* function(const(char*)* mimeTypes, uint nMimeTypes) nothrow;
__gshared c_gdk_content_formats_newFn c_gdk_content_formats_new; ///
private alias c_gdk_content_formats_new_for_gtypeFn = extern(C) GdkContentFormats* function(GType type) nothrow;
__gshared c_gdk_content_formats_new_for_gtypeFn c_gdk_content_formats_new_for_gtype; ///
private alias c_gdk_content_formats_contain_gtypeFn = extern(C) gboolean function(const(GdkContentFormats)* formats, GType type) nothrow;
__gshared c_gdk_content_formats_contain_gtypeFn c_gdk_content_formats_contain_gtype; ///
private alias c_gdk_content_formats_contain_mime_typeFn = extern(C) gboolean function(const(GdkContentFormats)* formats, const(char)* mimeType) nothrow;
__gshared c_gdk_content_formats_contain_mime_typeFn c_gdk_content_formats_contain_mime_type; ///
private alias c_gdk_content_formats_get_gtypesFn = extern(C) const(GType)* function(const(GdkContentFormats)* formats, size_t* nGtypes) nothrow;
__gshared c_gdk_content_formats_get_gtypesFn c_gdk_content_formats_get_gtypes; ///
private alias c_gdk_content_formats_get_mime_typesFn = extern(C) const(char*)* function(const(GdkContentFormats)* formats, size_t* nMimeTypes) nothrow;
__gshared c_gdk_content_formats_get_mime_typesFn c_gdk_content_formats_get_mime_types; ///
private alias c_gdk_content_formats_is_emptyFn = extern(C) gboolean function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_is_emptyFn c_gdk_content_formats_is_empty; ///
private alias c_gdk_content_formats_matchFn = extern(C) gboolean function(const(GdkContentFormats)* first, const(GdkContentFormats)* second) nothrow;
__gshared c_gdk_content_formats_matchFn c_gdk_content_formats_match; ///
private alias c_gdk_content_formats_match_gtypeFn = extern(C) GType function(const(GdkContentFormats)* first, const(GdkContentFormats)* second) nothrow;
__gshared c_gdk_content_formats_match_gtypeFn c_gdk_content_formats_match_gtype; ///
private alias c_gdk_content_formats_match_mime_typeFn = extern(C) const(char)* function(const(GdkContentFormats)* first, const(GdkContentFormats)* second) nothrow;
__gshared c_gdk_content_formats_match_mime_typeFn c_gdk_content_formats_match_mime_type; ///
private alias c_gdk_content_formats_printFn = extern(C) void function(GdkContentFormats* formats, GString* string_) nothrow;
__gshared c_gdk_content_formats_printFn c_gdk_content_formats_print; ///
private alias c_gdk_content_formats_refFn = extern(C) GdkContentFormats* function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_refFn c_gdk_content_formats_ref; ///
private alias c_gdk_content_formats_to_stringFn = extern(C) char* function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_to_stringFn c_gdk_content_formats_to_string; ///
private alias c_gdk_content_formats_unionFn = extern(C) GdkContentFormats* function(GdkContentFormats* first, const(GdkContentFormats)* second) nothrow;
__gshared c_gdk_content_formats_unionFn c_gdk_content_formats_union; ///
private alias c_gdk_content_formats_union_deserialize_gtypesFn = extern(C) GdkContentFormats* function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_union_deserialize_gtypesFn c_gdk_content_formats_union_deserialize_gtypes; ///
private alias c_gdk_content_formats_union_deserialize_mime_typesFn = extern(C) GdkContentFormats* function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_union_deserialize_mime_typesFn c_gdk_content_formats_union_deserialize_mime_types; ///
private alias c_gdk_content_formats_union_serialize_gtypesFn = extern(C) GdkContentFormats* function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_union_serialize_gtypesFn c_gdk_content_formats_union_serialize_gtypes; ///
private alias c_gdk_content_formats_union_serialize_mime_typesFn = extern(C) GdkContentFormats* function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_union_serialize_mime_typesFn c_gdk_content_formats_union_serialize_mime_types; ///
private alias c_gdk_content_formats_unrefFn = extern(C) void function(GdkContentFormats* formats) nothrow;
__gshared c_gdk_content_formats_unrefFn c_gdk_content_formats_unref; ///
private alias c_gdk_content_formats_parseFn = extern(C) GdkContentFormats* function(const(char)* string_) nothrow;
__gshared c_gdk_content_formats_parseFn c_gdk_content_formats_parse; ///

// ContentFormatsBuilder
private alias c_gdk_content_formats_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_content_formats_builder_get_typeFn c_gdk_content_formats_builder_get_type; ///
private alias c_gdk_content_formats_builder_newFn = extern(C) GdkContentFormatsBuilder* function() nothrow;
__gshared c_gdk_content_formats_builder_newFn c_gdk_content_formats_builder_new; ///
private alias c_gdk_content_formats_builder_add_formatsFn = extern(C) void function(GdkContentFormatsBuilder* builder, const(GdkContentFormats)* formats) nothrow;
__gshared c_gdk_content_formats_builder_add_formatsFn c_gdk_content_formats_builder_add_formats; ///
private alias c_gdk_content_formats_builder_add_gtypeFn = extern(C) void function(GdkContentFormatsBuilder* builder, GType type) nothrow;
__gshared c_gdk_content_formats_builder_add_gtypeFn c_gdk_content_formats_builder_add_gtype; ///
private alias c_gdk_content_formats_builder_add_mime_typeFn = extern(C) void function(GdkContentFormatsBuilder* builder, const(char)* mimeType) nothrow;
__gshared c_gdk_content_formats_builder_add_mime_typeFn c_gdk_content_formats_builder_add_mime_type; ///
private alias c_gdk_content_formats_builder_free_to_formatsFn = extern(C) GdkContentFormats* function(GdkContentFormatsBuilder* builder) nothrow;
__gshared c_gdk_content_formats_builder_free_to_formatsFn c_gdk_content_formats_builder_free_to_formats; ///
private alias c_gdk_content_formats_builder_refFn = extern(C) GdkContentFormatsBuilder* function(GdkContentFormatsBuilder* builder) nothrow;
__gshared c_gdk_content_formats_builder_refFn c_gdk_content_formats_builder_ref; ///
private alias c_gdk_content_formats_builder_to_formatsFn = extern(C) GdkContentFormats* function(GdkContentFormatsBuilder* builder) nothrow;
__gshared c_gdk_content_formats_builder_to_formatsFn c_gdk_content_formats_builder_to_formats; ///
private alias c_gdk_content_formats_builder_unrefFn = extern(C) void function(GdkContentFormatsBuilder* builder) nothrow;
__gshared c_gdk_content_formats_builder_unrefFn c_gdk_content_formats_builder_unref; ///

// ContentProvider
private alias c_gdk_content_provider_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_content_provider_get_typeFn c_gdk_content_provider_get_type; ///
private alias c_gdk_content_provider_new_for_bytesFn = extern(C) GdkContentProvider* function(const(char)* mimeType, GBytes* bytes) nothrow;
__gshared c_gdk_content_provider_new_for_bytesFn c_gdk_content_provider_new_for_bytes; ///
private alias c_gdk_content_provider_new_for_valueFn = extern(C) GdkContentProvider* function(const(GValue)* value) nothrow;
__gshared c_gdk_content_provider_new_for_valueFn c_gdk_content_provider_new_for_value; ///
private alias c_gdk_content_provider_new_typedFn = extern(C) GdkContentProvider* function(GType type,  ...) nothrow;
__gshared c_gdk_content_provider_new_typedFn c_gdk_content_provider_new_typed; ///
private alias c_gdk_content_provider_new_unionFn = extern(C) GdkContentProvider* function(GdkContentProvider** providers, size_t nProviders) nothrow;
__gshared c_gdk_content_provider_new_unionFn c_gdk_content_provider_new_union; ///
private alias c_gdk_content_provider_content_changedFn = extern(C) void function(GdkContentProvider* provider) nothrow;
__gshared c_gdk_content_provider_content_changedFn c_gdk_content_provider_content_changed; ///
private alias c_gdk_content_provider_get_valueFn = extern(C) gboolean function(GdkContentProvider* provider, GValue* value, GError** _err) nothrow;
__gshared c_gdk_content_provider_get_valueFn c_gdk_content_provider_get_value; ///
private alias c_gdk_content_provider_ref_formatsFn = extern(C) GdkContentFormats* function(GdkContentProvider* provider) nothrow;
__gshared c_gdk_content_provider_ref_formatsFn c_gdk_content_provider_ref_formats; ///
private alias c_gdk_content_provider_ref_storable_formatsFn = extern(C) GdkContentFormats* function(GdkContentProvider* provider) nothrow;
__gshared c_gdk_content_provider_ref_storable_formatsFn c_gdk_content_provider_ref_storable_formats; ///
private alias c_gdk_content_provider_write_mime_type_asyncFn = extern(C) void function(GdkContentProvider* provider, const(char)* mimeType, GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_content_provider_write_mime_type_asyncFn c_gdk_content_provider_write_mime_type_async; ///
private alias c_gdk_content_provider_write_mime_type_finishFn = extern(C) gboolean function(GdkContentProvider* provider, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_content_provider_write_mime_type_finishFn c_gdk_content_provider_write_mime_type_finish; ///

// ContentSerializer
private alias c_gdk_content_serializer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_content_serializer_get_typeFn c_gdk_content_serializer_get_type; ///
private alias c_gdk_content_serializer_get_cancellableFn = extern(C) GCancellable* function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_cancellableFn c_gdk_content_serializer_get_cancellable; ///
private alias c_gdk_content_serializer_get_gtypeFn = extern(C) GType function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_gtypeFn c_gdk_content_serializer_get_gtype; ///
private alias c_gdk_content_serializer_get_mime_typeFn = extern(C) const(char)* function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_mime_typeFn c_gdk_content_serializer_get_mime_type; ///
private alias c_gdk_content_serializer_get_output_streamFn = extern(C) GOutputStream* function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_output_streamFn c_gdk_content_serializer_get_output_stream; ///
private alias c_gdk_content_serializer_get_priorityFn = extern(C) int function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_priorityFn c_gdk_content_serializer_get_priority; ///
private alias c_gdk_content_serializer_get_task_dataFn = extern(C) void* function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_task_dataFn c_gdk_content_serializer_get_task_data; ///
private alias c_gdk_content_serializer_get_user_dataFn = extern(C) void* function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_user_dataFn c_gdk_content_serializer_get_user_data; ///
private alias c_gdk_content_serializer_get_valueFn = extern(C) const(GValue)* function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_get_valueFn c_gdk_content_serializer_get_value; ///
private alias c_gdk_content_serializer_return_errorFn = extern(C) void function(GdkContentSerializer* serializer, GError* error) nothrow;
__gshared c_gdk_content_serializer_return_errorFn c_gdk_content_serializer_return_error; ///
private alias c_gdk_content_serializer_return_successFn = extern(C) void function(GdkContentSerializer* serializer) nothrow;
__gshared c_gdk_content_serializer_return_successFn c_gdk_content_serializer_return_success; ///
private alias c_gdk_content_serializer_set_task_dataFn = extern(C) void function(GdkContentSerializer* serializer, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_content_serializer_set_task_dataFn c_gdk_content_serializer_set_task_data; ///

// CrossingEvent
private alias c_gdk_crossing_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_crossing_event_get_typeFn c_gdk_crossing_event_get_type; ///
private alias c_gdk_crossing_event_get_detailFn = extern(C) GdkNotifyType function(GdkEvent* event) nothrow;
__gshared c_gdk_crossing_event_get_detailFn c_gdk_crossing_event_get_detail; ///
private alias c_gdk_crossing_event_get_focusFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_crossing_event_get_focusFn c_gdk_crossing_event_get_focus; ///
private alias c_gdk_crossing_event_get_modeFn = extern(C) GdkCrossingMode function(GdkEvent* event) nothrow;
__gshared c_gdk_crossing_event_get_modeFn c_gdk_crossing_event_get_mode; ///

// Cursor
private alias c_gdk_cursor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_cursor_get_typeFn c_gdk_cursor_get_type; ///
private alias c_gdk_cursor_new_from_callbackFn = extern(C) GdkCursor* function(GdkCursorGetTextureCallback callback, void* data, GDestroyNotify destroy, GdkCursor* fallback) nothrow;
__gshared c_gdk_cursor_new_from_callbackFn c_gdk_cursor_new_from_callback; ///
private alias c_gdk_cursor_new_from_nameFn = extern(C) GdkCursor* function(const(char)* name, GdkCursor* fallback) nothrow;
__gshared c_gdk_cursor_new_from_nameFn c_gdk_cursor_new_from_name; ///
private alias c_gdk_cursor_new_from_textureFn = extern(C) GdkCursor* function(GdkTexture* texture, int hotspotX, int hotspotY, GdkCursor* fallback) nothrow;
__gshared c_gdk_cursor_new_from_textureFn c_gdk_cursor_new_from_texture; ///
private alias c_gdk_cursor_get_fallbackFn = extern(C) GdkCursor* function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_fallbackFn c_gdk_cursor_get_fallback; ///
private alias c_gdk_cursor_get_hotspot_xFn = extern(C) int function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_hotspot_xFn c_gdk_cursor_get_hotspot_x; ///
private alias c_gdk_cursor_get_hotspot_yFn = extern(C) int function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_hotspot_yFn c_gdk_cursor_get_hotspot_y; ///
private alias c_gdk_cursor_get_nameFn = extern(C) const(char)* function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_nameFn c_gdk_cursor_get_name; ///
private alias c_gdk_cursor_get_textureFn = extern(C) GdkTexture* function(GdkCursor* cursor) nothrow;
__gshared c_gdk_cursor_get_textureFn c_gdk_cursor_get_texture; ///

// DNDEvent
private alias c_gdk_dnd_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_dnd_event_get_typeFn c_gdk_dnd_event_get_type; ///
private alias c_gdk_dnd_event_get_dropFn = extern(C) GdkDrop* function(GdkEvent* event) nothrow;
__gshared c_gdk_dnd_event_get_dropFn c_gdk_dnd_event_get_drop; ///

// DeleteEvent
private alias c_gdk_delete_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_delete_event_get_typeFn c_gdk_delete_event_get_type; ///

// Device
private alias c_gdk_device_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_device_get_typeFn c_gdk_device_get_type; ///
private alias c_gdk_device_get_active_layout_indexFn = extern(C) int function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_active_layout_indexFn c_gdk_device_get_active_layout_index; ///
private alias c_gdk_device_get_caps_lock_stateFn = extern(C) gboolean function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_caps_lock_stateFn c_gdk_device_get_caps_lock_state; ///
private alias c_gdk_device_get_device_toolFn = extern(C) GdkDeviceTool* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_device_toolFn c_gdk_device_get_device_tool; ///
private alias c_gdk_device_get_directionFn = extern(C) PangoDirection function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_directionFn c_gdk_device_get_direction; ///
private alias c_gdk_device_get_displayFn = extern(C) GdkDisplay* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_displayFn c_gdk_device_get_display; ///
private alias c_gdk_device_get_has_cursorFn = extern(C) gboolean function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_has_cursorFn c_gdk_device_get_has_cursor; ///
private alias c_gdk_device_get_layout_namesFn = extern(C) char** function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_layout_namesFn c_gdk_device_get_layout_names; ///
private alias c_gdk_device_get_modifier_stateFn = extern(C) GdkModifierType function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_modifier_stateFn c_gdk_device_get_modifier_state; ///
private alias c_gdk_device_get_nameFn = extern(C) const(char)* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_nameFn c_gdk_device_get_name; ///
private alias c_gdk_device_get_num_lock_stateFn = extern(C) gboolean function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_num_lock_stateFn c_gdk_device_get_num_lock_state; ///
private alias c_gdk_device_get_num_touchesFn = extern(C) uint function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_num_touchesFn c_gdk_device_get_num_touches; ///
private alias c_gdk_device_get_product_idFn = extern(C) const(char)* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_product_idFn c_gdk_device_get_product_id; ///
private alias c_gdk_device_get_scroll_lock_stateFn = extern(C) gboolean function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_scroll_lock_stateFn c_gdk_device_get_scroll_lock_state; ///
private alias c_gdk_device_get_seatFn = extern(C) GdkSeat* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_seatFn c_gdk_device_get_seat; ///
private alias c_gdk_device_get_sourceFn = extern(C) GdkInputSource function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_sourceFn c_gdk_device_get_source; ///
private alias c_gdk_device_get_surface_at_positionFn = extern(C) GdkSurface* function(GdkDevice* device, double* winX, double* winY) nothrow;
__gshared c_gdk_device_get_surface_at_positionFn c_gdk_device_get_surface_at_position; ///
private alias c_gdk_device_get_timestampFn = extern(C) uint function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_timestampFn c_gdk_device_get_timestamp; ///
private alias c_gdk_device_get_vendor_idFn = extern(C) const(char)* function(GdkDevice* device) nothrow;
__gshared c_gdk_device_get_vendor_idFn c_gdk_device_get_vendor_id; ///
private alias c_gdk_device_has_bidi_layoutsFn = extern(C) gboolean function(GdkDevice* device) nothrow;
__gshared c_gdk_device_has_bidi_layoutsFn c_gdk_device_has_bidi_layouts; ///

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
private alias c_gdk_device_tool_get_axesFn = extern(C) GdkAxisFlags function(GdkDeviceTool* tool) nothrow;
__gshared c_gdk_device_tool_get_axesFn c_gdk_device_tool_get_axes; ///
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
private alias c_gdk_display_beepFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_beepFn c_gdk_display_beep; ///
private alias c_gdk_display_closeFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_closeFn c_gdk_display_close; ///
private alias c_gdk_display_create_gl_contextFn = extern(C) GdkGLContext* function(GdkDisplay* self, GError** _err) nothrow;
__gshared c_gdk_display_create_gl_contextFn c_gdk_display_create_gl_context; ///
private alias c_gdk_display_device_is_grabbedFn = extern(C) gboolean function(GdkDisplay* display, GdkDevice* device) nothrow;
__gshared c_gdk_display_device_is_grabbedFn c_gdk_display_device_is_grabbed; ///
private alias c_gdk_display_flushFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_flushFn c_gdk_display_flush; ///
private alias c_gdk_display_get_app_launch_contextFn = extern(C) GdkAppLaunchContext* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_app_launch_contextFn c_gdk_display_get_app_launch_context; ///
private alias c_gdk_display_get_clipboardFn = extern(C) GdkClipboard* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_clipboardFn c_gdk_display_get_clipboard; ///
private alias c_gdk_display_get_default_seatFn = extern(C) GdkSeat* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_default_seatFn c_gdk_display_get_default_seat; ///
private alias c_gdk_display_get_dmabuf_formatsFn = extern(C) GdkDmabufFormats* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_dmabuf_formatsFn c_gdk_display_get_dmabuf_formats; ///
private alias c_gdk_display_get_monitor_at_surfaceFn = extern(C) GdkMonitor* function(GdkDisplay* display, GdkSurface* surface) nothrow;
__gshared c_gdk_display_get_monitor_at_surfaceFn c_gdk_display_get_monitor_at_surface; ///
private alias c_gdk_display_get_monitorsFn = extern(C) GListModel* function(GdkDisplay* self) nothrow;
__gshared c_gdk_display_get_monitorsFn c_gdk_display_get_monitors; ///
private alias c_gdk_display_get_nameFn = extern(C) const(char)* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_nameFn c_gdk_display_get_name; ///
private alias c_gdk_display_get_primary_clipboardFn = extern(C) GdkClipboard* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_primary_clipboardFn c_gdk_display_get_primary_clipboard; ///
private alias c_gdk_display_get_settingFn = extern(C) gboolean function(GdkDisplay* display, const(char)* name, GValue* value) nothrow;
__gshared c_gdk_display_get_settingFn c_gdk_display_get_setting; ///
private alias c_gdk_display_get_startup_notification_idFn = extern(C) const(char)* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_get_startup_notification_idFn c_gdk_display_get_startup_notification_id; ///
private alias c_gdk_display_is_closedFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_is_closedFn c_gdk_display_is_closed; ///
private alias c_gdk_display_is_compositedFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_is_compositedFn c_gdk_display_is_composited; ///
private alias c_gdk_display_is_rgbaFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_is_rgbaFn c_gdk_display_is_rgba; ///
private alias c_gdk_display_list_seatsFn = extern(C) GList* function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_list_seatsFn c_gdk_display_list_seats; ///
private alias c_gdk_display_map_keycodeFn = extern(C) gboolean function(GdkDisplay* display, uint keycode, GdkKeymapKey** keys, uint** keyvals, int* nEntries) nothrow;
__gshared c_gdk_display_map_keycodeFn c_gdk_display_map_keycode; ///
private alias c_gdk_display_map_keyvalFn = extern(C) gboolean function(GdkDisplay* display, uint keyval, GdkKeymapKey** keys, int* nKeys) nothrow;
__gshared c_gdk_display_map_keyvalFn c_gdk_display_map_keyval; ///
private alias c_gdk_display_notify_startup_completeFn = extern(C) void function(GdkDisplay* display, const(char)* startupId) nothrow;
__gshared c_gdk_display_notify_startup_completeFn c_gdk_display_notify_startup_complete; ///
private alias c_gdk_display_prepare_glFn = extern(C) gboolean function(GdkDisplay* self, GError** _err) nothrow;
__gshared c_gdk_display_prepare_glFn c_gdk_display_prepare_gl; ///
private alias c_gdk_display_put_eventFn = extern(C) void function(GdkDisplay* display, GdkEvent* event) nothrow;
__gshared c_gdk_display_put_eventFn c_gdk_display_put_event; ///
private alias c_gdk_display_supports_input_shapesFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_input_shapesFn c_gdk_display_supports_input_shapes; ///
private alias c_gdk_display_supports_shadow_widthFn = extern(C) gboolean function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_supports_shadow_widthFn c_gdk_display_supports_shadow_width; ///
private alias c_gdk_display_syncFn = extern(C) void function(GdkDisplay* display) nothrow;
__gshared c_gdk_display_syncFn c_gdk_display_sync; ///
private alias c_gdk_display_translate_keyFn = extern(C) gboolean function(GdkDisplay* display, uint keycode, GdkModifierType state, int group, uint* keyval, int* effectiveGroup, int* level, GdkModifierType* consumed) nothrow;
__gshared c_gdk_display_translate_keyFn c_gdk_display_translate_key; ///

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

// DmabufFormats
private alias c_gdk_dmabuf_formats_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_dmabuf_formats_get_typeFn c_gdk_dmabuf_formats_get_type; ///
private alias c_gdk_dmabuf_formats_containsFn = extern(C) gboolean function(GdkDmabufFormats* formats, uint fourcc, ulong modifier) nothrow;
__gshared c_gdk_dmabuf_formats_containsFn c_gdk_dmabuf_formats_contains; ///
private alias c_gdk_dmabuf_formats_equalFn = extern(C) gboolean function(const(GdkDmabufFormats)* formats1, const(GdkDmabufFormats)* formats2) nothrow;
__gshared c_gdk_dmabuf_formats_equalFn c_gdk_dmabuf_formats_equal; ///
private alias c_gdk_dmabuf_formats_get_formatFn = extern(C) void function(GdkDmabufFormats* formats, size_t idx, uint* fourcc, ulong* modifier) nothrow;
__gshared c_gdk_dmabuf_formats_get_formatFn c_gdk_dmabuf_formats_get_format; ///
private alias c_gdk_dmabuf_formats_get_n_formatsFn = extern(C) size_t function(GdkDmabufFormats* formats) nothrow;
__gshared c_gdk_dmabuf_formats_get_n_formatsFn c_gdk_dmabuf_formats_get_n_formats; ///
private alias c_gdk_dmabuf_formats_refFn = extern(C) GdkDmabufFormats* function(GdkDmabufFormats* formats) nothrow;
__gshared c_gdk_dmabuf_formats_refFn c_gdk_dmabuf_formats_ref; ///
private alias c_gdk_dmabuf_formats_unrefFn = extern(C) void function(GdkDmabufFormats* formats) nothrow;
__gshared c_gdk_dmabuf_formats_unrefFn c_gdk_dmabuf_formats_unref; ///

// DmabufTexture
private alias c_gdk_dmabuf_texture_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_dmabuf_texture_get_typeFn c_gdk_dmabuf_texture_get_type; ///

// DmabufTextureBuilder
private alias c_gdk_dmabuf_texture_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_typeFn c_gdk_dmabuf_texture_builder_get_type; ///
private alias c_gdk_dmabuf_texture_builder_newFn = extern(C) GdkDmabufTextureBuilder* function() nothrow;
__gshared c_gdk_dmabuf_texture_builder_newFn c_gdk_dmabuf_texture_builder_new; ///
private alias c_gdk_dmabuf_texture_builder_buildFn = extern(C) GdkTexture* function(GdkDmabufTextureBuilder* self, GDestroyNotify destroy, void* data, GError** _err) nothrow;
__gshared c_gdk_dmabuf_texture_builder_buildFn c_gdk_dmabuf_texture_builder_build; ///
private alias c_gdk_dmabuf_texture_builder_get_color_stateFn = extern(C) GdkColorState* function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_color_stateFn c_gdk_dmabuf_texture_builder_get_color_state; ///
private alias c_gdk_dmabuf_texture_builder_get_displayFn = extern(C) GdkDisplay* function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_displayFn c_gdk_dmabuf_texture_builder_get_display; ///
private alias c_gdk_dmabuf_texture_builder_get_fdFn = extern(C) int function(GdkDmabufTextureBuilder* self, uint plane) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_fdFn c_gdk_dmabuf_texture_builder_get_fd; ///
private alias c_gdk_dmabuf_texture_builder_get_fourccFn = extern(C) uint function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_fourccFn c_gdk_dmabuf_texture_builder_get_fourcc; ///
private alias c_gdk_dmabuf_texture_builder_get_heightFn = extern(C) uint function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_heightFn c_gdk_dmabuf_texture_builder_get_height; ///
private alias c_gdk_dmabuf_texture_builder_get_modifierFn = extern(C) ulong function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_modifierFn c_gdk_dmabuf_texture_builder_get_modifier; ///
private alias c_gdk_dmabuf_texture_builder_get_n_planesFn = extern(C) uint function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_n_planesFn c_gdk_dmabuf_texture_builder_get_n_planes; ///
private alias c_gdk_dmabuf_texture_builder_get_offsetFn = extern(C) uint function(GdkDmabufTextureBuilder* self, uint plane) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_offsetFn c_gdk_dmabuf_texture_builder_get_offset; ///
private alias c_gdk_dmabuf_texture_builder_get_premultipliedFn = extern(C) gboolean function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_premultipliedFn c_gdk_dmabuf_texture_builder_get_premultiplied; ///
private alias c_gdk_dmabuf_texture_builder_get_strideFn = extern(C) uint function(GdkDmabufTextureBuilder* self, uint plane) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_strideFn c_gdk_dmabuf_texture_builder_get_stride; ///
private alias c_gdk_dmabuf_texture_builder_get_update_regionFn = extern(C) cairo_region_t* function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_update_regionFn c_gdk_dmabuf_texture_builder_get_update_region; ///
private alias c_gdk_dmabuf_texture_builder_get_update_textureFn = extern(C) GdkTexture* function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_update_textureFn c_gdk_dmabuf_texture_builder_get_update_texture; ///
private alias c_gdk_dmabuf_texture_builder_get_widthFn = extern(C) uint function(GdkDmabufTextureBuilder* self) nothrow;
__gshared c_gdk_dmabuf_texture_builder_get_widthFn c_gdk_dmabuf_texture_builder_get_width; ///
private alias c_gdk_dmabuf_texture_builder_set_color_stateFn = extern(C) void function(GdkDmabufTextureBuilder* self, GdkColorState* colorState) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_color_stateFn c_gdk_dmabuf_texture_builder_set_color_state; ///
private alias c_gdk_dmabuf_texture_builder_set_displayFn = extern(C) void function(GdkDmabufTextureBuilder* self, GdkDisplay* display) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_displayFn c_gdk_dmabuf_texture_builder_set_display; ///
private alias c_gdk_dmabuf_texture_builder_set_fdFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint plane, int fd) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_fdFn c_gdk_dmabuf_texture_builder_set_fd; ///
private alias c_gdk_dmabuf_texture_builder_set_fourccFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint fourcc) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_fourccFn c_gdk_dmabuf_texture_builder_set_fourcc; ///
private alias c_gdk_dmabuf_texture_builder_set_heightFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint height) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_heightFn c_gdk_dmabuf_texture_builder_set_height; ///
private alias c_gdk_dmabuf_texture_builder_set_modifierFn = extern(C) void function(GdkDmabufTextureBuilder* self, ulong modifier) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_modifierFn c_gdk_dmabuf_texture_builder_set_modifier; ///
private alias c_gdk_dmabuf_texture_builder_set_n_planesFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint nPlanes) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_n_planesFn c_gdk_dmabuf_texture_builder_set_n_planes; ///
private alias c_gdk_dmabuf_texture_builder_set_offsetFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint plane, uint offset) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_offsetFn c_gdk_dmabuf_texture_builder_set_offset; ///
private alias c_gdk_dmabuf_texture_builder_set_premultipliedFn = extern(C) void function(GdkDmabufTextureBuilder* self, gboolean premultiplied) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_premultipliedFn c_gdk_dmabuf_texture_builder_set_premultiplied; ///
private alias c_gdk_dmabuf_texture_builder_set_strideFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint plane, uint stride) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_strideFn c_gdk_dmabuf_texture_builder_set_stride; ///
private alias c_gdk_dmabuf_texture_builder_set_update_regionFn = extern(C) void function(GdkDmabufTextureBuilder* self, cairo_region_t* region) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_update_regionFn c_gdk_dmabuf_texture_builder_set_update_region; ///
private alias c_gdk_dmabuf_texture_builder_set_update_textureFn = extern(C) void function(GdkDmabufTextureBuilder* self, GdkTexture* texture) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_update_textureFn c_gdk_dmabuf_texture_builder_set_update_texture; ///
private alias c_gdk_dmabuf_texture_builder_set_widthFn = extern(C) void function(GdkDmabufTextureBuilder* self, uint width) nothrow;
__gshared c_gdk_dmabuf_texture_builder_set_widthFn c_gdk_dmabuf_texture_builder_set_width; ///

// Drag
private alias c_gdk_drag_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_drag_get_typeFn c_gdk_drag_get_type; ///
private alias c_gdk_drag_beginFn = extern(C) GdkDrag* function(GdkSurface* surface, GdkDevice* device, GdkContentProvider* content, GdkDragAction actions, double dx, double dy) nothrow;
__gshared c_gdk_drag_beginFn c_gdk_drag_begin; ///
private alias c_gdk_drag_drop_doneFn = extern(C) void function(GdkDrag* drag, gboolean success) nothrow;
__gshared c_gdk_drag_drop_doneFn c_gdk_drag_drop_done; ///
private alias c_gdk_drag_get_actionsFn = extern(C) GdkDragAction function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_actionsFn c_gdk_drag_get_actions; ///
private alias c_gdk_drag_get_contentFn = extern(C) GdkContentProvider* function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_contentFn c_gdk_drag_get_content; ///
private alias c_gdk_drag_get_deviceFn = extern(C) GdkDevice* function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_deviceFn c_gdk_drag_get_device; ///
private alias c_gdk_drag_get_displayFn = extern(C) GdkDisplay* function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_displayFn c_gdk_drag_get_display; ///
private alias c_gdk_drag_get_drag_surfaceFn = extern(C) GdkSurface* function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_drag_surfaceFn c_gdk_drag_get_drag_surface; ///
private alias c_gdk_drag_get_formatsFn = extern(C) GdkContentFormats* function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_formatsFn c_gdk_drag_get_formats; ///
private alias c_gdk_drag_get_selected_actionFn = extern(C) GdkDragAction function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_selected_actionFn c_gdk_drag_get_selected_action; ///
private alias c_gdk_drag_get_surfaceFn = extern(C) GdkSurface* function(GdkDrag* drag) nothrow;
__gshared c_gdk_drag_get_surfaceFn c_gdk_drag_get_surface; ///
private alias c_gdk_drag_set_hotspotFn = extern(C) void function(GdkDrag* drag, int hotX, int hotY) nothrow;
__gshared c_gdk_drag_set_hotspotFn c_gdk_drag_set_hotspot; ///

// DragSurface
private alias c_gdk_drag_surface_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_drag_surface_get_typeFn c_gdk_drag_surface_get_type; ///
private alias c_gdk_drag_surface_presentFn = extern(C) gboolean function(GdkDragSurface* dragSurface, int width, int height) nothrow;
__gshared c_gdk_drag_surface_presentFn c_gdk_drag_surface_present; ///

// DragSurfaceSize
private alias c_gdk_drag_surface_size_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_drag_surface_size_get_typeFn c_gdk_drag_surface_size_get_type; ///
private alias c_gdk_drag_surface_size_set_sizeFn = extern(C) void function(GdkDragSurfaceSize* size, int width, int height) nothrow;
__gshared c_gdk_drag_surface_size_set_sizeFn c_gdk_drag_surface_size_set_size; ///

// DrawContext
private alias c_gdk_draw_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_draw_context_get_typeFn c_gdk_draw_context_get_type; ///
private alias c_gdk_draw_context_begin_frameFn = extern(C) void function(GdkDrawContext* context, const(cairo_region_t)* region) nothrow;
__gshared c_gdk_draw_context_begin_frameFn c_gdk_draw_context_begin_frame; ///
private alias c_gdk_draw_context_end_frameFn = extern(C) void function(GdkDrawContext* context) nothrow;
__gshared c_gdk_draw_context_end_frameFn c_gdk_draw_context_end_frame; ///
private alias c_gdk_draw_context_get_displayFn = extern(C) GdkDisplay* function(GdkDrawContext* context) nothrow;
__gshared c_gdk_draw_context_get_displayFn c_gdk_draw_context_get_display; ///
private alias c_gdk_draw_context_get_frame_regionFn = extern(C) const(cairo_region_t)* function(GdkDrawContext* context) nothrow;
__gshared c_gdk_draw_context_get_frame_regionFn c_gdk_draw_context_get_frame_region; ///
private alias c_gdk_draw_context_get_surfaceFn = extern(C) GdkSurface* function(GdkDrawContext* context) nothrow;
__gshared c_gdk_draw_context_get_surfaceFn c_gdk_draw_context_get_surface; ///
private alias c_gdk_draw_context_is_in_frameFn = extern(C) gboolean function(GdkDrawContext* context) nothrow;
__gshared c_gdk_draw_context_is_in_frameFn c_gdk_draw_context_is_in_frame; ///

// Drop
private alias c_gdk_drop_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_drop_get_typeFn c_gdk_drop_get_type; ///
private alias c_gdk_drop_finishFn = extern(C) void function(GdkDrop* self, GdkDragAction action) nothrow;
__gshared c_gdk_drop_finishFn c_gdk_drop_finish; ///
private alias c_gdk_drop_get_actionsFn = extern(C) GdkDragAction function(GdkDrop* self) nothrow;
__gshared c_gdk_drop_get_actionsFn c_gdk_drop_get_actions; ///
private alias c_gdk_drop_get_deviceFn = extern(C) GdkDevice* function(GdkDrop* self) nothrow;
__gshared c_gdk_drop_get_deviceFn c_gdk_drop_get_device; ///
private alias c_gdk_drop_get_displayFn = extern(C) GdkDisplay* function(GdkDrop* self) nothrow;
__gshared c_gdk_drop_get_displayFn c_gdk_drop_get_display; ///
private alias c_gdk_drop_get_dragFn = extern(C) GdkDrag* function(GdkDrop* self) nothrow;
__gshared c_gdk_drop_get_dragFn c_gdk_drop_get_drag; ///
private alias c_gdk_drop_get_formatsFn = extern(C) GdkContentFormats* function(GdkDrop* self) nothrow;
__gshared c_gdk_drop_get_formatsFn c_gdk_drop_get_formats; ///
private alias c_gdk_drop_get_surfaceFn = extern(C) GdkSurface* function(GdkDrop* self) nothrow;
__gshared c_gdk_drop_get_surfaceFn c_gdk_drop_get_surface; ///
private alias c_gdk_drop_read_asyncFn = extern(C) void function(GdkDrop* self, const(char*)* mimeTypes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_drop_read_asyncFn c_gdk_drop_read_async; ///
private alias c_gdk_drop_read_finishFn = extern(C) GInputStream* function(GdkDrop* self, GAsyncResult* result, const(char*)* outMimeType, GError** _err) nothrow;
__gshared c_gdk_drop_read_finishFn c_gdk_drop_read_finish; ///
private alias c_gdk_drop_read_value_asyncFn = extern(C) void function(GdkDrop* self, GType type, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_drop_read_value_asyncFn c_gdk_drop_read_value_async; ///
private alias c_gdk_drop_read_value_finishFn = extern(C) const(GValue)* function(GdkDrop* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_drop_read_value_finishFn c_gdk_drop_read_value_finish; ///
private alias c_gdk_drop_statusFn = extern(C) void function(GdkDrop* self, GdkDragAction actions, GdkDragAction preferred) nothrow;
__gshared c_gdk_drop_statusFn c_gdk_drop_status; ///

// Event
private alias c_gdk_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_event_get_typeFn c_gdk_event_get_type; ///
private alias c_gdk_event_get_axesFn = extern(C) gboolean function(GdkEvent* event, double** axes, uint* nAxes) nothrow;
__gshared c_gdk_event_get_axesFn c_gdk_event_get_axes; ///
private alias c_gdk_event_get_axisFn = extern(C) gboolean function(GdkEvent* event, GdkAxisUse axisUse, double* value) nothrow;
__gshared c_gdk_event_get_axisFn c_gdk_event_get_axis; ///
private alias c_gdk_event_get_deviceFn = extern(C) GdkDevice* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_deviceFn c_gdk_event_get_device; ///
private alias c_gdk_event_get_device_toolFn = extern(C) GdkDeviceTool* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_device_toolFn c_gdk_event_get_device_tool; ///
private alias c_gdk_event_get_displayFn = extern(C) GdkDisplay* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_displayFn c_gdk_event_get_display; ///
private alias c_gdk_event_get_event_sequenceFn = extern(C) GdkEventSequence* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_event_sequenceFn c_gdk_event_get_event_sequence; ///
private alias c_gdk_event_get_event_typeFn = extern(C) GdkEventType function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_event_typeFn c_gdk_event_get_event_type; ///
private alias c_gdk_event_get_historyFn = extern(C) GdkTimeCoord* function(GdkEvent* event, uint* outNCoords) nothrow;
__gshared c_gdk_event_get_historyFn c_gdk_event_get_history; ///
private alias c_gdk_event_get_modifier_stateFn = extern(C) GdkModifierType function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_modifier_stateFn c_gdk_event_get_modifier_state; ///
private alias c_gdk_event_get_pointer_emulatedFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_pointer_emulatedFn c_gdk_event_get_pointer_emulated; ///
private alias c_gdk_event_get_positionFn = extern(C) gboolean function(GdkEvent* event, double* x, double* y) nothrow;
__gshared c_gdk_event_get_positionFn c_gdk_event_get_position; ///
private alias c_gdk_event_get_seatFn = extern(C) GdkSeat* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_seatFn c_gdk_event_get_seat; ///
private alias c_gdk_event_get_surfaceFn = extern(C) GdkSurface* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_surfaceFn c_gdk_event_get_surface; ///
private alias c_gdk_event_get_timeFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_event_get_timeFn c_gdk_event_get_time; ///
private alias c_gdk_event_refFn = extern(C) GdkEvent* function(GdkEvent* event) nothrow;
__gshared c_gdk_event_refFn c_gdk_event_ref; ///
private alias c_gdk_event_triggers_context_menuFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_event_triggers_context_menuFn c_gdk_event_triggers_context_menu; ///
private alias c_gdk_event_unrefFn = extern(C) void function(GdkEvent* event) nothrow;
__gshared c_gdk_event_unrefFn c_gdk_event_unref; ///

// EventSequence
private alias c_gdk_event_sequence_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_event_sequence_get_typeFn c_gdk_event_sequence_get_type; ///

// FileList
private alias c_gdk_file_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_file_list_get_typeFn c_gdk_file_list_get_type; ///
private alias c_gdk_file_list_new_from_arrayFn = extern(C) GdkFileList* function(GFile** files, size_t nFiles) nothrow;
__gshared c_gdk_file_list_new_from_arrayFn c_gdk_file_list_new_from_array; ///
private alias c_gdk_file_list_new_from_listFn = extern(C) GdkFileList* function(GSList* files) nothrow;
__gshared c_gdk_file_list_new_from_listFn c_gdk_file_list_new_from_list; ///
private alias c_gdk_file_list_get_filesFn = extern(C) GSList* function(GdkFileList* fileList) nothrow;
__gshared c_gdk_file_list_get_filesFn c_gdk_file_list_get_files; ///

// FocusEvent
private alias c_gdk_focus_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_focus_event_get_typeFn c_gdk_focus_event_get_type; ///
private alias c_gdk_focus_event_get_inFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_focus_event_get_inFn c_gdk_focus_event_get_in; ///

// FrameClock
private alias c_gdk_frame_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_frame_clock_get_typeFn c_gdk_frame_clock_get_type; ///
private alias c_gdk_frame_clock_begin_updatingFn = extern(C) void function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_begin_updatingFn c_gdk_frame_clock_begin_updating; ///
private alias c_gdk_frame_clock_end_updatingFn = extern(C) void function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_end_updatingFn c_gdk_frame_clock_end_updating; ///
private alias c_gdk_frame_clock_get_current_timingsFn = extern(C) GdkFrameTimings* function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_get_current_timingsFn c_gdk_frame_clock_get_current_timings; ///
private alias c_gdk_frame_clock_get_fpsFn = extern(C) double function(GdkFrameClock* frameClock) nothrow;
__gshared c_gdk_frame_clock_get_fpsFn c_gdk_frame_clock_get_fps; ///
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
private alias c_gdk_gl_context_get_allowed_apisFn = extern(C) GdkGLAPI function(GdkGLContext* self) nothrow;
__gshared c_gdk_gl_context_get_allowed_apisFn c_gdk_gl_context_get_allowed_apis; ///
private alias c_gdk_gl_context_get_apiFn = extern(C) GdkGLAPI function(GdkGLContext* self) nothrow;
__gshared c_gdk_gl_context_get_apiFn c_gdk_gl_context_get_api; ///
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
private alias c_gdk_gl_context_get_surfaceFn = extern(C) GdkSurface* function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_surfaceFn c_gdk_gl_context_get_surface; ///
private alias c_gdk_gl_context_get_use_esFn = extern(C) gboolean function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_get_use_esFn c_gdk_gl_context_get_use_es; ///
private alias c_gdk_gl_context_get_versionFn = extern(C) void function(GdkGLContext* context, int* major, int* minor) nothrow;
__gshared c_gdk_gl_context_get_versionFn c_gdk_gl_context_get_version; ///
private alias c_gdk_gl_context_is_legacyFn = extern(C) gboolean function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_is_legacyFn c_gdk_gl_context_is_legacy; ///
private alias c_gdk_gl_context_is_sharedFn = extern(C) gboolean function(GdkGLContext* self, GdkGLContext* other) nothrow;
__gshared c_gdk_gl_context_is_sharedFn c_gdk_gl_context_is_shared; ///
private alias c_gdk_gl_context_make_currentFn = extern(C) void function(GdkGLContext* context) nothrow;
__gshared c_gdk_gl_context_make_currentFn c_gdk_gl_context_make_current; ///
private alias c_gdk_gl_context_realizeFn = extern(C) gboolean function(GdkGLContext* context, GError** _err) nothrow;
__gshared c_gdk_gl_context_realizeFn c_gdk_gl_context_realize; ///
private alias c_gdk_gl_context_set_allowed_apisFn = extern(C) void function(GdkGLContext* self, GdkGLAPI apis) nothrow;
__gshared c_gdk_gl_context_set_allowed_apisFn c_gdk_gl_context_set_allowed_apis; ///
private alias c_gdk_gl_context_set_debug_enabledFn = extern(C) void function(GdkGLContext* context, gboolean enabled) nothrow;
__gshared c_gdk_gl_context_set_debug_enabledFn c_gdk_gl_context_set_debug_enabled; ///
private alias c_gdk_gl_context_set_forward_compatibleFn = extern(C) void function(GdkGLContext* context, gboolean compatible) nothrow;
__gshared c_gdk_gl_context_set_forward_compatibleFn c_gdk_gl_context_set_forward_compatible; ///
private alias c_gdk_gl_context_set_required_versionFn = extern(C) void function(GdkGLContext* context, int major, int minor) nothrow;
__gshared c_gdk_gl_context_set_required_versionFn c_gdk_gl_context_set_required_version; ///
private alias c_gdk_gl_context_set_use_esFn = extern(C) void function(GdkGLContext* context, int useEs) nothrow;
__gshared c_gdk_gl_context_set_use_esFn c_gdk_gl_context_set_use_es; ///

// GLTexture
private alias c_gdk_gl_texture_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_gl_texture_get_typeFn c_gdk_gl_texture_get_type; ///
private alias c_gdk_gl_texture_newFn = extern(C) GdkTexture* function(GdkGLContext* context, uint id, int width, int height, GDestroyNotify destroy, void* data) nothrow;
__gshared c_gdk_gl_texture_newFn c_gdk_gl_texture_new; ///
private alias c_gdk_gl_texture_releaseFn = extern(C) void function(GdkGLTexture* self) nothrow;
__gshared c_gdk_gl_texture_releaseFn c_gdk_gl_texture_release; ///

// GLTextureBuilder
private alias c_gdk_gl_texture_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_gl_texture_builder_get_typeFn c_gdk_gl_texture_builder_get_type; ///
private alias c_gdk_gl_texture_builder_newFn = extern(C) GdkGLTextureBuilder* function() nothrow;
__gshared c_gdk_gl_texture_builder_newFn c_gdk_gl_texture_builder_new; ///
private alias c_gdk_gl_texture_builder_buildFn = extern(C) GdkTexture* function(GdkGLTextureBuilder* self, GDestroyNotify destroy, void* data) nothrow;
__gshared c_gdk_gl_texture_builder_buildFn c_gdk_gl_texture_builder_build; ///
private alias c_gdk_gl_texture_builder_get_color_stateFn = extern(C) GdkColorState* function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_color_stateFn c_gdk_gl_texture_builder_get_color_state; ///
private alias c_gdk_gl_texture_builder_get_contextFn = extern(C) GdkGLContext* function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_contextFn c_gdk_gl_texture_builder_get_context; ///
private alias c_gdk_gl_texture_builder_get_formatFn = extern(C) GdkMemoryFormat function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_formatFn c_gdk_gl_texture_builder_get_format; ///
private alias c_gdk_gl_texture_builder_get_has_mipmapFn = extern(C) gboolean function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_has_mipmapFn c_gdk_gl_texture_builder_get_has_mipmap; ///
private alias c_gdk_gl_texture_builder_get_heightFn = extern(C) int function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_heightFn c_gdk_gl_texture_builder_get_height; ///
private alias c_gdk_gl_texture_builder_get_idFn = extern(C) uint function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_idFn c_gdk_gl_texture_builder_get_id; ///
private alias c_gdk_gl_texture_builder_get_syncFn = extern(C) void* function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_syncFn c_gdk_gl_texture_builder_get_sync; ///
private alias c_gdk_gl_texture_builder_get_update_regionFn = extern(C) cairo_region_t* function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_update_regionFn c_gdk_gl_texture_builder_get_update_region; ///
private alias c_gdk_gl_texture_builder_get_update_textureFn = extern(C) GdkTexture* function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_update_textureFn c_gdk_gl_texture_builder_get_update_texture; ///
private alias c_gdk_gl_texture_builder_get_widthFn = extern(C) int function(GdkGLTextureBuilder* self) nothrow;
__gshared c_gdk_gl_texture_builder_get_widthFn c_gdk_gl_texture_builder_get_width; ///
private alias c_gdk_gl_texture_builder_set_color_stateFn = extern(C) void function(GdkGLTextureBuilder* self, GdkColorState* colorState) nothrow;
__gshared c_gdk_gl_texture_builder_set_color_stateFn c_gdk_gl_texture_builder_set_color_state; ///
private alias c_gdk_gl_texture_builder_set_contextFn = extern(C) void function(GdkGLTextureBuilder* self, GdkGLContext* context) nothrow;
__gshared c_gdk_gl_texture_builder_set_contextFn c_gdk_gl_texture_builder_set_context; ///
private alias c_gdk_gl_texture_builder_set_formatFn = extern(C) void function(GdkGLTextureBuilder* self, GdkMemoryFormat format) nothrow;
__gshared c_gdk_gl_texture_builder_set_formatFn c_gdk_gl_texture_builder_set_format; ///
private alias c_gdk_gl_texture_builder_set_has_mipmapFn = extern(C) void function(GdkGLTextureBuilder* self, gboolean hasMipmap) nothrow;
__gshared c_gdk_gl_texture_builder_set_has_mipmapFn c_gdk_gl_texture_builder_set_has_mipmap; ///
private alias c_gdk_gl_texture_builder_set_heightFn = extern(C) void function(GdkGLTextureBuilder* self, int height) nothrow;
__gshared c_gdk_gl_texture_builder_set_heightFn c_gdk_gl_texture_builder_set_height; ///
private alias c_gdk_gl_texture_builder_set_idFn = extern(C) void function(GdkGLTextureBuilder* self, uint id) nothrow;
__gshared c_gdk_gl_texture_builder_set_idFn c_gdk_gl_texture_builder_set_id; ///
private alias c_gdk_gl_texture_builder_set_syncFn = extern(C) void function(GdkGLTextureBuilder* self, void* sync) nothrow;
__gshared c_gdk_gl_texture_builder_set_syncFn c_gdk_gl_texture_builder_set_sync; ///
private alias c_gdk_gl_texture_builder_set_update_regionFn = extern(C) void function(GdkGLTextureBuilder* self, cairo_region_t* region) nothrow;
__gshared c_gdk_gl_texture_builder_set_update_regionFn c_gdk_gl_texture_builder_set_update_region; ///
private alias c_gdk_gl_texture_builder_set_update_textureFn = extern(C) void function(GdkGLTextureBuilder* self, GdkTexture* texture) nothrow;
__gshared c_gdk_gl_texture_builder_set_update_textureFn c_gdk_gl_texture_builder_set_update_texture; ///
private alias c_gdk_gl_texture_builder_set_widthFn = extern(C) void function(GdkGLTextureBuilder* self, int width) nothrow;
__gshared c_gdk_gl_texture_builder_set_widthFn c_gdk_gl_texture_builder_set_width; ///

// GrabBrokenEvent
private alias c_gdk_grab_broken_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_grab_broken_event_get_typeFn c_gdk_grab_broken_event_get_type; ///
private alias c_gdk_grab_broken_event_get_grab_surfaceFn = extern(C) GdkSurface* function(GdkEvent* event) nothrow;
__gshared c_gdk_grab_broken_event_get_grab_surfaceFn c_gdk_grab_broken_event_get_grab_surface; ///
private alias c_gdk_grab_broken_event_get_implicitFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_grab_broken_event_get_implicitFn c_gdk_grab_broken_event_get_implicit; ///

// KeyEvent
private alias c_gdk_key_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_key_event_get_typeFn c_gdk_key_event_get_type; ///
private alias c_gdk_key_event_get_consumed_modifiersFn = extern(C) GdkModifierType function(GdkEvent* event) nothrow;
__gshared c_gdk_key_event_get_consumed_modifiersFn c_gdk_key_event_get_consumed_modifiers; ///
private alias c_gdk_key_event_get_keycodeFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_key_event_get_keycodeFn c_gdk_key_event_get_keycode; ///
private alias c_gdk_key_event_get_keyvalFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_key_event_get_keyvalFn c_gdk_key_event_get_keyval; ///
private alias c_gdk_key_event_get_layoutFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_key_event_get_layoutFn c_gdk_key_event_get_layout; ///
private alias c_gdk_key_event_get_levelFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_key_event_get_levelFn c_gdk_key_event_get_level; ///
private alias c_gdk_key_event_get_matchFn = extern(C) gboolean function(GdkEvent* event, uint* keyval, GdkModifierType* modifiers) nothrow;
__gshared c_gdk_key_event_get_matchFn c_gdk_key_event_get_match; ///
private alias c_gdk_key_event_is_modifierFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_key_event_is_modifierFn c_gdk_key_event_is_modifier; ///
private alias c_gdk_key_event_matchesFn = extern(C) GdkKeyMatch function(GdkEvent* event, uint keyval, GdkModifierType modifiers) nothrow;
__gshared c_gdk_key_event_matchesFn c_gdk_key_event_matches; ///

// MemoryTexture
private alias c_gdk_memory_texture_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_memory_texture_get_typeFn c_gdk_memory_texture_get_type; ///
private alias c_gdk_memory_texture_newFn = extern(C) GdkTexture* function(int width, int height, GdkMemoryFormat format, GBytes* bytes, size_t stride) nothrow;
__gshared c_gdk_memory_texture_newFn c_gdk_memory_texture_new; ///

// MemoryTextureBuilder
private alias c_gdk_memory_texture_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_memory_texture_builder_get_typeFn c_gdk_memory_texture_builder_get_type; ///
private alias c_gdk_memory_texture_builder_newFn = extern(C) GdkMemoryTextureBuilder* function() nothrow;
__gshared c_gdk_memory_texture_builder_newFn c_gdk_memory_texture_builder_new; ///
private alias c_gdk_memory_texture_builder_buildFn = extern(C) GdkTexture* function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_buildFn c_gdk_memory_texture_builder_build; ///
private alias c_gdk_memory_texture_builder_get_bytesFn = extern(C) GBytes* function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_bytesFn c_gdk_memory_texture_builder_get_bytes; ///
private alias c_gdk_memory_texture_builder_get_color_stateFn = extern(C) GdkColorState* function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_color_stateFn c_gdk_memory_texture_builder_get_color_state; ///
private alias c_gdk_memory_texture_builder_get_formatFn = extern(C) GdkMemoryFormat function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_formatFn c_gdk_memory_texture_builder_get_format; ///
private alias c_gdk_memory_texture_builder_get_heightFn = extern(C) int function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_heightFn c_gdk_memory_texture_builder_get_height; ///
private alias c_gdk_memory_texture_builder_get_offsetFn = extern(C) size_t function(GdkMemoryTextureBuilder* self, uint plane) nothrow;
__gshared c_gdk_memory_texture_builder_get_offsetFn c_gdk_memory_texture_builder_get_offset; ///
private alias c_gdk_memory_texture_builder_get_strideFn = extern(C) size_t function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_strideFn c_gdk_memory_texture_builder_get_stride; ///
private alias c_gdk_memory_texture_builder_get_stride_for_planeFn = extern(C) size_t function(GdkMemoryTextureBuilder* self, uint plane) nothrow;
__gshared c_gdk_memory_texture_builder_get_stride_for_planeFn c_gdk_memory_texture_builder_get_stride_for_plane; ///
private alias c_gdk_memory_texture_builder_get_update_regionFn = extern(C) cairo_region_t* function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_update_regionFn c_gdk_memory_texture_builder_get_update_region; ///
private alias c_gdk_memory_texture_builder_get_update_textureFn = extern(C) GdkTexture* function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_update_textureFn c_gdk_memory_texture_builder_get_update_texture; ///
private alias c_gdk_memory_texture_builder_get_widthFn = extern(C) int function(GdkMemoryTextureBuilder* self) nothrow;
__gshared c_gdk_memory_texture_builder_get_widthFn c_gdk_memory_texture_builder_get_width; ///
private alias c_gdk_memory_texture_builder_set_bytesFn = extern(C) void function(GdkMemoryTextureBuilder* self, GBytes* bytes) nothrow;
__gshared c_gdk_memory_texture_builder_set_bytesFn c_gdk_memory_texture_builder_set_bytes; ///
private alias c_gdk_memory_texture_builder_set_color_stateFn = extern(C) void function(GdkMemoryTextureBuilder* self, GdkColorState* colorState) nothrow;
__gshared c_gdk_memory_texture_builder_set_color_stateFn c_gdk_memory_texture_builder_set_color_state; ///
private alias c_gdk_memory_texture_builder_set_formatFn = extern(C) void function(GdkMemoryTextureBuilder* self, GdkMemoryFormat format) nothrow;
__gshared c_gdk_memory_texture_builder_set_formatFn c_gdk_memory_texture_builder_set_format; ///
private alias c_gdk_memory_texture_builder_set_heightFn = extern(C) void function(GdkMemoryTextureBuilder* self, int height) nothrow;
__gshared c_gdk_memory_texture_builder_set_heightFn c_gdk_memory_texture_builder_set_height; ///
private alias c_gdk_memory_texture_builder_set_offsetFn = extern(C) void function(GdkMemoryTextureBuilder* self, uint plane, size_t offset) nothrow;
__gshared c_gdk_memory_texture_builder_set_offsetFn c_gdk_memory_texture_builder_set_offset; ///
private alias c_gdk_memory_texture_builder_set_strideFn = extern(C) void function(GdkMemoryTextureBuilder* self, size_t stride) nothrow;
__gshared c_gdk_memory_texture_builder_set_strideFn c_gdk_memory_texture_builder_set_stride; ///
private alias c_gdk_memory_texture_builder_set_stride_for_planeFn = extern(C) void function(GdkMemoryTextureBuilder* self, uint plane, size_t stride) nothrow;
__gshared c_gdk_memory_texture_builder_set_stride_for_planeFn c_gdk_memory_texture_builder_set_stride_for_plane; ///
private alias c_gdk_memory_texture_builder_set_update_regionFn = extern(C) void function(GdkMemoryTextureBuilder* self, cairo_region_t* region) nothrow;
__gshared c_gdk_memory_texture_builder_set_update_regionFn c_gdk_memory_texture_builder_set_update_region; ///
private alias c_gdk_memory_texture_builder_set_update_textureFn = extern(C) void function(GdkMemoryTextureBuilder* self, GdkTexture* texture) nothrow;
__gshared c_gdk_memory_texture_builder_set_update_textureFn c_gdk_memory_texture_builder_set_update_texture; ///
private alias c_gdk_memory_texture_builder_set_widthFn = extern(C) void function(GdkMemoryTextureBuilder* self, int width) nothrow;
__gshared c_gdk_memory_texture_builder_set_widthFn c_gdk_memory_texture_builder_set_width; ///

// MonitorWrap
private alias c_gdk_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_monitor_get_typeFn c_gdk_monitor_get_type; ///
private alias c_gdk_monitor_get_connectorFn = extern(C) const(char)* function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_connectorFn c_gdk_monitor_get_connector; ///
private alias c_gdk_monitor_get_descriptionFn = extern(C) const(char)* function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_descriptionFn c_gdk_monitor_get_description; ///
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
private alias c_gdk_monitor_get_scaleFn = extern(C) double function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_scaleFn c_gdk_monitor_get_scale; ///
private alias c_gdk_monitor_get_scale_factorFn = extern(C) int function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_scale_factorFn c_gdk_monitor_get_scale_factor; ///
private alias c_gdk_monitor_get_subpixel_layoutFn = extern(C) GdkSubpixelLayout function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_subpixel_layoutFn c_gdk_monitor_get_subpixel_layout; ///
private alias c_gdk_monitor_get_width_mmFn = extern(C) int function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_get_width_mmFn c_gdk_monitor_get_width_mm; ///
private alias c_gdk_monitor_is_validFn = extern(C) gboolean function(GdkMonitor* monitor) nothrow;
__gshared c_gdk_monitor_is_validFn c_gdk_monitor_is_valid; ///

// MotionEvent
private alias c_gdk_motion_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_motion_event_get_typeFn c_gdk_motion_event_get_type; ///

// PadEvent
private alias c_gdk_pad_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pad_event_get_typeFn c_gdk_pad_event_get_type; ///
private alias c_gdk_pad_event_get_axis_valueFn = extern(C) void function(GdkEvent* event, uint* index, double* value) nothrow;
__gshared c_gdk_pad_event_get_axis_valueFn c_gdk_pad_event_get_axis_value; ///
private alias c_gdk_pad_event_get_buttonFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_pad_event_get_buttonFn c_gdk_pad_event_get_button; ///
private alias c_gdk_pad_event_get_group_modeFn = extern(C) void function(GdkEvent* event, uint* group, uint* mode) nothrow;
__gshared c_gdk_pad_event_get_group_modeFn c_gdk_pad_event_get_group_mode; ///

// Paintable
private alias c_gdk_paintable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_paintable_get_typeFn c_gdk_paintable_get_type; ///
private alias c_gdk_paintable_new_emptyFn = extern(C) GdkPaintable* function(int intrinsicWidth, int intrinsicHeight) nothrow;
__gshared c_gdk_paintable_new_emptyFn c_gdk_paintable_new_empty; ///
private alias c_gdk_paintable_compute_concrete_sizeFn = extern(C) void function(GdkPaintable* paintable, double specifiedWidth, double specifiedHeight, double defaultWidth, double defaultHeight, double* concreteWidth, double* concreteHeight) nothrow;
__gshared c_gdk_paintable_compute_concrete_sizeFn c_gdk_paintable_compute_concrete_size; ///
private alias c_gdk_paintable_get_current_imageFn = extern(C) GdkPaintable* function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_get_current_imageFn c_gdk_paintable_get_current_image; ///
private alias c_gdk_paintable_get_flagsFn = extern(C) GdkPaintableFlags function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_get_flagsFn c_gdk_paintable_get_flags; ///
private alias c_gdk_paintable_get_intrinsic_aspect_ratioFn = extern(C) double function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_get_intrinsic_aspect_ratioFn c_gdk_paintable_get_intrinsic_aspect_ratio; ///
private alias c_gdk_paintable_get_intrinsic_heightFn = extern(C) int function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_get_intrinsic_heightFn c_gdk_paintable_get_intrinsic_height; ///
private alias c_gdk_paintable_get_intrinsic_widthFn = extern(C) int function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_get_intrinsic_widthFn c_gdk_paintable_get_intrinsic_width; ///
private alias c_gdk_paintable_invalidate_contentsFn = extern(C) void function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_invalidate_contentsFn c_gdk_paintable_invalidate_contents; ///
private alias c_gdk_paintable_invalidate_sizeFn = extern(C) void function(GdkPaintable* paintable) nothrow;
__gshared c_gdk_paintable_invalidate_sizeFn c_gdk_paintable_invalidate_size; ///
private alias c_gdk_paintable_snapshotFn = extern(C) void function(GdkPaintable* paintable, GdkSnapshot* snapshot, double width, double height) nothrow;
__gshared c_gdk_paintable_snapshotFn c_gdk_paintable_snapshot; ///

// Popup
private alias c_gdk_popup_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_popup_get_typeFn c_gdk_popup_get_type; ///
private alias c_gdk_popup_get_autohideFn = extern(C) gboolean function(GdkPopup* popup) nothrow;
__gshared c_gdk_popup_get_autohideFn c_gdk_popup_get_autohide; ///
private alias c_gdk_popup_get_parentFn = extern(C) GdkSurface* function(GdkPopup* popup) nothrow;
__gshared c_gdk_popup_get_parentFn c_gdk_popup_get_parent; ///
private alias c_gdk_popup_get_position_xFn = extern(C) int function(GdkPopup* popup) nothrow;
__gshared c_gdk_popup_get_position_xFn c_gdk_popup_get_position_x; ///
private alias c_gdk_popup_get_position_yFn = extern(C) int function(GdkPopup* popup) nothrow;
__gshared c_gdk_popup_get_position_yFn c_gdk_popup_get_position_y; ///
private alias c_gdk_popup_get_rect_anchorFn = extern(C) GdkGravity function(GdkPopup* popup) nothrow;
__gshared c_gdk_popup_get_rect_anchorFn c_gdk_popup_get_rect_anchor; ///
private alias c_gdk_popup_get_surface_anchorFn = extern(C) GdkGravity function(GdkPopup* popup) nothrow;
__gshared c_gdk_popup_get_surface_anchorFn c_gdk_popup_get_surface_anchor; ///
private alias c_gdk_popup_presentFn = extern(C) gboolean function(GdkPopup* popup, int width, int height, GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_presentFn c_gdk_popup_present; ///

// PopupLayout
private alias c_gdk_popup_layout_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_popup_layout_get_typeFn c_gdk_popup_layout_get_type; ///
private alias c_gdk_popup_layout_newFn = extern(C) GdkPopupLayout* function(const(GdkRectangle)* anchorRect, GdkGravity rectAnchor, GdkGravity surfaceAnchor) nothrow;
__gshared c_gdk_popup_layout_newFn c_gdk_popup_layout_new; ///
private alias c_gdk_popup_layout_copyFn = extern(C) GdkPopupLayout* function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_copyFn c_gdk_popup_layout_copy; ///
private alias c_gdk_popup_layout_equalFn = extern(C) gboolean function(GdkPopupLayout* layout, GdkPopupLayout* other) nothrow;
__gshared c_gdk_popup_layout_equalFn c_gdk_popup_layout_equal; ///
private alias c_gdk_popup_layout_get_anchor_hintsFn = extern(C) GdkAnchorHints function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_get_anchor_hintsFn c_gdk_popup_layout_get_anchor_hints; ///
private alias c_gdk_popup_layout_get_anchor_rectFn = extern(C) const(GdkRectangle)* function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_get_anchor_rectFn c_gdk_popup_layout_get_anchor_rect; ///
private alias c_gdk_popup_layout_get_offsetFn = extern(C) void function(GdkPopupLayout* layout, int* dx, int* dy) nothrow;
__gshared c_gdk_popup_layout_get_offsetFn c_gdk_popup_layout_get_offset; ///
private alias c_gdk_popup_layout_get_rect_anchorFn = extern(C) GdkGravity function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_get_rect_anchorFn c_gdk_popup_layout_get_rect_anchor; ///
private alias c_gdk_popup_layout_get_shadow_widthFn = extern(C) void function(GdkPopupLayout* layout, int* left, int* right, int* top, int* bottom) nothrow;
__gshared c_gdk_popup_layout_get_shadow_widthFn c_gdk_popup_layout_get_shadow_width; ///
private alias c_gdk_popup_layout_get_surface_anchorFn = extern(C) GdkGravity function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_get_surface_anchorFn c_gdk_popup_layout_get_surface_anchor; ///
private alias c_gdk_popup_layout_refFn = extern(C) GdkPopupLayout* function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_refFn c_gdk_popup_layout_ref; ///
private alias c_gdk_popup_layout_set_anchor_hintsFn = extern(C) void function(GdkPopupLayout* layout, GdkAnchorHints anchorHints) nothrow;
__gshared c_gdk_popup_layout_set_anchor_hintsFn c_gdk_popup_layout_set_anchor_hints; ///
private alias c_gdk_popup_layout_set_anchor_rectFn = extern(C) void function(GdkPopupLayout* layout, const(GdkRectangle)* anchorRect) nothrow;
__gshared c_gdk_popup_layout_set_anchor_rectFn c_gdk_popup_layout_set_anchor_rect; ///
private alias c_gdk_popup_layout_set_offsetFn = extern(C) void function(GdkPopupLayout* layout, int dx, int dy) nothrow;
__gshared c_gdk_popup_layout_set_offsetFn c_gdk_popup_layout_set_offset; ///
private alias c_gdk_popup_layout_set_rect_anchorFn = extern(C) void function(GdkPopupLayout* layout, GdkGravity anchor) nothrow;
__gshared c_gdk_popup_layout_set_rect_anchorFn c_gdk_popup_layout_set_rect_anchor; ///
private alias c_gdk_popup_layout_set_shadow_widthFn = extern(C) void function(GdkPopupLayout* layout, int left, int right, int top, int bottom) nothrow;
__gshared c_gdk_popup_layout_set_shadow_widthFn c_gdk_popup_layout_set_shadow_width; ///
private alias c_gdk_popup_layout_set_surface_anchorFn = extern(C) void function(GdkPopupLayout* layout, GdkGravity anchor) nothrow;
__gshared c_gdk_popup_layout_set_surface_anchorFn c_gdk_popup_layout_set_surface_anchor; ///
private alias c_gdk_popup_layout_unrefFn = extern(C) void function(GdkPopupLayout* layout) nothrow;
__gshared c_gdk_popup_layout_unrefFn c_gdk_popup_layout_unref; ///

// ProximityEvent
private alias c_gdk_proximity_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_proximity_event_get_typeFn c_gdk_proximity_event_get_type; ///

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
private alias c_gdk_rgba_is_clearFn = extern(C) gboolean function(const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_rgba_is_clearFn c_gdk_rgba_is_clear; ///
private alias c_gdk_rgba_is_opaqueFn = extern(C) gboolean function(const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_rgba_is_opaqueFn c_gdk_rgba_is_opaque; ///
private alias c_gdk_rgba_parseFn = extern(C) gboolean function(GdkRGBA* rgba, const(char)* spec) nothrow;
__gshared c_gdk_rgba_parseFn c_gdk_rgba_parse; ///
private alias c_gdk_rgba_printFn = extern(C) GString* function(const(GdkRGBA)* rgba, GString* string_) nothrow;
__gshared c_gdk_rgba_printFn c_gdk_rgba_print; ///
private alias c_gdk_rgba_to_stringFn = extern(C) char* function(const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_rgba_to_stringFn c_gdk_rgba_to_string; ///

// Rectangle
private alias c_gdk_rectangle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_rectangle_get_typeFn c_gdk_rectangle_get_type; ///
private alias c_gdk_rectangle_contains_pointFn = extern(C) gboolean function(const(GdkRectangle)* rect, int x, int y) nothrow;
__gshared c_gdk_rectangle_contains_pointFn c_gdk_rectangle_contains_point; ///
private alias c_gdk_rectangle_equalFn = extern(C) gboolean function(const(GdkRectangle)* rect1, const(GdkRectangle)* rect2) nothrow;
__gshared c_gdk_rectangle_equalFn c_gdk_rectangle_equal; ///
private alias c_gdk_rectangle_intersectFn = extern(C) gboolean function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) nothrow;
__gshared c_gdk_rectangle_intersectFn c_gdk_rectangle_intersect; ///
private alias c_gdk_rectangle_unionFn = extern(C) void function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) nothrow;
__gshared c_gdk_rectangle_unionFn c_gdk_rectangle_union; ///

// ScrollEvent
private alias c_gdk_scroll_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_scroll_event_get_typeFn c_gdk_scroll_event_get_type; ///
private alias c_gdk_scroll_event_get_deltasFn = extern(C) void function(GdkEvent* event, double* deltaX, double* deltaY) nothrow;
__gshared c_gdk_scroll_event_get_deltasFn c_gdk_scroll_event_get_deltas; ///
private alias c_gdk_scroll_event_get_directionFn = extern(C) GdkScrollDirection function(GdkEvent* event) nothrow;
__gshared c_gdk_scroll_event_get_directionFn c_gdk_scroll_event_get_direction; ///
private alias c_gdk_scroll_event_get_relative_directionFn = extern(C) GdkScrollRelativeDirection function(GdkEvent* event) nothrow;
__gshared c_gdk_scroll_event_get_relative_directionFn c_gdk_scroll_event_get_relative_direction; ///
private alias c_gdk_scroll_event_get_unitFn = extern(C) GdkScrollUnit function(GdkEvent* event) nothrow;
__gshared c_gdk_scroll_event_get_unitFn c_gdk_scroll_event_get_unit; ///
private alias c_gdk_scroll_event_is_stopFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_scroll_event_is_stopFn c_gdk_scroll_event_is_stop; ///

// Seat
private alias c_gdk_seat_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_seat_get_typeFn c_gdk_seat_get_type; ///
private alias c_gdk_seat_get_capabilitiesFn = extern(C) GdkSeatCapabilities function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_capabilitiesFn c_gdk_seat_get_capabilities; ///
private alias c_gdk_seat_get_devicesFn = extern(C) GList* function(GdkSeat* seat, GdkSeatCapabilities capabilities) nothrow;
__gshared c_gdk_seat_get_devicesFn c_gdk_seat_get_devices; ///
private alias c_gdk_seat_get_displayFn = extern(C) GdkDisplay* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_displayFn c_gdk_seat_get_display; ///
private alias c_gdk_seat_get_keyboardFn = extern(C) GdkDevice* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_keyboardFn c_gdk_seat_get_keyboard; ///
private alias c_gdk_seat_get_pointerFn = extern(C) GdkDevice* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_pointerFn c_gdk_seat_get_pointer; ///
private alias c_gdk_seat_get_toolsFn = extern(C) GList* function(GdkSeat* seat) nothrow;
__gshared c_gdk_seat_get_toolsFn c_gdk_seat_get_tools; ///

// Snapshot
private alias c_gdk_snapshot_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_snapshot_get_typeFn c_gdk_snapshot_get_type; ///

// Surface
private alias c_gdk_surface_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_surface_get_typeFn c_gdk_surface_get_type; ///
private alias c_gdk_surface_new_popupFn = extern(C) GdkSurface* function(GdkSurface* parent, gboolean autohide) nothrow;
__gshared c_gdk_surface_new_popupFn c_gdk_surface_new_popup; ///
private alias c_gdk_surface_new_toplevelFn = extern(C) GdkSurface* function(GdkDisplay* display) nothrow;
__gshared c_gdk_surface_new_toplevelFn c_gdk_surface_new_toplevel; ///
private alias c_gdk_surface_beepFn = extern(C) void function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_beepFn c_gdk_surface_beep; ///
private alias c_gdk_surface_create_cairo_contextFn = extern(C) GdkCairoContext* function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_create_cairo_contextFn c_gdk_surface_create_cairo_context; ///
private alias c_gdk_surface_create_gl_contextFn = extern(C) GdkGLContext* function(GdkSurface* surface, GError** _err) nothrow;
__gshared c_gdk_surface_create_gl_contextFn c_gdk_surface_create_gl_context; ///
private alias c_gdk_surface_create_similar_surfaceFn = extern(C) cairo_surface_t* function(GdkSurface* surface, cairo_content_t content, int width, int height) nothrow;
__gshared c_gdk_surface_create_similar_surfaceFn c_gdk_surface_create_similar_surface; ///
private alias c_gdk_surface_create_vulkan_contextFn = extern(C) GdkVulkanContext* function(GdkSurface* surface, GError** _err) nothrow;
__gshared c_gdk_surface_create_vulkan_contextFn c_gdk_surface_create_vulkan_context; ///
private alias c_gdk_surface_destroyFn = extern(C) void function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_destroyFn c_gdk_surface_destroy; ///
private alias c_gdk_surface_get_cursorFn = extern(C) GdkCursor* function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_cursorFn c_gdk_surface_get_cursor; ///
private alias c_gdk_surface_get_device_cursorFn = extern(C) GdkCursor* function(GdkSurface* surface, GdkDevice* device) nothrow;
__gshared c_gdk_surface_get_device_cursorFn c_gdk_surface_get_device_cursor; ///
private alias c_gdk_surface_get_device_positionFn = extern(C) gboolean function(GdkSurface* surface, GdkDevice* device, double* x, double* y, GdkModifierType* mask) nothrow;
__gshared c_gdk_surface_get_device_positionFn c_gdk_surface_get_device_position; ///
private alias c_gdk_surface_get_displayFn = extern(C) GdkDisplay* function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_displayFn c_gdk_surface_get_display; ///
private alias c_gdk_surface_get_frame_clockFn = extern(C) GdkFrameClock* function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_frame_clockFn c_gdk_surface_get_frame_clock; ///
private alias c_gdk_surface_get_heightFn = extern(C) int function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_heightFn c_gdk_surface_get_height; ///
private alias c_gdk_surface_get_mappedFn = extern(C) gboolean function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_mappedFn c_gdk_surface_get_mapped; ///
private alias c_gdk_surface_get_scaleFn = extern(C) double function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_scaleFn c_gdk_surface_get_scale; ///
private alias c_gdk_surface_get_scale_factorFn = extern(C) int function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_scale_factorFn c_gdk_surface_get_scale_factor; ///
private alias c_gdk_surface_get_widthFn = extern(C) int function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_get_widthFn c_gdk_surface_get_width; ///
private alias c_gdk_surface_hideFn = extern(C) void function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_hideFn c_gdk_surface_hide; ///
private alias c_gdk_surface_is_destroyedFn = extern(C) gboolean function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_is_destroyedFn c_gdk_surface_is_destroyed; ///
private alias c_gdk_surface_queue_renderFn = extern(C) void function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_queue_renderFn c_gdk_surface_queue_render; ///
private alias c_gdk_surface_request_layoutFn = extern(C) void function(GdkSurface* surface) nothrow;
__gshared c_gdk_surface_request_layoutFn c_gdk_surface_request_layout; ///
private alias c_gdk_surface_set_cursorFn = extern(C) void function(GdkSurface* surface, GdkCursor* cursor) nothrow;
__gshared c_gdk_surface_set_cursorFn c_gdk_surface_set_cursor; ///
private alias c_gdk_surface_set_device_cursorFn = extern(C) void function(GdkSurface* surface, GdkDevice* device, GdkCursor* cursor) nothrow;
__gshared c_gdk_surface_set_device_cursorFn c_gdk_surface_set_device_cursor; ///
private alias c_gdk_surface_set_input_regionFn = extern(C) void function(GdkSurface* surface, cairo_region_t* region) nothrow;
__gshared c_gdk_surface_set_input_regionFn c_gdk_surface_set_input_region; ///
private alias c_gdk_surface_set_opaque_regionFn = extern(C) void function(GdkSurface* surface, cairo_region_t* region) nothrow;
__gshared c_gdk_surface_set_opaque_regionFn c_gdk_surface_set_opaque_region; ///
private alias c_gdk_surface_translate_coordinatesFn = extern(C) gboolean function(GdkSurface* from, GdkSurface* to, double* x, double* y) nothrow;
__gshared c_gdk_surface_translate_coordinatesFn c_gdk_surface_translate_coordinates; ///

// Texture
private alias c_gdk_texture_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_texture_get_typeFn c_gdk_texture_get_type; ///
private alias c_gdk_texture_new_for_pixbufFn = extern(C) GdkTexture* function(GdkPixbuf* pixbuf) nothrow;
__gshared c_gdk_texture_new_for_pixbufFn c_gdk_texture_new_for_pixbuf; ///
private alias c_gdk_texture_new_from_bytesFn = extern(C) GdkTexture* function(GBytes* bytes, GError** _err) nothrow;
__gshared c_gdk_texture_new_from_bytesFn c_gdk_texture_new_from_bytes; ///
private alias c_gdk_texture_new_from_fileFn = extern(C) GdkTexture* function(GFile* file, GError** _err) nothrow;
__gshared c_gdk_texture_new_from_fileFn c_gdk_texture_new_from_file; ///
private alias c_gdk_texture_new_from_filenameFn = extern(C) GdkTexture* function(const(char)* path, GError** _err) nothrow;
__gshared c_gdk_texture_new_from_filenameFn c_gdk_texture_new_from_filename; ///
private alias c_gdk_texture_new_from_resourceFn = extern(C) GdkTexture* function(const(char)* resourcePath) nothrow;
__gshared c_gdk_texture_new_from_resourceFn c_gdk_texture_new_from_resource; ///
private alias c_gdk_texture_downloadFn = extern(C) void function(GdkTexture* texture, ubyte* data, size_t stride) nothrow;
__gshared c_gdk_texture_downloadFn c_gdk_texture_download; ///
private alias c_gdk_texture_get_color_stateFn = extern(C) GdkColorState* function(GdkTexture* self) nothrow;
__gshared c_gdk_texture_get_color_stateFn c_gdk_texture_get_color_state; ///
private alias c_gdk_texture_get_formatFn = extern(C) GdkMemoryFormat function(GdkTexture* self) nothrow;
__gshared c_gdk_texture_get_formatFn c_gdk_texture_get_format; ///
private alias c_gdk_texture_get_heightFn = extern(C) int function(GdkTexture* texture) nothrow;
__gshared c_gdk_texture_get_heightFn c_gdk_texture_get_height; ///
private alias c_gdk_texture_get_widthFn = extern(C) int function(GdkTexture* texture) nothrow;
__gshared c_gdk_texture_get_widthFn c_gdk_texture_get_width; ///
private alias c_gdk_texture_save_to_pngFn = extern(C) gboolean function(GdkTexture* texture, const(char)* filename) nothrow;
__gshared c_gdk_texture_save_to_pngFn c_gdk_texture_save_to_png; ///
private alias c_gdk_texture_save_to_png_bytesFn = extern(C) GBytes* function(GdkTexture* texture) nothrow;
__gshared c_gdk_texture_save_to_png_bytesFn c_gdk_texture_save_to_png_bytes; ///
private alias c_gdk_texture_save_to_tiffFn = extern(C) gboolean function(GdkTexture* texture, const(char)* filename) nothrow;
__gshared c_gdk_texture_save_to_tiffFn c_gdk_texture_save_to_tiff; ///
private alias c_gdk_texture_save_to_tiff_bytesFn = extern(C) GBytes* function(GdkTexture* texture) nothrow;
__gshared c_gdk_texture_save_to_tiff_bytesFn c_gdk_texture_save_to_tiff_bytes; ///

// TextureDownloader
private alias c_gdk_texture_downloader_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_texture_downloader_get_typeFn c_gdk_texture_downloader_get_type; ///
private alias c_gdk_texture_downloader_newFn = extern(C) GdkTextureDownloader* function(GdkTexture* texture) nothrow;
__gshared c_gdk_texture_downloader_newFn c_gdk_texture_downloader_new; ///
private alias c_gdk_texture_downloader_copyFn = extern(C) GdkTextureDownloader* function(const(GdkTextureDownloader)* self) nothrow;
__gshared c_gdk_texture_downloader_copyFn c_gdk_texture_downloader_copy; ///
private alias c_gdk_texture_downloader_download_bytesFn = extern(C) GBytes* function(const(GdkTextureDownloader)* self, size_t* outStride) nothrow;
__gshared c_gdk_texture_downloader_download_bytesFn c_gdk_texture_downloader_download_bytes; ///
private alias c_gdk_texture_downloader_download_bytes_with_planesFn = extern(C) GBytes* function(const(GdkTextureDownloader)* self, size_t* outOffsets, size_t* outStrides) nothrow;
__gshared c_gdk_texture_downloader_download_bytes_with_planesFn c_gdk_texture_downloader_download_bytes_with_planes; ///
private alias c_gdk_texture_downloader_download_intoFn = extern(C) void function(const(GdkTextureDownloader)* self, ubyte* data, size_t stride) nothrow;
__gshared c_gdk_texture_downloader_download_intoFn c_gdk_texture_downloader_download_into; ///
private alias c_gdk_texture_downloader_freeFn = extern(C) void function(GdkTextureDownloader* self) nothrow;
__gshared c_gdk_texture_downloader_freeFn c_gdk_texture_downloader_free; ///
private alias c_gdk_texture_downloader_get_color_stateFn = extern(C) GdkColorState* function(const(GdkTextureDownloader)* self) nothrow;
__gshared c_gdk_texture_downloader_get_color_stateFn c_gdk_texture_downloader_get_color_state; ///
private alias c_gdk_texture_downloader_get_formatFn = extern(C) GdkMemoryFormat function(const(GdkTextureDownloader)* self) nothrow;
__gshared c_gdk_texture_downloader_get_formatFn c_gdk_texture_downloader_get_format; ///
private alias c_gdk_texture_downloader_get_textureFn = extern(C) GdkTexture* function(const(GdkTextureDownloader)* self) nothrow;
__gshared c_gdk_texture_downloader_get_textureFn c_gdk_texture_downloader_get_texture; ///
private alias c_gdk_texture_downloader_set_color_stateFn = extern(C) void function(GdkTextureDownloader* self, GdkColorState* colorState) nothrow;
__gshared c_gdk_texture_downloader_set_color_stateFn c_gdk_texture_downloader_set_color_state; ///
private alias c_gdk_texture_downloader_set_formatFn = extern(C) void function(GdkTextureDownloader* self, GdkMemoryFormat format) nothrow;
__gshared c_gdk_texture_downloader_set_formatFn c_gdk_texture_downloader_set_format; ///
private alias c_gdk_texture_downloader_set_textureFn = extern(C) void function(GdkTextureDownloader* self, GdkTexture* texture) nothrow;
__gshared c_gdk_texture_downloader_set_textureFn c_gdk_texture_downloader_set_texture; ///

// Toplevel
private alias c_gdk_toplevel_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_toplevel_get_typeFn c_gdk_toplevel_get_type; ///
private alias c_gdk_toplevel_begin_moveFn = extern(C) void function(GdkToplevel* toplevel, GdkDevice* device, int button, double x, double y, uint timestamp) nothrow;
__gshared c_gdk_toplevel_begin_moveFn c_gdk_toplevel_begin_move; ///
private alias c_gdk_toplevel_begin_resizeFn = extern(C) void function(GdkToplevel* toplevel, GdkSurfaceEdge edge, GdkDevice* device, int button, double x, double y, uint timestamp) nothrow;
__gshared c_gdk_toplevel_begin_resizeFn c_gdk_toplevel_begin_resize; ///
private alias c_gdk_toplevel_focusFn = extern(C) void function(GdkToplevel* toplevel, uint timestamp) nothrow;
__gshared c_gdk_toplevel_focusFn c_gdk_toplevel_focus; ///
private alias c_gdk_toplevel_get_capabilitiesFn = extern(C) GdkToplevelCapabilities function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_get_capabilitiesFn c_gdk_toplevel_get_capabilities; ///
private alias c_gdk_toplevel_get_gravityFn = extern(C) GdkGravity function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_get_gravityFn c_gdk_toplevel_get_gravity; ///
private alias c_gdk_toplevel_get_stateFn = extern(C) GdkToplevelState function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_get_stateFn c_gdk_toplevel_get_state; ///
private alias c_gdk_toplevel_inhibit_system_shortcutsFn = extern(C) void function(GdkToplevel* toplevel, GdkEvent* event) nothrow;
__gshared c_gdk_toplevel_inhibit_system_shortcutsFn c_gdk_toplevel_inhibit_system_shortcuts; ///
private alias c_gdk_toplevel_lowerFn = extern(C) gboolean function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_lowerFn c_gdk_toplevel_lower; ///
private alias c_gdk_toplevel_minimizeFn = extern(C) gboolean function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_minimizeFn c_gdk_toplevel_minimize; ///
private alias c_gdk_toplevel_presentFn = extern(C) void function(GdkToplevel* toplevel, GdkToplevelLayout* layout) nothrow;
__gshared c_gdk_toplevel_presentFn c_gdk_toplevel_present; ///
private alias c_gdk_toplevel_restore_system_shortcutsFn = extern(C) void function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_restore_system_shortcutsFn c_gdk_toplevel_restore_system_shortcuts; ///
private alias c_gdk_toplevel_set_decoratedFn = extern(C) void function(GdkToplevel* toplevel, gboolean decorated) nothrow;
__gshared c_gdk_toplevel_set_decoratedFn c_gdk_toplevel_set_decorated; ///
private alias c_gdk_toplevel_set_deletableFn = extern(C) void function(GdkToplevel* toplevel, gboolean deletable) nothrow;
__gshared c_gdk_toplevel_set_deletableFn c_gdk_toplevel_set_deletable; ///
private alias c_gdk_toplevel_set_gravityFn = extern(C) void function(GdkToplevel* toplevel, GdkGravity gravity) nothrow;
__gshared c_gdk_toplevel_set_gravityFn c_gdk_toplevel_set_gravity; ///
private alias c_gdk_toplevel_set_icon_listFn = extern(C) void function(GdkToplevel* toplevel, GList* surfaces) nothrow;
__gshared c_gdk_toplevel_set_icon_listFn c_gdk_toplevel_set_icon_list; ///
private alias c_gdk_toplevel_set_modalFn = extern(C) void function(GdkToplevel* toplevel, gboolean modal) nothrow;
__gshared c_gdk_toplevel_set_modalFn c_gdk_toplevel_set_modal; ///
private alias c_gdk_toplevel_set_startup_idFn = extern(C) void function(GdkToplevel* toplevel, const(char)* startupId) nothrow;
__gshared c_gdk_toplevel_set_startup_idFn c_gdk_toplevel_set_startup_id; ///
private alias c_gdk_toplevel_set_titleFn = extern(C) void function(GdkToplevel* toplevel, const(char)* title) nothrow;
__gshared c_gdk_toplevel_set_titleFn c_gdk_toplevel_set_title; ///
private alias c_gdk_toplevel_set_transient_forFn = extern(C) void function(GdkToplevel* toplevel, GdkSurface* parent) nothrow;
__gshared c_gdk_toplevel_set_transient_forFn c_gdk_toplevel_set_transient_for; ///
private alias c_gdk_toplevel_show_window_menuFn = extern(C) gboolean function(GdkToplevel* toplevel, GdkEvent* event) nothrow;
__gshared c_gdk_toplevel_show_window_menuFn c_gdk_toplevel_show_window_menu; ///
private alias c_gdk_toplevel_supports_edge_constraintsFn = extern(C) gboolean function(GdkToplevel* toplevel) nothrow;
__gshared c_gdk_toplevel_supports_edge_constraintsFn c_gdk_toplevel_supports_edge_constraints; ///
private alias c_gdk_toplevel_titlebar_gestureFn = extern(C) gboolean function(GdkToplevel* toplevel, GdkTitlebarGesture gesture) nothrow;
__gshared c_gdk_toplevel_titlebar_gestureFn c_gdk_toplevel_titlebar_gesture; ///

// ToplevelLayout
private alias c_gdk_toplevel_layout_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_toplevel_layout_get_typeFn c_gdk_toplevel_layout_get_type; ///
private alias c_gdk_toplevel_layout_newFn = extern(C) GdkToplevelLayout* function() nothrow;
__gshared c_gdk_toplevel_layout_newFn c_gdk_toplevel_layout_new; ///
private alias c_gdk_toplevel_layout_copyFn = extern(C) GdkToplevelLayout* function(GdkToplevelLayout* layout) nothrow;
__gshared c_gdk_toplevel_layout_copyFn c_gdk_toplevel_layout_copy; ///
private alias c_gdk_toplevel_layout_equalFn = extern(C) gboolean function(GdkToplevelLayout* layout, GdkToplevelLayout* other) nothrow;
__gshared c_gdk_toplevel_layout_equalFn c_gdk_toplevel_layout_equal; ///
private alias c_gdk_toplevel_layout_get_fullscreenFn = extern(C) gboolean function(GdkToplevelLayout* layout, gboolean* fullscreen) nothrow;
__gshared c_gdk_toplevel_layout_get_fullscreenFn c_gdk_toplevel_layout_get_fullscreen; ///
private alias c_gdk_toplevel_layout_get_fullscreen_monitorFn = extern(C) GdkMonitor* function(GdkToplevelLayout* layout) nothrow;
__gshared c_gdk_toplevel_layout_get_fullscreen_monitorFn c_gdk_toplevel_layout_get_fullscreen_monitor; ///
private alias c_gdk_toplevel_layout_get_maximizedFn = extern(C) gboolean function(GdkToplevelLayout* layout, gboolean* maximized) nothrow;
__gshared c_gdk_toplevel_layout_get_maximizedFn c_gdk_toplevel_layout_get_maximized; ///
private alias c_gdk_toplevel_layout_get_resizableFn = extern(C) gboolean function(GdkToplevelLayout* layout) nothrow;
__gshared c_gdk_toplevel_layout_get_resizableFn c_gdk_toplevel_layout_get_resizable; ///
private alias c_gdk_toplevel_layout_refFn = extern(C) GdkToplevelLayout* function(GdkToplevelLayout* layout) nothrow;
__gshared c_gdk_toplevel_layout_refFn c_gdk_toplevel_layout_ref; ///
private alias c_gdk_toplevel_layout_set_fullscreenFn = extern(C) void function(GdkToplevelLayout* layout, gboolean fullscreen, GdkMonitor* monitor) nothrow;
__gshared c_gdk_toplevel_layout_set_fullscreenFn c_gdk_toplevel_layout_set_fullscreen; ///
private alias c_gdk_toplevel_layout_set_maximizedFn = extern(C) void function(GdkToplevelLayout* layout, gboolean maximized) nothrow;
__gshared c_gdk_toplevel_layout_set_maximizedFn c_gdk_toplevel_layout_set_maximized; ///
private alias c_gdk_toplevel_layout_set_resizableFn = extern(C) void function(GdkToplevelLayout* layout, gboolean resizable) nothrow;
__gshared c_gdk_toplevel_layout_set_resizableFn c_gdk_toplevel_layout_set_resizable; ///
private alias c_gdk_toplevel_layout_unrefFn = extern(C) void function(GdkToplevelLayout* layout) nothrow;
__gshared c_gdk_toplevel_layout_unrefFn c_gdk_toplevel_layout_unref; ///

// ToplevelSize
private alias c_gdk_toplevel_size_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_toplevel_size_get_typeFn c_gdk_toplevel_size_get_type; ///
private alias c_gdk_toplevel_size_get_boundsFn = extern(C) void function(GdkToplevelSize* size, int* boundsWidth, int* boundsHeight) nothrow;
__gshared c_gdk_toplevel_size_get_boundsFn c_gdk_toplevel_size_get_bounds; ///
private alias c_gdk_toplevel_size_set_min_sizeFn = extern(C) void function(GdkToplevelSize* size, int minWidth, int minHeight) nothrow;
__gshared c_gdk_toplevel_size_set_min_sizeFn c_gdk_toplevel_size_set_min_size; ///
private alias c_gdk_toplevel_size_set_shadow_widthFn = extern(C) void function(GdkToplevelSize* size, int left, int right, int top, int bottom) nothrow;
__gshared c_gdk_toplevel_size_set_shadow_widthFn c_gdk_toplevel_size_set_shadow_width; ///
private alias c_gdk_toplevel_size_set_sizeFn = extern(C) void function(GdkToplevelSize* size, int width, int height) nothrow;
__gshared c_gdk_toplevel_size_set_sizeFn c_gdk_toplevel_size_set_size; ///

// TouchEvent
private alias c_gdk_touch_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_touch_event_get_typeFn c_gdk_touch_event_get_type; ///
private alias c_gdk_touch_event_get_emulating_pointerFn = extern(C) gboolean function(GdkEvent* event) nothrow;
__gshared c_gdk_touch_event_get_emulating_pointerFn c_gdk_touch_event_get_emulating_pointer; ///

// TouchpadEvent
private alias c_gdk_touchpad_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_touchpad_event_get_typeFn c_gdk_touchpad_event_get_type; ///
private alias c_gdk_touchpad_event_get_deltasFn = extern(C) void function(GdkEvent* event, double* dx, double* dy) nothrow;
__gshared c_gdk_touchpad_event_get_deltasFn c_gdk_touchpad_event_get_deltas; ///
private alias c_gdk_touchpad_event_get_gesture_phaseFn = extern(C) GdkTouchpadGesturePhase function(GdkEvent* event) nothrow;
__gshared c_gdk_touchpad_event_get_gesture_phaseFn c_gdk_touchpad_event_get_gesture_phase; ///
private alias c_gdk_touchpad_event_get_n_fingersFn = extern(C) uint function(GdkEvent* event) nothrow;
__gshared c_gdk_touchpad_event_get_n_fingersFn c_gdk_touchpad_event_get_n_fingers; ///
private alias c_gdk_touchpad_event_get_pinch_angle_deltaFn = extern(C) double function(GdkEvent* event) nothrow;
__gshared c_gdk_touchpad_event_get_pinch_angle_deltaFn c_gdk_touchpad_event_get_pinch_angle_delta; ///
private alias c_gdk_touchpad_event_get_pinch_scaleFn = extern(C) double function(GdkEvent* event) nothrow;
__gshared c_gdk_touchpad_event_get_pinch_scaleFn c_gdk_touchpad_event_get_pinch_scale; ///

// VulkanContext
private alias c_gdk_vulkan_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_vulkan_context_get_typeFn c_gdk_vulkan_context_get_type; ///

// global
private alias c_gdk_cairo_draw_from_glFn = extern(C) void function(cairo_t* cr, GdkSurface* surface, int source, int sourceType, int bufferScale, int x, int y, int width, int height) nothrow;
__gshared c_gdk_cairo_draw_from_glFn c_gdk_cairo_draw_from_gl; ///
private alias c_gdk_cairo_rectangleFn = extern(C) void function(cairo_t* cr, const(GdkRectangle)* rectangle) nothrow;
__gshared c_gdk_cairo_rectangleFn c_gdk_cairo_rectangle; ///
private alias c_gdk_cairo_regionFn = extern(C) void function(cairo_t* cr, const(cairo_region_t)* region) nothrow;
__gshared c_gdk_cairo_regionFn c_gdk_cairo_region; ///
private alias c_gdk_cairo_region_create_from_surfaceFn = extern(C) cairo_region_t* function(cairo_surface_t* surface) nothrow;
__gshared c_gdk_cairo_region_create_from_surfaceFn c_gdk_cairo_region_create_from_surface; ///
private alias c_gdk_cairo_set_source_pixbufFn = extern(C) void function(cairo_t* cr, const(GdkPixbuf)* pixbuf, double pixbufX, double pixbufY) nothrow;
__gshared c_gdk_cairo_set_source_pixbufFn c_gdk_cairo_set_source_pixbuf; ///
private alias c_gdk_cairo_set_source_rgbaFn = extern(C) void function(cairo_t* cr, const(GdkRGBA)* rgba) nothrow;
__gshared c_gdk_cairo_set_source_rgbaFn c_gdk_cairo_set_source_rgba; ///
private alias c_gdk_content_deserialize_asyncFn = extern(C) void function(GInputStream* stream, const(char)* mimeType, GType type, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_content_deserialize_asyncFn c_gdk_content_deserialize_async; ///
private alias c_gdk_content_deserialize_finishFn = extern(C) gboolean function(GAsyncResult* result, GValue* value, GError** _err) nothrow;
__gshared c_gdk_content_deserialize_finishFn c_gdk_content_deserialize_finish; ///
private alias c_gdk_content_register_deserializerFn = extern(C) void function(const(char)* mimeType, GType type, GdkContentDeserializeFunc deserialize, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_content_register_deserializerFn c_gdk_content_register_deserializer; ///
private alias c_gdk_content_register_serializerFn = extern(C) void function(GType type, const(char)* mimeType, GdkContentSerializeFunc serialize, void* data, GDestroyNotify notify) nothrow;
__gshared c_gdk_content_register_serializerFn c_gdk_content_register_serializer; ///
private alias c_gdk_content_serialize_asyncFn = extern(C) void function(GOutputStream* stream, const(char)* mimeType, const(GValue)* value, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_content_serialize_asyncFn c_gdk_content_serialize_async; ///
private alias c_gdk_content_serialize_finishFn = extern(C) gboolean function(GAsyncResult* result, GError** _err) nothrow;
__gshared c_gdk_content_serialize_finishFn c_gdk_content_serialize_finish; ///
private alias c_gdk_events_get_angleFn = extern(C) gboolean function(GdkEvent* event1, GdkEvent* event2, double* angle) nothrow;
__gshared c_gdk_events_get_angleFn c_gdk_events_get_angle; ///
private alias c_gdk_events_get_centerFn = extern(C) gboolean function(GdkEvent* event1, GdkEvent* event2, double* x, double* y) nothrow;
__gshared c_gdk_events_get_centerFn c_gdk_events_get_center; ///
private alias c_gdk_events_get_distanceFn = extern(C) gboolean function(GdkEvent* event1, GdkEvent* event2, double* distance) nothrow;
__gshared c_gdk_events_get_distanceFn c_gdk_events_get_distance; ///
private alias c_gdk_intern_mime_typeFn = extern(C) const(char)* function(const(char)* string_) nothrow;
__gshared c_gdk_intern_mime_typeFn c_gdk_intern_mime_type; ///
private alias c_gdk_keyval_convert_caseFn = extern(C) void function(uint symbol, uint* lower, uint* upper) nothrow;
__gshared c_gdk_keyval_convert_caseFn c_gdk_keyval_convert_case; ///
private alias c_gdk_keyval_from_nameFn = extern(C) uint function(const(char)* keyvalName) nothrow;
__gshared c_gdk_keyval_from_nameFn c_gdk_keyval_from_name; ///
private alias c_gdk_keyval_is_lowerFn = extern(C) gboolean function(uint keyval) nothrow;
__gshared c_gdk_keyval_is_lowerFn c_gdk_keyval_is_lower; ///
private alias c_gdk_keyval_is_upperFn = extern(C) gboolean function(uint keyval) nothrow;
__gshared c_gdk_keyval_is_upperFn c_gdk_keyval_is_upper; ///
private alias c_gdk_keyval_nameFn = extern(C) const(char)* function(uint keyval) nothrow;
__gshared c_gdk_keyval_nameFn c_gdk_keyval_name; ///
private alias c_gdk_keyval_to_lowerFn = extern(C) uint function(uint keyval) nothrow;
__gshared c_gdk_keyval_to_lowerFn c_gdk_keyval_to_lower; ///
private alias c_gdk_keyval_to_unicodeFn = extern(C) uint function(uint keyval) nothrow;
__gshared c_gdk_keyval_to_unicodeFn c_gdk_keyval_to_unicode; ///
private alias c_gdk_keyval_to_upperFn = extern(C) uint function(uint keyval) nothrow;
__gshared c_gdk_keyval_to_upperFn c_gdk_keyval_to_upper; ///
private alias c_gdk_pango_layout_get_clip_regionFn = extern(C) cairo_region_t* function(PangoLayout* layout, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) nothrow;
__gshared c_gdk_pango_layout_get_clip_regionFn c_gdk_pango_layout_get_clip_region; ///
private alias c_gdk_pango_layout_line_get_clip_regionFn = extern(C) cairo_region_t* function(PangoLayoutLine* line, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) nothrow;
__gshared c_gdk_pango_layout_line_get_clip_regionFn c_gdk_pango_layout_line_get_clip_region; ///
private alias c_gdk_pixbuf_get_from_surfaceFn = extern(C) GdkPixbuf* function(cairo_surface_t* surface, int srcX, int srcY, int width, int height) nothrow;
__gshared c_gdk_pixbuf_get_from_surfaceFn c_gdk_pixbuf_get_from_surface; ///
private alias c_gdk_pixbuf_get_from_textureFn = extern(C) GdkPixbuf* function(GdkTexture* texture) nothrow;
__gshared c_gdk_pixbuf_get_from_textureFn c_gdk_pixbuf_get_from_texture; ///
private alias c_gdk_set_allowed_backendsFn = extern(C) void function(const(char)* backends) nothrow;
__gshared c_gdk_set_allowed_backendsFn c_gdk_set_allowed_backends; ///
private alias c_gdk_unicode_to_keyvalFn = extern(C) uint function(uint wc) nothrow;
__gshared c_gdk_unicode_to_keyvalFn c_gdk_unicode_to_keyval; ///

// DmabufError
private alias c_gdk_dmabuf_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gdk_dmabuf_error_quarkFn c_gdk_dmabuf_error_quark; ///

// DragAction
private alias c_gdk_drag_action_is_uniqueFn = extern(C) gboolean function(GdkDragAction action) nothrow;
__gshared c_gdk_drag_action_is_uniqueFn c_gdk_drag_action_is_unique; ///

// GLError
private alias c_gdk_gl_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gdk_gl_error_quarkFn c_gdk_gl_error_quark; ///

// TextureError
private alias c_gdk_texture_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gdk_texture_error_quarkFn c_gdk_texture_error_quark; ///

// VulkanError
private alias c_gdk_vulkan_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gdk_vulkan_error_quarkFn c_gdk_vulkan_error_quark; ///

// AppLaunchContext

/** */
alias gdk_app_launch_context_get_type = c_gdk_app_launch_context_get_type;

/** */
alias gdk_app_launch_context_get_display = c_gdk_app_launch_context_get_display;

/** */
alias gdk_app_launch_context_set_desktop = c_gdk_app_launch_context_set_desktop;

/** */
alias gdk_app_launch_context_set_icon = c_gdk_app_launch_context_set_icon;

/** */
alias gdk_app_launch_context_set_icon_name = c_gdk_app_launch_context_set_icon_name;

/** */
alias gdk_app_launch_context_set_timestamp = c_gdk_app_launch_context_set_timestamp;

// ButtonEvent

/** */
alias gdk_button_event_get_type = c_gdk_button_event_get_type;

/** */
alias gdk_button_event_get_button = c_gdk_button_event_get_button;

// CairoContext

/** */
alias gdk_cairo_context_get_type = c_gdk_cairo_context_get_type;

/** */
alias gdk_cairo_context_cairo_create = c_gdk_cairo_context_cairo_create;

// CicpParams

/** */
alias gdk_cicp_params_get_type = c_gdk_cicp_params_get_type;

/** */
alias gdk_cicp_params_new = c_gdk_cicp_params_new;

/** */
alias gdk_cicp_params_build_color_state = c_gdk_cicp_params_build_color_state;

/** */
alias gdk_cicp_params_get_color_primaries = c_gdk_cicp_params_get_color_primaries;

/** */
alias gdk_cicp_params_get_matrix_coefficients = c_gdk_cicp_params_get_matrix_coefficients;

/** */
alias gdk_cicp_params_get_range = c_gdk_cicp_params_get_range;

/** */
alias gdk_cicp_params_get_transfer_function = c_gdk_cicp_params_get_transfer_function;

/** */
alias gdk_cicp_params_set_color_primaries = c_gdk_cicp_params_set_color_primaries;

/** */
alias gdk_cicp_params_set_matrix_coefficients = c_gdk_cicp_params_set_matrix_coefficients;

/** */
alias gdk_cicp_params_set_range = c_gdk_cicp_params_set_range;

/** */
alias gdk_cicp_params_set_transfer_function = c_gdk_cicp_params_set_transfer_function;

// Clipboard

/** */
alias gdk_clipboard_get_type = c_gdk_clipboard_get_type;

/** */
alias gdk_clipboard_get_content = c_gdk_clipboard_get_content;

/** */
alias gdk_clipboard_get_display = c_gdk_clipboard_get_display;

/** */
alias gdk_clipboard_get_formats = c_gdk_clipboard_get_formats;

/** */
alias gdk_clipboard_is_local = c_gdk_clipboard_is_local;

/** */
alias gdk_clipboard_read_async = c_gdk_clipboard_read_async;

/** */
alias gdk_clipboard_read_finish = c_gdk_clipboard_read_finish;

/** */
alias gdk_clipboard_read_text_async = c_gdk_clipboard_read_text_async;

/** */
alias gdk_clipboard_read_text_finish = c_gdk_clipboard_read_text_finish;

/** */
alias gdk_clipboard_read_texture_async = c_gdk_clipboard_read_texture_async;

/** */
alias gdk_clipboard_read_texture_finish = c_gdk_clipboard_read_texture_finish;

/** */
alias gdk_clipboard_read_value_async = c_gdk_clipboard_read_value_async;

/** */
alias gdk_clipboard_read_value_finish = c_gdk_clipboard_read_value_finish;

/** */
alias gdk_clipboard_set = c_gdk_clipboard_set;

/** */
alias gdk_clipboard_set_content = c_gdk_clipboard_set_content;

/** */
alias gdk_clipboard_set_text = c_gdk_clipboard_set_text;

/** */
alias gdk_clipboard_set_texture = c_gdk_clipboard_set_texture;

/** */
alias gdk_clipboard_set_valist = c_gdk_clipboard_set_valist;

/** */
alias gdk_clipboard_set_value = c_gdk_clipboard_set_value;

/** */
alias gdk_clipboard_store_async = c_gdk_clipboard_store_async;

/** */
alias gdk_clipboard_store_finish = c_gdk_clipboard_store_finish;

// ColorState

/** */
alias gdk_color_state_get_type = c_gdk_color_state_get_type;

/** */
alias gdk_color_state_create_cicp_params = c_gdk_color_state_create_cicp_params;

/** */
alias gdk_color_state_equal = c_gdk_color_state_equal;

/** */
alias gdk_color_state_equivalent = c_gdk_color_state_equivalent;

/** */
alias gdk_color_state_ref = c_gdk_color_state_ref;

/** */
alias gdk_color_state_unref = c_gdk_color_state_unref;

/** */
alias gdk_color_state_get_oklab = c_gdk_color_state_get_oklab;

/** */
alias gdk_color_state_get_oklch = c_gdk_color_state_get_oklch;

/** */
alias gdk_color_state_get_rec2100_linear = c_gdk_color_state_get_rec2100_linear;

/** */
alias gdk_color_state_get_rec2100_pq = c_gdk_color_state_get_rec2100_pq;

/** */
alias gdk_color_state_get_srgb = c_gdk_color_state_get_srgb;

/** */
alias gdk_color_state_get_srgb_linear = c_gdk_color_state_get_srgb_linear;

// ContentDeserializer

/** */
alias gdk_content_deserializer_get_type = c_gdk_content_deserializer_get_type;

/** */
alias gdk_content_deserializer_get_cancellable = c_gdk_content_deserializer_get_cancellable;

/** */
alias gdk_content_deserializer_get_gtype = c_gdk_content_deserializer_get_gtype;

/** */
alias gdk_content_deserializer_get_input_stream = c_gdk_content_deserializer_get_input_stream;

/** */
alias gdk_content_deserializer_get_mime_type = c_gdk_content_deserializer_get_mime_type;

/** */
alias gdk_content_deserializer_get_priority = c_gdk_content_deserializer_get_priority;

/** */
alias gdk_content_deserializer_get_task_data = c_gdk_content_deserializer_get_task_data;

/** */
alias gdk_content_deserializer_get_user_data = c_gdk_content_deserializer_get_user_data;

/** */
alias gdk_content_deserializer_get_value = c_gdk_content_deserializer_get_value;

/** */
alias gdk_content_deserializer_return_error = c_gdk_content_deserializer_return_error;

/** */
alias gdk_content_deserializer_return_success = c_gdk_content_deserializer_return_success;

/** */
alias gdk_content_deserializer_set_task_data = c_gdk_content_deserializer_set_task_data;

// ContentFormats

/** */
alias gdk_content_formats_get_type = c_gdk_content_formats_get_type;

/** */
alias gdk_content_formats_new = c_gdk_content_formats_new;

/** */
alias gdk_content_formats_new_for_gtype = c_gdk_content_formats_new_for_gtype;

/** */
alias gdk_content_formats_contain_gtype = c_gdk_content_formats_contain_gtype;

/** */
alias gdk_content_formats_contain_mime_type = c_gdk_content_formats_contain_mime_type;

/** */
alias gdk_content_formats_get_gtypes = c_gdk_content_formats_get_gtypes;

/** */
alias gdk_content_formats_get_mime_types = c_gdk_content_formats_get_mime_types;

/** */
alias gdk_content_formats_is_empty = c_gdk_content_formats_is_empty;

/** */
alias gdk_content_formats_match = c_gdk_content_formats_match;

/** */
alias gdk_content_formats_match_gtype = c_gdk_content_formats_match_gtype;

/** */
alias gdk_content_formats_match_mime_type = c_gdk_content_formats_match_mime_type;

/** */
alias gdk_content_formats_print = c_gdk_content_formats_print;

/** */
alias gdk_content_formats_ref = c_gdk_content_formats_ref;

/** */
alias gdk_content_formats_to_string = c_gdk_content_formats_to_string;

/** */
alias gdk_content_formats_union = c_gdk_content_formats_union;

/** */
alias gdk_content_formats_union_deserialize_gtypes = c_gdk_content_formats_union_deserialize_gtypes;

/** */
alias gdk_content_formats_union_deserialize_mime_types = c_gdk_content_formats_union_deserialize_mime_types;

/** */
alias gdk_content_formats_union_serialize_gtypes = c_gdk_content_formats_union_serialize_gtypes;

/** */
alias gdk_content_formats_union_serialize_mime_types = c_gdk_content_formats_union_serialize_mime_types;

/** */
alias gdk_content_formats_unref = c_gdk_content_formats_unref;

/** */
alias gdk_content_formats_parse = c_gdk_content_formats_parse;

// ContentFormatsBuilder

/** */
alias gdk_content_formats_builder_get_type = c_gdk_content_formats_builder_get_type;

/** */
alias gdk_content_formats_builder_new = c_gdk_content_formats_builder_new;

/** */
alias gdk_content_formats_builder_add_formats = c_gdk_content_formats_builder_add_formats;

/** */
alias gdk_content_formats_builder_add_gtype = c_gdk_content_formats_builder_add_gtype;

/** */
alias gdk_content_formats_builder_add_mime_type = c_gdk_content_formats_builder_add_mime_type;

/** */
alias gdk_content_formats_builder_free_to_formats = c_gdk_content_formats_builder_free_to_formats;

/** */
alias gdk_content_formats_builder_ref = c_gdk_content_formats_builder_ref;

/** */
alias gdk_content_formats_builder_to_formats = c_gdk_content_formats_builder_to_formats;

/** */
alias gdk_content_formats_builder_unref = c_gdk_content_formats_builder_unref;

// ContentProvider

/** */
alias gdk_content_provider_get_type = c_gdk_content_provider_get_type;

/** */
alias gdk_content_provider_new_for_bytes = c_gdk_content_provider_new_for_bytes;

/** */
alias gdk_content_provider_new_for_value = c_gdk_content_provider_new_for_value;

/** */
alias gdk_content_provider_new_typed = c_gdk_content_provider_new_typed;

/** */
alias gdk_content_provider_new_union = c_gdk_content_provider_new_union;

/** */
alias gdk_content_provider_content_changed = c_gdk_content_provider_content_changed;

/** */
alias gdk_content_provider_get_value = c_gdk_content_provider_get_value;

/** */
alias gdk_content_provider_ref_formats = c_gdk_content_provider_ref_formats;

/** */
alias gdk_content_provider_ref_storable_formats = c_gdk_content_provider_ref_storable_formats;

/** */
alias gdk_content_provider_write_mime_type_async = c_gdk_content_provider_write_mime_type_async;

/** */
alias gdk_content_provider_write_mime_type_finish = c_gdk_content_provider_write_mime_type_finish;

// ContentSerializer

/** */
alias gdk_content_serializer_get_type = c_gdk_content_serializer_get_type;

/** */
alias gdk_content_serializer_get_cancellable = c_gdk_content_serializer_get_cancellable;

/** */
alias gdk_content_serializer_get_gtype = c_gdk_content_serializer_get_gtype;

/** */
alias gdk_content_serializer_get_mime_type = c_gdk_content_serializer_get_mime_type;

/** */
alias gdk_content_serializer_get_output_stream = c_gdk_content_serializer_get_output_stream;

/** */
alias gdk_content_serializer_get_priority = c_gdk_content_serializer_get_priority;

/** */
alias gdk_content_serializer_get_task_data = c_gdk_content_serializer_get_task_data;

/** */
alias gdk_content_serializer_get_user_data = c_gdk_content_serializer_get_user_data;

/** */
alias gdk_content_serializer_get_value = c_gdk_content_serializer_get_value;

/** */
alias gdk_content_serializer_return_error = c_gdk_content_serializer_return_error;

/** */
alias gdk_content_serializer_return_success = c_gdk_content_serializer_return_success;

/** */
alias gdk_content_serializer_set_task_data = c_gdk_content_serializer_set_task_data;

// CrossingEvent

/** */
alias gdk_crossing_event_get_type = c_gdk_crossing_event_get_type;

/** */
alias gdk_crossing_event_get_detail = c_gdk_crossing_event_get_detail;

/** */
alias gdk_crossing_event_get_focus = c_gdk_crossing_event_get_focus;

/** */
alias gdk_crossing_event_get_mode = c_gdk_crossing_event_get_mode;

// Cursor

/** */
alias gdk_cursor_get_type = c_gdk_cursor_get_type;

/** */
alias gdk_cursor_new_from_callback = c_gdk_cursor_new_from_callback;

/** */
alias gdk_cursor_new_from_name = c_gdk_cursor_new_from_name;

/** */
alias gdk_cursor_new_from_texture = c_gdk_cursor_new_from_texture;

/** */
alias gdk_cursor_get_fallback = c_gdk_cursor_get_fallback;

/** */
alias gdk_cursor_get_hotspot_x = c_gdk_cursor_get_hotspot_x;

/** */
alias gdk_cursor_get_hotspot_y = c_gdk_cursor_get_hotspot_y;

/** */
alias gdk_cursor_get_name = c_gdk_cursor_get_name;

/** */
alias gdk_cursor_get_texture = c_gdk_cursor_get_texture;

// DNDEvent

/** */
alias gdk_dnd_event_get_type = c_gdk_dnd_event_get_type;

/** */
alias gdk_dnd_event_get_drop = c_gdk_dnd_event_get_drop;

// DeleteEvent

/** */
alias gdk_delete_event_get_type = c_gdk_delete_event_get_type;

// Device

/** */
alias gdk_device_get_type = c_gdk_device_get_type;

/** */
alias gdk_device_get_active_layout_index = c_gdk_device_get_active_layout_index;

/** */
alias gdk_device_get_caps_lock_state = c_gdk_device_get_caps_lock_state;

/** */
alias gdk_device_get_device_tool = c_gdk_device_get_device_tool;

/** */
alias gdk_device_get_direction = c_gdk_device_get_direction;

/** */
alias gdk_device_get_display = c_gdk_device_get_display;

/** */
alias gdk_device_get_has_cursor = c_gdk_device_get_has_cursor;

/** */
alias gdk_device_get_layout_names = c_gdk_device_get_layout_names;

/** */
alias gdk_device_get_modifier_state = c_gdk_device_get_modifier_state;

/** */
alias gdk_device_get_name = c_gdk_device_get_name;

/** */
alias gdk_device_get_num_lock_state = c_gdk_device_get_num_lock_state;

/** */
alias gdk_device_get_num_touches = c_gdk_device_get_num_touches;

/** */
alias gdk_device_get_product_id = c_gdk_device_get_product_id;

/** */
alias gdk_device_get_scroll_lock_state = c_gdk_device_get_scroll_lock_state;

/** */
alias gdk_device_get_seat = c_gdk_device_get_seat;

/** */
alias gdk_device_get_source = c_gdk_device_get_source;

/** */
alias gdk_device_get_surface_at_position = c_gdk_device_get_surface_at_position;

/** */
alias gdk_device_get_timestamp = c_gdk_device_get_timestamp;

/** */
alias gdk_device_get_vendor_id = c_gdk_device_get_vendor_id;

/** */
alias gdk_device_has_bidi_layouts = c_gdk_device_has_bidi_layouts;

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
alias gdk_device_tool_get_axes = c_gdk_device_tool_get_axes;

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
alias gdk_display_beep = c_gdk_display_beep;

/** */
alias gdk_display_close = c_gdk_display_close;

/** */
alias gdk_display_create_gl_context = c_gdk_display_create_gl_context;

/** */
alias gdk_display_device_is_grabbed = c_gdk_display_device_is_grabbed;

/** */
alias gdk_display_flush = c_gdk_display_flush;

/** */
alias gdk_display_get_app_launch_context = c_gdk_display_get_app_launch_context;

/** */
alias gdk_display_get_clipboard = c_gdk_display_get_clipboard;

/** */
alias gdk_display_get_default_seat = c_gdk_display_get_default_seat;

/** */
alias gdk_display_get_dmabuf_formats = c_gdk_display_get_dmabuf_formats;

/** */
alias gdk_display_get_monitor_at_surface = c_gdk_display_get_monitor_at_surface;

/** */
alias gdk_display_get_monitors = c_gdk_display_get_monitors;

/** */
alias gdk_display_get_name = c_gdk_display_get_name;

/** */
alias gdk_display_get_primary_clipboard = c_gdk_display_get_primary_clipboard;

/** */
alias gdk_display_get_setting = c_gdk_display_get_setting;

/** */
alias gdk_display_get_startup_notification_id = c_gdk_display_get_startup_notification_id;

/** */
alias gdk_display_is_closed = c_gdk_display_is_closed;

/** */
alias gdk_display_is_composited = c_gdk_display_is_composited;

/** */
alias gdk_display_is_rgba = c_gdk_display_is_rgba;

/** */
alias gdk_display_list_seats = c_gdk_display_list_seats;

/** */
alias gdk_display_map_keycode = c_gdk_display_map_keycode;

/** */
alias gdk_display_map_keyval = c_gdk_display_map_keyval;

/** */
alias gdk_display_notify_startup_complete = c_gdk_display_notify_startup_complete;

/** */
alias gdk_display_prepare_gl = c_gdk_display_prepare_gl;

/** */
alias gdk_display_put_event = c_gdk_display_put_event;

/** */
alias gdk_display_supports_input_shapes = c_gdk_display_supports_input_shapes;

/** */
alias gdk_display_supports_shadow_width = c_gdk_display_supports_shadow_width;

/** */
alias gdk_display_sync = c_gdk_display_sync;

/** */
alias gdk_display_translate_key = c_gdk_display_translate_key;

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

// DmabufFormats

/** */
alias gdk_dmabuf_formats_get_type = c_gdk_dmabuf_formats_get_type;

/** */
alias gdk_dmabuf_formats_contains = c_gdk_dmabuf_formats_contains;

/** */
alias gdk_dmabuf_formats_equal = c_gdk_dmabuf_formats_equal;

/** */
alias gdk_dmabuf_formats_get_format = c_gdk_dmabuf_formats_get_format;

/** */
alias gdk_dmabuf_formats_get_n_formats = c_gdk_dmabuf_formats_get_n_formats;

/** */
alias gdk_dmabuf_formats_ref = c_gdk_dmabuf_formats_ref;

/** */
alias gdk_dmabuf_formats_unref = c_gdk_dmabuf_formats_unref;

// DmabufTexture

/** */
alias gdk_dmabuf_texture_get_type = c_gdk_dmabuf_texture_get_type;

// DmabufTextureBuilder

/** */
alias gdk_dmabuf_texture_builder_get_type = c_gdk_dmabuf_texture_builder_get_type;

/** */
alias gdk_dmabuf_texture_builder_new = c_gdk_dmabuf_texture_builder_new;

/** */
alias gdk_dmabuf_texture_builder_build = c_gdk_dmabuf_texture_builder_build;

/** */
alias gdk_dmabuf_texture_builder_get_color_state = c_gdk_dmabuf_texture_builder_get_color_state;

/** */
alias gdk_dmabuf_texture_builder_get_display = c_gdk_dmabuf_texture_builder_get_display;

/** */
alias gdk_dmabuf_texture_builder_get_fd = c_gdk_dmabuf_texture_builder_get_fd;

/** */
alias gdk_dmabuf_texture_builder_get_fourcc = c_gdk_dmabuf_texture_builder_get_fourcc;

/** */
alias gdk_dmabuf_texture_builder_get_height = c_gdk_dmabuf_texture_builder_get_height;

/** */
alias gdk_dmabuf_texture_builder_get_modifier = c_gdk_dmabuf_texture_builder_get_modifier;

/** */
alias gdk_dmabuf_texture_builder_get_n_planes = c_gdk_dmabuf_texture_builder_get_n_planes;

/** */
alias gdk_dmabuf_texture_builder_get_offset = c_gdk_dmabuf_texture_builder_get_offset;

/** */
alias gdk_dmabuf_texture_builder_get_premultiplied = c_gdk_dmabuf_texture_builder_get_premultiplied;

/** */
alias gdk_dmabuf_texture_builder_get_stride = c_gdk_dmabuf_texture_builder_get_stride;

/** */
alias gdk_dmabuf_texture_builder_get_update_region = c_gdk_dmabuf_texture_builder_get_update_region;

/** */
alias gdk_dmabuf_texture_builder_get_update_texture = c_gdk_dmabuf_texture_builder_get_update_texture;

/** */
alias gdk_dmabuf_texture_builder_get_width = c_gdk_dmabuf_texture_builder_get_width;

/** */
alias gdk_dmabuf_texture_builder_set_color_state = c_gdk_dmabuf_texture_builder_set_color_state;

/** */
alias gdk_dmabuf_texture_builder_set_display = c_gdk_dmabuf_texture_builder_set_display;

/** */
alias gdk_dmabuf_texture_builder_set_fd = c_gdk_dmabuf_texture_builder_set_fd;

/** */
alias gdk_dmabuf_texture_builder_set_fourcc = c_gdk_dmabuf_texture_builder_set_fourcc;

/** */
alias gdk_dmabuf_texture_builder_set_height = c_gdk_dmabuf_texture_builder_set_height;

/** */
alias gdk_dmabuf_texture_builder_set_modifier = c_gdk_dmabuf_texture_builder_set_modifier;

/** */
alias gdk_dmabuf_texture_builder_set_n_planes = c_gdk_dmabuf_texture_builder_set_n_planes;

/** */
alias gdk_dmabuf_texture_builder_set_offset = c_gdk_dmabuf_texture_builder_set_offset;

/** */
alias gdk_dmabuf_texture_builder_set_premultiplied = c_gdk_dmabuf_texture_builder_set_premultiplied;

/** */
alias gdk_dmabuf_texture_builder_set_stride = c_gdk_dmabuf_texture_builder_set_stride;

/** */
alias gdk_dmabuf_texture_builder_set_update_region = c_gdk_dmabuf_texture_builder_set_update_region;

/** */
alias gdk_dmabuf_texture_builder_set_update_texture = c_gdk_dmabuf_texture_builder_set_update_texture;

/** */
alias gdk_dmabuf_texture_builder_set_width = c_gdk_dmabuf_texture_builder_set_width;

// Drag

/** */
alias gdk_drag_get_type = c_gdk_drag_get_type;

/** */
alias gdk_drag_begin = c_gdk_drag_begin;

/** */
alias gdk_drag_drop_done = c_gdk_drag_drop_done;

/** */
alias gdk_drag_get_actions = c_gdk_drag_get_actions;

/** */
alias gdk_drag_get_content = c_gdk_drag_get_content;

/** */
alias gdk_drag_get_device = c_gdk_drag_get_device;

/** */
alias gdk_drag_get_display = c_gdk_drag_get_display;

/** */
alias gdk_drag_get_drag_surface = c_gdk_drag_get_drag_surface;

/** */
alias gdk_drag_get_formats = c_gdk_drag_get_formats;

/** */
alias gdk_drag_get_selected_action = c_gdk_drag_get_selected_action;

/** */
alias gdk_drag_get_surface = c_gdk_drag_get_surface;

/** */
alias gdk_drag_set_hotspot = c_gdk_drag_set_hotspot;

// DragSurface

/** */
alias gdk_drag_surface_get_type = c_gdk_drag_surface_get_type;

/** */
alias gdk_drag_surface_present = c_gdk_drag_surface_present;

// DragSurfaceSize

/** */
alias gdk_drag_surface_size_get_type = c_gdk_drag_surface_size_get_type;

/** */
alias gdk_drag_surface_size_set_size = c_gdk_drag_surface_size_set_size;

// DrawContext

/** */
alias gdk_draw_context_get_type = c_gdk_draw_context_get_type;

/** */
alias gdk_draw_context_begin_frame = c_gdk_draw_context_begin_frame;

/** */
alias gdk_draw_context_end_frame = c_gdk_draw_context_end_frame;

/** */
alias gdk_draw_context_get_display = c_gdk_draw_context_get_display;

/** */
alias gdk_draw_context_get_frame_region = c_gdk_draw_context_get_frame_region;

/** */
alias gdk_draw_context_get_surface = c_gdk_draw_context_get_surface;

/** */
alias gdk_draw_context_is_in_frame = c_gdk_draw_context_is_in_frame;

// Drop

/** */
alias gdk_drop_get_type = c_gdk_drop_get_type;

/** */
alias gdk_drop_finish = c_gdk_drop_finish;

/** */
alias gdk_drop_get_actions = c_gdk_drop_get_actions;

/** */
alias gdk_drop_get_device = c_gdk_drop_get_device;

/** */
alias gdk_drop_get_display = c_gdk_drop_get_display;

/** */
alias gdk_drop_get_drag = c_gdk_drop_get_drag;

/** */
alias gdk_drop_get_formats = c_gdk_drop_get_formats;

/** */
alias gdk_drop_get_surface = c_gdk_drop_get_surface;

/** */
alias gdk_drop_read_async = c_gdk_drop_read_async;

/** */
alias gdk_drop_read_finish = c_gdk_drop_read_finish;

/** */
alias gdk_drop_read_value_async = c_gdk_drop_read_value_async;

/** */
alias gdk_drop_read_value_finish = c_gdk_drop_read_value_finish;

/** */
alias gdk_drop_status = c_gdk_drop_status;

// Event

/** */
alias gdk_event_get_type = c_gdk_event_get_type;

/** */
alias gdk_event_get_axes = c_gdk_event_get_axes;

/** */
alias gdk_event_get_axis = c_gdk_event_get_axis;

/** */
alias gdk_event_get_device = c_gdk_event_get_device;

/** */
alias gdk_event_get_device_tool = c_gdk_event_get_device_tool;

/** */
alias gdk_event_get_display = c_gdk_event_get_display;

/** */
alias gdk_event_get_event_sequence = c_gdk_event_get_event_sequence;

/** */
alias gdk_event_get_event_type = c_gdk_event_get_event_type;

/** */
alias gdk_event_get_history = c_gdk_event_get_history;

/** */
alias gdk_event_get_modifier_state = c_gdk_event_get_modifier_state;

/** */
alias gdk_event_get_pointer_emulated = c_gdk_event_get_pointer_emulated;

/** */
alias gdk_event_get_position = c_gdk_event_get_position;

/** */
alias gdk_event_get_seat = c_gdk_event_get_seat;

/** */
alias gdk_event_get_surface = c_gdk_event_get_surface;

/** */
alias gdk_event_get_time = c_gdk_event_get_time;

/** */
alias gdk_event_ref = c_gdk_event_ref;

/** */
alias gdk_event_triggers_context_menu = c_gdk_event_triggers_context_menu;

/** */
alias gdk_event_unref = c_gdk_event_unref;

// EventSequence

/** */
alias gdk_event_sequence_get_type = c_gdk_event_sequence_get_type;

// FileList

/** */
alias gdk_file_list_get_type = c_gdk_file_list_get_type;

/** */
alias gdk_file_list_new_from_array = c_gdk_file_list_new_from_array;

/** */
alias gdk_file_list_new_from_list = c_gdk_file_list_new_from_list;

/** */
alias gdk_file_list_get_files = c_gdk_file_list_get_files;

// FocusEvent

/** */
alias gdk_focus_event_get_type = c_gdk_focus_event_get_type;

/** */
alias gdk_focus_event_get_in = c_gdk_focus_event_get_in;

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
alias gdk_frame_clock_get_fps = c_gdk_frame_clock_get_fps;

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
alias gdk_gl_context_get_allowed_apis = c_gdk_gl_context_get_allowed_apis;

/** */
alias gdk_gl_context_get_api = c_gdk_gl_context_get_api;

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
alias gdk_gl_context_get_surface = c_gdk_gl_context_get_surface;

/** */
alias gdk_gl_context_get_use_es = c_gdk_gl_context_get_use_es;

/** */
alias gdk_gl_context_get_version = c_gdk_gl_context_get_version;

/** */
alias gdk_gl_context_is_legacy = c_gdk_gl_context_is_legacy;

/** */
alias gdk_gl_context_is_shared = c_gdk_gl_context_is_shared;

/** */
alias gdk_gl_context_make_current = c_gdk_gl_context_make_current;

/** */
alias gdk_gl_context_realize = c_gdk_gl_context_realize;

/** */
alias gdk_gl_context_set_allowed_apis = c_gdk_gl_context_set_allowed_apis;

/** */
alias gdk_gl_context_set_debug_enabled = c_gdk_gl_context_set_debug_enabled;

/** */
alias gdk_gl_context_set_forward_compatible = c_gdk_gl_context_set_forward_compatible;

/** */
alias gdk_gl_context_set_required_version = c_gdk_gl_context_set_required_version;

/** */
alias gdk_gl_context_set_use_es = c_gdk_gl_context_set_use_es;

// GLTexture

/** */
alias gdk_gl_texture_get_type = c_gdk_gl_texture_get_type;

/** */
alias gdk_gl_texture_new = c_gdk_gl_texture_new;

/** */
alias gdk_gl_texture_release = c_gdk_gl_texture_release;

// GLTextureBuilder

/** */
alias gdk_gl_texture_builder_get_type = c_gdk_gl_texture_builder_get_type;

/** */
alias gdk_gl_texture_builder_new = c_gdk_gl_texture_builder_new;

/** */
alias gdk_gl_texture_builder_build = c_gdk_gl_texture_builder_build;

/** */
alias gdk_gl_texture_builder_get_color_state = c_gdk_gl_texture_builder_get_color_state;

/** */
alias gdk_gl_texture_builder_get_context = c_gdk_gl_texture_builder_get_context;

/** */
alias gdk_gl_texture_builder_get_format = c_gdk_gl_texture_builder_get_format;

/** */
alias gdk_gl_texture_builder_get_has_mipmap = c_gdk_gl_texture_builder_get_has_mipmap;

/** */
alias gdk_gl_texture_builder_get_height = c_gdk_gl_texture_builder_get_height;

/** */
alias gdk_gl_texture_builder_get_id = c_gdk_gl_texture_builder_get_id;

/** */
alias gdk_gl_texture_builder_get_sync = c_gdk_gl_texture_builder_get_sync;

/** */
alias gdk_gl_texture_builder_get_update_region = c_gdk_gl_texture_builder_get_update_region;

/** */
alias gdk_gl_texture_builder_get_update_texture = c_gdk_gl_texture_builder_get_update_texture;

/** */
alias gdk_gl_texture_builder_get_width = c_gdk_gl_texture_builder_get_width;

/** */
alias gdk_gl_texture_builder_set_color_state = c_gdk_gl_texture_builder_set_color_state;

/** */
alias gdk_gl_texture_builder_set_context = c_gdk_gl_texture_builder_set_context;

/** */
alias gdk_gl_texture_builder_set_format = c_gdk_gl_texture_builder_set_format;

/** */
alias gdk_gl_texture_builder_set_has_mipmap = c_gdk_gl_texture_builder_set_has_mipmap;

/** */
alias gdk_gl_texture_builder_set_height = c_gdk_gl_texture_builder_set_height;

/** */
alias gdk_gl_texture_builder_set_id = c_gdk_gl_texture_builder_set_id;

/** */
alias gdk_gl_texture_builder_set_sync = c_gdk_gl_texture_builder_set_sync;

/** */
alias gdk_gl_texture_builder_set_update_region = c_gdk_gl_texture_builder_set_update_region;

/** */
alias gdk_gl_texture_builder_set_update_texture = c_gdk_gl_texture_builder_set_update_texture;

/** */
alias gdk_gl_texture_builder_set_width = c_gdk_gl_texture_builder_set_width;

// GrabBrokenEvent

/** */
alias gdk_grab_broken_event_get_type = c_gdk_grab_broken_event_get_type;

/** */
alias gdk_grab_broken_event_get_grab_surface = c_gdk_grab_broken_event_get_grab_surface;

/** */
alias gdk_grab_broken_event_get_implicit = c_gdk_grab_broken_event_get_implicit;

// KeyEvent

/** */
alias gdk_key_event_get_type = c_gdk_key_event_get_type;

/** */
alias gdk_key_event_get_consumed_modifiers = c_gdk_key_event_get_consumed_modifiers;

/** */
alias gdk_key_event_get_keycode = c_gdk_key_event_get_keycode;

/** */
alias gdk_key_event_get_keyval = c_gdk_key_event_get_keyval;

/** */
alias gdk_key_event_get_layout = c_gdk_key_event_get_layout;

/** */
alias gdk_key_event_get_level = c_gdk_key_event_get_level;

/** */
alias gdk_key_event_get_match = c_gdk_key_event_get_match;

/** */
alias gdk_key_event_is_modifier = c_gdk_key_event_is_modifier;

/** */
alias gdk_key_event_matches = c_gdk_key_event_matches;

// MemoryTexture

/** */
alias gdk_memory_texture_get_type = c_gdk_memory_texture_get_type;

/** */
alias gdk_memory_texture_new = c_gdk_memory_texture_new;

// MemoryTextureBuilder

/** */
alias gdk_memory_texture_builder_get_type = c_gdk_memory_texture_builder_get_type;

/** */
alias gdk_memory_texture_builder_new = c_gdk_memory_texture_builder_new;

/** */
alias gdk_memory_texture_builder_build = c_gdk_memory_texture_builder_build;

/** */
alias gdk_memory_texture_builder_get_bytes = c_gdk_memory_texture_builder_get_bytes;

/** */
alias gdk_memory_texture_builder_get_color_state = c_gdk_memory_texture_builder_get_color_state;

/** */
alias gdk_memory_texture_builder_get_format = c_gdk_memory_texture_builder_get_format;

/** */
alias gdk_memory_texture_builder_get_height = c_gdk_memory_texture_builder_get_height;

/** */
alias gdk_memory_texture_builder_get_offset = c_gdk_memory_texture_builder_get_offset;

/** */
alias gdk_memory_texture_builder_get_stride = c_gdk_memory_texture_builder_get_stride;

/** */
alias gdk_memory_texture_builder_get_stride_for_plane = c_gdk_memory_texture_builder_get_stride_for_plane;

/** */
alias gdk_memory_texture_builder_get_update_region = c_gdk_memory_texture_builder_get_update_region;

/** */
alias gdk_memory_texture_builder_get_update_texture = c_gdk_memory_texture_builder_get_update_texture;

/** */
alias gdk_memory_texture_builder_get_width = c_gdk_memory_texture_builder_get_width;

/** */
alias gdk_memory_texture_builder_set_bytes = c_gdk_memory_texture_builder_set_bytes;

/** */
alias gdk_memory_texture_builder_set_color_state = c_gdk_memory_texture_builder_set_color_state;

/** */
alias gdk_memory_texture_builder_set_format = c_gdk_memory_texture_builder_set_format;

/** */
alias gdk_memory_texture_builder_set_height = c_gdk_memory_texture_builder_set_height;

/** */
alias gdk_memory_texture_builder_set_offset = c_gdk_memory_texture_builder_set_offset;

/** */
alias gdk_memory_texture_builder_set_stride = c_gdk_memory_texture_builder_set_stride;

/** */
alias gdk_memory_texture_builder_set_stride_for_plane = c_gdk_memory_texture_builder_set_stride_for_plane;

/** */
alias gdk_memory_texture_builder_set_update_region = c_gdk_memory_texture_builder_set_update_region;

/** */
alias gdk_memory_texture_builder_set_update_texture = c_gdk_memory_texture_builder_set_update_texture;

/** */
alias gdk_memory_texture_builder_set_width = c_gdk_memory_texture_builder_set_width;

// MonitorWrap

/** */
alias gdk_monitor_get_type = c_gdk_monitor_get_type;

/** */
alias gdk_monitor_get_connector = c_gdk_monitor_get_connector;

/** */
alias gdk_monitor_get_description = c_gdk_monitor_get_description;

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
alias gdk_monitor_get_scale = c_gdk_monitor_get_scale;

/** */
alias gdk_monitor_get_scale_factor = c_gdk_monitor_get_scale_factor;

/** */
alias gdk_monitor_get_subpixel_layout = c_gdk_monitor_get_subpixel_layout;

/** */
alias gdk_monitor_get_width_mm = c_gdk_monitor_get_width_mm;

/** */
alias gdk_monitor_is_valid = c_gdk_monitor_is_valid;

// MotionEvent

/** */
alias gdk_motion_event_get_type = c_gdk_motion_event_get_type;

// PadEvent

/** */
alias gdk_pad_event_get_type = c_gdk_pad_event_get_type;

/** */
alias gdk_pad_event_get_axis_value = c_gdk_pad_event_get_axis_value;

/** */
alias gdk_pad_event_get_button = c_gdk_pad_event_get_button;

/** */
alias gdk_pad_event_get_group_mode = c_gdk_pad_event_get_group_mode;

// Paintable

/** */
alias gdk_paintable_get_type = c_gdk_paintable_get_type;

/** */
alias gdk_paintable_new_empty = c_gdk_paintable_new_empty;

/** */
alias gdk_paintable_compute_concrete_size = c_gdk_paintable_compute_concrete_size;

/** */
alias gdk_paintable_get_current_image = c_gdk_paintable_get_current_image;

/** */
alias gdk_paintable_get_flags = c_gdk_paintable_get_flags;

/** */
alias gdk_paintable_get_intrinsic_aspect_ratio = c_gdk_paintable_get_intrinsic_aspect_ratio;

/** */
alias gdk_paintable_get_intrinsic_height = c_gdk_paintable_get_intrinsic_height;

/** */
alias gdk_paintable_get_intrinsic_width = c_gdk_paintable_get_intrinsic_width;

/** */
alias gdk_paintable_invalidate_contents = c_gdk_paintable_invalidate_contents;

/** */
alias gdk_paintable_invalidate_size = c_gdk_paintable_invalidate_size;

/** */
alias gdk_paintable_snapshot = c_gdk_paintable_snapshot;

// Popup

/** */
alias gdk_popup_get_type = c_gdk_popup_get_type;

/** */
alias gdk_popup_get_autohide = c_gdk_popup_get_autohide;

/** */
alias gdk_popup_get_parent = c_gdk_popup_get_parent;

/** */
alias gdk_popup_get_position_x = c_gdk_popup_get_position_x;

/** */
alias gdk_popup_get_position_y = c_gdk_popup_get_position_y;

/** */
alias gdk_popup_get_rect_anchor = c_gdk_popup_get_rect_anchor;

/** */
alias gdk_popup_get_surface_anchor = c_gdk_popup_get_surface_anchor;

/** */
alias gdk_popup_present = c_gdk_popup_present;

// PopupLayout

/** */
alias gdk_popup_layout_get_type = c_gdk_popup_layout_get_type;

/** */
alias gdk_popup_layout_new = c_gdk_popup_layout_new;

/** */
alias gdk_popup_layout_copy = c_gdk_popup_layout_copy;

/** */
alias gdk_popup_layout_equal = c_gdk_popup_layout_equal;

/** */
alias gdk_popup_layout_get_anchor_hints = c_gdk_popup_layout_get_anchor_hints;

/** */
alias gdk_popup_layout_get_anchor_rect = c_gdk_popup_layout_get_anchor_rect;

/** */
alias gdk_popup_layout_get_offset = c_gdk_popup_layout_get_offset;

/** */
alias gdk_popup_layout_get_rect_anchor = c_gdk_popup_layout_get_rect_anchor;

/** */
alias gdk_popup_layout_get_shadow_width = c_gdk_popup_layout_get_shadow_width;

/** */
alias gdk_popup_layout_get_surface_anchor = c_gdk_popup_layout_get_surface_anchor;

/** */
alias gdk_popup_layout_ref = c_gdk_popup_layout_ref;

/** */
alias gdk_popup_layout_set_anchor_hints = c_gdk_popup_layout_set_anchor_hints;

/** */
alias gdk_popup_layout_set_anchor_rect = c_gdk_popup_layout_set_anchor_rect;

/** */
alias gdk_popup_layout_set_offset = c_gdk_popup_layout_set_offset;

/** */
alias gdk_popup_layout_set_rect_anchor = c_gdk_popup_layout_set_rect_anchor;

/** */
alias gdk_popup_layout_set_shadow_width = c_gdk_popup_layout_set_shadow_width;

/** */
alias gdk_popup_layout_set_surface_anchor = c_gdk_popup_layout_set_surface_anchor;

/** */
alias gdk_popup_layout_unref = c_gdk_popup_layout_unref;

// ProximityEvent

/** */
alias gdk_proximity_event_get_type = c_gdk_proximity_event_get_type;

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
alias gdk_rgba_is_clear = c_gdk_rgba_is_clear;

/** */
alias gdk_rgba_is_opaque = c_gdk_rgba_is_opaque;

/** */
alias gdk_rgba_parse = c_gdk_rgba_parse;

/** */
alias gdk_rgba_print = c_gdk_rgba_print;

/** */
alias gdk_rgba_to_string = c_gdk_rgba_to_string;

// Rectangle

/** */
alias gdk_rectangle_get_type = c_gdk_rectangle_get_type;

/** */
alias gdk_rectangle_contains_point = c_gdk_rectangle_contains_point;

/** */
alias gdk_rectangle_equal = c_gdk_rectangle_equal;

/** */
alias gdk_rectangle_intersect = c_gdk_rectangle_intersect;

/** */
alias gdk_rectangle_union = c_gdk_rectangle_union;

// ScrollEvent

/** */
alias gdk_scroll_event_get_type = c_gdk_scroll_event_get_type;

/** */
alias gdk_scroll_event_get_deltas = c_gdk_scroll_event_get_deltas;

/** */
alias gdk_scroll_event_get_direction = c_gdk_scroll_event_get_direction;

/** */
alias gdk_scroll_event_get_relative_direction = c_gdk_scroll_event_get_relative_direction;

/** */
alias gdk_scroll_event_get_unit = c_gdk_scroll_event_get_unit;

/** */
alias gdk_scroll_event_is_stop = c_gdk_scroll_event_is_stop;

// Seat

/** */
alias gdk_seat_get_type = c_gdk_seat_get_type;

/** */
alias gdk_seat_get_capabilities = c_gdk_seat_get_capabilities;

/** */
alias gdk_seat_get_devices = c_gdk_seat_get_devices;

/** */
alias gdk_seat_get_display = c_gdk_seat_get_display;

/** */
alias gdk_seat_get_keyboard = c_gdk_seat_get_keyboard;

/** */
alias gdk_seat_get_pointer = c_gdk_seat_get_pointer;

/** */
alias gdk_seat_get_tools = c_gdk_seat_get_tools;

// Snapshot

/** */
alias gdk_snapshot_get_type = c_gdk_snapshot_get_type;

// Surface

/** */
alias gdk_surface_get_type = c_gdk_surface_get_type;

/** */
alias gdk_surface_new_popup = c_gdk_surface_new_popup;

/** */
alias gdk_surface_new_toplevel = c_gdk_surface_new_toplevel;

/** */
alias gdk_surface_beep = c_gdk_surface_beep;

/** */
alias gdk_surface_create_cairo_context = c_gdk_surface_create_cairo_context;

/** */
alias gdk_surface_create_gl_context = c_gdk_surface_create_gl_context;

/** */
alias gdk_surface_create_similar_surface = c_gdk_surface_create_similar_surface;

/** */
alias gdk_surface_create_vulkan_context = c_gdk_surface_create_vulkan_context;

/** */
alias gdk_surface_destroy = c_gdk_surface_destroy;

/** */
alias gdk_surface_get_cursor = c_gdk_surface_get_cursor;

/** */
alias gdk_surface_get_device_cursor = c_gdk_surface_get_device_cursor;

/** */
alias gdk_surface_get_device_position = c_gdk_surface_get_device_position;

/** */
alias gdk_surface_get_display = c_gdk_surface_get_display;

/** */
alias gdk_surface_get_frame_clock = c_gdk_surface_get_frame_clock;

/** */
alias gdk_surface_get_height = c_gdk_surface_get_height;

/** */
alias gdk_surface_get_mapped = c_gdk_surface_get_mapped;

/** */
alias gdk_surface_get_scale = c_gdk_surface_get_scale;

/** */
alias gdk_surface_get_scale_factor = c_gdk_surface_get_scale_factor;

/** */
alias gdk_surface_get_width = c_gdk_surface_get_width;

/** */
alias gdk_surface_hide = c_gdk_surface_hide;

/** */
alias gdk_surface_is_destroyed = c_gdk_surface_is_destroyed;

/** */
alias gdk_surface_queue_render = c_gdk_surface_queue_render;

/** */
alias gdk_surface_request_layout = c_gdk_surface_request_layout;

/** */
alias gdk_surface_set_cursor = c_gdk_surface_set_cursor;

/** */
alias gdk_surface_set_device_cursor = c_gdk_surface_set_device_cursor;

/** */
alias gdk_surface_set_input_region = c_gdk_surface_set_input_region;

/** */
alias gdk_surface_set_opaque_region = c_gdk_surface_set_opaque_region;

/** */
alias gdk_surface_translate_coordinates = c_gdk_surface_translate_coordinates;

// Texture

/** */
alias gdk_texture_get_type = c_gdk_texture_get_type;

/** */
alias gdk_texture_new_for_pixbuf = c_gdk_texture_new_for_pixbuf;

/** */
alias gdk_texture_new_from_bytes = c_gdk_texture_new_from_bytes;

/** */
alias gdk_texture_new_from_file = c_gdk_texture_new_from_file;

/** */
alias gdk_texture_new_from_filename = c_gdk_texture_new_from_filename;

/** */
alias gdk_texture_new_from_resource = c_gdk_texture_new_from_resource;

/** */
alias gdk_texture_download = c_gdk_texture_download;

/** */
alias gdk_texture_get_color_state = c_gdk_texture_get_color_state;

/** */
alias gdk_texture_get_format = c_gdk_texture_get_format;

/** */
alias gdk_texture_get_height = c_gdk_texture_get_height;

/** */
alias gdk_texture_get_width = c_gdk_texture_get_width;

/** */
alias gdk_texture_save_to_png = c_gdk_texture_save_to_png;

/** */
alias gdk_texture_save_to_png_bytes = c_gdk_texture_save_to_png_bytes;

/** */
alias gdk_texture_save_to_tiff = c_gdk_texture_save_to_tiff;

/** */
alias gdk_texture_save_to_tiff_bytes = c_gdk_texture_save_to_tiff_bytes;

// TextureDownloader

/** */
alias gdk_texture_downloader_get_type = c_gdk_texture_downloader_get_type;

/** */
alias gdk_texture_downloader_new = c_gdk_texture_downloader_new;

/** */
alias gdk_texture_downloader_copy = c_gdk_texture_downloader_copy;

/** */
alias gdk_texture_downloader_download_bytes = c_gdk_texture_downloader_download_bytes;

/** */
alias gdk_texture_downloader_download_bytes_with_planes = c_gdk_texture_downloader_download_bytes_with_planes;

/** */
alias gdk_texture_downloader_download_into = c_gdk_texture_downloader_download_into;

/** */
alias gdk_texture_downloader_free = c_gdk_texture_downloader_free;

/** */
alias gdk_texture_downloader_get_color_state = c_gdk_texture_downloader_get_color_state;

/** */
alias gdk_texture_downloader_get_format = c_gdk_texture_downloader_get_format;

/** */
alias gdk_texture_downloader_get_texture = c_gdk_texture_downloader_get_texture;

/** */
alias gdk_texture_downloader_set_color_state = c_gdk_texture_downloader_set_color_state;

/** */
alias gdk_texture_downloader_set_format = c_gdk_texture_downloader_set_format;

/** */
alias gdk_texture_downloader_set_texture = c_gdk_texture_downloader_set_texture;

// Toplevel

/** */
alias gdk_toplevel_get_type = c_gdk_toplevel_get_type;

/** */
alias gdk_toplevel_begin_move = c_gdk_toplevel_begin_move;

/** */
alias gdk_toplevel_begin_resize = c_gdk_toplevel_begin_resize;

/** */
alias gdk_toplevel_focus = c_gdk_toplevel_focus;

/** */
alias gdk_toplevel_get_capabilities = c_gdk_toplevel_get_capabilities;

/** */
alias gdk_toplevel_get_gravity = c_gdk_toplevel_get_gravity;

/** */
alias gdk_toplevel_get_state = c_gdk_toplevel_get_state;

/** */
alias gdk_toplevel_inhibit_system_shortcuts = c_gdk_toplevel_inhibit_system_shortcuts;

/** */
alias gdk_toplevel_lower = c_gdk_toplevel_lower;

/** */
alias gdk_toplevel_minimize = c_gdk_toplevel_minimize;

/** */
alias gdk_toplevel_present = c_gdk_toplevel_present;

/** */
alias gdk_toplevel_restore_system_shortcuts = c_gdk_toplevel_restore_system_shortcuts;

/** */
alias gdk_toplevel_set_decorated = c_gdk_toplevel_set_decorated;

/** */
alias gdk_toplevel_set_deletable = c_gdk_toplevel_set_deletable;

/** */
alias gdk_toplevel_set_gravity = c_gdk_toplevel_set_gravity;

/** */
alias gdk_toplevel_set_icon_list = c_gdk_toplevel_set_icon_list;

/** */
alias gdk_toplevel_set_modal = c_gdk_toplevel_set_modal;

/** */
alias gdk_toplevel_set_startup_id = c_gdk_toplevel_set_startup_id;

/** */
alias gdk_toplevel_set_title = c_gdk_toplevel_set_title;

/** */
alias gdk_toplevel_set_transient_for = c_gdk_toplevel_set_transient_for;

/** */
alias gdk_toplevel_show_window_menu = c_gdk_toplevel_show_window_menu;

/** */
alias gdk_toplevel_supports_edge_constraints = c_gdk_toplevel_supports_edge_constraints;

/** */
alias gdk_toplevel_titlebar_gesture = c_gdk_toplevel_titlebar_gesture;

// ToplevelLayout

/** */
alias gdk_toplevel_layout_get_type = c_gdk_toplevel_layout_get_type;

/** */
alias gdk_toplevel_layout_new = c_gdk_toplevel_layout_new;

/** */
alias gdk_toplevel_layout_copy = c_gdk_toplevel_layout_copy;

/** */
alias gdk_toplevel_layout_equal = c_gdk_toplevel_layout_equal;

/** */
alias gdk_toplevel_layout_get_fullscreen = c_gdk_toplevel_layout_get_fullscreen;

/** */
alias gdk_toplevel_layout_get_fullscreen_monitor = c_gdk_toplevel_layout_get_fullscreen_monitor;

/** */
alias gdk_toplevel_layout_get_maximized = c_gdk_toplevel_layout_get_maximized;

/** */
alias gdk_toplevel_layout_get_resizable = c_gdk_toplevel_layout_get_resizable;

/** */
alias gdk_toplevel_layout_ref = c_gdk_toplevel_layout_ref;

/** */
alias gdk_toplevel_layout_set_fullscreen = c_gdk_toplevel_layout_set_fullscreen;

/** */
alias gdk_toplevel_layout_set_maximized = c_gdk_toplevel_layout_set_maximized;

/** */
alias gdk_toplevel_layout_set_resizable = c_gdk_toplevel_layout_set_resizable;

/** */
alias gdk_toplevel_layout_unref = c_gdk_toplevel_layout_unref;

// ToplevelSize

/** */
alias gdk_toplevel_size_get_type = c_gdk_toplevel_size_get_type;

/** */
alias gdk_toplevel_size_get_bounds = c_gdk_toplevel_size_get_bounds;

/** */
alias gdk_toplevel_size_set_min_size = c_gdk_toplevel_size_set_min_size;

/** */
alias gdk_toplevel_size_set_shadow_width = c_gdk_toplevel_size_set_shadow_width;

/** */
alias gdk_toplevel_size_set_size = c_gdk_toplevel_size_set_size;

// TouchEvent

/** */
alias gdk_touch_event_get_type = c_gdk_touch_event_get_type;

/** */
alias gdk_touch_event_get_emulating_pointer = c_gdk_touch_event_get_emulating_pointer;

// TouchpadEvent

/** */
alias gdk_touchpad_event_get_type = c_gdk_touchpad_event_get_type;

/** */
alias gdk_touchpad_event_get_deltas = c_gdk_touchpad_event_get_deltas;

/** */
alias gdk_touchpad_event_get_gesture_phase = c_gdk_touchpad_event_get_gesture_phase;

/** */
alias gdk_touchpad_event_get_n_fingers = c_gdk_touchpad_event_get_n_fingers;

/** */
alias gdk_touchpad_event_get_pinch_angle_delta = c_gdk_touchpad_event_get_pinch_angle_delta;

/** */
alias gdk_touchpad_event_get_pinch_scale = c_gdk_touchpad_event_get_pinch_scale;

// VulkanContext

/** */
alias gdk_vulkan_context_get_type = c_gdk_vulkan_context_get_type;

// global

/** */
alias gdk_cairo_draw_from_gl = c_gdk_cairo_draw_from_gl;

/** */
alias gdk_cairo_rectangle = c_gdk_cairo_rectangle;

/** */
alias gdk_cairo_region = c_gdk_cairo_region;

/** */
alias gdk_cairo_region_create_from_surface = c_gdk_cairo_region_create_from_surface;

/** */
alias gdk_cairo_set_source_pixbuf = c_gdk_cairo_set_source_pixbuf;

/** */
alias gdk_cairo_set_source_rgba = c_gdk_cairo_set_source_rgba;

/** */
alias gdk_content_deserialize_async = c_gdk_content_deserialize_async;

/** */
alias gdk_content_deserialize_finish = c_gdk_content_deserialize_finish;

/** */
alias gdk_content_register_deserializer = c_gdk_content_register_deserializer;

/** */
alias gdk_content_register_serializer = c_gdk_content_register_serializer;

/** */
alias gdk_content_serialize_async = c_gdk_content_serialize_async;

/** */
alias gdk_content_serialize_finish = c_gdk_content_serialize_finish;

/** */
alias gdk_events_get_angle = c_gdk_events_get_angle;

/** */
alias gdk_events_get_center = c_gdk_events_get_center;

/** */
alias gdk_events_get_distance = c_gdk_events_get_distance;

/** */
alias gdk_intern_mime_type = c_gdk_intern_mime_type;

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
alias gdk_pango_layout_get_clip_region = c_gdk_pango_layout_get_clip_region;

/** */
alias gdk_pango_layout_line_get_clip_region = c_gdk_pango_layout_line_get_clip_region;

/** */
alias gdk_pixbuf_get_from_surface = c_gdk_pixbuf_get_from_surface;

/** */
alias gdk_pixbuf_get_from_texture = c_gdk_pixbuf_get_from_texture;

/** */
alias gdk_set_allowed_backends = c_gdk_set_allowed_backends;

/** */
alias gdk_unicode_to_keyval = c_gdk_unicode_to_keyval;

// DmabufError

/** */
alias gdk_dmabuf_error_quark = c_gdk_dmabuf_error_quark;

// DragAction

/** */
alias gdk_drag_action_is_unique = c_gdk_drag_action_is_unique;

// GLError

/** */
alias gdk_gl_error_quark = c_gdk_gl_error_quark;

// TextureError

/** */
alias gdk_texture_error_quark = c_gdk_texture_error_quark;

// VulkanError

/** */
alias gdk_vulkan_error_quark = c_gdk_vulkan_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gdk4", "Gdk");

  // AppLaunchContext
  gidLink(cast(void**)&gdk_app_launch_context_get_type, "gdk_app_launch_context_get_type", libs);
  gidLink(cast(void**)&gdk_app_launch_context_get_display, "gdk_app_launch_context_get_display", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_desktop, "gdk_app_launch_context_set_desktop", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_icon, "gdk_app_launch_context_set_icon", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_icon_name, "gdk_app_launch_context_set_icon_name", libs);
  gidLink(cast(void**)&gdk_app_launch_context_set_timestamp, "gdk_app_launch_context_set_timestamp", libs);

  // ButtonEvent
  gidLink(cast(void**)&gdk_button_event_get_type, "gdk_button_event_get_type", libs);
  gidLink(cast(void**)&gdk_button_event_get_button, "gdk_button_event_get_button", libs);

  // CairoContext
  gidLink(cast(void**)&gdk_cairo_context_get_type, "gdk_cairo_context_get_type", libs);
  gidLink(cast(void**)&gdk_cairo_context_cairo_create, "gdk_cairo_context_cairo_create", libs);

  // CicpParams
  gidLink(cast(void**)&gdk_cicp_params_get_type, "gdk_cicp_params_get_type", libs);
  gidLink(cast(void**)&gdk_cicp_params_new, "gdk_cicp_params_new", libs);
  gidLink(cast(void**)&gdk_cicp_params_build_color_state, "gdk_cicp_params_build_color_state", libs);
  gidLink(cast(void**)&gdk_cicp_params_get_color_primaries, "gdk_cicp_params_get_color_primaries", libs);
  gidLink(cast(void**)&gdk_cicp_params_get_matrix_coefficients, "gdk_cicp_params_get_matrix_coefficients", libs);
  gidLink(cast(void**)&gdk_cicp_params_get_range, "gdk_cicp_params_get_range", libs);
  gidLink(cast(void**)&gdk_cicp_params_get_transfer_function, "gdk_cicp_params_get_transfer_function", libs);
  gidLink(cast(void**)&gdk_cicp_params_set_color_primaries, "gdk_cicp_params_set_color_primaries", libs);
  gidLink(cast(void**)&gdk_cicp_params_set_matrix_coefficients, "gdk_cicp_params_set_matrix_coefficients", libs);
  gidLink(cast(void**)&gdk_cicp_params_set_range, "gdk_cicp_params_set_range", libs);
  gidLink(cast(void**)&gdk_cicp_params_set_transfer_function, "gdk_cicp_params_set_transfer_function", libs);

  // Clipboard
  gidLink(cast(void**)&gdk_clipboard_get_type, "gdk_clipboard_get_type", libs);
  gidLink(cast(void**)&gdk_clipboard_get_content, "gdk_clipboard_get_content", libs);
  gidLink(cast(void**)&gdk_clipboard_get_display, "gdk_clipboard_get_display", libs);
  gidLink(cast(void**)&gdk_clipboard_get_formats, "gdk_clipboard_get_formats", libs);
  gidLink(cast(void**)&gdk_clipboard_is_local, "gdk_clipboard_is_local", libs);
  gidLink(cast(void**)&gdk_clipboard_read_async, "gdk_clipboard_read_async", libs);
  gidLink(cast(void**)&gdk_clipboard_read_finish, "gdk_clipboard_read_finish", libs);
  gidLink(cast(void**)&gdk_clipboard_read_text_async, "gdk_clipboard_read_text_async", libs);
  gidLink(cast(void**)&gdk_clipboard_read_text_finish, "gdk_clipboard_read_text_finish", libs);
  gidLink(cast(void**)&gdk_clipboard_read_texture_async, "gdk_clipboard_read_texture_async", libs);
  gidLink(cast(void**)&gdk_clipboard_read_texture_finish, "gdk_clipboard_read_texture_finish", libs);
  gidLink(cast(void**)&gdk_clipboard_read_value_async, "gdk_clipboard_read_value_async", libs);
  gidLink(cast(void**)&gdk_clipboard_read_value_finish, "gdk_clipboard_read_value_finish", libs);
  gidLink(cast(void**)&gdk_clipboard_set, "gdk_clipboard_set", libs);
  gidLink(cast(void**)&gdk_clipboard_set_content, "gdk_clipboard_set_content", libs);
  gidLink(cast(void**)&gdk_clipboard_set_text, "gdk_clipboard_set_text", libs);
  gidLink(cast(void**)&gdk_clipboard_set_texture, "gdk_clipboard_set_texture", libs);
  gidLink(cast(void**)&gdk_clipboard_set_valist, "gdk_clipboard_set_valist", libs);
  gidLink(cast(void**)&gdk_clipboard_set_value, "gdk_clipboard_set_value", libs);
  gidLink(cast(void**)&gdk_clipboard_store_async, "gdk_clipboard_store_async", libs);
  gidLink(cast(void**)&gdk_clipboard_store_finish, "gdk_clipboard_store_finish", libs);

  // ColorState
  gidLink(cast(void**)&gdk_color_state_get_type, "gdk_color_state_get_type", libs);
  gidLink(cast(void**)&gdk_color_state_create_cicp_params, "gdk_color_state_create_cicp_params", libs);
  gidLink(cast(void**)&gdk_color_state_equal, "gdk_color_state_equal", libs);
  gidLink(cast(void**)&gdk_color_state_equivalent, "gdk_color_state_equivalent", libs);
  gidLink(cast(void**)&gdk_color_state_ref, "gdk_color_state_ref", libs);
  gidLink(cast(void**)&gdk_color_state_unref, "gdk_color_state_unref", libs);
  gidLink(cast(void**)&gdk_color_state_get_oklab, "gdk_color_state_get_oklab", libs);
  gidLink(cast(void**)&gdk_color_state_get_oklch, "gdk_color_state_get_oklch", libs);
  gidLink(cast(void**)&gdk_color_state_get_rec2100_linear, "gdk_color_state_get_rec2100_linear", libs);
  gidLink(cast(void**)&gdk_color_state_get_rec2100_pq, "gdk_color_state_get_rec2100_pq", libs);
  gidLink(cast(void**)&gdk_color_state_get_srgb, "gdk_color_state_get_srgb", libs);
  gidLink(cast(void**)&gdk_color_state_get_srgb_linear, "gdk_color_state_get_srgb_linear", libs);

  // ContentDeserializer
  gidLink(cast(void**)&gdk_content_deserializer_get_type, "gdk_content_deserializer_get_type", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_cancellable, "gdk_content_deserializer_get_cancellable", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_gtype, "gdk_content_deserializer_get_gtype", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_input_stream, "gdk_content_deserializer_get_input_stream", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_mime_type, "gdk_content_deserializer_get_mime_type", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_priority, "gdk_content_deserializer_get_priority", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_task_data, "gdk_content_deserializer_get_task_data", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_user_data, "gdk_content_deserializer_get_user_data", libs);
  gidLink(cast(void**)&gdk_content_deserializer_get_value, "gdk_content_deserializer_get_value", libs);
  gidLink(cast(void**)&gdk_content_deserializer_return_error, "gdk_content_deserializer_return_error", libs);
  gidLink(cast(void**)&gdk_content_deserializer_return_success, "gdk_content_deserializer_return_success", libs);
  gidLink(cast(void**)&gdk_content_deserializer_set_task_data, "gdk_content_deserializer_set_task_data", libs);

  // ContentFormats
  gidLink(cast(void**)&gdk_content_formats_get_type, "gdk_content_formats_get_type", libs);
  gidLink(cast(void**)&gdk_content_formats_new, "gdk_content_formats_new", libs);
  gidLink(cast(void**)&gdk_content_formats_new_for_gtype, "gdk_content_formats_new_for_gtype", libs);
  gidLink(cast(void**)&gdk_content_formats_contain_gtype, "gdk_content_formats_contain_gtype", libs);
  gidLink(cast(void**)&gdk_content_formats_contain_mime_type, "gdk_content_formats_contain_mime_type", libs);
  gidLink(cast(void**)&gdk_content_formats_get_gtypes, "gdk_content_formats_get_gtypes", libs);
  gidLink(cast(void**)&gdk_content_formats_get_mime_types, "gdk_content_formats_get_mime_types", libs);
  gidLink(cast(void**)&gdk_content_formats_is_empty, "gdk_content_formats_is_empty", libs);
  gidLink(cast(void**)&gdk_content_formats_match, "gdk_content_formats_match", libs);
  gidLink(cast(void**)&gdk_content_formats_match_gtype, "gdk_content_formats_match_gtype", libs);
  gidLink(cast(void**)&gdk_content_formats_match_mime_type, "gdk_content_formats_match_mime_type", libs);
  gidLink(cast(void**)&gdk_content_formats_print, "gdk_content_formats_print", libs);
  gidLink(cast(void**)&gdk_content_formats_ref, "gdk_content_formats_ref", libs);
  gidLink(cast(void**)&gdk_content_formats_to_string, "gdk_content_formats_to_string", libs);
  gidLink(cast(void**)&gdk_content_formats_union, "gdk_content_formats_union", libs);
  gidLink(cast(void**)&gdk_content_formats_union_deserialize_gtypes, "gdk_content_formats_union_deserialize_gtypes", libs);
  gidLink(cast(void**)&gdk_content_formats_union_deserialize_mime_types, "gdk_content_formats_union_deserialize_mime_types", libs);
  gidLink(cast(void**)&gdk_content_formats_union_serialize_gtypes, "gdk_content_formats_union_serialize_gtypes", libs);
  gidLink(cast(void**)&gdk_content_formats_union_serialize_mime_types, "gdk_content_formats_union_serialize_mime_types", libs);
  gidLink(cast(void**)&gdk_content_formats_unref, "gdk_content_formats_unref", libs);
  gidLink(cast(void**)&gdk_content_formats_parse, "gdk_content_formats_parse", libs);

  // ContentFormatsBuilder
  gidLink(cast(void**)&gdk_content_formats_builder_get_type, "gdk_content_formats_builder_get_type", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_new, "gdk_content_formats_builder_new", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_add_formats, "gdk_content_formats_builder_add_formats", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_add_gtype, "gdk_content_formats_builder_add_gtype", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_add_mime_type, "gdk_content_formats_builder_add_mime_type", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_free_to_formats, "gdk_content_formats_builder_free_to_formats", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_ref, "gdk_content_formats_builder_ref", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_to_formats, "gdk_content_formats_builder_to_formats", libs);
  gidLink(cast(void**)&gdk_content_formats_builder_unref, "gdk_content_formats_builder_unref", libs);

  // ContentProvider
  gidLink(cast(void**)&gdk_content_provider_get_type, "gdk_content_provider_get_type", libs);
  gidLink(cast(void**)&gdk_content_provider_new_for_bytes, "gdk_content_provider_new_for_bytes", libs);
  gidLink(cast(void**)&gdk_content_provider_new_for_value, "gdk_content_provider_new_for_value", libs);
  gidLink(cast(void**)&gdk_content_provider_new_typed, "gdk_content_provider_new_typed", libs);
  gidLink(cast(void**)&gdk_content_provider_new_union, "gdk_content_provider_new_union", libs);
  gidLink(cast(void**)&gdk_content_provider_content_changed, "gdk_content_provider_content_changed", libs);
  gidLink(cast(void**)&gdk_content_provider_get_value, "gdk_content_provider_get_value", libs);
  gidLink(cast(void**)&gdk_content_provider_ref_formats, "gdk_content_provider_ref_formats", libs);
  gidLink(cast(void**)&gdk_content_provider_ref_storable_formats, "gdk_content_provider_ref_storable_formats", libs);
  gidLink(cast(void**)&gdk_content_provider_write_mime_type_async, "gdk_content_provider_write_mime_type_async", libs);
  gidLink(cast(void**)&gdk_content_provider_write_mime_type_finish, "gdk_content_provider_write_mime_type_finish", libs);

  // ContentSerializer
  gidLink(cast(void**)&gdk_content_serializer_get_type, "gdk_content_serializer_get_type", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_cancellable, "gdk_content_serializer_get_cancellable", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_gtype, "gdk_content_serializer_get_gtype", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_mime_type, "gdk_content_serializer_get_mime_type", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_output_stream, "gdk_content_serializer_get_output_stream", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_priority, "gdk_content_serializer_get_priority", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_task_data, "gdk_content_serializer_get_task_data", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_user_data, "gdk_content_serializer_get_user_data", libs);
  gidLink(cast(void**)&gdk_content_serializer_get_value, "gdk_content_serializer_get_value", libs);
  gidLink(cast(void**)&gdk_content_serializer_return_error, "gdk_content_serializer_return_error", libs);
  gidLink(cast(void**)&gdk_content_serializer_return_success, "gdk_content_serializer_return_success", libs);
  gidLink(cast(void**)&gdk_content_serializer_set_task_data, "gdk_content_serializer_set_task_data", libs);

  // CrossingEvent
  gidLink(cast(void**)&gdk_crossing_event_get_type, "gdk_crossing_event_get_type", libs);
  gidLink(cast(void**)&gdk_crossing_event_get_detail, "gdk_crossing_event_get_detail", libs);
  gidLink(cast(void**)&gdk_crossing_event_get_focus, "gdk_crossing_event_get_focus", libs);
  gidLink(cast(void**)&gdk_crossing_event_get_mode, "gdk_crossing_event_get_mode", libs);

  // Cursor
  gidLink(cast(void**)&gdk_cursor_get_type, "gdk_cursor_get_type", libs);
  gidLink(cast(void**)&gdk_cursor_new_from_callback, "gdk_cursor_new_from_callback", libs);
  gidLink(cast(void**)&gdk_cursor_new_from_name, "gdk_cursor_new_from_name", libs);
  gidLink(cast(void**)&gdk_cursor_new_from_texture, "gdk_cursor_new_from_texture", libs);
  gidLink(cast(void**)&gdk_cursor_get_fallback, "gdk_cursor_get_fallback", libs);
  gidLink(cast(void**)&gdk_cursor_get_hotspot_x, "gdk_cursor_get_hotspot_x", libs);
  gidLink(cast(void**)&gdk_cursor_get_hotspot_y, "gdk_cursor_get_hotspot_y", libs);
  gidLink(cast(void**)&gdk_cursor_get_name, "gdk_cursor_get_name", libs);
  gidLink(cast(void**)&gdk_cursor_get_texture, "gdk_cursor_get_texture", libs);

  // DNDEvent
  gidLink(cast(void**)&gdk_dnd_event_get_type, "gdk_dnd_event_get_type", libs);
  gidLink(cast(void**)&gdk_dnd_event_get_drop, "gdk_dnd_event_get_drop", libs);

  // DeleteEvent
  gidLink(cast(void**)&gdk_delete_event_get_type, "gdk_delete_event_get_type", libs);

  // Device
  gidLink(cast(void**)&gdk_device_get_type, "gdk_device_get_type", libs);
  gidLink(cast(void**)&gdk_device_get_active_layout_index, "gdk_device_get_active_layout_index", libs);
  gidLink(cast(void**)&gdk_device_get_caps_lock_state, "gdk_device_get_caps_lock_state", libs);
  gidLink(cast(void**)&gdk_device_get_device_tool, "gdk_device_get_device_tool", libs);
  gidLink(cast(void**)&gdk_device_get_direction, "gdk_device_get_direction", libs);
  gidLink(cast(void**)&gdk_device_get_display, "gdk_device_get_display", libs);
  gidLink(cast(void**)&gdk_device_get_has_cursor, "gdk_device_get_has_cursor", libs);
  gidLink(cast(void**)&gdk_device_get_layout_names, "gdk_device_get_layout_names", libs);
  gidLink(cast(void**)&gdk_device_get_modifier_state, "gdk_device_get_modifier_state", libs);
  gidLink(cast(void**)&gdk_device_get_name, "gdk_device_get_name", libs);
  gidLink(cast(void**)&gdk_device_get_num_lock_state, "gdk_device_get_num_lock_state", libs);
  gidLink(cast(void**)&gdk_device_get_num_touches, "gdk_device_get_num_touches", libs);
  gidLink(cast(void**)&gdk_device_get_product_id, "gdk_device_get_product_id", libs);
  gidLink(cast(void**)&gdk_device_get_scroll_lock_state, "gdk_device_get_scroll_lock_state", libs);
  gidLink(cast(void**)&gdk_device_get_seat, "gdk_device_get_seat", libs);
  gidLink(cast(void**)&gdk_device_get_source, "gdk_device_get_source", libs);
  gidLink(cast(void**)&gdk_device_get_surface_at_position, "gdk_device_get_surface_at_position", libs);
  gidLink(cast(void**)&gdk_device_get_timestamp, "gdk_device_get_timestamp", libs);
  gidLink(cast(void**)&gdk_device_get_vendor_id, "gdk_device_get_vendor_id", libs);
  gidLink(cast(void**)&gdk_device_has_bidi_layouts, "gdk_device_has_bidi_layouts", libs);

  // DevicePad
  gidLink(cast(void**)&gdk_device_pad_get_type, "gdk_device_pad_get_type", libs);
  gidLink(cast(void**)&gdk_device_pad_get_feature_group, "gdk_device_pad_get_feature_group", libs);
  gidLink(cast(void**)&gdk_device_pad_get_group_n_modes, "gdk_device_pad_get_group_n_modes", libs);
  gidLink(cast(void**)&gdk_device_pad_get_n_features, "gdk_device_pad_get_n_features", libs);
  gidLink(cast(void**)&gdk_device_pad_get_n_groups, "gdk_device_pad_get_n_groups", libs);

  // DeviceTool
  gidLink(cast(void**)&gdk_device_tool_get_type, "gdk_device_tool_get_type", libs);
  gidLink(cast(void**)&gdk_device_tool_get_axes, "gdk_device_tool_get_axes", libs);
  gidLink(cast(void**)&gdk_device_tool_get_hardware_id, "gdk_device_tool_get_hardware_id", libs);
  gidLink(cast(void**)&gdk_device_tool_get_serial, "gdk_device_tool_get_serial", libs);
  gidLink(cast(void**)&gdk_device_tool_get_tool_type, "gdk_device_tool_get_tool_type", libs);

  // Display
  gidLink(cast(void**)&gdk_display_get_type, "gdk_display_get_type", libs);
  gidLink(cast(void**)&gdk_display_get_default, "gdk_display_get_default", libs);
  gidLink(cast(void**)&gdk_display_open, "gdk_display_open", libs);
  gidLink(cast(void**)&gdk_display_beep, "gdk_display_beep", libs);
  gidLink(cast(void**)&gdk_display_close, "gdk_display_close", libs);
  gidLink(cast(void**)&gdk_display_create_gl_context, "gdk_display_create_gl_context", libs);
  gidLink(cast(void**)&gdk_display_device_is_grabbed, "gdk_display_device_is_grabbed", libs);
  gidLink(cast(void**)&gdk_display_flush, "gdk_display_flush", libs);
  gidLink(cast(void**)&gdk_display_get_app_launch_context, "gdk_display_get_app_launch_context", libs);
  gidLink(cast(void**)&gdk_display_get_clipboard, "gdk_display_get_clipboard", libs);
  gidLink(cast(void**)&gdk_display_get_default_seat, "gdk_display_get_default_seat", libs);
  gidLink(cast(void**)&gdk_display_get_dmabuf_formats, "gdk_display_get_dmabuf_formats", libs);
  gidLink(cast(void**)&gdk_display_get_monitor_at_surface, "gdk_display_get_monitor_at_surface", libs);
  gidLink(cast(void**)&gdk_display_get_monitors, "gdk_display_get_monitors", libs);
  gidLink(cast(void**)&gdk_display_get_name, "gdk_display_get_name", libs);
  gidLink(cast(void**)&gdk_display_get_primary_clipboard, "gdk_display_get_primary_clipboard", libs);
  gidLink(cast(void**)&gdk_display_get_setting, "gdk_display_get_setting", libs);
  gidLink(cast(void**)&gdk_display_get_startup_notification_id, "gdk_display_get_startup_notification_id", libs);
  gidLink(cast(void**)&gdk_display_is_closed, "gdk_display_is_closed", libs);
  gidLink(cast(void**)&gdk_display_is_composited, "gdk_display_is_composited", libs);
  gidLink(cast(void**)&gdk_display_is_rgba, "gdk_display_is_rgba", libs);
  gidLink(cast(void**)&gdk_display_list_seats, "gdk_display_list_seats", libs);
  gidLink(cast(void**)&gdk_display_map_keycode, "gdk_display_map_keycode", libs);
  gidLink(cast(void**)&gdk_display_map_keyval, "gdk_display_map_keyval", libs);
  gidLink(cast(void**)&gdk_display_notify_startup_complete, "gdk_display_notify_startup_complete", libs);
  gidLink(cast(void**)&gdk_display_prepare_gl, "gdk_display_prepare_gl", libs);
  gidLink(cast(void**)&gdk_display_put_event, "gdk_display_put_event", libs);
  gidLink(cast(void**)&gdk_display_supports_input_shapes, "gdk_display_supports_input_shapes", libs);
  gidLink(cast(void**)&gdk_display_supports_shadow_width, "gdk_display_supports_shadow_width", libs);
  gidLink(cast(void**)&gdk_display_sync, "gdk_display_sync", libs);
  gidLink(cast(void**)&gdk_display_translate_key, "gdk_display_translate_key", libs);

  // DisplayManager
  gidLink(cast(void**)&gdk_display_manager_get_type, "gdk_display_manager_get_type", libs);
  gidLink(cast(void**)&gdk_display_manager_get, "gdk_display_manager_get", libs);
  gidLink(cast(void**)&gdk_display_manager_get_default_display, "gdk_display_manager_get_default_display", libs);
  gidLink(cast(void**)&gdk_display_manager_list_displays, "gdk_display_manager_list_displays", libs);
  gidLink(cast(void**)&gdk_display_manager_open_display, "gdk_display_manager_open_display", libs);
  gidLink(cast(void**)&gdk_display_manager_set_default_display, "gdk_display_manager_set_default_display", libs);

  // DmabufFormats
  gidLink(cast(void**)&gdk_dmabuf_formats_get_type, "gdk_dmabuf_formats_get_type", libs);
  gidLink(cast(void**)&gdk_dmabuf_formats_contains, "gdk_dmabuf_formats_contains", libs);
  gidLink(cast(void**)&gdk_dmabuf_formats_equal, "gdk_dmabuf_formats_equal", libs);
  gidLink(cast(void**)&gdk_dmabuf_formats_get_format, "gdk_dmabuf_formats_get_format", libs);
  gidLink(cast(void**)&gdk_dmabuf_formats_get_n_formats, "gdk_dmabuf_formats_get_n_formats", libs);
  gidLink(cast(void**)&gdk_dmabuf_formats_ref, "gdk_dmabuf_formats_ref", libs);
  gidLink(cast(void**)&gdk_dmabuf_formats_unref, "gdk_dmabuf_formats_unref", libs);

  // DmabufTexture
  gidLink(cast(void**)&gdk_dmabuf_texture_get_type, "gdk_dmabuf_texture_get_type", libs);

  // DmabufTextureBuilder
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_type, "gdk_dmabuf_texture_builder_get_type", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_new, "gdk_dmabuf_texture_builder_new", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_build, "gdk_dmabuf_texture_builder_build", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_color_state, "gdk_dmabuf_texture_builder_get_color_state", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_display, "gdk_dmabuf_texture_builder_get_display", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_fd, "gdk_dmabuf_texture_builder_get_fd", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_fourcc, "gdk_dmabuf_texture_builder_get_fourcc", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_height, "gdk_dmabuf_texture_builder_get_height", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_modifier, "gdk_dmabuf_texture_builder_get_modifier", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_n_planes, "gdk_dmabuf_texture_builder_get_n_planes", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_offset, "gdk_dmabuf_texture_builder_get_offset", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_premultiplied, "gdk_dmabuf_texture_builder_get_premultiplied", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_stride, "gdk_dmabuf_texture_builder_get_stride", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_update_region, "gdk_dmabuf_texture_builder_get_update_region", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_update_texture, "gdk_dmabuf_texture_builder_get_update_texture", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_width, "gdk_dmabuf_texture_builder_get_width", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_color_state, "gdk_dmabuf_texture_builder_set_color_state", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_display, "gdk_dmabuf_texture_builder_set_display", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_fd, "gdk_dmabuf_texture_builder_set_fd", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_fourcc, "gdk_dmabuf_texture_builder_set_fourcc", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_height, "gdk_dmabuf_texture_builder_set_height", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_modifier, "gdk_dmabuf_texture_builder_set_modifier", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_n_planes, "gdk_dmabuf_texture_builder_set_n_planes", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_offset, "gdk_dmabuf_texture_builder_set_offset", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_premultiplied, "gdk_dmabuf_texture_builder_set_premultiplied", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_stride, "gdk_dmabuf_texture_builder_set_stride", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_update_region, "gdk_dmabuf_texture_builder_set_update_region", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_update_texture, "gdk_dmabuf_texture_builder_set_update_texture", libs);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_width, "gdk_dmabuf_texture_builder_set_width", libs);

  // Drag
  gidLink(cast(void**)&gdk_drag_get_type, "gdk_drag_get_type", libs);
  gidLink(cast(void**)&gdk_drag_begin, "gdk_drag_begin", libs);
  gidLink(cast(void**)&gdk_drag_drop_done, "gdk_drag_drop_done", libs);
  gidLink(cast(void**)&gdk_drag_get_actions, "gdk_drag_get_actions", libs);
  gidLink(cast(void**)&gdk_drag_get_content, "gdk_drag_get_content", libs);
  gidLink(cast(void**)&gdk_drag_get_device, "gdk_drag_get_device", libs);
  gidLink(cast(void**)&gdk_drag_get_display, "gdk_drag_get_display", libs);
  gidLink(cast(void**)&gdk_drag_get_drag_surface, "gdk_drag_get_drag_surface", libs);
  gidLink(cast(void**)&gdk_drag_get_formats, "gdk_drag_get_formats", libs);
  gidLink(cast(void**)&gdk_drag_get_selected_action, "gdk_drag_get_selected_action", libs);
  gidLink(cast(void**)&gdk_drag_get_surface, "gdk_drag_get_surface", libs);
  gidLink(cast(void**)&gdk_drag_set_hotspot, "gdk_drag_set_hotspot", libs);

  // DragSurface
  gidLink(cast(void**)&gdk_drag_surface_get_type, "gdk_drag_surface_get_type", libs);
  gidLink(cast(void**)&gdk_drag_surface_present, "gdk_drag_surface_present", libs);

  // DragSurfaceSize
  gidLink(cast(void**)&gdk_drag_surface_size_get_type, "gdk_drag_surface_size_get_type", libs);
  gidLink(cast(void**)&gdk_drag_surface_size_set_size, "gdk_drag_surface_size_set_size", libs);

  // DrawContext
  gidLink(cast(void**)&gdk_draw_context_get_type, "gdk_draw_context_get_type", libs);
  gidLink(cast(void**)&gdk_draw_context_begin_frame, "gdk_draw_context_begin_frame", libs);
  gidLink(cast(void**)&gdk_draw_context_end_frame, "gdk_draw_context_end_frame", libs);
  gidLink(cast(void**)&gdk_draw_context_get_display, "gdk_draw_context_get_display", libs);
  gidLink(cast(void**)&gdk_draw_context_get_frame_region, "gdk_draw_context_get_frame_region", libs);
  gidLink(cast(void**)&gdk_draw_context_get_surface, "gdk_draw_context_get_surface", libs);
  gidLink(cast(void**)&gdk_draw_context_is_in_frame, "gdk_draw_context_is_in_frame", libs);

  // Drop
  gidLink(cast(void**)&gdk_drop_get_type, "gdk_drop_get_type", libs);
  gidLink(cast(void**)&gdk_drop_finish, "gdk_drop_finish", libs);
  gidLink(cast(void**)&gdk_drop_get_actions, "gdk_drop_get_actions", libs);
  gidLink(cast(void**)&gdk_drop_get_device, "gdk_drop_get_device", libs);
  gidLink(cast(void**)&gdk_drop_get_display, "gdk_drop_get_display", libs);
  gidLink(cast(void**)&gdk_drop_get_drag, "gdk_drop_get_drag", libs);
  gidLink(cast(void**)&gdk_drop_get_formats, "gdk_drop_get_formats", libs);
  gidLink(cast(void**)&gdk_drop_get_surface, "gdk_drop_get_surface", libs);
  gidLink(cast(void**)&gdk_drop_read_async, "gdk_drop_read_async", libs);
  gidLink(cast(void**)&gdk_drop_read_finish, "gdk_drop_read_finish", libs);
  gidLink(cast(void**)&gdk_drop_read_value_async, "gdk_drop_read_value_async", libs);
  gidLink(cast(void**)&gdk_drop_read_value_finish, "gdk_drop_read_value_finish", libs);
  gidLink(cast(void**)&gdk_drop_status, "gdk_drop_status", libs);

  // Event
  gidLink(cast(void**)&gdk_event_get_type, "gdk_event_get_type", libs);
  gidLink(cast(void**)&gdk_event_get_axes, "gdk_event_get_axes", libs);
  gidLink(cast(void**)&gdk_event_get_axis, "gdk_event_get_axis", libs);
  gidLink(cast(void**)&gdk_event_get_device, "gdk_event_get_device", libs);
  gidLink(cast(void**)&gdk_event_get_device_tool, "gdk_event_get_device_tool", libs);
  gidLink(cast(void**)&gdk_event_get_display, "gdk_event_get_display", libs);
  gidLink(cast(void**)&gdk_event_get_event_sequence, "gdk_event_get_event_sequence", libs);
  gidLink(cast(void**)&gdk_event_get_event_type, "gdk_event_get_event_type", libs);
  gidLink(cast(void**)&gdk_event_get_history, "gdk_event_get_history", libs);
  gidLink(cast(void**)&gdk_event_get_modifier_state, "gdk_event_get_modifier_state", libs);
  gidLink(cast(void**)&gdk_event_get_pointer_emulated, "gdk_event_get_pointer_emulated", libs);
  gidLink(cast(void**)&gdk_event_get_position, "gdk_event_get_position", libs);
  gidLink(cast(void**)&gdk_event_get_seat, "gdk_event_get_seat", libs);
  gidLink(cast(void**)&gdk_event_get_surface, "gdk_event_get_surface", libs);
  gidLink(cast(void**)&gdk_event_get_time, "gdk_event_get_time", libs);
  gidLink(cast(void**)&gdk_event_ref, "gdk_event_ref", libs);
  gidLink(cast(void**)&gdk_event_triggers_context_menu, "gdk_event_triggers_context_menu", libs);
  gidLink(cast(void**)&gdk_event_unref, "gdk_event_unref", libs);

  // EventSequence
  gidLink(cast(void**)&gdk_event_sequence_get_type, "gdk_event_sequence_get_type", libs);

  // FileList
  gidLink(cast(void**)&gdk_file_list_get_type, "gdk_file_list_get_type", libs);
  gidLink(cast(void**)&gdk_file_list_new_from_array, "gdk_file_list_new_from_array", libs);
  gidLink(cast(void**)&gdk_file_list_new_from_list, "gdk_file_list_new_from_list", libs);
  gidLink(cast(void**)&gdk_file_list_get_files, "gdk_file_list_get_files", libs);

  // FocusEvent
  gidLink(cast(void**)&gdk_focus_event_get_type, "gdk_focus_event_get_type", libs);
  gidLink(cast(void**)&gdk_focus_event_get_in, "gdk_focus_event_get_in", libs);

  // FrameClock
  gidLink(cast(void**)&gdk_frame_clock_get_type, "gdk_frame_clock_get_type", libs);
  gidLink(cast(void**)&gdk_frame_clock_begin_updating, "gdk_frame_clock_begin_updating", libs);
  gidLink(cast(void**)&gdk_frame_clock_end_updating, "gdk_frame_clock_end_updating", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_current_timings, "gdk_frame_clock_get_current_timings", libs);
  gidLink(cast(void**)&gdk_frame_clock_get_fps, "gdk_frame_clock_get_fps", libs);
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
  gidLink(cast(void**)&gdk_gl_context_get_allowed_apis, "gdk_gl_context_get_allowed_apis", libs);
  gidLink(cast(void**)&gdk_gl_context_get_api, "gdk_gl_context_get_api", libs);
  gidLink(cast(void**)&gdk_gl_context_get_debug_enabled, "gdk_gl_context_get_debug_enabled", libs);
  gidLink(cast(void**)&gdk_gl_context_get_display, "gdk_gl_context_get_display", libs);
  gidLink(cast(void**)&gdk_gl_context_get_forward_compatible, "gdk_gl_context_get_forward_compatible", libs);
  gidLink(cast(void**)&gdk_gl_context_get_required_version, "gdk_gl_context_get_required_version", libs);
  gidLink(cast(void**)&gdk_gl_context_get_shared_context, "gdk_gl_context_get_shared_context", libs);
  gidLink(cast(void**)&gdk_gl_context_get_surface, "gdk_gl_context_get_surface", libs);
  gidLink(cast(void**)&gdk_gl_context_get_use_es, "gdk_gl_context_get_use_es", libs);
  gidLink(cast(void**)&gdk_gl_context_get_version, "gdk_gl_context_get_version", libs);
  gidLink(cast(void**)&gdk_gl_context_is_legacy, "gdk_gl_context_is_legacy", libs);
  gidLink(cast(void**)&gdk_gl_context_is_shared, "gdk_gl_context_is_shared", libs);
  gidLink(cast(void**)&gdk_gl_context_make_current, "gdk_gl_context_make_current", libs);
  gidLink(cast(void**)&gdk_gl_context_realize, "gdk_gl_context_realize", libs);
  gidLink(cast(void**)&gdk_gl_context_set_allowed_apis, "gdk_gl_context_set_allowed_apis", libs);
  gidLink(cast(void**)&gdk_gl_context_set_debug_enabled, "gdk_gl_context_set_debug_enabled", libs);
  gidLink(cast(void**)&gdk_gl_context_set_forward_compatible, "gdk_gl_context_set_forward_compatible", libs);
  gidLink(cast(void**)&gdk_gl_context_set_required_version, "gdk_gl_context_set_required_version", libs);
  gidLink(cast(void**)&gdk_gl_context_set_use_es, "gdk_gl_context_set_use_es", libs);

  // GLTexture
  gidLink(cast(void**)&gdk_gl_texture_get_type, "gdk_gl_texture_get_type", libs);
  gidLink(cast(void**)&gdk_gl_texture_new, "gdk_gl_texture_new", libs);
  gidLink(cast(void**)&gdk_gl_texture_release, "gdk_gl_texture_release", libs);

  // GLTextureBuilder
  gidLink(cast(void**)&gdk_gl_texture_builder_get_type, "gdk_gl_texture_builder_get_type", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_new, "gdk_gl_texture_builder_new", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_build, "gdk_gl_texture_builder_build", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_color_state, "gdk_gl_texture_builder_get_color_state", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_context, "gdk_gl_texture_builder_get_context", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_format, "gdk_gl_texture_builder_get_format", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_has_mipmap, "gdk_gl_texture_builder_get_has_mipmap", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_height, "gdk_gl_texture_builder_get_height", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_id, "gdk_gl_texture_builder_get_id", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_sync, "gdk_gl_texture_builder_get_sync", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_update_region, "gdk_gl_texture_builder_get_update_region", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_update_texture, "gdk_gl_texture_builder_get_update_texture", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_width, "gdk_gl_texture_builder_get_width", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_color_state, "gdk_gl_texture_builder_set_color_state", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_context, "gdk_gl_texture_builder_set_context", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_format, "gdk_gl_texture_builder_set_format", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_has_mipmap, "gdk_gl_texture_builder_set_has_mipmap", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_height, "gdk_gl_texture_builder_set_height", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_id, "gdk_gl_texture_builder_set_id", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_sync, "gdk_gl_texture_builder_set_sync", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_update_region, "gdk_gl_texture_builder_set_update_region", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_update_texture, "gdk_gl_texture_builder_set_update_texture", libs);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_width, "gdk_gl_texture_builder_set_width", libs);

  // GrabBrokenEvent
  gidLink(cast(void**)&gdk_grab_broken_event_get_type, "gdk_grab_broken_event_get_type", libs);
  gidLink(cast(void**)&gdk_grab_broken_event_get_grab_surface, "gdk_grab_broken_event_get_grab_surface", libs);
  gidLink(cast(void**)&gdk_grab_broken_event_get_implicit, "gdk_grab_broken_event_get_implicit", libs);

  // KeyEvent
  gidLink(cast(void**)&gdk_key_event_get_type, "gdk_key_event_get_type", libs);
  gidLink(cast(void**)&gdk_key_event_get_consumed_modifiers, "gdk_key_event_get_consumed_modifiers", libs);
  gidLink(cast(void**)&gdk_key_event_get_keycode, "gdk_key_event_get_keycode", libs);
  gidLink(cast(void**)&gdk_key_event_get_keyval, "gdk_key_event_get_keyval", libs);
  gidLink(cast(void**)&gdk_key_event_get_layout, "gdk_key_event_get_layout", libs);
  gidLink(cast(void**)&gdk_key_event_get_level, "gdk_key_event_get_level", libs);
  gidLink(cast(void**)&gdk_key_event_get_match, "gdk_key_event_get_match", libs);
  gidLink(cast(void**)&gdk_key_event_is_modifier, "gdk_key_event_is_modifier", libs);
  gidLink(cast(void**)&gdk_key_event_matches, "gdk_key_event_matches", libs);

  // MemoryTexture
  gidLink(cast(void**)&gdk_memory_texture_get_type, "gdk_memory_texture_get_type", libs);
  gidLink(cast(void**)&gdk_memory_texture_new, "gdk_memory_texture_new", libs);

  // MemoryTextureBuilder
  gidLink(cast(void**)&gdk_memory_texture_builder_get_type, "gdk_memory_texture_builder_get_type", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_new, "gdk_memory_texture_builder_new", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_build, "gdk_memory_texture_builder_build", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_bytes, "gdk_memory_texture_builder_get_bytes", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_color_state, "gdk_memory_texture_builder_get_color_state", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_format, "gdk_memory_texture_builder_get_format", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_height, "gdk_memory_texture_builder_get_height", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_offset, "gdk_memory_texture_builder_get_offset", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_stride, "gdk_memory_texture_builder_get_stride", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_stride_for_plane, "gdk_memory_texture_builder_get_stride_for_plane", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_update_region, "gdk_memory_texture_builder_get_update_region", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_update_texture, "gdk_memory_texture_builder_get_update_texture", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_get_width, "gdk_memory_texture_builder_get_width", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_bytes, "gdk_memory_texture_builder_set_bytes", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_color_state, "gdk_memory_texture_builder_set_color_state", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_format, "gdk_memory_texture_builder_set_format", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_height, "gdk_memory_texture_builder_set_height", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_offset, "gdk_memory_texture_builder_set_offset", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_stride, "gdk_memory_texture_builder_set_stride", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_stride_for_plane, "gdk_memory_texture_builder_set_stride_for_plane", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_update_region, "gdk_memory_texture_builder_set_update_region", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_update_texture, "gdk_memory_texture_builder_set_update_texture", libs);
  gidLink(cast(void**)&gdk_memory_texture_builder_set_width, "gdk_memory_texture_builder_set_width", libs);

  // MonitorWrap
  gidLink(cast(void**)&gdk_monitor_get_type, "gdk_monitor_get_type", libs);
  gidLink(cast(void**)&gdk_monitor_get_connector, "gdk_monitor_get_connector", libs);
  gidLink(cast(void**)&gdk_monitor_get_description, "gdk_monitor_get_description", libs);
  gidLink(cast(void**)&gdk_monitor_get_display, "gdk_monitor_get_display", libs);
  gidLink(cast(void**)&gdk_monitor_get_geometry, "gdk_monitor_get_geometry", libs);
  gidLink(cast(void**)&gdk_monitor_get_height_mm, "gdk_monitor_get_height_mm", libs);
  gidLink(cast(void**)&gdk_monitor_get_manufacturer, "gdk_monitor_get_manufacturer", libs);
  gidLink(cast(void**)&gdk_monitor_get_model, "gdk_monitor_get_model", libs);
  gidLink(cast(void**)&gdk_monitor_get_refresh_rate, "gdk_monitor_get_refresh_rate", libs);
  gidLink(cast(void**)&gdk_monitor_get_scale, "gdk_monitor_get_scale", libs);
  gidLink(cast(void**)&gdk_monitor_get_scale_factor, "gdk_monitor_get_scale_factor", libs);
  gidLink(cast(void**)&gdk_monitor_get_subpixel_layout, "gdk_monitor_get_subpixel_layout", libs);
  gidLink(cast(void**)&gdk_monitor_get_width_mm, "gdk_monitor_get_width_mm", libs);
  gidLink(cast(void**)&gdk_monitor_is_valid, "gdk_monitor_is_valid", libs);

  // MotionEvent
  gidLink(cast(void**)&gdk_motion_event_get_type, "gdk_motion_event_get_type", libs);

  // PadEvent
  gidLink(cast(void**)&gdk_pad_event_get_type, "gdk_pad_event_get_type", libs);
  gidLink(cast(void**)&gdk_pad_event_get_axis_value, "gdk_pad_event_get_axis_value", libs);
  gidLink(cast(void**)&gdk_pad_event_get_button, "gdk_pad_event_get_button", libs);
  gidLink(cast(void**)&gdk_pad_event_get_group_mode, "gdk_pad_event_get_group_mode", libs);

  // Paintable
  gidLink(cast(void**)&gdk_paintable_get_type, "gdk_paintable_get_type", libs);
  gidLink(cast(void**)&gdk_paintable_new_empty, "gdk_paintable_new_empty", libs);
  gidLink(cast(void**)&gdk_paintable_compute_concrete_size, "gdk_paintable_compute_concrete_size", libs);
  gidLink(cast(void**)&gdk_paintable_get_current_image, "gdk_paintable_get_current_image", libs);
  gidLink(cast(void**)&gdk_paintable_get_flags, "gdk_paintable_get_flags", libs);
  gidLink(cast(void**)&gdk_paintable_get_intrinsic_aspect_ratio, "gdk_paintable_get_intrinsic_aspect_ratio", libs);
  gidLink(cast(void**)&gdk_paintable_get_intrinsic_height, "gdk_paintable_get_intrinsic_height", libs);
  gidLink(cast(void**)&gdk_paintable_get_intrinsic_width, "gdk_paintable_get_intrinsic_width", libs);
  gidLink(cast(void**)&gdk_paintable_invalidate_contents, "gdk_paintable_invalidate_contents", libs);
  gidLink(cast(void**)&gdk_paintable_invalidate_size, "gdk_paintable_invalidate_size", libs);
  gidLink(cast(void**)&gdk_paintable_snapshot, "gdk_paintable_snapshot", libs);

  // Popup
  gidLink(cast(void**)&gdk_popup_get_type, "gdk_popup_get_type", libs);
  gidLink(cast(void**)&gdk_popup_get_autohide, "gdk_popup_get_autohide", libs);
  gidLink(cast(void**)&gdk_popup_get_parent, "gdk_popup_get_parent", libs);
  gidLink(cast(void**)&gdk_popup_get_position_x, "gdk_popup_get_position_x", libs);
  gidLink(cast(void**)&gdk_popup_get_position_y, "gdk_popup_get_position_y", libs);
  gidLink(cast(void**)&gdk_popup_get_rect_anchor, "gdk_popup_get_rect_anchor", libs);
  gidLink(cast(void**)&gdk_popup_get_surface_anchor, "gdk_popup_get_surface_anchor", libs);
  gidLink(cast(void**)&gdk_popup_present, "gdk_popup_present", libs);

  // PopupLayout
  gidLink(cast(void**)&gdk_popup_layout_get_type, "gdk_popup_layout_get_type", libs);
  gidLink(cast(void**)&gdk_popup_layout_new, "gdk_popup_layout_new", libs);
  gidLink(cast(void**)&gdk_popup_layout_copy, "gdk_popup_layout_copy", libs);
  gidLink(cast(void**)&gdk_popup_layout_equal, "gdk_popup_layout_equal", libs);
  gidLink(cast(void**)&gdk_popup_layout_get_anchor_hints, "gdk_popup_layout_get_anchor_hints", libs);
  gidLink(cast(void**)&gdk_popup_layout_get_anchor_rect, "gdk_popup_layout_get_anchor_rect", libs);
  gidLink(cast(void**)&gdk_popup_layout_get_offset, "gdk_popup_layout_get_offset", libs);
  gidLink(cast(void**)&gdk_popup_layout_get_rect_anchor, "gdk_popup_layout_get_rect_anchor", libs);
  gidLink(cast(void**)&gdk_popup_layout_get_shadow_width, "gdk_popup_layout_get_shadow_width", libs);
  gidLink(cast(void**)&gdk_popup_layout_get_surface_anchor, "gdk_popup_layout_get_surface_anchor", libs);
  gidLink(cast(void**)&gdk_popup_layout_ref, "gdk_popup_layout_ref", libs);
  gidLink(cast(void**)&gdk_popup_layout_set_anchor_hints, "gdk_popup_layout_set_anchor_hints", libs);
  gidLink(cast(void**)&gdk_popup_layout_set_anchor_rect, "gdk_popup_layout_set_anchor_rect", libs);
  gidLink(cast(void**)&gdk_popup_layout_set_offset, "gdk_popup_layout_set_offset", libs);
  gidLink(cast(void**)&gdk_popup_layout_set_rect_anchor, "gdk_popup_layout_set_rect_anchor", libs);
  gidLink(cast(void**)&gdk_popup_layout_set_shadow_width, "gdk_popup_layout_set_shadow_width", libs);
  gidLink(cast(void**)&gdk_popup_layout_set_surface_anchor, "gdk_popup_layout_set_surface_anchor", libs);
  gidLink(cast(void**)&gdk_popup_layout_unref, "gdk_popup_layout_unref", libs);

  // ProximityEvent
  gidLink(cast(void**)&gdk_proximity_event_get_type, "gdk_proximity_event_get_type", libs);

  // RGBA
  gidLink(cast(void**)&gdk_rgba_get_type, "gdk_rgba_get_type", libs);
  gidLink(cast(void**)&gdk_rgba_copy, "gdk_rgba_copy", libs);
  gidLink(cast(void**)&gdk_rgba_equal, "gdk_rgba_equal", libs);
  gidLink(cast(void**)&gdk_rgba_free, "gdk_rgba_free", libs);
  gidLink(cast(void**)&gdk_rgba_hash, "gdk_rgba_hash", libs);
  gidLink(cast(void**)&gdk_rgba_is_clear, "gdk_rgba_is_clear", libs);
  gidLink(cast(void**)&gdk_rgba_is_opaque, "gdk_rgba_is_opaque", libs);
  gidLink(cast(void**)&gdk_rgba_parse, "gdk_rgba_parse", libs);
  gidLink(cast(void**)&gdk_rgba_print, "gdk_rgba_print", libs);
  gidLink(cast(void**)&gdk_rgba_to_string, "gdk_rgba_to_string", libs);

  // Rectangle
  gidLink(cast(void**)&gdk_rectangle_get_type, "gdk_rectangle_get_type", libs);
  gidLink(cast(void**)&gdk_rectangle_contains_point, "gdk_rectangle_contains_point", libs);
  gidLink(cast(void**)&gdk_rectangle_equal, "gdk_rectangle_equal", libs);
  gidLink(cast(void**)&gdk_rectangle_intersect, "gdk_rectangle_intersect", libs);
  gidLink(cast(void**)&gdk_rectangle_union, "gdk_rectangle_union", libs);

  // ScrollEvent
  gidLink(cast(void**)&gdk_scroll_event_get_type, "gdk_scroll_event_get_type", libs);
  gidLink(cast(void**)&gdk_scroll_event_get_deltas, "gdk_scroll_event_get_deltas", libs);
  gidLink(cast(void**)&gdk_scroll_event_get_direction, "gdk_scroll_event_get_direction", libs);
  gidLink(cast(void**)&gdk_scroll_event_get_relative_direction, "gdk_scroll_event_get_relative_direction", libs);
  gidLink(cast(void**)&gdk_scroll_event_get_unit, "gdk_scroll_event_get_unit", libs);
  gidLink(cast(void**)&gdk_scroll_event_is_stop, "gdk_scroll_event_is_stop", libs);

  // Seat
  gidLink(cast(void**)&gdk_seat_get_type, "gdk_seat_get_type", libs);
  gidLink(cast(void**)&gdk_seat_get_capabilities, "gdk_seat_get_capabilities", libs);
  gidLink(cast(void**)&gdk_seat_get_devices, "gdk_seat_get_devices", libs);
  gidLink(cast(void**)&gdk_seat_get_display, "gdk_seat_get_display", libs);
  gidLink(cast(void**)&gdk_seat_get_keyboard, "gdk_seat_get_keyboard", libs);
  gidLink(cast(void**)&gdk_seat_get_pointer, "gdk_seat_get_pointer", libs);
  gidLink(cast(void**)&gdk_seat_get_tools, "gdk_seat_get_tools", libs);

  // Snapshot
  gidLink(cast(void**)&gdk_snapshot_get_type, "gdk_snapshot_get_type", libs);

  // Surface
  gidLink(cast(void**)&gdk_surface_get_type, "gdk_surface_get_type", libs);
  gidLink(cast(void**)&gdk_surface_new_popup, "gdk_surface_new_popup", libs);
  gidLink(cast(void**)&gdk_surface_new_toplevel, "gdk_surface_new_toplevel", libs);
  gidLink(cast(void**)&gdk_surface_beep, "gdk_surface_beep", libs);
  gidLink(cast(void**)&gdk_surface_create_cairo_context, "gdk_surface_create_cairo_context", libs);
  gidLink(cast(void**)&gdk_surface_create_gl_context, "gdk_surface_create_gl_context", libs);
  gidLink(cast(void**)&gdk_surface_create_similar_surface, "gdk_surface_create_similar_surface", libs);
  gidLink(cast(void**)&gdk_surface_create_vulkan_context, "gdk_surface_create_vulkan_context", libs);
  gidLink(cast(void**)&gdk_surface_destroy, "gdk_surface_destroy", libs);
  gidLink(cast(void**)&gdk_surface_get_cursor, "gdk_surface_get_cursor", libs);
  gidLink(cast(void**)&gdk_surface_get_device_cursor, "gdk_surface_get_device_cursor", libs);
  gidLink(cast(void**)&gdk_surface_get_device_position, "gdk_surface_get_device_position", libs);
  gidLink(cast(void**)&gdk_surface_get_display, "gdk_surface_get_display", libs);
  gidLink(cast(void**)&gdk_surface_get_frame_clock, "gdk_surface_get_frame_clock", libs);
  gidLink(cast(void**)&gdk_surface_get_height, "gdk_surface_get_height", libs);
  gidLink(cast(void**)&gdk_surface_get_mapped, "gdk_surface_get_mapped", libs);
  gidLink(cast(void**)&gdk_surface_get_scale, "gdk_surface_get_scale", libs);
  gidLink(cast(void**)&gdk_surface_get_scale_factor, "gdk_surface_get_scale_factor", libs);
  gidLink(cast(void**)&gdk_surface_get_width, "gdk_surface_get_width", libs);
  gidLink(cast(void**)&gdk_surface_hide, "gdk_surface_hide", libs);
  gidLink(cast(void**)&gdk_surface_is_destroyed, "gdk_surface_is_destroyed", libs);
  gidLink(cast(void**)&gdk_surface_queue_render, "gdk_surface_queue_render", libs);
  gidLink(cast(void**)&gdk_surface_request_layout, "gdk_surface_request_layout", libs);
  gidLink(cast(void**)&gdk_surface_set_cursor, "gdk_surface_set_cursor", libs);
  gidLink(cast(void**)&gdk_surface_set_device_cursor, "gdk_surface_set_device_cursor", libs);
  gidLink(cast(void**)&gdk_surface_set_input_region, "gdk_surface_set_input_region", libs);
  gidLink(cast(void**)&gdk_surface_set_opaque_region, "gdk_surface_set_opaque_region", libs);
  gidLink(cast(void**)&gdk_surface_translate_coordinates, "gdk_surface_translate_coordinates", libs);

  // Texture
  gidLink(cast(void**)&gdk_texture_get_type, "gdk_texture_get_type", libs);
  gidLink(cast(void**)&gdk_texture_new_for_pixbuf, "gdk_texture_new_for_pixbuf", libs);
  gidLink(cast(void**)&gdk_texture_new_from_bytes, "gdk_texture_new_from_bytes", libs);
  gidLink(cast(void**)&gdk_texture_new_from_file, "gdk_texture_new_from_file", libs);
  gidLink(cast(void**)&gdk_texture_new_from_filename, "gdk_texture_new_from_filename", libs);
  gidLink(cast(void**)&gdk_texture_new_from_resource, "gdk_texture_new_from_resource", libs);
  gidLink(cast(void**)&gdk_texture_download, "gdk_texture_download", libs);
  gidLink(cast(void**)&gdk_texture_get_color_state, "gdk_texture_get_color_state", libs);
  gidLink(cast(void**)&gdk_texture_get_format, "gdk_texture_get_format", libs);
  gidLink(cast(void**)&gdk_texture_get_height, "gdk_texture_get_height", libs);
  gidLink(cast(void**)&gdk_texture_get_width, "gdk_texture_get_width", libs);
  gidLink(cast(void**)&gdk_texture_save_to_png, "gdk_texture_save_to_png", libs);
  gidLink(cast(void**)&gdk_texture_save_to_png_bytes, "gdk_texture_save_to_png_bytes", libs);
  gidLink(cast(void**)&gdk_texture_save_to_tiff, "gdk_texture_save_to_tiff", libs);
  gidLink(cast(void**)&gdk_texture_save_to_tiff_bytes, "gdk_texture_save_to_tiff_bytes", libs);

  // TextureDownloader
  gidLink(cast(void**)&gdk_texture_downloader_get_type, "gdk_texture_downloader_get_type", libs);
  gidLink(cast(void**)&gdk_texture_downloader_new, "gdk_texture_downloader_new", libs);
  gidLink(cast(void**)&gdk_texture_downloader_copy, "gdk_texture_downloader_copy", libs);
  gidLink(cast(void**)&gdk_texture_downloader_download_bytes, "gdk_texture_downloader_download_bytes", libs);
  gidLink(cast(void**)&gdk_texture_downloader_download_bytes_with_planes, "gdk_texture_downloader_download_bytes_with_planes", libs);
  gidLink(cast(void**)&gdk_texture_downloader_download_into, "gdk_texture_downloader_download_into", libs);
  gidLink(cast(void**)&gdk_texture_downloader_free, "gdk_texture_downloader_free", libs);
  gidLink(cast(void**)&gdk_texture_downloader_get_color_state, "gdk_texture_downloader_get_color_state", libs);
  gidLink(cast(void**)&gdk_texture_downloader_get_format, "gdk_texture_downloader_get_format", libs);
  gidLink(cast(void**)&gdk_texture_downloader_get_texture, "gdk_texture_downloader_get_texture", libs);
  gidLink(cast(void**)&gdk_texture_downloader_set_color_state, "gdk_texture_downloader_set_color_state", libs);
  gidLink(cast(void**)&gdk_texture_downloader_set_format, "gdk_texture_downloader_set_format", libs);
  gidLink(cast(void**)&gdk_texture_downloader_set_texture, "gdk_texture_downloader_set_texture", libs);

  // Toplevel
  gidLink(cast(void**)&gdk_toplevel_get_type, "gdk_toplevel_get_type", libs);
  gidLink(cast(void**)&gdk_toplevel_begin_move, "gdk_toplevel_begin_move", libs);
  gidLink(cast(void**)&gdk_toplevel_begin_resize, "gdk_toplevel_begin_resize", libs);
  gidLink(cast(void**)&gdk_toplevel_focus, "gdk_toplevel_focus", libs);
  gidLink(cast(void**)&gdk_toplevel_get_capabilities, "gdk_toplevel_get_capabilities", libs);
  gidLink(cast(void**)&gdk_toplevel_get_gravity, "gdk_toplevel_get_gravity", libs);
  gidLink(cast(void**)&gdk_toplevel_get_state, "gdk_toplevel_get_state", libs);
  gidLink(cast(void**)&gdk_toplevel_inhibit_system_shortcuts, "gdk_toplevel_inhibit_system_shortcuts", libs);
  gidLink(cast(void**)&gdk_toplevel_lower, "gdk_toplevel_lower", libs);
  gidLink(cast(void**)&gdk_toplevel_minimize, "gdk_toplevel_minimize", libs);
  gidLink(cast(void**)&gdk_toplevel_present, "gdk_toplevel_present", libs);
  gidLink(cast(void**)&gdk_toplevel_restore_system_shortcuts, "gdk_toplevel_restore_system_shortcuts", libs);
  gidLink(cast(void**)&gdk_toplevel_set_decorated, "gdk_toplevel_set_decorated", libs);
  gidLink(cast(void**)&gdk_toplevel_set_deletable, "gdk_toplevel_set_deletable", libs);
  gidLink(cast(void**)&gdk_toplevel_set_gravity, "gdk_toplevel_set_gravity", libs);
  gidLink(cast(void**)&gdk_toplevel_set_icon_list, "gdk_toplevel_set_icon_list", libs);
  gidLink(cast(void**)&gdk_toplevel_set_modal, "gdk_toplevel_set_modal", libs);
  gidLink(cast(void**)&gdk_toplevel_set_startup_id, "gdk_toplevel_set_startup_id", libs);
  gidLink(cast(void**)&gdk_toplevel_set_title, "gdk_toplevel_set_title", libs);
  gidLink(cast(void**)&gdk_toplevel_set_transient_for, "gdk_toplevel_set_transient_for", libs);
  gidLink(cast(void**)&gdk_toplevel_show_window_menu, "gdk_toplevel_show_window_menu", libs);
  gidLink(cast(void**)&gdk_toplevel_supports_edge_constraints, "gdk_toplevel_supports_edge_constraints", libs);
  gidLink(cast(void**)&gdk_toplevel_titlebar_gesture, "gdk_toplevel_titlebar_gesture", libs);

  // ToplevelLayout
  gidLink(cast(void**)&gdk_toplevel_layout_get_type, "gdk_toplevel_layout_get_type", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_new, "gdk_toplevel_layout_new", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_copy, "gdk_toplevel_layout_copy", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_equal, "gdk_toplevel_layout_equal", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_get_fullscreen, "gdk_toplevel_layout_get_fullscreen", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_get_fullscreen_monitor, "gdk_toplevel_layout_get_fullscreen_monitor", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_get_maximized, "gdk_toplevel_layout_get_maximized", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_get_resizable, "gdk_toplevel_layout_get_resizable", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_ref, "gdk_toplevel_layout_ref", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_set_fullscreen, "gdk_toplevel_layout_set_fullscreen", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_set_maximized, "gdk_toplevel_layout_set_maximized", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_set_resizable, "gdk_toplevel_layout_set_resizable", libs);
  gidLink(cast(void**)&gdk_toplevel_layout_unref, "gdk_toplevel_layout_unref", libs);

  // ToplevelSize
  gidLink(cast(void**)&gdk_toplevel_size_get_type, "gdk_toplevel_size_get_type", libs);
  gidLink(cast(void**)&gdk_toplevel_size_get_bounds, "gdk_toplevel_size_get_bounds", libs);
  gidLink(cast(void**)&gdk_toplevel_size_set_min_size, "gdk_toplevel_size_set_min_size", libs);
  gidLink(cast(void**)&gdk_toplevel_size_set_shadow_width, "gdk_toplevel_size_set_shadow_width", libs);
  gidLink(cast(void**)&gdk_toplevel_size_set_size, "gdk_toplevel_size_set_size", libs);

  // TouchEvent
  gidLink(cast(void**)&gdk_touch_event_get_type, "gdk_touch_event_get_type", libs);
  gidLink(cast(void**)&gdk_touch_event_get_emulating_pointer, "gdk_touch_event_get_emulating_pointer", libs);

  // TouchpadEvent
  gidLink(cast(void**)&gdk_touchpad_event_get_type, "gdk_touchpad_event_get_type", libs);
  gidLink(cast(void**)&gdk_touchpad_event_get_deltas, "gdk_touchpad_event_get_deltas", libs);
  gidLink(cast(void**)&gdk_touchpad_event_get_gesture_phase, "gdk_touchpad_event_get_gesture_phase", libs);
  gidLink(cast(void**)&gdk_touchpad_event_get_n_fingers, "gdk_touchpad_event_get_n_fingers", libs);
  gidLink(cast(void**)&gdk_touchpad_event_get_pinch_angle_delta, "gdk_touchpad_event_get_pinch_angle_delta", libs);
  gidLink(cast(void**)&gdk_touchpad_event_get_pinch_scale, "gdk_touchpad_event_get_pinch_scale", libs);

  // VulkanContext
  gidLink(cast(void**)&gdk_vulkan_context_get_type, "gdk_vulkan_context_get_type", libs);

  // global
  gidLink(cast(void**)&gdk_cairo_draw_from_gl, "gdk_cairo_draw_from_gl", libs);
  gidLink(cast(void**)&gdk_cairo_rectangle, "gdk_cairo_rectangle", libs);
  gidLink(cast(void**)&gdk_cairo_region, "gdk_cairo_region", libs);
  gidLink(cast(void**)&gdk_cairo_region_create_from_surface, "gdk_cairo_region_create_from_surface", libs);
  gidLink(cast(void**)&gdk_cairo_set_source_pixbuf, "gdk_cairo_set_source_pixbuf", libs);
  gidLink(cast(void**)&gdk_cairo_set_source_rgba, "gdk_cairo_set_source_rgba", libs);
  gidLink(cast(void**)&gdk_content_deserialize_async, "gdk_content_deserialize_async", libs);
  gidLink(cast(void**)&gdk_content_deserialize_finish, "gdk_content_deserialize_finish", libs);
  gidLink(cast(void**)&gdk_content_register_deserializer, "gdk_content_register_deserializer", libs);
  gidLink(cast(void**)&gdk_content_register_serializer, "gdk_content_register_serializer", libs);
  gidLink(cast(void**)&gdk_content_serialize_async, "gdk_content_serialize_async", libs);
  gidLink(cast(void**)&gdk_content_serialize_finish, "gdk_content_serialize_finish", libs);
  gidLink(cast(void**)&gdk_events_get_angle, "gdk_events_get_angle", libs);
  gidLink(cast(void**)&gdk_events_get_center, "gdk_events_get_center", libs);
  gidLink(cast(void**)&gdk_events_get_distance, "gdk_events_get_distance", libs);
  gidLink(cast(void**)&gdk_intern_mime_type, "gdk_intern_mime_type", libs);
  gidLink(cast(void**)&gdk_keyval_convert_case, "gdk_keyval_convert_case", libs);
  gidLink(cast(void**)&gdk_keyval_from_name, "gdk_keyval_from_name", libs);
  gidLink(cast(void**)&gdk_keyval_is_lower, "gdk_keyval_is_lower", libs);
  gidLink(cast(void**)&gdk_keyval_is_upper, "gdk_keyval_is_upper", libs);
  gidLink(cast(void**)&gdk_keyval_name, "gdk_keyval_name", libs);
  gidLink(cast(void**)&gdk_keyval_to_lower, "gdk_keyval_to_lower", libs);
  gidLink(cast(void**)&gdk_keyval_to_unicode, "gdk_keyval_to_unicode", libs);
  gidLink(cast(void**)&gdk_keyval_to_upper, "gdk_keyval_to_upper", libs);
  gidLink(cast(void**)&gdk_pango_layout_get_clip_region, "gdk_pango_layout_get_clip_region", libs);
  gidLink(cast(void**)&gdk_pango_layout_line_get_clip_region, "gdk_pango_layout_line_get_clip_region", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_from_surface, "gdk_pixbuf_get_from_surface", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_from_texture, "gdk_pixbuf_get_from_texture", libs);
  gidLink(cast(void**)&gdk_set_allowed_backends, "gdk_set_allowed_backends", libs);
  gidLink(cast(void**)&gdk_unicode_to_keyval, "gdk_unicode_to_keyval", libs);

  // DmabufError
  gidLink(cast(void**)&gdk_dmabuf_error_quark, "gdk_dmabuf_error_quark", libs);

  // DragAction
  gidLink(cast(void**)&gdk_drag_action_is_unique, "gdk_drag_action_is_unique", libs);

  // GLError
  gidLink(cast(void**)&gdk_gl_error_quark, "gdk_gl_error_quark", libs);

  // TextureError
  gidLink(cast(void**)&gdk_texture_error_quark, "gdk_texture_error_quark", libs);

  // VulkanError
  gidLink(cast(void**)&gdk_vulkan_error_quark, "gdk_vulkan_error_quark", libs);
}
