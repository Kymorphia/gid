/// Module for [Color] struct
module gid.gdk3.color;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;

/**
    A #GdkColor is used to describe a color,
    similar to the XColor struct used in the X11 drawing API.

    Deprecated: Use #GdkRGBA
*/
struct Color
{
  /**
      For allocated colors, the pixel value used to
          draw this color on the screen. Not used anymore.
  */
  uint pixel;

  /**
      The red component of the color. This is
          a value between 0 and 65535, with 65535 indicating
          full intensity
  */
  ushort red;

  /**
      The green component of the color
  */
  ushort green;

  /**
      The blue component of the color
  */
  ushort blue;

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_color_get_type != &gidSymbolNotFound ? gdk_color_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }

  /**
      Makes a copy of a #GdkColor.
      
      The result must be freed using [gid.gdk3.color.Color.free].
      Returns: a copy of color
  
      Deprecated: Use #GdkRGBA
  */
  gid.gdk3.color.Color copy() nothrow
  {
    GdkColor* _cretval;
    _cretval = gdk_color_copy(cast(const(GdkColor)*)&this);
    gid.gdk3.color.Color _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gdk3.color.Color*)_cretval;
      cValueFree!(gid.gdk3.color.Color)(_cretval);
    }
    return _retval;
  }

  /**
      Compares two colors.
  
      Params:
        colorb = another #GdkColor
      Returns: true if the two colors compare equal
  
      Deprecated: Use #GdkRGBA
  */
  bool equal(gid.gdk3.color.Color colorb) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_color_equal(cast(const(GdkColor)*)&this, cast(const(GdkColor)*)&colorb);
    return _retval;
  }

  /**
      A hash function suitable for using for a hash
      table that stores #GdkColors.
      Returns: The hash function applied to color
  
      Deprecated: Use #GdkRGBA
  */
  uint hash() nothrow
  {
    uint _retval;
    _retval = gdk_color_hash(cast(const(GdkColor)*)&this);
    return _retval;
  }

  /**
      Returns a textual specification of color in the hexadecimal
      form “\#rrrrggggbbbb” where “r”, “g” and “b” are hex digits
      representing the red, green and blue components respectively.
      
      The returned string can be parsed by [gid.gdk3.color.Color.parse].
      Returns: a newly-allocated text string
  
      Deprecated: Use #GdkRGBA
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gdk_color_to_string(cast(const(GdkColor)*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Parses a textual specification of a color and fill in the
      red, green, and blue fields of a #GdkColor.
      
      The string can either one of a large set of standard names
      (taken from the X11 `rgb.txt` file), or it can be a hexadecimal
      value in the form “\#rgb” “\#rrggbb”, “\#rrrgggbbb” or
      “\#rrrrggggbbbb” where “r”, “g” and “b” are hex digits of
      the red, green, and blue components of the color, respectively.
      (White in the four forms is “\#fff”, “\#ffffff”, “\#fffffffff”
      and “\#ffffffffffff”).
  
      Params:
        spec = the string specifying the color
        color = the #GdkColor to fill in
      Returns: true if the parsing succeeded
  
      Deprecated: Use #GdkRGBA
  */
  static bool parse(string spec, out gid.gdk3.color.Color color) nothrow
  {
    bool _retval;
    const(char)* _spec = spec.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gdk_color_parse(_spec, cast(GdkColor*)&color);
    return _retval;
  }
}
