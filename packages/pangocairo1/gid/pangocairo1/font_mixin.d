/// Module for [Font] interface mixin
module gid.pangocairo1.font_mixin;

public import gid.core.basictypes;
public import gid.pangocairo1.font;
public import gid.pangocairo1.font_iface_proxy;
public import gid.cairo1.scaled_font;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.pangocairo1.c.functions;
public import gid.pangocairo1.c.types;
public import gid.pangocairo1.types;

/**
    [gid.pangocairo1.font.Font] is an interface exported by fonts for
    use with Cairo.
    
    The actual type of the font will depend on the particular
    font technology Cairo was compiled to use.
*/
template FontT()
{

  /**
      Gets the [gid.cairo1.scaled_font.ScaledFont] used by font.
      The scaled font can be referenced and kept using
      [gid.cairo1.scaled_font.ScaledFont.reference].
      Returns: the [gid.cairo1.scaled_font.ScaledFont]
          used by font
  */
  override gid.cairo1.scaled_font.ScaledFont getScaledFont() nothrow
  {
    cairo_scaled_font_t* _cretval;
    _cretval = pango_cairo_font_get_scaled_font(cast(PangoCairoFont*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.scaled_font.ScaledFont(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.pangocairo1.font.Font]
template FontGidBuilderT()
{
}
