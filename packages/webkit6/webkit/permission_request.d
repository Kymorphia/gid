/// Module for [PermissionRequest] interface
module webkit.permission_request;

public import webkit.permission_request_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A permission request.
    
    There are situations where an embedder would need to ask the user
    for permission to do certain types of operations, such as switching
    to fullscreen mode or reporting the user's location through the
    standard Geolocation API. In those cases, WebKit will emit a
    #WebKitWebView::permission-request signal with a
    #WebKitPermissionRequest object attached to it.
*/
interface PermissionRequest
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_permission_request_get_type != &gidSymbolNotFound ? webkit_permission_request_get_type() : cast(GType)0;
  }

  /**
      Allow the action which triggered this request.
  */
  void allow();

  /**
      Deny the action which triggered this request.
  */
  void deny();
}

/// Fluent builder implementation template for [webkit.permission_request.PermissionRequest]
interface PermissionRequestGidBuilderImpl(T)
{
}
