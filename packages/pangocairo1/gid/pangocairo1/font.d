/// Module for [Font] interface
module gid.pangocairo1.font;

public import gid.core.basictypes;
public import gid.pangocairo1.font_iface_proxy;
import gid.cairo1.scaled_font;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.pangocairo1.c.functions;
import gid.pangocairo1.c.types;
import gid.pangocairo1.types;

/**
    [gid.pangocairo1.font.Font] is an interface exported by fonts for
    use with Cairo.
    
    The actual type of the font will depend on the particular
    font technology Cairo was compiled to use.
*/
interface Font : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())pango_cairo_font_get_type != &gidSymbolNotFound ? pango_cairo_font_get_type() : cast(GType)0;
  }

  /**
      Gets the [gid.cairo1.scaled_font.ScaledFont] used by font.
      The scaled font can be referenced and kept using
      [gid.cairo1.scaled_font.ScaledFont.reference].
      Returns: the [gid.cairo1.scaled_font.ScaledFont]
          used by font
  */
  gid.cairo1.scaled_font.ScaledFont getScaledFont();
}

/// Fluent builder implementation template for [gid.pangocairo1.font.Font]
interface FontGidBuilderImpl(T)
{
}
