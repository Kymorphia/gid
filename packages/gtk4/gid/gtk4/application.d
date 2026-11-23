/// Module for [Application] class
module gid.gtk4.application;

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
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    A high-level API for writing applications.
    
    [gid.gtk4.application.Application] supports many aspects of writing a GTK application
    in a convenient fashion, without enforcing a one-size-fits-all model.
    
    Currently, it handles GTK initialization, application uniqueness, session
    management, provides some basic scriptability and desktop shell integration
    by exporting actions and menus and manages a list of toplevel windows whose
    life-cycle is automatically tied to the life-cycle of your application.
    
    While [gid.gtk4.application.Application] works fine with plain [gid.gtk4.window.Window]s,
    it is recommended to use it together with [gid.gtk4.application_window.ApplicationWindow].
    
    ## Initialization
    
    A typical [gid.gtk4.application.Application] will create a window in its
    `signal@GIO.Application::activate`, `signal@GIO.Application::open`
    or `signal@GIO.Application::command-line` handlers. Note that all
    of these signals may be emitted multiple times, so handlers must
    be careful to take existing windows into account.
    
    A typical ::activate handler should look like this:
    
    ```
    static void
    activate (GApplication *gapp)
    {
      GtkApplication *app = GTK_APPLICATION (gapp);
      GtkWindow *window;
    
      window = gtk_application_get_active_window (app);
      if (!window)
        window = create_window (app);
    
      gtk_window_present (window);
    }
    ```
    
    ## Automatic resources
    
    [gid.gtk4.application.Application] will automatically load menus from the [gid.gtk4.builder.Builder]
    resource located at "gtk/menus.ui", relative to the application's
    resource base path (see [gid.gio2.application.Application.setResourceBasePath]).
    The menu with the ID "menubar" is taken as the application's
    menubar. Additional menus (most interesting submenus) can be named
    and accessed via [gid.gtk4.application.Application.getMenuById] which allows for
    dynamic population of a part of the menu structure.
    
    Note that automatic resource loading uses the resource base path
    that is set at construction time and will not work if the resource
    base path is changed at a later time.
    
    It is also possible to provide the menubar manually using
    [gid.gtk4.application.Application.setMenubar].
    
    [gid.gtk4.application.Application] will also automatically setup an icon search path for
    the default icon theme by appending "icons" to the resource base
    path. This allows your application to easily store its icons as
    resources. See [gid.gtk4.icon_theme.IconTheme.addResourcePath] for more
    information.
    
    If there is a resource located at `gtk/help-overlay.ui` which
    defines a [gid.gtk4.shortcuts_window.ShortcutsWindow] with ID `help_overlay` then
    [gid.gtk4.application.Application] associates an instance of this shortcuts window with
    each [gid.gtk4.application_window.ApplicationWindow] and sets up the keyboard accelerator
    <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that
    displays the shortcuts window, associate the item with the action
    `win.show-help-overlay`.
    
    [gid.gtk4.application.Application] will also automatically set the application id as the
    default window icon. Use [gid.gtk4.window.Window.setDefaultIconName] or
    [gid.gtk4.window.Window.iconName] to override that behavior.
    
    # Inhibiting
    
    An application can block various ways to end the session with
    the [gid.gtk4.application.Application.inhibit] function. Typical use cases for
    this kind of inhibiting are long-running, uninterruptible operations,
    such as burning a CD or performing a disk backup. The session
    manager may not honor the inhibitor, but it can be expected to
    inform the user about the negative consequences of ending the
    session while inhibitors are present.
    
    ## A simple application
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c)
    is available in the GTK source code repository
    
    ## See Also
    
    - [Using GtkApplication](https://developer.gnome.org/documentation/tutorials/application.html)
    - [Getting Started with GTK: Basics](getting_started.html#basics)
*/
class Application : gid.gio2.application.Application
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
      Get builder for [gid.gtk4.application.Application]
      Returns: New builder object
  */
  static ApplicationGidBuilder builder() nothrow
  {
    return new ApplicationGidBuilder;
  }

  /**
      Get `activeWindow` property.
      Returns: The currently focused window of the application.
  */
  @property gid.gtk4.window.Window activeWindow() nothrow
  {
    return getActiveWindow();
  }

  /**
      Get `menubar` property.
      Returns: The menu model to be used for the application's menu bar.
  */
  @property gid.gio2.menu_model.MenuModel menubar() nothrow
  {
    return getMenubar();
  }

  /**
      Set `menubar` property.
      Params:
        propval = The menu model to be used for the application's menu bar.
  */
  @property void menubar(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenubar(propval);
  }

  /**
      Get `registerSession` property.
      Returns: Set this property to true to register with the session manager.
        
        This will make GTK track the session state (such as the
        [gid.gtk4.application.Application.screensaverActive] property).
  
      Deprecated: This property is ignored. GTK always registers
        with the session manager
  */
  @property bool registerSession() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("register-session");
  }

  /**
      Set `registerSession` property.
      Params:
        propval = Set this property to true to register with the session manager.
          
          This will make GTK track the session state (such as the
          [gid.gtk4.application.Application.screensaverActive] property).
  
      Deprecated: This property is ignored. GTK always registers
        with the session manager
  */
  @property void registerSession(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("register-session", propval);
  }

  /**
      Get `screensaverActive` property.
      Returns: This property is true if GTK believes that the screensaver
        is currently active.
        
        Tracking the screensaver state is currently only supported on
        Linux.
  */
  @property bool screensaverActive() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("screensaver-active");
  }

  /**
      Creates a new application instance.
      
      When using [gid.gtk4.application.Application], it is not necessary to call `funcGtk.init`
      manually. It is called as soon as the application gets registered as
      the primary instance.
      
      Concretely, `funcGtk.init` is called in the default handler for the
      `GApplication::startup` signal. Therefore, [gid.gtk4.application.Application] subclasses
      should always chain up in their `vfuncGIO.Application.startup` handler
      before using any GTK API.
      
      Note that commandline arguments are not passed to `funcGtk.init`.
      
      If `application_id` is not `NULL`, then it must be valid. See
      [gid.gio2.application.Application.idIsValid].
      
      If no application ID is given then some features (most notably application
      uniqueness) will be disabled.
  
      Params:
        applicationId = The application ID
        flags = the application flags
      Returns: a new [gid.gtk4.application.Application] instance
  */
  this(string applicationId, gid.gio2.types.ApplicationFlags flags) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
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
      Signal emitted when a [gid.gtk4.window.Window] is added to
         application through [gid.gtk4.application.Application.addWindow].
  
      Params:
        window = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWindowAdded` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncWindowAdded(gid.gtk4.window.Window window)
  {
    auto _klass = cast(GtkApplicationClass*)_vfuncClass;
    if (!_klass.windowAdded)
      return;

    _klass.windowAdded(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when a [gid.gtk4.window.Window] is removed from
         application, either as a side-effect of being destroyed or
         explicitly through [gid.gtk4.application.Application.removeWindow].
  
      Params:
        window = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWindowRemoved` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncWindowRemoved(gid.gtk4.window.Window window)
  {
    auto _klass = cast(GtkApplicationClass*)_vfuncClass;
    if (!_klass.windowRemoved)
      return;

    _klass.windowRemoved(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Adds a window to the application.
      
      This call can only happen after the application has started;
      typically, you should add new application windows in response
      to the emission of the `signalGIO.Application::activate` signal.
      
      This call is equivalent to setting the [gid.gtk4.window.Window.application]
      property of the window to application.
      
      Normally, the connection between the application and the window
      will remain until the window is destroyed, but you can explicitly
      remove it with [gid.gtk4.application.Application.removeWindow].
      
      GTK will keep the application running as long as it has any windows.
  
      Params:
        window = a window
  */
  void addWindow(gid.gtk4.window.Window window) nothrow
  {
    gtk_application_add_window(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Gets the accelerators that are currently associated with
      the given action.
  
      Params:
        detailedActionName = a detailed action name, specifying an action
            and target to obtain accelerators for
      Returns: accelerators for detailed_action_name
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
      Returns the list of actions (possibly empty) that the accelerator maps to.
      
      Each item in the list is a detailed action name in the usual form.
      
      This might be useful to discover if an accel already exists in
      order to prevent installation of a conflicting accelerator (from
      an accelerator editor or a plugin system, for example). Note that
      having more than one action per accelerator may not be a bad thing
      and might make sense in cases where the actions never appear in the
      same context.
      
      In case there are no actions for a given accelerator, an empty array
      is returned. `NULL` is never returned.
      
      It is a programmer error to pass an invalid accelerator string.
      
      If you are unsure, check it with `funcGtk.accelerator_parse` first.
  
      Params:
        accel = an accelerator that can be parsed by `funcGtk.accelerator_parse`
      Returns: actions for accel
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
      
      The active window is the one that was most recently focused
      (within the application). This window may not have the focus
      at the moment if another application has it — this is just
      the most recently-focused window within this application.
      Returns: the active window
  */
  gid.gtk4.window.Window getActiveWindow() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_active_window(cast(GtkApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a menu from automatically loaded resources.
      
      See [the section on Automatic resources](class.Application.html#automatic-resources)
      for more information.
  
      Params:
        id = the ID of the menu to look up
      Returns: Gets the menu with the
          given ID from the automatically loaded resources
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
      Returns the menu model for the menu bar of the application.
      Returns: the menubar for windows of the application
  */
  gid.gio2.menu_model.MenuModel getMenubar() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_menubar(cast(GtkApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the window with the given ID.
      
      The ID of a [gid.gtk4.application_window.ApplicationWindow] can be retrieved with
      [gid.gtk4.application_window.ApplicationWindow.getId].
  
      Params:
        id = an identifier number
      Returns: the window for the given ID
  */
  gid.gtk4.window.Window getWindowById(uint id) nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_window_by_id(cast(GtkApplication*)this._cPtr, id);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list of the window associated with the application.
      
      The list is sorted by most recently focused window, such that the first
      element is the currently focused window. (Useful for choosing a parent
      for a transient window.)
      
      The list that is returned should not be modified in any way. It will
      only remain valid until the next focus change or window creation or
      deletion.
      Returns: the list of windows
  */
  gid.gtk4.window.Window[] getWindows() nothrow
  {
    GList* _cretval;
    _cretval = gtk_application_get_windows(cast(GtkApplication*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Informs the session manager that certain types of actions should be
      inhibited.
      
      This is not guaranteed to work on all platforms and for all types of
      actions.
      
      Applications should invoke this method when they begin an operation
      that should not be interrupted, such as creating a CD or DVD. The
      types of actions that may be blocked are specified by the flags
      parameter. When the application completes the operation it should
      call [gid.gtk4.application.Application.uninhibit] to remove the inhibitor. Note
      that an application can have multiple inhibitors, and all of them must
      be individually removed. Inhibitors are also cleared when the
      application exits.
      
      Applications should not expect that they will always be able to block
      the action. In most cases, users will be given the option to force
      the action to take place.
      
      The reason message should be short and to the point.
      
      If a window is given, the session manager may point the user to
      this window to find out more about why the action is inhibited.
      
      The cookie that is returned by this function  should be used as an
      argument to [gid.gtk4.application.Application.uninhibit] in order to remove
      the request.
  
      Params:
        window = a window
        flags = what types of actions should be inhibited
        reason = a short, human-readable string that explains
            why these operations are inhibited
      Returns: A non-zero cookie that is used to uniquely identify this, or
          0 if the platform does not support inhibiting or the request failed
          for some reason
  */
  uint inhibit(gid.gtk4.window.Window window, gid.gtk4.types.ApplicationInhibitFlags flags, string reason = null) nothrow
  {
    uint _retval;
    const(char)* _reason = reason.toCString!(No.Malloc, Yes.Nullable);
    _retval = gtk_application_inhibit(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null, flags, _reason);
    return _retval;
  }

  /**
      Lists the detailed action names which have associated accelerators.
      
      See [gid.gtk4.application.Application.setAccelsForAction].
      Returns: the detailed action names
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
      Remove a window from the application.
      
      If the window belongs to the application then this call is
      equivalent to setting the [gid.gtk4.window.Window.application]
      property of the window to `NULL`.
      
      The application may stop running as a result of a call to this
      function, if the window was the last window of the application.
  
      Params:
        window = a window
  */
  void removeWindow(gid.gtk4.window.Window window) nothrow
  {
    gtk_application_remove_window(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Sets zero or more keyboard accelerators that will trigger the
      given action.
      
      The first item in accels will be the primary accelerator,
      which may be displayed in the UI.
      
      To remove all accelerators for an action, use an empty,
      zero-terminated array for accels.
      
      For the detailed_action_name, see [gid.gio2.action.Action.parseDetailedName]
      and [Gio.Action.print_detailed_name].
  
      Params:
        detailedActionName = a detailed action name, specifying an action
            and target to associate accelerators with
        accels = a list of accelerators in the format
            understood by `funcGtk.accelerator_parse`
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
      Sets or unsets the menubar for windows of the application.
      
      This is a menubar in the traditional sense.
      
      This can only be done in the primary instance of the application,
      after it has been registered. `vfuncGIO.Application.startup` is
      a good place to call this.
      
      Depending on the desktop environment, this may appear at the top of
      each window, or at the top of the screen. In some environments, if
      both the application menu and the menubar are set, the application
      menu will be presented as if it were the first item of the menubar.
      Other environments treat the two as completely separate — for example,
      the application menu may be rendered by the desktop shell while the
      menubar (if set) remains in each individual window.
      
      Use the base [gid.gio2.action_map.ActionMap] interface to add actions, to respond to the
      user selecting these menu items.
  
      Params:
        menubar = a menu model
  */
  void setMenubar(gid.gio2.menu_model.MenuModel menubar = null) nothrow
  {
    gtk_application_set_menubar(cast(GtkApplication*)this._cPtr, menubar ? cast(GMenuModel*)menubar._cPtr(No.Dup) : null);
  }

  /**
      Removes an inhibitor that has been previously established.
      
      See [gid.gtk4.application.Application.inhibit].
      
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
  
      Emitted when the session manager is about to end the session.
        
        Applications can connect to this signal and call
        [gid.gtk4.application.Application.inhibit] with [gid.gtk4.types.ApplicationInhibitFlags.Logout]
        to delay the end of the session until state has been saved.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.application.Application application)`
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.application.Application)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.application.Application.queryEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-end", closure, after);
  }

  /**
      Connect to `WindowAdded` signal.
  
      Emitted when a window is added to an application.
        
        See [gid.gtk4.application.Application.addWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.window.Window window, gid.gtk4.application.Application application)`
  
          `window` the newly-added window (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWindowAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.window.Window)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.application.Application)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.application.Application.windowAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-added", closure, after);
  }

  /**
      Connect to `WindowRemoved` signal.
  
      Emitted when a window is removed from an application.
        
        This can happen as a side-effect of the window being destroyed
        or explicitly through [gid.gtk4.application.Application.removeWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.window.Window window, gid.gtk4.application.Application application)`
  
          `window` the window that is being removed (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWindowRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.window.Window)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.application.Application)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.application.Application.windowRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-removed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Application
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.application.Application), T.stringof ~ " is not derived from gid.gtk4.application.Application");

    gid.gio2.application.Application._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWindowAdded", true)[0]) == gid.gtk4.application.Application))
      _installVfunc(klass, "window_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWindowRemoved", true)[0]) == gid.gtk4.application.Application))
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
          auto _obj = cast(gid.gtk4.application.Application)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GtkApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.windowAdded)
              return (cast(typeof(&_vfuncWindowAddedTramp))_klass.windowAdded)(application, window);
            return;
          }

          try
          {
            _obj.vfuncWindowAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window.Window)(cast(void*)window, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.application.Application.vfuncWindowAdded");
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
          auto _obj = cast(gid.gtk4.application.Application)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GtkApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.windowRemoved)
              return (cast(typeof(&_vfuncWindowRemovedTramp))_klass.windowRemoved)(application, window);
            return;
          }

          try
          {
            _obj.vfuncWindowRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window.Window)(cast(void*)window, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.application.Application.vfuncWindowRemoved");
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

/// Fluent builder implementation template for [gid.gtk4.application.Application]
class ApplicationGidBuilderImpl(T) : gid.gio2.application.ApplicationGidBuilderImpl!T
{


  /**
      Set `menubar` property.
      Params:
        propval = The menu model to be used for the application's menu bar.
      Returns: Builder instance for fluent chaining
  */
  T menubar(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menubar", propval);
  }

  /**
      Set `registerSession` property.
      Params:
        propval = Set this property to true to register with the session manager.
          
          This will make GTK track the session state (such as the
          [gid.gtk4.application.Application.screensaverActive] property).
      Returns: Builder instance for fluent chaining
  
      Deprecated: This property is ignored. GTK always registers
        with the session manager
  */
  T registerSession(bool propval) nothrow
  {
    return setProperty("register-session", propval);
  }
}

/// Fluent builder for [gid.gtk4.application.Application]
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
