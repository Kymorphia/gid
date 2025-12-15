/// Module for [FileMonitor] class
module gio.file_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    Monitors a file or directory for changes.
    
    To obtain a [gio.file_monitor.FileMonitor] for a file or directory, use
    [gio.file.File.monitor], [gio.file.File.monitorFile], or
    [gio.file.File.monitorDirectory].
    
    To get informed about changes to the file or directory you are
    monitoring, connect to the [gio.file_monitor.FileMonitor.changed] signal. The
    signal will be emitted in the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) of the thread that the monitor
    was created in (though if the global default main context is blocked, this
    may cause notifications to be blocked even if the thread-default
    context is still running).
*/
class FileMonitor : gobject.object.ObjectWrap
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
    return cast(void function())g_file_monitor_get_type != &gidSymbolNotFound ? g_file_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileMonitor self()
  {
    return this;
  }

  /**
      Get `cancelled` property.
      Returns: Whether the monitor has been cancelled.
  */
  @property bool cancelled()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("cancelled");
  }

  /**
      Get `rateLimit` property.
      Returns: The limit of the monitor to watch for changes, in milliseconds.
  */
  @property int rateLimit()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("rate-limit");
  }

  /**
      Set `rateLimit` property.
      Params:
        propval = The limit of the monitor to watch for changes, in milliseconds.
  */
  @property void rateLimit(int propval)
  {
    return setRateLimit(propval);
  }

  /**
      Cancels a file monitor.
      Returns: always true
  */
  bool cancel()
  {
    bool _retval;
    _retval = cast(bool)g_file_monitor_cancel(cast(GFileMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GFileMonitor::changed signal if a change
      has taken place. Should be called from file monitor
      implementations only.
      
      Implementations are responsible to call this method from the
      [thread-default main context][g-main-context-push-thread-default] of the
      thread that the monitor was created in.
  
      Params:
        child = a #GFile.
        otherFile = a #GFile.
        eventType = a set of #GFileMonitorEvent flags.
  */
  void emitEvent(gio.file.File child, gio.file.File otherFile, gio.types.FileMonitorEvent eventType)
  {
    g_file_monitor_emit_event(cast(GFileMonitor*)this._cPtr, child ? cast(GFile*)(cast(gobject.object.ObjectWrap)child)._cPtr(No.Dup) : null, otherFile ? cast(GFile*)(cast(gobject.object.ObjectWrap)otherFile)._cPtr(No.Dup) : null, eventType);
  }

  /**
      Returns whether the monitor is canceled.
      Returns: true if monitor is canceled. false otherwise.
  */
  bool isCancelled()
  {
    bool _retval;
    _retval = cast(bool)g_file_monitor_is_cancelled(cast(GFileMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Sets the rate limit to which the monitor will report
      consecutive change events to the same file.
  
      Params:
        limitMsecs = a non-negative integer with the limit in milliseconds
              to poll for changes
  */
  void setRateLimit(int limitMsecs)
  {
    g_file_monitor_set_rate_limit(cast(GFileMonitor*)this._cPtr, limitMsecs);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when file has been changed.
      
      If using [gio.types.FileMonitorFlags.WatchMoves] on a directory monitor, and
      the information is available (and if supported by the backend),
      event_type may be [gio.types.FileMonitorEvent.Renamed],
      [gio.types.FileMonitorEvent.MovedIn] or [gio.types.FileMonitorEvent.MovedOut].
      
      In all cases file will be a child of the monitored directory.  For
      renames, file will be the old name and other_file is the new
      name.  For "moved in" events, file is the name of the file that
      appeared and other_file is the old name that it was moved from (in
      another directory).  For "moved out" events, file is the name of
      the file that used to be in this directory and other_file is the
      name of the file at its new location.
      
      It makes sense to treat [gio.types.FileMonitorEvent.MovedIn] as
      equivalent to [gio.types.FileMonitorEvent.Created] and
      [gio.types.FileMonitorEvent.MovedOut] as equivalent to
      [gio.types.FileMonitorEvent.Deleted], with extra information.
      [gio.types.FileMonitorEvent.Renamed] is equivalent to a delete/create
      pair.  This is exactly how the events will be reported in the case
      that the [gio.types.FileMonitorFlags.WatchMoves] flag is not in use.
      
      If using the deprecated flag [gio.types.FileMonitorFlags.SendMoved] flag and event_type is
      [gio.types.FileMonitorEvent.Moved], file will be set to a #GFile containing the
      old path, and other_file will be set to a #GFile containing the new path.
      
      In all the other cases, other_file will be set to #NULL.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.file.File file, gio.file.File otherFile, gio.types.FileMonitorEvent eventType, gio.file_monitor.FileMonitor fileMonitor))
  
          `file` a #GFile. (optional)
  
          `otherFile` a #GFile or #NULL. (optional)
  
          `eventType` a #GFileMonitorEvent. (optional)
  
          `fileMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.file.File)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.file.File)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gio.types.FileMonitorEvent)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gio.file_monitor.FileMonitor)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
