/// Module for [ColorButton] class
module gid.gtk3.color_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.color;
import gid.gdk3.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.button;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.color_chooser;
import gid.gtk3.color_chooser_mixin;
import gid.gtk3.types;

/**
    The #GtkColorButton is a button which displays the currently selected
    color and allows to open a color selection dialog to change the color.
    It is suitable widget for selecting a color in a preference dialog.
    
    # CSS nodes
    
    GtkColorButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .color style class.
*/
class ColorButton : gid.gtk3.button.Button, gid.gtk3.color_chooser.ColorChooser
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
    return cast(void function())gtk_color_button_get_type != &gidSymbolNotFound ? gtk_color_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColorButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.color_button.ColorButton]
      Returns: New builder object
  */
  static ColorButtonGidBuilder builder() nothrow
  {
    return new ColorButtonGidBuilder;
  }

  /**
      Get `alpha` property.
      Returns: The selected opacity value (0 fully transparent, 65535 fully opaque).
  */
  @property uint alpha() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("alpha");
  }

  /**
      Set `alpha` property.
      Params:
        propval = The selected opacity value (0 fully transparent, 65535 fully opaque).
  */
  @property void alpha(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("alpha", propval);
  }

  /**
      Get `color` property.
      Returns: The selected color.
  
      Deprecated: Use #GtkColorButton:rgba instead.
  */
  @property gid.gdk3.color.Color color() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.color.Color)("color");
  }

  /**
      Set `color` property.
      Params:
        propval = The selected color.
  
      Deprecated: Use #GtkColorButton:rgba instead.
  */
  @property void color(gid.gdk3.color.Color propval) nothrow
  {
    setColor(propval);
  }

  /**
      Get `rgba` property.
      Returns: The RGBA color.
  */
  @property gid.gdk3.rgba.RGBA rgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.rgba.RGBA)("rgba");
  }

  /**
      Set `rgba` property.
      Params:
        propval = The RGBA color.
  */
  @property void rgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.rgba.RGBA)("rgba", propval);
  }

  /**
      Get `showEditor` property.
      Returns: Set this property to true to skip the palette
        in the dialog and go directly to the color editor.
        
        This property should be used in cases where the palette
        in the editor would be redundant, such as when the color
        button is already part of a palette.
  */
  @property bool showEditor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /**
      Set `showEditor` property.
      Params:
        propval = Set this property to true to skip the palette
          in the dialog and go directly to the color editor.
          
          This property should be used in cases where the palette
          in the editor would be redundant, such as when the color
          button is already part of a palette.
  */
  @property void showEditor(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  /**
      Get `title` property.
      Returns: The title of the color selection dialog
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the color selection dialog
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `useAlpha` property.
      Returns: If this property is set to true, the color swatch on the button is
        rendered against a checkerboard background to show its opacity and
        the opacity slider is displayed in the color selection dialog.
  */
  @property bool useAlpha() nothrow
  {
    return getUseAlpha();
  }

  /**
      Set `useAlpha` property.
      Params:
        propval = If this property is set to true, the color swatch on the button is
          rendered against a checkerboard background to show its opacity and
          the opacity slider is displayed in the color selection dialog.
  */
  @property void useAlpha(bool propval) nothrow
  {
    setUseAlpha(propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new color button.
      
      This returns a widget in the form of a small button containing
      a swatch representing the current selected color. When the button
      is clicked, a color-selection dialog will open, allowing the user
      to select a color. The swatch will be updated to reflect the new
      color when the user finishes.
      Returns: a new color button
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new color button.
  
      Params:
        color = A #GdkColor to set the current color with
      Returns: a new color button
  
      Deprecated: Use [gid.gtk4.color_button.ColorButton.newWithRgba] instead.
  */
  static gid.gtk3.color_button.ColorButton newWithColor(gid.gdk3.color.Color color) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new_with_color(cast(const(GdkColor)*)&color);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.color_button.ColorButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new color button.
  
      Params:
        rgba = A #GdkRGBA to set the current color with
      Returns: a new color button
  */
  static gid.gtk3.color_button.ColorButton newWithRgba(gid.gdk3.rgba.RGBA rgba) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new_with_rgba(cast(const(GdkRGBA)*)&rgba);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.color_button.ColorButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current alpha value.
      Returns: an integer between 0 and 65535
  
      Deprecated: Use [gid.gtk4.color_chooser.ColorChooser.getRgba] instead.
  */
  ushort getAlpha() nothrow
  {
    ushort _retval;
    _retval = gtk_color_button_get_alpha(cast(GtkColorButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets color to be the current color in the #GtkColorButton widget.
  
      Params:
        color = a #GdkColor to fill in with the current color
  
      Deprecated: Use [gid.gtk4.color_chooser.ColorChooser.getRgba] instead.
  */
  void getColor(out gid.gdk3.color.Color color) nothrow
  {
    gtk_color_button_get_color(cast(GtkColorButton*)this._cPtr, cast(GdkColor*)&color);
  }

  /**
      Gets the title of the color selection dialog.
      Returns: An internal string, do not free the return value
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_color_button_get_title(cast(GtkColorButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Does the color selection dialog use the alpha channel ?
      Returns: true if the color sample uses alpha channel, false if not
  
      Deprecated: Use [gid.gtk4.color_chooser.ColorChooser.getUseAlpha] instead.
  */
  bool getUseAlpha() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_color_button_get_use_alpha(cast(GtkColorButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the current opacity to be alpha.
  
      Params:
        alpha = an integer between 0 and 65535
  
      Deprecated: Use [gid.gtk4.color_chooser.ColorChooser.setRgba] instead.
  */
  void setAlpha(ushort alpha) nothrow
  {
    gtk_color_button_set_alpha(cast(GtkColorButton*)this._cPtr, alpha);
  }

  /**
      Sets the current color to be color.
  
      Params:
        color = A #GdkColor to set the current color with
  
      Deprecated: Use [gid.gtk4.color_chooser.ColorChooser.setRgba] instead.
  */
  void setColor(gid.gdk3.color.Color color) nothrow
  {
    gtk_color_button_set_color(cast(GtkColorButton*)this._cPtr, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the title for the color selection dialog.
  
      Params:
        title = String containing new window title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_color_button_set_title(cast(GtkColorButton*)this._cPtr, _title);
  }

  /**
      Sets whether or not the color button should use the alpha channel.
  
      Params:
        useAlpha = true if color button should use alpha channel, false if not
  
      Deprecated: Use [gid.gtk4.color_chooser.ColorChooser.setUseAlpha] instead.
  */
  void setUseAlpha(bool useAlpha) nothrow
  {
    gtk_color_button_set_use_alpha(cast(GtkColorButton*)this._cPtr, useAlpha);
  }

  /**
      Connect to `ColorSet` signal.
  
      The ::color-set signal is emitted when the user selects a color.
        When handling this signal, use [gid.gtk3.color_button.ColorButton.getRgba] to
        find out which color was just selected.
        
        Note that this signal is only emitted when the user
        changes the color. If you need to react to programmatic color changes
        as well, use the notify::color signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.color_button.ColorButton colorButton)`
  
          `colorButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectColorSet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.color_button.ColorButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.color_button.ColorButton.colorSet");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("color-set", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.color_button.ColorButton]
class ColorButtonGidBuilderImpl(T) : gid.gtk3.button.ButtonGidBuilderImpl!T, gid.gtk3.color_chooser.ColorChooserGidBuilderImpl!T
{

  mixin ColorChooserGidBuilderT!();

  /**
      Set `alpha` property.
      Params:
        propval = The selected opacity value (0 fully transparent, 65535 fully opaque).
      Returns: Builder instance for fluent chaining
  */
  T alpha(uint propval) nothrow
  {
    return setProperty("alpha", propval);
  }

  /**
      Set `color` property.
      Params:
        propval = The selected color.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkColorButton:rgba instead.
  */
  T color(gid.gdk3.color.Color propval) nothrow
  {
    return setProperty("color", propval);
  }

  /**
      Set `rgba` property.
      Params:
        propval = The RGBA color.
      Returns: Builder instance for fluent chaining
  */
  T rgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    return setProperty("rgba", propval);
  }

  /**
      Set `showEditor` property.
      Params:
        propval = Set this property to true to skip the palette
          in the dialog and go directly to the color editor.
          
          This property should be used in cases where the palette
          in the editor would be redundant, such as when the color
          button is already part of a palette.
      Returns: Builder instance for fluent chaining
  */
  T showEditor(bool propval) nothrow
  {
    return setProperty("show-editor", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the color selection dialog
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `useAlpha` property.
      Params:
        propval = If this property is set to true, the color swatch on the button is
          rendered against a checkerboard background to show its opacity and
          the opacity slider is displayed in the color selection dialog.
      Returns: Builder instance for fluent chaining
  */
  T useAlpha(bool propval) nothrow
  {
    return setProperty("use-alpha", propval);
  }
}

/// Fluent builder for [gid.gtk3.color_button.ColorButton]
final class ColorButtonGidBuilder : ColorButtonGidBuilderImpl!ColorButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorButton build() nothrow
  {
    return new ColorButton(cast(void*)createGObject(ColorButton._getGType), Yes.Take);
  }
}
