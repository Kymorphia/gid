/// Module for [NavigationPolicyDecision] class
module webkit.navigation_policy_decision;

import gid.gid;
import gobject.gid_builder;
import webkit.c.functions;
import webkit.c.types;
import webkit.navigation_action;
import webkit.policy_decision;
import webkit.types;

/**
    A policy decision for navigation actions.
    
    WebKitNavigationPolicyDecision represents a policy decision for events associated with
    navigations. If the value of #WebKitNavigationPolicyDecision:mouse-button is not 0, then
    the navigation was triggered by a mouse event.
*/
class NavigationPolicyDecision : webkit.policy_decision.PolicyDecision
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
    return cast(void function())webkit_navigation_policy_decision_get_type != &gidSymbolNotFound ? webkit_navigation_policy_decision_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationPolicyDecision self()
  {
    return this;
  }

  /**
      Get builder for [webkit.navigation_policy_decision.NavigationPolicyDecision]
      Returns: New builder object
  */
  static NavigationPolicyDecisionGidBuilder builder()
  {
    return new NavigationPolicyDecisionGidBuilder;
  }

  /**
      Get `navigationAction` property.
      Returns: The #WebKitNavigationAction that triggered this policy decision.
  */
  @property webkit.navigation_action.NavigationAction navigationAction()
  {
    return getNavigationAction();
  }

  /**
      Gets the value of the #WebKitNavigationPolicyDecision:navigation-action property.
      Returns: The #WebKitNavigationAction triggering this policy decision.
  */
  webkit.navigation_action.NavigationAction getNavigationAction()
  {
    WebKitNavigationAction* _cretval;
    _cretval = webkit_navigation_policy_decision_get_navigation_action(cast(WebKitNavigationPolicyDecision*)this._cPtr);
    auto _retval = _cretval ? new webkit.navigation_action.NavigationAction(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [webkit.navigation_policy_decision.NavigationPolicyDecision]
class NavigationPolicyDecisionGidBuilderImpl(T) : webkit.policy_decision.PolicyDecisionGidBuilderImpl!T
{
}

/// Fluent builder for [webkit.navigation_policy_decision.NavigationPolicyDecision]
final class NavigationPolicyDecisionGidBuilder : NavigationPolicyDecisionGidBuilderImpl!NavigationPolicyDecisionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NavigationPolicyDecision build()
  {
    return new NavigationPolicyDecision(cast(void*)createGObject(NavigationPolicyDecision._getGType), No.Take);
  }
}
