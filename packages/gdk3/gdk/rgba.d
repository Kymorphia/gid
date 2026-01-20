/// Module for [RGBA] struct
module gdk.rgba;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/**
    A #GdkRGBA is used to represent a (possibly translucent)
    color, in a way that is compatible with cairo’s notion of color.
*/
struct RGBA
{
  /**
      The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  double red;

  /**
      The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  double green;

  /**
      The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  double blue;

  /**
      The opacity of the color from 0.0 for completely translucent to
        1.0 for opaque
  */
  double alpha;

  /**
      Makes a copy of a #GdkRGBA.
      
      The result must be freed through [gdk.rgba.RGBA.free].
      Returns: A newly allocated #GdkRGBA, with the same contents as rgba
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
      Compares two RGBA colors.
  
      Params:
        p2 = another #GdkRGBA pointer
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
      table that stores #GdkRGBAs.
      Returns: The hash value for `p`
  */
  uint hash()
  {
    uint _retval;
    _retval = gdk_rgba_hash(cast(GdkRGBA*)&this);
    return _retval;
  }

  /**
      Parses a textual representation of a color, filling in
      the red, green, blue and alpha fields of the rgba #GdkRGBA.
      
      The string can be either one of:
      $(LIST
        * A standard name (Taken from the X11 rgb.txt file).
        * A hexadecimal value in the form “\#rgb”, “\#rrggbb”,
          “\#rrrgggbbb” or ”\#rrrrggggbbbb”
        * A RGB color in the form “rgb(r,g,b)” (In this case the color will
          have full opacity)
        * A RGBA color in the form “rgba(r,g,b,a)”
      )
        
      Where “r”, “g”, “b” and “a” are respectively the red, green, blue and
      alpha color values. In the last two cases, “r”, “g”, and “b” are either integers
      in the range 0 to 255 or percentage values in the range 0% to 100%, and
      a is a floating point value in the range 0 to 1.
  
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
      `rgb(r,g,b)` or
      `rgba(r g,b,a)`,
      where “r”, “g”, “b” and “a” represent the red, green,
      blue and alpha values respectively. “r”, “g”, and “b” are
      represented as integers in the range 0 to 255, and “a”
      is represented as a floating point value in the range 0 to 1.
      
      These string forms are string forms that are supported by
      the CSS3 colors module, and can be parsed by [gdk.rgba.RGBA.parse].
      
      Note that this string representation may lose some
      precision, since “r”, “g” and “b” are represented as 8-bit
      integers. If this is a concern, you should use a
      different representation.
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
