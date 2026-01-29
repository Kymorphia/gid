/// Module for [Cookie] class
module soup.cookie;

import gid.gid;
import glib.date_time;
import glib.uri;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    Implements HTTP cookies, as described by
    [RFC 6265](http://tools.ietf.org/html/rfc6265.txt).
    
    To have a `class@Session` handle cookies for your appliction
    automatically, use a `class@CookieJar`.
    
    @name and @value will be set for all cookies. If the cookie is
    generated from a string that appears to have no name, then @name
    will be the empty string.
    
    @domain and @path give the host or domain, and path within that
    host/domain, to restrict this cookie to. If @domain starts with
    ".", that indicates a domain (which matches the string after the
    ".", or any hostname that has @domain as a suffix). Otherwise, it
    is a hostname and must match exactly.
    
    @expires will be non-null if the cookie uses either the original
    "expires" attribute, or the newer "max-age" attribute. If @expires
    is null, it indicates that neither "expires" nor "max-age" was
    specified, and the cookie expires at the end of the session.
    
    If @http_only is set, the cookie should not be exposed to untrusted
    code (eg, javascript), so as to minimize the danger posed by
    cross-site scripting attacks.
*/
class Cookie : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_get_type != &gidSymbolNotFound ? soup_cookie_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Cookie self()
  {
    return this;
  }

  /**
      Creates a new #SoupCookie with the given attributes.
      
      Use [soup.cookie.Cookie.setSecure] and [soup.cookie.Cookie.setHttpOnly] if you
      need to set those attributes on the returned cookie.
      
      If domain starts with ".", that indicates a domain (which matches
      the string after the ".", or any hostname that has domain as a
      suffix). Otherwise, it is a hostname and must match exactly.
      
      max_age is used to set the "expires" attribute on the cookie; pass
      -1 to not include the attribute (indicating that the cookie expires
      with the current session), 0 for an already-expired cookie, or a
      lifetime in seconds. You can use the constants
      [soup.types.COOKIE_MAX_AGE_ONE_HOUR], [soup.types.COOKIE_MAX_AGE_ONE_DAY],
      [soup.types.COOKIE_MAX_AGE_ONE_WEEK] and [soup.types.COOKIE_MAX_AGE_ONE_YEAR] (or
      multiples thereof) to calculate this value. (If you really care
      about setting the exact time that the cookie will expire, use
      [soup.cookie.Cookie.setExpires].)
      
      As of version 3.4.0 the default value of a cookie's same-site-policy
      is [soup.types.SameSitePolicy.Lax].
  
      Params:
        name = cookie name
        value = cookie value
        domain = cookie domain or hostname
        path = cookie path, or null
        maxAge = max age of the cookie, or -1 for a session cookie
      Returns: a new #SoupCookie.
  */
  this(string name, string value, string domain, string path, int maxAge)
  {
    SoupCookie* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _domain = domain.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = soup_cookie_new(_name, _value, _domain, _path, maxAge);
    this(_cretval, Yes.Take);
  }

  /**
      Tests if cookie should be sent to uri.
      
      (At the moment, this does not check that cookie's domain matches
      uri, because it assumes that the caller has already done that.
      But don't rely on that; it may change in the future.)
  
      Params:
        uri = a #GUri
      Returns: true if cookie should be sent to uri, false if not
  */
  bool appliesToUri(glib.uri.Uri uri)
  {
    bool _retval;
    _retval = cast(bool)soup_cookie_applies_to_uri(cast(SoupCookie*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Copies cookie.
      Returns: a copy of cookie
  */
  soup.cookie.Cookie copy()
  {
    SoupCookie* _cretval;
    _cretval = soup_cookie_copy(cast(SoupCookie*)this._cPtr);
    auto _retval = _cretval ? new soup.cookie.Cookie(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if the cookie's domain and host match.
      
      The domains match if cookie should be sent when making a request to host,
      or that cookie should be accepted when receiving a response from host.
  
      Params:
        host = a URI
      Returns: true if the domains match, false otherwise
  */
  bool domainMatches(string host)
  {
    bool _retval;
    const(char)* _host = host.toCString(No.Alloc);
    _retval = cast(bool)soup_cookie_domain_matches(cast(SoupCookie*)this._cPtr, _host);
    return _retval;
  }

  /**
      Tests if cookie1 and cookie2 are equal.
      
      Note that currently, this does not check that the cookie domains
      match. This may change in the future.
  
      Params:
        cookie2 = a #SoupCookie
      Returns: whether the cookies are equal.
  */
  bool equal(soup.cookie.Cookie cookie2)
  {
    bool _retval;
    _retval = cast(bool)soup_cookie_equal(cast(SoupCookie*)this._cPtr, cookie2 ? cast(SoupCookie*)cookie2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets cookie's domain.
      Returns: cookie's domain
  */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_domain(cast(SoupCookie*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets cookie's expiration time.
      Returns: cookie's expiration time, which is
          owned by cookie and should not be modified or freed.
  */
  glib.date_time.DateTime getExpires()
  {
    GDateTime* _cretval;
    _cretval = soup_cookie_get_expires(cast(SoupCookie*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets cookie's HttpOnly attribute.
      Returns: cookie's HttpOnly attribute
  */
  bool getHttpOnly()
  {
    bool _retval;
    _retval = cast(bool)soup_cookie_get_http_only(cast(SoupCookie*)this._cPtr);
    return _retval;
  }

  /**
      Gets cookie's name.
      Returns: cookie's name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_name(cast(SoupCookie*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets cookie's path.
      Returns: cookie's path
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_path(cast(SoupCookie*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the same-site policy for this cookie.
      Returns: a #SoupSameSitePolicy
  */
  soup.types.SameSitePolicy getSameSitePolicy()
  {
    SoupSameSitePolicy _cretval;
    _cretval = soup_cookie_get_same_site_policy(cast(SoupCookie*)this._cPtr);
    soup.types.SameSitePolicy _retval = cast(soup.types.SameSitePolicy)_cretval;
    return _retval;
  }

  /**
      Gets cookie's secure attribute.
      Returns: cookie's secure attribute
  */
  bool getSecure()
  {
    bool _retval;
    _retval = cast(bool)soup_cookie_get_secure(cast(SoupCookie*)this._cPtr);
    return _retval;
  }

  /**
      Gets cookie's value.
      Returns: cookie's value
  */
  string getValue()
  {
    const(char)* _cretval;
    _cretval = soup_cookie_get_value(cast(SoupCookie*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets cookie's domain to domain.
  
      Params:
        domain = the new domain
  */
  void setDomain(string domain)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    soup_cookie_set_domain(cast(SoupCookie*)this._cPtr, _domain);
  }

  /**
      Sets cookie's expiration time to expires.
      
      If expires is null, cookie will be a session cookie and will expire at the
      end of the client's session.
      
      (This sets the same property as [soup.cookie.Cookie.setMaxAge].)
  
      Params:
        expires = the new expiration time, or null
  */
  void setExpires(glib.date_time.DateTime expires)
  {
    soup_cookie_set_expires(cast(SoupCookie*)this._cPtr, expires ? cast(GDateTime*)expires._cPtr(No.Dup) : null);
  }

  /**
      Sets cookie's HttpOnly attribute to http_only.
      
      If true, cookie will be marked as "http only", meaning it should not be
      exposed to web page scripts or other untrusted code.
  
      Params:
        httpOnly = the new value for the HttpOnly attribute
  */
  void setHttpOnly(bool httpOnly)
  {
    soup_cookie_set_http_only(cast(SoupCookie*)this._cPtr, httpOnly);
  }

  /**
      Sets cookie's max age to max_age.
      
      If max_age is -1, the cookie is a session cookie, and will expire at the end
      of the client's session. Otherwise, it is the number of seconds until the
      cookie expires. You can use the constants [soup.types.COOKIE_MAX_AGE_ONE_HOUR],
      [soup.types.COOKIE_MAX_AGE_ONE_DAY], [soup.types.COOKIE_MAX_AGE_ONE_WEEK] and
      [soup.types.COOKIE_MAX_AGE_ONE_YEAR] (or multiples thereof) to calculate this value.
      (A value of 0 indicates that the cookie should be considered
      already-expired.)
      
      This sets the same property as [soup.cookie.Cookie.setExpires].
  
      Params:
        maxAge = the new max age
  */
  void setMaxAge(int maxAge)
  {
    soup_cookie_set_max_age(cast(SoupCookie*)this._cPtr, maxAge);
  }

  /**
      Sets cookie's name to name.
  
      Params:
        name = the new name
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    soup_cookie_set_name(cast(SoupCookie*)this._cPtr, _name);
  }

  /**
      Sets cookie's path to path.
  
      Params:
        path = the new path
  */
  void setPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    soup_cookie_set_path(cast(SoupCookie*)this._cPtr, _path);
  }

  /**
      When used in conjunction with
      [soup.cookie_jar.CookieJar.getCookieListWithSameSiteInfo] this sets the policy
      of when this cookie should be exposed.
  
      Params:
        policy = a #SoupSameSitePolicy
  */
  void setSameSitePolicy(soup.types.SameSitePolicy policy)
  {
    soup_cookie_set_same_site_policy(cast(SoupCookie*)this._cPtr, policy);
  }

  /**
      Sets cookie's secure attribute to secure.
      
      If true, cookie will only be transmitted from the client to the server over
      secure (https) connections.
  
      Params:
        secure = the new value for the secure attribute
  */
  void setSecure(bool secure)
  {
    soup_cookie_set_secure(cast(SoupCookie*)this._cPtr, secure);
  }

  /**
      Sets cookie's value to value.
  
      Params:
        value = the new value
  */
  void setValue(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    soup_cookie_set_value(cast(SoupCookie*)this._cPtr, _value);
  }

  /**
      Serializes cookie in the format used by the Cookie header (ie, for
      returning a cookie from a `classSession` to a server).
      Returns: the header
  */
  string toCookieHeader()
  {
    char* _cretval;
    _cretval = soup_cookie_to_cookie_header(cast(SoupCookie*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Serializes cookie in the format used by the Set-Cookie header.
      
      i.e. for sending a cookie from a `classServer` to a client.
      Returns: the header
  */
  string toSetCookieHeader()
  {
    char* _cretval;
    _cretval = soup_cookie_to_set_cookie_header(cast(SoupCookie*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses header and returns a #SoupCookie.
      
      If header contains multiple cookies, only the first one will be parsed.
      
      If header does not have "path" or "domain" attributes, they will
      be defaulted from origin. If origin is null, path will default
      to "/", but domain will be left as null. Note that this is not a
      valid state for a #SoupCookie, and you will need to fill in some
      appropriate string for the domain if you want to actually make use
      of the cookie.
      
      As of version 3.4.0 the default value of a cookie's same-site-policy
      is [soup.types.SameSitePolicy.Lax].
  
      Params:
        header = a cookie string (eg, the value of a Set-Cookie header)
        origin = origin of the cookie
      Returns: a new #SoupCookie, or null if it could
          not be parsed, or contained an illegal "domain" attribute for a
          cookie originating from origin.
  */
  static soup.cookie.Cookie parse(string header, glib.uri.Uri origin = null)
  {
    SoupCookie* _cretval;
    const(char)* _header = header.toCString(No.Alloc);
    _cretval = soup_cookie_parse(_header, origin ? cast(GUri*)origin._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new soup.cookie.Cookie(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
