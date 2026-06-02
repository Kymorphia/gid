/// Module for [DataModelIfaceProxy] interface proxy object
module gda.data_model_iface_proxy;

import gobject.object;
import gda.data_model;
import gda.data_model_mixin;

/// Proxy object for [gda.data_model.DataModel] interface when a GObject has no applicable D binding
class DataModelIfaceProxy : IfaceProxy, gda.data_model.DataModel
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gda.data_model.DataModel);
  }

  mixin DataModelT!();
}
