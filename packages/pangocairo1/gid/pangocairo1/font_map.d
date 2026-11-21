/// Module for [FontMap] interface
module gid.pangocairo1.font_map;

public import gid.core.basictypes;
public import gid.pangocairo1.font_map_iface_proxy;
import gid.cairo1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.font_map;
import gid.pangocairo1.c.functions;
import gid.pangocairo1.c.types;
import gid.pangocairo1.types;

/**
    [gid.pangocairo1.font_map.FontMap] is an interface exported by font maps for
    use with Cairo.
    
    The actual type of the font map will depend on the particular
    font technology Cairo was compiled to use.
*/
interface FontMap : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())pango_cairo_font_map_get_type != &gidSymbolNotFound ? pango_cairo_font_map_get_type() : cast(GType)0;
  }

  /**
      Gets a default [gid.pangocairo1.font_map.FontMap] to use with Cairo.
      
      Note that the type of the returned object will depend on the
      particular font backend Cairo was compiled to use; you generally
      should only use the [gid.pango1.font_map.FontMap] and [gid.pangocairo1.font_map.FontMap]
      interfaces on the returned object.
      
      The default Cairo fontmap can be changed by using
      [gid.pangocairo1.font_map.FontMap.setDefault]. This can be used to
      change the Cairo font backend that the default fontmap uses
      for example.
      
      Note that since Pango 1.32.6, the default fontmap is per-thread.
      Each thread gets its own default fontmap. In this way, PangoCairo
      can be used safely from multiple threads.
      Returns: the default PangoCairo fontmap
         for the current thread. This object is owned by Pango and must
         not be freed.
  */
  static gid.pango1.font_map.FontMap getDefault() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = pango_cairo_font_map_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.pangocairo1.font_map.FontMap] object.
      
      A fontmap is used to cache information about available fonts,
      and holds certain global parameters such as the resolution.
      In most cases, you can use `funcPangoCairo.font_map_get_default]
      instead.
      
      Note that the type of the returned object will depend
      on the particular font backend Cairo was compiled to use;
      You generally should only use the [gid.pango1.font_map.FontMap] and
      [gid.pangocairo1.font_map.FontMap] interfaces on the returned object.
      
      You can override the type of backend returned by using an
      environment variable `PANGOCAIRO_BACKEND`. Supported types,
      based on your build, are fc (fontconfig), win32, and coretext.
      If requested type is not available, NULL is returned. Ie.
      this is only useful for testing, when at least two backends
      are compiled in.
      Returns: the newly allocated [gid.pango1.font_map.FontMap],
          which should be freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  static gid.pango1.font_map.FontMap new_() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = pango_cairo_font_map_new();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gid.pangocairo1.font_map.FontMap] object of the type suitable
      to be used with cairo font backend of type fonttype.
      
      In most cases one should simply use [gid.pangocairo1.font_map.FontMap.new_], or
      in fact in most of those cases, just use [gid.pangocairo1.font_map.FontMap.getDefault].
  
      Params:
        fonttype = desired #cairo_font_type_t
      Returns: the newly allocated
          [gid.pango1.font_map.FontMap] of suitable type which should be freed with
          [gid.gobject2.object.ObjectWrap.unref], or null if the requested cairo font backend
          is not supported / compiled in.
  */
  static gid.pango1.font_map.FontMap newForFontType(gid.cairo1.types.FontType fonttype) nothrow
  {
    PangoFontMap* _cretval;
    _cretval = pango_cairo_font_map_new_for_font_type(fonttype);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the type of Cairo font backend that fontmap uses.
      Returns: the [gid.cairo1.types.FontType] cairo font backend type
  */
  gid.cairo1.types.FontType getFontType();

  /**
      Gets the resolution for the fontmap.
      
      See [gid.pangocairo1.font_map.FontMap.setResolution].
      Returns: the resolution in "dots per inch"
  */
  double getResolution();

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
  void setDefault();

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
  void setResolution(double dpi);
}

/// Fluent builder implementation template for [gid.pangocairo1.font_map.FontMap]
interface FontMapGidBuilderImpl(T)
{
}
