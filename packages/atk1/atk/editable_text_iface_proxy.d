/// Module for [EditableTextIfaceProxy] interface proxy object
module atk.editable_text_iface_proxy;

import gobject.object;
import atk.editable_text;
import atk.editable_text_mixin;

/// Proxy object for [atk.editable_text.EditableText] interface when a GObject has no applicable D binding
class EditableTextIfaceProxy : IfaceProxy, atk.editable_text.EditableText
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.editable_text.EditableText);
  }

  mixin EditableTextT!();
}
