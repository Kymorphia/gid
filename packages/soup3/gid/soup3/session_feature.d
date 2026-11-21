/// Module for [SessionFeature] interface
module gid.soup3.session_feature;

public import gid.core.basictypes;
public import gid.soup3.session_feature_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    Interface for miscellaneous [gid.soup3.session.Session] features.
    
    [gid.soup3.session_feature.SessionFeature] is the interface used by classes that extend
    the functionality of a [gid.soup3.session.Session]. Some features like HTTP
    authentication handling are implemented internally via
    [gid.soup3.session_feature.SessionFeature]s. Other features can be added to the session
    by the application. (Eg, [gid.soup3.logger.Logger], [gid.soup3.cookie_jar.CookieJar].)
    
    See [gid.soup3.session.Session.addFeature], etc, to add a feature to a session.
*/
interface SessionFeature : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_session_feature_get_type != &gidSymbolNotFound ? soup_session_feature_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gid.soup3.session_feature.SessionFeature]
interface SessionFeatureGidBuilderImpl(T)
{
}
