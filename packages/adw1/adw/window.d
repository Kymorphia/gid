/// Module for [Window] class
module adw.window;

public import gid.basictypes;
import adw.breakpoint;
import adw.c.functions;
import adw.c.types;
import adw.dialog;
import adw.types;
import gid.gid;
import gio.list_model;
import gobject.gid_builder;
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
    A freeform window.
    
    <picture>
      <source srcset="window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="window.png" alt="window">
    </picture>
    
    The [adw.window.Window] widget is a subclass of [gtk.window.Window] which has no
    titlebar area. Instead, [adw.toolbar_view.ToolbarView] can be used together with
    [adw.header_bar.HeaderBar] or [gtk.header_bar.HeaderBar] as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar"/>
          </child>
          <property name="content">
            <!-- ... -->
          </property>
        </object>
      </property>
    </object>
    ```
    
    Using [gtk.window.Window.titlebar] or [gtk.window.Window.child]
    is not supported and will result in a crash. Use [adw.window.Window.content]
    instead.
    
    ## Dialogs
    
    [adw.window.Window] can contain [adw.dialog.Dialog]. Use [adw.dialog.Dialog.present] with the
    window or a widget within a window to show a dialog.
    
    ## Breakpoints
    
    [adw.window.Window] can be used with [adw.breakpoint.Breakpoint] the same way as
    [adw.breakpoint_bin.BreakpointBin]. Refer to that widget's documentation for details.
    
    Example:
    
    ```xml
    <object class="AdwWindow">
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar"/>
          </child>
          <property name="content">
            <!-- ... -->
          </property>
          <child type="bottom">
            <object class="GtkActionBar" id="bottom_bar">
              <property name="revealed">True</property>
              <property name="visible">False</property>
            </object>
          </child>
        </object>
      </property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 500px</condition>
          <setter object="bottom_bar" property="visible">True</setter>
        </object>
      </child>
    </object>
    ```
    
    When breakpoints are used, the minimum size must be larger than the smallest
    UI state. [adw.window.Window] defaults to the minimum size of 360×200 px. If that's
    too small, set the [gtk.widget.Widget.widthRequest] and
    [gtk.widget.Widget.heightRequest] properties manually.
    
    ## Adaptive Preview
    
    [adw.window.Window] has a debug tool called adaptive preview. It can be opened from
    GTK Inspector or by pressing <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>M</kbd>,
    and controlled via the [adw.window.Window.adaptivePreview] property.
*/
class Window : gtk.window.Window
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
    return cast(void function())adw_window_get_type != &gidSymbolNotFound ? adw_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Window self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.window.Window]
      Returns: New builder object
  */
  static WindowGidBuilder builder() nothrow
  {
    return new WindowGidBuilder;
  }

  /**
      Get `adaptivePreview` property.
      Returns: Whether adaptive preview is currently open.
        
        Adaptive preview is a debugging tool used for testing the window
        contents at specific screen sizes, simulating mobile environment.
        
        Adaptive preview can always be accessed from inspector. This function
        allows applications to open it manually.
        
        Most applications should not use this property.
  */
  @property bool adaptivePreview() nothrow
  {
    return getAdaptivePreview();
  }

  /**
      Set `adaptivePreview` property.
      Params:
        propval = Whether adaptive preview is currently open.
          
          Adaptive preview is a debugging tool used for testing the window
          contents at specific screen sizes, simulating mobile environment.
          
          Adaptive preview can always be accessed from inspector. This function
          allows applications to open it manually.
          
          Most applications should not use this property.
  */
  @property void adaptivePreview(bool propval) nothrow
  {
    setAdaptivePreview(propval);
  }

  /**
      Get `content` property.
      Returns: The content widget.
        
        This property should always be used instead of [gtk.window.Window.child].
  */
  @property gtk.widget.Widget content() nothrow
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          This property should always be used instead of [gtk.window.Window.child].
  */
  @property void content(gtk.widget.Widget propval) nothrow
  {
    setContent(propval);
  }

  /**
      Get `currentBreakpoint` property.
      Returns: The current breakpoint.
  */
  @property adw.breakpoint.Breakpoint currentBreakpoint() nothrow
  {
    return getCurrentBreakpoint();
  }

  /**
      Get `dialogs` property.
      Returns: The open dialogs.
  */
  @property gio.list_model.ListModel dialogs() nothrow
  {
    return getDialogs();
  }

  /**
      Get `visibleDialog` property.
      Returns: The currently visible dialog
  */
  @property adw.dialog.Dialog visibleDialog() nothrow
  {
    return getVisibleDialog();
  }

  /**
      Creates a new [adw.window.Window].
      Returns: the newly created [adw.window.Window]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_window_new();
    this(_cretval, No.Take);
  }

  /**
      Adds breakpoint to self.
  
      Params:
        breakpoint = the breakpoint to add
  */
  void addBreakpoint(adw.breakpoint.Breakpoint breakpoint) nothrow
  {
    adw_window_add_breakpoint(cast(AdwWindow*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(Yes.Dup) : null);
  }

  /**
      Gets whether adaptive preview for self is currently open.
      Returns: whether adaptive preview is open.
  */
  bool getAdaptivePreview() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_window_get_adaptive_preview(cast(AdwWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content widget of self.
      
      This method should always be used instead of [gtk.window.Window.getChild].
      Returns: the content widget of self
  */
  gtk.widget.Widget getContent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_window_get_content(cast(AdwWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current breakpoint.
      Returns: the current breakpoint
  */
  adw.breakpoint.Breakpoint getCurrentBreakpoint() nothrow
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_window_get_current_breakpoint(cast(AdwWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the open dialogs of self.
      
      This can be used to keep an up-to-date view.
      Returns: a list model for the dialogs of self
  */
  gio.list_model.ListModel getDialogs() nothrow
  {
    GListModel* _cretval;
    _cretval = adw_window_get_dialogs(cast(AdwWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the currently visible dialog in self, if there's one.
      Returns: the visible dialog
  */
  adw.dialog.Dialog getVisibleDialog() nothrow
  {
    AdwDialog* _cretval;
    _cretval = adw_window_get_visible_dialog(cast(AdwWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.dialog.Dialog)(cast(AdwDialog*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether adaptive preview for self is currently open.
      
      Adaptive preview is a debugging tool used for testing the window
      contents at specific screen sizes, simulating mobile environment.
      
      Adaptive preview can always be accessed from inspector. This function
      allows applications to open it manually.
      
      Most applications should not use this function.
  
      Params:
        adaptivePreview = whether to open adaptive preview
  */
  void setAdaptivePreview(bool adaptivePreview) nothrow
  {
    adw_window_set_adaptive_preview(cast(AdwWindow*)this._cPtr, adaptivePreview);
  }

  /**
      Sets the content widget of self.
      
      This method should always be used instead of [gtk.window.Window.setChild].
  
      Params:
        content = the content widget
  */
  void setContent(gtk.widget.Widget content = null) nothrow
  {
    adw_window_set_content(cast(AdwWindow*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [adw.window.Window]
class WindowGidBuilderImpl(T) : gtk.window.WindowGidBuilderImpl!T
{


  /**
      Set `adaptivePreview` property.
      Params:
        propval = Whether adaptive preview is currently open.
          
          Adaptive preview is a debugging tool used for testing the window
          contents at specific screen sizes, simulating mobile environment.
          
          Adaptive preview can always be accessed from inspector. This function
          allows applications to open it manually.
          
          Most applications should not use this property.
      Returns: Builder instance for fluent chaining
  */
  T adaptivePreview(bool propval) nothrow
  {
    return setProperty("adaptive-preview", propval);
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          This property should always be used instead of [gtk.window.Window.child].
      Returns: Builder instance for fluent chaining
  */
  T content(gtk.widget.Widget propval) nothrow
  {
    return setProperty("content", propval);
  }
}

/// Fluent builder for [adw.window.Window]
final class WindowGidBuilder : WindowGidBuilderImpl!WindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Window build() nothrow
  {
    return new Window(cast(void*)createGObject(Window._getGType), Yes.Take);
  }
}
