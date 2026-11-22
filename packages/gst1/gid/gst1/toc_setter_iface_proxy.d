/// Module for [TocSetterIfaceProxy] interface proxy object
module gid.gst1.toc_setter_iface_proxy;

import gid.gobject2.object;
import gid.gst1.toc_setter;
import gid.gst1.toc_setter_mixin;

/// Proxy object for [gid.gst1.toc_setter.TocSetter] interface when a GObject has no applicable D binding
class TocSetterIfaceProxy : IfaceProxy, gid.gst1.toc_setter.TocSetter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gst1.toc_setter.TocSetter);
  }

  mixin TocSetterT!();
}
