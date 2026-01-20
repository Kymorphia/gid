/// Module for [MessageMetrics] class
module soup.message_metrics;

import gid.gid;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.types;

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
class MessageMetrics : gobject.boxed.Boxed
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
    return cast(void function())soup_message_metrics_get_type != &gidSymbolNotFound ? soup_message_metrics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageMetrics self()
  {
    return this;
  }

  /**
      Copies metrics.
      Returns: a copy of metrics
  */
  soup.message_metrics.MessageMetrics copy()
  {
    SoupMessageMetrics* _cretval;
    _cretval = soup_message_metrics_copy(cast(SoupMessageMetrics*)this._cPtr);
    auto _retval = _cretval ? new soup.message_metrics.MessageMetrics(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the time immediately after the `classMessage` completed the
      connection to the server. This includes the time for the proxy
      negotiation and TLS handshake.
      
      It will be 0 if no network connection was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the connection end time
  */
  ulong getConnectEnd()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_connect_end(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the `classMessage` started to
      establish the connection to the server.
      
      It will be 0 if no network connection was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the connection start time
  */
  ulong getConnectStart()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_connect_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately after the `classMessage` completed the
      domain lookup name for the resource.
      
      It will be 0 if no domain lookup was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the domain lookup end time
  */
  ulong getDnsEnd()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_dns_end(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the `classMessage` started the
      domain lookup name for the resource.
      
      It will be 0 if no domain lookup was required to fetch the resource (a
      persistent connection was used or resource was loaded from the local disk
      cache).
      Returns: the domain lookup start time
  */
  ulong getDnsStart()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_dns_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the `classMessage` started to
      fetch a resource either from a remote server or local disk cache.
      Returns: the fetch start time
  */
  ulong getFetchStart()
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
      before `signalMessage::wrote-body` signal is emitted, but you might get an
      intermediate value if called before.
      Returns: the request body bytes sent
  */
  ulong getRequestBodyBytesSent()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_body_bytes_sent(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the request body size in bytes. This is the size of the original body
      given to the request before any encoding is applied.
      
      This value is available right before `signalMessage::wrote-body` signal is
      emitted, but you might get an intermediate value if called before.
      Returns: the request body size
  */
  ulong getRequestBodySize()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_body_size(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes sent to the network for the request headers.
      
      This value is available right before `signalMessage::wrote-headers` signal
      is emitted, but you might get an intermediate value if called before.
      Returns: the request headers bytes sent
  */
  ulong getRequestHeaderBytesSent()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_header_bytes_sent(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the `classMessage` started the
      request of the resource from the server or the local disk cache.
      Returns: the request start time
  */
  ulong getRequestStart()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_request_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes received from the network for the response body.
      
      This value is available right before `signalMessage::got-body` signal is
      emitted, but you might get an intermediate value if called before. For
      resources loaded from the disk cache this value is always 0.
      Returns: the response body bytes received
  */
  ulong getResponseBodyBytesReceived()
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
      available right before `signalMessage::got-body` signal is emitted, but you
      might get an intermediate value if called before.
      Returns: the response body size
  */
  ulong getResponseBodySize()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_body_size(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately after the `classMessage` received the last
      bytes of the response from the server or the local disk cache.
      
      In case of load failure, this returns the time immediately before the
      fetch is aborted.
      Returns: the response end time
  */
  ulong getResponseEnd()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_end(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of bytes received from the network for the response headers.
      
      This value is available right before `signalMessage::got-headers` signal
      is emitted, but you might get an intermediate value if called before.
      For resources loaded from the disk cache this value is always 0.
      Returns: the response headers bytes received
  */
  ulong getResponseHeaderBytesReceived()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_header_bytes_received(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately after the `classMessage` received the first
      bytes of the response from the server or the local disk cache.
      Returns: the response start time
  */
  ulong getResponseStart()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_response_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }

  /**
      Get the time immediately before the `classMessage` started the
      TLS handshake.
      
      It will be 0 if no TLS handshake was required to fetch the resource
      (connection was not secure, a persistent connection was used or resource was
      loaded from the local disk cache).
      Returns: the tls start time
  */
  ulong getTlsStart()
  {
    ulong _retval;
    _retval = soup_message_metrics_get_tls_start(cast(SoupMessageMetrics*)this._cPtr);
    return _retval;
  }
}
