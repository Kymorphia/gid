/// Module for [AppInfoMonitor] class
module gio.app_info_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    [gio.app_info_monitor.AppInfoMonitor] monitors application information for changes.
    
    [gio.app_info_monitor.AppInfoMonitor] is a very simple object used for monitoring the app
    info database for changes (newly installed or removed applications).
    
    Call [gio.app_info_monitor.AppInfoMonitor.get] to get a [gio.app_info_monitor.AppInfoMonitor] and connect
    to the [gio.app_info_monitor.AppInfoMonitor.changed] signal. The signal will be emitted once when
    the app info database changes, and will not be emitted again until after the
    next call to [gio.app_info.AppInfo.getAll] or another `g_app_info_*()` function.
    This is because monitoring the app info database for changes is expensive.
    
    The following functions will re-arm the [gio.app_info_monitor.AppInfoMonitor.changed]
    signal so it can be emitted again:
    
     $(LIST
        * [gio.app_info.AppInfo.getAll]
        * [gio.app_info.AppInfo.getAllForType]
        * [gio.app_info.AppInfo.getDefaultForType]
        * [gio.app_info.AppInfo.getFallbackForType]
        * [gio.app_info.AppInfo.getRecommendedForType]
        * [`[gio.desktop_app_info.DesktopAppInfo.getImplementations]`](../gio-unix/type_func.DesktopAppInfo.get_implementation.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.new_]`](../gio-unix/ctor.DesktopAppInfo.new.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.newFromFilename]`](../gio-unix/ctor.DesktopAppInfo.new_from_filename.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.newFromKeyfile]`](../gio-unix/ctor.DesktopAppInfo.new_from_keyfile.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.search]`](../gio-unix/type_func.DesktopAppInfo.search.html)
     )
       
    The latter functions are available if using
    [[gio.desktop_app_info.DesktopAppInfo]](../gio-unix/class.DesktopAppInfo.html) from
    `gio-unix-2.0.pc` (GIR namespace `GioUnix-2.0`).
    
    In the usual case, applications should try to make note of the change
    (doing things like invalidating caches) but not act on it. In
    particular, applications should avoid making calls to [gio.app_info.AppInfo] APIs
    in response to the change signal, deferring these until the time that
    the updated data is actually required. The exception to this case is when
    application information is actually being displayed on the screen
    (for example, during a search or when the list of all applications is shown).
    The reason for this is that changes to the list of installed applications
    often come in groups (like during system updates) and rescanning the list
    on every change is pointless and expensive.
*/
class AppInfoMonitor : gobject.object.ObjectWrap
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
    return cast(void function())g_app_info_monitor_get_type != &gidSymbolNotFound ? g_app_info_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppInfoMonitor self()
  {
    return this;
  }

  /**
      Gets the #GAppInfoMonitor for the current thread-default main
      context.
      
      The #GAppInfoMonitor will emit a "changed" signal in the
      thread-default main context whenever the list of installed
      applications (as reported by [gio.app_info.AppInfo.getAll]) may have changed.
      
      The #GAppInfoMonitor::changed signal will only be emitted once until
      [gio.app_info.AppInfo.getAll] (or another `g_app_info_*()` function) is called. Doing
      so will re-arm the signal ready to notify about the next change.
      
      You must only call [gobject.object.ObjectWrap.unref] on the return value from under
      the same main context as you created it.
      Returns: a reference to a #GAppInfoMonitor
  */
  static gio.app_info_monitor.AppInfoMonitor get()
  {
    GAppInfoMonitor* _cretval;
    _cretval = g_app_info_monitor_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info_monitor.AppInfoMonitor)(cast(GAppInfoMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Signal emitted when the app info database changes, when applications are
        installed or removed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.app_info_monitor.AppInfoMonitor appInfoMonitor))
  
          `appInfoMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info_monitor.AppInfoMonitor)))
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
    return connectSignalClosure("changed", closure, after);
  }
}
