/// Module for [WebsiteDataAccessPermissionRequest] class
module gid.webkit6.website_data_access_permission_request;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.permission_request;
import gid.webkit6.permission_request_mixin;
import gid.webkit6.types;

/**
    A permission request for accessing website data from third-party domains.
    
    WebKitWebsiteDataAccessPermissionRequest represents a request for
    permission to allow a third-party domain access its cookies.
    
    When a WebKitWebsiteDataAccessPermissionRequest is not handled by the user,
    it is denied by default.
*/
class WebsiteDataAccessPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_website_data_access_permission_request_get_type != &gidSymbolNotFound ? webkit_website_data_access_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebsiteDataAccessPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsiteDataAccessPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.website_data_access_permission_request.WebsiteDataAccessPermissionRequest]
      Returns: New builder object
  */
  static WebsiteDataAccessPermissionRequestGidBuilder builder() nothrow
  {
    return new WebsiteDataAccessPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();

  /**
      Get the current domain being browsed.
      Returns: the current domain name
  */
  string getCurrentDomain() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_access_permission_request_get_current_domain(cast(WebKitWebsiteDataAccessPermissionRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the domain requesting permission to access its cookies while browsing the current domain.
      Returns: the requesting domain name
  */
  string getRequestingDomain() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_access_permission_request_get_requesting_domain(cast(WebKitWebsiteDataAccessPermissionRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.website_data_access_permission_request.WebsiteDataAccessPermissionRequest]
class WebsiteDataAccessPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.website_data_access_permission_request.WebsiteDataAccessPermissionRequest]
final class WebsiteDataAccessPermissionRequestGidBuilder : WebsiteDataAccessPermissionRequestGidBuilderImpl!WebsiteDataAccessPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsiteDataAccessPermissionRequest build() nothrow
  {
    return new WebsiteDataAccessPermissionRequest(cast(void*)createGObject(WebsiteDataAccessPermissionRequest._getGType), Yes.Take);
  }
}
