/// C functions for pangocairo1 library
module pangocairo.c.functions;

public import gid.basictypes;
import gid.loader;
import pangocairo.c.types;
public import gobject.c.types;
public import pango.c.types;
public import cairo.c.types;

version(Windows)
  private immutable LIBS = ["libpangocairo-1.0-0.dll;pangocairo-1.0-0.dll;pangocairo-1.dll"];
else version(OSX)
  private immutable LIBS = ["libpangocairo-1.0.0.dylib"];
else
  private immutable LIBS = ["libpangocairo-1.0.so.0"];

__gshared extern(C) nothrow
{
  // Font
  GType function() c_pango_cairo_font_get_type; ///
  cairo_scaled_font_t* function(PangoCairoFont* font) c_pango_cairo_font_get_scaled_font; ///

  // FontMap
  GType function() c_pango_cairo_font_map_get_type; ///
  PangoFontMap* function() c_pango_cairo_font_map_get_default; ///
  PangoFontMap* function() c_pango_cairo_font_map_new; ///
  PangoFontMap* function(cairo_font_type_t fonttype) c_pango_cairo_font_map_new_for_font_type; ///
  PangoContext* function(PangoCairoFontMap* fontmap) c_pango_cairo_font_map_create_context; ///
  cairo_font_type_t function(PangoCairoFontMap* fontmap) c_pango_cairo_font_map_get_font_type; ///
  double function(PangoCairoFontMap* fontmap) c_pango_cairo_font_map_get_resolution; ///
  void function(PangoCairoFontMap* fontmap) c_pango_cairo_font_map_set_default; ///
  void function(PangoCairoFontMap* fontmap, double dpi) c_pango_cairo_font_map_set_resolution; ///

  // global
  const(cairo_font_options_t)* function(PangoContext* context) c_pango_cairo_context_get_font_options; ///
  double function(PangoContext* context) c_pango_cairo_context_get_resolution; ///
  PangoCairoShapeRendererFunc function(PangoContext* context, void** data) c_pango_cairo_context_get_shape_renderer; ///
  void function(PangoContext* context, const(cairo_font_options_t)* options) c_pango_cairo_context_set_font_options; ///
  void function(PangoContext* context, double dpi) c_pango_cairo_context_set_resolution; ///
  void function(PangoContext* context, PangoCairoShapeRendererFunc func, void* data, GDestroyNotify dnotify) c_pango_cairo_context_set_shape_renderer; ///
  PangoContext* function(cairo_t* cr) c_pango_cairo_create_context; ///
  PangoLayout* function(cairo_t* cr) c_pango_cairo_create_layout; ///
  void function(cairo_t* cr, double x, double y, double width, double height) c_pango_cairo_error_underline_path; ///
  void function(cairo_t* cr, PangoFont* font, PangoGlyphString* glyphs) c_pango_cairo_glyph_string_path; ///
  void function(cairo_t* cr, PangoLayoutLine* line) c_pango_cairo_layout_line_path; ///
  void function(cairo_t* cr, PangoLayout* layout) c_pango_cairo_layout_path; ///
  void function(cairo_t* cr, double x, double y, double width, double height) c_pango_cairo_show_error_underline; ///
  void function(cairo_t* cr, const(char)* text, PangoGlyphItem* glyphItem) c_pango_cairo_show_glyph_item; ///
  void function(cairo_t* cr, PangoFont* font, PangoGlyphString* glyphs) c_pango_cairo_show_glyph_string; ///
  void function(cairo_t* cr, PangoLayout* layout) c_pango_cairo_show_layout; ///
  void function(cairo_t* cr, PangoLayoutLine* line) c_pango_cairo_show_layout_line; ///
  void function(cairo_t* cr, PangoContext* context) c_pango_cairo_update_context; ///
  void function(cairo_t* cr, PangoLayout* layout) c_pango_cairo_update_layout; ///
}

// Font

/** */
alias pango_cairo_font_get_type = c_pango_cairo_font_get_type;

/** */
alias pango_cairo_font_get_scaled_font = c_pango_cairo_font_get_scaled_font;

// FontMap

/** */
alias pango_cairo_font_map_get_type = c_pango_cairo_font_map_get_type;

/** */
alias pango_cairo_font_map_get_default = c_pango_cairo_font_map_get_default;

/** */
alias pango_cairo_font_map_new = c_pango_cairo_font_map_new;

/** */
alias pango_cairo_font_map_new_for_font_type = c_pango_cairo_font_map_new_for_font_type;

/** */
alias pango_cairo_font_map_create_context = c_pango_cairo_font_map_create_context;

/** */
alias pango_cairo_font_map_get_font_type = c_pango_cairo_font_map_get_font_type;

/** */
alias pango_cairo_font_map_get_resolution = c_pango_cairo_font_map_get_resolution;

/** */
alias pango_cairo_font_map_set_default = c_pango_cairo_font_map_set_default;

/** */
alias pango_cairo_font_map_set_resolution = c_pango_cairo_font_map_set_resolution;

// global

/** */
alias pango_cairo_context_get_font_options = c_pango_cairo_context_get_font_options;

/** */
alias pango_cairo_context_get_resolution = c_pango_cairo_context_get_resolution;

