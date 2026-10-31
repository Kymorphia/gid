/// Module for [BottomSheet] class
module adw.bottom_sheet;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.swipeable;
import adw.swipeable_mixin;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A bottom sheet with an optional bottom bar.
    
    <picture>
      <source srcset="bottom-sheet-dark.png" media="(prefers-color-scheme: dark)">
      <img src="bottom-sheet.png" alt="bottom-sheet">
    </picture>
    
    [adw.bottom_sheet.BottomSheet] has three child widgets. [adw.bottom_sheet.BottomSheet.content] is
    shown persistently. [adw.bottom_sheet.BottomSheet.sheet] is displayed above it when
    it's open, and [adw.bottom_sheet.BottomSheet.bottomBar] is displayed when it's not.
    
    Bottom sheet and bottom bar are attached to the bottom edge of the widget.
    They take the full width by default, but can only take a portion of it if
    [adw.bottom_sheet.BottomSheet.fullWidth] is set to `FALSE`. In this case,
    [adw.bottom_sheet.BottomSheet.align_] determines where along the bottom edge they are
    placed.
    
    Bottom bar can be hidden using the [adw.bottom_sheet.BottomSheet.revealBottomBar]
    property.
    
    [adw.bottom_sheet.BottomSheet] can be useful for applications such as music players, that
    want to have a persistent bottom bar that expands into a bottom sheet when
    clicked. It's meant for cases where a bottom sheet is tightly integrated into
    the UI. For more transient bottom sheets, see [adw.dialog.Dialog].
    
    To open or close the bottom sheet, use the [adw.bottom_sheet.BottomSheet.open]
    property.
    
    By default, the bottom sheet has an overlaid drag handle. It can be disabled
    by setting [adw.bottom_sheet.BottomSheet.showDragHandle] to `FALSE`. Note that the
    handle also controls whether the sheet can be dragged using a pointer.
    
    Bottom sheets are modal by default, meaning that the content is dimmed and
    cannot be accessed while the sheet is open. Set [adw.bottom_sheet.BottomSheet.modal]
    to `FALSE` if this behavior is unwanted.
    
    To disable user interactions for opening or closing the bottom sheet (such as
    swipes or clicking the bottom bar or close button), set
    [adw.bottom_sheet.BottomSheet.canOpen] or [adw.bottom_sheet.BottomSheet.canClose] to
    `FALSE`.
    
    In some cases, particularly when using a full-width bottom bar, it may be
    necessary to shift [adw.bottom_sheet.BottomSheet.content] upwards. Use the
    [adw.bottom_sheet.BottomSheet.bottomBarHeight] and
    [adw.bottom_sheet.BottomSheet.sheetHeight] for that.
    
    [adw.bottom_sheet.BottomSheet] is not adaptive, and for larger window sizes applications
    may want to replace it with another UI, such as a sidebar. This can be done
    using [adw.multi_layout_view.MultiLayoutView].
    
    ## Sizing
    
    Unlike [adw.dialog.Dialog] presented as a bottom sheet, [adw.bottom_sheet.BottomSheet] just
    follows the content's natural size, and it's up to the applications to make
    sure their content provides one. For example, when using
    [gtk.scrolled_window.ScrolledWindow], make sure to set
    [gtk.scrolled_window.ScrolledWindow.propagateNaturalHeight] to `TRUE`.
    
    ## Header Bar Integration
    
    When placed inside an [adw.bottom_sheet.BottomSheet], [adw.header_bar.HeaderBar] will not show the
    title when [adw.bottom_sheet.BottomSheet.showDragHandle] is `TRUE`, regardless of
    [adw.header_bar.HeaderBar.showTitle]. This only applies to the default title,
    titles set with [adw.header_bar.HeaderBar.titleWidget] will still be shown.
    
    ## [adw.bottom_sheet.BottomSheet] as [gtk.buildable.Buildable]:
    
    The [adw.bottom_sheet.BottomSheet] implementation of the [gtk.buildable.Buildable] interface
    supports setting the sheet widget by specifying “sheet” as the “type”
    attribute of a `<child>` element, and the bottom bar by specifying
    “bottom-bar”. Specifying “content” or omitting the child type results in
    setting the content child.
