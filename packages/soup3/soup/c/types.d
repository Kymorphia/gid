/// C types for soup3 library
module soup.c.types;

public import gid.basictypes;
public import gio.c.types;

/**
    The type of cache; this affects what kinds of responses will be
    saved.
*/
enum SoupCacheType
{
  /**
      a single-user cache
  */
  SingleUser = 0,

  /**
      a shared cache
  */
  Shared = 1,
}

/**
    Indicates if a message should or shouldn't be cached.
*/
enum SoupCacheability : uint
{
  /**
      The message should be cached
  */
  Cacheable = 1,

  /**
      The message shouldn't be cached
  */
  Uncacheable = 2,

  /**
      The messages cache should be invalidated
  */
  Invalidates = 4,

  /**
      The messages cache should be updated
  */
  Validates = 8,
}

/**
    The policy for accepting or rejecting cookies returned in
    responses.
*/
enum SoupCookieJarAcceptPolicy
{
  /**
      accept all cookies unconditionally.
  */
  Always = 0,

  /**
      reject all cookies unconditionally.
  */
  Never = 1,

  /**
      accept all cookies set by the main
        document loaded in the application using libsoup. An example of the most
        common case, web browsers, would be: If http://www.example.com is the page
        loaded, accept all cookies set by example.com, but if a resource from
        http://www.third-party.com is loaded from that page reject any cookie that
        it could try to set. For libsoup to be able to tell apart first party
        cookies from the rest, the application must call
        [soup.message.Message.setFirstParty] on each outgoing `class@Message`, setting
        the [glib.uri.Uri] of the main document. If no first party is set in a
        message when this policy is in effect, cookies will be assumed to be third
        party by default.
  */
  NoThirdParty = 2,

  /**
      accept all cookies set by
        the main document loaded in the application using libsoup, and from domains
        that have previously set at least one cookie when loaded as the main
        document. An example of the most common case, web browsers, would be: if
        http://www.example.com is the page loaded, accept all cookies set by
        example.com, but if a resource from http://www.third-party.com is loaded
        from that page, reject any cookie that it could try to set unless it
        already has a cookie in the cookie jar. For libsoup to be able to tell
        apart first party cookies from the rest, the application must call
        [soup.message.Message.setFirstParty] on each outgoing #SoupMessage, setting the
        [glib.uri.Uri] of the main document. If no first party is set in a
        message when this policy is in effect, cookies will be assumed to be third
        party by default.
  */
  GrandfatheredThirdParty = 3,
}

/**
    Date formats that `func@date_time_to_string` can use.
    
    @SOUP_DATE_HTTP and @SOUP_DATE_COOKIE always coerce the time to
    UTC.
    
    This enum may be extended with more values in future releases.
*/
enum SoupDateFormat
{
  /**
      RFC 1123 format, used by the HTTP "Date" header. Eg
        "Sun, 06 Nov 1994 08:49:37 GMT".
  */
  Http = 1,

  /**
      The format for the "Expires" timestamp in the
        Netscape cookie specification. Eg, "Sun, 06-Nov-1994 08:49:37 GMT".
  */
  Cookie = 2,
}

/**
    How a message body is encoded for transport
*/
enum SoupEncoding
{
  /**
      unknown / error
  */
  Unrecognized = 0,

  /**
      no body is present (which is not the same as a
        0-length body, and only occurs in certain places)
  */
  None = 1,

  /**
      Content-Length encoding
  */
  ContentLength = 2,

  /**
      Response body ends when the connection is closed
  */
  Eof = 3,

  /**
      chunked encoding (currently only supported
        for response)
  */
  Chunked = 4,

  /**
      multipart/byteranges (Reserved for future
        use: NOT CURRENTLY IMPLEMENTED)
  */
  Byteranges = 5,
}

/**
    Represents the parsed value of the "Expect" header.
*/
enum SoupExpectation : uint
{
  /**
      any unrecognized expectation
  */
  Unrecognized = 1,

  /**
      "100-continue"
  */
  Continue = 2,
}

/**
    Indicates the HTTP protocol version being used.
*/
enum SoupHTTPVersion
{
  /**
      HTTP 1.0 (RFC 1945)
  */
  Http10 = 0,

  /**
      HTTP 1.1 (RFC 2616)
  */
  Http11 = 1,

  /**
      HTTP 2.0 (RFC 7540)
  */
  Http20 = 2,
}

/**
    Describes the level of logging output to provide.
*/
enum SoupLoggerLogLevel
{
  /**
      No logging
  */
  None = 0,

  /**
      Log the Request-Line or Status-Line and
        the Soup-Debug pseudo-headers
  */
  Minimal = 1,

  /**
      Log the full request/response headers
  */
  Headers = 2,

  /**
      Log the full headers and request/response bodies
  */
  Body = 3,
}

/**
    The lifetime of the memory being passed.
*/
enum SoupMemoryUse
{
  /**
      The memory is statically allocated and
        constant; libsoup can use the passed-in buffer directly and not
        need to worry about it being modified or freed.
  */
  Static = 0,

  /**
      The caller has allocated the memory and libsoup
        will assume ownership of it and free it with `func@GLib.free`.
  */
  Take = 1,

  /**
      The passed-in data belongs to the caller and
        libsoup will copy it into new memory leaving the caller free
        to reuse the original memory.
  */
  Copy = 2,
}

/**
    Various flags that can be set on a #SoupMessage to alter its
    behavior.
*/
enum SoupMessageFlags : uint
{
  /**
      The session should not follow redirect
        (3xx) responses received by this message.
  */
  NoRedirect = 2,

  /**
      Requests that the message should be
        sent on a newly-created connection, not reusing an existing
        persistent connection. Note that messages with non-idempotent
        `property@Message:method`s behave this way by default, unless
        #SOUP_MESSAGE_IDEMPOTENT is set.
  */
  NewConnection = 4,

  /**
      The message is considered idempotent,
        regardless its `property@Message:method`, and allows reuse of existing
        idle connections, instead of always requiring a new one, unless
        #SOUP_MESSAGE_NEW_CONNECTION is set.
  */
  Idempotent = 8,

  /**
      The `class@AuthManager` should not use
        the credentials cache for this message, neither to use cached credentials
        to automatically authenticate this message nor to cache the credentials
        after the message is successfully authenticated. This applies to both server
        and proxy authentication. Note that `signal@Message::authenticate` signal will
        be emitted, if you want to disable authentication for a message use
        [soup.message.Message.disableFeature] passing #SOUP_TYPE_AUTH_MANAGER instead.
  */
  DoNotUseAuthCache = 16,

