/// Module for [RTSPExtensionIfaceProxy] interface proxy object
module gid.gstrtsp1.rtspextension_iface_proxy;

import gid.gobject2.object;
import gid.gstrtsp1.rtspextension;
import gid.gstrtsp1.rtspextension_mixin;

/// Proxy object for [gid.gstrtsp1.rtspextension.RTSPExtension] interface when a GObject has no applicable D binding
class RTSPExtensionIfaceProxy : IfaceProxy, gid.gstrtsp1.rtspextension.RTSPExtension
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstrtsp1.rtspextension.RTSPExtension);
  }

  mixin RTSPExtensionT!();
}
