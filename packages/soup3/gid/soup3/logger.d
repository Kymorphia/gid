/// Module for [Logger] class
module gid.soup3.logger;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Debug logging support
    
    [gid.soup3.logger.Logger] watches a [gid.soup3.session.Session] and logs the HTTP traffic that
    it generates, for debugging purposes. Many applications use an
    environment variable to determine whether or not to use
    [gid.soup3.logger.Logger], and to determine the amount of debugging output.
    
    To use [gid.soup3.logger.Logger], first create a logger with [gid.soup3.logger.Logger.new_], optionally
    configure it with [gid.soup3.logger.Logger.setRequestFilter],
    [gid.soup3.logger.Logger.setResponseFilter], and [gid.soup3.logger.Logger.setPrinter], and
    then attach it to a session (or multiple sessions) with
    [gid.soup3.session.Session.addFeature].
    
    By default, the debugging output is sent to `stdout`, and looks something
    like:
    
    ```
    > POST /unauth HTTP/1.1
    > Soup-Debug-Timestamp: 1200171744
    > Soup-Debug: SoupSession 1 (0x612190), SoupMessage 1 (0x617000), GSocket 1 (0x612220)
    > Host: localhost
    > Content-Type: text/plain
    > Connection: close
    
    < HTTP/1.1 201 Created
    < Soup-Debug-Timestamp: 1200171744
    < Soup-Debug: SoupMessage 1 (0x617000)
    < Date: Sun, 12 Jan 2008 21:02:24 GMT
    < Content-Length: 0
    ```
    
    The `Soup-Debug-Timestamp` line gives the time (as a `time_t`) when the
    request was sent, or the response fully received.
    
    The `Soup-Debug` line gives further debugging information about the
    [gid.soup3.session.Session], [gid.soup3.message.Message], and [gid.gio2.socket.Socket] involved; the hex
    numbers are the addresses of the objects in question (which may be useful if
    you are running in a debugger). The decimal IDs are simply counters that
    uniquely identify objects across the lifetime of the [gid.soup3.logger.Logger]. In
    particular, this can be used to identify when multiple messages are sent
    across the same connection.
    
    Currently, the request half of the message is logged just before
    the first byte of the request gets written to the network (from the
    [gid.soup3.message.Message.starting] signal).
    
    The response is logged just after the last byte of the response body is read
    from the network (from the [gid.soup3.message.Message.gotBody] or
    [gid.soup3.message.Message.gotInformational] signal), which means that the
    [gid.soup3.message.Message.gotHeaders] signal, and anything triggered off it (such as
    [gid.soup3.message.Message.authenticate]) will be emitted *before* the response headers are
    actually logged.
    
    If the response doesn't happen to trigger the [gid.soup3.message.Message.gotBody] nor
    [gid.soup3.message.Message.gotInformational] signals due to, for example, a
    cancellation before receiving the last byte of the response body, the
    response will still be logged on the event of the [gid.soup3.message.Message.finished]
    signal.
