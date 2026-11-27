/// Module for [AppLaunchContext] class
module gid.gio2.app_launch_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.app_info;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.file;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window.
*/
@gidGir("AppLaunchContext", "AppLaunchContextClass")
class AppLaunchContext : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_app_launch_context_get_type != &gidSymbolNotFound ? g_app_launch_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GAppLaunchContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override AppLaunchContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.app_launch_context.AppLaunchContext]
      Returns: New builder object
  */
  static AppLaunchContextGidBuilder builder() nothrow
  {
    return new AppLaunchContextGidBuilder;
  }

  /**
      Creates a new application launch context. This is not normally used,
      instead you instantiate a subclass of this, such as
      [[gid.gdk4.app_launch_context.AppLaunchContext]](https://docs.gtk.org/gdk4/class.AppLaunchContext.html).
      Returns: a launch context.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GAppLaunchContext* _cretval;
      _cretval = g_app_launch_context_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the display string for the context. This is used to ensure new
      applications are started on the same display as the launching
      application, by setting the `DISPLAY` environment variable.
  
      Params:
        info = the app info
        files = a list of [gid.gio2.file.File] objects
      Returns: a display string for the display.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetDisplay` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncGetDisplay(gid.gio2.app_info.AppInfo info, gid.gio2.file.File[] files)
  {
    auto _klass = cast(GAppLaunchContextClass*)_vfuncClass;
    if (!_klass.getDisplay)
      return typeof(return).init;

    char* _cretval;
    auto _files = gListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GList*, gid.gio2.file.File, GidOwnership.None)(_files);
    _cretval = _klass.getDisplay(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)info)._cPtr(No.Dup) : null, _files);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Initiates startup notification for the application and returns the
      `XDG_ACTIVATION_TOKEN` or `DESKTOP_STARTUP_ID` for the launched operation,
      if supported.
      
      The returned token may be referred to equivalently as an ‘activation token’
      (using Wayland terminology) or a ‘startup sequence ID’ (using X11 terminology).
      The two [are interoperable](https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/staging/xdg-activation/x11-interoperation.rst).
      
      Activation tokens are defined in the [XDG Activation Protocol](https://wayland.app/protocols/xdg-activation-v1),
      and startup notification IDs are defined in the
      [freedesktop.org Startup Notification Protocol](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt).
      
      Support for the XDG Activation Protocol was added in GLib 2.76.
      Since GLib 2.82 info and files can be `NULL`. If that’s not supported by the backend,
      the returned token will be `NULL`.
  
      Params:
        info = the app info
        files = a list of [gid.gio2.file.File] objects
      Returns: a startup notification ID for the application, or `NULL` if
          not supported.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetStartupNotifyId` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncGetStartupNotifyId(gid.gio2.app_info.AppInfo info = null, gid.gio2.file.File[] files = null)
  {
    auto _klass = cast(GAppLaunchContextClass*)_vfuncClass;
    if (!_klass.getStartupNotifyId)
      return typeof(return).init;

    char* _cretval;
    auto _files = gListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GList*, gid.gio2.file.File, GidOwnership.None)(_files);
    _cretval = _klass.getStartupNotifyId(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)info)._cPtr(No.Dup) : null, _files);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Called when an application has failed to launch, so that it can cancel
      the application startup notification started in
      [gid.gio2.app_launch_context.AppLaunchContext.getStartupNotifyId].
  
      Params:
        startupNotifyId = the startup notification id that was returned by
            [gid.gio2.app_launch_context.AppLaunchContext.getStartupNotifyId].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLaunchFailed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncLaunchFailed(string startupNotifyId)
  {
    auto _klass = cast(GAppLaunchContextClass*)_vfuncClass;
    if (!_klass.launchFailed)
      return;

    const(char)* _startupNotifyId = startupNotifyId.toCString!(No.Malloc, No.Nullable);
    _klass.launchFailed(cast(GAppLaunchContext*)this._cPtr, _startupNotifyId);
  }

  /** */
  protected void vfuncLaunchStarted(gid.gio2.app_info.AppInfo info, gid.glib2.variant.Variant platformData)
  {
    auto _klass = cast(GAppLaunchContextClass*)_vfuncClass;
    if (!_klass.launchStarted)
      return;

    _klass.launchStarted(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)info)._cPtr(No.Dup) : null, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncLaunched(gid.gio2.app_info.AppInfo info, gid.glib2.variant.Variant platformData)
  {
    auto _klass = cast(GAppLaunchContextClass*)_vfuncClass;
    if (!_klass.launched)
      return;

    _klass.launched(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)info)._cPtr(No.Dup) : null, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
  }

  /**
      Gets the display string for the context. This is used to ensure new
      applications are started on the same display as the launching
      application, by setting the `DISPLAY` environment variable.
  
      Params:
        info = the app info
        files = a list of [gid.gio2.file.File] objects
      Returns: a display string for the display.
  */
  string getDisplay(gid.gio2.app_info.AppInfo info, gid.gio2.file.File[] files) nothrow
  {
    char* _cretval;
    auto _files = gListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GList*, gid.gio2.file.File, GidOwnership.None)(_files);
    _cretval = g_app_launch_context_get_display(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)info)._cPtr(No.Dup) : null, _files);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the complete environment variable list to be passed to
      the child process when context is used to launch an application.
      This is a `NULL`-terminated array of strings, where each string has
      the form `KEY=VALUE`.
      Returns: the child’s environment
  */
  string[] getEnvironment() nothrow
  {
    char** _cretval;
    _cretval = g_app_launch_context_get_environment(cast(GAppLaunchContext*)this._cPtr);
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
      Initiates startup notification for the application and returns the
      `XDG_ACTIVATION_TOKEN` or `DESKTOP_STARTUP_ID` for the launched operation,
      if supported.
      
      The returned token may be referred to equivalently as an ‘activation token’
      (using Wayland terminology) or a ‘startup sequence ID’ (using X11 terminology).
      The two [are interoperable](https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/staging/xdg-activation/x11-interoperation.rst).
      
      Activation tokens are defined in the [XDG Activation Protocol](https://wayland.app/protocols/xdg-activation-v1),
      and startup notification IDs are defined in the
      [freedesktop.org Startup Notification Protocol](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt).
      
      Support for the XDG Activation Protocol was added in GLib 2.76.
      Since GLib 2.82 info and files can be `NULL`. If that’s not supported by the backend,
      the returned token will be `NULL`.
  
      Params:
        info = the app info
        files = a list of [gid.gio2.file.File] objects
      Returns: a startup notification ID for the application, or `NULL` if
          not supported.
  */
  string getStartupNotifyId(gid.gio2.app_info.AppInfo info = null, gid.gio2.file.File[] files = null) nothrow
  {
    char* _cretval;
    auto _files = gListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GList*, gid.gio2.file.File, GidOwnership.None)(_files);
    _cretval = g_app_launch_context_get_startup_notify_id(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)info)._cPtr(No.Dup) : null, _files);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Called when an application has failed to launch, so that it can cancel
      the application startup notification started in
      [gid.gio2.app_launch_context.AppLaunchContext.getStartupNotifyId].
  
      Params:
        startupNotifyId = the startup notification id that was returned by
            [gid.gio2.app_launch_context.AppLaunchContext.getStartupNotifyId].
  */
  void launchFailed(string startupNotifyId) nothrow
  {
    const(char)* _startupNotifyId = startupNotifyId.toCString!(No.Malloc, No.Nullable);
    g_app_launch_context_launch_failed(cast(GAppLaunchContext*)this._cPtr, _startupNotifyId);
  }

  /**
      Arranges for variable to be set to value in the child’s environment when
      context is used to launch an application.
  
      Params:
        variable = the environment variable to set
        value = the value for to set the variable to.
  */
  void setenv(string variable, string value) nothrow
  {
    const(char)* _variable = variable.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    g_app_launch_context_setenv(cast(GAppLaunchContext*)this._cPtr, _variable, _value);
  }

  /**
      Arranges for variable to be unset in the child’s environment when context
      is used to launch an application.
  
      Params:
        variable = the environment variable to remove
  */
  void unsetenv(string variable) nothrow
  {
    const(char)* _variable = variable.toCString!(No.Malloc, No.Nullable);
    g_app_launch_context_unsetenv(cast(GAppLaunchContext*)this._cPtr, _variable);
  }

  /**
      Connect to `LaunchFailed` signal.
  
      The [gid.gio2.app_launch_context.AppLaunchContext.launchFailed] signal is emitted when a
        [gid.gio2.app_info.AppInfo] launch fails. The startup notification id is provided,
        so that the launcher can cancel the startup notification.
        
        Because a launch operation may involve spawning multiple instances of the
        target application, you should expect this signal to be emitted multiple
        times, one for each spawned instance.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string startupNotifyId, gid.gio2.app_launch_context.AppLaunchContext appLaunchContext)`
  
          `startupNotifyId` the startup notification id for the failed launch (optional)
  
          `appLaunchContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLaunchFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.app_launch_context.AppLaunchContext)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.launchFailed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("launch-failed", closure, after);
  }

  /**
      Connect to `LaunchStarted` signal.
  
      The [gid.gio2.app_launch_context.AppLaunchContext.launchStarted] signal is emitted when a
        [gid.gio2.app_info.AppInfo] is about to be launched. If non-null the
        platform_data is an GVariant dictionary mapping strings to variants
        (ie `a{sv}`), which contains additional, platform-specific data about this
        launch. On UNIX, at least the `startup-notification-id` keys will be
        present.
        
        The value of the `startup-notification-id` key (type `s`) is a startup
        notification ID corresponding to the format from the [startup-notification
        specification](https://specifications.freedesktop.org/startup-notification-spec/startup-notification-0.1.txt).
        It allows tracking the progress of the launchee through startup.
        
        It is guaranteed that this signal is followed by either a
        [gid.gio2.app_launch_context.AppLaunchContext.launched] or
        [gid.gio2.app_launch_context.AppLaunchContext.launchFailed] signal.
        
        Because a launch operation may involve spawning multiple instances of the
        target application, you should expect this signal to be emitted multiple
        times, one for each spawned instance.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.app_info.AppInfo info, gid.glib2.variant.Variant platformData, gid.gio2.app_launch_context.AppLaunchContext appLaunchContext)`
  
          `info` the [gid.gio2.app_info.AppInfo] that is about to be launched (optional)
  
          `platformData` additional platform-specific data for this launch (optional)
  
          `appLaunchContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLaunchStarted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.glib2.variant.Variant)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.app_launch_context.AppLaunchContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.launchStarted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("launch-started", closure, after);
  }

  /**
      Connect to `Launched` signal.
  
      The [gid.gio2.app_launch_context.AppLaunchContext.launched] signal is emitted when a
        [gid.gio2.app_info.AppInfo] is successfully launched.
        
        Because a launch operation may involve spawning multiple instances of the
        target application, you should expect this signal to be emitted multiple
        times, one time for each spawned instance.
        
        The platform_data is an GVariant dictionary mapping
        strings to variants (ie `a{sv}`), which contains additional,
        platform-specific data about this launch. On UNIX, at least the
        `pid` and `startup-notification-id` keys will be present.
        
        Since 2.72 the `pid` may be 0 if the process id wasn’t known (for
        example if the process was launched via D-Bus). The `pid` may not be
        set at all in subsequent releases.
        
        On Windows, `pid` is guaranteed to be valid only for the duration of the
        [gid.gio2.app_launch_context.AppLaunchContext.launched] signal emission; after the signal
        is emitted, GLib will call `funcGLib.spawn_close_pid`. If you need to
        keep the [gid.glib2.types.int] after the signal has been emitted, then you can
        duplicate `pid` using `DuplicateHandle()`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.app_info.AppInfo info, gid.glib2.variant.Variant platformData, gid.gio2.app_launch_context.AppLaunchContext appLaunchContext)`
  
          `info` the [gid.gio2.app_info.AppInfo] that was just launched (optional)
  
          `platformData` additional platform-specific data for this launch (optional)
  
          `appLaunchContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLaunched(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.glib2.variant.Variant)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.app_launch_context.AppLaunchContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.launched");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("launched", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AppLaunchContext
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.app_launch_context.AppLaunchContext), T.stringof ~ " is not derived from gid.gio2.app_launch_context.AppLaunchContext");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetDisplay", true)[0]) == gid.gio2.app_launch_context.AppLaunchContext))
      _installVfunc(klass, "get_display");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetStartupNotifyId", true)[0]) == gid.gio2.app_launch_context.AppLaunchContext))
      _installVfunc(klass, "get_startup_notify_id");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLaunchFailed", true)[0]) == gid.gio2.app_launch_context.AppLaunchContext))
      _installVfunc(klass, "launch_failed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLaunchStarted", true)[0]) == gid.gio2.app_launch_context.AppLaunchContext))
      _installVfunc(klass, "launch_started");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLaunched", true)[0]) == gid.gio2.app_launch_context.AppLaunchContext))
      _installVfunc(klass, "launched");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GAppLaunchContextClass*)klass;

    switch (vfunc)
    {
      case "get_display":
      {
        static extern(C) char* _vfuncGetDisplayTramp(GAppLaunchContext* context, GAppInfo* info, GList* files) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GAppLaunchContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getDisplay)
              return (cast(typeof(&_vfuncGetDisplayTramp))_klass.getDisplay)(context, info, files);
            return typeof(return).init;
          }

          string _dretval;
          auto _files = gListToD!(gid.gio2.file.File, GidOwnership.None)(files);

          try
          {
            _dretval = _obj.vfuncGetDisplay(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(void*)info, No.Take), _files);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.vfuncGetDisplay");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getDisplay = cast(typeof(_klass.getDisplay))&_vfuncGetDisplayTramp;
        break;
      }
      case "get_startup_notify_id":
      {
        static extern(C) char* _vfuncGetStartupNotifyIdTramp(GAppLaunchContext* context, GAppInfo* info, GList* files) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GAppLaunchContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getStartupNotifyId)
              return (cast(typeof(&_vfuncGetStartupNotifyIdTramp))_klass.getStartupNotifyId)(context, info, files);
            return typeof(return).init;
          }

          string _dretval;
          auto _files = gListToD!(gid.gio2.file.File, GidOwnership.None)(files);

          try
          {
            _dretval = _obj.vfuncGetStartupNotifyId(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(void*)info, No.Take), _files);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.vfuncGetStartupNotifyId");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getStartupNotifyId = cast(typeof(_klass.getStartupNotifyId))&_vfuncGetStartupNotifyIdTramp;
        break;
      }
      case "launch_failed":
      {
        static extern(C) void _vfuncLaunchFailedTramp(GAppLaunchContext* context, const(char)* startupNotifyId) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GAppLaunchContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.launchFailed)
              return (cast(typeof(&_vfuncLaunchFailedTramp))_klass.launchFailed)(context, startupNotifyId);
            return;
          }

          string _startupNotifyId = startupNotifyId.fromCString!(No.Free);

          try
          {
            _obj.vfuncLaunchFailed(_startupNotifyId);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.vfuncLaunchFailed");
          }
        }

        _klass.launchFailed = cast(typeof(_klass.launchFailed))&_vfuncLaunchFailedTramp;
        break;
      }
      case "launch_started":
      {
        static extern(C) void _vfuncLaunchStartedTramp(GAppLaunchContext* context, GAppInfo* info, GVariant* platformData) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GAppLaunchContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.launchStarted)
              return (cast(typeof(&_vfuncLaunchStartedTramp))_klass.launchStarted)(context, info, platformData);
            return;
          }

          try
          {
            _obj.vfuncLaunchStarted(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(void*)info, No.Take), platformData ? new gid.glib2.variant.Variant(cast(void*)platformData, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.vfuncLaunchStarted");
          }
        }

        _klass.launchStarted = cast(typeof(_klass.launchStarted))&_vfuncLaunchStartedTramp;
        break;
      }
      case "launched":
      {
        static extern(C) void _vfuncLaunchedTramp(GAppLaunchContext* context, GAppInfo* info, GVariant* platformData) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GAppLaunchContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.launched)
              return (cast(typeof(&_vfuncLaunchedTramp))_klass.launched)(context, info, platformData);
            return;
          }

          try
          {
            _obj.vfuncLaunched(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(void*)info, No.Take), platformData ? new gid.glib2.variant.Variant(cast(void*)platformData, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_launch_context.AppLaunchContext.vfuncLaunched");
          }
        }

        _klass.launched = cast(typeof(_klass.launched))&_vfuncLaunchedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.app_launch_context.AppLaunchContext]
class AppLaunchContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.app_launch_context.AppLaunchContext]
final class AppLaunchContextGidBuilder : AppLaunchContextGidBuilderImpl!AppLaunchContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AppLaunchContext build() nothrow
  {
    return new AppLaunchContext(cast(void*)createGObject(AppLaunchContext._getGType), Yes.Take);
  }
}
