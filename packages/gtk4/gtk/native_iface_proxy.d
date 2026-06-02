/// Module for [NativeIfaceProxy] interface proxy object
module gtk.native_iface_proxy;

import gobject.object;
import gtk.native;
import gtk.native_mixin;

/// Proxy object for [gtk.native.Native] interface when a GObject has no applicable D binding
class NativeIfaceProxy : IfaceProxy, gtk.native.Native
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.native.Native);
  }

  mixin NativeT!();
}
