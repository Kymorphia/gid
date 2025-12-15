/// C functions for gdkpixbuf2 library
module gdkpixbuf.c.functions;

public import gid.basictypes;
import gid.loader;
import gdkpixbuf.c.types;
public import gmodule.c.types;
public import gio.c.types;

version(Windows)
  private immutable LIBS = ["libgdk_pixbuf-2.0-0.dll;gdk_pixbuf-2.0-0.dll;gdk_pixbuf-2.dll"];
else version(OSX)
  private immutable LIBS = ["libgdk_pixbuf-2.0.0.dylib"];
else
  private immutable LIBS = ["libgdk_pixbuf-2.0.so.0"];

__gshared extern(C)
{
  // Pixbuf
  GType function() c_gdk_pixbuf_get_type; ///
  GdkPixbuf* function(GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height) c_gdk_pixbuf_new; ///
  GdkPixbuf* function(GBytes* data, GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height, int rowstride) c_gdk_pixbuf_new_from_bytes; ///
  GdkPixbuf* function(const(ubyte)* data, GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height, int rowstride, GdkPixbufDestroyNotify destroyFn, void* destroyFnData) c_gdk_pixbuf_new_from_data; ///
  GdkPixbuf* function(const(char)* filename, GError** _err) c_gdk_pixbuf_new_from_file; ///
  GdkPixbuf* function(const(char)* filename, int width, int height, gboolean preserveAspectRatio, GError** _err) c_gdk_pixbuf_new_from_file_at_scale; ///
  GdkPixbuf* function(const(char)* filename, int width, int height, GError** _err) c_gdk_pixbuf_new_from_file_at_size; ///
  GdkPixbuf* function(int dataLength, const(ubyte)* data, gboolean copyPixels, GError** _err) c_gdk_pixbuf_new_from_inline; ///
  GdkPixbuf* function(const(char)* resourcePath, GError** _err) c_gdk_pixbuf_new_from_resource; ///
  GdkPixbuf* function(const(char)* resourcePath, int width, int height, gboolean preserveAspectRatio, GError** _err) c_gdk_pixbuf_new_from_resource_at_scale; ///
  GdkPixbuf* function(GInputStream* stream, GCancellable* cancellable, GError** _err) c_gdk_pixbuf_new_from_stream; ///
  GdkPixbuf* function(GInputStream* stream, int width, int height, gboolean preserveAspectRatio, GCancellable* cancellable, GError** _err) c_gdk_pixbuf_new_from_stream_at_scale; ///
  GdkPixbuf* function(GAsyncResult* asyncResult, GError** _err) c_gdk_pixbuf_new_from_stream_finish; ///
  GdkPixbuf* function(const(char*)* data) c_gdk_pixbuf_new_from_xpm_data; ///
  int function(GdkColorspace colorspace, gboolean hasAlpha, int bitsPerSample, int width, int height) c_gdk_pixbuf_calculate_rowstride; ///
  GdkPixbufFormat* function(const(char)* filename, int* width, int* height) c_gdk_pixbuf_get_file_info; ///
  void function(const(char)* filename, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_pixbuf_get_file_info_async; ///
  GdkPixbufFormat* function(GAsyncResult* asyncResult, int* width, int* height, GError** _err) c_gdk_pixbuf_get_file_info_finish; ///
  GSList* function() c_gdk_pixbuf_get_formats; ///
  gboolean function(const(char)* path, GError** _err) c_gdk_pixbuf_init_modules; ///
  void function(GInputStream* stream, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_pixbuf_new_from_stream_async; ///
  void function(GInputStream* stream, int width, int height, gboolean preserveAspectRatio, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_pixbuf_new_from_stream_at_scale_async; ///
  gboolean function(GAsyncResult* asyncResult, GError** _err) c_gdk_pixbuf_save_to_stream_finish; ///
  GdkPixbuf* function(const(GdkPixbuf)* pixbuf, gboolean substituteColor, ubyte r, ubyte g, ubyte b) c_gdk_pixbuf_add_alpha; ///
  GdkPixbuf* function(GdkPixbuf* src) c_gdk_pixbuf_apply_embedded_orientation; ///
  void function(const(GdkPixbuf)* src, GdkPixbuf* dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, GdkInterpType interpType, int overallAlpha) c_gdk_pixbuf_composite; ///
  void function(const(GdkPixbuf)* src, GdkPixbuf* dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, GdkInterpType interpType, int overallAlpha, int checkX, int checkY, int checkSize, uint color1, uint color2) c_gdk_pixbuf_composite_color; ///
  GdkPixbuf* function(const(GdkPixbuf)* src, int destWidth, int destHeight, GdkInterpType interpType, int overallAlpha, int checkSize, uint color1, uint color2) c_gdk_pixbuf_composite_color_simple; ///
  GdkPixbuf* function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_copy; ///
  void function(const(GdkPixbuf)* srcPixbuf, int srcX, int srcY, int width, int height, GdkPixbuf* destPixbuf, int destX, int destY) c_gdk_pixbuf_copy_area; ///
  gboolean function(GdkPixbuf* srcPixbuf, GdkPixbuf* destPixbuf) c_gdk_pixbuf_copy_options; ///
  void function(GdkPixbuf* pixbuf, uint pixel) c_gdk_pixbuf_fill; ///
  GdkPixbuf* function(const(GdkPixbuf)* src, gboolean horizontal) c_gdk_pixbuf_flip; ///
  int function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_bits_per_sample; ///
  size_t function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_byte_length; ///
  GdkColorspace function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_colorspace; ///
  gboolean function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_has_alpha; ///
  int function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_height; ///
  int function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_n_channels; ///
  const(char)* function(GdkPixbuf* pixbuf, const(char)* key) c_gdk_pixbuf_get_option; ///
  GHashTable* function(GdkPixbuf* pixbuf) c_gdk_pixbuf_get_options; ///
  ubyte* function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_pixels; ///
  ubyte* function(const(GdkPixbuf)* pixbuf, uint* length) c_gdk_pixbuf_get_pixels_with_length; ///
  int function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_rowstride; ///
  int function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_get_width; ///
  GdkPixbuf* function(GdkPixbuf* srcPixbuf, int srcX, int srcY, int width, int height) c_gdk_pixbuf_new_subpixbuf; ///
  GBytes* function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_read_pixel_bytes; ///
  const(ubyte)* function(const(GdkPixbuf)* pixbuf) c_gdk_pixbuf_read_pixels; ///
  GdkPixbuf* function(GdkPixbuf* pixbuf) c_gdk_pixbuf_ref; ///
  gboolean function(GdkPixbuf* pixbuf, const(char)* key) c_gdk_pixbuf_remove_option; ///
  GdkPixbuf* function(const(GdkPixbuf)* src, GdkPixbufRotation angle) c_gdk_pixbuf_rotate_simple; ///
  void function(const(GdkPixbuf)* src, GdkPixbuf* dest, float saturation, gboolean pixelate) c_gdk_pixbuf_saturate_and_pixelate; ///
  gboolean function(GdkPixbuf* pixbuf, const(char)* filename, const(char)* type, GError** error,  ...) c_gdk_pixbuf_save; ///
  gboolean function(GdkPixbuf* pixbuf, ubyte** buffer, size_t* bufferSize, const(char)* type, GError** error,  ...) c_gdk_pixbuf_save_to_buffer; ///
  gboolean function(GdkPixbuf* pixbuf, ubyte** buffer, size_t* bufferSize, const(char)* type, char** optionKeys, char** optionValues, GError** _err) c_gdk_pixbuf_save_to_bufferv; ///
  gboolean function(GdkPixbuf* pixbuf, GdkPixbufSaveFunc saveFunc, void* userData, const(char)* type, GError** error,  ...) c_gdk_pixbuf_save_to_callback; ///
  gboolean function(GdkPixbuf* pixbuf, GdkPixbufSaveFunc saveFunc, void* userData, const(char)* type, char** optionKeys, char** optionValues, GError** _err) c_gdk_pixbuf_save_to_callbackv; ///
  gboolean function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, GCancellable* cancellable, GError** error,  ...) c_gdk_pixbuf_save_to_stream; ///
  void function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) c_gdk_pixbuf_save_to_stream_async; ///
  gboolean function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, char** optionKeys, char** optionValues, GCancellable* cancellable, GError** _err) c_gdk_pixbuf_save_to_streamv; ///
  void function(GdkPixbuf* pixbuf, GOutputStream* stream, const(char)* type, char** optionKeys, char** optionValues, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_pixbuf_save_to_streamv_async; ///
  gboolean function(GdkPixbuf* pixbuf, const(char)* filename, const(char)* type, char** optionKeys, char** optionValues, GError** _err) c_gdk_pixbuf_savev; ///
  void function(const(GdkPixbuf)* src, GdkPixbuf* dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, GdkInterpType interpType) c_gdk_pixbuf_scale; ///
  GdkPixbuf* function(const(GdkPixbuf)* src, int destWidth, int destHeight, GdkInterpType interpType) c_gdk_pixbuf_scale_simple; ///
  gboolean function(GdkPixbuf* pixbuf, const(char)* key, const(char)* value) c_gdk_pixbuf_set_option; ///
  void function(GdkPixbuf* pixbuf) c_gdk_pixbuf_unref; ///

  // PixbufAnimation
  GType function() c_gdk_pixbuf_animation_get_type; ///
  GdkPixbufAnimation* function(const(char)* filename, GError** _err) c_gdk_pixbuf_animation_new_from_file; ///
  GdkPixbufAnimation* function(const(char)* resourcePath, GError** _err) c_gdk_pixbuf_animation_new_from_resource; ///
  GdkPixbufAnimation* function(GInputStream* stream, GCancellable* cancellable, GError** _err) c_gdk_pixbuf_animation_new_from_stream; ///
  GdkPixbufAnimation* function(GAsyncResult* asyncResult, GError** _err) c_gdk_pixbuf_animation_new_from_stream_finish; ///
  void function(GInputStream* stream, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_pixbuf_animation_new_from_stream_async; ///
  int function(GdkPixbufAnimation* animation) c_gdk_pixbuf_animation_get_height; ///
  GdkPixbufAnimationIter* function(GdkPixbufAnimation* animation, const(GTimeVal)* startTime) c_gdk_pixbuf_animation_get_iter; ///
  GdkPixbuf* function(GdkPixbufAnimation* animation) c_gdk_pixbuf_animation_get_static_image; ///
  int function(GdkPixbufAnimation* animation) c_gdk_pixbuf_animation_get_width; ///
  gboolean function(GdkPixbufAnimation* animation) c_gdk_pixbuf_animation_is_static_image; ///
  GdkPixbufAnimation* function(GdkPixbufAnimation* animation) c_gdk_pixbuf_animation_ref; ///
  void function(GdkPixbufAnimation* animation) c_gdk_pixbuf_animation_unref; ///

  // PixbufAnimationIter
  GType function() c_gdk_pixbuf_animation_iter_get_type; ///
  gboolean function(GdkPixbufAnimationIter* iter, const(GTimeVal)* currentTime) c_gdk_pixbuf_animation_iter_advance; ///
  int function(GdkPixbufAnimationIter* iter) c_gdk_pixbuf_animation_iter_get_delay_time; ///
  GdkPixbuf* function(GdkPixbufAnimationIter* iter) c_gdk_pixbuf_animation_iter_get_pixbuf; ///
  gboolean function(GdkPixbufAnimationIter* iter) c_gdk_pixbuf_animation_iter_on_currently_loading_frame; ///

  // PixbufFormat
  GType function() c_gdk_pixbuf_format_get_type; ///
  GdkPixbufFormat* function(const(GdkPixbufFormat)* format) c_gdk_pixbuf_format_copy; ///
  void function(GdkPixbufFormat* format) c_gdk_pixbuf_format_free; ///
  char* function(GdkPixbufFormat* format) c_gdk_pixbuf_format_get_description; ///
  char** function(GdkPixbufFormat* format) c_gdk_pixbuf_format_get_extensions; ///
  char* function(GdkPixbufFormat* format) c_gdk_pixbuf_format_get_license; ///
  char** function(GdkPixbufFormat* format) c_gdk_pixbuf_format_get_mime_types; ///
  char* function(GdkPixbufFormat* format) c_gdk_pixbuf_format_get_name; ///
  gboolean function(GdkPixbufFormat* format) c_gdk_pixbuf_format_is_disabled; ///
  gboolean function(GdkPixbufFormat* format, const(char)* optionKey) c_gdk_pixbuf_format_is_save_option_supported; ///
  gboolean function(GdkPixbufFormat* format) c_gdk_pixbuf_format_is_scalable; ///
  gboolean function(GdkPixbufFormat* format) c_gdk_pixbuf_format_is_writable; ///
  void function(GdkPixbufFormat* format, gboolean disabled) c_gdk_pixbuf_format_set_disabled; ///

  // PixbufLoader
  GType function() c_gdk_pixbuf_loader_get_type; ///
  GdkPixbufLoader* function() c_gdk_pixbuf_loader_new; ///
  GdkPixbufLoader* function(const(char)* mimeType, GError** _err) c_gdk_pixbuf_loader_new_with_mime_type; ///
  GdkPixbufLoader* function(const(char)* imageType, GError** _err) c_gdk_pixbuf_loader_new_with_type; ///
  gboolean function(GdkPixbufLoader* loader, GError** _err) c_gdk_pixbuf_loader_close; ///
  GdkPixbufAnimation* function(GdkPixbufLoader* loader) c_gdk_pixbuf_loader_get_animation; ///
  GdkPixbufFormat* function(GdkPixbufLoader* loader) c_gdk_pixbuf_loader_get_format; ///
  GdkPixbuf* function(GdkPixbufLoader* loader) c_gdk_pixbuf_loader_get_pixbuf; ///
  void function(GdkPixbufLoader* loader, int width, int height) c_gdk_pixbuf_loader_set_size; ///
  gboolean function(GdkPixbufLoader* loader, const(ubyte)* buf, size_t count, GError** _err) c_gdk_pixbuf_loader_write; ///
  gboolean function(GdkPixbufLoader* loader, GBytes* buffer, GError** _err) c_gdk_pixbuf_loader_write_bytes; ///

  // PixbufNonAnim
  GType function() c_gdk_pixbuf_non_anim_get_type; ///
  GdkPixbufAnimation* function(GdkPixbuf* pixbuf) c_gdk_pixbuf_non_anim_new; ///

  // PixbufSimpleAnim
  GType function() c_gdk_pixbuf_simple_anim_get_type; ///
  GdkPixbufSimpleAnim* function(int width, int height, float rate) c_gdk_pixbuf_simple_anim_new; ///
  void function(GdkPixbufSimpleAnim* animation, GdkPixbuf* pixbuf) c_gdk_pixbuf_simple_anim_add_frame; ///
  gboolean function(GdkPixbufSimpleAnim* animation) c_gdk_pixbuf_simple_anim_get_loop; ///
  void function(GdkPixbufSimpleAnim* animation, gboolean loop) c_gdk_pixbuf_simple_anim_set_loop; ///

  // PixbufSimpleAnimIter
  GType function() c_gdk_pixbuf_simple_anim_iter_get_type; ///

  // PixbufError
  GQuark function() c_gdk_pixbuf_error_quark; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
