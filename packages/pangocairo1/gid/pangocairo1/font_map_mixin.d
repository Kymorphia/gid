/// Module for [FontMap] interface mixin
module gid.pangocairo1.font_map_mixin;

public import gid.core.basictypes;
public import gid.pangocairo1.font_map;
public import gid.pangocairo1.font_map_iface_proxy;
public import gid.cairo1.types;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.pango1.font_map;
public import gid.pangocairo1.c.functions;
public import gid.pangocairo1.c.types;
public import gid.pangocairo1.types;

/**
    [gid.pangocairo1.font_map.FontMap] is an interface exported by font maps for
    use with Cairo.
    
    The actual type of the font map will depend on the particular
    font technology Cairo was compiled to use.
*/
template FontMapT()
{




  /**
      Gets the type of Cairo font backend that fontmap uses.
      Returns: the [gid.cairo1.types.FontType] cairo font backend type
  */
  override gid.cairo1.types.FontType getFontType() nothrow
  {
    cairo_font_type_t _cretval;
    _cretval = pango_cairo_font_map_get_font_type(cast(PangoCairoFontMap*)this._cPtr);
    gid.cairo1.types.FontType _retval = cast(gid.cairo1.types.FontType)_cretval;
    return _retval;
  }

  /**
      Gets the resolution for the fontmap.
      
      See [gid.pangocairo1.font_map.FontMap.setResolution].
      Returns: the resolution in "dots per inch"
  */
  override double getResolution() nothrow
  {
    double _retval;
    _retval = pango_cairo_font_map_get_resolution(cast(PangoCairoFontMap*)this._cPtr);
    return _retval;
  }

  /**
      Sets a default [gid.pangocairo1.font_map.FontMap] to use with Cairo.
      
      This can be used to change the Cairo font backend that the
      default fontmap uses for example. The old default font map
      is unreffed and the new font map referenced.
      
      Note that since Pango 1.32.6, the default fontmap is per-thread.
      This function only changes the default fontmap for
      the current thread. Default fontmaps of existing threads
      are not changed. Default fontmaps of any new threads will
      still be created using [gid.pangocairo1.font_map.FontMap.new_].
      
      A value of null for fontmap will cause the current default
      font map to be released and a new default font map to be created
      on demand, using [gid.pangocairo1.font_map.FontMap.new_].
  */
  override void setDefault() nothrow
  {
    pango_cairo_font_map_set_default(cast(PangoCairoFontMap*)this._cPtr);
  }

  /**
      Sets the resolution for the fontmap.
      
      This is a scale factor between
      points specified in a [gid.pango1.font_description.FontDescription] and Cairo units. The
      default value is 96, meaning that a 10 point font will be 13
      units high. (10 * 96. / 72. = 13.3).
  
      Params:
        dpi = the resolution in "dots per inch". (Physical inches aren't actually
            involved; the terminology is conventional.)
  */
  override void setResolution(double dpi) nothrow
  {
    pango_cairo_font_map_set_resolution(cast(PangoCairoFontMap*)this._cPtr, dpi);
  }
}

/// Fluent builder implementation template for [gid.pangocairo1.font_map.FontMap]
template FontMapGidBuilderT()
{
}
