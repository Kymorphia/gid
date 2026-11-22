/// Module for [EditableIfaceProxy] interface proxy object
module gid.gtk4.editable_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.editable;
import gid.gtk4.editable_mixin;

/// Proxy object for [gid.gtk4.editable.Editable] interface when a GObject has no applicable D binding
class EditableIfaceProxy : IfaceProxy, gid.gtk4.editable.Editable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.editable.Editable);
  }

  mixin EditableT!();
}
