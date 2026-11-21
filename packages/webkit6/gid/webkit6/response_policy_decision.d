/// Module for [ResponsePolicyDecision] class
module gid.webkit6.response_policy_decision;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.policy_decision;
import gid.webkit6.types;
import gid.webkit6.urirequest;
import gid.webkit6.uriresponse;

/**
    A policy decision for resource responses.
    
    WebKitResponsePolicyDecision represents a policy decision for a
    resource response, whether from the network or the local system.
    A very common use case for these types of decision is deciding
    whether or not to download a particular resource or to load it
    normally.
*/
class ResponsePolicyDecision : gid.webkit6.policy_decision.PolicyDecision
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
    return cast(void function())webkit_response_policy_decision_get_type != &gidSymbolNotFound ? webkit_response_policy_decision_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitResponsePolicyDecision";
  }

  /** Returns `this`, for use in `with` statements. */
  override ResponsePolicyDecision self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.response_policy_decision.ResponsePolicyDecision]
      Returns: New builder object
  */
  static ResponsePolicyDecisionGidBuilder builder() nothrow
  {
    return new ResponsePolicyDecisionGidBuilder;
  }

  /**
      Get `request` property.
      Returns: This property contains the #WebKitURIRequest associated with this
        policy decision.
  */
  @property gid.webkit6.urirequest.URIRequest request() nothrow
  {
    return getRequest();
  }

  /**
      Get `response` property.
      Returns: This property contains the #WebKitURIResponse associated with this
        policy decision.
  */
  @property gid.webkit6.uriresponse.URIResponse response() nothrow
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
  gid.webkit6.urirequest.URIRequest getRequest() nothrow
  {
    WebKitURIRequest* _cretval;
    _cretval = webkit_response_policy_decision_get_request(cast(WebKitResponsePolicyDecision*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.urirequest.URIRequest)(cast(WebKitURIRequest*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #WebKitResponsePolicyDecision:response property.
      Returns: The URI response that is associated with this policy decision.
  */
  gid.webkit6.uriresponse.URIResponse getResponse() nothrow
  {
    WebKitURIResponse* _cretval;
    _cretval = webkit_response_policy_decision_get_response(cast(WebKitResponsePolicyDecision*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.uriresponse.URIResponse)(cast(WebKitURIResponse*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the request is the main frame main resource
      Returns: true if the request is the main frame main resouce or false otherwise
  */
  bool isMainFrameMainResource() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_response_policy_decision_is_main_frame_main_resource(cast(WebKitResponsePolicyDecision*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the MIME type of the response can be displayed in the #WebKitWebView.
      
      Gets whether the MIME type of the response can be displayed in the #WebKitWebView
      that triggered this policy decision request. See also [gid.webkit6.web_view.WebView.canShowMimeType].
      Returns: true if the MIME type of the response is supported or false otherwise
  */
  bool isMimeTypeSupported() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_response_policy_decision_is_mime_type_supported(cast(WebKitResponsePolicyDecision*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.response_policy_decision.ResponsePolicyDecision]
class ResponsePolicyDecisionGidBuilderImpl(T) : gid.webkit6.policy_decision.PolicyDecisionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.response_policy_decision.ResponsePolicyDecision]
final class ResponsePolicyDecisionGidBuilder : ResponsePolicyDecisionGidBuilderImpl!ResponsePolicyDecisionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ResponsePolicyDecision build() nothrow
  {
    return new ResponsePolicyDecision(cast(void*)createGObject(ResponsePolicyDecision._getGType), Yes.Take);
  }
}
