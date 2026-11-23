/// Module for [ApplicationWindow] class
module gid.gtk4.application_window;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.application;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.shortcuts_window;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.gtk4.window;

/**
    A [gid.gtk4.window.Window] subclass that integrates with [gid.gtk4.application.Application].
    
    Notably, [gid.gtk4.application_window.ApplicationWindow] can handle an application menubar.
    
    This class implements the [gid.gio2.action_group.ActionGroup] and [gid.gio2.action_map.ActionMap]
    interfaces, to let you add window-specific actions that will be exported
    by the associated [gid.gtk4.application.Application], together with its application-wide
    actions. Window-specific actions are prefixed with the “win.”
    prefix and application-wide actions are prefixed with the “app.”
    prefix. Actions must be addressed with the prefixed name when
    referring to them from a menu model.
    
    Note that widgets that are placed inside a [gid.gtk4.application_window.ApplicationWindow]
    can also activate these actions, if they implement the
    [gid.gtk4.actionable.Actionable] interface.
    
    The settings [gid.gtk4.settings.Settings.gtkShellShowsAppMenu] and
    [gid.gtk4.settings.Settings.gtkShellShowsMenubar] tell GTK whether the
    desktop environment is showing the application menu and menubar
    models outside the application as part of the desktop shell.
    For instance, on OS X, both menus will be displayed remotely;
    on Windows neither will be.
    
    If the desktop environment does not display the menubar, it can be shown in
    the [gid.gtk4.application_window.ApplicationWindow] by setting the
    [gid.gtk4.application_window.ApplicationWindow.showMenubar] property to true. If the
    desktop environment does not display the application menu, then it will
    automatically be included in the menubar or in the window’s client-side
    decorations.
    
    See [gid.gtk4.popover_menu.PopoverMenu] for information about the XML language
    used by [gid.gtk4.builder.Builder] for menu models.
    
    See also: [gid.gtk4.application.Application.setMenubar].
    
    ## A GtkApplicationWindow with a menubar
    
    The code sample below shows how to set up a [gid.gtk4.application_window.ApplicationWindow]
    with a menu bar defined on the [gid.gtk4.application.Application]:
    
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
class ApplicationWindow : gid.gtk4.window.Window, gid.gio2.action_group.ActionGroup, gid.gio2.action_map.ActionMap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_application_window_get_type != &gidSymbolNotFound ? gtk_application_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkApplicationWindow";
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationWindow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.application_window.ApplicationWindow]
      Returns: New builder object
  */
  static ApplicationWindowGidBuilder builder() nothrow
  {
    return new ApplicationWindowGidBuilder;
  }

  /**
      Get `showMenubar` property.
      Returns: If this property is true, the window will display a menubar
        unless it is shown by the desktop shell.
        
        See [gid.gtk4.application.Application.setMenubar].
        
        If false, the window will not display a menubar, regardless
        of whether the desktop shell is showing it or not.
  */
  @property bool showMenubar() nothrow
  {
    return getShowMenubar();
  }

  /**
      Set `showMenubar` property.
      Params:
        propval = If this property is true, the window will display a menubar
          unless it is shown by the desktop shell.
          
          See [gid.gtk4.application.Application.setMenubar].
          
          If false, the window will not display a menubar, regardless
          of whether the desktop shell is showing it or not.
  */
  @property void showMenubar(bool propval) nothrow
  {
    setShowMenubar(propval);
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();
  alias activateAction = gid.gtk4.widget.Widget.activateAction;

  /**
      Creates a new [gid.gtk4.application_window.ApplicationWindow].
  
      Params:
        application = an application
      Returns: a newly created [gid.gtk4.application_window.ApplicationWindow]
  */
  this(gid.gtk4.application.Application application) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_application_window_new(application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the [gid.gtk4.shortcuts_window.ShortcutsWindow] that is associated with window.
      
      See [gid.gtk4.application_window.ApplicationWindow.setHelpOverlay].
      Returns: the help overlay associated
          with the window
  
      Deprecated: [gid.gtk4.shortcuts_window.ShortcutsWindow] will be removed in GTK 5
  */
  gid.gtk4.shortcuts_window.ShortcutsWindow getHelpOverlay() nothrow
  {
    GtkShortcutsWindow* _cretval;
    _cretval = gtk_application_window_get_help_overlay(cast(GtkApplicationWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcuts_window.ShortcutsWindow)(cast(GtkShortcutsWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the unique ID of the window.
      
       If the window has not yet been added to a [gid.gtk4.application.Application], returns `0`.
      Returns: the unique ID for the window, or `0` if the window
          has not yet been added to an application
  */
  uint getId() nothrow
  {
    uint _retval;
    _retval = gtk_application_window_get_id(cast(GtkApplicationWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will display a menubar for the app menu
      and menubar as needed.
      Returns: True if the window will display a menubar when needed
  */
  bool getShowMenubar() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_application_window_get_show_menubar(cast(GtkApplicationWindow*)this._cPtr);
    return _retval;
  }

  /**
      Associates a shortcuts window with the application window.
      
      Additionally, sets up an action with the name
      `win.show-help-overlay` to present it.
      
      The window takes responsibility for destroying the help overlay.
  
      Params:
        helpOverlay = a shortcuts window
  
      Deprecated: [gid.gtk4.shortcuts_window.ShortcutsWindow] will be removed in GTK 5
  */
  void setHelpOverlay(gid.gtk4.shortcuts_window.ShortcutsWindow helpOverlay = null) nothrow
  {
    gtk_application_window_set_help_overlay(cast(GtkApplicationWindow*)this._cPtr, helpOverlay ? cast(GtkShortcutsWindow*)helpOverlay._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the window will display a menubar for the app menu
      and menubar as needed.
  
      Params:
        showMenubar = whether to show a menubar when needed
  */
  void setShowMenubar(bool showMenubar) nothrow
  {
    gtk_application_window_set_show_menubar(cast(GtkApplicationWindow*)this._cPtr, showMenubar);
  }
}

/// Fluent builder implementation template for [gid.gtk4.application_window.ApplicationWindow]
class ApplicationWindowGidBuilderImpl(T) : gid.gtk4.window.WindowGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T, gid.gio2.action_map.ActionMapGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();
  mixin ActionMapGidBuilderT!();

  /**
      Set `showMenubar` property.
      Params:
        propval = If this property is true, the window will display a menubar
          unless it is shown by the desktop shell.
          
          See [gid.gtk4.application.Application.setMenubar].
          
          If false, the window will not display a menubar, regardless
          of whether the desktop shell is showing it or not.
      Returns: Builder instance for fluent chaining
  */
  T showMenubar(bool propval) nothrow
  {
    return setProperty("show-menubar", propval);
  }
}

/// Fluent builder for [gid.gtk4.application_window.ApplicationWindow]
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
