/// Module for [ColorChooser] interface mixin
module gtk.color_chooser_mixin;

public import gtk.color_chooser_iface_proxy;
public import gdk.rgba;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    #GtkColorChooser is an interface that is implemented by widgets
    for choosing colors. Depending on the situation, colors may be
    allowed to have alpha (translucency).
    
    In GTK+, the main widgets that implement this interface are
    #GtkColorChooserWidget, #GtkColorChooserDialog and #GtkColorButton.
*/
template ColorChooserT()
{

  /**
      Get `rgba` property.
      Returns: The ::rgba property contains the currently selected color,
      as a #GdkRGBA struct. The property can be set to change
      the current selection programmatically.
  */
  @property gdk.rgba.RGBA rgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("rgba");
  }

  /**
      Set `rgba` property.
      Params:
        propval = The ::rgba property contains the currently selected color,
        as a #GdkRGBA struct. The property can be set to change
        the current selection programmatically.
  */
  @property void rgba(gdk.rgba.RGBA propval)
  {
    return setRgba(propval);
  }

  /**
      Get `useAlpha` property.
      Returns: When ::use-alpha is true, colors may have alpha (translucency)
      information. When it is false, the #GdkRGBA struct obtained
      via the #GtkColorChooser:rgba property will be forced to have
      alpha == 1.
      
      Implementations are expected to show alpha by rendering the color
      over a non-uniform background (like a checkerboard pattern).
  */
  @property bool useAlpha()
  {
    return getUseAlpha();
  }

  /**
      Set `useAlpha` property.
      Params:
        propval = When ::use-alpha is true, colors may have alpha (translucency)
        information. When it is false, the #GdkRGBA struct obtained
        via the #GtkColorChooser:rgba property will be forced to have
        alpha == 1.
        
        Implementations are expected to show alpha by rendering the color
        over a non-uniform background (like a checkerboard pattern).
  */
  @property void useAlpha(bool propval)
  {
    return setUseAlpha(propval);
  }

  /**
      Adds a palette to the color chooser. If orientation is horizontal,
      the colors are grouped in rows, with colors_per_line colors
      in each row. If horizontal is false, the colors are grouped
      in columns instead.
      
      The default color palette of #GtkColorChooserWidget has
      27 colors, organized in columns of 3 colors. The default gray
      palette has 9 grays in a single row.
      
      The layout of the color chooser widget works best when the
      palettes have 9-10 columns.
      
      Calling this function for the first time has the
      side effect of removing the default color and gray palettes
      from the color chooser.
      
      If colors is null, removes all previously added palettes.
  
      Params:
        orientation = [gtk.types.Orientation.Horizontal] if the palette should
              be displayed in rows, [gtk.types.Orientation.Vertical] for columns
        colorsPerLine = the number of colors to show in each row/column
        colors = the colors of the palette, or null
  */
  override void addPalette(gtk.types.Orientation orientation, int colorsPerLine, gdk.rgba.RGBA[] colors = null)
  {
    int _nColors;
    if (colors)
      _nColors = cast(int)colors.length;

    GdkRGBA[] _tmpcolors;
    foreach (obj; colors)
      _tmpcolors ~= *cast(GdkRGBA*)obj.cPtr;
    GdkRGBA* _colors = _tmpcolors.ptr;
    gtk_color_chooser_add_palette(cast(GtkColorChooser*)cPtr, orientation, colorsPerLine, _nColors, _colors);
  }

  /**
      Gets the currently-selected color.
  
      Params:
        color = a #GdkRGBA to fill in with the current color
  */
  override void getRgba(out gdk.rgba.RGBA color)
  {
    GdkRGBA _color;
    gtk_color_chooser_get_rgba(cast(GtkColorChooser*)cPtr, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
  }

  /**
      Returns whether the color chooser shows the alpha channel.
      Returns: true if the color chooser uses the alpha channel,
            false if not
  */
  override bool getUseAlpha()
  {
    bool _retval;
    _retval = gtk_color_chooser_get_use_alpha(cast(GtkColorChooser*)cPtr);
    return _retval;
  }

  /**
      Sets the color.
  
      Params:
        color = the new color
  */
  override void setRgba(gdk.rgba.RGBA color)
  {
    gtk_color_chooser_set_rgba(cast(GtkColorChooser*)cPtr, color ? cast(const(GdkRGBA)*)color.cPtr(No.Dup) : null);
  }

  /**
      Sets whether or not the color chooser should use the alpha channel.
  
      Params:
        useAlpha = true if color chooser should use alpha channel, false if not
  */
  override void setUseAlpha(bool useAlpha)
  {
    gtk_color_chooser_set_use_alpha(cast(GtkColorChooser*)cPtr, useAlpha);
  }

  /**
      Connect to `ColorActivated` signal.
  
      Emitted when a color is activated from the color chooser.
      This usually happens when the user clicks a color swatch,
      or a color is selected and the user presses one of the keys
      Space, Shift+Space, Return or Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.rgba.RGBA color, gtk.color_chooser.ColorChooser colorChooser))
  
          `color` the color (optional)
  
          `colorChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectColorActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.rgba.RGBA)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.color_chooser.ColorChooser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("color-activated", closure, after);
  }
}
