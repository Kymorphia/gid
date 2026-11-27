/// Module for [ColorChooser] interface
module gid.gtk3.color_chooser;

public import gid.core.basictypes;
public import gid.gtk3.color_chooser_iface_proxy;
import gid.core.utils;
import gid.gdk3.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    #GtkColorChooser is an interface that is implemented by widgets
    for choosing colors. Depending on the situation, colors may be
    allowed to have alpha (translucency).
    
    In GTK+, the main widgets that implement this interface are
    #GtkColorChooserWidget, #GtkColorChooserDialog and #GtkColorButton.
*/
@gidGir("ColorChooser", "ColorChooserInterface")
interface ColorChooser : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_chooser_get_type != &gidSymbolNotFound ? gtk_color_chooser_get_type() : cast(GType)0;
  }

  /**
      Get `rgba` property.
      Returns: The ::rgba property contains the currently selected color,
        as a #GdkRGBA struct. The property can be set to change
        the current selection programmatically.
  */
  @property gid.gdk3.rgba.RGBA rgba() nothrow;

  /**
      Set `rgba` property.
      Params:
        propval = The ::rgba property contains the currently selected color,
          as a #GdkRGBA struct. The property can be set to change
          the current selection programmatically.
  */
  @property void rgba(gid.gdk3.rgba.RGBA propval) nothrow;

  /**
      Get `useAlpha` property.
      Returns: When ::use-alpha is true, colors may have alpha (translucency)
        information. When it is false, the #GdkRGBA struct obtained
        via the #GtkColorChooser:rgba property will be forced to have
        alpha == 1.
        
        Implementations are expected to show alpha by rendering the color
        over a non-uniform background (like a checkerboard pattern).
  */
  @property bool useAlpha() nothrow;

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
  @property void useAlpha(bool propval) nothrow;





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
        orientation = [gid.gtk4.types.Orientation.Horizontal] if the palette should
              be displayed in rows, [gid.gtk4.types.Orientation.Vertical] for columns
        colorsPerLine = the number of colors to show in each row/column
        colors = the colors of the palette, or null
  */
  void addPalette(gid.gtk3.types.Orientation orientation, int colorsPerLine, gid.gdk3.rgba.RGBA[] colors = null);

  /**
      Gets the currently-selected color.
  
      Params:
        color = a #GdkRGBA to fill in with the current color
  */
  void getRgba(out gid.gdk3.rgba.RGBA color);

  /**
      Returns whether the color chooser shows the alpha channel.
      Returns: true if the color chooser uses the alpha channel,
            false if not
  */
  bool getUseAlpha();

  /**
      Sets the color.
  
      Params:
        color = the new color
  */
  void setRgba(gid.gdk3.rgba.RGBA color);

  /**
      Sets whether or not the color chooser should use the alpha channel.
  
      Params:
        useAlpha = true if color chooser should use alpha channel, false if not
  */
  void setUseAlpha(bool useAlpha);

  /**
      Connect to `ColorActivated` signal.
  
      Emitted when a color is activated from the color chooser.
        This usually happens when the user clicks a color swatch,
        or a color is selected and the user presses one of the keys
        Space, Shift+Space, Return or Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.rgba.RGBA color, gid.gtk3.color_chooser.ColorChooser colorChooser)`
  
          `color` the color (optional)
  
          `colorChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectColorActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.rgba.RGBA)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.color_chooser.ColorChooser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.color_chooser.ColorChooser.colorActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("color-activated", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.color_chooser.ColorChooser]
interface ColorChooserGidBuilderImpl(T)
{

  /**
      Set `rgba` property.
      Params:
        propval = The ::rgba property contains the currently selected color,
          as a #GdkRGBA struct. The property can be set to change
          the current selection programmatically.
      Returns: Builder instance for fluent chaining
  */
  T rgba(gid.gdk3.rgba.RGBA propval) nothrow;

  /**
      Set `useAlpha` property.
      Params:
        propval = When ::use-alpha is true, colors may have alpha (translucency)
          information. When it is false, the #GdkRGBA struct obtained
          via the #GtkColorChooser:rgba property will be forced to have
          alpha == 1.
          
          Implementations are expected to show alpha by rendering the color
          over a non-uniform background (like a checkerboard pattern).
      Returns: Builder instance for fluent chaining
  */
  T useAlpha(bool propval) nothrow;
}