  /**
      Metrics will be collected for this message.
  */
  CollectMetrics = 32,
}

/**
    Value passed to [soup.message_headers.MessageHeaders.new_] to set certain default
    behaviors.
*/
enum SoupMessageHeadersType
{
  /**
      request headers
  */
  Request = 0,

  /**
      response headers
  */
  Response = 1,

  /**
      multipart body part headers
  */
  Multipart = 2,
}

/**
    Priorities that can be set on a `class@Message` to instruct the message queue
    to process it before any other message with lower priority.
*/
enum SoupMessagePriority
{
  /**
      The lowest priority, the messages
        with this priority will be the last ones to be attended.
  */
  VeryLow = 0,

  /**
      Use this for low priority messages, a
        #SoupMessage with the default priority will be processed first.
  */
  Low = 1,

  /**
      The default priotity, this is the
        priority assigned to the #SoupMessage by default.
  */
  Normal = 2,

  /**
      High priority, a #SoupMessage with
        this priority will be processed before the ones with the default
        priority.
  */
  High = 3,

  /**
      The highest priority, use this
        for very urgent #SoupMessage as they will be the first ones to be
        attended.
  */
  VeryHigh = 4,
}

/**
    Represents the same-site policies of a cookie.
*/
enum SoupSameSitePolicy
{
  /**
      The cookie is exposed with both cross-site and same-site requests
  */
  None = 0,

  /**
      The cookie is withheld on cross-site requests but exposed on cross-site navigations
  */
  Lax = 1,

  /**
      The cookie is only exposed for same-site requests
  */
  Strict = 2,
}

/**
    Options to pass to [soup.server.Server.listen], etc.
    
    [soup.types.ServerListenOptions.Ipv4Only] and [soup.types.ServerListenOptions.Ipv6Only]
    only make sense with [soup.server.Server.listenAll] and
    [soup.server.Server.listenLocal], not plain [soup.server.Server.listen] (which
    simply listens on whatever kind of socket you give it). And you
    cannot specify both of them in a single call.
*/
enum SoupServerListenOptions : uint
{
  /**
      Listen for https connections rather
        than plain http.
  */
  Https = 1,

  /**
      Only listen on IPv4 interfaces.
  */
  Ipv4Only = 2,

  /**
      Only listen on IPv6 interfaces.
  */
  Ipv6Only = 4,
}

/**
    A #SoupSession error.
*/
enum SoupSessionError
{
  /**
      the server's response could not
        be parsed
  */
  Parsing = 0,

  /**
      the server's response was in an
        unsupported format
  */
  Encoding = 1,

  /**
      the message has been redirected
        too many times
  */
  TooManyRedirects = 2,

  /**
      the message has been restarted
        too many times
  */
  TooManyRestarts = 3,

  /**
      failed to redirect message because
        Location header was missing or empty in response
  */
  RedirectNoLocation = 4,

  /**
      failed to redirect message because
        Location header contains an invalid URI
  */
  RedirectBadUri = 5,

  /**
      the message is already in the
        session queue. Messages can only be reused after unqueued.
  */
  MessageAlreadyInQueue = 6,
}

/**
    These represent the known HTTP status code values, plus various
    network and internal errors.
    
    Note that no libsoup functions take or return this type directly;
    any function that works with status codes will accept unrecognized
    status codes as well.
*/
enum SoupStatus
{
  /**
      No status available. (Eg, the message has not
      been sent yet)
  */
  None = 0,

  /**
      100 Continue (HTTP)
  */
  Continue = 100,

  /**
      101 Switching Protocols (HTTP)
  */
  SwitchingProtocols = 101,

  /**
      102 Processing (WebDAV)
  */
  Processing = 102,

  /**
      200 Success (HTTP). Also used by many lower-level
      soup routines to indicate success.
  */
  Ok = 200,

  /**
      201 Created (HTTP)
  */
  Created = 201,

  /**
      202 Accepted (HTTP)
  */
  Accepted = 202,

  /**
      203 Non-Authoritative Information
      (HTTP)
  */
  NonAuthoritative = 203,

  /**
      204 No Content (HTTP)
  */
  NoContent = 204,

  /**
      205 Reset Content (HTTP)
  */
  ResetContent = 205,

  /**
      206 Partial Content (HTTP)
  */
  PartialContent = 206,

  /**
      207 Multi-Status (WebDAV)
  */
  MultiStatus = 207,

  /**
      300 Multiple Choices (HTTP)
  */
  MultipleChoices = 300,

  /**
      301 Moved Permanently (HTTP)
  */
  MovedPermanently = 301,

  /**
      302 Found (HTTP)
  */
  Found = 302,

  /**
      302 Moved Temporarily (old name,
      RFC 2068)
  */
  MovedTemporarily = 302,

  /**
      303 See Other (HTTP)
  */
  SeeOther = 303,

  /**
      304 Not Modified (HTTP)
  */
  NotModified = 304,

  /**
      305 Use Proxy (HTTP)
  */
  UseProxy = 305,

  /**
      306 [Unused] (HTTP)
  */
  NotAppearingInThisProtocol = 306,

  /**
      307 Temporary Redirect (HTTP)
  */
  TemporaryRedirect = 307,

  /**
      308 Permanent Redirect (HTTP)
  */
  PermanentRedirect = 308,

  /**
      400 Bad Request (HTTP)
  */
  BadRequest = 400,

  /**
      401 Unauthorized (HTTP)
  */
  Unauthorized = 401,

  /**
      402 Payment Required (HTTP)
  */
  PaymentRequired = 402,

  /**
      403 Forbidden (HTTP)
  */
  Forbidden = 403,

  /**
      404 Not Found (HTTP)
  */
  NotFound = 404,

  /**
      405 Method Not Allowed (HTTP)
  */
  MethodNotAllowed = 405,

  /**
      406 Not Acceptable (HTTP)
  */
  NotAcceptable = 406,

  /**
      407 Proxy Authentication
      Required (HTTP)
  */
  ProxyAuthenticationRequired = 407,

  /**
      shorter alias for
      [soup.types.Status.ProxyAuthenticationRequired]
  */
  ProxyUnauthorized = 407,

