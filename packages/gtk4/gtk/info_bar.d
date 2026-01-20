/// Module for [InfoBar] class
module gtk.info_bar;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.info_bar.InfoBar] can be used to show messages to the user without a dialog.
    
    ![An example GtkInfoBar](info-bar.png)
    
    It is often temporarily shown at the top or bottom of a document.
    In contrast to [gtk.dialog.Dialog], which has an action area at the
    bottom, [gtk.info_bar.InfoBar] has an action area at the side.
    
    The API of [gtk.info_bar.InfoBar] is very similar to [gtk.dialog.Dialog], allowing you
    to add buttons to the action area with [gtk.info_bar.InfoBar.addButton]
    or [gtk.info_bar.InfoBar.newWithButtons]. The sensitivity of action widgets
    can be controlled with [gtk.info_bar.InfoBar.setResponseSensitive].
    
    To add widgets to the main content area of a [gtk.info_bar.InfoBar], use
    [gtk.info_bar.InfoBar.addChild].
    
    Similar to [gtk.message_dialog.MessageDialog], the contents of a [gtk.info_bar.InfoBar]
    can by classified as error message, warning, informational message, etc,
    by using [gtk.info_bar.InfoBar.setMessageType]. GTK may use the message
    type to determine how the message is displayed.
    
    A simple example for using a [gtk.info_bar.InfoBar]:
    ```c
    GtkWidget *message_label;
    GtkWidget *widget;
    GtkWidget *grid;
    GtkInfoBar *bar;
    
    // set up info bar
    widget = gtk_info_bar_new ();
    bar = GTK_INFO_BAR (widget);
    grid = gtk_grid_new ();
    
    message_label = gtk_label_new ("");
    gtk_info_bar_add_child (bar, message_label);
    gtk_info_bar_add_button (bar,
                             _("_OK"),
                             GTK_RESPONSE_OK);
    g_signal_connect (bar,
                      "response",
                      G_CALLBACK (gtk_widget_hide),
                      NULL);
    gtk_grid_attach (GTK_GRID (grid),
                     widget,
                     0, 2, 1, 1);
    
    // ...
    
    // show an error message
    gtk_label_set_text (GTK_LABEL (message_label), "An error occurred!");
    gtk_info_bar_set_message_type (bar, GTK_MESSAGE_ERROR);
    gtk_widget_show (bar);
    ```
    
    # GtkInfoBar as GtkBuildable
    
    [gtk.info_bar.InfoBar] supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area).
    
    [gtk.info_bar.InfoBar] supports adding action widgets by specifying “action” as
    the “type” attribute of a `<child>` element. The widget will be added
    either to the action area. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    # CSS nodes
    
    [gtk.info_bar.InfoBar] has a single CSS node with name infobar. The node may get
    one of the style classes .info, .warning, .error or .question, depending
    on the message type.
    If the info bar shows a close button, that button will have the .close
    style class applied.

    Deprecated: There is no replacement in GTK for an "info bar" widget;
        you can use [gtk.revealer.Revealer] with a [gtk.box.Box] containing a
        [gtk.label.Label] and an optional [gtk.button.Button], according to
        your application's design.
