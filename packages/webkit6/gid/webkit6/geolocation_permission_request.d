/// Module for [GeolocationPermissionRequest] class
module gid.webkit6.geolocation_permission_request;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.permission_request;
import gid.webkit6.permission_request_mixin;
import gid.webkit6.types;

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
    [gid.gio2.application.Application.getApplicationId]. This is the recommended approach for
    enabling geolocation in applications.
    
    If an identifier cannot be obtained through #GApplication, the value
    returned by [gid.glib2.global.getPrgname] will be used instead as a fallback. For
    programs which cannot use #GApplication, calling [gid.glib2.global.setPrgname] early
    during initialization is needed when the name of the executable on disk
    does not match the name of a valid `.desktop` file.
*/
class GeolocationPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_geolocation_permission_request_get_type != &gidSymbolNotFound ? webkit_geolocation_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitGeolocationPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override GeolocationPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.geolocation_permission_request.GeolocationPermissionRequest]
      Returns: New builder object
  */
  static GeolocationPermissionRequestGidBuilder builder() nothrow
  {
    return new GeolocationPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.geolocation_permission_request.GeolocationPermissionRequest]
class GeolocationPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.geolocation_permission_request.GeolocationPermissionRequest]
final class GeolocationPermissionRequestGidBuilder : GeolocationPermissionRequestGidBuilderImpl!GeolocationPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GeolocationPermissionRequest build() nothrow
  {
    return new GeolocationPermissionRequest(cast(void*)createGObject(GeolocationPermissionRequest._getGType), Yes.Take);
  }
}
