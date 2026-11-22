/// Module for [SessionFeature] interface mixin
module gid.soup3.session_feature_mixin;

public import gid.core.basictypes;
public import gid.soup3.session_feature_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.soup3.c.functions;
public import gid.soup3.c.types;
public import gid.soup3.types;

/**
    Interface for miscellaneous [gid.soup3.session.Session] features.
    
    [gid.soup3.session_feature.SessionFeature] is the interface used by classes that extend
    the functionality of a [gid.soup3.session.Session]. Some features like HTTP
    authentication handling are implemented internally via
    [gid.soup3.session_feature.SessionFeature]s. Other features can be added to the session
    by the application. (Eg, [gid.soup3.logger.Logger], [gid.soup3.cookie_jar.CookieJar].)
    
    See [gid.soup3.session.Session.addFeature], etc, to add a feature to a session.
*/
template SessionFeatureT()
{
}

/// Fluent builder implementation template for [gid.soup3.session_feature.SessionFeature]
template SessionFeatureGidBuilderT()
{
}
