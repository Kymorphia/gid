/// Module for [TextIfaceProxy] interface proxy object
module atk.text_iface_proxy;

import gobject.object;
import atk.text;
import atk.text_mixin;

/// Proxy object for [atk.text.Text] interface when a GObject has no applicable D binding
class TextIfaceProxy : IfaceProxy, atk.text.Text
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.text.Text);
  }

  mixin TextT!();
}
