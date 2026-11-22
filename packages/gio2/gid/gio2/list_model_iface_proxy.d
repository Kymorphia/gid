/// Module for [ListModelIfaceProxy] interface proxy object
module gid.gio2.list_model_iface_proxy;

import gid.gobject2.object;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;

/// Proxy object for [gid.gio2.list_model.ListModel] interface when a GObject has no applicable D binding
class ListModelIfaceProxy : IfaceProxy, gid.gio2.list_model.ListModel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.list_model.ListModel);
  }

  mixin ListModelT!();
}
