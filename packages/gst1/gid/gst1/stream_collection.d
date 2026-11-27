/// Module for [StreamCollection] class
module gid.gst1.stream_collection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.param_spec;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.stream;
import gid.gst1.types;

/**
    A collection of #GstStream that are available.
    
    A #GstStreamCollection will be provided by elements that can make those
    streams available. Applications can use the collection to show the user
    what streams are available by using %[gid.gst1.stream_collection.StreamCollection.getStream]
    
    Once posted, a #GstStreamCollection is immutable. Updates are made by sending
    a new #GstStreamCollection message, which may or may not share some of
    the #GstStream objects from the collection it replaces. The receiver can check
    the sender of a stream collection message to know which collection is
    obsoleted.
    
    Several elements in a pipeline can provide #GstStreamCollection.
    
    Applications can activate streams from a collection by using the
    #GST_EVENT_SELECT_STREAMS event on a pipeline, bin or element.
*/
@gidGir("StreamCollection", "StreamCollectionClass")
class StreamCollection : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_stream_collection_get_type != &gidSymbolNotFound ? gst_stream_collection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstStreamCollection";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamCollection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.stream_collection.StreamCollection]
      Returns: New builder object
  */
  static StreamCollectionGidBuilder builder() nothrow
  {
    return new StreamCollectionGidBuilder;
  }

  /**
      Get `upstreamId` property.
      Returns: stream-id
  */
  @property string upstreamId() nothrow
  {
    return getUpstreamId();
  }

  /**
      Set `upstreamId` property.
      Params:
        propval = stream-id
  */
  @property void upstreamId(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("upstream-id", propval);
  }

  /**
      Create a new #GstStreamCollection.
  
      Params:
        upstreamId = The stream id of the parent stream
      Returns: The new #GstStreamCollection.
  */
  this(string upstreamId = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, upstreamId !is null), Yes.Take);
    }
    else
    {
      GstStreamCollection* _cretval;
      const(char)* _upstreamId = upstreamId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_stream_collection_new(_upstreamId);
      this(_cretval, Yes.Take);
    }
  }

  /**
      default signal handler for the stream-notify signal
  
      Params:
        stream = 
        pspec = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStreamNotify` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStreamNotify(gid.gst1.stream.Stream stream, gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(GstStreamCollectionClass*)_vfuncClass;
    if (!_klass.streamNotify)
      return;

    _klass.streamNotify(cast(GstStreamCollection*)this._cPtr, stream ? cast(GstStream*)stream._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Add the given stream to the collection.
  
      Params:
        stream = the #GstStream to add
      Returns: true if the stream was properly added, else false
  */
  bool addStream(gid.gst1.stream.Stream stream) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_stream_collection_add_stream(cast(GstStreamCollection*)this._cPtr, stream ? cast(GstStream*)stream._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Get the number of streams this collection contains
      Returns: The number of streams that collection contains
  */
  uint getSize() nothrow
  {
    uint _retval;
    _retval = gst_stream_collection_get_size(cast(GstStreamCollection*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the #GstStream with index index from the collection.
      
      The caller should not modify the returned #GstStream
  
      Params:
        index = Index of the stream to retrieve
      Returns: A #GstStream
  */
  gid.gst1.stream.Stream getStream(uint index) nothrow
  {
    GstStream* _cretval;
    _cretval = gst_stream_collection_get_stream(cast(GstStreamCollection*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.stream.Stream)(cast(GstStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the upstream id of the collection.
      Returns: The upstream id
  */
  string getUpstreamId() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_stream_collection_get_upstream_id(cast(GstStreamCollection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Connect to `StreamNotify` signal.
  
      The stream notify signal is used to be notified of property changes to
        streams within the collection.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.stream.Stream propStream, gid.gobject2.param_spec.ParamSpec prop, gid.gst1.stream_collection.StreamCollection streamCollection)`
  
          `propStream` the #GstStream that originated the signal (optional)
  
          `prop` the property that changed (optional)
  
          `streamCollection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStreamNotify(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gst1.stream.Stream)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gobject2.param_spec.ParamSpec)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gst1.stream_collection.StreamCollection)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.stream_collection.StreamCollection.streamNotify");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stream-notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from StreamCollection
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.stream_collection.StreamCollection), T.stringof ~ " is not derived from gid.gst1.stream_collection.StreamCollection");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStreamNotify", true)[0]) == gid.gst1.stream_collection.StreamCollection))
      _installVfunc(klass, "stream_notify");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstStreamCollectionClass*)klass;

    switch (vfunc)
    {
      case "stream_notify":
      {
        static extern(C) void _vfuncStreamNotifyTramp(GstStreamCollection* collection, GstStream* stream, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gst1.stream_collection.StreamCollection)(cast(void*)collection);
          if (!_obj)
          {
            auto _klass = cast(GstStreamCollectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)collection);
            if (_klass.streamNotify)
              return (cast(typeof(&_vfuncStreamNotifyTramp))_klass.streamNotify)(collection, stream, pspec);
            return;
          }

          try
          {
            _obj.vfuncStreamNotify(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.stream.Stream)(cast(void*)stream, No.Take), pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.stream_collection.StreamCollection.vfuncStreamNotify");
          }
        }

        _klass.streamNotify = cast(typeof(_klass.streamNotify))&_vfuncStreamNotifyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.stream_collection.StreamCollection]
class StreamCollectionGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `upstreamId` property.
      Params:
        propval = stream-id
      Returns: Builder instance for fluent chaining
  */
  T upstreamId(string propval) nothrow
  {
    return setProperty("upstream-id", propval);
  }
}

/// Fluent builder for [gid.gst1.stream_collection.StreamCollection]
final class StreamCollectionGidBuilder : StreamCollectionGidBuilderImpl!StreamCollectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamCollection build() nothrow
  {
    return new StreamCollection(cast(void*)createGObject(StreamCollection._getGType), Yes.Take);
  }
}
