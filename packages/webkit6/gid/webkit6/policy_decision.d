/// Module for [PolicyDecision] class
module gid.webkit6.policy_decision;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.website_policies;

/**
    A pending policy decision.
    
    Often WebKit allows the client to decide the policy for certain
    operations. For instance, a client may want to open a link in a new
    tab, block a navigation entirely, query the user or trigger a download
    instead of a navigation. In these cases WebKit will fire the
    #WebKitWebView::decide-policy signal with a #WebKitPolicyDecision
    object. If the signal handler does nothing, WebKit will act as if
    [gid.webkit6.policy_decision.PolicyDecision.use] was called as soon as signal handling
    completes. To make a policy decision asynchronously, simply increment
    the reference count of the #WebKitPolicyDecision object.
*/
class PolicyDecision : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_policy_decision_get_type != &gidSymbolNotFound ? webkit_policy_decision_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitPolicyDecision";
  }

  /** Returns `this`, for use in `with` statements. */
  override PolicyDecision self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.policy_decision.PolicyDecision]
      Returns: New builder object
  */
  static PolicyDecisionGidBuilder builder() nothrow
  {
    return new PolicyDecisionGidBuilder;
  }

  /**
      Spawn a download from this decision.
  */
  void download() nothrow
  {
    webkit_policy_decision_download(cast(WebKitPolicyDecision*)this._cPtr);
  }

  /**
      #WebKitResponsePolicyDecision, this would cancel the request.
      
      Ignore the action which triggered this decision. For instance, for a
      #WebKitResponsePolicyDecision, this would cancel the request.
  */
  void ignore() nothrow
  {
    webkit_policy_decision_ignore(cast(WebKitPolicyDecision*)this._cPtr);
  }

  /**
      Accept the action which triggered this decision.
  */
  void use() nothrow
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
  void useWithPolicies(gid.webkit6.website_policies.WebsitePolicies policies) nothrow
  {
    webkit_policy_decision_use_with_policies(cast(WebKitPolicyDecision*)this._cPtr, policies ? cast(WebKitWebsitePolicies*)policies._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.webkit6.policy_decision.PolicyDecision]
class PolicyDecisionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.policy_decision.PolicyDecision]
final class PolicyDecisionGidBuilder : PolicyDecisionGidBuilderImpl!PolicyDecisionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PolicyDecision build() nothrow
  {
    return new PolicyDecision(cast(void*)createGObject(PolicyDecision._getGType), Yes.Take);
  }
}
