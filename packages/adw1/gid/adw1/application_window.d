/// Module for [ApplicationWindow] class
module gid.adw1.application_window;

public import gid.core.basictypes;
import gid.adw1.breakpoint;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.dialog;
import gid.adw1.types;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gio2.list_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.application;
import gid.gtk4.application_window;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.widget;

/**
    A freeform application window.
    
    <picture>
      <source srcset="application-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="application-window.png" alt="application-window">
    </picture>
    
    [gid.adw1.application_window.ApplicationWindow] is a [gid.gtk4.application_window.ApplicationWindow] subclass providing
    the same features as [gid.adw1.window.Window].
    
    See [gid.adw1.window.Window] for details.
    
    Example of an [gid.adw1.application_window.ApplicationWindow] UI definition:
    
    ```xml
    <object class="AdwApplicationWindow">
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
    
    Using [gid.gtk4.application.Application.menubar] is not supported and may result in
    visual glitches.
*/
class ApplicationWindow : gid.gtk4.application_window.ApplicationWindow
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_application_window_get_type != &gidSymbolNotFound ? adw_application_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwApplicationWindow";
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationWindow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.application_window.ApplicationWindow]
      Returns: New builder object
  */
  static ApplicationWindowGidBuilder builder() nothrow
  {
    return new ApplicationWindowGidBuilder;
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
        
        This property should always be used instead of [gid.gtk4.window.Window.child].
  */
  @property gid.gtk4.widget.Widget content() nothrow
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          This property should always be used instead of [gid.gtk4.window.Window.child].
  */
  @property void content(gid.gtk4.widget.Widget propval) nothrow
  {
    setContent(propval);
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
      Get `dialogs` property.
      Returns: The open dialogs.
  */
  @property gid.gio2.list_model.ListModel dialogs() nothrow
  {
    return getDialogs();
  }

  /**
      Get `visibleDialog` property.
      Returns: The currently visible dialog
  */
  @property gid.adw1.dialog.Dialog visibleDialog() nothrow
  {
    return getVisibleDialog();
  }

  /**
      Creates a new [gid.adw1.application_window.ApplicationWindow] for app.
  
      Params:
        app = an application instance
      Returns: the newly created [gid.adw1.application_window.ApplicationWindow]
  */
  this(gid.gtk4.application.Application app) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_application_window_new(app ? cast(GtkApplication*)app._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Adds breakpoint to self.
  
      Params:
        breakpoint = the breakpoint to add
  */
  void addBreakpoint(gid.adw1.breakpoint.Breakpoint breakpoint) nothrow
  {
    adw_application_window_add_breakpoint(cast(AdwApplicationWindow*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(Yes.Dup) : null);
  }

  /**
      Gets whether adaptive preview for self is currently open.
      Returns: whether adaptive preview is open.
  */
  bool getAdaptivePreview() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_application_window_get_adaptive_preview(cast(AdwApplicationWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content widget of self.
      
      This method should always be used instead of [gid.gtk4.window.Window.getChild].
      Returns: the content widget of self
  */
  gid.gtk4.widget.Widget getContent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_application_window_get_content(cast(AdwApplicationWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current breakpoint.
      Returns: the current breakpoint
  */
  gid.adw1.breakpoint.Breakpoint getCurrentBreakpoint() nothrow
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_application_window_get_current_breakpoint(cast(AdwApplicationWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gid.gio2.list_model.ListModel] that contains the open dialogs of self.
      
      This can be used to keep an up-to-date view.
      Returns: a list model for the dialogs of self
  */
  gid.gio2.list_model.ListModel getDialogs() nothrow
  {
    GListModel* _cretval;
    _cretval = adw_application_window_get_dialogs(cast(AdwApplicationWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the currently visible dialog in self, if there's one.
      Returns: the visible dialog
  */
  gid.adw1.dialog.Dialog getVisibleDialog() nothrow
  {
    AdwDialog* _cretval;
    _cretval = adw_application_window_get_visible_dialog(cast(AdwApplicationWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.dialog.Dialog)(cast(AdwDialog*)_cretval, No.Take);
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
    adw_application_window_set_adaptive_preview(cast(AdwApplicationWindow*)this._cPtr, adaptivePreview);
  }

  /**
      Sets the content widget of self.
      
      This method should always be used instead of [gid.gtk4.window.Window.setChild].
  
      Params:
        content = the content widget
  */
  void setContent(gid.gtk4.widget.Widget content = null) nothrow
  {
    adw_application_window_set_content(cast(AdwApplicationWindow*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.application_window.ApplicationWindow]
class ApplicationWindowGidBuilderImpl(T) : gid.gtk4.application_window.ApplicationWindowGidBuilderImpl!T
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
          
          This property should always be used instead of [gid.gtk4.window.Window.child].
      Returns: Builder instance for fluent chaining
  */
  T content(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("content", propval);
  }
}

/// Fluent builder for [gid.adw1.application_window.ApplicationWindow]
final class ApplicationWindowGidBuilder : ApplicationWindowGidBuilderImpl!ApplicationWindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ApplicationWindow build() nothrow
  {
    return new ApplicationWindow(cast(void*)createGObject(ApplicationWindow._getGType), Yes.Take);
  }
}
