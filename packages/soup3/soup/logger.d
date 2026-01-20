/// Module for [Logger] class
module soup.logger;

import gid.gid;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

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
class Logger : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_logger_get_type != &gidSymbolNotFound ? soup_logger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Logger self()
  {
    return this;
  }

  /**
      Get `level` property.
      Returns: The level of logging output.
  */
  @property soup.types.LoggerLogLevel level()
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.LoggerLogLevel)("level");
  }

  /**
      Set `level` property.
      Params:
        propval = The level of logging output.
  */
  @property void level(soup.types.LoggerLogLevel propval)
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.LoggerLogLevel)("level", propval);
  }

  /**
      Get `maxBodySize` property.
      Returns: If `property@Logger:level` is [soup.types.LoggerLogLevel.Body], this gives
        the maximum number of bytes of the body that will be logged.
        (-1 means "no limit".)
  */
  @property int maxBodySize()
  {
    return getMaxBodySize();
  }

  /**
      Set `maxBodySize` property.
      Params:
        propval = If `property@Logger:level` is [soup.types.LoggerLogLevel.Body], this gives
          the maximum number of bytes of the body that will be logged.
          (-1 means "no limit".)
  */
  @property void maxBodySize(int propval)
  {
    return setMaxBodySize(propval);
  }

  mixin SessionFeatureT!();

  /**
      Creates a new #SoupLogger with the given debug level.
      
      If you need finer control over what message parts are and aren't
      logged, use [soup.logger.Logger.setRequestFilter] and
      [soup.logger.Logger.setResponseFilter].
  
      Params:
        level = the debug level
      Returns: a new #SoupLogger
  */
  this(soup.types.LoggerLogLevel level)
  {
    SoupLogger* _cretval;
    _cretval = soup_logger_new(level);
    this(_cretval, Yes.Take);
  }

  /**
      Get the maximum body size for logger.
      Returns: the maximum body size, or -1 if unlimited
  */
  int getMaxBodySize()
  {
    int _retval;
    _retval = soup_logger_get_max_body_size(cast(SoupLogger*)this._cPtr);
    return _retval;
  }

  /**
      Sets the maximum body size for logger (-1 means no limit).
  
      Params:
        maxBodySize = the maximum body size to log
  */
  void setMaxBodySize(int maxBodySize)
  {
    soup_logger_set_max_body_size(cast(SoupLogger*)this._cPtr, maxBodySize);
  }

  /**
      Sets up an alternate log printing routine, if you don't want
      the log to go to `stdout`.
  
      Params:
        printer = the callback for printing logging output
  */
  void setPrinter(soup.types.LoggerPrinter printer)
  {
    extern(C) void _printerCallback(SoupLogger* logger, SoupLoggerLogLevel level, char direction, const(char)* data, void* userData)
    {
      auto _dlg = cast(soup.types.LoggerPrinter*)userData;
      string _data = data.fromCString(No.Free);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.logger.Logger)(cast(void*)logger, No.Take), level, direction, _data);
    }
    auto _printerCB = printer ? &_printerCallback : null;
    auto _printer = printer ? freezeDelegate(cast(void*)&printer) : null;
    GDestroyNotify _printerDestroyCB = printer ? &thawDelegate : null;
    soup_logger_set_printer(cast(SoupLogger*)this._cPtr, _printerCB, _printer, _printerDestroyCB);
  }

  /**
      Sets up a filter to determine the log level for a given request.
      
      For each HTTP request logger will invoke request_filter to
      determine how much (if any) of that request to log. (If you do not
      set a request filter, logger will just always log requests at the
      level passed to [soup.logger.Logger.new_].)
  
      Params:
        requestFilter = the callback for request debugging
  */
  void setRequestFilter(soup.types.LoggerFilter requestFilter)
  {
    extern(C) SoupLoggerLogLevel _requestFilterCallback(SoupLogger* logger, SoupMessage* msg, void* userData)
    {
      soup.types.LoggerLogLevel _dretval;
      auto _dlg = cast(soup.types.LoggerFilter*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.logger.Logger)(cast(void*)logger, No.Take), gobject.object.ObjectWrap._getDObject!(soup.message.Message)(cast(void*)msg, No.Take));
      auto _retval = cast(SoupLoggerLogLevel)_dretval;

      return _retval;
    }
    auto _requestFilterCB = requestFilter ? &_requestFilterCallback : null;
    auto _requestFilter = requestFilter ? freezeDelegate(cast(void*)&requestFilter) : null;
    GDestroyNotify _requestFilterDestroyCB = requestFilter ? &thawDelegate : null;
    soup_logger_set_request_filter(cast(SoupLogger*)this._cPtr, _requestFilterCB, _requestFilter, _requestFilterDestroyCB);
  }

  /**
      Sets up a filter to determine the log level for a given response.
      
      For each HTTP response logger will invoke response_filter to
      determine how much (if any) of that response to log. (If you do not
      set a response filter, logger will just always log responses at
      the level passed to [soup.logger.Logger.new_].)
  
      Params:
        responseFilter = the callback for response debugging
  */
  void setResponseFilter(soup.types.LoggerFilter responseFilter)
  {
    extern(C) SoupLoggerLogLevel _responseFilterCallback(SoupLogger* logger, SoupMessage* msg, void* userData)
    {
      soup.types.LoggerLogLevel _dretval;
      auto _dlg = cast(soup.types.LoggerFilter*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.logger.Logger)(cast(void*)logger, No.Take), gobject.object.ObjectWrap._getDObject!(soup.message.Message)(cast(void*)msg, No.Take));
      auto _retval = cast(SoupLoggerLogLevel)_dretval;

      return _retval;
    }
    auto _responseFilterCB = responseFilter ? &_responseFilterCallback : null;
    auto _responseFilter = responseFilter ? freezeDelegate(cast(void*)&responseFilter) : null;
    GDestroyNotify _responseFilterDestroyCB = responseFilter ? &thawDelegate : null;
    soup_logger_set_response_filter(cast(SoupLogger*)this._cPtr, _responseFilterCB, _responseFilter, _responseFilterDestroyCB);
  }
}
