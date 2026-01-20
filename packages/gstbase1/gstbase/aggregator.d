/// Module for [Aggregator] class
module gstbase.aggregator;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.allocation_params;
import gst.allocator;
import gst.buffer;
import gst.buffer_list;
import gst.buffer_pool;
import gst.caps;
import gst.element;
import gst.sample;
import gst.segment;
import gst.structure;
import gst.types;
import gstbase.aggregator_pad;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Manages a set of pads with the purpose of aggregating their buffers.
    Control is given to the subclass when all pads have data.
    
     $(LIST
        * Base class for mixers and muxers. Subclasses should at least implement
          the #GstAggregatorClass::aggregate virtual method.
       
        * Installs a #GstPadChainFunction, a #GstPadEventFullFunction and a
          #GstPadQueryFunction to queue all serialized data packets per sink pad.
          Subclasses should not overwrite those, but instead implement
          #GstAggregatorClass::sink_event and #GstAggregatorClass::sink_query as
          needed.
       
        * When data is queued on all pads, the aggregate vmethod is called.
       
        * One can peek at the data on any given GstAggregatorPad with the
          [gstbase.aggregator_pad.AggregatorPad.peekBuffer] method, and remove it from the pad
          with the gst_aggregator_pad_pop_buffer () method. When a buffer
          has been taken with pop_buffer (), a new buffer can be queued
          on that pad.
       
        * When [gstbase.aggregator_pad.AggregatorPad.peekBuffer] or [gstbase.aggregator_pad.AggregatorPad.hasBuffer]
          are called, a reference is taken to the returned buffer, which stays
          valid until either:
       
            - [gstbase.aggregator_pad.AggregatorPad.popBuffer] is called, in which case the caller
              is guaranteed that the buffer they receive is the same as the peeked
              buffer.
            - [gstbase.aggregator_pad.AggregatorPad.dropBuffer] is called, in which case the caller
              is guaranteed that the dropped buffer is the one that was peeked.
            - the subclass implementation of #GstAggregatorClass.aggregate returns.
       
          Subsequent calls to [gstbase.aggregator_pad.AggregatorPad.peekBuffer] or
          [gstbase.aggregator_pad.AggregatorPad.hasBuffer] return / check the same buffer that was
          returned / checked, until one of the conditions listed above is met.
       
          Subclasses are only allowed to call these methods from the aggregate
          thread.
       
        * If the subclass wishes to push a buffer downstream in its aggregate
          implementation, it should do so through the
          [gstbase.aggregator.Aggregator.finishBuffer] method. This method will take care
          of sending and ordering mandatory events such as stream start, caps
          and segment. Buffer lists can also be pushed out with
          [gstbase.aggregator.Aggregator.finishBufferList].
       
        * Same goes for EOS events, which should not be pushed directly by the
          subclass, it should instead return GST_FLOW_EOS in its aggregate
          implementation.
       
        * Note that the aggregator logic regarding gap event handling is to turn
          these into gap buffers with matching PTS and duration. It will also
          flag these buffers with GST_BUFFER_FLAG_GAP and GST_BUFFER_FLAG_DROPPABLE
          to ease their identification and subsequent processing.
          In addition, if the gap event was flagged with GST_GAP_FLAG_MISSING_DATA,
          a custom meta is added to the resulting gap buffer (GstAggregatorMissingDataMeta).
       
        * Subclasses must use (a subclass of) #GstAggregatorPad for both their
          sink and source pads.
          See [gst.element_class.ElementClass.addStaticPadTemplateWithGtype].
     )
       
    This class used to live in gst-plugins-bad and was moved to core.
