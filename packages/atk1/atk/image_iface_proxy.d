/// Module for [ImageIfaceProxy] interface proxy object
module atk.image_iface_proxy;

import gobject.object;
import atk.image;
import atk.image_mixin;

/// Proxy object for [atk.image.Image] interface when a GObject has no applicable D binding
class ImageIfaceProxy : IfaceProxy, atk.image.Image
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.image.Image);
  }

  mixin ImageT!();
}
