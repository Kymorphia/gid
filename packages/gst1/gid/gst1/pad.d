/// Module for [Pad] class
module gid.gst1.pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.iterator;
import gid.gst1.object;
import gid.gst1.pad_probe_info;
import gid.gst1.pad_template;
import gid.gst1.query;
import gid.gst1.static_pad_template;
import gid.gst1.stream;
import gid.gst1.types;

/**
    A #GstElement is linked to other elements via "pads", which are extremely
    light-weight generic link points.
    
    Pads have a #GstPadDirection, source pads produce data, sink pads consume
    data.
    
    Pads are typically created from a #GstPadTemplate with
    [gid.gst1.pad.Pad.newFromTemplate] and are then added to a #GstElement. This usually
    happens when the element is created but it can also happen dynamically based
    on the data that the element is processing or based on the pads that the
    application requests.
    
    Pads without pad templates can be created with [gid.gst1.pad.Pad.new_],
    which takes a direction and a name as an argument.  If the name is null,
    then a guaranteed unique name will be assigned to it.
    
    A #GstElement creating a pad will typically use the various
    gst_pad_set_*_function\() calls to register callbacks for events, queries or
    dataflow on the pads.
    
    gst_pad_get_parent() will retrieve the #GstElement that owns the pad.
    
    After two pads are retrieved from an element by [gid.gst1.element.Element.getStaticPad],
    the pads can be linked with [gid.gst1.pad.Pad.link]. (For quick links,
    you can also use [gid.gst1.element.Element.link], which will make the obvious
    link for you if it's straightforward.). Pads can be unlinked again with
    [gid.gst1.pad.Pad.unlink]. [gid.gst1.pad.Pad.getPeer] can be used to check what the pad is
    linked to.
    
    Before dataflow is possible on the pads, they need to be activated with
    [gid.gst1.pad.Pad.setActive].
    
    [gid.gst1.pad.Pad.query] and [gid.gst1.pad.Pad.peerQuery] can be used to query various
    properties of the pad and the stream.
    
    To send a #GstEvent on a pad, use [gid.gst1.pad.Pad.sendEvent] and
    [gid.gst1.pad.Pad.pushEvent]. Some events will be sticky on the pad, meaning that
    after they pass on the pad they can be queried later with
    [gid.gst1.pad.Pad.getStickyEvent] and [gid.gst1.pad.Pad.stickyEventsForeach].
    [gid.gst1.pad.Pad.getCurrentCaps] and [gid.gst1.pad.Pad.hasCurrentCaps] are convenience
    functions to query the current sticky CAPS event on a pad.
    
    GstElements will use [gid.gst1.pad.Pad.push] and [gid.gst1.pad.Pad.pullRange] to push out
    or pull in a buffer.
    
    The dataflow, events and queries that happen on a pad can be monitored with
    probes that can be installed with [gid.gst1.pad.Pad.addProbe]. [gid.gst1.pad.Pad.isBlocked]
    can be used to check if a block probe is installed on the pad.
    [gid.gst1.pad.Pad.isBlocking] checks if the blocking probe is currently blocking the
    pad. [gid.gst1.pad.Pad.removeProbe] is used to remove a previously installed probe
    and unblock blocking probes if any.
    
    Pad have an offset that can be retrieved with [gid.gst1.pad.Pad.getOffset]. This
    offset will be applied to the running_time of all data passing over the pad.
    [gid.gst1.pad.Pad.setOffset] can be used to change the offset.
    
    Convenience functions exist to start, pause and stop the task on a pad with
    [gid.gst1.pad.Pad.startTask], [gid.gst1.pad.Pad.pauseTask] and [gid.gst1.pad.Pad.stopTask]
    respectively.
*/
class Pad : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_pad_get_type != &gidSymbolNotFound ? gst_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override Pad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.pad.Pad]
      Returns: New builder object
  */
  static PadGidBuilder builder() nothrow
  {
    return new PadGidBuilder;
  }

  /** */
  @property gid.gst1.caps.Caps caps() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.caps.Caps)("caps");
  }

  /** */
  @property gid.gst1.types.PadDirection direction() nothrow
  {
    return getDirection();
  }

  /**
      Get `offset` property.
      Returns: The offset that will be applied to the running time of the pad.
  */
  @property long offset() nothrow
  {
    return getOffset();
  }

  /**
      Set `offset` property.
      Params:
        propval = The offset that will be applied to the running time of the pad.
  */
  @property void offset(long propval) nothrow
  {
    setOffset(propval);
  }

  /** */
  @property gid.gst1.pad_template.PadTemplate template_() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.pad_template.PadTemplate)("template");
  }

  /** */
  @property void template_(gid.gst1.pad_template.PadTemplate propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.pad_template.PadTemplate)("template", propval);
  }

  /**
  Sets the given getrange function for the pad. The getrange function is
  called to produce a new #GstBuffer to start the processing pipeline. see
  #GstPadGetRangeFunction for a description of the getrange function.
  
  Params:
  get = the #GstPadGetRangeFunction to set.
  */
  void setGetrangeFunctionFull(gid.gst1.types.PadGetRangeFunction get) nothrow
  {
    extern(C) GstFlowReturn _getCallback(GstPad* pad, GstObject* parent, ulong offset, uint length, GstBuffer** buffer) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gst1.types.PadGetRangeFunction*)pad.getrangedata;

      // A caller provided buffer is borrowed: its reference is taken for the call and stolen back afterwards, so
      // the buffer stays writable (single reference) while it is filled
      auto _provided = *buffer ? new gid.gst1.buffer.Buffer(cast(void*)*buffer, Yes.Take) : null;
      auto _buffer = _provided;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), offset, length,
        _buffer);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadGetRangeFunction");
      }

      auto _retval = cast(GstFlowReturn)_dretval;

      if (_provided) // The caller keeps its buffer, a replacement is released by its D object
      {
        _provided._cSteal;

        if (_buffer !is _provided)
        {
          import gid.glib2.c.functions : g_log;
          import gid.glib2.c.types : GLogLevelFlags;
          g_log("Gid", GLogLevelFlags.LevelCritical, "%s",
          "gid.gst1.types.PadGetRangeFunction replaced the caller provided buffer".ptr);
          _retval = GstFlowReturn.Error;
        }
      }
      else // New buffer owned by the caller
        *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _getCB = get ? &_getCallback : null;
    auto _get = get ? freezeDelegate(cast(void*)&get) : null;
    GDestroyNotify _getDestroyCB = get ? &thawDelegate : null;
    gst_pad_set_getrange_function_full(cast(GstPad*)this._cPtr, _getCB, _get, _getDestroyCB);
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
  this(string name, gid.gst1.types.PadDirection direction) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstPad* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_pad_new(_name, direction);
      this(_cretval, No.Take);
    }
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
  static gid.gst1.pad.Pad newFromStaticTemplate(gid.gst1.static_pad_template.StaticPadTemplate templ, string name) nothrow
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_pad_new_from_static_template(templ ? cast(GstStaticPadTemplate*)templ._cPtr(No.Dup) : null, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, No.Take);
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
  static gid.gst1.pad.Pad newFromTemplate(gid.gst1.pad_template.PadTemplate templ, string name = null) nothrow
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_pad_new_from_template(templ ? cast(GstPadTemplate*)templ._cPtr(No.Dup) : null, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a string representing the given pad-link return.
  
      Params:
        ret = a #GstPadLinkReturn to get the name of.
      Returns: a static string with the name of the pad-link return.
  */
  static string linkGetName(gid.gst1.types.PadLinkReturn ret) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_pad_link_get_name(ret);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  protected void vfuncLinked(gid.gst1.pad.Pad peer)
  {
    auto _klass = cast(GstPadClass*)_vfuncClass;
    if (!_klass.linked)
      return;

    _klass.linked(cast(GstPad*)this._cPtr, peer ? cast(GstPad*)peer._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncUnlinked(gid.gst1.pad.Pad peer)
  {
    auto _klass = cast(GstPadClass*)_vfuncClass;
    if (!_klass.unlinked)
      return;

    _klass.unlinked(cast(GstPad*)this._cPtr, peer ? cast(GstPad*)peer._cPtr(No.Dup) : null);
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
  bool activateMode(gid.gst1.types.PadMode mode, bool active) nothrow
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
      immediately if the pad is already idle while calling [gid.gst1.pad.Pad.addProbe].
      In each of the groups, probes are called in the order in which they were
      added.
  
      Params:
        mask = the probe mask
        callback = #GstPadProbeCallback that will be called with
                    notifications of the pad state
      Returns: an id or 0 if no probe is pending. The id can be used to remove the
        probe with [gid.gst1.pad.Pad.removeProbe]. When using GST_PAD_PROBE_TYPE_IDLE it can
        happen that the probe can be run immediately and if the probe returns
        GST_PAD_PROBE_REMOVE this functions returns 0.
        
        MT safe.
  */
  gulong addProbe(gid.gst1.types.PadProbeType mask, gid.gst1.types.PadProbeCallback callback) nothrow
  {
    extern(C) GstPadProbeReturn _callbackCallback(GstPad* pad, GstPadProbeInfo* info, void* userData) nothrow
    {
      gidAttachThread();
      gid.gst1.types.PadProbeReturn _dretval;
      auto _dlg = cast(gid.gst1.types.PadProbeCallback*)userData;
      auto _info = info ? new gid.gst1.pad_probe_info.PadProbeInfo(cast(void*)info, null) : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), _info);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadProbeCallback");
      }
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
  bool canLink(gid.gst1.pad.Pad sinkpad) nothrow
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
  gid.gst1.types.FlowReturn chain(gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_chain(cast(GstPad*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.types.FlowReturn chainList(gid.gst1.buffer_list.BufferList list) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_chain_list(cast(GstPad*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Check and clear the #GST_PAD_FLAG_NEED_RECONFIGURE flag on pad and return true
      if the flag was set.
      Returns: true is the GST_PAD_FLAG_NEED_RECONFIGURE flag was set on pad.
  */
  bool checkReconfigure() nothrow
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
      Returns: A stream-id for pad. [gid.glib2.global.gfree] after usage.
  */
  string createStreamId(gid.gst1.element.Element parent, string streamId = null) nothrow
  {
    char* _cretval;
    const(char)* _streamId = streamId.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_pad_create_stream_id(cast(GstPad*)this._cPtr, parent ? cast(GstElement*)parent._cPtr(No.Dup) : null, _streamId);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
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
  bool eventDefault(gid.gst1.object.ObjectWrap parent, gid.gst1.event.Event event) nothrow
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
  bool forward(gid.gst1.types.PadForwardFunction forward) nothrow
  {
    extern(C) gboolean _forwardCallback(GstPad* pad, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.PadForwardFunction*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadForwardFunction");
      }
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
      calling [gid.gst1.pad.Pad.queryCaps] on pad and its peer. The caller owns a reference
      on the resulting caps.
      Returns: the allowed #GstCaps of the
            pad link. Unref the caps when you no longer need it. This
            function returns null when pad has no peer.
        
        MT safe.
  */
  gid.gst1.caps.Caps getAllowedCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_get_allowed_caps(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the capabilities currently configured on pad with the last
      #GST_EVENT_CAPS event.
      Returns: the current caps of the pad with
        incremented ref-count or null when pad has no caps. Unref after usage.
  */
  gid.gst1.caps.Caps getCurrentCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_get_current_caps(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the direction of the pad. The direction of the pad is
      decided at construction time so this function does not take
      the LOCK.
      Returns: the #GstPadDirection of the pad.
        
        MT safe.
  */
  gid.gst1.types.PadDirection getDirection() nothrow
  {
    GstPadDirection _cretval;
    _cretval = gst_pad_get_direction(cast(GstPad*)this._cPtr);
    gid.gst1.types.PadDirection _retval = cast(gid.gst1.types.PadDirection)_cretval;
    return _retval;
  }

  /**
      Gets the private data of a pad.
      No locking is performed in this function.
      Returns: a #gpointer to the private data.
  */
  void* getElementPrivate() nothrow
  {
    auto _retval = gst_pad_get_element_private(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GstFlowReturn return from the last data passed by this pad.
      Returns: 
  */
  gid.gst1.types.FlowReturn getLastFlowReturn() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_get_last_flow_return(cast(GstPad*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the offset applied to the running time of pad. pad has to be a source
      pad.
      Returns: the offset.
  */
  long getOffset() nothrow
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
  gid.gst1.pad_template.PadTemplate getPadTemplate() nothrow
  {
    GstPadTemplate* _cretval;
    _cretval = gst_pad_get_pad_template(cast(GstPad*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the capabilities for pad's template.
      Returns: the #GstCaps of this pad template.
        Unref after usage.
  */
  gid.gst1.caps.Caps getPadTemplateCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_get_pad_template_caps(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
  gid.gst1.element.Element getParentElement() nothrow
  {
    GstElement* _cretval;
    _cretval = gst_pad_get_parent_element(cast(GstPad*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(GstElement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the peer of pad. This function refs the peer pad so
      you need to unref it after use.
      Returns: the peer #GstPad. Unref after usage.
        
        MT safe.
  */
  gid.gst1.pad.Pad getPeer() nothrow
  {
    GstPad* _cretval;
    _cretval = gst_pad_get_peer(cast(GstPad*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
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
      must be freed with [gid.gst1.buffer.Buffer.unref] after usage.
      
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
      
      This is a lowlevel function. Usually [gid.gst1.pad.Pad.pullRange] is used.
  
      Params:
        offset = The start offset of the buffer
        size = The length of the buffer
        buffer = a pointer to hold the #GstBuffer,
              returns #GST_FLOW_ERROR if null.
      Returns: a #GstFlowReturn from the pad.
        
        MT safe.
  */
  gid.gst1.types.FlowReturn getRange(ulong offset, uint size, out gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_pad_get_range(cast(GstPad*)this._cPtr, offset, size, &_buffer);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      If there is a single internal link of the given pad, this function will
      return it. Otherwise, it will return NULL.
      Returns: a #GstPad, or null if pad has none
        or more than one internal links. Unref returned pad with
        [gid.gst1.object.ObjectWrap.unref].
  */
  gid.gst1.pad.Pad getSingleInternalLink() nothrow
  {
    GstPad* _cretval;
    _cretval = gst_pad_get_single_internal_link(cast(GstPad*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
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
  gid.gst1.event.Event getStickyEvent(gid.gst1.types.EventType eventType, uint idx) nothrow
  {
    GstEvent* _cretval;
    _cretval = gst_pad_get_sticky_event(cast(GstPad*)this._cPtr, eventType, idx);
    auto _retval = _cretval ? new gid.gst1.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the current #GstStream for the pad, or null if none has been
      set yet, i.e. the pad has not received a stream-start event yet.
      
      This is a convenience wrapper around [gid.gst1.pad.Pad.getStickyEvent] and
      [gid.gst1.event.Event.parseStream].
      Returns: the current #GstStream for pad, or null.
            unref the returned stream when no longer needed.
  */
  gid.gst1.stream.Stream getStream() nothrow
  {
    GstStream* _cretval;
    _cretval = gst_pad_get_stream(cast(GstPad*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.stream.Stream)(cast(GstStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the current stream-id for the pad, or null if none has been
      set yet, i.e. the pad has not received a stream-start event yet.
      
      This is a convenience wrapper around [gid.gst1.pad.Pad.getStickyEvent] and
      [gid.gst1.event.Event.parseStreamStart].
      
      The returned stream-id string should be treated as an opaque string, its
      contents should not be interpreted.
      Returns: a newly-allocated copy of the stream-id for
            pad, or null.  [gid.glib2.global.gfree] the returned string when no longer
            needed.
  */
  string getStreamId() nothrow
  {
    char* _cretval;
    _cretval = gst_pad_get_stream_id(cast(GstPad*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get pad task state. If no task is currently
      set, #GST_TASK_STOPPED is returned.
      Returns: The current state of pad's task.
  */
  gid.gst1.types.TaskState getTaskState() nothrow
  {
    GstTaskState _cretval;
    _cretval = gst_pad_get_task_state(cast(GstPad*)this._cPtr);
    gid.gst1.types.TaskState _retval = cast(gid.gst1.types.TaskState)_cretval;
    return _retval;
  }

  /**
      Check if pad has caps set on it with a #GST_EVENT_CAPS event.
      Returns: true when pad has caps associated with it.
  */
  bool hasCurrentCaps() nothrow
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
  bool isActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_is_active(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the pad is blocked or not. This function returns the
      last requested state of the pad. It is not certain that the pad
      is actually blocking at this point (see [gid.gst1.pad.Pad.isBlocking]).
      Returns: true if the pad is blocked.
        
        MT safe.
  */
  bool isBlocked() nothrow
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
  bool isBlocking() nothrow
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
  bool isLinked() nothrow
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
            configured. Use [gid.gst1.iterator.Iterator.free] after usage.
  */
  gid.gst1.iterator.Iterator iterateInternalLinks() nothrow
  {
    GstIterator* _cretval;
    _cretval = gst_pad_iterate_internal_links(cast(GstPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Iterate the list of pads to which the given pad is linked to inside of
      the parent element.
      This is the default handler, and thus returns an iterator of all of the
      pads inside the parent element with opposite direction.
      
      The caller must free this iterator after use with [gid.gst1.iterator.Iterator.free].
  
      Params:
        parent = the parent of pad or null
      Returns: a #GstIterator of #GstPad, or null if pad
        has no parent. Unref each returned pad with [gid.gst1.object.ObjectWrap.unref].
  */
  gid.gst1.iterator.Iterator iterateInternalLinksDefault(gid.gst1.object.ObjectWrap parent = null) nothrow
  {
    GstIterator* _cretval;
    _cretval = gst_pad_iterate_internal_links_default(cast(GstPad*)this._cPtr, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
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
  gid.gst1.types.PadLinkReturn link(gid.gst1.pad.Pad sinkpad) nothrow
  {
    GstPadLinkReturn _cretval;
    _cretval = gst_pad_link(cast(GstPad*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null);
    gid.gst1.types.PadLinkReturn _retval = cast(gid.gst1.types.PadLinkReturn)_cretval;
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
  gid.gst1.types.PadLinkReturn linkFull(gid.gst1.pad.Pad sinkpad, gid.gst1.types.PadLinkCheck flags) nothrow
  {
    GstPadLinkReturn _cretval;
    _cretval = gst_pad_link_full(cast(GstPad*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null, flags);
    gid.gst1.types.PadLinkReturn _retval = cast(gid.gst1.types.PadLinkReturn)_cretval;
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
  bool linkMaybeGhosting(gid.gst1.pad.Pad sink) nothrow
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
      
      Calling [gid.gst1.pad.Pad.linkMaybeGhostingFull] with
      flags == [gid.gst1.types.PadLinkCheck.Default] is the recommended way of linking
      pads with safety checks applied.
  
      Params:
        sink = a #GstPad
        flags = some #GstPadLinkCheck flags
      Returns: whether the link succeeded.
  */
  bool linkMaybeGhostingFull(gid.gst1.pad.Pad sink, gid.gst1.types.PadLinkCheck flags) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_link_maybe_ghosting_full(cast(GstPad*)this._cPtr, sink ? cast(GstPad*)sink._cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      Mark a pad for needing reconfiguration. The next call to
      [gid.gst1.pad.Pad.checkReconfigure] will return true after this call.
  */
  void markReconfigure() nothrow
  {
    gst_pad_mark_reconfigure(cast(GstPad*)this._cPtr);
  }

  /**
      Check the #GST_PAD_FLAG_NEED_RECONFIGURE flag on pad and return true
      if the flag was set.
      Returns: true is the GST_PAD_FLAG_NEED_RECONFIGURE flag is set on pad.
  */
  bool needsReconfigure() nothrow
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
  bool pauseTask() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_pause_task(cast(GstPad*)this._cPtr);
    return _retval;
  }

  /**
      Performs [gid.gst1.pad.Pad.query] on the peer of pad.
      
      The caller is responsible for both the allocation and deallocation of
      the query structure.
  
      Params:
        query = the #GstQuery to perform.
      Returns: true if the query could be performed. This function returns false
        if pad has no peer.
  */
  bool peerQuery(gid.gst1.query.Query query) nothrow
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
  bool peerQueryAcceptCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_peer_query_accept_caps(cast(GstPad*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the capabilities of the peer connected to this pad. Similar to
      [gid.gst1.pad.Pad.queryCaps].
      
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
  gid.gst1.caps.Caps peerQueryCaps(gid.gst1.caps.Caps filter = null) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_peer_query_caps(cast(GstPad*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
  bool peerQueryConvert(gid.gst1.types.Format srcFormat, long srcVal, gid.gst1.types.Format destFormat, out long destVal) nothrow
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
  bool peerQueryDuration(gid.gst1.types.Format format, out long duration) nothrow
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
  bool peerQueryPosition(gid.gst1.types.Format format, out long cur) nothrow
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
  bool proxyQueryAcceptCaps(gid.gst1.query.Query query) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_proxy_query_accept_caps(cast(GstPad*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls [gid.gst1.pad.Pad.queryCaps] for all internally linked pads of pad and returns
      the intersection of the results.
      
      This function is useful as a default caps query function for an element
      that can handle any stream format, but requires all its pads to have
      the same caps.  Two such elements are tee and adder.
  
      Params:
        query = a CAPS #GstQuery.
      Returns: true if query could be executed
  */
  bool proxyQueryCaps(gid.gst1.query.Query query) nothrow
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
      function returns the result of [gid.gst1.pad.Pad.getRange] on the peer pad.
      See [gid.gst1.pad.Pad.getRange] for a list of return values and for the
      semantics of the arguments of this function.
      
      If buffer points to a variable holding null, a valid new #GstBuffer will be
      placed in buffer when this function returns #GST_FLOW_OK. The new buffer
      must be freed with [gid.gst1.buffer.Buffer.unref] after usage. When this function
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
  gid.gst1.types.FlowReturn pullRange(ulong offset, uint size, out gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_pad_pull_range(cast(GstPad*)this._cPtr, offset, size, &_buffer);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Pushes a buffer to the peer of pad.
      
      This function will call installed block probes before triggering any
      installed data probes.
      
      The function proceeds calling [gid.gst1.pad.Pad.chain] on the peer pad and returns
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
  gid.gst1.types.FlowReturn push(gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_push(cast(GstPad*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sends the event to the peer of the given pad. This function is
      mainly used by elements to send events to their peer
      elements.
      
      This function takes ownership of the provided event so you should
      [gid.gst1.event.Event.ref_] it if you want to reuse the event after this call.
  
      Params:
        event = the #GstEvent to push out of the pad.
      Returns: true if the event was handled.
        
        MT safe.
  */
  bool pushEvent(gid.gst1.event.Event event) nothrow
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
      chained via [gid.gst1.pad.Pad.chain].
      
      In all cases, success or failure, the caller loses its reference to list
      after calling this function.
  
      Params:
        list = the #GstBufferList to push returns GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the peer pad.
        
        MT safe.
  */
  gid.gst1.types.FlowReturn pushList(gid.gst1.buffer_list.BufferList list) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_push_list(cast(GstPad*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  bool query(gid.gst1.query.Query query) nothrow
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
  bool queryAcceptCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_query_accept_caps(cast(GstPad*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the capabilities this pad can produce or consume.
      Note that this method doesn't necessarily return the caps set by sending a
      [gid.gst1.event.Event.newCaps] - use [gid.gst1.pad.Pad.getCurrentCaps] for that instead.
      gst_pad_query_caps returns all possible caps a pad can operate with, using
      the pad's CAPS query function, If the query fails, this function will return
      filter, if not null, otherwise ANY.
      
      When called on sinkpads filter contains the caps that
      upstream could produce in the order preferred by upstream. When
      called on srcpads filter contains the caps accepted by
      downstream in the preferred order. filter might be null but
      if it is not null the returned caps will be a subset of filter.
      
      Note that this function does not return writable #GstCaps, use
      [gid.gst1.caps.Caps.makeWritable] before modifying the caps.
  
      Params:
        filter = suggested #GstCaps, or null
      Returns: the caps of the pad with incremented ref-count.
  */
  gid.gst1.caps.Caps queryCaps(gid.gst1.caps.Caps filter = null) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_query_caps(cast(GstPad*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
  bool queryConvert(gid.gst1.types.Format srcFormat, long srcVal, gid.gst1.types.Format destFormat, out long destVal) nothrow
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
  bool queryDefault(gid.gst1.object.ObjectWrap parent, gid.gst1.query.Query query) nothrow
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
  bool queryDuration(gid.gst1.types.Format format, out long duration) nothrow
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
  bool queryPosition(gid.gst1.types.Format format, out long cur) nothrow
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
  void removeProbe(gulong id) nothrow
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
      serialized, see #GstEventTypeFlags, [gid.gst1.global.eventTypeGetFlags],
      #GST_EVENT_IS_UPSTREAM, #GST_EVENT_IS_DOWNSTREAM, and
      #GST_EVENT_IS_SERIALIZED. Note that in practice that an application or
      plugin doesn't need to bother itself with this information; the core handles
      all necessary locks and checks.
      
      This function takes ownership of the provided event so you should
      [gid.gst1.event.Event.ref_] it if you want to reuse the event after this call.
  
      Params:
        event = the #GstEvent to send to the pad.
      Returns: true if the event was handled.
  */
  bool sendEvent(gid.gst1.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_send_event(cast(GstPad*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Sets the given activate function for pad. The activate function will
      dispatch to [gid.gst1.pad.Pad.activateMode] to perform the actual activation.
      Only makes sense to set on sink pads.
      
      Call this function if your sink pad can start a pull-based task.
  
      Params:
        activate = the #GstPadActivateFunction to set.
  */
  void setActivateFunctionFull(gid.gst1.types.PadActivateFunction activate) nothrow
  {
    extern(C) gboolean _activateCallback(GstPad* pad, GstObject* parent) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.PadActivateFunction*)(cast(GstPad*)pad).activatedata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadActivateFunction");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _activateCB = activate ? &_activateCallback : null;
    auto _activate = activate ? freezeDelegate(cast(void*)&activate) : null;
    GDestroyNotify _activateDestroyCB = activate ? &thawDelegate : null;
    gst_pad_set_activate_function_full(cast(GstPad*)this._cPtr, _activateCB, _activate, _activateDestroyCB);
  }

  /**
      Sets the given activate_mode function for the pad. An activate_mode function
      prepares the element for data passing.
  
      Params:
        activatemode = the #GstPadActivateModeFunction to set.
  */
  void setActivatemodeFunctionFull(gid.gst1.types.PadActivateModeFunction activatemode) nothrow
  {
    extern(C) gboolean _activatemodeCallback(GstPad* pad, GstObject* parent, GstPadMode mode, gboolean active) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.PadActivateModeFunction*)(cast(GstPad*)pad).activatemodedata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), mode, cast(bool)active);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadActivateModeFunction");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _activatemodeCB = activatemode ? &_activatemodeCallback : null;
    auto _activatemode = activatemode ? freezeDelegate(cast(void*)&activatemode) : null;
    GDestroyNotify _activatemodeDestroyCB = activatemode ? &thawDelegate : null;
    gst_pad_set_activatemode_function_full(cast(GstPad*)this._cPtr, _activatemodeCB, _activatemode, _activatemodeDestroyCB);
  }

  /**
      Activates or deactivates the given pad.
      Normally called from within core state change functions.
      
      If active, makes sure the pad is active. If it is already active, either in
      push or pull mode, just return. Otherwise dispatches to the pad's activate
      function to perform the actual activation.
      
      If not active, calls [gid.gst1.pad.Pad.activateMode] with the pad's current mode
      and a false argument.
  
      Params:
        active = whether or not the pad should be active.
      Returns: true if the operation was successful.
        
        MT safe.
  */
  bool setActive(bool active) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_pad_set_active(cast(GstPad*)this._cPtr, active);
    return _retval;
  }

  /**
      Sets the given chain function for the pad. The chain function is called to
      process a #GstBuffer input buffer. see #GstPadChainFunction for more details.
  
      Params:
        chain = the #GstPadChainFunction to set.
  */
  void setChainFunctionFull(gid.gst1.types.PadChainFunction chain) nothrow
  {
    extern(C) GstFlowReturn _chainCallback(GstPad* pad, GstObject* parent, GstBuffer* buffer) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gst1.types.PadChainFunction*)(cast(GstPad*)pad).chaindata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadChainFunction");
      }
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _chainCB = chain ? &_chainCallback : null;
    auto _chain = chain ? freezeDelegate(cast(void*)&chain) : null;
    GDestroyNotify _chainDestroyCB = chain ? &thawDelegate : null;
    gst_pad_set_chain_function_full(cast(GstPad*)this._cPtr, _chainCB, _chain, _chainDestroyCB);
  }

  /**
      Sets the given chain list function for the pad. The chainlist function is
      called to process a #GstBufferList input buffer list. See
      #GstPadChainListFunction for more details.
  
      Params:
        chainlist = the #GstPadChainListFunction to set.
  */
  void setChainListFunctionFull(gid.gst1.types.PadChainListFunction chainlist) nothrow
  {
    extern(C) GstFlowReturn _chainlistCallback(GstPad* pad, GstObject* parent, GstBufferList* list) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gst1.types.PadChainListFunction*)(cast(GstPad*)pad).chainlistdata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), list ? new gid.gst1.buffer_list.BufferList(cast(void*)list, Yes.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadChainListFunction");
      }
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _chainlistCB = chainlist ? &_chainlistCallback : null;
    auto _chainlist = chainlist ? freezeDelegate(cast(void*)&chainlist) : null;
    GDestroyNotify _chainlistDestroyCB = chainlist ? &thawDelegate : null;
    gst_pad_set_chain_list_function_full(cast(GstPad*)this._cPtr, _chainlistCB, _chainlist, _chainlistDestroyCB);
  }

  /**
      Set the given private data gpointer on the pad.
      This function can only be used by the element that owns the pad.
      No locking is performed in this function.
  
      Params:
        priv = The private data to attach to the pad.
  */
  void setElementPrivate(void* priv = null) nothrow
  {
    gst_pad_set_element_private(cast(GstPad*)this._cPtr, priv);
  }

  /**
      Sets the given event handler for the pad.
  
      Params:
        event = the #GstPadEventFullFunction to set.
  */
  void setEventFullFunctionFull(gid.gst1.types.PadEventFullFunction event) nothrow
  {
    extern(C) GstFlowReturn _eventCallback(GstPad* pad, GstObject* parent, GstEvent* event) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gst1.types.PadEventFullFunction*)(cast(GstPad*)pad).eventdata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadEventFullFunction");
      }
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _eventCB = event ? &_eventCallback : null;
    auto _event = event ? freezeDelegate(cast(void*)&event) : null;
    GDestroyNotify _eventDestroyCB = event ? &thawDelegate : null;
    gst_pad_set_event_full_function_full(cast(GstPad*)this._cPtr, _eventCB, _event, _eventDestroyCB);
  }

  /**
      Sets the given event handler for the pad.
  
      Params:
        event = the #GstPadEventFunction to set.
  */
  void setEventFunctionFull(gid.gst1.types.PadEventFunction event) nothrow
  {
    extern(C) gboolean _eventCallback(GstPad* pad, GstObject* parent, GstEvent* event) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.PadEventFunction*)(cast(GstPad*)pad).eventdata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadEventFunction");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _eventCB = event ? &_eventCallback : null;
    auto _event = event ? freezeDelegate(cast(void*)&event) : null;
    GDestroyNotify _eventDestroyCB = event ? &thawDelegate : null;
    gst_pad_set_event_function_full(cast(GstPad*)this._cPtr, _eventCB, _event, _eventDestroyCB);
  }

  /**
      Sets the given internal link iterator function for the pad.
  
      Params:
        iterintlink = the #GstPadIterIntLinkFunction to set.
  */
  void setIterateInternalLinksFunctionFull(gid.gst1.types.PadIterIntLinkFunction iterintlink) nothrow
  {
    extern(C) GstIterator* _iterintlinkCallback(GstPad* pad, GstObject* parent) nothrow
    {
      gidAttachThread();
      gid.gst1.iterator.Iterator _dretval;
      auto _dlg = cast(gid.gst1.types.PadIterIntLinkFunction*)(cast(GstPad*)pad).iterintlinkdata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadIterIntLinkFunction");
      }
      auto _retval = _dretval ? cast(GstIterator*)_dretval._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _iterintlinkCB = iterintlink ? &_iterintlinkCallback : null;
    auto _iterintlink = iterintlink ? freezeDelegate(cast(void*)&iterintlink) : null;
    GDestroyNotify _iterintlinkDestroyCB = iterintlink ? &thawDelegate : null;
    gst_pad_set_iterate_internal_links_function_full(cast(GstPad*)this._cPtr, _iterintlinkCB, _iterintlink, _iterintlinkDestroyCB);
  }

  /**
      Sets the given link function for the pad. It will be called when
      the pad is linked with another pad.
      
      The return value #GST_PAD_LINK_OK should be used when the connection can be
      made.
      
      The return value #GST_PAD_LINK_REFUSED should be used when the connection
      cannot be made for some reason.
      
      If link is installed on a source pad, it should call the #GstPadLinkFunction
      of the peer sink pad, if present.
  
      Params:
        link = the #GstPadLinkFunction to set.
  */
  void setLinkFunctionFull(gid.gst1.types.PadLinkFunction link) nothrow
  {
    extern(C) GstPadLinkReturn _linkCallback(GstPad* pad, GstObject* parent, GstPad* peer) nothrow
    {
      gidAttachThread();
      gid.gst1.types.PadLinkReturn _dretval;
      auto _dlg = cast(gid.gst1.types.PadLinkFunction*)(cast(GstPad*)pad).linkdata;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)peer, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadLinkFunction");
      }
      auto _retval = cast(GstPadLinkReturn)_dretval;

      return _retval;
    }
    auto _linkCB = link ? &_linkCallback : null;
    auto _link = link ? freezeDelegate(cast(void*)&link) : null;
    GDestroyNotify _linkDestroyCB = link ? &thawDelegate : null;
    gst_pad_set_link_function_full(cast(GstPad*)this._cPtr, _linkCB, _link, _linkDestroyCB);
  }

  /**
      Set the offset that will be applied to the running time of pad. Upon next
      buffer, every sticky events (notably segment) will be pushed again with
      their running time adjusted. For that reason this is only reliable on
      source pads.
  
      Params:
        offset = the offset
  */
  void setOffset(long offset) nothrow
  {
    gst_pad_set_offset(cast(GstPad*)this._cPtr, offset);
  }

  /**
      Set the given query function for the pad.
  
      Params:
        query = the #GstPadQueryFunction to set.
  */
  void setQueryFunctionFull(gid.gst1.types.PadQueryFunction query) nothrow
  {
    extern(C) gboolean _queryCallback(GstPad* pad, GstObject* parent, GstQuery* query) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.PadQueryFunction*)(cast(GstPad*)pad).querydata;
      auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), _query);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadQueryFunction");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_query)
        _query._cUnborrow;

      return _retval;
    }
    auto _queryCB = query ? &_queryCallback : null;
    auto _query = query ? freezeDelegate(cast(void*)&query) : null;
    GDestroyNotify _queryDestroyCB = query ? &thawDelegate : null;
    gst_pad_set_query_function_full(cast(GstPad*)this._cPtr, _queryCB, _query, _queryDestroyCB);
  }

  /**
      Sets the given unlink function for the pad. It will be called
      when the pad is unlinked.
      
      Note that the pad's lock is already held when the unlink
      function is called, so most pad functions cannot be called
      from within the callback.
  
      Params:
        unlink = the #GstPadUnlinkFunction to set.
  */
  void setUnlinkFunctionFull(gid.gst1.types.PadUnlinkFunction unlink) nothrow
  {
    extern(C) void _unlinkCallback(GstPad* pad, GstObject* parent) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gst1.types.PadUnlinkFunction*)(cast(GstPad*)pad).unlinkdata;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadUnlinkFunction");
      }
    }
    auto _unlinkCB = unlink ? &_unlinkCallback : null;
    auto _unlink = unlink ? freezeDelegate(cast(void*)&unlink) : null;
    GDestroyNotify _unlinkDestroyCB = unlink ? &thawDelegate : null;
    gst_pad_set_unlink_function_full(cast(GstPad*)this._cPtr, _unlinkCB, _unlink, _unlinkDestroyCB);
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
  bool startTask(gid.gst1.types.TaskFunction func) nothrow
  {
    extern(C) void _funcCallback(void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gst1.types.TaskFunction*)userData;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.TaskFunction");
      }
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
        foreachFunc = the
             #GstPadStickyEventsForeachFunction that should be called for every event.
  */
  void stickyEventsForeach(gid.gst1.types.PadStickyEventsForeachFunction foreachFunc) nothrow
  {
    extern(C) gboolean _foreachFuncCallback(GstPad* pad, GstEvent** event, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.PadStickyEventsForeachFunction*)userData;
      auto _event = *event ? new gid.gst1.event.Event(cast(void*)*event, Yes.Take) : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), _event);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PadStickyEventsForeachFunction");
      }
      auto _retval = cast(gboolean)_dretval;
      *event = _event ? cast(GstEvent*)_event._cPtr(Yes.Dup) : null;

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
      the task. Use [gid.gst1.task.Task.pause] instead.
      
      Regardless of whether the pad has a task, the stream lock is acquired and
      released so as to ensure that streaming through this pad has finished.
      Returns: a true if the task could be stopped or false on error.
  */
  bool stopTask() nothrow
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
  gid.gst1.types.FlowReturn storeStickyEvent(gid.gst1.event.Event event) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_store_sticky_event(cast(GstPad*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  bool unlink(gid.gst1.pad.Pad sinkpad) nothrow
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
  void useFixedCaps() nothrow
  {
    gst_pad_use_fixed_caps(cast(GstPad*)this._cPtr);
  }

  /**
      Connect to `Linked` signal.
  
      Signals that a pad has been linked to the peer pad.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.pad.Pad peer, gid.gst1.pad.Pad pad)`
  
          `peer` the peer pad that has been connected (optional)
  
          `pad` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLinked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gst1.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gst1.pad.Pad)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.pad.Pad.linked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("linked", closure, after);
  }

  /**
      Connect to `Unlinked` signal.
  
      Signals that a pad has been unlinked from the peer pad.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.pad.Pad peer, gid.gst1.pad.Pad pad)`
  
          `peer` the peer pad that has been disconnected (optional)
  
          `pad` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnlinked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gst1.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gst1.pad.Pad)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.pad.Pad.unlinked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unlinked", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Pad
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.pad.Pad), T.stringof ~ " is not derived from gid.gst1.pad.Pad");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLinked", true)[0]) == gid.gst1.pad.Pad))
      _installVfunc(klass, "linked");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnlinked", true)[0]) == gid.gst1.pad.Pad))
      _installVfunc(klass, "unlinked");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstPadClass*)klass;

    switch (vfunc)
    {
      case "linked":
      {
        static extern(C) void _vfuncLinkedTramp(GstPad* pad, GstPad* peer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.pad.Pad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.linked)
              return (cast(typeof(&_vfuncLinkedTramp))_klass.linked)(pad, peer);
            return;
          }

          try
          {
            _obj.vfuncLinked(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)peer, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.pad.Pad.vfuncLinked");
          }
        }

        _klass.linked = cast(typeof(_klass.linked))&_vfuncLinkedTramp;
        break;
      }
      case "unlinked":
      {
        static extern(C) void _vfuncUnlinkedTramp(GstPad* pad, GstPad* peer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.pad.Pad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.unlinked)
              return (cast(typeof(&_vfuncUnlinkedTramp))_klass.unlinked)(pad, peer);
            return;
          }

          try
          {
            _obj.vfuncUnlinked(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)peer, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.pad.Pad.vfuncUnlinked");
          }
        }

        _klass.unlinked = cast(typeof(_klass.unlinked))&_vfuncUnlinkedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.pad.Pad]
class PadGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T direction(gid.gst1.types.PadDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `offset` property.
      Params:
        propval = The offset that will be applied to the running time of the pad.
      Returns: Builder instance for fluent chaining
  */
  T offset(long propval) nothrow
  {
    return setProperty("offset", propval);
  }

  /** */
  T template_(gid.gst1.pad_template.PadTemplate propval) nothrow
  {
    return setProperty("template", propval);
  }
}

/// Fluent builder for [gid.gst1.pad.Pad]
final class PadGidBuilder : PadGidBuilderImpl!PadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Pad build() nothrow
  {
    return new Pad(cast(void*)createGObject(Pad._getGType), Yes.Take);
  }
}
