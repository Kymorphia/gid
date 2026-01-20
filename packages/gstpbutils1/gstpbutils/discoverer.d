/// Module for [Discoverer] class
module gstpbutils.discoverer;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gst.element;
import gst.types;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_info;
import gstpbutils.types;

/**
    The #GstDiscoverer is a utility object which allows to get as much
    information as possible from one or many URIs.
    
    It provides two APIs, allowing usage in blocking or non-blocking mode.
    
    The blocking mode just requires calling [gstpbutils.discoverer.Discoverer.discoverUri]
    with the URI one wishes to discover.
    
    The non-blocking mode requires a running #GMainLoop iterating a
    #GMainContext, where one connects to the various signals, appends the
    URIs to be processed (through [gstpbutils.discoverer.Discoverer.discoverUriAsync]) and then
    asks for the discovery to begin (through [gstpbutils.discoverer.Discoverer.start]).
    By default this will use the GLib default main context unless you have
    set a custom context using [glib.main_context.MainContext.pushThreadDefault].
    
    All the information is returned in a #GstDiscovererInfo structure.
*/
class Discoverer : gobject.object.ObjectWrap
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
    return cast(void function())gst_discoverer_get_type != &gidSymbolNotFound ? gst_discoverer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Discoverer self()
  {
    return this;
  }

  /**
      Get `timeout` property.
      Returns: The duration (in nanoseconds) after which the discovery of an individual
        URI will timeout.
        
        If the discovery of a URI times out, the [gstpbutils.types.DiscovererResult.Timeout] will be
        set on the result flags.
  */
  @property ulong timeout()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("timeout");
  }

  /**
      Set `timeout` property.
      Params:
        propval = The duration (in nanoseconds) after which the discovery of an individual
          URI will timeout.
          
          If the discovery of a URI times out, the [gstpbutils.types.DiscovererResult.Timeout] will be
          set on the result flags.
  */
  @property void timeout(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("timeout", propval);
  }

  /** */
  @property bool useCache()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-cache");
  }

  /** */
  @property void useCache(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-cache", propval);
  }

  /**
      Creates a new #GstDiscoverer with the provided timeout.
  
      Params:
        timeout = timeout per file, in nanoseconds. Allowed are values between
              one second (#GST_SECOND) and one hour (3600 * #GST_SECOND)
      Returns: The new #GstDiscoverer.
        If an error occurred when creating the discoverer, err will be set
        accordingly and null will be returned. If err is set, the caller must
        free it when no longer needed using [glib.error.ErrorWrap.free].
      Throws: [ErrorWrap]
  */
  this(gst.types.ClockTime timeout)
  {
    GstDiscoverer* _cretval;
    GError *_err;
    _cretval = gst_discoverer_new(timeout, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Synchronously discovers the given uri.
      
      A copy of uri will be made internally, so the caller can safely [glib.global.gfree]
      afterwards.
  
      Params:
        uri = The URI to run on.
      Returns: the result of the scanning. Can be null if an
        error occurred.
      Throws: [ErrorWrap]
  */
  gstpbutils.discoverer_info.DiscovererInfo discoverUri(string uri)
  {
    GstDiscovererInfo* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = gst_discoverer_discover_uri(cast(GstDiscoverer*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends the given uri to the list of URIs to discoverer. The actual
      discovery of the uri will only take place if [gstpbutils.discoverer.Discoverer.start] has
      been called.
      
      A copy of uri will be made internally, so the caller can safely [glib.global.gfree]
      afterwards.
  
      Params:
        uri = the URI to add.
      Returns: true if the uri was successfully appended to the list of pending
        uris, else false
  */
  bool discoverUriAsync(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = cast(bool)gst_discoverer_discover_uri_async(cast(GstDiscoverer*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Allow asynchronous discovering of URIs to take place.
      A #GMainLoop must be available for #GstDiscoverer to properly work in
      asynchronous mode.
  */
  void start()
  {
    gst_discoverer_start(cast(GstDiscoverer*)this._cPtr);
  }

  /**
      Stop the discovery of any pending URIs and clears the list of
      pending URIS (if any).
  */
  void stop()
  {
    gst_discoverer_stop(cast(GstDiscoverer*)this._cPtr);
  }

  /**
      Connect to `Discovered` signal.
  
      Will be emitted in async mode when all information on a URI could be
        discovered, or an error occurred.
        
        When an error occurs, info might still contain some partial information,
        depending on the circumstances of the error.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstpbutils.discoverer_info.DiscovererInfo info, glib.error.ErrorWrap error, gstpbutils.discoverer.Discoverer discoverer))
  
          `info` the results #GstDiscovererInfo (optional)
  
          `error` #GError, which will be non-NULL
                                                    if an error occurred during
                                                    discovery. You must not free
                                                    this #GError, it will be freed by
                                                    the discoverer. (optional)
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDiscovered(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstpbutils.discoverer_info.DiscovererInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstpbutils.discoverer.Discoverer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("discovered", closure, after);
  }

  /**
      Connect to `Finished` signal.
  
      Will be emitted in async mode when all pending URIs have been processed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstpbutils.discoverer.Discoverer discoverer))
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstpbutils.discoverer.Discoverer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
      Connect to `LoadSerializedInfo` signal.
  
      Retrieves information about a URI from and external source of information,
        like a cache file. This is used by the discoverer to speed up the
        discovery.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gstpbutils.discoverer_info.DiscovererInfo callback(string uri, gstpbutils.discoverer.Discoverer discoverer))
  
          `uri` THe URI to load the serialized info for (optional)
  
          `discoverer` the instance the signal is connected to (optional)
  
          `Returns` The #GstDiscovererInfo representing
            uri, or null if no information
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLoadSerializedInfo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gstpbutils.discoverer_info.DiscovererInfo)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstpbutils.discoverer.Discoverer)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gstpbutils.discoverer_info.DiscovererInfo)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("load-serialized-info", closure, after);
  }

  /**
      Connect to `SourceSetup` signal.
  
      This signal is emitted after the source element has been created for, so
        the URI being discovered, so it can be configured by setting additional
        properties (e.g. set a proxy server for an http source, or set the device
        and read speed for an audio cd source).
        
        This signal is usually emitted from the context of a GStreamer streaming
        thread.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.element.Element source, gstpbutils.discoverer.Discoverer discoverer))
  
          `source` source element (optional)
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSourceSetup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.element.Element)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstpbutils.discoverer.Discoverer)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-setup", closure, after);
  }

  /**
      Connect to `Starting` signal.
  
      Will be emitted when the discover starts analyzing the pending URIs
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstpbutils.discoverer.Discoverer discoverer))
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStarting(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstpbutils.discoverer.Discoverer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("starting", closure, after);
  }
}