  /**
      408 Request Timeout (HTTP)
  */
  RequestTimeout = 408,

  /**
      409 Conflict (HTTP)
  */
  Conflict = 409,

  /**
      410 Gone (HTTP)
  */
  Gone = 410,

  /**
      411 Length Required (HTTP)
  */
  LengthRequired = 411,

  /**
      412 Precondition Failed (HTTP)
  */
  PreconditionFailed = 412,

  /**
      413 Request Entity Too Large
      (HTTP)
  */
  RequestEntityTooLarge = 413,

  /**
      414 Request-URI Too Long (HTTP)
  */
  RequestUriTooLong = 414,

  /**
      415 Unsupported Media Type
      (HTTP)
  */
  UnsupportedMediaType = 415,

  /**
      416 Requested Range
      Not Satisfiable (HTTP)
  */
  RequestedRangeNotSatisfiable = 416,

  /**
      shorter alias for
      [soup.types.Status.RequestedRangeNotSatisfiable]
  */
  InvalidRange = 416,

  /**
      417 Expectation Failed (HTTP)
  */
  ExpectationFailed = 417,

  /**
      421 Misdirected Request
  */
  MisdirectedRequest = 421,

  /**
      422 Unprocessable Entity
      (WebDAV)
  */
  UnprocessableEntity = 422,

  /**
      423 Locked (WebDAV)
  */
  Locked = 423,

  /**
      424 Failed Dependency (WebDAV)
  */
  FailedDependency = 424,

  /**
      500 Internal Server Error
      (HTTP)
  */
  InternalServerError = 500,

  /**
      501 Not Implemented (HTTP)
  */
  NotImplemented = 501,

  /**
      502 Bad Gateway (HTTP)
  */
  BadGateway = 502,

  /**
      503 Service Unavailable (HTTP)
  */
  ServiceUnavailable = 503,

  /**
      504 Gateway Timeout (HTTP)
  */
  GatewayTimeout = 504,

  /**
      505 HTTP Version Not
      Supported (HTTP)
  */
  HttpVersionNotSupported = 505,

  /**
      507 Insufficient Storage
      (WebDAV)
  */
  InsufficientStorage = 507,

  /**
      510 Not Extended (RFC 2774)
  */
  NotExtended = 510,
}

/**
    Error codes for `SOUP_TLD_ERROR`.
*/
enum SoupTLDError
{
  /**
      A hostname was syntactically
        invalid.
  */
  InvalidHostname = 0,

  /**
      The passed-in "hostname" was
        actually an IP address (and thus has no base domain or
        public suffix).
  */
  IsIpAddress = 1,

  /**
      The passed-in hostname
        did not have enough components. Eg, calling
        `func@tld_get_base_domain` on <literal>"co.uk"</literal>.
  */
  NotEnoughDomains = 2,

  /**
      The passed-in hostname has
        no recognized public suffix.
  */
  NoBaseDomain = 3,

  /**
      The Public Suffix List was not
        available.
  */
  NoPslData = 4,
}

/**
    Enum values passed to `func@uri_copy` to indicate the components of
    the URI that should be updated with the given values.
*/
enum SoupURIComponent
{
  /**
      no component
  */
  None = 0,

  /**
      the URI scheme component
  */
  Scheme = 1,

  /**
      the URI user component
  */
  User = 2,

  /**
      the URI password component
  */
  Password = 3,

  /**
      the URI authentication parameters component
  */
  AuthParams = 4,

  /**
      the URI host component
  */
  Host = 5,

  /**
      the URI port component
  */
  Port = 6,

  /**
      the URI path component
  */
  Path = 7,

  /**
      the URI query component
  */
  Query = 8,

  /**
      the URI fragment component
  */
  Fragment = 9,
}

/**
    Pre-defined close codes that can be passed to
    [soup.websocket_connection.WebsocketConnection.close] or received from
    [soup.websocket_connection.WebsocketConnection.getCloseCode].
    
    However, other codes are also allowed.
*/
enum SoupWebsocketCloseCode
{
  /**
      a normal, non-error close
  */
  Normal = 1000,

  /**
      the client/server is going away
  */
  GoingAway = 1001,

  /**
      a protocol error occurred
  */
  ProtocolError = 1002,

  /**
      the endpoint received data
        of a type that it does not support.
  */
  UnsupportedData = 1003,

  /**
      reserved value indicating that
        no close code was present; must not be sent.
  */
  NoStatus = 1005,

  /**
      reserved value indicating that
        the connection was closed abnormally; must not be sent.
  */
  Abnormal = 1006,

  /**
      the endpoint received data that
        was invalid (eg, non-UTF-8 data in a text message).
  */
  BadData = 1007,

  /**
      generic error code
        indicating some sort of policy violation.
  */
  PolicyViolation = 1008,

  /**
      the endpoint received a message
        that is too big to process.
  */
  TooBig = 1009,

  /**
      the client is closing the
        connection because the server failed to negotiate a required
        extension.
  */
  NoExtension = 1010,

  /**
      the server is closing the
        connection because it was unable to fulfill the request.
  */
  ServerError = 1011,

  /**
      reserved value indicating that
        the TLS handshake failed; must not be sent.
  */
  TlsHandshake = 1015,
}

/**
    The type of a `class@WebsocketConnection`.
*/
enum SoupWebsocketConnectionType
{
  /**
      unknown/invalid connection
  */
  Unknown = 0,

  /**
      a client-side connection
  */
  Client = 1,

  /**
      a server-side connection
  */
  Server = 2,
}

/**
    The type of data contained in a `signal@WebsocketConnection::message` signal.
*/
enum SoupWebsocketDataType
{
  /**
      UTF-8 text
  */
  Text = 1,

  /**
      binary data
  */
  Binary = 2,
}

/**
    WebSocket-related errors.
*/
enum SoupWebsocketError
{
  /**
      a generic error
  */
  Failed = 0,

  /**
      attempted to handshake with a
        server that does not appear to understand WebSockets.
  */
  NotWebsocket = 1,

  /**
      the WebSocket handshake failed
        because some detail was invalid (eg, incorrect accept key).
  */
  BadHandshake = 2,

  /**
      the WebSocket handshake failed
        because the "Origin" header was not an allowed value.
  */
  BadOrigin = 3,
}

/**
    The state of the WebSocket connection.
*/
enum SoupWebsocketState
{
  /**
      the connection is ready to send messages
  */
  Open = 1,

