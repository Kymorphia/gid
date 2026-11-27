/// Module for [AlertDialog] class
module gid.adw1.alert_dialog;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.dialog;
import gid.adw1.types;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.widget;

/**
    A dialog presenting a message or a question.
    
    <picture>
      <source srcset="alert-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="alert-dialog.png" alt="alert-dialog">
    </picture>
    
    Alert dialogs have a heading, a body, an optional child widget, and one or
    multiple responses, each presented as a button.
    
    Each response has a unique string ID, and a button label. Additionally, each
    response can be enabled or disabled, and can have a suggested or destructive
    appearance.
    
    When one of the responses is activated, or the dialog is closed, the
    [gid.adw1.alert_dialog.AlertDialog.response] signal will be emitted. This signal is
    detailed, and the detail, as well as the `response` parameter will be set to
    the ID of the activated response, or to the value of the
    [gid.adw1.alert_dialog.AlertDialog.closeResponse] property if the dialog had been closed
    without activating any of the responses.
    
    Response buttons can be presented horizontally or vertically depending on
    available space.
    
    When a response is activated, [gid.adw1.alert_dialog.AlertDialog] is closed automatically.
    
    An example of using an alert dialog:
    
    ```c
    AdwDialog *dialog;
    
    dialog = adw_alert_dialog_new (_("Replace File?"), NULL);
    
    adw_alert_dialog_format_body (ADW_ALERT_DIALOG (dialog),
                                  _("A file named “%s” already exists. Do you want to replace it?"),
                                  filename);
    
    adw_alert_dialog_add_responses (ADW_ALERT_DIALOG (dialog),
                                    "cancel",  _("_Cancel"),
                                    "replace", _("_Replace"),
                                    NULL);
    
    adw_alert_dialog_set_response_appearance (ADW_ALERT_DIALOG (dialog),
                                              "replace",
                                              ADW_RESPONSE_DESTRUCTIVE);
    
    adw_alert_dialog_set_default_response (ADW_ALERT_DIALOG (dialog), "cancel");
    adw_alert_dialog_set_close_response (ADW_ALERT_DIALOG (dialog), "cancel");
    
    g_signal_connect (dialog, "response", G_CALLBACK (response_cb), self);
    
    adw_dialog_present (dialog, parent);
    ```
    
    ## Async API
    
    [gid.adw1.alert_dialog.AlertDialog] can also be used via the [gid.adw1.alert_dialog.AlertDialog.choose] method.
    This API follows the GIO async pattern, for example:
    
    ```c
    static void
    dialog_cb (AdwAlertDialog *dialog,
               GAsyncResult   *result,
               MyWindow       *self)
    {
      const char *response = adw_alert_dialog_choose_finish (dialog, result);
    
      // ...
    }
    
    static void
    show_dialog (MyWindow *self)
    {
      AdwDialog *dialog;
    
      dialog = adw_alert_dialog_new (_("Replace File?"), NULL);
    
      adw_alert_dialog_format_body (ADW_ALERT_DIALOG (dialog),
                                    _("A file named “%s” already exists. Do you want to replace it?"),
                                    filename);
    
      adw_alert_dialog_add_responses (ADW_ALERT_DIALOG (dialog),
                                      "cancel",  _("_Cancel"),
                                      "replace", _("_Replace"),
                                      NULL);
    
      adw_alert_dialog_set_response_appearance (ADW_ALERT_DIALOG (dialog),
                                                "replace",
                                                ADW_RESPONSE_DESTRUCTIVE);
    
      adw_alert_dialog_set_default_response (ADW_ALERT_DIALOG (dialog), "cancel");
      adw_alert_dialog_set_close_response (ADW_ALERT_DIALOG (dialog), "cancel");
    
      adw_alert_dialog_choose (ADW_ALERT_DIALOG (dialog), GTK_WIDGET (self),
                               NULL, (GAsyncReadyCallback) dialog_cb, self);
    }
    ```
    
    ## AdwAlertDialog as GtkBuildable
    
    [gid.adw1.alert_dialog.AlertDialog] supports adding responses in UI definitions by via the
    `<responses>` element that may contain multiple `<response>` elements, each
    representing a response.
    
    Each of the `<response>` elements must have the `id` attribute specifying the
    response ID. The contents of the element are used as the response label.
    
    Response labels can be translated with the usual `translatable`, `context`
    and `comments` attributes.
    
    The `<response>` elements can also have `enabled` and/or `appearance`
    attributes. See [gid.adw1.alert_dialog.AlertDialog.setResponseEnabled] and
    [gid.adw1.alert_dialog.AlertDialog.setResponseAppearance] for details.
    
    Example of an [gid.adw1.alert_dialog.AlertDialog] UI definition:
    
    ```xml
    <object class="AdwAlertDialog" id="dialog">
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
*/
@gidGir("AlertDialog", "AlertDialogClass")
class AlertDialog : gid.adw1.dialog.Dialog
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
    return cast(void function())adw_alert_dialog_get_type != &gidSymbolNotFound ? adw_alert_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwAlertDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override AlertDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.alert_dialog.AlertDialog]
      Returns: New builder object
  */
  static AlertDialogGidBuilder builder() nothrow
  {
    return new AlertDialogGidBuilder;
  }

  /**
      Get `body_` property.
      Returns: The body text of the dialog.
  */
  @property string body_() nothrow
  {
    return getBody();
  }

  /**
      Set `body_` property.
      Params:
        propval = The body text of the dialog.
  */
  @property void body_(string propval) nothrow
  {
    setBody(propval);
  }

  /**
      Get `bodyUseMarkup` property.
      Returns: Whether the body text includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property bool bodyUseMarkup() nothrow
  {
    return getBodyUseMarkup();
  }

  /**
      Set `bodyUseMarkup` property.
      Params:
        propval = Whether the body text includes Pango markup.
          
          See `func@Pango.parse_markup`.
  */
  @property void bodyUseMarkup(bool propval) nothrow
  {
    setBodyUseMarkup(propval);
  }

  /**
      Get `closeResponse` property.
      Returns: The ID of the close response.
        
        It will be passed to [gid.adw1.alert_dialog.AlertDialog.response] if the dialog is
        closed by pressing <kbd>Escape</kbd> or with a system action.
        
        It doesn't have to correspond to any of the responses in the dialog.
        
        The default close response is `close`.
  */
  @property string closeResponse() nothrow
  {
    return getCloseResponse();
  }

  /**
      Set `closeResponse` property.
      Params:
        propval = The ID of the close response.
          
          It will be passed to [gid.adw1.alert_dialog.AlertDialog.response] if the dialog is
          closed by pressing <kbd>Escape</kbd> or with a system action.
          
          It doesn't have to correspond to any of the responses in the dialog.
          
          The default close response is `close`.
  */
  @property void closeResponse(string propval) nothrow
  {
    setCloseResponse(propval);
  }

  /**
      Get `defaultResponse` property.
      Returns: The response ID of the default response.
        
        The button corresponding to this response will be set as the default widget
        of the dialog.
        
        If not set, the default widget will not be set, and the last added response
        will be focused by default.
        
        See [gid.adw1.dialog.Dialog.defaultWidget].
  */
  @property string defaultResponse() nothrow
  {
    return getDefaultResponse();
  }

  /**
      Set `defaultResponse` property.
      Params:
        propval = The response ID of the default response.
          
          The button corresponding to this response will be set as the default widget
          of the dialog.
          
          If not set, the default widget will not be set, and the last added response
          will be focused by default.
          
          See [gid.adw1.dialog.Dialog.defaultWidget].
  */
  @property void defaultResponse(string propval) nothrow
  {
    setDefaultResponse(propval);
  }

  /**
      Get `extraChild` property.
      Returns: The child widget.
        
        Displayed below the heading and body.
  */
  @property gid.gtk4.widget.Widget extraChild() nothrow
  {
    return getExtraChild();
  }

  /**
      Set `extraChild` property.
      Params:
        propval = The child widget.
          
          Displayed below the heading and body.
  */
  @property void extraChild(gid.gtk4.widget.Widget propval) nothrow
  {
    setExtraChild(propval);
  }

  /**
      Get `heading` property.
      Returns: The heading of the dialog.
  */
  @property string heading() nothrow
  {
    return getHeading();
  }

  /**
      Set `heading` property.
      Params:
        propval = The heading of the dialog.
  */
  @property void heading(string propval) nothrow
  {
    setHeading(propval);
  }

  /**
      Get `headingUseMarkup` property.
      Returns: Whether the heading includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property bool headingUseMarkup() nothrow
  {
    return getHeadingUseMarkup();
  }

  /**
      Set `headingUseMarkup` property.
      Params:
        propval = Whether the heading includes Pango markup.
          
          See `func@Pango.parse_markup`.
  */
  @property void headingUseMarkup(bool propval) nothrow
  {
    setHeadingUseMarkup(propval);
  }

  /**
      Get `preferWideLayout` property.
      Returns: Whether to prefer horizontal button layout.
        
        [gid.adw1.alert_dialog.AlertDialog] can present buttons horizontally or vertically depending
        on available space, how many buttons there are and how wide they are.
        
        By default it will prefer to stack buttons vertically at medium sizes.
        
        Set to `TRUE` to prefer horizontal layout in these cases instead. This will
        make the dialog slightly wider as well.
        
        Vertical layout may still be used if the dialog would get too wide
        otherwise.
        
        Does nothing with just one button, or when the buttons are already
        horizontal.
  */
  @property bool preferWideLayout() nothrow
  {
    return getPreferWideLayout();
  }

  /**
      Set `preferWideLayout` property.
      Params:
        propval = Whether to prefer horizontal button layout.
          
          [gid.adw1.alert_dialog.AlertDialog] can present buttons horizontally or vertically depending
          on available space, how many buttons there are and how wide they are.
          
          By default it will prefer to stack buttons vertically at medium sizes.
          
          Set to `TRUE` to prefer horizontal layout in these cases instead. This will
          make the dialog slightly wider as well.
          
          Vertical layout may still be used if the dialog would get too wide
          otherwise.
          
          Does nothing with just one button, or when the buttons are already
          horizontal.
  */
  @property void preferWideLayout(bool propval) nothrow
  {
    setPreferWideLayout(propval);
  }

  /**
      Creates a new [gid.adw1.alert_dialog.AlertDialog].
      
      heading and body can be set to `NULL`. This can be useful if they need to
      be formatted or use markup. In that case, set them to `NULL` and call
      [gid.adw1.alert_dialog.AlertDialog.formatBody] or similar methods afterwards:
      
      ```c
      AdwDialog *dialog;
      
      dialog = adw_alert_dialog_new (_("Replace File?"), NULL);
      adw_alert_dialog_format_body (ADW_ALERT_DIALOG (dialog),
                                    _("A file named “%s” already exists.  Do you want to replace it?"),
                                    filename);
      ```
  
      Params:
        heading = the heading
        body_ = the body text
      Returns: the newly created [gid.adw1.alert_dialog.AlertDialog]
  */
  this(string heading = null, string body_ = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, heading !is null || body_ !is null), Yes.Take);
    }
    else
    {
      AdwDialog* _cretval;
      const(char)* _heading = heading.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _body_ = body_.toCString!(No.Malloc, Yes.Nullable);
      _cretval = adw_alert_dialog_new(_heading, _body_);
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncResponse(string response)
  {
    auto _klass = cast(AdwAlertDialogClass*)_vfuncClass;
    if (!_klass.response)
      return;

    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    _klass.response(cast(AdwAlertDialog*)this._cPtr, _response);
  }

  /**
      Adds a response with id and label to self.
      
      Responses are represented as buttons in the dialog.
      
      Response ID must be unique. It will be used in [gid.adw1.alert_dialog.AlertDialog.response]
      to tell which response had been activated, as well as to inspect and modify
      the response later.
      
      An embedded underline in label indicates a mnemonic.
      
      [gid.adw1.alert_dialog.AlertDialog.setResponseLabel] can be used to change the response
      label after it had been added.
      
      [gid.adw1.alert_dialog.AlertDialog.setResponseEnabled] and
      [gid.adw1.alert_dialog.AlertDialog.setResponseAppearance] can be used to customize the
      responses further.
  
      Params:
        id = the response ID
        label = the response label
  */
  void addResponse(string id, string label) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_add_response(cast(AdwAlertDialog*)this._cPtr, _id, _label);
  }

  /**
      This function shows self to the user.
      
      If the window is an [gid.adw1.window.Window] or [gid.adw1.application_window.ApplicationWindow], the dialog
      will be shown within it. Otherwise, it will be a separate window.
  
      Params:
        parent = the parent widget
        cancellable = a [gid.gio2.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void choose(gid.gtk4.widget.Widget parent = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    adw_alert_dialog_choose(cast(AdwAlertDialog*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.adw1.alert_dialog.AlertDialog.choose] call and returns the response ID.
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: the ID of the response that was selected, or
          [gid.adw1.alert_dialog.AlertDialog.closeResponse] if the call was cancelled.
  */
  string chooseFinish(gid.gio2.async_result.AsyncResult result) nothrow
  {
    const(char)* _cretval;
    _cretval = adw_alert_dialog_choose_finish(cast(AdwAlertDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the body text of self.
      Returns: the body of self.
  */
  string getBody() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_alert_dialog_get_body(cast(AdwAlertDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the body text of self includes Pango markup.
      Returns: whether self uses markup for body text
  */
  bool getBodyUseMarkup() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_alert_dialog_get_body_use_markup(cast(AdwAlertDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the ID of the close response of self.
      Returns: the close response ID
  */
  string getCloseResponse() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_alert_dialog_get_close_response(cast(AdwAlertDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the ID of the default response of self.
      Returns: the default response ID
  */
  string getDefaultResponse() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_alert_dialog_get_default_response(cast(AdwAlertDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self.
  */
  gid.gtk4.widget.Widget getExtraChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_alert_dialog_get_extra_child(cast(AdwAlertDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the heading of self.
      Returns: the heading of self.
  */
  string getHeading() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_alert_dialog_get_heading(cast(AdwAlertDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the heading of self includes Pango markup.
      Returns: whether self uses markup for heading
  */
  bool getHeadingUseMarkup() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_alert_dialog_get_heading_use_markup(cast(AdwAlertDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self prefers horizontal button layout.
      Returns: whether to prefer wide layout
  */
  bool getPreferWideLayout() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_alert_dialog_get_prefer_wide_layout(cast(AdwAlertDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the appearance of response.
      
      See [gid.adw1.alert_dialog.AlertDialog.setResponseAppearance].
  
      Params:
        response = a response ID
      Returns: the appearance of response
  */
  gid.adw1.types.ResponseAppearance getResponseAppearance(string response) nothrow
  {
    AdwResponseAppearance _cretval;
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_alert_dialog_get_response_appearance(cast(AdwAlertDialog*)this._cPtr, _response);
    gid.adw1.types.ResponseAppearance _retval = cast(gid.adw1.types.ResponseAppearance)_cretval;
    return _retval;
  }

  /**
      Gets whether response is enabled.
      
      See [gid.adw1.alert_dialog.AlertDialog.setResponseEnabled].
  
      Params:
        response = a response ID
      Returns: whether response is enabled
  */
  bool getResponseEnabled(string response) nothrow
  {
    bool _retval;
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)adw_alert_dialog_get_response_enabled(cast(AdwAlertDialog*)this._cPtr, _response);
    return _retval;
  }

  /**
      Gets the label of response.
      
      See [gid.adw1.alert_dialog.AlertDialog.setResponseLabel].
  
      Params:
        response = a response ID
      Returns: the label of response
  */
  string getResponseLabel(string response) nothrow
  {
    const(char)* _cretval;
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_alert_dialog_get_response_label(cast(AdwAlertDialog*)this._cPtr, _response);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether self has a response with the ID response.
  
      Params:
        response = response ID
      Returns: whether self has a response with the ID response.
  */
  bool hasResponse(string response) nothrow
  {
    bool _retval;
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)adw_alert_dialog_has_response(cast(AdwAlertDialog*)this._cPtr, _response);
    return _retval;
  }

  /**
      Removes a response from self.
  
      Params:
        id = the response ID
  */
  void removeResponse(string id) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_remove_response(cast(AdwAlertDialog*)this._cPtr, _id);
  }

  /**
      Sets the body text of self.
  
      Params:
        body_ = the body of self
  */
  void setBody(string body_) nothrow
  {
    const(char)* _body_ = body_.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_set_body(cast(AdwAlertDialog*)this._cPtr, _body_);
  }

  /**
      Sets whether the body text of self includes Pango markup.
      
      See `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup for body text
  */
  void setBodyUseMarkup(bool useMarkup) nothrow
  {
    adw_alert_dialog_set_body_use_markup(cast(AdwAlertDialog*)this._cPtr, useMarkup);
  }

  /**
      Sets the ID of the close response of self.
      
      It will be passed to [gid.adw1.alert_dialog.AlertDialog.response] if the dialog is closed
      by pressing <kbd>Escape</kbd> or with a system action.
      
      It doesn't have to correspond to any of the responses in the dialog.
      
      The default close response is `close`.
  
      Params:
        response = the close response ID
  */
  void setCloseResponse(string response) nothrow
  {
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_set_close_response(cast(AdwAlertDialog*)this._cPtr, _response);
  }

  /**
      Sets the ID of the default response of self.
      
      The button corresponding to this response will be set as the default widget
      of self.
      
      If not set, the default widget will not be set, and the last added response
      will be focused by default.
      
      See [gid.adw1.dialog.Dialog.defaultWidget].
  
      Params:
        response = the default response ID
  */
  void setDefaultResponse(string response = null) nothrow
  {
    const(char)* _response = response.toCString!(No.Malloc, Yes.Nullable);
    adw_alert_dialog_set_default_response(cast(AdwAlertDialog*)this._cPtr, _response);
  }

  /**
      Sets the child widget of self.
      
      The child widget is displayed below the heading and body.
  
      Params:
        child = the child widget
  */
  void setExtraChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_alert_dialog_set_extra_child(cast(AdwAlertDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the heading of self.
  
      Params:
        heading = the heading of self
  */
  void setHeading(string heading = null) nothrow
  {
    const(char)* _heading = heading.toCString!(No.Malloc, Yes.Nullable);
    adw_alert_dialog_set_heading(cast(AdwAlertDialog*)this._cPtr, _heading);
  }

  /**
      Sets whether the heading of self includes Pango markup.
      
      See `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup for heading
  */
  void setHeadingUseMarkup(bool useMarkup) nothrow
  {
    adw_alert_dialog_set_heading_use_markup(cast(AdwAlertDialog*)this._cPtr, useMarkup);
  }

  /**
      Whether to prefer horizontal button layout.
      
      [gid.adw1.alert_dialog.AlertDialog] can present buttons horizontally or vertically depending
      on available space, how many buttons there are and how wide they are.
      
      By default it will prefer to stack buttons vertically at medium sizes.
      
      Set to `TRUE` to prefer horizontal layout in these cases instead. This will
      make the dialog slightly wider as well.
      
      Vertical layout may still be used if the dialog would get too wide
      otherwise.
      
      Does nothing with just one button, or when the buttons are already
      horizontal.
  
      Params:
        preferWideLayout = whether to prefer wide layout
  */
  void setPreferWideLayout(bool preferWideLayout) nothrow
  {
    adw_alert_dialog_set_prefer_wide_layout(cast(AdwAlertDialog*)this._cPtr, preferWideLayout);
  }

  /**
      Sets the appearance for response.
      
      <picture>
        <source srcset="alert-dialog-appearance-dark.png" media="(prefers-color-scheme: dark)">
        <img src="alert-dialog-appearance.png" alt="alert-dialog-appearance">
      </picture>
      
      Use [gid.adw1.types.ResponseAppearance.Suggested] to mark important responses such
      as the affirmative action, like the Save button in the example.
      
      Use [gid.adw1.types.ResponseAppearance.Destructive] to draw attention to the
      potentially damaging consequences of using response. This appearance acts as
      a warning to the user. The Discard button in the example is using this
      appearance.
      
      The default appearance is [gid.adw1.types.ResponseAppearance.Default].
      
      Negative responses like Cancel or Close should use the default appearance.
  
      Params:
        response = a response ID
        appearance = appearance for response
  */
  void setResponseAppearance(string response, gid.adw1.types.ResponseAppearance appearance) nothrow
  {
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_set_response_appearance(cast(AdwAlertDialog*)this._cPtr, _response, appearance);
  }

  /**
      Sets whether response is enabled.
      
      If response is not enabled, the corresponding button will have
      [gid.gtk4.widget.Widget.sensitive] set to `FALSE` and it can't be activated as
      a default response.
      
      response can still be used as [gid.adw1.alert_dialog.AlertDialog.closeResponse] while
      it's not enabled.
      
      Responses are enabled by default.
  
      Params:
        response = a response ID
        enabled = whether to enable response
  */
  void setResponseEnabled(string response, bool enabled) nothrow
  {
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_set_response_enabled(cast(AdwAlertDialog*)this._cPtr, _response, enabled);
  }

  /**
      Sets the label of response to label.
      
      Labels are displayed on the dialog buttons. An embedded underline in label
      indicates a mnemonic.
  
      Params:
        response = a response ID
        label = the label of response
  */
  void setResponseLabel(string response, string label) nothrow
  {
    const(char)* _response = response.toCString!(No.Malloc, No.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    adw_alert_dialog_set_response_label(cast(AdwAlertDialog*)this._cPtr, _response, _label);
  }

  /**
      Connect to `Response` signal.
  
      This signal is emitted when the dialog is closed.
        
        response will be set to the response ID of the button that had been
        activated.
        
        if the dialog was closed by pressing <kbd>Escape</kbd> or with a system
        action, response will be set to the value of
        [gid.adw1.alert_dialog.AlertDialog.closeResponse].
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string response, gid.adw1.alert_dialog.AlertDialog alertDialog)`
  
          `response` the response ID (optional)
  
          `alertDialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectResponse(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.adw1.alert_dialog.AlertDialog)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.alert_dialog.AlertDialog.response");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("response"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AlertDialog
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.adw1.alert_dialog.AlertDialog), T.stringof ~ " is not derived from gid.adw1.alert_dialog.AlertDialog");

    gid.adw1.dialog.Dialog._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResponse", true)[0]) == gid.adw1.alert_dialog.AlertDialog))
      _installVfunc(klass, "response");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AdwAlertDialogClass*)klass;

    switch (vfunc)
    {
      case "response":
      {
        static extern(C) void _vfuncResponseTramp(AdwAlertDialog* self, const(char)* response) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.adw1.alert_dialog.AlertDialog)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwAlertDialogClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.response)
              return (cast(typeof(&_vfuncResponseTramp))_klass.response)(self, response);
            return;
          }

          string _response = response.fromCString!(No.Free);

          try
          {
            _obj.vfuncResponse(_response);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.alert_dialog.AlertDialog.vfuncResponse");
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

/// Fluent builder implementation template for [gid.adw1.alert_dialog.AlertDialog]
class AlertDialogGidBuilderImpl(T) : gid.adw1.dialog.DialogGidBuilderImpl!T
{


  /**
      Set `body_` property.
      Params:
        propval = The body text of the dialog.
      Returns: Builder instance for fluent chaining
  */
  T body_(string propval) nothrow
  {
    return setProperty("body", propval);
  }

  /**
      Set `bodyUseMarkup` property.
      Params:
        propval = Whether the body text includes Pango markup.
          
          See `func@Pango.parse_markup`.
      Returns: Builder instance for fluent chaining
  */
  T bodyUseMarkup(bool propval) nothrow
  {
    return setProperty("body-use-markup", propval);
  }

  /**
      Set `closeResponse` property.
      Params:
        propval = The ID of the close response.
          
          It will be passed to [gid.adw1.alert_dialog.AlertDialog.response] if the dialog is
          closed by pressing <kbd>Escape</kbd> or with a system action.
          
          It doesn't have to correspond to any of the responses in the dialog.
          
          The default close response is `close`.
      Returns: Builder instance for fluent chaining
  */
  T closeResponse(string propval) nothrow
  {
    return setProperty("close-response", propval);
  }

  /**
      Set `defaultResponse` property.
      Params:
        propval = The response ID of the default response.
          
          The button corresponding to this response will be set as the default widget
          of the dialog.
          
          If not set, the default widget will not be set, and the last added response
          will be focused by default.
          
          See [gid.adw1.dialog.Dialog.defaultWidget].
      Returns: Builder instance for fluent chaining
  */
  T defaultResponse(string propval) nothrow
  {
    return setProperty("default-response", propval);
  }

  /**
      Set `extraChild` property.
      Params:
        propval = The child widget.
          
          Displayed below the heading and body.
      Returns: Builder instance for fluent chaining
  */
  T extraChild(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("extra-child", propval);
  }

  /**
      Set `heading` property.
      Params:
        propval = The heading of the dialog.
      Returns: Builder instance for fluent chaining
  */
  T heading(string propval) nothrow
  {
    return setProperty("heading", propval);
  }

  /**
      Set `headingUseMarkup` property.
      Params:
        propval = Whether the heading includes Pango markup.
          
          See `func@Pango.parse_markup`.
      Returns: Builder instance for fluent chaining
  */
  T headingUseMarkup(bool propval) nothrow
  {
    return setProperty("heading-use-markup", propval);
  }

  /**
      Set `preferWideLayout` property.
      Params:
        propval = Whether to prefer horizontal button layout.
          
          [gid.adw1.alert_dialog.AlertDialog] can present buttons horizontally or vertically depending
          on available space, how many buttons there are and how wide they are.
          
          By default it will prefer to stack buttons vertically at medium sizes.
          
          Set to `TRUE` to prefer horizontal layout in these cases instead. This will
          make the dialog slightly wider as well.
          
          Vertical layout may still be used if the dialog would get too wide
          otherwise.
          
          Does nothing with just one button, or when the buttons are already
          horizontal.
      Returns: Builder instance for fluent chaining
  */
  T preferWideLayout(bool propval) nothrow
  {
    return setProperty("prefer-wide-layout", propval);
  }
}

/// Fluent builder for [gid.adw1.alert_dialog.AlertDialog]
final class AlertDialogGidBuilder : AlertDialogGidBuilderImpl!AlertDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AlertDialog build() nothrow
  {
    return new AlertDialog(cast(void*)createGObject(AlertDialog._getGType), Yes.Take);
  }
}
