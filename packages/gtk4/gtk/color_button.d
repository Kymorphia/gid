/// Module for [ColorButton] class
module gtk.color_button;

import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.color_button.ColorButton] allows to open a color chooser dialog to change
    the color.
    
    ![An example GtkColorButton](color-button.png)
    
    It is suitable widget for selecting a color in a preference dialog.
    
    # CSS nodes
    
    ```
    colorbutton
    ╰── button.color
        ╰── [content]
    ```
    
    [gtk.color_button.ColorButton] has a single CSS node with name colorbutton which
    contains a button node. To differentiate it from a plain [gtk.button.Button],
    it gets the .color style class.

    Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
*/
class ColorButton : gtk.widget.Widget, gtk.color_chooser.ColorChooser
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
    return cast(void function())gtk_color_button_get_type != &gidSymbolNotFound ? gtk_color_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorButton self()
  {
    return this;
  }

  /**
      Get `modal` property.
      Returns: Whether the color chooser dialog should be modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the color chooser dialog should be modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `showEditor` property.
      Returns: Whether the color chooser should open in editor mode.
      
      This property should be used in cases where the palette
      in the editor would be redundant, such as when the color
      button is already part of a palette.
  */
  @property bool showEditor()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /**
      Set `showEditor` property.
      Params:
        propval = Whether the color chooser should open in editor mode.
        
        This property should be used in cases where the palette
        in the editor would be redundant, such as when the color
        button is already part of a palette.
  */
  @property void showEditor(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  /**
      Get `title` property.
      Returns: The title of the color chooser dialog
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the color chooser dialog
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new color button.
      
      This returns a widget in the form of a small button containing
      a swatch representing the current selected color. When the button
      is clicked, a color chooser dialog will open, allowing the user
      to select a color. The swatch will be updated to reflect the new
      color when the user finishes.
      Returns: a new color button
  
      Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new color button showing the given color.
  
      Params:
        rgba = A [gdk.rgba.RGBA] to set the current color with
      Returns: a new color button
  */
  static gtk.color_button.ColorButton newWithRgba(gdk.rgba.RGBA rgba)
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new_with_rgba(rgba ? cast(const(GdkRGBA)*)rgba._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.color_button.ColorButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the dialog is modal.
      Returns: true if the dialog is modal
  
      Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_color_button_get_modal(cast(GtkColorButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the title of the color chooser dialog.
      Returns: An internal string, do not free the return value
  
      Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_color_button_get_title(cast(GtkColorButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets whether the dialog should be modal.
  
      Params:
        modal = true to make the dialog modal
  
      Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  void setModal(bool modal)
  {
    gtk_color_button_set_modal(cast(GtkColorButton*)this._cPtr, modal);
  }

  /**
      Sets the title for the color chooser dialog.
  
      Params:
        title = String containing new window title
  
      Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_color_button_set_title(cast(GtkColorButton*)this._cPtr, _title);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to when the color button is activated.
      
      The `::activate` signal on [gtk.menu_button.MenuButton] is an action signal and
      emitting it causes the button to pop up its dialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.color_button.ColorButton colorButton))
  
          `colorButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.color_button.ColorButton)))
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
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `ColorSet` signal.
  
      Emitted when the user selects a color.
      
      When handling this signal, use [gtk.color_chooser.ColorChooser.getRgba]
      to find out which color was just selected.
      
      Note that this signal is only emitted when the user changes the color.
      If you need to react to programmatic color changes as well, use
      the notify::rgba signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.color_button.ColorButton colorButton))
  
          `colorButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectColorSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.color_button.ColorButton)))
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
    return connectSignalClosure("color-set", closure, after);
  }
}
