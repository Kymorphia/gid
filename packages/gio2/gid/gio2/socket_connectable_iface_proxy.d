/// Module for [SocketConnectableIfaceProxy] interface proxy object
module gid.gio2.socket_connectable_iface_proxy;

import gid.gobject2.object;
import gid.gio2.socket_connectable;
import gid.gio2.socket_connectable_mixin;

/// Proxy object for [gid.gio2.socket_connectable.SocketConnectable] interface when a GObject has no applicable D binding
class SocketConnectableIfaceProxy : IfaceProxy, gid.gio2.socket_connectable.SocketConnectable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.socket_connectable.SocketConnectable);
  }

  mixin SocketConnectableT!();
}
