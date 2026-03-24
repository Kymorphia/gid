/// Module for [WebsitePolicies] class
module webkit.website_policies;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    View specific website policies.
    
    WebKitWebsitePolicies allows you to configure per-page policies,
    currently only autoplay policies are supported.
*/
class WebsitePolicies : gobject.object.ObjectWrap
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
    return cast(void function())webkit_website_policies_get_type != &gidSymbolNotFound ? webkit_website_policies_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsitePolicies self()
  {
    return this;
  }

  /**
  Get builder for [webkit.website_policies.WebsitePolicies]
  Returns: New builder object
  */
  static WebsitePoliciesGidBuilder builder()
  {
    return new WebsitePoliciesGidBuilder;
  }

  /**
      Get `autoplay` property.
      Returns: The #WebKitAutoplayPolicy of #WebKitWebsitePolicies.
  */
  @property webkit.types.AutoplayPolicy autoplay()
  {
    return gobject.object.ObjectWrap.getProperty!(webkit.types.AutoplayPolicy)("autoplay");
  }

  /**
      Create a new #WebKitWebsitePolicies.
      Returns: the newly created #WebKitWebsitePolicies
  */
  this()
  {
    WebKitWebsitePolicies* _cretval;
    _cretval = webkit_website_policies_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the #WebKitWebsitePolicies:autoplay property.
      Returns: #WebKitAutoplayPolicy
  */
  webkit.types.AutoplayPolicy getAutoplayPolicy()
  {
    WebKitAutoplayPolicy _cretval;
    _cretval = webkit_website_policies_get_autoplay_policy(cast(WebKitWebsitePolicies*)this._cPtr);
    webkit.types.AutoplayPolicy _retval = cast(webkit.types.AutoplayPolicy)_cretval;
    return _retval;
  }
}

class WebsitePoliciesGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `autoplay` property.
      Params:
        propval = The #WebKitAutoplayPolicy of #WebKitWebsitePolicies.
      Returns: Builder instance for fluent chaining
  */
  T autoplay(webkit.types.AutoplayPolicy propval)
  {
    return setProperty("autoplay", propval);
  }
}

/// Fluent builder for [webkit.website_policies.WebsitePolicies]
final class WebsitePoliciesGidBuilder : WebsitePoliciesGidBuilderImpl!WebsitePoliciesGidBuilder
{
  WebsitePolicies build()
  {
    return new WebsitePolicies(cast(void*)createGObject(WebsitePolicies._getGType), Yes.Take);
  }
}
