/// C functions for soup3 library
module gid.soup3.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.soup3.c.types;
static import gid.soup3.c._gidlib_Soup;
public import gid.gio2.c.types;

private immutable LIBS = ["soup-3.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.soup3.c._gidlib_Soup.gidLibLinked;

// Auth
private alias c_soup_auth_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_get_typeFn c_soup_auth_get_type; ///
private alias c_soup_auth_newFn = extern(C) SoupAuth* function(GType type, SoupMessage* msg, const(char)* authHeader) nothrow;
__gshared c_soup_auth_newFn c_soup_auth_new; ///
private alias c_soup_auth_authenticateFn = extern(C) void function(SoupAuth* auth, const(char)* username, const(char)* password) nothrow;
__gshared c_soup_auth_authenticateFn c_soup_auth_authenticate; ///
private alias c_soup_auth_can_authenticateFn = extern(C) gboolean function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_can_authenticateFn c_soup_auth_can_authenticate; ///
private alias c_soup_auth_cancelFn = extern(C) void function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_cancelFn c_soup_auth_cancel; ///
private alias c_soup_auth_free_protection_spaceFn = extern(C) void function(SoupAuth* auth, GSList* space) nothrow;
__gshared c_soup_auth_free_protection_spaceFn c_soup_auth_free_protection_space; ///
private alias c_soup_auth_get_authorityFn = extern(C) const(char)* function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_get_authorityFn c_soup_auth_get_authority; ///
private alias c_soup_auth_get_authorizationFn = extern(C) char* function(SoupAuth* auth, SoupMessage* msg) nothrow;
__gshared c_soup_auth_get_authorizationFn c_soup_auth_get_authorization; ///
private alias c_soup_auth_get_infoFn = extern(C) char* function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_get_infoFn c_soup_auth_get_info; ///
private alias c_soup_auth_get_protection_spaceFn = extern(C) GSList* function(SoupAuth* auth, GUri* sourceUri) nothrow;
__gshared c_soup_auth_get_protection_spaceFn c_soup_auth_get_protection_space; ///
private alias c_soup_auth_get_realmFn = extern(C) const(char)* function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_get_realmFn c_soup_auth_get_realm; ///
private alias c_soup_auth_get_scheme_nameFn = extern(C) const(char)* function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_get_scheme_nameFn c_soup_auth_get_scheme_name; ///
private alias c_soup_auth_is_authenticatedFn = extern(C) gboolean function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_is_authenticatedFn c_soup_auth_is_authenticated; ///
private alias c_soup_auth_is_cancelledFn = extern(C) gboolean function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_is_cancelledFn c_soup_auth_is_cancelled; ///
private alias c_soup_auth_is_for_proxyFn = extern(C) gboolean function(SoupAuth* auth) nothrow;
__gshared c_soup_auth_is_for_proxyFn c_soup_auth_is_for_proxy; ///
private alias c_soup_auth_is_readyFn = extern(C) gboolean function(SoupAuth* auth, SoupMessage* msg) nothrow;
__gshared c_soup_auth_is_readyFn c_soup_auth_is_ready; ///
private alias c_soup_auth_updateFn = extern(C) gboolean function(SoupAuth* auth, SoupMessage* msg, const(char)* authHeader) nothrow;
__gshared c_soup_auth_updateFn c_soup_auth_update; ///

// AuthBasic
private alias c_soup_auth_basic_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_basic_get_typeFn c_soup_auth_basic_get_type; ///

// AuthDigest
private alias c_soup_auth_digest_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_digest_get_typeFn c_soup_auth_digest_get_type; ///

// AuthDomain
private alias c_soup_auth_domain_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_domain_get_typeFn c_soup_auth_domain_get_type; ///
private alias c_soup_auth_domain_acceptsFn = extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg) nothrow;
__gshared c_soup_auth_domain_acceptsFn c_soup_auth_domain_accepts; ///
private alias c_soup_auth_domain_add_pathFn = extern(C) void function(SoupAuthDomain* domain, const(char)* path) nothrow;
__gshared c_soup_auth_domain_add_pathFn c_soup_auth_domain_add_path; ///
private alias c_soup_auth_domain_challengeFn = extern(C) void function(SoupAuthDomain* domain, SoupServerMessage* msg) nothrow;
__gshared c_soup_auth_domain_challengeFn c_soup_auth_domain_challenge; ///
private alias c_soup_auth_domain_check_passwordFn = extern(C) gboolean function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password) nothrow;
__gshared c_soup_auth_domain_check_passwordFn c_soup_auth_domain_check_password; ///
private alias c_soup_auth_domain_coversFn = extern(C) gboolean function(SoupAuthDomain* domain, SoupServerMessage* msg) nothrow;
__gshared c_soup_auth_domain_coversFn c_soup_auth_domain_covers; ///
private alias c_soup_auth_domain_get_realmFn = extern(C) const(char)* function(SoupAuthDomain* domain) nothrow;
__gshared c_soup_auth_domain_get_realmFn c_soup_auth_domain_get_realm; ///
private alias c_soup_auth_domain_remove_pathFn = extern(C) void function(SoupAuthDomain* domain, const(char)* path) nothrow;
__gshared c_soup_auth_domain_remove_pathFn c_soup_auth_domain_remove_path; ///
private alias c_soup_auth_domain_set_filterFn = extern(C) void function(SoupAuthDomain* domain, SoupAuthDomainFilter filter, void* filterData, GDestroyNotify dnotify) nothrow;
__gshared c_soup_auth_domain_set_filterFn c_soup_auth_domain_set_filter; ///
private alias c_soup_auth_domain_set_generic_auth_callbackFn = extern(C) void function(SoupAuthDomain* domain, SoupAuthDomainGenericAuthCallback authCallback, void* authData, GDestroyNotify dnotify) nothrow;
__gshared c_soup_auth_domain_set_generic_auth_callbackFn c_soup_auth_domain_set_generic_auth_callback; ///

// AuthDomainBasic
private alias c_soup_auth_domain_basic_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_domain_basic_get_typeFn c_soup_auth_domain_basic_get_type; ///
private alias c_soup_auth_domain_basic_newFn = extern(C) SoupAuthDomain* function(const(char)* optname1,  ...) nothrow;
__gshared c_soup_auth_domain_basic_newFn c_soup_auth_domain_basic_new; ///
private alias c_soup_auth_domain_basic_set_auth_callbackFn = extern(C) void function(SoupAuthDomain* domain, SoupAuthDomainBasicAuthCallback callback, void* userData, GDestroyNotify dnotify) nothrow;
__gshared c_soup_auth_domain_basic_set_auth_callbackFn c_soup_auth_domain_basic_set_auth_callback; ///

// AuthDomainDigest
private alias c_soup_auth_domain_digest_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_domain_digest_get_typeFn c_soup_auth_domain_digest_get_type; ///
private alias c_soup_auth_domain_digest_newFn = extern(C) SoupAuthDomain* function(const(char)* optname1,  ...) nothrow;
__gshared c_soup_auth_domain_digest_newFn c_soup_auth_domain_digest_new; ///
private alias c_soup_auth_domain_digest_encode_passwordFn = extern(C) char* function(const(char)* username, const(char)* realm, const(char)* password) nothrow;
__gshared c_soup_auth_domain_digest_encode_passwordFn c_soup_auth_domain_digest_encode_password; ///
private alias c_soup_auth_domain_digest_set_auth_callbackFn = extern(C) void function(SoupAuthDomain* domain, SoupAuthDomainDigestAuthCallback callback, void* userData, GDestroyNotify dnotify) nothrow;
__gshared c_soup_auth_domain_digest_set_auth_callbackFn c_soup_auth_domain_digest_set_auth_callback; ///

// AuthManager
private alias c_soup_auth_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_manager_get_typeFn c_soup_auth_manager_get_type; ///
private alias c_soup_auth_manager_clear_cached_credentialsFn = extern(C) void function(SoupAuthManager* manager) nothrow;
__gshared c_soup_auth_manager_clear_cached_credentialsFn c_soup_auth_manager_clear_cached_credentials; ///
private alias c_soup_auth_manager_use_authFn = extern(C) void function(SoupAuthManager* manager, GUri* uri, SoupAuth* auth) nothrow;
__gshared c_soup_auth_manager_use_authFn c_soup_auth_manager_use_auth; ///

// AuthNTLM
private alias c_soup_auth_ntlm_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_ntlm_get_typeFn c_soup_auth_ntlm_get_type; ///

// AuthNegotiate
private alias c_soup_auth_negotiate_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_auth_negotiate_get_typeFn c_soup_auth_negotiate_get_type; ///
private alias c_soup_auth_negotiate_supportedFn = extern(C) gboolean function() nothrow;
__gshared c_soup_auth_negotiate_supportedFn c_soup_auth_negotiate_supported; ///

// Cache
private alias c_soup_cache_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_cache_get_typeFn c_soup_cache_get_type; ///
private alias c_soup_cache_newFn = extern(C) SoupCache* function(const(char)* cacheDir, SoupCacheType cacheType) nothrow;
__gshared c_soup_cache_newFn c_soup_cache_new; ///
private alias c_soup_cache_clearFn = extern(C) void function(SoupCache* cache) nothrow;
__gshared c_soup_cache_clearFn c_soup_cache_clear; ///
private alias c_soup_cache_dumpFn = extern(C) void function(SoupCache* cache) nothrow;
__gshared c_soup_cache_dumpFn c_soup_cache_dump; ///
private alias c_soup_cache_flushFn = extern(C) void function(SoupCache* cache) nothrow;
__gshared c_soup_cache_flushFn c_soup_cache_flush; ///
private alias c_soup_cache_get_max_sizeFn = extern(C) uint function(SoupCache* cache) nothrow;
__gshared c_soup_cache_get_max_sizeFn c_soup_cache_get_max_size; ///
private alias c_soup_cache_loadFn = extern(C) void function(SoupCache* cache) nothrow;
__gshared c_soup_cache_loadFn c_soup_cache_load; ///
private alias c_soup_cache_set_max_sizeFn = extern(C) void function(SoupCache* cache, uint maxSize) nothrow;
__gshared c_soup_cache_set_max_sizeFn c_soup_cache_set_max_size; ///

// ContentDecoder
private alias c_soup_content_decoder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_content_decoder_get_typeFn c_soup_content_decoder_get_type; ///

// ContentSniffer
private alias c_soup_content_sniffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_content_sniffer_get_typeFn c_soup_content_sniffer_get_type; ///
private alias c_soup_content_sniffer_newFn = extern(C) SoupContentSniffer* function() nothrow;
__gshared c_soup_content_sniffer_newFn c_soup_content_sniffer_new; ///
private alias c_soup_content_sniffer_sniffFn = extern(C) char* function(SoupContentSniffer* sniffer, SoupMessage* msg, GBytes* buffer, GHashTable** params) nothrow;
__gshared c_soup_content_sniffer_sniffFn c_soup_content_sniffer_sniff; ///

