/// Module for [NativeIfaceProxy] interface proxy object
module gid.gtk4.native_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.native;
import gid.gtk4.native_mixin;

/// Proxy object for [gid.gtk4.native.Native] interface when a GObject has no applicable D binding
class NativeIfaceProxy : IfaceProxy, gid.gtk4.native.Native
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.native.Native);
  }

  mixin NativeT!();
}
