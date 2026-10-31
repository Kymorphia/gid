/// Module for [AccentColor] enum namespace
module adw.accent_color;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.rgba;
import gid.gid;

/// Namespace for [AccentColor] enum
struct AccentColor
{
  alias Enum = adw.types.AccentColor; ///

  /**
      Converts self to a [gdk.rgba.RGBA] representing its background color.
      
      The matching foreground color is white.
  
      Params:
        self = an accent color
        rgba = return location for the color
  */
  static void toRgba(adw.types.AccentColor self, out gdk.rgba.RGBA rgba) nothrow
  {
    adw_accent_color_to_rgba(self, cast(GdkRGBA*)&rgba);
  }

  /**
      Converts self to a [gdk.rgba.RGBA] representing its standalone color.
      
      It will typically be darker for light background, and lighter for dark
      background, ensuring contrast.
  
      Params:
        self = an accent color
        dark = Whether to calculate standalone color for light or dark background
        rgba = return location for the color
  */
  static void toStandaloneRgba(adw.types.AccentColor self, bool dark, out gdk.rgba.RGBA rgba) nothrow
  {
    adw_accent_color_to_standalone_rgba(self, dark, cast(GdkRGBA*)&rgba);
  }
}