/** */
alias pango_cairo_context_get_shape_renderer = c_pango_cairo_context_get_shape_renderer;

/** */
alias pango_cairo_context_set_font_options = c_pango_cairo_context_set_font_options;

/** */
alias pango_cairo_context_set_resolution = c_pango_cairo_context_set_resolution;

/** */
alias pango_cairo_context_set_shape_renderer = c_pango_cairo_context_set_shape_renderer;

/** */
alias pango_cairo_create_context = c_pango_cairo_create_context;

/** */
alias pango_cairo_create_layout = c_pango_cairo_create_layout;

/** */
alias pango_cairo_error_underline_path = c_pango_cairo_error_underline_path;

/** */
alias pango_cairo_glyph_string_path = c_pango_cairo_glyph_string_path;

/** */
alias pango_cairo_layout_line_path = c_pango_cairo_layout_line_path;

/** */
alias pango_cairo_layout_path = c_pango_cairo_layout_path;

/** */
alias pango_cairo_show_error_underline = c_pango_cairo_show_error_underline;

/** */
alias pango_cairo_show_glyph_item = c_pango_cairo_show_glyph_item;

/** */
alias pango_cairo_show_glyph_string = c_pango_cairo_show_glyph_string;

/** */
alias pango_cairo_show_layout = c_pango_cairo_show_layout;

/** */
alias pango_cairo_show_layout_line = c_pango_cairo_show_layout_line;

/** */
alias pango_cairo_update_context = c_pango_cairo_update_context;

/** */
alias pango_cairo_update_layout = c_pango_cairo_update_layout;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Font
  gidLink(cast(void**)&pango_cairo_font_get_type, "pango_cairo_font_get_type", libs);
  gidLink(cast(void**)&pango_cairo_font_get_scaled_font, "pango_cairo_font_get_scaled_font", libs);

  // FontMap
  gidLink(cast(void**)&pango_cairo_font_map_get_type, "pango_cairo_font_map_get_type", libs);
  gidLink(cast(void**)&pango_cairo_font_map_get_default, "pango_cairo_font_map_get_default", libs);
  gidLink(cast(void**)&pango_cairo_font_map_new, "pango_cairo_font_map_new", libs);
  gidLink(cast(void**)&pango_cairo_font_map_new_for_font_type, "pango_cairo_font_map_new_for_font_type", libs);
  gidLink(cast(void**)&pango_cairo_font_map_create_context, "pango_cairo_font_map_create_context", libs);
  gidLink(cast(void**)&pango_cairo_font_map_get_font_type, "pango_cairo_font_map_get_font_type", libs);
  gidLink(cast(void**)&pango_cairo_font_map_get_resolution, "pango_cairo_font_map_get_resolution", libs);
  gidLink(cast(void**)&pango_cairo_font_map_set_default, "pango_cairo_font_map_set_default", libs);
  gidLink(cast(void**)&pango_cairo_font_map_set_resolution, "pango_cairo_font_map_set_resolution", libs);

  // global
  gidLink(cast(void**)&pango_cairo_context_get_font_options, "pango_cairo_context_get_font_options", libs);
  gidLink(cast(void**)&pango_cairo_context_get_resolution, "pango_cairo_context_get_resolution", libs);
  gidLink(cast(void**)&pango_cairo_context_get_shape_renderer, "pango_cairo_context_get_shape_renderer", libs);
  gidLink(cast(void**)&pango_cairo_context_set_font_options, "pango_cairo_context_set_font_options", libs);
  gidLink(cast(void**)&pango_cairo_context_set_resolution, "pango_cairo_context_set_resolution", libs);
  gidLink(cast(void**)&pango_cairo_context_set_shape_renderer, "pango_cairo_context_set_shape_renderer", libs);
  gidLink(cast(void**)&pango_cairo_create_context, "pango_cairo_create_context", libs);
  gidLink(cast(void**)&pango_cairo_create_layout, "pango_cairo_create_layout", libs);
  gidLink(cast(void**)&pango_cairo_error_underline_path, "pango_cairo_error_underline_path", libs);
  gidLink(cast(void**)&pango_cairo_glyph_string_path, "pango_cairo_glyph_string_path", libs);
  gidLink(cast(void**)&pango_cairo_layout_line_path, "pango_cairo_layout_line_path", libs);
  gidLink(cast(void**)&pango_cairo_layout_path, "pango_cairo_layout_path", libs);
  gidLink(cast(void**)&pango_cairo_show_error_underline, "pango_cairo_show_error_underline", libs);
  gidLink(cast(void**)&pango_cairo_show_glyph_item, "pango_cairo_show_glyph_item", libs);
  gidLink(cast(void**)&pango_cairo_show_glyph_string, "pango_cairo_show_glyph_string", libs);
  gidLink(cast(void**)&pango_cairo_show_layout, "pango_cairo_show_layout", libs);
  gidLink(cast(void**)&pango_cairo_show_layout_line, "pango_cairo_show_layout_line", libs);
  gidLink(cast(void**)&pango_cairo_update_context, "pango_cairo_update_context", libs);
  gidLink(cast(void**)&pango_cairo_update_layout, "pango_cairo_update_layout", libs);
}
