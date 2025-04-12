/// Module for [GeolocationPermissionRequest] class
module webkit.geolocation_permission_request;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for sharing the user's location.
    
    WebKitGeolocationPermissionRequest represents a request for
    permission to decide whether WebKit should provide the user's
    location to a website when requested through the Geolocation API.
    
    When a WebKitGeolocationPermissionRequest is not handled by the user,
    it is denied by default.
    
    When embedding web views in your application, you *must* configure an
    application identifier to allow web content to use geolocation services.
    The identifier *must* match the name of the `.desktop` file which describes
    the application, sans the suffix.
    
    If your application uses #GApplication (or any subclass like
    #GtkApplication), WebKit will automatically use the identifier returned by
    [gio.application.Application.getApplicationId]. This is the recommended approach for
    enabling geolocation in applications.
    
    If an identifier cannot be obtained through #GApplication, the value
    returned by [glib.global.getPrgname] will be used instead as a fallback. For
    programs which cannot use #GApplication, calling [glib.global.setPrgname] early
    during initialization is needed when the name of the executable on disk
    does not match the name of a valid `.desktop` file.
*/
class GeolocationPermissionRequest : gobject.object.ObjectG, webkit.permission_request.PermissionRequest
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_geolocation_permission_request_get_type != &gidSymbolNotFound ? webkit_geolocation_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GeolocationPermissionRequest self()
  {
    return this;
  }

  mixin PermissionRequestT!();
}
