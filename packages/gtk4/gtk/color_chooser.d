/// Module for [ColorChooser] interface
module gtk.color_chooser;

public import gtk.color_chooser_iface_proxy;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.color_chooser.ColorChooser] is an interface that is implemented by widgets
    for choosing colors.
    
    Depending on the situation, colors may be allowed to have alpha (translucency).
    
    In GTK, the main widgets that implement this interface are
    [gtk.color_chooser_widget.ColorChooserWidget], [gtk.color_chooser_dialog.ColorChooserDialog] and
    [gtk.color_button.ColorButton].

    Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
        instead of widgets implementing [gtk.color_chooser.ColorChooser]
*/
interface ColorChooser
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_chooser_get_type != &gidSymbolNotFound ? gtk_color_chooser_get_type() : cast(GType)0;
  }

  /**
      Get `rgba` property.
      Returns: The currently selected color, as a [gdk.rgba.RGBA] struct.
        
        The property can be set to change the current selection
        programmatically.
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
          instead of widgets implementing [gtk.color_chooser.ColorChooser]
  */
  @property gdk.rgba.RGBA rgba();

  /**
      Set `rgba` property.
      Params:
        propval = The currently selected color, as a [gdk.rgba.RGBA] struct.
          
          The property can be set to change the current selection
          programmatically.
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
          instead of widgets implementing [gtk.color_chooser.ColorChooser]
  */
  @property void rgba(gdk.rgba.RGBA propval);

  /**
      Get `useAlpha` property.
      Returns: Whether colors may have alpha (translucency).
        
        When ::use-alpha is false, the [gdk.rgba.RGBA] struct obtained
        via the [gtk.color_chooser.ColorChooser.rgba] property will be
        forced to have alpha == 1.
        
        Implementations are expected to show alpha by rendering the color
        over a non-uniform background (like a checkerboard pattern).
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
          instead of widgets implementing [gtk.color_chooser.ColorChooser]
  */
  @property bool useAlpha();

  /**
      Set `useAlpha` property.
      Params:
        propval = Whether colors may have alpha (translucency).
          
          When ::use-alpha is false, the [gdk.rgba.RGBA] struct obtained
          via the [gtk.color_chooser.ColorChooser.rgba] property will be
          forced to have alpha == 1.
          
          Implementations are expected to show alpha by rendering the color
          over a non-uniform background (like a checkerboard pattern).
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
          instead of widgets implementing [gtk.color_chooser.ColorChooser]
  */
  @property void useAlpha(bool propval);

  /**
      Adds a palette to the color chooser.
      
      If orientation is horizontal, the colors are grouped in rows,
      with colors_per_line colors in each row. If horizontal is false,
      the colors are grouped in columns instead.
      
      The default color palette of [gtk.color_chooser_widget.ColorChooserWidget] has
      45 colors, organized in columns of 5 colors (this includes some
      grays).
      
      The layout of the color chooser widget works best when the
      palettes have 9-10 columns.
      
      Calling this function for the first time has the side effect
      of removing the default color palette from the color chooser.
      
      If colors is null, removes all previously added palettes.
  
      Params:
        orientation = [gtk.types.Orientation.Horizontal] if the palette should
            be displayed in rows, [gtk.types.Orientation.Vertical] for columns
        colorsPerLine = the number of colors to show in each row/column
        colors = the colors of the palette
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] instead
  */
  void addPalette(gtk.types.Orientation orientation, int colorsPerLine, gdk.rgba.RGBA[] colors = null);

  /**
      Gets the currently-selected color.
  
      Params:
        color = a [gdk.rgba.RGBA] to fill in with the current color
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] instead
  */
  void getRgba(out gdk.rgba.RGBA color);

  /**
      Returns whether the color chooser shows the alpha channel.
      Returns: true if the color chooser uses the alpha channel,
          false if not
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] instead
  */
  bool getUseAlpha();

  /**
      Sets the color.
  
      Params:
        color = the new color
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] instead
  */
  void setRgba(gdk.rgba.RGBA color);

  /**
      Sets whether or not the color chooser should use the alpha channel.
  
      Params:
        useAlpha = true if color chooser should use alpha channel, false if not
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] instead
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
  
          $(D void callback(gdk.rgba.RGBA color, gtk.color_chooser.ColorChooser colorChooser))
  
          `color` the color (optional)
  
          `colorChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
          instead of widgets implementing [gtk.color_chooser.ColorChooser]
  */
  ulong connectColorActivated(T)(T callback, Flag!"After" after = No.After);
}
