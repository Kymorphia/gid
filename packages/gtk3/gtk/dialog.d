/// Module for [Dialog] class
module gtk.dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.header_bar;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    Dialog boxes are a convenient way to prompt the user for a small amount
    of input, e.g. to display a message, ask a question, or anything else
    that does not require extensive effort on the user’s part.
    
    GTK+ treats a dialog as a window split vertically. The top section is a
    #GtkVBox, and is where widgets such as a #GtkLabel or a #GtkEntry should
    be packed. The bottom area is known as the
    “action area”. This is generally used for
    packing buttons into the dialog which may perform functions such as
    cancel, ok, or apply.
    
    #GtkDialog boxes are created with a call to [gtk.dialog.Dialog.new_] or
    [gtk.dialog.Dialog.newWithButtons]. [gtk.dialog.Dialog.newWithButtons] is
    recommended; it allows you to set the dialog title, some convenient
    flags, and add simple buttons.
    
    If “dialog” is a newly created dialog, the two primary areas of the
    window can be accessed through [gtk.dialog.Dialog.getContentArea] and
    [gtk.dialog.Dialog.getActionArea], as can be seen from the example below.
    
    A “modal” dialog (that is, one which freezes the rest of the application
    from user input), can be created by calling [gtk.window.Window.setModal] on the
    dialog. Use the GTK_WINDOW() macro to cast the widget returned from
    [gtk.dialog.Dialog.new_] into a #GtkWindow. When using [gtk.dialog.Dialog.newWithButtons]
    you can also pass the #GTK_DIALOG_MODAL flag to make a dialog modal.
    
    If you add buttons to #GtkDialog using [gtk.dialog.Dialog.newWithButtons],
    [gtk.dialog.Dialog.addButton], [gtk.dialog.Dialog.addButtons], or
    [gtk.dialog.Dialog.addActionWidget], clicking the button will emit a signal
    called #GtkDialog::response with a response ID that you specified. GTK+
    will never assign a meaning to positive response IDs; these are entirely
    user-defined. But for convenience, you can use the response IDs in the
    #GtkResponseType enumeration (these all have values less than zero). If
    a dialog receives a delete event, the #GtkDialog::response signal will
    be emitted with a response ID of #GTK_RESPONSE_DELETE_EVENT.
    
    If you want to block waiting for a dialog to return before returning
    control flow to your code, you can call [gtk.dialog.Dialog.run]. This function
    enters a recursive main loop and waits for the user to respond to the
    dialog, returning the response ID corresponding to the button the user
    clicked.
    
    For the simple dialog in the following example, in reality you’d probably
    use #GtkMessageDialog to save yourself some effort. But you’d need to
    create the dialog contents manually if you had more than a simple message
    in the dialog.
    
    An example for simple GtkDialog usage:
    ```c
    // Function to open a dialog box with a message
    void
    quick_message (GtkWindow *parent, gchar *message)
    {
     GtkWidget *dialog, *label, *content_area;
     GtkDialogFlags flags;
    
     // Create the widgets
     flags = GTK_DIALOG_DESTROY_WITH_PARENT;
     dialog = gtk_dialog_new_with_buttons ("Message",
                                           parent,
                                           flags,
                                           _("_OK"),
                                           GTK_RESPONSE_NONE,
                                           NULL);
     content_area = gtk_dialog_get_content_area (GTK_DIALOG (dialog));
     label = gtk_label_new (message);
    
     // Ensure that the dialog box is destroyed when the user responds
    
     g_signal_connect_swapped (dialog,
                               "response",
                               G_CALLBACK (gtk_widget_destroy),
                               dialog);
    
     // Add the label, and show everything we’ve added
    
     gtk_container_add (GTK_CONTAINER (content_area), label);
     gtk_widget_show_all (dialog);
    }
    ```
    
    # GtkDialog as GtkBuildable
    
    The GtkDialog implementation of the #GtkBuildable interface exposes the
    @vbox and @action_area as internal children with the names “vbox” and
    “action_area”.
    
    GtkDialog supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area). To mark a response
    as default, set the “default“ attribute of the `<action-widget>` element
    to true.
    
    GtkDialog supports adding action widgets by specifying “action“ as
    the “type“ attribute of a `<child>` element. The widget will be added
    either to the action area or the headerbar of the dialog, depending
    on the “use-header-bar“ property. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    An example of a #GtkDialog UI definition fragment:
    
    ```xml
    <object class="GtkDialog" id="dialog1">
      <child type="action">
        <object class="GtkButton" id="button_cancel"/>
      </child>
      <child type="action">
        <object class="GtkButton" id="button_ok">
          <property name="can-default">True</property>
        </object>
      </child>
      <action-widgets>
        <action-widget response="cancel">button_cancel</action-widget>
        <action-widget response="ok" default="true">button_ok</action-widget>
      </action-widgets>
    </object>
    ```
