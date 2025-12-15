/// Module for [StreamCollection] class
module gst.stream_collection;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.stream;
import gst.types;

/**
    A collection of #GstStream that are available.
    
    A #GstStreamCollection will be provided by elements that can make those
    streams available. Applications can use the collection to show the user
    what streams are available by using %[gst.stream_collection.StreamCollection.getStream]
    
    Once posted, a #GstStreamCollection is immutable. Updates are made by sending
    a new #GstStreamCollection message, which may or may not share some of
    the #GstStream objects from the collection it replaces. The receiver can check
    the sender of a stream collection message to know which collection is
    obsoleted.
    
    Several elements in a pipeline can provide #GstStreamCollection.
    
    Applications can activate streams from a collection by using the
    #GST_EVENT_SELECT_STREAMS event on a pipeline, bin or element.
*/
class StreamCollection : gst.object.ObjectWrap
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
    return cast(void function())gst_stream_collection_get_type != &gidSymbolNotFound ? gst_stream_collection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamCollection self()
  {
    return this;
  }

  /**
      Get `upstreamId` property.
      Returns: stream-id
  */
  @property string upstreamId()
  {
    return getUpstreamId();
  }

  /**
      Set `upstreamId` property.
      Params:
        propval = stream-id
  */
  @property void upstreamId(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("upstream-id", propval);
  }

  /**
      Create a new #GstStreamCollection.
  
      Params:
        upstreamId = The stream id of the parent stream
      Returns: The new #GstStreamCollection.
  */
  this(string upstreamId = null)
  {
    GstStreamCollection* _cretval;
    const(char)* _upstreamId = upstreamId.toCString(No.Alloc);
    _cretval = gst_stream_collection_new(_upstreamId);
    this(_cretval, Yes.Take);
  }

  /**
      Add the given stream to the collection.
  
      Params:
        stream = the #GstStream to add
      Returns: true if the stream was properly added, else false
  */
  bool addStream(gst.stream.Stream stream)
  {
    bool _retval;
    _retval = cast(bool)gst_stream_collection_add_stream(cast(GstStreamCollection*)this._cPtr, stream ? cast(GstStream*)stream._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Get the number of streams this collection contains
      Returns: The number of streams that collection contains
  */
  uint getSize()
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
  gst.stream.Stream getStream(uint index)
  {
    GstStream* _cretval;
    _cretval = gst_stream_collection_get_stream(cast(GstStreamCollection*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.stream.Stream)(cast(GstStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the upstream id of the collection.
      Returns: The upstream id
  */
  string getUpstreamId()
  {
    const(char)* _cretval;
    _cretval = gst_stream_collection_get_upstream_id(cast(GstStreamCollection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Connect to `StreamNotify` signal.
  
      The stream notify signal is used to be notified of property changes to
      streams within the collection.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.stream.Stream propStream, gobject.param_spec.ParamSpec prop, gst.stream_collection.StreamCollection streamCollection))
  
          `propStream` the #GstStream that originated the signal (optional)
  
          `prop` the property that changed (optional)
  
          `streamCollection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStreamNotify(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.stream.Stream)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.param_spec.ParamSpec)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gst.stream_collection.StreamCollection)))
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
    return connectSignalClosure("stream-notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
