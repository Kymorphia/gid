/// Module for [OrientableIfaceProxy] interface proxy object
module gid.gtk3.orientable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;

/// Proxy object for [gid.gtk3.orientable.Orientable] interface when a GObject has no applicable D binding
class OrientableIfaceProxy : IfaceProxy, gid.gtk3.orientable.Orientable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.orientable.Orientable);
  }

  mixin OrientableT!();
}
