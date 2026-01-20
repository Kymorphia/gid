/// Module for [Dialog] class
module gtk.dialog;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.header_bar;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    Dialogs are a convenient way to prompt the user for a small amount
    of input.
    
    ![An example GtkDialog](dialog.png)
    
    Typical uses are to display a message, ask a question, or anything else
    that does not require extensive effort on the user’s part.
    
    The main area of a [gtk.dialog.Dialog] is called the "content area", and is yours
    to populate with widgets such a [gtk.label.Label] or [gtk.entry.Entry], to present
    your information, questions, or tasks to the user.
    
    In addition, dialogs allow you to add "action widgets". Most commonly,
    action widgets are buttons. Depending on the platform, action widgets may
    be presented in the header bar at the top of the window, or at the bottom
    of the window. To add action widgets, create your [gtk.dialog.Dialog] using
    [gtk.dialog.Dialog.newWithButtons], or use
    [gtk.dialog.Dialog.addButton], [gtk.dialog.Dialog.addButtons],
    or [gtk.dialog.Dialog.addActionWidget].
    
    `GtkDialogs` uses some heuristics to decide whether to add a close
    button to the window decorations. If any of the action buttons use
    the response ID [gtk.types.ResponseType.Close] or [gtk.types.ResponseType.Cancel], the
    close button is omitted.
    
    Clicking a button that was added as an action widget will emit the
    [gtk.dialog.Dialog.response] signal with a response ID that you specified.
    GTK will never assign a meaning to positive response IDs; these are
    entirely user-defined. But for convenience, you can use the response
    IDs in the [gtk.types.ResponseType] enumeration (these all have values
    less than zero). If a dialog receives a delete event, the
    [gtk.dialog.Dialog.response] signal will be emitted with the
    [gtk.types.ResponseType.DeleteEvent] response ID.
    
    Dialogs are created with a call to [gtk.dialog.Dialog.new_] or
    [gtk.dialog.Dialog.newWithButtons]. The latter is recommended; it allows
    you to set the dialog title, some convenient flags, and add buttons.
    
    A “modal” dialog (that is, one which freezes the rest of the application
    from user input), can be created by calling [gtk.window.Window.setModal]
    on the dialog. When using [gtk.dialog.Dialog.newWithButtons], you can also
    pass the [gtk.types.DialogFlags.Modal] flag to make a dialog modal.
    
    For the simple dialog in the following example, a [gtk.message_dialog.MessageDialog]
    would save some effort. But you’d need to create the dialog contents manually
    if you had more than a simple message in the dialog.
    
    An example for simple [gtk.dialog.Dialog] usage:
    
    ```c
    // Function to open a dialog box with a message
    void
    quick_message (GtkWindow *parent, char *message)
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
                               G_CALLBACK (gtk_window_destroy),
                               dialog);
    
     // Add the label, and show everything we’ve added
    
     gtk_box_append (GTK_BOX (content_area), label);
     gtk_widget_show (dialog);
    }
    ```
    
    # GtkDialog as GtkBuildable
    
    The [gtk.dialog.Dialog] implementation of the [gtk.buildable.Buildable] interface exposes the
    @content_area as an internal child with the name “content_area”.
    
    [gtk.dialog.Dialog] supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area). To mark a response
    as default, set the “default” attribute of the `<action-widget>` element
    to true.
    
    [gtk.dialog.Dialog] supports adding action widgets by specifying “action” as
    the “type” attribute of a `<child>` element. The widget will be added
    either to the action area or the headerbar of the dialog, depending
    on the “use-header-bar” property. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    An example of a [gtk.dialog.Dialog] UI definition fragment:
    
    ```xml
    <object class="GtkDialog" id="dialog1">
      <child type="action">
        <object class="GtkButton" id="button_cancel"/>
      </child>
      <child type="action">
        <object class="GtkButton" id="button_ok">
        </object>
      </child>
      <action-widgets>
        <action-widget response="cancel">button_cancel</action-widget>
        <action-widget response="ok" default="true">button_ok</action-widget>
      </action-widgets>
    </object>
    ```
    
    # Accessibility
    
    [gtk.dialog.Dialog] uses the [gtk.types.AccessibleRole.Dialog] role.

    Deprecated: Use [gtk.window.Window] instead
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
      
      Widgets should not be packed into the [gtk.window.Window]
      directly, but into the content_area and action_area,
      as described above.
      Returns: the new dialog as a [gtk.widget.Widget]
  
      Deprecated: Use [gtk.window.Window] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Adds an activatable widget to the action area of a [gtk.dialog.Dialog].
      
      GTK connects a signal handler that will emit the
      [gtk.dialog.Dialog.response] signal on the dialog when the widget
      is activated. The widget is appended to the end of the dialog’s action
      area.
      
      If you want to add a non-activatable widget, simply pack it into
      the action_area field of the [gtk.dialog.Dialog] struct.
  
      Params:
        child = an activatable widget
        responseId = response ID for child
  
      Deprecated: Use [gtk.window.Window] instead
  */
  void addActionWidget(gtk.widget.Widget child, int responseId)
  {
    gtk_dialog_add_action_widget(cast(GtkDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, responseId);
  }

  /**
      Adds a button with the given text.
      
      GTK arranges things so that clicking the button will emit the
      [gtk.dialog.Dialog.response] signal with the given response_id.
      The button is appended to the end of the dialog’s action area.
      The button widget is returned, but usually you don’t need it.
  
      Params:
        buttonText = text of button
        responseId = response ID for the button
      Returns: the [gtk.button.Button] widget that was added
  
      Deprecated: Use [gtk.window.Window] instead
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
      Returns the content area of dialog.
      Returns: the content area [gtk.box.Box].
  
      Deprecated: Use [gtk.window.Window] instead
  */
  gtk.box.Box getContentArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_content_area(cast(GtkDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.box.Box)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the header bar of dialog.
      
      Note that the headerbar is only used by the dialog if the
      `propertyGtk.Dialog:use-header-bar` property is true.
      Returns: the header bar
  
      Deprecated: Use [gtk.window.Window] instead
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
  
      Deprecated: Use [gtk.window.Window] instead
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
          response_id
  
      Deprecated: Use [gtk.window.Window] instead
  */
  gtk.widget.Widget getWidgetForResponse(int responseId)
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_widget_for_response(cast(GtkDialog*)this._cPtr, responseId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits the ::response signal with the given response ID.
      
      Used to indicate that the user has responded to the dialog in some way.
  
      Params:
        responseId = response ID
  
      Deprecated: Use [gtk.window.Window] instead
  */
  void response(int responseId)
  {
    gtk_dialog_response(cast(GtkDialog*)this._cPtr, responseId);
  }

  /**
      Sets the default widget for the dialog based on the response ID.
      
      Pressing “Enter” normally activates the default widget.
  
      Params:
        responseId = a response ID
  
      Deprecated: Use [gtk.window.Window] instead
  */
  void setDefaultResponse(int responseId)
  {
    gtk_dialog_set_default_response(cast(GtkDialog*)this._cPtr, responseId);
  }

  /**
      A convenient way to sensitize/desensitize dialog buttons.
      
      Calls `gtk_widget_set_sensitive (widget, setting)`
      for each widget in the dialog’s action area with the given response_id.
  
      Params:
        responseId = a response ID
        setting = true for sensitive
  
      Deprecated: Use [gtk.window.Window] instead
  */
  void setResponseSensitive(int responseId, bool setting)
  {
    gtk_dialog_set_response_sensitive(cast(GtkDialog*)this._cPtr, responseId, setting);
  }

  /**
      Connect to `Close` signal.
  
      Emitted when the user uses a keybinding to close the dialog.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is the Escape key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.dialog.Dialog dialog))
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gtk.window.Window] instead
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
  
      Emitted when an action widget is clicked.
        
        The signal is also emitted when the dialog receives a
        delete event, and when [gtk.dialog.Dialog.response] is called.
        On a delete event, the response ID is [gtk.types.ResponseType.DeleteEvent].
        Otherwise, it depends on which action widget was clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int responseId, gtk.dialog.Dialog dialog))
  
          `responseId` the response ID (optional)
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gtk.window.Window] instead
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
