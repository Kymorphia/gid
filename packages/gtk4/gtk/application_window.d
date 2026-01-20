/// Module for [ApplicationWindow] class
module gtk.application_window;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.application;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.shortcuts_window;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    [gtk.application_window.ApplicationWindow] is a [gtk.window.Window] subclass that integrates with
    [gtk.application.Application].
    
    Notably, [gtk.application_window.ApplicationWindow] can handle an application menubar.
    
    This class implements the [gio.action_group.ActionGroup] and [gio.action_map.ActionMap] interfaces,
    to let you add window-specific actions that will be exported by the
    associated [gtk.application.Application], together with its application-wide
    actions. Window-specific actions are prefixed with the “win.”
    prefix and application-wide actions are prefixed with the “app.”
    prefix. Actions must be addressed with the prefixed name when
    referring to them from a [gio.menu_model.MenuModel].
    
    Note that widgets that are placed inside a [gtk.application_window.ApplicationWindow]
    can also activate these actions, if they implement the
    [gtk.actionable.Actionable] interface.
    
    The settings `property@Gtk.Settings:gtk-shell-shows-app-menu` and
    `property@Gtk.Settings:gtk-shell-shows-menubar` tell GTK whether the
    desktop environment is showing the application menu and menubar
    models outside the application as part of the desktop shell.
    For instance, on OS X, both menus will be displayed remotely;
    on Windows neither will be.
    
    If the desktop environment does not display the menubar, then
    [gtk.application_window.ApplicationWindow] will automatically show a menubar for it.
    This behaviour can be overridden with the
    `property@Gtk.ApplicationWindow:show-menubar` property. If the
    desktop environment does not display the application menu, then
    it will automatically be included in the menubar or in the windows
    client-side decorations.
    
    See [gtk.popover_menu.PopoverMenu] for information about the XML language
    used by [gtk.builder.Builder] for menu models.
    
    See also: [gtk.application.Application.setMenubar].
    
    ## A GtkApplicationWindow with a menubar
    
    The code sample below shows how to set up a [gtk.application_window.ApplicationWindow]
    with a menu bar defined on the [gtk.application.Application]:
    
    ```c
    GtkApplication *app = gtk_application_new ("org.gtk.test", 0);
    
    GtkBuilder *builder = gtk_builder_new_from_string (
        "<interface>"
        "  <menu id='menubar'>"
        "    <submenu>"
        "      <attribute name='label' translatable='yes'>_Edit</attribute>"
        "      <item>"
        "        <attribute name='label' translatable='yes'>_Copy</attribute>"
        "        <attribute name='action'>win.copy</attribute>"
        "      </item>"
        "      <item>"
        "        <attribute name='label' translatable='yes'>_Paste</attribute>"
        "        <attribute name='action'>win.paste</attribute>"
        "      </item>"
        "    </submenu>"
        "  </menu>"
        "</interface>",
        -1);
    
    GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder, "menubar"));
    gtk_application_set_menubar (GTK_APPLICATION (app), menubar);
    g_object_unref (builder);
    
    // ...
    
    GtkWidget *window = gtk_application_window_new (app);
    ```
*/
class ApplicationWindow : gtk.window.Window, gio.action_group.ActionGroup, gio.action_map.ActionMap
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
    return cast(void function())gtk_application_window_get_type != &gidSymbolNotFound ? gtk_application_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationWindow self()
  {
    return this;
  }

  /**
      Get `showMenubar` property.
      Returns: If this property is true, the window will display a menubar
        unless it is shown by the desktop shell.
        
        See [gtk.application.Application.setMenubar].
        
        If false, the window will not display a menubar, regardless
        of whether the desktop shell is showing it or not.
  */
  @property bool showMenubar()
  {
    return getShowMenubar();
  }

  /**
      Set `showMenubar` property.
      Params:
        propval = If this property is true, the window will display a menubar
          unless it is shown by the desktop shell.
          
          See [gtk.application.Application.setMenubar].
          
          If false, the window will not display a menubar, regardless
          of whether the desktop shell is showing it or not.
  */
  @property void showMenubar(bool propval)
  {
    return setShowMenubar(propval);
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();
  alias activateAction = gtk.widget.Widget.activateAction;

  /**
      Creates a new [gtk.application_window.ApplicationWindow].
  
      Params:
        application = a [gtk.application.Application]
      Returns: a newly created [gtk.application_window.ApplicationWindow]
  */
  this(gtk.application.Application application)
  {
    GtkWidget* _cretval;
    _cretval = gtk_application_window_new(application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the [gtk.shortcuts_window.ShortcutsWindow] that is associated with window.
      
      See [gtk.application_window.ApplicationWindow.setHelpOverlay].
      Returns: the help overlay associated
          with window
  */
  gtk.shortcuts_window.ShortcutsWindow getHelpOverlay()
  {
    GtkShortcutsWindow* _cretval;
    _cretval = gtk_application_window_get_help_overlay(cast(GtkApplicationWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcuts_window.ShortcutsWindow)(cast(GtkShortcutsWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the unique ID of the window.
      
       If the window has not yet been added to a [gtk.application.Application], returns `0`.
      Returns: the unique ID for window, or `0` if the window
          has not yet been added to a [gtk.application.Application]
  */
  uint getId()
  {
    uint _retval;
    _retval = gtk_application_window_get_id(cast(GtkApplicationWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will display a menubar for the app menu
      and menubar as needed.
      Returns: true if window will display a menubar when needed
  */
  bool getShowMenubar()
  {
    bool _retval;
    _retval = cast(bool)gtk_application_window_get_show_menubar(cast(GtkApplicationWindow*)this._cPtr);
    return _retval;
  }

  /**
      Associates a shortcuts window with the application window.
      
      Additionally, sets up an action with the name
      `win.show-help-overlay` to present it.
      
      window takes responsibility for destroying help_overlay.
  
      Params:
        helpOverlay = a [gtk.shortcuts_window.ShortcutsWindow]
  */
  void setHelpOverlay(gtk.shortcuts_window.ShortcutsWindow helpOverlay = null)
  {
    gtk_application_window_set_help_overlay(cast(GtkApplicationWindow*)this._cPtr, helpOverlay ? cast(GtkShortcutsWindow*)helpOverlay._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the window will display a menubar for the app menu
      and menubar as needed.
  
      Params:
        showMenubar = whether to show a menubar when needed
  */
  void setShowMenubar(bool showMenubar)
  {
    gtk_application_window_set_show_menubar(cast(GtkApplicationWindow*)this._cPtr, showMenubar);
  }
}
