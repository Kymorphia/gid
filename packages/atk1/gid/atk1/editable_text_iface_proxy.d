/// Module for [EditableTextIfaceProxy] interface proxy object
module gid.atk1.editable_text_iface_proxy;

import gid.gobject2.object;
import gid.atk1.editable_text;
import gid.atk1.editable_text_mixin;

/// Proxy object for [gid.atk1.editable_text.EditableText] interface when a GObject has no applicable D binding
class EditableTextIfaceProxy : IfaceProxy, gid.atk1.editable_text.EditableText
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.editable_text.EditableText);
  }

  mixin EditableTextT!();
}
