/// C types for pangocairo1 library
module pangocairo.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import pango.c.types;
public import cairo.c.types;

/**
    [pangocairo.font.Font] is an interface exported by fonts for
    use with Cairo.
    
    The actual type of the font will depend on the particular
    font technology Cairo was compiled to use.
*/
struct PangoCairoFont;

/**
    [pangocairo.font_map.FontMap] is an interface exported by font maps for
    use with Cairo.
    
    The actual type of the font map will depend on the particular
    font technology Cairo was compiled to use.
*/
struct PangoCairoFontMap;

alias extern(C) void function(cairo_t* cr, PangoAttrShape* attr, gboolean doPath, void* data) PangoCairoShapeRendererFunc;

