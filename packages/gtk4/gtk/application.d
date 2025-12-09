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
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    [gtk.application.Application] is a high-level API for writing applications.
    
    It supports many aspects of writing a GTK application in a convenient
    fashion, without enforcing a one-size-fits-all model.
    
    Currently, [gtk.application.Application] handles GTK initialization, application
    uniqueness, session management, provides some basic scriptability and
    desktop shell integration by exporting actions and menus and manages a
    list of toplevel windows whose life-cycle is automatically tied to the
    life-cycle of your application.
    
    While [gtk.application.Application] works fine with plain [gtk.window.Window]s, it is
    recommended to use it together with [gtk.application_window.ApplicationWindow].
    
    ## Automatic resources
    
    [gtk.application.Application] will automatically load menus from the [gtk.builder.Builder]
    resource located at "gtk/menus.ui", relative to the application's
    resource base path (see [gio.application.Application.setResourceBasePath]).
    The menu with the ID "menubar" is taken as the application's
    menubar. Additional menus (most interesting submenus) can be named
    and accessed via [gtk.application.Application.getMenuById] which allows for
    dynamic population of a part of the menu structure.
    
    Note that automatic resource loading uses the resource base path
    that is set at construction time and will not work if the resource
    base path is changed at a later time.
    
    It is also possible to provide the menubar manually using
    [gtk.application.Application.setMenubar].
    
    [gtk.application.Application] will also automatically setup an icon search path for
    the default icon theme by appending "icons" to the resource base
    path. This allows your application to easily store its icons as
    resources. See [gtk.icon_theme.IconTheme.addResourcePath] for more
    information.
    
    If there is a resource located at `gtk/help-overlay.ui` which
    defines a [gtk.shortcuts_window.ShortcutsWindow] with ID `help_overlay` then
    [gtk.application.Application] associates an instance of this shortcuts window with
    each [gtk.application_window.ApplicationWindow] and sets up the keyboard accelerator
    <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that
    displays the shortcuts window, associate the item with the action
    `win.show-help-overlay`.
    
    ## A simple application
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c)
    is available in the GTK source code repository
    
    [gtk.application.Application] optionally registers with a session manager of the
    users session (if you set the `property@Gtk.Application:register-session`
    property) and offers various functionality related to the session
    life-cycle.
    
    An application can block various ways to end the session with
    the [gtk.application.Application.inhibit] function. Typical use cases for
    this kind of inhibiting are long-running, uninterruptible operations,
    such as burning a CD or performing a disk backup. The session
    manager may not honor the inhibitor, but it can be expected to
    inform the user about the negative consequences of ending the
    session while inhibitors are present.
    
    ## See Also
    
    [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
    [Getting Started with GTK: Basics](getting_started.html#basics)
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

  /**
      Get `activeWindow` property.
      Returns: The currently focused window of the application.
  */
  @property gtk.window.Window activeWindow()
  {
    return getActiveWindow();
  }

  /**
      Get `menubar` property.
      Returns: The [gio.menu_model.MenuModel] to be used for the application's menu bar.
  */
  @property gio.menu_model.MenuModel menubar()
  {
    return getMenubar();
  }

  /**
      Set `menubar` property.
      Params:
        propval = The [gio.menu_model.MenuModel] to be used for the application's menu bar.
  */
  @property void menubar(gio.menu_model.MenuModel propval)
  {
    return setMenubar(propval);
  }

  /**
      Get `registerSession` property.
      Returns: Set this property to `TRUE` to register with the session manager.
      
      This will make GTK track the session state (such as the
      `property@Gtk.Application:screensaver-active` property).
  */
  @property bool registerSession()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("register-session");
  }

  /**
      Set `registerSession` property.
      Params:
        propval = Set this property to `TRUE` to register with the session manager.
        
        This will make GTK track the session state (such as the
        `property@Gtk.Application:screensaver-active` property).
  */
  @property void registerSession(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("register-session", propval);
  }

  /**
      Get `screensaverActive` property.
      Returns: This property is `TRUE` if GTK believes that the screensaver is
      currently active.
      
      GTK only tracks session state (including this) when
      `property@Gtk.Application:register-session` is set to true.
      
      Tracking the screensaver state is currently only supported on
      Linux.
  */
  @property bool screensaverActive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("screensaver-active");
  }

  /**
      Creates a new [gtk.application.Application] instance.
      
      When using [gtk.application.Application], it is not necessary to call `funcGtk.init`
      manually. It is called as soon as the application gets registered as
      the primary instance.
      
      Concretely, `funcGtk.init` is called in the default handler for the
      `GApplication::startup` signal. Therefore, [gtk.application.Application] subclasses should
      always chain up in their `GApplication::startup` handler before using any GTK
      API.
      
      Note that commandline arguments are not passed to `funcGtk.init`.
      
      If `application_id` is not null, then it must be valid. See
      `[gio.application.Application.idIsValid]`.
      
      If no application ID is given then some features (most notably application
      uniqueness) will be disabled.
  
      Params:
        applicationId = The application ID
        flags = the application flags
      Returns: a new [gtk.application.Application] instance
  */
  this(string applicationId, gio.types.ApplicationFlags flags)
  {
    GtkApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _cretval = gtk_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a window to `application`.
      
      This call can only happen after the `application` has started;
      typically, you should add new application windows in response
      to the emission of the `GApplication::activate` signal.
      
      This call is equivalent to setting the [gtk.window.Window.application]
      property of `window` to `application`.
      
      Normally, the connection between the application and the window
      will remain until the window is destroyed, but you can explicitly
      remove it with [gtk.application.Application.removeWindow].
      
      GTK will keep the `application` running as long as it has
      any windows.
  
      Params:
        window = a [gtk.window.Window]
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
      Returns: accelerators for `detailed_action_name`
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
      Returns the list of actions (possibly empty) that `accel` maps to.
      
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
      Returns: a null-terminated array of actions for `accel`
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
      Returns: the active window
  */
  gtk.window.Window getActiveWindow()
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_active_window(cast(GtkApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a menu from automatically loaded resources.
      
      See [the section on Automatic resources](class.Application.html#automatic-resources)
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
      Returns: the menubar for windows of `application`
  */
  gio.menu_model.MenuModel getMenubar()
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_menubar(cast(GtkApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gtk.application_window.ApplicationWindow] with the given ID.
      
      The ID of a [gtk.application_window.ApplicationWindow] can be retrieved with
      [gtk.application_window.ApplicationWindow.getId].
  
      Params:
        id = an identifier number
      Returns: the window for the given `id`
  */
  gtk.window.Window getWindowById(uint id)
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_window_by_id(cast(GtkApplication*)this._cPtr, id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list of the [gtk.window.Window] instances associated with `application`.
      
      The list is sorted by most recently focused window, such that the first
      element is the currently focused window. (Useful for choosing a parent
      for a transient window.)
      
      The list that is returned should not be modified in any way. It will
      only remain valid until the next focus change or window creation or
      deletion.
      Returns: a [glib.list.List] of [gtk.window.Window]
          instances
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
      inhibited.
      
      This is not guaranteed to work on all platforms and for all types of
      actions.
      
      Applications should invoke this method when they begin an operation
      that should not be interrupted, such as creating a CD or DVD. The
      types of actions that may be blocked are specified by the `flags`
      parameter. When the application completes the operation it should
      call [gtk.application.Application.uninhibit] to remove the inhibitor. Note
      that an application can have multiple inhibitors, and all of them must
      be individually removed. Inhibitors are also cleared when the
      application exits.
      
      Applications should not expect that they will always be able to block
      the action. In most cases, users will be given the option to force
      the action to take place.
      
      The `reason` message should be short and to the point.
      
      If `window` is given, the session manager may point the user to
      this window to find out more about why the action is inhibited.
  
      Params:
        window = a [gtk.window.Window]
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
      Lists the detailed action names which have associated accelerators.
      
      See [gtk.application.Application.setAccelsForAction].
      Returns: the detailed action names
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
      Remove a window from `application`.
      
      If `window` belongs to `application` then this call is equivalent to
      setting the [gtk.window.Window.application] property of `window` to
      `NULL`.
      
      The application may stop running as a result of a call to this
      function, if `window` was the last window of the `application`.
  
      Params:
        window = a [gtk.window.Window]
  */
  void removeWindow(gtk.window.Window window)
  {
    gtk_application_remove_window(cast(GtkApplication*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Sets zero or more keyboard accelerators that will trigger the
      given action.
      
      The first item in `accels` will be the primary accelerator, which may be
      displayed in the UI.
      
      To remove all accelerators for an action, use an empty, zero-terminated
      array for `accels`.
      
      For the `detailed_action_name`, see `[gio.action.Action.parseDetailedName]` and
      `[gio.action.Action.printDetailedName]`.
  
      Params:
        detailedActionName = a detailed action name, specifying an action
            and target to associate accelerators with
        accels = a list of accelerators in the format
            understood by `funcGtk.accelerator_parse`
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
      Sets or unsets the menubar for windows of `application`.
      
      This is a menubar in the traditional sense.
      
      This can only be done in the primary instance of the application,
      after it has been registered. `GApplication::startup` is a good place
      to call this.
      
      Depending on the desktop environment, this may appear at the top of
      each window, or at the top of the screen.  In some environments, if
      both the application menu and the menubar are set, the application
      menu will be presented as if it were the first item of the menubar.
      Other environments treat the two as completely separate — for example,
      the application menu may be rendered by the desktop shell while the
      menubar (if set) remains in each individual window.
      
      Use the base [gio.action_map.ActionMap] interface to add actions, to respond to the
      user selecting these menu items.
  
      Params:
        menubar = a [gio.menu_model.MenuModel]
  */
  void setMenubar(gio.menu_model.MenuModel menubar = null)
  {
    gtk_application_set_menubar(cast(GtkApplication*)this._cPtr, menubar ? cast(GMenuModel*)menubar._cPtr(No.Dup) : null);
  }

  /**
      Removes an inhibitor that has been previously established.
      
      See [gtk.application.Application.inhibit].
      
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
  
      Emitted when the session manager is about to end the session.
      
      This signal is only emitted if `propertyGtk.Application:register-session`
      is `TRUE`. Applications can connect to this signal and call
      [gtk.application.Application.inhibit] with [gtk.types.ApplicationInhibitFlags.Logout]
      to delay the end of the session until state has been saved.
  
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
  
      Emitted when a [gtk.window.Window] is added to `application` through
      [gtk.application.Application.addWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window, gtk.application.Application application))
  
          `window` the newly-added [gtk.window.Window] (optional)
  
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
  
      Emitted when a [gtk.window.Window] is removed from `application`.
      
      This can happen as a side-effect of the window being destroyed
      or explicitly through [gtk.application.Application.removeWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window, gtk.application.Application application))
  
          `window` the [gtk.window.Window] that is being removed (optional)
  
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
