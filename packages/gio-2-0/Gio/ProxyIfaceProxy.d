module Gio.ProxyIfaceProxy;

import GObject.ObjectG;
import Gio.Proxy;
import Gio.ProxyT;

/// Proxy object for Gio.Proxy interface when a GObject has no applicable D binding
class ProxyIfaceProxy : IfaceProxy, Proxy
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Proxy);
  }

  mixin ProxyT!();
}