  /**
      the connection is in the process of
        closing down; messages may be received, but not sent
  */
  Closing = 2,

  /**
      the connection is completely closed down
  */
  Closed = 3,
}

/**
    The abstract base class for handling authentication.
    
    Specific HTTP Authentication mechanisms are implemented by its subclasses,
    but applications never need to be aware of the specific subclasses being
    used.
    
    #SoupAuth objects store the authentication data associated with a given bit
    of web space. They are created automatically by `class@Session`.
*/
struct SoupAuth
{
  /** */
  GObject parentInstance;
}

/**
    HTTP "Basic" authentication.
    
    `class@Session`s support this by default; if you want to disable
    support for it, call [soup.session.Session.removeFeatureByType],
    passing `SOUP_TYPE_AUTH_BASIC`.
*/
struct SoupAuthBasic;

/** */
struct SoupAuthClass
{
  /** */
  GObjectClass parentClass;

  /** */
  const(char)* schemeName;

  /** */
  uint strength;

  /** */
  extern(C) gboolean function(SoupAuth* auth, SoupMessage* msg, GHashTable* authHeader) update;

  /** */
  extern(C) GSList* function(SoupAuth* auth, GUri* sourceUri) getProtectionSpace;

  /** */
  extern(C) void function(SoupAuth* auth, const(char)* username, const(char)* password) authenticate;

  /** */
  extern(C) gboolean function(SoupAuth* auth) isAuthenticated;

  /** */
  extern(C) char* function(SoupAuth* auth, SoupMessage* msg) getAuthorization;

  /** */
  extern(C) gboolean function(SoupAuth* auth, SoupMessage* msg) isReady;

  /** */
  extern(C) gboolean function(SoupAuth* auth) canAuthenticate;

  /** */
  void*[6] padding;
}

/**
    HTTP "Digest" authentication.
    
    `class@Session`s support this by default; if you want to disable
    support for it, call [soup.session.Session.removeFeatureByType]
    passing `SOUP_TYPE_AUTH_DIGEST`.
*/
struct SoupAuthDigest;

/**
    Server-side authentication.
    
    A #SoupAuthDomain manages authentication for all or part of a
    `class@Server`. To make a server require authentication, first create
    an appropriate subclass of #SoupAuthDomain, and then add it to the
    server with [soup.server.Server.addAuthDomain].
    
    In order for an auth domain to have any effect, you must add one or more
    paths to it (via [soup.auth_domain.AuthDomain.addPath]). To require authentication for
    all ordinary requests, add the path `"/"`. (Note that this does not include
    the special `"*"` URI (eg, "OPTIONS *"), which must be added as a separate
    path if you want to cover it.)
    
    If you need greater control over which requests should and shouldn't be
    authenticated, add paths covering everything you *might* want authenticated,
    and then use a filter ([soup.auth_domain.AuthDomain.setFilter] to bypass
    authentication for those requests that don't need it.
*/
struct SoupAuthDomain
{
  /** */
  GObject parentInstance;
}

/**
    Server-side "Basic" authentication.
    
    #SoupAuthDomainBasic handles the server side of HTTP "Basic" (ie,
    cleartext password) authentication.
*/
struct SoupAuthDomainBasic;

/** */
struct SoupAuthDomainBasicClass
{
  /** */
  SoupAuthDomainClass parentClass;
}

/** */
struct SoupAuthDomainClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* header) accepts;

  /** */
  extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg) challenge;

  /** */
  extern(C) gboolean function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password) checkPassword;

  /** */
  void*[6] padding;
}

/**
    Server-side "Digest" authentication.
    
    #SoupAuthDomainDigest handles the server side of HTTP "Digest"
    authentication.
*/
struct SoupAuthDomainDigest;

/** */
struct SoupAuthDomainDigestClass
{
  /** */
  SoupAuthDomainClass parentClass;
}

/**
    HTTP client-side authentication handler.
    
    #SoupAuthManager is the `iface@SessionFeature` that handles HTTP
    authentication for a `class@Session`.
    
    A #SoupAuthManager is added to the session by default, and normally
    you don't need to worry about it at all. However, if you want to
    disable HTTP authentication, you can remove the feature from the
    session with [soup.session.Session.removeFeatureByType] or disable it on
    individual requests with [soup.message.Message.disableFeature].
    
    You can use this with [soup.session.Session.removeFeatureByType] or
    [soup.message.Message.disableFeature].
    
    (Although this type has only been publicly visible since libsoup 2.42, it has
    always existed in the background, and you can use `g_type_from_name
    ("SoupAuthManager")` to get its `alias@GLib.Type` in earlier releases.)
*/
struct SoupAuthManager;

/** */
struct SoupAuthManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    HTTP-based NTLM authentication.
    
    `class@Session`s do not support this type by default; if you want to
    enable support for it, call [soup.session.Session.addFeatureByType],
    passing `SOUP_TYPE_AUTH_NTLM`.
*/
struct SoupAuthNTLM;

/**
    HTTP-based GSS-Negotiate authentication, as defined by
    [RFC 4559](https://datatracker.ietf.org/doc/html/rfc4559).
    
    `class@Session`s do not support this type by default; if you want to
    enable support for it, call [soup.session.Session.addFeatureByType],
    passing `SOUP_TYPE_AUTH_NEGOTIATE`.
    
    This auth type will only work if libsoup was compiled with GSSAPI
    support; you can check [soup.auth_negotiate.AuthNegotiate.supported] to see if it
    was.
*/
struct SoupAuthNegotiate;

/**
    File-based cache for HTTP resources.
*/
struct SoupCache
{
  /** */
  GObject parentInstance;
}

/** */
struct SoupCacheClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) SoupCacheability function(SoupCache* cache, SoupMessage* msg) getCacheability;

  /** */
  void*[4] padding;
}

/**
    Handles decoding of HTTP messages.
    
    #SoupContentDecoder handles adding the "Accept-Encoding" header on
    outgoing messages, and processing the "Content-Encoding" header on
    incoming ones. Currently it supports the "gzip", "deflate", and "br"
    content codings.
    
    A #SoupContentDecoder will automatically be
    added to the session by default. (You can use
    [soup.session.Session.removeFeatureByType] if you don't
    want this.)
    
    If #SoupContentDecoder successfully decodes the Content-Encoding,
    the message body will contain the decoded data; however, the message headers
    will be unchanged (and so "Content-Encoding" will still be present,
    "Content-Length" will describe the original encoded length, etc).
    
    If "Content-Encoding" contains any encoding types that
    #SoupContentDecoder doesn't recognize, then none of the encodings
    will be decoded.
    
    (Note that currently there is no way to (automatically) use
    Content-Encoding when sending a request body, or to pick specific
    encoding types to support.)
*/
struct SoupContentDecoder;

