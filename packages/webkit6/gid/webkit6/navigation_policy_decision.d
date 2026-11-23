/// Module for [NavigationPolicyDecision] class
module gid.webkit6.navigation_policy_decision;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.navigation_action;
import gid.webkit6.policy_decision;
import gid.webkit6.types;

/**
    A policy decision for navigation actions.
    
    WebKitNavigationPolicyDecision represents a policy decision for events associated with
    navigations. If the value of #WebKitNavigationPolicyDecision:mouse-button is not 0, then
    the navigation was triggered by a mouse event.
*/
class NavigationPolicyDecision : gid.webkit6.policy_decision.PolicyDecision
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
    return cast(void function())webkit_navigation_policy_decision_get_type != &gidSymbolNotFound ? webkit_navigation_policy_decision_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitNavigationPolicyDecision";
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationPolicyDecision self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.navigation_policy_decision.NavigationPolicyDecision]
      Returns: New builder object
  */
  static NavigationPolicyDecisionGidBuilder builder() nothrow
  {
    return new NavigationPolicyDecisionGidBuilder;
  }

  /**
      Get `navigationAction` property.
      Returns: The #WebKitNavigationAction that triggered this policy decision.
  */
  @property gid.webkit6.navigation_action.NavigationAction navigationAction() nothrow
  {
    return getNavigationAction();
  }

  /**
      Gets the value of the #WebKitNavigationPolicyDecision:navigation-action property.
      Returns: The #WebKitNavigationAction triggering this policy decision.
  */
  gid.webkit6.navigation_action.NavigationAction getNavigationAction() nothrow
  {
    WebKitNavigationAction* _cretval;
    _cretval = webkit_navigation_policy_decision_get_navigation_action(cast(WebKitNavigationPolicyDecision*)this._cPtr);
    auto _retval = _cretval ? new gid.webkit6.navigation_action.NavigationAction(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.navigation_policy_decision.NavigationPolicyDecision]
class NavigationPolicyDecisionGidBuilderImpl(T) : gid.webkit6.policy_decision.PolicyDecisionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.navigation_policy_decision.NavigationPolicyDecision]
final class NavigationPolicyDecisionGidBuilder : NavigationPolicyDecisionGidBuilderImpl!NavigationPolicyDecisionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NavigationPolicyDecision build() nothrow
  {
    return new NavigationPolicyDecision(cast(void*)createGObject(NavigationPolicyDecision._getGType), Yes.Take);
  }
}
