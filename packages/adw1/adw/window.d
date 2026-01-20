/// Module for [Window] class
module adw.window;

import adw.breakpoint;
import adw.c.functions;
import adw.c.types;
import adw.dialog;
import adw.types;
import gid.gid;
import gio.list_model;
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
    titlebar area. Instead, `class@ToolbarView` can be used together with
    `class@HeaderBar` or [gtk.header_bar.HeaderBar] as follows:
    
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
    is not supported and will result in a crash. Use `property@Window:content`
    instead.
    
    ## Dialogs
    
    [adw.window.Window] can contain `class@Dialog`. Use [adw.dialog.Dialog.present] with the
    window or a widget within a window to show a dialog.
    
    ## Breakpoints
    
    [adw.window.Window] can be used with `class@Breakpoint` the same way as
    `class@BreakpointBin`. Refer to that widget's documentation for details.
    
    Example:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
      <property name="height-request">200</property>
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
    
    Like [adw.breakpoint_bin.BreakpointBin], if breakpoints are used, [adw.window.Window] doesn't have a
    minimum size, and `property@Gtk.Widget:width-request` and
    `property@Gtk.Widget:height-request` properties must be set manually.
*/
class Window : gtk.window.Window
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
    return cast(void function())adw_window_get_type != &gidSymbolNotFound ? adw_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Window self()
  {
    return this;
  }

  /**
      Get `content` property.
      Returns: The content widget.
        
        This property should always be used instead of [gtk.window.Window.child].
  */
  @property gtk.widget.Widget content()
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          This property should always be used instead of [gtk.window.Window.child].
  */
  @property void content(gtk.widget.Widget propval)
  {
    return setContent(propval);
  }

  /**
      Get `currentBreakpoint` property.
      Returns: The current breakpoint.
  */
  @property adw.breakpoint.Breakpoint currentBreakpoint()
  {
    return getCurrentBreakpoint();
  }

  /**
      Get `dialogs` property.
      Returns: The open dialogs.
  */
  @property gio.list_model.ListModel dialogs()
  {
    return getDialogs();
  }

  /**
      Get `visibleDialog` property.
      Returns: The currently visible dialog
  */
  @property adw.dialog.Dialog visibleDialog()
  {
    return getVisibleDialog();
  }

  /**
      Creates a new [adw.window.Window].
      Returns: the newly created [adw.window.Window]
  */
  this()
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
  void addBreakpoint(adw.breakpoint.Breakpoint breakpoint)
  {
    adw_window_add_breakpoint(cast(AdwWindow*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the content widget of self.
      
      This method should always be used instead of [gtk.window.Window.getChild].
      Returns: the content widget of self
  */
  gtk.widget.Widget getContent()
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
  adw.breakpoint.Breakpoint getCurrentBreakpoint()
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
  gio.list_model.ListModel getDialogs()
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
  adw.dialog.Dialog getVisibleDialog()
  {
    AdwDialog* _cretval;
    _cretval = adw_window_get_visible_dialog(cast(AdwWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.dialog.Dialog)(cast(AdwDialog*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the content widget of self.
      
      This method should always be used instead of [gtk.window.Window.setChild].
  
      Params:
        content = the content widget
  */
  void setContent(gtk.widget.Widget content = null)
  {
    adw_window_set_content(cast(AdwWindow*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }
}
