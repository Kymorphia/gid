/// Module for [ToplevelIfaceProxy] interface proxy object
module gid.gdk4.toplevel_iface_proxy;

import gid.gobject2.object;
import gid.gdk4.toplevel;
import gid.gdk4.toplevel_mixin;

/// Proxy object for [gid.gdk4.toplevel.Toplevel] interface when a GObject has no applicable D binding
class ToplevelIfaceProxy : IfaceProxy, gid.gdk4.toplevel.Toplevel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gdk4.toplevel.Toplevel);
  }

  mixin ToplevelT!();
}
