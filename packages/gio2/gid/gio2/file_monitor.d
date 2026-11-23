/// Module for [FileMonitor] class
module gid.gio2.file_monitor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.file;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Monitors a file or directory for changes.
    
    To obtain a [gid.gio2.file_monitor.FileMonitor] for a file or directory, use
    [gid.gio2.file.File.monitor], [gid.gio2.file.File.monitorFile], or
    [gid.gio2.file.File.monitorDirectory].
    
    To get informed about changes to the file or directory you are
    monitoring, connect to the [gid.gio2.file_monitor.FileMonitor.changed] signal. The
    signal will be emitted in the thread-default main context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) of the thread that the monitor
    was created in (though if the global default main context is blocked, this
    may cause notifications to be blocked even if the thread-default
    context is still running).
*/
class FileMonitor : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_file_monitor_get_type != &gidSymbolNotFound ? g_file_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileMonitor";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileMonitor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_monitor.FileMonitor]
      Returns: New builder object
  */
  static FileMonitorGidBuilder builder() nothrow
  {
    return new FileMonitorGidBuilder;
  }

  /**
      Get `cancelled` property.
      Returns: Whether the monitor has been cancelled.
  */
  @property bool cancelled() nothrow
  {
    return isCancelled();
  }

  /**
      Get `rateLimit` property.
      Returns: The limit of the monitor to watch for changes, in milliseconds.
  */
  @property int rateLimit() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("rate-limit");
  }

  /**
      Set `rateLimit` property.
      Params:
        propval = The limit of the monitor to watch for changes, in milliseconds.
  */
  @property void rateLimit(int propval) nothrow
  {
    setRateLimit(propval);
  }

  /**
      Cancels a file monitor.
      Returns: always true
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCancel` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCancel()
  {
    auto _klass = cast(GFileMonitorClass*)_vfuncClass;
    if (!_klass.cancel)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.cancel(cast(GFileMonitor*)this._cPtr);
    return _retval;
  }

  /** */
  protected void vfuncChanged(gid.gio2.file.File file, gid.gio2.file.File otherFile, gid.gio2.types.FileMonitorEvent eventType)
  {
    auto _klass = cast(GFileMonitorClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GFileMonitor*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, otherFile ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)otherFile)._cPtr(No.Dup) : null, eventType);
  }

  /**
      Cancels a file monitor.
      Returns: always true
  */
  bool cancel() nothrow
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
      thread-default main context (see [gid.glib2.main_context.MainContext.pushThreadDefault])
      of the thread that the monitor was created in.
  
      Params:
        child = a #GFile.
        otherFile = a #GFile, or null.
        eventType = a set of #GFileMonitorEvent flags.
  */
  void emitEvent(gid.gio2.file.File child, gid.gio2.file.File otherFile, gid.gio2.types.FileMonitorEvent eventType) nothrow
  {
    g_file_monitor_emit_event(cast(GFileMonitor*)this._cPtr, child ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)child)._cPtr(No.Dup) : null, otherFile ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)otherFile)._cPtr(No.Dup) : null, eventType);
  }

  /**
      Returns whether the monitor is canceled.
      Returns: true if monitor is canceled. false otherwise.
  */
  bool isCancelled() nothrow
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
  void setRateLimit(int limitMsecs) nothrow
  {
    g_file_monitor_set_rate_limit(cast(GFileMonitor*)this._cPtr, limitMsecs);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when file has been changed.
        
        If using [gid.gio2.types.FileMonitorFlags.WatchMoves] on a directory monitor, and
        the information is available (and if supported by the backend),
        event_type may be [gid.gio2.types.FileMonitorEvent.Renamed],
        [gid.gio2.types.FileMonitorEvent.MovedIn] or [gid.gio2.types.FileMonitorEvent.MovedOut].
        
        In all cases file will be a child of the monitored directory.  For
        renames, file will be the old name and other_file is the new
        name.  For "moved in" events, file is the name of the file that
        appeared and other_file is the old name that it was moved from (in
        another directory).  For "moved out" events, file is the name of
        the file that used to be in this directory and other_file is the
        name of the file at its new location.
        
        It makes sense to treat [gid.gio2.types.FileMonitorEvent.MovedIn] as
        equivalent to [gid.gio2.types.FileMonitorEvent.Created] and
        [gid.gio2.types.FileMonitorEvent.MovedOut] as equivalent to
        [gid.gio2.types.FileMonitorEvent.Deleted], with extra information.
        [gid.gio2.types.FileMonitorEvent.Renamed] is equivalent to a delete/create
        pair.  This is exactly how the events will be reported in the case
        that the [gid.gio2.types.FileMonitorFlags.WatchMoves] flag is not in use.
        
        If using the deprecated flag [gid.gio2.types.FileMonitorFlags.SendMoved] flag and event_type is
        [gid.gio2.types.FileMonitorEvent.Moved], file will be set to a #GFile containing the
        old path, and other_file will be set to a #GFile containing the new path.
        
        In all the other cases, other_file will be set to #NULL.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.file.File file, gid.gio2.file.File otherFile, gid.gio2.types.FileMonitorEvent eventType, gid.gio2.file_monitor.FileMonitor fileMonitor)`
  
          `file` a #GFile. (optional)
  
          `otherFile` a #GFile or #NULL. (optional)
  
          `eventType` a #GFileMonitorEvent. (optional)
  
          `fileMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.file.File)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.file.File)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gio2.types.FileMonitorEvent)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gio2.file_monitor.FileMonitor)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_monitor.FileMonitor.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FileMonitor
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.file_monitor.FileMonitor), T.stringof ~ " is not derived from gid.gio2.file_monitor.FileMonitor");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCancel", true)[0]) == gid.gio2.file_monitor.FileMonitor))
      _installVfunc(klass, "cancel");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gio2.file_monitor.FileMonitor))
      _installVfunc(klass, "changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GFileMonitorClass*)klass;

    switch (vfunc)
    {
      case "cancel":
      {
        static extern(C) gboolean _vfuncCancelTramp(GFileMonitor* monitor) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_monitor.FileMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)monitor);
          if (!_obj)
          {
            auto _klass = cast(GFileMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)monitor);
            if (_klass.cancel)
              return (cast(typeof(&_vfuncCancelTramp))_klass.cancel)(monitor);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCancel();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_monitor.FileMonitor.vfuncCancel");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.cancel = cast(typeof(_klass.cancel))&_vfuncCancelTramp;
        break;
      }
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GFileMonitor* monitor, GFile* file, GFile* otherFile, GFileMonitorEvent eventType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_monitor.FileMonitor)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)monitor);
          if (!_obj)
          {
            auto _klass = cast(GFileMonitorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)monitor);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(monitor, file, otherFile, eventType);
            return;
          }

          try
          {
            _obj.vfuncChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(void*)file, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(void*)otherFile, No.Take), eventType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_monitor.FileMonitor.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.file_monitor.FileMonitor]
class FileMonitorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `rateLimit` property.
      Params:
        propval = The limit of the monitor to watch for changes, in milliseconds.
      Returns: Builder instance for fluent chaining
  */
  T rateLimit(int propval) nothrow
  {
    return setProperty("rate-limit", propval);
  }
}

/// Fluent builder for [gid.gio2.file_monitor.FileMonitor]
final class FileMonitorGidBuilder : FileMonitorGidBuilderImpl!FileMonitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileMonitor build() nothrow
  {
    return new FileMonitor(cast(void*)createGObject(FileMonitor._getGType), Yes.Take);
  }
}
