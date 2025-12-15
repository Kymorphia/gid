/// C functions for rsvg2 library
module rsvg.c.functions;

public import gid.basictypes;
import gid.loader;
import rsvg.c.types;
public import glib.c.types;
public import gobject.c.types;
public import gdkpixbuf.c.types;
public import gio.c.types;
public import cairo.c.types;

version(Windows)
  private immutable LIBS = ["librsvg-2-2.dll;rsvg-2-2.dll;rsvg-2.dll"];
else version(OSX)
  private immutable LIBS = ["librsvg-2.2.dylib"];
else
  private immutable LIBS = ["librsvg-2.so.2"];

__gshared extern(C)
{
  // Handle
  GType function() c_rsvg_handle_get_type; ///
  RsvgHandle* function() c_rsvg_handle_new; ///
  RsvgHandle* function(const(ubyte)* data, size_t dataLen, GError** _err) c_rsvg_handle_new_from_data; ///
  RsvgHandle* function(const(char)* filename, GError** _err) c_rsvg_handle_new_from_file; ///
  RsvgHandle* function(GFile* file, RsvgHandleFlags flags, GCancellable* cancellable, GError** _err) c_rsvg_handle_new_from_gfile_sync; ///
  RsvgHandle* function(GInputStream* inputStream, GFile* baseFile, RsvgHandleFlags flags, GCancellable* cancellable, GError** _err) c_rsvg_handle_new_from_stream_sync; ///
  RsvgHandle* function(RsvgHandleFlags flags) c_rsvg_handle_new_with_flags; ///
  gboolean function(RsvgHandle* handle, GError** _err) c_rsvg_handle_close; ///
  void function(RsvgHandle* handle) c_rsvg_handle_free; ///
  const(char)* function(RsvgHandle* handle) c_rsvg_handle_get_base_uri; ///
  const(char)* function(RsvgHandle* handle) c_rsvg_handle_get_desc; ///
  void function(RsvgHandle* handle, RsvgDimensionData* dimensionData) c_rsvg_handle_get_dimensions; ///
  gboolean function(RsvgHandle* handle, RsvgDimensionData* dimensionData, const(char)* id) c_rsvg_handle_get_dimensions_sub; ///
  gboolean function(RsvgHandle* handle, const(char)* id, RsvgRectangle* outInkRect, RsvgRectangle* outLogicalRect, GError** _err) c_rsvg_handle_get_geometry_for_element; ///
  gboolean function(RsvgHandle* handle, const(char)* id, const(RsvgRectangle)* viewport, RsvgRectangle* outInkRect, RsvgRectangle* outLogicalRect, GError** _err) c_rsvg_handle_get_geometry_for_layer; ///
  void function(RsvgHandle* handle, gboolean* outHasWidth, RsvgLength* outWidth, gboolean* outHasHeight, RsvgLength* outHeight, gboolean* outHasViewbox, RsvgRectangle* outViewbox) c_rsvg_handle_get_intrinsic_dimensions; ///
  gboolean function(RsvgHandle* handle, double* outWidth, double* outHeight) c_rsvg_handle_get_intrinsic_size_in_pixels; ///
  const(char)* function(RsvgHandle* handle) c_rsvg_handle_get_metadata; ///
  GdkPixbuf* function(RsvgHandle* handle) c_rsvg_handle_get_pixbuf; ///
  GdkPixbuf* function(RsvgHandle* handle, const(char)* id) c_rsvg_handle_get_pixbuf_sub; ///
  gboolean function(RsvgHandle* handle, RsvgPositionData* positionData, const(char)* id) c_rsvg_handle_get_position_sub; ///
  const(char)* function(RsvgHandle* handle) c_rsvg_handle_get_title; ///
  gboolean function(RsvgHandle* handle, const(char)* id) c_rsvg_handle_has_sub; ///
  void function(RsvgHandle* handle, gboolean testing) c_rsvg_handle_internal_set_testing; ///
  gboolean function(RsvgHandle* handle, GInputStream* stream, GCancellable* cancellable, GError** _err) c_rsvg_handle_read_stream_sync; ///
  gboolean function(RsvgHandle* handle, cairo_t* cr) c_rsvg_handle_render_cairo; ///
  gboolean function(RsvgHandle* handle, cairo_t* cr, const(char)* id) c_rsvg_handle_render_cairo_sub; ///
  gboolean function(RsvgHandle* handle, cairo_t* cr, const(RsvgRectangle)* viewport, GError** _err) c_rsvg_handle_render_document; ///
  gboolean function(RsvgHandle* handle, cairo_t* cr, const(char)* id, const(RsvgRectangle)* elementViewport, GError** _err) c_rsvg_handle_render_element; ///
  gboolean function(RsvgHandle* handle, cairo_t* cr, const(char)* id, const(RsvgRectangle)* viewport, GError** _err) c_rsvg_handle_render_layer; ///
  void function(RsvgHandle* handle, GFile* baseFile) c_rsvg_handle_set_base_gfile; ///
  void function(RsvgHandle* handle, const(char)* baseUri) c_rsvg_handle_set_base_uri; ///
  void function(RsvgHandle* handle, double dpi) c_rsvg_handle_set_dpi; ///
  void function(RsvgHandle* handle, double dpiX, double dpiY) c_rsvg_handle_set_dpi_x_y; ///
  void function(RsvgHandle* handle, RsvgSizeFunc sizeFunc, void* userData, GDestroyNotify userDataDestroy) c_rsvg_handle_set_size_callback; ///
  gboolean function(RsvgHandle* handle, const(ubyte)* css, size_t cssLen, GError** _err) c_rsvg_handle_set_stylesheet; ///
  gboolean function(RsvgHandle* handle, const(ubyte)* buf, size_t count, GError** _err) c_rsvg_handle_write; ///

  // global
  void function() c_rsvg_cleanup; ///
  void function() c_rsvg_init; ///
  GdkPixbuf* function(const(char)* filename, GError** _err) c_rsvg_pixbuf_from_file; ///
  GdkPixbuf* function(const(char)* filename, int maxWidth, int maxHeight, GError** _err) c_rsvg_pixbuf_from_file_at_max_size; ///
  GdkPixbuf* function(const(char)* filename, int width, int height, GError** _err) c_rsvg_pixbuf_from_file_at_size; ///
  GdkPixbuf* function(const(char)* filename, double xZoom, double yZoom, GError** _err) c_rsvg_pixbuf_from_file_at_zoom; ///
  GdkPixbuf* function(const(char)* filename, double xZoom, double yZoom, int maxWidth, int maxHeight, GError** _err) c_rsvg_pixbuf_from_file_at_zoom_with_max; ///
  void function(double dpi) c_rsvg_set_default_dpi; ///
  void function(double dpiX, double dpiY) c_rsvg_set_default_dpi_x_y; ///
  void function() c_rsvg_term; ///

  // Error
  GQuark function() c_rsvg_error_quark; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
