/// Module for [AggregatorPad] class
module gid.gstbase1.aggregator_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.pad;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    Pads managed by a #GstAggregator subclass.
    
    This class used to live in gst-plugins-bad and was moved to core.
*/
class AggregatorPad : gid.gst1.pad.Pad
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
    return cast(void function())gst_aggregator_pad_get_type != &gidSymbolNotFound ? gst_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAggregatorPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override AggregatorPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.aggregator_pad.AggregatorPad]
      Returns: New builder object
  */
  static AggregatorPadGidBuilder builder() nothrow
  {
    return new AggregatorPadGidBuilder;
  }

  /**
      Get `currentLevelBuffers` property.
      Returns: The number of currently queued buffers inside this pad
  */
  @property ulong currentLevelBuffers() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("current-level-buffers");
  }

  /**
      Get `currentLevelBytes` property.
      Returns: The number of currently queued bytes inside this pad
  */
  @property ulong currentLevelBytes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("current-level-bytes");
  }

  /**
      Get `currentLevelTime` property.
      Returns: The amount of currently queued time inside this pad
  */
  @property ulong currentLevelTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("current-level-time");
  }

  /**
      Get `emitSignals` property.
      Returns: Enables the emission of signals such as #GstAggregatorPad::buffer-consumed
  */
  @property bool emitSignals() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("emit-signals");
  }

  /**
      Set `emitSignals` property.
      Params:
        propval = Enables the emission of signals such as #GstAggregatorPad::buffer-consumed
  */
  @property void emitSignals(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("emit-signals", propval);
  }

  /**
      Drop the buffer currently queued in pad.
      Returns: TRUE if there was a buffer queued in pad, or FALSE if not.
  */
  bool dropBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_drop_buffer(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /**
      This checks if a pad has a buffer available that will be returned by
      a call to [gid.gstbase1.aggregator_pad.AggregatorPad.peekBuffer] or
      [gid.gstbase1.aggregator_pad.AggregatorPad.popBuffer].
      Returns: true if the pad has a buffer available as the next thing.
  */
  bool hasBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_has_buffer(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /** */
  bool isEos() nothrow
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
  bool isInactive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_pad_is_inactive(cast(GstAggregatorPad*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gst1.buffer.Buffer peekBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_aggregator_pad_peek_buffer(cast(GstAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Steal the ref to the buffer currently queued in pad.
      Returns: The buffer in pad or NULL if no buffer was
          queued. You should unref the buffer after usage.
  */
  gid.gst1.buffer.Buffer popBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_aggregator_pad_pop_buffer(cast(GstAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `BufferConsumed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.buffer.Buffer object, gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad)`
  
          `object`  (optional)
  
          `aggregatorPad` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBufferConsumed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gst1.buffer.Buffer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstbase1.aggregator_pad.AggregatorPad)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator_pad.AggregatorPad.bufferConsumed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("buffer-consumed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gstbase1.aggregator_pad.AggregatorPad]
class AggregatorPadGidBuilderImpl(T) : gid.gst1.pad.PadGidBuilderImpl!T
{

  /**
      Set `emitSignals` property.
      Params:
        propval = Enables the emission of signals such as #GstAggregatorPad::buffer-consumed
      Returns: Builder instance for fluent chaining
  */
  T emitSignals(bool propval) nothrow
  {
    return setProperty("emit-signals", propval);
  }
}

/// Fluent builder for [gid.gstbase1.aggregator_pad.AggregatorPad]
final class AggregatorPadGidBuilder : AggregatorPadGidBuilderImpl!AggregatorPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AggregatorPad build() nothrow
  {
    return new AggregatorPad(cast(void*)createGObject(AggregatorPad._getGType), Yes.Take);
  }
}
