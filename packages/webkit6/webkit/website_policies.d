/// Module for [WebsitePolicies] class
module webkit.website_policies;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    View specific website policies.
    
    WebKitWebsitePolicies allows you to configure per-page policies,
    currently only autoplay policies are supported.
*/
class WebsitePolicies : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_website_policies_get_type != &gidSymbolNotFound ? webkit_website_policies_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsitePolicies self()
  {
    return this;
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
    _cretval = webkit_website_policies_get_autoplay_policy(cast(WebKitWebsitePolicies*)cPtr);
    webkit.types.AutoplayPolicy _retval = cast(webkit.types.AutoplayPolicy)_cretval;
    return _retval;
  }
}
