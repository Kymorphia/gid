/// Module for [Uri] class
module glib.uri;

import gid.gid;
import glib.bytes;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;
import gobject.boxed;

/**
    The [glib.uri.Uri] type and related functions can be used to parse URIs into
    their components, and build valid URIs from individual components.
    
    Since [glib.uri.Uri] only represents absolute URIs, all [glib.uri.Uri]s will have a
    URI scheme, so [glib.uri.Uri.getScheme] will always return a non-`NULL`
    answer. Likewise, by definition, all URIs have a path component, so
    [glib.uri.Uri.getPath] will always return a non-`NULL` string (which may
    be empty).
    
    If the URI string has an
    [‘authority’ component](https://tools.ietf.org/html/rfc3986#section-3) (that
    is, if the scheme is followed by `://` rather than just `:`), then the
    [glib.uri.Uri] will contain a hostname, and possibly a port and ‘userinfo’.
    Additionally, depending on how the [glib.uri.Uri] was constructed/parsed (for example,
    using the `G_URI_FLAGS_HAS_PASSWORD` and `G_URI_FLAGS_HAS_AUTH_PARAMS` flags),
    the userinfo may be split out into a username, password, and
    additional authorization-related parameters.
    
    Normally, the components of a [glib.uri.Uri] will have all `%`-encoded
    characters decoded. However, if you construct/parse a [glib.uri.Uri] with
    `G_URI_FLAGS_ENCODED`, then the `%`-encoding will be preserved instead in
    the userinfo, path, and query fields (and in the host field if also
    created with `G_URI_FLAGS_NON_DNS`). In particular, this is necessary if
    the URI may contain binary data or non-UTF-8 text, or if decoding
    the components might change the interpretation of the URI.
    
    For example, with the encoded flag:
    
    ```c
    g_autoptr(GUri) uri = g_uri_parse ("http://host/path?query=http%3A%2F%2Fhost%2Fpath%3Fparam%3Dvalue", G_URI_FLAGS_ENCODED, &err);
    g_assert_cmpstr (g_uri_get_query (uri), ==, "query=http%3A%2F%2Fhost%2Fpath%3Fparam%3Dvalue");
    ```
    
    While the default `%`-decoding behaviour would give:
    
    ```c
    g_autoptr(GUri) uri = g_uri_parse ("http://host/path?query=http%3A%2F%2Fhost%2Fpath%3Fparam%3Dvalue", G_URI_FLAGS_NONE, &err);
    g_assert_cmpstr (g_uri_get_query (uri), ==, "query=http://host/path?param=value");
    ```
    
    During decoding, if an invalid UTF-8 string is encountered, parsing will fail
    with an error indicating the bad string location:
    
    ```c
    g_autoptr(GUri) uri = g_uri_parse ("http://host/path?query=http%3A%2F%2Fhost%2Fpath%3Fbad%3D%00alue", G_URI_FLAGS_NONE, &err);
    g_assert_error (err, G_URI_ERROR, G_URI_ERROR_BAD_QUERY);
    ```
    
    You should pass `G_URI_FLAGS_ENCODED` or `G_URI_FLAGS_ENCODED_QUERY` if you
    need to handle that case manually. In particular, if the query string
    contains `=` characters that are `%`-encoded, you should let
    [glib.uri.Uri.parseParams] do the decoding once of the query.
    
    [glib.uri.Uri] is immutable once constructed, and can safely be accessed from
    multiple threads. Its reference counting is atomic.
    
    Note that the scope of [glib.uri.Uri] is to help manipulate URIs in various applications,
    following [RFC 3986](https://tools.ietf.org/html/rfc3986). In particular,
    it doesn't intend to cover web browser needs, and doesn’t implement the
    [WHATWG URL](https://url.spec.whatwg.org/) standard. No APIs are provided to
    help prevent
    [homograph attacks](https://en.wikipedia.org/wiki/IDN_homograph_attack), so
    [glib.uri.Uri] is not suitable for formatting URIs for display to the user for making
    security-sensitive decisions.
    
    ## Relative and absolute URIs
    
    As defined in [RFC 3986](https://tools.ietf.org/html/rfc3986#section-4), the
    hierarchical nature of URIs means that they can either be ‘relative
    references’ (sometimes referred to as ‘relative URIs’) or ‘URIs’ (for
    clarity, ‘URIs’ are referred to in this documentation as
    ‘absolute URIs’ — although
    [in constrast to RFC 3986](https://tools.ietf.org/html/rfc3986#section-4.3),
    fragment identifiers are always allowed).
    
    Relative references have one or more components of the URI missing. In
    particular, they have no scheme. Any other component, such as hostname,
    query, etc. may be missing, apart from a path, which has to be specified (but
    may be empty). The path may be relative, starting with `./` rather than `/`.
    
    For example, a valid relative reference is `./path?query`,
    `/?query#fragment` or `//example.com`.
    
    Absolute URIs have a scheme specified. Any other components of the URI which
    are missing are specified as explicitly unset in the URI, rather than being
    resolved relative to a base URI using [glib.uri.Uri.parseRelative].
    
    For example, a valid absolute URI is `file:///home/bob` or
    `https://search.com?query=string`.
    
    A [glib.uri.Uri] instance is always an absolute URI. A string may be an absolute URI
    or a relative reference; see the documentation for individual functions as to
    what forms they accept.
    
    ## Parsing URIs
    
    The most minimalist APIs for parsing URIs are [glib.uri.Uri.split] and
    [glib.uri.Uri.splitWithUser]. These split a URI into its component
    parts, and return the parts; the difference between the two is that
    [glib.uri.Uri.split] treats the ‘userinfo’ component of the URI as a
    single element, while [glib.uri.Uri.splitWithUser] can (depending on the
    [glib.types.UriFlags] you pass) treat it as containing a username, password,
    and authentication parameters. Alternatively, [glib.uri.Uri.splitNetwork]
    can be used when you are only interested in the components that are
    needed to initiate a network connection to the service (scheme,
    host, and port).
    
    [glib.uri.Uri.parse] is similar to [glib.uri.Uri.split], but instead of
    returning individual strings, it returns a [glib.uri.Uri] structure (and it requires
    that the URI be an absolute URI).
    
    [glib.uri.Uri.resolveRelative] and [glib.uri.Uri.parseRelative] allow
    you to resolve a relative URI relative to a base URI.
    [glib.uri.Uri.resolveRelative] takes two strings and returns a string,
    and [glib.uri.Uri.parseRelative] takes a [glib.uri.Uri] and a string and returns a
    [glib.uri.Uri].
    
    All of the parsing functions take a [glib.types.UriFlags] argument describing
    exactly how to parse the URI; see the documentation for that type
    for more details on the specific flags that you can pass. If you
    need to choose different flags based on the type of URI, you can
    use [glib.uri.Uri.peekScheme] on the URI string to check the scheme
    first, and use that to decide what flags to parse it with.
    
    For example, you might want to use `G_URI_PARAMS_WWW_FORM` when parsing the
    params for a web URI, so compare the result of [glib.uri.Uri.peekScheme]
    against `http` and `https`.
    
    ## Building URIs
    
    [glib.uri.Uri.join] and [glib.uri.Uri.joinWithUser] can be used to construct
    valid URI strings from a set of component strings. They are the
    inverse of [glib.uri.Uri.split] and [glib.uri.Uri.splitWithUser].
    
    Similarly, [glib.uri.Uri.build] and [glib.uri.Uri.buildWithUser] can be
    used to construct a [glib.uri.Uri] from a set of component strings.
    
    As with the parsing functions, the building functions take a
    [glib.types.UriFlags] argument. In particular, it is important to keep in mind
    whether the URI components you are using are already `%`-encoded. If so,
    you must pass the `G_URI_FLAGS_ENCODED` flag.
    
    ## `file://` URIs
    
    Note that Windows and Unix both define special rules for parsing
    `file://` URIs (involving non-UTF-8 character sets on Unix, and the
    interpretation of path separators on Windows). [glib.uri.Uri] does not
    implement these rules. Use `func@GLib.filename_from_uri` and
    `func@GLib.filename_to_uri` if you want to properly convert between
    `file://` URIs and local filenames.
    
    ## URI Equality
    
    Note that there is no `g_uri_equal ()` function, because comparing
    URIs usefully requires scheme-specific knowledge that [glib.uri.Uri] does
    not have. [glib.uri.Uri] can help with normalization if you use the various
    encoded [glib.types.UriFlags] as well as `G_URI_FLAGS_SCHEME_NORMALIZE`
    however it is not comprehensive.
    For example, `data:,foo` and `data:;base64,Zm9v` resolve to the same
    thing according to the `data:` URI specification which GLib does not
    handle.
*/
class Uri : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_uri_get_type != &gidSymbolNotFound ? g_uri_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Uri self()
  {
    return this;
  }

  /**
      Gets uri's authentication parameters, which may contain
      `%`-encoding, depending on the flags with which uri was created.
      (If uri was not created with `G_URI_FLAGS_HAS_AUTH_PARAMS` then this will
      be null.)
      
      Depending on the URI scheme, [glib.uri.Uri.parseParams] may be useful for
      further parsing this information.
      Returns: uri's authentication parameters.
  */
  string getAuthParams()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_auth_params(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's flags set upon construction.
      Returns: uri's flags.
  */
  glib.types.UriFlags getFlags()
  {
    GUriFlags _cretval;
    _cretval = g_uri_get_flags(cast(GUri*)this._cPtr);
    glib.types.UriFlags _retval = cast(glib.types.UriFlags)_cretval;
    return _retval;
  }

  /**
      Gets uri's fragment, which may contain `%`-encoding, depending on
      the flags with which uri was created.
      Returns: uri's fragment.
  */
  string getFragment()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_fragment(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's host. This will never have `%`-encoded characters,
      unless it is non-UTF-8 (which can only be the case if uri was
      created with `G_URI_FLAGS_NON_DNS`).
      
      If uri contained an IPv6 address literal, this value will be just
      that address, without the brackets around it that are necessary in
      the string form of the URI. Note that in this case there may also
      be a scope ID attached to the address. Eg, `fe80::1234%``em1` (or
      `fe80::1234%``25em1` if the string is still encoded).
      Returns: uri's host.
  */
  string getHost()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_host(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's password, which may contain `%`-encoding, depending on
      the flags with which uri was created. (If uri was not created
      with `G_URI_FLAGS_HAS_PASSWORD` then this will be null.)
      Returns: uri's password.
  */
  string getPassword()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_password(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's path, which may contain `%`-encoding, depending on the
      flags with which uri was created.
      Returns: uri's path.
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_path(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's port.
      Returns: uri's port, or `-1` if no port was specified.
  */
  int getPort()
  {
    int _retval;
    _retval = g_uri_get_port(cast(GUri*)this._cPtr);
    return _retval;
  }

  /**
      Gets uri's query, which may contain `%`-encoding, depending on the
      flags with which uri was created.
      
      For queries consisting of a series of `name=value` parameters,
      #GUriParamsIter or [glib.uri.Uri.parseParams] may be useful.
      Returns: uri's query.
  */
  string getQuery()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_query(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's scheme. Note that this will always be all-lowercase,
      regardless of the string or strings that uri was created from.
      Returns: uri's scheme.
  */
  string getScheme()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_scheme(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the ‘username’ component of uri's userinfo, which may contain
      `%`-encoding, depending on the flags with which uri was created.
      If uri was not created with `G_URI_FLAGS_HAS_PASSWORD` or
      `G_URI_FLAGS_HAS_AUTH_PARAMS`, this is the same as [glib.uri.Uri.getUserinfo].
      Returns: uri's user.
  */
  string getUser()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_user(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets uri's userinfo, which may contain `%`-encoding, depending on
      the flags with which uri was created.
      Returns: uri's userinfo.
  */
  string getUserinfo()
  {
    const(char)* _cretval;
    _cretval = g_uri_get_userinfo(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Parses uri_ref according to flags and, if it is a
      [relative URI](#relative-and-absolute-uris), resolves it relative to base_uri.
      If the result is not a valid absolute URI, it will be discarded, and an error
      returned.
  
      Params:
        uriRef = a string representing a relative or absolute URI
        flags = flags describing how to parse uri_ref
      Returns: a new #GUri, or NULL on error.
      Throws: [UriException]
  */
  glib.uri.Uri parseRelative(string uriRef, glib.types.UriFlags flags)
  {
    GUri* _cretval;
    const(char)* _uriRef = uriRef.toCString(No.Alloc);
    GError *_err;
    _cretval = g_uri_parse_relative(cast(GUri*)this._cPtr, _uriRef, flags, &_err);
    if (_err)
      throw new UriException(_err);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a string representing uri.
      
      This is not guaranteed to return a string which is identical to the
      string that uri was parsed from. However, if the source URI was
      syntactically correct (according to RFC 3986), and it was parsed
      with `G_URI_FLAGS_ENCODED`, then [glib.uri.Uri.toString_] is guaranteed to return
      a string which is at least semantically equivalent to the source
      URI (according to RFC 3986).
      
      If uri might contain sensitive details, such as authentication parameters,
      or private data in its query string, and the returned string is going to be
      logged, then consider using [glib.uri.Uri.toStringPartial] to redact parts.
      Returns: a string representing uri,
            which the caller must free.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = g_uri_to_string(cast(GUri*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns a string representing uri, subject to the options in
      flags. See [glib.uri.Uri.toString_] and #GUriHideFlags for more details.
  
      Params:
        flags = flags describing what parts of uri to hide
      Returns: a string representing
            uri, which the caller must free.
  */
  string toStringPartial(glib.types.UriHideFlags flags)
  {
    char* _cretval;
    _cretval = g_uri_to_string_partial(cast(GUri*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new #GUri from the given components according to flags.
      
      See also [glib.uri.Uri.buildWithUser], which allows specifying the
      components of the "userinfo" separately.
  
      Params:
        flags = flags describing how to build the #GUri
        scheme = the URI scheme
        userinfo = the userinfo component, or null
        host = the host component, or null
        port = the port, or `-1`
        path = the path component
        query = the query component, or null
        fragment = the fragment, or null
      Returns: a new #GUri
  */
  static glib.uri.Uri build(glib.types.UriFlags flags, string scheme, string userinfo, string host, int port, string path, string query = null, string fragment = null)
  {
    GUri* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _userinfo = userinfo.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _query = query.toCString(No.Alloc);
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _cretval = g_uri_build(flags, _scheme, _userinfo, _host, port, _path, _query, _fragment);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GUri from the given components according to flags
      (`G_URI_FLAGS_HAS_PASSWORD` is added unconditionally). The flags must be
      coherent with the passed values, in particular use `%`-encoded values with
      `G_URI_FLAGS_ENCODED`.
      
      In contrast to [glib.uri.Uri.build], this allows specifying the components
      of the ‘userinfo’ field separately. Note that user must be non-null
      if either password or auth_params is non-null.
  
      Params:
        flags = flags describing how to build the #GUri
        scheme = the URI scheme
        user = the user component of the userinfo, or null
        password = the password component of the userinfo, or null
        authParams = the auth params of the userinfo, or null
        host = the host component, or null
        port = the port, or `-1`
        path = the path component
        query = the query component, or null
        fragment = the fragment, or null
      Returns: a new #GUri
  */
  static glib.uri.Uri buildWithUser(glib.types.UriFlags flags, string scheme, string user, string password, string authParams, string host, int port, string path, string query = null, string fragment = null)
  {
    GUri* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _user = user.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    const(char)* _authParams = authParams.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _query = query.toCString(No.Alloc);
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _cretval = g_uri_build_with_user(flags, _scheme, _user, _password, _authParams, _host, port, _path, _query, _fragment);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_uri_error_quark();
    return _retval;
  }

  /**
      Escapes arbitrary data for use in a URI.
      
      Normally all characters that are not ‘unreserved’ (i.e. ASCII
      alphanumerical characters plus dash, dot, underscore and tilde) are
      escaped. But if you specify characters in reserved_chars_allowed
      they are not escaped. This is useful for the ‘reserved’ characters
      in the URI specification, since those are allowed unescaped in some
      portions of a URI.
      
      Though technically incorrect, this will also allow escaping nul
      bytes as `%``00`.
  
      Params:
        unescaped = the unescaped input data.
        reservedCharsAllowed = a string of reserved
            characters that are allowed to be used, or null.
      Returns: an escaped version of unescaped.
            The returned string should be freed when no longer needed.
  */
  static string escapeBytes(ubyte[] unescaped, string reservedCharsAllowed = null)
  {
    char* _cretval;
    size_t _length;
    if (unescaped)
      _length = cast(size_t)unescaped.length;

    auto _unescaped = cast(const(ubyte)*)unescaped.ptr;
    const(char)* _reservedCharsAllowed = reservedCharsAllowed.toCString(No.Alloc);
    _cretval = g_uri_escape_bytes(_unescaped, _length, _reservedCharsAllowed);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Escapes a string for use in a URI.
      
      Normally all characters that are not "unreserved" (i.e. ASCII
      alphanumerical characters plus dash, dot, underscore and tilde) are
      escaped. But if you specify characters in reserved_chars_allowed
      they are not escaped. This is useful for the "reserved" characters
      in the URI specification, since those are allowed unescaped in some
      portions of a URI.
  
      Params:
        unescaped = the unescaped input string.
        reservedCharsAllowed = a string of reserved
            characters that are allowed to be used, or null.
        allowUtf8 = true if the result can include UTF-8 characters.
      Returns: an escaped version of unescaped. The
        returned string should be freed when no longer needed.
  */
  static string escapeString(string unescaped, string reservedCharsAllowed, bool allowUtf8)
  {
    char* _cretval;
    const(char)* _unescaped = unescaped.toCString(No.Alloc);
    const(char)* _reservedCharsAllowed = reservedCharsAllowed.toCString(No.Alloc);
    _cretval = g_uri_escape_string(_unescaped, _reservedCharsAllowed, allowUtf8);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses uri_string according to flags, to determine whether it is a valid
      [absolute URI](#relative-and-absolute-uris), i.e. it does not need to be resolved
      relative to another URI using [glib.uri.Uri.parseRelative].
      
      If it’s not a valid URI, an error is returned explaining how it’s invalid.
      
      See [glib.uri.Uri.split], and the definition of #GUriFlags, for more
      information on the effect of flags.
  
      Params:
        uriString = a string containing an absolute URI
        flags = flags for parsing uri_string
      Returns: true if uri_string is a valid absolute URI, false on error.
      Throws: [UriException]
  */
  static bool isValid(string uriString, glib.types.UriFlags flags)
  {
    bool _retval;
    const(char)* _uriString = uriString.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_uri_is_valid(_uriString, flags, &_err);
    if (_err)
      throw new UriException(_err);
    return _retval;
  }

  /**
      Joins the given components together according to flags to create
      an absolute URI string. path may not be null (though it may be the empty
      string).
      
      When host is present, path must either be empty or begin with a slash (`/`)
      character. When host is not present, path cannot begin with two slash
      characters (`//`). See
      [RFC 3986, section 3](https://tools.ietf.org/html/rfc3986#section-3).
      
      See also [glib.uri.Uri.joinWithUser], which allows specifying the
      components of the ‘userinfo’ separately.
      
      `G_URI_FLAGS_HAS_PASSWORD` and `G_URI_FLAGS_HAS_AUTH_PARAMS` are ignored if set
      in flags.
  
      Params:
        flags = flags describing how to build the URI string
        scheme = the URI scheme, or null
        userinfo = the userinfo component, or null
        host = the host component, or null
        port = the port, or `-1`
        path = the path component
        query = the query component, or null
        fragment = the fragment, or null
      Returns: an absolute URI string
  */
  static string join(glib.types.UriFlags flags, string scheme, string userinfo, string host, int port, string path, string query = null, string fragment = null)
  {
    char* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _userinfo = userinfo.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _query = query.toCString(No.Alloc);
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _cretval = g_uri_join(flags, _scheme, _userinfo, _host, port, _path, _query, _fragment);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Joins the given components together according to flags to create
      an absolute URI string. path may not be null (though it may be the empty
      string).
      
      In contrast to [glib.uri.Uri.join], this allows specifying the components
      of the ‘userinfo’ separately. It otherwise behaves the same.
      
      `G_URI_FLAGS_HAS_PASSWORD` and `G_URI_FLAGS_HAS_AUTH_PARAMS` are ignored if set
      in flags.
  
      Params:
        flags = flags describing how to build the URI string
        scheme = the URI scheme, or null
        user = the user component of the userinfo, or null
        password = the password component of the userinfo, or
            null
        authParams = the auth params of the userinfo, or
            null
        host = the host component, or null
        port = the port, or `-1`
        path = the path component
        query = the query component, or null
        fragment = the fragment, or null
      Returns: an absolute URI string
  */
  static string joinWithUser(glib.types.UriFlags flags, string scheme, string user, string password, string authParams, string host, int port, string path, string query = null, string fragment = null)
  {
    char* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _user = user.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    const(char)* _authParams = authParams.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _query = query.toCString(No.Alloc);
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _cretval = g_uri_join_with_user(flags, _scheme, _user, _password, _authParams, _host, port, _path, _query, _fragment);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Splits an URI list conforming to the text/uri-list
      mime type defined in RFC 2483 into individual URIs,
      discarding any comments. The URIs are not validated.
  
      Params:
        uriList = an URI list
      Returns: a newly allocated null-terminated list
          of strings holding the individual URIs. The array should be freed
          with [glib.global.strfreev].
  */
  static string[] listExtractUris(string uriList)
  {
    char** _cretval;
    const(char)* _uriList = uriList.toCString(No.Alloc);
    _cretval = g_uri_list_extract_uris(_uriList);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Parses uri_string according to flags. If the result is not a
      valid [absolute URI](#relative-and-absolute-uris), it will be discarded, and an
      error returned.
  
      Params:
        uriString = a string representing an absolute URI
        flags = flags describing how to parse uri_string
      Returns: a new #GUri, or NULL on error.
      Throws: [UriException]
  */
  static glib.uri.Uri parse(string uriString, glib.types.UriFlags flags)
  {
    GUri* _cretval;
    const(char)* _uriString = uriString.toCString(No.Alloc);
    GError *_err;
    _cretval = g_uri_parse(_uriString, flags, &_err);
    if (_err)
      throw new UriException(_err);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Many URI schemes include one or more attribute/value pairs as part of the URI
      value. This method can be used to parse them into a hash table. When an
      attribute has multiple occurrences, the last value is the final returned
      value. If you need to handle repeated attributes differently, use
      #GUriParamsIter.
      
      The params string is assumed to still be `%`-encoded, but the returned
      values will be fully decoded. (Thus it is possible that the returned values
      may contain `=` or separators, if the value was encoded in the input.)
      Invalid `%`-encoding is treated as with the `G_URI_FLAGS_PARSE_RELAXED`
      rules for [glib.uri.Uri.parse]. (However, if params is the path or query string
      from a #GUri that was parsed without `G_URI_FLAGS_PARSE_RELAXED` and
      `G_URI_FLAGS_ENCODED`, then you already know that it does not contain any
      invalid encoding.)
      
      `G_URI_PARAMS_WWW_FORM` is handled as documented for [glib.uri_params_iter.UriParamsIter.init_].
      
      If `G_URI_PARAMS_CASE_INSENSITIVE` is passed to flags, attributes will be
      compared case-insensitively, so a params string `attr=123&Attr=456` will only
      return a single attribute–value pair, `Attr=456`. Case will be preserved in
      the returned attributes.
      
      If params cannot be parsed (for example, it contains two separators
      characters in a row), then error is set and null is returned.
  
      Params:
        params = a `%`-encoded string containing `attribute=value`
            parameters
        length = the length of params, or `-1` if it is nul-terminated
        separators = the separator byte character set between parameters. (usually
            `&`, but sometimes `;` or both `&;`). Note that this function works on
            bytes not characters, so it can't be used to delimit UTF-8 strings for
            anything but ASCII characters. You may pass an empty set, in which case
            no splitting will occur.
        flags = flags to modify the way the parameters are handled.
      Returns: A hash table of attribute/value pairs, with both names and values
            fully-decoded; or null on error.
      Throws: [UriException]
  */
  static string[string] parseParams(string params, ptrdiff_t length, string separators, glib.types.UriParamsFlags flags)
  {
    GHashTable* _cretval;
    const(char)* _params = params.toCString(No.Alloc);
    const(char)* _separators = separators.toCString(No.Alloc);
    GError *_err;
    _cretval = g_uri_parse_params(_params, length, _separators, flags, &_err);
    if (_err)
      throw new UriException(_err);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /**
      Gets the scheme portion of a URI string.
      [RFC 3986](https://tools.ietf.org/html/rfc3986#section-3) decodes the scheme
      as:
      ```
      URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
      ```
      Common schemes include `file`, `https`, `svn+ssh`, etc.
  
      Params:
        uri = a valid URI.
      Returns: The ‘scheme’ component of the URI, or
            null on error. The returned string should be freed when no longer needed.
  */
  static string parseScheme(string uri)
  {
    char* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = g_uri_parse_scheme(_uri);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the scheme portion of a URI string.
      [RFC 3986](https://tools.ietf.org/html/rfc3986#section-3) decodes the scheme
      as:
      ```
      URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
      ```
      Common schemes include `file`, `https`, `svn+ssh`, etc.
      
      Unlike [glib.uri.Uri.parseScheme], the returned scheme is normalized to
      all-lowercase and does not need to be freed.
  
      Params:
        uri = a valid URI.
      Returns: The ‘scheme’ component of the URI, or
            null on error. The returned string is normalized to all-lowercase, and
            interned via [glib.global.internString], so it does not need to be freed.
  */
  static string peekScheme(string uri)
  {
    const(char)* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = g_uri_peek_scheme(_uri);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Parses uri_ref according to flags and, if it is a
      [relative URI](#relative-and-absolute-uris), resolves it relative to
      base_uri_string. If the result is not a valid absolute URI, it will be
      discarded, and an error returned.
      
      (If base_uri_string is null, this just returns uri_ref, or
      null if uri_ref is invalid or not absolute.)
  
      Params:
        baseUriString = a string representing a base URI
        uriRef = a string representing a relative or absolute URI
        flags = flags describing how to parse uri_ref
      Returns: the resolved URI string,
        or NULL on error.
      Throws: [UriException]
  */
  static string resolveRelative(string baseUriString, string uriRef, glib.types.UriFlags flags)
  {
    char* _cretval;
    const(char)* _baseUriString = baseUriString.toCString(No.Alloc);
    const(char)* _uriRef = uriRef.toCString(No.Alloc);
    GError *_err;
    _cretval = g_uri_resolve_relative(_baseUriString, _uriRef, flags, &_err);
    if (_err)
      throw new UriException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses uri_ref (which can be an
      [absolute or relative URI](#relative-and-absolute-uris)) according to flags, and
      returns the pieces. Any component that doesn't appear in uri_ref will be
      returned as null (but note that all URIs always have a path component,
      though it may be the empty string).
      
      If flags contains `G_URI_FLAGS_ENCODED`, then `%`-encoded characters in
      uri_ref will remain encoded in the output strings. (If not,
      then all such characters will be decoded.) Note that decoding will
      only work if the URI components are ASCII or UTF-8, so you will
      need to use `G_URI_FLAGS_ENCODED` if they are not.
      
      Note that the `G_URI_FLAGS_HAS_PASSWORD` and
      `G_URI_FLAGS_HAS_AUTH_PARAMS` flags are ignored by [glib.uri.Uri.split],
      since it always returns only the full userinfo; use
      [glib.uri.Uri.splitWithUser] if you want it split up.
  
      Params:
        uriRef = a string containing a relative or absolute URI
        flags = flags for parsing uri_ref
        scheme = on return, contains
             the scheme (converted to lowercase), or null
        userinfo = on return, contains
             the userinfo, or null
        host = on return, contains the
             host, or null
        port = on return, contains the
             port, or `-1`
        path = on return, contains the
             path
        query = on return, contains the
             query, or null
        fragment = on return, contains
             the fragment, or null
      Returns: true if uri_ref parsed successfully, false
          on error.
      Throws: [UriException]
  */
  static bool split(string uriRef, glib.types.UriFlags flags, out string scheme, out string userinfo, out string host, out int port, out string path, out string query, out string fragment)
  {
    bool _retval;
    const(char)* _uriRef = uriRef.toCString(No.Alloc);
    char* _scheme;
    char* _userinfo;
    char* _host;
    char* _path;
    char* _query;
    char* _fragment;
    GError *_err;
    _retval = cast(bool)g_uri_split(_uriRef, flags, &_scheme, &_userinfo, &_host, cast(int*)&port, &_path, &_query, &_fragment, &_err);
    if (_err)
      throw new UriException(_err);
    scheme = _scheme.fromCString(Yes.Free);
    userinfo = _userinfo.fromCString(Yes.Free);
    host = _host.fromCString(Yes.Free);
    path = _path.fromCString(Yes.Free);
    query = _query.fromCString(Yes.Free);
    fragment = _fragment.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses uri_string (which must be an [absolute URI](#relative-and-absolute-uris))
      according to flags, and returns the pieces relevant to connecting to a host.
      See the documentation for [glib.uri.Uri.split] for more details; this is
      mostly a wrapper around that function with simpler arguments.
      However, it will return an error if uri_string is a relative URI,
      or does not contain a hostname component.
  
      Params:
        uriString = a string containing an absolute URI
        flags = flags for parsing uri_string
        scheme = on return, contains
             the scheme (converted to lowercase), or null
        host = on return, contains the
             host, or null
        port = on return, contains the
             port, or `-1`
      Returns: true if uri_string parsed successfully,
          false on error.
      Throws: [UriException]
  */
  static bool splitNetwork(string uriString, glib.types.UriFlags flags, out string scheme, out string host, out int port)
  {
    bool _retval;
    const(char)* _uriString = uriString.toCString(No.Alloc);
    char* _scheme;
    char* _host;
    GError *_err;
    _retval = cast(bool)g_uri_split_network(_uriString, flags, &_scheme, &_host, cast(int*)&port, &_err);
    if (_err)
      throw new UriException(_err);
    scheme = _scheme.fromCString(Yes.Free);
    host = _host.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses uri_ref (which can be an
      [absolute or relative URI](#relative-and-absolute-uris)) according to flags, and
      returns the pieces. Any component that doesn't appear in uri_ref will be
      returned as null (but note that all URIs always have a path component,
      though it may be the empty string).
      
      See [glib.uri.Uri.split], and the definition of #GUriFlags, for more
      information on the effect of flags. Note that password will only
      be parsed out if flags contains `G_URI_FLAGS_HAS_PASSWORD`, and
      auth_params will only be parsed out if flags contains
      `G_URI_FLAGS_HAS_AUTH_PARAMS`.
  
      Params:
        uriRef = a string containing a relative or absolute URI
        flags = flags for parsing uri_ref
        scheme = on return, contains
             the scheme (converted to lowercase), or null
        user = on return, contains
             the user, or null
        password = on return, contains
             the password, or null
        authParams = on return, contains
             the auth_params, or null
        host = on return, contains the
             host, or null
        port = on return, contains the
             port, or `-1`
        path = on return, contains the
             path
        query = on return, contains the
             query, or null
        fragment = on return, contains
             the fragment, or null
      Returns: true if uri_ref parsed successfully, false
          on error.
      Throws: [UriException]
  */
  static bool splitWithUser(string uriRef, glib.types.UriFlags flags, out string scheme, out string user, out string password, out string authParams, out string host, out int port, out string path, out string query, out string fragment)
  {
    bool _retval;
    const(char)* _uriRef = uriRef.toCString(No.Alloc);
    char* _scheme;
    char* _user;
    char* _password;
    char* _authParams;
    char* _host;
    char* _path;
    char* _query;
    char* _fragment;
    GError *_err;
    _retval = cast(bool)g_uri_split_with_user(_uriRef, flags, &_scheme, &_user, &_password, &_authParams, &_host, cast(int*)&port, &_path, &_query, &_fragment, &_err);
    if (_err)
      throw new UriException(_err);
    scheme = _scheme.fromCString(Yes.Free);
    user = _user.fromCString(Yes.Free);
    password = _password.fromCString(Yes.Free);
    authParams = _authParams.fromCString(Yes.Free);
    host = _host.fromCString(Yes.Free);
    path = _path.fromCString(Yes.Free);
    query = _query.fromCString(Yes.Free);
    fragment = _fragment.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Unescapes a segment of an escaped string as binary data.
      
      Note that in contrast to [glib.uri.Uri.unescapeString], this does allow
      nul bytes to appear in the output.
      
      If any of the characters in illegal_characters appears as an escaped
      character in escaped_string, then that is an error and null will be
      returned. This is useful if you want to avoid for instance having a slash
      being expanded in an escaped path element, which might confuse pathname
      handling.
  
      Params:
        escapedString = A URI-escaped string
        length = the length (in bytes) of escaped_string to escape, or `-1` if it
            is nul-terminated.
        illegalCharacters = a string of illegal characters
            not to be allowed, or null.
      Returns: an unescaped version of escaped_string
            or null on error (if decoding failed, using `G_URI_ERROR_FAILED` error
            code). The returned #GBytes should be unreffed when no longer needed.
      Throws: [UriException]
  */
  static glib.bytes.Bytes unescapeBytes(string escapedString, ptrdiff_t length, string illegalCharacters = null)
  {
    GBytes* _cretval;
    const(char)* _escapedString = escapedString.toCString(No.Alloc);
    const(char)* _illegalCharacters = illegalCharacters.toCString(No.Alloc);
    GError *_err;
    _cretval = g_uri_unescape_bytes(_escapedString, length, _illegalCharacters, &_err);
    if (_err)
      throw new UriException(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Unescapes a segment of an escaped string.
      
      If any of the characters in illegal_characters or the NUL
      character appears as an escaped character in escaped_string, then
      that is an error and null will be returned. This is useful if you
      want to avoid for instance having a slash being expanded in an
      escaped path element, which might confuse pathname handling.
      
      Note: `NUL` byte is not accepted in the output, in contrast to
      [glib.uri.Uri.unescapeBytes].
  
      Params:
        escapedString = A string, may be null
        escapedStringEnd = Pointer to end of escaped_string,
            may be null
        illegalCharacters = An optional string of illegal
            characters not to be allowed, may be null
      Returns: an unescaped version of escaped_string,
        or null on error. The returned string should be freed when no longer
        needed.  As a special case if null is given for escaped_string, this
        function will return null.
  */
  static string unescapeSegment(string escapedString = null, string escapedStringEnd = null, string illegalCharacters = null)
  {
    char* _cretval;
    const(char)* _escapedString = escapedString.toCString(No.Alloc);
    const(char)* _escapedStringEnd = escapedStringEnd.toCString(No.Alloc);
    const(char)* _illegalCharacters = illegalCharacters.toCString(No.Alloc);
    _cretval = g_uri_unescape_segment(_escapedString, _escapedStringEnd, _illegalCharacters);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Unescapes a whole escaped string.
      
      If any of the characters in illegal_characters or the NUL
      character appears as an escaped character in escaped_string, then
      that is an error and null will be returned. This is useful if you
      want to avoid for instance having a slash being expanded in an
      escaped path element, which might confuse pathname handling.
  
      Params:
        escapedString = an escaped string to be unescaped.
        illegalCharacters = a string of illegal characters
            not to be allowed, or null.
      Returns: an unescaped version of escaped_string.
        The returned string should be freed when no longer needed.
  */
  static string unescapeString(string escapedString, string illegalCharacters = null)
  {
    char* _cretval;
    const(char)* _escapedString = escapedString.toCString(No.Alloc);
    const(char)* _illegalCharacters = illegalCharacters.toCString(No.Alloc);
    _cretval = g_uri_unescape_string(_escapedString, _illegalCharacters);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

class UriException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(glib.uri.Uri.errorQuark, cast(int)code, msg);
  }

  alias Code = UriError;
}
