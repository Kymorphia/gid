/// Module for [Aggregator] class
module gid.gstbase1.aggregator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocation_params;
import gid.gst1.allocator;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.buffer_pool;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.pad_template;
import gid.gst1.query;
import gid.gst1.sample;
import gid.gst1.segment;
import gid.gst1.structure;
import gid.gst1.types;
import gid.gstbase1.aggregator_pad;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    Manages a set of pads with the purpose of aggregating their buffers.
    Control is given to the subclass when all pads have data.
    
     * Base class for mixers and muxers. Subclasses should at least implement
       the #GstAggregatorClass::aggregate virtual method.
    
     * Installs a #GstPadChainFunction, a #GstPadEventFullFunction and a
       #GstPadQueryFunction to queue all serialized data packets per sink pad.
       Subclasses should not overwrite those, but instead implement
       #GstAggregatorClass::sink_event and #GstAggregatorClass::sink_query as
       needed.
    
     * When data is queued on all pads, the aggregate vmethod is called.
    
     * One can peek at the data on any given GstAggregatorPad with the
       [gid.gstbase1.aggregator_pad.AggregatorPad.peekBuffer] method, and remove it from the pad
       with the gst_aggregator_pad_pop_buffer () method. When a buffer
       has been taken with pop_buffer (), a new buffer can be queued
       on that pad.
    
     * When [gid.gstbase1.aggregator_pad.AggregatorPad.peekBuffer] or [gid.gstbase1.aggregator_pad.AggregatorPad.hasBuffer]
       are called, a reference is taken to the returned buffer, which stays
       valid until either:
    
         - [gid.gstbase1.aggregator_pad.AggregatorPad.popBuffer] is called, in which case the caller
           is guaranteed that the buffer they receive is the same as the peeked
           buffer.
         - [gid.gstbase1.aggregator_pad.AggregatorPad.dropBuffer] is called, in which case the caller
           is guaranteed that the dropped buffer is the one that was peeked.
         - the subclass implementation of #GstAggregatorClass.aggregate returns.
    
       Subsequent calls to [gid.gstbase1.aggregator_pad.AggregatorPad.peekBuffer] or
       [gid.gstbase1.aggregator_pad.AggregatorPad.hasBuffer] return / check the same buffer that was
       returned / checked, until one of the conditions listed above is met.
    
       Subclasses are only allowed to call these methods from the aggregate
       thread.
    
     * If the subclass wishes to push a buffer downstream in its aggregate
       implementation, it should do so through the
       [gid.gstbase1.aggregator.Aggregator.finishBuffer] method. This method will take care
       of sending and ordering mandatory events such as stream start, caps
       and segment. Buffer lists can also be pushed out with
       [gid.gstbase1.aggregator.Aggregator.finishBufferList].
    
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
       See [gid.gst1.element_class.ElementClass.addStaticPadTemplateWithGtype].
    
    This class used to live in gst-plugins-bad and was moved to core.
