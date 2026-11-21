/// Module for [TagSetterIfaceProxy] interface proxy object
module gid.gst1.tag_setter_iface_proxy;

import gid.gobject2.object;
import gid.gst1.tag_setter;
import gid.gst1.tag_setter_mixin;

/// Proxy object for [gid.gst1.tag_setter.TagSetter] interface when a GObject has no applicable D binding
class TagSetterIfaceProxy : IfaceProxy, gid.gst1.tag_setter.TagSetter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gst1.tag_setter.TagSetter);
  }

  mixin TagSetterT!();
}
