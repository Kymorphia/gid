/// Module for [InfoBar] class
module gtk.info_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    #GtkInfoBar is a widget that can be used to show messages to
    the user without showing a dialog. It is often temporarily shown
    at the top or bottom of a document. In contrast to #GtkDialog, which
    has a action area at the bottom, #GtkInfoBar has an action area
    at the side.
    
    The API of #GtkInfoBar is very similar to #GtkDialog, allowing you
    to add buttons to the action area with [gtk.info_bar.InfoBar.addButton] or
    [gtk.info_bar.InfoBar.newWithButtons]. The sensitivity of action widgets
    can be controlled with [gtk.info_bar.InfoBar.setResponseSensitive].
    To add widgets to the main content area of a #GtkInfoBar, use
    [gtk.info_bar.InfoBar.getContentArea] and add your widgets to the container.
    
    Similar to #GtkMessageDialog, the contents of a #GtkInfoBar can by
    classified as error message, warning, informational message, etc,
    by using [gtk.info_bar.InfoBar.setMessageType]. GTK+ may use the message type
    to determine how the message is displayed.
    
    A simple example for using a #GtkInfoBar:
    ```c
    GtkWidget *widget, *message_label, *content_area;
    GtkWidget *grid;
    GtkInfoBar *bar;
    
    // set up info bar
    widget = gtk_info_bar_new ();
    bar = GTK_INFO_BAR (widget);
    grid = gtk_grid_new ();
    
    gtk_widget_set_no_show_all (widget, TRUE);
    message_label = gtk_label_new ("");
    content_area = gtk_info_bar_get_content_area (bar);
    gtk_container_add (GTK_CONTAINER (content_area),
                       message_label);
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
    gtk_info_bar_set_message_type (bar,
                                   GTK_MESSAGE_ERROR);
    gtk_widget_show (bar);
    ```
    
    # GtkInfoBar as GtkBuildable
    
    The GtkInfoBar implementation of the GtkBuildable interface exposes
    the content area and action area as internal children with the names
    “content_area” and “action_area”.
    
    GtkInfoBar supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area).
    
    # CSS nodes
    
    GtkInfoBar has a single CSS node with name infobar. The node may get
    one of the style classes .info, .warning, .error or .question, depending
    on the message type.
*/
class InfoBar : gtk.box.Box
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

  /** */
  @property bool revealed()
  {
    return getRevealed();
  }

  /** */
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
      Creates a new #GtkInfoBar object.
      Returns: a new #GtkInfoBar object
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_info_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Add an activatable widget to the action area of a #GtkInfoBar,
      connecting a signal handler that will emit the #GtkInfoBar::response
      signal on the message area when the widget is activated. The widget
      is appended to the end of the message areas action area.
  
      Params:
        child = an activatable widget
        responseId = response ID for child
  */
  void addActionWidget(gtk.widget.Widget child, int responseId)
  {
    gtk_info_bar_add_action_widget(cast(GtkInfoBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, responseId);
  }

  /**
      Adds a button with the given text and sets things up so that
      clicking the button will emit the “response” signal with the given
      response_id. The button is appended to the end of the info bars's
      action area. The button widget is returned, but usually you don't
      need it.
  
      Params:
        buttonText = text of button
        responseId = response ID for the button
      Returns: the #GtkButton widget
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
      Returns the action area of info_bar.
      Returns: the action area
  */
  gtk.box.Box getActionArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_info_bar_get_action_area(cast(GtkInfoBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.box.Box)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the content area of info_bar.
      Returns: the content area
  */
  gtk.box.Box getContentArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_info_bar_get_content_area(cast(GtkInfoBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.box.Box)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
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

  /** */
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
      
      GTK+ uses this type to determine how the message is displayed.
  
      Params:
        messageType = a #GtkMessageType
  */
  void setMessageType(gtk.types.MessageType messageType)
  {
    gtk_info_bar_set_message_type(cast(GtkInfoBar*)this._cPtr, messageType);
  }

  /**
      Calls gtk_widget_set_sensitive (widget, setting) for each
      widget in the info bars’s action area with the given response_id.
      A convenient way to sensitize/desensitize dialog buttons.
  
      Params:
        responseId = a response ID
        setting = TRUE for sensitive
  */
  void setResponseSensitive(int responseId, bool setting)
  {
    gtk_info_bar_set_response_sensitive(cast(GtkInfoBar*)this._cPtr, responseId, setting);
  }

  /**
      Sets the GtkInfoBar:revealed property to revealed. This will cause
      info_bar to show up with a slide-in transition.
      
      Note that this property does not automatically show info_bar and thus won’t
      have any effect if it is invisible.
  
      Params:
        revealed = The new value of the property
  */
  void setRevealed(bool revealed)
  {
    gtk_info_bar_set_revealed(cast(GtkInfoBar*)this._cPtr, revealed);
  }

  /**
      If true, a standard close button is shown. When clicked it emits
      the response [gtk.types.ResponseType.Close].
  
      Params:
        setting = true to include a close button
  */
  void setShowCloseButton(bool setting)
  {
    gtk_info_bar_set_show_close_button(cast(GtkInfoBar*)this._cPtr, setting);
  }

  /**
      Connect to `Close` signal.
  
      The ::close signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted when the user uses a keybinding to dismiss
      the info bar.
      
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
  
      Emitted when an action widget is clicked or the application programmer
      calls [gtk.dialog.Dialog.response]. The response_id depends on which action
      widget was clicked.
  
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
