/// Module for [PolicyDecision] class
module webkit.policy_decision;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.website_policies;

/**
    A pending policy decision.
    
    Often WebKit allows the client to decide the policy for certain
    operations. For instance, a client may want to open a link in a new
    tab, block a navigation entirely, query the user or trigger a download
    instead of a navigation. In these cases WebKit will fire the
    #WebKitWebView::decide-policy signal with a #WebKitPolicyDecision
    object. If the signal handler does nothing, WebKit will act as if
    [webkit.policy_decision.PolicyDecision.use] was called as soon as signal handling
    completes. To make a policy decision asynchronously, simply increment
    the reference count of the #WebKitPolicyDecision object.
*/
class PolicyDecision : gobject.object.ObjectWrap
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
    return cast(void function())webkit_policy_decision_get_type != &gidSymbolNotFound ? webkit_policy_decision_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PolicyDecision self()
  {
    return this;
  }

  /**
  Get builder for [webkit.policy_decision.PolicyDecision]
  Returns: New builder object
  */
  static PolicyDecisionGidBuilder builder()
  {
    return new PolicyDecisionGidBuilder;
  }

  /**
      Spawn a download from this decision.
  */
  void download()
  {
    webkit_policy_decision_download(cast(WebKitPolicyDecision*)this._cPtr);
  }

  /**
      #WebKitResponsePolicyDecision, this would cancel the request.
      
      Ignore the action which triggered this decision. For instance, for a
      #WebKitResponsePolicyDecision, this would cancel the request.
  */
  void ignore()
  {
    webkit_policy_decision_ignore(cast(WebKitPolicyDecision*)this._cPtr);
  }

  /**
      Accept the action which triggered this decision.
  */
  void use()
  {
    webkit_policy_decision_use(cast(WebKitPolicyDecision*)this._cPtr);
  }

  /**
      Accept the navigation action and continue with provided policies.
      
      Accept the navigation action which triggered this decision, and
      continue with policies affecting all subsequent loads of resources
      in the origin associated with the accepted navigation action.
      
      For example, a navigation decision to a video sharing website may
      be accepted under the priviso no movies are allowed to autoplay. The
      autoplay policy in this case would be set in the policies.
  
      Params:
        policies = a #WebKitWebsitePolicies
  */
  void useWithPolicies(webkit.website_policies.WebsitePolicies policies)
  {
    webkit_policy_decision_use_with_policies(cast(WebKitPolicyDecision*)this._cPtr, policies ? cast(WebKitWebsitePolicies*)policies._cPtr(No.Dup) : null);
  }
}

class PolicyDecisionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [webkit.policy_decision.PolicyDecision]
final class PolicyDecisionGidBuilder : PolicyDecisionGidBuilderImpl!PolicyDecisionGidBuilder
{
  PolicyDecision build()
  {
    return new PolicyDecision(cast(void*)createGObject(PolicyDecision._getGType), No.Take);
  }
}
