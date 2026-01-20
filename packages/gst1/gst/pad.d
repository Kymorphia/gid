/// Module for [Pad] class
module gst.pad;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.buffer;
import gst.buffer_list;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.element;
import gst.event;
import gst.iterator;
import gst.object;
import gst.pad_probe_info;
import gst.pad_template;
import gst.query;
import gst.static_pad_template;
import gst.stream;
import gst.types;

/**
    A #GstElement is linked to other elements via "pads", which are extremely
    light-weight generic link points.
    
    Pads have a #GstPadDirection, source pads produce data, sink pads consume
    data.
    
    Pads are typically created from a #GstPadTemplate with
    [gst.pad.Pad.newFromTemplate] and are then added to a #GstElement. This usually
    happens when the element is created but it can also happen dynamically based
    on the data that the element is processing or based on the pads that the
    application requests.
    
    Pads without pad templates can be created with [gst.pad.Pad.new_],
    which takes a direction and a name as an argument.  If the name is null,
    then a guaranteed unique name will be assigned to it.
    
    A #GstElement creating a pad will typically use the various
    gst_pad_set_*_function\() calls to register callbacks for events, queries or
    dataflow on the pads.
    
    gst_pad_get_parent() will retrieve the #GstElement that owns the pad.
    
    After two pads are retrieved from an element by [gst.element.Element.getStaticPad],
    the pads can be linked with [gst.pad.Pad.link]. (For quick links,
    you can also use [gst.element.Element.link], which will make the obvious
    link for you if it's straightforward.). Pads can be unlinked again with
    [gst.pad.Pad.unlink]. [gst.pad.Pad.getPeer] can be used to check what the pad is
    linked to.
    
    Before dataflow is possible on the pads, they need to be activated with
    [gst.pad.Pad.setActive].
    
    [gst.pad.Pad.query] and [gst.pad.Pad.peerQuery] can be used to query various
    properties of the pad and the stream.
    
    To send a #GstEvent on a pad, use [gst.pad.Pad.sendEvent] and
    [gst.pad.Pad.pushEvent]. Some events will be sticky on the pad, meaning that
    after they pass on the pad they can be queried later with
    [gst.pad.Pad.getStickyEvent] and [gst.pad.Pad.stickyEventsForeach].
    [gst.pad.Pad.getCurrentCaps] and [gst.pad.Pad.hasCurrentCaps] are convenience
    functions to query the current sticky CAPS event on a pad.
    
    GstElements will use [gst.pad.Pad.push] and [gst.pad.Pad.pullRange] to push out
    or pull in a buffer.
    
    The dataflow, events and queries that happen on a pad can be monitored with
    probes that can be installed with [gst.pad.Pad.addProbe]. [gst.pad.Pad.isBlocked]
    can be used to check if a block probe is installed on the pad.
    [gst.pad.Pad.isBlocking] checks if the blocking probe is currently blocking the
    pad. [gst.pad.Pad.removeProbe] is used to remove a previously installed probe
    and unblock blocking probes if any.
    
    Pad have an offset that can be retrieved with [gst.pad.Pad.getOffset]. This
    offset will be applied to the running_time of all data passing over the pad.
    [gst.pad.Pad.setOffset] can be used to change the offset.
    
    Convenience functions exist to start, pause and stop the task on a pad with
    [gst.pad.Pad.startTask], [gst.pad.Pad.pauseTask] and [gst.pad.Pad.stopTask]
    respectively.
*/
class Pad : gst.object.ObjectWrap
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
    return cast(void function())gst_pad_get_type != &gidSymbolNotFound ? gst_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Pad self()
  {
    return this;
  }

  /** */
  @property gst.caps.Caps caps()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.caps.Caps)("caps");
  }

  /**
      Get `offset` property.
      Returns: The offset that will be applied to the running time of the pad.
  */
  @property long offset()
  {
    return getOffset();
  }

  /**
      Set `offset` property.
      Params:
        propval = The offset that will be applied to the running time of the pad.
  */
  @property void offset(long propval)
  {
    return setOffset(propval);
  }

  /** */
  @property gst.pad_template.PadTemplate template_()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.pad_template.PadTemplate)("template");
  }

  /** */
  @property void template_(gst.pad_template.PadTemplate propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.pad_template.PadTemplate)("template", propval);
  }

  /**
      Creates a new pad with the given name in the given direction.
      If name is null, a guaranteed unique name (across all pads)
      will be assigned.
      This function makes a copy of the name so you can safely free the name.
  
      Params:
        name = the name of the new pad.
        direction = the #GstPadDirection of the pad.
      Returns: a new #GstPad.
        
        MT safe.
  */
  this(string name, gst.types.PadDirection direction)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_pad_new(_name, direction);
    this(_cretval, No.Take);
  }

  /**
      Creates a new pad with the given name from the given static template.
      If name is null, a guaranteed unique name (across all pads)
      will be assigned.
      This function makes a copy of the name so you can safely free the name.
  
      Params:
        templ = the #GstStaticPadTemplate to use
        name = the name of the pad
      Returns: a new #GstPad.
  */
  static gst.pad.Pad newFromStaticTemplate(gst.static_pad_template.StaticPadTemplate templ, string name)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_pad_new_from_static_template(templ ? cast(GstStaticPadTemplate*)templ._cPtr : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new pad with the given name from the given template.
      If name is null, a guaranteed unique name (across all pads)
      will be assigned.
      This function makes a copy of the name so you can safely free the name.
  
      Params:
        templ = the pad template to use
        name = the name of the pad
      Returns: a new #GstPad.
  */
  static gst.pad.Pad newFromTemplate(gst.pad_template.PadTemplate templ, string name = null)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_pad_new_from_template(templ ? cast(GstPadTemplate*)templ._cPtr(No.Dup) : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a string representing the given pad-link return.
  
      Params:
        ret = a #GstPadLinkReturn to get the name of.
      Returns: a static string with the name of the pad-link return.
  */
  static string linkGetName(gst.types.PadLinkReturn ret)
  {
    const(char)* _cretval;
    _cretval = gst_pad_link_get_name(ret);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Activates or deactivates the given pad in mode via dispatching to the
      pad's activatemodefunc. For use from within pad activation functions only.
      
      If you don't know what this is, you probably don't want to call it.
  
      Params:
        mode = the requested activation mode
        active = whether or not the pad should be active.
      Returns: true if the operation was successful.
        
        MT safe.
  */
  bool activateMode(gst.types.PadMode mode, bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_activate_mode(cast(GstPad*)this._cPtr, mode, active);
    return _retval;
  }

  /**
      Be notified of different states of pads. The provided callback is called for
      every state that matches mask.
      
      Probes are called in groups: First GST_PAD_PROBE_TYPE_BLOCK probes are
      called, then others, then finally GST_PAD_PROBE_TYPE_IDLE. The only
      exception here are GST_PAD_PROBE_TYPE_IDLE probes that are called
      immediately if the pad is already idle while calling [gst.pad.Pad.addProbe].
      In each of the groups, probes are called in the order in which they were
      added.
  
      Params:
        mask = the probe mask
        callback = #GstPadProbeCallback that will be called with notifications of
                    the pad state
      Returns: an id or 0 if no probe is pending. The id can be used to remove the
        probe with [gst.pad.Pad.removeProbe]. When using GST_PAD_PROBE_TYPE_IDLE it can
        happen that the probe can be run immediately and if the probe returns
        GST_PAD_PROBE_REMOVE this functions returns 0.
        
        MT safe.
  */
  gulong addProbe(gst.types.PadProbeType mask, gst.types.PadProbeCallback callback)
  {
    extern(C) GstPadProbeReturn _callbackCallback(GstPad* pad, GstPadProbeInfo* info, void* userData)
    {
      gst.types.PadProbeReturn _dretval;
      auto _dlg = cast(gst.types.PadProbeCallback*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take), info ? new gst.pad_probe_info.PadProbeInfo(cast(void*)info, No.Take) : null);
      auto _retval = cast(GstPadProbeReturn)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    gulong _retval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _retval = gst_pad_add_probe(cast(GstPad*)this._cPtr, mask, _callbackCB, _callback, _callbackDestroyCB);
    return _retval;
  }

  /**
      Checks if the source pad and the sink pad are compatible so they can be
      linked.
  
      Params:
        sinkpad = the sink #GstPad.
      Returns: true if the pads can be linked.
  */
  bool canLink(gst.pad.Pad sinkpad)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_can_link(cast(GstPad*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Chain a buffer to pad.
      
      The function returns #GST_FLOW_FLUSHING if the pad was flushing.
      
      If the buffer type is not acceptable for pad (as negotiated with a
      preceding GST_EVENT_CAPS event), this function returns
      #GST_FLOW_NOT_NEGOTIATED.
      
      The function proceeds calling the chain function installed on pad (see
      gst_pad_set_chain_function()) and the return value of that function is
      returned to the caller. #GST_FLOW_NOT_SUPPORTED is returned if pad has no
      chain function.
      
      In all cases, success or failure, the caller loses its reference to buffer
      after calling this function.
  
      Params:
        buffer = the #GstBuffer to send, return GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the pad.
        
        MT safe.
  */
  gst.types.FlowReturn chain(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_chain(cast(GstPad*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Chain a bufferlist to pad.
      
      The function returns #GST_FLOW_FLUSHING if the pad was flushing.
      
      If pad was not negotiated properly with a CAPS event, this function
      returns #GST_FLOW_NOT_NEGOTIATED.
      
      The function proceeds calling the chainlist function installed on pad (see
      gst_pad_set_chain_list_function()) and the return value of that function is
      returned to the caller. #GST_FLOW_NOT_SUPPORTED is returned if pad has no
      chainlist function.
      
      In all cases, success or failure, the caller loses its reference to list
      after calling this function.
      
      MT safe.
  
      Params:
        list = the #GstBufferList to send, return GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the pad.
  */
  gst.types.FlowReturn chainList(gst.buffer_list.BufferList list)
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_chain_list(cast(GstPad*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Check and clear the #GST_PAD_FLAG_NEED_RECONFIGURE flag on pad and return true
      if the flag was set.
      Returns: true is the GST_PAD_FLAG_NEED_RECONFIGURE flag was set on pad.
  */
  bool checkReconfigure()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_check_reconfigure(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Creates a stream-id for the source #GstPad pad by combining the
      upstream information with the optional stream_id of the stream
      of pad. pad must have a parent #GstElement and which must have zero
      or one sinkpad. stream_id can only be null if the parent element
      of pad has only a single source pad.
      
      This function generates an unique stream-id by getting the upstream
      stream-start event stream ID and appending stream_id to it. If the
      element has no sinkpad it will generate an upstream stream-id by
      doing an URI query on the element and in the worst case just uses
      a random number. Source elements that don't implement the URI
      handler interface should ideally generate a unique, deterministic
      stream-id manually instead.
      
      Since stream IDs are sorted alphabetically, any numbers in the
      stream ID should be printed with a fixed number of characters,
      preceded by 0's, such as by using the format \`03u` instead of \`u`.
  
      Params:
        parent = Parent #GstElement of pad
        streamId = The stream-id
      Returns: A stream-id for pad. [glib.global.gfree] after usage.
  */
  string createStreamId(gst.element.Element parent, string streamId = null)
  {
    char* _cretval;
    const(char)* _streamId = streamId.toCString(No.Alloc);
    _cretval = gst_pad_create_stream_id(cast(GstPad*)this._cPtr, parent ? cast(GstElement*)parent._cPtr(No.Dup) : null, _streamId);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Invokes the default event handler for the given pad.
      
      The EOS event will pause the task associated with pad before it is forwarded
      to all internally linked pads,
      
      The event is sent to all pads internally linked to pad. This function
      takes ownership of event.
  
      Params:
        parent = the parent of pad or null
        event = the #GstEvent to handle.
      Returns: true if the event was sent successfully.
  */
  bool eventDefault(gst.object.ObjectWrap parent, gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_event_default(cast(GstPad*)this._cPtr, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Calls forward for all internally linked pads of pad. This function deals with
      dynamically changing internal pads and will make sure that the forward
      function is only called once for each pad.
      
      When forward returns true, no further pads will be processed.
  
      Params:
        forward = a #GstPadForwardFunction
      Returns: true if one of the dispatcher functions returned true.
  */
  bool forward(gst.types.PadForwardFunction forward)
  {
    extern(C) gboolean _forwardCallback(GstPad* pad, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.PadForwardFunction*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _forwardCB = forward ? &_forwardCallback : null;
    bool _retval;
    auto _forward = forward ? cast(void*)&(forward) : null;
    _retval = cast(bool)gst_pad_forward(cast(GstPad*)this._cPtr, _forwardCB, _forward);
    return _retval;
  }

  /**
      Gets the capabilities of the allowed media types that can flow through
      pad and its peer.
      
      The allowed capabilities is calculated as the intersection of the results of
      calling [gst.pad.Pad.queryCaps] on pad and its peer. The caller owns a reference
      on the resulting caps.
      Returns: the allowed #GstCaps of the
            pad link. Unref the caps when you no longer need it. This
            function returns null when pad has no peer.
        
        MT safe.
  */
  gst.caps.Caps getAllowedCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_pad_get_allowed_caps(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the capabilities currently configured on pad with the last
      #GST_EVENT_CAPS event.
      Returns: the current caps of the pad with
        incremented ref-count or null when pad has no caps. Unref after usage.
  */
  gst.caps.Caps getCurrentCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_pad_get_current_caps(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the direction of the pad. The direction of the pad is
      decided at construction time so this function does not take
      the LOCK.
      Returns: the #GstPadDirection of the pad.
        
        MT safe.
  */
  gst.types.PadDirection getDirection()
  {
    GstPadDirection _cretval;
    _cretval = gst_pad_get_direction(cast(GstPad*)this._cPtr);
    gst.types.PadDirection _retval = cast(gst.types.PadDirection)_cretval;
    return _retval;
  }

  /**
      Gets the private data of a pad.
      No locking is performed in this function.
      Returns: a #gpointer to the private data.
  */
  void* getElementPrivate()
  {
    auto _retval = gst_pad_get_element_private(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GstFlowReturn return from the last data passed by this pad.
      Returns: 
  */
  gst.types.FlowReturn getLastFlowReturn()
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_get_last_flow_return(cast(GstPad*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the offset applied to the running time of pad. pad has to be a source
      pad.
      Returns: the offset.
  */
  long getOffset()
  {
    long _retval;
    _retval = gst_pad_get_offset(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Gets the template for pad.
      Returns: the #GstPadTemplate from which
            this pad was instantiated, or null if this pad has no
            template. Unref after usage.
  */
  gst.pad_template.PadTemplate getPadTemplate()
  {
    GstPadTemplate* _cretval;
    _cretval = gst_pad_get_pad_template(cast(GstPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the capabilities for pad's template.
      Returns: the #GstCaps of this pad template.
        Unref after usage.
  */
  gst.caps.Caps getPadTemplateCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_pad_get_pad_template_caps(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the parent of pad, cast to a #GstElement. If a pad has no parent or
      its parent is not an element, return null.
      Returns: the parent of the pad. The
        caller has a reference on the parent, so unref when you're finished
        with it.
        
        MT safe.
  */
  gst.element.Element getParentElement()
  {
    GstElement* _cretval;
    _cretval = gst_pad_get_parent_element(cast(GstPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the peer of pad. This function refs the peer pad so
      you need to unref it after use.
      Returns: the peer #GstPad. Unref after usage.
        
        MT safe.
  */
  gst.pad.Pad getPeer()
  {
    GstPad* _cretval;
    _cretval = gst_pad_get_peer(cast(GstPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      When pad is flushing this function returns #GST_FLOW_FLUSHING
      immediately and buffer is null.
      
      Calls the getrange function of pad, see #GstPadGetRangeFunction for a
      description of a getrange function. If pad has no getrange function
      installed (see gst_pad_set_getrange_function()) this function returns
      #GST_FLOW_NOT_SUPPORTED.
      
      If buffer points to a variable holding null, a valid new #GstBuffer will be
      placed in buffer when this function returns #GST_FLOW_OK. The new buffer
      must be freed with gst_buffer_unref() after usage.
      
      When buffer points to a variable that points to a valid #GstBuffer, the
      buffer will be filled with the result data when this function returns
      #GST_FLOW_OK. If the provided buffer is larger than size, only
      size bytes will be filled in the result buffer and its size will be updated
      accordingly.
      
      Note that less than size bytes can be returned in buffer when, for example,
      an EOS condition is near or when buffer is not large enough to hold size
      bytes. The caller should check the result buffer size to get the result size.
      
      When this function returns any other result value than #GST_FLOW_OK, buffer
      will be unchanged.
      
      This is a lowlevel function. Usually [gst.pad.Pad.pullRange] is used.
  
      Params:
        offset = The start offset of the buffer
        size = The length of the buffer
        buffer = a pointer to hold the #GstBuffer,
              returns #GST_FLOW_ERROR if null.
      Returns: a #GstFlowReturn from the pad.
        
        MT safe.
  */
  gst.types.FlowReturn getRange(ulong offset, uint size, out gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_pad_get_range(cast(GstPad*)this._cPtr, offset, size, &_buffer);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    buffer = new gst.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      If there is a single internal link of the given pad, this function will
      return it. Otherwise, it will return NULL.
      Returns: a #GstPad, or null if pad has none
        or more than one internal links. Unref returned pad with
        [gst.object.ObjectWrap.unref].
  */
  gst.pad.Pad getSingleInternalLink()
  {
    GstPad* _cretval;
    _cretval = gst_pad_get_single_internal_link(cast(GstPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a new reference of the sticky event of type event_type
      from the event.
  
      Params:
        eventType = the #GstEventType that should be retrieved.
        idx = the index of the event
      Returns: a #GstEvent of type
        event_type or null when no event of event_type was on
        pad. Unref after usage.
  */
  gst.event.Event getStickyEvent(gst.types.EventType eventType, uint idx)
  {
    GstEvent* _cretval;
    _cretval = gst_pad_get_sticky_event(cast(GstPad*)this._cPtr, eventType, idx);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the current #GstStream for the pad, or null if none has been
      set yet, i.e. the pad has not received a stream-start event yet.
      
      This is a convenience wrapper around [gst.pad.Pad.getStickyEvent] and
      [gst.event.Event.parseStream].
      Returns: the current #GstStream for pad, or null.
            unref the returned stream when no longer needed.
  */
  gst.stream.Stream getStream()
  {
    GstStream* _cretval;
    _cretval = gst_pad_get_stream(cast(GstPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.stream.Stream)(cast(GstStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the current stream-id for the pad, or null if none has been
      set yet, i.e. the pad has not received a stream-start event yet.
      
      This is a convenience wrapper around [gst.pad.Pad.getStickyEvent] and
      [gst.event.Event.parseStreamStart].
      
      The returned stream-id string should be treated as an opaque string, its
      contents should not be interpreted.
      Returns: a newly-allocated copy of the stream-id for
            pad, or null.  [glib.global.gfree] the returned string when no longer
            needed.
  */
  string getStreamId()
  {
    char* _cretval;
    _cretval = gst_pad_get_stream_id(cast(GstPad*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get pad task state. If no task is currently
      set, #GST_TASK_STOPPED is returned.
      Returns: The current state of pad's task.
  */
  gst.types.TaskState getTaskState()
  {
    GstTaskState _cretval;
    _cretval = gst_pad_get_task_state(cast(GstPad*)this._cPtr);
    gst.types.TaskState _retval = cast(gst.types.TaskState)_cretval;
    return _retval;
  }

  /**
      Check if pad has caps set on it with a #GST_EVENT_CAPS event.
      Returns: true when pad has caps associated with it.
  */
  bool hasCurrentCaps()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_has_current_caps(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Query if a pad is active
      Returns: true if the pad is active.
        
        MT safe.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_is_active(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the pad is blocked or not. This function returns the
      last requested state of the pad. It is not certain that the pad
      is actually blocking at this point (see [gst.pad.Pad.isBlocking]).
      Returns: true if the pad is blocked.
        
        MT safe.
  */
  bool isBlocked()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_is_blocked(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the pad is blocking or not. This is a guaranteed state
      of whether the pad is actually blocking on a #GstBuffer or a #GstEvent.
      Returns: true if the pad is blocking.
        
        MT safe.
  */
  bool isBlocking()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_is_blocking(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a pad is linked to another pad or not.
      Returns: true if the pad is linked, false otherwise.
        
        MT safe.
  */
  bool isLinked()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_is_linked(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Gets an iterator for the pads to which the given pad is linked to inside
      of the parent element.
      
      Each #GstPad element yielded by the iterator will have its refcount increased,
      so unref after use.
      
      Free-function: gst_iterator_free
      Returns: a new #GstIterator of #GstPad
            or null when the pad does not have an iterator function
            configured. Use [gst.iterator.Iterator.free] after usage.
  */
  gst.iterator.Iterator iterateInternalLinks()
  {
    GstIterator* _cretval;
    _cretval = gst_pad_iterate_internal_links(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Iterate the list of pads to which the given pad is linked to inside of
      the parent element.
      This is the default handler, and thus returns an iterator of all of the
      pads inside the parent element with opposite direction.
      
      The caller must free this iterator after use with [gst.iterator.Iterator.free].
  
      Params:
        parent = the parent of pad or null
      Returns: a #GstIterator of #GstPad, or null if pad
        has no parent. Unref each returned pad with [gst.object.ObjectWrap.unref].
  */
  gst.iterator.Iterator iterateInternalLinksDefault(gst.object.ObjectWrap parent = null)
  {
    GstIterator* _cretval;
    _cretval = gst_pad_iterate_internal_links_default(cast(GstPad*)this._cPtr, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Links the source pad and the sink pad.
  
      Params:
        sinkpad = the sink #GstPad to link.
      Returns: A result code indicating if the connection worked or
                 what went wrong.
        
        MT Safe.
  */
  gst.types.PadLinkReturn link(gst.pad.Pad sinkpad)
  {
    GstPadLinkReturn _cretval;
    _cretval = gst_pad_link(cast(GstPad*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null);
    gst.types.PadLinkReturn _retval = cast(gst.types.PadLinkReturn)_cretval;
    return _retval;
  }

  /**
      Links the source pad and the sink pad.
      
      This variant of #gst_pad_link provides a more granular control on the
      checks being done when linking. While providing some considerable speedups
      the caller of this method must be aware that wrong usage of those flags
      can cause severe issues. Refer to the documentation of #GstPadLinkCheck
      for more information.
      
      MT Safe.
  
      Params:
        sinkpad = the sink #GstPad to link.
        flags = the checks to validate when linking
      Returns: A result code indicating if the connection worked or
                 what went wrong.
  */
  gst.types.PadLinkReturn linkFull(gst.pad.Pad sinkpad, gst.types.PadLinkCheck flags)
  {
    GstPadLinkReturn _cretval;
    _cretval = gst_pad_link_full(cast(GstPad*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null, flags);
    gst.types.PadLinkReturn _retval = cast(gst.types.PadLinkReturn)_cretval;
    return _retval;
  }

  /**
      Links src to sink, creating any #GstGhostPad's in between as necessary.
      
      This is a convenience function to save having to create and add intermediate
      #GstGhostPad's as required for linking across #GstBin boundaries.
      
      If src or sink pads don't have parent elements or do not share a common
      ancestor, the link will fail.
  
      Params:
        sink = a #GstPad
      Returns: whether the link succeeded.
  */
  bool linkMaybeGhosting(gst.pad.Pad sink)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_link_maybe_ghosting(cast(GstPad*)this._cPtr, sink ? cast(GstPad*)sink._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Links src to sink, creating any #GstGhostPad's in between as necessary.
      
      This is a convenience function to save having to create and add intermediate
      #GstGhostPad's as required for linking across #GstBin boundaries.
      
      If src or sink pads don't have parent elements or do not share a common
      ancestor, the link will fail.
      
      Calling [gst.pad.Pad.linkMaybeGhostingFull] with
      flags == [gst.types.PadLinkCheck.Default] is the recommended way of linking
      pads with safety checks applied.
  
      Params:
        sink = a #GstPad
        flags = some #GstPadLinkCheck flags
      Returns: whether the link succeeded.
  */
  bool linkMaybeGhostingFull(gst.pad.Pad sink, gst.types.PadLinkCheck flags)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_link_maybe_ghosting_full(cast(GstPad*)this._cPtr, sink ? cast(GstPad*)sink._cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      Mark a pad for needing reconfiguration. The next call to
      [gst.pad.Pad.checkReconfigure] will return true after this call.
  */
  void markReconfigure()
  {
    gst_pad_mark_reconfigure(cast(GstPad*)this._cPtr);
  }

  /**
      Check the #GST_PAD_FLAG_NEED_RECONFIGURE flag on pad and return true
      if the flag was set.
      Returns: true is the GST_PAD_FLAG_NEED_RECONFIGURE flag is set on pad.
  */
  bool needsReconfigure()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_needs_reconfigure(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Pause the task of pad. This function will also wait until the
      function executed by the task is finished if this function is not
      called from the task function.
      Returns: a true if the task could be paused or false when the pad
        has no task.
  */
  bool pauseTask()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_pause_task(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Performs [gst.pad.Pad.query] on the peer of pad.
      
      The caller is responsible for both the allocation and deallocation of
      the query structure.
  
      Params:
        query = the #GstQuery to perform.
      Returns: true if the query could be performed. This function returns false
        if pad has no peer.
  */
  bool peerQuery(gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_peer_query(cast(GstPad*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if the peer of pad accepts caps. If pad has no peer, this function
      returns true.
  
      Params:
        caps = a #GstCaps to check on the pad
      Returns: true if the peer of pad can accept the caps or pad has no peer.
  */
  bool peerQueryAcceptCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_peer_query_accept_caps(cast(GstPad*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the capabilities of the peer connected to this pad. Similar to
      [gst.pad.Pad.queryCaps].
      
      When called on srcpads filter contains the caps that
      upstream could produce in the order preferred by upstream. When
      called on sinkpads filter contains the caps accepted by
      downstream in the preferred order. filter might be null but
      if it is not null the returned caps will be a subset of filter.
  
      Params:
        filter = a #GstCaps filter, or null.
      Returns: the caps of the peer pad with incremented
        ref-count. When there is no peer pad, this function returns filter or,
        when filter is null, ANY caps.
  */
  gst.caps.Caps peerQueryCaps(gst.caps.Caps filter = null)
  {
    GstCaps* _cretval;
    _cretval = gst_pad_peer_query_caps(cast(GstPad*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the peer pad of a given sink pad to convert src_val in src_format
      to dest_format.
  
      Params:
        srcFormat = a #GstFormat to convert from.
        srcVal = a value to convert.
        destFormat = the #GstFormat to convert to.
        destVal = a pointer to the result.
      Returns: true if the query could be performed.
  */
  bool peerQueryConvert(gst.types.Format srcFormat, long srcVal, gst.types.Format destFormat, out long destVal)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_peer_query_convert(cast(GstPad*)this._cPtr, srcFormat, srcVal, destFormat, cast(long*)&destVal);
    return _retval;
  }

  /**
      Queries the peer pad of a given sink pad for the total stream duration.
  
      Params:
        format = the #GstFormat requested
        duration = a location in which to store the total
              duration, or null.
      Returns: true if the query could be performed.
  */
  bool peerQueryDuration(gst.types.Format format, out long duration)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_peer_query_duration(cast(GstPad*)this._cPtr, format, cast(long*)&duration);
    return _retval;
  }

  /**
      Queries the peer of a given sink pad for the stream position.
  
      Params:
        format = the #GstFormat requested
        cur = a location in which to store the current
              position, or null.
      Returns: true if the query could be performed.
  */
  bool peerQueryPosition(gst.types.Format format, out long cur)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_peer_query_position(cast(GstPad*)this._cPtr, format, cast(long*)&cur);
    return _retval;
  }

  /**
      Checks if all internally linked pads of pad accepts the caps in query and
      returns the intersection of the results.
      
      This function is useful as a default accept caps query function for an element
      that can handle any stream format, but requires caps that are acceptable for
      all opposite pads.
  
      Params:
        query = an ACCEPT_CAPS #GstQuery.
      Returns: true if query could be executed
  */
  bool proxyQueryAcceptCaps(gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_proxy_query_accept_caps(cast(GstPad*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls [gst.pad.Pad.queryCaps] for all internally linked pads of pad and returns
      the intersection of the results.
      
      This function is useful as a default caps query function for an element
      that can handle any stream format, but requires all its pads to have
      the same caps.  Two such elements are tee and adder.
  
      Params:
        query = a CAPS #GstQuery.
      Returns: true if query could be executed
  */
  bool proxyQueryCaps(gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_proxy_query_caps(cast(GstPad*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Pulls a buffer from the peer pad or fills up a provided buffer.
      
      This function will first trigger the pad block signal if it was
      installed.
      
      When pad is not linked #GST_FLOW_NOT_LINKED is returned else this
      function returns the result of [gst.pad.Pad.getRange] on the peer pad.
      See [gst.pad.Pad.getRange] for a list of return values and for the
      semantics of the arguments of this function.
      
      If buffer points to a variable holding null, a valid new #GstBuffer will be
      placed in buffer when this function returns #GST_FLOW_OK. The new buffer
      must be freed with gst_buffer_unref() after usage. When this function
      returns any other result value, buffer will still point to null.
      
      When buffer points to a variable that points to a valid #GstBuffer, the
      buffer will be filled with the result data when this function returns
      #GST_FLOW_OK. When this function returns any other result value,
      buffer will be unchanged. If the provided buffer is larger than size, only
      size bytes will be filled in the result buffer and its size will be updated
      accordingly.
      
      Note that less than size bytes can be returned in buffer when, for example,
      an EOS condition is near or when buffer is not large enough to hold size
      bytes. The caller should check the result buffer size to get the result size.
  
      Params:
        offset = The start offset of the buffer
        size = The length of the buffer
        buffer = a pointer to hold the #GstBuffer, returns
              GST_FLOW_ERROR if null.
      Returns: a #GstFlowReturn from the peer pad.
        
        MT safe.
  */
  gst.types.FlowReturn pullRange(ulong offset, uint size, out gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_pad_pull_range(cast(GstPad*)this._cPtr, offset, size, &_buffer);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    buffer = new gst.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Pushes a buffer to the peer of pad.
      
      This function will call installed block probes before triggering any
      installed data probes.
      
      The function proceeds calling [gst.pad.Pad.chain] on the peer pad and returns
      the value from that function. If pad has no peer, #GST_FLOW_NOT_LINKED will
      be returned.
      
      In all cases, success or failure, the caller loses its reference to buffer
      after calling this function.
  
      Params:
        buffer = the #GstBuffer to push returns GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the peer pad.
        
        MT safe.
  */
  gst.types.FlowReturn push(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_push(cast(GstPad*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sends the event to the peer of the given pad. This function is
      mainly used by elements to send events to their peer
      elements.
      
      This function takes ownership of the provided event so you should
      gst_event_ref() it if you want to reuse the event after this call.
  
      Params:
        event = the #GstEvent to send to the pad.
      Returns: true if the event was handled.
        
        MT safe.
  */
  bool pushEvent(gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_push_event(cast(GstPad*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Pushes a buffer list to the peer of pad.
      
      This function will call installed block probes before triggering any
      installed data probes.
      
      The function proceeds calling the chain function on the peer pad and returns
      the value from that function. If pad has no peer, #GST_FLOW_NOT_LINKED will
      be returned. If the peer pad does not have any installed chainlist function
      every group buffer of the list will be merged into a normal #GstBuffer and
      chained via [gst.pad.Pad.chain].
      
      In all cases, success or failure, the caller loses its reference to list
      after calling this function.
  
      Params:
        list = the #GstBufferList to push returns GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the peer pad.
        
        MT safe.
  */
  gst.types.FlowReturn pushList(gst.buffer_list.BufferList list)
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_push_list(cast(GstPad*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Dispatches a query to a pad. The query should have been allocated by the
      caller via one of the type-specific allocation functions. The element that
      the pad belongs to is responsible for filling the query with an appropriate
      response, which should then be parsed with a type-specific query parsing
      function.
      
      Again, the caller is responsible for both the allocation and deallocation of
      the query structure.
      
      Please also note that some queries might need a running pipeline to work.
  
      Params:
        query = the #GstQuery to perform.
      Returns: true if the query could be performed.
  */
  bool query(gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query(cast(GstPad*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if the given pad accepts the caps.
  
      Params:
        caps = a #GstCaps to check on the pad
      Returns: true if the pad can accept the caps.
  */
  bool queryAcceptCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query_accept_caps(cast(GstPad*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the capabilities this pad can produce or consume.
      Note that this method doesn't necessarily return the caps set by sending a
      [gst.event.Event.newCaps] - use [gst.pad.Pad.getCurrentCaps] for that instead.
      gst_pad_query_caps returns all possible caps a pad can operate with, using
      the pad's CAPS query function, If the query fails, this function will return
      filter, if not null, otherwise ANY.
      
      When called on sinkpads filter contains the caps that
      upstream could produce in the order preferred by upstream. When
      called on srcpads filter contains the caps accepted by
      downstream in the preferred order. filter might be null but
      if it is not null the returned caps will be a subset of filter.
      
      Note that this function does not return writable #GstCaps, use
      gst_caps_make_writable() before modifying the caps.
  
      Params:
        filter = suggested #GstCaps, or null
      Returns: the caps of the pad with incremented ref-count.
  */
  gst.caps.Caps queryCaps(gst.caps.Caps filter = null)
  {
    GstCaps* _cretval;
    _cretval = gst_pad_query_caps(cast(GstPad*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries a pad to convert src_val in src_format to dest_format.
  
      Params:
        srcFormat = a #GstFormat to convert from.
        srcVal = a value to convert.
        destFormat = the #GstFormat to convert to.
        destVal = a pointer to the result.
      Returns: true if the query could be performed.
  */
  bool queryConvert(gst.types.Format srcFormat, long srcVal, gst.types.Format destFormat, out long destVal)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query_convert(cast(GstPad*)this._cPtr, srcFormat, srcVal, destFormat, cast(long*)&destVal);
    return _retval;
  }

  /**
      Invokes the default query handler for the given pad.
      The query is sent to all pads internally linked to pad. Note that
      if there are many possible sink pads that are internally linked to
      pad, only one will be sent the query.
      Multi-sinkpad elements should implement custom query handlers.
  
      Params:
        parent = the parent of pad or null
        query = the #GstQuery to handle.
      Returns: true if the query was performed successfully.
  */
  bool queryDefault(gst.object.ObjectWrap parent, gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query_default(cast(GstPad*)this._cPtr, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Queries a pad for the total stream duration.
  
      Params:
        format = the #GstFormat requested
        duration = a location in which to store the total
              duration, or null.
      Returns: true if the query could be performed.
  */
  bool queryDuration(gst.types.Format format, out long duration)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query_duration(cast(GstPad*)this._cPtr, format, cast(long*)&duration);
    return _retval;
  }

  /**
      Queries a pad for the stream position.
  
      Params:
        format = the #GstFormat requested
        cur = A location in which to store the current position, or null.
      Returns: true if the query could be performed.
  */
  bool queryPosition(gst.types.Format format, out long cur)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query_position(cast(GstPad*)this._cPtr, format, cast(long*)&cur);
    return _retval;
  }

  /**
      Remove the probe with id from pad.
      
      MT safe.
  
      Params:
        id = the probe id to remove
  */
  void removeProbe(gulong id)
  {
    gst_pad_remove_probe(cast(GstPad*)this._cPtr, id);
  }

  /**
      Sends the event to the pad. This function can be used
      by applications to send events in the pipeline.
      
      If pad is a source pad, event should be an upstream event. If pad is a
      sink pad, event should be a downstream event. For example, you would not
      send a #GST_EVENT_EOS on a src pad; EOS events only propagate downstream.
      Furthermore, some downstream events have to be serialized with data flow,
      like EOS, while some can travel out-of-band, like #GST_EVENT_FLUSH_START. If
      the event needs to be serialized with data flow, this function will take the
      pad's stream lock while calling its event function.
      
      To find out whether an event type is upstream, downstream, or downstream and
      serialized, see #GstEventTypeFlags, [gst.global.eventTypeGetFlags],
      #GST_EVENT_IS_UPSTREAM, #GST_EVENT_IS_DOWNSTREAM, and
      #GST_EVENT_IS_SERIALIZED. Note that in practice that an application or
      plugin doesn't need to bother itself with this information; the core handles
      all necessary locks and checks.
      
      This function takes ownership of the provided event so you should
      gst_event_ref() it if you want to reuse the event after this call.
  
      Params:
        event = the #GstEvent to send to the pad.
      Returns: true if the event was handled.
  */
  bool sendEvent(gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_send_event(cast(GstPad*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Activates or deactivates the given pad.
      Normally called from within core state change functions.
      
      If active, makes sure the pad is active. If it is already active, either in
      push or pull mode, just return. Otherwise dispatches to the pad's activate
      function to perform the actual activation.
      
      If not active, calls [gst.pad.Pad.activateMode] with the pad's current mode
      and a false argument.
  
      Params:
        active = whether or not the pad should be active.
      Returns: true if the operation was successful.
        
        MT safe.
  */
  bool setActive(bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_set_active(cast(GstPad*)this._cPtr, active);
    return _retval;
  }

  /**
      Set the given private data gpointer on the pad.
      This function can only be used by the element that owns the pad.
      No locking is performed in this function.
  
      Params:
        priv = The private data to attach to the pad.
  */
  void setElementPrivate(void* priv = null)
  {
    gst_pad_set_element_private(cast(GstPad*)this._cPtr, priv);
  }

  /**
      Set the offset that will be applied to the running time of pad.
  
      Params:
        offset = the offset
  */
  void setOffset(long offset)
  {
    gst_pad_set_offset(cast(GstPad*)this._cPtr, offset);
  }

  /**
      Starts a task that repeatedly calls func with user_data. This function
      is mostly used in pad activation functions to start the dataflow.
      The #GST_PAD_STREAM_LOCK of pad will automatically be acquired
      before func is called.
  
      Params:
        func = the task function to call
      Returns: a true if the task could be started.
  */
  bool startTask(gst.types.TaskFunction func)
  {
    extern(C) void _funcCallback(void* userData)
    {
      auto _dlg = cast(gst.types.TaskFunction*)userData;

      (*_dlg)();
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _retval = cast(bool)gst_pad_start_task(cast(GstPad*)this._cPtr, _funcCB, _func, _funcDestroyCB);
    return _retval;
  }

  /**
      Iterates all sticky events on pad and calls foreach_func for every
      event. If foreach_func returns false the iteration is immediately stopped.
  
      Params:
        foreachFunc = the #GstPadStickyEventsForeachFunction that
                         should be called for every event.
  */
  void stickyEventsForeach(gst.types.PadStickyEventsForeachFunction foreachFunc)
  {
    extern(C) gboolean _foreachFuncCallback(GstPad* pad, GstEvent** event, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.PadStickyEventsForeachFunction*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take), event ? new gst.event.Event(cast(void*)event, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _foreachFuncCB = foreachFunc ? &_foreachFuncCallback : null;
    auto _foreachFunc = foreachFunc ? cast(void*)&(foreachFunc) : null;
    gst_pad_sticky_events_foreach(cast(GstPad*)this._cPtr, _foreachFuncCB, _foreachFunc);
  }

  /**
      Stop the task of pad. This function will also make sure that the
      function executed by the task will effectively stop if not called
      from the GstTaskFunction.
      
      This function will deadlock if called from the GstTaskFunction of
      the task. Use [gst.task.Task.pause] instead.
      
      Regardless of whether the pad has a task, the stream lock is acquired and
      released so as to ensure that streaming through this pad has finished.
      Returns: a true if the task could be stopped or false on error.
  */
  bool stopTask()
  {
    bool _retval;
    _retval = cast(bool)gst_pad_stop_task(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Store the sticky event on pad
  
      Params:
        event = a #GstEvent
      Returns: #GST_FLOW_OK on success, #GST_FLOW_FLUSHING when the pad
        was flushing or #GST_FLOW_EOS when the pad was EOS.
  */
  gst.types.FlowReturn storeStickyEvent(gst.event.Event event)
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_store_sticky_event(cast(GstPad*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Unlinks the source pad from the sink pad. Will emit the #GstPad::unlinked
      signal on both pads.
  
      Params:
        sinkpad = the sink #GstPad to unlink.
      Returns: true if the pads were unlinked. This function returns false if
        the pads were not linked together.
        
        MT safe.
  */
  bool unlink(gst.pad.Pad sinkpad)
  {
    bool _retval;
    _retval = cast(bool)gst_pad_unlink(cast(GstPad*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A helper function you can use that sets the FIXED_CAPS flag
      This way the default CAPS query will always return the negotiated caps
      or in case the pad is not negotiated, the padtemplate caps.
      
      The negotiated caps are the caps of the last CAPS event that passed on the
      pad. Use this function on a pad that, once it negotiated to a CAPS, cannot
      be renegotiated to something else.
  */
  void useFixedCaps()
  {
    gst_pad_use_fixed_caps(cast(GstPad*)this._cPtr);
  }

  /**
      Connect to `Linked` signal.
  
      Signals that a pad has been linked to the peer pad.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.pad.Pad peer, gst.pad.Pad pad))
  
          `peer` the peer pad that has been connected (optional)
  
          `pad` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLinked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.pad.Pad)))
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
    return connectSignalClosure("linked", closure, after);
  }

  /**
      Connect to `Unlinked` signal.
  
      Signals that a pad has been unlinked from the peer pad.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.pad.Pad peer, gst.pad.Pad pad))
  
          `peer` the peer pad that has been disconnected (optional)
  
          `pad` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnlinked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.pad.Pad)))
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
    return connectSignalClosure("unlinked", closure, after);
  }
}
