/// Module for [Dialog] class
module gid.adw1.dialog;

public import gid.core.basictypes;
import gid.adw1.breakpoint;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
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
    An adaptive dialog container.
    
    <picture>
      <source srcset="dialog-floating-dark.png" media="(prefers-color-scheme: dark)">
      <img src="dialog-floating.png" alt="dialog-floating">
    </picture>
    <picture>
      <source srcset="dialog-bottom-dark.png" media="(prefers-color-scheme: dark)">
      <img src="dialog-bottom.png" alt="dialog-bottom">
    </picture>
    
    [gid.adw1.dialog.Dialog] is similar to a window, but is shown within another window. It
    can be used with [gid.adw1.window.Window] and [gid.adw1.application_window.ApplicationWindow], use
    [gid.adw1.dialog.Dialog.present] to show it.
    
    [gid.adw1.dialog.Dialog] is not resizable. Use the [gid.adw1.dialog.Dialog.contentWidth] and
    [gid.adw1.dialog.Dialog.contentHeight] properties to set its size, or set
    [gid.adw1.dialog.Dialog.followsContentSize] to `TRUE` to make the dialog track the
    content's size as it changes. [gid.adw1.dialog.Dialog] can never be larger than its parent
    window.
    
    [gid.adw1.dialog.Dialog] can be presented as a centered floating window or a bottom sheet.
    By default it's automatic depending on the available size.
    [gid.adw1.dialog.Dialog.presentationMode] can be used to change that.
    
    [gid.adw1.dialog.Dialog] can be closed via [gid.adw1.dialog.Dialog.close].
    
    When presented as a bottom sheet, [gid.adw1.dialog.Dialog] can also be closed via swiping
    it down.
    
    The [gid.adw1.dialog.Dialog.canClose] can be used to prevent closing. In that case,
    [gid.adw1.dialog.Dialog.closeAttempt] gets emitted instead.
    
    Use [gid.adw1.dialog.Dialog.forceClose] to close the dialog even when `can-close` is set to
    `FALSE`.
    
    [gid.adw1.dialog.Dialog] is transient and doesn't integrate with the window below it, for
    example it's not possible to collapse it into a bottom bar. See
    [gid.adw1.bottom_sheet.BottomSheet] for persistent and more tightly integrated bottom sheets.
    
    ## Header Bar Integration
    
    When placed inside an [gid.adw1.dialog.Dialog], [gid.adw1.header_bar.HeaderBar] will display the dialog
    title instead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] and
    [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] to `FALSE` to remove it if it's
    unwanted.
    
    ## Breakpoints
    
    [gid.adw1.dialog.Dialog] can be used with [gid.adw1.breakpoint.Breakpoint] the same way as
    [gid.adw1.breakpoint_bin.BreakpointBin]. Refer to that widget's documentation for details.
    
    Like [gid.adw1.breakpoint_bin.BreakpointBin], if breakpoints are used, [gid.adw1.dialog.Dialog] doesn't have a
    minimum size, and [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] properties must be set manually.
