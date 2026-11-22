/// Module for [WebsitePolicies] class
module gid.webkit6.website_policies;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    View specific website policies.
    
    WebKitWebsitePolicies allows you to configure per-page policies,
    currently only autoplay policies are supported.
*/
class WebsitePolicies : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_website_policies_get_type != &gidSymbolNotFound ? webkit_website_policies_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebsitePolicies";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsitePolicies self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.website_policies.WebsitePolicies]
      Returns: New builder object
  */
  static WebsitePoliciesGidBuilder builder() nothrow
  {
    return new WebsitePoliciesGidBuilder;
  }

  /**
      Get `autoplay` property.
      Returns: The #WebKitAutoplayPolicy of #WebKitWebsitePolicies.
  */
  @property gid.webkit6.types.AutoplayPolicy autoplay() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.webkit6.types.AutoplayPolicy)("autoplay");
  }

  /**
      Create a new #WebKitWebsitePolicies.
      Returns: the newly created #WebKitWebsitePolicies
  */
  this() nothrow
  {
    WebKitWebsitePolicies* _cretval;
    _cretval = webkit_website_policies_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the #WebKitWebsitePolicies:autoplay property.
      Returns: #WebKitAutoplayPolicy
  */
  gid.webkit6.types.AutoplayPolicy getAutoplayPolicy() nothrow
  {
    WebKitAutoplayPolicy _cretval;
    _cretval = webkit_website_policies_get_autoplay_policy(cast(WebKitWebsitePolicies*)this._cPtr);
    gid.webkit6.types.AutoplayPolicy _retval = cast(gid.webkit6.types.AutoplayPolicy)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.website_policies.WebsitePolicies]
class WebsitePoliciesGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `autoplay` property.
      Params:
        propval = The #WebKitAutoplayPolicy of #WebKitWebsitePolicies.
      Returns: Builder instance for fluent chaining
  */
  T autoplay(gid.webkit6.types.AutoplayPolicy propval) nothrow
  {
    return setProperty("autoplay", propval);
  }
}

/// Fluent builder for [gid.webkit6.website_policies.WebsitePolicies]
final class WebsitePoliciesGidBuilder : WebsitePoliciesGidBuilderImpl!WebsitePoliciesGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsitePolicies build() nothrow
  {
    return new WebsitePolicies(cast(void*)createGObject(WebsitePolicies._getGType), Yes.Take);
  }
}
