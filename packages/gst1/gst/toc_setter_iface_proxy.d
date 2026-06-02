/// Module for [TocSetterIfaceProxy] interface proxy object
module gst.toc_setter_iface_proxy;

import gobject.object;
import gst.toc_setter;
import gst.toc_setter_mixin;

/// Proxy object for [gst.toc_setter.TocSetter] interface when a GObject has no applicable D binding
class TocSetterIfaceProxy : IfaceProxy, gst.toc_setter.TocSetter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gst.toc_setter.TocSetter);
  }

  mixin TocSetterT!();
}