*/
class Dialog : gtk.window.Window
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
    return cast(void function())gtk_dialog_get_type != &gidSymbolNotFound ? gtk_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Dialog self()
  {
    return this;
  }

  /**
      Creates a new dialog box.
      
      Widgets should not be packed into this #GtkWindow
      directly, but into the vbox and action_area, as described above.
      Returns: the new dialog as a #GtkWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Adds an activatable widget to the action area of a #GtkDialog,
      connecting a signal handler that will emit the #GtkDialog::response
      signal on the dialog when the widget is activated. The widget is
      appended to the end of the dialog’s action area. If you want to add a
      non-activatable widget, simply pack it into the action_area field
      of the #GtkDialog struct.
  
      Params:
        child = an activatable widget
        responseId = response ID for child
  */
  void addActionWidget(gtk.widget.Widget child, int responseId)
  {
    gtk_dialog_add_action_widget(cast(GtkDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, responseId);
  }

  /**
      Adds a button with the given text and sets things up so that
      clicking the button will emit the #GtkDialog::response signal with
      the given response_id. The button is appended to the end of the
      dialog’s action area. The button widget is returned, but usually
      you don’t need it.
  
      Params:
        buttonText = text of button
        responseId = response ID for the button
      Returns: the #GtkButton widget that was added
  */
  gtk.widget.Widget addButton(string buttonText, int responseId)
  {
    GtkWidget* _cretval;
    const(char)* _buttonText = buttonText.toCString(No.Alloc);
    _cretval = gtk_dialog_add_button(cast(GtkDialog*)this._cPtr, _buttonText, responseId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the action area of dialog.
      Returns: the action area
  
      Deprecated: Direct access to the action area
          is discouraged; use [gtk.dialog.Dialog.addButton], etc.
  */
  gtk.box.Box getActionArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_action_area(cast(GtkDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.box.Box)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the content area of dialog.
      Returns: the content area #GtkBox.
  */
  gtk.box.Box getContentArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_content_area(cast(GtkDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.box.Box)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the header bar of dialog. Note that the
      headerbar is only used by the dialog if the
      #GtkDialog:use-header-bar property is true.
      Returns: the header bar
  */
  gtk.header_bar.HeaderBar getHeaderBar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_header_bar(cast(GtkDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.header_bar.HeaderBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the response id of a widget in the action area
      of a dialog.
  
      Params:
        widget = a widget in the action area of dialog
      Returns: the response id of widget, or [gtk.types.ResponseType.None]
         if widget doesn’t have a response id set.
  */
  int getResponseForWidget(gtk.widget.Widget widget)
  {
    int _retval;
    _retval = gtk_dialog_get_response_for_widget(cast(GtkDialog*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the widget button that uses the given response ID in the action area
      of a dialog.
  
      Params:
        responseId = the response ID used by the dialog widget
      Returns: the widget button that uses the given
            response_id, or null.
  */
  gtk.widget.Widget getWidgetForResponse(int responseId)
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_widget_for_response(cast(GtkDialog*)this._cPtr, responseId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits the #GtkDialog::response signal with the given response ID.
      Used to indicate that the user has responded to the dialog in some way;
      typically either you or [gtk.dialog.Dialog.run] will be monitoring the
      ::response signal and take appropriate action.
  
      Params:
        responseId = response ID
  */
  void response(int responseId)
  {
    gtk_dialog_response(cast(GtkDialog*)this._cPtr, responseId);
  }

  /**
      Blocks in a recursive main loop until the dialog either emits the
      #GtkDialog::response signal, or is destroyed. If the dialog is
      destroyed during the call to [gtk.dialog.Dialog.run], [gtk.dialog.Dialog.run] returns
      #GTK_RESPONSE_NONE. Otherwise, it returns the response ID from the
      ::response signal emission.
      
      Before entering the recursive main loop, [gtk.dialog.Dialog.run] calls
      [gtk.widget.Widget.show] on the dialog for you. Note that you still
      need to show any children of the dialog yourself.
      
      During [gtk.dialog.Dialog.run], the default behavior of #GtkWidget::delete-event
      is disabled; if the dialog receives ::delete_event, it will not be
      destroyed as windows usually are, and [gtk.dialog.Dialog.run] will return
      #GTK_RESPONSE_DELETE_EVENT. Also, during [gtk.dialog.Dialog.run] the dialog
      will be modal. You can force [gtk.dialog.Dialog.run] to return at any time by
      calling [gtk.dialog.Dialog.response] to emit the ::response signal. Destroying
      the dialog during [gtk.dialog.Dialog.run] is a very bad idea, because your
      post-run code won’t know whether the dialog was destroyed or not.
      
      After [gtk.dialog.Dialog.run] returns, you are responsible for hiding or
      destroying the dialog if you wish to do so.
      
      Typical usage of this function might be:
      ```c
        GtkWidget *dialog = gtk_dialog_new ();
        // Set up dialog...
      
        int result = gtk_dialog_run (GTK_DIALOG (dialog));
        switch (result)
          {
            case GTK_RESPONSE_ACCEPT:
               // do_application_specific_something ();
               break;
            default:
               // do_nothing_since_dialog_was_cancelled ();
               break;
          }
        gtk_widget_destroy (dialog);
      ```
      
      Note that even though the recursive main loop gives the effect of a
      modal dialog (it prevents the user from interacting with other
      windows in the same window group while the dialog is run), callbacks
      such as timeouts, IO channel watches, DND drops, etc, will
      be triggered during a [gtk.dialog.Dialog.run] call.
      Returns: response ID
  */
  int run()
  {
    int _retval;
    _retval = gtk_dialog_run(cast(GtkDialog*)this._cPtr);
    return _retval;
  }

  /**
      Sets an alternative button order. If the
      #GtkSettings:gtk-alternative-button-order setting is set to true,
      the dialog buttons are reordered according to the order of the
      response ids in new_order.
      
      See [gtk.dialog.Dialog.setAlternativeButtonOrder] for more information.
      
      This function is for use by language bindings.
  
      Params:
        newOrder = an array of response ids of
              dialog’s buttons
  
      Deprecated: Deprecated
  */
  void setAlternativeButtonOrderFromArray(int[] newOrder)
  {
    int _nParams;
    if (newOrder)
      _nParams = cast(int)newOrder.length;

    auto _newOrder = cast(int*)newOrder.ptr;
    gtk_dialog_set_alternative_button_order_from_array(cast(GtkDialog*)this._cPtr, _nParams, _newOrder);
  }

  /**
      Sets the last widget in the dialog’s action area with the given response_id
      as the default widget for the dialog. Pressing “Enter” normally activates
      the default widget.
  
      Params:
        responseId = a response ID
  */
  void setDefaultResponse(int responseId)
  {
    gtk_dialog_set_default_response(cast(GtkDialog*)this._cPtr, responseId);
  }

  /**
      Calls `gtk_widget_set_sensitive (widget, setting)`
      for each widget in the dialog’s action area with the given response_id.
      A convenient way to sensitize/desensitize dialog buttons.
  
      Params:
        responseId = a response ID
        setting = true for sensitive
  */
  void setResponseSensitive(int responseId, bool setting)
  {
    gtk_dialog_set_response_sensitive(cast(GtkDialog*)this._cPtr, responseId, setting);
  }

  /**
      Connect to `Close` signal.
  
      The ::close signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user uses a keybinding to close
        the dialog.
        
        The default binding for this signal is the Escape key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.dialog.Dialog dialog))
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.dialog.Dialog)))
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
  
      Emitted when an action widget is clicked, the dialog receives a
        delete event, or the application programmer calls [gtk.dialog.Dialog.response].
        On a delete event, the response ID is #GTK_RESPONSE_DELETE_EVENT.
        Otherwise, it depends on which action widget was clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int responseId, gtk.dialog.Dialog dialog))
  
          `responseId` the response ID (optional)
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResponse(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.dialog.Dialog)))
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
