/// Module for [PermissionRequestIfaceProxy] interface proxy object
module webkit.permission_request_iface_proxy;

import gobject.object;
import webkit.permission_request;
import webkit.permission_request_mixin;

/// Proxy object for [webkit.permission_request.PermissionRequest] interface when a GObject has no applicable D binding
class PermissionRequestIfaceProxy : IfaceProxy, webkit.permission_request.PermissionRequest
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(webkit.permission_request.PermissionRequest);
  }

  mixin PermissionRequestT!();
}
