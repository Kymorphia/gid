/// Module for [MessageMetrics] class
module soup.message_metrics;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    Contains metrics collected while loading a [soup.message.Message] either from the
    network or the disk cache.
    
    Metrics are not collected by default for a [soup.message.Message], you need to add the
    flag [soup.types.MessageFlags.CollectMetrics] to enable the feature.
    
    Temporal metrics are expressed as a monotonic time and always start with a
    fetch start event and finish with response end. All other events are optional.
    An event can be 0 because it hasn't happened yet, because it's optional or
    because the load failed before the event reached.
    
    Size metrics are expressed in bytes and are updated while the [soup.message.Message] is
    being loaded. You can connect to different [soup.message.Message] signals to get the
    final result of every value.
*/
class MessageMetrics : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_message_metrics_get_type != &gidSymbolNotFound ? soup_message_metrics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageMetrics self() nothrow
  {
    return this;
  }

  /**
      Copies metrics.
      Returns: a copy of metrics
  */
  soup.message_metrics.MessageMetrics copy() nothrow
  {
    SoupMessageMetrics* _cretval;
    _cretval = soup_message_metrics_copy(cast(SoupMessageMetrics*)this._cPtr);
    auto _retval = _cretval ? new soup.message_metrics.MessageMetrics(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the time immediately after the [soup.message.Message] completed the
      connection to the server. This includes the time for the proxy
      negotiation and TLS handshake.
      
      It will be 0 if no network connection was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the connection end time
  */
  ulong getConnectEnd() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_connect_end(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the [soup.message.Message] started to
      establish the connection to the server.
      
      It will be 0 if no network connection was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the connection start time
  */
  ulong getConnectStart() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_connect_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately after the [soup.message.Message] completed the
      domain lookup name for the resource.
      
      It will be 0 if no domain lookup was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the domain lookup end time
  */
  ulong getDnsEnd() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_dns_end(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the [soup.message.Message] started the
      domain lookup name for the resource.
      
      It will be 0 if no domain lookup was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the domain lookup start time
  */
  ulong getDnsStart() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_dns_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the [soup.message.Message] started to
      fetch a resource either from a remote server or local disk cache.
      Returns: the fetch start time
  */
  ulong getFetchStart() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_fetch_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes sent to the network for the request body.
      
      This is the size of the body sent, after encodings are applied, so it might
      be greater than the value returned by
      [soup.message_metrics.MessageMetrics.getRequestBodySize]. This value is available right
      before [soup.message.Message.wroteBody] signal is emitted, but you might get an
      intermediate value if called before.
      Returns: the request body bytes sent
  */
  ulong getRequestBodyBytesSent() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_body_bytes_sent(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the request body size in bytes. This is the size of the original body
      given to the request before any encoding is applied.
      
      This value is available right before [soup.message.Message.wroteBody] signal is
      emitted, but you might get an intermediate value if called before.
      Returns: the request body size
  */
  ulong getRequestBodySize() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_body_size(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes sent to the network for the request headers.
      
      This value is available right before [soup.message.Message.wroteHeaders] signal
      is emitted, but you might get an intermediate value if called before.
      Returns: the request headers bytes sent
  */
  ulong getRequestHeaderBytesSent() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_header_bytes_sent(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the [soup.message.Message] started the
      request of the resource from the server or the local disk cache.
      Returns: the request start time
  */
  ulong getRequestStart() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes received from the network for the response body.
      
      This value is available right before [soup.message.Message.gotBody] signal is
      emitted, but you might get an intermediate value if called before. For
      resources loaded from the disk cache this value is always 0.
      Returns: the response body bytes received
  */
  ulong getResponseBodyBytesReceived() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_body_bytes_received(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the response body size in bytes.
      
      This is the size of the body as given to the user after all encodings are
      applied, so it might be greater than the value returned by
      [soup.message_metrics.MessageMetrics.getResponseBodyBytesReceived]. This value is
      available right before [soup.message.Message.gotBody] signal is emitted, but you
      might get an intermediate value if called before.
      Returns: the response body size
  */
  ulong getResponseBodySize() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_body_size(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately after the [soup.message.Message] received the last
      bytes of the response from the server or the local disk cache.
      
      In case of load failure, this returns the time immediately before the
      fetch is aborted.
      Returns: the response end time
  */
  ulong getResponseEnd() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_end(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes received from the network for the response headers.
      
      This value is available right before [soup.message.Message.gotHeaders] signal
      is emitted, but you might get an intermediate value if called before.
      For resources loaded from the disk cache this value is always 0.
      Returns: the response headers bytes received
  */
  ulong getResponseHeaderBytesReceived() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_header_bytes_received(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately after the [soup.message.Message] received the first
      bytes of the response from the server or the local disk cache.
      Returns: the response start time
  */
  ulong getResponseStart() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the [soup.message.Message] started the
      TLS handshake.
      
      It will be 0 if no TLS handshake was required to fetch the resource
      (connection was not secure, a persistent connection was used or resource was
      loaded from the local disk cache).
      Returns: the tls start time
  */
  ulong getTlsStart() nothrow
  {
    ulong _retval;
    _retval = soup_message_metrics_get_tls_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }
}