*/
class InfoBar : gtk.widget.Widget
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
    return cast(void function())gtk_info_bar_get_type != &gidSymbolNotFound ? gtk_info_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InfoBar self()
  {
    return this;
  }

  /**
      Get `messageType` property.
      Returns: The type of the message.
        
        The type may be used to determine the appearance of the info bar.
  */
  @property gtk.types.MessageType messageType()
  {
    return getMessageType();
  }

  /**
      Set `messageType` property.
      Params:
        propval = The type of the message.
          
          The type may be used to determine the appearance of the info bar.
  */
  @property void messageType(gtk.types.MessageType propval)
  {
    return setMessageType(propval);
  }

  /**
      Get `revealed` property.
      Returns: Whether the info bar shows its contents.
  */
  @property bool revealed()
  {
    return getRevealed();
  }

  /**
      Set `revealed` property.
      Params:
        propval = Whether the info bar shows its contents.
  */
  @property void revealed(bool propval)
  {
    return setRevealed(propval);
  }

  /**
      Get `showCloseButton` property.
      Returns: Whether to include a standard close button.
  */
  @property bool showCloseButton()
  {
    return getShowCloseButton();
  }

  /**
      Set `showCloseButton` property.
      Params:
        propval = Whether to include a standard close button.
  */
  @property void showCloseButton(bool propval)
  {
    return setShowCloseButton(propval);
  }

  /**
      Creates a new [gtk.info_bar.InfoBar] object.
      Returns: a new [gtk.info_bar.InfoBar] object
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_info_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Add an activatable widget to the action area of a [gtk.info_bar.InfoBar].
      
      This also connects a signal handler that will emit the
      [gtk.info_bar.InfoBar.response] signal on the message area
      when the widget is activated. The widget is appended to the
      end of the message areas action area.
  
      Params:
        child = an activatable widget
        responseId = response ID for child
  */
  void addActionWidget(gtk.widget.Widget child, int responseId)
  {
    gtk_info_bar_add_action_widget(cast(GtkInfoBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, responseId);
  }

  /**
      Adds a button with the given text.
      
      Clicking the button will emit the [gtk.info_bar.InfoBar.response]
      signal with the given response_id. The button is appended to the
      end of the info bar's action area. The button widget is returned,
      but usually you don't need it.
  
      Params:
        buttonText = text of button
        responseId = response ID for the button
      Returns: the [gtk.button.Button] widget
        that was added
  */
  gtk.button.Button addButton(string buttonText, int responseId)
  {
    GtkWidget* _cretval;
    const(char)* _buttonText = buttonText.toCString(No.Alloc);
    _cretval = gtk_info_bar_add_button(cast(GtkInfoBar*)this._cPtr, _buttonText, responseId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a widget to the content area of the info bar.
  
      Params:
        widget = the child to be added
  */
  void addChild(gtk.widget.Widget widget)
  {
    gtk_info_bar_add_child(cast(GtkInfoBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Returns the message type of the message area.
      Returns: the message type of the message area.
  */
  gtk.types.MessageType getMessageType()
  {
    GtkMessageType _cretval;
    _cretval = gtk_info_bar_get_message_type(cast(GtkInfoBar*)this._cPtr);
    gtk.types.MessageType _retval = cast(gtk.types.MessageType)_cretval;
    return _retval;
  }

  /**
      Returns whether the info bar is currently revealed.
      Returns: the current value of the [gtk.info_bar.InfoBar.revealed] property
  */
  bool getRevealed()
  {
    bool _retval;
    _retval = cast(bool)gtk_info_bar_get_revealed(cast(GtkInfoBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the widget will display a standard close button.
      Returns: true if the widget displays standard close button
  */
  bool getShowCloseButton()
  {
    bool _retval;
    _retval = cast(bool)gtk_info_bar_get_show_close_button(cast(GtkInfoBar*)this._cPtr);
    return _retval;
  }

  /**
      Removes a widget from the action area of info_bar.
      
      The widget must have been put there by a call to
      [gtk.info_bar.InfoBar.addActionWidget] or [gtk.info_bar.InfoBar.addButton].
  
      Params:
        widget = an action widget to remove
  */
  void removeActionWidget(gtk.widget.Widget widget)
  {
    gtk_info_bar_remove_action_widget(cast(GtkInfoBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Removes a widget from the content area of the info bar.
  
      Params:
        widget = a child that has been added to the content area
  */
  void removeChild(gtk.widget.Widget widget)
  {
    gtk_info_bar_remove_child(cast(GtkInfoBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Emits the “response” signal with the given response_id.
  
      Params:
        responseId = a response ID
  */
  void response(int responseId)
  {
    gtk_info_bar_response(cast(GtkInfoBar*)this._cPtr, responseId);
  }

  /**
      Sets the last widget in the info bar’s action area with
      the given response_id as the default widget for the dialog.
      
      Pressing “Enter” normally activates the default widget.
      
      Note that this function currently requires info_bar to
      be added to a widget hierarchy.
  
      Params:
        responseId = a response ID
  */
  void setDefaultResponse(int responseId)
  {
    gtk_info_bar_set_default_response(cast(GtkInfoBar*)this._cPtr, responseId);
  }

  /**
      Sets the message type of the message area.
      
      GTK uses this type to determine how the message is displayed.
  
      Params:
        messageType = a [gtk.types.MessageType]
  */
  void setMessageType(gtk.types.MessageType messageType)
  {
    gtk_info_bar_set_message_type(cast(GtkInfoBar*)this._cPtr, messageType);
  }

  /**
      Sets the sensitivity of action widgets for response_id.
      
      Calls `gtk_widget_set_sensitive (widget, setting)` for each
      widget in the info bars’s action area with the given response_id.
      A convenient way to sensitize/desensitize buttons.
  
      Params:
        responseId = a response ID
        setting = TRUE for sensitive
  */
  void setResponseSensitive(int responseId, bool setting)
  {
    gtk_info_bar_set_response_sensitive(cast(GtkInfoBar*)this._cPtr, responseId, setting);
  }

  /**
      Sets whether the [gtk.info_bar.InfoBar] is revealed.
      
      Changing this will make info_bar reveal or conceal
      itself via a sliding transition.
      
      Note: this does not show or hide info_bar in the
      [gtk.widget.Widget.visible] sense, so revealing has no effect
      if [gtk.widget.Widget.visible] is false.
  
      Params:
        revealed = The new value of the property
  */
  void setRevealed(bool revealed)
  {
    gtk_info_bar_set_revealed(cast(GtkInfoBar*)this._cPtr, revealed);
  }

  /**
      If true, a standard close button is shown.
      
      When clicked it emits the response [gtk.types.ResponseType.Close].
  
      Params:
        setting = true to include a close button
  */
  void setShowCloseButton(bool setting)
  {
    gtk_info_bar_set_show_close_button(cast(GtkInfoBar*)this._cPtr, setting);
  }

  /**
      Connect to `Close` signal.
  
      Gets emitted when the user uses a keybinding to dismiss the info bar.
        
        The ::close signal is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is the Escape key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.info_bar.InfoBar infoBar))
  
          `infoBar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.info_bar.InfoBar)))
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
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Response` signal.
  
      Emitted when an action widget is clicked.
        
        The signal is also emitted when the application programmer
        calls [gtk.info_bar.InfoBar.response]. The response_id depends
        on which action widget was clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int responseId, gtk.info_bar.InfoBar infoBar))
  
          `responseId` the response ID (optional)
  
          `infoBar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResponse(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.info_bar.InfoBar)))
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
    return connectSignalClosure("response", closure, after);
  }
}
