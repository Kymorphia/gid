/// Module for [URIHandlerIfaceProxy] interface proxy object
module gid.gst1.urihandler_iface_proxy;

import gid.gobject2.object;
import gid.gst1.urihandler;
import gid.gst1.urihandler_mixin;

/// Proxy object for [gid.gst1.urihandler.URIHandler] interface when a GObject has no applicable D binding
class URIHandlerIfaceProxy : IfaceProxy, gid.gst1.urihandler.URIHandler
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gst1.urihandler.URIHandler);
  }

  mixin URIHandlerT!();
}
