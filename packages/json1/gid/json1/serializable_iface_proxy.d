/// Module for [SerializableIfaceProxy] interface proxy object
module gid.json1.serializable_iface_proxy;

import gid.gobject2.object;
import gid.json1.serializable;
import gid.json1.serializable_mixin;

/// Proxy object for [gid.json1.serializable.Serializable] interface when a GObject has no applicable D binding
class SerializableIfaceProxy : IfaceProxy, gid.json1.serializable.Serializable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.json1.serializable.Serializable);
  }

  mixin SerializableT!();
}
