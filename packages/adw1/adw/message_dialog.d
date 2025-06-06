/// Module for [MessageDialog] class
module adw.message_dialog;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.widget;
import gtk.window;

/**
    A dialog presenting a message or a question.
    
    <picture>
      <source srcset="message-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="message-dialog.png" alt="message-dialog">
    </picture>
    
    Message dialogs have a heading, a body, an optional child widget, and one or
    multiple responses, each presented as a button.
    
    Each response has a unique string ID, and a button label. Additionally, each
    response can be enabled or disabled, and can have a suggested or destructive
    appearance.
    
    When one of the responses is activated, or the dialog is closed, the
    `signal@MessageDialog::response` signal will be emitted. This signal is
    detailed, and the detail, as well as the `response` parameter will be set to
    the ID of the activated response, or to the value of the
    `property@MessageDialog:close-response` property if the dialog had been
    closed without activating any of the responses.
    
    Response buttons can be presented horizontally or vertically depending on
    available space.
    
    When a response is activated, [adw.message_dialog.MessageDialog] is closed automatically.
    
    An example of using a message dialog:
    
    ```c
    GtkWidget *dialog;
    
    dialog = adw_message_dialog_new (parent, _("Replace File?"), NULL);
    
    adw_message_dialog_format_body (ADW_MESSAGE_DIALOG (dialog),
                                    _("A file named “%s” already exists. Do you want to replace it?"),
                                    filename);
    
    adw_message_dialog_add_responses (ADW_MESSAGE_DIALOG (dialog),
                                      "cancel",  _("_Cancel"),
                                      "replace", _("_Replace"),
                                      NULL);
    
    adw_message_dialog_set_response_appearance (ADW_MESSAGE_DIALOG (dialog), "replace", ADW_RESPONSE_DESTRUCTIVE);
    
    adw_message_dialog_set_default_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
    adw_message_dialog_set_close_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
    
    g_signal_connect (dialog, "response", G_CALLBACK (response_cb), self);
    
    gtk_window_present (GTK_WINDOW (dialog));
    ```
    
    ## Async API
    
    [adw.message_dialog.MessageDialog] can also be used via the [adw.message_dialog.MessageDialog.choose]
    method. This API follows the GIO async pattern, and the result can be
    obtained by calling [adw.message_dialog.MessageDialog.chooseFinish], for example:
    
    ```c
    static void
    dialog_cb (AdwMessageDialog *dialog,
               GAsyncResult     *result,
               MyWindow         *self)
    {
      const char *response = adw_message_dialog_choose_finish (dialog, result);
    
      // ...
    }
    
    static void
    show_dialog (MyWindow *self)
    {
      GtkWidget *dialog;
    
      dialog = adw_message_dialog_new (GTK_WINDOW (self), _("Replace File?"), NULL);
    
      adw_message_dialog_format_body (ADW_MESSAGE_DIALOG (dialog),
                                      _("A file named “%s” already exists. Do you want to replace it?"),
                                      filename);
    
      adw_message_dialog_add_responses (ADW_MESSAGE_DIALOG (dialog),
                                        "cancel",  _("_Cancel"),
                                        "replace", _("_Replace"),
                                        NULL);
    
      adw_message_dialog_set_response_appearance (ADW_MESSAGE_DIALOG (dialog), "replace", ADW_RESPONSE_DESTRUCTIVE);
    
      adw_message_dialog_set_default_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
      adw_message_dialog_set_close_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
    
      adw_message_dialog_choose (ADW_MESSAGE_DIALOG (dialog), NULL, (GAsyncReadyCallback) dialog_cb, self);
    }
    ```
    
    ## AdwMessageDialog as GtkBuildable
    
    [adw.message_dialog.MessageDialog] supports adding responses in UI definitions by via the
    `<responses>` element that may contain multiple `<response>` elements, each
    respresenting a response.
    
    Each of the `<response>` elements must have the `id` attribute specifying the
    response ID. The contents of the element are used as the response label.
    
    Response labels can be translated with the usual `translatable`, `context`
    and `comments` attributes.
    
    The `<response>` elements can also have `enabled` and/or `appearance`
    attributes. See [adw.message_dialog.MessageDialog.setResponseEnabled] and
    [adw.message_dialog.MessageDialog.setResponseAppearance] for details.
    
    Example of an [adw.message_dialog.MessageDialog] UI definition:
    
    ```xml
    <object class="AdwMessageDialog" id="dialog">
      <property name="heading" translatable="yes">Save Changes?</property>
      <property name="body" translatable="yes">Open documents contain unsaved changes. Changes which are not saved will be permanently lost.</property>
      <property name="default-response">save</property>
      <property name="close-response">cancel</property>
      <signal name="response" handler="response_cb"/>
      <responses>
        <response id="cancel" translatable="yes">_Cancel</response>
        <response id="discard" translatable="yes" appearance="destructive">_Discard</response>
        <response id="save" translatable="yes" appearance="suggested" enabled="false">_Save</response>
      </responses>
    </object>
    ```
    
    ## Accessibility
    
    [adw.message_dialog.MessageDialog] uses the [gtk.types.AccessibleRole.Dialog] role.
*/
class MessageDialog : gtk.window.Window
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
    return cast(void function())adw_message_dialog_get_type != &gidSymbolNotFound ? adw_message_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageDialog self()
  {
    return this;
  }

  /**
      Get `body_` property.
      Returns: The body text of the dialog.
  */
  @property string body_()
  {
    return getBody();
  }

  /**
      Set `body_` property.
      Params:
        propval = The body text of the dialog.
  */
  @property void body_(string propval)
  {
    return setBody(propval);
  }

  /**
      Get `bodyUseMarkup` property.
      Returns: Whether the body text includes Pango markup.
      
      See `func@Pango.parse_markup`.
  */
  @property bool bodyUseMarkup()
  {
    return getBodyUseMarkup();
  }

  /**
      Set `bodyUseMarkup` property.
      Params:
        propval = Whether the body text includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property void bodyUseMarkup(bool propval)
  {
    return setBodyUseMarkup(propval);
  }

  /**
      Get `closeResponse` property.
      Returns: The ID of the close response.
      
      It will be passed to `signal@MessageDialog::response` if the window is
      closed by pressing <kbd>Escape</kbd> or with a system action.
      
      It doesn't have to correspond to any of the responses in the dialog.
      
      The default close response is `close`.
  */
  @property string closeResponse()
  {
    return getCloseResponse();
  }

  /**
      Set `closeResponse` property.
      Params:
        propval = The ID of the close response.
        
        It will be passed to `signal@MessageDialog::response` if the window is
        closed by pressing <kbd>Escape</kbd> or with a system action.
        
        It doesn't have to correspond to any of the responses in the dialog.
        
        The default close response is `close`.
  */
  @property void closeResponse(string propval)
  {
    return setCloseResponse(propval);
  }

  /**
      Get `defaultResponse` property.
      Returns: The response ID of the default response.
      
      If set, pressing <kbd>Enter</kbd> will activate the corresponding button.
      
      If set to `NULL` or a non-existent response ID, pressing <kbd>Enter</kbd>
      will do nothing.
  */
  @property string defaultResponse()
  {
    return getDefaultResponse();
  }

  /**
      Set `defaultResponse` property.
      Params:
        propval = The response ID of the default response.
        
        If set, pressing <kbd>Enter</kbd> will activate the corresponding button.
        
        If set to `NULL` or a non-existent response ID, pressing <kbd>Enter</kbd>
        will do nothing.
  */
  @property void defaultResponse(string propval)
  {
    return setDefaultResponse(propval);
  }

  /**
      Get `extraChild` property.
      Returns: The child widget.
      
      Displayed below the heading and body.
  */
  @property gtk.widget.Widget extraChild()
  {
    return getExtraChild();
  }

  /**
      Set `extraChild` property.
      Params:
        propval = The child widget.
        
        Displayed below the heading and body.
  */
  @property void extraChild(gtk.widget.Widget propval)
  {
    return setExtraChild(propval);
  }

  /**
      Get `heading` property.
      Returns: The heading of the dialog.
  */
  @property string heading()
  {
    return getHeading();
  }

  /**
      Set `heading` property.
      Params:
        propval = The heading of the dialog.
  */
  @property void heading(string propval)
  {
    return setHeading(propval);
  }

  /**
      Get `headingUseMarkup` property.
      Returns: Whether the heading includes Pango markup.
      
      See `func@Pango.parse_markup`.
  */
  @property bool headingUseMarkup()
  {
    return getHeadingUseMarkup();
  }

  /**
      Set `headingUseMarkup` property.
      Params:
        propval = Whether the heading includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property void headingUseMarkup(bool propval)
  {
    return setHeadingUseMarkup(propval);
  }

  /**
      Creates a new [adw.message_dialog.MessageDialog].
      
      heading and body can be set to `NULL`. This can be useful if they need to
      be formatted or use markup. In that case, set them to `NULL` and call
      [adw.message_dialog.MessageDialog.formatBody] or similar methods afterwards:
      
      ```c
      GtkWidget *dialog;
      
      dialog = adw_message_dialog_new (parent, _("Replace File?"), NULL);
      adw_message_dialog_format_body (ADW_MESSAGE_DIALOG (dialog),
                                      _("A file named “%s” already exists.  Do you want to replace it?"),
                                      filename);
      ```
  
      Params:
        parent = transient parent
        heading = the heading
        body_ = the body text
      Returns: the newly created [adw.message_dialog.MessageDialog]
  */
  this(gtk.window.Window parent = null, string heading = null, string body_ = null)
  {
    GtkWidget* _cretval;
    const(char)* _heading = heading.toCString(No.Alloc);
    const(char)* _body_ = body_.toCString(No.Alloc);
    _cretval = adw_message_dialog_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, _heading, _body_);
    this(_cretval, No.Take);
  }

  /**
      Adds a response with id and label to self.
      
      Responses are represented as buttons in the dialog.
      
      Response ID must be unique. It will be used in
      `signalMessageDialog::response` to tell which response had been activated,
      as well as to inspect and modify the response later.
      
      An embedded underline in label indicates a mnemonic.
      
      [adw.message_dialog.MessageDialog.setResponseLabel] can be used to change the response
      label after it had been added.
      
      [adw.message_dialog.MessageDialog.setResponseEnabled] and
      [adw.message_dialog.MessageDialog.setResponseAppearance] can be used to customize the
      responses further.
  
      Params:
        id = the response ID
        label = the response label
  */
  void addResponse(string id, string label)
  {
    const(char)* _id = id.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    adw_message_dialog_add_response(cast(AdwMessageDialog*)this._cPtr, _id, _label);
  }

  /**
      This function shows self to the user.
      
      The callback will be called when the alert is dismissed. It should call
      [adw.message_dialog.MessageDialog.chooseFinish] to obtain the result.
  
      Params:
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void choose(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    adw_message_dialog_choose(cast(AdwMessageDialog*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [adw.message_dialog.MessageDialog.choose] call and returns the response ID.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the ID of the response that was selected, or
          `propertyMessageDialog:close-response` if the call was cancelled.
  */
  string chooseFinish(gio.async_result.AsyncResult result)
  {
    const(char)* _cretval;
    _cretval = adw_message_dialog_choose_finish(cast(AdwMessageDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the body text of self.
      Returns: the body of self.
  */
  string getBody()
  {
    const(char)* _cretval;
    _cretval = adw_message_dialog_get_body(cast(AdwMessageDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the body text of self includes Pango markup.
      Returns: whether self uses markup for body text
  */
  bool getBodyUseMarkup()
  {
    bool _retval;
    _retval = adw_message_dialog_get_body_use_markup(cast(AdwMessageDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the ID of the close response of self.
      Returns: the close response ID
  */
  string getCloseResponse()
  {
    const(char)* _cretval;
    _cretval = adw_message_dialog_get_close_response(cast(AdwMessageDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the ID of the default response of self.
      Returns: the default response ID
  */
  string getDefaultResponse()
  {
    const(char)* _cretval;
    _cretval = adw_message_dialog_get_default_response(cast(AdwMessageDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self.
  */
  gtk.widget.Widget getExtraChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_message_dialog_get_extra_child(cast(AdwMessageDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the heading of self.
      Returns: the heading of self.
  */
  string getHeading()
  {
    const(char)* _cretval;
    _cretval = adw_message_dialog_get_heading(cast(AdwMessageDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the heading of self includes Pango markup.
      Returns: whether self uses markup for heading
  */
  bool getHeadingUseMarkup()
  {
    bool _retval;
    _retval = adw_message_dialog_get_heading_use_markup(cast(AdwMessageDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the appearance of response.
      
      See [adw.message_dialog.MessageDialog.setResponseAppearance].
  
      Params:
        response = a response ID
      Returns: the appearance of response
  */
  adw.types.ResponseAppearance getResponseAppearance(string response)
  {
    AdwResponseAppearance _cretval;
    const(char)* _response = response.toCString(No.Alloc);
    _cretval = adw_message_dialog_get_response_appearance(cast(AdwMessageDialog*)this._cPtr, _response);
    adw.types.ResponseAppearance _retval = cast(adw.types.ResponseAppearance)_cretval;
    return _retval;
  }

  /**
      Gets whether response is enabled.
      
      See [adw.message_dialog.MessageDialog.setResponseEnabled].
  
      Params:
        response = a response ID
      Returns: whether response is enabled
  */
  bool getResponseEnabled(string response)
  {
    bool _retval;
    const(char)* _response = response.toCString(No.Alloc);
    _retval = adw_message_dialog_get_response_enabled(cast(AdwMessageDialog*)this._cPtr, _response);
    return _retval;
  }

  /**
      Gets the label of response.
      
      See [adw.message_dialog.MessageDialog.setResponseLabel].
  
      Params:
        response = a response ID
      Returns: the label of response
  */
  string getResponseLabel(string response)
  {
    const(char)* _cretval;
    const(char)* _response = response.toCString(No.Alloc);
    _cretval = adw_message_dialog_get_response_label(cast(AdwMessageDialog*)this._cPtr, _response);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether self has a response with the ID response.
  
      Params:
        response = response ID
      Returns: whether self has a response with the ID response.
  */
  bool hasResponse(string response)
  {
    bool _retval;
    const(char)* _response = response.toCString(No.Alloc);
    _retval = adw_message_dialog_has_response(cast(AdwMessageDialog*)this._cPtr, _response);
    return _retval;
  }

  /**
      Removes a response from self.
  
      Params:
        id = the response ID
  */
  void removeResponse(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    adw_message_dialog_remove_response(cast(AdwMessageDialog*)this._cPtr, _id);
  }

  /**
      Emits the `signalMessageDialog::response` signal with the given response ID.
      
      Used to indicate that the user has responded to the dialog in some way.
  
      Params:
        response = response ID
  */
  void response(string response)
  {
    const(char)* _response = response.toCString(No.Alloc);
    adw_message_dialog_response(cast(AdwMessageDialog*)this._cPtr, _response);
  }

  /**
      Sets the body text of self.
  
      Params:
        body_ = the body of self
  */
  void setBody(string body_)
  {
    const(char)* _body_ = body_.toCString(No.Alloc);
    adw_message_dialog_set_body(cast(AdwMessageDialog*)this._cPtr, _body_);
  }

  /**
      Sets whether the body text of self includes Pango markup.
      
      See `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup for body text
  */
  void setBodyUseMarkup(bool useMarkup)
  {
    adw_message_dialog_set_body_use_markup(cast(AdwMessageDialog*)this._cPtr, useMarkup);
  }

  /**
      Sets the ID of the close response of self.
      
      It will be passed to `signalMessageDialog::response` if the window is
      closed by pressing <kbd>Escape</kbd> or with a system action.
      
      It doesn't have to correspond to any of the responses in the dialog.
      
      The default close response is `close`.
  
      Params:
        response = the close response ID
  */
  void setCloseResponse(string response)
  {
    const(char)* _response = response.toCString(No.Alloc);
    adw_message_dialog_set_close_response(cast(AdwMessageDialog*)this._cPtr, _response);
  }

  /**
      Sets the ID of the default response of self.
      
      If set, pressing <kbd>Enter</kbd> will activate the corresponding button.
      
      If set to `NULL` or to a non-existent response ID, pressing <kbd>Enter</kbd>
      will do nothing.
  
      Params:
        response = the default response ID
  */
  void setDefaultResponse(string response = null)
  {
    const(char)* _response = response.toCString(No.Alloc);
    adw_message_dialog_set_default_response(cast(AdwMessageDialog*)this._cPtr, _response);
  }

  /**
      Sets the child widget of self.
      
      The child widget is displayed below the heading and body.
  
      Params:
        child = the child widget
  */
  void setExtraChild(gtk.widget.Widget child = null)
  {
    adw_message_dialog_set_extra_child(cast(AdwMessageDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the heading of self.
  
      Params:
        heading = the heading of self
  */
  void setHeading(string heading = null)
  {
    const(char)* _heading = heading.toCString(No.Alloc);
    adw_message_dialog_set_heading(cast(AdwMessageDialog*)this._cPtr, _heading);
  }

  /**
      Sets whether the heading of self includes Pango markup.
      
      See `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup for heading
  */
  void setHeadingUseMarkup(bool useMarkup)
  {
    adw_message_dialog_set_heading_use_markup(cast(AdwMessageDialog*)this._cPtr, useMarkup);
  }

  /**
      Sets the appearance for response.
      
      <picture>
        <source srcset="message-dialog-appearance-dark.png" media="(prefers-color-scheme: dark)">
        <img src="message-dialog-appearance.png" alt="message-dialog-appearance">
      </picture>
      
      Use [adw.types.ResponseAppearance.Suggested] to mark important responses such as the
      affirmative action, like the Save button in the example.
      
      Use [adw.types.ResponseAppearance.Destructive] to draw attention to the potentially damaging
      consequences of using response. This appearance acts as a warning to the
      user. The Discard button in the example is using this appearance.
      
      The default appearance is [adw.types.ResponseAppearance.Default].
      
      Negative responses like Cancel or Close should use the default appearance.
  
      Params:
        response = a response ID
        appearance = appearance for response
  */
  void setResponseAppearance(string response, adw.types.ResponseAppearance appearance)
  {
    const(char)* _response = response.toCString(No.Alloc);
    adw_message_dialog_set_response_appearance(cast(AdwMessageDialog*)this._cPtr, _response, appearance);
  }

  /**
      Sets whether response is enabled.
      
      If response is not enabled, the corresponding button will have
      [gtk.widget.Widget.sensitive] set to `FALSE` and it can't be activated as
      a default response.
      
      response can still be used as `propertyMessageDialog:close-response` while
      it's not enabled.
      
      Responses are enabled by default.
  
      Params:
        response = a response ID
        enabled = whether to enable response
  */
  void setResponseEnabled(string response, bool enabled)
  {
    const(char)* _response = response.toCString(No.Alloc);
    adw_message_dialog_set_response_enabled(cast(AdwMessageDialog*)this._cPtr, _response, enabled);
  }

  /**
      Sets the label of response to label.
      
      Labels are displayed on the dialog buttons. An embedded underline in label
      indicates a mnemonic.
  
      Params:
        response = a response ID
        label = the label of response
  */
  void setResponseLabel(string response, string label)
  {
    const(char)* _response = response.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    adw_message_dialog_set_response_label(cast(AdwMessageDialog*)this._cPtr, _response, _label);
  }

  /**
      Connect to `Response` signal.
  
      This signal is emitted when the dialog is closed.
      
      response will be set to the response ID of the button that had been
      activated.
      
      if the dialog was closed by pressing <kbd>Escape</kbd> or with a system
      action, response will be set to the value of
      `propertyMessageDialog:close-response`.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string response, adw.message_dialog.MessageDialog messageDialog))
  
          `response` the response ID (optional)
  
          `messageDialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResponse(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.message_dialog.MessageDialog)))
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
    return connectSignalClosure("response"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
