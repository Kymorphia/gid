/// Module for [Message] class
module gid.soup3.message;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.input_stream;
import gid.gio2.iostream;
import gid.gio2.socket_address;
import gid.gio2.tls_certificate;
import gid.gio2.tls_client_connection;
import gid.gio2.tls_password;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.uri;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.soup3.auth;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message_headers;
import gid.soup3.message_metrics;
import gid.soup3.multipart;
import gid.soup3.types;

/**
    Represents an HTTP message being sent or received.
    
    A [gid.soup3.message.Message] represents an HTTP message that is being sent or
    received.
    
    You would create a [gid.soup3.message.Message] with [gid.soup3.message.Message.new_] or
    [gid.soup3.message.Message.newFromUri], set up its fields appropriately, and send it.
    
    [gid.soup3.message.Message.statusCode] will normally be a [gid.soup3.types.Status] value, eg,
    [gid.soup3.types.Status.Ok], though of course it might actually be an unknown status
    code. [gid.soup3.message.Message.reasonPhrase] is the actual text returned from the
    server, which may or may not correspond to the "standard" description of
    @status_code. At any rate, it is almost certainly not localized, and not very
    descriptive even if it is in the user's language; you should not use
    [gid.soup3.message.Message.reasonPhrase] in user-visible messages. Rather, you should
    look at [gid.soup3.message.Message.statusCode], and determine an end-user-appropriate
    message based on that and on what you were trying to do.
    
    Note that libsoup's terminology here does not quite match the HTTP
    specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
    Response. In libsoup, a [gid.soup3.message.Message] combines both the request and the
    response.
*/
class Message : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_message_get_type != &gidSymbolNotFound ? soup_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override Message self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.message.Message]
      Returns: New builder object
  */
  static MessageGidBuilder builder() nothrow
  {
    return new MessageGidBuilder;
  }

  /**
      Get `firstParty` property.
      Returns: The [gid.glib2.uri.Uri] loaded in the application when the message was
        queued.
  */
  @property gid.glib2.uri.Uri firstParty() nothrow
  {
    return getFirstParty();
  }

  /**
      Set `firstParty` property.
      Params:
        propval = The [gid.glib2.uri.Uri] loaded in the application when the message was
          queued.
  */
  @property void firstParty(gid.glib2.uri.Uri propval) nothrow
  {
    setFirstParty(propval);
  }

  /**
      Get `flags` property.
      Returns: Various message options.
  */
  @property gid.soup3.types.MessageFlags flags() nothrow
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = Various message options.
  */
  @property void flags(gid.soup3.types.MessageFlags propval) nothrow
  {
    setFlags(propval);
  }

  /**
      Get `httpVersion` property.
      Returns: The HTTP protocol version to use.
  */
  @property gid.soup3.types.HTTPVersion httpVersion() nothrow
  {
    return getHttpVersion();
  }

  /**
      Get `isOptionsPing` property.
      Returns: Whether the message is an OPTIONS ping.
        
        The [gid.soup3.message.Message] is intended to be used to send
        `OPTIONS *` to a server. When set to true, the
        path of [gid.soup3.message.Message.uri] will be ignored and
        [gid.soup3.message.Message.method] set to `SOUP_METHOD_OPTIONS`.
  */
  @property bool isOptionsPing() nothrow
  {
    return getIsOptionsPing();
  }

  /**
      Set `isOptionsPing` property.
      Params:
        propval = Whether the message is an OPTIONS ping.
          
          The [gid.soup3.message.Message] is intended to be used to send
          `OPTIONS *` to a server. When set to true, the
          path of [gid.soup3.message.Message.uri] will be ignored and
          [gid.soup3.message.Message.method] set to `SOUP_METHOD_OPTIONS`.
  */
  @property void isOptionsPing(bool propval) nothrow
  {
    setIsOptionsPing(propval);
  }

  /**
      Get `isTopLevelNavigation` property.
      Returns: Set when the message is navigating between top level domains.
  */
  @property bool isTopLevelNavigation() nothrow
  {
    return getIsTopLevelNavigation();
  }

  /**
      Set `isTopLevelNavigation` property.
      Params:
        propval = Set when the message is navigating between top level domains.
  */
  @property void isTopLevelNavigation(bool propval) nothrow
  {
    setIsTopLevelNavigation(propval);
  }

  /**
      Get `method` property.
      Returns: The message's HTTP method.
  */
  @property string method() nothrow
  {
    return getMethod();
  }

  /**
      Set `method` property.
      Params:
        propval = The message's HTTP method.
  */
  @property void method(string propval) nothrow
  {
    setMethod(propval);
  }

  /**
      Get `priority` property.
      Returns: Sets the priority of the [gid.soup3.message.Message]. See
        [gid.soup3.message.Message.setPriority] for further details.
  */
  @property gid.soup3.types.MessagePriority priority() nothrow
  {
    return getPriority();
  }

  /**
      Set `priority` property.
      Params:
        propval = Sets the priority of the [gid.soup3.message.Message]. See
          [gid.soup3.message.Message.setPriority] for further details.
  */
  @property void priority(gid.soup3.types.MessagePriority propval) nothrow
  {
    setPriority(propval);
  }

  /**
      Get `reasonPhrase` property.
      Returns: The HTTP response reason phrase.
  */
  @property string reasonPhrase() nothrow
  {
    return getReasonPhrase();
  }

  /**
      Get `remoteAddress` property.
      Returns: The remote [gid.gio2.socket_address.SocketAddress] of the connection associated
        with the message.
  */
  @property gid.gio2.socket_address.SocketAddress remoteAddress() nothrow
  {
    return getRemoteAddress();
  }

  /**
      Get `requestHeaders` property.
      Returns: The HTTP request headers.
  */
  @property gid.soup3.message_headers.MessageHeaders requestHeaders() nothrow
  {
    return getRequestHeaders();
  }

  /**
      Get `responseHeaders` property.
      Returns: The HTTP response headers.
  */
  @property gid.soup3.message_headers.MessageHeaders responseHeaders() nothrow
  {
    return getResponseHeaders();
  }

  /**
      Get `siteForCookies` property.
      Returns: Site used to compare cookies against. Used for SameSite cookie support.
  */
  @property gid.glib2.uri.Uri siteForCookies() nothrow
  {
    return getSiteForCookies();
  }

  /**
      Set `siteForCookies` property.
      Params:
        propval = Site used to compare cookies against. Used for SameSite cookie support.
  */
  @property void siteForCookies(gid.glib2.uri.Uri propval) nothrow
  {
    setSiteForCookies(propval);
  }

  /**
      Get `statusCode` property.
      Returns: The HTTP response status code.
  */
  @property uint statusCode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("status-code");
  }

  /**
      Get `tlsCiphersuiteName` property.
      Returns: The Name of TLS ciphersuite negotiated for this message connection.
  */
  @property string tlsCiphersuiteName() nothrow
  {
    return getTlsCiphersuiteName();
  }

  /**
      Get `tlsPeerCertificate` property.
      Returns: The peer's [gid.gio2.tls_certificate.TlsCertificate] associated with the message.
  */
  @property gid.gio2.tls_certificate.TlsCertificate tlsPeerCertificate() nothrow
  {
    return getTlsPeerCertificate();
  }

  /**
      Get `tlsPeerCertificateErrors` property.
      Returns: The verification errors on [gid.soup3.message.Message.tlsPeerCertificate].
  */
  @property gid.gio2.types.TlsCertificateFlags tlsPeerCertificateErrors() nothrow
  {
    return getTlsPeerCertificateErrors();
  }

  /**
      Get `tlsProtocolVersion` property.
      Returns: The TLS protocol version negotiated for the message connection.
  */
  @property gid.gio2.types.TlsProtocolVersion tlsProtocolVersion() nothrow
  {
    return getTlsProtocolVersion();
  }

  /**
      Get `uri` property.
      Returns: The message's Request-URI.
  */
  @property gid.glib2.uri.Uri uri() nothrow
  {
    return getUri();
  }

  /**
      Set `uri` property.
      Params:
        propval = The message's Request-URI.
  */
  @property void uri(gid.glib2.uri.Uri propval) nothrow
  {
    setUri(propval);
  }

  /**
      Creates a new empty [gid.soup3.message.Message], which will connect to uri.
  
      Params:
        method = the HTTP method for the created request
        uriString = the destination endpoint (as a string)
      Returns: the new #SoupMessage (or null if uri
          could not be parsed).
  */
  this(string method, string uriString) nothrow
  {
    SoupMessage* _cretval;
    const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
    const(char)* _uriString = uriString.toCString!(No.Malloc, No.Nullable);
    _cretval = soup_message_new(_method, _uriString);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gid.soup3.message.Message] and sets it up to send the given encoded_form
      to uri via method. If method is "GET", it will include the form data
      into uri's query field, and if method is "POST" or "PUT", it will be set as
      request body.
      
      This function takes the ownership of encoded_form, that will be released
      with `funcGLib.free` when no longer in use. See also `funcform_encode`,
      `funcform_encode_hash` and `funcform_encode_datalist`.
  
      Params:
        method = the HTTP method for the created request (GET, POST or PUT)
        uriString = the destination endpoint (as a string)
        encodedForm = a encoded form
      Returns: the new #SoupMessage, or null if
          uri_string could not be parsed or method is not "GET, "POST" or "PUT"
  */
  static gid.soup3.message.Message newFromEncodedForm(string method, string uriString, string encodedForm) nothrow
  {
    SoupMessage* _cretval;
    const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
    const(char)* _uriString = uriString.toCString!(No.Malloc, No.Nullable);
    char* _encodedForm = encodedForm.toCString!(Yes.Malloc, No.Nullable);
    _cretval = soup_message_new_from_encoded_form(_method, _uriString, _encodedForm);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gid.soup3.message.Message] and sets it up to send multipart to
      uri_string via POST.
  
      Params:
        uriString = the destination endpoint
        multipart = a #SoupMultipart
      Returns: the new #SoupMessage, or null if uri_string
          could not be parsed
  */
  static gid.soup3.message.Message newFromMultipart(string uriString, gid.soup3.multipart.Multipart multipart) nothrow
  {
    SoupMessage* _cretval;
    const(char)* _uriString = uriString.toCString!(No.Malloc, No.Nullable);
    _cretval = soup_message_new_from_multipart(_uriString, multipart ? cast(SoupMultipart*)multipart._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new empty [gid.soup3.message.Message], which will connect to uri.
  
      Params:
        method = the HTTP method for the created request
        uri = the destination endpoint
      Returns: the new #SoupMessage
  */
  static gid.soup3.message.Message newFromUri(string method, gid.glib2.uri.Uri uri) nothrow
  {
    SoupMessage* _cretval;
    const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
    _cretval = soup_message_new_from_uri(_method, uri ? cast(GUri*)uri._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gid.soup3.message.Message] to send `OPTIONS *` to a server. The path of
      base_uri will be ignored.
  
      Params:
        baseUri = the destination endpoint
      Returns: the new #SoupMessage
  */
  static gid.soup3.message.Message newOptionsPing(gid.glib2.uri.Uri baseUri) nothrow
  {
    SoupMessage* _cretval;
    _cretval = soup_message_new_options_ping(baseUri ? cast(GUri*)baseUri._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds flags to the set of msg's flags.
  
      Params:
        flags = a set of #SoupMessageFlags values
  */
  void addFlags(gid.soup3.types.MessageFlags flags) nothrow
  {
    soup_message_add_flags(cast(SoupMessage*)this._cPtr, flags);
  }

  /**
      Disables the actions of [gid.soup3.session_feature.SessionFeature]s with the
      given feature_type (or a subclass of that type) on msg.
      
      msg is processed as though the feature(s) hadn't been added to the
      session. Eg, passing #SOUP_TYPE_CONTENT_SNIFFER for feature_type
      will disable Content-Type sniffing on the message.
      
      You must call this before queueing msg on a session; calling it on
      a message that has already been queued is undefined. In particular,
      you cannot call this on a message that is being requeued after a
      redirect or authentication.
  
      Params:
        featureType = the #GType of a [gid.soup3.session_feature.SessionFeature]
  */
  void disableFeature(gid.gobject2.types.GType featureType) nothrow
  {
    soup_message_disable_feature(cast(SoupMessage*)this._cPtr, featureType);
  }

  /**
      Returns the unique idenfier for the last connection used.
      
      This may be 0 if it was a cached resource or it has not gotten
      a connection yet.
      Returns: An id or 0 if no connection.
  */
  ulong getConnectionId() nothrow
  {
    ulong _retval;
    _retval = soup_message_get_connection_id(cast(SoupMessage*)this._cPtr);
    return _retval;
  }

  /**
      Gets msg's first-party [gid.glib2.uri.Uri].
      Returns: the msg's first party #GUri
  */
  gid.glib2.uri.Uri getFirstParty() nothrow
  {
    GUri* _cretval;
    _cretval = soup_message_get_first_party(cast(SoupMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the flags on msg.
      Returns: the flags
  */
  gid.soup3.types.MessageFlags getFlags() nothrow
  {
    SoupMessageFlags _cretval;
    _cretval = soup_message_get_flags(cast(SoupMessage*)this._cPtr);
    gid.soup3.types.MessageFlags _retval = cast(gid.soup3.types.MessageFlags)_cretval;
    return _retval;
  }

  /**
      Returns whether HTTP/1 version is currently demanded for the msg send.
      Returns: true, when HTTP/1 is demanded, false otherwise.
  */
  bool getForceHttp1() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_get_force_http1(cast(SoupMessage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the HTTP version of msg.
      
      This is the minimum of the version from the request and the version from the
      response.
      Returns: the HTTP version
  */
  gid.soup3.types.HTTPVersion getHttpVersion() nothrow
  {
    SoupHTTPVersion _cretval;
    _cretval = soup_message_get_http_version(cast(SoupMessage*)this._cPtr);
    gid.soup3.types.HTTPVersion _retval = cast(gid.soup3.types.HTTPVersion)_cretval;
    return _retval;
  }

  /**
      Gets whether msg is intended to be used to send `OPTIONS *` to a server.
      Returns: true if the message is options ping, or false otherwise
  */
  bool getIsOptionsPing() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_get_is_options_ping(cast(SoupMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns if this message is set as a top level navigation.
      
      Used for same-site policy checks.
      Returns: Whether the current request is a top-level navitation
  */
  bool getIsTopLevelNavigation() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_get_is_top_level_navigation(cast(SoupMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the method of this message.
      Returns: A method such as `SOUP_METHOD_GET`
  */
  string getMethod() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_message_get_method(cast(SoupMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the [gid.soup3.message_metrics.MessageMetrics] of msg.
      
      If the flag [gid.soup3.types.MessageFlags.CollectMetrics] is not enabled for msg this will
      return null.
      Returns: a #SoupMessageMetrics
  */
  gid.soup3.message_metrics.MessageMetrics getMetrics() nothrow
  {
    SoupMessageMetrics* _cretval;
    _cretval = soup_message_get_metrics(cast(SoupMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.soup3.message_metrics.MessageMetrics(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the [gid.soup3.types.MessagePriority].
      
      If not set this value defaults to #SOUP_MESSAGE_PRIORITY_NORMAL.
      Returns: the priority of the message.
  */
  gid.soup3.types.MessagePriority getPriority() nothrow
  {
    SoupMessagePriority _cretval;
    _cretval = soup_message_get_priority(cast(SoupMessage*)this._cPtr);
    gid.soup3.types.MessagePriority _retval = cast(gid.soup3.types.MessagePriority)_cretval;
    return _retval;
  }

  /**
      Returns the reason phrase for the status of this message.
      Returns: the phrase
  */
  string getReasonPhrase() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_message_get_reason_phrase(cast(SoupMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the remote [gid.gio2.socket_address.SocketAddress] of the connection associated with
      the message.
      
      The returned address can be null if the connection hasn't been established
      yet, or the resource was loaded from the disk cache. In case of proxy
      connections, the remote address returned is a [gid.gio2.proxy_address.ProxyAddress]. If
      [gid.soup3.session.Session.remoteConnectable] is set the returned address id for the
      connection to the session's remote connectable.
      Returns: a #GSocketAddress or null if the connection
            hasn't been established
  */
  gid.gio2.socket_address.SocketAddress getRemoteAddress() nothrow
  {
    GSocketAddress* _cretval;
    _cretval = soup_message_get_remote_address(cast(SoupMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the headers sent with the request.
      Returns: The [gid.soup3.message_headers.MessageHeaders]
  */
  gid.soup3.message_headers.MessageHeaders getRequestHeaders() nothrow
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_message_get_request_headers(cast(SoupMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.soup3.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the headers recieved with the response.
      Returns: The [gid.soup3.message_headers.MessageHeaders]
  */
  gid.soup3.message_headers.MessageHeaders getResponseHeaders() nothrow
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_message_get_response_headers(cast(SoupMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.soup3.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets msg's site for cookies #GUri.
      Returns: the msg's site for cookies #GUri
  */
  gid.glib2.uri.Uri getSiteForCookies() nothrow
  {
    GUri* _cretval;
    _cretval = soup_message_get_site_for_cookies(cast(SoupMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the set status of this message.
      Returns: The #SoupStatus
  */
  gid.soup3.types.Status getStatus() nothrow
  {
    SoupStatus _cretval;
    _cretval = soup_message_get_status(cast(SoupMessage*)this._cPtr);
    gid.soup3.types.Status _retval = cast(gid.soup3.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the name of the TLS ciphersuite negotiated for msg's connection.
      Returns: the name of the TLS ciphersuite,
          or null if msg's connection is not SSL.
  */
  string getTlsCiphersuiteName() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_message_get_tls_ciphersuite_name(cast(SoupMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the peer's [gid.gio2.tls_certificate.TlsCertificate] associated with msg's connection.
      
      Note that this is not set yet during the emission of
      [gid.soup3.message.Message.acceptCertificate] signal.
      Returns: msg's TLS peer certificate,
          or null if msg's connection is not SSL.
  */
  gid.gio2.tls_certificate.TlsCertificate getTlsPeerCertificate() nothrow
  {
    GTlsCertificate* _cretval;
    _cretval = soup_message_get_tls_peer_certificate(cast(SoupMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the errors associated with validating msg's TLS peer certificate.
      Note that this is not set yet during the emission of
      [gid.soup3.message.Message.acceptCertificate] signal.
      Returns: a #GTlsCertificateFlags with msg's TLS peer certificate errors.
  */
  gid.gio2.types.TlsCertificateFlags getTlsPeerCertificateErrors() nothrow
  {
    GTlsCertificateFlags _cretval;
    _cretval = soup_message_get_tls_peer_certificate_errors(cast(SoupMessage*)this._cPtr);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Gets the TLS protocol version negotiated for msg's connection.
      
      If the message connection is not SSL, [gid.gio2.types.TlsProtocolVersion.Unknown] is returned.
      Returns: a #GTlsProtocolVersion
  */
  gid.gio2.types.TlsProtocolVersion getTlsProtocolVersion() nothrow
  {
    GTlsProtocolVersion _cretval;
    _cretval = soup_message_get_tls_protocol_version(cast(SoupMessage*)this._cPtr);
    gid.gio2.types.TlsProtocolVersion _retval = cast(gid.gio2.types.TlsProtocolVersion)_cretval;
    return _retval;
  }

  /**
      Gets msg's URI.
      Returns: the URI msg is targeted for.
  */
  gid.glib2.uri.Uri getUri() nothrow
  {
    GUri* _cretval;
    _cretval = soup_message_get_uri(cast(SoupMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get whether [gid.soup3.session_feature.SessionFeature]s of the given feature_type
      (or a subclass of that type) are disabled on msg.
      
      See [gid.soup3.message.Message.disableFeature].
  
      Params:
        featureType = the #GType of a [gid.soup3.session_feature.SessionFeature]
      Returns: true if feature is disabled, or false otherwise.
  */
  bool isFeatureDisabled(gid.gobject2.types.GType featureType) nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_is_feature_disabled(cast(SoupMessage*)this._cPtr, featureType);
    return _retval;
  }

  /**
      Determines whether or not msg's connection can be kept alive for
      further requests after processing msg.
      
      The result is based on the HTTP version, Connection header, etc.
      Returns: true or false.
  */
  bool isKeepalive() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_is_keepalive(cast(SoupMessage*)this._cPtr);
    return _retval;
  }

  /**
      Queries if flags are present in the set of msg's flags.
  
      Params:
        flags = a set of #SoupMessageFlags values
      Returns: true if flags are enabled in msg
  */
  bool queryFlags(gid.soup3.types.MessageFlags flags) nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_query_flags(cast(SoupMessage*)this._cPtr, flags);
    return _retval;
  }

  /**
      Removes flags from the set of msg's flags.
  
      Params:
        flags = a set of #SoupMessageFlags values
  */
  void removeFlags(gid.soup3.types.MessageFlags flags) nothrow
  {
    soup_message_remove_flags(cast(SoupMessage*)this._cPtr, flags);
  }

  /**
      Sets first_party as the main document #GUri for msg.
      
      For details of when and how this is used refer to the documentation for
      [gid.soup3.types.CookieJarAcceptPolicy].
  
      Params:
        firstParty = the #GUri for the msg's first party
  */
  void setFirstParty(gid.glib2.uri.Uri firstParty) nothrow
  {
    soup_message_set_first_party(cast(SoupMessage*)this._cPtr, firstParty ? cast(GUri*)firstParty._cPtr(No.Dup) : null);
  }

  /**
      Sets the specified flags on msg.
  
      Params:
        flags = a set of #SoupMessageFlags values
  */
  void setFlags(gid.soup3.types.MessageFlags flags) nothrow
  {
    soup_message_set_flags(cast(SoupMessage*)this._cPtr, flags);
  }

  /**
      Sets whether HTTP/1 version should be used when sending this message.
      Some connections can still override it, if needed.
      
      Note the value is unset after the message send is finished.
  
      Params:
        value = value to set
  */
  void setForceHttp1(bool value) nothrow
  {
    soup_message_set_force_http1(cast(SoupMessage*)this._cPtr, value);
  }

  /**
      Set whether msg is intended to be used to send `OPTIONS *` to a server.
      
      When set to true, the path of [gid.soup3.message.Message.uri] will be ignored and
      [gid.soup3.message.Message.method] set to `SOUP_METHOD_OPTIONS`.
  
      Params:
        isOptionsPing = the value to set
  */
  void setIsOptionsPing(bool isOptionsPing) nothrow
  {
    soup_message_set_is_options_ping(cast(SoupMessage*)this._cPtr, isOptionsPing);
  }

  /**
      Sets whether the current request is a top-level navitation.
      
      See the [same-site spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00)
      for more information.
  
      Params:
        isTopLevelNavigation = if true indicate the current request is a top-level navigation
  */
  void setIsTopLevelNavigation(bool isTopLevelNavigation) nothrow
  {
    soup_message_set_is_top_level_navigation(cast(SoupMessage*)this._cPtr, isTopLevelNavigation);
  }

  /**
      Set msg's HTTP method to method.
  
      Params:
        method = the value to set
  */
  void setMethod(string method) nothrow
  {
    const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
    soup_message_set_method(cast(SoupMessage*)this._cPtr, _method);
  }

  /**
      Sets the priority of a message.
      
      Note that this won't have any effect unless used before the message is added
      to the session's message processing queue.
      
      The message will be placed just before any other previously added
      message with lower priority (messages with the same priority are
      processed on a FIFO basis).
      
      Setting priorities does not currently work with synchronous messages
      because in the synchronous/blocking case, priority ends up being determined
      semi-randomly by thread scheduling.
  
      Params:
        priority = the #SoupMessagePriority
  */
  void setPriority(gid.soup3.types.MessagePriority priority) nothrow
  {
    soup_message_set_priority(cast(SoupMessage*)this._cPtr, priority);
  }

  /**
      Set the request body of a [gid.soup3.message.Message].
      
      If content_type is null and stream is not null the Content-Type header will
      not be changed if present.
      The request body needs to be set again in case msg is restarted
      (in case of redirection or authentication).
  
      Params:
        contentType = MIME Content-Type of the body, or null if unknown
        stream = a #GInputStream to read the request body from
        contentLength = the byte length of stream or -1 if unknown
  */
  void setRequestBody(string contentType, gid.gio2.input_stream.InputStream stream, ptrdiff_t contentLength) nothrow
  {
    const(char)* _contentType = contentType.toCString!(No.Malloc, Yes.Nullable);
    soup_message_set_request_body(cast(SoupMessage*)this._cPtr, _contentType, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, contentLength);
  }

  /**
      Set the request body of a [gid.soup3.message.Message] from [gid.glib2.bytes.Bytes].
      
      If content_type is null and bytes is not null the Content-Type header will
      not be changed if present.
      The request body needs to be set again in case msg is restarted
      (in case of redirection or authentication).
  
      Params:
        contentType = MIME Content-Type of the body, or null if unknown
        bytes = a #GBytes with the request body data
  */
  void setRequestBodyFromBytes(string contentType = null, gid.glib2.bytes.Bytes bytes = null) nothrow
  {
    const(char)* _contentType = contentType.toCString!(No.Malloc, Yes.Nullable);
    soup_message_set_request_body_from_bytes(cast(SoupMessage*)this._cPtr, _contentType, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
  }

  /**
      Sets site_for_cookies as the policy URL for same-site cookies for msg.
      
      It is either the URL of the top-level document or null depending on whether
      the registrable domain of this document's URL matches the registrable domain
      of its parent's/opener's URL. For the top-level document it is set to the
      document's URL.
      
      See the [same-site spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00)
      for more information.
  
      Params:
        siteForCookies = the #GUri for the msg's site for cookies
  */
  void setSiteForCookies(gid.glib2.uri.Uri siteForCookies = null) nothrow
  {
    soup_message_set_site_for_cookies(cast(SoupMessage*)this._cPtr, siteForCookies ? cast(GUri*)siteForCookies._cPtr(No.Dup) : null);
  }

  /**
      Sets the certificate to be used by msg's connection when a
      client certificate is requested during the TLS handshake.
      
      You can call this as a response to [gid.soup3.message.Message.requestCertificate]
      signal, or before the connection is started. If certificate is null
      the handshake will continue without providing a GTlsCertificate.
      Note that the [gid.gio2.tls_certificate.TlsCertificate] set by this function will be ignored if
      [gid.soup3.session.Session.tlsInteraction] is not null.
  
      Params:
        certificate = the #GTlsCertificate to set, or null
  */
  void setTlsClientCertificate(gid.gio2.tls_certificate.TlsCertificate certificate = null) nothrow
  {
    soup_message_set_tls_client_certificate(cast(SoupMessage*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null);
  }

  /**
      Sets msg's URI to uri.
      
      If msg has already been sent and you want to re-send it with the new URI,
      you need to send it again.
  
      Params:
        uri = the new #GUri
  */
  void setUri(gid.glib2.uri.Uri uri) nothrow
  {
    soup_message_set_uri(cast(SoupMessage*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null);
  }

  /**
      Completes a certificate password request.
      
      You must call this as a response to
      [gid.soup3.message.Message.requestCertificatePassword] signal, to notify msg that
      the [gid.gio2.tls_password.TlsPassword] has already been updated.
  */
  void tlsClientCertificatePasswordRequestComplete() nothrow
  {
    soup_message_tls_client_certificate_password_request_complete(cast(SoupMessage*)this._cPtr);
  }

  /**
      Connect to `AcceptCertificate` signal.
  
      Emitted during the msg's connection TLS handshake
        after an unacceptable TLS certificate has been received.
        
        You can return true to accept tls_certificate despite
        tls_errors.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.tls_certificate.TlsCertificate tlsPeerCertificate, gid.gio2.types.TlsCertificateFlags tlsPeerErrors, gid.soup3.message.Message message)`
  
          `tlsPeerCertificate` the peer's #GTlsCertificate (optional)
  
          `tlsPeerErrors` the tls errors of tls_certificate (optional)
  
          `message` the instance the signal is connected to (optional)
  
          `Returns` true to accept the TLS certificate and stop other
              handlers from being invoked, or false to propagate the
              event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAcceptCertificate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.tls_certificate.TlsCertificate)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gio2.types.TlsCertificateFlags)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.soup3.message.Message)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.acceptCertificate");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-certificate", closure, after);
  }

  /**
      Connect to `Authenticate` signal.
  
      Emitted when the message requires authentication.
        
        If credentials are available call [gid.soup3.auth.Auth.authenticate] on
        auth. If these credentials fail, the signal will be emitted again,
        with retrying set to true, which will continue until you return
        without calling [gid.soup3.auth.Auth.authenticate] on auth.
        
        Note that this may be emitted before msg's body has been
        fully read.
        
        You can authenticate auth asynchronously by calling
        [gid.gobject2.object.ObjectWrap.ref_] on auth and returning true. The operation will
        complete once either [gid.soup3.auth.Auth.authenticate] or
        [gid.soup3.auth.Auth.cancel] are called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.soup3.auth.Auth auth, bool retrying, gid.soup3.message.Message message)`
  
          `auth` the #SoupAuth to authenticate (optional)
  
          `retrying` true if this is the second (or later) attempt (optional)
  
          `message` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked
              or false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAuthenticate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.auth.Auth)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.soup3.message.Message)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.authenticate");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authenticate", closure, after);
  }

  /**
      Connect to `ContentSniffed` signal.
  
      This signal is emitted after [gid.soup3.message.Message.gotHeaders].
        
        If content sniffing is disabled, or no content sniffing will be
        performed, due to the sniffer deciding to trust the
        Content-Type sent by the server, this signal is emitted
        immediately after [gid.soup3.message.Message.gotHeaders], and type is
        null.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string type, string[string] params, gid.soup3.message.Message message)`
  
          `type` the content type that we got from sniffing (optional)
  
          `params` a #GHashTable with the parameters (optional)
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectContentSniffed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string[string])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.soup3.message.Message)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = gHashTableToD!(string, string, GidOwnership.None)(cast(GHashTable*)getVal!(void*)(&_paramVals[2]));

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.contentSniffed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("content-sniffed", closure, after);
  }

  /**
      Connect to `Finished` signal.
  
      Emitted when all HTTP processing is finished for a message.
        
        (After `signalMessage::got_body`).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.finished");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
      Connect to `GotBody` signal.
  
      Emitted after receiving the complete message response body.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGotBody(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.gotBody");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-body", closure, after);
  }

  /**
      Connect to `GotBodyData` signal.
  
      Emitted after reading a portion of the message
        body from the network.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint chunkSize, gid.soup3.message.Message message)`
  
          `chunkSize` the number of bytes read (optional)
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGotBodyData(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.soup3.message.Message)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.gotBodyData");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-body-data", closure, after);
  }

  /**
      Connect to `GotHeaders` signal.
  
      Emitted after receiving the Status-Line and response headers.
        
        See also [gid.soup3.message.Message.addHeaderHandler] and
        [gid.soup3.message.Message.addStatusCodeHandler], which can be used to
        connect to a subset of emissions of this signal.
        
        If you cancel or requeue msg while processing this signal,
        then the current HTTP I/O will be stopped after this signal
        emission finished, and msg's connection will be closed.
        (If you need to requeue a message--eg, after handling
        authentication or redirection--it is usually better to
        requeue it from a [gid.soup3.message.Message.gotBody] handler rather
        than a `signalMessage::got_headers` handler, so that the
        existing HTTP connection can be reused.)
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGotHeaders(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.gotHeaders");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-headers", closure, after);
  }

  /**
      Connect to `GotInformational` signal.
  
      Emitted after receiving a 1xx (Informational) response for
        a (client-side) message.
        
        The response_headers will be filled in with the headers associated
        with the informational response; however, those header values will be
        erased after this signal is done.
        
        If you cancel or requeue msg while processing this signal,
        then the current HTTP I/O will be stopped after this signal
        emission finished, and msg's connection will be closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGotInformational(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.gotInformational");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-informational", closure, after);
  }

  /**
      Connect to `HstsEnforced` signal.
  
      Emitted when [gid.soup3.hstsenforcer.HSTSEnforcer] has upgraded the protocol
        for msg to HTTPS as a result of matching its domain with
        a HSTS policy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHstsEnforced(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.hstsEnforced");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hsts-enforced", closure, after);
  }

  /**
      Connect to `NetworkEvent` signal.
  
      Emitted to indicate that some network-related event
        related to msg has occurred.
        
        This essentially proxies the [gid.gio2.socket_client.SocketClient.event] signal,
        but only for events that occur while msg "owns" the connection; if
        msg is sent on an existing persistent connection, then this signal
        will not be emitted. (If you want to force the message to be sent on
        a new connection, set the [gid.soup3.types.MessageFlags.NewConnection] flag on it.)
        
        See [gid.gio2.socket_client.SocketClient.event] for more information on what
        the different values of event correspond to, and what
        connection will be in each case.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.types.SocketClientEvent event, gid.gio2.iostream.IOStream connection, gid.soup3.message.Message message)`
  
          `event` the network event (optional)
  
          `connection` the current state of the network connection (optional)
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNetworkEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gio2.types.SocketClientEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.iostream.IOStream)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.soup3.message.Message)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.networkEvent");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("network-event", closure, after);
  }

  /**
      Connect to `RequestCertificate` signal.
  
      Emitted during the msg's connection TLS handshake when
        tls_connection requests a certificate from the client.
        
        You can set the client certificate by calling
        [gid.soup3.message.Message.setTlsClientCertificate] and returning true. It's
        possible to handle the request asynchornously by returning true and
        call [gid.soup3.message.Message.setTlsClientCertificate] later once the
        certificate is available. Note that this signal is not emitted if
        [gid.soup3.session.Session.tlsInteraction] was set, or if
        [gid.soup3.message.Message.setTlsClientCertificate] was called before the
        connection TLS handshake started.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.tls_client_connection.TlsClientConnection tlsConnection, gid.soup3.message.Message message)`
  
          `tlsConnection` the #GTlsClientConnection (optional)
  
          `message` the instance the signal is connected to (optional)
  
          `Returns` true to handle the request, or false to make the connection
              fail with [gid.gio2.types.TlsError.CertificateRequired].
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRequestCertificate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.tls_client_connection.TlsClientConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.soup3.message.Message)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.requestCertificate");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-certificate", closure, after);
  }

  /**
      Connect to `RequestCertificatePassword` signal.
  
      Emitted during the msg's connection TLS handshake when
        tls_connection requests a certificate password from the client.
        
        You can set the certificate password on password, then call
        [gid.soup3.message.Message.tlsClientCertificatePasswordRequestComplete] and
        return true to handle the signal synchronously. It's possible to
        handle the request asynchornously by calling
        [gid.gobject2.object.ObjectWrap.ref_] on password, then returning true and
        call
        [gid.soup3.message.Message.tlsClientCertificatePasswordRequestComplete]
        later after setting the password on password. Note that this signal
        is not emitted if [gid.soup3.session.Session.tlsInteraction] was set.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.tls_password.TlsPassword tlsPassword, gid.soup3.message.Message message)`
  
          `tlsPassword` the #GTlsPassword (optional)
  
          `message` the instance the signal is connected to (optional)
  
          `Returns` true to handle the request, or false to make the connection
              fail with [gid.gio2.types.TlsError.CertificateRequired].
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRequestCertificatePassword(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.tls_password.TlsPassword)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.soup3.message.Message)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.requestCertificatePassword");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-certificate-password", closure, after);
  }

  /**
      Connect to `Restarted` signal.
  
      Emitted when a request that was already sent once is now
        being sent again.
        
        e.g. because the first attempt received a
        redirection response, or because we needed to use
        authentication.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRestarted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.restarted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("restarted", closure, after);
  }

  /**
      Connect to `Starting` signal.
  
      Emitted just before a message is sent.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStarting(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.starting");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("starting", closure, after);
  }

  /**
      Connect to `WroteBody` signal.
  
      Emitted immediately after writing the complete body for a
        message.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWroteBody(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.wroteBody");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-body", closure, after);
  }

  /**
      Connect to `WroteBodyData` signal.
  
      Emitted immediately after writing a portion of the message
        body to the network.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint chunkSize, gid.soup3.message.Message message)`
  
          `chunkSize` the number of bytes written (optional)
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWroteBodyData(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.soup3.message.Message)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.wroteBodyData");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-body-data", closure, after);
  }

  /**
      Connect to `WroteHeaders` signal.
  
      Emitted immediately after writing the request headers for a
        message.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message message)`
  
          `message` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWroteHeaders(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.message.Message.wroteHeaders");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-headers", closure, after);
  }
}

/// Fluent builder implementation template for [gid.soup3.message.Message]
class MessageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `firstParty` property.
      Params:
        propval = The [gid.glib2.uri.Uri] loaded in the application when the message was
          queued.
      Returns: Builder instance for fluent chaining
  */
  T firstParty(gid.glib2.uri.Uri propval) nothrow
  {
    return setProperty("first-party", propval);
  }

  /**
      Set `flags` property.
      Params:
        propval = Various message options.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.soup3.types.MessageFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }

  /**
      Set `isOptionsPing` property.
      Params:
        propval = Whether the message is an OPTIONS ping.
          
          The [gid.soup3.message.Message] is intended to be used to send
          `OPTIONS *` to a server. When set to true, the
          path of [gid.soup3.message.Message.uri] will be ignored and
          [gid.soup3.message.Message.method] set to `SOUP_METHOD_OPTIONS`.
      Returns: Builder instance for fluent chaining
  */
  T isOptionsPing(bool propval) nothrow
  {
    return setProperty("is-options-ping", propval);
  }

  /**
      Set `isTopLevelNavigation` property.
      Params:
        propval = Set when the message is navigating between top level domains.
      Returns: Builder instance for fluent chaining
  */
  T isTopLevelNavigation(bool propval) nothrow
  {
    return setProperty("is-top-level-navigation", propval);
  }

  /**
      Set `method` property.
      Params:
        propval = The message's HTTP method.
      Returns: Builder instance for fluent chaining
  */
  T method(string propval) nothrow
  {
    return setProperty("method", propval);
  }

  /**
      Set `priority` property.
      Params:
        propval = Sets the priority of the [gid.soup3.message.Message]. See
          [gid.soup3.message.Message.setPriority] for further details.
      Returns: Builder instance for fluent chaining
  */
  T priority(gid.soup3.types.MessagePriority propval) nothrow
  {
    return setProperty("priority", propval);
  }

  /**
      Set `siteForCookies` property.
      Params:
        propval = Site used to compare cookies against. Used for SameSite cookie support.
      Returns: Builder instance for fluent chaining
  */
  T siteForCookies(gid.glib2.uri.Uri propval) nothrow
  {
    return setProperty("site-for-cookies", propval);
  }

  /**
      Set `uri` property.
      Params:
        propval = The message's Request-URI.
      Returns: Builder instance for fluent chaining
  */
  T uri(gid.glib2.uri.Uri propval) nothrow
  {
    return setProperty("uri", propval);
  }
}

/// Fluent builder for [gid.soup3.message.Message]
final class MessageGidBuilder : MessageGidBuilderImpl!MessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Message build() nothrow
  {
    return new Message(cast(void*)createGObject(Message._getGType), Yes.Take);
  }
}
