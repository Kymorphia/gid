/// Module for [HypertextIfaceProxy] interface proxy object
module atk.hypertext_iface_proxy;

import gobject.object;
import atk.hypertext;
import atk.hypertext_mixin;

/// Proxy object for [atk.hypertext.Hypertext] interface when a GObject has no applicable D binding
class HypertextIfaceProxy : IfaceProxy, atk.hypertext.Hypertext
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.hypertext.Hypertext);
  }

  mixin HypertextT!();
}
