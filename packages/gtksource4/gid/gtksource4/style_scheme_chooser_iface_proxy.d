/// Module for [StyleSchemeChooserIfaceProxy] interface proxy object
module gid.gtksource4.style_scheme_chooser_iface_proxy;

import gid.gobject2.object;
import gid.gtksource4.style_scheme_chooser;
import gid.gtksource4.style_scheme_chooser_mixin;

/// Proxy object for [gid.gtksource4.style_scheme_chooser.StyleSchemeChooser] interface when a GObject has no applicable D binding
class StyleSchemeChooserIfaceProxy : IfaceProxy, gid.gtksource4.style_scheme_chooser.StyleSchemeChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtksource4.style_scheme_chooser.StyleSchemeChooser);
  }

  mixin StyleSchemeChooserT!();
}
