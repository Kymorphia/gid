/// Module for [RGBA] class
module gdk.rgba;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

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
class RGBA : gobject.boxed.Boxed
{

  /**
      Create a `rgba.RGBA` boxed type.
      Params:
        red = The intensity of the red channel from 0.0 to 1.0 inclusive
        green = The intensity of the green channel from 0.0 to 1.0 inclusive
        blue = The intensity of the blue channel from 0.0 to 1.0 inclusive
        alpha = The opacity of the color from 0.0 for completely translucent to
            1.0 for opaque
  */
  this(float red = 0.0, float green = 0.0, float blue = 0.0, float alpha = 0.0)
  {
    super(gMalloc(GdkRGBA.sizeof), Yes.Take);
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.alpha = alpha;
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
    return cast(void function())gdk_rgba_get_type != &gidSymbolNotFound ? gdk_rgba_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RGBA self()
  {
    return this;
  }

  /**
      Get `red` field.
      Returns: The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  @property float red()
  {
    return (cast(GdkRGBA*)this._cPtr).red;
  }

  /**
      Set `red` field.
      Params:
        propval = The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  @property void red(float propval)
  {
    (cast(GdkRGBA*)this._cPtr).red = propval;
  }

  /**
      Get `green` field.
      Returns: The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  @property float green()
  {
    return (cast(GdkRGBA*)this._cPtr).green;
  }

  /**
      Set `green` field.
      Params:
        propval = The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  @property void green(float propval)
  {
    (cast(GdkRGBA*)this._cPtr).green = propval;
  }

  /**
      Get `blue` field.
      Returns: The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  @property float blue()
  {
    return (cast(GdkRGBA*)this._cPtr).blue;
  }

  /**
      Set `blue` field.
      Params:
        propval = The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  @property void blue(float propval)
  {
    (cast(GdkRGBA*)this._cPtr).blue = propval;
  }

  /**
      Get `alpha` field.
      Returns: The opacity of the color from 0.0 for completely translucent to
        1.0 for opaque
  */
  @property float alpha()
  {
    return (cast(GdkRGBA*)this._cPtr).alpha;
  }

  /**
      Set `alpha` field.
      Params:
        propval = The opacity of the color from 0.0 for completely translucent to
          1.0 for opaque
  */
  @property void alpha(float propval)
  {
    (cast(GdkRGBA*)this._cPtr).alpha = propval;
  }

  /**
      Makes a copy of a [gdk.rgba.RGBA].
      
      The result must be freed through [gdk.rgba.RGBA.free].
      Returns: A newly allocated [gdk.rgba.RGBA], with the same contents as rgba
  */
  gdk.rgba.RGBA copy()
  {
    GdkRGBA* _cretval;
    _cretval = gdk_rgba_copy(cast(const(GdkRGBA)*)this._cPtr);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, Yes.Take) : null;
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
    _retval = cast(bool)gdk_rgba_equal(cast(GdkRGBA*)this._cPtr, p2 ? cast(GdkRGBA*)p2._cPtr(No.Dup) : null);
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
    _retval = gdk_rgba_hash(cast(GdkRGBA*)this._cPtr);
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
    _retval = cast(bool)gdk_rgba_is_clear(cast(const(GdkRGBA)*)this._cPtr);
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
    _retval = cast(bool)gdk_rgba_is_opaque(cast(const(GdkRGBA)*)this._cPtr);
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
    _retval = cast(bool)gdk_rgba_parse(cast(GdkRGBA*)this._cPtr, _spec);
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
    _cretval = gdk_rgba_to_string(cast(const(GdkRGBA)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