/** */
struct SoupContentDecoderClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Sniffs the mime type of messages.
    
    A #SoupContentSniffer tries to detect the actual content type of
    the files that are being downloaded by looking at some of the data
    before the `class@Message` emits its `signal@Message::got-headers` signal.
    #SoupContentSniffer implements `iface@SessionFeature`, so you can add
    content sniffing to a session with [soup.session.Session.addFeature] or
    [soup.session.Session.addFeatureByType].
*/
struct SoupContentSniffer;

/** */
struct SoupContentSnifferClass
{
  /** */
  GObjectClass parentClass;
}

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
struct SoupCookie;

/**
    Automatic cookie handling for SoupSession.
    
    A #SoupCookieJar stores `struct@Cookie`s and arrange for them to be sent with
    the appropriate `class@Message`s. #SoupCookieJar implements
    `iface@SessionFeature`, so you can add a cookie jar to a session with
    [soup.session.Session.addFeature] or [soup.session.Session.addFeatureByType].
    
    Note that the base #SoupCookieJar class does not support any form
    of long-term cookie persistence.
*/
struct SoupCookieJar
{
  /** */
  GObject parentInstance;
}

/** */
struct SoupCookieJarClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(SoupCookieJar* jar) save;

  /** */
  extern(C) gboolean function(SoupCookieJar* jar) isPersistent;

  /** */
  extern(C) void function(SoupCookieJar* jar, SoupCookie* oldCookie, SoupCookie* newCookie) changed;

  /** */
  void*[6] padding;
}

/**
    Database-based Cookie Jar.
    
    #SoupCookieJarDB is a `class@CookieJar` that reads cookies from and writes
    them to a sqlite database in the new Mozilla format.
    
    (This is identical to `SoupCookieJarSqlite` in
    libsoup-gnome; it has just been moved into libsoup proper, and
    renamed to avoid conflicting.)
*/
struct SoupCookieJarDB;

/** */
struct SoupCookieJarDBClass
{
  /** */
  SoupCookieJarClass parentClass;
}

/**
    Text-file-based ("cookies.txt") Cookie Jar
    
    #SoupCookieJarText is a `class@CookieJar` that reads cookies from and writes
    them to a text file in format similar to Mozilla's "cookies.txt".
*/
struct SoupCookieJarText;

/** */
struct SoupCookieJarTextClass
{
  /** */
  SoupCookieJarClass parentClass;
}

/**
    Automatic HTTP Strict Transport Security enforcing for `class@Session`.
    
    A #SoupHSTSEnforcer stores HSTS policies and enforces them when
    required. #SoupHSTSEnforcer implements `iface@SessionFeature`, so you
    can add an HSTS enforcer to a session with
    [soup.session.Session.addFeature] or [soup.session.Session.addFeatureByType].
    
    #SoupHSTSEnforcer keeps track of all the HTTPS destinations that,
    when connected to, return the Strict-Transport-Security header with
    valid values. #SoupHSTSEnforcer will forget those destinations
    upon expiry or when the server requests it.
    
    When the `class@Session` the #SoupHSTSEnforcer is attached to queues or
    restarts a message, the #SoupHSTSEnforcer will rewrite the URI to HTTPS if
    the destination is a known HSTS host and is contacted over an insecure
    transport protocol (HTTP). Users of #SoupHSTSEnforcer are advised to listen
    to changes in the `property@Message:uri` property in order to be aware of
    changes in the message URI.
    
    Note that #SoupHSTSEnforcer does not support any form of long-term
    HSTS policy persistence. See `class@HSTSEnforcerDB` for a persistent
    enforcer.
*/
struct SoupHSTSEnforcer
{
  /** */
  GObject parentInstance;
}

/**
    Class structure for #SoupHSTSEnforcer.
*/
struct SoupHSTSEnforcerClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      The @is_persistent function advertises whether the enforcer is persistent or
      whether changes made to it will be lost when the underlying `class@Session` is finished.
  */
  extern(C) gboolean function(SoupHSTSEnforcer* hstsEnforcer) isPersistent;

  /**
      The @has_valid_policy function is called to check whether there is a valid
      policy for the given domain. This method should return true for #SoupHSTSEnforcer to
      change the scheme of the #GUri in the #SoupMessage to HTTPS. Implementations might want to
      chain up to the @has_valid_policy in the parent class to check, for instance, for runtime
      policies.
  */
  extern(C) gboolean function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain) hasValidPolicy;

  /**
      The class closure for the #SoupHSTSEnforcer::changed signal.
  */
  extern(C) void function(SoupHSTSEnforcer* enforcer, SoupHSTSPolicy* oldPolicy, SoupHSTSPolicy* newPolicy) changed;

  /** */
  void*[4] padding;
}

/**
    Persistent HTTP Strict Transport Security enforcer.
    
    #SoupHSTSEnforcerDB is a `class@HSTSEnforcer` that uses a SQLite
    database as a backend for persistency.
*/
struct SoupHSTSEnforcerDB;

/** */
struct SoupHSTSEnforcerDBClass
{
  /** */
  SoupHSTSEnforcerClass parentClass;
}

/**
    #SoupHSTSPolicy implements HTTP policies, as described by
    [RFC 6797](http://tools.ietf.org/html/rfc6797).
    
    @domain represents the host that this policy applies to. The domain
    must be IDNA-canonicalized. [soup.hstspolicy.HSTSPolicy.new_] and related methods
    will do this for you.
    
    @max_age contains the 'max-age' value from the Strict Transport
    Security header and indicates the time to live of this policy,
    in seconds.
    
    @expires will be non-null if the policy has been set by the host and
    hence has an expiry time. If @expires is null, it indicates that the
    policy is a permanent session policy set by the user agent.
    
    If @include_subdomains is true, the Strict Transport Security policy
    must also be enforced on subdomains of @domain.
*/
struct SoupHSTSPolicy;

