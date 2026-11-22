/// Module for [ImageIfaceProxy] interface proxy object
module gid.atk1.image_iface_proxy;

import gid.gobject2.object;
import gid.atk1.image;
import gid.atk1.image_mixin;

/// Proxy object for [gid.atk1.image.Image] interface when a GObject has no applicable D binding
class ImageIfaceProxy : IfaceProxy, gid.atk1.image.Image
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.image.Image);
  }

  mixin ImageT!();
}
