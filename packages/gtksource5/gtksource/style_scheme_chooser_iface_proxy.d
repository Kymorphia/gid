/// Module for [StyleSchemeChooserIfaceProxy] interface proxy object
module gtksource.style_scheme_chooser_iface_proxy;

import gobject.object;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;

/// Proxy object for [gtksource.style_scheme_chooser.StyleSchemeChooser] interface when a GObject has no applicable D binding
class StyleSchemeChooserIfaceProxy : IfaceProxy, gtksource.style_scheme_chooser.StyleSchemeChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtksource.style_scheme_chooser.StyleSchemeChooser);
  }

  mixin StyleSchemeChooserT!();
}
