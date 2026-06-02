/// Module for [TagSetterIfaceProxy] interface proxy object
module gst.tag_setter_iface_proxy;

import gobject.object;
import gst.tag_setter;
import gst.tag_setter_mixin;

/// Proxy object for [gst.tag_setter.TagSetter] interface when a GObject has no applicable D binding
class TagSetterIfaceProxy : IfaceProxy, gst.tag_setter.TagSetter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gst.tag_setter.TagSetter);
  }

  mixin TagSetterT!();
}
