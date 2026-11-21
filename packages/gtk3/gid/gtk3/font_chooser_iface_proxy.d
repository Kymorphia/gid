/// Module for [FontChooserIfaceProxy] interface proxy object
module gid.gtk3.font_chooser_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.font_chooser;
import gid.gtk3.font_chooser_mixin;

/// Proxy object for [gid.gtk3.font_chooser.FontChooser] interface when a GObject has no applicable D binding
class FontChooserIfaceProxy : IfaceProxy, gid.gtk3.font_chooser.FontChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.font_chooser.FontChooser);
  }

  mixin FontChooserT!();
}
