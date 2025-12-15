/// Module for [AppChooserButton] class
module gtk.app_chooser_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.combo_box;
import gtk.types;

/**
    The #GtkAppChooserButton is a widget that lets the user select
    an application. It implements the #GtkAppChooser interface.
    
    Initially, a #GtkAppChooserButton selects the first application
    in its list, which will either be the most-recently used application
    or, if #GtkAppChooserButton:show-default-item is true, the
    default application.
    
    The list of applications shown in a #GtkAppChooserButton includes
    the recommended applications for the given content type. When
    #GtkAppChooserButton:show-default-item is set, the default application
    is also included. To let the user chooser other applications,
    you can set the #GtkAppChooserButton:show-dialog-item property,
    which allows to open a full #GtkAppChooserDialog.
    
    It is possible to add custom items to the list, using
    [gtk.app_chooser_button.AppChooserButton.appendCustomItem]. These items cause
    the #GtkAppChooserButton::custom-item-activated signal to be
    emitted when they are selected.
    
    To track changes in the selected application, use the
    #GtkComboBox::changed signal.
*/
class AppChooserButton : gtk.combo_box.ComboBox, gtk.app_chooser.AppChooser
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
    return cast(void function())gtk_app_chooser_button_get_type != &gidSymbolNotFound ? gtk_app_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppChooserButton self()
  {
    return this;
  }

  /**
      Get `heading` property.
      Returns: The text to show at the top of the dialog that can be
      opened from the button. The string may contain Pango markup.
  */
  @property string heading()
  {
    return getHeading();
  }

  /**
      Set `heading` property.
      Params:
        propval = The text to show at the top of the dialog that can be
        opened from the button. The string may contain Pango markup.
  */
  @property void heading(string propval)
  {
    return setHeading(propval);
  }

  /**
      Get `showDefaultItem` property.
      Returns: The #GtkAppChooserButton:show-default-item property determines
      whether the dropdown menu should show the default application
      on top for the provided content type.
  */
  @property bool showDefaultItem()
  {
    return getShowDefaultItem();
  }

  /**
      Set `showDefaultItem` property.
      Params:
        propval = The #GtkAppChooserButton:show-default-item property determines
        whether the dropdown menu should show the default application
        on top for the provided content type.
  */
  @property void showDefaultItem(bool propval)
  {
    return setShowDefaultItem(propval);
  }

  /**
      Get `showDialogItem` property.
      Returns: The #GtkAppChooserButton:show-dialog-item property determines
      whether the dropdown menu should show an item that triggers
      a #GtkAppChooserDialog when clicked.
  */
  @property bool showDialogItem()
  {
    return getShowDialogItem();
  }

  /**
      Set `showDialogItem` property.
      Params:
        propval = The #GtkAppChooserButton:show-dialog-item property determines
        whether the dropdown menu should show an item that triggers
        a #GtkAppChooserDialog when clicked.
  */
  @property void showDialogItem(bool propval)
  {
    return setShowDialogItem(propval);
  }

  mixin AppChooserT!();

  /**
      Creates a new #GtkAppChooserButton for applications
      that can handle content of the given type.
  
      Params:
        contentType = the content type to show applications for
      Returns: a newly created #GtkAppChooserButton
  */
  this(string contentType)
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = gtk_app_chooser_button_new(_contentType);
    this(_cretval, No.Take);
  }

  /**
      Appends a custom item to the list of applications that is shown
      in the popup; the item name must be unique per-widget.
      Clients can use the provided name as a detail for the
      #GtkAppChooserButton::custom-item-activated signal, to add a
      callback for the activation of a particular custom item in the list.
      See also [gtk.app_chooser_button.AppChooserButton.appendSeparator].
  
      Params:
        name = the name of the custom item
        label = the label for the custom item
        icon = the icon for the custom item
  */
  void appendCustomItem(string name, string label, gio.icon.Icon icon)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    gtk_app_chooser_button_append_custom_item(cast(GtkAppChooserButton*)this._cPtr, _name, _label, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Appends a separator to the list of applications that is shown
      in the popup.
  */
  void appendSeparator()
  {
    gtk_app_chooser_button_append_separator(cast(GtkAppChooserButton*)this._cPtr);
  }

  /**
      Returns the text to display at the top of the dialog.
      Returns: the text to display at the top of the dialog,
            or null, in which case a default text is displayed
  */
  string getHeading()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_button_get_heading(cast(GtkAppChooserButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserButton:show-default-item
      property.
      Returns: the value of #GtkAppChooserButton:show-default-item
  */
  bool getShowDefaultItem()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_button_get_show_default_item(cast(GtkAppChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserButton:show-dialog-item
      property.
      Returns: the value of #GtkAppChooserButton:show-dialog-item
  */
  bool getShowDialogItem()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_button_get_show_dialog_item(cast(GtkAppChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Selects a custom item previously added with
      [gtk.app_chooser_button.AppChooserButton.appendCustomItem].
      
      Use [gtk.app_chooser.AppChooser.refresh] to bring the selection
      to its initial state.
  
      Params:
        name = the name of the custom item
  */
  void setActiveCustomItem(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_app_chooser_button_set_active_custom_item(cast(GtkAppChooserButton*)this._cPtr, _name);
  }

  /**
      Sets the text to display at the top of the dialog.
      If the heading is not set, the dialog displays a default text.
  
      Params:
        heading = a string containing Pango markup
  */
  void setHeading(string heading)
  {
    const(char)* _heading = heading.toCString(No.Alloc);
    gtk_app_chooser_button_set_heading(cast(GtkAppChooserButton*)this._cPtr, _heading);
  }

  /**
      Sets whether the dropdown menu of this button should show the
      default application for the given content type at top.
  
      Params:
        setting = the new value for #GtkAppChooserButton:show-default-item
  */
  void setShowDefaultItem(bool setting)
  {
    gtk_app_chooser_button_set_show_default_item(cast(GtkAppChooserButton*)this._cPtr, setting);
  }

  /**
      Sets whether the dropdown menu of this button should show an
      entry to trigger a #GtkAppChooserDialog.
  
      Params:
        setting = the new value for #GtkAppChooserButton:show-dialog-item
  */
  void setShowDialogItem(bool setting)
  {
    gtk_app_chooser_button_set_show_dialog_item(cast(GtkAppChooserButton*)this._cPtr, setting);
  }

  /**
      Connect to `CustomItemActivated` signal.
  
      Emitted when a custom item, previously added with
      [gtk.app_chooser_button.AppChooserButton.appendCustomItem], is activated from the
      dropdown menu.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string itemName, gtk.app_chooser_button.AppChooserButton appChooserButton))
  
          `itemName` the name of the activated item (optional)
  
          `appChooserButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCustomItemActivated(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.app_chooser_button.AppChooserButton)))
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
    return connectSignalClosure("custom-item-activated"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
