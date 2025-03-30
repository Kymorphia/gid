/// Module for [ApplicationWindow] class
module adw.application_window;

import adw.breakpoint;
import adw.c.functions;
import adw.c.types;
import adw.dialog;
import adw.types;
import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.list_model;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.application;
import gtk.application_window;
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

/**
    A freeform application window.
    
    <picture>
      <source srcset="application-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="application-window.png" alt="application-window">
    </picture>
    
    [adw.application_window.ApplicationWindow] is a [gtk.application_window.ApplicationWindow] subclass providing
    the same features as `class@Window`.
    
    See `class@Window` for details.
    
    Example of an [adw.application_window.ApplicationWindow] UI definition:
    
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
    
    Using [gtk.application.Application.Gio.MenuModel] is not supported and may result in
    visual glitches.
*/
class ApplicationWindow : gtk.application_window.ApplicationWindow
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_application_window_get_type != &gidSymbolNotFound ? adw_application_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ApplicationWindow self()
  {
    return this;
  }

  /**
      Creates a new [adw.application_window.ApplicationWindow] for app.
  
      Params:
        app = an application instance
      Returns: the newly created [adw.application_window.ApplicationWindow]
  */
  this(gtk.application.Application app)
  {
    GtkWidget* _cretval;
    _cretval = adw_application_window_new(app ? cast(GtkApplication*)app.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Adds breakpoint to self.
  
      Params:
        breakpoint = the breakpoint to add
  */
  void addBreakpoint(adw.breakpoint.Breakpoint breakpoint)
  {
    adw_application_window_add_breakpoint(cast(AdwApplicationWindow*)cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint.cPtr(Yes.Dup) : null);
  }

  /**
      Gets the content widget of self.
      
      This method should always be used instead of [gtk.window.Window.getChild].
      Returns: the content widget of self
  */
  gtk.widget.Widget getContent()
  {
    GtkWidget* _cretval;
    _cretval = adw_application_window_get_content(cast(AdwApplicationWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current breakpoint.
      Returns: the current breakpoint
  */
  adw.breakpoint.Breakpoint getCurrentBreakpoint()
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_application_window_get_current_breakpoint(cast(AdwApplicationWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
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
    _cretval = adw_application_window_get_dialogs(cast(AdwApplicationWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the currently visible dialog in self, if there's one.
      Returns: the visible dialog
  */
  adw.dialog.Dialog getVisibleDialog()
  {
    AdwDialog* _cretval;
    _cretval = adw_application_window_get_visible_dialog(cast(AdwApplicationWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.dialog.Dialog)(cast(AdwDialog*)_cretval, No.Take);
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
    adw_application_window_set_content(cast(AdwApplicationWindow*)cPtr, content ? cast(GtkWidget*)content.cPtr(No.Dup) : null);
  }
}
