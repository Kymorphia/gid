/// Module for [BaseTransform] class
module gid.gstbase1.base_transform;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gst1.allocation_params;
import gid.gst1.allocator;
import gid.gst1.buffer;
import gid.gst1.buffer_pool;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.meta;
import gid.gst1.query;
import gid.gst1.structure;
import gid.gst1.types;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    This base class is for filter elements that process data. Elements
    that are suitable for implementation using #GstBaseTransform are ones
    where the size and caps of the output is known entirely from the input
    caps and buffer sizes. These include elements that directly transform
    one buffer into another, modify the contents of a buffer in-place, as
    well as elements that collate multiple input buffers into one output buffer,
    or that expand one input buffer into multiple output buffers. See below
    for more concrete use cases.
    
    It provides for:
    
    * one sinkpad and one srcpad
    * Possible formats on sink and source pad implemented
      with custom transform_caps function. By default uses
      same format on sink and source.
    
    * Handles state changes
    * Does flushing
    * Push mode
    * Pull mode if the sub-class transform can operate on arbitrary data
    
    # Use Cases
    
    ## Passthrough mode
    
      * Element has no interest in modifying the buffer. It may want to inspect it,
        in which case the element should have a transform_ip function. If there
        is no transform_ip function in passthrough mode, the buffer is pushed
        intact.
    
      * The #GstBaseTransformClass.passthrough_on_same_caps variable
        will automatically set/unset passthrough based on whether the
        element negotiates the same caps on both pads.
    
      * #GstBaseTransformClass.passthrough_on_same_caps on an element that
        doesn't implement a transform_caps function is useful for elements that
        only inspect data (such as level)
    
      * Example elements
    
        * Level
        * Videoscale, audioconvert, videoconvert, audioresample in certain modes.
    
    ## Modifications in-place - input buffer and output buffer are the same thing.
    
    * The element must implement a transform_ip function.
    * Output buffer size must <= input buffer size
    * If the always_in_place flag is set, non-writable buffers will be copied
      and passed to the transform_ip function, otherwise a new buffer will be
      created and the transform function called.
    
    * Incoming writable buffers will be passed to the transform_ip function
      immediately.
    * only implementing transform_ip and not transform implies always_in_place = true
    
      * Example elements:
        * Volume
        * Audioconvert in certain modes (signed/unsigned conversion)
        * videoconvert in certain modes (endianness swapping)
    
    ## Modifications only to the caps/metadata of a buffer
    
    * The element does not require writable data, but non-writable buffers
      should be subbuffered so that the meta-information can be replaced.
    
    * Elements wishing to operate in this mode should replace the
      prepare_output_buffer method to create subbuffers of the input buffer
      and set always_in_place to true
    
    * Example elements
      * Capsfilter when setting caps on outgoing buffers that have
        none.
      * identity when it is going to re-timestamp buffers by
        datarate.
    
    ## Normal mode
      * always_in_place flag is not set, or there is no transform_ip function
      * Element will receive an input buffer and output buffer to operate on.
      * Output buffer is allocated by calling the prepare_output_buffer function.
      * Example elements:
        * Videoscale, videoconvert, audioconvert when doing
        scaling/conversions
    
    ## Special output buffer allocations
      * Elements which need to do special allocation of their output buffers
        beyond allocating output buffers via the negotiated allocator or
        buffer pool should implement the prepare_output_buffer method.
    
      * Example elements:
        * efence
    
    # Sub-class settable flags on GstBaseTransform
    
    * passthrough
    
      * Implies that in the current configuration, the sub-class is not interested in modifying the buffers.
      * Elements which are always in passthrough mode whenever the same caps has been negotiated on both pads can set the class variable passthrough_on_same_caps to have this behaviour automatically.
    
    * always_in_place
      * Determines whether a non-writable buffer will be copied before passing
        to the transform_ip function.
    
      * Implied true if no transform function is implemented.
      * Implied false if ONLY transform function is implemented.
