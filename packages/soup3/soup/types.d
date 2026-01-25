/// D types for soup3 library
module soup.types;

import gid.gid;
import soup.auth_domain;
import soup.auth_domain_basic;
import soup.auth_domain_digest;
import soup.c.functions;
import soup.c.types;
import soup.logger;
import soup.message;
import soup.server;
import soup.server_message;
import soup.websocket_connection;


// Enums

/** */
alias CacheType = SoupCacheType;

/** */
alias Cacheability = SoupCacheability;

/** */
alias CookieJarAcceptPolicy = SoupCookieJarAcceptPolicy;

/** */
alias DateFormat = SoupDateFormat;

/** */
alias Encoding = SoupEncoding;

/** */
alias Expectation = SoupExpectation;

/** */
alias HTTPVersion = SoupHTTPVersion;

/** */
alias LoggerLogLevel = SoupLoggerLogLevel;

/** */
alias MemoryUse = SoupMemoryUse;

/** */
alias MessageFlags = SoupMessageFlags;

/** */
alias MessageHeadersType = SoupMessageHeadersType;

/** */
alias MessagePriority = SoupMessagePriority;

/** */
alias SameSitePolicy = SoupSameSitePolicy;

/** */
alias ServerListenOptions = SoupServerListenOptions;

/** */
alias SessionError = SoupSessionError;

/** */
alias Status = SoupStatus;

/** */
alias TLDError = SoupTLDError;

/** */
alias URIComponent = SoupURIComponent;

/** */
alias WebsocketCloseCode = SoupWebsocketCloseCode;

/** */
alias WebsocketConnectionType = SoupWebsocketConnectionType;

/** */
alias WebsocketDataType = SoupWebsocketDataType;

/** */
alias WebsocketError = SoupWebsocketError;

/** */
alias WebsocketState = SoupWebsocketState;

// Structs

/** */
alias Range = SoupRange;

// Callbacks

/**
    Callback used by #SoupAuthDomainBasic for authentication purposes.
    
    The application should verify that username and password and valid
    and return true or false.
    
    If you are maintaining your own password database (rather than
    using the password to authenticate against some other system like
    PAM or a remote server), you should make sure you know what you are
    doing. In particular, don't store cleartext passwords, or
    easily-computed hashes of cleartext passwords, even if you don't
    care that much about the security of your server, because users
    will frequently use the same password for multiple sites, and so
    compromising any site with a cleartext (or easily-cracked) password
    database may give attackers access to other more-interesting sites
    as well.

    Params:
      domain = the domain
      msg = the message being authenticated
      username = the username provided by the client
      password = the password provided by the client
    Returns: true if username and password are valid
*/
alias AuthDomainBasicAuthCallback = bool delegate(soup.auth_domain_basic.AuthDomainBasic domain, soup.server_message.ServerMessage msg, string username, string password);

/**
    Callback used by #SoupAuthDomainDigest for authentication purposes.
    
    The application should look up username in its password database,
    and return the corresponding encoded password (see
    [soup.auth_domain_digest.AuthDomainDigest.encodePassword].

    Params:
      domain = the domain
      msg = the message being authenticated
      username = the username provided by the client
    Returns: the encoded password, or null if
        username is not a valid user. domain will free the password when
        it is done with it.
*/
alias AuthDomainDigestAuthCallback = string delegate(soup.auth_domain_digest.AuthDomainDigest domain, soup.server_message.ServerMessage msg, string username);

/**
    The prototype for a #SoupAuthDomain filter.
    
    See [soup.auth_domain.AuthDomain.setFilter] for details.

    Params:
      domain = a #SoupAuthDomain
      msg = a #SoupServerMessage
    Returns: true if msg requires authentication, false if not.
*/
alias AuthDomainFilter = bool delegate(soup.auth_domain.AuthDomain domain, soup.server_message.ServerMessage msg);

/**
    The prototype for a #SoupAuthDomain generic authentication callback.
    
    The callback should look up the user's password, call
    [soup.auth_domain.AuthDomain.checkPassword], and use the return value from that method
    as its own return value.
    
    In general, for security reasons, it is preferable to use the
    auth-domain-specific auth callbacks (eg,
    `callbackAuthDomainBasicAuthCallback` and
    `callbackAuthDomainDigestAuthCallback`), because they don't require
    keeping a cleartext password database. Most users will use the same
    password for many different sites, meaning if any site with a
    cleartext password database is compromised, accounts on other
    servers might be compromised as well. For many of the cases where
    `classServer` is used, this is not really relevant, but it may still
    be worth considering.

    Params:
      domain = a #SoupAuthDomain
      msg = the #SoupServerMessage being authenticated
      username = the username from msg
    Returns: true if msg is authenticated, false if not.
*/
alias AuthDomainGenericAuthCallback = bool delegate(soup.auth_domain.AuthDomain domain, soup.server_message.ServerMessage msg, string username);

