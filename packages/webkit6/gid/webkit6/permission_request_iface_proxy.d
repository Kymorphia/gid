/// Module for [PermissionRequestIfaceProxy] interface proxy object
module gid.webkit6.permission_request_iface_proxy;

import gid.gobject2.object;
import gid.webkit6.permission_request;
import gid.webkit6.permission_request_mixin;

/// Proxy object for [gid.webkit6.permission_request.PermissionRequest] interface when a GObject has no applicable D binding
class PermissionRequestIfaceProxy : IfaceProxy, gid.webkit6.permission_request.PermissionRequest
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.webkit6.permission_request.PermissionRequest);
  }

  mixin PermissionRequestT!();
}
