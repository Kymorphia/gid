/// Module for [TreeModelIfaceProxy] interface proxy object
module gid.gtk3.tree_model_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.tree_model;
import gid.gtk3.tree_model_mixin;

/// Proxy object for [gid.gtk3.tree_model.TreeModel] interface when a GObject has no applicable D binding
class TreeModelIfaceProxy : IfaceProxy, gid.gtk3.tree_model.TreeModel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.tree_model.TreeModel);
  }

  mixin TreeModelT!();
}
