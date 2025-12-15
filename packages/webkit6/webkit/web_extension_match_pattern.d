/// Module for [WebExtensionMatchPattern] class
module webkit.web_extension_match_pattern;

import gid.gid;
import glib.error;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Represents a way to specify a group of URLs for use in WebExtensions.
    
    All match patterns are specified as strings. Apart from the special `<all_urls>` pattern, match patterns
    consist of three parts: scheme, host, and path.
    
    Generally, match patterns are returned from a #WebKitWebExtension.
*/
class WebExtensionMatchPattern : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_web_extension_match_pattern_get_type != &gidSymbolNotFound ? webkit_web_extension_match_pattern_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebExtensionMatchPattern self()
  {
    return this;
  }

  /**
      Returns a new #WebKitWebExtensionMatchPattern that has `*` for scheme, host, and path.
      Returns: a newly created #WebKitWebExtensionMatchPattern
  */
  static webkit.web_extension_match_pattern.WebExtensionMatchPattern newAllHostsAndSchemes()
  {
    WebKitWebExtensionMatchPattern* _cretval;
    _cretval = webkit_web_extension_match_pattern_new_all_hosts_and_schemes();
    auto _retval = _cretval ? new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a new #WebKitWebExtensionMatchPattern for `<all_urls>`.
      Returns: a newly created #WebKitWebExtensionMatchPattern
  */
  static webkit.web_extension_match_pattern.WebExtensionMatchPattern newAllUrls()
  {
    WebKitWebExtensionMatchPattern* _cretval;
    _cretval = webkit_web_extension_match_pattern_new_all_urls();
    auto _retval = _cretval ? new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a new #WebKitWebExtensionMatchPattern for the specified scheme, host, and path strings.
  
      Params:
        scheme = A pattern URL scheme
        host = A pattern URL host
        path = A pattern URL path
      Returns: a newly created #WebKitWebExtensionMatchPattern, or null
        if any of the pattern strings are invalid.
      Throws: [ErrorWrap]
  */
  static webkit.web_extension_match_pattern.WebExtensionMatchPattern newWithScheme(string scheme, string host, string path)
  {
    WebKitWebExtensionMatchPattern* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = webkit_web_extension_match_pattern_new_with_scheme(_scheme, _host, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a new #WebKitWebExtensionMatchPattern for the specified string.
  
      Params:
        string_ = A pattern string
      Returns: a newly created #WebKitWebExtensionMatchPattern, or null
        if the pattern string is invalid.
      Throws: [ErrorWrap]
  */
  static webkit.web_extension_match_pattern.WebExtensionMatchPattern newWithString(string string_)
  {
    WebKitWebExtensionMatchPattern* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    GError *_err;
    _cretval = webkit_web_extension_match_pattern_new_with_string(_string_, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the host part of the pattern string, unless [webkit.web_extension_match_pattern.WebExtensionMatchPattern.getMatchesAllUrls] is true.
      Returns: The host string.
  */
  string getHost()
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_match_pattern_get_host(cast(WebKitWebExtensionMatchPattern*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the match pattern matches all host. This happens when
      the pattern is `<all_urls>`, or if `*` is set as the host string.
      Returns: Whether this match pattern matches all hosts.
  */
  bool getMatchesAllHosts()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_match_pattern_get_matches_all_hosts(cast(WebKitWebExtensionMatchPattern*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the match pattern matches all URLs, in other words, whether
      the pattern is `<all_urls>`.
      Returns: Whether this match pattern matches all URLs.
  */
  bool getMatchesAllUrls()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_match_pattern_get_matches_all_urls(cast(WebKitWebExtensionMatchPattern*)this._cPtr);
    return _retval;
  }

  /**
      Gets the path part of the pattern string, unless [webkit.web_extension_match_pattern.WebExtensionMatchPattern.getMatchesAllUrls] is true.
      Returns: The path string.
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_match_pattern_get_path(cast(WebKitWebExtensionMatchPattern*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the scheme part of the pattern string, unless [webkit.web_extension_match_pattern.WebExtensionMatchPattern.getMatchesAllUrls] is true.
      Returns: The scheme string.
  */
  string getScheme()
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_match_pattern_get_scheme(cast(WebKitWebExtensionMatchPattern*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the original pattern string.
      Returns: The original pattern string.
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_match_pattern_get_string(cast(WebKitWebExtensionMatchPattern*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Matches the matchPattern against the specified pattern with options.
  
      Params:
        pattern = The #WebKitWebExtensionMatchPattern to match with matchPattern.
        options = The #WebKitWebExtensionMatchPatternOptions use while matching.
      Returns: Whether the pattern matches the specified pattern.
  */
  bool matchesPattern(webkit.web_extension_match_pattern.WebExtensionMatchPattern pattern, webkit.types.WebExtensionMatchPatternOptions options)
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_match_pattern_matches_pattern(cast(WebKitWebExtensionMatchPattern*)this._cPtr, pattern ? cast(WebKitWebExtensionMatchPattern*)pattern._cPtr(No.Dup) : null, options);
    return _retval;
  }

  /**
      Matches the matchPattern against the specified URL with options.
  
      Params:
        url = The URL to match against the pattern.
        options = The #WebKitWebExtensionMatchPatternOptions use while matching.
      Returns: Whether the pattern matches the specified URL.
  */
  bool matchesUrl(string url, webkit.types.WebExtensionMatchPatternOptions options)
  {
    bool _retval;
    const(char)* _url = url.toCString(No.Alloc);
    _retval = cast(bool)webkit_web_extension_match_pattern_matches_url(cast(WebKitWebExtensionMatchPattern*)this._cPtr, _url, options);
    return _retval;
  }

  /**
      Registers a custom URL scheme that can be used in match patterns.
      
      This method should be used to register any custom URL schemes used by the app for the extension base URLs,
      other than `webkit-extension`, or if extensions should have access to other supported URL schemes when using `<all_urls>`.
  
      Params:
        urlScheme = The custom URL scheme to register
  */
  static void registerCustomURLScheme(string urlScheme)
  {
    const(char)* _urlScheme = urlScheme.toCString(No.Alloc);
    webkit_web_extension_match_pattern_register_custom_URL_scheme(_urlScheme);
  }
}
