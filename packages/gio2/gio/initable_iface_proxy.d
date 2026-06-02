/// Module for [InitableIfaceProxy] interface proxy object
module gio.initable_iface_proxy;

import gobject.object;
import gio.initable;
import gio.initable_mixin;

/// Proxy object for [gio.initable.Initable] interface when a GObject has no applicable D binding
class InitableIfaceProxy : IfaceProxy, gio.initable.Initable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.initable.Initable);
  }

  mixin InitableT!();
}
