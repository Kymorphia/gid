/// Module for [AccessibleTextIfaceProxy] interface proxy object
module gid.gtk4.accessible_text_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.accessible_text;
import gid.gtk4.accessible_text_mixin;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;

/// Proxy object for [gid.gtk4.accessible_text.AccessibleText] interface when a GObject has no applicable D binding
class AccessibleTextIfaceProxy : IfaceProxy, gid.gtk4.accessible_text.AccessibleText
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.accessible_text.AccessibleText);
  }

  mixin AccessibleTextT!();
  mixin gid.gtk4.accessible_mixin.AccessibleT!();
}
