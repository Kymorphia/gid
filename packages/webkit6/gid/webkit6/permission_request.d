/// Module for [PermissionRequest] interface
module gid.webkit6.permission_request;

public import gid.core.basictypes;
public import gid.webkit6.permission_request_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    A permission request.
    
    There are situations where an embedder would need to ask the user
    for permission to do certain types of operations, such as switching
    to fullscreen mode or reporting the user's location through the
    standard Geolocation API. In those cases, WebKit will emit a
    #WebKitWebView::permission-request signal with a
    #WebKitPermissionRequest object attached to it.
*/
@gidGir("PermissionRequest", "PermissionRequestInterface")
interface PermissionRequest : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
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

/// Fluent builder implementation template for [gid.webkit6.permission_request.PermissionRequest]
interface PermissionRequestGidBuilderImpl(T)
{
}
