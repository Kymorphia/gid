/// Module for [RootIfaceProxy] interface proxy object
module gid.gtk4.root_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;

/// Proxy object for [gid.gtk4.root.Root] interface when a GObject has no applicable D binding
class RootIfaceProxy : IfaceProxy, gid.gtk4.root.Root
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.root.Root);
  }

  mixin RootT!();
  mixin gid.gtk4.native_mixin.NativeT!();
}