// Cookie
private alias c_soup_cookie_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_cookie_get_typeFn c_soup_cookie_get_type; ///
private alias c_soup_cookie_newFn = extern(C) SoupCookie* function(const(char)* name, const(char)* value, const(char)* domain, const(char)* path, int maxAge) nothrow;
__gshared c_soup_cookie_newFn c_soup_cookie_new; ///
private alias c_soup_cookie_applies_to_uriFn = extern(C) gboolean function(SoupCookie* cookie, GUri* uri) nothrow;
__gshared c_soup_cookie_applies_to_uriFn c_soup_cookie_applies_to_uri; ///
private alias c_soup_cookie_copyFn = extern(C) SoupCookie* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_copyFn c_soup_cookie_copy; ///
private alias c_soup_cookie_domain_matchesFn = extern(C) gboolean function(SoupCookie* cookie, const(char)* host) nothrow;
__gshared c_soup_cookie_domain_matchesFn c_soup_cookie_domain_matches; ///
private alias c_soup_cookie_equalFn = extern(C) gboolean function(SoupCookie* cookie1, SoupCookie* cookie2) nothrow;
__gshared c_soup_cookie_equalFn c_soup_cookie_equal; ///
private alias c_soup_cookie_freeFn = extern(C) void function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_freeFn c_soup_cookie_free; ///
private alias c_soup_cookie_get_domainFn = extern(C) const(char)* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_domainFn c_soup_cookie_get_domain; ///
private alias c_soup_cookie_get_expiresFn = extern(C) GDateTime* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_expiresFn c_soup_cookie_get_expires; ///
private alias c_soup_cookie_get_http_onlyFn = extern(C) gboolean function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_http_onlyFn c_soup_cookie_get_http_only; ///
private alias c_soup_cookie_get_nameFn = extern(C) const(char)* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_nameFn c_soup_cookie_get_name; ///
private alias c_soup_cookie_get_pathFn = extern(C) const(char)* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_pathFn c_soup_cookie_get_path; ///
private alias c_soup_cookie_get_same_site_policyFn = extern(C) SoupSameSitePolicy function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_same_site_policyFn c_soup_cookie_get_same_site_policy; ///
private alias c_soup_cookie_get_secureFn = extern(C) gboolean function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_secureFn c_soup_cookie_get_secure; ///
private alias c_soup_cookie_get_valueFn = extern(C) const(char)* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_get_valueFn c_soup_cookie_get_value; ///
private alias c_soup_cookie_set_domainFn = extern(C) void function(SoupCookie* cookie, const(char)* domain) nothrow;
__gshared c_soup_cookie_set_domainFn c_soup_cookie_set_domain; ///
private alias c_soup_cookie_set_expiresFn = extern(C) void function(SoupCookie* cookie, GDateTime* expires) nothrow;
__gshared c_soup_cookie_set_expiresFn c_soup_cookie_set_expires; ///
private alias c_soup_cookie_set_http_onlyFn = extern(C) void function(SoupCookie* cookie, gboolean httpOnly) nothrow;
__gshared c_soup_cookie_set_http_onlyFn c_soup_cookie_set_http_only; ///
private alias c_soup_cookie_set_max_ageFn = extern(C) void function(SoupCookie* cookie, int maxAge) nothrow;
__gshared c_soup_cookie_set_max_ageFn c_soup_cookie_set_max_age; ///
private alias c_soup_cookie_set_nameFn = extern(C) void function(SoupCookie* cookie, const(char)* name) nothrow;
__gshared c_soup_cookie_set_nameFn c_soup_cookie_set_name; ///
private alias c_soup_cookie_set_pathFn = extern(C) void function(SoupCookie* cookie, const(char)* path) nothrow;
__gshared c_soup_cookie_set_pathFn c_soup_cookie_set_path; ///
private alias c_soup_cookie_set_same_site_policyFn = extern(C) void function(SoupCookie* cookie, SoupSameSitePolicy policy) nothrow;
__gshared c_soup_cookie_set_same_site_policyFn c_soup_cookie_set_same_site_policy; ///
private alias c_soup_cookie_set_secureFn = extern(C) void function(SoupCookie* cookie, gboolean secure) nothrow;
__gshared c_soup_cookie_set_secureFn c_soup_cookie_set_secure; ///
private alias c_soup_cookie_set_valueFn = extern(C) void function(SoupCookie* cookie, const(char)* value) nothrow;
__gshared c_soup_cookie_set_valueFn c_soup_cookie_set_value; ///
private alias c_soup_cookie_to_cookie_headerFn = extern(C) char* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_to_cookie_headerFn c_soup_cookie_to_cookie_header; ///
private alias c_soup_cookie_to_set_cookie_headerFn = extern(C) char* function(SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_to_set_cookie_headerFn c_soup_cookie_to_set_cookie_header; ///
private alias c_soup_cookie_parseFn = extern(C) SoupCookie* function(const(char)* header, GUri* origin) nothrow;
__gshared c_soup_cookie_parseFn c_soup_cookie_parse; ///

// CookieJar
private alias c_soup_cookie_jar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_cookie_jar_get_typeFn c_soup_cookie_jar_get_type; ///
private alias c_soup_cookie_jar_newFn = extern(C) SoupCookieJar* function() nothrow;
__gshared c_soup_cookie_jar_newFn c_soup_cookie_jar_new; ///
private alias c_soup_cookie_jar_add_cookieFn = extern(C) void function(SoupCookieJar* jar, SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_jar_add_cookieFn c_soup_cookie_jar_add_cookie; ///
private alias c_soup_cookie_jar_add_cookie_fullFn = extern(C) void function(SoupCookieJar* jar, SoupCookie* cookie, GUri* uri, GUri* firstParty) nothrow;
__gshared c_soup_cookie_jar_add_cookie_fullFn c_soup_cookie_jar_add_cookie_full; ///
private alias c_soup_cookie_jar_add_cookie_with_first_partyFn = extern(C) void function(SoupCookieJar* jar, GUri* firstParty, SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_jar_add_cookie_with_first_partyFn c_soup_cookie_jar_add_cookie_with_first_party; ///
private alias c_soup_cookie_jar_all_cookiesFn = extern(C) GSList* function(SoupCookieJar* jar) nothrow;
__gshared c_soup_cookie_jar_all_cookiesFn c_soup_cookie_jar_all_cookies; ///
private alias c_soup_cookie_jar_delete_cookieFn = extern(C) void function(SoupCookieJar* jar, SoupCookie* cookie) nothrow;
__gshared c_soup_cookie_jar_delete_cookieFn c_soup_cookie_jar_delete_cookie; ///
private alias c_soup_cookie_jar_get_accept_policyFn = extern(C) SoupCookieJarAcceptPolicy function(SoupCookieJar* jar) nothrow;
__gshared c_soup_cookie_jar_get_accept_policyFn c_soup_cookie_jar_get_accept_policy; ///
private alias c_soup_cookie_jar_get_cookie_listFn = extern(C) GSList* function(SoupCookieJar* jar, GUri* uri, gboolean forHttp) nothrow;
__gshared c_soup_cookie_jar_get_cookie_listFn c_soup_cookie_jar_get_cookie_list; ///
private alias c_soup_cookie_jar_get_cookie_list_with_same_site_infoFn = extern(C) GSList* function(SoupCookieJar* jar, GUri* uri, GUri* topLevel, GUri* siteForCookies, gboolean forHttp, gboolean isSafeMethod, gboolean isTopLevelNavigation) nothrow;
__gshared c_soup_cookie_jar_get_cookie_list_with_same_site_infoFn c_soup_cookie_jar_get_cookie_list_with_same_site_info; ///
private alias c_soup_cookie_jar_get_cookiesFn = extern(C) char* function(SoupCookieJar* jar, GUri* uri, gboolean forHttp) nothrow;
__gshared c_soup_cookie_jar_get_cookiesFn c_soup_cookie_jar_get_cookies; ///
private alias c_soup_cookie_jar_is_persistentFn = extern(C) gboolean function(SoupCookieJar* jar) nothrow;
__gshared c_soup_cookie_jar_is_persistentFn c_soup_cookie_jar_is_persistent; ///
private alias c_soup_cookie_jar_set_accept_policyFn = extern(C) void function(SoupCookieJar* jar, SoupCookieJarAcceptPolicy policy) nothrow;
__gshared c_soup_cookie_jar_set_accept_policyFn c_soup_cookie_jar_set_accept_policy; ///
private alias c_soup_cookie_jar_set_cookieFn = extern(C) void function(SoupCookieJar* jar, GUri* uri, const(char)* cookie) nothrow;
__gshared c_soup_cookie_jar_set_cookieFn c_soup_cookie_jar_set_cookie; ///
private alias c_soup_cookie_jar_set_cookie_with_first_partyFn = extern(C) void function(SoupCookieJar* jar, GUri* uri, GUri* firstParty, const(char)* cookie) nothrow;
__gshared c_soup_cookie_jar_set_cookie_with_first_partyFn c_soup_cookie_jar_set_cookie_with_first_party; ///

// CookieJarDB
private alias c_soup_cookie_jar_db_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_cookie_jar_db_get_typeFn c_soup_cookie_jar_db_get_type; ///
private alias c_soup_cookie_jar_db_newFn = extern(C) SoupCookieJar* function(const(char)* filename, gboolean readOnly) nothrow;
__gshared c_soup_cookie_jar_db_newFn c_soup_cookie_jar_db_new; ///

// CookieJarText
private alias c_soup_cookie_jar_text_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_cookie_jar_text_get_typeFn c_soup_cookie_jar_text_get_type; ///
private alias c_soup_cookie_jar_text_newFn = extern(C) SoupCookieJar* function(const(char)* filename, gboolean readOnly) nothrow;
__gshared c_soup_cookie_jar_text_newFn c_soup_cookie_jar_text_new; ///

// HSTSEnforcer
private alias c_soup_hsts_enforcer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_hsts_enforcer_get_typeFn c_soup_hsts_enforcer_get_type; ///
private alias c_soup_hsts_enforcer_newFn = extern(C) SoupHSTSEnforcer* function() nothrow;
__gshared c_soup_hsts_enforcer_newFn c_soup_hsts_enforcer_new; ///
private alias c_soup_hsts_enforcer_get_domainsFn = extern(C) GList* function(SoupHSTSEnforcer* hstsEnforcer, gboolean sessionPolicies) nothrow;
__gshared c_soup_hsts_enforcer_get_domainsFn c_soup_hsts_enforcer_get_domains; ///
private alias c_soup_hsts_enforcer_get_policiesFn = extern(C) GList* function(SoupHSTSEnforcer* hstsEnforcer, gboolean sessionPolicies) nothrow;
__gshared c_soup_hsts_enforcer_get_policiesFn c_soup_hsts_enforcer_get_policies; ///
private alias c_soup_hsts_enforcer_has_valid_policyFn = extern(C) gboolean function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain) nothrow;
__gshared c_soup_hsts_enforcer_has_valid_policyFn c_soup_hsts_enforcer_has_valid_policy; ///
private alias c_soup_hsts_enforcer_is_persistentFn = extern(C) gboolean function(SoupHSTSEnforcer* hstsEnforcer) nothrow;
__gshared c_soup_hsts_enforcer_is_persistentFn c_soup_hsts_enforcer_is_persistent; ///
private alias c_soup_hsts_enforcer_set_policyFn = extern(C) void function(SoupHSTSEnforcer* hstsEnforcer, SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_enforcer_set_policyFn c_soup_hsts_enforcer_set_policy; ///
private alias c_soup_hsts_enforcer_set_session_policyFn = extern(C) void function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain, gboolean includeSubdomains) nothrow;
__gshared c_soup_hsts_enforcer_set_session_policyFn c_soup_hsts_enforcer_set_session_policy; ///

// HSTSEnforcerDB
private alias c_soup_hsts_enforcer_db_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_hsts_enforcer_db_get_typeFn c_soup_hsts_enforcer_db_get_type; ///
private alias c_soup_hsts_enforcer_db_newFn = extern(C) SoupHSTSEnforcer* function(const(char)* filename) nothrow;
__gshared c_soup_hsts_enforcer_db_newFn c_soup_hsts_enforcer_db_new; ///

// HSTSPolicy
private alias c_soup_hsts_policy_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_hsts_policy_get_typeFn c_soup_hsts_policy_get_type; ///
private alias c_soup_hsts_policy_newFn = extern(C) SoupHSTSPolicy* function(const(char)* domain, gulong maxAge, gboolean includeSubdomains) nothrow;
__gshared c_soup_hsts_policy_newFn c_soup_hsts_policy_new; ///
private alias c_soup_hsts_policy_new_from_responseFn = extern(C) SoupHSTSPolicy* function(SoupMessage* msg) nothrow;
__gshared c_soup_hsts_policy_new_from_responseFn c_soup_hsts_policy_new_from_response; ///
private alias c_soup_hsts_policy_new_fullFn = extern(C) SoupHSTSPolicy* function(const(char)* domain, gulong maxAge, GDateTime* expires, gboolean includeSubdomains) nothrow;
__gshared c_soup_hsts_policy_new_fullFn c_soup_hsts_policy_new_full; ///
private alias c_soup_hsts_policy_new_session_policyFn = extern(C) SoupHSTSPolicy* function(const(char)* domain, gboolean includeSubdomains) nothrow;
__gshared c_soup_hsts_policy_new_session_policyFn c_soup_hsts_policy_new_session_policy; ///
private alias c_soup_hsts_policy_copyFn = extern(C) SoupHSTSPolicy* function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_copyFn c_soup_hsts_policy_copy; ///
private alias c_soup_hsts_policy_equalFn = extern(C) gboolean function(SoupHSTSPolicy* policy1, SoupHSTSPolicy* policy2) nothrow;
__gshared c_soup_hsts_policy_equalFn c_soup_hsts_policy_equal; ///
private alias c_soup_hsts_policy_freeFn = extern(C) void function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_freeFn c_soup_hsts_policy_free; ///
private alias c_soup_hsts_policy_get_domainFn = extern(C) const(char)* function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_get_domainFn c_soup_hsts_policy_get_domain; ///
private alias c_soup_hsts_policy_get_expiresFn = extern(C) GDateTime* function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_get_expiresFn c_soup_hsts_policy_get_expires; ///
private alias c_soup_hsts_policy_get_max_ageFn = extern(C) gulong function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_get_max_ageFn c_soup_hsts_policy_get_max_age; ///
private alias c_soup_hsts_policy_includes_subdomainsFn = extern(C) gboolean function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_includes_subdomainsFn c_soup_hsts_policy_includes_subdomains; ///
private alias c_soup_hsts_policy_is_expiredFn = extern(C) gboolean function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_is_expiredFn c_soup_hsts_policy_is_expired; ///
private alias c_soup_hsts_policy_is_session_policyFn = extern(C) gboolean function(SoupHSTSPolicy* policy) nothrow;
__gshared c_soup_hsts_policy_is_session_policyFn c_soup_hsts_policy_is_session_policy; ///

// Logger
private alias c_soup_logger_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_logger_get_typeFn c_soup_logger_get_type; ///
private alias c_soup_logger_newFn = extern(C) SoupLogger* function(SoupLoggerLogLevel level) nothrow;
__gshared c_soup_logger_newFn c_soup_logger_new; ///
private alias c_soup_logger_get_max_body_sizeFn = extern(C) int function(SoupLogger* logger) nothrow;
__gshared c_soup_logger_get_max_body_sizeFn c_soup_logger_get_max_body_size; ///
private alias c_soup_logger_set_max_body_sizeFn = extern(C) void function(SoupLogger* logger, int maxBodySize) nothrow;
__gshared c_soup_logger_set_max_body_sizeFn c_soup_logger_set_max_body_size; ///
private alias c_soup_logger_set_printerFn = extern(C) void function(SoupLogger* logger, SoupLoggerPrinter printer, void* printerData, GDestroyNotify destroy) nothrow;
__gshared c_soup_logger_set_printerFn c_soup_logger_set_printer; ///
private alias c_soup_logger_set_request_filterFn = extern(C) void function(SoupLogger* logger, SoupLoggerFilter requestFilter, void* filterData, GDestroyNotify destroy) nothrow;
__gshared c_soup_logger_set_request_filterFn c_soup_logger_set_request_filter; ///
private alias c_soup_logger_set_response_filterFn = extern(C) void function(SoupLogger* logger, SoupLoggerFilter responseFilter, void* filterData, GDestroyNotify destroy) nothrow;
__gshared c_soup_logger_set_response_filterFn c_soup_logger_set_response_filter; ///

// Message
private alias c_soup_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_message_get_typeFn c_soup_message_get_type; ///
private alias c_soup_message_newFn = extern(C) SoupMessage* function(const(char)* method, const(char)* uriString) nothrow;
__gshared c_soup_message_newFn c_soup_message_new; ///
private alias c_soup_message_new_from_encoded_formFn = extern(C) SoupMessage* function(const(char)* method, const(char)* uriString, char* encodedForm) nothrow;
__gshared c_soup_message_new_from_encoded_formFn c_soup_message_new_from_encoded_form; ///
private alias c_soup_message_new_from_multipartFn = extern(C) SoupMessage* function(const(char)* uriString, SoupMultipart* multipart) nothrow;
__gshared c_soup_message_new_from_multipartFn c_soup_message_new_from_multipart; ///
private alias c_soup_message_new_from_uriFn = extern(C) SoupMessage* function(const(char)* method, GUri* uri) nothrow;
__gshared c_soup_message_new_from_uriFn c_soup_message_new_from_uri; ///
private alias c_soup_message_new_options_pingFn = extern(C) SoupMessage* function(GUri* baseUri) nothrow;
__gshared c_soup_message_new_options_pingFn c_soup_message_new_options_ping; ///
private alias c_soup_message_add_flagsFn = extern(C) void function(SoupMessage* msg, SoupMessageFlags flags) nothrow;
__gshared c_soup_message_add_flagsFn c_soup_message_add_flags; ///
private alias c_soup_message_add_header_handlerFn = extern(C) uint function(SoupMessage* msg, const(char)* signal, const(char)* header, GCallback callback, void* userData) nothrow;
__gshared c_soup_message_add_header_handlerFn c_soup_message_add_header_handler; ///
private alias c_soup_message_add_status_code_handlerFn = extern(C) uint function(SoupMessage* msg, const(char)* signal, uint statusCode, GCallback callback, void* userData) nothrow;
__gshared c_soup_message_add_status_code_handlerFn c_soup_message_add_status_code_handler; ///
private alias c_soup_message_disable_featureFn = extern(C) void function(SoupMessage* msg, GType featureType) nothrow;
__gshared c_soup_message_disable_featureFn c_soup_message_disable_feature; ///
private alias c_soup_message_get_connection_idFn = extern(C) ulong function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_connection_idFn c_soup_message_get_connection_id; ///
private alias c_soup_message_get_first_partyFn = extern(C) GUri* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_first_partyFn c_soup_message_get_first_party; ///
private alias c_soup_message_get_flagsFn = extern(C) SoupMessageFlags function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_flagsFn c_soup_message_get_flags; ///
private alias c_soup_message_get_force_http1Fn = extern(C) gboolean function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_force_http1Fn c_soup_message_get_force_http1; ///
private alias c_soup_message_get_http_versionFn = extern(C) SoupHTTPVersion function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_http_versionFn c_soup_message_get_http_version; ///
private alias c_soup_message_get_is_options_pingFn = extern(C) gboolean function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_is_options_pingFn c_soup_message_get_is_options_ping; ///
private alias c_soup_message_get_is_top_level_navigationFn = extern(C) gboolean function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_is_top_level_navigationFn c_soup_message_get_is_top_level_navigation; ///
private alias c_soup_message_get_methodFn = extern(C) const(char)* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_methodFn c_soup_message_get_method; ///
private alias c_soup_message_get_metricsFn = extern(C) SoupMessageMetrics* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_metricsFn c_soup_message_get_metrics; ///
private alias c_soup_message_get_priorityFn = extern(C) SoupMessagePriority function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_priorityFn c_soup_message_get_priority; ///
private alias c_soup_message_get_reason_phraseFn = extern(C) const(char)* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_reason_phraseFn c_soup_message_get_reason_phrase; ///
private alias c_soup_message_get_remote_addressFn = extern(C) GSocketAddress* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_remote_addressFn c_soup_message_get_remote_address; ///
private alias c_soup_message_get_request_headersFn = extern(C) SoupMessageHeaders* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_request_headersFn c_soup_message_get_request_headers; ///
private alias c_soup_message_get_response_headersFn = extern(C) SoupMessageHeaders* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_response_headersFn c_soup_message_get_response_headers; ///
private alias c_soup_message_get_site_for_cookiesFn = extern(C) GUri* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_site_for_cookiesFn c_soup_message_get_site_for_cookies; ///
private alias c_soup_message_get_statusFn = extern(C) SoupStatus function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_statusFn c_soup_message_get_status; ///
private alias c_soup_message_get_tls_ciphersuite_nameFn = extern(C) const(char)* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_tls_ciphersuite_nameFn c_soup_message_get_tls_ciphersuite_name; ///
private alias c_soup_message_get_tls_peer_certificateFn = extern(C) GTlsCertificate* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_tls_peer_certificateFn c_soup_message_get_tls_peer_certificate; ///
private alias c_soup_message_get_tls_peer_certificate_errorsFn = extern(C) GTlsCertificateFlags function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_tls_peer_certificate_errorsFn c_soup_message_get_tls_peer_certificate_errors; ///
private alias c_soup_message_get_tls_protocol_versionFn = extern(C) GTlsProtocolVersion function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_tls_protocol_versionFn c_soup_message_get_tls_protocol_version; ///
private alias c_soup_message_get_uriFn = extern(C) GUri* function(SoupMessage* msg) nothrow;
__gshared c_soup_message_get_uriFn c_soup_message_get_uri; ///
private alias c_soup_message_is_feature_disabledFn = extern(C) gboolean function(SoupMessage* msg, GType featureType) nothrow;
__gshared c_soup_message_is_feature_disabledFn c_soup_message_is_feature_disabled; ///
private alias c_soup_message_is_keepaliveFn = extern(C) gboolean function(SoupMessage* msg) nothrow;
__gshared c_soup_message_is_keepaliveFn c_soup_message_is_keepalive; ///
private alias c_soup_message_query_flagsFn = extern(C) gboolean function(SoupMessage* msg, SoupMessageFlags flags) nothrow;
__gshared c_soup_message_query_flagsFn c_soup_message_query_flags; ///
private alias c_soup_message_remove_flagsFn = extern(C) void function(SoupMessage* msg, SoupMessageFlags flags) nothrow;
__gshared c_soup_message_remove_flagsFn c_soup_message_remove_flags; ///
private alias c_soup_message_set_first_partyFn = extern(C) void function(SoupMessage* msg, GUri* firstParty) nothrow;
__gshared c_soup_message_set_first_partyFn c_soup_message_set_first_party; ///
private alias c_soup_message_set_flagsFn = extern(C) void function(SoupMessage* msg, SoupMessageFlags flags) nothrow;
__gshared c_soup_message_set_flagsFn c_soup_message_set_flags; ///
private alias c_soup_message_set_force_http1Fn = extern(C) void function(SoupMessage* msg, gboolean value) nothrow;
__gshared c_soup_message_set_force_http1Fn c_soup_message_set_force_http1; ///
private alias c_soup_message_set_is_options_pingFn = extern(C) void function(SoupMessage* msg, gboolean isOptionsPing) nothrow;
__gshared c_soup_message_set_is_options_pingFn c_soup_message_set_is_options_ping; ///
private alias c_soup_message_set_is_top_level_navigationFn = extern(C) void function(SoupMessage* msg, gboolean isTopLevelNavigation) nothrow;
__gshared c_soup_message_set_is_top_level_navigationFn c_soup_message_set_is_top_level_navigation; ///
private alias c_soup_message_set_methodFn = extern(C) void function(SoupMessage* msg, const(char)* method) nothrow;
__gshared c_soup_message_set_methodFn c_soup_message_set_method; ///
private alias c_soup_message_set_priorityFn = extern(C) void function(SoupMessage* msg, SoupMessagePriority priority) nothrow;
__gshared c_soup_message_set_priorityFn c_soup_message_set_priority; ///
private alias c_soup_message_set_request_bodyFn = extern(C) void function(SoupMessage* msg, const(char)* contentType, GInputStream* stream, ptrdiff_t contentLength) nothrow;
__gshared c_soup_message_set_request_bodyFn c_soup_message_set_request_body; ///
private alias c_soup_message_set_request_body_from_bytesFn = extern(C) void function(SoupMessage* msg, const(char)* contentType, GBytes* bytes) nothrow;
__gshared c_soup_message_set_request_body_from_bytesFn c_soup_message_set_request_body_from_bytes; ///
private alias c_soup_message_set_site_for_cookiesFn = extern(C) void function(SoupMessage* msg, GUri* siteForCookies) nothrow;
__gshared c_soup_message_set_site_for_cookiesFn c_soup_message_set_site_for_cookies; ///
private alias c_soup_message_set_tls_client_certificateFn = extern(C) void function(SoupMessage* msg, GTlsCertificate* certificate) nothrow;
__gshared c_soup_message_set_tls_client_certificateFn c_soup_message_set_tls_client_certificate; ///
private alias c_soup_message_set_uriFn = extern(C) void function(SoupMessage* msg, GUri* uri) nothrow;
__gshared c_soup_message_set_uriFn c_soup_message_set_uri; ///
private alias c_soup_message_tls_client_certificate_password_request_completeFn = extern(C) void function(SoupMessage* msg) nothrow;
__gshared c_soup_message_tls_client_certificate_password_request_completeFn c_soup_message_tls_client_certificate_password_request_complete; ///

// MessageBody
private alias c_soup_message_body_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_message_body_get_typeFn c_soup_message_body_get_type; ///
private alias c_soup_message_body_newFn = extern(C) SoupMessageBody* function() nothrow;
__gshared c_soup_message_body_newFn c_soup_message_body_new; ///
private alias c_soup_message_body_appendFn = extern(C) void function(SoupMessageBody* body_, SoupMemoryUse use, const(void)* data, size_t length) nothrow;
__gshared c_soup_message_body_appendFn c_soup_message_body_append; ///
private alias c_soup_message_body_append_bytesFn = extern(C) void function(SoupMessageBody* body_, GBytes* buffer) nothrow;
__gshared c_soup_message_body_append_bytesFn c_soup_message_body_append_bytes; ///
private alias c_soup_message_body_append_takeFn = extern(C) void function(SoupMessageBody* body_, ubyte* data, size_t length) nothrow;
__gshared c_soup_message_body_append_takeFn c_soup_message_body_append_take; ///
private alias c_soup_message_body_completeFn = extern(C) void function(SoupMessageBody* body_) nothrow;
__gshared c_soup_message_body_completeFn c_soup_message_body_complete; ///
private alias c_soup_message_body_flattenFn = extern(C) GBytes* function(SoupMessageBody* body_) nothrow;
__gshared c_soup_message_body_flattenFn c_soup_message_body_flatten; ///
private alias c_soup_message_body_get_accumulateFn = extern(C) gboolean function(SoupMessageBody* body_) nothrow;
__gshared c_soup_message_body_get_accumulateFn c_soup_message_body_get_accumulate; ///
private alias c_soup_message_body_get_chunkFn = extern(C) GBytes* function(SoupMessageBody* body_, long offset) nothrow;
__gshared c_soup_message_body_get_chunkFn c_soup_message_body_get_chunk; ///
private alias c_soup_message_body_got_chunkFn = extern(C) void function(SoupMessageBody* body_, GBytes* chunk) nothrow;
__gshared c_soup_message_body_got_chunkFn c_soup_message_body_got_chunk; ///
private alias c_soup_message_body_refFn = extern(C) SoupMessageBody* function(SoupMessageBody* body_) nothrow;
__gshared c_soup_message_body_refFn c_soup_message_body_ref; ///
private alias c_soup_message_body_set_accumulateFn = extern(C) void function(SoupMessageBody* body_, gboolean accumulate) nothrow;
__gshared c_soup_message_body_set_accumulateFn c_soup_message_body_set_accumulate; ///
private alias c_soup_message_body_truncateFn = extern(C) void function(SoupMessageBody* body_) nothrow;
__gshared c_soup_message_body_truncateFn c_soup_message_body_truncate; ///
private alias c_soup_message_body_unrefFn = extern(C) void function(SoupMessageBody* body_) nothrow;
__gshared c_soup_message_body_unrefFn c_soup_message_body_unref; ///
private alias c_soup_message_body_wrote_chunkFn = extern(C) void function(SoupMessageBody* body_, GBytes* chunk) nothrow;
__gshared c_soup_message_body_wrote_chunkFn c_soup_message_body_wrote_chunk; ///

// MessageHeaders
private alias c_soup_message_headers_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_message_headers_get_typeFn c_soup_message_headers_get_type; ///
private alias c_soup_message_headers_newFn = extern(C) SoupMessageHeaders* function(SoupMessageHeadersType type) nothrow;
__gshared c_soup_message_headers_newFn c_soup_message_headers_new; ///
private alias c_soup_message_headers_appendFn = extern(C) void function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value) nothrow;
__gshared c_soup_message_headers_appendFn c_soup_message_headers_append; ///
private alias c_soup_message_headers_clean_connection_headersFn = extern(C) void function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_clean_connection_headersFn c_soup_message_headers_clean_connection_headers; ///
private alias c_soup_message_headers_clearFn = extern(C) void function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_clearFn c_soup_message_headers_clear; ///
private alias c_soup_message_headers_foreachFn = extern(C) void function(SoupMessageHeaders* hdrs, SoupMessageHeadersForeachFunc func, void* userData) nothrow;
__gshared c_soup_message_headers_foreachFn c_soup_message_headers_foreach; ///
private alias c_soup_message_headers_free_rangesFn = extern(C) void function(SoupMessageHeaders* hdrs, SoupRange* ranges) nothrow;
__gshared c_soup_message_headers_free_rangesFn c_soup_message_headers_free_ranges; ///
private alias c_soup_message_headers_get_content_dispositionFn = extern(C) gboolean function(SoupMessageHeaders* hdrs, char** disposition, GHashTable** params) nothrow;
__gshared c_soup_message_headers_get_content_dispositionFn c_soup_message_headers_get_content_disposition; ///
private alias c_soup_message_headers_get_content_lengthFn = extern(C) long function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_get_content_lengthFn c_soup_message_headers_get_content_length; ///
private alias c_soup_message_headers_get_content_rangeFn = extern(C) gboolean function(SoupMessageHeaders* hdrs, long* start, long* end, long* totalLength) nothrow;
__gshared c_soup_message_headers_get_content_rangeFn c_soup_message_headers_get_content_range; ///
private alias c_soup_message_headers_get_content_typeFn = extern(C) const(char)* function(SoupMessageHeaders* hdrs, GHashTable** params) nothrow;
__gshared c_soup_message_headers_get_content_typeFn c_soup_message_headers_get_content_type; ///
private alias c_soup_message_headers_get_encodingFn = extern(C) SoupEncoding function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_get_encodingFn c_soup_message_headers_get_encoding; ///
private alias c_soup_message_headers_get_expectationsFn = extern(C) SoupExpectation function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_get_expectationsFn c_soup_message_headers_get_expectations; ///
private alias c_soup_message_headers_get_headers_typeFn = extern(C) SoupMessageHeadersType function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_get_headers_typeFn c_soup_message_headers_get_headers_type; ///
private alias c_soup_message_headers_get_listFn = extern(C) const(char)* function(SoupMessageHeaders* hdrs, const(char)* name) nothrow;
__gshared c_soup_message_headers_get_listFn c_soup_message_headers_get_list; ///
private alias c_soup_message_headers_get_oneFn = extern(C) const(char)* function(SoupMessageHeaders* hdrs, const(char)* name) nothrow;
__gshared c_soup_message_headers_get_oneFn c_soup_message_headers_get_one; ///
private alias c_soup_message_headers_get_rangesFn = extern(C) gboolean function(SoupMessageHeaders* hdrs, long totalLength, SoupRange** ranges, int* length) nothrow;
__gshared c_soup_message_headers_get_rangesFn c_soup_message_headers_get_ranges; ///
private alias c_soup_message_headers_header_containsFn = extern(C) gboolean function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* token) nothrow;
__gshared c_soup_message_headers_header_containsFn c_soup_message_headers_header_contains; ///
private alias c_soup_message_headers_header_equalsFn = extern(C) gboolean function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value) nothrow;
__gshared c_soup_message_headers_header_equalsFn c_soup_message_headers_header_equals; ///
private alias c_soup_message_headers_refFn = extern(C) SoupMessageHeaders* function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_refFn c_soup_message_headers_ref; ///
private alias c_soup_message_headers_removeFn = extern(C) void function(SoupMessageHeaders* hdrs, const(char)* name) nothrow;
__gshared c_soup_message_headers_removeFn c_soup_message_headers_remove; ///
private alias c_soup_message_headers_replaceFn = extern(C) void function(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value) nothrow;
__gshared c_soup_message_headers_replaceFn c_soup_message_headers_replace; ///
private alias c_soup_message_headers_set_content_dispositionFn = extern(C) void function(SoupMessageHeaders* hdrs, const(char)* disposition, GHashTable* params) nothrow;
__gshared c_soup_message_headers_set_content_dispositionFn c_soup_message_headers_set_content_disposition; ///
private alias c_soup_message_headers_set_content_lengthFn = extern(C) void function(SoupMessageHeaders* hdrs, long contentLength) nothrow;
__gshared c_soup_message_headers_set_content_lengthFn c_soup_message_headers_set_content_length; ///
private alias c_soup_message_headers_set_content_rangeFn = extern(C) void function(SoupMessageHeaders* hdrs, long start, long end, long totalLength) nothrow;
__gshared c_soup_message_headers_set_content_rangeFn c_soup_message_headers_set_content_range; ///
private alias c_soup_message_headers_set_content_typeFn = extern(C) void function(SoupMessageHeaders* hdrs, const(char)* contentType, GHashTable* params) nothrow;
__gshared c_soup_message_headers_set_content_typeFn c_soup_message_headers_set_content_type; ///
private alias c_soup_message_headers_set_encodingFn = extern(C) void function(SoupMessageHeaders* hdrs, SoupEncoding encoding) nothrow;
__gshared c_soup_message_headers_set_encodingFn c_soup_message_headers_set_encoding; ///
private alias c_soup_message_headers_set_expectationsFn = extern(C) void function(SoupMessageHeaders* hdrs, SoupExpectation expectations) nothrow;
__gshared c_soup_message_headers_set_expectationsFn c_soup_message_headers_set_expectations; ///
private alias c_soup_message_headers_set_rangeFn = extern(C) void function(SoupMessageHeaders* hdrs, long start, long end) nothrow;
__gshared c_soup_message_headers_set_rangeFn c_soup_message_headers_set_range; ///
private alias c_soup_message_headers_set_rangesFn = extern(C) void function(SoupMessageHeaders* hdrs, SoupRange* ranges, int length) nothrow;
__gshared c_soup_message_headers_set_rangesFn c_soup_message_headers_set_ranges; ///
private alias c_soup_message_headers_unrefFn = extern(C) void function(SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_unrefFn c_soup_message_headers_unref; ///

// MessageHeadersIter
private alias c_soup_message_headers_iter_initFn = extern(C) void function(SoupMessageHeadersIter* iter, SoupMessageHeaders* hdrs) nothrow;
__gshared c_soup_message_headers_iter_initFn c_soup_message_headers_iter_init; ///
private alias c_soup_message_headers_iter_nextFn = extern(C) gboolean function(SoupMessageHeadersIter* iter, const(char*)* name, const(char*)* value) nothrow;
__gshared c_soup_message_headers_iter_nextFn c_soup_message_headers_iter_next; ///

// MessageMetrics
private alias c_soup_message_metrics_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_message_metrics_get_typeFn c_soup_message_metrics_get_type; ///
private alias c_soup_message_metrics_copyFn = extern(C) SoupMessageMetrics* function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_copyFn c_soup_message_metrics_copy; ///
private alias c_soup_message_metrics_freeFn = extern(C) void function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_freeFn c_soup_message_metrics_free; ///
private alias c_soup_message_metrics_get_connect_endFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_connect_endFn c_soup_message_metrics_get_connect_end; ///
private alias c_soup_message_metrics_get_connect_startFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_connect_startFn c_soup_message_metrics_get_connect_start; ///
private alias c_soup_message_metrics_get_dns_endFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_dns_endFn c_soup_message_metrics_get_dns_end; ///
private alias c_soup_message_metrics_get_dns_startFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_dns_startFn c_soup_message_metrics_get_dns_start; ///
private alias c_soup_message_metrics_get_fetch_startFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_fetch_startFn c_soup_message_metrics_get_fetch_start; ///
private alias c_soup_message_metrics_get_request_body_bytes_sentFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_request_body_bytes_sentFn c_soup_message_metrics_get_request_body_bytes_sent; ///
private alias c_soup_message_metrics_get_request_body_sizeFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_request_body_sizeFn c_soup_message_metrics_get_request_body_size; ///
private alias c_soup_message_metrics_get_request_header_bytes_sentFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_request_header_bytes_sentFn c_soup_message_metrics_get_request_header_bytes_sent; ///
private alias c_soup_message_metrics_get_request_startFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_request_startFn c_soup_message_metrics_get_request_start; ///
private alias c_soup_message_metrics_get_response_body_bytes_receivedFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_response_body_bytes_receivedFn c_soup_message_metrics_get_response_body_bytes_received; ///
private alias c_soup_message_metrics_get_response_body_sizeFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_response_body_sizeFn c_soup_message_metrics_get_response_body_size; ///
private alias c_soup_message_metrics_get_response_endFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_response_endFn c_soup_message_metrics_get_response_end; ///
private alias c_soup_message_metrics_get_response_header_bytes_receivedFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_response_header_bytes_receivedFn c_soup_message_metrics_get_response_header_bytes_received; ///
private alias c_soup_message_metrics_get_response_startFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_response_startFn c_soup_message_metrics_get_response_start; ///
private alias c_soup_message_metrics_get_tls_startFn = extern(C) ulong function(SoupMessageMetrics* metrics) nothrow;
__gshared c_soup_message_metrics_get_tls_startFn c_soup_message_metrics_get_tls_start; ///

// Multipart
private alias c_soup_multipart_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_multipart_get_typeFn c_soup_multipart_get_type; ///
private alias c_soup_multipart_newFn = extern(C) SoupMultipart* function(const(char)* mimeType) nothrow;
__gshared c_soup_multipart_newFn c_soup_multipart_new; ///
private alias c_soup_multipart_new_from_messageFn = extern(C) SoupMultipart* function(SoupMessageHeaders* headers, GBytes* body_) nothrow;
__gshared c_soup_multipart_new_from_messageFn c_soup_multipart_new_from_message; ///
private alias c_soup_multipart_append_form_fileFn = extern(C) void function(SoupMultipart* multipart, const(char)* controlName, const(char)* filename, const(char)* contentType, GBytes* body_) nothrow;
__gshared c_soup_multipart_append_form_fileFn c_soup_multipart_append_form_file; ///
private alias c_soup_multipart_append_form_stringFn = extern(C) void function(SoupMultipart* multipart, const(char)* controlName, const(char)* data) nothrow;
__gshared c_soup_multipart_append_form_stringFn c_soup_multipart_append_form_string; ///
private alias c_soup_multipart_append_partFn = extern(C) void function(SoupMultipart* multipart, SoupMessageHeaders* headers, GBytes* body_) nothrow;
__gshared c_soup_multipart_append_partFn c_soup_multipart_append_part; ///
private alias c_soup_multipart_freeFn = extern(C) void function(SoupMultipart* multipart) nothrow;
__gshared c_soup_multipart_freeFn c_soup_multipart_free; ///
private alias c_soup_multipart_get_lengthFn = extern(C) int function(SoupMultipart* multipart) nothrow;
__gshared c_soup_multipart_get_lengthFn c_soup_multipart_get_length; ///
private alias c_soup_multipart_get_partFn = extern(C) gboolean function(SoupMultipart* multipart, int part, SoupMessageHeaders** headers, GBytes** body_) nothrow;
__gshared c_soup_multipart_get_partFn c_soup_multipart_get_part; ///
private alias c_soup_multipart_to_messageFn = extern(C) void function(SoupMultipart* multipart, SoupMessageHeaders* destHeaders, GBytes** destBody) nothrow;
__gshared c_soup_multipart_to_messageFn c_soup_multipart_to_message; ///

// MultipartInputStream
private alias c_soup_multipart_input_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_multipart_input_stream_get_typeFn c_soup_multipart_input_stream_get_type; ///
private alias c_soup_multipart_input_stream_newFn = extern(C) SoupMultipartInputStream* function(SoupMessage* msg, GInputStream* baseStream) nothrow;
__gshared c_soup_multipart_input_stream_newFn c_soup_multipart_input_stream_new; ///
private alias c_soup_multipart_input_stream_get_headersFn = extern(C) SoupMessageHeaders* function(SoupMultipartInputStream* multipart) nothrow;
__gshared c_soup_multipart_input_stream_get_headersFn c_soup_multipart_input_stream_get_headers; ///
private alias c_soup_multipart_input_stream_next_partFn = extern(C) GInputStream* function(SoupMultipartInputStream* multipart, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_soup_multipart_input_stream_next_partFn c_soup_multipart_input_stream_next_part; ///
private alias c_soup_multipart_input_stream_next_part_asyncFn = extern(C) void function(SoupMultipartInputStream* multipart, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* data) nothrow;
__gshared c_soup_multipart_input_stream_next_part_asyncFn c_soup_multipart_input_stream_next_part_async; ///
private alias c_soup_multipart_input_stream_next_part_finishFn = extern(C) GInputStream* function(SoupMultipartInputStream* multipart, GAsyncResult* result, GError** _err) nothrow;
__gshared c_soup_multipart_input_stream_next_part_finishFn c_soup_multipart_input_stream_next_part_finish; ///

// Server
private alias c_soup_server_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_server_get_typeFn c_soup_server_get_type; ///
private alias c_soup_server_newFn = extern(C) SoupServer* function(const(char)* optname1,  ...) nothrow;
__gshared c_soup_server_newFn c_soup_server_new; ///
private alias c_soup_server_accept_iostreamFn = extern(C) gboolean function(SoupServer* server, GIOStream* stream, GSocketAddress* localAddr, GSocketAddress* remoteAddr, GError** _err) nothrow;
__gshared c_soup_server_accept_iostreamFn c_soup_server_accept_iostream; ///
private alias c_soup_server_add_auth_domainFn = extern(C) void function(SoupServer* server, SoupAuthDomain* authDomain) nothrow;
__gshared c_soup_server_add_auth_domainFn c_soup_server_add_auth_domain; ///
private alias c_soup_server_add_early_handlerFn = extern(C) void function(SoupServer* server, const(char)* path, SoupServerCallback callback, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_soup_server_add_early_handlerFn c_soup_server_add_early_handler; ///
private alias c_soup_server_add_handlerFn = extern(C) void function(SoupServer* server, const(char)* path, SoupServerCallback callback, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_soup_server_add_handlerFn c_soup_server_add_handler; ///
private alias c_soup_server_add_websocket_extensionFn = extern(C) void function(SoupServer* server, GType extensionType) nothrow;
__gshared c_soup_server_add_websocket_extensionFn c_soup_server_add_websocket_extension; ///
private alias c_soup_server_add_websocket_handlerFn = extern(C) void function(SoupServer* server, const(char)* path, const(char)* origin, char** protocols, SoupServerWebsocketCallback callback, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_soup_server_add_websocket_handlerFn c_soup_server_add_websocket_handler; ///
private alias c_soup_server_disconnectFn = extern(C) void function(SoupServer* server) nothrow;
__gshared c_soup_server_disconnectFn c_soup_server_disconnect; ///
private alias c_soup_server_get_listenersFn = extern(C) GSList* function(SoupServer* server) nothrow;
__gshared c_soup_server_get_listenersFn c_soup_server_get_listeners; ///
private alias c_soup_server_get_tls_auth_modeFn = extern(C) GTlsAuthenticationMode function(SoupServer* server) nothrow;
__gshared c_soup_server_get_tls_auth_modeFn c_soup_server_get_tls_auth_mode; ///
private alias c_soup_server_get_tls_certificateFn = extern(C) GTlsCertificate* function(SoupServer* server) nothrow;
__gshared c_soup_server_get_tls_certificateFn c_soup_server_get_tls_certificate; ///
private alias c_soup_server_get_tls_databaseFn = extern(C) GTlsDatabase* function(SoupServer* server) nothrow;
__gshared c_soup_server_get_tls_databaseFn c_soup_server_get_tls_database; ///
private alias c_soup_server_get_urisFn = extern(C) GSList* function(SoupServer* server) nothrow;
__gshared c_soup_server_get_urisFn c_soup_server_get_uris; ///
private alias c_soup_server_is_httpsFn = extern(C) gboolean function(SoupServer* server) nothrow;
__gshared c_soup_server_is_httpsFn c_soup_server_is_https; ///
private alias c_soup_server_listenFn = extern(C) gboolean function(SoupServer* server, GSocketAddress* address, SoupServerListenOptions options, GError** _err) nothrow;
__gshared c_soup_server_listenFn c_soup_server_listen; ///
private alias c_soup_server_listen_allFn = extern(C) gboolean function(SoupServer* server, uint port, SoupServerListenOptions options, GError** _err) nothrow;
__gshared c_soup_server_listen_allFn c_soup_server_listen_all; ///
private alias c_soup_server_listen_localFn = extern(C) gboolean function(SoupServer* server, uint port, SoupServerListenOptions options, GError** _err) nothrow;
__gshared c_soup_server_listen_localFn c_soup_server_listen_local; ///
private alias c_soup_server_listen_socketFn = extern(C) gboolean function(SoupServer* server, GSocket* socket, SoupServerListenOptions options, GError** _err) nothrow;
__gshared c_soup_server_listen_socketFn c_soup_server_listen_socket; ///
private alias c_soup_server_pause_messageFn = extern(C) void function(SoupServer* server, SoupServerMessage* msg) nothrow;
__gshared c_soup_server_pause_messageFn c_soup_server_pause_message; ///
private alias c_soup_server_remove_auth_domainFn = extern(C) void function(SoupServer* server, SoupAuthDomain* authDomain) nothrow;
__gshared c_soup_server_remove_auth_domainFn c_soup_server_remove_auth_domain; ///
private alias c_soup_server_remove_handlerFn = extern(C) void function(SoupServer* server, const(char)* path) nothrow;
__gshared c_soup_server_remove_handlerFn c_soup_server_remove_handler; ///
private alias c_soup_server_remove_websocket_extensionFn = extern(C) void function(SoupServer* server, GType extensionType) nothrow;
__gshared c_soup_server_remove_websocket_extensionFn c_soup_server_remove_websocket_extension; ///
private alias c_soup_server_set_tls_auth_modeFn = extern(C) void function(SoupServer* server, GTlsAuthenticationMode mode) nothrow;
__gshared c_soup_server_set_tls_auth_modeFn c_soup_server_set_tls_auth_mode; ///
private alias c_soup_server_set_tls_certificateFn = extern(C) void function(SoupServer* server, GTlsCertificate* certificate) nothrow;
__gshared c_soup_server_set_tls_certificateFn c_soup_server_set_tls_certificate; ///
private alias c_soup_server_set_tls_databaseFn = extern(C) void function(SoupServer* server, GTlsDatabase* tlsDatabase) nothrow;
__gshared c_soup_server_set_tls_databaseFn c_soup_server_set_tls_database; ///
private alias c_soup_server_unpause_messageFn = extern(C) void function(SoupServer* server, SoupServerMessage* msg) nothrow;
__gshared c_soup_server_unpause_messageFn c_soup_server_unpause_message; ///

// ServerMessage
private alias c_soup_server_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_server_message_get_typeFn c_soup_server_message_get_type; ///
private alias c_soup_server_message_get_http_versionFn = extern(C) SoupHTTPVersion function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_http_versionFn c_soup_server_message_get_http_version; ///
private alias c_soup_server_message_get_local_addressFn = extern(C) GSocketAddress* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_local_addressFn c_soup_server_message_get_local_address; ///
private alias c_soup_server_message_get_methodFn = extern(C) const(char)* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_methodFn c_soup_server_message_get_method; ///
private alias c_soup_server_message_get_reason_phraseFn = extern(C) const(char)* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_reason_phraseFn c_soup_server_message_get_reason_phrase; ///
private alias c_soup_server_message_get_remote_addressFn = extern(C) GSocketAddress* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_remote_addressFn c_soup_server_message_get_remote_address; ///
private alias c_soup_server_message_get_remote_hostFn = extern(C) const(char)* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_remote_hostFn c_soup_server_message_get_remote_host; ///
private alias c_soup_server_message_get_request_bodyFn = extern(C) SoupMessageBody* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_request_bodyFn c_soup_server_message_get_request_body; ///
private alias c_soup_server_message_get_request_headersFn = extern(C) SoupMessageHeaders* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_request_headersFn c_soup_server_message_get_request_headers; ///
private alias c_soup_server_message_get_response_bodyFn = extern(C) SoupMessageBody* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_response_bodyFn c_soup_server_message_get_response_body; ///
private alias c_soup_server_message_get_response_headersFn = extern(C) SoupMessageHeaders* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_response_headersFn c_soup_server_message_get_response_headers; ///
private alias c_soup_server_message_get_socketFn = extern(C) GSocket* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_socketFn c_soup_server_message_get_socket; ///
private alias c_soup_server_message_get_statusFn = extern(C) uint function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_statusFn c_soup_server_message_get_status; ///
private alias c_soup_server_message_get_tls_peer_certificateFn = extern(C) GTlsCertificate* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_tls_peer_certificateFn c_soup_server_message_get_tls_peer_certificate; ///
private alias c_soup_server_message_get_tls_peer_certificate_errorsFn = extern(C) GTlsCertificateFlags function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_tls_peer_certificate_errorsFn c_soup_server_message_get_tls_peer_certificate_errors; ///
private alias c_soup_server_message_get_uriFn = extern(C) GUri* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_get_uriFn c_soup_server_message_get_uri; ///
private alias c_soup_server_message_is_options_pingFn = extern(C) gboolean function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_is_options_pingFn c_soup_server_message_is_options_ping; ///
private alias c_soup_server_message_pauseFn = extern(C) void function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_pauseFn c_soup_server_message_pause; ///
private alias c_soup_server_message_set_http_versionFn = extern(C) void function(SoupServerMessage* msg, SoupHTTPVersion version_) nothrow;
__gshared c_soup_server_message_set_http_versionFn c_soup_server_message_set_http_version; ///
private alias c_soup_server_message_set_redirectFn = extern(C) void function(SoupServerMessage* msg, uint statusCode, const(char)* redirectUri) nothrow;
__gshared c_soup_server_message_set_redirectFn c_soup_server_message_set_redirect; ///
private alias c_soup_server_message_set_responseFn = extern(C) void function(SoupServerMessage* msg, const(char)* contentType, SoupMemoryUse respUse, const(ubyte)* respBody, size_t respLength) nothrow;
__gshared c_soup_server_message_set_responseFn c_soup_server_message_set_response; ///
private alias c_soup_server_message_set_statusFn = extern(C) void function(SoupServerMessage* msg, uint statusCode, const(char)* reasonPhrase) nothrow;
__gshared c_soup_server_message_set_statusFn c_soup_server_message_set_status; ///
private alias c_soup_server_message_steal_connectionFn = extern(C) GIOStream* function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_steal_connectionFn c_soup_server_message_steal_connection; ///
private alias c_soup_server_message_unpauseFn = extern(C) void function(SoupServerMessage* msg) nothrow;
__gshared c_soup_server_message_unpauseFn c_soup_server_message_unpause; ///

// Session
private alias c_soup_session_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_session_get_typeFn c_soup_session_get_type; ///
private alias c_soup_session_newFn = extern(C) SoupSession* function() nothrow;
__gshared c_soup_session_newFn c_soup_session_new; ///
private alias c_soup_session_new_with_optionsFn = extern(C) SoupSession* function(const(char)* optname1,  ...) nothrow;
__gshared c_soup_session_new_with_optionsFn c_soup_session_new_with_options; ///
private alias c_soup_session_abortFn = extern(C) void function(SoupSession* session) nothrow;
__gshared c_soup_session_abortFn c_soup_session_abort; ///
private alias c_soup_session_add_featureFn = extern(C) void function(SoupSession* session, SoupSessionFeature* feature) nothrow;
__gshared c_soup_session_add_featureFn c_soup_session_add_feature; ///
private alias c_soup_session_add_feature_by_typeFn = extern(C) void function(SoupSession* session, GType featureType) nothrow;
__gshared c_soup_session_add_feature_by_typeFn c_soup_session_add_feature_by_type; ///
private alias c_soup_session_get_accept_languageFn = extern(C) const(char)* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_accept_languageFn c_soup_session_get_accept_language; ///
private alias c_soup_session_get_accept_language_autoFn = extern(C) gboolean function(SoupSession* session) nothrow;
__gshared c_soup_session_get_accept_language_autoFn c_soup_session_get_accept_language_auto; ///
private alias c_soup_session_get_async_result_messageFn = extern(C) SoupMessage* function(SoupSession* session, GAsyncResult* result) nothrow;
__gshared c_soup_session_get_async_result_messageFn c_soup_session_get_async_result_message; ///
private alias c_soup_session_get_featureFn = extern(C) SoupSessionFeature* function(SoupSession* session, GType featureType) nothrow;
__gshared c_soup_session_get_featureFn c_soup_session_get_feature; ///
private alias c_soup_session_get_feature_for_messageFn = extern(C) SoupSessionFeature* function(SoupSession* session, GType featureType, SoupMessage* msg) nothrow;
__gshared c_soup_session_get_feature_for_messageFn c_soup_session_get_feature_for_message; ///
private alias c_soup_session_get_idle_timeoutFn = extern(C) uint function(SoupSession* session) nothrow;
__gshared c_soup_session_get_idle_timeoutFn c_soup_session_get_idle_timeout; ///
private alias c_soup_session_get_local_addressFn = extern(C) GInetSocketAddress* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_local_addressFn c_soup_session_get_local_address; ///
private alias c_soup_session_get_max_connsFn = extern(C) uint function(SoupSession* session) nothrow;
__gshared c_soup_session_get_max_connsFn c_soup_session_get_max_conns; ///
private alias c_soup_session_get_max_conns_per_hostFn = extern(C) uint function(SoupSession* session) nothrow;
__gshared c_soup_session_get_max_conns_per_hostFn c_soup_session_get_max_conns_per_host; ///
private alias c_soup_session_get_proxy_resolverFn = extern(C) GProxyResolver* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_proxy_resolverFn c_soup_session_get_proxy_resolver; ///
private alias c_soup_session_get_remote_connectableFn = extern(C) GSocketConnectable* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_remote_connectableFn c_soup_session_get_remote_connectable; ///
private alias c_soup_session_get_timeoutFn = extern(C) uint function(SoupSession* session) nothrow;
__gshared c_soup_session_get_timeoutFn c_soup_session_get_timeout; ///
private alias c_soup_session_get_tls_databaseFn = extern(C) GTlsDatabase* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_tls_databaseFn c_soup_session_get_tls_database; ///
private alias c_soup_session_get_tls_interactionFn = extern(C) GTlsInteraction* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_tls_interactionFn c_soup_session_get_tls_interaction; ///
private alias c_soup_session_get_user_agentFn = extern(C) const(char)* function(SoupSession* session) nothrow;
__gshared c_soup_session_get_user_agentFn c_soup_session_get_user_agent; ///
private alias c_soup_session_has_featureFn = extern(C) gboolean function(SoupSession* session, GType featureType) nothrow;
__gshared c_soup_session_has_featureFn c_soup_session_has_feature; ///
private alias c_soup_session_preconnect_asyncFn = extern(C) void function(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_soup_session_preconnect_asyncFn c_soup_session_preconnect_async; ///
private alias c_soup_session_preconnect_finishFn = extern(C) gboolean function(SoupSession* session, GAsyncResult* result, GError** _err) nothrow;
__gshared c_soup_session_preconnect_finishFn c_soup_session_preconnect_finish; ///
private alias c_soup_session_remove_featureFn = extern(C) void function(SoupSession* session, SoupSessionFeature* feature) nothrow;
__gshared c_soup_session_remove_featureFn c_soup_session_remove_feature; ///
private alias c_soup_session_remove_feature_by_typeFn = extern(C) void function(SoupSession* session, GType featureType) nothrow;
__gshared c_soup_session_remove_feature_by_typeFn c_soup_session_remove_feature_by_type; ///
private alias c_soup_session_sendFn = extern(C) GInputStream* function(SoupSession* session, SoupMessage* msg, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_soup_session_sendFn c_soup_session_send; ///
private alias c_soup_session_send_and_readFn = extern(C) GBytes* function(SoupSession* session, SoupMessage* msg, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_soup_session_send_and_readFn c_soup_session_send_and_read; ///
private alias c_soup_session_send_and_read_asyncFn = extern(C) void function(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_soup_session_send_and_read_asyncFn c_soup_session_send_and_read_async; ///
private alias c_soup_session_send_and_read_finishFn = extern(C) GBytes* function(SoupSession* session, GAsyncResult* result, GError** _err) nothrow;
__gshared c_soup_session_send_and_read_finishFn c_soup_session_send_and_read_finish; ///
private alias c_soup_session_send_and_spliceFn = extern(C) ptrdiff_t function(SoupSession* session, SoupMessage* msg, GOutputStream* outStream, GOutputStreamSpliceFlags flags, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_soup_session_send_and_spliceFn c_soup_session_send_and_splice; ///
private alias c_soup_session_send_and_splice_asyncFn = extern(C) void function(SoupSession* session, SoupMessage* msg, GOutputStream* outStream, GOutputStreamSpliceFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_soup_session_send_and_splice_asyncFn c_soup_session_send_and_splice_async; ///
private alias c_soup_session_send_and_splice_finishFn = extern(C) ptrdiff_t function(SoupSession* session, GAsyncResult* result, GError** _err) nothrow;
__gshared c_soup_session_send_and_splice_finishFn c_soup_session_send_and_splice_finish; ///
private alias c_soup_session_send_asyncFn = extern(C) void function(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_soup_session_send_asyncFn c_soup_session_send_async; ///
private alias c_soup_session_send_finishFn = extern(C) GInputStream* function(SoupSession* session, GAsyncResult* result, GError** _err) nothrow;
__gshared c_soup_session_send_finishFn c_soup_session_send_finish; ///
private alias c_soup_session_set_accept_languageFn = extern(C) void function(SoupSession* session, const(char)* acceptLanguage) nothrow;
__gshared c_soup_session_set_accept_languageFn c_soup_session_set_accept_language; ///
private alias c_soup_session_set_accept_language_autoFn = extern(C) void function(SoupSession* session, gboolean acceptLanguageAuto) nothrow;
__gshared c_soup_session_set_accept_language_autoFn c_soup_session_set_accept_language_auto; ///
private alias c_soup_session_set_idle_timeoutFn = extern(C) void function(SoupSession* session, uint timeout) nothrow;
__gshared c_soup_session_set_idle_timeoutFn c_soup_session_set_idle_timeout; ///
private alias c_soup_session_set_proxy_resolverFn = extern(C) void function(SoupSession* session, GProxyResolver* proxyResolver) nothrow;
__gshared c_soup_session_set_proxy_resolverFn c_soup_session_set_proxy_resolver; ///
private alias c_soup_session_set_timeoutFn = extern(C) void function(SoupSession* session, uint timeout) nothrow;
__gshared c_soup_session_set_timeoutFn c_soup_session_set_timeout; ///
private alias c_soup_session_set_tls_databaseFn = extern(C) void function(SoupSession* session, GTlsDatabase* tlsDatabase) nothrow;
__gshared c_soup_session_set_tls_databaseFn c_soup_session_set_tls_database; ///
private alias c_soup_session_set_tls_interactionFn = extern(C) void function(SoupSession* session, GTlsInteraction* tlsInteraction) nothrow;
__gshared c_soup_session_set_tls_interactionFn c_soup_session_set_tls_interaction; ///
private alias c_soup_session_set_user_agentFn = extern(C) void function(SoupSession* session, const(char)* userAgent) nothrow;
__gshared c_soup_session_set_user_agentFn c_soup_session_set_user_agent; ///
private alias c_soup_session_websocket_connect_asyncFn = extern(C) void function(SoupSession* session, SoupMessage* msg, const(char)* origin, char** protocols, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_soup_session_websocket_connect_asyncFn c_soup_session_websocket_connect_async; ///
private alias c_soup_session_websocket_connect_finishFn = extern(C) SoupWebsocketConnection* function(SoupSession* session, GAsyncResult* result, GError** _err) nothrow;
__gshared c_soup_session_websocket_connect_finishFn c_soup_session_websocket_connect_finish; ///

// SessionFeature
private alias c_soup_session_feature_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_session_feature_get_typeFn c_soup_session_feature_get_type; ///

// WebsocketConnection
private alias c_soup_websocket_connection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_websocket_connection_get_typeFn c_soup_websocket_connection_get_type; ///
private alias c_soup_websocket_connection_newFn = extern(C) SoupWebsocketConnection* function(GIOStream* stream, GUri* uri, SoupWebsocketConnectionType type, const(char)* origin, const(char)* protocol, GList* extensions) nothrow;
__gshared c_soup_websocket_connection_newFn c_soup_websocket_connection_new; ///
private alias c_soup_websocket_connection_closeFn = extern(C) void function(SoupWebsocketConnection* self, ushort code, const(char)* data) nothrow;
__gshared c_soup_websocket_connection_closeFn c_soup_websocket_connection_close; ///
private alias c_soup_websocket_connection_get_close_codeFn = extern(C) ushort function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_close_codeFn c_soup_websocket_connection_get_close_code; ///
private alias c_soup_websocket_connection_get_close_dataFn = extern(C) const(char)* function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_close_dataFn c_soup_websocket_connection_get_close_data; ///
private alias c_soup_websocket_connection_get_connection_typeFn = extern(C) SoupWebsocketConnectionType function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_connection_typeFn c_soup_websocket_connection_get_connection_type; ///
private alias c_soup_websocket_connection_get_extensionsFn = extern(C) GList* function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_extensionsFn c_soup_websocket_connection_get_extensions; ///
private alias c_soup_websocket_connection_get_io_streamFn = extern(C) GIOStream* function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_io_streamFn c_soup_websocket_connection_get_io_stream; ///
private alias c_soup_websocket_connection_get_keepalive_intervalFn = extern(C) uint function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_keepalive_intervalFn c_soup_websocket_connection_get_keepalive_interval; ///
private alias c_soup_websocket_connection_get_keepalive_pong_timeoutFn = extern(C) uint function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_keepalive_pong_timeoutFn c_soup_websocket_connection_get_keepalive_pong_timeout; ///
private alias c_soup_websocket_connection_get_max_incoming_payload_sizeFn = extern(C) ulong function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_max_incoming_payload_sizeFn c_soup_websocket_connection_get_max_incoming_payload_size; ///
private alias c_soup_websocket_connection_get_originFn = extern(C) const(char)* function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_originFn c_soup_websocket_connection_get_origin; ///
private alias c_soup_websocket_connection_get_protocolFn = extern(C) const(char)* function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_protocolFn c_soup_websocket_connection_get_protocol; ///
private alias c_soup_websocket_connection_get_stateFn = extern(C) SoupWebsocketState function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_stateFn c_soup_websocket_connection_get_state; ///
private alias c_soup_websocket_connection_get_uriFn = extern(C) GUri* function(SoupWebsocketConnection* self) nothrow;
__gshared c_soup_websocket_connection_get_uriFn c_soup_websocket_connection_get_uri; ///
private alias c_soup_websocket_connection_send_binaryFn = extern(C) void function(SoupWebsocketConnection* self, const(void)* data, size_t length) nothrow;
__gshared c_soup_websocket_connection_send_binaryFn c_soup_websocket_connection_send_binary; ///
private alias c_soup_websocket_connection_send_messageFn = extern(C) void function(SoupWebsocketConnection* self, SoupWebsocketDataType type, GBytes* message) nothrow;
__gshared c_soup_websocket_connection_send_messageFn c_soup_websocket_connection_send_message; ///
private alias c_soup_websocket_connection_send_textFn = extern(C) void function(SoupWebsocketConnection* self, const(char)* text) nothrow;
__gshared c_soup_websocket_connection_send_textFn c_soup_websocket_connection_send_text; ///
private alias c_soup_websocket_connection_set_keepalive_intervalFn = extern(C) void function(SoupWebsocketConnection* self, uint interval) nothrow;
__gshared c_soup_websocket_connection_set_keepalive_intervalFn c_soup_websocket_connection_set_keepalive_interval; ///
private alias c_soup_websocket_connection_set_keepalive_pong_timeoutFn = extern(C) void function(SoupWebsocketConnection* self, uint pongTimeout) nothrow;
__gshared c_soup_websocket_connection_set_keepalive_pong_timeoutFn c_soup_websocket_connection_set_keepalive_pong_timeout; ///
private alias c_soup_websocket_connection_set_max_incoming_payload_sizeFn = extern(C) void function(SoupWebsocketConnection* self, ulong maxIncomingPayloadSize) nothrow;
__gshared c_soup_websocket_connection_set_max_incoming_payload_sizeFn c_soup_websocket_connection_set_max_incoming_payload_size; ///

// WebsocketExtension
private alias c_soup_websocket_extension_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_websocket_extension_get_typeFn c_soup_websocket_extension_get_type; ///
private alias c_soup_websocket_extension_configureFn = extern(C) gboolean function(SoupWebsocketExtension* extension, SoupWebsocketConnectionType connectionType, GHashTable* params, GError** _err) nothrow;
__gshared c_soup_websocket_extension_configureFn c_soup_websocket_extension_configure; ///
private alias c_soup_websocket_extension_get_request_paramsFn = extern(C) char* function(SoupWebsocketExtension* extension) nothrow;
__gshared c_soup_websocket_extension_get_request_paramsFn c_soup_websocket_extension_get_request_params; ///
private alias c_soup_websocket_extension_get_response_paramsFn = extern(C) char* function(SoupWebsocketExtension* extension) nothrow;
__gshared c_soup_websocket_extension_get_response_paramsFn c_soup_websocket_extension_get_response_params; ///
private alias c_soup_websocket_extension_process_incoming_messageFn = extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) nothrow;
__gshared c_soup_websocket_extension_process_incoming_messageFn c_soup_websocket_extension_process_incoming_message; ///
private alias c_soup_websocket_extension_process_outgoing_messageFn = extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) nothrow;
__gshared c_soup_websocket_extension_process_outgoing_messageFn c_soup_websocket_extension_process_outgoing_message; ///

// WebsocketExtensionDeflate
private alias c_soup_websocket_extension_deflate_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_websocket_extension_deflate_get_typeFn c_soup_websocket_extension_deflate_get_type; ///

// WebsocketExtensionManager
private alias c_soup_websocket_extension_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_soup_websocket_extension_manager_get_typeFn c_soup_websocket_extension_manager_get_type; ///

// global
private alias c_soup_check_versionFn = extern(C) gboolean function(uint major, uint minor, uint micro) nothrow;
__gshared c_soup_check_versionFn c_soup_check_version; ///
private alias c_soup_cookies_freeFn = extern(C) void function(GSList* cookies) nothrow;
__gshared c_soup_cookies_freeFn c_soup_cookies_free; ///
private alias c_soup_cookies_from_requestFn = extern(C) GSList* function(SoupMessage* msg) nothrow;
__gshared c_soup_cookies_from_requestFn c_soup_cookies_from_request; ///
private alias c_soup_cookies_from_responseFn = extern(C) GSList* function(SoupMessage* msg) nothrow;
__gshared c_soup_cookies_from_responseFn c_soup_cookies_from_response; ///
private alias c_soup_cookies_to_cookie_headerFn = extern(C) char* function(GSList* cookies) nothrow;
__gshared c_soup_cookies_to_cookie_headerFn c_soup_cookies_to_cookie_header; ///
private alias c_soup_cookies_to_requestFn = extern(C) void function(GSList* cookies, SoupMessage* msg) nothrow;
__gshared c_soup_cookies_to_requestFn c_soup_cookies_to_request; ///
private alias c_soup_cookies_to_responseFn = extern(C) void function(GSList* cookies, SoupMessage* msg) nothrow;
__gshared c_soup_cookies_to_responseFn c_soup_cookies_to_response; ///
private alias c_soup_date_time_new_from_http_stringFn = extern(C) GDateTime* function(const(char)* dateString) nothrow;
__gshared c_soup_date_time_new_from_http_stringFn c_soup_date_time_new_from_http_string; ///
private alias c_soup_date_time_to_stringFn = extern(C) char* function(GDateTime* date, SoupDateFormat format) nothrow;
__gshared c_soup_date_time_to_stringFn c_soup_date_time_to_string; ///
private alias c_soup_form_decodeFn = extern(C) GHashTable* function(const(char)* encodedForm) nothrow;
__gshared c_soup_form_decodeFn c_soup_form_decode; ///
private alias c_soup_form_decode_multipartFn = extern(C) GHashTable* function(SoupMultipart* multipart, const(char)* fileControlName, char** filename, char** contentType, GBytes** file) nothrow;
__gshared c_soup_form_decode_multipartFn c_soup_form_decode_multipart; ///
private alias c_soup_form_encodeFn = extern(C) char* function(const(char)* firstField,  ...) nothrow;
__gshared c_soup_form_encodeFn c_soup_form_encode; ///
private alias c_soup_form_encode_datalistFn = extern(C) char* function(GData** formDataSet) nothrow;
__gshared c_soup_form_encode_datalistFn c_soup_form_encode_datalist; ///
private alias c_soup_form_encode_hashFn = extern(C) char* function(GHashTable* formDataSet) nothrow;
__gshared c_soup_form_encode_hashFn c_soup_form_encode_hash; ///
private alias c_soup_form_encode_valistFn = extern(C) char* function(const(char)* firstField, void* args) nothrow;
__gshared c_soup_form_encode_valistFn c_soup_form_encode_valist; ///
private alias c_soup_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_soup_get_major_versionFn c_soup_get_major_version; ///
private alias c_soup_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_soup_get_micro_versionFn c_soup_get_micro_version; ///
private alias c_soup_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_soup_get_minor_versionFn c_soup_get_minor_version; ///
private alias c_soup_header_containsFn = extern(C) gboolean function(const(char)* header, const(char)* token) nothrow;
__gshared c_soup_header_containsFn c_soup_header_contains; ///
private alias c_soup_header_free_listFn = extern(C) void function(GSList* list) nothrow;
__gshared c_soup_header_free_listFn c_soup_header_free_list; ///
private alias c_soup_header_free_param_listFn = extern(C) void function(GHashTable* paramList) nothrow;
__gshared c_soup_header_free_param_listFn c_soup_header_free_param_list; ///
private alias c_soup_header_g_string_append_paramFn = extern(C) void function(GString* string_, const(char)* name, const(char)* value) nothrow;
__gshared c_soup_header_g_string_append_paramFn c_soup_header_g_string_append_param; ///
private alias c_soup_header_g_string_append_param_quotedFn = extern(C) void function(GString* string_, const(char)* name, const(char)* value) nothrow;
__gshared c_soup_header_g_string_append_param_quotedFn c_soup_header_g_string_append_param_quoted; ///
private alias c_soup_header_parse_listFn = extern(C) GSList* function(const(char)* header) nothrow;
__gshared c_soup_header_parse_listFn c_soup_header_parse_list; ///
private alias c_soup_header_parse_param_listFn = extern(C) GHashTable* function(const(char)* header) nothrow;
__gshared c_soup_header_parse_param_listFn c_soup_header_parse_param_list; ///
private alias c_soup_header_parse_param_list_strictFn = extern(C) GHashTable* function(const(char)* header) nothrow;
__gshared c_soup_header_parse_param_list_strictFn c_soup_header_parse_param_list_strict; ///
private alias c_soup_header_parse_quality_listFn = extern(C) GSList* function(const(char)* header, GSList** unacceptable) nothrow;
__gshared c_soup_header_parse_quality_listFn c_soup_header_parse_quality_list; ///
private alias c_soup_header_parse_semi_param_listFn = extern(C) GHashTable* function(const(char)* header) nothrow;
__gshared c_soup_header_parse_semi_param_listFn c_soup_header_parse_semi_param_list; ///
private alias c_soup_header_parse_semi_param_list_strictFn = extern(C) GHashTable* function(const(char)* header) nothrow;
__gshared c_soup_header_parse_semi_param_list_strictFn c_soup_header_parse_semi_param_list_strict; ///
private alias c_soup_headers_parseFn = extern(C) gboolean function(const(char)* str, int len, SoupMessageHeaders* dest) nothrow;
__gshared c_soup_headers_parseFn c_soup_headers_parse; ///
private alias c_soup_headers_parse_requestFn = extern(C) uint function(const(char)* str, int len, SoupMessageHeaders* reqHeaders, char** reqMethod, char** reqPath, SoupHTTPVersion* ver) nothrow;
__gshared c_soup_headers_parse_requestFn c_soup_headers_parse_request; ///
private alias c_soup_headers_parse_responseFn = extern(C) gboolean function(const(char)* str, int len, SoupMessageHeaders* headers, SoupHTTPVersion* ver, uint* statusCode, char** reasonPhrase) nothrow;
__gshared c_soup_headers_parse_responseFn c_soup_headers_parse_response; ///
private alias c_soup_headers_parse_status_lineFn = extern(C) gboolean function(const(char)* statusLine, SoupHTTPVersion* ver, uint* statusCode, char** reasonPhrase) nothrow;
__gshared c_soup_headers_parse_status_lineFn c_soup_headers_parse_status_line; ///
private alias c_soup_tld_domain_is_public_suffixFn = extern(C) gboolean function(const(char)* domain) nothrow;
__gshared c_soup_tld_domain_is_public_suffixFn c_soup_tld_domain_is_public_suffix; ///
private alias c_soup_tld_get_base_domainFn = extern(C) const(char)* function(const(char)* hostname, GError** _err) nothrow;
__gshared c_soup_tld_get_base_domainFn c_soup_tld_get_base_domain; ///
private alias c_soup_uri_copyFn = extern(C) GUri* function(GUri* uri, SoupURIComponent firstComponent,  ...) nothrow;
__gshared c_soup_uri_copyFn c_soup_uri_copy; ///
private alias c_soup_uri_decode_data_uriFn = extern(C) GBytes* function(const(char)* uri, char** contentType) nothrow;
__gshared c_soup_uri_decode_data_uriFn c_soup_uri_decode_data_uri; ///
private alias c_soup_uri_equalFn = extern(C) gboolean function(GUri* uri1, GUri* uri2) nothrow;
__gshared c_soup_uri_equalFn c_soup_uri_equal; ///
private alias c_soup_websocket_client_prepare_handshakeFn = extern(C) void function(SoupMessage* msg, const(char)* origin, char** protocols, GPtrArray* supportedExtensions) nothrow;
__gshared c_soup_websocket_client_prepare_handshakeFn c_soup_websocket_client_prepare_handshake; ///
private alias c_soup_websocket_client_verify_handshakeFn = extern(C) gboolean function(SoupMessage* msg, GPtrArray* supportedExtensions, GList** acceptedExtensions, GError** _err) nothrow;
__gshared c_soup_websocket_client_verify_handshakeFn c_soup_websocket_client_verify_handshake; ///
private alias c_soup_websocket_server_check_handshakeFn = extern(C) gboolean function(SoupServerMessage* msg, const(char)* origin, char** protocols, GPtrArray* supportedExtensions, GError** _err) nothrow;
__gshared c_soup_websocket_server_check_handshakeFn c_soup_websocket_server_check_handshake; ///
private alias c_soup_websocket_server_process_handshakeFn = extern(C) gboolean function(SoupServerMessage* msg, const(char)* expectedOrigin, char** protocols, GPtrArray* supportedExtensions, GList** acceptedExtensions) nothrow;
__gshared c_soup_websocket_server_process_handshakeFn c_soup_websocket_server_process_handshake; ///

// SessionError
private alias c_soup_session_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_soup_session_error_quarkFn c_soup_session_error_quark; ///

// Status
private alias c_soup_status_get_phraseFn = extern(C) const(char)* function(uint statusCode) nothrow;
__gshared c_soup_status_get_phraseFn c_soup_status_get_phrase; ///

// TLDError
private alias c_soup_tld_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_soup_tld_error_quarkFn c_soup_tld_error_quark; ///

// WebsocketError
private alias c_soup_websocket_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_soup_websocket_error_quarkFn c_soup_websocket_error_quark; ///

// Auth

/** */
alias soup_auth_get_type = c_soup_auth_get_type;

/** */
alias soup_auth_new = c_soup_auth_new;

/** */
alias soup_auth_authenticate = c_soup_auth_authenticate;

/** */
alias soup_auth_can_authenticate = c_soup_auth_can_authenticate;

/** */
alias soup_auth_cancel = c_soup_auth_cancel;

/** */
alias soup_auth_free_protection_space = c_soup_auth_free_protection_space;

/** */
alias soup_auth_get_authority = c_soup_auth_get_authority;

/** */
alias soup_auth_get_authorization = c_soup_auth_get_authorization;

/** */
alias soup_auth_get_info = c_soup_auth_get_info;

/** */
alias soup_auth_get_protection_space = c_soup_auth_get_protection_space;

/** */
alias soup_auth_get_realm = c_soup_auth_get_realm;

/** */
alias soup_auth_get_scheme_name = c_soup_auth_get_scheme_name;

/** */
alias soup_auth_is_authenticated = c_soup_auth_is_authenticated;

/** */
alias soup_auth_is_cancelled = c_soup_auth_is_cancelled;

/** */
alias soup_auth_is_for_proxy = c_soup_auth_is_for_proxy;

/** */
alias soup_auth_is_ready = c_soup_auth_is_ready;

/** */
alias soup_auth_update = c_soup_auth_update;

// AuthBasic

/** */
alias soup_auth_basic_get_type = c_soup_auth_basic_get_type;

// AuthDigest

/** */
alias soup_auth_digest_get_type = c_soup_auth_digest_get_type;

// AuthDomain

/** */
alias soup_auth_domain_get_type = c_soup_auth_domain_get_type;

/** */
alias soup_auth_domain_accepts = c_soup_auth_domain_accepts;

/** */
alias soup_auth_domain_add_path = c_soup_auth_domain_add_path;

/** */
alias soup_auth_domain_challenge = c_soup_auth_domain_challenge;

/** */
alias soup_auth_domain_check_password = c_soup_auth_domain_check_password;

/** */
alias soup_auth_domain_covers = c_soup_auth_domain_covers;

/** */
alias soup_auth_domain_get_realm = c_soup_auth_domain_get_realm;

/** */
alias soup_auth_domain_remove_path = c_soup_auth_domain_remove_path;

/** */
alias soup_auth_domain_set_filter = c_soup_auth_domain_set_filter;

/** */
alias soup_auth_domain_set_generic_auth_callback = c_soup_auth_domain_set_generic_auth_callback;

// AuthDomainBasic

/** */
alias soup_auth_domain_basic_get_type = c_soup_auth_domain_basic_get_type;

/** */
alias soup_auth_domain_basic_new = c_soup_auth_domain_basic_new;

/** */
alias soup_auth_domain_basic_set_auth_callback = c_soup_auth_domain_basic_set_auth_callback;

// AuthDomainDigest

/** */
alias soup_auth_domain_digest_get_type = c_soup_auth_domain_digest_get_type;

/** */
alias soup_auth_domain_digest_new = c_soup_auth_domain_digest_new;

/** */
alias soup_auth_domain_digest_encode_password = c_soup_auth_domain_digest_encode_password;

/** */
alias soup_auth_domain_digest_set_auth_callback = c_soup_auth_domain_digest_set_auth_callback;

// AuthManager

/** */
alias soup_auth_manager_get_type = c_soup_auth_manager_get_type;

/** */
alias soup_auth_manager_clear_cached_credentials = c_soup_auth_manager_clear_cached_credentials;

/** */
alias soup_auth_manager_use_auth = c_soup_auth_manager_use_auth;

// AuthNTLM

/** */
alias soup_auth_ntlm_get_type = c_soup_auth_ntlm_get_type;

// AuthNegotiate

/** */
alias soup_auth_negotiate_get_type = c_soup_auth_negotiate_get_type;

/** */
alias soup_auth_negotiate_supported = c_soup_auth_negotiate_supported;

// Cache

/** */
alias soup_cache_get_type = c_soup_cache_get_type;

/** */
alias soup_cache_new = c_soup_cache_new;

/** */
alias soup_cache_clear = c_soup_cache_clear;

/** */
alias soup_cache_dump = c_soup_cache_dump;

/** */
alias soup_cache_flush = c_soup_cache_flush;

/** */
alias soup_cache_get_max_size = c_soup_cache_get_max_size;

/** */
alias soup_cache_load = c_soup_cache_load;

/** */
alias soup_cache_set_max_size = c_soup_cache_set_max_size;

// ContentDecoder

/** */
alias soup_content_decoder_get_type = c_soup_content_decoder_get_type;

// ContentSniffer

/** */
alias soup_content_sniffer_get_type = c_soup_content_sniffer_get_type;

/** */
alias soup_content_sniffer_new = c_soup_content_sniffer_new;

/** */
alias soup_content_sniffer_sniff = c_soup_content_sniffer_sniff;

// Cookie

/** */
alias soup_cookie_get_type = c_soup_cookie_get_type;

/** */
alias soup_cookie_new = c_soup_cookie_new;

/** */
alias soup_cookie_applies_to_uri = c_soup_cookie_applies_to_uri;

/** */
alias soup_cookie_copy = c_soup_cookie_copy;

/** */
alias soup_cookie_domain_matches = c_soup_cookie_domain_matches;

/** */
alias soup_cookie_equal = c_soup_cookie_equal;

/** */
alias soup_cookie_free = c_soup_cookie_free;

/** */
alias soup_cookie_get_domain = c_soup_cookie_get_domain;

/** */
alias soup_cookie_get_expires = c_soup_cookie_get_expires;

/** */
alias soup_cookie_get_http_only = c_soup_cookie_get_http_only;

/** */
alias soup_cookie_get_name = c_soup_cookie_get_name;

/** */
alias soup_cookie_get_path = c_soup_cookie_get_path;

/** */
alias soup_cookie_get_same_site_policy = c_soup_cookie_get_same_site_policy;

/** */
alias soup_cookie_get_secure = c_soup_cookie_get_secure;

/** */
alias soup_cookie_get_value = c_soup_cookie_get_value;

/** */
alias soup_cookie_set_domain = c_soup_cookie_set_domain;

/** */
alias soup_cookie_set_expires = c_soup_cookie_set_expires;

/** */
alias soup_cookie_set_http_only = c_soup_cookie_set_http_only;

/** */
alias soup_cookie_set_max_age = c_soup_cookie_set_max_age;

/** */
alias soup_cookie_set_name = c_soup_cookie_set_name;

/** */
alias soup_cookie_set_path = c_soup_cookie_set_path;

/** */
alias soup_cookie_set_same_site_policy = c_soup_cookie_set_same_site_policy;

/** */
alias soup_cookie_set_secure = c_soup_cookie_set_secure;

/** */
alias soup_cookie_set_value = c_soup_cookie_set_value;

/** */
alias soup_cookie_to_cookie_header = c_soup_cookie_to_cookie_header;

/** */
alias soup_cookie_to_set_cookie_header = c_soup_cookie_to_set_cookie_header;

/** */
alias soup_cookie_parse = c_soup_cookie_parse;

// CookieJar

/** */
alias soup_cookie_jar_get_type = c_soup_cookie_jar_get_type;

/** */
alias soup_cookie_jar_new = c_soup_cookie_jar_new;

/** */
alias soup_cookie_jar_add_cookie = c_soup_cookie_jar_add_cookie;

/** */
alias soup_cookie_jar_add_cookie_full = c_soup_cookie_jar_add_cookie_full;

/** */
alias soup_cookie_jar_add_cookie_with_first_party = c_soup_cookie_jar_add_cookie_with_first_party;

/** */
alias soup_cookie_jar_all_cookies = c_soup_cookie_jar_all_cookies;

/** */
alias soup_cookie_jar_delete_cookie = c_soup_cookie_jar_delete_cookie;

/** */
alias soup_cookie_jar_get_accept_policy = c_soup_cookie_jar_get_accept_policy;

/** */
alias soup_cookie_jar_get_cookie_list = c_soup_cookie_jar_get_cookie_list;

/** */
alias soup_cookie_jar_get_cookie_list_with_same_site_info = c_soup_cookie_jar_get_cookie_list_with_same_site_info;

/** */
alias soup_cookie_jar_get_cookies = c_soup_cookie_jar_get_cookies;

/** */
alias soup_cookie_jar_is_persistent = c_soup_cookie_jar_is_persistent;

/** */
alias soup_cookie_jar_set_accept_policy = c_soup_cookie_jar_set_accept_policy;

/** */
alias soup_cookie_jar_set_cookie = c_soup_cookie_jar_set_cookie;

/** */
alias soup_cookie_jar_set_cookie_with_first_party = c_soup_cookie_jar_set_cookie_with_first_party;

// CookieJarDB

/** */
alias soup_cookie_jar_db_get_type = c_soup_cookie_jar_db_get_type;

/** */
alias soup_cookie_jar_db_new = c_soup_cookie_jar_db_new;

// CookieJarText

/** */
alias soup_cookie_jar_text_get_type = c_soup_cookie_jar_text_get_type;

/** */
alias soup_cookie_jar_text_new = c_soup_cookie_jar_text_new;

// HSTSEnforcer

/** */
alias soup_hsts_enforcer_get_type = c_soup_hsts_enforcer_get_type;

/** */
alias soup_hsts_enforcer_new = c_soup_hsts_enforcer_new;

/** */
alias soup_hsts_enforcer_get_domains = c_soup_hsts_enforcer_get_domains;

/** */
alias soup_hsts_enforcer_get_policies = c_soup_hsts_enforcer_get_policies;

/** */
alias soup_hsts_enforcer_has_valid_policy = c_soup_hsts_enforcer_has_valid_policy;

/** */
alias soup_hsts_enforcer_is_persistent = c_soup_hsts_enforcer_is_persistent;

/** */
alias soup_hsts_enforcer_set_policy = c_soup_hsts_enforcer_set_policy;

/** */
alias soup_hsts_enforcer_set_session_policy = c_soup_hsts_enforcer_set_session_policy;

// HSTSEnforcerDB

/** */
alias soup_hsts_enforcer_db_get_type = c_soup_hsts_enforcer_db_get_type;

/** */
alias soup_hsts_enforcer_db_new = c_soup_hsts_enforcer_db_new;

// HSTSPolicy

/** */
alias soup_hsts_policy_get_type = c_soup_hsts_policy_get_type;

/** */
alias soup_hsts_policy_new = c_soup_hsts_policy_new;

/** */
alias soup_hsts_policy_new_from_response = c_soup_hsts_policy_new_from_response;

/** */
alias soup_hsts_policy_new_full = c_soup_hsts_policy_new_full;

/** */
alias soup_hsts_policy_new_session_policy = c_soup_hsts_policy_new_session_policy;

/** */
alias soup_hsts_policy_copy = c_soup_hsts_policy_copy;

/** */
alias soup_hsts_policy_equal = c_soup_hsts_policy_equal;

/** */
alias soup_hsts_policy_free = c_soup_hsts_policy_free;

/** */
alias soup_hsts_policy_get_domain = c_soup_hsts_policy_get_domain;

/** */
alias soup_hsts_policy_get_expires = c_soup_hsts_policy_get_expires;

/** */
alias soup_hsts_policy_get_max_age = c_soup_hsts_policy_get_max_age;

/** */
alias soup_hsts_policy_includes_subdomains = c_soup_hsts_policy_includes_subdomains;

/** */
alias soup_hsts_policy_is_expired = c_soup_hsts_policy_is_expired;

/** */
alias soup_hsts_policy_is_session_policy = c_soup_hsts_policy_is_session_policy;

// Logger

/** */
alias soup_logger_get_type = c_soup_logger_get_type;

/** */
alias soup_logger_new = c_soup_logger_new;

/** */
alias soup_logger_get_max_body_size = c_soup_logger_get_max_body_size;

/** */
alias soup_logger_set_max_body_size = c_soup_logger_set_max_body_size;

/** */
alias soup_logger_set_printer = c_soup_logger_set_printer;

/** */
alias soup_logger_set_request_filter = c_soup_logger_set_request_filter;

/** */
alias soup_logger_set_response_filter = c_soup_logger_set_response_filter;

// Message

/** */
alias soup_message_get_type = c_soup_message_get_type;

/** */
alias soup_message_new = c_soup_message_new;

/** */
alias soup_message_new_from_encoded_form = c_soup_message_new_from_encoded_form;

/** */
alias soup_message_new_from_multipart = c_soup_message_new_from_multipart;

/** */
alias soup_message_new_from_uri = c_soup_message_new_from_uri;

/** */
alias soup_message_new_options_ping = c_soup_message_new_options_ping;

/** */
alias soup_message_add_flags = c_soup_message_add_flags;

/** */
alias soup_message_add_header_handler = c_soup_message_add_header_handler;

/** */
alias soup_message_add_status_code_handler = c_soup_message_add_status_code_handler;

/** */
alias soup_message_disable_feature = c_soup_message_disable_feature;

/** */
alias soup_message_get_connection_id = c_soup_message_get_connection_id;

/** */
alias soup_message_get_first_party = c_soup_message_get_first_party;

/** */
alias soup_message_get_flags = c_soup_message_get_flags;

/** */
alias soup_message_get_force_http1 = c_soup_message_get_force_http1;

/** */
alias soup_message_get_http_version = c_soup_message_get_http_version;

/** */
alias soup_message_get_is_options_ping = c_soup_message_get_is_options_ping;

/** */
alias soup_message_get_is_top_level_navigation = c_soup_message_get_is_top_level_navigation;

/** */
alias soup_message_get_method = c_soup_message_get_method;

/** */
alias soup_message_get_metrics = c_soup_message_get_metrics;

/** */
alias soup_message_get_priority = c_soup_message_get_priority;

/** */
alias soup_message_get_reason_phrase = c_soup_message_get_reason_phrase;

/** */
alias soup_message_get_remote_address = c_soup_message_get_remote_address;

/** */
alias soup_message_get_request_headers = c_soup_message_get_request_headers;

/** */
alias soup_message_get_response_headers = c_soup_message_get_response_headers;

/** */
alias soup_message_get_site_for_cookies = c_soup_message_get_site_for_cookies;

/** */
alias soup_message_get_status = c_soup_message_get_status;

/** */
alias soup_message_get_tls_ciphersuite_name = c_soup_message_get_tls_ciphersuite_name;

/** */
alias soup_message_get_tls_peer_certificate = c_soup_message_get_tls_peer_certificate;

/** */
alias soup_message_get_tls_peer_certificate_errors = c_soup_message_get_tls_peer_certificate_errors;

/** */
alias soup_message_get_tls_protocol_version = c_soup_message_get_tls_protocol_version;

/** */
alias soup_message_get_uri = c_soup_message_get_uri;

/** */
alias soup_message_is_feature_disabled = c_soup_message_is_feature_disabled;

/** */
alias soup_message_is_keepalive = c_soup_message_is_keepalive;

/** */
alias soup_message_query_flags = c_soup_message_query_flags;

/** */
alias soup_message_remove_flags = c_soup_message_remove_flags;

/** */
alias soup_message_set_first_party = c_soup_message_set_first_party;

/** */
alias soup_message_set_flags = c_soup_message_set_flags;

/** */
alias soup_message_set_force_http1 = c_soup_message_set_force_http1;

/** */
alias soup_message_set_is_options_ping = c_soup_message_set_is_options_ping;

/** */
alias soup_message_set_is_top_level_navigation = c_soup_message_set_is_top_level_navigation;

/** */
alias soup_message_set_method = c_soup_message_set_method;

/** */
alias soup_message_set_priority = c_soup_message_set_priority;

/** */
alias soup_message_set_request_body = c_soup_message_set_request_body;

/** */
alias soup_message_set_request_body_from_bytes = c_soup_message_set_request_body_from_bytes;

/** */
alias soup_message_set_site_for_cookies = c_soup_message_set_site_for_cookies;

/** */
alias soup_message_set_tls_client_certificate = c_soup_message_set_tls_client_certificate;

/** */
alias soup_message_set_uri = c_soup_message_set_uri;

/** */
alias soup_message_tls_client_certificate_password_request_complete = c_soup_message_tls_client_certificate_password_request_complete;

// MessageBody

/** */
alias soup_message_body_get_type = c_soup_message_body_get_type;

/** */
alias soup_message_body_new = c_soup_message_body_new;

/** */
alias soup_message_body_append = c_soup_message_body_append;

/** */
alias soup_message_body_append_bytes = c_soup_message_body_append_bytes;

/** */
alias soup_message_body_append_take = c_soup_message_body_append_take;

/** */
alias soup_message_body_complete = c_soup_message_body_complete;

/** */
alias soup_message_body_flatten = c_soup_message_body_flatten;

/** */
alias soup_message_body_get_accumulate = c_soup_message_body_get_accumulate;

/** */
alias soup_message_body_get_chunk = c_soup_message_body_get_chunk;

/** */
alias soup_message_body_got_chunk = c_soup_message_body_got_chunk;

/** */
alias soup_message_body_ref = c_soup_message_body_ref;

/** */
alias soup_message_body_set_accumulate = c_soup_message_body_set_accumulate;

/** */
alias soup_message_body_truncate = c_soup_message_body_truncate;

/** */
alias soup_message_body_unref = c_soup_message_body_unref;

/** */
alias soup_message_body_wrote_chunk = c_soup_message_body_wrote_chunk;

// MessageHeaders

/** */
alias soup_message_headers_get_type = c_soup_message_headers_get_type;

/** */
alias soup_message_headers_new = c_soup_message_headers_new;

/** */
alias soup_message_headers_append = c_soup_message_headers_append;

/** */
alias soup_message_headers_clean_connection_headers = c_soup_message_headers_clean_connection_headers;

/** */
alias soup_message_headers_clear = c_soup_message_headers_clear;

/** */
alias soup_message_headers_foreach = c_soup_message_headers_foreach;

/** */
alias soup_message_headers_free_ranges = c_soup_message_headers_free_ranges;

/** */
alias soup_message_headers_get_content_disposition = c_soup_message_headers_get_content_disposition;

/** */
alias soup_message_headers_get_content_length = c_soup_message_headers_get_content_length;

/** */
alias soup_message_headers_get_content_range = c_soup_message_headers_get_content_range;

/** */
alias soup_message_headers_get_content_type = c_soup_message_headers_get_content_type;

/** */
alias soup_message_headers_get_encoding = c_soup_message_headers_get_encoding;

/** */
alias soup_message_headers_get_expectations = c_soup_message_headers_get_expectations;

/** */
alias soup_message_headers_get_headers_type = c_soup_message_headers_get_headers_type;

/** */
alias soup_message_headers_get_list = c_soup_message_headers_get_list;

/** */
alias soup_message_headers_get_one = c_soup_message_headers_get_one;

/** */
alias soup_message_headers_get_ranges = c_soup_message_headers_get_ranges;

/** */
alias soup_message_headers_header_contains = c_soup_message_headers_header_contains;

/** */
alias soup_message_headers_header_equals = c_soup_message_headers_header_equals;

/** */
alias soup_message_headers_ref = c_soup_message_headers_ref;

/** */
alias soup_message_headers_remove = c_soup_message_headers_remove;

/** */
alias soup_message_headers_replace = c_soup_message_headers_replace;

/** */
alias soup_message_headers_set_content_disposition = c_soup_message_headers_set_content_disposition;

/** */
alias soup_message_headers_set_content_length = c_soup_message_headers_set_content_length;

/** */
alias soup_message_headers_set_content_range = c_soup_message_headers_set_content_range;

/** */
alias soup_message_headers_set_content_type = c_soup_message_headers_set_content_type;

/** */
alias soup_message_headers_set_encoding = c_soup_message_headers_set_encoding;

/** */
alias soup_message_headers_set_expectations = c_soup_message_headers_set_expectations;

/** */
alias soup_message_headers_set_range = c_soup_message_headers_set_range;

/** */
alias soup_message_headers_set_ranges = c_soup_message_headers_set_ranges;

/** */
alias soup_message_headers_unref = c_soup_message_headers_unref;

// MessageHeadersIter

/** */
alias soup_message_headers_iter_init = c_soup_message_headers_iter_init;

/** */
alias soup_message_headers_iter_next = c_soup_message_headers_iter_next;

// MessageMetrics

/** */
alias soup_message_metrics_get_type = c_soup_message_metrics_get_type;

/** */
alias soup_message_metrics_copy = c_soup_message_metrics_copy;

/** */
alias soup_message_metrics_free = c_soup_message_metrics_free;

/** */
alias soup_message_metrics_get_connect_end = c_soup_message_metrics_get_connect_end;

/** */
alias soup_message_metrics_get_connect_start = c_soup_message_metrics_get_connect_start;

/** */
alias soup_message_metrics_get_dns_end = c_soup_message_metrics_get_dns_end;

/** */
alias soup_message_metrics_get_dns_start = c_soup_message_metrics_get_dns_start;

/** */
alias soup_message_metrics_get_fetch_start = c_soup_message_metrics_get_fetch_start;

/** */
alias soup_message_metrics_get_request_body_bytes_sent = c_soup_message_metrics_get_request_body_bytes_sent;

/** */
alias soup_message_metrics_get_request_body_size = c_soup_message_metrics_get_request_body_size;

/** */
alias soup_message_metrics_get_request_header_bytes_sent = c_soup_message_metrics_get_request_header_bytes_sent;

/** */
alias soup_message_metrics_get_request_start = c_soup_message_metrics_get_request_start;

/** */
alias soup_message_metrics_get_response_body_bytes_received = c_soup_message_metrics_get_response_body_bytes_received;

/** */
alias soup_message_metrics_get_response_body_size = c_soup_message_metrics_get_response_body_size;

/** */
alias soup_message_metrics_get_response_end = c_soup_message_metrics_get_response_end;

/** */
alias soup_message_metrics_get_response_header_bytes_received = c_soup_message_metrics_get_response_header_bytes_received;

/** */
alias soup_message_metrics_get_response_start = c_soup_message_metrics_get_response_start;

/** */
alias soup_message_metrics_get_tls_start = c_soup_message_metrics_get_tls_start;

// Multipart

/** */
alias soup_multipart_get_type = c_soup_multipart_get_type;

/** */
alias soup_multipart_new = c_soup_multipart_new;

/** */
alias soup_multipart_new_from_message = c_soup_multipart_new_from_message;

/** */
alias soup_multipart_append_form_file = c_soup_multipart_append_form_file;

/** */
alias soup_multipart_append_form_string = c_soup_multipart_append_form_string;

/** */
alias soup_multipart_append_part = c_soup_multipart_append_part;

/** */
alias soup_multipart_free = c_soup_multipart_free;

/** */
alias soup_multipart_get_length = c_soup_multipart_get_length;

/** */
alias soup_multipart_get_part = c_soup_multipart_get_part;

/** */
alias soup_multipart_to_message = c_soup_multipart_to_message;

// MultipartInputStream

/** */
alias soup_multipart_input_stream_get_type = c_soup_multipart_input_stream_get_type;

/** */
alias soup_multipart_input_stream_new = c_soup_multipart_input_stream_new;

/** */
alias soup_multipart_input_stream_get_headers = c_soup_multipart_input_stream_get_headers;

/** */
alias soup_multipart_input_stream_next_part = c_soup_multipart_input_stream_next_part;

/** */
alias soup_multipart_input_stream_next_part_async = c_soup_multipart_input_stream_next_part_async;

/** */
alias soup_multipart_input_stream_next_part_finish = c_soup_multipart_input_stream_next_part_finish;

// Server

/** */
alias soup_server_get_type = c_soup_server_get_type;

/** */
alias soup_server_new = c_soup_server_new;

/** */
alias soup_server_accept_iostream = c_soup_server_accept_iostream;

/** */
alias soup_server_add_auth_domain = c_soup_server_add_auth_domain;

/** */
alias soup_server_add_early_handler = c_soup_server_add_early_handler;

/** */
alias soup_server_add_handler = c_soup_server_add_handler;

/** */
alias soup_server_add_websocket_extension = c_soup_server_add_websocket_extension;

/** */
alias soup_server_add_websocket_handler = c_soup_server_add_websocket_handler;

/** */
alias soup_server_disconnect = c_soup_server_disconnect;

/** */
alias soup_server_get_listeners = c_soup_server_get_listeners;

/** */
alias soup_server_get_tls_auth_mode = c_soup_server_get_tls_auth_mode;

/** */
alias soup_server_get_tls_certificate = c_soup_server_get_tls_certificate;

/** */
alias soup_server_get_tls_database = c_soup_server_get_tls_database;

/** */
alias soup_server_get_uris = c_soup_server_get_uris;

/** */
alias soup_server_is_https = c_soup_server_is_https;

/** */
alias soup_server_listen = c_soup_server_listen;

/** */
alias soup_server_listen_all = c_soup_server_listen_all;

/** */
alias soup_server_listen_local = c_soup_server_listen_local;

/** */
alias soup_server_listen_socket = c_soup_server_listen_socket;

/** */
alias soup_server_pause_message = c_soup_server_pause_message;

/** */
alias soup_server_remove_auth_domain = c_soup_server_remove_auth_domain;

/** */
alias soup_server_remove_handler = c_soup_server_remove_handler;

/** */
alias soup_server_remove_websocket_extension = c_soup_server_remove_websocket_extension;

/** */
alias soup_server_set_tls_auth_mode = c_soup_server_set_tls_auth_mode;

/** */
alias soup_server_set_tls_certificate = c_soup_server_set_tls_certificate;

/** */
alias soup_server_set_tls_database = c_soup_server_set_tls_database;

/** */
alias soup_server_unpause_message = c_soup_server_unpause_message;

// ServerMessage

/** */
alias soup_server_message_get_type = c_soup_server_message_get_type;

/** */
alias soup_server_message_get_http_version = c_soup_server_message_get_http_version;

/** */
alias soup_server_message_get_local_address = c_soup_server_message_get_local_address;

/** */
alias soup_server_message_get_method = c_soup_server_message_get_method;

/** */
alias soup_server_message_get_reason_phrase = c_soup_server_message_get_reason_phrase;

/** */
alias soup_server_message_get_remote_address = c_soup_server_message_get_remote_address;

/** */
alias soup_server_message_get_remote_host = c_soup_server_message_get_remote_host;

/** */
alias soup_server_message_get_request_body = c_soup_server_message_get_request_body;

/** */
alias soup_server_message_get_request_headers = c_soup_server_message_get_request_headers;

/** */
alias soup_server_message_get_response_body = c_soup_server_message_get_response_body;

/** */
alias soup_server_message_get_response_headers = c_soup_server_message_get_response_headers;

/** */
alias soup_server_message_get_socket = c_soup_server_message_get_socket;

/** */
alias soup_server_message_get_status = c_soup_server_message_get_status;

/** */
alias soup_server_message_get_tls_peer_certificate = c_soup_server_message_get_tls_peer_certificate;

/** */
alias soup_server_message_get_tls_peer_certificate_errors = c_soup_server_message_get_tls_peer_certificate_errors;

/** */
alias soup_server_message_get_uri = c_soup_server_message_get_uri;

/** */
alias soup_server_message_is_options_ping = c_soup_server_message_is_options_ping;

/** */
alias soup_server_message_pause = c_soup_server_message_pause;

/** */
alias soup_server_message_set_http_version = c_soup_server_message_set_http_version;

/** */
alias soup_server_message_set_redirect = c_soup_server_message_set_redirect;

/** */
alias soup_server_message_set_response = c_soup_server_message_set_response;

/** */
alias soup_server_message_set_status = c_soup_server_message_set_status;

/** */
alias soup_server_message_steal_connection = c_soup_server_message_steal_connection;

/** */
alias soup_server_message_unpause = c_soup_server_message_unpause;

// Session

/** */
alias soup_session_get_type = c_soup_session_get_type;

/** */
alias soup_session_new = c_soup_session_new;

/** */
alias soup_session_new_with_options = c_soup_session_new_with_options;

/** */
alias soup_session_abort = c_soup_session_abort;

/** */
alias soup_session_add_feature = c_soup_session_add_feature;

/** */
alias soup_session_add_feature_by_type = c_soup_session_add_feature_by_type;

/** */
alias soup_session_get_accept_language = c_soup_session_get_accept_language;

/** */
alias soup_session_get_accept_language_auto = c_soup_session_get_accept_language_auto;

/** */
alias soup_session_get_async_result_message = c_soup_session_get_async_result_message;

/** */
alias soup_session_get_feature = c_soup_session_get_feature;

/** */
alias soup_session_get_feature_for_message = c_soup_session_get_feature_for_message;

/** */
alias soup_session_get_idle_timeout = c_soup_session_get_idle_timeout;

/** */
alias soup_session_get_local_address = c_soup_session_get_local_address;

/** */
alias soup_session_get_max_conns = c_soup_session_get_max_conns;

/** */
alias soup_session_get_max_conns_per_host = c_soup_session_get_max_conns_per_host;

/** */
alias soup_session_get_proxy_resolver = c_soup_session_get_proxy_resolver;

/** */
alias soup_session_get_remote_connectable = c_soup_session_get_remote_connectable;

/** */
alias soup_session_get_timeout = c_soup_session_get_timeout;

/** */
alias soup_session_get_tls_database = c_soup_session_get_tls_database;

/** */
alias soup_session_get_tls_interaction = c_soup_session_get_tls_interaction;

/** */
alias soup_session_get_user_agent = c_soup_session_get_user_agent;

/** */
alias soup_session_has_feature = c_soup_session_has_feature;

/** */
alias soup_session_preconnect_async = c_soup_session_preconnect_async;

/** */
alias soup_session_preconnect_finish = c_soup_session_preconnect_finish;

/** */
alias soup_session_remove_feature = c_soup_session_remove_feature;

/** */
alias soup_session_remove_feature_by_type = c_soup_session_remove_feature_by_type;

/** */
alias soup_session_send = c_soup_session_send;

/** */
alias soup_session_send_and_read = c_soup_session_send_and_read;

/** */
alias soup_session_send_and_read_async = c_soup_session_send_and_read_async;

/** */
alias soup_session_send_and_read_finish = c_soup_session_send_and_read_finish;

/** */
alias soup_session_send_and_splice = c_soup_session_send_and_splice;

/** */
alias soup_session_send_and_splice_async = c_soup_session_send_and_splice_async;

/** */
alias soup_session_send_and_splice_finish = c_soup_session_send_and_splice_finish;

/** */
alias soup_session_send_async = c_soup_session_send_async;

/** */
alias soup_session_send_finish = c_soup_session_send_finish;

/** */
alias soup_session_set_accept_language = c_soup_session_set_accept_language;

/** */
alias soup_session_set_accept_language_auto = c_soup_session_set_accept_language_auto;

/** */
alias soup_session_set_idle_timeout = c_soup_session_set_idle_timeout;

/** */
alias soup_session_set_proxy_resolver = c_soup_session_set_proxy_resolver;

/** */
alias soup_session_set_timeout = c_soup_session_set_timeout;

/** */
alias soup_session_set_tls_database = c_soup_session_set_tls_database;

/** */
alias soup_session_set_tls_interaction = c_soup_session_set_tls_interaction;

/** */
alias soup_session_set_user_agent = c_soup_session_set_user_agent;

/** */
alias soup_session_websocket_connect_async = c_soup_session_websocket_connect_async;

/** */
alias soup_session_websocket_connect_finish = c_soup_session_websocket_connect_finish;

// SessionFeature

/** */
alias soup_session_feature_get_type = c_soup_session_feature_get_type;

// WebsocketConnection

/** */
alias soup_websocket_connection_get_type = c_soup_websocket_connection_get_type;

/** */
alias soup_websocket_connection_new = c_soup_websocket_connection_new;

/** */
alias soup_websocket_connection_close = c_soup_websocket_connection_close;

/** */
alias soup_websocket_connection_get_close_code = c_soup_websocket_connection_get_close_code;

/** */
alias soup_websocket_connection_get_close_data = c_soup_websocket_connection_get_close_data;

/** */
alias soup_websocket_connection_get_connection_type = c_soup_websocket_connection_get_connection_type;

/** */
alias soup_websocket_connection_get_extensions = c_soup_websocket_connection_get_extensions;

/** */
alias soup_websocket_connection_get_io_stream = c_soup_websocket_connection_get_io_stream;

/** */
alias soup_websocket_connection_get_keepalive_interval = c_soup_websocket_connection_get_keepalive_interval;

/** */
alias soup_websocket_connection_get_keepalive_pong_timeout = c_soup_websocket_connection_get_keepalive_pong_timeout;

/** */
alias soup_websocket_connection_get_max_incoming_payload_size = c_soup_websocket_connection_get_max_incoming_payload_size;

/** */
alias soup_websocket_connection_get_origin = c_soup_websocket_connection_get_origin;

/** */
alias soup_websocket_connection_get_protocol = c_soup_websocket_connection_get_protocol;

/** */
alias soup_websocket_connection_get_state = c_soup_websocket_connection_get_state;

/** */
alias soup_websocket_connection_get_uri = c_soup_websocket_connection_get_uri;

/** */
alias soup_websocket_connection_send_binary = c_soup_websocket_connection_send_binary;

/** */
alias soup_websocket_connection_send_message = c_soup_websocket_connection_send_message;

/** */
alias soup_websocket_connection_send_text = c_soup_websocket_connection_send_text;

/** */
alias soup_websocket_connection_set_keepalive_interval = c_soup_websocket_connection_set_keepalive_interval;

/** */
alias soup_websocket_connection_set_keepalive_pong_timeout = c_soup_websocket_connection_set_keepalive_pong_timeout;

/** */
alias soup_websocket_connection_set_max_incoming_payload_size = c_soup_websocket_connection_set_max_incoming_payload_size;

// WebsocketExtension

/** */
alias soup_websocket_extension_get_type = c_soup_websocket_extension_get_type;

/** */
alias soup_websocket_extension_configure = c_soup_websocket_extension_configure;

/** */
alias soup_websocket_extension_get_request_params = c_soup_websocket_extension_get_request_params;

/** */
alias soup_websocket_extension_get_response_params = c_soup_websocket_extension_get_response_params;

/** */
alias soup_websocket_extension_process_incoming_message = c_soup_websocket_extension_process_incoming_message;

/** */
alias soup_websocket_extension_process_outgoing_message = c_soup_websocket_extension_process_outgoing_message;

// WebsocketExtensionDeflate

/** */
alias soup_websocket_extension_deflate_get_type = c_soup_websocket_extension_deflate_get_type;

// WebsocketExtensionManager

/** */
alias soup_websocket_extension_manager_get_type = c_soup_websocket_extension_manager_get_type;

// global

/** */
alias soup_check_version = c_soup_check_version;

/** */
alias soup_cookies_free = c_soup_cookies_free;

/** */
alias soup_cookies_from_request = c_soup_cookies_from_request;

/** */
alias soup_cookies_from_response = c_soup_cookies_from_response;

/** */
alias soup_cookies_to_cookie_header = c_soup_cookies_to_cookie_header;

/** */
alias soup_cookies_to_request = c_soup_cookies_to_request;

/** */
alias soup_cookies_to_response = c_soup_cookies_to_response;

/** */
alias soup_date_time_new_from_http_string = c_soup_date_time_new_from_http_string;

/** */
alias soup_date_time_to_string = c_soup_date_time_to_string;

/** */
alias soup_form_decode = c_soup_form_decode;

/** */
alias soup_form_decode_multipart = c_soup_form_decode_multipart;

/** */
alias soup_form_encode = c_soup_form_encode;

/** */
alias soup_form_encode_datalist = c_soup_form_encode_datalist;

/** */
alias soup_form_encode_hash = c_soup_form_encode_hash;

/** */
alias soup_form_encode_valist = c_soup_form_encode_valist;

/** */
alias soup_get_major_version = c_soup_get_major_version;

/** */
alias soup_get_micro_version = c_soup_get_micro_version;

/** */
alias soup_get_minor_version = c_soup_get_minor_version;

/** */
alias soup_header_contains = c_soup_header_contains;

/** */
alias soup_header_free_list = c_soup_header_free_list;

/** */
alias soup_header_free_param_list = c_soup_header_free_param_list;

/** */
alias soup_header_g_string_append_param = c_soup_header_g_string_append_param;

/** */
alias soup_header_g_string_append_param_quoted = c_soup_header_g_string_append_param_quoted;

/** */
alias soup_header_parse_list = c_soup_header_parse_list;

/** */
alias soup_header_parse_param_list = c_soup_header_parse_param_list;

/** */
alias soup_header_parse_param_list_strict = c_soup_header_parse_param_list_strict;

/** */
alias soup_header_parse_quality_list = c_soup_header_parse_quality_list;

/** */
alias soup_header_parse_semi_param_list = c_soup_header_parse_semi_param_list;

/** */
alias soup_header_parse_semi_param_list_strict = c_soup_header_parse_semi_param_list_strict;

/** */
alias soup_headers_parse = c_soup_headers_parse;

/** */
alias soup_headers_parse_request = c_soup_headers_parse_request;

/** */
alias soup_headers_parse_response = c_soup_headers_parse_response;

/** */
alias soup_headers_parse_status_line = c_soup_headers_parse_status_line;

/** */
alias soup_tld_domain_is_public_suffix = c_soup_tld_domain_is_public_suffix;

/** */
alias soup_tld_get_base_domain = c_soup_tld_get_base_domain;

/** */
alias soup_uri_copy = c_soup_uri_copy;

/** */
alias soup_uri_decode_data_uri = c_soup_uri_decode_data_uri;

/** */
alias soup_uri_equal = c_soup_uri_equal;

/** */
alias soup_websocket_client_prepare_handshake = c_soup_websocket_client_prepare_handshake;

/** */
alias soup_websocket_client_verify_handshake = c_soup_websocket_client_verify_handshake;

/** */
alias soup_websocket_server_check_handshake = c_soup_websocket_server_check_handshake;

/** */
alias soup_websocket_server_process_handshake = c_soup_websocket_server_process_handshake;

// SessionError

/** */
alias soup_session_error_quark = c_soup_session_error_quark;

// Status

/** */
alias soup_status_get_phrase = c_soup_status_get_phrase;

// TLDError

/** */
alias soup_tld_error_quark = c_soup_tld_error_quark;

// WebsocketError

/** */
alias soup_websocket_error_quark = c_soup_websocket_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.soup3", "Soup");

  // Auth
  gidLink(cast(void**)&soup_auth_get_type, "soup_auth_get_type", libs);
  gidLink(cast(void**)&soup_auth_new, "soup_auth_new", libs);
  gidLink(cast(void**)&soup_auth_authenticate, "soup_auth_authenticate", libs);
  gidLink(cast(void**)&soup_auth_can_authenticate, "soup_auth_can_authenticate", libs);
  gidLink(cast(void**)&soup_auth_cancel, "soup_auth_cancel", libs);
  gidLink(cast(void**)&soup_auth_free_protection_space, "soup_auth_free_protection_space", libs);
  gidLink(cast(void**)&soup_auth_get_authority, "soup_auth_get_authority", libs);
  gidLink(cast(void**)&soup_auth_get_authorization, "soup_auth_get_authorization", libs);
  gidLink(cast(void**)&soup_auth_get_info, "soup_auth_get_info", libs);
  gidLink(cast(void**)&soup_auth_get_protection_space, "soup_auth_get_protection_space", libs);
  gidLink(cast(void**)&soup_auth_get_realm, "soup_auth_get_realm", libs);
  gidLink(cast(void**)&soup_auth_get_scheme_name, "soup_auth_get_scheme_name", libs);
  gidLink(cast(void**)&soup_auth_is_authenticated, "soup_auth_is_authenticated", libs);
  gidLink(cast(void**)&soup_auth_is_cancelled, "soup_auth_is_cancelled", libs);
  gidLink(cast(void**)&soup_auth_is_for_proxy, "soup_auth_is_for_proxy", libs);
  gidLink(cast(void**)&soup_auth_is_ready, "soup_auth_is_ready", libs);
  gidLink(cast(void**)&soup_auth_update, "soup_auth_update", libs);

  // AuthBasic
  gidLink(cast(void**)&soup_auth_basic_get_type, "soup_auth_basic_get_type", libs);

  // AuthDigest
  gidLink(cast(void**)&soup_auth_digest_get_type, "soup_auth_digest_get_type", libs);

  // AuthDomain
  gidLink(cast(void**)&soup_auth_domain_get_type, "soup_auth_domain_get_type", libs);
  gidLink(cast(void**)&soup_auth_domain_accepts, "soup_auth_domain_accepts", libs);
  gidLink(cast(void**)&soup_auth_domain_add_path, "soup_auth_domain_add_path", libs);
  gidLink(cast(void**)&soup_auth_domain_challenge, "soup_auth_domain_challenge", libs);
  gidLink(cast(void**)&soup_auth_domain_check_password, "soup_auth_domain_check_password", libs);
  gidLink(cast(void**)&soup_auth_domain_covers, "soup_auth_domain_covers", libs);
  gidLink(cast(void**)&soup_auth_domain_get_realm, "soup_auth_domain_get_realm", libs);
  gidLink(cast(void**)&soup_auth_domain_remove_path, "soup_auth_domain_remove_path", libs);
  gidLink(cast(void**)&soup_auth_domain_set_filter, "soup_auth_domain_set_filter", libs);
  gidLink(cast(void**)&soup_auth_domain_set_generic_auth_callback, "soup_auth_domain_set_generic_auth_callback", libs);

  // AuthDomainBasic
  gidLink(cast(void**)&soup_auth_domain_basic_get_type, "soup_auth_domain_basic_get_type", libs);
  gidLink(cast(void**)&soup_auth_domain_basic_new, "soup_auth_domain_basic_new", libs);
  gidLink(cast(void**)&soup_auth_domain_basic_set_auth_callback, "soup_auth_domain_basic_set_auth_callback", libs);

  // AuthDomainDigest
  gidLink(cast(void**)&soup_auth_domain_digest_get_type, "soup_auth_domain_digest_get_type", libs);
  gidLink(cast(void**)&soup_auth_domain_digest_new, "soup_auth_domain_digest_new", libs);
  gidLink(cast(void**)&soup_auth_domain_digest_encode_password, "soup_auth_domain_digest_encode_password", libs);
  gidLink(cast(void**)&soup_auth_domain_digest_set_auth_callback, "soup_auth_domain_digest_set_auth_callback", libs);

  // AuthManager
  gidLink(cast(void**)&soup_auth_manager_get_type, "soup_auth_manager_get_type", libs);
  gidLink(cast(void**)&soup_auth_manager_clear_cached_credentials, "soup_auth_manager_clear_cached_credentials", libs);
  gidLink(cast(void**)&soup_auth_manager_use_auth, "soup_auth_manager_use_auth", libs);

  // AuthNTLM
  gidLink(cast(void**)&soup_auth_ntlm_get_type, "soup_auth_ntlm_get_type", libs);

  // AuthNegotiate
  gidLink(cast(void**)&soup_auth_negotiate_get_type, "soup_auth_negotiate_get_type", libs);
  gidLink(cast(void**)&soup_auth_negotiate_supported, "soup_auth_negotiate_supported", libs);

  // Cache
  gidLink(cast(void**)&soup_cache_get_type, "soup_cache_get_type", libs);
  gidLink(cast(void**)&soup_cache_new, "soup_cache_new", libs);
  gidLink(cast(void**)&soup_cache_clear, "soup_cache_clear", libs);
  gidLink(cast(void**)&soup_cache_dump, "soup_cache_dump", libs);
  gidLink(cast(void**)&soup_cache_flush, "soup_cache_flush", libs);
  gidLink(cast(void**)&soup_cache_get_max_size, "soup_cache_get_max_size", libs);
  gidLink(cast(void**)&soup_cache_load, "soup_cache_load", libs);
  gidLink(cast(void**)&soup_cache_set_max_size, "soup_cache_set_max_size", libs);

  // ContentDecoder
  gidLink(cast(void**)&soup_content_decoder_get_type, "soup_content_decoder_get_type", libs);

  // ContentSniffer
  gidLink(cast(void**)&soup_content_sniffer_get_type, "soup_content_sniffer_get_type", libs);
  gidLink(cast(void**)&soup_content_sniffer_new, "soup_content_sniffer_new", libs);
  gidLink(cast(void**)&soup_content_sniffer_sniff, "soup_content_sniffer_sniff", libs);

  // Cookie
  gidLink(cast(void**)&soup_cookie_get_type, "soup_cookie_get_type", libs);
  gidLink(cast(void**)&soup_cookie_new, "soup_cookie_new", libs);
  gidLink(cast(void**)&soup_cookie_applies_to_uri, "soup_cookie_applies_to_uri", libs);
  gidLink(cast(void**)&soup_cookie_copy, "soup_cookie_copy", libs);
  gidLink(cast(void**)&soup_cookie_domain_matches, "soup_cookie_domain_matches", libs);
  gidLink(cast(void**)&soup_cookie_equal, "soup_cookie_equal", libs);
  gidLink(cast(void**)&soup_cookie_free, "soup_cookie_free", libs);
  gidLink(cast(void**)&soup_cookie_get_domain, "soup_cookie_get_domain", libs);
  gidLink(cast(void**)&soup_cookie_get_expires, "soup_cookie_get_expires", libs);
  gidLink(cast(void**)&soup_cookie_get_http_only, "soup_cookie_get_http_only", libs);
  gidLink(cast(void**)&soup_cookie_get_name, "soup_cookie_get_name", libs);
  gidLink(cast(void**)&soup_cookie_get_path, "soup_cookie_get_path", libs);
  gidLink(cast(void**)&soup_cookie_get_same_site_policy, "soup_cookie_get_same_site_policy", libs);
  gidLink(cast(void**)&soup_cookie_get_secure, "soup_cookie_get_secure", libs);
  gidLink(cast(void**)&soup_cookie_get_value, "soup_cookie_get_value", libs);
  gidLink(cast(void**)&soup_cookie_set_domain, "soup_cookie_set_domain", libs);
  gidLink(cast(void**)&soup_cookie_set_expires, "soup_cookie_set_expires", libs);
  gidLink(cast(void**)&soup_cookie_set_http_only, "soup_cookie_set_http_only", libs);
  gidLink(cast(void**)&soup_cookie_set_max_age, "soup_cookie_set_max_age", libs);
  gidLink(cast(void**)&soup_cookie_set_name, "soup_cookie_set_name", libs);
  gidLink(cast(void**)&soup_cookie_set_path, "soup_cookie_set_path", libs);
  gidLink(cast(void**)&soup_cookie_set_same_site_policy, "soup_cookie_set_same_site_policy", libs);
  gidLink(cast(void**)&soup_cookie_set_secure, "soup_cookie_set_secure", libs);
  gidLink(cast(void**)&soup_cookie_set_value, "soup_cookie_set_value", libs);
  gidLink(cast(void**)&soup_cookie_to_cookie_header, "soup_cookie_to_cookie_header", libs);
  gidLink(cast(void**)&soup_cookie_to_set_cookie_header, "soup_cookie_to_set_cookie_header", libs);
  gidLink(cast(void**)&soup_cookie_parse, "soup_cookie_parse", libs);

  // CookieJar
  gidLink(cast(void**)&soup_cookie_jar_get_type, "soup_cookie_jar_get_type", libs);
  gidLink(cast(void**)&soup_cookie_jar_new, "soup_cookie_jar_new", libs);
  gidLink(cast(void**)&soup_cookie_jar_add_cookie, "soup_cookie_jar_add_cookie", libs);
  gidLink(cast(void**)&soup_cookie_jar_add_cookie_full, "soup_cookie_jar_add_cookie_full", libs);
  gidLink(cast(void**)&soup_cookie_jar_add_cookie_with_first_party, "soup_cookie_jar_add_cookie_with_first_party", libs);
  gidLink(cast(void**)&soup_cookie_jar_all_cookies, "soup_cookie_jar_all_cookies", libs);
  gidLink(cast(void**)&soup_cookie_jar_delete_cookie, "soup_cookie_jar_delete_cookie", libs);
  gidLink(cast(void**)&soup_cookie_jar_get_accept_policy, "soup_cookie_jar_get_accept_policy", libs);
  gidLink(cast(void**)&soup_cookie_jar_get_cookie_list, "soup_cookie_jar_get_cookie_list", libs);
  gidLink(cast(void**)&soup_cookie_jar_get_cookie_list_with_same_site_info, "soup_cookie_jar_get_cookie_list_with_same_site_info", libs);
  gidLink(cast(void**)&soup_cookie_jar_get_cookies, "soup_cookie_jar_get_cookies", libs);
  gidLink(cast(void**)&soup_cookie_jar_is_persistent, "soup_cookie_jar_is_persistent", libs);
  gidLink(cast(void**)&soup_cookie_jar_set_accept_policy, "soup_cookie_jar_set_accept_policy", libs);
  gidLink(cast(void**)&soup_cookie_jar_set_cookie, "soup_cookie_jar_set_cookie", libs);
  gidLink(cast(void**)&soup_cookie_jar_set_cookie_with_first_party, "soup_cookie_jar_set_cookie_with_first_party", libs);

  // CookieJarDB
  gidLink(cast(void**)&soup_cookie_jar_db_get_type, "soup_cookie_jar_db_get_type", libs);
  gidLink(cast(void**)&soup_cookie_jar_db_new, "soup_cookie_jar_db_new", libs);

  // CookieJarText
  gidLink(cast(void**)&soup_cookie_jar_text_get_type, "soup_cookie_jar_text_get_type", libs);
  gidLink(cast(void**)&soup_cookie_jar_text_new, "soup_cookie_jar_text_new", libs);

  // HSTSEnforcer
  gidLink(cast(void**)&soup_hsts_enforcer_get_type, "soup_hsts_enforcer_get_type", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_new, "soup_hsts_enforcer_new", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_get_domains, "soup_hsts_enforcer_get_domains", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_get_policies, "soup_hsts_enforcer_get_policies", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_has_valid_policy, "soup_hsts_enforcer_has_valid_policy", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_is_persistent, "soup_hsts_enforcer_is_persistent", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_set_policy, "soup_hsts_enforcer_set_policy", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_set_session_policy, "soup_hsts_enforcer_set_session_policy", libs);

  // HSTSEnforcerDB
  gidLink(cast(void**)&soup_hsts_enforcer_db_get_type, "soup_hsts_enforcer_db_get_type", libs);
  gidLink(cast(void**)&soup_hsts_enforcer_db_new, "soup_hsts_enforcer_db_new", libs);

  // HSTSPolicy
  gidLink(cast(void**)&soup_hsts_policy_get_type, "soup_hsts_policy_get_type", libs);
  gidLink(cast(void**)&soup_hsts_policy_new, "soup_hsts_policy_new", libs);
  gidLink(cast(void**)&soup_hsts_policy_new_from_response, "soup_hsts_policy_new_from_response", libs);
  gidLink(cast(void**)&soup_hsts_policy_new_full, "soup_hsts_policy_new_full", libs);
  gidLink(cast(void**)&soup_hsts_policy_new_session_policy, "soup_hsts_policy_new_session_policy", libs);
  gidLink(cast(void**)&soup_hsts_policy_copy, "soup_hsts_policy_copy", libs);
  gidLink(cast(void**)&soup_hsts_policy_equal, "soup_hsts_policy_equal", libs);
  gidLink(cast(void**)&soup_hsts_policy_free, "soup_hsts_policy_free", libs);
  gidLink(cast(void**)&soup_hsts_policy_get_domain, "soup_hsts_policy_get_domain", libs);
  gidLink(cast(void**)&soup_hsts_policy_get_expires, "soup_hsts_policy_get_expires", libs);
  gidLink(cast(void**)&soup_hsts_policy_get_max_age, "soup_hsts_policy_get_max_age", libs);
  gidLink(cast(void**)&soup_hsts_policy_includes_subdomains, "soup_hsts_policy_includes_subdomains", libs);
  gidLink(cast(void**)&soup_hsts_policy_is_expired, "soup_hsts_policy_is_expired", libs);
  gidLink(cast(void**)&soup_hsts_policy_is_session_policy, "soup_hsts_policy_is_session_policy", libs);

  // Logger
  gidLink(cast(void**)&soup_logger_get_type, "soup_logger_get_type", libs);
  gidLink(cast(void**)&soup_logger_new, "soup_logger_new", libs);
  gidLink(cast(void**)&soup_logger_get_max_body_size, "soup_logger_get_max_body_size", libs);
  gidLink(cast(void**)&soup_logger_set_max_body_size, "soup_logger_set_max_body_size", libs);
  gidLink(cast(void**)&soup_logger_set_printer, "soup_logger_set_printer", libs);
  gidLink(cast(void**)&soup_logger_set_request_filter, "soup_logger_set_request_filter", libs);
  gidLink(cast(void**)&soup_logger_set_response_filter, "soup_logger_set_response_filter", libs);

  // Message
  gidLink(cast(void**)&soup_message_get_type, "soup_message_get_type", libs);
  gidLink(cast(void**)&soup_message_new, "soup_message_new", libs);
  gidLink(cast(void**)&soup_message_new_from_encoded_form, "soup_message_new_from_encoded_form", libs);
  gidLink(cast(void**)&soup_message_new_from_multipart, "soup_message_new_from_multipart", libs);
  gidLink(cast(void**)&soup_message_new_from_uri, "soup_message_new_from_uri", libs);
  gidLink(cast(void**)&soup_message_new_options_ping, "soup_message_new_options_ping", libs);
  gidLink(cast(void**)&soup_message_add_flags, "soup_message_add_flags", libs);
  gidLink(cast(void**)&soup_message_add_header_handler, "soup_message_add_header_handler", libs);
  gidLink(cast(void**)&soup_message_add_status_code_handler, "soup_message_add_status_code_handler", libs);
  gidLink(cast(void**)&soup_message_disable_feature, "soup_message_disable_feature", libs);
  gidLink(cast(void**)&soup_message_get_connection_id, "soup_message_get_connection_id", libs);
  gidLink(cast(void**)&soup_message_get_first_party, "soup_message_get_first_party", libs);
  gidLink(cast(void**)&soup_message_get_flags, "soup_message_get_flags", libs);
  gidLink(cast(void**)&soup_message_get_force_http1, "soup_message_get_force_http1", libs);
  gidLink(cast(void**)&soup_message_get_http_version, "soup_message_get_http_version", libs);
  gidLink(cast(void**)&soup_message_get_is_options_ping, "soup_message_get_is_options_ping", libs);
  gidLink(cast(void**)&soup_message_get_is_top_level_navigation, "soup_message_get_is_top_level_navigation", libs);
  gidLink(cast(void**)&soup_message_get_method, "soup_message_get_method", libs);
  gidLink(cast(void**)&soup_message_get_metrics, "soup_message_get_metrics", libs);
  gidLink(cast(void**)&soup_message_get_priority, "soup_message_get_priority", libs);
  gidLink(cast(void**)&soup_message_get_reason_phrase, "soup_message_get_reason_phrase", libs);
  gidLink(cast(void**)&soup_message_get_remote_address, "soup_message_get_remote_address", libs);
  gidLink(cast(void**)&soup_message_get_request_headers, "soup_message_get_request_headers", libs);
  gidLink(cast(void**)&soup_message_get_response_headers, "soup_message_get_response_headers", libs);
  gidLink(cast(void**)&soup_message_get_site_for_cookies, "soup_message_get_site_for_cookies", libs);
  gidLink(cast(void**)&soup_message_get_status, "soup_message_get_status", libs);
  gidLink(cast(void**)&soup_message_get_tls_ciphersuite_name, "soup_message_get_tls_ciphersuite_name", libs);
  gidLink(cast(void**)&soup_message_get_tls_peer_certificate, "soup_message_get_tls_peer_certificate", libs);
  gidLink(cast(void**)&soup_message_get_tls_peer_certificate_errors, "soup_message_get_tls_peer_certificate_errors", libs);
  gidLink(cast(void**)&soup_message_get_tls_protocol_version, "soup_message_get_tls_protocol_version", libs);
  gidLink(cast(void**)&soup_message_get_uri, "soup_message_get_uri", libs);
  gidLink(cast(void**)&soup_message_is_feature_disabled, "soup_message_is_feature_disabled", libs);
  gidLink(cast(void**)&soup_message_is_keepalive, "soup_message_is_keepalive", libs);
  gidLink(cast(void**)&soup_message_query_flags, "soup_message_query_flags", libs);
  gidLink(cast(void**)&soup_message_remove_flags, "soup_message_remove_flags", libs);
  gidLink(cast(void**)&soup_message_set_first_party, "soup_message_set_first_party", libs);
  gidLink(cast(void**)&soup_message_set_flags, "soup_message_set_flags", libs);
  gidLink(cast(void**)&soup_message_set_force_http1, "soup_message_set_force_http1", libs);
  gidLink(cast(void**)&soup_message_set_is_options_ping, "soup_message_set_is_options_ping", libs);
  gidLink(cast(void**)&soup_message_set_is_top_level_navigation, "soup_message_set_is_top_level_navigation", libs);
  gidLink(cast(void**)&soup_message_set_method, "soup_message_set_method", libs);
  gidLink(cast(void**)&soup_message_set_priority, "soup_message_set_priority", libs);
  gidLink(cast(void**)&soup_message_set_request_body, "soup_message_set_request_body", libs);
  gidLink(cast(void**)&soup_message_set_request_body_from_bytes, "soup_message_set_request_body_from_bytes", libs);
  gidLink(cast(void**)&soup_message_set_site_for_cookies, "soup_message_set_site_for_cookies", libs);
  gidLink(cast(void**)&soup_message_set_tls_client_certificate, "soup_message_set_tls_client_certificate", libs);
  gidLink(cast(void**)&soup_message_set_uri, "soup_message_set_uri", libs);
  gidLink(cast(void**)&soup_message_tls_client_certificate_password_request_complete, "soup_message_tls_client_certificate_password_request_complete", libs);

  // MessageBody
  gidLink(cast(void**)&soup_message_body_get_type, "soup_message_body_get_type", libs);
  gidLink(cast(void**)&soup_message_body_new, "soup_message_body_new", libs);
  gidLink(cast(void**)&soup_message_body_append, "soup_message_body_append", libs);
  gidLink(cast(void**)&soup_message_body_append_bytes, "soup_message_body_append_bytes", libs);
  gidLink(cast(void**)&soup_message_body_append_take, "soup_message_body_append_take", libs);
  gidLink(cast(void**)&soup_message_body_complete, "soup_message_body_complete", libs);
  gidLink(cast(void**)&soup_message_body_flatten, "soup_message_body_flatten", libs);
  gidLink(cast(void**)&soup_message_body_get_accumulate, "soup_message_body_get_accumulate", libs);
  gidLink(cast(void**)&soup_message_body_get_chunk, "soup_message_body_get_chunk", libs);
  gidLink(cast(void**)&soup_message_body_got_chunk, "soup_message_body_got_chunk", libs);
  gidLink(cast(void**)&soup_message_body_ref, "soup_message_body_ref", libs);
  gidLink(cast(void**)&soup_message_body_set_accumulate, "soup_message_body_set_accumulate", libs);
  gidLink(cast(void**)&soup_message_body_truncate, "soup_message_body_truncate", libs);
  gidLink(cast(void**)&soup_message_body_unref, "soup_message_body_unref", libs);
  gidLink(cast(void**)&soup_message_body_wrote_chunk, "soup_message_body_wrote_chunk", libs);

  // MessageHeaders
  gidLink(cast(void**)&soup_message_headers_get_type, "soup_message_headers_get_type", libs);
  gidLink(cast(void**)&soup_message_headers_new, "soup_message_headers_new", libs);
  gidLink(cast(void**)&soup_message_headers_append, "soup_message_headers_append", libs);
  gidLink(cast(void**)&soup_message_headers_clean_connection_headers, "soup_message_headers_clean_connection_headers", libs);
  gidLink(cast(void**)&soup_message_headers_clear, "soup_message_headers_clear", libs);
  gidLink(cast(void**)&soup_message_headers_foreach, "soup_message_headers_foreach", libs);
  gidLink(cast(void**)&soup_message_headers_free_ranges, "soup_message_headers_free_ranges", libs);
  gidLink(cast(void**)&soup_message_headers_get_content_disposition, "soup_message_headers_get_content_disposition", libs);
  gidLink(cast(void**)&soup_message_headers_get_content_length, "soup_message_headers_get_content_length", libs);
  gidLink(cast(void**)&soup_message_headers_get_content_range, "soup_message_headers_get_content_range", libs);
  gidLink(cast(void**)&soup_message_headers_get_content_type, "soup_message_headers_get_content_type", libs);
  gidLink(cast(void**)&soup_message_headers_get_encoding, "soup_message_headers_get_encoding", libs);
  gidLink(cast(void**)&soup_message_headers_get_expectations, "soup_message_headers_get_expectations", libs);
  gidLink(cast(void**)&soup_message_headers_get_headers_type, "soup_message_headers_get_headers_type", libs);
  gidLink(cast(void**)&soup_message_headers_get_list, "soup_message_headers_get_list", libs);
  gidLink(cast(void**)&soup_message_headers_get_one, "soup_message_headers_get_one", libs);
  gidLink(cast(void**)&soup_message_headers_get_ranges, "soup_message_headers_get_ranges", libs);
  gidLink(cast(void**)&soup_message_headers_header_contains, "soup_message_headers_header_contains", libs);
  gidLink(cast(void**)&soup_message_headers_header_equals, "soup_message_headers_header_equals", libs);
  gidLink(cast(void**)&soup_message_headers_ref, "soup_message_headers_ref", libs);
  gidLink(cast(void**)&soup_message_headers_remove, "soup_message_headers_remove", libs);
  gidLink(cast(void**)&soup_message_headers_replace, "soup_message_headers_replace", libs);
  gidLink(cast(void**)&soup_message_headers_set_content_disposition, "soup_message_headers_set_content_disposition", libs);
  gidLink(cast(void**)&soup_message_headers_set_content_length, "soup_message_headers_set_content_length", libs);
  gidLink(cast(void**)&soup_message_headers_set_content_range, "soup_message_headers_set_content_range", libs);
  gidLink(cast(void**)&soup_message_headers_set_content_type, "soup_message_headers_set_content_type", libs);
  gidLink(cast(void**)&soup_message_headers_set_encoding, "soup_message_headers_set_encoding", libs);
  gidLink(cast(void**)&soup_message_headers_set_expectations, "soup_message_headers_set_expectations", libs);
  gidLink(cast(void**)&soup_message_headers_set_range, "soup_message_headers_set_range", libs);
  gidLink(cast(void**)&soup_message_headers_set_ranges, "soup_message_headers_set_ranges", libs);
  gidLink(cast(void**)&soup_message_headers_unref, "soup_message_headers_unref", libs);

  // MessageHeadersIter
  gidLink(cast(void**)&soup_message_headers_iter_init, "soup_message_headers_iter_init", libs);
  gidLink(cast(void**)&soup_message_headers_iter_next, "soup_message_headers_iter_next", libs);

  // MessageMetrics
  gidLink(cast(void**)&soup_message_metrics_get_type, "soup_message_metrics_get_type", libs);
  gidLink(cast(void**)&soup_message_metrics_copy, "soup_message_metrics_copy", libs);
  gidLink(cast(void**)&soup_message_metrics_free, "soup_message_metrics_free", libs);
  gidLink(cast(void**)&soup_message_metrics_get_connect_end, "soup_message_metrics_get_connect_end", libs);
  gidLink(cast(void**)&soup_message_metrics_get_connect_start, "soup_message_metrics_get_connect_start", libs);
  gidLink(cast(void**)&soup_message_metrics_get_dns_end, "soup_message_metrics_get_dns_end", libs);
  gidLink(cast(void**)&soup_message_metrics_get_dns_start, "soup_message_metrics_get_dns_start", libs);
  gidLink(cast(void**)&soup_message_metrics_get_fetch_start, "soup_message_metrics_get_fetch_start", libs);
  gidLink(cast(void**)&soup_message_metrics_get_request_body_bytes_sent, "soup_message_metrics_get_request_body_bytes_sent", libs);
  gidLink(cast(void**)&soup_message_metrics_get_request_body_size, "soup_message_metrics_get_request_body_size", libs);
  gidLink(cast(void**)&soup_message_metrics_get_request_header_bytes_sent, "soup_message_metrics_get_request_header_bytes_sent", libs);
  gidLink(cast(void**)&soup_message_metrics_get_request_start, "soup_message_metrics_get_request_start", libs);
  gidLink(cast(void**)&soup_message_metrics_get_response_body_bytes_received, "soup_message_metrics_get_response_body_bytes_received", libs);
  gidLink(cast(void**)&soup_message_metrics_get_response_body_size, "soup_message_metrics_get_response_body_size", libs);
  gidLink(cast(void**)&soup_message_metrics_get_response_end, "soup_message_metrics_get_response_end", libs);
  gidLink(cast(void**)&soup_message_metrics_get_response_header_bytes_received, "soup_message_metrics_get_response_header_bytes_received", libs);
  gidLink(cast(void**)&soup_message_metrics_get_response_start, "soup_message_metrics_get_response_start", libs);
  gidLink(cast(void**)&soup_message_metrics_get_tls_start, "soup_message_metrics_get_tls_start", libs);

  // Multipart
  gidLink(cast(void**)&soup_multipart_get_type, "soup_multipart_get_type", libs);
  gidLink(cast(void**)&soup_multipart_new, "soup_multipart_new", libs);
  gidLink(cast(void**)&soup_multipart_new_from_message, "soup_multipart_new_from_message", libs);
  gidLink(cast(void**)&soup_multipart_append_form_file, "soup_multipart_append_form_file", libs);
  gidLink(cast(void**)&soup_multipart_append_form_string, "soup_multipart_append_form_string", libs);
  gidLink(cast(void**)&soup_multipart_append_part, "soup_multipart_append_part", libs);
  gidLink(cast(void**)&soup_multipart_free, "soup_multipart_free", libs);
  gidLink(cast(void**)&soup_multipart_get_length, "soup_multipart_get_length", libs);
  gidLink(cast(void**)&soup_multipart_get_part, "soup_multipart_get_part", libs);
  gidLink(cast(void**)&soup_multipart_to_message, "soup_multipart_to_message", libs);

  // MultipartInputStream
  gidLink(cast(void**)&soup_multipart_input_stream_get_type, "soup_multipart_input_stream_get_type", libs);
  gidLink(cast(void**)&soup_multipart_input_stream_new, "soup_multipart_input_stream_new", libs);
  gidLink(cast(void**)&soup_multipart_input_stream_get_headers, "soup_multipart_input_stream_get_headers", libs);
  gidLink(cast(void**)&soup_multipart_input_stream_next_part, "soup_multipart_input_stream_next_part", libs);
  gidLink(cast(void**)&soup_multipart_input_stream_next_part_async, "soup_multipart_input_stream_next_part_async", libs);
  gidLink(cast(void**)&soup_multipart_input_stream_next_part_finish, "soup_multipart_input_stream_next_part_finish", libs);

  // Server
  gidLink(cast(void**)&soup_server_get_type, "soup_server_get_type", libs);
  gidLink(cast(void**)&soup_server_new, "soup_server_new", libs);
  gidLink(cast(void**)&soup_server_accept_iostream, "soup_server_accept_iostream", libs);
  gidLink(cast(void**)&soup_server_add_auth_domain, "soup_server_add_auth_domain", libs);
  gidLink(cast(void**)&soup_server_add_early_handler, "soup_server_add_early_handler", libs);
  gidLink(cast(void**)&soup_server_add_handler, "soup_server_add_handler", libs);
  gidLink(cast(void**)&soup_server_add_websocket_extension, "soup_server_add_websocket_extension", libs);
  gidLink(cast(void**)&soup_server_add_websocket_handler, "soup_server_add_websocket_handler", libs);
  gidLink(cast(void**)&soup_server_disconnect, "soup_server_disconnect", libs);
  gidLink(cast(void**)&soup_server_get_listeners, "soup_server_get_listeners", libs);
  gidLink(cast(void**)&soup_server_get_tls_auth_mode, "soup_server_get_tls_auth_mode", libs);
  gidLink(cast(void**)&soup_server_get_tls_certificate, "soup_server_get_tls_certificate", libs);
  gidLink(cast(void**)&soup_server_get_tls_database, "soup_server_get_tls_database", libs);
  gidLink(cast(void**)&soup_server_get_uris, "soup_server_get_uris", libs);
  gidLink(cast(void**)&soup_server_is_https, "soup_server_is_https", libs);
  gidLink(cast(void**)&soup_server_listen, "soup_server_listen", libs);
  gidLink(cast(void**)&soup_server_listen_all, "soup_server_listen_all", libs);
  gidLink(cast(void**)&soup_server_listen_local, "soup_server_listen_local", libs);
  gidLink(cast(void**)&soup_server_listen_socket, "soup_server_listen_socket", libs);
  gidLink(cast(void**)&soup_server_pause_message, "soup_server_pause_message", libs);
  gidLink(cast(void**)&soup_server_remove_auth_domain, "soup_server_remove_auth_domain", libs);
  gidLink(cast(void**)&soup_server_remove_handler, "soup_server_remove_handler", libs);
  gidLink(cast(void**)&soup_server_remove_websocket_extension, "soup_server_remove_websocket_extension", libs);
  gidLink(cast(void**)&soup_server_set_tls_auth_mode, "soup_server_set_tls_auth_mode", libs);
  gidLink(cast(void**)&soup_server_set_tls_certificate, "soup_server_set_tls_certificate", libs);
  gidLink(cast(void**)&soup_server_set_tls_database, "soup_server_set_tls_database", libs);
  gidLink(cast(void**)&soup_server_unpause_message, "soup_server_unpause_message", libs);

  // ServerMessage
  gidLink(cast(void**)&soup_server_message_get_type, "soup_server_message_get_type", libs);
  gidLink(cast(void**)&soup_server_message_get_http_version, "soup_server_message_get_http_version", libs);
  gidLink(cast(void**)&soup_server_message_get_local_address, "soup_server_message_get_local_address", libs);
  gidLink(cast(void**)&soup_server_message_get_method, "soup_server_message_get_method", libs);
  gidLink(cast(void**)&soup_server_message_get_reason_phrase, "soup_server_message_get_reason_phrase", libs);
  gidLink(cast(void**)&soup_server_message_get_remote_address, "soup_server_message_get_remote_address", libs);
  gidLink(cast(void**)&soup_server_message_get_remote_host, "soup_server_message_get_remote_host", libs);
  gidLink(cast(void**)&soup_server_message_get_request_body, "soup_server_message_get_request_body", libs);
  gidLink(cast(void**)&soup_server_message_get_request_headers, "soup_server_message_get_request_headers", libs);
  gidLink(cast(void**)&soup_server_message_get_response_body, "soup_server_message_get_response_body", libs);
  gidLink(cast(void**)&soup_server_message_get_response_headers, "soup_server_message_get_response_headers", libs);
  gidLink(cast(void**)&soup_server_message_get_socket, "soup_server_message_get_socket", libs);
  gidLink(cast(void**)&soup_server_message_get_status, "soup_server_message_get_status", libs);
  gidLink(cast(void**)&soup_server_message_get_tls_peer_certificate, "soup_server_message_get_tls_peer_certificate", libs);
  gidLink(cast(void**)&soup_server_message_get_tls_peer_certificate_errors, "soup_server_message_get_tls_peer_certificate_errors", libs);
  gidLink(cast(void**)&soup_server_message_get_uri, "soup_server_message_get_uri", libs);
  gidLink(cast(void**)&soup_server_message_is_options_ping, "soup_server_message_is_options_ping", libs);
  gidLink(cast(void**)&soup_server_message_pause, "soup_server_message_pause", libs);
  gidLink(cast(void**)&soup_server_message_set_http_version, "soup_server_message_set_http_version", libs);
  gidLink(cast(void**)&soup_server_message_set_redirect, "soup_server_message_set_redirect", libs);
  gidLink(cast(void**)&soup_server_message_set_response, "soup_server_message_set_response", libs);
  gidLink(cast(void**)&soup_server_message_set_status, "soup_server_message_set_status", libs);
  gidLink(cast(void**)&soup_server_message_steal_connection, "soup_server_message_steal_connection", libs);
  gidLink(cast(void**)&soup_server_message_unpause, "soup_server_message_unpause", libs);

  // Session
  gidLink(cast(void**)&soup_session_get_type, "soup_session_get_type", libs);
  gidLink(cast(void**)&soup_session_new, "soup_session_new", libs);
  gidLink(cast(void**)&soup_session_new_with_options, "soup_session_new_with_options", libs);
  gidLink(cast(void**)&soup_session_abort, "soup_session_abort", libs);
  gidLink(cast(void**)&soup_session_add_feature, "soup_session_add_feature", libs);
  gidLink(cast(void**)&soup_session_add_feature_by_type, "soup_session_add_feature_by_type", libs);
  gidLink(cast(void**)&soup_session_get_accept_language, "soup_session_get_accept_language", libs);
  gidLink(cast(void**)&soup_session_get_accept_language_auto, "soup_session_get_accept_language_auto", libs);
  gidLink(cast(void**)&soup_session_get_async_result_message, "soup_session_get_async_result_message", libs);
  gidLink(cast(void**)&soup_session_get_feature, "soup_session_get_feature", libs);
  gidLink(cast(void**)&soup_session_get_feature_for_message, "soup_session_get_feature_for_message", libs);
  gidLink(cast(void**)&soup_session_get_idle_timeout, "soup_session_get_idle_timeout", libs);
  gidLink(cast(void**)&soup_session_get_local_address, "soup_session_get_local_address", libs);
  gidLink(cast(void**)&soup_session_get_max_conns, "soup_session_get_max_conns", libs);
  gidLink(cast(void**)&soup_session_get_max_conns_per_host, "soup_session_get_max_conns_per_host", libs);
  gidLink(cast(void**)&soup_session_get_proxy_resolver, "soup_session_get_proxy_resolver", libs);
  gidLink(cast(void**)&soup_session_get_remote_connectable, "soup_session_get_remote_connectable", libs);
  gidLink(cast(void**)&soup_session_get_timeout, "soup_session_get_timeout", libs);
  gidLink(cast(void**)&soup_session_get_tls_database, "soup_session_get_tls_database", libs);
  gidLink(cast(void**)&soup_session_get_tls_interaction, "soup_session_get_tls_interaction", libs);
  gidLink(cast(void**)&soup_session_get_user_agent, "soup_session_get_user_agent", libs);
  gidLink(cast(void**)&soup_session_has_feature, "soup_session_has_feature", libs);
  gidLink(cast(void**)&soup_session_preconnect_async, "soup_session_preconnect_async", libs);
  gidLink(cast(void**)&soup_session_preconnect_finish, "soup_session_preconnect_finish", libs);
  gidLink(cast(void**)&soup_session_remove_feature, "soup_session_remove_feature", libs);
  gidLink(cast(void**)&soup_session_remove_feature_by_type, "soup_session_remove_feature_by_type", libs);
  gidLink(cast(void**)&soup_session_send, "soup_session_send", libs);
  gidLink(cast(void**)&soup_session_send_and_read, "soup_session_send_and_read", libs);
  gidLink(cast(void**)&soup_session_send_and_read_async, "soup_session_send_and_read_async", libs);
  gidLink(cast(void**)&soup_session_send_and_read_finish, "soup_session_send_and_read_finish", libs);
  gidLink(cast(void**)&soup_session_send_and_splice, "soup_session_send_and_splice", libs);
  gidLink(cast(void**)&soup_session_send_and_splice_async, "soup_session_send_and_splice_async", libs);
  gidLink(cast(void**)&soup_session_send_and_splice_finish, "soup_session_send_and_splice_finish", libs);
  gidLink(cast(void**)&soup_session_send_async, "soup_session_send_async", libs);
  gidLink(cast(void**)&soup_session_send_finish, "soup_session_send_finish", libs);
  gidLink(cast(void**)&soup_session_set_accept_language, "soup_session_set_accept_language", libs);
  gidLink(cast(void**)&soup_session_set_accept_language_auto, "soup_session_set_accept_language_auto", libs);
  gidLink(cast(void**)&soup_session_set_idle_timeout, "soup_session_set_idle_timeout", libs);
  gidLink(cast(void**)&soup_session_set_proxy_resolver, "soup_session_set_proxy_resolver", libs);
  gidLink(cast(void**)&soup_session_set_timeout, "soup_session_set_timeout", libs);
  gidLink(cast(void**)&soup_session_set_tls_database, "soup_session_set_tls_database", libs);
  gidLink(cast(void**)&soup_session_set_tls_interaction, "soup_session_set_tls_interaction", libs);
  gidLink(cast(void**)&soup_session_set_user_agent, "soup_session_set_user_agent", libs);
  gidLink(cast(void**)&soup_session_websocket_connect_async, "soup_session_websocket_connect_async", libs);
  gidLink(cast(void**)&soup_session_websocket_connect_finish, "soup_session_websocket_connect_finish", libs);

  // SessionFeature
  gidLink(cast(void**)&soup_session_feature_get_type, "soup_session_feature_get_type", libs);

  // WebsocketConnection
  gidLink(cast(void**)&soup_websocket_connection_get_type, "soup_websocket_connection_get_type", libs);
  gidLink(cast(void**)&soup_websocket_connection_new, "soup_websocket_connection_new", libs);
  gidLink(cast(void**)&soup_websocket_connection_close, "soup_websocket_connection_close", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_close_code, "soup_websocket_connection_get_close_code", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_close_data, "soup_websocket_connection_get_close_data", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_connection_type, "soup_websocket_connection_get_connection_type", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_extensions, "soup_websocket_connection_get_extensions", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_io_stream, "soup_websocket_connection_get_io_stream", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_keepalive_interval, "soup_websocket_connection_get_keepalive_interval", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_keepalive_pong_timeout, "soup_websocket_connection_get_keepalive_pong_timeout", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_max_incoming_payload_size, "soup_websocket_connection_get_max_incoming_payload_size", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_origin, "soup_websocket_connection_get_origin", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_protocol, "soup_websocket_connection_get_protocol", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_state, "soup_websocket_connection_get_state", libs);
  gidLink(cast(void**)&soup_websocket_connection_get_uri, "soup_websocket_connection_get_uri", libs);
  gidLink(cast(void**)&soup_websocket_connection_send_binary, "soup_websocket_connection_send_binary", libs);
  gidLink(cast(void**)&soup_websocket_connection_send_message, "soup_websocket_connection_send_message", libs);
  gidLink(cast(void**)&soup_websocket_connection_send_text, "soup_websocket_connection_send_text", libs);
  gidLink(cast(void**)&soup_websocket_connection_set_keepalive_interval, "soup_websocket_connection_set_keepalive_interval", libs);
  gidLink(cast(void**)&soup_websocket_connection_set_keepalive_pong_timeout, "soup_websocket_connection_set_keepalive_pong_timeout", libs);
  gidLink(cast(void**)&soup_websocket_connection_set_max_incoming_payload_size, "soup_websocket_connection_set_max_incoming_payload_size", libs);

  // WebsocketExtension
  gidLink(cast(void**)&soup_websocket_extension_get_type, "soup_websocket_extension_get_type", libs);
  gidLink(cast(void**)&soup_websocket_extension_configure, "soup_websocket_extension_configure", libs);
  gidLink(cast(void**)&soup_websocket_extension_get_request_params, "soup_websocket_extension_get_request_params", libs);
  gidLink(cast(void**)&soup_websocket_extension_get_response_params, "soup_websocket_extension_get_response_params", libs);
  gidLink(cast(void**)&soup_websocket_extension_process_incoming_message, "soup_websocket_extension_process_incoming_message", libs);
  gidLink(cast(void**)&soup_websocket_extension_process_outgoing_message, "soup_websocket_extension_process_outgoing_message", libs);

  // WebsocketExtensionDeflate
  gidLink(cast(void**)&soup_websocket_extension_deflate_get_type, "soup_websocket_extension_deflate_get_type", libs);

  // WebsocketExtensionManager
  gidLink(cast(void**)&soup_websocket_extension_manager_get_type, "soup_websocket_extension_manager_get_type", libs);

  // global
  gidLink(cast(void**)&soup_check_version, "soup_check_version", libs);
  gidLink(cast(void**)&soup_cookies_free, "soup_cookies_free", libs);
  gidLink(cast(void**)&soup_cookies_from_request, "soup_cookies_from_request", libs);
  gidLink(cast(void**)&soup_cookies_from_response, "soup_cookies_from_response", libs);
  gidLink(cast(void**)&soup_cookies_to_cookie_header, "soup_cookies_to_cookie_header", libs);
  gidLink(cast(void**)&soup_cookies_to_request, "soup_cookies_to_request", libs);
  gidLink(cast(void**)&soup_cookies_to_response, "soup_cookies_to_response", libs);
  gidLink(cast(void**)&soup_date_time_new_from_http_string, "soup_date_time_new_from_http_string", libs);
  gidLink(cast(void**)&soup_date_time_to_string, "soup_date_time_to_string", libs);
  gidLink(cast(void**)&soup_form_decode, "soup_form_decode", libs);
  gidLink(cast(void**)&soup_form_decode_multipart, "soup_form_decode_multipart", libs);
  gidLink(cast(void**)&soup_form_encode, "soup_form_encode", libs);
  gidLink(cast(void**)&soup_form_encode_datalist, "soup_form_encode_datalist", libs);
  gidLink(cast(void**)&soup_form_encode_hash, "soup_form_encode_hash", libs);
  gidLink(cast(void**)&soup_form_encode_valist, "soup_form_encode_valist", libs);
  gidLink(cast(void**)&soup_get_major_version, "soup_get_major_version", libs);
  gidLink(cast(void**)&soup_get_micro_version, "soup_get_micro_version", libs);
  gidLink(cast(void**)&soup_get_minor_version, "soup_get_minor_version", libs);
  gidLink(cast(void**)&soup_header_contains, "soup_header_contains", libs);
  gidLink(cast(void**)&soup_header_free_list, "soup_header_free_list", libs);
  gidLink(cast(void**)&soup_header_free_param_list, "soup_header_free_param_list", libs);
  gidLink(cast(void**)&soup_header_g_string_append_param, "soup_header_g_string_append_param", libs);
  gidLink(cast(void**)&soup_header_g_string_append_param_quoted, "soup_header_g_string_append_param_quoted", libs);
  gidLink(cast(void**)&soup_header_parse_list, "soup_header_parse_list", libs);
  gidLink(cast(void**)&soup_header_parse_param_list, "soup_header_parse_param_list", libs);
  gidLink(cast(void**)&soup_header_parse_param_list_strict, "soup_header_parse_param_list_strict", libs);
  gidLink(cast(void**)&soup_header_parse_quality_list, "soup_header_parse_quality_list", libs);
  gidLink(cast(void**)&soup_header_parse_semi_param_list, "soup_header_parse_semi_param_list", libs);
  gidLink(cast(void**)&soup_header_parse_semi_param_list_strict, "soup_header_parse_semi_param_list_strict", libs);
  gidLink(cast(void**)&soup_headers_parse, "soup_headers_parse", libs);
  gidLink(cast(void**)&soup_headers_parse_request, "soup_headers_parse_request", libs);
  gidLink(cast(void**)&soup_headers_parse_response, "soup_headers_parse_response", libs);
  gidLink(cast(void**)&soup_headers_parse_status_line, "soup_headers_parse_status_line", libs);
  gidLink(cast(void**)&soup_tld_domain_is_public_suffix, "soup_tld_domain_is_public_suffix", libs);
  gidLink(cast(void**)&soup_tld_get_base_domain, "soup_tld_get_base_domain", libs);
  gidLink(cast(void**)&soup_uri_copy, "soup_uri_copy", libs);
  gidLink(cast(void**)&soup_uri_decode_data_uri, "soup_uri_decode_data_uri", libs);
  gidLink(cast(void**)&soup_uri_equal, "soup_uri_equal", libs);
  gidLink(cast(void**)&soup_websocket_client_prepare_handshake, "soup_websocket_client_prepare_handshake", libs);
  gidLink(cast(void**)&soup_websocket_client_verify_handshake, "soup_websocket_client_verify_handshake", libs);
  gidLink(cast(void**)&soup_websocket_server_check_handshake, "soup_websocket_server_check_handshake", libs);
  gidLink(cast(void**)&soup_websocket_server_process_handshake, "soup_websocket_server_process_handshake", libs);

  // SessionError
  gidLink(cast(void**)&soup_session_error_quark, "soup_session_error_quark", libs);

  // Status
  gidLink(cast(void**)&soup_status_get_phrase, "soup_status_get_phrase", libs);

  // TLDError
  gidLink(cast(void**)&soup_tld_error_quark, "soup_tld_error_quark", libs);

  // WebsocketError
  gidLink(cast(void**)&soup_websocket_error_quark, "soup_websocket_error_quark", libs);
}
