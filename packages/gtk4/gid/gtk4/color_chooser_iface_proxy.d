/// Module for [ColorChooserIfaceProxy] interface proxy object
module gid.gtk4.color_chooser_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.color_chooser;
import gid.gtk4.color_chooser_mixin;

/// Proxy object for [gid.gtk4.color_chooser.ColorChooser] interface when a GObject has no applicable D binding
class ColorChooserIfaceProxy : IfaceProxy, gid.gtk4.color_chooser.ColorChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.color_chooser.ColorChooser);
  }

  mixin ColorChooserT!();
}
