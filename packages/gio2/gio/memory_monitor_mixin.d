/// Module for [MemoryMonitor] interface mixin
module gio.memory_monitor_mixin;

public import gio.memory_monitor_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import gobject.dclosure;
public import gobject.object;

/**
    [gio.memory_monitor.MemoryMonitor] will monitor system memory and suggest to the application
    when to free memory so as to leave more room for other applications.
    It is implemented on Linux using the
    [Low Memory Monitor](https://gitlab.freedesktop.org/hadess/low-memory-monitor/)
    ([API documentation](https://hadess.pages.freedesktop.org/low-memory-monitor/)).
    
    There is also an implementation for use inside Flatpak sandboxes.
    
    Possible actions to take when the signal is received are:
    
     $(LIST
        * Free caches
        * Save files that haven’t been looked at in a while to disk, ready to be reopened when needed
        * Run a garbage collection cycle
        * Try and compress fragmented allocations
        * Exit on idle if the process has no reason to stay around
        * Call [`malloc_trim(3)`](man:malloc_trim(3)) to return cached heap pages to
          the kernel (if supported by your libc)
     )
       
    Note that some actions may not always improve system performance, and so
    should be profiled for your application. `malloc_trim()`, for example, may
    make future heap allocations slower (due to releasing cached heap pages back
    to the kernel).
    
    See [gio.types.MemoryMonitorWarningLevel] for details on the various warning
    levels.
    
    ```c
    static void
    warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)
    {
      g_debug ("Warning level: %d", level);
      if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
        drop_caches ();
    }
    
    static GMemoryMonitor *
    monitor_low_memory (void)
    {
      GMemoryMonitor *m;
      m = g_memory_monitor_dup_default ();
      g_signal_connect (G_OBJECT (m), "low-memory-warning",
                        G_CALLBACK (warning_cb), NULL);
      return m;
    }
    ```
    
    Don’t forget to disconnect the `signal@Gio.MemoryMonitor::low-memory-warning`
    signal, and unref the [gio.memory_monitor.MemoryMonitor] itself when exiting.
*/
template MemoryMonitorT()
{


  /**
      Connect to `LowMemoryWarning` signal.
  
      Emitted when the system is running low on free memory. The signal
        handler should then take the appropriate action depending on the
        warning level. See the #GMemoryMonitorWarningLevel documentation for
        details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.types.MemoryMonitorWarningLevel level, gio.memory_monitor.MemoryMonitor memoryMonitor))
  
          `level` the #GMemoryMonitorWarningLevel warning level (optional)
  
          `memoryMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLowMemoryWarning(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gio.types.MemoryMonitorWarningLevel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.memory_monitor.MemoryMonitor)))
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
    return connectSignalClosure("low-memory-warning", closure, after);
  }
}
