/// Module for [HypertextIfaceProxy] interface proxy object
module gid.atk1.hypertext_iface_proxy;

import gid.gobject2.object;
import gid.atk1.hypertext;
import gid.atk1.hypertext_mixin;

/// Proxy object for [gid.atk1.hypertext.Hypertext] interface when a GObject has no applicable D binding
class HypertextIfaceProxy : IfaceProxy, gid.atk1.hypertext.Hypertext
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.hypertext.Hypertext);
  }

  mixin HypertextT!();
}
