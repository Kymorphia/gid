/// Module for [SerializableIfaceProxy] interface proxy object
module json.serializable_iface_proxy;

import gobject.object;
import json.serializable;
import json.serializable_mixin;

/// Proxy object for [json.serializable.Serializable] interface when a GObject has no applicable D binding
class SerializableIfaceProxy : IfaceProxy, json.serializable.Serializable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(json.serializable.Serializable);
  }

  mixin SerializableT!();
}
