/// Module for [SelectionModelIfaceProxy] interface proxy object
module gid.gtk4.selection_model_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.selection_model;
import gid.gtk4.selection_model_mixin;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;

/// Proxy object for [gid.gtk4.selection_model.SelectionModel] interface when a GObject has no applicable D binding
class SelectionModelIfaceProxy : IfaceProxy, gid.gtk4.selection_model.SelectionModel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.selection_model.SelectionModel);
  }

  mixin SelectionModelT!();
  mixin gid.gio2.list_model_mixin.ListModelT!();
}