*/
class Aggregator : gst.element.Element
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
    return cast(void function())gst_aggregator_get_type != &gidSymbolNotFound ? gst_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Aggregator self()
  {
    return this;
  }

  /**
      Get `emitSignals` property.
      Returns: Enables the emission of signals such as #GstAggregator::samples-selected
  */
  @property bool emitSignals()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("emit-signals");
  }

  /**
      Set `emitSignals` property.
      Params:
        propval = Enables the emission of signals such as #GstAggregator::samples-selected
  */
  @property void emitSignals(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("emit-signals", propval);
  }

  /** */
  @property ulong latency()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("latency");
  }

  /** */
  @property void latency(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("latency", propval);
  }

  /**
      Get `minUpstreamLatency` property.
      Returns: Force minimum upstream latency (in nanoseconds). When sources with a
        higher latency are expected to be plugged in dynamically after the
        aggregator has started playing, this allows overriding the minimum
        latency reported by the initial source(s). This is only taken into
        account when larger than the actually reported minimum latency.
  */
  @property ulong minUpstreamLatency()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("min-upstream-latency");
  }

  /**
      Set `minUpstreamLatency` property.
      Params:
        propval = Force minimum upstream latency (in nanoseconds). When sources with a
          higher latency are expected to be plugged in dynamically after the
          aggregator has started playing, this allows overriding the minimum
          latency reported by the initial source(s). This is only taken into
          account when larger than the actually reported minimum latency.
  */
  @property void minUpstreamLatency(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("min-upstream-latency", propval);
  }

  /** */
  @property ulong startTime()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("start-time");
  }

  /** */
  @property void startTime(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("start-time", propval);
  }

  /** */
  @property gstbase.types.AggregatorStartTimeSelection startTimeSelection()
  {
    return gobject.object.ObjectWrap.getProperty!(gstbase.types.AggregatorStartTimeSelection)("start-time-selection");
  }

  /** */
  @property void startTimeSelection(gstbase.types.AggregatorStartTimeSelection propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstbase.types.AggregatorStartTimeSelection)("start-time-selection", propval);
  }

  /**
      This method will push the provided output buffer downstream. If needed,
      mandatory events such as stream-start, caps, and segment events will be
      sent before pushing the buffer.
  
      Params:
        buffer = the #GstBuffer to push.
      Returns: 
  */
  gst.types.FlowReturn finishBuffer(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_aggregator_finish_buffer(cast(GstAggregator*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      This method will push the provided output buffer list downstream. If needed,
      mandatory events such as stream-start, caps, and segment events will be
      sent before pushing the buffer.
  
      Params:
        bufferlist = the #GstBufferList to push.
      Returns: 
  */
  gst.types.FlowReturn finishBufferList(gst.buffer_list.BufferList bufferlist)
  {
    GstFlowReturn _cretval;
    _cretval = gst_aggregator_finish_buffer_list(cast(GstAggregator*)this._cPtr, bufferlist ? cast(GstBufferList*)bufferlist._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Lets #GstAggregator sub-classes get the memory allocator
      acquired by the base class and its params.
      
      Unref the allocator after use it.
  
      Params:
        allocator = the #GstAllocator
          used
        params = the
          #GstAllocationParams of allocator
  */
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    gst_aggregator_get_allocator(cast(GstAggregator*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
  }

  /** */
  gst.buffer_pool.BufferPool getBufferPool()
  {
    GstBufferPool* _cretval;
    _cretval = gst_aggregator_get_buffer_pool(cast(GstAggregator*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Subclasses may use the return value to inform whether they should return
      [gst.types.FlowReturn.Eos] from their aggregate implementation.
      Returns: whether live status was forced on self.
  */
  bool getForceLive()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_get_force_live(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /** */
  bool getIgnoreInactivePads()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_get_ignore_inactive_pads(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the latency values reported by self in response to the latency
      query, or `GST_CLOCK_TIME_NONE` if there is not live source connected and the element
      will not wait for the clock.
      
      Typically only called by subclasses.
      Returns: The latency or `GST_CLOCK_TIME_NONE` if the element does not sync
  */
  gst.types.ClockTime getLatency()
  {
    gst.types.ClockTime _retval;
    _retval = gst_aggregator_get_latency(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Negotiates src pad caps with downstream elements.
      Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again
      if #GstAggregatorClass::negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate()
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_negotiate(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Use this function to determine what input buffers will be aggregated
      to produce the next output buffer. This should only be called from
      a #GstAggregator::samples-selected handler, and can be used to precisely
      control aggregating parameters for a given set of input samples.
  
      Params:
        pad = 
      Returns: The sample that is about to be aggregated. It may hold a #GstBuffer
          or a #GstBufferList. The contents of its info structure is subclass-dependent,
          and documented on a subclass basis. The buffers held by the sample are
          not writable.
  */
  gst.sample.Sample peekNextSample(gstbase.aggregator_pad.AggregatorPad pad)
  {
    GstSample* _cretval;
    _cretval = gst_aggregator_peek_next_sample(cast(GstAggregator*)this._cPtr, pad ? cast(GstAggregatorPad*)pad._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Subclasses should call this when they have prepared the
      buffers they will aggregate for each of their sink pads, but
      before using any of the properties of the pads that govern
      *how* aggregation should be performed, for example z-index
      for video aggregators.
      
      If [gstbase.aggregator.Aggregator.updateSegment] is used by the subclass,
      it MUST be called before [gstbase.aggregator.Aggregator.selectedSamples].
      
      This function MUST only be called from the #GstAggregatorClass::aggregate()
      function.
  
      Params:
        pts = The presentation timestamp of the next output buffer
        dts = The decoding timestamp of the next output buffer
        duration = The duration of the next output buffer
        info = a #GstStructure containing additional information
  */
  void selectedSamples(gst.types.ClockTime pts, gst.types.ClockTime dts, gst.types.ClockTime duration, gst.structure.Structure info)
  {
    gst_aggregator_selected_samples(cast(GstAggregator*)this._cPtr, pts, dts, duration, cast(GstStructure*)&info);
  }

  /**
      Subclasses should call this at construction time in order for self to
      aggregate on a timeout even when no live source is connected.
  
      Params:
        forceLive = 
  */
  void setForceLive(bool forceLive)
  {
    gst_aggregator_set_force_live(cast(GstAggregator*)this._cPtr, forceLive);
  }

  /**
      Subclasses should call this when they don't want to time out
      waiting for a pad that hasn't yet received any buffers in live
      mode.
      
      #GstAggregator will still wait once on each newly-added pad, making
      sure upstream has had a fair chance to start up.
  
      Params:
        ignore = whether inactive pads should not be waited on
  */
  void setIgnoreInactivePads(bool ignore)
  {
    gst_aggregator_set_ignore_inactive_pads(cast(GstAggregator*)this._cPtr, ignore);
  }

  /**
      Lets #GstAggregator sub-classes tell the baseclass what their internal
      latency is. Will also post a LATENCY message on the bus so the pipeline
      can reconfigure its global latency if the values changed.
  
      Params:
        minLatency = minimum latency
        maxLatency = maximum latency
  */
  void setLatency(gst.types.ClockTime minLatency, gst.types.ClockTime maxLatency)
  {
    gst_aggregator_set_latency(cast(GstAggregator*)this._cPtr, minLatency, maxLatency);
  }

  /**
      Sets the caps to be used on the src pad.
  
      Params:
        caps = The #GstCaps to set on the src pad.
  */
  void setSrcCaps(gst.caps.Caps caps)
  {
    gst_aggregator_set_src_caps(cast(GstAggregator*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      This is a simple #GstAggregatorClass::get_next_time implementation that
      just looks at the #GstSegment on the srcpad of the aggregator and bases
      the next time on the running time there.
      
      This is the desired behaviour in most cases where you have a live source
      and you have a dead line based aggregator subclass.
      Returns: The running time based on the position
  */
  gst.types.ClockTime simpleGetNextTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_aggregator_simple_get_next_time(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Subclasses should use this to update the segment on their
      source pad, instead of directly pushing new segment events
      downstream.
      
      Subclasses MUST call this before [gstbase.aggregator.Aggregator.selectedSamples],
      if it is used at all.
  
      Params:
        segment = 
  */
  void updateSegment(gst.segment.Segment segment)
  {
    gst_aggregator_update_segment(cast(GstAggregator*)this._cPtr, cast(const(GstSegment)*)&segment);
  }

  /**
      Connect to `SamplesSelected` signal.
  
      Signals that the #GstAggregator subclass has selected the next set
        of input samples it will aggregate. Handlers may call
        [gstbase.aggregator.Aggregator.peekNextSample] at that point.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.segment.Segment segment, ulong pts, ulong dts, ulong duration, gst.structure.Structure info, gstbase.aggregator.Aggregator aggregator))
  
          `segment` The #GstSegment the next output buffer is part of (optional)
  
          `pts` The presentation timestamp of the next output buffer (optional)
  
          `dts` The decoding timestamp of the next output buffer (optional)
  
          `duration` The duration of the next output buffer (optional)
  
          `info` a #GstStructure containing additional information (optional)
  
          `aggregator` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSamplesSelected(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gst.segment.Segment)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == ulong)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == ulong)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == ulong)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == gst.structure.Structure)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gstbase.aggregator.Aggregator)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 6, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);


      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[5]);

      static if (Parameters!T.length > 5)
        _paramTuple[5] = getVal!(Parameters!T[5])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("samples-selected", closure, after);
  }
}