*/
class Dialog : gid.gtk4.widget.Widget, gid.gtk4.shortcut_manager.ShortcutManager
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
    return cast(void function())adw_dialog_get_type != &gidSymbolNotFound ? adw_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override Dialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.dialog.Dialog]
      Returns: New builder object
  */
  static DialogGidBuilder builder() nothrow
  {
    return new DialogGidBuilder;
  }

  /**
      Get `canClose` property.
      Returns: Whether the dialog can be closed.
        
        If set to `FALSE`, the close button, shortcuts and
        [gid.adw1.dialog.Dialog.close] will result in [gid.adw1.dialog.Dialog.closeAttempt] being
        emitted instead, and bottom sheet close swipe will be disabled.
        [gid.adw1.dialog.Dialog.forceClose] still works.
  */
  @property bool canClose() nothrow
  {
    return getCanClose();
  }

  /**
      Set `canClose` property.
      Params:
        propval = Whether the dialog can be closed.
          
          If set to `FALSE`, the close button, shortcuts and
          [gid.adw1.dialog.Dialog.close] will result in [gid.adw1.dialog.Dialog.closeAttempt] being
          emitted instead, and bottom sheet close swipe will be disabled.
          [gid.adw1.dialog.Dialog.forceClose] still works.
  */
  @property void canClose(bool propval) nothrow
  {
    setCanClose(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget of the [gid.adw1.dialog.Dialog].
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [gid.adw1.dialog.Dialog].
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `contentHeight` property.
      Returns: The height of the dialog's contents.
        
        Set it to -1 to reset it to the content's natural height.
        
        See also: [gid.gtk4.window.Window.defaultHeight]
  */
  @property int contentHeight() nothrow
  {
    return getContentHeight();
  }

  /**
      Set `contentHeight` property.
      Params:
        propval = The height of the dialog's contents.
          
          Set it to -1 to reset it to the content's natural height.
          
          See also: [gid.gtk4.window.Window.defaultHeight]
  */
  @property void contentHeight(int propval) nothrow
  {
    setContentHeight(propval);
  }

  /**
      Get `contentWidth` property.
      Returns: The width of the dialog's contents.
        
        Set it to -1 to reset it to the content's natural width.
        
        See also: [gid.gtk4.window.Window.defaultWidth]
  */
  @property int contentWidth() nothrow
  {
    return getContentWidth();
  }

  /**
      Set `contentWidth` property.
      Params:
        propval = The width of the dialog's contents.
          
          Set it to -1 to reset it to the content's natural width.
          
          See also: [gid.gtk4.window.Window.defaultWidth]
  */
  @property void contentWidth(int propval) nothrow
  {
    setContentWidth(propval);
  }

  /**
      Get `currentBreakpoint` property.
      Returns: The current breakpoint.
  */
  @property gid.adw1.breakpoint.Breakpoint currentBreakpoint() nothrow
  {
    return getCurrentBreakpoint();
  }

  /**
      Get `defaultWidget` property.
      Returns: The default widget.
        
        It's activated when the user presses Enter.
  */
  @property gid.gtk4.widget.Widget defaultWidget() nothrow
  {
    return getDefaultWidget();
  }

  /**
      Set `defaultWidget` property.
      Params:
        propval = The default widget.
          
          It's activated when the user presses Enter.
  */
  @property void defaultWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setDefaultWidget(propval);
  }

  /**
      Get `focusWidget` property.
      Returns: The focus widget.
  */
  @property gid.gtk4.widget.Widget focusWidget() nothrow
  {
    return getFocus();
  }

  /**
      Set `focusWidget` property.
      Params:
        propval = The focus widget.
  */
  @property void focusWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setFocus(propval);
  }

  /**
      Get `followsContentSize` property.
      Returns: Whether to size content automatically.
        
        If set to `TRUE`, always use the content's natural size instead of
        [gid.adw1.dialog.Dialog.contentWidth] and [gid.adw1.dialog.Dialog.contentHeight]. If
        the content resizes, the dialog will immediately resize as well.
        
        See also: [gid.gtk4.window.Window.resizable]
  */
  @property bool followsContentSize() nothrow
  {
    return getFollowsContentSize();
  }

  /**
      Set `followsContentSize` property.
      Params:
        propval = Whether to size content automatically.
          
          If set to `TRUE`, always use the content's natural size instead of
          [gid.adw1.dialog.Dialog.contentWidth] and [gid.adw1.dialog.Dialog.contentHeight]. If
          the content resizes, the dialog will immediately resize as well.
          
          See also: [gid.gtk4.window.Window.resizable]
  */
  @property void followsContentSize(bool propval) nothrow
  {
    setFollowsContentSize(propval);
  }

  /**
      Get `presentationMode` property.
      Returns: The dialog's presentation mode.
        
        When set to [gid.adw1.types.DialogPresentationMode.Auto], the dialog appears as a
        bottom sheet when the following condition is met:
        `max-width: 450px or max-height: 360px`, and as a floating window otherwise.
        
        Set it to [gid.adw1.types.DialogPresentationMode.Floating] or
        `enum@Adw.DialogPresentationMode.bottom-sheet` to always present it a
        floating window or a bottom sheet respectively, regardless of available
        size.
        
        Presentation mode does nothing for dialogs presented as a window.
  */
  @property gid.adw1.types.DialogPresentationMode presentationMode() nothrow
  {
    return getPresentationMode();
  }

  /**
      Set `presentationMode` property.
      Params:
        propval = The dialog's presentation mode.
          
          When set to [gid.adw1.types.DialogPresentationMode.Auto], the dialog appears as a
          bottom sheet when the following condition is met:
          `max-width: 450px or max-height: 360px`, and as a floating window otherwise.
          
          Set it to [gid.adw1.types.DialogPresentationMode.Floating] or
          `enum@Adw.DialogPresentationMode.bottom-sheet` to always present it a
          floating window or a bottom sheet respectively, regardless of available
          size.
          
          Presentation mode does nothing for dialogs presented as a window.
  */
  @property void presentationMode(gid.adw1.types.DialogPresentationMode propval) nothrow
  {
    setPresentationMode(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the dialog.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the dialog.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  mixin ShortcutManagerT!();

  /**
      Creates a new [gid.adw1.dialog.Dialog].
      Returns: the new created [gid.adw1.dialog.Dialog]
  */
  this() nothrow
  {
    AdwDialog* _cretval;
    _cretval = adw_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Adds breakpoint to self.
  
      Params:
        breakpoint = the breakpoint to add
  */
  void addBreakpoint(gid.adw1.breakpoint.Breakpoint breakpoint) nothrow
  {
    adw_dialog_add_breakpoint(cast(AdwDialog*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(Yes.Dup) : null);
  }

  /**
      Attempts to close self.
      
      If the [gid.adw1.dialog.Dialog.canClose] property is set to `FALSE`, the
      [gid.adw1.dialog.Dialog.closeAttempt] signal is emitted.
      
      See also: [gid.adw1.dialog.Dialog.forceClose].
      Returns: whether self was successfully closed
  */
  bool close() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_dialog_close(cast(AdwDialog*)this._cPtr);
    return _retval;
  }

  /**
      Closes self.
      
      Unlike [gid.adw1.dialog.Dialog.close], it succeeds even if [gid.adw1.dialog.Dialog.canClose]
      is set to `FALSE`.
  */
  void forceClose() nothrow
  {
    adw_dialog_force_close(cast(AdwDialog*)this._cPtr);
  }

  /**
      Gets whether self can be closed.
      Returns: whether the dialog can be closed
  */
  bool getCanClose() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_dialog_get_can_close(cast(AdwDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_dialog_get_child(cast(AdwDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the height of the dialog's contents.
      Returns: the content height
  */
  int getContentHeight() nothrow
  {
    int _retval;
    _retval = adw_dialog_get_content_height(cast(AdwDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the width of the dialog's contents.
      Returns: the content width
  */
  int getContentWidth() nothrow
  {
    int _retval;
    _retval = adw_dialog_get_content_width(cast(AdwDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current breakpoint.
      Returns: the current breakpoint
  */
  gid.adw1.breakpoint.Breakpoint getCurrentBreakpoint() nothrow
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_dialog_get_current_breakpoint(cast(AdwDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default widget for self.
      Returns: the default widget
  */
  gid.gtk4.widget.Widget getDefaultWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_dialog_get_default_widget(cast(AdwDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the focus widget for self.
      Returns: the focus widget
  */
  gid.gtk4.widget.Widget getFocus() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_dialog_get_focus(cast(AdwDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to size content of self automatically.
      Returns: whether to size content automatically
  */
  bool getFollowsContentSize() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_dialog_get_follows_content_size(cast(AdwDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets presentation mode for self.
      Returns: the presentation mode
  */
  gid.adw1.types.DialogPresentationMode getPresentationMode() nothrow
  {
    AdwDialogPresentationMode _cretval;
    _cretval = adw_dialog_get_presentation_mode(cast(AdwDialog*)this._cPtr);
    gid.adw1.types.DialogPresentationMode _retval = cast(gid.adw1.types.DialogPresentationMode)_cretval;
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_dialog_get_title(cast(AdwDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Presents self within parent's window.
      
      If self is already shown, raises it to the top instead.
      
      If the window is an [gid.adw1.window.Window] or [gid.adw1.application_window.ApplicationWindow], the dialog
      will be shown within it. Otherwise, it will be a separate window.
  
      Params:
        parent = a widget within the toplevel
  */
  void present(gid.gtk4.widget.Widget parent = null) nothrow
  {
    adw_dialog_present(cast(AdwDialog*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets whether self can be closed.
      
      If set to `FALSE`, the close button, shortcuts and
      [gid.adw1.dialog.Dialog.close] will result in [gid.adw1.dialog.Dialog.closeAttempt] being
      emitted instead, and bottom sheet close swipe will be disabled.
      [gid.adw1.dialog.Dialog.forceClose] still works.
  
      Params:
        canClose = whether to allow closing
  */
  void setCanClose(bool canClose) nothrow
  {
    adw_dialog_set_can_close(cast(AdwDialog*)this._cPtr, canClose);
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_dialog_set_child(cast(AdwDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the height of the dialog's contents.
      
      Set it to -1 to reset it to the content's natural height.
      
      See also: [gid.gtk4.window.Window.defaultHeight]
  
      Params:
        contentHeight = the content height
  */
  void setContentHeight(int contentHeight) nothrow
  {
    adw_dialog_set_content_height(cast(AdwDialog*)this._cPtr, contentHeight);
  }

  /**
      Sets the width of the dialog's contents.
      
      Set it to -1 to reset it to the content's natural width.
      
      See also: [gid.gtk4.window.Window.defaultWidth]
  
      Params:
        contentWidth = the content width
  */
  void setContentWidth(int contentWidth) nothrow
  {
    adw_dialog_set_content_width(cast(AdwDialog*)this._cPtr, contentWidth);
  }

  /**
      Sets the default widget for self.
      
      It's activated when the user presses Enter.
  
      Params:
        defaultWidget = the default widget
  */
  void setDefaultWidget(gid.gtk4.widget.Widget defaultWidget = null) nothrow
  {
    adw_dialog_set_default_widget(cast(AdwDialog*)this._cPtr, defaultWidget ? cast(GtkWidget*)defaultWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the focus widget for self.
      
      If focus is not the current focus widget, and is focusable, sets it as the
      focus widget for the dialog.
      
      If focus is `NULL`, unsets the focus widget for this dialog. To set the focus
      to a particular widget in the dialog, it is usually more convenient to use
      [gid.gtk4.widget.Widget.grabFocus] instead of this function.
  
      Params:
        focus = the focus widget
  */
  void setFocus(gid.gtk4.widget.Widget focus = null) nothrow
  {
    adw_dialog_set_focus(cast(AdwDialog*)this._cPtr, focus ? cast(GtkWidget*)focus._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to size content of self automatically.
      
      If set to `TRUE`, always use the content's natural size instead of
      [gid.adw1.dialog.Dialog.contentWidth] and [gid.adw1.dialog.Dialog.contentHeight]. If
      the content resizes, the dialog will immediately resize as well.
      
      See also: [gid.gtk4.window.Window.resizable]
  
      Params:
        followsContentSize = whether to size content automatically
  */
  void setFollowsContentSize(bool followsContentSize) nothrow
  {
    adw_dialog_set_follows_content_size(cast(AdwDialog*)this._cPtr, followsContentSize);
  }

  /**
      Sets presentation mode for self.
      
      When set to [gid.adw1.types.DialogPresentationMode.Auto], the dialog appears as a
      bottom sheet when the following condition is met:
      `max-width: 450px or max-height: 360px`, and as a floating window otherwise.
      
      Set it to [gid.adw1.types.DialogPresentationMode.Floating] or
      `enumAdw.DialogPresentationMode.bottom-sheet` to always present it a
      floating window or a bottom sheet respectively, regardless of available size.
      
      Presentation mode does nothing for dialogs presented as a window.
  
      Params:
        presentationMode = the new presentation mode
  */
  void setPresentationMode(gid.adw1.types.DialogPresentationMode presentationMode) nothrow
  {
    adw_dialog_set_presentation_mode(cast(AdwDialog*)this._cPtr, presentationMode);
  }

  /**
      Sets the title of self.
  
      Params:
        title = the new title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    adw_dialog_set_title(cast(AdwDialog*)this._cPtr, _title);
  }

  /**
      Connect to `CloseAttempt` signal.
  
      Emitted when the close button or shortcut is used, or
        [gid.adw1.dialog.Dialog.close] is called while [gid.adw1.dialog.Dialog.canClose] is set to
        `FALSE`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.dialog.Dialog dialog)`
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCloseAttempt(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.dialog.Dialog)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.dialog.Dialog.closeAttempt");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-attempt", closure, after);
  }

  /**
      Connect to `Closed` signal.
  
      Emitted when the dialog is successfully closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.dialog.Dialog dialog)`
  
          `dialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.dialog.Dialog)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.dialog.Dialog.closed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.adw1.dialog.Dialog]
class DialogGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.shortcut_manager.ShortcutManagerGidBuilderImpl!T
{

  mixin ShortcutManagerGidBuilderT!();

  /**
      Set `canClose` property.
      Params:
        propval = Whether the dialog can be closed.
          
          If set to `FALSE`, the close button, shortcuts and
          [gid.adw1.dialog.Dialog.close] will result in [gid.adw1.dialog.Dialog.closeAttempt] being
          emitted instead, and bottom sheet close swipe will be disabled.
          [gid.adw1.dialog.Dialog.forceClose] still works.
      Returns: Builder instance for fluent chaining
  */
  T canClose(bool propval) nothrow
  {
    return setProperty("can-close", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [gid.adw1.dialog.Dialog].
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `contentHeight` property.
      Params:
        propval = The height of the dialog's contents.
          
          Set it to -1 to reset it to the content's natural height.
          
          See also: [gid.gtk4.window.Window.defaultHeight]
      Returns: Builder instance for fluent chaining
  */
  T contentHeight(int propval) nothrow
  {
    return setProperty("content-height", propval);
  }

  /**
      Set `contentWidth` property.
      Params:
        propval = The width of the dialog's contents.
          
          Set it to -1 to reset it to the content's natural width.
          
          See also: [gid.gtk4.window.Window.defaultWidth]
      Returns: Builder instance for fluent chaining
  */
  T contentWidth(int propval) nothrow
  {
    return setProperty("content-width", propval);
  }

  /**
      Set `defaultWidget` property.
      Params:
        propval = The default widget.
          
          It's activated when the user presses Enter.
      Returns: Builder instance for fluent chaining
  */
  T defaultWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("default-widget", propval);
  }

  /**
      Set `focusWidget` property.
      Params:
        propval = The focus widget.
      Returns: Builder instance for fluent chaining
  */
  T focusWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("focus-widget", propval);
  }

  /**
      Set `followsContentSize` property.
      Params:
        propval = Whether to size content automatically.
          
          If set to `TRUE`, always use the content's natural size instead of
          [gid.adw1.dialog.Dialog.contentWidth] and [gid.adw1.dialog.Dialog.contentHeight]. If
          the content resizes, the dialog will immediately resize as well.
          
          See also: [gid.gtk4.window.Window.resizable]
      Returns: Builder instance for fluent chaining
  */
  T followsContentSize(bool propval) nothrow
  {
    return setProperty("follows-content-size", propval);
  }

  /**
      Set `presentationMode` property.
      Params:
        propval = The dialog's presentation mode.
          
          When set to [gid.adw1.types.DialogPresentationMode.Auto], the dialog appears as a
          bottom sheet when the following condition is met:
          `max-width: 450px or max-height: 360px`, and as a floating window otherwise.
          
          Set it to [gid.adw1.types.DialogPresentationMode.Floating] or
          `enum@Adw.DialogPresentationMode.bottom-sheet` to always present it a
          floating window or a bottom sheet respectively, regardless of available
          size.
          
          Presentation mode does nothing for dialogs presented as a window.
      Returns: Builder instance for fluent chaining
  */
  T presentationMode(gid.adw1.types.DialogPresentationMode propval) nothrow
  {
    return setProperty("presentation-mode", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the dialog.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.adw1.dialog.Dialog]
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
