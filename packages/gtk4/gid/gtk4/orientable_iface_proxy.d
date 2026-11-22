/// Module for [OrientableIfaceProxy] interface proxy object
module gid.gtk4.orientable_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;

/// Proxy object for [gid.gtk4.orientable.Orientable] interface when a GObject has no applicable D binding
class OrientableIfaceProxy : IfaceProxy, gid.gtk4.orientable.Orientable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.orientable.Orientable);
  }

  mixin OrientableT!();
}