*/
class Aggregator : gid.gst1.element.Element
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_aggregator_get_type != &gidSymbolNotFound ? gst_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAggregator";
  }

  /** Returns `this`, for use in `with` statements. */
  override Aggregator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.aggregator.Aggregator]
      Returns: New builder object
  */
  static AggregatorGidBuilder builder() nothrow
  {
    return new AggregatorGidBuilder;
  }

  /**
      Get `emitSignals` property.
      Returns: Enables the emission of signals such as #GstAggregator::samples-selected
  */
  @property bool emitSignals() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("emit-signals");
  }

  /**
      Set `emitSignals` property.
      Params:
        propval = Enables the emission of signals such as #GstAggregator::samples-selected
  */
  @property void emitSignals(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("emit-signals", propval);
  }

  /** */
  @property ulong latency() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("latency");
  }

  /** */
  @property void latency(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("latency", propval);
  }

  /**
      Get `minUpstreamLatency` property.
      Returns: Force minimum upstream latency (in nanoseconds). When sources with a
        higher latency are expected to be plugged in dynamically after the
        aggregator has started playing, this allows overriding the minimum
        latency reported by the initial source(s). This is only taken into
        account when larger than the actually reported minimum latency.
  */
  @property ulong minUpstreamLatency() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("min-upstream-latency");
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
  @property void minUpstreamLatency(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("min-upstream-latency", propval);
  }

  /** */
  @property ulong startTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("start-time");
  }

  /** */
  @property void startTime(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("start-time", propval);
  }

  /** */
  @property gid.gstbase1.types.AggregatorStartTimeSelection startTimeSelection() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstbase1.types.AggregatorStartTimeSelection)("start-time-selection");
  }

  /** */
  @property void startTimeSelection(gid.gstbase1.types.AggregatorStartTimeSelection propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstbase1.types.AggregatorStartTimeSelection)("start-time-selection", propval);
  }

  /**
      Mandatory.
                       Called when buffers are queued on all sinkpads. Classes
                       should iterate the GstElement->sinkpads and peek or steal
                       buffers from the #GstAggregatorPads. If the subclass returns
                       GST_FLOW_EOS, sending of the eos event will be taken care
                       of. Once / if a buffer has been constructed from the
                       aggregated buffers, the subclass should call _finish_buffer.
  
      Params:
        timeout = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAggregate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncAggregate(bool timeout)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.aggregate)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.aggregate(cast(GstAggregator*)this._cPtr, timeout);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Called when a buffer is received on a sink pad, the task of
      clipping it and translating it to the current segment falls
      on the subclass. The function should use the segment of data
      and the negotiated media type on the pad to perform
      clipping of input buffer. This function takes ownership of
      buf and should output a buffer or return NULL in
      if the buffer should be dropped.
  
      Params:
        aggregatorPad = a #GstAggregatorPad
        buf = a #GstBuffer
      Returns: a #GstBuffer.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClip` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncClip(gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad, gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.clip)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.clip(cast(GstAggregator*)this._cPtr, aggregatorPad ? cast(GstAggregatorPad*)aggregatorPad._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Called when a new pad needs to be created. Allows subclass that
      don't have a single sink pad template to provide a pad based
      on the provided information.
  
      Params:
        templ = the pad template to use
        reqName = requested pad name
        caps = caps for the pad
      Returns: a new #GstAggregatorPad.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateNewPad` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gstbase1.aggregator_pad.AggregatorPad vfuncCreateNewPad(gid.gst1.pad_template.PadTemplate templ, string reqName = null, gid.gst1.caps.Caps caps = null)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.createNewPad)
      return typeof(return).init;

    GstAggregatorPad* _cretval;
    const(char)* _reqName = reqName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = _klass.createNewPad(cast(GstAggregator*)this._cPtr, templ ? cast(GstPadTemplate*)templ._cPtr(No.Dup) : null, _reqName, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(GstAggregatorPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Optional.
                          Allows the subclass to influence the allocation choices.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDecideAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncDecideAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstAggregator*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This method will push the provided output buffer downstream. If needed,
      mandatory events such as stream-start, caps, and segment events will be
      sent before pushing the buffer.
  
      Params:
        buffer = the #GstBuffer to push.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFinishBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFinishBuffer(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.finishBuffer)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.finishBuffer(cast(GstAggregator*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      This method will push the provided output buffer list downstream. If needed,
      mandatory events such as stream-start, caps, and segment events will be
      sent before pushing the buffer.
  
      Params:
        bufferlist = the #GstBufferList to push.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFinishBufferList` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFinishBufferList(gid.gst1.buffer_list.BufferList bufferlist)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.finishBufferList)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.finishBufferList(cast(GstAggregator*)this._cPtr, bufferlist ? cast(GstBufferList*)bufferlist._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Fixate and return the src pad caps provided. The function takes
      ownership of caps and returns a fixated version of
      caps. caps is not guaranteed to be writable.
  
      Params:
        caps = a #GstCaps to fixate
      Returns: the fixated caps #GstCaps.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFixateSrcCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncFixateSrcCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.fixateSrcCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.fixateSrcCaps(cast(GstAggregator*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Optional.
                       Called after a successful flushing seek, once all the flush
                       stops have been received. Flush pad-specific data in
                       #GstAggregatorPad->flush.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFlush()
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.flush)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.flush(cast(GstAggregator*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                       Called when the element needs to know the running time of the next
                       rendered buffer for live pipelines. This causes deadline
                       based aggregation to occur. Defaults to returning
                       GST_CLOCK_TIME_NONE causing the element to wait for buffers
                       on all sink pads before aggregating.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNextTime` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.ClockTime vfuncGetNextTime()
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.getNextTime)
      return typeof(return).init;

    gid.gst1.types.ClockTime _retval;
    _retval = _klass.getNextTime(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Negotiates src pad caps with downstream elements.
      Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again
      if #GstAggregatorClass::negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNegotiate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncNegotiate()
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.negotiate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiate(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                            Notifies subclasses what caps format has been negotiated
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNegotiatedSrcCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncNegotiatedSrcCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.negotiatedSrcCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiatedSrcCaps(cast(GstAggregator*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Use this function to determine what input buffers will be aggregated
      to produce the next output buffer. This should only be called from
      a #GstAggregator::samples-selected handler, and can be used to precisely
      control aggregating parameters for a given set of input samples.
  
      Params:
        aggregatorPad = a #GstAggregatorPad
      Returns: The sample that is about to be aggregated. It may hold a #GstBuffer
          or a #GstBufferList. The contents of its info structure is subclass-dependent,
          and documented on a subclass basis. The buffers held by the sample are
          not writable.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPeekNextSample` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.sample.Sample vfuncPeekNextSample(gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.peekNextSample)
      return typeof(return).init;

    GstSample* _cretval;
    _cretval = _klass.peekNextSample(cast(GstAggregator*)this._cPtr, aggregatorPad ? cast(GstAggregatorPad*)aggregatorPad._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Optional.
                          Allows the subclass to handle the allocation query from upstream.
  
      Params:
        pad = 
        decideQuery =  (modified in place, changes are seen by the caller)
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProposeAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncProposeAllocation(gid.gstbase1.aggregator_pad.AggregatorPad pad, gid.gst1.query.Query decideQuery, gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstAggregator*)this._cPtr, pad ? cast(GstAggregatorPad*)pad._cPtr(No.Dup) : null, decideQuery ? cast(GstQuery*)decideQuery._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Called when an event is received on a sink pad, the subclass
      should always chain up.
  
      Params:
        aggregatorPad = a #GstAggregatorPad
        event = a #GstEvent
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSinkEvent(gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad, gid.gst1.event.Event event)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstAggregator*)this._cPtr, aggregatorPad ? cast(GstAggregatorPad*)aggregatorPad._cPtr(No.Dup) : null, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Called when an event is received on a sink pad before queueing up
      serialized events. The subclass should always chain up (Since: 1.18).
  
      Params:
        aggregatorPad = a #GstAggregatorPad
        event = a #GstEvent
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkEventPreQueue` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncSinkEventPreQueue(gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad, gid.gst1.event.Event event)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.sinkEventPreQueue)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.sinkEventPreQueue(cast(GstAggregator*)this._cPtr, aggregatorPad ? cast(GstAggregatorPad*)aggregatorPad._cPtr(No.Dup) : null, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                       Called when a query is received on a sink pad, the subclass
                       should always chain up.
  
      Params:
        aggregatorPad = 
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSinkQuery(gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad, gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.sinkQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQuery(cast(GstAggregator*)this._cPtr, aggregatorPad ? cast(GstAggregatorPad*)aggregatorPad._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                             Called when a query is received on a sink pad before queueing up
                             serialized queries. The subclass should always chain up (Since: 1.18).
  
      Params:
        aggregatorPad = 
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkQueryPreQueue` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSinkQueryPreQueue(gid.gstbase1.aggregator_pad.AggregatorPad aggregatorPad, gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.sinkQueryPreQueue)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQueryPreQueue(cast(GstAggregator*)this._cPtr, aggregatorPad ? cast(GstAggregatorPad*)aggregatorPad._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called when the src pad is activated, it will start/stop its
                       pad task right after that call.
  
      Params:
        mode = 
        active = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSrcActivate(gid.gst1.types.PadMode mode, bool active)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.srcActivate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcActivate(cast(GstAggregator*)this._cPtr, mode, active);
    return _retval;
  }

  /**
      Called when an event is received on the src pad, the subclass
      should always chain up.
  
      Params:
        event = a #GstEvent
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSrcEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstAggregator*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called when a query is received on the src pad, the subclass
                       should always chain up.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSrcQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.srcQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcQuery(cast(GstAggregator*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called when the element goes from READY to PAUSED.
                       The subclass should get ready to process
                       aggregated buffers.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Called when the element goes from PAUSED to READY.
                       The subclass should free all resources and reset its state.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncUpdateSrcCaps(gid.gst1.caps.Caps caps, out gid.gst1.caps.Caps ret)
  {
    auto _klass = cast(GstAggregatorClass*)_vfuncClass;
    if (!_klass.updateSrcCaps)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstCaps* _ret;
    _cretval = _klass.updateSrcCaps(cast(GstAggregator*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, &_ret);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_ret)
      ret = new gid.gst1.caps.Caps(cast(void*)_ret, Yes.Take);
    return _retval;
  }

  /**
      This method will push the provided output buffer downstream. If needed,
      mandatory events such as stream-start, caps, and segment events will be
      sent before pushing the buffer.
  
      Params:
        buffer = the #GstBuffer to push.
      Returns: 
  */
  gid.gst1.types.FlowReturn finishBuffer(gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_aggregator_finish_buffer(cast(GstAggregator*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.types.FlowReturn finishBufferList(gid.gst1.buffer_list.BufferList bufferlist) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_aggregator_finish_buffer_list(cast(GstAggregator*)this._cPtr, bufferlist ? cast(GstBufferList*)bufferlist._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  void getAllocator(out gid.gst1.allocator.Allocator allocator, out gid.gst1.allocation_params.AllocationParams params) nothrow
  {
    GstAllocator* _allocator;
    gst_aggregator_get_allocator(cast(GstAggregator*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /** */
  gid.gst1.buffer_pool.BufferPool getBufferPool() nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_aggregator_get_buffer_pool(cast(GstAggregator*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Subclasses may use the return value to inform whether they should return
      [gid.gst1.types.FlowReturn.Eos] from their aggregate implementation.
      Returns: whether live status was forced on self.
  */
  bool getForceLive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_get_force_live(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /** */
  bool getIgnoreInactivePads() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_get_ignore_inactive_pads(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the latency values reported by self in response to the latency
      query, or [gid.gst1.types.CLOCK_TIME_NONE] if there is not live source connected and the element
      will not wait for the clock.
      
      Typically only called by subclasses.
      Returns: The latency or [gid.gst1.types.CLOCK_TIME_NONE] if the element does not sync
  */
  gid.gst1.types.ClockTime getLatency() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_aggregator_get_latency(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Negotiates src pad caps with downstream elements.
      Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again
      if #GstAggregatorClass::negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate() nothrow
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
  gid.gst1.sample.Sample peekNextSample(gid.gstbase1.aggregator_pad.AggregatorPad pad) nothrow
  {
    GstSample* _cretval;
    _cretval = gst_aggregator_peek_next_sample(cast(GstAggregator*)this._cPtr, pad ? cast(GstAggregatorPad*)pad._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This method will push the provided event downstream. If needed, mandatory
      events such as stream-start, caps, and segment events will be sent before
      pushing the event.
      
      This API does not allow pushing stream-start, caps, segment and EOS events.
      Specific API like [gid.gstbase1.aggregator.Aggregator.setSrcCaps] should be used for these.
  
      Params:
        event = the #GstEvent to push.
      Returns: 
  */
  bool pushSrcEvent(gid.gst1.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_aggregator_push_src_event(cast(GstAggregator*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Subclasses should call this when they have prepared the
      buffers they will aggregate for each of their sink pads, but
      before using any of the properties of the pads that govern
      *how* aggregation should be performed, for example z-index
      for video aggregators.
      
      If [gid.gstbase1.aggregator.Aggregator.updateSegment] is used by the subclass,
      it MUST be called before [gid.gstbase1.aggregator.Aggregator.selectedSamples].
      
      This function MUST only be called from the #GstAggregatorClass::aggregate()
      function.
  
      Params:
        pts = The presentation timestamp of the next output buffer
        dts = The decoding timestamp of the next output buffer
        duration = The duration of the next output buffer
        info = a #GstStructure containing additional information
  */
  void selectedSamples(gid.gst1.types.ClockTime pts, gid.gst1.types.ClockTime dts, gid.gst1.types.ClockTime duration, gid.gst1.structure.Structure info = null) nothrow
  {
    gst_aggregator_selected_samples(cast(GstAggregator*)this._cPtr, pts, dts, duration, info ? cast(GstStructure*)info._cPtr(No.Dup) : null);
  }

  /**
      Subclasses should call this at construction time in order for self to
      aggregate on a timeout even when no live source is connected.
  
      Params:
        forceLive = 
  */
  void setForceLive(bool forceLive) nothrow
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
  void setIgnoreInactivePads(bool ignore) nothrow
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
  void setLatency(gid.gst1.types.ClockTime minLatency, gid.gst1.types.ClockTime maxLatency) nothrow
  {
    gst_aggregator_set_latency(cast(GstAggregator*)this._cPtr, minLatency, maxLatency);
  }

  /**
      Sets the caps to be used on the src pad.
  
      Params:
        caps = The #GstCaps to set on the src pad.
  */
  void setSrcCaps(gid.gst1.caps.Caps caps) nothrow
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
  gid.gst1.types.ClockTime simpleGetNextTime() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_aggregator_simple_get_next_time(cast(GstAggregator*)this._cPtr);
    return _retval;
  }

  /**
      Subclasses should use this to update the segment on their
      source pad, instead of directly pushing new segment events
      downstream.
      
      Subclasses MUST call this before [gid.gstbase1.aggregator.Aggregator.selectedSamples],
      if it is used at all.
  
      Params:
        segment = 
  */
  void updateSegment(gid.gst1.segment.Segment segment) nothrow
  {
    gst_aggregator_update_segment(cast(GstAggregator*)this._cPtr, cast(const(GstSegment)*)&segment);
  }

  /**
      Connect to `SamplesSelected` signal.
  
      Signals that the #GstAggregator subclass has selected the next set
        of input samples it will aggregate. Handlers may call
        [gid.gstbase1.aggregator.Aggregator.peekNextSample] at that point.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.segment.Segment segment, ulong pts, ulong dts, ulong duration, gid.gst1.structure.Structure info, gid.gstbase1.aggregator.Aggregator aggregator)`
  
          `segment` The #GstSegment the next output buffer is part of (optional)
  
          `pts` The presentation timestamp of the next output buffer (optional)
  
          `dts` The decoding timestamp of the next output buffer (optional)
  
          `duration` The duration of the next output buffer (optional)
  
          `info` a #GstStructure containing additional information (optional)
  
          `aggregator` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSamplesSelected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gst1.segment.Segment)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == ulong)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == ulong)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == ulong)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == gid.gst1.structure.Structure)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gid.gstbase1.aggregator.Aggregator)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.samplesSelected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("samples-selected", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Aggregator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.aggregator.Aggregator), T.stringof ~ " is not derived from gid.gstbase1.aggregator.Aggregator");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAggregate", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "aggregate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClip", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "clip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateNewPad", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "create_new_pad");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFinishBuffer", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "finish_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFinishBufferList", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "finish_buffer_list");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFixateSrcCaps", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "fixate_src_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNextTime", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "get_next_time");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiate", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "negotiate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiatedSrcCaps", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "negotiated_src_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPeekNextSample", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "peek_next_sample");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEventPreQueue", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "sink_event_pre_queue");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQuery", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "sink_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQueryPreQueue", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "sink_query_pre_queue");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcActivate", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "src_activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcQuery", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "src_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUpdateSrcCaps", true)[0]) == gid.gstbase1.aggregator.Aggregator))
      _installVfunc(klass, "update_src_caps");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAggregatorClass*)klass;

    switch (vfunc)
    {
      case "aggregate":
      {
        static extern(C) GstFlowReturn _vfuncAggregateTramp(GstAggregator* aggregator, gboolean timeout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.aggregate)
              return (cast(typeof(&_vfuncAggregateTramp))_klass.aggregate)(aggregator, timeout);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncAggregate(cast(bool)timeout);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncAggregate");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.aggregate = cast(typeof(_klass.aggregate))&_vfuncAggregateTramp;
        break;
      }
      case "clip":
      {
        static extern(C) GstBuffer* _vfuncClipTramp(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.clip)
              return (cast(typeof(&_vfuncClipTramp))_klass.clip)(aggregator, aggregatorPad, buf);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;

          try
          {
            _dretval = _obj.vfuncClip(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)aggregatorPad, No.Take), buf ? new gid.gst1.buffer.Buffer(cast(void*)buf, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncClip");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.clip = cast(typeof(_klass.clip))&_vfuncClipTramp;
        break;
      }
      case "create_new_pad":
      {
        static extern(C) GstAggregatorPad* _vfuncCreateNewPadTramp(GstAggregator* self, GstPadTemplate* templ, const(char)* reqName, const(GstCaps)* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.createNewPad)
              return (cast(typeof(&_vfuncCreateNewPadTramp))_klass.createNewPad)(self, templ, reqName, caps);
            return typeof(return).init;
          }

          gid.gstbase1.aggregator_pad.AggregatorPad _dretval;
          string _reqName = reqName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncCreateNewPad(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad_template.PadTemplate)(cast(void*)templ, No.Take), _reqName, caps ? new gid.gst1.caps.Caps(cast(void*)caps, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncCreateNewPad");
          }
          auto _retval = _dretval ? cast(GstAggregatorPad*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.createNewPad = cast(typeof(_klass.createNewPad))&_vfuncCreateNewPadTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstAggregator* self, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(self, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDecideAllocation(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "finish_buffer":
      {
        static extern(C) GstFlowReturn _vfuncFinishBufferTramp(GstAggregator* aggregator, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.finishBuffer)
              return (cast(typeof(&_vfuncFinishBufferTramp))_klass.finishBuffer)(aggregator, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncFinishBuffer(buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncFinishBuffer");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.finishBuffer = cast(typeof(_klass.finishBuffer))&_vfuncFinishBufferTramp;
        break;
      }
      case "finish_buffer_list":
      {
        static extern(C) GstFlowReturn _vfuncFinishBufferListTramp(GstAggregator* aggregator, GstBufferList* bufferlist) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.finishBufferList)
              return (cast(typeof(&_vfuncFinishBufferListTramp))_klass.finishBufferList)(aggregator, bufferlist);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncFinishBufferList(bufferlist ? new gid.gst1.buffer_list.BufferList(cast(void*)bufferlist, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncFinishBufferList");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.finishBufferList = cast(typeof(_klass.finishBufferList))&_vfuncFinishBufferListTramp;
        break;
      }
      case "fixate_src_caps":
      {
        static extern(C) GstCaps* _vfuncFixateSrcCapsTramp(GstAggregator* self, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.fixateSrcCaps)
              return (cast(typeof(&_vfuncFixateSrcCapsTramp))_klass.fixateSrcCaps)(self, caps);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;

          try
          {
            _dretval = _obj.vfuncFixateSrcCaps(caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncFixateSrcCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.fixateSrcCaps = cast(typeof(_klass.fixateSrcCaps))&_vfuncFixateSrcCapsTramp;
        break;
      }
      case "flush":
      {
        static extern(C) GstFlowReturn _vfuncFlushTramp(GstAggregator* aggregator) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(aggregator);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncFlush();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncFlush");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "get_next_time":
      {
        static extern(C) GstClockTime _vfuncGetNextTimeTramp(GstAggregator* aggregator) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.getNextTime)
              return (cast(typeof(&_vfuncGetNextTimeTramp))_klass.getNextTime)(aggregator);
            return typeof(return).init;
          }

          gid.gst1.types.ClockTime _dretval;

          try
          {
            _dretval = _obj.vfuncGetNextTime();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncGetNextTime");
          }
          auto _retval = cast(GstClockTime)_dretval;

          return _retval;
        }

        _klass.getNextTime = cast(typeof(_klass.getNextTime))&_vfuncGetNextTimeTramp;
        break;
      }
      case "negotiate":
      {
        static extern(C) gboolean _vfuncNegotiateTramp(GstAggregator* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.negotiate)
              return (cast(typeof(&_vfuncNegotiateTramp))_klass.negotiate)(self);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNegotiate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncNegotiate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.negotiate = cast(typeof(_klass.negotiate))&_vfuncNegotiateTramp;
        break;
      }
      case "negotiated_src_caps":
      {
        static extern(C) gboolean _vfuncNegotiatedSrcCapsTramp(GstAggregator* self, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.negotiatedSrcCaps)
              return (cast(typeof(&_vfuncNegotiatedSrcCapsTramp))_klass.negotiatedSrcCaps)(self, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncNegotiatedSrcCaps(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncNegotiatedSrcCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.negotiatedSrcCaps = cast(typeof(_klass.negotiatedSrcCaps))&_vfuncNegotiatedSrcCapsTramp;
        break;
      }
      case "peek_next_sample":
      {
        static extern(C) GstSample* _vfuncPeekNextSampleTramp(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.peekNextSample)
              return (cast(typeof(&_vfuncPeekNextSampleTramp))_klass.peekNextSample)(aggregator, aggregatorPad);
            return typeof(return).init;
          }

          gid.gst1.sample.Sample _dretval;

          try
          {
            _dretval = _obj.vfuncPeekNextSample(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)aggregatorPad, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncPeekNextSample");
          }
          auto _retval = _dretval ? cast(GstSample*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.peekNextSample = cast(typeof(_klass.peekNextSample))&_vfuncPeekNextSampleTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstAggregator* self, GstAggregatorPad* pad, GstQuery* decideQuery, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(self, pad, decideQuery, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _decideQuery = decideQuery ? new gid.gst1.query.Query(cast(void*)decideQuery, Yes.Take)._cBorrow : null;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncProposeAllocation(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)pad, No.Take), _decideQuery, _query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncProposeAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_decideQuery)
            _decideQuery._cUnborrow;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.proposeAllocation = cast(typeof(_klass.proposeAllocation))&_vfuncProposeAllocationTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(aggregator, aggregatorPad, event);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSinkEvent(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)aggregatorPad, No.Take), event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSinkEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.sinkEvent = cast(typeof(_klass.sinkEvent))&_vfuncSinkEventTramp;
        break;
      }
      case "sink_event_pre_queue":
      {
        static extern(C) GstFlowReturn _vfuncSinkEventPreQueueTramp(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.sinkEventPreQueue)
              return (cast(typeof(&_vfuncSinkEventPreQueueTramp))_klass.sinkEventPreQueue)(aggregator, aggregatorPad, event);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncSinkEventPreQueue(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)aggregatorPad, No.Take), event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSinkEventPreQueue");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.sinkEventPreQueue = cast(typeof(_klass.sinkEventPreQueue))&_vfuncSinkEventPreQueueTramp;
        break;
      }
      case "sink_query":
      {
        static extern(C) gboolean _vfuncSinkQueryTramp(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.sinkQuery)
              return (cast(typeof(&_vfuncSinkQueryTramp))_klass.sinkQuery)(aggregator, aggregatorPad, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkQuery(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)aggregatorPad, No.Take), _query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSinkQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.sinkQuery = cast(typeof(_klass.sinkQuery))&_vfuncSinkQueryTramp;
        break;
      }
      case "sink_query_pre_queue":
      {
        static extern(C) gboolean _vfuncSinkQueryPreQueueTramp(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.sinkQueryPreQueue)
              return (cast(typeof(&_vfuncSinkQueryPreQueueTramp))_klass.sinkQueryPreQueue)(aggregator, aggregatorPad, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkQueryPreQueue(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.aggregator_pad.AggregatorPad)(cast(void*)aggregatorPad, No.Take), _query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSinkQueryPreQueue");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.sinkQueryPreQueue = cast(typeof(_klass.sinkQueryPreQueue))&_vfuncSinkQueryPreQueueTramp;
        break;
      }
      case "src_activate":
      {
        static extern(C) gboolean _vfuncSrcActivateTramp(GstAggregator* aggregator, GstPadMode mode, gboolean active) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.srcActivate)
              return (cast(typeof(&_vfuncSrcActivateTramp))_klass.srcActivate)(aggregator, mode, active);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSrcActivate(mode, cast(bool)active);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSrcActivate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.srcActivate = cast(typeof(_klass.srcActivate))&_vfuncSrcActivateTramp;
        break;
      }
      case "src_event":
      {
        static extern(C) gboolean _vfuncSrcEventTramp(GstAggregator* aggregator, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(aggregator, event);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSrcEvent(event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSrcEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.srcEvent = cast(typeof(_klass.srcEvent))&_vfuncSrcEventTramp;
        break;
      }
      case "src_query":
      {
        static extern(C) gboolean _vfuncSrcQueryTramp(GstAggregator* aggregator, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.srcQuery)
              return (cast(typeof(&_vfuncSrcQueryTramp))_klass.srcQuery)(aggregator, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSrcQuery(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncSrcQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.srcQuery = cast(typeof(_klass.srcQuery))&_vfuncSrcQueryTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstAggregator* aggregator) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(aggregator);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstAggregator* aggregator) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)aggregator);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)aggregator);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(aggregator);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "update_src_caps":
      {
        static extern(C) GstFlowReturn _vfuncUpdateSrcCapsTramp(GstAggregator* self, GstCaps* caps, GstCaps** ret) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.aggregator.Aggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GstAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.updateSrcCaps)
              return (cast(typeof(&_vfuncUpdateSrcCapsTramp))_klass.updateSrcCaps)(self, caps, ret);
            return typeof(return).init;
          }

          typeof(*ret) _retNull;
          if (!ret)
            ret = &_retNull;

          gid.gst1.types.FlowReturn _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;
          gid.gst1.caps.Caps _ret;

          try
          {
            _dretval = _obj.vfuncUpdateSrcCaps(_caps, _ret);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.aggregator.Aggregator.vfuncUpdateSrcCaps");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_caps)
            _caps._cUnborrow;
          *ret = _ret ? cast(GstCaps*)_ret._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.updateSrcCaps = cast(typeof(_klass.updateSrcCaps))&_vfuncUpdateSrcCapsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.aggregator.Aggregator]
class AggregatorGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `emitSignals` property.
      Params:
        propval = Enables the emission of signals such as #GstAggregator::samples-selected
      Returns: Builder instance for fluent chaining
  */
  T emitSignals(bool propval) nothrow
  {
    return setProperty("emit-signals", propval);
  }

  /** */
  T latency(ulong propval) nothrow
  {
    return setProperty("latency", propval);
  }

  /**
      Set `minUpstreamLatency` property.
      Params:
        propval = Force minimum upstream latency (in nanoseconds). When sources with a
          higher latency are expected to be plugged in dynamically after the
          aggregator has started playing, this allows overriding the minimum
          latency reported by the initial source(s). This is only taken into
          account when larger than the actually reported minimum latency.
      Returns: Builder instance for fluent chaining
  */
  T minUpstreamLatency(ulong propval) nothrow
  {
    return setProperty("min-upstream-latency", propval);
  }

  /** */
  T startTime(ulong propval) nothrow
  {
    return setProperty("start-time", propval);
  }

  /** */
  T startTimeSelection(gid.gstbase1.types.AggregatorStartTimeSelection propval) nothrow
  {
    return setProperty("start-time-selection", propval);
  }
}

/// Fluent builder for [gid.gstbase1.aggregator.Aggregator]
final class AggregatorGidBuilder : AggregatorGidBuilderImpl!AggregatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Aggregator build() nothrow
  {
    return new Aggregator(cast(void*)createGObject(Aggregator._getGType), Yes.Take);
  }
}
