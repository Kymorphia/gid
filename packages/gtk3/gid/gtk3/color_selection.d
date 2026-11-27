/// Module for [ColorSelection] class
module gid.gtk3.color_selection;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.color;
import gid.gdk3.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

/** */
@gidGir("ColorSelection", "ColorSelectionClass")
class ColorSelection : gid.gtk3.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_selection_get_type != &gidSymbolNotFound ? gtk_color_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColorSelection";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorSelection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.color_selection.ColorSelection]
      Returns: New builder object
  */
  static ColorSelectionGidBuilder builder() nothrow
  {
    return new ColorSelectionGidBuilder;
  }

  /** */
  @property uint currentAlpha() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("current-alpha");
  }

  /** */
  @property void currentAlpha(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("current-alpha", propval);
  }

  /**
      Get `currentColor` property.
      Returns: The current GdkColor color.
  
      Deprecated: Use #GtkColorSelection:current-rgba instead.
  */
  @property gid.gdk3.color.Color currentColor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.color.Color)("current-color");
  }

  /**
      Set `currentColor` property.
      Params:
        propval = The current GdkColor color.
  
      Deprecated: Use #GtkColorSelection:current-rgba instead.
  */
  @property void currentColor(gid.gdk3.color.Color propval) nothrow
  {
    setCurrentColor(propval);
  }

  /**
      Get `currentRgba` property.
      Returns: The current RGBA color.
  */
  @property gid.gdk3.rgba.RGBA currentRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.rgba.RGBA)("current-rgba");
  }

  /**
      Set `currentRgba` property.
      Params:
        propval = The current RGBA color.
  */
  @property void currentRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    setCurrentRgba(propval);
  }

  /** */
  @property bool hasOpacityControl() nothrow
  {
    return getHasOpacityControl();
  }

  /** */
  @property void hasOpacityControl(bool propval) nothrow
  {
    setHasOpacityControl(propval);
  }

  /** */
  @property bool hasPalette() nothrow
  {
    return getHasPalette();
  }

  /** */
  @property void hasPalette(bool propval) nothrow
  {
    setHasPalette(propval);
  }

  /**
      Creates a new GtkColorSelection.
      Returns: a new #GtkColorSelection
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_color_selection_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Parses a color palette string; the string is a colon-separated
      list of color names readable by [gid.gdk3.color.Color.parse].
  
      Params:
        str = a string encoding a color palette
        colors = return location for
              allocated array of #GdkColor
      Returns: true if a palette was successfully parsed
  */
  static bool paletteFromString(string str, out gid.gdk3.color.Color[] colors) nothrow
  {
    bool _retval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    int _nColors;
    GdkColor* _colors;
    _retval = cast(bool)gtk_color_selection_palette_from_string(_str, &_colors, &_nColors);
    colors.length = _nColors;
    colors[0 .. $] = (cast(gid.gdk3.color.Color*)_colors)[0 .. _nColors];
    gFree(cast(void*)_colors);
    return _retval;
  }

  /**
      Encodes a palette as a string, useful for persistent storage.
  
      Params:
        colors = an array of colors
      Returns: allocated string encoding the palette
  */
  static string paletteToString(gid.gdk3.color.Color[] colors) nothrow
  {
    char* _cretval;
    int _nColors;
    if (colors)
      _nColors = cast(int)colors.length;

    auto _colors = cast(GdkColor*)colors.ptr;
    _cretval = gtk_color_selection_palette_to_string(_colors, _nColors);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  protected void vfuncColorChanged()
  {
    auto _klass = cast(GtkColorSelectionClass*)_vfuncClass;
    if (!_klass.colorChanged)
      return;

    _klass.colorChanged(cast(GtkColorSelection*)this._cPtr);
  }

  /**
      Returns the current alpha value.
      Returns: an integer between 0 and 65535
  */
  ushort getCurrentAlpha() nothrow
  {
    ushort _retval;
    _retval = gtk_color_selection_get_current_alpha(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Sets color to be the current color in the GtkColorSelection widget.
  
      Params:
        color = a #GdkColor to fill in with the current color
  
      Deprecated: Use [gid.gtk3.color_selection.ColorSelection.getCurrentRgba] instead.
  */
  void getCurrentColor(out gid.gdk3.color.Color color) nothrow
  {
    gtk_color_selection_get_current_color(cast(GtkColorSelection*)this._cPtr, cast(GdkColor*)&color);
  }

  /**
      Sets rgba to be the current color in the GtkColorSelection widget.
  
      Params:
        rgba = a #GdkRGBA to fill in with the current color
  */
  void getCurrentRgba(out gid.gdk3.rgba.RGBA rgba) nothrow
  {
    gtk_color_selection_get_current_rgba(cast(GtkColorSelection*)this._cPtr, cast(GdkRGBA*)&rgba);
  }

  /**
      Determines whether the colorsel has an opacity control.
      Returns: true if the colorsel has an opacity control,
            false if it does't
  */
  bool getHasOpacityControl() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_color_selection_get_has_opacity_control(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the color selector has a color palette.
      Returns: true if the selector has a palette, false if it hasn't
  */
  bool getHasPalette() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_color_selection_get_has_palette(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Returns the previous alpha value.
      Returns: an integer between 0 and 65535
  */
  ushort getPreviousAlpha() nothrow
  {
    ushort _retval;
    _retval = gtk_color_selection_get_previous_alpha(cast(GtkColorSelection*)this._cPtr);
    return _retval;
  }

  /**
      Fills color in with the original color value.
  
      Params:
        color = a #GdkColor to fill in with the original color value
  
      Deprecated: Use [gid.gtk3.color_selection.ColorSelection.getPreviousRgba] instead.
  */
  void getPreviousColor(out gid.gdk3.color.Color color) nothrow
  {
    gtk_color_selection_get_previous_color(cast(GtkColorSelection*)this._cPtr, cast(GdkColor*)&color);
  }

  /**
      Fills rgba in with the original color value.
  
      Params:
        rgba = a #GdkRGBA to fill in with the original color value
  */
  void getPreviousRgba(out gid.gdk3.rgba.RGBA rgba) nothrow
  {
    gtk_color_selection_get_previous_rgba(cast(GtkColorSelection*)this._cPtr, cast(GdkRGBA*)&rgba);
  }

  /**
      Gets the current state of the colorsel.
      Returns: true if the user is currently dragging
            a color around, and false if the selection has stopped
  */
  bool isAdjusting() nothrow
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
  void setCurrentAlpha(ushort alpha) nothrow
  {
    gtk_color_selection_set_current_alpha(cast(GtkColorSelection*)this._cPtr, alpha);
  }

  /**
      Sets the current color to be color.
      
      The first time this is called, it will also set
      the original color to be color too.
  
      Params:
        color = a #GdkColor to set the current color with
  
      Deprecated: Use [gid.gtk3.color_selection.ColorSelection.setCurrentRgba] instead.
  */
  void setCurrentColor(gid.gdk3.color.Color color) nothrow
  {
    gtk_color_selection_set_current_color(cast(GtkColorSelection*)this._cPtr, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the current color to be rgba.
      
      The first time this is called, it will also set
      the original color to be rgba too.
  
      Params:
        rgba = A #GdkRGBA to set the current color with
  */
  void setCurrentRgba(gid.gdk3.rgba.RGBA rgba) nothrow
  {
    gtk_color_selection_set_current_rgba(cast(GtkColorSelection*)this._cPtr, cast(const(GdkRGBA)*)&rgba);
  }

  /**
      Sets the colorsel to use or not use opacity.
  
      Params:
        hasOpacity = true if colorsel can set the opacity, false otherwise
  */
  void setHasOpacityControl(bool hasOpacity) nothrow
  {
    gtk_color_selection_set_has_opacity_control(cast(GtkColorSelection*)this._cPtr, hasOpacity);
  }

  /**
      Shows and hides the palette based upon the value of has_palette.
  
      Params:
        hasPalette = true if palette is to be visible, false otherwise
  */
  void setHasPalette(bool hasPalette) nothrow
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
  void setPreviousAlpha(ushort alpha) nothrow
  {
    gtk_color_selection_set_previous_alpha(cast(GtkColorSelection*)this._cPtr, alpha);
  }

  /**
      Sets the “previous” color to be color.
      
      This function should be called with some hesitations,
      as it might seem confusing to have that color change.
      Calling [gid.gtk3.color_selection.ColorSelection.setCurrentColor] will also
      set this color the first time it is called.
  
      Params:
        color = a #GdkColor to set the previous color with
  
      Deprecated: Use [gid.gtk3.color_selection.ColorSelection.setPreviousRgba] instead.
  */
  void setPreviousColor(gid.gdk3.color.Color color) nothrow
  {
    gtk_color_selection_set_previous_color(cast(GtkColorSelection*)this._cPtr, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the “previous” color to be rgba.
      
      This function should be called with some hesitations,
      as it might seem confusing to have that color change.
      Calling [gid.gtk3.color_selection.ColorSelection.setCurrentRgba] will also
      set this color the first time it is called.
  
      Params:
        rgba = a #GdkRGBA to set the previous color with
  */
  void setPreviousRgba(gid.gdk3.rgba.RGBA rgba) nothrow
  {
    gtk_color_selection_set_previous_rgba(cast(GtkColorSelection*)this._cPtr, cast(const(GdkRGBA)*)&rgba);
  }

  /**
      Connect to `ColorChanged` signal.
  
      This signal is emitted when the color changes in the #GtkColorSelection
        according to its update policy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.color_selection.ColorSelection colorSelection)`
  
          `colorSelection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectColorChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.color_selection.ColorSelection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.color_selection.ColorSelection.colorChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("color-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ColorSelection
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.color_selection.ColorSelection), T.stringof ~ " is not derived from gid.gtk3.color_selection.ColorSelection");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncColorChanged", true)[0]) == gid.gtk3.color_selection.ColorSelection))
      _installVfunc(klass, "color_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkColorSelectionClass*)klass;

    switch (vfunc)
    {
      case "color_changed":
      {
        static extern(C) void _vfuncColorChangedTramp(GtkColorSelection* colorSelection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.color_selection.ColorSelection)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)colorSelection);
          if (!_obj)
          {
            auto _klass = cast(GtkColorSelectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)colorSelection);
            if (_klass.colorChanged)
              return (cast(typeof(&_vfuncColorChangedTramp))_klass.colorChanged)(colorSelection);
            return;
          }

          try
          {
            _obj.vfuncColorChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.color_selection.ColorSelection.vfuncColorChanged");
          }
        }

        _klass.colorChanged = cast(typeof(_klass.colorChanged))&_vfuncColorChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.color_selection.ColorSelection]
class ColorSelectionGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /** */
  T currentAlpha(uint propval) nothrow
  {
    return setProperty("current-alpha", propval);
  }

  /**
      Set `currentColor` property.
      Params:
        propval = The current GdkColor color.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkColorSelection:current-rgba instead.
  */
  T currentColor(gid.gdk3.color.Color propval) nothrow
  {
    return setProperty("current-color", propval);
  }

  /**
      Set `currentRgba` property.
      Params:
        propval = The current RGBA color.
      Returns: Builder instance for fluent chaining
  */
  T currentRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    return setProperty("current-rgba", propval);
  }

  /** */
  T hasOpacityControl(bool propval) nothrow
  {
    return setProperty("has-opacity-control", propval);
  }

  /** */
  T hasPalette(bool propval) nothrow
  {
    return setProperty("has-palette", propval);
  }
}

/// Fluent builder for [gid.gtk3.color_selection.ColorSelection]
final class ColorSelectionGidBuilder : ColorSelectionGidBuilderImpl!ColorSelectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorSelection build() nothrow
  {
    return new ColorSelection(cast(void*)createGObject(ColorSelection._getGType), Yes.Take);
  }
}
