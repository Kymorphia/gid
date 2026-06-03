/// Module for [Toast] class
module adw.toast;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import glib.variant;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.widget;

/**
    A helper object for [adw.toast_overlay.ToastOverlay].
    
    Toasts are meant to be passed into [adw.toast_overlay.ToastOverlay.addToast] as
    follows:
    
    ```c
    adw_toast_overlay_add_toast (overlay, adw_toast_new (_("Simple Toast")));
    ```
    
    <picture>
      <source srcset="toast-simple-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-simple.png" alt="toast-simple">
    </picture>
    
    Toasts always have a close button. They emit the [adw.toast.Toast.dismissed]
    signal when disappearing.
    
    [adw.toast.Toast.timeout] determines how long the toast stays on screen, while
    [adw.toast.Toast.priority] determines how it behaves if another toast is
    already being displayed.
    
    Toast titles use Pango markup by default, set [adw.toast.Toast.useMarkup] to
    `FALSE` if this is unwanted.
    
    [adw.toast.Toast.customTitle] can be used to replace the title label with a
    custom widget.
    
    ## Actions
    
    Toasts can have one button on them, with a label and an attached
    [gio.action.Action].
    
    ```c
    AdwToast *toast = adw_toast_new (_("Toast with Action"));
    
    adw_toast_set_button_label (toast, _("_Example"));
    adw_toast_set_action_name (toast, "win.example");
    
    adw_toast_overlay_add_toast (overlay, toast);
    ```
    
    <picture>
      <source srcset="toast-action-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-action.png" alt="toast-action">
    </picture>
    
    ## Modifying toasts
    
    Toasts can be modified after they have been shown. For this, an [adw.toast.Toast]
    reference must be kept around while the toast is visible.
    
    A common use case for this is using toasts as undo prompts that stack with
    each other, allowing to batch undo the last deleted items:
    
    ```c
    
    static void
    toast_undo_cb (GtkWidget  *sender,
                   const char *action,
                   GVariant   *param)
    {
      // Undo the deletion
    }
    
    static void
    dismissed_cb (MyWindow *self)
    {
      self->undo_toast = NULL;
    
      // Permanently delete the items
    }
    
    static void
    delete_item (MyWindow *self,
                 MyItem   *item)
    {
      g_autofree char *title = NULL;
      int n_items;
    
      // Mark the item as waiting for deletion
      n_items = ... // The number of waiting items
    
      if (!self->undo_toast) {
        self->undo_toast = adw_toast_new_format (_("‘%s’ deleted"), ...);
    
        adw_toast_set_priority (self->undo_toast, ADW_TOAST_PRIORITY_HIGH);
        adw_toast_set_button_label (self->undo_toast, _("_Undo"));
        adw_toast_set_action_name (self->undo_toast, "toast.undo");
    
        g_signal_connect_swapped (self->undo_toast, "dismissed",
                                  G_CALLBACK (dismissed_cb), self);
    
        adw_toast_overlay_add_toast (self->toast_overlay, self->undo_toast);
    
        return;
      }
    
      title =
        g_strdup_printf (ngettext ("<span font_features='tnum=1'>%d</span> item deleted",
                                   "<span font_features='tnum=1'>%d</span> items deleted",
                                   n_items), n_items);
    
      adw_toast_set_title (self->undo_toast, title);
    
      // Bump the toast timeout
      adw_toast_overlay_add_toast (self->toast_overlay, g_object_ref (self->undo_toast));
    }
    
    static void
    my_window_class_init (MyWindowClass *klass)
    {
      GtkWidgetClass *widget_class = GTK_WIDGET_CLASS (klass);
    
      gtk_widget_class_install_action (widget_class, "toast.undo", NULL, toast_undo_cb);
    }
    ```
    
    <picture>
      <source srcset="toast-undo-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-undo.png" alt="toast-undo">
    </picture>
*/
class Toast : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_toast_get_type != &gidSymbolNotFound ? adw_toast_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Toast self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.toast.Toast]
      Returns: New builder object
  */
  static ToastGidBuilder builder() nothrow
  {
    return new ToastGidBuilder;
  }

  /**
      Get `actionName` property.
      Returns: The name of the associated action.
        
        It will be activated when clicking the button.
        
        See [adw.toast.Toast.actionTarget].
  */
  @property string actionName() nothrow
  {
    return getActionName();
  }

  /**
      Set `actionName` property.
      Params:
        propval = The name of the associated action.
          
          It will be activated when clicking the button.
          
          See [adw.toast.Toast.actionTarget].
  */
  @property void actionName(string propval) nothrow
  {
    setActionName(propval);
  }

  /**
      Get `actionTarget` property.
      Returns: The parameter for action invocations.
  */
  @property glib.variant.Variant actionTarget() nothrow
  {
    return getActionTargetValue();
  }

  /**
      Set `actionTarget` property.
      Params:
        propval = The parameter for action invocations.
  */
  @property void actionTarget(glib.variant.Variant propval) nothrow
  {
    setActionTargetValue(propval);
  }

  /**
      Get `buttonLabel` property.
      Returns: The label to show on the button.
        
        Underlines in the button text can be used to indicate a mnemonic.
        
        If set to `NULL`, the button won't be shown.
        
        See [adw.toast.Toast.actionName].
  */
  @property string buttonLabel() nothrow
  {
    return getButtonLabel();
  }

  /**
      Set `buttonLabel` property.
      Params:
        propval = The label to show on the button.
          
          Underlines in the button text can be used to indicate a mnemonic.
          
          If set to `NULL`, the button won't be shown.
          
          See [adw.toast.Toast.actionName].
  */
  @property void buttonLabel(string propval) nothrow
  {
    setButtonLabel(propval);
  }

  /**
      Get `customTitle` property.
      Returns: The custom title widget.
        
        It will be displayed instead of the title if set. In this case,
        [adw.toast.Toast.title] is ignored.
        
        Setting a custom title will unset [adw.toast.Toast.title].
  */
  @property gtk.widget.Widget customTitle() nothrow
  {
    return getCustomTitle();
  }

  /**
      Set `customTitle` property.
      Params:
        propval = The custom title widget.
          
          It will be displayed instead of the title if set. In this case,
          [adw.toast.Toast.title] is ignored.
          
          Setting a custom title will unset [adw.toast.Toast.title].
  */
  @property void customTitle(gtk.widget.Widget propval) nothrow
  {
    setCustomTitle(propval);
  }

  /**
      Get `priority` property.
      Returns: The priority of the toast.
        
        Priority controls how the toast behaves when another toast is already
        being displayed.
        
        If the priority is [adw.types.ToastPriority.Normal], the toast will be queued.
        
        If the priority is [adw.types.ToastPriority.High], the toast will be displayed
        immediately, pushing the previous toast into the queue instead.
  */
  @property adw.types.ToastPriority priority() nothrow
  {
    return getPriority();
  }

  /**
      Set `priority` property.
      Params:
        propval = The priority of the toast.
          
          Priority controls how the toast behaves when another toast is already
          being displayed.
          
          If the priority is [adw.types.ToastPriority.Normal], the toast will be queued.
          
          If the priority is [adw.types.ToastPriority.High], the toast will be displayed
          immediately, pushing the previous toast into the queue instead.
  */
  @property void priority(adw.types.ToastPriority propval) nothrow
  {
    setPriority(propval);
  }

  /**
      Get `timeout` property.
      Returns: The timeout of the toast, in seconds.
        
        If timeout is 0, the toast is displayed indefinitely until manually
        dismissed.
        
        Toasts cannot disappear while being hovered, pressed (on touchscreen), or
        have keyboard focus inside them.
  */
  @property uint timeout() nothrow
  {
    return getTimeout();
  }

  /**
      Set `timeout` property.
      Params:
        propval = The timeout of the toast, in seconds.
          
          If timeout is 0, the toast is displayed indefinitely until manually
          dismissed.
          
          Toasts cannot disappear while being hovered, pressed (on touchscreen), or
          have keyboard focus inside them.
  */
  @property void timeout(uint propval) nothrow
  {
    setTimeout(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the toast.
        
        The title can be marked up with the Pango text markup language.
        
        Setting a title will unset [adw.toast.Toast.customTitle].
        
        If [adw.toast.Toast.customTitle] is set, it will be used instead.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the toast.
          
          The title can be marked up with the Pango text markup language.
          
          Setting a title will unset [adw.toast.Toast.customTitle].
          
          If [adw.toast.Toast.customTitle] is set, it will be used instead.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `useMarkup` property.
      Returns: Whether to use Pango markup for the toast title.
        
        See also `func@Pango.parse_markup`.
  */
  @property bool useMarkup() nothrow
  {
    return getUseMarkup();
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = Whether to use Pango markup for the toast title.
          
          See also `func@Pango.parse_markup`.
  */
  @property void useMarkup(bool propval) nothrow
  {
    setUseMarkup(propval);
  }

  /**
      Creates a new [adw.toast.Toast].
      
      The toast will use title as its title.
      
      title can be marked up with the Pango text markup language.
  
      Params:
        title = the title to be displayed
      Returns: the new created [adw.toast.Toast]
  */
  this(string title) nothrow
  {
    AdwToast* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_toast_new(_title);
    this(_cretval, Yes.Take);
  }

  /**
      Dismisses self.
      
      Does nothing if self has already been dismissed, or hasn't been added to an
      [adw.toast_overlay.ToastOverlay].
  */
  void dismiss() nothrow
  {
    adw_toast_dismiss(cast(AdwToast*)this._cPtr);
  }

  /**
      Gets the name of the associated action.
      Returns: the action name
  */
  string getActionName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toast_get_action_name(cast(AdwToast*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the parameter for action invocations.
      Returns: the action target
  */
  glib.variant.Variant getActionTargetValue() nothrow
  {
    GVariant* _cretval;
    _cretval = adw_toast_get_action_target_value(cast(AdwToast*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the label to show on the button.
      Returns: the button label
  */
  string getButtonLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toast_get_button_label(cast(AdwToast*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the custom title widget of self.
      Returns: the custom title widget
  */
  gtk.widget.Widget getCustomTitle() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_toast_get_custom_title(cast(AdwToast*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets priority for self.
      Returns: the priority
  */
  adw.types.ToastPriority getPriority() nothrow
  {
    AdwToastPriority _cretval;
    _cretval = adw_toast_get_priority(cast(AdwToast*)this._cPtr);
    adw.types.ToastPriority _retval = cast(adw.types.ToastPriority)_cretval;
    return _retval;
  }

  /**
      Gets timeout for self.
      Returns: the timeout
  */
  uint getTimeout() nothrow
  {
    uint _retval;
    _retval = adw_toast_get_timeout(cast(AdwToast*)this._cPtr);
    return _retval;
  }

  /**
      Gets the title that will be displayed on the toast.
      
      If a custom title has been set with [adw.toast.Toast.setCustomTitle]
      the return value will be null.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toast_get_title(cast(AdwToast*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether to use Pango markup for the toast title.
      Returns: whether the toast uses markup
  */
  bool getUseMarkup() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_toast_get_use_markup(cast(AdwToast*)this._cPtr);
    return _retval;
  }

  /**
      Sets the name of the associated action.
      
      It will be activated when clicking the button.
      
      See [adw.toast.Toast.actionTarget].
  
      Params:
        actionName = the action name
  */
  void setActionName(string actionName = null) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, Yes.Nullable);
    adw_toast_set_action_name(cast(AdwToast*)this._cPtr, _actionName);
  }

  /**
      Sets the parameter for action invocations.
      
      If the action_target variant has a floating reference this function
      will sink it.
  
      Params:
        actionTarget = the action target
  */
  void setActionTargetValue(glib.variant.Variant actionTarget = null) nothrow
  {
    adw_toast_set_action_target_value(cast(AdwToast*)this._cPtr, actionTarget ? cast(GVariant*)actionTarget._cPtr(No.Dup) : null);
  }

  /**
      Sets the label to show on the button.
      
      Underlines in the button text can be used to indicate a mnemonic.
      
      If set to `NULL`, the button won't be shown.
      
      See [adw.toast.Toast.actionName].
  
      Params:
        buttonLabel = a button label
  */
  void setButtonLabel(string buttonLabel = null) nothrow
  {
    const(char)* _buttonLabel = buttonLabel.toCString!(No.Malloc, Yes.Nullable);
    adw_toast_set_button_label(cast(AdwToast*)this._cPtr, _buttonLabel);
  }

  /**
      Sets the custom title widget of self.
      
      It will be displayed instead of the title if set. In this case,
      [adw.toast.Toast.title] is ignored.
      
      Setting a custom title will unset [adw.toast.Toast.title].
  
      Params:
        widget = the custom title widget
  */
  void setCustomTitle(gtk.widget.Widget widget = null) nothrow
  {
    adw_toast_set_custom_title(cast(AdwToast*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the action name and its parameter.
      
      detailed_action_name is a string in the format accepted by
      [gio.action.Action.parseDetailedName].
  
      Params:
        detailedActionName = the detailed action name
  */
  void setDetailedActionName(string detailedActionName = null) nothrow
  {
    const(char)* _detailedActionName = detailedActionName.toCString!(No.Malloc, Yes.Nullable);
    adw_toast_set_detailed_action_name(cast(AdwToast*)this._cPtr, _detailedActionName);
  }

  /**
      Sets priority for self.
      
      Priority controls how the toast behaves when another toast is already
      being displayed.
      
      If priority is [adw.types.ToastPriority.Normal], the toast will be queued.
      
      If priority is [adw.types.ToastPriority.High], the toast will be displayed
      immediately, pushing the previous toast into the queue instead.
  
      Params:
        priority = the priority
  */
  void setPriority(adw.types.ToastPriority priority) nothrow
  {
    adw_toast_set_priority(cast(AdwToast*)this._cPtr, priority);
  }

  /**
      Sets timeout for self.
      
      If timeout is 0, the toast is displayed indefinitely until manually
      dismissed.
      
      Toasts cannot disappear while being hovered, pressed (on touchscreen), or
      have keyboard focus inside them.
  
      Params:
        timeout = the timeout
  */
  void setTimeout(uint timeout) nothrow
  {
    adw_toast_set_timeout(cast(AdwToast*)this._cPtr, timeout);
  }

  /**
      Sets the title that will be displayed on the toast.
      
      The title can be marked up with the Pango text markup language.
      
      Setting a title will unset [adw.toast.Toast.customTitle].
      
      If [adw.toast.Toast.customTitle] is set, it will be used instead.
  
      Params:
        title = a title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    adw_toast_set_title(cast(AdwToast*)this._cPtr, _title);
  }

  /**
      Whether to use Pango markup for the toast title.
      
      See also `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup
  */
  void setUseMarkup(bool useMarkup) nothrow
  {
    adw_toast_set_use_markup(cast(AdwToast*)this._cPtr, useMarkup);
  }

  /**
      Connect to `ButtonClicked` signal.
  
      Emitted after the button has been clicked.
        
        It can be used as an alternative to setting an action.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.toast.Toast toast)`
  
          `toast` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectButtonClicked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.toast.Toast)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "adw.toast.Toast.buttonClicked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-clicked", closure, after);
  }

  /**
      Connect to `Dismissed` signal.
  
      Emitted when the toast has been dismissed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.toast.Toast toast)`
  
          `toast` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDismissed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.toast.Toast)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "adw.toast.Toast.dismissed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("dismissed", closure, after);
  }
}

/// Fluent builder implementation template for [adw.toast.Toast]
class ToastGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `actionName` property.
      Params:
        propval = The name of the associated action.
          
          It will be activated when clicking the button.
          
          See [adw.toast.Toast.actionTarget].
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }

  /**
      Set `actionTarget` property.
      Params:
        propval = The parameter for action invocations.
      Returns: Builder instance for fluent chaining
  */
  T actionTarget(glib.variant.Variant propval) nothrow
  {
    return setProperty("action-target", propval);
  }

  /**
      Set `buttonLabel` property.
      Params:
        propval = The label to show on the button.
          
          Underlines in the button text can be used to indicate a mnemonic.
          
          If set to `NULL`, the button won't be shown.
          
          See [adw.toast.Toast.actionName].
      Returns: Builder instance for fluent chaining
  */
  T buttonLabel(string propval) nothrow
  {
    return setProperty("button-label", propval);
  }

  /**
      Set `customTitle` property.
      Params:
        propval = The custom title widget.
          
          It will be displayed instead of the title if set. In this case,
          [adw.toast.Toast.title] is ignored.
          
          Setting a custom title will unset [adw.toast.Toast.title].
      Returns: Builder instance for fluent chaining
  */
  T customTitle(gtk.widget.Widget propval) nothrow
  {
    return setProperty("custom-title", propval);
  }

  /**
      Set `priority` property.
      Params:
        propval = The priority of the toast.
          
          Priority controls how the toast behaves when another toast is already
          being displayed.
          
          If the priority is [adw.types.ToastPriority.Normal], the toast will be queued.
          
          If the priority is [adw.types.ToastPriority.High], the toast will be displayed
          immediately, pushing the previous toast into the queue instead.
      Returns: Builder instance for fluent chaining
  */
  T priority(adw.types.ToastPriority propval) nothrow
  {
    return setProperty("priority", propval);
  }

  /**
      Set `timeout` property.
      Params:
        propval = The timeout of the toast, in seconds.
          
          If timeout is 0, the toast is displayed indefinitely until manually
          dismissed.
          
          Toasts cannot disappear while being hovered, pressed (on touchscreen), or
          have keyboard focus inside them.
      Returns: Builder instance for fluent chaining
  */
  T timeout(uint propval) nothrow
  {
    return setProperty("timeout", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the toast.
          
          The title can be marked up with the Pango text markup language.
          
          Setting a title will unset [adw.toast.Toast.customTitle].
          
          If [adw.toast.Toast.customTitle] is set, it will be used instead.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = Whether to use Pango markup for the toast title.
          
          See also `func@Pango.parse_markup`.
      Returns: Builder instance for fluent chaining
  */
  T useMarkup(bool propval) nothrow
  {
    return setProperty("use-markup", propval);
  }
}

/// Fluent builder for [adw.toast.Toast]
final class ToastGidBuilder : ToastGidBuilderImpl!ToastGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Toast build() nothrow
  {
    return new Toast(cast(void*)createGObject(Toast._getGType), Yes.Take);
  }
}
