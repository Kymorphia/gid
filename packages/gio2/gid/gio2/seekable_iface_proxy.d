/// Module for [SeekableIfaceProxy] interface proxy object
module gid.gio2.seekable_iface_proxy;

import gid.gobject2.object;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;

/// Proxy object for [gid.gio2.seekable.Seekable] interface when a GObject has no applicable D binding
class SeekableIfaceProxy : IfaceProxy, gid.gio2.seekable.Seekable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.seekable.Seekable);
  }

  mixin SeekableT!();
}
