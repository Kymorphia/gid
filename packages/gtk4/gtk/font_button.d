/// Module for [FontButton] class
module gtk.font_button;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.font_button.FontButton] allows to open a font chooser dialog to change
    the font.
    
    ![An example GtkFontButton](font-button.png)
    
    It is suitable widget for selecting a font in a preference dialog.
    
    # CSS nodes
    
    ```
    fontbutton
    ╰── button.font
        ╰── [content]
    ```
    
    [gtk.font_button.FontButton] has a single CSS node with name fontbutton which
    contains a button node with the .font style class.

    Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
*/
class FontButton : gtk.widget.Widget, gtk.font_chooser.FontChooser
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
    return cast(void function())gtk_font_button_get_type != &gidSymbolNotFound ? gtk_font_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontButton self()
  {
    return this;
  }

  /**
      Get `modal` property.
      Returns: Whether the font chooser dialog should be modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the font chooser dialog should be modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the font chooser dialog.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the font chooser dialog.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `useFont` property.
      Returns: Whether the buttons label will be drawn in the selected font.
  */
  @property bool useFont()
  {
    return getUseFont();
  }

  /**
      Set `useFont` property.
      Params:
        propval = Whether the buttons label will be drawn in the selected font.
  */
  @property void useFont(bool propval)
  {
    return setUseFont(propval);
  }

  /**
      Get `useSize` property.
      Returns: Whether the buttons label will use the selected font size.
  */
  @property bool useSize()
  {
    return getUseSize();
  }

  /**
      Set `useSize` property.
      Params:
        propval = Whether the buttons label will use the selected font size.
  */
  @property void useSize(bool propval)
  {
    return setUseSize(propval);
  }

  mixin FontChooserT!();

  /**
      Creates a new font picker widget.
      Returns: a new font picker widget.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new font picker widget showing the given font.
  
      Params:
        fontname = Name of font to display in font chooser dialog
      Returns: a new font picker widget.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  static gtk.font_button.FontButton newWithFont(string fontname)
  {
    GtkWidget* _cretval;
    const(char)* _fontname = fontname.toCString(No.Alloc);
    _cretval = gtk_font_button_new_with_font(_fontname);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.font_button.FontButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the dialog is modal.
      Returns: true if the dialog is modal
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_modal(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the font chooser dialog.
      Returns: an internal copy of the title string
          which must not be freed.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_font_button_get_title(cast(GtkFontButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the selected font is used in the label.
      Returns: whether the selected font is used in the label.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  bool getUseFont()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_use_font(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the selected size is used in the label.
      Returns: whether the selected size is used in the label.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  bool getUseSize()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_use_size(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the dialog should be modal.
  
      Params:
        modal = true to make the dialog modal
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setModal(bool modal)
  {
    gtk_font_button_set_modal(cast(GtkFontButton*)this._cPtr, modal);
  }

  /**
      Sets the title for the font chooser dialog.
  
      Params:
        title = a string containing the font chooser dialog title
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_font_button_set_title(cast(GtkFontButton*)this._cPtr, _title);
  }

  /**
      If use_font is true, the font name will be written
      using the selected font.
  
      Params:
        useFont = If true, font name will be written using font chosen.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setUseFont(bool useFont)
  {
    gtk_font_button_set_use_font(cast(GtkFontButton*)this._cPtr, useFont);
  }

  /**
      If use_size is true, the font name will be written using
      the selected size.
  
      Params:
        useSize = If true, font name will be written using the
            selected size.
  
      Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
  */
  void setUseSize(bool useSize)
  {
    gtk_font_button_set_use_size(cast(GtkFontButton*)this._cPtr, useSize);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to when the font button is activated.
      
      The `::activate` signal on [gtk.font_button.FontButton] is an action signal and
      emitting it causes the button to present its dialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.font_button.FontButton fontButton))
  
          `fontButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.font_button.FontButton)))
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
      Connect to `FontSet` signal.
  
      Emitted when the user selects a font.
      
      When handling this signal, use [gtk.font_chooser.FontChooser.getFont]
      to find out which font was just selected.
      
      Note that this signal is only emitted when the user changes the font.
      If you need to react to programmatic font changes as well, use
      the notify::font signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.font_button.FontButton fontButton))
  
          `fontButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFontSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.font_button.FontButton)))
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
    return connectSignalClosure("font-set", closure, after);
  }
}