/**
    The prototype for a logging filter.
    
    The filter callback will be invoked for each request or response, and should
    analyze it and return a `enumLoggerLogLevel` value indicating how much of
    the message to log.

    Params:
      logger = the #SoupLogger
      msg = the message being logged
    Returns: a `enumLoggerLogLevel` value indicating how much of the message to
        log
*/
alias LoggerFilter = soup.types.LoggerLogLevel delegate(soup.logger.Logger logger, soup.message.Message msg);

/**
    The prototype for a custom printing callback.
    
    level indicates what kind of information is being printed. Eg, it
    will be [soup.types.LoggerLogLevel.Headers] if data is header data.
    
    direction is either '<', '>', or ' ', and data is the single line
    to print; the printer is expected to add a terminating newline.
    
    To get the effect of the default printer, you would do:
    
    ```c
    printf ("%c %s\n", direction, data);
    ```

    Params:
      logger = the #SoupLogger
      level = the level of the information being printed.
      direction = a single-character prefix to data
      data = data to print
*/
alias LoggerPrinter = void delegate(soup.logger.Logger logger, soup.types.LoggerLogLevel level, char direction, string data);

/**
    The callback passed to [soup.message_headers.MessageHeaders.foreach_].

    Params:
      name = the header name
      value = the header value
*/
alias MessageHeadersForeachFunc = void delegate(string name, string value);

/**
    A callback used to handle requests to a `classServer`.
    
    path and query contain the likewise-named components of the
    Request-URI, subject to certain assumptions. By default,
    `classServer` decodes all percent-encoding in the URI path, such that
    `"/foo`2Fbar`"` is treated the same as `"/foo/bar"`. If your
    server is serving resources in some non-POSIX-filesystem namespace,
    you may want to distinguish those as two distinct paths. In that
    case, you can set the `propertyServer:raw-paths` property when creating
    the `classServer`, and it will leave those characters undecoded.
    
    query contains the query component of the Request-URI parsed according to
    the rules for HTML form handling. Although this is the only commonly-used
    query string format in HTTP, there is nothing that actually requires that
    HTTP URIs use that format; if your server needs to use some other format, you
    can just ignore query, and call [soup.message.Message.getUri] and parse the URI's
    query field yourself.
    
    See [soup.server.Server.addHandler] and [soup.server.Server.addEarlyHandler]
    for details of what handlers can/should do.

    Params:
      server = the #SoupServer
      msg = the message being processed
      path = the path component of msg's Request-URI
      query = the parsed query
          component of msg's Request-URI
*/
alias ServerCallback = void delegate(soup.server.Server server, soup.server_message.ServerMessage msg, string path, string[string] query);

/**
    A callback used to handle WebSocket requests to a #SoupServer.
    
    The callback will be invoked after sending the handshake response back to the
    client (and is only invoked if the handshake was successful).
    
    path contains the path of the Request-URI, subject to the same
    rules as `callbackServerCallback` `(qv)`.

    Params:
      server = the #SoupServer
      msg = the #SoupServerMessage
      path = the path component of msg's Request-URI
      connection = the newly created WebSocket connection
*/
alias ServerWebsocketCallback = void delegate(soup.server.Server server, soup.server_message.ServerMessage msg, string path, soup.websocket_connection.WebsocketConnection connection);

/**
    A constant corresponding to 1 day.
    
    For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_DAY = 0;

/**
    A constant corresponding to 1 hour.
    
    For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_HOUR = 3600;

/**
    A constant corresponding to 1 week.
    
    For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_WEEK = 0;

/**
    A constant corresponding to 1 year.
    
    For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_YEAR = 0;

/**
    A macro containing the value
    `multipart/form-data`; the MIME type used for
    posting form data that contains files to be uploaded.
*/
enum FORM_MIME_TYPE_MULTIPART = "multipart/form-data";

/**
    A macro containing the value
    `application/x-www-form-urlencoded`; the default
    MIME type for POSTing HTML form data.
*/
enum FORM_MIME_TYPE_URLENCODED = "application/x-www-form-urlencoded";

/**
    An expiration date that is always in the past.
*/
enum HSTS_POLICY_MAX_AGE_PAST = 0;

/**
    The set of #GUriFlags libsoup expects all #GUri to use.
*/
enum HTTP_URI_FLAGS = 482;

/**
    Like `func@get_major_version`, but from the headers used at application
    compile time, rather than from the library linked against at application run
    time.
*/
enum MAJOR_VERSION = 3;

/**
    Like `func@get_micro_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 5;

/**
    Like `func@get_minor_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 4;

/**
    A macro that should be defined by the user prior to including
    `libsoup.h`.
    
    The definition should be one of the predefined libsoup
    version macros: `SOUP_VERSION_2_24`, `SOUP_VERSION_2_26`, ...
    
    This macro defines the earliest version of libsoup that the package
    is required to be able to compile against.
    
    If the compiler is configured to warn about the use of deprecated
    functions, then using functions that were deprecated in version
    [soup.types.VERSION_MIN_REQUIRED] or earlier will cause warnings (but
    using functions deprecated in later releases will not).
*/
enum VERSION_MIN_REQUIRED = 2;
