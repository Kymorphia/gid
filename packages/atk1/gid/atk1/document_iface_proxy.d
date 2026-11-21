/// Module for [DocumentIfaceProxy] interface proxy object
module gid.atk1.document_iface_proxy;

import gid.gobject2.object;
import gid.atk1.document;
import gid.atk1.document_mixin;

/// Proxy object for [gid.atk1.document.Document] interface when a GObject has no applicable D binding
class DocumentIfaceProxy : IfaceProxy, gid.atk1.document.Document
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.document.Document);
  }

  mixin DocumentT!();
}
