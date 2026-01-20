/// Module for [AppLaunchContext] class
module gio.app_launch_context;

import gid.gid;
import gio.app_info;
import gio.c.functions;
import gio.c.types;
import gio.file;
import gio.types;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
    Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window.
*/
class AppLaunchContext : gobject.object.ObjectWrap
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
    return cast(void function())g_app_launch_context_get_type != &gidSymbolNotFound ? g_app_launch_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppLaunchContext self()
  {
    return this;
  }

  /**
      Creates a new application launch context. This is not normally used,
      instead you instantiate a subclass of this, such as #GdkAppLaunchContext.
      Returns: a #GAppLaunchContext.
  */
  this()
  {
    GAppLaunchContext* _cretval;
    _cretval = g_app_launch_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the display string for the context. This is used to ensure new
      applications are started on the same display as the launching
      application, by setting the `DISPLAY` environment variable.
  
      Params:
        info = a #GAppInfo
        files = a #GList of #GFile objects
      Returns: a display string for the display.
  */
  string getDisplay(gio.app_info.AppInfo info, gio.file.File[] files)
  {
    char* _cretval;
    auto _files = gListFromD!(gio.file.File)(files);
    scope(exit) containerFree!(GList*, gio.file.File, GidOwnership.None)(_files);
    _cretval = g_app_launch_context_get_display(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gobject.object.ObjectWrap)info)._cPtr(No.Dup) : null, _files);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the complete environment variable list to be passed to
      the child process when context is used to launch an application.
      This is a null-terminated array of strings, where each string has
      the form `KEY=VALUE`.
      Returns: the child's environment
  */
  string[] getEnvironment()
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
        _retval[i] = _cretval[i].fromCString(Yes.Free);
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
  
      Params:
        info = a #GAppInfo
        files = a #GList of #GFile objects
      Returns: a startup notification ID for the application, or null if
            not supported.
  */
  string getStartupNotifyId(gio.app_info.AppInfo info, gio.file.File[] files)
  {
    char* _cretval;
    auto _files = gListFromD!(gio.file.File)(files);
    scope(exit) containerFree!(GList*, gio.file.File, GidOwnership.None)(_files);
    _cretval = g_app_launch_context_get_startup_notify_id(cast(GAppLaunchContext*)this._cPtr, info ? cast(GAppInfo*)(cast(gobject.object.ObjectWrap)info)._cPtr(No.Dup) : null, _files);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Called when an application has failed to launch, so that it can cancel
      the application startup notification started in [gio.app_launch_context.AppLaunchContext.getStartupNotifyId].
  
      Params:
        startupNotifyId = the startup notification id that was returned by [gio.app_launch_context.AppLaunchContext.getStartupNotifyId].
  */
  void launchFailed(string startupNotifyId)
  {
    const(char)* _startupNotifyId = startupNotifyId.toCString(No.Alloc);
    g_app_launch_context_launch_failed(cast(GAppLaunchContext*)this._cPtr, _startupNotifyId);
  }

  /**
      Arranges for variable to be set to value in the child's
      environment when context is used to launch an application.
  
      Params:
        variable = the environment variable to set
        value = the value for to set the variable to.
  */
  void setenv(string variable, string value)
  {
    const(char)* _variable = variable.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_app_launch_context_setenv(cast(GAppLaunchContext*)this._cPtr, _variable, _value);
  }

  /**
      Arranges for variable to be unset in the child's environment
      when context is used to launch an application.
  
      Params:
        variable = the environment variable to remove
  */
  void unsetenv(string variable)
  {
    const(char)* _variable = variable.toCString(No.Alloc);
    g_app_launch_context_unsetenv(cast(GAppLaunchContext*)this._cPtr, _variable);
  }

  /**
      Connect to `LaunchFailed` signal.
  
      The #GAppLaunchContext::launch-failed signal is emitted when a #GAppInfo launch
        fails. The startup notification id is provided, so that the launcher
        can cancel the startup notification.
        
        Because a launch operation may involve spawning multiple instances of the
        target application, you should expect this signal to be emitted multiple
        times, one for each spawned instance.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string startupNotifyId, gio.app_launch_context.AppLaunchContext appLaunchContext))
  
          `startupNotifyId` the startup notification id for the failed launch (optional)
  
          `appLaunchContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLaunchFailed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.app_launch_context.AppLaunchContext)))
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
    return connectSignalClosure("launch-failed", closure, after);
  }

  /**
      Connect to `LaunchStarted` signal.
  
      The #GAppLaunchContext::launch-started signal is emitted when a #GAppInfo is
        about to be launched. If non-null the platform_data is an
        GVariant dictionary mapping strings to variants (ie `a{sv}`), which
        contains additional, platform-specific data about this launch. On
        UNIX, at least the `startup-notification-id` keys will be
        present.
        
        The value of the `startup-notification-id` key (type `s`) is a startup
        notification ID corresponding to the format from the [startup-notification
        specification](https://specifications.freedesktop.org/startup-notification-spec/startup-notification-0.1.txt).
        It allows tracking the progress of the launchee through startup.
        
        It is guaranteed that this signal is followed by either a #GAppLaunchContext::launched or
        #GAppLaunchContext::launch-failed signal.
        
        Because a launch operation may involve spawning multiple instances of the
        target application, you should expect this signal to be emitted multiple
        times, one for each spawned instance.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.app_info.AppInfo info, glib.variant.Variant platformData, gio.app_launch_context.AppLaunchContext appLaunchContext))
  
          `info` the #GAppInfo that is about to be launched (optional)
  
          `platformData` additional platform-specific data for this launch (optional)
  
          `appLaunchContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLaunchStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.variant.Variant)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.app_launch_context.AppLaunchContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("launch-started", closure, after);
  }

  /**
      Connect to `Launched` signal.
  
      The #GAppLaunchContext::launched signal is emitted when a #GAppInfo is successfully
        launched.
        
        Because a launch operation may involve spawning multiple instances of the
        target application, you should expect this signal to be emitted multiple
        times, one time for each spawned instance.
        
        The platform_data is an GVariant dictionary mapping
        strings to variants (ie `a{sv}`), which contains additional,
        platform-specific data about this launch. On UNIX, at least the
        `pid` and `startup-notification-id` keys will be present.
        
        Since 2.72 the `pid` may be 0 if the process id wasn't known (for
        example if the process was launched via D-Bus). The `pid` may not be
        set at all in subsequent releases.
        
        On Windows, `pid` is guaranteed to be valid only for the duration of the
        #GAppLaunchContext::launched signal emission; after the signal is emitted,
        GLib will call [glib.global.spawnClosePid]. If you need to keep the #GPid after the
        signal has been emitted, then you can duplicate `pid` using `DuplicateHandle()`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.app_info.AppInfo info, glib.variant.Variant platformData, gio.app_launch_context.AppLaunchContext appLaunchContext))
  
          `info` the #GAppInfo that was just launched (optional)
  
          `platformData` additional platform-specific data for this launch (optional)
  
          `appLaunchContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLaunched(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.variant.Variant)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.app_launch_context.AppLaunchContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("launched", closure, after);
  }
}
