/// Module for [ColorDialogButton] class
module gid.gtk4.color_dialog_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.color_dialog;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Opens a color chooser dialog to select a color.
    
    <picture>
      <source srcset="color-button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkColorDialogButton" src="color-button.png">
    </picture>
    
    It is suitable widget for selecting a color in a preference dialog.
    
    # CSS nodes
    
    ```
    colorbutton
    ╰── button.color
        ╰── [content]
    ```
    
    [gid.gtk4.color_dialog_button.ColorDialogButton] has a single CSS node with name colorbutton which
    contains a button node. To differentiate it from a plain [gid.gtk4.button.Button],
    it gets the .color style class.
*/
@gidGir("ColorDialogButton", "ColorDialogButtonClass")
class ColorDialogButton : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_color_dialog_button_get_type != &gidSymbolNotFound ? gtk_color_dialog_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColorDialogButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorDialogButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.color_dialog_button.ColorDialogButton]
      Returns: New builder object
  */
  static ColorDialogButtonGidBuilder builder() nothrow
  {
    return new ColorDialogButtonGidBuilder;
  }

  /**
      Get `dialog` property.
      Returns: The [gid.gtk4.color_dialog.ColorDialog] that contains parameters for
        the color chooser dialog.
  */
  @property gid.gtk4.color_dialog.ColorDialog dialog() nothrow
  {
    return getDialog();
  }

  /**
      Set `dialog` property.
      Params:
        propval = The [gid.gtk4.color_dialog.ColorDialog] that contains parameters for
          the color chooser dialog.
  */
  @property void dialog(gid.gtk4.color_dialog.ColorDialog propval) nothrow
  {
    setDialog(propval);
  }

  /**
      Get `rgba` property.
      Returns: The selected color.
        
        This property can be set to give the button its initial
        color, and it will be updated to reflect the users choice
        in the color chooser dialog.
        
        Listen to `notify::rgba` to get informed about changes
        to the buttons color.
  */
  @property gid.gdk4.rgba.RGBA rgba() nothrow
  {
    return getRgba();
  }

  /**
      Set `rgba` property.
      Params:
        propval = The selected color.
          
          This property can be set to give the button its initial
          color, and it will be updated to reflect the users choice
          in the color chooser dialog.
          
          Listen to `notify::rgba` to get informed about changes
          to the buttons color.
  */
  @property void rgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    setRgba(propval);
  }

  /**
      Creates a new [gid.gtk4.color_dialog_button.ColorDialogButton] with the
      given [gid.gtk4.color_dialog.ColorDialog].
      
      You can pass `NULL` to this function and set a [gid.gtk4.color_dialog.ColorDialog]
      later. The button will be insensitive until that happens.
  
      Params:
        dialog = the [gid.gtk4.color_dialog.ColorDialog] to use
      Returns: the new [gid.gtk4.color_dialog_button.ColorDialogButton]
  */
  this(gid.gtk4.color_dialog.ColorDialog dialog = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, dialog !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_color_dialog_button_new(dialog ? cast(GtkColorDialog*)dialog._cPtr(Yes.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Returns the [gid.gtk4.color_dialog.ColorDialog] of self.
      Returns: the [gid.gtk4.color_dialog.ColorDialog]
  */
  gid.gtk4.color_dialog.ColorDialog getDialog() nothrow
  {
    GtkColorDialog* _cretval;
    _cretval = gtk_color_dialog_button_get_dialog(cast(GtkColorDialogButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.color_dialog.ColorDialog)(cast(GtkColorDialog*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the color of the button.
      
      This function is what should be used to obtain
      the color that was chosen by the user. To get
      informed about changes, listen to "notify::rgba".
      Returns: the color
  */
  gid.gdk4.rgba.RGBA getRgba() nothrow
  {
    const(GdkRGBA)* _cretval;
    _cretval = gtk_color_dialog_button_get_rgba(cast(GtkColorDialogButton*)this._cPtr);
    gid.gdk4.rgba.RGBA _retval;
    if (_cretval)
      _retval = *cast(gid.gdk4.rgba.RGBA*)_cretval;
    return _retval;
  }

  /**
      Sets a [gid.gtk4.color_dialog.ColorDialog] object to use for
      creating the color chooser dialog that is
      presented when the user clicks the button.
  
      Params:
        dialog = the new [gid.gtk4.color_dialog.ColorDialog]
  */
  void setDialog(gid.gtk4.color_dialog.ColorDialog dialog) nothrow
  {
    gtk_color_dialog_button_set_dialog(cast(GtkColorDialogButton*)this._cPtr, dialog ? cast(GtkColorDialog*)dialog._cPtr(No.Dup) : null);
  }

  /**
      Sets the color of the button.
  
      Params:
        color = the new color
  */
  void setRgba(gid.gdk4.rgba.RGBA color) nothrow
  {
    gtk_color_dialog_button_set_rgba(cast(GtkColorDialogButton*)this._cPtr, cast(const(GdkRGBA)*)&color);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the color dialog button is activated.
        
        The `::activate` signal on [gid.gtk4.color_dialog_button.ColorDialogButton] is an action signal
        and emitting it causes the button to pop up its dialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.color_dialog_button.ColorDialogButton colorDialogButton)`
  
          `colorDialogButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.color_dialog_button.ColorDialogButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.color_dialog_button.ColorDialogButton.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.color_dialog_button.ColorDialogButton]
class ColorDialogButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `dialog` property.
      Params:
        propval = The [gid.gtk4.color_dialog.ColorDialog] that contains parameters for
          the color chooser dialog.
      Returns: Builder instance for fluent chaining
  */
  T dialog(gid.gtk4.color_dialog.ColorDialog propval) nothrow
  {
    return setProperty("dialog", propval);
  }

  /**
      Set `rgba` property.
      Params:
        propval = The selected color.
          
          This property can be set to give the button its initial
          color, and it will be updated to reflect the users choice
          in the color chooser dialog.
          
          Listen to `notify::rgba` to get informed about changes
          to the buttons color.
      Returns: Builder instance for fluent chaining
  */
  T rgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    return setProperty("rgba", propval);
  }
}

/// Fluent builder for [gid.gtk4.color_dialog_button.ColorDialogButton]
final class ColorDialogButtonGidBuilder : ColorDialogButtonGidBuilderImpl!ColorDialogButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorDialogButton build() nothrow
  {
    return new ColorDialogButton(cast(void*)createGObject(ColorDialogButton._getGType), Yes.Take);
  }
}
