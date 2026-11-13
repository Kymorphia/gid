/// Module for [XRPermissionRequest] class
module webkit.xrpermission_request;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.security_origin;
import webkit.types;

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
class XRPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
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
      Get builder for [webkit.xrpermission_request.XRPermissionRequest]
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
      [webkit.xrpermission_request.XRPermissionRequest.setGrantedOptionalFeatures]
      before allowing the request with [webkit.permission_request.PermissionRequest.allow].
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  webkit.types.XRSessionFeatures getConsentOptionalFeatures() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_consent_optional_features(cast(WebKitXRPermissionRequest*)this._cPtr);
    webkit.types.XRSessionFeatures _retval = cast(webkit.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the required features that need user consent.
      
      These features are automatically granted if the request is allowed with
      [webkit.permission_request.PermissionRequest.allow].
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  webkit.types.XRSessionFeatures getConsentRequiredFeatures() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_consent_required_features(cast(WebKitXRPermissionRequest*)this._cPtr);
    webkit.types.XRSessionFeatures _retval = cast(webkit.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the features requested by the origin for the XR device, which
      are either granted by default or have been explicitly granted by
      the user.
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  webkit.types.XRSessionFeatures getGrantedFeatures() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_granted_features(cast(WebKitXRPermissionRequest*)this._cPtr);
    webkit.types.XRSessionFeatures _retval = cast(webkit.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the full set of optional features requested by the web application.
      
      This includes both already granted features and those requiring consent.
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  webkit.types.XRSessionFeatures getOptionalFeaturesRequested() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_optional_features_requested(cast(WebKitXRPermissionRequest*)this._cPtr);
    webkit.types.XRSessionFeatures _retval = cast(webkit.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the full set of required features requested by the web application.
      
      This includes both already granted features and those requiring consent.
      Returns: a #WebKitXRSessionFeatures flag combination
  */
  webkit.types.XRSessionFeatures getRequiredFeaturesRequested() nothrow
  {
    WebKitXRSessionFeatures _cretval;
    _cretval = webkit_xr_permission_request_get_required_features_requested(cast(WebKitXRPermissionRequest*)this._cPtr);
    webkit.types.XRSessionFeatures _retval = cast(webkit.types.XRSessionFeatures)_cretval;
    return _retval;
  }

  /**
      Gets the security origin that initiated the permission request.
      Returns: the #WebKitSecurityOrigin that initiated the request
  */
  webkit.security_origin.SecurityOrigin getSecurityOrigin() nothrow
  {
    WebKitSecurityOrigin* _cretval;
    _cretval = webkit_xr_permission_request_get_security_origin(cast(WebKitXRPermissionRequest*)this._cPtr);
    auto _retval = _cretval ? new webkit.security_origin.SecurityOrigin(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the session mode for which permission is being requested.
      Returns: a #WebKitXRSessionMode
  */
  webkit.types.XRSessionMode getSessionMode() nothrow
  {
    WebKitXRSessionMode _cretval;
    _cretval = webkit_xr_permission_request_get_session_mode(cast(WebKitXRPermissionRequest*)this._cPtr);
    webkit.types.XRSessionMode _retval = cast(webkit.types.XRSessionMode)_cretval;
    return _retval;
  }

  /**
      Sets which optional features should be granted if the permission request is allowed.
      
      This function should be called with a subset of the features from
      [webkit.xrpermission_request.XRPermissionRequest.getConsentOptionalFeatures] before calling
      [webkit.permission_request.PermissionRequest.allow]. If the request is denied, no features are
      granted, regardless of what is set here.
  
      Params:
        granted = granted features
  */
  void setGrantedOptionalFeatures(webkit.types.XRSessionFeatures granted) nothrow
  {
    webkit_xr_permission_request_set_granted_optional_features(cast(WebKitXRPermissionRequest*)this._cPtr, granted);
  }
}

/// Fluent builder implementation template for [webkit.xrpermission_request.XRPermissionRequest]
class XRPermissionRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, webkit.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [webkit.xrpermission_request.XRPermissionRequest]
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