/**
    Debug logging support
    
    #SoupLogger watches a `class@Session` and logs the HTTP traffic that
    it generates, for debugging purposes. Many applications use an
    environment variable to determine whether or not to use
    #SoupLogger, and to determine the amount of debugging output.
    
    To use #SoupLogger, first create a logger with [soup.logger.Logger.new_], optionally
    configure it with [soup.logger.Logger.setRequestFilter],
    [soup.logger.Logger.setResponseFilter], and [soup.logger.Logger.setPrinter], and
    then attach it to a session (or multiple sessions) with
    [soup.session.Session.addFeature].
    
    By default, the debugging output is sent to `stdout`, and looks something
    like:
    
    ```
    > POST /unauth HTTP/1.1
    > Soup-Debug-Timestamp: 1200171744
    > Soup-Debug: SoupSession 1 (0x612190), SoupMessage 1 (0x617000), GSocket 1 (0x612220)
    > Host: localhost
    > Content-Type: text/plain
    > Connection: close
    
    &lt; HTTP/1.1 201 Created
    &lt; Soup-Debug-Timestamp: 1200171744
    &lt; Soup-Debug: SoupMessage 1 (0x617000)
    &lt; Date: Sun, 12 Jan 2008 21:02:24 GMT
    &lt; Content-Length: 0
    ```
    
    The `Soup-Debug-Timestamp` line gives the time (as a `time_t`) when the
    request was sent, or the response fully received.
    
    The `Soup-Debug` line gives further debugging information about the
    `class@Session`, `class@Message`, and [gio.socket.Socket] involved; the hex
    numbers are the addresses of the objects in question (which may be useful if
    you are running in a debugger). The decimal IDs are simply counters that
    uniquely identify objects across the lifetime of the #SoupLogger. In
    particular, this can be used to identify when multiple messages are sent
    across the same connection.
    
    Currently, the request half of the message is logged just before
    the first byte of the request gets written to the network (from the
    `signal@Message::starting` signal).
    
    The response is logged just after the last byte of the response body is read
    from the network (from the `signal@Message::got-body` or
    `signal@Message::got-informational` signal), which means that the
    `signal@Message::got-headers` signal, and anything triggered off it (such as
    #SoupMessage::authenticate) will be emitted *before* the response headers are
    actually logged.
    
    If the response doesn't happen to trigger the `signal@Message::got-body` nor
    `signal@Message::got-informational` signals due to, for example, a
    cancellation before receiving the last byte of the response body, the
    response will still be logged on the event of the `signal@Message::finished`
    signal.
*/
struct SoupLogger;

/** */
struct SoupLoggerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents an HTTP message being sent or received.
    
    A #SoupMessage represents an HTTP message that is being sent or
    received.
    
    You would create a #SoupMessage with [soup.message.Message.new_] or
    [soup.message.Message.newFromUri], set up its fields appropriately, and send it.
    
    `property@Message:status-code` will normally be a `enum@Status` value, eg,
    [soup.types.Status.Ok], though of course it might actually be an unknown status
    code. `property@Message:reason-phrase` is the actual text returned from the
    server, which may or may not correspond to the "standard" description of
    @status_code. At any rate, it is almost certainly not localized, and not very
    descriptive even if it is in the user's language; you should not use
    `property@Message:reason-phrase` in user-visible messages. Rather, you should
    look at `property@Message:status-code`, and determine an end-user-appropriate
    message based on that and on what you were trying to do.
    
    Note that libsoup's terminology here does not quite match the HTTP
    specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
    Response. In libsoup, a #SoupMessage combines both the request and the
    response.
*/
struct SoupMessage;

/**
    #SoupMessageBody represents the request or response body of a
    `class@Message`.
    
    Note that while @length always reflects the full length of the
    message body, @data is normally null, and will only be filled in
    after [soup.message_body.MessageBody.flatten] is called. For client-side
    messages, this automatically happens for the response body after it
    has been fully read. Likewise, for server-side
    messages, the request body is automatically filled in after being
    read.
    
    As an added bonus, when @data is filled in, it is always terminated
    with a `\0` byte (which is not reflected in @length).
*/
struct SoupMessageBody
{
  /**
      the data
  */
  const(ubyte)* data;

  /**
      length of @data
  */
  long length;
}

/** */
struct SoupMessageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    The HTTP message headers associated with a request or response.
*/
struct SoupMessageHeaders;

/**
    An opaque type used to iterate over a [soup.message_headers.MessageHeaders]
    structure.
    
    After intializing the iterator with [soup.message_headers_iter.MessageHeadersIter.init_], call
    [soup.message_headers_iter.MessageHeadersIter.next] to fetch data from it.
    
    You may not modify the headers while iterating over them.
*/
struct SoupMessageHeadersIter
{
  /** */
  void*[3] dummy;
}

/**
    Contains metrics collected while loading a `class@Message` either from the
    network or the disk cache.
    
    Metrics are not collected by default for a `class@Message`, you need to add the
    flag [soup.types.MessageFlags.CollectMetrics] to enable the feature.
    
    Temporal metrics are expressed as a monotonic time and always start with a
    fetch start event and finish with response end. All other events are optional.
    An event can be 0 because it hasn't happened yet, because it's optional or
    because the load failed before the event reached.
    
    Size metrics are expressed in bytes and are updated while the `class@Message` is
    being loaded. You can connect to different `class@Message` signals to get the
    final result of every value.
*/
struct SoupMessageMetrics;

/**
    Represents a multipart HTTP message body, parsed according to the
    syntax of RFC 2046.
    
    Of particular interest to HTTP are `multipart/byte-ranges` and
    `multipart/form-data`,
    
    Although the headers of a #SoupMultipart body part will contain the
    full headers from that body part, libsoup does not interpret them
    according to MIME rules. For example, each body part is assumed to
    have "binary" Content-Transfer-Encoding, even if its headers
    explicitly state otherwise. In other words, don't try to use
    #SoupMultipart for handling real MIME multiparts.
*/
struct SoupMultipart;

/**
    Handles streams of multipart messages.
    
    This adds support for the multipart responses. For handling the
    multiple parts the user needs to wrap the [gio.input_stream.InputStream] obtained by
    sending the request with a `class@MultipartInputStream` and use
    [soup.multipart_input_stream.MultipartInputStream.nextPart] before reading. Responses
    which are not wrapped will be treated like non-multipart responses.
    
    Note that although #SoupMultipartInputStream is a [gio.input_stream.InputStream],
    you should not read directly from it, and the results are undefined
    if you do.
*/
struct SoupMultipartInputStream;

