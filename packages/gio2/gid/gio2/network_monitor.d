/// Module for [NetworkMonitor] interface
module gid.gio2.network_monitor;

public import gid.core.basictypes;
public import gid.gio2.network_monitor_iface_proxy;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.initable;
import gid.gio2.socket_connectable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.network_monitor.NetworkMonitor] provides an easy-to-use cross-platform API
    for monitoring network connectivity. On Linux, the available
    implementations are based on the kernel's netlink interface and
    on NetworkManager.
    
    There is also an implementation for use inside Flatpak sandboxes.
*/
interface NetworkMonitor : gid.gio2.initable.Initable
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_network_monitor_get_type != &gidSymbolNotFound ? g_network_monitor_get_type() : cast(GType)0;
  }

  /**
      Get `connectivity` property.
      Returns: More detailed information about the host's network connectivity.
        See [gid.gio2.network_monitor.NetworkMonitor.getConnectivity] and
        #GNetworkConnectivity for more details.
  */
  @property gid.gio2.types.NetworkConnectivity connectivity() nothrow;

  /**
      Get `networkAvailable` property.
      Returns: Whether the network is considered available. That is, whether the
        system has a default route for at least one of IPv4 or IPv6.
        
        Real-world networks are of course much more complicated than
        this; the machine may be connected to a wifi hotspot that
        requires payment before allowing traffic through, or may be
        connected to a functioning router that has lost its own upstream
        connectivity. Some hosts might only be accessible when a VPN is
        active. Other hosts might only be accessible when the VPN is
        not active. Thus, it is best to use [gid.gio2.network_monitor.NetworkMonitor.canReach]
        or [gid.gio2.network_monitor.NetworkMonitor.canReachAsync] to test for reachability
        on a host-by-host basis. (On the other hand, when the property is
        false, the application can reasonably expect that no remote
        hosts at all are reachable, and should indicate this to the user
        in its UI.)
        
        See also #GNetworkMonitor::network-changed.
  */
  @property bool networkAvailable() nothrow;

  /**
      Get `networkMetered` property.
      Returns: Whether the network is considered metered.
        
        That is, whether the
        system has traffic flowing through the default connection that is
        subject to limitations set by service providers. For example, traffic
        might be billed by the amount of data transmitted, or there might be a
        quota on the amount of traffic per month. This is typical with tethered
        connections (3G and 4G) and in such situations, bandwidth intensive
        applications may wish to avoid network activity where possible if it will
        cost the user money or use up their limited quota. Anything more than a
        few hundreds of kilobytes of data usage per hour should be avoided without
        asking permission from the user.
        
        If more information is required about specific devices then the
        system network management API should be used instead (for example,
        NetworkManager or ConnMan).
        
        If this information is not available then no networks will be
        marked as metered.
        
        See also #GNetworkMonitor:network-available.
  */
  @property bool networkMetered() nothrow;

  /**
      Gets the default #GNetworkMonitor for the system.
      Returns: a #GNetworkMonitor, which will be
            a dummy object if no network monitor is available
  */
  static gid.gio2.network_monitor.NetworkMonitor getDefault() nothrow
  {
    GNetworkMonitor* _cretval;
    _cretval = g_network_monitor_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.network_monitor.NetworkMonitor)(cast(GNetworkMonitor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Attempts to determine whether or not the host pointed to by
      connectable can be reached, without actually trying to connect to
      it.
      
      This may return true even when #GNetworkMonitor:network-available
      is false, if, for example, monitor can determine that
      connectable refers to a host on a local network.
      
      If monitor believes that an attempt to connect to connectable
      will succeed, it will return true. Otherwise, it will return
      false and set error to an appropriate error (such as
      [gid.gio2.types.IOErrorEnum.HostUnreachable]).
      
      Note that although this does not attempt to connect to
      connectable, it may still block for a brief period of time (eg,
      trying to do multicast DNS on the local network), so if you do not
      want to block, you should use [gid.gio2.network_monitor.NetworkMonitor.canReachAsync].
  
      Params:
        connectable = a #GSocketConnectable
        cancellable = a #GCancellable, or null
      Returns: true if connectable is reachable, false if not.
      Throws: [ErrorWrap]
  */
  bool canReach(gid.gio2.socket_connectable.SocketConnectable connectable, gid.gio2.cancellable.Cancellable cancellable = null);

  /**
      Asynchronously attempts to determine whether or not the host
      pointed to by connectable can be reached, without actually
      trying to connect to it.
      
      For more details, see [gid.gio2.network_monitor.NetworkMonitor.canReach].
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.network_monitor.NetworkMonitor.canReachFinish]
      to get the result of the operation.
  
      Params:
        connectable = a #GSocketConnectable
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void canReachAsync(gid.gio2.socket_connectable.SocketConnectable connectable, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes an async network connectivity test.
      See [gid.gio2.network_monitor.NetworkMonitor.canReachAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true if network is reachable, false if not.
      Throws: [ErrorWrap]
  */
  bool canReachFinish(gid.gio2.async_result.AsyncResult result);

  /**
      Gets a more detailed networking state than
      [gid.gio2.network_monitor.NetworkMonitor.getNetworkAvailable].
      
      If #GNetworkMonitor:network-available is false, then the
      connectivity state will be [gid.gio2.types.NetworkConnectivity.Local].
      
      If #GNetworkMonitor:network-available is true, then the
      connectivity state will be [gid.gio2.types.NetworkConnectivity.Full] (if there
      is full Internet connectivity), [gid.gio2.types.NetworkConnectivity.Limited] (if
      the host has a default route, but appears to be unable to actually
      reach the full Internet), or [gid.gio2.types.NetworkConnectivity.Portal] (if the
      host is trapped behind a "captive portal" that requires some sort
      of login or acknowledgement before allowing full Internet access).
      
      Note that in the case of [gid.gio2.types.NetworkConnectivity.Limited] and
      [gid.gio2.types.NetworkConnectivity.Portal], it is possible that some sites are
      reachable but others are not. In this case, applications can
      attempt to connect to remote servers, but should gracefully fall
      back to their "offline" behavior if the connection attempt fails.
      Returns: the network connectivity state
  */
  gid.gio2.types.NetworkConnectivity getConnectivity();

  /**
      Checks if the network is available. "Available" here means that the
      system has a default route available for at least one of IPv4 or
      IPv6. It does not necessarily imply that the public Internet is
      reachable. See #GNetworkMonitor:network-available for more details.
      Returns: whether the network is available
  */
  bool getNetworkAvailable();

  /**
      Checks if the network is metered.
      See #GNetworkMonitor:network-metered for more details.
      Returns: whether the connection is metered
  */
  bool getNetworkMetered();

  /**
      Connect to `NetworkChanged` signal.
  
      Emitted when the network configuration changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool networkAvailable, gid.gio2.network_monitor.NetworkMonitor networkMonitor)`
  
          `networkAvailable` the current value of #GNetworkMonitor:network-available (optional)
  
          `networkMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNetworkChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.network_monitor.NetworkMonitor)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.network_monitor.NetworkMonitor.networkChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("network-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.network_monitor.NetworkMonitor]
interface NetworkMonitorGidBuilderImpl(T) : gid.gio2.initable.InitableGidBuilderImpl!T
{
}
