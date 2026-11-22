/// C functions for rsvg2 library
module gid.rsvg2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.rsvg2.c.types;
public import gid.cairo1.c.types;
public import gid.gdkpixbuf2.c.types;
public import gid.gio2.c.types;
public import gid.glib2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["rsvg-2_2"];

// Handle
private alias c_rsvg_handle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_rsvg_handle_get_typeFn c_rsvg_handle_get_type; ///
private alias c_rsvg_handle_newFn = extern(C) RsvgHandle* function() nothrow;
__gshared c_rsvg_handle_newFn c_rsvg_handle_new; ///
private alias c_rsvg_handle_new_from_dataFn = extern(C) RsvgHandle* function(const(ubyte)* data, size_t dataLen, GError** _err) nothrow;
__gshared c_rsvg_handle_new_from_dataFn c_rsvg_handle_new_from_data; ///
private alias c_rsvg_handle_new_from_fileFn = extern(C) RsvgHandle* function(const(char)* filename, GError** _err) nothrow;
__gshared c_rsvg_handle_new_from_fileFn c_rsvg_handle_new_from_file; ///
private alias c_rsvg_handle_new_from_gfile_syncFn = extern(C) RsvgHandle* function(GFile* file, RsvgHandleFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_rsvg_handle_new_from_gfile_syncFn c_rsvg_handle_new_from_gfile_sync; ///
private alias c_rsvg_handle_new_from_stream_syncFn = extern(C) RsvgHandle* function(GInputStream* inputStream, GFile* baseFile, RsvgHandleFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_rsvg_handle_new_from_stream_syncFn c_rsvg_handle_new_from_stream_sync; ///
private alias c_rsvg_handle_new_with_flagsFn = extern(C) RsvgHandle* function(RsvgHandleFlags flags) nothrow;
__gshared c_rsvg_handle_new_with_flagsFn c_rsvg_handle_new_with_flags; ///
private alias c_rsvg_handle_closeFn = extern(C) gboolean function(RsvgHandle* handle, GError** _err) nothrow;
__gshared c_rsvg_handle_closeFn c_rsvg_handle_close; ///
private alias c_rsvg_handle_freeFn = extern(C) void function(RsvgHandle* handle) nothrow;
__gshared c_rsvg_handle_freeFn c_rsvg_handle_free; ///
private alias c_rsvg_handle_get_base_uriFn = extern(C) const(char)* function(RsvgHandle* handle) nothrow;
__gshared c_rsvg_handle_get_base_uriFn c_rsvg_handle_get_base_uri; ///
private alias c_rsvg_handle_get_descFn = extern(C) const(char)* function(RsvgHandle* handle) nothrow;
__gshared c_rsvg_handle_get_descFn c_rsvg_handle_get_desc; ///
private alias c_rsvg_handle_get_dimensionsFn = extern(C) void function(RsvgHandle* handle, RsvgDimensionData* dimensionData) nothrow;
__gshared c_rsvg_handle_get_dimensionsFn c_rsvg_handle_get_dimensions; ///
private alias c_rsvg_handle_get_dimensions_subFn = extern(C) gboolean function(RsvgHandle* handle, RsvgDimensionData* dimensionData, const(char)* id) nothrow;
__gshared c_rsvg_handle_get_dimensions_subFn c_rsvg_handle_get_dimensions_sub; ///
private alias c_rsvg_handle_get_geometry_for_elementFn = extern(C) gboolean function(RsvgHandle* handle, const(char)* id, RsvgRectangle* outInkRect, RsvgRectangle* outLogicalRect, GError** _err) nothrow;
__gshared c_rsvg_handle_get_geometry_for_elementFn c_rsvg_handle_get_geometry_for_element; ///
private alias c_rsvg_handle_get_geometry_for_layerFn = extern(C) gboolean function(RsvgHandle* handle, const(char)* id, const(RsvgRectangle)* viewport, RsvgRectangle* outInkRect, RsvgRectangle* outLogicalRect, GError** _err) nothrow;
__gshared c_rsvg_handle_get_geometry_for_layerFn c_rsvg_handle_get_geometry_for_layer; ///
private alias c_rsvg_handle_get_intrinsic_dimensionsFn = extern(C) void function(RsvgHandle* handle, gboolean* outHasWidth, RsvgLength* outWidth, gboolean* outHasHeight, RsvgLength* outHeight, gboolean* outHasViewbox, RsvgRectangle* outViewbox) nothrow;
__gshared c_rsvg_handle_get_intrinsic_dimensionsFn c_rsvg_handle_get_intrinsic_dimensions; ///
private alias c_rsvg_handle_get_intrinsic_size_in_pixelsFn = extern(C) gboolean function(RsvgHandle* handle, double* outWidth, double* outHeight) nothrow;
__gshared c_rsvg_handle_get_intrinsic_size_in_pixelsFn c_rsvg_handle_get_intrinsic_size_in_pixels; ///
private alias c_rsvg_handle_get_metadataFn = extern(C) const(char)* function(RsvgHandle* handle) nothrow;
__gshared c_rsvg_handle_get_metadataFn c_rsvg_handle_get_metadata; ///
private alias c_rsvg_handle_get_pixbufFn = extern(C) GdkPixbuf* function(RsvgHandle* handle) nothrow;
__gshared c_rsvg_handle_get_pixbufFn c_rsvg_handle_get_pixbuf; ///
private alias c_rsvg_handle_get_pixbuf_and_errorFn = extern(C) GdkPixbuf* function(RsvgHandle* handle, GError** _err) nothrow;
__gshared c_rsvg_handle_get_pixbuf_and_errorFn c_rsvg_handle_get_pixbuf_and_error; ///
private alias c_rsvg_handle_get_pixbuf_subFn = extern(C) GdkPixbuf* function(RsvgHandle* handle, const(char)* id) nothrow;
__gshared c_rsvg_handle_get_pixbuf_subFn c_rsvg_handle_get_pixbuf_sub; ///
private alias c_rsvg_handle_get_position_subFn = extern(C) gboolean function(RsvgHandle* handle, RsvgPositionData* positionData, const(char)* id) nothrow;
__gshared c_rsvg_handle_get_position_subFn c_rsvg_handle_get_position_sub; ///
private alias c_rsvg_handle_get_titleFn = extern(C) const(char)* function(RsvgHandle* handle) nothrow;
__gshared c_rsvg_handle_get_titleFn c_rsvg_handle_get_title; ///
private alias c_rsvg_handle_has_subFn = extern(C) gboolean function(RsvgHandle* handle, const(char)* id) nothrow;
__gshared c_rsvg_handle_has_subFn c_rsvg_handle_has_sub; ///
private alias c_rsvg_handle_internal_set_testingFn = extern(C) void function(RsvgHandle* handle, gboolean testing) nothrow;
__gshared c_rsvg_handle_internal_set_testingFn c_rsvg_handle_internal_set_testing; ///
private alias c_rsvg_handle_read_stream_syncFn = extern(C) gboolean function(RsvgHandle* handle, GInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_rsvg_handle_read_stream_syncFn c_rsvg_handle_read_stream_sync; ///
private alias c_rsvg_handle_render_cairoFn = extern(C) gboolean function(RsvgHandle* handle, cairo_t* cr) nothrow;
__gshared c_rsvg_handle_render_cairoFn c_rsvg_handle_render_cairo; ///
private alias c_rsvg_handle_render_cairo_subFn = extern(C) gboolean function(RsvgHandle* handle, cairo_t* cr, const(char)* id) nothrow;
__gshared c_rsvg_handle_render_cairo_subFn c_rsvg_handle_render_cairo_sub; ///
private alias c_rsvg_handle_render_documentFn = extern(C) gboolean function(RsvgHandle* handle, cairo_t* cr, const(RsvgRectangle)* viewport, GError** _err) nothrow;
__gshared c_rsvg_handle_render_documentFn c_rsvg_handle_render_document; ///
private alias c_rsvg_handle_render_elementFn = extern(C) gboolean function(RsvgHandle* handle, cairo_t* cr, const(char)* id, const(RsvgRectangle)* elementViewport, GError** _err) nothrow;
__gshared c_rsvg_handle_render_elementFn c_rsvg_handle_render_element; ///
private alias c_rsvg_handle_render_layerFn = extern(C) gboolean function(RsvgHandle* handle, cairo_t* cr, const(char)* id, const(RsvgRectangle)* viewport, GError** _err) nothrow;
__gshared c_rsvg_handle_render_layerFn c_rsvg_handle_render_layer; ///
private alias c_rsvg_handle_set_base_gfileFn = extern(C) void function(RsvgHandle* handle, GFile* baseFile) nothrow;
__gshared c_rsvg_handle_set_base_gfileFn c_rsvg_handle_set_base_gfile; ///
private alias c_rsvg_handle_set_base_uriFn = extern(C) void function(RsvgHandle* handle, const(char)* baseUri) nothrow;
__gshared c_rsvg_handle_set_base_uriFn c_rsvg_handle_set_base_uri; ///
private alias c_rsvg_handle_set_cancellable_for_renderingFn = extern(C) void function(RsvgHandle* handle, GCancellable* cancellable) nothrow;
__gshared c_rsvg_handle_set_cancellable_for_renderingFn c_rsvg_handle_set_cancellable_for_rendering; ///
private alias c_rsvg_handle_set_dpiFn = extern(C) void function(RsvgHandle* handle, double dpi) nothrow;
__gshared c_rsvg_handle_set_dpiFn c_rsvg_handle_set_dpi; ///
private alias c_rsvg_handle_set_dpi_x_yFn = extern(C) void function(RsvgHandle* handle, double dpiX, double dpiY) nothrow;
__gshared c_rsvg_handle_set_dpi_x_yFn c_rsvg_handle_set_dpi_x_y; ///
private alias c_rsvg_handle_set_size_callbackFn = extern(C) void function(RsvgHandle* handle, RsvgSizeFunc sizeFunc, void* userData, GDestroyNotify userDataDestroy) nothrow;
__gshared c_rsvg_handle_set_size_callbackFn c_rsvg_handle_set_size_callback; ///
private alias c_rsvg_handle_set_stylesheetFn = extern(C) gboolean function(RsvgHandle* handle, const(ubyte)* css, size_t cssLen, GError** _err) nothrow;
__gshared c_rsvg_handle_set_stylesheetFn c_rsvg_handle_set_stylesheet; ///
private alias c_rsvg_handle_writeFn = extern(C) gboolean function(RsvgHandle* handle, const(ubyte)* buf, size_t count, GError** _err) nothrow;
__gshared c_rsvg_handle_writeFn c_rsvg_handle_write; ///

// global
private alias c_rsvg_cleanupFn = extern(C) void function() nothrow;
__gshared c_rsvg_cleanupFn c_rsvg_cleanup; ///
private alias c_rsvg_initFn = extern(C) void function() nothrow;
__gshared c_rsvg_initFn c_rsvg_init; ///
private alias c_rsvg_pixbuf_from_fileFn = extern(C) GdkPixbuf* function(const(char)* filename, GError** _err) nothrow;
__gshared c_rsvg_pixbuf_from_fileFn c_rsvg_pixbuf_from_file; ///
private alias c_rsvg_pixbuf_from_file_at_max_sizeFn = extern(C) GdkPixbuf* function(const(char)* filename, int maxWidth, int maxHeight, GError** _err) nothrow;
__gshared c_rsvg_pixbuf_from_file_at_max_sizeFn c_rsvg_pixbuf_from_file_at_max_size; ///
private alias c_rsvg_pixbuf_from_file_at_sizeFn = extern(C) GdkPixbuf* function(const(char)* filename, int width, int height, GError** _err) nothrow;
__gshared c_rsvg_pixbuf_from_file_at_sizeFn c_rsvg_pixbuf_from_file_at_size; ///
private alias c_rsvg_pixbuf_from_file_at_zoomFn = extern(C) GdkPixbuf* function(const(char)* filename, double xZoom, double yZoom, GError** _err) nothrow;
__gshared c_rsvg_pixbuf_from_file_at_zoomFn c_rsvg_pixbuf_from_file_at_zoom; ///
private alias c_rsvg_pixbuf_from_file_at_zoom_with_maxFn = extern(C) GdkPixbuf* function(const(char)* filename, double xZoom, double yZoom, int maxWidth, int maxHeight, GError** _err) nothrow;
__gshared c_rsvg_pixbuf_from_file_at_zoom_with_maxFn c_rsvg_pixbuf_from_file_at_zoom_with_max; ///
private alias c_rsvg_set_default_dpiFn = extern(C) void function(double dpi) nothrow;
__gshared c_rsvg_set_default_dpiFn c_rsvg_set_default_dpi; ///
private alias c_rsvg_set_default_dpi_x_yFn = extern(C) void function(double dpiX, double dpiY) nothrow;
__gshared c_rsvg_set_default_dpi_x_yFn c_rsvg_set_default_dpi_x_y; ///
private alias c_rsvg_termFn = extern(C) void function() nothrow;
__gshared c_rsvg_termFn c_rsvg_term; ///

// Error
private alias c_rsvg_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_rsvg_error_quarkFn c_rsvg_error_quark; ///

// Handle

/** */
alias rsvg_handle_get_type = c_rsvg_handle_get_type;

/** */
alias rsvg_handle_new = c_rsvg_handle_new;

/** */
alias rsvg_handle_new_from_data = c_rsvg_handle_new_from_data;

/** */
alias rsvg_handle_new_from_file = c_rsvg_handle_new_from_file;

/** */
alias rsvg_handle_new_from_gfile_sync = c_rsvg_handle_new_from_gfile_sync;

/** */
alias rsvg_handle_new_from_stream_sync = c_rsvg_handle_new_from_stream_sync;

/** */
alias rsvg_handle_new_with_flags = c_rsvg_handle_new_with_flags;

/** */
alias rsvg_handle_close = c_rsvg_handle_close;

/** */
alias rsvg_handle_free = c_rsvg_handle_free;

/** */
alias rsvg_handle_get_base_uri = c_rsvg_handle_get_base_uri;

/** */
alias rsvg_handle_get_desc = c_rsvg_handle_get_desc;

/** */
alias rsvg_handle_get_dimensions = c_rsvg_handle_get_dimensions;

/** */
alias rsvg_handle_get_dimensions_sub = c_rsvg_handle_get_dimensions_sub;

/** */
alias rsvg_handle_get_geometry_for_element = c_rsvg_handle_get_geometry_for_element;

/** */
alias rsvg_handle_get_geometry_for_layer = c_rsvg_handle_get_geometry_for_layer;

/** */
alias rsvg_handle_get_intrinsic_dimensions = c_rsvg_handle_get_intrinsic_dimensions;

/** */
alias rsvg_handle_get_intrinsic_size_in_pixels = c_rsvg_handle_get_intrinsic_size_in_pixels;

/** */
alias rsvg_handle_get_metadata = c_rsvg_handle_get_metadata;

/** */
alias rsvg_handle_get_pixbuf = c_rsvg_handle_get_pixbuf;

/** */
alias rsvg_handle_get_pixbuf_and_error = c_rsvg_handle_get_pixbuf_and_error;

/** */
alias rsvg_handle_get_pixbuf_sub = c_rsvg_handle_get_pixbuf_sub;

/** */
alias rsvg_handle_get_position_sub = c_rsvg_handle_get_position_sub;

/** */
alias rsvg_handle_get_title = c_rsvg_handle_get_title;

/** */
alias rsvg_handle_has_sub = c_rsvg_handle_has_sub;

/** */
alias rsvg_handle_internal_set_testing = c_rsvg_handle_internal_set_testing;

/** */
alias rsvg_handle_read_stream_sync = c_rsvg_handle_read_stream_sync;

/** */
alias rsvg_handle_render_cairo = c_rsvg_handle_render_cairo;

/** */
alias rsvg_handle_render_cairo_sub = c_rsvg_handle_render_cairo_sub;

/** */
alias rsvg_handle_render_document = c_rsvg_handle_render_document;

/** */
alias rsvg_handle_render_element = c_rsvg_handle_render_element;

/** */
alias rsvg_handle_render_layer = c_rsvg_handle_render_layer;

/** */
alias rsvg_handle_set_base_gfile = c_rsvg_handle_set_base_gfile;

/** */
alias rsvg_handle_set_base_uri = c_rsvg_handle_set_base_uri;

/** */
alias rsvg_handle_set_cancellable_for_rendering = c_rsvg_handle_set_cancellable_for_rendering;

/** */
alias rsvg_handle_set_dpi = c_rsvg_handle_set_dpi;

/** */
alias rsvg_handle_set_dpi_x_y = c_rsvg_handle_set_dpi_x_y;

/** */
alias rsvg_handle_set_size_callback = c_rsvg_handle_set_size_callback;

/** */
alias rsvg_handle_set_stylesheet = c_rsvg_handle_set_stylesheet;

/** */
alias rsvg_handle_write = c_rsvg_handle_write;

// global

/** */
alias rsvg_cleanup = c_rsvg_cleanup;

/** */
alias rsvg_init = c_rsvg_init;

/** */
alias rsvg_pixbuf_from_file = c_rsvg_pixbuf_from_file;

/** */
alias rsvg_pixbuf_from_file_at_max_size = c_rsvg_pixbuf_from_file_at_max_size;

/** */
alias rsvg_pixbuf_from_file_at_size = c_rsvg_pixbuf_from_file_at_size;

/** */
alias rsvg_pixbuf_from_file_at_zoom = c_rsvg_pixbuf_from_file_at_zoom;

/** */
alias rsvg_pixbuf_from_file_at_zoom_with_max = c_rsvg_pixbuf_from_file_at_zoom_with_max;

/** */
alias rsvg_set_default_dpi = c_rsvg_set_default_dpi;

/** */
alias rsvg_set_default_dpi_x_y = c_rsvg_set_default_dpi_x_y;

/** */
alias rsvg_term = c_rsvg_term;

// Error

/** */
alias rsvg_error_quark = c_rsvg_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.rsvg2");

  // Handle
  gidLink(cast(void**)&rsvg_handle_get_type, "rsvg_handle_get_type", libs);
  gidLink(cast(void**)&rsvg_handle_new, "rsvg_handle_new", libs);
  gidLink(cast(void**)&rsvg_handle_new_from_data, "rsvg_handle_new_from_data", libs);
  gidLink(cast(void**)&rsvg_handle_new_from_file, "rsvg_handle_new_from_file", libs);
  gidLink(cast(void**)&rsvg_handle_new_from_gfile_sync, "rsvg_handle_new_from_gfile_sync", libs);
  gidLink(cast(void**)&rsvg_handle_new_from_stream_sync, "rsvg_handle_new_from_stream_sync", libs);
  gidLink(cast(void**)&rsvg_handle_new_with_flags, "rsvg_handle_new_with_flags", libs);
  gidLink(cast(void**)&rsvg_handle_close, "rsvg_handle_close", libs);
  gidLink(cast(void**)&rsvg_handle_free, "rsvg_handle_free", libs);
  gidLink(cast(void**)&rsvg_handle_get_base_uri, "rsvg_handle_get_base_uri", libs);
  gidLink(cast(void**)&rsvg_handle_get_desc, "rsvg_handle_get_desc", libs);
  gidLink(cast(void**)&rsvg_handle_get_dimensions, "rsvg_handle_get_dimensions", libs);
  gidLink(cast(void**)&rsvg_handle_get_dimensions_sub, "rsvg_handle_get_dimensions_sub", libs);
  gidLink(cast(void**)&rsvg_handle_get_geometry_for_element, "rsvg_handle_get_geometry_for_element", libs);
  gidLink(cast(void**)&rsvg_handle_get_geometry_for_layer, "rsvg_handle_get_geometry_for_layer", libs);
  gidLink(cast(void**)&rsvg_handle_get_intrinsic_dimensions, "rsvg_handle_get_intrinsic_dimensions", libs);
  gidLink(cast(void**)&rsvg_handle_get_intrinsic_size_in_pixels, "rsvg_handle_get_intrinsic_size_in_pixels", libs);
  gidLink(cast(void**)&rsvg_handle_get_metadata, "rsvg_handle_get_metadata", libs);
  gidLink(cast(void**)&rsvg_handle_get_pixbuf, "rsvg_handle_get_pixbuf", libs);
  gidLink(cast(void**)&rsvg_handle_get_pixbuf_and_error, "rsvg_handle_get_pixbuf_and_error", libs);
  gidLink(cast(void**)&rsvg_handle_get_pixbuf_sub, "rsvg_handle_get_pixbuf_sub", libs);
  gidLink(cast(void**)&rsvg_handle_get_position_sub, "rsvg_handle_get_position_sub", libs);
  gidLink(cast(void**)&rsvg_handle_get_title, "rsvg_handle_get_title", libs);
  gidLink(cast(void**)&rsvg_handle_has_sub, "rsvg_handle_has_sub", libs);
  gidLink(cast(void**)&rsvg_handle_internal_set_testing, "rsvg_handle_internal_set_testing", libs);
  gidLink(cast(void**)&rsvg_handle_read_stream_sync, "rsvg_handle_read_stream_sync", libs);
  gidLink(cast(void**)&rsvg_handle_render_cairo, "rsvg_handle_render_cairo", libs);
  gidLink(cast(void**)&rsvg_handle_render_cairo_sub, "rsvg_handle_render_cairo_sub", libs);
  gidLink(cast(void**)&rsvg_handle_render_document, "rsvg_handle_render_document", libs);
  gidLink(cast(void**)&rsvg_handle_render_element, "rsvg_handle_render_element", libs);
  gidLink(cast(void**)&rsvg_handle_render_layer, "rsvg_handle_render_layer", libs);
  gidLink(cast(void**)&rsvg_handle_set_base_gfile, "rsvg_handle_set_base_gfile", libs);
  gidLink(cast(void**)&rsvg_handle_set_base_uri, "rsvg_handle_set_base_uri", libs);
  gidLink(cast(void**)&rsvg_handle_set_cancellable_for_rendering, "rsvg_handle_set_cancellable_for_rendering", libs);
  gidLink(cast(void**)&rsvg_handle_set_dpi, "rsvg_handle_set_dpi", libs);
  gidLink(cast(void**)&rsvg_handle_set_dpi_x_y, "rsvg_handle_set_dpi_x_y", libs);
  gidLink(cast(void**)&rsvg_handle_set_size_callback, "rsvg_handle_set_size_callback", libs);
  gidLink(cast(void**)&rsvg_handle_set_stylesheet, "rsvg_handle_set_stylesheet", libs);
  gidLink(cast(void**)&rsvg_handle_write, "rsvg_handle_write", libs);

  // global
  gidLink(cast(void**)&rsvg_cleanup, "rsvg_cleanup", libs);
  gidLink(cast(void**)&rsvg_init, "rsvg_init", libs);
  gidLink(cast(void**)&rsvg_pixbuf_from_file, "rsvg_pixbuf_from_file", libs);
  gidLink(cast(void**)&rsvg_pixbuf_from_file_at_max_size, "rsvg_pixbuf_from_file_at_max_size", libs);
  gidLink(cast(void**)&rsvg_pixbuf_from_file_at_size, "rsvg_pixbuf_from_file_at_size", libs);
  gidLink(cast(void**)&rsvg_pixbuf_from_file_at_zoom, "rsvg_pixbuf_from_file_at_zoom", libs);
  gidLink(cast(void**)&rsvg_pixbuf_from_file_at_zoom_with_max, "rsvg_pixbuf_from_file_at_zoom_with_max", libs);
  gidLink(cast(void**)&rsvg_set_default_dpi, "rsvg_set_default_dpi", libs);
  gidLink(cast(void**)&rsvg_set_default_dpi_x_y, "rsvg_set_default_dpi_x_y", libs);
  gidLink(cast(void**)&rsvg_term, "rsvg_term", libs);

  // Error
  gidLink(cast(void**)&rsvg_error_quark, "rsvg_error_quark", libs);
}