*/
@gidGir("Logger", "LoggerClass")
class Logger : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_logger_get_type != &gidSymbolNotFound ? soup_logger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupLogger";
  }

  /** Returns `this`, for use in `with` statements. */
  override Logger self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.logger.Logger]
      Returns: New builder object
  */
  static LoggerGidBuilder builder() nothrow
  {
    return new LoggerGidBuilder;
  }

  /**
      Get `level` property.
      Returns: The level of logging output.
  */
  @property gid.soup3.types.LoggerLogLevel level() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.soup3.types.LoggerLogLevel)("level");
  }

  /**
      Set `level` property.
      Params:
        propval = The level of logging output.
  */
  @property void level(gid.soup3.types.LoggerLogLevel propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.soup3.types.LoggerLogLevel)("level", propval);
  }

  /**
      Get `maxBodySize` property.
      Returns: If [gid.soup3.logger.Logger.level] is [gid.soup3.types.LoggerLogLevel.Body], this gives
        the maximum number of bytes of the body that will be logged.
        (-1 means "no limit".)
  */
  @property int maxBodySize() nothrow
  {
    return getMaxBodySize();
  }

  /**
      Set `maxBodySize` property.
      Params:
        propval = If [gid.soup3.logger.Logger.level] is [gid.soup3.types.LoggerLogLevel.Body], this gives
          the maximum number of bytes of the body that will be logged.
          (-1 means "no limit".)
  */
  @property void maxBodySize(int propval) nothrow
  {
    setMaxBodySize(propval);
  }

  mixin SessionFeatureT!();

  /**
      Creates a new [gid.soup3.logger.Logger] with the given debug level.
      
      If you need finer control over what message parts are and aren't
      logged, use [gid.soup3.logger.Logger.setRequestFilter] and
      [gid.soup3.logger.Logger.setResponseFilter].
  
      Params:
        level = the debug level
      Returns: a new #SoupLogger
  */
  this(gid.soup3.types.LoggerLogLevel level) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      SoupLogger* _cretval;
      _cretval = soup_logger_new(level);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Get the maximum body size for logger.
      Returns: the maximum body size, or -1 if unlimited
  */
  int getMaxBodySize() nothrow
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
  void setMaxBodySize(int maxBodySize) nothrow
  {
    soup_logger_set_max_body_size(cast(SoupLogger*)this._cPtr, maxBodySize);
  }

  /**
      Sets up an alternate log printing routine, if you don't want
      the log to go to `stdout`.
  
      Params:
        printer = the callback for printing logging output
  */
  void setPrinter(gid.soup3.types.LoggerPrinter printer) nothrow
  {
    extern(C) void _printerCallback(SoupLogger* logger, SoupLoggerLogLevel level, char direction, const(char)* data, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.soup3.types.LoggerPrinter*)userData;
      string _data = data.fromCString!(No.Free);

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.logger.Logger)(cast(void*)logger, No.Take), level, direction, _data);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.types.LoggerPrinter");
      }
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
      level passed to [gid.soup3.logger.Logger.new_].)
  
      Params:
        requestFilter = the callback for request debugging
  */
  void setRequestFilter(gid.soup3.types.LoggerFilter requestFilter) nothrow
  {
    extern(C) SoupLoggerLogLevel _requestFilterCallback(SoupLogger* logger, SoupMessage* msg, void* userData) nothrow
    {
      gidAttachThread();
      gid.soup3.types.LoggerLogLevel _dretval;
      auto _dlg = cast(gid.soup3.types.LoggerFilter*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.logger.Logger)(cast(void*)logger, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.types.LoggerFilter");
      }
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
      the level passed to [gid.soup3.logger.Logger.new_].)
  
      Params:
        responseFilter = the callback for response debugging
  */
  void setResponseFilter(gid.soup3.types.LoggerFilter responseFilter) nothrow
  {
    extern(C) SoupLoggerLogLevel _responseFilterCallback(SoupLogger* logger, SoupMessage* msg, void* userData) nothrow
    {
      gidAttachThread();
      gid.soup3.types.LoggerLogLevel _dretval;
      auto _dlg = cast(gid.soup3.types.LoggerFilter*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.logger.Logger)(cast(void*)logger, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.types.LoggerFilter");
      }
      auto _retval = cast(SoupLoggerLogLevel)_dretval;

      return _retval;
    }
    auto _responseFilterCB = responseFilter ? &_responseFilterCallback : null;
    auto _responseFilter = responseFilter ? freezeDelegate(cast(void*)&responseFilter) : null;
    GDestroyNotify _responseFilterDestroyCB = responseFilter ? &thawDelegate : null;
    soup_logger_set_response_filter(cast(SoupLogger*)this._cPtr, _responseFilterCB, _responseFilter, _responseFilterDestroyCB);
  }
}

/// Fluent builder implementation template for [gid.soup3.logger.Logger]
class LoggerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();

  /**
      Set `level` property.
      Params:
        propval = The level of logging output.
      Returns: Builder instance for fluent chaining
  */
  T level(gid.soup3.types.LoggerLogLevel propval) nothrow
  {
    return setProperty("level", propval);
  }

  /**
      Set `maxBodySize` property.
      Params:
        propval = If [gid.soup3.logger.Logger.level] is [gid.soup3.types.LoggerLogLevel.Body], this gives
          the maximum number of bytes of the body that will be logged.
          (-1 means "no limit".)
      Returns: Builder instance for fluent chaining
  */
  T maxBodySize(int propval) nothrow
  {
    return setProperty("max-body-size", propval);
  }
}

/// Fluent builder for [gid.soup3.logger.Logger]
final class LoggerGidBuilder : LoggerGidBuilderImpl!LoggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Logger build() nothrow
  {
    return new Logger(cast(void*)createGObject(Logger._getGType), Yes.Take);
  }
}
