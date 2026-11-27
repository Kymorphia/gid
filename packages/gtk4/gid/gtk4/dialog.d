/// Module for [Dialog] class
module gid.gtk4.dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.box;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.header_bar;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.gtk4.window;

/**
    Dialogs are a convenient way to prompt the user for a small amount
    of input.
    
    <picture>
      <source srcset="dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkDialog" src="dialog.png">
    </picture>
    
    Typical uses are to display a message, ask a question, or anything else
    that does not require extensive effort on the user’s part.
    
    The main area of a [gid.gtk4.dialog.Dialog] is called the "content area", and is yours
    to populate with widgets such a [gid.gtk4.label.Label] or [gid.gtk4.entry.Entry], to present
    your information, questions, or tasks to the user.
    
    In addition, dialogs allow you to add "action widgets". Most commonly,
    action widgets are buttons. Depending on the platform, action widgets may
    be presented in the header bar at the top of the window, or at the bottom
    of the window. To add action widgets, create your [gid.gtk4.dialog.Dialog] using
    [gid.gtk4.dialog.Dialog.newWithButtons], or use
    [gid.gtk4.dialog.Dialog.addButton], [gid.gtk4.dialog.Dialog.addButtons],
    or [gid.gtk4.dialog.Dialog.addActionWidget].
    
    `GtkDialogs` uses some heuristics to decide whether to add a close
    button to the window decorations. If any of the action buttons use
    the response ID [gid.gtk4.types.ResponseType.Close] or [gid.gtk4.types.ResponseType.Cancel], the
    close button is omitted.
    
    Clicking a button that was added as an action widget will emit the
    [gid.gtk4.dialog.Dialog.response] signal with a response ID that you specified.
    GTK will never assign a meaning to positive response IDs; these are
    entirely user-defined. But for convenience, you can use the response
    IDs in the [gid.gtk4.types.ResponseType] enumeration (these all have values
    less than zero). If a dialog receives a delete event, the
    [gid.gtk4.dialog.Dialog.response] signal will be emitted with the
    [gid.gtk4.types.ResponseType.DeleteEvent] response ID.
    
    Dialogs are created with a call to [gid.gtk4.dialog.Dialog.new_] or
    [gid.gtk4.dialog.Dialog.newWithButtons]. The latter is recommended; it allows
    you to set the dialog title, some convenient flags, and add buttons.
    
    A “modal” dialog (that is, one which freezes the rest of the application
    from user input), can be created by calling [gid.gtk4.window.Window.setModal]
    on the dialog. When using [gid.gtk4.dialog.Dialog.newWithButtons], you can also
    pass the [gid.gtk4.types.DialogFlags.Modal] flag to make a dialog modal.
    
    For the simple dialog in the following example, a [gid.gtk4.message_dialog.MessageDialog]
    would save some effort. But you’d need to create the dialog contents manually
    if you had more than a simple message in the dialog.
    
    An example for simple [gid.gtk4.dialog.Dialog] usage:
    
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
    
    The [gid.gtk4.dialog.Dialog] implementation of the [gid.gtk4.buildable.Buildable] interface exposes the
    @content_area as an internal child with the name “content_area”.
    
    [gid.gtk4.dialog.Dialog] supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area). To mark a response
    as default, set the “default” attribute of the `<action-widget>` element
    to true.
    
    [gid.gtk4.dialog.Dialog] supports adding action widgets by specifying “action” as
    the “type” attribute of a `<child>` element. The widget will be added
    either to the action area or the headerbar of the dialog, depending
    on the “use-header-bar” property. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    An example of a [gid.gtk4.dialog.Dialog] UI definition fragment:
    
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
    
    [gid.gtk4.dialog.Dialog] uses the [gid.gtk4.types.AccessibleRole.Dialog] role.

    Deprecated: Use [gid.gtk4.window.Window] instead
*/
@gidGir("Dialog", "DialogClass")
class Dialog : gid.gtk4.window.Window
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
    return cast(void function())gtk_dialog_get_type != &gidSymbolNotFound ? gtk_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override Dialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.dialog.Dialog]
      Returns: New builder object
  */
  static DialogGidBuilder builder() nothrow
  {
    return new DialogGidBuilder;
  }

  /**
      Get `useHeaderBar` property.
      Returns: true if the dialog uses a headerbar for action buttons
        instead of the action-area.
        
        For technical reasons, this property is declared as an integer
        property, but you should only set it to true or false.
        
        ## Creating a dialog with headerbar
        
        Builtin [gid.gtk4.dialog.Dialog] subclasses such as [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
        set this property according to platform conventions (using the
        [gid.gtk4.settings.Settings.gtkDialogsUseHeader] setting).
        
        Here is how you can achieve the same:
        
        ```c
        g_object_get (settings, "gtk-dialogs-use-header", &header, NULL);
        dialog = g_object_new (GTK_TYPE_DIALOG, header, TRUE, NULL);
        ```
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  @property int useHeaderBar() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("use-header-bar");
  }

  /**
      Creates a new dialog box.
      
      Widgets should not be packed into the [gid.gtk4.window.Window]
      directly, but into the content_area and action_area,
      as described above.
      Returns: the new dialog as a [gid.gtk4.widget.Widget]
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_dialog_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Signal emitted when the user uses a keybinding to close the dialog.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncClose()
  {
    auto _klass = cast(GtkDialogClass*)_vfuncClass;
    if (!_klass.close)
      return;

    _klass.close(cast(GtkDialog*)this._cPtr);
  }

  /**
      Emits the ::response signal with the given response ID.
      
      Used to indicate that the user has responded to the dialog in some way.
  
      Params:
        responseId = response ID
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncResponse` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  protected void vfuncResponse(int responseId)
  {
    auto _klass = cast(GtkDialogClass*)_vfuncClass;
    if (!_klass.response)
      return;

    _klass.response(cast(GtkDialog*)this._cPtr, responseId);
  }

  /**
      Adds an activatable widget to the action area of a [gid.gtk4.dialog.Dialog].
      
      GTK connects a signal handler that will emit the
      [gid.gtk4.dialog.Dialog.response] signal on the dialog when the widget
      is activated. The widget is appended to the end of the dialog’s action
      area.
      
      If you want to add a non-activatable widget, simply pack it into
      the action_area field of the [gid.gtk4.dialog.Dialog] struct.
  
      Params:
        child = an activatable widget
        responseId = response ID for child
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  void addActionWidget(gid.gtk4.widget.Widget child, int responseId) nothrow
  {
    gtk_dialog_add_action_widget(cast(GtkDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, responseId);
  }

  /**
      Adds a button with the given text.
      
      GTK arranges things so that clicking the button will emit the
      [gid.gtk4.dialog.Dialog.response] signal with the given response_id.
      The button is appended to the end of the dialog’s action area.
      The button widget is returned, but usually you don’t need it.
  
      Params:
        buttonText = text of button
        responseId = response ID for the button
      Returns: the [gid.gtk4.button.Button] widget that was added
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  gid.gtk4.widget.Widget addButton(string buttonText, int responseId) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _buttonText = buttonText.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_dialog_add_button(cast(GtkDialog*)this._cPtr, _buttonText, responseId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the content area of dialog.
      Returns: the content area [gid.gtk4.box.Box].
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  gid.gtk4.box.Box getContentArea() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_content_area(cast(GtkDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.box.Box)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the header bar of dialog.
      
      Note that the headerbar is only used by the dialog if the
      [gid.gtk4.dialog.Dialog.useHeaderBar] property is true.
      Returns: the header bar
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  gid.gtk4.header_bar.HeaderBar getHeaderBar() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_header_bar(cast(GtkDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.header_bar.HeaderBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the response id of a widget in the action area
      of a dialog.
  
      Params:
        widget = a widget in the action area of dialog
      Returns: the response id of widget, or [gid.gtk4.types.ResponseType.None]
         if widget doesn’t have a response id set.
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  int getResponseForWidget(gid.gtk4.widget.Widget widget) nothrow
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
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  gid.gtk4.widget.Widget getWidgetForResponse(int responseId) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_dialog_get_widget_for_response(cast(GtkDialog*)this._cPtr, responseId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits the ::response signal with the given response ID.
      
      Used to indicate that the user has responded to the dialog in some way.
  
      Params:
        responseId = response ID
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  void response(int responseId) nothrow
  {
    gtk_dialog_response(cast(GtkDialog*)this._cPtr, responseId);
  }

  /**
      Sets the default widget for the dialog based on the response ID.
      
      Pressing “Enter” normally activates the default widget.
  
      Params:
        responseId = a response ID
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  void setDefaultResponse(int responseId) nothrow
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
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  void setResponseSensitive(int responseId, bool setting) nothrow
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
  
          `void callback(gid.gtk4.dialog.Dialog dialog)`
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  gulong connectClose(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.dialog.Dialog)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.dialog.Dialog.close");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Response` signal.
  
      Emitted when an action widget is clicked.
        
        The signal is also emitted when the dialog receives a
        delete event, and when [gid.gtk4.dialog.Dialog.response] is called.
        On a delete event, the response ID is [gid.gtk4.types.ResponseType.DeleteEvent].
        Otherwise, it depends on which action widget was clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int responseId, gid.gtk4.dialog.Dialog dialog)`
  
          `responseId` the response ID (optional)
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  gulong connectResponse(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.dialog.Dialog)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.dialog.Dialog.response");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("response", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Dialog
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.dialog.Dialog), T.stringof ~ " is not derived from gid.gtk4.dialog.Dialog");

    gid.gtk4.window.Window._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gtk4.dialog.Dialog))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResponse", true)[0]) == gid.gtk4.dialog.Dialog))
      _installVfunc(klass, "response");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkDialogClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) void _vfuncCloseTramp(GtkDialog* dialog) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.dialog.Dialog)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dialog);
          if (!_obj)
          {
            auto _klass = cast(GtkDialogClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dialog);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(dialog);
            return;
          }

          try
          {
            _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.dialog.Dialog.vfuncClose");
          }
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "response":
      {
        static extern(C) void _vfuncResponseTramp(GtkDialog* dialog, int responseId) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.dialog.Dialog)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dialog);
          if (!_obj)
          {
            auto _klass = cast(GtkDialogClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dialog);
            if (_klass.response)
              return (cast(typeof(&_vfuncResponseTramp))_klass.response)(dialog, responseId);
            return;
          }

          try
          {
            _obj.vfuncResponse(responseId);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.dialog.Dialog.vfuncResponse");
          }
        }

        _klass.response = cast(typeof(_klass.response))&_vfuncResponseTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.dialog.Dialog]
class DialogGidBuilderImpl(T) : gid.gtk4.window.WindowGidBuilderImpl!T
{


  /**
      Set `useHeaderBar` property.
      Params:
        propval = true if the dialog uses a headerbar for action buttons
          instead of the action-area.
          
          For technical reasons, this property is declared as an integer
          property, but you should only set it to true or false.
          
          ## Creating a dialog with headerbar
          
          Builtin [gid.gtk4.dialog.Dialog] subclasses such as [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
          set this property according to platform conventions (using the
          [gid.gtk4.settings.Settings.gtkDialogsUseHeader] setting).
          
          Here is how you can achieve the same:
          
          ```c
          g_object_get (settings, "gtk-dialogs-use-header", &header, NULL);
          dialog = g_object_new (GTK_TYPE_DIALOG, header, TRUE, NULL);
          ```
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.window.Window] instead
  */
  T useHeaderBar(int propval) nothrow
  {
    return setProperty("use-header-bar", propval);
  }
}

/// Fluent builder for [gid.gtk4.dialog.Dialog]
final class DialogGidBuilder : DialogGidBuilderImpl!DialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Dialog build() nothrow
  {
    return new Dialog(cast(void*)createGObject(Dialog._getGType), Yes.Take);
  }
}
