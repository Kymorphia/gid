/// C functions for pangocairo1 library
module gid.pangocairo1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.pangocairo1.c.types;
static import gid.pangocairo1.c._gidlib_PangoCairo;
public import gid.cairo1.c.types;
public import gid.gobject2.c.types;
public import gid.pango1.c.types;

private immutable LIBS = ["pangocairo-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.pangocairo1.c._gidlib_PangoCairo.gidLibLinked;

// Font
private alias c_pango_cairo_font_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_cairo_font_get_typeFn c_pango_cairo_font_get_type; ///
private alias c_pango_cairo_font_get_scaled_fontFn = extern(C) cairo_scaled_font_t* function(PangoCairoFont* font) nothrow;
__gshared c_pango_cairo_font_get_scaled_fontFn c_pango_cairo_font_get_scaled_font; ///

// FontMap
private alias c_pango_cairo_font_map_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_cairo_font_map_get_typeFn c_pango_cairo_font_map_get_type; ///
private alias c_pango_cairo_font_map_get_defaultFn = extern(C) PangoFontMap* function() nothrow;
__gshared c_pango_cairo_font_map_get_defaultFn c_pango_cairo_font_map_get_default; ///
private alias c_pango_cairo_font_map_newFn = extern(C) PangoFontMap* function() nothrow;
__gshared c_pango_cairo_font_map_newFn c_pango_cairo_font_map_new; ///
private alias c_pango_cairo_font_map_new_for_font_typeFn = extern(C) PangoFontMap* function(cairo_font_type_t fonttype) nothrow;
__gshared c_pango_cairo_font_map_new_for_font_typeFn c_pango_cairo_font_map_new_for_font_type; ///
private alias c_pango_cairo_font_map_create_contextFn = extern(C) PangoContext* function(PangoCairoFontMap* fontmap) nothrow;
__gshared c_pango_cairo_font_map_create_contextFn c_pango_cairo_font_map_create_context; ///
private alias c_pango_cairo_font_map_get_font_typeFn = extern(C) cairo_font_type_t function(PangoCairoFontMap* fontmap) nothrow;
__gshared c_pango_cairo_font_map_get_font_typeFn c_pango_cairo_font_map_get_font_type; ///
private alias c_pango_cairo_font_map_get_resolutionFn = extern(C) double function(PangoCairoFontMap* fontmap) nothrow;
__gshared c_pango_cairo_font_map_get_resolutionFn c_pango_cairo_font_map_get_resolution; ///
private alias c_pango_cairo_font_map_set_defaultFn = extern(C) void function(PangoCairoFontMap* fontmap) nothrow;
__gshared c_pango_cairo_font_map_set_defaultFn c_pango_cairo_font_map_set_default; ///
private alias c_pango_cairo_font_map_set_resolutionFn = extern(C) void function(PangoCairoFontMap* fontmap, double dpi) nothrow;
__gshared c_pango_cairo_font_map_set_resolutionFn c_pango_cairo_font_map_set_resolution; ///

// global
private alias c_pango_cairo_context_get_font_optionsFn = extern(C) const(cairo_font_options_t)* function(PangoContext* context) nothrow;
__gshared c_pango_cairo_context_get_font_optionsFn c_pango_cairo_context_get_font_options; ///
private alias c_pango_cairo_context_get_resolutionFn = extern(C) double function(PangoContext* context) nothrow;
__gshared c_pango_cairo_context_get_resolutionFn c_pango_cairo_context_get_resolution; ///
private alias c_pango_cairo_context_get_shape_rendererFn = extern(C) PangoCairoShapeRendererFunc function(PangoContext* context, void** data) nothrow;
__gshared c_pango_cairo_context_get_shape_rendererFn c_pango_cairo_context_get_shape_renderer; ///
private alias c_pango_cairo_context_set_font_optionsFn = extern(C) void function(PangoContext* context, const(cairo_font_options_t)* options) nothrow;
__gshared c_pango_cairo_context_set_font_optionsFn c_pango_cairo_context_set_font_options; ///
private alias c_pango_cairo_context_set_resolutionFn = extern(C) void function(PangoContext* context, double dpi) nothrow;
__gshared c_pango_cairo_context_set_resolutionFn c_pango_cairo_context_set_resolution; ///
private alias c_pango_cairo_context_set_shape_rendererFn = extern(C) void function(PangoContext* context, PangoCairoShapeRendererFunc func, void* data, GDestroyNotify dnotify) nothrow;
__gshared c_pango_cairo_context_set_shape_rendererFn c_pango_cairo_context_set_shape_renderer; ///
private alias c_pango_cairo_create_contextFn = extern(C) PangoContext* function(cairo_t* cr) nothrow;
__gshared c_pango_cairo_create_contextFn c_pango_cairo_create_context; ///
private alias c_pango_cairo_create_layoutFn = extern(C) PangoLayout* function(cairo_t* cr) nothrow;
__gshared c_pango_cairo_create_layoutFn c_pango_cairo_create_layout; ///
private alias c_pango_cairo_error_underline_pathFn = extern(C) void function(cairo_t* cr, double x, double y, double width, double height) nothrow;
__gshared c_pango_cairo_error_underline_pathFn c_pango_cairo_error_underline_path; ///
private alias c_pango_cairo_glyph_string_pathFn = extern(C) void function(cairo_t* cr, PangoFont* font, PangoGlyphString* glyphs) nothrow;
__gshared c_pango_cairo_glyph_string_pathFn c_pango_cairo_glyph_string_path; ///
private alias c_pango_cairo_layout_line_pathFn = extern(C) void function(cairo_t* cr, PangoLayoutLine* line) nothrow;
__gshared c_pango_cairo_layout_line_pathFn c_pango_cairo_layout_line_path; ///
private alias c_pango_cairo_layout_pathFn = extern(C) void function(cairo_t* cr, PangoLayout* layout) nothrow;
__gshared c_pango_cairo_layout_pathFn c_pango_cairo_layout_path; ///
private alias c_pango_cairo_show_error_underlineFn = extern(C) void function(cairo_t* cr, double x, double y, double width, double height) nothrow;
__gshared c_pango_cairo_show_error_underlineFn c_pango_cairo_show_error_underline; ///
private alias c_pango_cairo_show_glyph_itemFn = extern(C) void function(cairo_t* cr, const(char)* text, PangoGlyphItem* glyphItem) nothrow;
__gshared c_pango_cairo_show_glyph_itemFn c_pango_cairo_show_glyph_item; ///
private alias c_pango_cairo_show_glyph_stringFn = extern(C) void function(cairo_t* cr, PangoFont* font, PangoGlyphString* glyphs) nothrow;
__gshared c_pango_cairo_show_glyph_stringFn c_pango_cairo_show_glyph_string; ///
private alias c_pango_cairo_show_layoutFn = extern(C) void function(cairo_t* cr, PangoLayout* layout) nothrow;
__gshared c_pango_cairo_show_layoutFn c_pango_cairo_show_layout; ///
private alias c_pango_cairo_show_layout_lineFn = extern(C) void function(cairo_t* cr, PangoLayoutLine* line) nothrow;
__gshared c_pango_cairo_show_layout_lineFn c_pango_cairo_show_layout_line; ///
private alias c_pango_cairo_update_contextFn = extern(C) void function(cairo_t* cr, PangoContext* context) nothrow;
__gshared c_pango_cairo_update_contextFn c_pango_cairo_update_context; ///
private alias c_pango_cairo_update_layoutFn = extern(C) void function(cairo_t* cr, PangoLayout* layout) nothrow;
__gshared c_pango_cairo_update_layoutFn c_pango_cairo_update_layout; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.pangocairo1", "PangoCairo");

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
