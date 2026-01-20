/// Module for [ApplicationWindow] class
module gtk.application_window;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gobject.object;
import gtk.application;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcuts_window;
import gtk.types;
import gtk.window;

/**
    #GtkApplicationWindow is a #GtkWindow subclass that offers some
    extra functionality for better integration with #GtkApplication
    features.  Notably, it can handle both the application menu as well
    as the menubar. See [gtk.application.Application.setAppMenu] and
    [gtk.application.Application.setMenubar].
    
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
    $(LIST
      * "label": a user-visible string to display
      * "action": the prefixed name of the action to trigger
      * "target": the parameter to use when activating the action
      * "icon" and "verb-icon": names of icons that may be displayed
      * "submenu-action": name of an action that may be used to determine
           if a submenu can be opened
      * "hidden-when": a string used to determine when the item will be hidden.
           Possible values include "action-disabled", "action-missing", "macos-menubar".
    )
      
    The following attributes are used when constructing sections:
    $(LIST
      * "label": a user-visible string to use as section heading
      * "display-hint": a string used to determine special formatting for the section.
          Possible values include "horizontal-buttons".
      * "text-direction": a string used to determine the #GtkTextDirection to use
          when "display-hint" is set to "horizontal-buttons". Possible values
          include "rtl", "ltr", and "none".
    )
      
    The following attributes are used when constructing submenus:
    $(LIST
      * "label": a user-visible string to display
      * "icon": icon name to display
    )
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
        that includes the app menu and menubar, unless these are
        shown by the desktop shell. See [gtk.application.Application.setAppMenu]
        and [gtk.application.Application.setMenubar].
        
        If false, the window will not display a menubar, regardless
        of whether the desktop shell is showing the menus or not.
  */
  @property bool showMenubar()
  {
    return getShowMenubar();
  }

  /**
      Set `showMenubar` property.
      Params:
        propval = If this property is true, the window will display a menubar
          that includes the app menu and menubar, unless these are
          shown by the desktop shell. See [gtk.application.Application.setAppMenu]
          and [gtk.application.Application.setMenubar].
          
          If false, the window will not display a menubar, regardless
          of whether the desktop shell is showing the menus or not.
  */
  @property void showMenubar(bool propval)
  {
    return setShowMenubar(propval);
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
      Creates a new #GtkApplicationWindow.
  
      Params:
        application = a #GtkApplication
      Returns: a newly created #GtkApplicationWindow
  */
  this(gtk.application.Application application)
  {
    GtkWidget* _cretval;
    _cretval = gtk_application_window_new(application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkShortcutsWindow that has been set up with
      a prior call to [gtk.application_window.ApplicationWindow.setHelpOverlay].
      Returns: the help overlay associated with window, or null
  */
  gtk.shortcuts_window.ShortcutsWindow getHelpOverlay()
  {
    GtkShortcutsWindow* _cretval;
    _cretval = gtk_application_window_get_help_overlay(cast(GtkApplicationWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcuts_window.ShortcutsWindow)(cast(GtkShortcutsWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the unique ID of the window. If the window has not yet been added to
      a #GtkApplication, returns `0`.
      Returns: the unique ID for window, or `0` if the window
          has not yet been added to a #GtkApplication
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
      Associates a shortcuts window with the application window, and
      sets up an action with the name win.show-help-overlay to present
      it.
      
      window takes resposibility for destroying help_overlay.
  
      Params:
        helpOverlay = a #GtkShortcutsWindow
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
