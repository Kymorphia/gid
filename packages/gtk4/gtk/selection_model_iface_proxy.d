/// Module for [SelectionModelIfaceProxy] interface proxy object
module gtk.selection_model_iface_proxy;

import gobject.object;
import gtk.selection_model;
import gtk.selection_model_mixin;

/// Proxy object for [gtk.selection_model.SelectionModel] interface when a GObject has no applicable D binding
class SelectionModelIfaceProxy : IfaceProxy, gtk.selection_model.SelectionModel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.selection_model.SelectionModel);
  }

  mixin SelectionModelT!();
}
