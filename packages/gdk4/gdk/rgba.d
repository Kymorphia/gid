/// Module for [RGBA] struct
module gdk.rgba;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/**
    A [gdk.rgba.RGBA] is used to represent a color, in a way that is compatible
    with cairo’s notion of color.
    
    [gdk.rgba.RGBA] is a convenient way to pass colors around. It’s based on
    cairo’s way to deal with colors and mirrors its behavior. All values
    are in the range from 0.0 to 1.0 inclusive. So the color
    (0.0, 0.0, 0.0, 0.0) represents transparent black and
    (1.0, 1.0, 1.0, 1.0) is opaque white. Other values will
    be clamped to this range when drawing.
*/
struct RGBA
{
  /**
      The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  float red;

  /**
      The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  float green;

  /**
      The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  float blue;

  /**
      The opacity of the color from 0.0 for completely translucent to
        1.0 for opaque
  */
  float alpha;

  /**
      Makes a copy of a [gdk.rgba.RGBA].
      
      The result must be freed through [gdk.rgba.RGBA.free].
      Returns: A newly allocated [gdk.rgba.RGBA], with the same contents as rgba
  */
  gdk.rgba.RGBA copy()
  {
    GdkRGBA* _cretval;
    _cretval = gdk_rgba_copy(cast(const(GdkRGBA)*)&this);
    gdk.rgba.RGBA _retval;
    if (_cretval)
      _retval = *cast(gdk.rgba.RGBA*)_cretval;
    return _retval;
  }

  /**
      Compares two [gdk.rgba.RGBA] colors.
  
      Params:
        p2 = another [gdk.rgba.RGBA]
      Returns: true if the two colors compare equal
  */
  bool equal(gdk.rgba.RGBA p2)
  {
    bool _retval;
    _retval = cast(bool)gdk_rgba_equal(cast(GdkRGBA*)&this, cast(GdkRGBA*)&p2);
    return _retval;
  }

  /**
      A hash function suitable for using for a hash
      table that stores [gdk.rgba.RGBA]s.
      Returns: The hash value for `p`
  */
  uint hash()
  {
    uint _retval;
    _retval = gdk_rgba_hash(cast(GdkRGBA*)&this);
    return _retval;
  }

  /**
      Checks if an rgba value is transparent.
      
      That is, drawing with the value would not produce any change.
      Returns: true if the rgba is clear
  */
  bool isClear()
  {
    bool _retval;
    _retval = cast(bool)gdk_rgba_is_clear(cast(const(GdkRGBA)*)&this);
    return _retval;
  }

  /**
      Checks if an rgba value is opaque.
      
      That is, drawing with the value will not retain any results
      from previous contents.
      Returns: true if the rgba is opaque
  */
  bool isOpaque()
  {
    bool _retval;
    _retval = cast(bool)gdk_rgba_is_opaque(cast(const(GdkRGBA)*)&this);
    return _retval;
  }

  /**
      Parses a textual representation of a color.
      
      The string can be either one of:
      
      $(LIST
        * A standard name (Taken from the CSS specification).
        * A hexadecimal value in the form “\#rgb”, “\#rrggbb”,
          “\#rrrgggbbb” or ”\#rrrrggggbbbb”
        * A hexadecimal value in the form “\#rgba”, “\#rrggbbaa”,
          or ”\#rrrrggggbbbbaaaa”
        * A RGB color in the form “rgb(r,g,b)” (In this case the color
          will have full opacity)
        * A RGBA color in the form “rgba(r,g,b,a)”
        * A HSL color in the form "hsl(hue, saturation, lightness)"
        * A HSLA color in the form "hsla(hue, saturation, lightness, alpha)"
      )
        
      Where “r”, “g”, “b” and “a” are respectively the red, green,
      blue and alpha color values. In the last two cases, “r”, “g”,
      and “b” are either integers in the range 0 to 255 or percentage
      values in the range 0% to 100%, and a is a floating point value
      in the range 0 to 1.
  
      Params:
        spec = the string specifying the color
      Returns: true if the parsing succeeded
  */
  bool parse(string spec)
  {
    bool _retval;
    const(char)* _spec = spec.toCString(No.Alloc);
    _retval = cast(bool)gdk_rgba_parse(cast(GdkRGBA*)&this, _spec);
    return _retval;
  }

  /**
      Returns a textual specification of rgba in the form
      `rgb(r,g,b)` or `rgba(r,g,b,a)`, where “r”, “g”, “b” and
      “a” represent the red, green, blue and alpha values
      respectively. “r”, “g”, and “b” are represented as integers
      in the range 0 to 255, and “a” is represented as a floating
      point value in the range 0 to 1.
      
      These string forms are string forms that are supported by
      the CSS3 colors module, and can be parsed by [gdk.rgba.RGBA.parse].
      
      Note that this string representation may lose some precision,
      since “r”, “g” and “b” are represented as 8-bit integers. If
      this is a concern, you should use a different representation.
      Returns: A newly allocated text string
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gdk_rgba_to_string(cast(const(GdkRGBA)*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
