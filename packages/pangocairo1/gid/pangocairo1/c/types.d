/// C types for pangocairo1 library
module gid.pangocairo1.c.types;

public import gid.core.basictypes;
public import gid.gobject2.c.types;
public import gid.pango1.c.types;
public import gid.cairo1.c.types;

/**
    [gid.pangocairo1.font.Font] is an interface exported by fonts for
    use with Cairo.
    
    The actual type of the font will depend on the particular
    font technology Cairo was compiled to use.
*/
struct PangoCairoFont;

/**
    [gid.pangocairo1.font_map.FontMap] is an interface exported by font maps for
    use with Cairo.
    
    The actual type of the font map will depend on the particular
    font technology Cairo was compiled to use.
*/
struct PangoCairoFontMap;

alias extern(C) void function(cairo_t* cr, PangoAttrShape* attr, gboolean doPath, void* data) PangoCairoShapeRendererFunc;