*/
@gidGir("BaseTransform", "BaseTransformClass")
class BaseTransform : gid.gst1.element.Element
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
    return cast(void function())gst_base_transform_get_type != &gidSymbolNotFound ? gst_base_transform_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstBaseTransform";
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseTransform self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.base_transform.BaseTransform]
      Returns: New builder object
  */
  static BaseTransformGidBuilder builder() nothrow
  {
    return new BaseTransformGidBuilder;
  }

  /** */
  @property bool qos() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("qos");
  }

  /** */
  @property void qos(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("qos", propval);
  }

  /**
      Optional.
                       Subclasses can override this method to check if caps can be
                       handled by the element. The default implementation might not be
                       the most optimal way to check this in all cases.
  
      Params:
        direction = 
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcceptCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAcceptCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.acceptCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.acceptCaps(cast(GstBaseTransform*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                         This method is called right before the base class will
                         start processing. Dynamic properties or other delayed
                         configuration could be performed in this method.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncBeforeTransform` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncBeforeTransform(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.beforeTransform)
      return;

    _klass.beforeTransform(cast(GstBaseTransform*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Optional.
                      Copy the metadata from the input buffer to the output buffer.
                      The default implementation will copy the flags, timestamps and
                      offsets of the buffer.
  
      Params:
        input =  (modified in place, changes are seen by the caller)
        outbuf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCopyMetadata` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCopyMetadata(gid.gst1.buffer.Buffer input, gid.gst1.buffer.Buffer outbuf)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.copyMetadata)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.copyMetadata(cast(GstBaseTransform*)this._cPtr, input ? cast(GstBuffer*)input._cPtr(No.Dup) : null, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Setup the allocation parameters for allocating output
                         buffers. The passed in query contains the result of the
                         downstream allocation query. This function is only called
                         when not operating in passthrough mode. The default
                         implementation will remove all memory dependent metadata.
                         If there is a filter_meta method implementation, it will
                         be called for all metadata API in the downstream query,
                         otherwise the metadata API is removed.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDecideAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDecideAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstBaseTransform*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Return true if the metadata API should be proposed in the
                    upstream allocation query. The default implementation is null
                    and will cause all metadata to be removed.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
        api = 
        params = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFilterMeta` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFilterMeta(gid.gst1.query.Query query, gid.gobject2.types.GType api, gid.gst1.structure.Structure params)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.filterMeta)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.filterMeta(cast(GstBaseTransform*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null, api, params ? cast(const(GstStructure)*)params._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected gid.gst1.caps.Caps vfuncFixateCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps othercaps)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.fixateCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.fixateCaps(cast(GstBaseTransform*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, othercaps ? cast(GstCaps*)othercaps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncGenerateOutput(out gid.gst1.buffer.Buffer outbuf)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.generateOutput)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _outbuf;
    _cretval = _klass.generateOutput(cast(GstBaseTransform*)this._cPtr, &_outbuf);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_outbuf)
      outbuf = new gid.gst1.buffer.Buffer(cast(void*)_outbuf, Yes.Take);
    return _retval;
  }

  /** */
  protected bool vfuncGetUnitSize(gid.gst1.caps.Caps caps, out size_t size)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.getUnitSize)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getUnitSize(cast(GstBaseTransform*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, cast(size_t*)&size);
    return _retval;
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncPrepareOutputBuffer(gid.gst1.buffer.Buffer input, out gid.gst1.buffer.Buffer outbuf)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.prepareOutputBuffer)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _outbuf;
    _cretval = _klass.prepareOutputBuffer(cast(GstBaseTransform*)this._cPtr, input ? cast(GstBuffer*)input._cPtr(No.Dup) : null, &_outbuf);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_outbuf)
      outbuf = new gid.gst1.buffer.Buffer(cast(void*)_outbuf, Yes.Take);
    return _retval;
  }

  /**
      Propose buffer allocation parameters for upstream elements.
                           This function must be implemented if the element reads or
                           writes the buffer content. The query that was passed to
                           the decide_allocation is passed in this method (or null
                           when the element is in passthrough mode). The default
                           implementation will pass the query downstream when in
                           passthrough mode and will copy all the filtered metadata
                           API in non-passthrough mode.
  
      Params:
        decideQuery =  (modified in place, changes are seen by the caller)
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProposeAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncProposeAllocation(gid.gst1.query.Query decideQuery, gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstBaseTransform*)this._cPtr, decideQuery ? cast(GstQuery*)decideQuery._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  alias vfuncQuery = gid.gst1.element.Element.vfuncQuery;

  /**
      Optional.
                       Handle a requested query. Subclasses that implement this
                       must chain up to the parent if they didn't handle the
                       query
  
      Params:
        direction = 
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncQuery(gid.gst1.types.PadDirection direction, gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.query)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.query(cast(GstBaseTransform*)this._cPtr, direction, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Allows the subclass to be notified of the actual caps set.
  
      Params:
        incaps =  (modified in place, changes are seen by the caller)
        outcaps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetCaps(gid.gst1.caps.Caps incaps, gid.gst1.caps.Caps outcaps)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.setCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaps(cast(GstBaseTransform*)this._cPtr, incaps ? cast(GstCaps*)incaps._cPtr(No.Dup) : null, outcaps ? cast(GstCaps*)outcaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncSinkEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstBaseTransform*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncSrcEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstBaseTransform*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstBaseTransform*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstBaseTransform*)this._cPtr);
    return _retval;
  }

  /**
      Function which accepts a new input buffer and pre-processes it.
                       The default implementation performs caps (re)negotiation, then
                       QoS if needed, and places the input buffer into the queued_buf
                       member variable. If the buffer is dropped due to QoS, it returns
                       GST_BASE_TRANSFORM_FLOW_DROPPED. If this input buffer is not
                       contiguous with any previous input buffer, then is_discont
                       is set to true. (Since: 1.6)
  
      Params:
        isDiscont = 
        input =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSubmitInputBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncSubmitInputBuffer(bool isDiscont, gid.gst1.buffer.Buffer input)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.submitInputBuffer)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.submitInputBuffer(cast(GstBaseTransform*)this._cPtr, isDiscont, input ? cast(GstBuffer*)input._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Required if the element does not operate in-place.
                       Transforms one incoming buffer to one outgoing buffer.
                       The function is allowed to change size/timestamp/duration
                       of the outgoing buffer.
  
      Params:
        inbuf =  (modified in place, changes are seen by the caller)
        outbuf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransform` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncTransform(gid.gst1.buffer.Buffer inbuf, gid.gst1.buffer.Buffer outbuf)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.transform)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.transform(cast(GstBaseTransform*)this._cPtr, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.  Given the pad in this direction and the given
                       caps, what caps are allowed on the other pad in this
                       element ?
  
      Params:
        direction = 
        caps =  (modified in place, changes are seen by the caller)
        filter =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncTransformCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps filter)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.transformCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.transformCaps(cast(GstBaseTransform*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Required if the element operates in-place.
                       Transform the incoming buffer in-place.
  
      Params:
        buf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformIp` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncTransformIp(gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.transformIp)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.transformIp(cast(GstBaseTransform*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method copies all meta without
                       tags. Subclasses can implement this method and return true if
                       the metadata is to be copied.
  
      Params:
        outbuf =  (modified in place, changes are seen by the caller)
        meta =  (borrowed, only valid during the callback)
        inbuf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformMeta` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncTransformMeta(gid.gst1.buffer.Buffer outbuf, gid.gst1.meta.Meta meta, gid.gst1.buffer.Buffer inbuf)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.transformMeta)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.transformMeta(cast(GstBaseTransform*)this._cPtr, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null, meta ? cast(GstMeta*)meta._cPtr : null, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncTransformSize(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, size_t size, gid.gst1.caps.Caps othercaps, out size_t othersize)
  {
    auto _klass = cast(GstBaseTransformClass*)_vfuncClass;
    if (!_klass.transformSize)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.transformSize(cast(GstBaseTransform*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, size, othercaps ? cast(GstCaps*)othercaps._cPtr(No.Dup) : null, cast(size_t*)&othersize);
    return _retval;
  }

  /**
      Lets #GstBaseTransform sub-classes know the memory allocator
      used by the base class and its params.
      
      Unref the allocator after use.
  
      Params:
        allocator = the #GstAllocator
          used
        params = the #GstAllocationParams of allocator
  */
  void getAllocator(out gid.gst1.allocator.Allocator allocator, out gid.gst1.allocation_params.AllocationParams params) nothrow
  {
    GstAllocator* _allocator;
    gst_base_transform_get_allocator(cast(GstBaseTransform*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /** */
  gid.gst1.buffer_pool.BufferPool getBufferPool() nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_base_transform_get_buffer_pool(cast(GstBaseTransform*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      See if trans is configured as a in_place transform.
      Returns: true if the transform is configured in in_place mode.
        
        MT safe.
  */
  bool isInPlace() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_transform_is_in_place(cast(GstBaseTransform*)this._cPtr);
    return _retval;
  }

  /**
      See if trans is configured as a passthrough transform.
      Returns: true if the transform is configured in passthrough mode.
        
        MT safe.
  */
  bool isPassthrough() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_transform_is_passthrough(cast(GstBaseTransform*)this._cPtr);
    return _retval;
  }

  /**
      Queries if the transform will handle QoS.
      Returns: true if QoS is enabled.
        
        MT safe.
  */
  bool isQosEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_transform_is_qos_enabled(cast(GstBaseTransform*)this._cPtr);
    return _retval;
  }

  /**
      Negotiates src pad caps with downstream elements if the source pad is
      marked as needing reconfiguring. Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in
      any case. But marks it again if negotiation fails.
      
      Do not call this in the #GstBaseTransformClass::transform or
      #GstBaseTransformClass::transform_ip vmethod. Call this in
      #GstBaseTransformClass::submit_input_buffer,
      #GstBaseTransformClass::prepare_output_buffer or in
      #GstBaseTransformClass::generate_output _before_ any output buffer is
      allocated.
      
      It will be default be called when handling an ALLOCATION query or at the
      very beginning of the default #GstBaseTransformClass::submit_input_buffer
      implementation.
      Returns: true if the negotiation succeeded, else false.
  */
  bool reconfigure() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_transform_reconfigure(cast(GstBaseTransform*)this._cPtr);
    return _retval;
  }

  /**
      Instructs trans to request renegotiation upstream. This function is
      typically called after properties on the transform were set that
      influence the input format.
  */
  void reconfigureSink() nothrow
  {
    gst_base_transform_reconfigure_sink(cast(GstBaseTransform*)this._cPtr);
  }

  /**
      Instructs trans to renegotiate a new downstream transform on the next
      buffer. This function is typically called after properties on the transform
      were set that influence the output format.
  */
  void reconfigureSrc() nothrow
  {
    gst_base_transform_reconfigure_src(cast(GstBaseTransform*)this._cPtr);
  }

  /**
      If gap_aware is false (the default), output buffers will have the
      [gid.gst1.types.BufferFlags.Gap] flag unset.
      
      If set to true, the element must handle output buffers with this flag set
      correctly, i.e. it can assume that the buffer contains neutral data but must
      unset the flag if the output is no neutral data.
      
      MT safe.
  
      Params:
        gapAware = New state
  */
  void setGapAware(bool gapAware) nothrow
  {
    gst_base_transform_set_gap_aware(cast(GstBaseTransform*)this._cPtr, gapAware);
  }

  /**
      Determines whether a non-writable buffer will be copied before passing
      to the transform_ip function.
      
        * Always true if no transform function is implemented.
        * Always false if ONLY transform function is implemented.
      
      MT safe.
  
      Params:
        inPlace = Boolean value indicating that we would like to operate
          on in_place buffers.
  */
  void setInPlace(bool inPlace) nothrow
  {
    gst_base_transform_set_in_place(cast(GstBaseTransform*)this._cPtr, inPlace);
  }

  /**
      Set passthrough mode for this filter by default. This is mostly
      useful for filters that do not care about negotiation.
      
      Always true for filters which don't implement either a transform
      or transform_ip or generate_output method.
      
      MT safe.
  
      Params:
        passthrough = boolean indicating passthrough mode.
  */
  void setPassthrough(bool passthrough) nothrow
  {
    gst_base_transform_set_passthrough(cast(GstBaseTransform*)this._cPtr, passthrough);
  }

  /**
      If prefer_passthrough is true (the default), trans will check and
      prefer passthrough caps from the list of caps returned by the
      transform_caps vmethod.
      
      If set to false, the element must order the caps returned from the
      transform_caps function in such a way that the preferred format is
      first in the list. This can be interesting for transforms that can do
      passthrough transforms but prefer to do something else, like a
      capsfilter.
      
      MT safe.
  
      Params:
        preferPassthrough = New state
  */
  void setPreferPassthrough(bool preferPassthrough) nothrow
  {
    gst_base_transform_set_prefer_passthrough(cast(GstBaseTransform*)this._cPtr, preferPassthrough);
  }

  /**
      Enable or disable QoS handling in the transform.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setQosEnabled(bool enabled) nothrow
  {
    gst_base_transform_set_qos_enabled(cast(GstBaseTransform*)this._cPtr, enabled);
  }

  /**
      Set the QoS parameters in the transform. This function is called internally
      when a QOS event is received but subclasses can provide custom information
      when needed.
      
      MT safe.
  
      Params:
        proportion = the proportion
        diff = the diff against the clock
        timestamp = the timestamp of the buffer generating the QoS expressed in
          running_time.
  */
  void updateQos(double proportion, gid.gst1.types.ClockTimeDiff diff, gid.gst1.types.ClockTime timestamp) nothrow
  {
    gst_base_transform_update_qos(cast(GstBaseTransform*)this._cPtr, proportion, diff, timestamp);
  }

  /**
      Updates the srcpad caps and sends the caps downstream. This function
      can be used by subclasses when they have already negotiated their caps
      but found a change in them (or computed new information). This way,
      they can notify downstream about that change without losing any
      buffer.
  
      Params:
        updatedCaps = An updated version of the srcpad caps to be pushed
          downstream
      Returns: true if the caps could be sent downstream false otherwise
  */
  bool updateSrcCaps(gid.gst1.caps.Caps updatedCaps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_transform_update_src_caps(cast(GstBaseTransform*)this._cPtr, updatedCaps ? cast(GstCaps*)updatedCaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from BaseTransform
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.base_transform.BaseTransform), T.stringof ~ " is not derived from gid.gstbase1.base_transform.BaseTransform");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcceptCaps", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "accept_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBeforeTransform", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "before_transform");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyMetadata", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "copy_metadata");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFilterMeta", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "filter_meta");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFixateCaps", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "fixate_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGenerateOutput", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "generate_output");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetUnitSize", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "get_unit_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepareOutputBuffer", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "prepare_output_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQuery", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCaps", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "set_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSubmitInputBuffer", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "submit_input_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransform", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "transform");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformCaps", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "transform_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformIp", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "transform_ip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformMeta", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "transform_meta");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformSize", true)[0]) == gid.gstbase1.base_transform.BaseTransform))
      _installVfunc(klass, "transform_size");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstBaseTransformClass*)klass;

    switch (vfunc)
    {
      case "accept_caps":
      {
        static extern(C) gboolean _vfuncAcceptCapsTramp(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.acceptCaps)
              return (cast(typeof(&_vfuncAcceptCapsTramp))_klass.acceptCaps)(trans, direction, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncAcceptCaps(direction, _caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncAcceptCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.acceptCaps = cast(typeof(_klass.acceptCaps))&_vfuncAcceptCapsTramp;
        break;
      }
      case "before_transform":
      {
        static extern(C) void _vfuncBeforeTransformTramp(GstBaseTransform* trans, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.beforeTransform)
              return (cast(typeof(&_vfuncBeforeTransformTramp))_klass.beforeTransform)(trans, buffer);
            return;
          }

          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncBeforeTransform(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncBeforeTransform");
          }
          if (_buffer)
            _buffer._cUnborrow;

        }

        _klass.beforeTransform = cast(typeof(_klass.beforeTransform))&_vfuncBeforeTransformTramp;
        break;
      }
      case "copy_metadata":
      {
        static extern(C) gboolean _vfuncCopyMetadataTramp(GstBaseTransform* trans, GstBuffer* input, GstBuffer* outbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.copyMetadata)
              return (cast(typeof(&_vfuncCopyMetadataTramp))_klass.copyMetadata)(trans, input, outbuf);
            return typeof(return).init;
          }

          bool _dretval;
          auto _input = input ? new gid.gst1.buffer.Buffer(cast(void*)input, Yes.Take)._cBorrow : null;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncCopyMetadata(_input, _outbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncCopyMetadata");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_input)
            _input._cUnborrow;
          if (_outbuf)
            _outbuf._cUnborrow;

          return _retval;
        }

        _klass.copyMetadata = cast(typeof(_klass.copyMetadata))&_vfuncCopyMetadataTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstBaseTransform* trans, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(trans, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "filter_meta":
      {
        static extern(C) gboolean _vfuncFilterMetaTramp(GstBaseTransform* trans, GstQuery* query, GType api, const(GstStructure)* params) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.filterMeta)
              return (cast(typeof(&_vfuncFilterMetaTramp))_klass.filterMeta)(trans, query, api, params);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFilterMeta(_query, api, params ? new gid.gst1.structure.Structure(cast(void*)params, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncFilterMeta");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.filterMeta = cast(typeof(_klass.filterMeta))&_vfuncFilterMetaTramp;
        break;
      }
      case "fixate_caps":
      {
        static extern(C) GstCaps* _vfuncFixateCapsTramp(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps, GstCaps* othercaps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.fixateCaps)
              return (cast(typeof(&_vfuncFixateCapsTramp))_klass.fixateCaps)(trans, direction, caps, othercaps);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFixateCaps(direction, _caps, othercaps ? new gid.gst1.caps.Caps(cast(void*)othercaps, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncFixateCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.fixateCaps = cast(typeof(_klass.fixateCaps))&_vfuncFixateCapsTramp;
        break;
      }
      case "generate_output":
      {
        static extern(C) GstFlowReturn _vfuncGenerateOutputTramp(GstBaseTransform* trans, GstBuffer** outbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.generateOutput)
              return (cast(typeof(&_vfuncGenerateOutputTramp))_klass.generateOutput)(trans, outbuf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          gid.gst1.buffer.Buffer _outbuf;

          try
          {
            _dretval = _obj.vfuncGenerateOutput(_outbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncGenerateOutput");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *outbuf = _outbuf ? cast(GstBuffer*)_outbuf._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.generateOutput = cast(typeof(_klass.generateOutput))&_vfuncGenerateOutputTramp;
        break;
      }
      case "get_unit_size":
      {
        static extern(C) gboolean _vfuncGetUnitSizeTramp(GstBaseTransform* trans, GstCaps* caps, size_t* size) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.getUnitSize)
              return (cast(typeof(&_vfuncGetUnitSizeTramp))_klass.getUnitSize)(trans, caps, size);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetUnitSize(_caps, *size);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncGetUnitSize");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.getUnitSize = cast(typeof(_klass.getUnitSize))&_vfuncGetUnitSizeTramp;
        break;
      }
      case "prepare_output_buffer":
      {
        static extern(C) GstFlowReturn _vfuncPrepareOutputBufferTramp(GstBaseTransform* trans, GstBuffer* input, GstBuffer** outbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.prepareOutputBuffer)
              return (cast(typeof(&_vfuncPrepareOutputBufferTramp))_klass.prepareOutputBuffer)(trans, input, outbuf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _input = input ? new gid.gst1.buffer.Buffer(cast(void*)input, Yes.Take)._cBorrow : null;
          gid.gst1.buffer.Buffer _outbuf;

          try
          {
            _dretval = _obj.vfuncPrepareOutputBuffer(_input, _outbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncPrepareOutputBuffer");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_input)
            _input._cUnborrow;
          *outbuf = _outbuf ? cast(GstBuffer*)_outbuf._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.prepareOutputBuffer = cast(typeof(_klass.prepareOutputBuffer))&_vfuncPrepareOutputBufferTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstBaseTransform* trans, GstQuery* decideQuery, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(trans, decideQuery, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _decideQuery = decideQuery ? new gid.gst1.query.Query(cast(void*)decideQuery, Yes.Take)._cBorrow : null;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncProposeAllocation(_decideQuery, _query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncProposeAllocation");
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
      case "query":
      {
        static extern(C) gboolean _vfuncQueryTramp(GstBaseTransform* trans, GstPadDirection direction, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.query)
              return (cast(typeof(&_vfuncQueryTramp))_klass.query)(trans, direction, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncQuery(direction, _query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.query = cast(typeof(_klass.query))&_vfuncQueryTramp;
        break;
      }
      case "set_caps":
      {
        static extern(C) gboolean _vfuncSetCapsTramp(GstBaseTransform* trans, GstCaps* incaps, GstCaps* outcaps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.setCaps)
              return (cast(typeof(&_vfuncSetCapsTramp))_klass.setCaps)(trans, incaps, outcaps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _incaps = incaps ? new gid.gst1.caps.Caps(cast(void*)incaps, Yes.Take)._cBorrow : null;
          auto _outcaps = outcaps ? new gid.gst1.caps.Caps(cast(void*)outcaps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetCaps(_incaps, _outcaps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncSetCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_incaps)
            _incaps._cUnborrow;
          if (_outcaps)
            _outcaps._cUnborrow;

          return _retval;
        }

        _klass.setCaps = cast(typeof(_klass.setCaps))&_vfuncSetCapsTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstBaseTransform* trans, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(trans, event);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSinkEvent(event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncSinkEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.sinkEvent = cast(typeof(_klass.sinkEvent))&_vfuncSinkEventTramp;
        break;
      }
      case "src_event":
      {
        static extern(C) gboolean _vfuncSrcEventTramp(GstBaseTransform* trans, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(trans, event);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSrcEvent(event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncSrcEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.srcEvent = cast(typeof(_klass.srcEvent))&_vfuncSrcEventTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstBaseTransform* trans) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(trans);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstBaseTransform* trans) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(trans);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "submit_input_buffer":
      {
        static extern(C) GstFlowReturn _vfuncSubmitInputBufferTramp(GstBaseTransform* trans, gboolean isDiscont, GstBuffer* input) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.submitInputBuffer)
              return (cast(typeof(&_vfuncSubmitInputBufferTramp))_klass.submitInputBuffer)(trans, isDiscont, input);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _input = input ? new gid.gst1.buffer.Buffer(cast(void*)input, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSubmitInputBuffer(cast(bool)isDiscont, _input);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncSubmitInputBuffer");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_input)
            _input._cUnborrow;

          return _retval;
        }

        _klass.submitInputBuffer = cast(typeof(_klass.submitInputBuffer))&_vfuncSubmitInputBufferTramp;
        break;
      }
      case "transform":
      {
        static extern(C) GstFlowReturn _vfuncTransformTramp(GstBaseTransform* trans, GstBuffer* inbuf, GstBuffer* outbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.transform)
              return (cast(typeof(&_vfuncTransformTramp))_klass.transform)(trans, inbuf, outbuf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _inbuf = inbuf ? new gid.gst1.buffer.Buffer(cast(void*)inbuf, Yes.Take)._cBorrow : null;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransform(_inbuf, _outbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncTransform");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_inbuf)
            _inbuf._cUnborrow;
          if (_outbuf)
            _outbuf._cUnborrow;

          return _retval;
        }

        _klass.transform = cast(typeof(_klass.transform))&_vfuncTransformTramp;
        break;
      }
      case "transform_caps":
      {
        static extern(C) GstCaps* _vfuncTransformCapsTramp(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.transformCaps)
              return (cast(typeof(&_vfuncTransformCapsTramp))_klass.transformCaps)(trans, direction, caps, filter);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;
          auto _filter = filter ? new gid.gst1.caps.Caps(cast(void*)filter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransformCaps(direction, _caps, _filter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncTransformCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_caps)
            _caps._cUnborrow;
          if (_filter)
            _filter._cUnborrow;

          return _retval;
        }

        _klass.transformCaps = cast(typeof(_klass.transformCaps))&_vfuncTransformCapsTramp;
        break;
      }
      case "transform_ip":
      {
        static extern(C) GstFlowReturn _vfuncTransformIpTramp(GstBaseTransform* trans, GstBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.transformIp)
              return (cast(typeof(&_vfuncTransformIpTramp))_klass.transformIp)(trans, buf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buf = buf ? new gid.gst1.buffer.Buffer(cast(void*)buf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransformIp(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncTransformIp");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buf)
            _buf._cUnborrow;

          return _retval;
        }

        _klass.transformIp = cast(typeof(_klass.transformIp))&_vfuncTransformIpTramp;
        break;
      }
      case "transform_meta":
      {
        static extern(C) gboolean _vfuncTransformMetaTramp(GstBaseTransform* trans, GstBuffer* outbuf, GstMeta* meta, GstBuffer* inbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.transformMeta)
              return (cast(typeof(&_vfuncTransformMetaTramp))_klass.transformMeta)(trans, outbuf, meta, inbuf);
            return typeof(return).init;
          }

          bool _dretval;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;
          auto _meta = meta ? new gid.gst1.meta.Meta(cast(void*)meta, null) : null;
          auto _inbuf = inbuf ? new gid.gst1.buffer.Buffer(cast(void*)inbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransformMeta(_outbuf, _meta, _inbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncTransformMeta");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_outbuf)
            _outbuf._cUnborrow;
          if (_inbuf)
            _inbuf._cUnborrow;

          return _retval;
        }

        _klass.transformMeta = cast(typeof(_klass.transformMeta))&_vfuncTransformMetaTramp;
        break;
      }
      case "transform_size":
      {
        static extern(C) gboolean _vfuncTransformSizeTramp(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps, size_t size, GstCaps* othercaps, size_t* othersize) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_transform.BaseTransform)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstBaseTransformClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.transformSize)
              return (cast(typeof(&_vfuncTransformSizeTramp))_klass.transformSize)(trans, direction, caps, size, othercaps, othersize);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;
          auto _othercaps = othercaps ? new gid.gst1.caps.Caps(cast(void*)othercaps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransformSize(direction, _caps, size, _othercaps, *othersize);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_transform.BaseTransform.vfuncTransformSize");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;
          if (_othercaps)
            _othercaps._cUnborrow;

          return _retval;
        }

        _klass.transformSize = cast(typeof(_klass.transformSize))&_vfuncTransformSizeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.base_transform.BaseTransform]
class BaseTransformGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /** */
  T qos(bool propval) nothrow
  {
    return setProperty("qos", propval);
  }
}

/// Fluent builder for [gid.gstbase1.base_transform.BaseTransform]
final class BaseTransformGidBuilder : BaseTransformGidBuilderImpl!BaseTransformGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BaseTransform build() nothrow
  {
    return new BaseTransform(cast(void*)createGObject(BaseTransform._getGType), Yes.Take);
  }
}
