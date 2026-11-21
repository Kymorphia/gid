/// Module for [XRPermissionRequest] class
module gid.webkit6.xrpermission_request;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.permission_request;
import gid.webkit6.permission_request_mixin;
import gid.webkit6.security_origin;
import gid.webkit6.types;

/**
    A permission request for accessing virtual reality (VR) and
    augmented reality (AR) devices, including sensors and head-mounted
    displays.
    
    WebKitXRPermissionRequest represents a request for permission to
    decide whether WebKit can initialize an XR session through the
    WebXR API.
    
    When a WebKitXRPermissionRequest is not handled by the user,
    it is denied by default.
*/
class XRPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
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
    return cast(void function())webkit_xr_permission_request_get_type != &gidSymbolNotFound ? webkit_xr_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitXRPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override XRPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.xrpermission_request.XRPermissionRequest]
      Returns: New builder object
  */
  static XRPermissionRequestGidBuilder builder() nothrow
  {
    return new XRPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();

  /**
      Gets the optional features that need user consent.
      
      These features can be granted by calling
      [gid.webkit6.xrpermission_request.XRPermissionRequest.setGrantedOptionalFeatures]
      before allowing the request with [gid.webkit6.permission_request.PermissionRequest.allow].
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  gid.webkit6.types.XRSessionFeatures getConsentOptionalFeatures() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_consent_optional_features(cast(WebKitXRPermissionRequest*)this._cPtr);
    gid.webkit6.types.XRSessionFeatures _retval = cast(gid.webkit6.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the required features that need user consent.
      
      These features are automatically granted if the request is allowed with
      [gid.webkit6.permission_request.PermissionRequest.allow].
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  gid.webkit6.types.XRSessionFeatures getConsentRequiredFeatures() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_consent_required_features(cast(WebKitXRPermissionRequest*)this._cPtr);
    gid.webkit6.types.XRSessionFeatures _retval = cast(gid.webkit6.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the features requested by the origin for the XR device, which
      are either granted by default or have been explicitly granted by
      the user.
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  gid.webkit6.types.XRSessionFeatures getGrantedFeatures() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_granted_features(cast(WebKitXRPermissionRequest*)this._cPtr);
    gid.webkit6.types.XRSessionFeatures _retval = cast(gid.webkit6.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the full set of optional features requested by the web application.
      
      This includes both already granted features and those requiring consent.
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  gid.webkit6.types.XRSessionFeatures getOptionalFeaturesRequested() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_optional_features_requested(cast(WebKitXRPermissionRequest*)this._cPtr);
    gid.webkit6.types.XRSessionFeatures _retval = cast(gid.webkit6.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the full set of required features requested by the web application.
      
      This includes both already granted features and those requiring consent.
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  gid.webkit6.types.XRSessionFeatures getRequiredFeaturesRequested() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_required_features_requested(cast(WebKitXRPermissionRequest*)this._cPtr);
    gid.webkit6.types.XRSessionFeatures _retval = cast(gid.webkit6.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the security origin that initiated the permission request.
      Returns: the #WebKitSecurityOrigin that initiated the request
  */
  gid.webkit6.security_origin.SecurityOrigin getSecurityOrigin() nothrow
  {
    WebKitSecurityOrigin* _cretval;
    _cretval = webkit_xr_permission_request_get_security_origin(cast(WebKitXRPermissionRequest*)this._cPtr);
    auto _retval = _cretval ? new gid.webkit6.security_origin.SecurityOrigin(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the session mode for which permission is being requested.
      Returns: a #WebKitXRSessionMode
  */
  gid.webkit6.types.XRSessionMode getSessionMode() nothrow
  {
    WebKitXRSessionMode _cretval;
    _cretval = webkit_xr_permission_request_get_session_mode(cast(WebKitXRPermissionRequest*)this._cPtr);
    gid.webkit6.types.XRSessionMode _retval = cast(gid.webkit6.types.XRSessionMode)_cretval;
    return _retval;
  }

  /**
      Sets which optional features should be granted if the permission request is allowed.
      
      This function should be called with a subset of the features from
      [gid.webkit6.xrpermission_request.XRPermissionRequest.getConsentOptionalFeatures] before calling
      [gid.webkit6.permission_request.PermissionRequest.allow]. If the request is denied, no features are
      granted, regardless of what is set here.
  
      Params:
        granted = granted features
  */
  void setGrantedOptionalFeatures(gid.webkit6.types.XRSessionFeatures granted) nothrow
  {
    webkit_xr_permission_request_set_granted_optional_features(cast(WebKitXRPermissionRequest*)this._cPtr, granted);
  }
}

/// Fluent builder implementation template for [gid.webkit6.xrpermission_request.XRPermissionRequest]
class XRPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.xrpermission_request.XRPermissionRequest]
final class XRPermissionRequestGidBuilder : XRPermissionRequestGidBuilderImpl!XRPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  XRPermissionRequest build() nothrow
  {
    return new XRPermissionRequest(cast(void*)createGObject(XRPermissionRequest._getGType), Yes.Take);
  }
}
