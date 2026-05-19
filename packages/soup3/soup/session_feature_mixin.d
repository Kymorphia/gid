/// Module for [SessionFeature] interface mixin
module soup.session_feature_mixin;

public import gid.basictypes;
public import soup.session_feature_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import soup.c.functions;
public import soup.c.types;
public import soup.types;

/**
    Interface for miscellaneous [soup.session.Session] features.
    
    #SoupSessionFeature is the interface used by classes that extend
    the functionality of a [soup.session.Session]. Some features like HTTP
    authentication handling are implemented internally via
    [soup.session_feature.SessionFeature]s. Other features can be added to the session
    by the application. (Eg, [soup.logger.Logger], [soup.cookie_jar.CookieJar].)
    
    See [soup.session.Session.addFeature], etc, to add a feature to a session.
*/
template SessionFeatureT()
{
}

/// Fluent builder implementation template for [soup.session_feature.SessionFeature]
template SessionFeatureGidBuilderT()
{
}
