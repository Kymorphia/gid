/// Module for [NetworkMonitor] interface
module gio.network_monitor;

public import gio.network_monitor_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.socket_connectable;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    [gio.network_monitor.NetworkMonitor] provides an easy-to-use cross-platform API
    for monitoring network connectivity. On Linux, the available
    implementations are based on the kernel's netlink interface and
    on NetworkManager.
    
    There is also an implementation for use inside Flatpak sandboxes.
*/
interface NetworkMonitor
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_network_monitor_get_type != &gidSymbolNotFound ? g_network_monitor_get_type() : cast(GType)0;
  }

  /**
      Get `connectivity` property.
      Returns: More detailed information about the host's network connectivity.
        See [gio.network_monitor.NetworkMonitor.getConnectivity] and
        #GNetworkConnectivity for more details.
  */
  @property gio.types.NetworkConnectivity connectivity();

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
        not active. Thus, it is best to use [gio.network_monitor.NetworkMonitor.canReach]
        or [gio.network_monitor.NetworkMonitor.canReachAsync] to test for reachability
        on a host-by-host basis. (On the other hand, when the property is
        false, the application can reasonably expect that no remote
        hosts at all are reachable, and should indicate this to the user
        in its UI.)
        
        See also #GNetworkMonitor::network-changed.
  */
  @property bool networkAvailable();

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
  @property bool networkMetered();

  /**
      Gets the default #GNetworkMonitor for the system.
      Returns: a #GNetworkMonitor, which will be
            a dummy object if no network monitor is available
  */
  static gio.network_monitor.NetworkMonitor getDefault()
  {
    GNetworkMonitor* _cretval;
    _cretval = g_network_monitor_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.network_monitor.NetworkMonitor)(cast(GNetworkMonitor*)_cretval, No.Take);
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
      [gio.types.IOErrorEnum.HostUnreachable]).
      
      Note that although this does not attempt to connect to
      connectable, it may still block for a brief period of time (eg,
      trying to do multicast DNS on the local network), so if you do not
      want to block, you should use [gio.network_monitor.NetworkMonitor.canReachAsync].
  
      Params:
        connectable = a #GSocketConnectable
        cancellable = a #GCancellable, or null
      Returns: true if connectable is reachable, false if not.
      Throws: [ErrorWrap]
  */
  bool canReach(gio.socket_connectable.SocketConnectable connectable, gio.cancellable.Cancellable cancellable = null);

  /**
      Asynchronously attempts to determine whether or not the host
      pointed to by connectable can be reached, without actually
      trying to connect to it.
      
      For more details, see [gio.network_monitor.NetworkMonitor.canReach].
      
      When the operation is finished, callback will be called.
      You can then call [gio.network_monitor.NetworkMonitor.canReachFinish]
      to get the result of the operation.
  
      Params:
        connectable = a #GSocketConnectable
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void canReachAsync(gio.socket_connectable.SocketConnectable connectable, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes an async network connectivity test.
      See [gio.network_monitor.NetworkMonitor.canReachAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true if network is reachable, false if not.
      Throws: [ErrorWrap]
  */
  bool canReachFinish(gio.async_result.AsyncResult result);

  /**
      Gets a more detailed networking state than
      [gio.network_monitor.NetworkMonitor.getNetworkAvailable].
      
      If #GNetworkMonitor:network-available is false, then the
      connectivity state will be [gio.types.NetworkConnectivity.Local].
      
      If #GNetworkMonitor:network-available is true, then the
      connectivity state will be [gio.types.NetworkConnectivity.Full] (if there
      is full Internet connectivity), [gio.types.NetworkConnectivity.Limited] (if
      the host has a default route, but appears to be unable to actually
      reach the full Internet), or [gio.types.NetworkConnectivity.Portal] (if the
      host is trapped behind a "captive portal" that requires some sort
      of login or acknowledgement before allowing full Internet access).
      
      Note that in the case of [gio.types.NetworkConnectivity.Limited] and
      [gio.types.NetworkConnectivity.Portal], it is possible that some sites are
      reachable but others are not. In this case, applications can
      attempt to connect to remote servers, but should gracefully fall
      back to their "offline" behavior if the connection attempt fails.
      Returns: the network connectivity state
  */
  gio.types.NetworkConnectivity getConnectivity();

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
  
          $(D void callback(bool networkAvailable, gio.network_monitor.NetworkMonitor networkMonitor))
  
          `networkAvailable` the current value of #GNetworkMonitor:network-available (optional)
  
          `networkMonitor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNetworkChanged(T)(T callback, Flag!"After" after = No.After);
}
