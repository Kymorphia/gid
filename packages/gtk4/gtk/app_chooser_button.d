/// Module for [AppChooserButton] class
module gtk.app_chooser_button;

import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.app_chooser_button.AppChooserButton] lets the user select an application.
    
    ![An example GtkAppChooserButton](appchooserbutton.png)
    
    Initially, a [gtk.app_chooser_button.AppChooserButton] selects the first application
    in its list, which will either be the most-recently used application
    or, if `property@Gtk.AppChooserButton:show-default-item` is true, the
    default application.
    
    The list of applications shown in a [gtk.app_chooser_button.AppChooserButton] includes
    the recommended applications for the given content type. When
    `property@Gtk.AppChooserButton:show-default-item` is set, the default
    application is also included. To let the user chooser other applications,
    you can set the `property@Gtk.AppChooserButton:show-dialog-item` property,
    which allows to open a full [gtk.app_chooser_dialog.AppChooserDialog].
    
    It is possible to add custom items to the list, using
    [gtk.app_chooser_button.AppChooserButton.appendCustomItem]. These items cause
    the `signal@Gtk.AppChooserButton::custom-item-activated` signal to be
    emitted when they are selected.
    
    To track changes in the selected application, use the
    [gtk.app_chooser_button.AppChooserButton.changed] signal.
    
    ## CSS nodes
    
    [gtk.app_chooser_button.AppChooserButton] has a single CSS node with the name “appchooserbutton”.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
class AppChooserButton : gtk.widget.Widget, gtk.app_chooser.AppChooser
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
        opened from the button.
        
        The string may contain Pango markup.
  */
  @property string heading()
  {
    return getHeading();
  }

  /**
      Set `heading` property.
      Params:
        propval = The text to show at the top of the dialog that can be
          opened from the button.
          
          The string may contain Pango markup.
  */
  @property void heading(string propval)
  {
    return setHeading(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the app chooser dialog should be modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the app chooser dialog should be modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `showDefaultItem` property.
      Returns: Determines whether the dropdown menu shows the default application
        on top for the provided content type.
  */
  @property bool showDefaultItem()
  {
    return getShowDefaultItem();
  }

  /**
      Set `showDefaultItem` property.
      Params:
        propval = Determines whether the dropdown menu shows the default application
          on top for the provided content type.
  */
  @property void showDefaultItem(bool propval)
  {
    return setShowDefaultItem(propval);
  }

  /**
      Get `showDialogItem` property.
      Returns: Determines whether the dropdown menu shows an item to open
        a [gtk.app_chooser_dialog.AppChooserDialog].
  */
  @property bool showDialogItem()
  {
    return getShowDialogItem();
  }

  /**
      Set `showDialogItem` property.
      Params:
        propval = Determines whether the dropdown menu shows an item to open
          a [gtk.app_chooser_dialog.AppChooserDialog].
  */
  @property void showDialogItem(bool propval)
  {
    return setShowDialogItem(propval);
  }

  mixin AppChooserT!();

  /**
      Creates a new [gtk.app_chooser_button.AppChooserButton] for applications
      that can handle content of the given type.
  
      Params:
        contentType = the content type to show applications for
      Returns: a newly created [gtk.app_chooser_button.AppChooserButton]
  
      Deprecated: This widget will be removed in GTK 5
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
      in the popup.
      
      The item name must be unique per-widget. Clients can use the
      provided name as a detail for the
      `signalGtk.AppChooserButton::custom-item-activated` signal, to add a
      callback for the activation of a particular custom item in the list.
      
      See also [gtk.app_chooser_button.AppChooserButton.appendSeparator].
  
      Params:
        name = the name of the custom item
        label = the label for the custom item
        icon = the icon for the custom item
  
      Deprecated: This widget will be removed in GTK 5
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
  
      Deprecated: This widget will be removed in GTK 5
  */
  void appendSeparator()
  {
    gtk_app_chooser_button_append_separator(cast(GtkAppChooserButton*)this._cPtr);
  }

  /**
      Returns the text to display at the top of the dialog.
      Returns: the text to display at the top of the dialog,
          or null, in which case a default text is displayed
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getHeading()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_button_get_heading(cast(GtkAppChooserButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the dialog is modal.
      Returns: true if the dialog is modal
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_button_get_modal(cast(GtkAppChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the dropdown menu should show the default
      application at the top.
      Returns: the value of `propertyGtk.AppChooserButton:show-default-item`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowDefaultItem()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_button_get_show_default_item(cast(GtkAppChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the dropdown menu shows an item
      for a [gtk.app_chooser_dialog.AppChooserDialog].
      Returns: the value of `propertyGtk.AppChooserButton:show-dialog-item`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowDialogItem()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_button_get_show_dialog_item(cast(GtkAppChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Selects a custom item.
      
      See [gtk.app_chooser_button.AppChooserButton.appendCustomItem].
      
      Use [gtk.app_chooser.AppChooser.refresh] to bring the selection
      to its initial state.
  
      Params:
        name = the name of the custom item
  
      Deprecated: This widget will be removed in GTK 5
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
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setHeading(string heading)
  {
    const(char)* _heading = heading.toCString(No.Alloc);
    gtk_app_chooser_button_set_heading(cast(GtkAppChooserButton*)this._cPtr, _heading);
  }

  /**
      Sets whether the dialog should be modal.
  
      Params:
        modal = true to make the dialog modal
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setModal(bool modal)
  {
    gtk_app_chooser_button_set_modal(cast(GtkAppChooserButton*)this._cPtr, modal);
  }

  /**
      Sets whether the dropdown menu of this button should show the
      default application for the given content type at top.
  
      Params:
        setting = the new value for `propertyGtk.AppChooserButton:show-default-item`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowDefaultItem(bool setting)
  {
    gtk_app_chooser_button_set_show_default_item(cast(GtkAppChooserButton*)this._cPtr, setting);
  }

  /**
      Sets whether the dropdown menu of this button should show an
      entry to trigger a [gtk.app_chooser_dialog.AppChooserDialog].
  
      Params:
        setting = the new value for `propertyGtk.AppChooserButton:show-dialog-item`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowDialogItem(bool setting)
  {
    gtk_app_chooser_button_set_show_dialog_item(cast(GtkAppChooserButton*)this._cPtr, setting);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to when the button is activated.
        
        The `::activate` signal on [gtk.app_chooser_button.AppChooserButton] is an action signal and
        emitting it causes the button to pop up its dialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.app_chooser_button.AppChooserButton appChooserButton))
  
          `appChooserButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.app_chooser_button.AppChooserButton)))
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
      Connect to `Changed` signal.
  
      Emitted when the active application changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.app_chooser_button.AppChooserButton appChooserButton))
  
          `appChooserButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.app_chooser_button.AppChooserButton)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `CustomItemActivated` signal.
  
      Emitted when a custom item is activated.
        
        Use [gtk.app_chooser_button.AppChooserButton.appendCustomItem],
        to add custom items.
  
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
