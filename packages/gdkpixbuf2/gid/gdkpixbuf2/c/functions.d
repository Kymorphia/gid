/// C functions for gdkpixbuf2 library
module gid.gdkpixbuf2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gdkpixbuf2.c.types;
public import gid.gio2.c.types;
public import gid.gmodule2.c.types;

private immutable LIBS = ["gdk_pixbuf-2.0_0"];

// Pixbuf
private alias c_gdk_pixbuf_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_get_typeFn c_gdk_pixbuf_get_type; ///
private alias c_gdk_pixbuf_newFn = extern(C) GdkPixbuf* function(GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height) nothrow;
__gshared c_gdk_pixbuf_newFn c_gdk_pixbuf_new; ///
private alias c_gdk_pixbuf_new_from_bytesFn = extern(C) GdkPixbuf* function(GBytes* data, GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height, int rowstride) nothrow;
__gshared c_gdk_pixbuf_new_from_bytesFn c_gdk_pixbuf_new_from_bytes; ///
private alias c_gdk_pixbuf_new_from_dataFn = extern(C) GdkPixbuf* function(const(ubyte)* data, GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height, int rowstride, GdkPixbufDestroyNotify destroyFn, void* destroyFnData) nothrow;
__gshared c_gdk_pixbuf_new_from_dataFn c_gdk_pixbuf_new_from_data; ///
private alias c_gdk_pixbuf_new_from_fileFn = extern(C) GdkPixbuf* function(const(char)* filename, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_fileFn c_gdk_pixbuf_new_from_file; ///
private alias c_gdk_pixbuf_new_from_file_at_scaleFn = extern(C) GdkPixbuf* function(const(char)* filename, int width, int height, gboolean preserveAspectRatio, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_file_at_scaleFn c_gdk_pixbuf_new_from_file_at_scale; ///
private alias c_gdk_pixbuf_new_from_file_at_sizeFn = extern(C) GdkPixbuf* function(const(char)* filename, int width, int height, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_file_at_sizeFn c_gdk_pixbuf_new_from_file_at_size; ///
private alias c_gdk_pixbuf_new_from_inlineFn = extern(C) GdkPixbuf* function(int dataLength, const(ubyte)* data, gboolean copyPixels, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_inlineFn c_gdk_pixbuf_new_from_inline; ///
private alias c_gdk_pixbuf_new_from_resourceFn = extern(C) GdkPixbuf* function(const(char)* resourcePath, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_resourceFn c_gdk_pixbuf_new_from_resource; ///
private alias c_gdk_pixbuf_new_from_resource_at_scaleFn = extern(C) GdkPixbuf* function(const(char)* resourcePath, int width, int height, gboolean preserveAspectRatio, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_resource_at_scaleFn c_gdk_pixbuf_new_from_resource_at_scale; ///
private alias c_gdk_pixbuf_new_from_streamFn = extern(C) GdkPixbuf* function(GInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_streamFn c_gdk_pixbuf_new_from_stream; ///
private alias c_gdk_pixbuf_new_from_stream_at_scaleFn = extern(C) GdkPixbuf* function(GInputStream* stream, int width, int height, gboolean preserveAspectRatio, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_stream_at_scaleFn c_gdk_pixbuf_new_from_stream_at_scale; ///
private alias c_gdk_pixbuf_new_from_stream_finishFn = extern(C) GdkPixbuf* function(GAsyncResult* asyncResult, GError** _err) nothrow;
__gshared c_gdk_pixbuf_new_from_stream_finishFn c_gdk_pixbuf_new_from_stream_finish; ///
private alias c_gdk_pixbuf_new_from_xpm_dataFn = extern(C) GdkPixbuf* function(const(char*)* data) nothrow;
__gshared c_gdk_pixbuf_new_from_xpm_dataFn c_gdk_pixbuf_new_from_xpm_data; ///
private alias c_gdk_pixbuf_calculate_rowstrideFn = extern(C) int function(GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height) nothrow;
__gshared c_gdk_pixbuf_calculate_rowstrideFn c_gdk_pixbuf_calculate_rowstride; ///
private alias c_gdk_pixbuf_get_file_infoFn = extern(C) GdkPixbufFormat* function(const(char)* filename, int* width, int* height) nothrow;
__gshared c_gdk_pixbuf_get_file_infoFn c_gdk_pixbuf_get_file_info; ///
private alias c_gdk_pixbuf_get_file_info_asyncFn = extern(C) void function(const(char)* filename, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_pixbuf_get_file_info_asyncFn c_gdk_pixbuf_get_file_info_async; ///
private alias c_gdk_pixbuf_get_file_info_finishFn = extern(C) GdkPixbufFormat* function(GAsyncResult* asyncResult, int* width, int* height, GError** _err) nothrow;
__gshared c_gdk_pixbuf_get_file_info_finishFn c_gdk_pixbuf_get_file_info_finish; ///
private alias c_gdk_pixbuf_get_formatsFn = extern(C) GSList* function() nothrow;
__gshared c_gdk_pixbuf_get_formatsFn c_gdk_pixbuf_get_formats; ///
private alias c_gdk_pixbuf_init_modulesFn = extern(C) gboolean function(const(char)* path, GError** _err) nothrow;
__gshared c_gdk_pixbuf_init_modulesFn c_gdk_pixbuf_init_modules; ///
private alias c_gdk_pixbuf_new_from_stream_asyncFn = extern(C) void function(GInputStream* stream, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_pixbuf_new_from_stream_asyncFn c_gdk_pixbuf_new_from_stream_async; ///
private alias c_gdk_pixbuf_new_from_stream_at_scale_asyncFn = extern(C) void function(GInputStream* stream, int width, int height, gboolean preserveAspectRatio, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_pixbuf_new_from_stream_at_scale_asyncFn c_gdk_pixbuf_new_from_stream_at_scale_async; ///
private alias c_gdk_pixbuf_save_to_stream_finishFn = extern(C) gboolean function(GAsyncResult* asyncResult, GError** _err) nothrow;
__gshared c_gdk_pixbuf_save_to_stream_finishFn c_gdk_pixbuf_save_to_stream_finish; ///
private alias c_gdk_pixbuf_add_alphaFn = extern(C) GdkPixbuf* function(const(GdkPixbuf)* pixbuf, gboolean substituteColor, ubyte r, ubyte g, ubyte b) nothrow;
__gshared c_gdk_pixbuf_add_alphaFn c_gdk_pixbuf_add_alpha; ///
private alias c_gdk_pixbuf_apply_embedded_orientationFn = extern(C) GdkPixbuf* function(GdkPixbuf* src) nothrow;
__gshared c_gdk_pixbuf_apply_embedded_orientationFn c_gdk_pixbuf_apply_embedded_orientation; ///
private alias c_gdk_pixbuf_compositeFn = extern(C) void function(const(GdkPixbuf)* src, GdkPixbuf* dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, GdkInterpType interpType, int overallAlpha) nothrow;
__gshared c_gdk_pixbuf_compositeFn c_gdk_pixbuf_composite; ///
private alias c_gdk_pixbuf_composite_colorFn = extern(C) void function(const(GdkPixbuf)* src, GdkPixbuf* dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, GdkInterpType interpType, int overallAlpha, int checkX, int checkY, int checkSize, uint color1, uint color2) nothrow;
__gshared c_gdk_pixbuf_composite_colorFn c_gdk_pixbuf_composite_color; ///
private alias c_gdk_pixbuf_composite_color_simpleFn = extern(C) GdkPixbuf* function(const(GdkPixbuf)* src, int destWidth, int destHeight, GdkInterpType interpType, int overallAlpha, int checkSize, uint color1, uint color2) nothrow;
__gshared c_gdk_pixbuf_composite_color_simpleFn c_gdk_pixbuf_composite_color_simple; ///
private alias c_gdk_pixbuf_copyFn = extern(C) GdkPixbuf* function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_copyFn c_gdk_pixbuf_copy; ///
private alias c_gdk_pixbuf_copy_areaFn = extern(C) void function(const(GdkPixbuf)* srcPixbuf, int srcX, int srcY, int width, int height, GdkPixbuf* destPixbuf, int destX, int destY) nothrow;
__gshared c_gdk_pixbuf_copy_areaFn c_gdk_pixbuf_copy_area; ///
private alias c_gdk_pixbuf_copy_optionsFn = extern(C) gboolean function(GdkPixbuf* srcPixbuf, GdkPixbuf* destPixbuf) nothrow;
__gshared c_gdk_pixbuf_copy_optionsFn c_gdk_pixbuf_copy_options; ///
private alias c_gdk_pixbuf_fillFn = extern(C) void function(GdkPixbuf* pixbuf, uint pixel) nothrow;
__gshared c_gdk_pixbuf_fillFn c_gdk_pixbuf_fill; ///
private alias c_gdk_pixbuf_flipFn = extern(C) GdkPixbuf* function(const(GdkPixbuf)* src, gboolean horizontal) nothrow;
__gshared c_gdk_pixbuf_flipFn c_gdk_pixbuf_flip; ///
private alias c_gdk_pixbuf_get_bits_per_sampleFn = extern(C) int function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_bits_per_sampleFn c_gdk_pixbuf_get_bits_per_sample; ///
private alias c_gdk_pixbuf_get_byte_lengthFn = extern(C) size_t function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_byte_lengthFn c_gdk_pixbuf_get_byte_length; ///
private alias c_gdk_pixbuf_get_colorspaceFn = extern(C) GdkColorspace function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_colorspaceFn c_gdk_pixbuf_get_colorspace; ///
private alias c_gdk_pixbuf_get_has_alphaFn = extern(C) gboolean function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_has_alphaFn c_gdk_pixbuf_get_has_alpha; ///
private alias c_gdk_pixbuf_get_heightFn = extern(C) int function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_heightFn c_gdk_pixbuf_get_height; ///
private alias c_gdk_pixbuf_get_n_channelsFn = extern(C) int function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_n_channelsFn c_gdk_pixbuf_get_n_channels; ///
private alias c_gdk_pixbuf_get_optionFn = extern(C) const(char)* function(GdkPixbuf* pixbuf, const(char)* key) nothrow;
__gshared c_gdk_pixbuf_get_optionFn c_gdk_pixbuf_get_option; ///
private alias c_gdk_pixbuf_get_optionsFn = extern(C) GHashTable* function(GdkPixbuf* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_optionsFn c_gdk_pixbuf_get_options; ///
private alias c_gdk_pixbuf_get_pixelsFn = extern(C) ubyte* function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_pixelsFn c_gdk_pixbuf_get_pixels; ///
private alias c_gdk_pixbuf_get_pixels_with_lengthFn = extern(C) ubyte* function(const(GdkPixbuf)* pixbuf, uint* length) nothrow;
__gshared c_gdk_pixbuf_get_pixels_with_lengthFn c_gdk_pixbuf_get_pixels_with_length; ///
private alias c_gdk_pixbuf_get_rowstrideFn = extern(C) int function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_rowstrideFn c_gdk_pixbuf_get_rowstride; ///
private alias c_gdk_pixbuf_get_widthFn = extern(C) int function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_get_widthFn c_gdk_pixbuf_get_width; ///
private alias c_gdk_pixbuf_new_subpixbufFn = extern(C) GdkPixbuf* function(GdkPixbuf* srcPixbuf, int srcX, int srcY, int width, int height) nothrow;
__gshared c_gdk_pixbuf_new_subpixbufFn c_gdk_pixbuf_new_subpixbuf; ///
private alias c_gdk_pixbuf_read_pixel_bytesFn = extern(C) GBytes* function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_read_pixel_bytesFn c_gdk_pixbuf_read_pixel_bytes; ///
private alias c_gdk_pixbuf_read_pixelsFn = extern(C) const(ubyte)* function(const(GdkPixbuf)* pixbuf) nothrow;
__gshared c_gdk_pixbuf_read_pixelsFn c_gdk_pixbuf_read_pixels; ///
private alias c_gdk_pixbuf_refFn = extern(C) GdkPixbuf* function(GdkPixbuf* pixbuf) nothrow;
__gshared c_gdk_pixbuf_refFn c_gdk_pixbuf_ref; ///
private alias c_gdk_pixbuf_remove_optionFn = extern(C) gboolean function(GdkPixbuf* pixbuf, const(char)* key) nothrow;
__gshared c_gdk_pixbuf_remove_optionFn c_gdk_pixbuf_remove_option; ///
private alias c_gdk_pixbuf_rotate_simpleFn = extern(C) GdkPixbuf* function(const(GdkPixbuf)* src, GdkPixbufRotation angle) nothrow;
__gshared c_gdk_pixbuf_rotate_simpleFn c_gdk_pixbuf_rotate_simple; ///
private alias c_gdk_pixbuf_saturate_and_pixelateFn = extern(C) void function(const(GdkPixbuf)* src, GdkPixbuf* dest, float saturation, gboolean pixelate) nothrow;
__gshared c_gdk_pixbuf_saturate_and_pixelateFn c_gdk_pixbuf_saturate_and_pixelate; ///
private alias c_gdk_pixbuf_saveFn = extern(C) gboolean function(GdkPixbuf* pixbuf, const(char)* filename, const(char)* type, GError** error,  ...) nothrow;
__gshared c_gdk_pixbuf_saveFn c_gdk_pixbuf_save; ///
private alias c_gdk_pixbuf_save_to_bufferFn = extern(C) gboolean function(GdkPixbuf* pixbuf, ubyte** buffer, size_t* bufferSize, const(char)* type, GError** error,  ...) nothrow;
__gshared c_gdk_pixbuf_save_to_bufferFn c_gdk_pixbuf_save_to_buffer; ///
private alias c_gdk_pixbuf_save_to_buffervFn = extern(C) gboolean function(GdkPixbuf* pixbuf, ubyte** buffer, size_t* bufferSize, const(char)* type, char** optionKeys, char** optionValues, GError** _err) nothrow;
__gshared c_gdk_pixbuf_save_to_buffervFn c_gdk_pixbuf_save_to_bufferv; ///
private alias c_gdk_pixbuf_save_to_callbackFn = extern(C) gboolean function(GdkPixbuf* pixbuf, GdkPixbufSaveFunc saveFunc, void* userData, const(char)* type, GError** error,  ...) nothrow;
__gshared c_gdk_pixbuf_save_to_callbackFn c_gdk_pixbuf_save_to_callback; ///
private alias c_gdk_pixbuf_save_to_callbackvFn = extern(C) gboolean function(GdkPixbuf* pixbuf, GdkPixbufSaveFunc saveFunc, void* userData, const(char)* type, char** optionKeys, char** optionValues, GError** _err) nothrow;
__gshared c_gdk_pixbuf_save_to_callbackvFn c_gdk_pixbuf_save_to_callbackv; ///
private alias c_gdk_pixbuf_save_to_streamFn = extern(C) gboolean function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, GCancellable* cancellable, GError** error,  ...) nothrow;
__gshared c_gdk_pixbuf_save_to_streamFn c_gdk_pixbuf_save_to_stream; ///
private alias c_gdk_pixbuf_save_to_stream_asyncFn = extern(C) void function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) nothrow;
__gshared c_gdk_pixbuf_save_to_stream_asyncFn c_gdk_pixbuf_save_to_stream_async; ///
private alias c_gdk_pixbuf_save_to_streamvFn = extern(C) gboolean function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, char** optionKeys, char** optionValues, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_gdk_pixbuf_save_to_streamvFn c_gdk_pixbuf_save_to_streamv; ///
private alias c_gdk_pixbuf_save_to_streamv_asyncFn = extern(C) void function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, char** optionKeys, char** optionValues, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_pixbuf_save_to_streamv_asyncFn c_gdk_pixbuf_save_to_streamv_async; ///
private alias c_gdk_pixbuf_savevFn = extern(C) gboolean function(GdkPixbuf* pixbuf, const(char)* filename, const(char)* type, char** optionKeys, char** optionValues, GError** _err) nothrow;
__gshared c_gdk_pixbuf_savevFn c_gdk_pixbuf_savev; ///
private alias c_gdk_pixbuf_scaleFn = extern(C) void function(const(GdkPixbuf)* src, GdkPixbuf* dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, GdkInterpType interpType) nothrow;
__gshared c_gdk_pixbuf_scaleFn c_gdk_pixbuf_scale; ///
private alias c_gdk_pixbuf_scale_simpleFn = extern(C) GdkPixbuf* function(const(GdkPixbuf)* src, int destWidth, int destHeight, GdkInterpType interpType) nothrow;
__gshared c_gdk_pixbuf_scale_simpleFn c_gdk_pixbuf_scale_simple; ///
private alias c_gdk_pixbuf_set_optionFn = extern(C) gboolean function(GdkPixbuf* pixbuf, const(char)* key, const(char)* value) nothrow;
__gshared c_gdk_pixbuf_set_optionFn c_gdk_pixbuf_set_option; ///
private alias c_gdk_pixbuf_unrefFn = extern(C) void function(GdkPixbuf* pixbuf) nothrow;
__gshared c_gdk_pixbuf_unrefFn c_gdk_pixbuf_unref; ///

// PixbufAnimation
private alias c_gdk_pixbuf_animation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_animation_get_typeFn c_gdk_pixbuf_animation_get_type; ///
private alias c_gdk_pixbuf_animation_new_from_fileFn = extern(C) GdkPixbufAnimation* function(const(char)* filename, GError** _err) nothrow;
__gshared c_gdk_pixbuf_animation_new_from_fileFn c_gdk_pixbuf_animation_new_from_file; ///
private alias c_gdk_pixbuf_animation_new_from_resourceFn = extern(C) GdkPixbufAnimation* function(const(char)* resourcePath, GError** _err) nothrow;
__gshared c_gdk_pixbuf_animation_new_from_resourceFn c_gdk_pixbuf_animation_new_from_resource; ///
private alias c_gdk_pixbuf_animation_new_from_streamFn = extern(C) GdkPixbufAnimation* function(GInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_gdk_pixbuf_animation_new_from_streamFn c_gdk_pixbuf_animation_new_from_stream; ///
private alias c_gdk_pixbuf_animation_new_from_stream_finishFn = extern(C) GdkPixbufAnimation* function(GAsyncResult* asyncResult, GError** _err) nothrow;
__gshared c_gdk_pixbuf_animation_new_from_stream_finishFn c_gdk_pixbuf_animation_new_from_stream_finish; ///
private alias c_gdk_pixbuf_animation_new_from_stream_asyncFn = extern(C) void function(GInputStream* stream, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_gdk_pixbuf_animation_new_from_stream_asyncFn c_gdk_pixbuf_animation_new_from_stream_async; ///
private alias c_gdk_pixbuf_animation_get_heightFn = extern(C) int function(GdkPixbufAnimation* animation) nothrow;
__gshared c_gdk_pixbuf_animation_get_heightFn c_gdk_pixbuf_animation_get_height; ///
private alias c_gdk_pixbuf_animation_get_iterFn = extern(C) GdkPixbufAnimationIter* function(GdkPixbufAnimation* animation, const(GTimeVal)* startTime) nothrow;
__gshared c_gdk_pixbuf_animation_get_iterFn c_gdk_pixbuf_animation_get_iter; ///
private alias c_gdk_pixbuf_animation_get_static_imageFn = extern(C) GdkPixbuf* function(GdkPixbufAnimation* animation) nothrow;
__gshared c_gdk_pixbuf_animation_get_static_imageFn c_gdk_pixbuf_animation_get_static_image; ///
private alias c_gdk_pixbuf_animation_get_widthFn = extern(C) int function(GdkPixbufAnimation* animation) nothrow;
__gshared c_gdk_pixbuf_animation_get_widthFn c_gdk_pixbuf_animation_get_width; ///
private alias c_gdk_pixbuf_animation_is_static_imageFn = extern(C) gboolean function(GdkPixbufAnimation* animation) nothrow;
__gshared c_gdk_pixbuf_animation_is_static_imageFn c_gdk_pixbuf_animation_is_static_image; ///
private alias c_gdk_pixbuf_animation_refFn = extern(C) GdkPixbufAnimation* function(GdkPixbufAnimation* animation) nothrow;
__gshared c_gdk_pixbuf_animation_refFn c_gdk_pixbuf_animation_ref; ///
private alias c_gdk_pixbuf_animation_unrefFn = extern(C) void function(GdkPixbufAnimation* animation) nothrow;
__gshared c_gdk_pixbuf_animation_unrefFn c_gdk_pixbuf_animation_unref; ///

// PixbufAnimationIter
private alias c_gdk_pixbuf_animation_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_animation_iter_get_typeFn c_gdk_pixbuf_animation_iter_get_type; ///
private alias c_gdk_pixbuf_animation_iter_advanceFn = extern(C) gboolean function(GdkPixbufAnimationIter* iter, const(GTimeVal)* currentTime) nothrow;
__gshared c_gdk_pixbuf_animation_iter_advanceFn c_gdk_pixbuf_animation_iter_advance; ///
private alias c_gdk_pixbuf_animation_iter_get_delay_timeFn = extern(C) int function(GdkPixbufAnimationIter* iter) nothrow;
__gshared c_gdk_pixbuf_animation_iter_get_delay_timeFn c_gdk_pixbuf_animation_iter_get_delay_time; ///
private alias c_gdk_pixbuf_animation_iter_get_pixbufFn = extern(C) GdkPixbuf* function(GdkPixbufAnimationIter* iter) nothrow;
__gshared c_gdk_pixbuf_animation_iter_get_pixbufFn c_gdk_pixbuf_animation_iter_get_pixbuf; ///
private alias c_gdk_pixbuf_animation_iter_on_currently_loading_frameFn = extern(C) gboolean function(GdkPixbufAnimationIter* iter) nothrow;
__gshared c_gdk_pixbuf_animation_iter_on_currently_loading_frameFn c_gdk_pixbuf_animation_iter_on_currently_loading_frame; ///

// PixbufFormat
private alias c_gdk_pixbuf_format_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_format_get_typeFn c_gdk_pixbuf_format_get_type; ///
private alias c_gdk_pixbuf_format_copyFn = extern(C) GdkPixbufFormat* function(const(GdkPixbufFormat)* format) nothrow;
__gshared c_gdk_pixbuf_format_copyFn c_gdk_pixbuf_format_copy; ///
private alias c_gdk_pixbuf_format_freeFn = extern(C) void function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_freeFn c_gdk_pixbuf_format_free; ///
private alias c_gdk_pixbuf_format_get_descriptionFn = extern(C) char* function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_get_descriptionFn c_gdk_pixbuf_format_get_description; ///
private alias c_gdk_pixbuf_format_get_extensionsFn = extern(C) char** function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_get_extensionsFn c_gdk_pixbuf_format_get_extensions; ///
private alias c_gdk_pixbuf_format_get_licenseFn = extern(C) char* function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_get_licenseFn c_gdk_pixbuf_format_get_license; ///
private alias c_gdk_pixbuf_format_get_mime_typesFn = extern(C) char** function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_get_mime_typesFn c_gdk_pixbuf_format_get_mime_types; ///
private alias c_gdk_pixbuf_format_get_nameFn = extern(C) char* function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_get_nameFn c_gdk_pixbuf_format_get_name; ///
private alias c_gdk_pixbuf_format_is_disabledFn = extern(C) gboolean function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_is_disabledFn c_gdk_pixbuf_format_is_disabled; ///
private alias c_gdk_pixbuf_format_is_save_option_supportedFn = extern(C) gboolean function(GdkPixbufFormat* format, const(char)* optionKey) nothrow;
__gshared c_gdk_pixbuf_format_is_save_option_supportedFn c_gdk_pixbuf_format_is_save_option_supported; ///
private alias c_gdk_pixbuf_format_is_scalableFn = extern(C) gboolean function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_is_scalableFn c_gdk_pixbuf_format_is_scalable; ///
private alias c_gdk_pixbuf_format_is_writableFn = extern(C) gboolean function(GdkPixbufFormat* format) nothrow;
__gshared c_gdk_pixbuf_format_is_writableFn c_gdk_pixbuf_format_is_writable; ///
private alias c_gdk_pixbuf_format_set_disabledFn = extern(C) void function(GdkPixbufFormat* format, gboolean disabled) nothrow;
__gshared c_gdk_pixbuf_format_set_disabledFn c_gdk_pixbuf_format_set_disabled; ///

// PixbufLoader
private alias c_gdk_pixbuf_loader_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_loader_get_typeFn c_gdk_pixbuf_loader_get_type; ///
private alias c_gdk_pixbuf_loader_newFn = extern(C) GdkPixbufLoader* function() nothrow;
__gshared c_gdk_pixbuf_loader_newFn c_gdk_pixbuf_loader_new; ///
private alias c_gdk_pixbuf_loader_new_with_mime_typeFn = extern(C) GdkPixbufLoader* function(const(char)* mimeType, GError** _err) nothrow;
__gshared c_gdk_pixbuf_loader_new_with_mime_typeFn c_gdk_pixbuf_loader_new_with_mime_type; ///
private alias c_gdk_pixbuf_loader_new_with_typeFn = extern(C) GdkPixbufLoader* function(const(char)* imageType, GError** _err) nothrow;
__gshared c_gdk_pixbuf_loader_new_with_typeFn c_gdk_pixbuf_loader_new_with_type; ///
private alias c_gdk_pixbuf_loader_closeFn = extern(C) gboolean function(GdkPixbufLoader* loader, GError** _err) nothrow;
__gshared c_gdk_pixbuf_loader_closeFn c_gdk_pixbuf_loader_close; ///
private alias c_gdk_pixbuf_loader_get_animationFn = extern(C) GdkPixbufAnimation* function(GdkPixbufLoader* loader) nothrow;
__gshared c_gdk_pixbuf_loader_get_animationFn c_gdk_pixbuf_loader_get_animation; ///
private alias c_gdk_pixbuf_loader_get_formatFn = extern(C) GdkPixbufFormat* function(GdkPixbufLoader* loader) nothrow;
__gshared c_gdk_pixbuf_loader_get_formatFn c_gdk_pixbuf_loader_get_format; ///
private alias c_gdk_pixbuf_loader_get_pixbufFn = extern(C) GdkPixbuf* function(GdkPixbufLoader* loader) nothrow;
__gshared c_gdk_pixbuf_loader_get_pixbufFn c_gdk_pixbuf_loader_get_pixbuf; ///
private alias c_gdk_pixbuf_loader_set_sizeFn = extern(C) void function(GdkPixbufLoader* loader, int width, int height) nothrow;
__gshared c_gdk_pixbuf_loader_set_sizeFn c_gdk_pixbuf_loader_set_size; ///
private alias c_gdk_pixbuf_loader_writeFn = extern(C) gboolean function(GdkPixbufLoader* loader, const(ubyte)* buf, size_t count, GError** _err) nothrow;
__gshared c_gdk_pixbuf_loader_writeFn c_gdk_pixbuf_loader_write; ///
private alias c_gdk_pixbuf_loader_write_bytesFn = extern(C) gboolean function(GdkPixbufLoader* loader, GBytes* buffer, GError** _err) nothrow;
__gshared c_gdk_pixbuf_loader_write_bytesFn c_gdk_pixbuf_loader_write_bytes; ///

// PixbufNonAnim
private alias c_gdk_pixbuf_non_anim_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_non_anim_get_typeFn c_gdk_pixbuf_non_anim_get_type; ///
private alias c_gdk_pixbuf_non_anim_newFn = extern(C) GdkPixbufAnimation* function(GdkPixbuf* pixbuf) nothrow;
__gshared c_gdk_pixbuf_non_anim_newFn c_gdk_pixbuf_non_anim_new; ///

// PixbufSimpleAnim
private alias c_gdk_pixbuf_simple_anim_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_simple_anim_get_typeFn c_gdk_pixbuf_simple_anim_get_type; ///
private alias c_gdk_pixbuf_simple_anim_newFn = extern(C) GdkPixbufSimpleAnim* function(int width, int height, float rate) nothrow;
__gshared c_gdk_pixbuf_simple_anim_newFn c_gdk_pixbuf_simple_anim_new; ///
private alias c_gdk_pixbuf_simple_anim_add_frameFn = extern(C) void function(GdkPixbufSimpleAnim* animation, GdkPixbuf* pixbuf) nothrow;
__gshared c_gdk_pixbuf_simple_anim_add_frameFn c_gdk_pixbuf_simple_anim_add_frame; ///
private alias c_gdk_pixbuf_simple_anim_get_loopFn = extern(C) gboolean function(GdkPixbufSimpleAnim* animation) nothrow;
__gshared c_gdk_pixbuf_simple_anim_get_loopFn c_gdk_pixbuf_simple_anim_get_loop; ///
private alias c_gdk_pixbuf_simple_anim_set_loopFn = extern(C) void function(GdkPixbufSimpleAnim* animation, gboolean loop) nothrow;
__gshared c_gdk_pixbuf_simple_anim_set_loopFn c_gdk_pixbuf_simple_anim_set_loop; ///

// PixbufSimpleAnimIter
private alias c_gdk_pixbuf_simple_anim_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gdk_pixbuf_simple_anim_iter_get_typeFn c_gdk_pixbuf_simple_anim_iter_get_type; ///

// PixbufError
private alias c_gdk_pixbuf_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gdk_pixbuf_error_quarkFn c_gdk_pixbuf_error_quark; ///

// Pixbuf

/** */
alias gdk_pixbuf_get_type = c_gdk_pixbuf_get_type;

/** */
alias gdk_pixbuf_new = c_gdk_pixbuf_new;

/** */
alias gdk_pixbuf_new_from_bytes = c_gdk_pixbuf_new_from_bytes;

/** */
alias gdk_pixbuf_new_from_data = c_gdk_pixbuf_new_from_data;

/** */
alias gdk_pixbuf_new_from_file = c_gdk_pixbuf_new_from_file;

/** */
alias gdk_pixbuf_new_from_file_at_scale = c_gdk_pixbuf_new_from_file_at_scale;

/** */
alias gdk_pixbuf_new_from_file_at_size = c_gdk_pixbuf_new_from_file_at_size;

/** */
alias gdk_pixbuf_new_from_inline = c_gdk_pixbuf_new_from_inline;

/** */
alias gdk_pixbuf_new_from_resource = c_gdk_pixbuf_new_from_resource;

/** */
alias gdk_pixbuf_new_from_resource_at_scale = c_gdk_pixbuf_new_from_resource_at_scale;

/** */
alias gdk_pixbuf_new_from_stream = c_gdk_pixbuf_new_from_stream;

/** */
alias gdk_pixbuf_new_from_stream_at_scale = c_gdk_pixbuf_new_from_stream_at_scale;

/** */
alias gdk_pixbuf_new_from_stream_finish = c_gdk_pixbuf_new_from_stream_finish;

/** */
alias gdk_pixbuf_new_from_xpm_data = c_gdk_pixbuf_new_from_xpm_data;

/** */
alias gdk_pixbuf_calculate_rowstride = c_gdk_pixbuf_calculate_rowstride;

/** */
alias gdk_pixbuf_get_file_info = c_gdk_pixbuf_get_file_info;

/** */
alias gdk_pixbuf_get_file_info_async = c_gdk_pixbuf_get_file_info_async;

/** */
alias gdk_pixbuf_get_file_info_finish = c_gdk_pixbuf_get_file_info_finish;

/** */
alias gdk_pixbuf_get_formats = c_gdk_pixbuf_get_formats;

/** */
alias gdk_pixbuf_init_modules = c_gdk_pixbuf_init_modules;

/** */
alias gdk_pixbuf_new_from_stream_async = c_gdk_pixbuf_new_from_stream_async;

/** */
alias gdk_pixbuf_new_from_stream_at_scale_async = c_gdk_pixbuf_new_from_stream_at_scale_async;

/** */
alias gdk_pixbuf_save_to_stream_finish = c_gdk_pixbuf_save_to_stream_finish;

/** */
alias gdk_pixbuf_add_alpha = c_gdk_pixbuf_add_alpha;

/** */
alias gdk_pixbuf_apply_embedded_orientation = c_gdk_pixbuf_apply_embedded_orientation;

/** */
alias gdk_pixbuf_composite = c_gdk_pixbuf_composite;

/** */
alias gdk_pixbuf_composite_color = c_gdk_pixbuf_composite_color;

/** */
alias gdk_pixbuf_composite_color_simple = c_gdk_pixbuf_composite_color_simple;

/** */
alias gdk_pixbuf_copy = c_gdk_pixbuf_copy;

/** */
alias gdk_pixbuf_copy_area = c_gdk_pixbuf_copy_area;

/** */
alias gdk_pixbuf_copy_options = c_gdk_pixbuf_copy_options;

/** */
alias gdk_pixbuf_fill = c_gdk_pixbuf_fill;

/** */
alias gdk_pixbuf_flip = c_gdk_pixbuf_flip;

/** */
alias gdk_pixbuf_get_bits_per_sample = c_gdk_pixbuf_get_bits_per_sample;

/** */
alias gdk_pixbuf_get_byte_length = c_gdk_pixbuf_get_byte_length;

/** */
alias gdk_pixbuf_get_colorspace = c_gdk_pixbuf_get_colorspace;

/** */
alias gdk_pixbuf_get_has_alpha = c_gdk_pixbuf_get_has_alpha;

/** */
alias gdk_pixbuf_get_height = c_gdk_pixbuf_get_height;

/** */
alias gdk_pixbuf_get_n_channels = c_gdk_pixbuf_get_n_channels;

/** */
alias gdk_pixbuf_get_option = c_gdk_pixbuf_get_option;

/** */
alias gdk_pixbuf_get_options = c_gdk_pixbuf_get_options;

/** */
alias gdk_pixbuf_get_pixels = c_gdk_pixbuf_get_pixels;

/** */
alias gdk_pixbuf_get_pixels_with_length = c_gdk_pixbuf_get_pixels_with_length;

/** */
alias gdk_pixbuf_get_rowstride = c_gdk_pixbuf_get_rowstride;

/** */
alias gdk_pixbuf_get_width = c_gdk_pixbuf_get_width;

/** */
alias gdk_pixbuf_new_subpixbuf = c_gdk_pixbuf_new_subpixbuf;

/** */
alias gdk_pixbuf_read_pixel_bytes = c_gdk_pixbuf_read_pixel_bytes;

/** */
alias gdk_pixbuf_read_pixels = c_gdk_pixbuf_read_pixels;

/** */
alias gdk_pixbuf_ref = c_gdk_pixbuf_ref;

/** */
alias gdk_pixbuf_remove_option = c_gdk_pixbuf_remove_option;

/** */
alias gdk_pixbuf_rotate_simple = c_gdk_pixbuf_rotate_simple;

/** */
alias gdk_pixbuf_saturate_and_pixelate = c_gdk_pixbuf_saturate_and_pixelate;

/** */
alias gdk_pixbuf_save = c_gdk_pixbuf_save;

/** */
alias gdk_pixbuf_save_to_buffer = c_gdk_pixbuf_save_to_buffer;

/** */
alias gdk_pixbuf_save_to_bufferv = c_gdk_pixbuf_save_to_bufferv;

/** */
alias gdk_pixbuf_save_to_callback = c_gdk_pixbuf_save_to_callback;

/** */
alias gdk_pixbuf_save_to_callbackv = c_gdk_pixbuf_save_to_callbackv;

/** */
alias gdk_pixbuf_save_to_stream = c_gdk_pixbuf_save_to_stream;

/** */
alias gdk_pixbuf_save_to_stream_async = c_gdk_pixbuf_save_to_stream_async;

/** */
alias gdk_pixbuf_save_to_streamv = c_gdk_pixbuf_save_to_streamv;

/** */
alias gdk_pixbuf_save_to_streamv_async = c_gdk_pixbuf_save_to_streamv_async;

/** */
alias gdk_pixbuf_savev = c_gdk_pixbuf_savev;

/** */
alias gdk_pixbuf_scale = c_gdk_pixbuf_scale;

/** */
alias gdk_pixbuf_scale_simple = c_gdk_pixbuf_scale_simple;

/** */
alias gdk_pixbuf_set_option = c_gdk_pixbuf_set_option;

/** */
alias gdk_pixbuf_unref = c_gdk_pixbuf_unref;

// PixbufAnimation

/** */
alias gdk_pixbuf_animation_get_type = c_gdk_pixbuf_animation_get_type;

/** */
alias gdk_pixbuf_animation_new_from_file = c_gdk_pixbuf_animation_new_from_file;

/** */
alias gdk_pixbuf_animation_new_from_resource = c_gdk_pixbuf_animation_new_from_resource;

/** */
alias gdk_pixbuf_animation_new_from_stream = c_gdk_pixbuf_animation_new_from_stream;

/** */
alias gdk_pixbuf_animation_new_from_stream_finish = c_gdk_pixbuf_animation_new_from_stream_finish;

/** */
alias gdk_pixbuf_animation_new_from_stream_async = c_gdk_pixbuf_animation_new_from_stream_async;

/** */
alias gdk_pixbuf_animation_get_height = c_gdk_pixbuf_animation_get_height;

/** */
alias gdk_pixbuf_animation_get_iter = c_gdk_pixbuf_animation_get_iter;

/** */
alias gdk_pixbuf_animation_get_static_image = c_gdk_pixbuf_animation_get_static_image;

/** */
alias gdk_pixbuf_animation_get_width = c_gdk_pixbuf_animation_get_width;

/** */
alias gdk_pixbuf_animation_is_static_image = c_gdk_pixbuf_animation_is_static_image;

/** */
alias gdk_pixbuf_animation_ref = c_gdk_pixbuf_animation_ref;

/** */
alias gdk_pixbuf_animation_unref = c_gdk_pixbuf_animation_unref;

// PixbufAnimationIter

/** */
alias gdk_pixbuf_animation_iter_get_type = c_gdk_pixbuf_animation_iter_get_type;

/** */
alias gdk_pixbuf_animation_iter_advance = c_gdk_pixbuf_animation_iter_advance;

/** */
alias gdk_pixbuf_animation_iter_get_delay_time = c_gdk_pixbuf_animation_iter_get_delay_time;

/** */
alias gdk_pixbuf_animation_iter_get_pixbuf = c_gdk_pixbuf_animation_iter_get_pixbuf;

/** */
alias gdk_pixbuf_animation_iter_on_currently_loading_frame = c_gdk_pixbuf_animation_iter_on_currently_loading_frame;

// PixbufFormat

/** */
alias gdk_pixbuf_format_get_type = c_gdk_pixbuf_format_get_type;

/** */
alias gdk_pixbuf_format_copy = c_gdk_pixbuf_format_copy;

/** */
alias gdk_pixbuf_format_free = c_gdk_pixbuf_format_free;

/** */
alias gdk_pixbuf_format_get_description = c_gdk_pixbuf_format_get_description;

/** */
alias gdk_pixbuf_format_get_extensions = c_gdk_pixbuf_format_get_extensions;

/** */
alias gdk_pixbuf_format_get_license = c_gdk_pixbuf_format_get_license;

/** */
alias gdk_pixbuf_format_get_mime_types = c_gdk_pixbuf_format_get_mime_types;

/** */
alias gdk_pixbuf_format_get_name = c_gdk_pixbuf_format_get_name;

/** */
alias gdk_pixbuf_format_is_disabled = c_gdk_pixbuf_format_is_disabled;

/** */
alias gdk_pixbuf_format_is_save_option_supported = c_gdk_pixbuf_format_is_save_option_supported;

/** */
alias gdk_pixbuf_format_is_scalable = c_gdk_pixbuf_format_is_scalable;

/** */
alias gdk_pixbuf_format_is_writable = c_gdk_pixbuf_format_is_writable;

/** */
alias gdk_pixbuf_format_set_disabled = c_gdk_pixbuf_format_set_disabled;

// PixbufLoader

/** */
alias gdk_pixbuf_loader_get_type = c_gdk_pixbuf_loader_get_type;

/** */
alias gdk_pixbuf_loader_new = c_gdk_pixbuf_loader_new;

/** */
alias gdk_pixbuf_loader_new_with_mime_type = c_gdk_pixbuf_loader_new_with_mime_type;

/** */
alias gdk_pixbuf_loader_new_with_type = c_gdk_pixbuf_loader_new_with_type;

/** */
alias gdk_pixbuf_loader_close = c_gdk_pixbuf_loader_close;

/** */
alias gdk_pixbuf_loader_get_animation = c_gdk_pixbuf_loader_get_animation;

/** */
alias gdk_pixbuf_loader_get_format = c_gdk_pixbuf_loader_get_format;

/** */
alias gdk_pixbuf_loader_get_pixbuf = c_gdk_pixbuf_loader_get_pixbuf;

/** */
alias gdk_pixbuf_loader_set_size = c_gdk_pixbuf_loader_set_size;

/** */
alias gdk_pixbuf_loader_write = c_gdk_pixbuf_loader_write;

/** */
alias gdk_pixbuf_loader_write_bytes = c_gdk_pixbuf_loader_write_bytes;

// PixbufNonAnim

/** */
alias gdk_pixbuf_non_anim_get_type = c_gdk_pixbuf_non_anim_get_type;

/** */
alias gdk_pixbuf_non_anim_new = c_gdk_pixbuf_non_anim_new;

// PixbufSimpleAnim

/** */
alias gdk_pixbuf_simple_anim_get_type = c_gdk_pixbuf_simple_anim_get_type;

/** */
alias gdk_pixbuf_simple_anim_new = c_gdk_pixbuf_simple_anim_new;

/** */
alias gdk_pixbuf_simple_anim_add_frame = c_gdk_pixbuf_simple_anim_add_frame;

/** */
alias gdk_pixbuf_simple_anim_get_loop = c_gdk_pixbuf_simple_anim_get_loop;

/** */
alias gdk_pixbuf_simple_anim_set_loop = c_gdk_pixbuf_simple_anim_set_loop;

// PixbufSimpleAnimIter

/** */
alias gdk_pixbuf_simple_anim_iter_get_type = c_gdk_pixbuf_simple_anim_iter_get_type;

// PixbufError

/** */
alias gdk_pixbuf_error_quark = c_gdk_pixbuf_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gdkpixbuf2");

  // Pixbuf
  gidLink(cast(void**)&gdk_pixbuf_get_type, "gdk_pixbuf_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_new, "gdk_pixbuf_new", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_bytes, "gdk_pixbuf_new_from_bytes", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_data, "gdk_pixbuf_new_from_data", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_file, "gdk_pixbuf_new_from_file", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_file_at_scale, "gdk_pixbuf_new_from_file_at_scale", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_file_at_size, "gdk_pixbuf_new_from_file_at_size", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_inline, "gdk_pixbuf_new_from_inline", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_resource, "gdk_pixbuf_new_from_resource", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_resource_at_scale, "gdk_pixbuf_new_from_resource_at_scale", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_stream, "gdk_pixbuf_new_from_stream", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_stream_at_scale, "gdk_pixbuf_new_from_stream_at_scale", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_stream_finish, "gdk_pixbuf_new_from_stream_finish", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_xpm_data, "gdk_pixbuf_new_from_xpm_data", libs);
  gidLink(cast(void**)&gdk_pixbuf_calculate_rowstride, "gdk_pixbuf_calculate_rowstride", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_file_info, "gdk_pixbuf_get_file_info", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_file_info_async, "gdk_pixbuf_get_file_info_async", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_file_info_finish, "gdk_pixbuf_get_file_info_finish", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_formats, "gdk_pixbuf_get_formats", libs);
  gidLink(cast(void**)&gdk_pixbuf_init_modules, "gdk_pixbuf_init_modules", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_stream_async, "gdk_pixbuf_new_from_stream_async", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_from_stream_at_scale_async, "gdk_pixbuf_new_from_stream_at_scale_async", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_stream_finish, "gdk_pixbuf_save_to_stream_finish", libs);
  gidLink(cast(void**)&gdk_pixbuf_add_alpha, "gdk_pixbuf_add_alpha", libs);
  gidLink(cast(void**)&gdk_pixbuf_apply_embedded_orientation, "gdk_pixbuf_apply_embedded_orientation", libs);
  gidLink(cast(void**)&gdk_pixbuf_composite, "gdk_pixbuf_composite", libs);
  gidLink(cast(void**)&gdk_pixbuf_composite_color, "gdk_pixbuf_composite_color", libs);
  gidLink(cast(void**)&gdk_pixbuf_composite_color_simple, "gdk_pixbuf_composite_color_simple", libs);
  gidLink(cast(void**)&gdk_pixbuf_copy, "gdk_pixbuf_copy", libs);
  gidLink(cast(void**)&gdk_pixbuf_copy_area, "gdk_pixbuf_copy_area", libs);
  gidLink(cast(void**)&gdk_pixbuf_copy_options, "gdk_pixbuf_copy_options", libs);
  gidLink(cast(void**)&gdk_pixbuf_fill, "gdk_pixbuf_fill", libs);
  gidLink(cast(void**)&gdk_pixbuf_flip, "gdk_pixbuf_flip", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_bits_per_sample, "gdk_pixbuf_get_bits_per_sample", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_byte_length, "gdk_pixbuf_get_byte_length", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_colorspace, "gdk_pixbuf_get_colorspace", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_has_alpha, "gdk_pixbuf_get_has_alpha", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_height, "gdk_pixbuf_get_height", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_n_channels, "gdk_pixbuf_get_n_channels", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_option, "gdk_pixbuf_get_option", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_options, "gdk_pixbuf_get_options", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_pixels, "gdk_pixbuf_get_pixels", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_pixels_with_length, "gdk_pixbuf_get_pixels_with_length", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_rowstride, "gdk_pixbuf_get_rowstride", libs);
  gidLink(cast(void**)&gdk_pixbuf_get_width, "gdk_pixbuf_get_width", libs);
  gidLink(cast(void**)&gdk_pixbuf_new_subpixbuf, "gdk_pixbuf_new_subpixbuf", libs);
  gidLink(cast(void**)&gdk_pixbuf_read_pixel_bytes, "gdk_pixbuf_read_pixel_bytes", libs);
  gidLink(cast(void**)&gdk_pixbuf_read_pixels, "gdk_pixbuf_read_pixels", libs);
  gidLink(cast(void**)&gdk_pixbuf_ref, "gdk_pixbuf_ref", libs);
  gidLink(cast(void**)&gdk_pixbuf_remove_option, "gdk_pixbuf_remove_option", libs);
  gidLink(cast(void**)&gdk_pixbuf_rotate_simple, "gdk_pixbuf_rotate_simple", libs);
  gidLink(cast(void**)&gdk_pixbuf_saturate_and_pixelate, "gdk_pixbuf_saturate_and_pixelate", libs);
  gidLink(cast(void**)&gdk_pixbuf_save, "gdk_pixbuf_save", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_buffer, "gdk_pixbuf_save_to_buffer", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_bufferv, "gdk_pixbuf_save_to_bufferv", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_callback, "gdk_pixbuf_save_to_callback", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_callbackv, "gdk_pixbuf_save_to_callbackv", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_stream, "gdk_pixbuf_save_to_stream", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_stream_async, "gdk_pixbuf_save_to_stream_async", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_streamv, "gdk_pixbuf_save_to_streamv", libs);
  gidLink(cast(void**)&gdk_pixbuf_save_to_streamv_async, "gdk_pixbuf_save_to_streamv_async", libs);
  gidLink(cast(void**)&gdk_pixbuf_savev, "gdk_pixbuf_savev", libs);
  gidLink(cast(void**)&gdk_pixbuf_scale, "gdk_pixbuf_scale", libs);
  gidLink(cast(void**)&gdk_pixbuf_scale_simple, "gdk_pixbuf_scale_simple", libs);
  gidLink(cast(void**)&gdk_pixbuf_set_option, "gdk_pixbuf_set_option", libs);
  gidLink(cast(void**)&gdk_pixbuf_unref, "gdk_pixbuf_unref", libs);

  // PixbufAnimation
  gidLink(cast(void**)&gdk_pixbuf_animation_get_type, "gdk_pixbuf_animation_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_new_from_file, "gdk_pixbuf_animation_new_from_file", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_new_from_resource, "gdk_pixbuf_animation_new_from_resource", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_new_from_stream, "gdk_pixbuf_animation_new_from_stream", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_new_from_stream_finish, "gdk_pixbuf_animation_new_from_stream_finish", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_new_from_stream_async, "gdk_pixbuf_animation_new_from_stream_async", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_get_height, "gdk_pixbuf_animation_get_height", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_get_iter, "gdk_pixbuf_animation_get_iter", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_get_static_image, "gdk_pixbuf_animation_get_static_image", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_get_width, "gdk_pixbuf_animation_get_width", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_is_static_image, "gdk_pixbuf_animation_is_static_image", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_ref, "gdk_pixbuf_animation_ref", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_unref, "gdk_pixbuf_animation_unref", libs);

  // PixbufAnimationIter
  gidLink(cast(void**)&gdk_pixbuf_animation_iter_get_type, "gdk_pixbuf_animation_iter_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_iter_advance, "gdk_pixbuf_animation_iter_advance", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_iter_get_delay_time, "gdk_pixbuf_animation_iter_get_delay_time", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_iter_get_pixbuf, "gdk_pixbuf_animation_iter_get_pixbuf", libs);
  gidLink(cast(void**)&gdk_pixbuf_animation_iter_on_currently_loading_frame, "gdk_pixbuf_animation_iter_on_currently_loading_frame", libs);

  // PixbufFormat
  gidLink(cast(void**)&gdk_pixbuf_format_get_type, "gdk_pixbuf_format_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_copy, "gdk_pixbuf_format_copy", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_free, "gdk_pixbuf_format_free", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_get_description, "gdk_pixbuf_format_get_description", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_get_extensions, "gdk_pixbuf_format_get_extensions", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_get_license, "gdk_pixbuf_format_get_license", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_get_mime_types, "gdk_pixbuf_format_get_mime_types", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_get_name, "gdk_pixbuf_format_get_name", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_is_disabled, "gdk_pixbuf_format_is_disabled", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_is_save_option_supported, "gdk_pixbuf_format_is_save_option_supported", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_is_scalable, "gdk_pixbuf_format_is_scalable", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_is_writable, "gdk_pixbuf_format_is_writable", libs);
  gidLink(cast(void**)&gdk_pixbuf_format_set_disabled, "gdk_pixbuf_format_set_disabled", libs);

  // PixbufLoader
  gidLink(cast(void**)&gdk_pixbuf_loader_get_type, "gdk_pixbuf_loader_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_new, "gdk_pixbuf_loader_new", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_new_with_mime_type, "gdk_pixbuf_loader_new_with_mime_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_new_with_type, "gdk_pixbuf_loader_new_with_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_close, "gdk_pixbuf_loader_close", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_get_animation, "gdk_pixbuf_loader_get_animation", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_get_format, "gdk_pixbuf_loader_get_format", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_get_pixbuf, "gdk_pixbuf_loader_get_pixbuf", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_set_size, "gdk_pixbuf_loader_set_size", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_write, "gdk_pixbuf_loader_write", libs);
  gidLink(cast(void**)&gdk_pixbuf_loader_write_bytes, "gdk_pixbuf_loader_write_bytes", libs);

  // PixbufNonAnim
  gidLink(cast(void**)&gdk_pixbuf_non_anim_get_type, "gdk_pixbuf_non_anim_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_non_anim_new, "gdk_pixbuf_non_anim_new", libs);

  // PixbufSimpleAnim
  gidLink(cast(void**)&gdk_pixbuf_simple_anim_get_type, "gdk_pixbuf_simple_anim_get_type", libs);
  gidLink(cast(void**)&gdk_pixbuf_simple_anim_new, "gdk_pixbuf_simple_anim_new", libs);
  gidLink(cast(void**)&gdk_pixbuf_simple_anim_add_frame, "gdk_pixbuf_simple_anim_add_frame", libs);
  gidLink(cast(void**)&gdk_pixbuf_simple_anim_get_loop, "gdk_pixbuf_simple_anim_get_loop", libs);
  gidLink(cast(void**)&gdk_pixbuf_simple_anim_set_loop, "gdk_pixbuf_simple_anim_set_loop", libs);

  // PixbufSimpleAnimIter
  gidLink(cast(void**)&gdk_pixbuf_simple_anim_iter_get_type, "gdk_pixbuf_simple_anim_iter_get_type", libs);

  // PixbufError
  gidLink(cast(void**)&gdk_pixbuf_error_quark, "gdk_pixbuf_error_quark", libs);
}
