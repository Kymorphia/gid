/// Module for [AccentColor] enum namespace
module gid.adw1.accent_color;

import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
import gid.gdk4.rgba;

/// Namespace for [AccentColor] enum
struct AccentColor
{
  alias Enum = gid.adw1.types.AccentColor; ///

  /**
      Converts self to a [gid.gdk4.rgba.RGBA] representing its background color.
      
      The matching foreground color is white.
  
      Params:
        self = an accent color
        rgba = return location for the color
  */
  static void toRgba(gid.adw1.types.AccentColor self, out gid.gdk4.rgba.RGBA rgba) nothrow
  {
    adw_accent_color_to_rgba(self, cast(GdkRGBA*)&rgba);
  }

  /**
      Converts self to a [gid.gdk4.rgba.RGBA] representing its standalone color.
      
      It will typically be darker for light background, and lighter for dark
      background, ensuring contrast.
  
      Params:
        self = an accent color
        dark = Whether to calculate standalone color for light or dark background
        rgba = return location for the color
  */
  static void toStandaloneRgba(gid.adw1.types.AccentColor self, bool dark, out gid.gdk4.rgba.RGBA rgba) nothrow
  {
    adw_accent_color_to_standalone_rgba(self, dark, cast(GdkRGBA*)&rgba);
  }
}
