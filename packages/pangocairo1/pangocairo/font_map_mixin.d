/// Module for [FontMap] interface mixin
module pangocairo.font_map_mixin;

public import pangocairo.font_map_iface_proxy;
public import cairo.types;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;
public import pango.font_map;
public import pangocairo.c.functions;
public import pangocairo.c.types;
public import pangocairo.types;

/**
    [pangocairo.font_map.FontMap] is an interface exported by font maps for
    use with Cairo.
    
    The actual type of the font map will depend on the particular
    font technology Cairo was compiled to use.
*/
template FontMapT()
{




  /**
      Gets the type of Cairo font backend that fontmap uses.
      Returns: the [cairo.types.FontType] cairo font backend type
  */
  override cairo.types.FontType getFontType()
  {
    cairo_font_type_t _cretval;
    _cretval = pango_cairo_font_map_get_font_type(cast(PangoCairoFontMap*)this._cPtr);
    cairo.types.FontType _retval = cast(cairo.types.FontType)_cretval;
    return _retval;
  }

  /**
      Gets the resolution for the fontmap.
      
      See [pangocairo.font_map.FontMap.setResolution].
      Returns: the resolution in "dots per inch"
  */
  override double getResolution()
  {
    double _retval;
    _retval = pango_cairo_font_map_get_resolution(cast(PangoCairoFontMap*)this._cPtr);
    return _retval;
  }

  /**
      Sets a default [pangocairo.font_map.FontMap] to use with Cairo.
      
      This can be used to change the Cairo font backend that the
      default fontmap uses for example. The old default font map
      is unreffed and the new font map referenced.
      
      Note that since Pango 1.32.6, the default fontmap is per-thread.
      This function only changes the default fontmap for
      the current thread. Default fontmaps of existing threads
      are not changed. Default fontmaps of any new threads will
      still be created using [pangocairo.font_map.FontMap.new_].
      
      A value of null for fontmap will cause the current default
      font map to be released and a new default font map to be created
      on demand, using [pangocairo.font_map.FontMap.new_].
  */
  override void setDefault()
  {
    pango_cairo_font_map_set_default(cast(PangoCairoFontMap*)this._cPtr);
  }

  /**
      Sets the resolution for the fontmap.
      
      This is a scale factor between
      points specified in a [pango.font_description.FontDescription] and Cairo units. The
      default value is 96, meaning that a 10 point font will be 13
      units high. (10 * 96. / 72. = 13.3).
  
      Params:
        dpi = the resolution in "dots per inch". (Physical inches aren't actually
            involved; the terminology is conventional.)
  */
  override void setResolution(double dpi)
  {
    pango_cairo_font_map_set_resolution(cast(PangoCairoFontMap*)this._cPtr, dpi);
  }
}

template FontMapGidBuilderT()
{
}
