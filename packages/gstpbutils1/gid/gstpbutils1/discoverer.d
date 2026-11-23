/// Module for [Discoverer] class
module gid.gstpbutils1.discoverer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.element;
import gid.gst1.types;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.discoverer_info;
import gid.gstpbutils1.types;

/**
    The #GstDiscoverer is a utility object which allows to get as much
    information as possible from one or many URIs.
    
    It provides two APIs, allowing usage in blocking or non-blocking mode.
    
    The blocking mode just requires calling [gid.gstpbutils1.discoverer.Discoverer.discoverUri]
    with the URI one wishes to discover.
    
    The non-blocking mode requires a running #GMainLoop iterating a
    #GMainContext, where one connects to the various signals, appends the
    URIs to be processed (through [gid.gstpbutils1.discoverer.Discoverer.discoverUriAsync]) and then
    asks for the discovery to begin (through [gid.gstpbutils1.discoverer.Discoverer.start]).
    By default this will use the GLib default main context unless you have
    set a custom context using [gid.glib2.main_context.MainContext.pushThreadDefault].
    
    All the information is returned in a #GstDiscovererInfo structure.
*/
class Discoverer : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gst_discoverer_get_type != &gidSymbolNotFound ? gst_discoverer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDiscoverer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Discoverer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.discoverer.Discoverer]
      Returns: New builder object
  */
  static DiscovererGidBuilder builder() nothrow
  {
    return new DiscovererGidBuilder;
  }

  /**
      Get `timeout` property.
      Returns: The duration (in nanoseconds) after which the discovery of an individual
        URI will timeout.
        
        If the discovery of a URI times out, the [gid.gstpbutils1.types.DiscovererResult.Timeout] will be
        set on the result flags.
  */
  @property ulong timeout() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("timeout");
  }

  /**
      Set `timeout` property.
      Params:
        propval = The duration (in nanoseconds) after which the discovery of an individual
          URI will timeout.
          
          If the discovery of a URI times out, the [gid.gstpbutils1.types.DiscovererResult.Timeout] will be
          set on the result flags.
  */
  @property void timeout(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("timeout", propval);
  }

  /** */
  @property bool useCache() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-cache");
  }

  /** */
  @property void useCache(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("use-cache", propval);
  }

  /**
      Creates a new #GstDiscoverer with the provided timeout.
  
      Params:
        timeout = timeout per file, in nanoseconds. Allowed are values between
              one second (#GST_SECOND) and one hour (3600 * #GST_SECOND)
      Returns: The new #GstDiscoverer.
        If an error occurred when creating the discoverer, err will be set
        accordingly and null will be returned. If err is set, the caller must
        free it when no longer needed using [gid.glib2.error.ErrorWrap.free].
      Throws: [ErrorWrap]
  */
  this(gid.gst1.types.ClockTime timeout)
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstDiscoverer* _cretval;
      GError *_err;
      _cretval = gst_discoverer_new(timeout, &_err);
      if (_err)
        throw new ErrorWrap(_err, Yes.Take);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncDiscovered(gid.gstpbutils1.discoverer_info.DiscovererInfo info, gid.glib2.error.ErrorWrap err)
  {
    auto _klass = cast(GstDiscovererClass*)_vfuncClass;
    if (!_klass.discovered)
      return;

    _klass.discovered(cast(GstDiscoverer*)this._cPtr, info ? cast(GstDiscovererInfo*)info._cPtr(No.Dup) : null, err ? cast(const(GError)*)err._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncFinished()
  {
    auto _klass = cast(GstDiscovererClass*)_vfuncClass;
    if (!_klass.finished)
      return;

    _klass.finished(cast(GstDiscoverer*)this._cPtr);
  }

  /**
      Loads the serialized info from the given uri.
  
      Params:
        uri = the uri to load the info from
      Returns: the #GstDiscovererInfo or null if it could not be loaded
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLoadSerializeInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gstpbutils1.discoverer_info.DiscovererInfo vfuncLoadSerializeInfo(string uri)
  {
    auto _klass = cast(GstDiscovererClass*)_vfuncClass;
    if (!_klass.loadSerializeInfo)
      return typeof(return).init;

    GstDiscovererInfo* _cretval;
    char* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.loadSerializeInfo(cast(GstDiscoverer*)this._cPtr, _uri);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncSourceSetup(gid.gst1.element.Element source)
  {
    auto _klass = cast(GstDiscovererClass*)_vfuncClass;
    if (!_klass.sourceSetup)
      return;

    _klass.sourceSetup(cast(GstDiscoverer*)this._cPtr, source ? cast(GstElement*)source._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncStarting()
  {
    auto _klass = cast(GstDiscovererClass*)_vfuncClass;
    if (!_klass.starting)
      return;

    _klass.starting(cast(GstDiscoverer*)this._cPtr);
  }

  /**
      Synchronously discovers the given uri.
      
      A copy of uri will be made internally, so the caller can safely [gid.glib2.global.gfree]
      afterwards.
  
      Params:
        uri = The URI to run on.
      Returns: the result of the scanning. Can be null if an
        error occurred.
      Throws: [ErrorWrap]
  */
  gid.gstpbutils1.discoverer_info.DiscovererInfo discoverUri(string uri)
  {
    GstDiscovererInfo* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gst_discoverer_discover_uri(cast(GstDiscoverer*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends the given uri to the list of URIs to discoverer. The actual
      discovery of the uri will only take place if [gid.gstpbutils1.discoverer.Discoverer.start] has
      been called.
      
      A copy of uri will be made internally, so the caller can safely [gid.glib2.global.gfree]
      afterwards.
  
      Params:
        uri = the URI to add.
      Returns: true if the uri was successfully appended to the list of pending
        uris, else false
  */
  bool discoverUriAsync(string uri) nothrow
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_discoverer_discover_uri_async(cast(GstDiscoverer*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Allow asynchronous discovering of URIs to take place.
      A #GMainLoop must be available for #GstDiscoverer to properly work in
      asynchronous mode.
  */
  void start() nothrow
  {
    gst_discoverer_start(cast(GstDiscoverer*)this._cPtr);
  }

  /**
      Stop the discovery of any pending URIs and clears the list of
      pending URIS (if any).
  */
  void stop() nothrow
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
  
          `void callback(gid.gstpbutils1.discoverer_info.DiscovererInfo info, gid.glib2.error.ErrorWrap error, gid.gstpbutils1.discoverer.Discoverer discoverer)`
  
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
  gulong connectDiscovered(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstpbutils1.discoverer_info.DiscovererInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.glib2.error.ErrorWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gstpbutils1.discoverer.Discoverer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.discovered");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("discovered", closure, after);
  }

  /**
      Connect to `Finished` signal.
  
      Will be emitted in async mode when all pending URIs have been processed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstpbutils1.discoverer.Discoverer discoverer)`
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstpbutils1.discoverer.Discoverer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.finished");
      }
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
  
          `gid.gstpbutils1.discoverer_info.DiscovererInfo callback(string uri, gid.gstpbutils1.discoverer.Discoverer discoverer)`
  
          `uri` THe URI to load the serialized info for (optional)
  
          `discoverer` the instance the signal is connected to (optional)
  
          `Returns` The #GstDiscovererInfo representing
            uri, or null if no information
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLoadSerializedInfo(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gstpbutils1.discoverer_info.DiscovererInfo)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstpbutils1.discoverer.Discoverer)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gstpbutils1.discoverer_info.DiscovererInfo _retval;

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
        gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.loadSerializedInfo");
      }

      setVal!(gid.gstpbutils1.discoverer_info.DiscovererInfo)(_returnValue, _retval);
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
  
          `void callback(gid.gst1.element.Element source, gid.gstpbutils1.discoverer.Discoverer discoverer)`
  
          `source` source element (optional)
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSourceSetup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gst1.element.Element)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstpbutils1.discoverer.Discoverer)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.sourceSetup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-setup", closure, after);
  }

  /**
      Connect to `Starting` signal.
  
      Will be emitted when the discover starts analyzing the pending URIs
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstpbutils1.discoverer.Discoverer discoverer)`
  
          `discoverer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStarting(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstpbutils1.discoverer.Discoverer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.starting");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("starting", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Discoverer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstpbutils1.discoverer.Discoverer), T.stringof ~ " is not derived from gid.gstpbutils1.discoverer.Discoverer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDiscovered", true)[0]) == gid.gstpbutils1.discoverer.Discoverer))
      _installVfunc(klass, "discovered");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFinished", true)[0]) == gid.gstpbutils1.discoverer.Discoverer))
      _installVfunc(klass, "finished");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLoadSerializeInfo", true)[0]) == gid.gstpbutils1.discoverer.Discoverer))
      _installVfunc(klass, "load_serialize_info");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSourceSetup", true)[0]) == gid.gstpbutils1.discoverer.Discoverer))
      _installVfunc(klass, "source_setup");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStarting", true)[0]) == gid.gstpbutils1.discoverer.Discoverer))
      _installVfunc(klass, "starting");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstDiscovererClass*)klass;

    switch (vfunc)
    {
      case "discovered":
      {
        static extern(C) void _vfuncDiscoveredTramp(GstDiscoverer* discoverer, GstDiscovererInfo* info, const(GError)* err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.discoverer.Discoverer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)discoverer);
          if (!_obj)
          {
            auto _klass = cast(GstDiscovererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)discoverer);
            if (_klass.discovered)
              return (cast(typeof(&_vfuncDiscoveredTramp))_klass.discovered)(discoverer, info, err);
            return;
          }

          try
          {
            _obj.vfuncDiscovered(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_info.DiscovererInfo)(cast(void*)info, No.Take), err ? new gid.glib2.error.ErrorWrap(cast(void*)err, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.vfuncDiscovered");
          }
        }

        _klass.discovered = cast(typeof(_klass.discovered))&_vfuncDiscoveredTramp;
        break;
      }
      case "finished":
      {
        static extern(C) void _vfuncFinishedTramp(GstDiscoverer* discoverer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.discoverer.Discoverer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)discoverer);
          if (!_obj)
          {
            auto _klass = cast(GstDiscovererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)discoverer);
            if (_klass.finished)
              return (cast(typeof(&_vfuncFinishedTramp))_klass.finished)(discoverer);
            return;
          }

          try
          {
            _obj.vfuncFinished();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.vfuncFinished");
          }
        }

        _klass.finished = cast(typeof(_klass.finished))&_vfuncFinishedTramp;
        break;
      }
      case "load_serialize_info":
      {
        static extern(C) GstDiscovererInfo* _vfuncLoadSerializeInfoTramp(GstDiscoverer* dc, char* uri) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.discoverer.Discoverer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)dc);
          if (!_obj)
          {
            auto _klass = cast(GstDiscovererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dc);
            if (_klass.loadSerializeInfo)
              return (cast(typeof(&_vfuncLoadSerializeInfoTramp))_klass.loadSerializeInfo)(dc, uri);
            return typeof(return).init;
          }

          gid.gstpbutils1.discoverer_info.DiscovererInfo _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLoadSerializeInfo(_uri);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.vfuncLoadSerializeInfo");
          }
          auto _retval = _dretval ? cast(GstDiscovererInfo*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.loadSerializeInfo = cast(typeof(_klass.loadSerializeInfo))&_vfuncLoadSerializeInfoTramp;
        break;
      }
      case "source_setup":
      {
        static extern(C) void _vfuncSourceSetupTramp(GstDiscoverer* discoverer, GstElement* source) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.discoverer.Discoverer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)discoverer);
          if (!_obj)
          {
            auto _klass = cast(GstDiscovererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)discoverer);
            if (_klass.sourceSetup)
              return (cast(typeof(&_vfuncSourceSetupTramp))_klass.sourceSetup)(discoverer, source);
            return;
          }

          try
          {
            _obj.vfuncSourceSetup(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(void*)source, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.vfuncSourceSetup");
          }
        }

        _klass.sourceSetup = cast(typeof(_klass.sourceSetup))&_vfuncSourceSetupTramp;
        break;
      }
      case "starting":
      {
        static extern(C) void _vfuncStartingTramp(GstDiscoverer* discoverer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.discoverer.Discoverer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)discoverer);
          if (!_obj)
          {
            auto _klass = cast(GstDiscovererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)discoverer);
            if (_klass.starting)
              return (cast(typeof(&_vfuncStartingTramp))_klass.starting)(discoverer);
            return;
          }

          try
          {
            _obj.vfuncStarting();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.discoverer.Discoverer.vfuncStarting");
          }
        }

        _klass.starting = cast(typeof(_klass.starting))&_vfuncStartingTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.discoverer.Discoverer]
class DiscovererGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `timeout` property.
      Params:
        propval = The duration (in nanoseconds) after which the discovery of an individual
          URI will timeout.
          
          If the discovery of a URI times out, the [gid.gstpbutils1.types.DiscovererResult.Timeout] will be
          set on the result flags.
      Returns: Builder instance for fluent chaining
  */
  T timeout(ulong propval) nothrow
  {
    return setProperty("timeout", propval);
  }

  /** */
  T useCache(bool propval) nothrow
  {
    return setProperty("use-cache", propval);
  }
}

/// Fluent builder for [gid.gstpbutils1.discoverer.Discoverer]
final class DiscovererGidBuilder : DiscovererGidBuilderImpl!DiscovererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Discoverer build() nothrow
  {
    return new Discoverer(cast(void*)createGObject(Discoverer._getGType), Yes.Take);
  }
}
