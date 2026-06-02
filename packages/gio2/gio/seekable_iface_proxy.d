/// Module for [SeekableIfaceProxy] interface proxy object
module gio.seekable_iface_proxy;

import gobject.object;
import gio.seekable;
import gio.seekable_mixin;

/// Proxy object for [gio.seekable.Seekable] interface when a GObject has no applicable D binding
class SeekableIfaceProxy : IfaceProxy, gio.seekable.Seekable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.seekable.Seekable);
  }

  mixin SeekableT!();
}
