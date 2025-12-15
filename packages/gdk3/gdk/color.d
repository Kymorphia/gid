/// Module for [Color] class
module gdk.color;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    A #GdkColor is used to describe a color,
    similar to the XColor struct used in the X11 drawing API.

    Deprecated: Use #GdkRGBA
*/
class Color : gobject.boxed.Boxed
{

  /**
      Create a `color.Color` boxed type.
      Params:
        pixel = For allocated colors, the pixel value used to
              draw this color on the screen. Not used anymore.
        red = The red component of the color. This is
              a value between 0 and 65535, with 65535 indicating
              full intensity
        green = The green component of the color
        blue = The blue component of the color
  */
  this(uint pixel = uint.init, ushort red = ushort.init, ushort green = ushort.init, ushort blue = ushort.init)
  {
    super(gMalloc(GdkColor.sizeof), Yes.Take);
    this.pixel = pixel;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_color_get_type != &gidSymbolNotFound ? gdk_color_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Color self()
  {
    return this;
  }

  /**
      Get `pixel` field.
      Returns: For allocated colors, the pixel value used to
          draw this color on the screen. Not used anymore.
  */
  @property uint pixel()
  {
    return (cast(GdkColor*)this._cPtr).pixel;
  }

  /**
      Set `pixel` field.
      Params:
        propval = For allocated colors, the pixel value used to
            draw this color on the screen. Not used anymore.
  */
  @property void pixel(uint propval)
  {
    (cast(GdkColor*)this._cPtr).pixel = propval;
  }

  /**
      Get `red` field.
      Returns: The red component of the color. This is
          a value between 0 and 65535, with 65535 indicating
          full intensity
  */
  @property ushort red()
  {
    return (cast(GdkColor*)this._cPtr).red;
  }

  /**
      Set `red` field.
      Params:
        propval = The red component of the color. This is
            a value between 0 and 65535, with 65535 indicating
            full intensity
  */
  @property void red(ushort propval)
  {
    (cast(GdkColor*)this._cPtr).red = propval;
  }

  /**
      Get `green` field.
      Returns: The green component of the color
  */
  @property ushort green()
  {
    return (cast(GdkColor*)this._cPtr).green;
  }

  /**
      Set `green` field.
      Params:
        propval = The green component of the color
  */
  @property void green(ushort propval)
  {
    (cast(GdkColor*)this._cPtr).green = propval;
  }

  /**
      Get `blue` field.
      Returns: The blue component of the color
  */
  @property ushort blue()
  {
    return (cast(GdkColor*)this._cPtr).blue;
  }

  /**
      Set `blue` field.
      Params:
        propval = The blue component of the color
  */
  @property void blue(ushort propval)
  {
    (cast(GdkColor*)this._cPtr).blue = propval;
  }

  /**
      Makes a copy of a #GdkColor.
      
      The result must be freed using [gdk.color.Color.free].
      Returns: a copy of color
  
      Deprecated: Use #GdkRGBA
  */
  gdk.color.Color copy()
  {
    GdkColor* _cretval;
    _cretval = gdk_color_copy(cast(const(GdkColor)*)this._cPtr);
    auto _retval = _cretval ? new gdk.color.Color(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two colors.
  
      Params:
        colorb = another #GdkColor
      Returns: true if the two colors compare equal
  
      Deprecated: Use #GdkRGBA
  */
  bool equal(gdk.color.Color colorb)
  {
    bool _retval;
    _retval = cast(bool)gdk_color_equal(cast(const(GdkColor)*)this._cPtr, colorb ? cast(const(GdkColor)*)colorb._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A hash function suitable for using for a hash
      table that stores #GdkColors.
      Returns: The hash function applied to color
  
      Deprecated: Use #GdkRGBA
  */
  uint hash()
  {
    uint _retval;
    _retval = gdk_color_hash(cast(const(GdkColor)*)this._cPtr);
    return _retval;
  }

  /**
      Returns a textual specification of color in the hexadecimal
      form “\#rrrrggggbbbb” where “r”, “g” and “b” are hex digits
      representing the red, green and blue components respectively.
      
      The returned string can be parsed by [gdk.color.Color.parse].
      Returns: a newly-allocated text string
  
      Deprecated: Use #GdkRGBA
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gdk_color_to_string(cast(const(GdkColor)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
  static bool parse(string spec, out gdk.color.Color color)
  {
    bool _retval;
    const(char)* _spec = spec.toCString(No.Alloc);
    GdkColor _color;
    _retval = cast(bool)gdk_color_parse(_spec, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.Take);
    return _retval;
  }
}
