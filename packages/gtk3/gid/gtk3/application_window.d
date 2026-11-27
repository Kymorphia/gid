/// Module for [ApplicationWindow] class
module gid.gtk3.application_window;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.application;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.shortcuts_window;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    #GtkApplicationWindow is a #GtkWindow subclass that offers some
    extra functionality for better integration with #GtkApplication
    features.  Notably, it can handle both the application menu as well
    as the menubar. See [gid.gtk3.application.Application.setAppMenu] and
    [gid.gtk4.application.Application.setMenubar].
    
    This class implements the #GActionGroup and #GActionMap interfaces,
    to let you add window-specific actions that will be exported by the
    associated #GtkApplication, together with its application-wide
    actions.  Window-specific actions are prefixed with the “win.”
    prefix and application-wide actions are prefixed with the “app.”
    prefix.  Actions must be addressed with the prefixed name when
    referring to them from a #GMenuModel.
    
    Note that widgets that are placed inside a #GtkApplicationWindow
    can also activate these actions, if they implement the
    #GtkActionable interface.
    
    As with #GtkApplication, the GDK lock will be acquired when
    processing actions arriving from other processes and should therefore
    be held when activating actions locally (if GDK threads are enabled).
    
    The settings #GtkSettings:gtk-shell-shows-app-menu and
    #GtkSettings:gtk-shell-shows-menubar tell GTK+ whether the
    desktop environment is showing the application menu and menubar
    models outside the application as part of the desktop shell.
    For instance, on OS X, both menus will be displayed remotely;
    on Windows neither will be. gnome-shell (starting with version 3.4)
    will display the application menu, but not the menubar.
    
    If the desktop environment does not display the menubar, then
    #GtkApplicationWindow will automatically show a #GtkMenuBar for it.
    This behaviour can be overridden with the #GtkApplicationWindow:show-menubar
    property. If the desktop environment does not display the application
    menu, then it will automatically be included in the menubar or in the
    windows client-side decorations.
    
    ## A GtkApplicationWindow with a menubar
    
    ```c
    GtkApplication *app = gtk_application_new ("org.gtk.test", 0);
    
    GtkBuilder *builder = gtk_builder_new_from_string (
        "<interface>"
        "  <menu id='menubar'>"
        "    <submenu label='_Edit'>"
        "      <item label='_Copy' action='win.copy'/>"
        "      <item label='_Paste' action='win.paste'/>"
        "    </submenu>"
        "  </menu>"
        "</interface>",
        -1);
    
    GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder,
                                                                "menubar"));
    gtk_application_set_menubar (GTK_APPLICATION (app), menubar);
    g_object_unref (builder);
    
    // ...
    
    GtkWidget *window = gtk_application_window_new (app);
    ```
    
    ## Handling fallback yourself
    
    [A simple example](https://git.gnome.org/browse/gtk+/tree/examples/sunny.c)
    
    The XML format understood by #GtkBuilder for #GMenuModel consists
    of a toplevel `<menu>` element, which contains one or more `<item>`
    elements. Each `<item>` element contains `<attribute>` and `<link>`
    elements with a mandatory name attribute. `<link>` elements have the
    same content model as `<menu>`. Instead of `<link name="submenu>` or
    `<link name="section">`, you can use `<submenu>` or `<section>`
    elements.
    
    Attribute values can be translated using gettext, like other #GtkBuilder
    content. `<attribute>` elements can be marked for translation with a
    `translatable="yes"` attribute. It is also possible to specify message
    context and translator comments, using the context and comments attributes.
    To make use of this, the #GtkBuilder must have been given the gettext
    domain to use.
    
    The following attributes are used when constructing menu items:
    - "label": a user-visible string to display
    - "action": the prefixed name of the action to trigger
    - "target": the parameter to use when activating the action
    - "icon" and "verb-icon": names of icons that may be displayed
    - "submenu-action": name of an action that may be used to determine
         if a submenu can be opened
    - "hidden-when": a string used to determine when the item will be hidden.
         Possible values include "action-disabled", "action-missing", "macos-menubar".
    
    The following attributes are used when constructing sections:
    - "label": a user-visible string to use as section heading
    - "display-hint": a string used to determine special formatting for the section.
        Possible values include "horizontal-buttons".
    - "text-direction": a string used to determine the #GtkTextDirection to use
        when "display-hint" is set to "horizontal-buttons". Possible values
        include "rtl", "ltr", and "none".
    
    The following attributes are used when constructing submenus:
    - "label": a user-visible string to display
    - "icon": icon name to display
*/
@gidGir("ApplicationWindow", "ApplicationWindowClass")
class ApplicationWindow : gid.gtk3.window.Window, gid.gio2.action_group.ActionGroup, gid.gio2.action_map.ActionMap
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
      Get builder for [gid.gtk3.application_window.ApplicationWindow]
      Returns: New builder object
  */
  static ApplicationWindowGidBuilder builder() nothrow
  {
    return new ApplicationWindowGidBuilder;
  }

  /**
      Get `showMenubar` property.
      Returns: If this property is true, the window will display a menubar
        that includes the app menu and menubar, unless these are
        shown by the desktop shell. See [gid.gtk3.application.Application.setAppMenu]
        and [gid.gtk4.application.Application.setMenubar].
        
        If false, the window will not display a menubar, regardless
        of whether the desktop shell is showing the menus or not.
  */
  @property bool showMenubar() nothrow
  {
    return getShowMenubar();
  }

  /**
      Set `showMenubar` property.
      Params:
        propval = If this property is true, the window will display a menubar
          that includes the app menu and menubar, unless these are
          shown by the desktop shell. See [gid.gtk3.application.Application.setAppMenu]
          and [gid.gtk4.application.Application.setMenubar].
          
          If false, the window will not display a menubar, regardless
          of whether the desktop shell is showing the menus or not.
  */
  @property void showMenubar(bool propval) nothrow
  {
    setShowMenubar(propval);
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
      Creates a new #GtkApplicationWindow.
  
      Params:
        application = a #GtkApplication
      Returns: a newly created #GtkApplicationWindow
  */
  this(gid.gtk3.application.Application application) nothrow
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
      Gets the #GtkShortcutsWindow that has been set up with
      a prior call to [gid.gtk4.application_window.ApplicationWindow.setHelpOverlay].
      Returns: the help overlay associated with window, or null
  */
  gid.gtk3.shortcuts_window.ShortcutsWindow getHelpOverlay() nothrow
  {
    GtkShortcutsWindow* _cretval;
    _cretval = gtk_application_window_get_help_overlay(cast(GtkApplicationWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.shortcuts_window.ShortcutsWindow)(cast(GtkShortcutsWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the unique ID of the window. If the window has not yet been added to
      a #GtkApplication, returns `0`.
      Returns: the unique ID for window, or `0` if the window
          has not yet been added to a #GtkApplication
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
      Returns: true if window will display a menubar when needed
  */
  bool getShowMenubar() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_application_window_get_show_menubar(cast(GtkApplicationWindow*)this._cPtr);
    return _retval;
  }

  /**
      Associates a shortcuts window with the application window, and
      sets up an action with the name win.show-help-overlay to present
      it.
      
      window takes resposibility for destroying help_overlay.
  
      Params:
        helpOverlay = a #GtkShortcutsWindow
  */
  void setHelpOverlay(gid.gtk3.shortcuts_window.ShortcutsWindow helpOverlay = null) nothrow
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

/// Fluent builder implementation template for [gid.gtk3.application_window.ApplicationWindow]
class ApplicationWindowGidBuilderImpl(T) : gid.gtk3.window.WindowGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T, gid.gio2.action_map.ActionMapGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();
  mixin ActionMapGidBuilderT!();

  /**
      Set `showMenubar` property.
      Params:
        propval = If this property is true, the window will display a menubar
          that includes the app menu and menubar, unless these are
          shown by the desktop shell. See [gid.gtk3.application.Application.setAppMenu]
          and [gid.gtk4.application.Application.setMenubar].
          
          If false, the window will not display a menubar, regardless
          of whether the desktop shell is showing the menus or not.
      Returns: Builder instance for fluent chaining
  */
  T showMenubar(bool propval) nothrow
  {
    return setProperty("show-menubar", propval);
  }
}

/// Fluent builder for [gid.gtk3.application_window.ApplicationWindow]
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
