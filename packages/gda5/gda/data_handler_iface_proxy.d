/// Module for [DataHandlerIfaceProxy] interface proxy object
module gda.data_handler_iface_proxy;

import gobject.object;
import gda.data_handler;
import gda.data_handler_mixin;

/// Proxy object for [gda.data_handler.DataHandler] interface when a GObject has no applicable D binding
class DataHandlerIfaceProxy : IfaceProxy, gda.data_handler.DataHandler
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gda.data_handler.DataHandler);
  }

  mixin DataHandlerT!();
}
