/// Module for [ResponsePolicyDecision] class
module webkit.response_policy_decision;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.policy_decision;
import webkit.types;
import webkit.urirequest;
import webkit.uriresponse;

/**
    A policy decision for resource responses.
    
    WebKitResponsePolicyDecision represents a policy decision for a
    resource response, whether from the network or the local system.
    A very common use case for these types of decision is deciding
    whether or not to download a particular resource or to load it
    normally.
*/
class ResponsePolicyDecision : webkit.policy_decision.PolicyDecision
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_response_policy_decision_get_type != &gidSymbolNotFound ? webkit_response_policy_decision_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ResponsePolicyDecision self()
  {
    return this;
  }

  /**
      Get `request` property.
      Returns: This property contains the #WebKitURIRequest associated with this
      policy decision.
  */
  @property webkit.urirequest.URIRequest request()
  {
    return getRequest();
  }

  /**
      Get `response` property.
      Returns: This property contains the #WebKitURIResponse associated with this
      policy decision.
  */
  @property webkit.uriresponse.URIResponse response()
  {
    return getResponse();
  }

  /**
      Return the #WebKitURIRequest associated with the response decision.
      
      Modifications to the returned object are <emphasis>not</emphasis> taken
      into account when the request is sent over the network, and is intended
      only to aid in evaluating whether a response decision should be taken or
      not. To modify requests before they are sent over the network the
      #WebKitPage::send-request signal can be used instead.
      Returns: The URI request that is associated with this policy decision.
  */
  webkit.urirequest.URIRequest getRequest()
  {
    WebKitURIRequest* _cretval;
    _cretval = webkit_response_policy_decision_get_request(cast(WebKitResponsePolicyDecision*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.urirequest.URIRequest)(cast(WebKitURIRequest*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #WebKitResponsePolicyDecision:response property.
      Returns: The URI response that is associated with this policy decision.
  */
  webkit.uriresponse.URIResponse getResponse()
  {
    WebKitURIResponse* _cretval;
    _cretval = webkit_response_policy_decision_get_response(cast(WebKitResponsePolicyDecision*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.uriresponse.URIResponse)(cast(WebKitURIResponse*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the request is the main frame main resource
      Returns: true if the request is the main frame main resouce or false otherwise
  */
  bool isMainFrameMainResource()
  {
    bool _retval;
    _retval = cast(bool)webkit_response_policy_decision_is_main_frame_main_resource(cast(WebKitResponsePolicyDecision*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the MIME type of the response can be displayed in the #WebKitWebView.
      
      Gets whether the MIME type of the response can be displayed in the #WebKitWebView
      that triggered this policy decision request. See also [webkit.web_view.WebView.canShowMimeType].
      Returns: true if the MIME type of the response is supported or false otherwise
  */
  bool isMimeTypeSupported()
  {
    bool _retval;
    _retval = cast(bool)webkit_response_policy_decision_is_mime_type_supported(cast(WebKitResponsePolicyDecision*)this._cPtr);
    return _retval;
  }
}
