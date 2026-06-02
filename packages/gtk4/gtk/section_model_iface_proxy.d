/// Module for [SectionModelIfaceProxy] interface proxy object
module gtk.section_model_iface_proxy;

import gobject.object;
import gtk.section_model;
import gtk.section_model_mixin;

/// Proxy object for [gtk.section_model.SectionModel] interface when a GObject has no applicable D binding
class SectionModelIfaceProxy : IfaceProxy, gtk.section_model.SectionModel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.section_model.SectionModel);
  }

  mixin SectionModelT!();
}
