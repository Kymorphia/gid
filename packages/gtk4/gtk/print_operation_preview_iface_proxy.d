/// Module for [PrintOperationPreviewIfaceProxy] interface proxy object
module gtk.print_operation_preview_iface_proxy;

import gobject.object;
import gtk.print_operation_preview;
import gtk.print_operation_preview_mixin;

/// Proxy object for [gtk.print_operation_preview.PrintOperationPreview] interface when a GObject has no applicable D binding
class PrintOperationPreviewIfaceProxy : IfaceProxy, gtk.print_operation_preview.PrintOperationPreview
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.print_operation_preview.PrintOperationPreview);
  }

  mixin PrintOperationPreviewT!();
}
