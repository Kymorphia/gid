/// Module for [Application] class
module gtk.application;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.application;
import gio.menu;
import gio.menu_model;
import gio.types;
import glib.variant;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

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
    [gio.action_group.ActionGroup.activateAction].  The same applies to actions
    associated with #GtkApplicationWindow and to the “activate” and
    “open” #GApplication methods.
    
    ## Automatic resources ## {#automatic-resources}
    
    #GtkApplication will automatically load menus from the #GtkBuilder
    resource located at "gtk/menus.ui", relative to the application's
    resource base path (see [gio.application.Application.setResourceBasePath]).  The
    menu with the ID "app-menu" is taken as the application's app menu
    and the menu with the ID "menubar" is taken as the application's
    menubar.  Additional menus (most interesting submenus) can be named
    and accessed via [gtk.application.Application.getMenuById] which allows for
    dynamic population of a part of the menu structure.
    
    If the resources "gtk/menus-appmenu.ui" or "gtk/menus-traditional.ui" are
    present then these files will be used in preference, depending on the value
    of [gtk.application.Application.prefersAppMenu]. If the resource "gtk/menus-common.ui"
    is present it will be loaded as well. This is useful for storing items that
    are referenced from both "gtk/menus-appmenu.ui" and
    "gtk/menus-traditional.ui".
    
    It is also possible to provide the menus manually using
    [gtk.application.Application.setAppMenu] and [gtk.application.Application.setMenubar].
    
    #GtkApplication will also automatically setup an icon search path for
    the default icon theme by appending "icons" to the resource base
    path.  This allows your application to easily store its icons as
    resources.  See [gtk.icon_theme.IconTheme.addResourcePath] for more
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
    the [gtk.application.Application.inhibit] function. Typical use cases for
    this kind of inhibiting are long-running, uninterruptible operations,
    such as burning a CD or performing a disk backup. The session
    manager may not honor the inhibitor, but it can be expected to
    inform the user about the negative consequences of ending the
    session while inhibitors are present.
    
    ## See Also ## {#seealso}
    [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
    [Getting Started with GTK+: Basics](https://developer.gnome.org/gtk3/stable/gtk-getting-started.html#id-1.2.3.3)
*/
class Application : gio.application.Application
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
    return cast(void function())gtk_application_get_type != &gidSymbolNotFound ? gtk_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self()
  {
    return this;
  }

  /** */
  @property gtk.window.Window activeWindow()
  {
    return getActiveWindow();
  }

  /** */
  @property gio.menu_model.MenuModel appMenu()
  {
    return getAppMenu();
  }

  /** */
  @property void appMenu(gio.menu_model.MenuModel propval)
  {
    return setAppMenu(propval);
  }

  /** */
  @property gio.menu_model.MenuModel menubar()
  {
    return getMenubar();
  }

  /** */
  @property void menubar(gio.menu_model.MenuModel propval)
  {
    return setMenubar(propval);
  }

  /**
      Get `registerSession` property.
      Returns: Set this property to true to register with the session manager.
  */
  @property bool registerSession()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("register-session");
  }

  /**
      Set `registerSession` property.
      Params:
        propval = Set this property to true to register with the session manager.
  */
  @property void registerSession(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("register-session", propval);
  }

  /**
      Get `screensaverActive` property.
      Returns: This property is true if GTK+ believes that the screensaver is
      currently active. GTK+ only tracks session state (including this)
      when #GtkApplication::register-session is set to true.
      
      Tracking the screensaver state is supported on Linux.
  */
  @property bool screensaverActive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("screensaver-active");
  }

  /**
      Creates a new #GtkApplication instance.
      
      When using #GtkApplication, it is not necessary to call [gtk.global.init_]
      manually. It is called as soon as the application gets registered as
      the primary instance.
      
      Concretely, [gtk.global.init_] is called in the default handler for the
      #GApplication::startup signal. Therefore, #GtkApplication subclasses should
      chain up in their #GApplication::startup handler before using any GTK+ API.
      
      Note that commandline arguments are not passed to [gtk.global.init_].
      All GTK+ functionality that is available via commandline arguments
      can also be achieved by setting suitable environment variables
      such as `G_DEBUG`, so this should not be a big
      problem. If you absolutely must support GTK+ commandline arguments,
      you can explicitly call [gtk.global.init_] before creating the application
      instance.
      
      If non-null, the application ID must be valid.  See
      [gio.application.Application.idIsValid].
      
      If no application ID is given then some features (most notably application
      uniqueness) will be disabled. A null application ID is only allowed with
      GTK+ 3.6 or later.
  
      Params:
        applicationId = The application ID.
        flags = the application flags
      Returns: a new #GtkApplication instance
  */
  this(string applicationId, gio.types.ApplicationFlags flags)
  {
    GtkApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _cretval = gtk_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Installs an accelerator that will cause the named action
      to be activated when the key combination specificed by accelerator
      is pressed.
      
      accelerator must be a string that can be parsed by [gtk.global.acceleratorParse],
      e.g. "<Primary>q" or “<Control><Alt>p”.
      
      action_name must be the name of an action as it would be used
      in the app menu, i.e. actions that have been added to the application
      are referred to with an “app.” prefix, and window-specific actions
      with a “win.” prefix.
      
      GtkApplication also extracts accelerators out of “accel” attributes
      in the #GMenuModels passed to [gtk.application.Application.setAppMenu] and
      [gtk.application.Application.setMenubar], which is usually more convenient
      than calling this function for each accelerator.
  
      Params:
        accelerator = accelerator string
        actionName = the name of the action to activate
        parameter = parameter to pass when activating the action,
            or null if the action does not accept an activation parameter
  
      Deprecated: Use [gtk.application.Application.setAccelsForAction] instead
  */
  void addAccelerator(string accelerator, string actionName, glib.variant.Variant parameter = null)
  {
    const(char)* _accelerator = accelerator.toCString(No.Alloc);
    const(char)* _actionName = actionName.toCString(No.Alloc);
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
      remove it with [gtk.application.Application.removeWindow].
      
      GTK+ will keep the application running as long as it has
      any windows.
  
      Params:
        window = a #GtkWindow
  */
  void addWindow(gtk.window.Window window)
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
            a null-terminated array. Free with [glib.global.strfreev] when no longer needed
  */
  string[] getAccelsForAction(string detailedActionName)
  {
    char** _cretval;
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    _cretval = gtk_application_get_accels_for_action(cast(GtkApplication*)this._cPtr, _detailedActionName);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
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
      If you are unsure, check it with [gtk.global.acceleratorParse] first.
  
      Params:
        accel = an accelerator that can be parsed by [gtk.global.acceleratorParse]
      Returns: a null-terminated array of actions for accel
  */
  string[] getActionsForAccel(string accel)
  {
    char** _cretval;
    const(char)* _accel = accel.toCString(No.Alloc);
    _cretval = gtk_application_get_actions_for_accel(cast(GtkApplication*)this._cPtr, _accel);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
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
  gtk.window.Window getActiveWindow()
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_active_window(cast(GtkApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the menu model that has been set with
      [gtk.application.Application.setAppMenu].
      Returns: the application menu of application
          or null if no application menu has been set.
  */
  gio.menu_model.MenuModel getAppMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_app_menu(cast(GtkApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
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
  gio.menu.Menu getMenuById(string id)
  {
    GMenu* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = gtk_application_get_menu_by_id(cast(GtkApplication*)this._cPtr, _id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu.Menu)(cast(GMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the menu model that has been set with
      [gtk.application.Application.setMenubar].
      Returns: the menubar for windows of application
  */
  gio.menu_model.MenuModel getMenubar()
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_menubar(cast(GtkApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkApplicationWindow with the given ID.
      
      The ID of a #GtkApplicationWindow can be retrieved with
      [gtk.application_window.ApplicationWindow.getId].
  
      Params:
        id = an identifier number
      Returns: the window with ID id, or
          null if there is no window with this ID
  */
  gtk.window.Window getWindowById(uint id)
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_window_by_id(cast(GtkApplication*)this._cPtr, id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
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
  gtk.window.Window[] getWindows()
  {
    GList* _cretval;
    _cretval = gtk_application_get_windows(cast(GtkApplication*)this._cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.None)(cast(GList*)_cretval);
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
      call [gtk.application.Application.uninhibit] to remove the inhibitor. Note that
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
            request. It should be used as an argument to [gtk.application.Application.uninhibit]
            in order to remove the request. If the platform does not support
            inhibiting or the request failed for some reason, 0 is returned.
  */
  uint inhibit(gtk.window.Window window, gtk.types.ApplicationInhibitFlags flags, string reason = null)
  {
    uint _retval;
    const(char)* _reason = reason.toCString(No.Alloc);
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
  bool isInhibited(gtk.types.ApplicationInhibitFlags flags)
  {
    bool _retval;
    _retval = gtk_application_is_inhibited(cast(GtkApplication*)this._cPtr, flags);
    return _retval;
  }

  /**
      Lists the detailed action names which have associated accelerators.
      See [gtk.application.Application.setAccelsForAction].
      Returns: a null-terminated array of strings,
            free with [glib.global.strfreev] when done
  */
  string[] listActionDescriptions()
  {
    char** _cretval;
    _cretval = gtk_application_list_action_descriptions(cast(GtkApplication*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Determines if the desktop environment in which the application is
      running would prefer an application menu be shown.
      
      If this function returns true then the application should call
      [gtk.application.Application.setAppMenu] with the contents of an application
      menu, which will be shown by the desktop environment.  If it returns
      false then you should consider using an alternate approach, such as
      a menubar.
      
      The value returned by this function is purely advisory and you are
      free to ignore it.  If you call [gtk.application.Application.setAppMenu] even
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
      [gtk.application.Application.setAppMenu] anyway, then this menu will be
      replaced with your own.
      Returns: true if you should set an app menu
  */
  bool prefersAppMenu()
  {
    bool _retval;
    _retval = gtk_application_prefers_app_menu(cast(GtkApplication*)this._cPtr);
    return _retval;
  }

  /**
      Removes an accelerator that has been previously added
      with [gtk.application.Application.addAccelerator].
  
      Params:
        actionName = the name of the action to activate
        parameter = parameter to pass when activating the action,
            or null if the action does not accept an activation parameter
  
      Deprecated: Use [gtk.application.Application.setAccelsForAction] instead
  */
  void removeAccelerator(string actionName, glib.variant.Variant parameter = null)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
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
  void removeWindow(gtk.window.Window window)
  {
    gtk_application_remove_window(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Sets zero or more keyboard accelerators that will trigger the
      given action. The first item in accels will be the primary
      accelerator, which may be displayed in the UI.
      
      To remove all accelerators for an action, use an empty, zero-terminated
      array for accels.
      
      For the detailed_action_name, see [gio.action.Action.parseDetailedName] and
      [gio.action.Action.printDetailedName].
  
      Params:
        detailedActionName = a detailed action name, specifying an action
              and target to associate accelerators with
        accels = a list of accelerators in the format
              understood by [gtk.global.acceleratorParse]
  */
  void setAccelsForAction(string detailedActionName, string[] accels)
  {
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    char*[] _tmpaccels;
    foreach (s; accels)
      _tmpaccels ~= s.toCString(No.Alloc);
    _tmpaccels ~= null;
    const(char*)* _accels = _tmpaccels.ptr;
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
  void setAppMenu(gio.menu_model.MenuModel appMenu = null)
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
  void setMenubar(gio.menu_model.MenuModel menubar = null)
  {
    gtk_application_set_menubar(cast(GtkApplication*)this._cPtr, menubar ? cast(GMenuModel*)menubar._cPtr(No.Dup) : null);
  }

  /**
      Removes an inhibitor that has been established with [gtk.application.Application.inhibit].
      Inhibitors are also cleared when the application exits.
  
      Params:
        cookie = a cookie that was returned by [gtk.application.Application.inhibit]
  */
  void uninhibit(uint cookie)
  {
    gtk_application_uninhibit(cast(GtkApplication*)this._cPtr, cookie);
  }

  /**
      Connect to `QueryEnd` signal.
  
      Emitted when the session manager is about to end the session, only
      if #GtkApplication::register-session is true. Applications can
      connect to this signal and call [gtk.application.Application.inhibit] with
      [gtk.types.ApplicationInhibitFlags.Logout] to delay the end of the session
      until state has been saved.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.application.Application application))
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-end", closure, after);
  }

  /**
      Connect to `WindowAdded` signal.
  
      Emitted when a #GtkWindow is added to application through
      [gtk.application.Application.addWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window, gtk.application.Application application))
  
          `window` the newly-added #GtkWindow (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWindowAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.window.Window)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-added", closure, after);
  }

  /**
      Connect to `WindowRemoved` signal.
  
      Emitted when a #GtkWindow is removed from application,
      either as a side-effect of being destroyed or explicitly
      through [gtk.application.Application.removeWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window, gtk.application.Application application))
  
          `window` the #GtkWindow that is being removed (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWindowRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.window.Window)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-removed", closure, after);
  }
}
