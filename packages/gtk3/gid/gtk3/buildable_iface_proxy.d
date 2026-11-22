/// Module for [BuildableIfaceProxy] interface proxy object
module gid.gtk3.buildable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;

/// Proxy object for [gid.gtk3.buildable.Buildable] interface when a GObject has no applicable D binding
class BuildableIfaceProxy : IfaceProxy, gid.gtk3.buildable.Buildable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.buildable.Buildable);
  }

  mixin BuildableT!();
}
