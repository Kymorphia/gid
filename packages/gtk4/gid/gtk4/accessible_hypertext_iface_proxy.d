/// Module for [AccessibleHypertextIfaceProxy] interface proxy object
module gid.gtk4.accessible_hypertext_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.accessible_hypertext;
import gid.gtk4.accessible_hypertext_mixin;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;

/// Proxy object for [gid.gtk4.accessible_hypertext.AccessibleHypertext] interface when a GObject has no applicable D binding
class AccessibleHypertextIfaceProxy : IfaceProxy, gid.gtk4.accessible_hypertext.AccessibleHypertext
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.accessible_hypertext.AccessibleHypertext);
  }

  mixin AccessibleHypertextT!();
  mixin gid.gtk4.accessible_mixin.AccessibleT!();
}
