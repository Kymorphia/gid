/// Module for [ColorSelection] class
module gtk.color_selection;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.color;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/** */
class ColorSelection : gtk.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_selection_get_type != &gidSymbolNotFound ? gtk_color_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorSelection self()
  {
    return this;
  }

  /** */
  @property uint currentAlpha()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("current-alpha");
  }

  /** */
  @property void currentAlpha(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("current-alpha", propval);
  }

  /**
      Get `currentColor` property.
      Returns: The current GdkColor color.
  
      Deprecated: Use #GtkColorSelection:current-rgba instead.
  */
  @property gdk.color.Color currentColor()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("current-color");
  }

  /**
      Set `currentColor` property.
      Params:
        propval = The current GdkColor color.
  
      Deprecated: Use #GtkColorSelection:current-rgba instead.
  */
  @property void currentColor(gdk.color.Color propval)
  {
    return setCurrentColor(propval);
  }

  /**
      Get `currentRgba` property.
      Returns: The current RGBA color.
  */
  @property gdk.rgba.RGBA currentRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("current-rgba");
  }

  /**
      Set `currentRgba` property.
      Params:
        propval = The current RGBA color.
  */
  @property void currentRgba(gdk.rgba.RGBA propval)
  {
    return setCurrentRgba(propval);
  }

  /** */
  @property bool hasOpacityControl()
  {
    return getHasOpacityControl();
  }

  /** */
  @property void hasOpacityControl(bool propval)
  {
    return setHasOpacityControl(propval);
  }

  /** */
  @property bool hasPalette()
  {
    return getHasPalette();
  }

  /** */
  @property void hasPalette(bool propval)
  {
    return setHasPalette(propval);
  }

  /**
      Creates a new GtkColorSelection.
      Returns: a new #GtkColorSelection
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_selection_new();
    this(_cretval, No.Take);
  }

  /**
      Parses a color palette string; the string is a colon-separated
      list of color names readable by [gdk.color.Color.parse].
  
      Params:
        str = a string encoding a color palette
        colors = return location for
              allocated array of #GdkColor
      Returns: true if a palette was successfully parsed
  */
  static bool paletteFromString(string str, out gdk.color.Color[] colors)
  {
    bool _retval;
    const(char)* _str = str.toCString(No.Alloc);
    int _nColors;
    GdkColor* _colors;
    _retval = cast(bool)gtk_color_selection_palette_from_string(_str, &_colors, &_nColors);
    colors.length = _nColors;
    foreach (i; 0 .. _nColors)
      colors[i] = new gdk.color.Color(cast(void*)&_colors[i], Yes.Take);
    gFree(cast(void*)_colors);
    return _retval;
  }

  /**
      Encodes a palette as a string, useful for persistent storage.
  
      Params:
        colors = an array of colors
      Returns: allocated string encoding the palette
  */
  static string paletteToString(gdk.color.Color[] colors)
  {
    char* _cretval;
    int _nColors;
    if (colors)
      _nColors = cast(int)colors.length;

    GdkColor[] _tmpcolors;
    foreach (obj; colors)
      _tmpcolors ~= *cast(GdkColor*)obj._cPtr;
    const(GdkColor)* _colors = _tmpcolors.ptr;
    _cretval = gtk_color_selection_palette_to_string(_colors, _nColors);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the current alpha value.
      Returns: an integer between 0 and 65535
  */
  ushort getCurrentAlpha()
  {
    ushort _retval;
    _retval = gtk_color_selection_get_current_alpha(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Sets color to be the current color in the GtkColorSelection widget.
  
      Params:
        color = a #GdkColor to fill in with the current color
  
      Deprecated: Use [gtk.color_selection.ColorSelection.getCurrentRgba] instead.
  */
  void getCurrentColor(out gdk.color.Color color)
  {
    GdkColor _color;
    gtk_color_selection_get_current_color(cast(GtkColorSelection*)this._cPtr, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.Take);
  }

  /**
      Sets rgba to be the current color in the GtkColorSelection widget.
  
      Params:
        rgba = a #GdkRGBA to fill in with the current color
  */
  void getCurrentRgba(out gdk.rgba.RGBA rgba)
  {
    GdkRGBA _rgba;
    gtk_color_selection_get_current_rgba(cast(GtkColorSelection*)this._cPtr, &_rgba);
    rgba = new gdk.rgba.RGBA(cast(void*)&_rgba, No.Take);
  }

  /**
      Determines whether the colorsel has an opacity control.
      Returns: true if the colorsel has an opacity control,
            false if it does't
  */
  bool getHasOpacityControl()
  {
    bool _retval;
    _retval = cast(bool)gtk_color_selection_get_has_opacity_control(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the color selector has a color palette.
      Returns: true if the selector has a palette, false if it hasn't
  */
  bool getHasPalette()
  {
    bool _retval;
    _retval = cast(bool)gtk_color_selection_get_has_palette(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Returns the previous alpha value.
      Returns: an integer between 0 and 65535
  */
  ushort getPreviousAlpha()
  {
    ushort _retval;
    _retval = gtk_color_selection_get_previous_alpha(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Fills color in with the original color value.
  
      Params:
        color = a #GdkColor to fill in with the original color value
  
      Deprecated: Use [gtk.color_selection.ColorSelection.getPreviousRgba] instead.
  */
  void getPreviousColor(out gdk.color.Color color)
  {
    GdkColor _color;
    gtk_color_selection_get_previous_color(cast(GtkColorSelection*)this._cPtr, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.Take);
  }

  /**
      Fills rgba in with the original color value.
  
      Params:
        rgba = a #GdkRGBA to fill in with the original color value
  */
  void getPreviousRgba(out gdk.rgba.RGBA rgba)
  {
    GdkRGBA _rgba;
    gtk_color_selection_get_previous_rgba(cast(GtkColorSelection*)this._cPtr, &_rgba);
    rgba = new gdk.rgba.RGBA(cast(void*)&_rgba, No.Take);
  }

  /**
      Gets the current state of the colorsel.
      Returns: true if the user is currently dragging
            a color around, and false if the selection has stopped
  */
  bool isAdjusting()
  {
    bool _retval;
    _retval = cast(bool)gtk_color_selection_is_adjusting(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Sets the current opacity to be alpha.
      
      The first time this is called, it will also set
      the original opacity to be alpha too.
  
      Params:
        alpha = an integer between 0 and 65535
  */
  void setCurrentAlpha(ushort alpha)
  {
    gtk_color_selection_set_current_alpha(cast(GtkColorSelection*)this._cPtr, alpha);
  }

  /**
      Sets the current color to be color.
      
      The first time this is called, it will also set
      the original color to be color too.
  
      Params:
        color = a #GdkColor to set the current color with
  
      Deprecated: Use [gtk.color_selection.ColorSelection.setCurrentRgba] instead.
  */
  void setCurrentColor(gdk.color.Color color)
  {
    gtk_color_selection_set_current_color(cast(GtkColorSelection*)this._cPtr, color ? cast(const(GdkColor)*)color._cPtr(No.Dup) : null);
  }

  /**
      Sets the current color to be rgba.
      
      The first time this is called, it will also set
      the original color to be rgba too.
  
      Params:
        rgba = A #GdkRGBA to set the current color with
  */
  void setCurrentRgba(gdk.rgba.RGBA rgba)
  {
    gtk_color_selection_set_current_rgba(cast(GtkColorSelection*)this._cPtr, rgba ? cast(const(GdkRGBA)*)rgba._cPtr(No.Dup) : null);
  }

  /**
      Sets the colorsel to use or not use opacity.
  
      Params:
        hasOpacity = true if colorsel can set the opacity, false otherwise
  */
  void setHasOpacityControl(bool hasOpacity)
  {
    gtk_color_selection_set_has_opacity_control(cast(GtkColorSelection*)this._cPtr, hasOpacity);
  }

  /**
      Shows and hides the palette based upon the value of has_palette.
  
      Params:
        hasPalette = true if palette is to be visible, false otherwise
  */
  void setHasPalette(bool hasPalette)
  {
    gtk_color_selection_set_has_palette(cast(GtkColorSelection*)this._cPtr, hasPalette);
  }

  /**
      Sets the “previous” alpha to be alpha.
      
      This function should be called with some hesitations,
      as it might seem confusing to have that alpha change.
  
      Params:
        alpha = an integer between 0 and 65535
  */
  void setPreviousAlpha(ushort alpha)
  {
    gtk_color_selection_set_previous_alpha(cast(GtkColorSelection*)this._cPtr, alpha);
  }

  /**
      Sets the “previous” color to be color.
      
      This function should be called with some hesitations,
      as it might seem confusing to have that color change.
      Calling [gtk.color_selection.ColorSelection.setCurrentColor] will also
      set this color the first time it is called.
  
      Params:
        color = a #GdkColor to set the previous color with
  
      Deprecated: Use [gtk.color_selection.ColorSelection.setPreviousRgba] instead.
  */
  void setPreviousColor(gdk.color.Color color)
  {
    gtk_color_selection_set_previous_color(cast(GtkColorSelection*)this._cPtr, color ? cast(const(GdkColor)*)color._cPtr(No.Dup) : null);
  }

  /**
      Sets the “previous” color to be rgba.
      
      This function should be called with some hesitations,
      as it might seem confusing to have that color change.
      Calling [gtk.color_selection.ColorSelection.setCurrentRgba] will also
      set this color the first time it is called.
  
      Params:
        rgba = a #GdkRGBA to set the previous color with
  */
  void setPreviousRgba(gdk.rgba.RGBA rgba)
  {
    gtk_color_selection_set_previous_rgba(cast(GtkColorSelection*)this._cPtr, rgba ? cast(const(GdkRGBA)*)rgba._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ColorChanged` signal.
  
      This signal is emitted when the color changes in the #GtkColorSelection
      according to its update policy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.color_selection.ColorSelection colorSelection))
  
          `colorSelection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectColorChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.color_selection.ColorSelection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("color-changed", closure, after);
  }
}