*/
class BottomSheet : gtk.widget.Widget, adw.swipeable.Swipeable
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
    return cast(void function())adw_bottom_sheet_get_type != &gidSymbolNotFound ? adw_bottom_sheet_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BottomSheet self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.bottom_sheet.BottomSheet]
      Returns: New builder object
  */
  static BottomSheetGidBuilder builder() nothrow
  {
    return new BottomSheetGidBuilder;
  }

  /**
      Get `align_` property.
      Returns: Horizontal alignment of the bottom sheet.
        
        0 means the bottom sheet is flush with the start edge, 1 means it's flush
        with the end edge. 0.5 means it's centered.
        
        Only used when [adw.bottom_sheet.BottomSheet.fullWidth] is set to `FALSE`.
  */
  @property float align_() nothrow
  {
    return getAlign();
  }

  /**
      Set `align_` property.
      Params:
        propval = Horizontal alignment of the bottom sheet.
          
          0 means the bottom sheet is flush with the start edge, 1 means it's flush
          with the end edge. 0.5 means it's centered.
          
          Only used when [adw.bottom_sheet.BottomSheet.fullWidth] is set to `FALSE`.
  */
  @property void align_(float propval) nothrow
  {
    setAlign(propval);
  }

  /**
      Get `bottomBar` property.
      Returns: The bottom bar widget.
        
        Shown when [adw.bottom_sheet.BottomSheet.open] is `FALSE`. When open, morphs into
        the [adw.bottom_sheet.BottomSheet.sheet].
        
        Bottom bar can be temporarily hidden using the
        [adw.bottom_sheet.BottomSheet.revealBottomBar] property.
  */
  @property gtk.widget.Widget bottomBar() nothrow
  {
    return getBottomBar();
  }

  /**
      Set `bottomBar` property.
      Params:
        propval = The bottom bar widget.
          
          Shown when [adw.bottom_sheet.BottomSheet.open] is `FALSE`. When open, morphs into
          the [adw.bottom_sheet.BottomSheet.sheet].
          
          Bottom bar can be temporarily hidden using the
          [adw.bottom_sheet.BottomSheet.revealBottomBar] property.
  */
  @property void bottomBar(gtk.widget.Widget propval) nothrow
  {
    setBottomBar(propval);
  }

  /**
      Get `bottomBarHeight` property.
      Returns: The current bottom bar height.
        
        It can be used to shift the content upwards permanently to accommodate for
        the bottom bar.
  */
  @property int bottomBarHeight() nothrow
  {
    return getBottomBarHeight();
  }

  /**
      Get `canClose` property.
      Returns: Whether the bottom sheet can be closed by user.
        
        It can be closed via the close button, swiping down, pressing
        <kbd>Escape</kbd> or clicking the content dimming (when modal).
        
        Bottom sheet can still be closed using [adw.bottom_sheet.BottomSheet.open].
  */
  @property bool canClose() nothrow
  {
    return getCanClose();
  }

  /**
      Set `canClose` property.
      Params:
        propval = Whether the bottom sheet can be closed by user.
          
          It can be closed via the close button, swiping down, pressing
          <kbd>Escape</kbd> or clicking the content dimming (when modal).
          
          Bottom sheet can still be closed using [adw.bottom_sheet.BottomSheet.open].
  */
  @property void canClose(bool propval) nothrow
  {
    setCanClose(propval);
  }

  /**
      Get `canOpen` property.
      Returns: Whether the bottom sheet can be opened by user.
        
        It can be opened via clicking or swiping up from the bottom bar.
        
        Does nothing if [adw.bottom_sheet.BottomSheet.bottomBar] is not set.
        
        Bottom sheet can still be opened using [adw.bottom_sheet.BottomSheet.open].
  */
  @property bool canOpen() nothrow
  {
    return getCanOpen();
  }

  /**
      Set `canOpen` property.
      Params:
        propval = Whether the bottom sheet can be opened by user.
          
          It can be opened via clicking or swiping up from the bottom bar.
          
          Does nothing if [adw.bottom_sheet.BottomSheet.bottomBar] is not set.
          
          Bottom sheet can still be opened using [adw.bottom_sheet.BottomSheet.open].
  */
  @property void canOpen(bool propval) nothrow
  {
    setCanOpen(propval);
  }

  /**
      Get `content` property.
      Returns: The content widget.
        
        It's always shown, and the bottom sheet is overlaid over it.
  */
  @property gtk.widget.Widget content() nothrow
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          It's always shown, and the bottom sheet is overlaid over it.
  */
  @property void content(gtk.widget.Widget propval) nothrow
  {
    setContent(propval);
  }

  /**
      Get `fullWidth` property.
      Returns: Whether the bottom sheet takes the full width.
        
        When full width, [adw.bottom_sheet.BottomSheet.align_] is ignored.
  */
  @property bool fullWidth() nothrow
  {
    return getFullWidth();
  }

  /**
      Set `fullWidth` property.
      Params:
        propval = Whether the bottom sheet takes the full width.
          
          When full width, [adw.bottom_sheet.BottomSheet.align_] is ignored.
  */
  @property void fullWidth(bool propval) nothrow
  {
    setFullWidth(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the bottom sheet is modal.
        
        When modal, [adw.bottom_sheet.BottomSheet.content] will be dimmed when the bottom
        sheet is open, and clicking it will close the bottom sheet. It also cannot
        be focused with keyboard.
        
        Otherwise, the content is accessible even when the bottom sheet is open.
  */
  @property bool modal() nothrow
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the bottom sheet is modal.
          
          When modal, [adw.bottom_sheet.BottomSheet.content] will be dimmed when the bottom
          sheet is open, and clicking it will close the bottom sheet. It also cannot
          be focused with keyboard.
          
          Otherwise, the content is accessible even when the bottom sheet is open.
  */
  @property void modal(bool propval) nothrow
  {
    setModal(propval);
  }

  /**
      Get `open` property.
      Returns: Whether the bottom sheet is open.
  */
  @property bool open() nothrow
  {
    return getOpen();
  }

  /**
      Set `open` property.
      Params:
        propval = Whether the bottom sheet is open.
  */
  @property void open(bool propval) nothrow
  {
    setOpen(propval);
  }

  /**
      Get `revealBottomBar` property.
      Returns: Whether to reveal the bottom bar.
        
        The transition will be animated.
        
        See [adw.bottom_sheet.BottomSheet.bottomBar] and
        [adw.bottom_sheet.BottomSheet.bottomBarHeight].
  */
  @property bool revealBottomBar() nothrow
  {
    return getRevealBottomBar();
  }

  /**
      Set `revealBottomBar` property.
      Params:
        propval = Whether to reveal the bottom bar.
          
          The transition will be animated.
          
          See [adw.bottom_sheet.BottomSheet.bottomBar] and
          [adw.bottom_sheet.BottomSheet.bottomBarHeight].
  */
  @property void revealBottomBar(bool propval) nothrow
  {
    setRevealBottomBar(propval);
  }

  /**
      Get `sheet` property.
      Returns: The bottom sheet widget.
        
        Only shown when [adw.bottom_sheet.BottomSheet.open] is `TRUE`.
  */
  @property gtk.widget.Widget sheet() nothrow
  {
    return getSheet();
  }

  /**
      Set `sheet` property.
      Params:
        propval = The bottom sheet widget.
          
          Only shown when [adw.bottom_sheet.BottomSheet.open] is `TRUE`.
  */
  @property void sheet(gtk.widget.Widget propval) nothrow
  {
    setSheet(propval);
  }

  /**
      Get `sheetHeight` property.
      Returns: The current bottom sheet height.
        
        It can be used to shift the content upwards when the bottom sheet is open.
  */
  @property int sheetHeight() nothrow
  {
    return getSheetHeight();
  }

  /**
      Get `showDragHandle` property.
      Returns: Whether to overlay a drag handle in the bottom sheet.
        
        The handle will be overlaid over [adw.bottom_sheet.BottomSheet.sheet].
        
        When the handle is shown, [adw.header_bar.HeaderBar] will hide its default title,
        and [adw.toolbar_view.ToolbarView] will reserve space if there are no top bars.
        
        Showing drag handle also allows to swipe the bottom sheet down (and to
        swipe the bottom bar up) with a pointer, instead of just touchscreen.
  */
  @property bool showDragHandle() nothrow
  {
    return getShowDragHandle();
  }

  /**
      Set `showDragHandle` property.
      Params:
        propval = Whether to overlay a drag handle in the bottom sheet.
          
          The handle will be overlaid over [adw.bottom_sheet.BottomSheet.sheet].
          
          When the handle is shown, [adw.header_bar.HeaderBar] will hide its default title,
          and [adw.toolbar_view.ToolbarView] will reserve space if there are no top bars.
          
          Showing drag handle also allows to swipe the bottom sheet down (and to
          swipe the bottom bar up) with a pointer, instead of just touchscreen.
  */
  @property void showDragHandle(bool propval) nothrow
  {
    setShowDragHandle(propval);
  }

  mixin SwipeableT!();

  /**
      Creates a new [adw.bottom_sheet.BottomSheet].
      Returns: the new created [adw.bottom_sheet.BottomSheet]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_bottom_sheet_new();
    this(_cretval, No.Take);
  }

  /**
      Gets horizontal alignment of the bottom sheet.
      Returns: the horizontal alignment
  */
  float getAlign() nothrow
  {
    float _retval;
    _retval = adw_bottom_sheet_get_align(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the bottom bar widget for self.
      Returns: the bottom bar widget
  */
  gtk.widget.Widget getBottomBar() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_bottom_sheet_get_bottom_bar(cast(AdwBottomSheet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current bottom bar height.
      
      It can be used to shift the content upwards permanently to accommodate for
      the bottom bar.
      Returns: the bottom bar height
  */
  int getBottomBarHeight() nothrow
  {
    int _retval;
    _retval = adw_bottom_sheet_get_bottom_bar_height(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the bottom sheet can be closed by user.
      Returns: whether the sheet can be closed by user
  */
  bool getCanClose() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_can_close(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the bottom sheet can be opened by user.
      Returns: whether the sheet can be opened by user.
  */
  bool getCanOpen() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_can_open(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content widget for self.
      Returns: the content widget
  */
  gtk.widget.Widget getContent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_bottom_sheet_get_content(cast(AdwBottomSheet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the bottom sheet takes the full width.
      Returns: whether the sheet takes up the full width
  */
  bool getFullWidth() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_full_width(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the bottom sheet is modal.
      Returns: whether the sheet is modal
  */
  bool getModal() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_modal(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the bottom sheet is open.
      Returns: whether the sheet is open
  */
  bool getOpen() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_open(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the bottom bar is revealed.
      Returns: whether the bottom bar is revealed
  */
  bool getRevealBottomBar() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_reveal_bottom_bar(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the bottom sheet widget for self.
      Returns: the sheet widget
  */
  gtk.widget.Widget getSheet() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_bottom_sheet_get_sheet(cast(AdwBottomSheet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current bottom sheet height.
      
      It can be used to shift the content upwards when the bottom sheet is open.
      Returns: the sheet height
  */
  int getSheetHeight() nothrow
  {
    int _retval;
    _retval = adw_bottom_sheet_get_sheet_height(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to show a drag handle in the bottom sheet.
      Returns: whether to show the drag handle
  */
  bool getShowDragHandle() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_bottom_sheet_get_show_drag_handle(cast(AdwBottomSheet*)this._cPtr);
    return _retval;
  }

  /**
      Sets horizontal alignment of the bottom sheet.
      
      0 means the bottom sheet is flush with the start edge, 1 means it's flush
      with the end edge. 0.5 means it's centered.
      
      Only used when [adw.bottom_sheet.BottomSheet.fullWidth] is set to `FALSE`.
  
      Params:
        align_ = the new alignment
  */
  void setAlign(float align_) nothrow
  {
    adw_bottom_sheet_set_align(cast(AdwBottomSheet*)this._cPtr, align_);
  }

  /**
      Sets the bottom bar widget for self.
      
      Shown when [adw.bottom_sheet.BottomSheet.open] is `FALSE`. When open, morphs into
      the [adw.bottom_sheet.BottomSheet.sheet].
      
      Bottom bar can be temporarily hidden using the
      [adw.bottom_sheet.BottomSheet.revealBottomBar] property.
  
      Params:
        bottomBar = the bottom bar widget
  */
  void setBottomBar(gtk.widget.Widget bottomBar = null) nothrow
  {
    adw_bottom_sheet_set_bottom_bar(cast(AdwBottomSheet*)this._cPtr, bottomBar ? cast(GtkWidget*)bottomBar._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the bottom sheet can be closed by user.
      
      It can be closed via the close button, swiping down, pressing
      <kbd>Escape</kbd> or clicking the content dimming (when modal).
      
      Bottom sheet can still be closed using [adw.bottom_sheet.BottomSheet.open].
  
      Params:
        canClose = whether the sheet can be closed by user
  */
  void setCanClose(bool canClose) nothrow
  {
    adw_bottom_sheet_set_can_close(cast(AdwBottomSheet*)this._cPtr, canClose);
  }

  /**
      Sets whether the bottom sheet can be opened by user.
      
      It can be opened via clicking or swiping up from the bottom bar.
      
      Does nothing if [adw.bottom_sheet.BottomSheet.bottomBar] is not set.
      
      Bottom sheet can still be opened using [adw.bottom_sheet.BottomSheet.open].
  
      Params:
        canOpen = whether the sheet can be opened by user.
  */
  void setCanOpen(bool canOpen) nothrow
  {
    adw_bottom_sheet_set_can_open(cast(AdwBottomSheet*)this._cPtr, canOpen);
  }

  /**
      Sets the content widget for self.
      
      It's always shown, and the bottom sheet is overlaid over it.
  
      Params:
        content = the content widget
  */
  void setContent(gtk.widget.Widget content = null) nothrow
  {
    adw_bottom_sheet_set_content(cast(AdwBottomSheet*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the bottom sheet takes the full width.
      
      When full width, [adw.bottom_sheet.BottomSheet.align_] is ignored.
  
      Params:
        fullWidth = whether the sheet takes up the full width
  */
  void setFullWidth(bool fullWidth) nothrow
  {
    adw_bottom_sheet_set_full_width(cast(AdwBottomSheet*)this._cPtr, fullWidth);
  }

  /**
      Sets whether the bottom sheet is modal.
      
      When modal, [adw.bottom_sheet.BottomSheet.content] will be dimmed when the bottom
      sheet is open, and clicking it will close the bottom sheet. It also cannot be
      focused with keyboard.
      
      Otherwise, the content is accessible even when the bottom sheet is open.
  
      Params:
        modal = whether the sheet is modal
  */
  void setModal(bool modal) nothrow
  {
    adw_bottom_sheet_set_modal(cast(AdwBottomSheet*)this._cPtr, modal);
  }

  /**
      Sets whether the bottom sheet is open.
  
      Params:
        open = whether to open the sheet
  */
  void setOpen(bool open) nothrow
  {
    adw_bottom_sheet_set_open(cast(AdwBottomSheet*)this._cPtr, open);
  }

  /**
      Sets whether to reveal the bottom bar.
      
      The transition will be animated.
      
      See [adw.bottom_sheet.BottomSheet.bottomBar] and
      [adw.bottom_sheet.BottomSheet.bottomBarHeight].
  
      Params:
        reveal = whether to reveal the bottom bar
  */
  void setRevealBottomBar(bool reveal) nothrow
  {
    adw_bottom_sheet_set_reveal_bottom_bar(cast(AdwBottomSheet*)this._cPtr, reveal);
  }

  /**
      Sets the bottom sheet widget for self.
      
      Only shown when [adw.bottom_sheet.BottomSheet.open] is `TRUE`.
  
      Params:
        sheet = the sheet widget
  */
  void setSheet(gtk.widget.Widget sheet = null) nothrow
  {
    adw_bottom_sheet_set_sheet(cast(AdwBottomSheet*)this._cPtr, sheet ? cast(GtkWidget*)sheet._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to show a drag handle in the bottom sheet.
      
      The handle will be overlaid over [adw.bottom_sheet.BottomSheet.sheet].
      
      When the handle is shown, [adw.header_bar.HeaderBar] will hide its default title, and
      [adw.toolbar_view.ToolbarView] will reserve space if there are no top bars.
      
      Showing drag handle also allows to swipe the bottom sheet down (and to swipe
      the bottom bar up) with a pointer, instead of just touchscreen.
  
      Params:
        showDragHandle = whether to show the drag handle
  */
  void setShowDragHandle(bool showDragHandle) nothrow
  {
    adw_bottom_sheet_set_show_drag_handle(cast(AdwBottomSheet*)this._cPtr, showDragHandle);
  }

  /**
      Connect to `CloseAttempt` signal.
  
      Emitted when the close button or shortcut is used while
        [adw.dialog.Dialog.canClose] is set to `FALSE`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.bottom_sheet.BottomSheet bottomSheet)`
  
          `bottomSheet` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCloseAttempt(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.bottom_sheet.BottomSheet)))
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
        gidInvokeCallbackExceptionHandler(e, "adw.bottom_sheet.BottomSheet.closeAttempt");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-attempt", closure, after);
  }
}

/// Fluent builder implementation template for [adw.bottom_sheet.BottomSheet]
class BottomSheetGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, adw.swipeable.SwipeableGidBuilderImpl!T
{

  mixin SwipeableGidBuilderT!();

  /**
      Set `align_` property.
      Params:
        propval = Horizontal alignment of the bottom sheet.
          
          0 means the bottom sheet is flush with the start edge, 1 means it's flush
          with the end edge. 0.5 means it's centered.
          
          Only used when [adw.bottom_sheet.BottomSheet.fullWidth] is set to `FALSE`.
      Returns: Builder instance for fluent chaining
  */
  T align_(float propval) nothrow
  {
    return setProperty("align", propval);
  }

  /**
      Set `bottomBar` property.
      Params:
        propval = The bottom bar widget.
          
          Shown when [adw.bottom_sheet.BottomSheet.open] is `FALSE`. When open, morphs into
          the [adw.bottom_sheet.BottomSheet.sheet].
          
          Bottom bar can be temporarily hidden using the
          [adw.bottom_sheet.BottomSheet.revealBottomBar] property.
      Returns: Builder instance for fluent chaining
  */
  T bottomBar(gtk.widget.Widget propval) nothrow
  {
    return setProperty("bottom-bar", propval);
  }

  /**
      Set `canClose` property.
      Params:
        propval = Whether the bottom sheet can be closed by user.
          
          It can be closed via the close button, swiping down, pressing
          <kbd>Escape</kbd> or clicking the content dimming (when modal).
          
          Bottom sheet can still be closed using [adw.bottom_sheet.BottomSheet.open].
      Returns: Builder instance for fluent chaining
  */
  T canClose(bool propval) nothrow
  {
    return setProperty("can-close", propval);
  }

  /**
      Set `canOpen` property.
      Params:
        propval = Whether the bottom sheet can be opened by user.
          
          It can be opened via clicking or swiping up from the bottom bar.
          
          Does nothing if [adw.bottom_sheet.BottomSheet.bottomBar] is not set.
          
          Bottom sheet can still be opened using [adw.bottom_sheet.BottomSheet.open].
      Returns: Builder instance for fluent chaining
  */
  T canOpen(bool propval) nothrow
  {
    return setProperty("can-open", propval);
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          It's always shown, and the bottom sheet is overlaid over it.
      Returns: Builder instance for fluent chaining
  */
  T content(gtk.widget.Widget propval) nothrow
  {
    return setProperty("content", propval);
  }

  /**
      Set `fullWidth` property.
      Params:
        propval = Whether the bottom sheet takes the full width.
          
          When full width, [adw.bottom_sheet.BottomSheet.align_] is ignored.
      Returns: Builder instance for fluent chaining
  */
  T fullWidth(bool propval) nothrow
  {
    return setProperty("full-width", propval);
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the bottom sheet is modal.
          
          When modal, [adw.bottom_sheet.BottomSheet.content] will be dimmed when the bottom
          sheet is open, and clicking it will close the bottom sheet. It also cannot
          be focused with keyboard.
          
          Otherwise, the content is accessible even when the bottom sheet is open.
      Returns: Builder instance for fluent chaining
  */
  T modal(bool propval) nothrow
  {
    return setProperty("modal", propval);
  }

  /**
      Set `open` property.
      Params:
        propval = Whether the bottom sheet is open.
      Returns: Builder instance for fluent chaining
  */
  T open(bool propval) nothrow
  {
    return setProperty("open", propval);
  }

  /**
      Set `revealBottomBar` property.
      Params:
        propval = Whether to reveal the bottom bar.
          
          The transition will be animated.
          
          See [adw.bottom_sheet.BottomSheet.bottomBar] and
          [adw.bottom_sheet.BottomSheet.bottomBarHeight].
      Returns: Builder instance for fluent chaining
  */
  T revealBottomBar(bool propval) nothrow
  {
    return setProperty("reveal-bottom-bar", propval);
  }

  /**
      Set `sheet` property.
      Params:
        propval = The bottom sheet widget.
          
          Only shown when [adw.bottom_sheet.BottomSheet.open] is `TRUE`.
      Returns: Builder instance for fluent chaining
  */
  T sheet(gtk.widget.Widget propval) nothrow
  {
    return setProperty("sheet", propval);
  }

  /**
      Set `showDragHandle` property.
      Params:
        propval = Whether to overlay a drag handle in the bottom sheet.
          
          The handle will be overlaid over [adw.bottom_sheet.BottomSheet.sheet].
          
          When the handle is shown, [adw.header_bar.HeaderBar] will hide its default title,
          and [adw.toolbar_view.ToolbarView] will reserve space if there are no top bars.
          
          Showing drag handle also allows to swipe the bottom sheet down (and to
          swipe the bottom bar up) with a pointer, instead of just touchscreen.
      Returns: Builder instance for fluent chaining
  */
  T showDragHandle(bool propval) nothrow
  {
    return setProperty("show-drag-handle", propval);
  }
}

/// Fluent builder for [adw.bottom_sheet.BottomSheet]
final class BottomSheetGidBuilder : BottomSheetGidBuilderImpl!BottomSheetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BottomSheet build() nothrow
  {
    return new BottomSheet(cast(void*)createGObject(BottomSheet._getGType), Yes.Take);
  }
}