/** */
struct SoupMultipartInputStreamClass
{
  /** */
  GFilterInputStreamClass parentClass;
}

/**
    Represents a byte range as used in the Range header.
    
    If @end is non-negative, then @start and @end represent the bounds
    of of the range, counting from 0. (Eg, the first 500 bytes would be
    represented as @start = 0 and @end = 499.)
    
    If @end is -1 and @start is non-negative, then this represents a
    range starting at @start and ending with the last byte of the
    requested resource body. (Eg, all but the first 500 bytes would be
    @start = 500, and @end = -1.)
    
    If @end is -1 and @start is negative, then it represents a "suffix
    range", referring to the last -@start bytes of the resource body.
    (Eg, the last 500 bytes would be @start = -500 and @end = -1.)
*/
struct SoupRange
{
  /**
      the start of the range
  */
  long start;

  /**
      the end of the range
  */
  long end;
}

/**
    A HTTP server.
    
    #SoupServer implements a simple HTTP server.
    
    To begin, create a server using [soup.server.Server.new_]. Add at least one
    handler by calling [soup.server.Server.addHandler] or
    [soup.server.Server.addEarlyHandler]; the handler will be called to
    process any requests underneath the path you pass. (If you want all
    requests to go to the same handler, just pass "/" (or null) for
    the path.)
    
    When a new connection is accepted (or a new request is started on
    an existing persistent connection), the #SoupServer will emit
    `signal@Server::request-started` and then begin processing the request
    as described below, but note that once the message is assigned a
    status-code, then callbacks after that point will be
    skipped. Note also that it is not defined when the callbacks happen
    relative to various `class@ServerMessage` signals.
    
    Once the headers have been read, #SoupServer will check if there is
    a `class@AuthDomain` `(qv)` covering the Request-URI; if so, and if the
    message does not contain suitable authorization, then the
    `class@AuthDomain` will set a status of [soup.types.Status.Unauthorized] on
    the message.
    
    After checking for authorization, #SoupServer will look for "early"
    handlers (added with [soup.server.Server.addEarlyHandler]) matching the
    Request-URI. If one is found, it will be run; in particular, this
    can be used to connect to signals to do a streaming read of the
    request body.
    
    (At this point, if the request headers contain `Expect:
    100-continue`, and a status code has been set, then
    #SoupServer will skip the remaining steps and return the response.
    If the request headers contain `Expect:
    100-continue` and no status code has been set,
    #SoupServer will return a [soup.types.Status.Continue] status before
    continuing.)
    
    The server will then read in the response body (if present). At
    this point, if there are no handlers at all defined for the
    Request-URI, then the server will return [soup.types.Status.NotFound] to
    the client.
    
    Otherwise (assuming no previous step assigned a status to the
    message) any "normal" handlers (added with
    [soup.server.Server.addHandler]) for the message's Request-URI will be
    run.
    
    Then, if the path has a WebSocket handler registered (and has
    not yet been assigned a status), #SoupServer will attempt to
    validate the WebSocket handshake, filling in the response and
    setting a status of [soup.types.Status.SwitchingProtocols] or
    [soup.types.Status.BadRequest] accordingly.
    
    If the message still has no status code at this point (and has not
    been paused with [soup.server_message.ServerMessage.pause]), then it will be
    given a status of [soup.types.Status.InternalServerError] (because at
    least one handler ran, but returned without assigning a status).
    
    Finally, the server will emit `signal@Server::request-finished` (or
    `signal@Server::request-aborted` if an I/O error occurred before
    handling was completed).
    
    If you want to handle the special "*" URI (eg, "OPTIONS *"), you
    must explicitly register a handler for "*"; the default handler
    will not be used for that case.
    
    If you want to process https connections in addition to (or instead
    of) http connections, you can set the `property@Server:tls-certificate`
    property.
    
    Once the server is set up, make one or more calls to
    [soup.server.Server.listen], [soup.server.Server.listenLocal], or
    [soup.server.Server.listenAll] to tell it where to listen for
    connections. (All ports on a #SoupServer use the same handlers; if
    you need to handle some ports differently, such as returning
    different data for http and https, you'll need to create multiple
    [soup.server.Server]s, or else check the passed-in URI in the handler
    function.).
    
    #SoupServer will begin processing connections as soon as you return
    to (or start) the main loop for the current thread-default
    [glib.main_context.MainContext].
*/
struct SoupServer
{
  /** */
  GObject parentInstance;
}

/** */
struct SoupServerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestStarted;

  /** */
  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestRead;

  /** */
  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestFinished;

  /** */
  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestAborted;

  /** */
  void*[6] padding;
}

/**
    An HTTP server request and response pair.
    
    A SoupServerMessage represents an HTTP message that is being sent or
    received on a `class@Server`.
    
    `class@Server` will create [soup.server_message.ServerMessage]s automatically for
    incoming requests, which your application will receive via handlers.
    
    Note that libsoup's terminology here does not quite match the HTTP
    specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
    Response. In libsoup, a #SoupServerMessage combines both the request and the
    response.
*/
struct SoupServerMessage;

/** */
struct SoupServerMessageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Soup session state object.
    
    #SoupSession is the object that controls client-side HTTP. A
    #SoupSession encapsulates all of the state that libsoup is keeping
    on behalf of your program; cached HTTP connections, authentication
    information, etc. It also keeps track of various global options
    and features that you are using.
    
    Most applications will only need a single #SoupSession; the primary
    reason you might need multiple sessions is if you need to have
    multiple independent authentication contexts. (Eg, you are
    connecting to a server and authenticating as two different users at
    different times; the easiest way to ensure that each `class@Message`
    is sent with the authentication information you intended is to use
    one session for the first user, and a second session for the other
    user.)
    
    Additional #SoupSession functionality is provided by
    `iface@SessionFeature` objects, which can be added to a session with
    [soup.session.Session.addFeature] or [soup.session.Session.addFeatureByType]
    For example, `class@Logger` provides support for
    logging HTTP traffic, `class@ContentDecoder` provides support for
    compressed response handling, and `class@ContentSniffer` provides
    support for HTML5-style response body content sniffing.
    Additionally, subtypes of `class@Auth` can be added
    as features, to add support for additional authentication types.
    
    All [soup.session.Session]s are created with a `class@AuthManager`, and support
    for `SOUP_TYPE_AUTH_BASIC` and `SOUP_TYPE_AUTH_DIGEST`. Additionally,
    sessions using the plain #SoupSession class (rather than one of its deprecated
    subtypes) have a `class@ContentDecoder` by default.
    
    Note that all async methods will invoke their callbacks on the thread-default
    context at the time of the function call.
