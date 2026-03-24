/// Module for [FontMap] interface
module pangocairo.font_map;

public import pangocairo.font_map_iface_proxy;
import cairo.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import pango.font_map;
import pangocairo.c.functions;
import pangocairo.c.types;
import pangocairo.types;

/**
    [pangocairo.font_map.FontMap] is an interface exported by font maps for
    use with Cairo.
    
    The actual type of the font map will depend on the particular
    font technology Cairo was compiled to use.
*/
interface FontMap
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_cairo_font_map_get_type != &gidSymbolNotFound ? pango_cairo_font_map_get_type() : cast(GType)0;
  }

  /**
      Gets a default [pangocairo.font_map.FontMap] to use with Cairo.
      
      Note that the type of the returned object will depend on the
      particular font backend Cairo was compiled to use; you generally
      should only use the [pango.font_map.FontMap] and [pangocairo.font_map.FontMap]
      interfaces on the returned object.
      
      The default Cairo fontmap can be changed by using
      [pangocairo.font_map.FontMap.setDefault]. This can be used to
      change the Cairo font backend that the default fontmap uses
      for example.
      
      Note that since Pango 1.32.6, the default fontmap is per-thread.
      Each thread gets its own default fontmap. In this way, PangoCairo
      can be used safely from multiple threads.
      Returns: the default PangoCairo fontmap
         for the current thread. This object is owned by Pango and must
         not be freed.
  */
  static pango.font_map.FontMap getDefault()
  {
    PangoFontMap* _cretval;
    _cretval = pango_cairo_font_map_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [pangocairo.font_map.FontMap] object.
      
      A fontmap is used to cache information about available fonts,
      and holds certain global parameters such as the resolution.
      In most cases, you can use `funcPangoCairo.font_map_get_default]
      instead.
      
      Note that the type of the returned object will depend
      on the particular font backend Cairo was compiled to use;
      You generally should only use the [pango.font_map.FontMap] and
      [pangocairo.font_map.FontMap] interfaces on the returned object.
      
      You can override the type of backend returned by using an
      environment variable `PANGOCAIRO_BACKEND`. Supported types,
      based on your build, are fc (fontconfig), win32, and coretext.
      If requested type is not available, NULL is returned. Ie.
      this is only useful for testing, when at least two backends
      are compiled in.
      Returns: the newly allocated [pango.font_map.FontMap],
          which should be freed with [gobject.object.ObjectWrap.unref].
  */
  static pango.font_map.FontMap new_()
  {
    PangoFontMap* _cretval;
    _cretval = pango_cairo_font_map_new();
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [pangocairo.font_map.FontMap] object of the type suitable
      to be used with cairo font backend of type fonttype.
      
      In most cases one should simply use [pangocairo.font_map.FontMap.new_], or
      in fact in most of those cases, just use [pangocairo.font_map.FontMap.getDefault].
  
      Params:
        fonttype = desired #cairo_font_type_t
      Returns: the newly allocated
          [pango.font_map.FontMap] of suitable type which should be freed with
          [gobject.object.ObjectWrap.unref], or null if the requested cairo font backend
          is not supported / compiled in.
  */
  static pango.font_map.FontMap newForFontType(cairo.types.FontType fonttype)
  {
    PangoFontMap* _cretval;
    _cretval = pango_cairo_font_map_new_for_font_type(fonttype);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the type of Cairo font backend that fontmap uses.
      Returns: the [cairo.types.FontType] cairo font backend type
  */
  cairo.types.FontType getFontType();

  /**
      Gets the resolution for the fontmap.
      
      See [pangocairo.font_map.FontMap.setResolution].
      Returns: the resolution in "dots per inch"
  */
  double getResolution();

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
  void setDefault();

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
  void setResolution(double dpi);
}

interface FontMapGidBuilderImpl(T)
{
}
