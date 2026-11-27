/// Module for [Application] class
module gid.gtk3.application;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gio2.application;
import gid.gio2.menu;
import gid.gio2.menu_model;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    #GtkApplication is a class that handles many important aspects
    of a GTK+ application in a convenient fashion, without enforcing
    a one-size-fits-all application model.
    
    Currently, GtkApplication handles GTK+ initialization, application
    uniqueness, session management, provides some basic scriptability and
    desktop shell integration by exporting actions and menus and manages a
    list of toplevel windows whose life-cycle is automatically tied to the
    life-cycle of your application.
    
    While GtkApplication works fine with plain #GtkWindows, it is recommended
    to use it together with #GtkApplicationWindow.
    
    When GDK threads are enabled, GtkApplication will acquire the GDK
    lock when invoking actions that arrive from other processes.  The GDK
    lock is not touched for local action invocations.  In order to have
    actions invoked in a predictable context it is therefore recommended
    that the GDK lock be held while invoking actions locally with
    [gid.gio2.action_group.ActionGroup.activateAction].  The same applies to actions
    associated with #GtkApplicationWindow and to the “activate” and
    “open” #GApplication methods.
    
    ## Automatic resources ## {#automatic-resources}
    
    #GtkApplication will automatically load menus from the #GtkBuilder
    resource located at "gtk/menus.ui", relative to the application's
    resource base path (see [gid.gio2.application.Application.setResourceBasePath]).  The
    menu with the ID "app-menu" is taken as the application's app menu
    and the menu with the ID "menubar" is taken as the application's
    menubar.  Additional menus (most interesting submenus) can be named
    and accessed via [gid.gtk4.application.Application.getMenuById] which allows for
    dynamic population of a part of the menu structure.
    
    If the resources "gtk/menus-appmenu.ui" or "gtk/menus-traditional.ui" are
    present then these files will be used in preference, depending on the value
    of [gid.gtk3.application.Application.prefersAppMenu]. If the resource "gtk/menus-common.ui"
    is present it will be loaded as well. This is useful for storing items that
    are referenced from both "gtk/menus-appmenu.ui" and
    "gtk/menus-traditional.ui".
    
    It is also possible to provide the menus manually using
    [gid.gtk3.application.Application.setAppMenu] and [gid.gtk4.application.Application.setMenubar].
    
    #GtkApplication will also automatically setup an icon search path for
    the default icon theme by appending "icons" to the resource base
    path.  This allows your application to easily store its icons as
    resources.  See [gid.gtk4.icon_theme.IconTheme.addResourcePath] for more
    information.
    
    If there is a resource located at "gtk/help-overlay.ui" which
    defines a #GtkShortcutsWindow with ID "help_overlay" then GtkApplication
    associates an instance of this shortcuts window with each
    #GtkApplicationWindow and sets up keyboard accelerators (Control-F1
    and Control-?) to open it. To create a menu item that displays the
    shortcuts window, associate the item with the action win.show-help-overlay.
    
    ## A simple application ## {#gtkapplication}
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/examples/bp/bloatpad.c)
    
    GtkApplication optionally registers with a session manager
    of the users session (if you set the #GtkApplication:register-session
    property) and offers various functionality related to the session
    life-cycle.
    
    An application can block various ways to end the session with
    the [gid.gtk4.application.Application.inhibit] function. Typical use cases for
    this kind of inhibiting are long-running, uninterruptible operations,
    such as burning a CD or performing a disk backup. The session
    manager may not honor the inhibitor, but it can be expected to
    inform the user about the negative consequences of ending the
    session while inhibitors are present.
    
    ## See Also ## {#seealso}
    [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
    [Getting Started with GTK+: Basics](https://developer.gnome.org/gtk3/stable/gtk-getting-started.html#id-1.2.3.3)
*/
@gidGir("Application", "ApplicationClass")
class Application : gid.gio2.application.Application
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
    return cast(void function())gtk_application_get_type != &gidSymbolNotFound ? gtk_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkApplication";
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.application.Application]
      Returns: New builder object
  */
  static ApplicationGidBuilder builder() nothrow
  {
    return new ApplicationGidBuilder;
  }

  /** */
  @property gid.gtk3.window.Window activeWindow() nothrow
  {
    return getActiveWindow();
  }

  /** */
  @property gid.gio2.menu_model.MenuModel appMenu() nothrow
  {
    return getAppMenu();
  }

  /** */
  @property void appMenu(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setAppMenu(propval);
  }

  /** */
  @property gid.gio2.menu_model.MenuModel menubar() nothrow
  {
    return getMenubar();
  }

  /** */
  @property void menubar(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenubar(propval);
  }

  /**
      Get `registerSession` property.
      Returns: Set this property to true to register with the session manager.
  */
  @property bool registerSession() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("register-session");
  }

  /**
      Set `registerSession` property.
      Params:
        propval = Set this property to true to register with the session manager.
  */
  @property void registerSession(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("register-session", propval);
  }

  /**
      Get `screensaverActive` property.
      Returns: This property is true if GTK+ believes that the screensaver is
        currently active. GTK+ only tracks session state (including this)
        when #GtkApplication::register-session is set to true.
        
        Tracking the screensaver state is supported on Linux.
  */
  @property bool screensaverActive() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("screensaver-active");
  }

  /**
      Creates a new #GtkApplication instance.
      
      When using #GtkApplication, it is not necessary to call [gid.gtk4.global.init_]
      manually. It is called as soon as the application gets registered as
      the primary instance.
      
      Concretely, [gid.gtk4.global.init_] is called in the default handler for the
      #GApplication::startup signal. Therefore, #GtkApplication subclasses should
      chain up in their #GApplication::startup handler before using any GTK+ API.
      
      Note that commandline arguments are not passed to [gid.gtk4.global.init_].
      All GTK+ functionality that is available via commandline arguments
      can also be achieved by setting suitable environment variables
      such as `G_DEBUG`, so this should not be a big
      problem. If you absolutely must support GTK+ commandline arguments,
      you can explicitly call [gid.gtk4.global.init_] before creating the application
      instance.
      
      If non-null, the application ID must be valid.  See
      [gid.gio2.application.Application.idIsValid].
      
      If no application ID is given then some features (most notably application
      uniqueness) will be disabled. A null application ID is only allowed with
      GTK+ 3.6 or later.
  
      Params:
        applicationId = The application ID.
        flags = the application flags
      Returns: a new #GtkApplication instance
  */
  this(string applicationId, gid.gio2.types.ApplicationFlags flags) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkApplication* _cretval;
      const(char)* _applicationId = applicationId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_application_new(_applicationId, flags);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Signal emitted when a #GtkWindow is added to
         application through [gid.gtk4.application.Application.addWindow].
  
      Params:
        window = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWindowAdded` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncWindowAdded(gid.gtk3.window.Window window)
  {
    auto _klass = cast(GtkApplicationClass*)_vfuncClass;
    if (!_klass.windowAdded)
      return;

    _klass.windowAdded(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when a #GtkWindow is removed from
         application, either as a side-effect of being destroyed or
         explicitly through [gid.gtk4.application.Application.removeWindow].
  
      Params:
        window = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWindowRemoved` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncWindowRemoved(gid.gtk3.window.Window window)
  {
    auto _klass = cast(GtkApplicationClass*)_vfuncClass;
    if (!_klass.windowRemoved)
      return;

    _klass.windowRemoved(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Installs an accelerator that will cause the named action
      to be activated when the key combination specificed by accelerator
      is pressed.
      
      accelerator must be a string that can be parsed by [gid.gtk4.global.acceleratorParse],
      e.g. "<Primary>q" or “<Control><Alt>p”.
      
      action_name must be the name of an action as it would be used
      in the app menu, i.e. actions that have been added to the application
      are referred to with an “app.” prefix, and window-specific actions
      with a “win.” prefix.
      
      GtkApplication also extracts accelerators out of “accel” attributes
      in the #GMenuModels passed to [gid.gtk3.application.Application.setAppMenu] and
      [gid.gtk4.application.Application.setMenubar], which is usually more convenient
      than calling this function for each accelerator.
  
      Params:
        accelerator = accelerator string
        actionName = the name of the action to activate
        parameter = parameter to pass when activating the action,
            or null if the action does not accept an activation parameter
  
      Deprecated: Use [gid.gtk4.application.Application.setAccelsForAction] instead
  */
  void addAccelerator(string accelerator, string actionName, gid.glib2.variant.Variant parameter = null) nothrow
  {
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    gtk_application_add_accelerator(cast(GtkApplication*)this._cPtr, _accelerator, _actionName, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Adds a window to application.
      
      This call can only happen after the application has started;
      typically, you should add new application windows in response
      to the emission of the #GApplication::activate signal.
      
      This call is equivalent to setting the #GtkWindow:application
      property of window to application.
      
      Normally, the connection between the application and the window
      will remain until the window is destroyed, but you can explicitly
      remove it with [gid.gtk4.application.Application.removeWindow].
      
      GTK+ will keep the application running as long as it has
      any windows.
  
      Params:
        window = a #GtkWindow
  */
  void addWindow(gid.gtk3.window.Window window) nothrow
  {
    gtk_application_add_window(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Gets the accelerators that are currently associated with
      the given action.
  
      Params:
        detailedActionName = a detailed action name, specifying an action
              and target to obtain accelerators for
      Returns: accelerators for detailed_action_name, as
            a null-terminated array. Free with [gid.glib2.global.strfreev] when no longer needed
  */
  string[] getAccelsForAction(string detailedActionName) nothrow
  {
    char** _cretval;
    const(char)* _detailedActionName = detailedActionName.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_application_get_accels_for_action(cast(GtkApplication*)this._cPtr, _detailedActionName);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the list of actions (possibly empty) that accel maps to.
      Each item in the list is a detailed action name in the usual form.
      
      This might be useful to discover if an accel already exists in
      order to prevent installation of a conflicting accelerator (from
      an accelerator editor or a plugin system, for example). Note that
      having more than one action per accelerator may not be a bad thing
      and might make sense in cases where the actions never appear in the
      same context.
      
      In case there are no actions for a given accelerator, an empty array
      is returned.  null is never returned.
      
      It is a programmer error to pass an invalid accelerator string.
      If you are unsure, check it with [gid.gtk4.global.acceleratorParse] first.
  
      Params:
        accel = an accelerator that can be parsed by [gid.gtk4.global.acceleratorParse]
      Returns: a null-terminated array of actions for accel
  */
  string[] getActionsForAccel(string accel) nothrow
  {
    char** _cretval;
    const(char)* _accel = accel.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_application_get_actions_for_accel(cast(GtkApplication*)this._cPtr, _accel);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the “active” window for the application.
      
      The active window is the one that was most recently focused (within
      the application).  This window may not have the focus at the moment
      if another application has it — this is just the most
      recently-focused window within this application.
      Returns: the active window, or null if
          there isn't one.
  */
  gid.gtk3.window.Window getActiveWindow() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_active_window(cast(GtkApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the menu model that has been set with
      [gid.gtk3.application.Application.setAppMenu].
      Returns: the application menu of application
          or null if no application menu has been set.
  */
  gid.gio2.menu_model.MenuModel getAppMenu() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_app_menu(cast(GtkApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a menu from automatically loaded resources.
      See [Automatic resources][automatic-resources]
      for more information.
  
      Params:
        id = the id of the menu to look up
      Returns: Gets the menu with the
            given id from the automatically loaded resources
  */
  gid.gio2.menu.Menu getMenuById(string id) nothrow
  {
    GMenu* _cretval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_application_get_menu_by_id(cast(GtkApplication*)this._cPtr, _id);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu.Menu)(cast(GMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the menu model that has been set with
      [gid.gtk4.application.Application.setMenubar].
      Returns: the menubar for windows of application
  */
  gid.gio2.menu_model.MenuModel getMenubar() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_menubar(cast(GtkApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkApplicationWindow with the given ID.
      
      The ID of a #GtkApplicationWindow can be retrieved with
      [gid.gtk4.application_window.ApplicationWindow.getId].
  
      Params:
        id = an identifier number
      Returns: the window with ID id, or
          null if there is no window with this ID
  */
  gid.gtk3.window.Window getWindowById(uint id) nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_window_by_id(cast(GtkApplication*)this._cPtr, id);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list of the #GtkWindows associated with application.
      
      The list is sorted by most recently focused window, such that the first
      element is the currently focused window. (Useful for choosing a parent
      for a transient window.)
      
      The list that is returned should not be modified in any way. It will
      only remain valid until the next focus change or window creation or
      deletion.
      Returns: a #GList of #GtkWindow
  */
  gid.gtk3.window.Window[] getWindows() nothrow
  {
    GList* _cretval;
    _cretval = gtk_application_get_windows(cast(GtkApplication*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Inform the session manager that certain types of actions should be
      inhibited. This is not guaranteed to work on all platforms and for
      all types of actions.
      
      Applications should invoke this method when they begin an operation
      that should not be interrupted, such as creating a CD or DVD. The
      types of actions that may be blocked are specified by the flags
      parameter. When the application completes the operation it should
      call [gid.gtk4.application.Application.uninhibit] to remove the inhibitor. Note that
      an application can have multiple inhibitors, and all of them must
      be individually removed. Inhibitors are also cleared when the
      application exits.
      
      Applications should not expect that they will always be able to block
      the action. In most cases, users will be given the option to force
      the action to take place.
      
      Reasons should be short and to the point.
      
      If window is given, the session manager may point the user to
      this window to find out more about why the action is inhibited.
  
      Params:
        window = a #GtkWindow, or null
        flags = what types of actions should be inhibited
        reason = a short, human-readable string that explains
              why these operations are inhibited
      Returns: A non-zero cookie that is used to uniquely identify this
            request. It should be used as an argument to [gid.gtk4.application.Application.uninhibit]
            in order to remove the request. If the platform does not support
            inhibiting or the request failed for some reason, 0 is returned.
  */
  uint inhibit(gid.gtk3.window.Window window, gid.gtk3.types.ApplicationInhibitFlags flags, string reason = null) nothrow
  {
    uint _retval;
    const(char)* _reason = reason.toCString!(No.Malloc, Yes.Nullable);
    _retval = gtk_application_inhibit(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null, flags, _reason);
    return _retval;
  }

  /**
      Determines if any of the actions specified in flags are
      currently inhibited (possibly by another application).
      
      Note that this information may not be available (for example
      when the application is running in a sandbox).
  
      Params:
        flags = what types of actions should be queried
      Returns: true if any of the actions specified in flags are inhibited
  */
  bool isInhibited(gid.gtk3.types.ApplicationInhibitFlags flags) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_application_is_inhibited(cast(GtkApplication*)this._cPtr, flags);
    return _retval;
  }

  /**
      Lists the detailed action names which have associated accelerators.
      See [gid.gtk4.application.Application.setAccelsForAction].
      Returns: a null-terminated array of strings,
            free with [gid.glib2.global.strfreev] when done
  */
  string[] listActionDescriptions() nothrow
  {
    char** _cretval;
    _cretval = gtk_application_list_action_descriptions(cast(GtkApplication*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Determines if the desktop environment in which the application is
      running would prefer an application menu be shown.
      
      If this function returns true then the application should call
      [gid.gtk3.application.Application.setAppMenu] with the contents of an application
      menu, which will be shown by the desktop environment.  If it returns
      false then you should consider using an alternate approach, such as
      a menubar.
      
      The value returned by this function is purely advisory and you are
      free to ignore it.  If you call [gid.gtk3.application.Application.setAppMenu] even
      if the desktop environment doesn't support app menus, then a fallback
      will be provided.
      
      Applications are similarly free not to set an app menu even if the
      desktop environment wants to show one.  In that case, a fallback will
      also be created by the desktop environment (GNOME, for example, uses
      a menu with only a "Quit" item in it).
      
      The value returned by this function never changes.  Once it returns a
      particular value, it is guaranteed to always return the same value.
      
      You may only call this function after the application has been
      registered and after the base startup handler has run.  You're most
      likely to want to use this from your own startup handler.  It may
      also make sense to consult this function while constructing UI (in
      activate, open or an action activation handler) in order to determine
      if you should show a gear menu or not.
      
      This function will return false on Mac OS and a default app menu
      will be created automatically with the "usual" contents of that menu
      typical to most Mac OS applications.  If you call
      [gid.gtk3.application.Application.setAppMenu] anyway, then this menu will be
      replaced with your own.
      Returns: true if you should set an app menu
  */
  bool prefersAppMenu() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_application_prefers_app_menu(cast(GtkApplication*)this._cPtr);
    return _retval;
  }

  /**
      Removes an accelerator that has been previously added
      with [gid.gtk3.application.Application.addAccelerator].
  
      Params:
        actionName = the name of the action to activate
        parameter = parameter to pass when activating the action,
            or null if the action does not accept an activation parameter
  
      Deprecated: Use [gid.gtk4.application.Application.setAccelsForAction] instead
  */
  void removeAccelerator(string actionName, gid.glib2.variant.Variant parameter = null) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    gtk_application_remove_accelerator(cast(GtkApplication*)this._cPtr, _actionName, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Remove a window from application.
      
      If window belongs to application then this call is equivalent to
      setting the #GtkWindow:application property of window to
      null.
      
      The application may stop running as a result of a call to this
      function.
  
      Params:
        window = a #GtkWindow
  */
  void removeWindow(gid.gtk3.window.Window window) nothrow
  {
    gtk_application_remove_window(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Sets zero or more keyboard accelerators that will trigger the
      given action. The first item in accels will be the primary
      accelerator, which may be displayed in the UI.
      
      To remove all accelerators for an action, use an empty, zero-terminated
      array for accels.
      
      For the detailed_action_name, see [gid.gio2.action.Action.parseDetailedName] and
      [gid.gio2.action.Action.printDetailedName].
  
      Params:
        detailedActionName = a detailed action name, specifying an action
              and target to associate accelerators with
        accels = a list of accelerators in the format
              understood by [gid.gtk4.global.acceleratorParse]
  */
  void setAccelsForAction(string detailedActionName, string[] accels) nothrow
  {
    const(char)* _detailedActionName = detailedActionName.toCString!(No.Malloc, No.Nullable);
    auto _accels_arr = new char*[](accels.length + 1);
    auto _accels = cast(char**)_accels_arr.ptr;
    foreach (i, s; accels) _accels[i] = s.toCString!(No.Malloc);
    gtk_application_set_accels_for_action(cast(GtkApplication*)this._cPtr, _detailedActionName, _accels);
  }

  /**
      Sets or unsets the application menu for application.
      
      This can only be done in the primary instance of the application,
      after it has been registered.  #GApplication::startup is a good place
      to call this.
      
      The application menu is a single menu containing items that typically
      impact the application as a whole, rather than acting on a specific
      window or document.  For example, you would expect to see
      “Preferences” or “Quit” in an application menu, but not “Save” or
      “Print”.
      
      If supported, the application menu will be rendered by the desktop
      environment.
      
      Use the base #GActionMap interface to add actions, to respond to the user
      selecting these menu items.
  
      Params:
        appMenu = a #GMenuModel, or null
  */
  void setAppMenu(gid.gio2.menu_model.MenuModel appMenu = null) nothrow
  {
    gtk_application_set_app_menu(cast(GtkApplication*)this._cPtr, appMenu ? cast(GMenuModel*)appMenu._cPtr(No.Dup) : null);
  }

  /**
      Sets or unsets the menubar for windows of application.
      
      This is a menubar in the traditional sense.
      
      This can only be done in the primary instance of the application,
      after it has been registered.  #GApplication::startup is a good place
      to call this.
      
      Depending on the desktop environment, this may appear at the top of
      each window, or at the top of the screen.  In some environments, if
      both the application menu and the menubar are set, the application
      menu will be presented as if it were the first item of the menubar.
      Other environments treat the two as completely separate — for example,
      the application menu may be rendered by the desktop shell while the
      menubar (if set) remains in each individual window.
      
      Use the base #GActionMap interface to add actions, to respond to the
      user selecting these menu items.
  
      Params:
        menubar = a #GMenuModel, or null
  */
  void setMenubar(gid.gio2.menu_model.MenuModel menubar = null) nothrow
  {
    gtk_application_set_menubar(cast(GtkApplication*)this._cPtr, menubar ? cast(GMenuModel*)menubar._cPtr(No.Dup) : null);
  }

  /**
      Removes an inhibitor that has been established with [gid.gtk4.application.Application.inhibit].
      Inhibitors are also cleared when the application exits.
  
      Params:
        cookie = a cookie that was returned by [gid.gtk4.application.Application.inhibit]
  */
  void uninhibit(uint cookie) nothrow
  {
    gtk_application_uninhibit(cast(GtkApplication*)this._cPtr, cookie);
  }

  /**
      Connect to `QueryEnd` signal.
  
      Emitted when the session manager is about to end the session, only
        if #GtkApplication::register-session is true. Applications can
        connect to this signal and call [gid.gtk4.application.Application.inhibit] with
        [gid.gtk4.types.ApplicationInhibitFlags.Logout] to delay the end of the session
        until state has been saved.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.application.Application application)`
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.application.Application.queryEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-end", closure, after);
  }

  /**
      Connect to `WindowAdded` signal.
  
      Emitted when a #GtkWindow is added to application through
        [gid.gtk4.application.Application.addWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.window.Window window, gid.gtk3.application.Application application)`
  
          `window` the newly-added #GtkWindow (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWindowAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.window.Window)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.application.Application.windowAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-added", closure, after);
  }

  /**
      Connect to `WindowRemoved` signal.
  
      Emitted when a #GtkWindow is removed from application,
        either as a side-effect of being destroyed or explicitly
        through [gid.gtk4.application.Application.removeWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.window.Window window, gid.gtk3.application.Application application)`
  
          `window` the #GtkWindow that is being removed (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWindowRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.window.Window)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.application.Application.windowRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-removed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Application
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.application.Application), T.stringof ~ " is not derived from gid.gtk3.application.Application");

    gid.gio2.application.Application._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWindowAdded", true)[0]) == gid.gtk3.application.Application))
      _installVfunc(klass, "window_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWindowRemoved", true)[0]) == gid.gtk3.application.Application))
      _installVfunc(klass, "window_removed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkApplicationClass*)klass;

    switch (vfunc)
    {
      case "window_added":
      {
        static extern(C) void _vfuncWindowAddedTramp(GtkApplication* application, GtkWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GtkApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.windowAdded)
              return (cast(typeof(&_vfuncWindowAddedTramp))_klass.windowAdded)(application, window);
            return;
          }

          try
          {
            _obj.vfuncWindowAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(void*)window, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.application.Application.vfuncWindowAdded");
          }
        }

        _klass.windowAdded = cast(typeof(_klass.windowAdded))&_vfuncWindowAddedTramp;
        break;
      }
      case "window_removed":
      {
        static extern(C) void _vfuncWindowRemovedTramp(GtkApplication* application, GtkWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GtkApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.windowRemoved)
              return (cast(typeof(&_vfuncWindowRemovedTramp))_klass.windowRemoved)(application, window);
            return;
          }

          try
          {
            _obj.vfuncWindowRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(void*)window, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.application.Application.vfuncWindowRemoved");
          }
        }

        _klass.windowRemoved = cast(typeof(_klass.windowRemoved))&_vfuncWindowRemovedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.application.Application]
class ApplicationGidBuilderImpl(T) : gid.gio2.application.ApplicationGidBuilderImpl!T
{


  /** */
  T appMenu(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("app-menu", propval);
  }

  /** */
  T menubar(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menubar", propval);
  }

  /**
      Set `registerSession` property.
      Params:
        propval = Set this property to true to register with the session manager.
      Returns: Builder instance for fluent chaining
  */
  T registerSession(bool propval) nothrow
  {
    return setProperty("register-session", propval);
  }
}

/// Fluent builder for [gid.gtk3.application.Application]
final class ApplicationGidBuilder : ApplicationGidBuilderImpl!ApplicationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Application build() nothrow
  {
    return new Application(cast(void*)createGObject(Application._getGType), Yes.Take);
  }
}
