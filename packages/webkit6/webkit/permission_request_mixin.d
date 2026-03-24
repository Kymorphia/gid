/// Module for [PermissionRequest] interface mixin
module webkit.permission_request_mixin;

public import webkit.permission_request_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import webkit.c.functions;
public import webkit.c.types;
public import webkit.types;

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
  override void allow()
  {
    webkit_permission_request_allow(cast(WebKitPermissionRequest*)this._cPtr);
  }

  /**
      Deny the action which triggered this request.
  */
  override void deny()
  {
    webkit_permission_request_deny(cast(WebKitPermissionRequest*)this._cPtr);
  }
}

template PermissionRequestGidBuilderT()
{
}
