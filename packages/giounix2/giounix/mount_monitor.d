/// Module for [MountMonitor] class
module giounix.mount_monitor;

public import gid.basictypes;
import gid.gid;
import giounix.c.functions;
import giounix.c.types;
import giounix.types;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;

/**
    Watches for changes to the set of mount entries and mount points in the
    system.
    
    Connect to the [giounix.mount_monitor.MountMonitor.mountsChanged] signal to be
    notified of changes to the [giounix.mount_entry.MountEntry] list.
    
    Connect to the [giounix.mount_monitor.MountMonitor.mountpointsChanged] signal to
    be notified of changes to the [giounix.mount_point.MountPoint] list.
*/
class MountMonitor : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_mount_monitor_get_type != &gidSymbolNotFound ? g_unix_mount_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MountMonitor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [giounix.mount_monitor.MountMonitor]
      Returns: New builder object
  */
  static MountMonitorGidBuilder builder() nothrow
  {
    return new MountMonitorGidBuilder;
  }

  /**
      Deprecated alias for [giounix.mount_monitor.MountMonitor.get].
      
      This function was never a true constructor, which is why it was
      renamed.
      Returns: a [giounix.mount_monitor.MountMonitor]
  
      Deprecated: Use [giounix.mount_monitor.MountMonitor.get] instead.
  */
  this() nothrow
  {
    GUnixMountMonitor* _cretval;
    _cretval = g_unix_mount_monitor_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the [giounix.mount_monitor.MountMonitor] for the current thread-default main
      context.
      
      The mount monitor can be used to monitor for changes to the list of
      mounted filesystems as well as the list of mount points (ie: fstab
      entries).
      
      You must only call [gobject.object.ObjectWrap.unref] on the return value from
      under the same main context as you called this function.
      Returns: the [giounix.mount_monitor.MountMonitor]
  */
  static giounix.mount_monitor.MountMonitor get() nothrow
  {
    GUnixMountMonitor* _cretval;
    _cretval = g_unix_mount_monitor_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(giounix.mount_monitor.MountMonitor)(cast(GUnixMountMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function does nothing.
      
      Before 2.44, this was a partially-effective way of controlling the
      rate at which events would be reported under some uncommon
      circumstances.  Since mount_monitor is a singleton, it also meant
      that calling this function would have side effects for other users of
      the monitor.
  
      Params:
        limitMsec = a integer with the limit (in milliseconds) to poll for changes
  
      Deprecated: This function does nothing. Don’t call it.
  */
  void setRateLimit(int limitMsec) nothrow
  {
    g_unix_mount_monitor_set_rate_limit(cast(GUnixMountMonitor*)this._cPtr, limitMsec);
  }

  /**
      Connect to `MountpointsChanged` signal.
  
      Emitted when the Unix mount points have changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(giounix.mount_monitor.MountMonitor mountMonitor)`
  
          `mountMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountpointsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : giounix.mount_monitor.MountMonitor)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "giounix.mount_monitor.MountMonitor.mountpointsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mountpoints-changed", closure, after);
  }

  /**
      Connect to `MountsChanged` signal.
  
      Emitted when the Unix mount entries have changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(giounix.mount_monitor.MountMonitor mountMonitor)`
  
          `mountMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : giounix.mount_monitor.MountMonitor)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "giounix.mount_monitor.MountMonitor.mountsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mounts-changed", closure, after);
  }
}

/// Fluent builder implementation template for [giounix.mount_monitor.MountMonitor]
class MountMonitorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [giounix.mount_monitor.MountMonitor]
final class MountMonitorGidBuilder : MountMonitorGidBuilderImpl!MountMonitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MountMonitor build() nothrow
  {
    return new MountMonitor(cast(void*)createGObject(MountMonitor._getGType), Yes.Take);
  }
}
