/// Module for [SymbolicColor] class
module gtk.symbolic_color;

import gdk.rgba;
import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_properties;
import gtk.types;

/**
    GtkSymbolicColor is a boxed type that represents a symbolic color.
    It is the result of parsing a
    [color expression][gtkcssprovider-symbolic-colors].
    To obtain the color represented by a GtkSymbolicColor, it has to
    be resolved with [gtk.symbolic_color.SymbolicColor.resolve], which replaces all
    symbolic color references by the colors they refer to (in a given
    context) and evaluates mix, shade and other expressions, resulting
    in a #GdkRGBA value.
    
    It is not normally necessary to deal directly with #GtkSymbolicColors,
    since they are mostly used behind the scenes by #GtkStyleContext and
    #GtkCssProvider.
    
    #GtkSymbolicColor is deprecated. Symbolic colors are considered an
    implementation detail of GTK+.
*/
class SymbolicColor : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_symbolic_color_get_type != &gidSymbolNotFound ? gtk_symbolic_color_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SymbolicColor self()
  {
    return this;
  }

  /**
      Creates a symbolic color by modifying the relative alpha
      value of color. A factor < 1.0 would resolve to a more
      transparent color, while > 1.0 would resolve to a more
      opaque color.
  
      Params:
        color = another #GtkSymbolicColor
        factor = factor to apply to color alpha
      Returns: A newly created #GtkSymbolicColor
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  static gtk.symbolic_color.SymbolicColor newAlpha(gtk.symbolic_color.SymbolicColor color, double factor)
  {
    GtkSymbolicColor* _cretval;
    _cretval = gtk_symbolic_color_new_alpha(color ? cast(GtkSymbolicColor*)color._cPtr(No.Dup) : null, factor);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a symbolic color pointing to a literal color.
  
      Params:
        color = a #GdkRGBA
      Returns: a newly created #GtkSymbolicColor
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  static gtk.symbolic_color.SymbolicColor newLiteral(gdk.rgba.RGBA color)
  {
    GtkSymbolicColor* _cretval;
    _cretval = gtk_symbolic_color_new_literal(cast(const(GdkRGBA)*)&color);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a symbolic color defined as a mix of another
      two colors. a mix factor of 0 would resolve to color1,
      while a factor of 1 would resolve to color2.
  
      Params:
        color1 = color to mix
        color2 = another color to mix
        factor = mix factor
      Returns: A newly created #GtkSymbolicColor
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  static gtk.symbolic_color.SymbolicColor newMix(gtk.symbolic_color.SymbolicColor color1, gtk.symbolic_color.SymbolicColor color2, double factor)
  {
    GtkSymbolicColor* _cretval;
    _cretval = gtk_symbolic_color_new_mix(color1 ? cast(GtkSymbolicColor*)color1._cPtr(No.Dup) : null, color2 ? cast(GtkSymbolicColor*)color2._cPtr(No.Dup) : null, factor);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a symbolic color pointing to an unresolved named
      color. See [gtk.style_context.StyleContext.lookupColor] and
      [gtk.style_properties.StyleProperties.lookupColor].
  
      Params:
        name = color name
      Returns: a newly created #GtkSymbolicColor
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  static gtk.symbolic_color.SymbolicColor newName(string name)
  {
    GtkSymbolicColor* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_symbolic_color_new_name(_name);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a symbolic color defined as a shade of
      another color. A factor > 1.0 would resolve to
      a brighter color, while < 1.0 would resolve to
      a darker color.
  
      Params:
        color = another #GtkSymbolicColor
        factor = shading factor to apply to color
      Returns: A newly created #GtkSymbolicColor
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  static gtk.symbolic_color.SymbolicColor newShade(gtk.symbolic_color.SymbolicColor color, double factor)
  {
    GtkSymbolicColor* _cretval;
    _cretval = gtk_symbolic_color_new_shade(color ? cast(GtkSymbolicColor*)color._cPtr(No.Dup) : null, factor);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a symbolic color based on the current win32
      theme.
      
      Note that while this call is available on all platforms
      the actual value returned is not reliable on non-win32
      platforms.
  
      Params:
        themeClass = The theme class to pull color from
        id = The color id
      Returns: A newly created #GtkSymbolicColor
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  static gtk.symbolic_color.SymbolicColor newWin32(string themeClass, int id)
  {
    GtkSymbolicColor* _cretval;
    const(char)* _themeClass = themeClass.toCString(No.Alloc);
    _cretval = gtk_symbolic_color_new_win32(_themeClass, id);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      If color is resolvable, resolved_color will be filled in
      with the resolved color, and true will be returned. Generally,
      if color can’t be resolved, it is due to it being defined on
      top of a named color that doesn’t exist in props.
      
      When props is null, resolving of named colors will fail, so if
      your color is or references such a color, this function will
      return false.
  
      Params:
        props = #GtkStyleProperties to use when resolving
             named colors, or null
        resolvedColor = return location for the resolved color
      Returns: true if the color has been resolved
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  bool resolve(gtk.style_properties.StyleProperties props, out gdk.rgba.RGBA resolvedColor)
  {
    bool _retval;
    _retval = cast(bool)gtk_symbolic_color_resolve(cast(GtkSymbolicColor*)this._cPtr, props ? cast(GtkStyleProperties*)props._cPtr(No.Dup) : null, cast(GdkRGBA*)&resolvedColor);
    return _retval;
  }

  /**
      Converts the given color to a string representation. This is useful
      both for debugging and for serialization of strings. The format of
      the string may change between different versions of GTK, but it is
      guaranteed that the GTK css parser is able to read the string and
      create the same symbolic color from it.
      Returns: a new string representing color
  
      Deprecated: #GtkSymbolicColor is deprecated.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_symbolic_color_to_string(cast(GtkSymbolicColor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
