/// Module for [InitableIfaceProxy] interface proxy object
module gid.gio2.initable_iface_proxy;

import gid.gobject2.object;
import gid.gio2.initable;
import gid.gio2.initable_mixin;

/// Proxy object for [gid.gio2.initable.Initable] interface when a GObject has no applicable D binding
class InitableIfaceProxy : IfaceProxy, gid.gio2.initable.Initable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.initable.Initable);
  }

  mixin InitableT!();
}
