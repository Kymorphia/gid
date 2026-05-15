/// Module for [UnixMountMonitor] class
module gio.unix_mount_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;

/**
    Watches #GUnixMounts for changes.
*/
class UnixMountMonitor : gobject.object.ObjectWrap
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
    return cast(void function())g_unix_mount_monitor_get_type != &gidSymbolNotFound ? g_unix_mount_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixMountMonitor self()
  {
    return this;
  }

  /**
      Get builder for [gio.unix_mount_monitor.UnixMountMonitor]
      Returns: New builder object
  */
  static UnixMountMonitorGidBuilder builder()
  {
    return new UnixMountMonitorGidBuilder;
  }

  /**
      Deprecated alias for [gio.unix_mount_monitor.UnixMountMonitor.get].
      
      This function was never a true constructor, which is why it was
      renamed.
      Returns: a #GUnixMountMonitor.
  
      Deprecated: Use [gio.unix_mount_monitor.UnixMountMonitor.get] instead.
  */
  this()
  {
    GUnixMountMonitor* _cretval;
    _cretval = g_unix_mount_monitor_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GUnixMountMonitor for the current thread-default main
      context.
      
      The mount monitor can be used to monitor for changes to the list of
      mounted filesystems as well as the list of mount points (ie: fstab
      entries).
      
      You must only call [gobject.object.ObjectWrap.unref] on the return value from under
      the same main context as you called this function.
      Returns: the #GUnixMountMonitor.
  */
  static gio.unix_mount_monitor.UnixMountMonitor get()
  {
    GUnixMountMonitor* _cretval;
    _cretval = g_unix_mount_monitor_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_mount_monitor.UnixMountMonitor)(cast(GUnixMountMonitor*)_cretval, Yes.Take);
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
        limitMsec = a integer with the limit in milliseconds to
              poll for changes.
  
      Deprecated: This function does nothing.  Don't call it.
  */
  void setRateLimit(int limitMsec)
  {
    g_unix_mount_monitor_set_rate_limit(cast(GUnixMountMonitor*)this._cPtr, limitMsec);
  }

  /**
      Connect to `MountpointsChanged` signal.
  
      Emitted when the unix mount points have changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gio.unix_mount_monitor.UnixMountMonitor unixMountMonitor)`
  
          `unixMountMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountpointsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.unix_mount_monitor.UnixMountMonitor)))
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
    return connectSignalClosure("mountpoints-changed", closure, after);
  }

  /**
      Connect to `MountsChanged` signal.
  
      Emitted when the unix mounts have changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gio.unix_mount_monitor.UnixMountMonitor unixMountMonitor)`
  
          `unixMountMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMountsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.unix_mount_monitor.UnixMountMonitor)))
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
    return connectSignalClosure("mounts-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gio.unix_mount_monitor.UnixMountMonitor]
class UnixMountMonitorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gio.unix_mount_monitor.UnixMountMonitor]
final class UnixMountMonitorGidBuilder : UnixMountMonitorGidBuilderImpl!UnixMountMonitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UnixMountMonitor build()
  {
    return new UnixMountMonitor(cast(void*)createGObject(UnixMountMonitor._getGType), Yes.Take);
  }
}
