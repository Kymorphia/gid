/// Module for [BaseTransform] class
module gstbase.base_transform;

import gid.gid;
import gobject.object;
import gst.allocation_params;
import gst.allocator;
import gst.buffer_pool;
import gst.caps;
import gst.element;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

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
    
    $(LIST
      * one sinkpad and one srcpad
      * Possible formats on sink and source pad implemented
        with custom transform_caps function. By default uses
        same format on sink and source.
      
      * Handles state changes
      * Does flushing
      * Push mode
      * Pull mode if the sub-class transform can operate on arbitrary data
    )
      
    # Use Cases
    
    ## Passthrough mode
    
      $(LIST
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
      )
        
    ## Modifications in-place - input buffer and output buffer are the same thing.
    
    $(LIST
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
    )
      
    ## Modifications only to the caps/metadata of a buffer
    
    $(LIST
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
    )
      
    ## Normal mode
      $(LIST
          * always_in_place flag is not set, or there is no transform_ip function
          * Element will receive an input buffer and output buffer to operate on.
          * Output buffer is allocated by calling the prepare_output_buffer function.
          * Example elements:
            * Videoscale, videoconvert, audioconvert when doing
            scaling/conversions
      )
        
    ## Special output buffer allocations
      $(LIST
          * Elements which need to do special allocation of their output buffers
            beyond allocating output buffers via the negotiated allocator or
            buffer pool should implement the prepare_output_buffer method.
        
          * Example elements:
            * efence
      )
        
    # Sub-class settable flags on GstBaseTransform
    
    $(LIST
      * passthrough
      
        * Implies that in the current configuration, the sub-class is not interested in modifying the buffers.
        * Elements which are always in passthrough mode whenever the same caps has been negotiated on both pads can set the class variable passthrough_on_same_caps to have this behaviour automatically.
      
      * always_in_place
        * Determines whether a non-writable buffer will be copied before passing
          to the transform_ip function.
      
        * Implied true if no transform function is implemented.
        * Implied false if ONLY transform function is implemented.
    )
*/
class BaseTransform : gst.element.Element
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
    return cast(void function())gst_base_transform_get_type != &gidSymbolNotFound ? gst_base_transform_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseTransform self()
  {
    return this;
  }

  /** */
  @property bool qos()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("qos");
  }

  /** */
  @property void qos(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("qos", propval);
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
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    gst_base_transform_get_allocator(cast(GstBaseTransform*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
  }

  /** */
  gst.buffer_pool.BufferPool getBufferPool()
  {
    GstBufferPool* _cretval;
    _cretval = gst_base_transform_get_buffer_pool(cast(GstBaseTransform*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      See if trans is configured as a in_place transform.
      Returns: true if the transform is configured in in_place mode.
        
        MT safe.
  */
  bool isInPlace()
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
  bool isPassthrough()
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
  bool isQosEnabled()
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
  bool reconfigure()
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
  void reconfigureSink()
  {
    gst_base_transform_reconfigure_sink(cast(GstBaseTransform*)this._cPtr);
  }

  /**
      Instructs trans to renegotiate a new downstream transform on the next
      buffer. This function is typically called after properties on the transform
      were set that influence the output format.
  */
  void reconfigureSrc()
  {
    gst_base_transform_reconfigure_src(cast(GstBaseTransform*)this._cPtr);
  }

  /**
      If gap_aware is false (the default), output buffers will have the
      [gst.types.BufferFlags.Gap] flag unset.
      
      If set to true, the element must handle output buffers with this flag set
      correctly, i.e. it can assume that the buffer contains neutral data but must
      unset the flag if the output is no neutral data.
      
      MT safe.
  
      Params:
        gapAware = New state
  */
  void setGapAware(bool gapAware)
  {
    gst_base_transform_set_gap_aware(cast(GstBaseTransform*)this._cPtr, gapAware);
  }

  /**
      Determines whether a non-writable buffer will be copied before passing
      to the transform_ip function.
      
        $(LIST
            * Always true if no transform function is implemented.
            * Always false if ONLY transform function is implemented.
        )
          
      MT safe.
  
      Params:
        inPlace = Boolean value indicating that we would like to operate
          on in_place buffers.
  */
  void setInPlace(bool inPlace)
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
  void setPassthrough(bool passthrough)
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
  void setPreferPassthrough(bool preferPassthrough)
  {
    gst_base_transform_set_prefer_passthrough(cast(GstBaseTransform*)this._cPtr, preferPassthrough);
  }

  /**
      Enable or disable QoS handling in the transform.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setQosEnabled(bool enabled)
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
  void updateQos(double proportion, gst.types.ClockTimeDiff diff, gst.types.ClockTime timestamp)
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
  bool updateSrcCaps(gst.caps.Caps updatedCaps)
  {
    bool _retval;
    _retval = cast(bool)gst_base_transform_update_src_caps(cast(GstBaseTransform*)this._cPtr, updatedCaps ? cast(GstCaps*)updatedCaps._cPtr(No.Dup) : null);
    return _retval;
  }
}
