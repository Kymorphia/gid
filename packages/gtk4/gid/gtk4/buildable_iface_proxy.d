/// Module for [BuildableIfaceProxy] interface proxy object
module gid.gtk4.buildable_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;

/// Proxy object for [gid.gtk4.buildable.Buildable] interface when a GObject has no applicable D binding
class BuildableIfaceProxy : IfaceProxy, gid.gtk4.buildable.Buildable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.buildable.Buildable);
  }

  mixin BuildableT!();
}
