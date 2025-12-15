/// Module for [AggregatorPad] class
module gstbase.aggregator_pad;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.buffer;
import gst.pad;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Pads managed by a #GstAggregator subclass.
    
    This class used to live in gst-plugins-bad and was moved to core.
*/
class AggregatorPad : gst.pad.Pad
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
    return cast(void function())gst_aggregator_pad_get_type != &gidSymbolNotFound ? gst_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AggregatorPad self()
  {
    return this;
  }

  /**
      Get `emitSignals` property.
      Returns: Enables the emission of signals such as #GstAggregatorPad::buffer-consumed
  */
  @property bool emitSignals()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("emit-signals");
  }

  /**
      Set `emitSignals` property.
      Params:
        propval = Enables the emission of signals such as #GstAggregatorPad::buffer-consumed
  */
  @property void emitSignals(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("emit-signals", propval);
  }

  /**
      Drop the buffer currently queued in pad.
      Returns: TRUE if there was a buffer queued in pad, or FALSE if not.
  */
  bool dropBuffer()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_drop_buffer(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /**
      This checks if a pad has a buffer available that will be returned by
      a call to [gstbase.aggregator_pad.AggregatorPad.peekBuffer] or
      [gstbase.aggregator_pad.AggregatorPad.popBuffer].
      Returns: true if the pad has a buffer available as the next thing.
  */
  bool hasBuffer()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_has_buffer(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /** */
  bool isEos()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_is_eos(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /**
      It is only valid to call this method from #GstAggregatorClass::aggregate()
      Returns: true if the pad is inactive, false otherwise.
          See gst_aggregator_ignore_inactive_pads() for more info.
  */
  bool isInactive()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_is_inactive(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /** */
  gst.buffer.Buffer peekBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_aggregator_pad_peek_buffer(cast(GstAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Steal the ref to the buffer currently queued in pad.
      Returns: The buffer in pad or NULL if no buffer was
          queued. You should unref the buffer after usage.
  */
  gst.buffer.Buffer popBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_aggregator_pad_pop_buffer(cast(GstAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `BufferConsumed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.buffer.Buffer object, gstbase.aggregator_pad.AggregatorPad aggregatorPad))
  
          `object`  (optional)
  
          `aggregatorPad` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBufferConsumed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gst.buffer.Buffer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstbase.aggregator_pad.AggregatorPad)))
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
    return connectSignalClosure("buffer-consumed", closure, after);
  }
}
