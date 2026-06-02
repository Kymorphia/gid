/// Module for [SessionFeature] interface
module soup.session_feature;

public import gid.basictypes;
public import soup.session_feature_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    Interface for miscellaneous [soup.session.Session] features.
    
    #SoupSessionFeature is the interface used by classes that extend
    the functionality of a [soup.session.Session]. Some features like HTTP
    authentication handling are implemented internally via
    [soup.session_feature.SessionFeature]s. Other features can be added to the session
    by the application. (Eg, [soup.logger.Logger], [soup.cookie_jar.CookieJar].)
    
    See [soup.session.Session.addFeature], etc, to add a feature to a session.
*/
interface SessionFeature
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_session_feature_get_type != &gidSymbolNotFound ? soup_session_feature_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [soup.session_feature.SessionFeature]
interface SessionFeatureGidBuilderImpl(T)
{
}