*/
struct SoupSession
{
  /** */
  GObject parentInstance;
}

/** */
struct SoupSessionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(SoupSession* session, SoupMessage* msg) requestQueued;

  /** */
  extern(C) void function(SoupSession* session, SoupMessage* msg) requestUnqueued;

  /** */
  extern(C) void function() SoupReserved1;

  /** */
  extern(C) void function() SoupReserved2;

  /** */
  extern(C) void function() SoupReserved3;

  /** */
  extern(C) void function() SoupReserved4;

  /** */
  extern(C) void function() SoupReserved5;

  /** */
  extern(C) void function() SoupReserved6;

  /** */
  extern(C) void function() SoupReserved7;

  /** */
  extern(C) void function() SoupReserved8;
}

/**
    Interface for miscellaneous `class@Session` features.
    
    #SoupSessionFeature is the interface used by classes that extend
    the functionality of a `class@Session`. Some features like HTTP
    authentication handling are implemented internally via
    [soup.session_feature.SessionFeature]s. Other features can be added to the session
    by the application. (Eg, `class@Logger`, `class@CookieJar`.)
    
    See [soup.session.Session.addFeature], etc, to add a feature to a session.
*/
struct SoupSessionFeature;

/**
    The interface implemented by `iface@SessionFeature`s.
*/
struct SoupSessionFeatureInterface;

/**
    The WebSocket Protocol
    
    Provides support for the [WebSocket](http://tools.ietf.org/html/rfc6455)
    protocol.
    
    To connect to a WebSocket server, create a `class@Session` and call
    [soup.session.Session.websocketConnectAsync]. To accept WebSocket
    connections, create a `class@Server` and add a handler to it with
    [soup.server.Server.addWebsocketHandler].
    
    (Lower-level support is available via
    `func@websocket_client_prepare_handshake` and
    `func@websocket_client_verify_handshake`, for handling the client side of the
    WebSocket handshake, and `func@websocket_server_process_handshake` for
    handling the server side.)
    
    #SoupWebsocketConnection handles the details of WebSocket communication. You
    can use [soup.websocket_connection.WebsocketConnection.sendText] and
    [soup.websocket_connection.WebsocketConnection.sendBinary] to send data, and the
    `signal@WebsocketConnection::message` signal to receive data.
    (#SoupWebsocketConnection currently only supports asynchronous I/O.)
*/
struct SoupWebsocketConnection;

/**
    The abstract base class for `class@WebsocketConnection`.
*/
struct SoupWebsocketConnectionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A WebSocket extension
    
    #SoupWebsocketExtension is the base class for WebSocket extension objects.
*/
struct SoupWebsocketExtension
{
  /** */
  GObject parentInstance;
}

/**
    The class structure for the #SoupWebsocketExtension.
*/
struct SoupWebsocketExtensionClass
{
  /**
      the parent class
  */
  GObjectClass parentClass;

  /**
      the name of the extension
  */
  const(char)* name;

  /**
      called to configure the extension with the given parameters
  */
  extern(C) gboolean function(SoupWebsocketExtension* extension, SoupWebsocketConnectionType connectionType, GHashTable* params, GError** _err) configure;

  /**
      called by the client to build the request header.
         It should include the parameters string starting with ';'
  */
  extern(C) char* function(SoupWebsocketExtension* extension) getRequestParams;

  /**
      called by the server to build the response header.
         It should include the parameters string starting with ';'
  */
  extern(C) char* function(SoupWebsocketExtension* extension) getResponseParams;

  /**
      called to process the payload data of a message
         before it's sent. Reserved bits of the header should be changed.
  */
  extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) processOutgoingMessage;

  /**
      called to process the payload data of a message
         after it's received. Reserved bits of the header should be cleared.
  */
  extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) processIncomingMessage;

  /** */
  void*[6] padding;
}

/**
    A SoupWebsocketExtensionDeflate is a `class@WebsocketExtension`
    implementing permessage-deflate (RFC 7692).
    
    This extension is used by default in a `class@Session` when `class@WebsocketExtensionManager`
    feature is present, and always used by `class@Server`.
*/
struct SoupWebsocketExtensionDeflate;

/** */
struct SoupWebsocketExtensionDeflateClass
{
  /** */
  SoupWebsocketExtensionClass parentClass;
}

/**
    SoupWebsocketExtensionManager is the `iface@SessionFeature` that handles WebSockets
    extensions for a `class@Session`.
    
    A #SoupWebsocketExtensionManager is added to the session by default, and normally
    you don't need to worry about it at all. However, if you want to
    disable WebSocket extensions, you can remove the feature from the
    session with [soup.session.Session.removeFeatureByType] or disable it on
    individual requests with [soup.message.Message.disableFeature].
*/
struct SoupWebsocketExtensionManager;

/** */
struct SoupWebsocketExtensionManagerClass
{
  /** */
  GObjectClass parentClass;
}

alias extern(C) gboolean function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData) SoupAuthDomainBasicAuthCallback;

alias extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) SoupAuthDomainDigestAuthCallback;

alias extern(C) gboolean function(SoupAuthDomain* domain, SoupServerMessage* msg, void* userData) SoupAuthDomainFilter;

alias extern(C) gboolean function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) SoupAuthDomainGenericAuthCallback;

alias extern(C) SoupLoggerLogLevel function(SoupLogger* logger, SoupMessage* msg, void* userData) SoupLoggerFilter;

alias extern(C) void function(SoupLogger* logger, SoupLoggerLogLevel level, char direction, const(char)* data, void* userData) SoupLoggerPrinter;

alias extern(C) void function(const(char)* name, const(char)* value, void* userData) SoupMessageHeadersForeachFunc;

alias extern(C) void function(SoupServer* server, SoupServerMessage* msg, const(char)* path, GHashTable* query, void* userData) SoupServerCallback;

alias extern(C) void function(SoupServer* server, SoupServerMessage* msg, const(char)* path, SoupWebsocketConnection* connection, void* userData) SoupServerWebsocketCallback;

