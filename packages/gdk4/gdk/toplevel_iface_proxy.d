/// Module for [ToplevelIfaceProxy] interface proxy object
module gdk.toplevel_iface_proxy;

import gobject.object;
import gdk.toplevel;
import gdk.toplevel_mixin;

/// Proxy object for [gdk.toplevel.Toplevel] interface when a GObject has no applicable D binding
class ToplevelIfaceProxy : IfaceProxy, gdk.toplevel.Toplevel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gdk.toplevel.Toplevel);
  }

  mixin ToplevelT!();
}
