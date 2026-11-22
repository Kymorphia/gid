/// Module for [PermissionRequest] interface mixin
module gid.webkit6.permission_request_mixin;

public import gid.core.basictypes;
public import gid.webkit6.permission_request_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.webkit6.c.functions;
public import gid.webkit6.c.types;
public import gid.webkit6.types;

/**
    A permission request.
    
    There are situations where an embedder would need to ask the user
    for permission to do certain types of operations, such as switching
    to fullscreen mode or reporting the user's location through the
    standard Geolocation API. In those cases, WebKit will emit a
    #WebKitWebView::permission-request signal with a
    #WebKitPermissionRequest object attached to it.
*/
template PermissionRequestT()
{

  /**
      Allow the action which triggered this request.
  */
  override void allow() nothrow
  {
    webkit_permission_request_allow(cast(WebKitPermissionRequest*)this._cPtr);
  }

  /**
      Deny the action which triggered this request.
  */
  override void deny() nothrow
  {
    webkit_permission_request_deny(cast(WebKitPermissionRequest*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.webkit6.permission_request.PermissionRequest]
template PermissionRequestGidBuilderT()
{
}
