/// Module for [PrintOperationPreviewIfaceProxy] interface proxy object
module gid.gtk4.print_operation_preview_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.print_operation_preview;
import gid.gtk4.print_operation_preview_mixin;

/// Proxy object for [gid.gtk4.print_operation_preview.PrintOperationPreview] interface when a GObject has no applicable D binding
class PrintOperationPreviewIfaceProxy : IfaceProxy, gid.gtk4.print_operation_preview.PrintOperationPreview
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.print_operation_preview.PrintOperationPreview);
  }

  mixin PrintOperationPreviewT!();
}
