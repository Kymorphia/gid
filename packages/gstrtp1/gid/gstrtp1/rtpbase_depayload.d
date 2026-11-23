/// Module for [RTPBaseDepayload] class
module gid.gstrtp1.rtpbase_depayload;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.structure;
import gid.gst1.types;
import gid.gstrtp1.c.functions;
import gid.gstrtp1.c.types;
import gid.gstrtp1.rtpbuffer;
import gid.gstrtp1.rtpheader_extension;
import gid.gstrtp1.types;

/**
    Provides a base class for RTP depayloaders
    
    In order to handle RTP header extensions correctly if the
    depayloader aggregates multiple RTP packet payloads into one output
    buffer this class provides the function
    [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.setAggregateHdrextEnabled]. If the
    aggregation is enabled the virtual functions
    @GstRTPBaseDepayload.process or
    @GstRTPBaseDepayload.process_rtp_packet must tell the base class
    what happens to the current RTP packet. By default the base class
    assumes that the packet payload is used with the next output
    buffer.
    
    If the RTP packet will not be used with an output buffer
    [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.dropped] must be called. A typical
    situation would be if we are waiting for a keyframe.
    
    If the RTP packet will be used but not with the current output
    buffer but with the next one [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.delayed] must
    be called. This may happen if the current RTP packet signals the
    start of a new output buffer and the currently processed output
    buffer will be pushed first. The undelay happens implicitly once
    the current buffer has been pushed or
    [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.flush] has been called.
    
    If [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.flush] is called all RTP packets that
    have not been dropped since the last output buffer are dropped,
    e.g. if an output buffer is discarded due to malformed data. This
    may or may not include the current RTP packet depending on the 2nd
    parameter @keep_current.
    
    Be aware that in case [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.pushList] is used
    each buffer will see the same list of RTP header extensions.
*/
class RTPBaseDepayload : gid.gst1.element.Element
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
    return cast(void function())gst_rtp_base_depayload_get_type != &gidSymbolNotFound ? gst_rtp_base_depayload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstRTPBaseDepayload";
  }

  /** Returns `this`, for use in `with` statements. */
  override RTPBaseDepayload self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload]
      Returns: New builder object
  */
  static RTPBaseDepayloadGidBuilder builder() nothrow
  {
    return new RTPBaseDepayloadGidBuilder;
  }

  /**
      Get `autoHeaderExtension` property.
      Returns: If enabled, the depayloader will automatically try to enable all the
        RTP header extensions provided in the sink caps, saving the application
        the need to handle these extensions manually using the
        GstRTPBaseDepayload::request-extension: signal.
  */
  @property bool autoHeaderExtension() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("auto-header-extension");
  }

  /**
      Set `autoHeaderExtension` property.
      Params:
        propval = If enabled, the depayloader will automatically try to enable all the
          RTP header extensions provided in the sink caps, saving the application
          the need to handle these extensions manually using the
          GstRTPBaseDepayload::request-extension: signal.
  */
  @property void autoHeaderExtension(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("auto-header-extension", propval);
  }

  /**
      Get `maxReorder` property.
      Returns: Max seqnum reorder before the sender is assumed to have restarted.
        
        When max-reorder is set to 0 all reordered/duplicate packets are
        considered coming from a restarted sender.
  */
  @property int maxReorder() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-reorder");
  }

  /**
      Set `maxReorder` property.
      Params:
        propval = Max seqnum reorder before the sender is assumed to have restarted.
          
          When max-reorder is set to 0 all reordered/duplicate packets are
          considered coming from a restarted sender.
  */
  @property void maxReorder(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("max-reorder", propval);
  }

  /**
      Get `sourceInfo` property.
      Returns: Add RTP source information found in RTP header as meta to output buffer.
  */
  @property bool sourceInfo() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("source-info");
  }

  /**
      Set `sourceInfo` property.
      Params:
        propval = Add RTP source information found in RTP header as meta to output buffer.
  */
  @property void sourceInfo(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("source-info", propval);
  }

  /**
      Get `stats` property.
      Returns: Various depayloader statistics retrieved atomically (and are therefore
        synchroized with each other). This property return a GstStructure named
        application/x-rtp-depayload-stats containing the following fields relating to
        the last processed buffer and current state of the stream being depayloaded:
        
          * `clock-rate`: #G_TYPE_UINT, clock-rate of the stream
          * `npt-start`: #G_TYPE_UINT64, time of playback start
          * `npt-stop`: #G_TYPE_UINT64, time of playback stop
          * `play-speed`: #G_TYPE_DOUBLE, the playback speed
          * `play-scale`: #G_TYPE_DOUBLE, the playback scale
          * `running-time-dts`: #G_TYPE_UINT64, the last running-time of the
             last DTS
          * `running-time-pts`: #G_TYPE_UINT64, the last running-time of the
             last PTS
          * `seqnum`: #G_TYPE_UINT, the last seen seqnum
          * `timestamp`: #G_TYPE_UINT, the last seen RTP timestamp
  */
  @property gid.gst1.structure.Structure stats() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.structure.Structure)("stats");
  }

  /**
  Get `extensions` property.
  Returns: A list of already enabled RTP header extensions. This may be useful for finding
  out which extensions are already enabled (with add-extension signal) and picking a non-conflicting
  ID for a new extension that needs to be added on top of the existing ones.
  
  Note that the value returned by reading this property is not dynamically updated when the set of
  enabled extensions changes by any of existing action signals. Rather, it represents the current state
  at the time the property is read.
  
  Dynamic updates of this property can be received by subscribing to its corresponding "notify" signal, i.e.
  "notify::extensions".
  */
  @property gid.gst1.types.ValueArray extensions() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.types.ValueArray)("extensions");
  }


  /**
      custom event handling
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncHandleEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstRTPBaseDepayloadClass*)_vfuncClass;
    if (!_klass.handleEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.handleEvent(cast(GstRTPBaseDepayload*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      signal the depayloader about packet loss
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPacketLost` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPacketLost(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstRTPBaseDepayloadClass*)_vfuncClass;
    if (!_klass.packetLost)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.packetLost(cast(GstRTPBaseDepayload*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      process incoming rtp packets. Subclass must implement either
        this method or process_rtp_packet to process incoming rtp packets.
        If the child returns a buffer without a valid timestamp, the timestamp
        of the provided buffer will be applied to the result buffer and the
        buffer will be pushed. If this function returns null, nothing is pushed.
  
      Params:
        in_ =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProcess` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncProcess(gid.gst1.buffer.Buffer in_)
  {
    auto _klass = cast(GstRTPBaseDepayloadClass*)_vfuncClass;
    if (!_klass.process)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.process(cast(GstRTPBaseDepayload*)this._cPtr, in_ ? cast(GstBuffer*)in_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Same as the process virtual function, but slightly more
      efficient, since it is passed the rtp buffer structure that has already
      been mapped (with GST_MAP_READ) by the base class and thus does not have
      to be mapped again by the subclass. Can be used by the subclass to process
      incoming rtp packets. If the subclass returns a buffer without a valid
      timestamp, the timestamp of the input buffer will be applied to the result
      buffer and the output buffer will be pushed out. If this function returns
      null, nothing is pushed out. Since: 1.6.
  
      Params:
        rtpBuffer =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProcessRtpPacket` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncProcessRtpPacket(gid.gstrtp1.rtpbuffer.RTPBuffer rtpBuffer)
  {
    auto _klass = cast(GstRTPBaseDepayloadClass*)_vfuncClass;
    if (!_klass.processRtpPacket)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.processRtpPacket(cast(GstRTPBaseDepayload*)this._cPtr, rtpBuffer ? cast(GstRTPBuffer*)rtpBuffer._cPtr : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      configure the depayloader
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstRTPBaseDepayloadClass*)_vfuncClass;
    if (!_klass.setCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaps(cast(GstRTPBaseDepayload*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Called from GstRTPBaseDepayload.process or
      GstRTPBaseDepayload.process_rtp_packet when the depayloader needs
      to keep the current input RTP header for use with the next output
      buffer.
      
      The delayed buffer will remain until the end of processing the
      current output buffer and then enqueued for processing with the
      next output buffer.
      
      A typical use-case is when the depayloader implementation will
      start a new output buffer for the current input RTP buffer but push
      the current output buffer first.
      
      Must be called with the stream lock held.
  */
  void delayed() nothrow
  {
    gst_rtp_base_depayload_delayed(cast(GstRTPBaseDepayload*)this._cPtr);
  }

  /**
      Called from GstRTPBaseDepayload.process or
      GstRTPBaseDepayload.process_rtp_packet if the depayloader does not
      use the current buffer for the output buffer. This will either drop
      the delayed buffer or the last buffer from the header extension
      cache.
      
      A typical use-case is when the depayloader implementation is
      dropping an input RTP buffer while waiting for the first keyframe.
      
      Must be called with the stream lock held.
  */
  void dropped() nothrow
  {
    gst_rtp_base_depayload_dropped(cast(GstRTPBaseDepayload*)this._cPtr);
  }

  /**
      If GstRTPBaseDepayload.process or
      GstRTPBaseDepayload.process_rtp_packet drop an output buffer this
      function tells the base class to flush header extension cache as
      well.
      
      This will not drop an input RTP header marked as delayed from
      [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.delayed].
      
      If keep_current is true the current input RTP header will be kept
      and enqueued after flushing the previous input RTP headers.
      
      A typical use-case for keep_current is when the depayloader
      implementation invalidates the current output buffer and starts a
      new one with the current RTP input buffer.
      
      Must be called with the stream lock held.
  
      Params:
        keepCurrent = if the current RTP buffer shall be kept
  */
  void flush(bool keepCurrent) nothrow
  {
    gst_rtp_base_depayload_flush(cast(GstRTPBaseDepayload*)this._cPtr, keepCurrent);
  }

  /**
      Queries whether header extensions will be aggregated per depayloaded buffers.
      Returns: true if aggregate-header-extension is enabled.
  */
  bool isAggregateHdrextEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_base_depayload_is_aggregate_hdrext_enabled(cast(GstRTPBaseDepayload*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether #GstRTPSourceMeta will be added to depayloaded buffers.
      Returns: true if source-info is enabled.
  */
  bool isSourceInfoEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_base_depayload_is_source_info_enabled(cast(GstRTPBaseDepayload*)this._cPtr);
    return _retval;
  }

  /**
      Push out_buf to the peer of filter. This function takes ownership of
      out_buf.
      
      This function will by default apply the last incoming timestamp on
      the outgoing buffer when it didn't have a timestamp already.
  
      Params:
        outBuf = a #GstBuffer
      Returns: a #GstFlowReturn.
  */
  gid.gst1.types.FlowReturn push(gid.gst1.buffer.Buffer outBuf) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_depayload_push(cast(GstRTPBaseDepayload*)this._cPtr, outBuf ? cast(GstBuffer*)outBuf._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Push out_list to the peer of filter. This function takes ownership of
      out_list.
  
      Params:
        outList = a #GstBufferList
      Returns: a #GstFlowReturn.
  */
  gid.gst1.types.FlowReturn pushList(gid.gst1.buffer_list.BufferList outList) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_depayload_push_list(cast(GstRTPBaseDepayload*)this._cPtr, outList ? cast(GstBufferList*)outList._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Enable or disable aggregating header extensions.
  
      Params:
        enable = whether to aggregate header extensions per output buffer
  */
  void setAggregateHdrextEnabled(bool enable) nothrow
  {
    gst_rtp_base_depayload_set_aggregate_hdrext_enabled(cast(GstRTPBaseDepayload*)this._cPtr, enable);
  }

  /**
      Enable or disable adding #GstRTPSourceMeta to depayloaded buffers.
  
      Params:
        enable = whether to add meta about RTP sources to buffer
  */
  void setSourceInfoEnabled(bool enable) nothrow
  {
    gst_rtp_base_depayload_set_source_info_enabled(cast(GstRTPBaseDepayload*)this._cPtr, enable);
  }

  /**
      Connect to `AddExtension` signal.
  
      Add ext as an extension for reading part of an RTP header extension from
        incoming RTP packets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension ext, gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload)`
  
          `ext` the #GstRTPHeaderExtension (optional)
  
          `rTPBaseDepayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAddExtension(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.addExtension");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-extension", closure, after);
  }

  /**
      Connect to `ClearExtensions` signal.
  
      Clear all RTP header extensions used by this depayloader.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload)`
  
          `rTPBaseDepayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClearExtensions(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.clearExtensions");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clear-extensions", closure, after);
  }

  /**
      Connect to `RequestExtension` signal.
  
      The returned ext must be configured with the correct ext_id and with the
        necessary attributes as required by the extension implementation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gstrtp1.rtpheader_extension.RTPHeaderExtension callback(uint extId, string extUri, gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload)`
  
          `extId` the extension id being requested (optional)
  
          `extUri` the extension URI being requested (optional)
  
          `rTPBaseDepayload` the instance the signal is connected to (optional)
  
          `Returns` the #GstRTPHeaderExtension for ext_id, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRequestExtension(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gstrtp1.rtpheader_extension.RTPHeaderExtension _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.requestExtension");
      }

      setVal!(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-extension", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RTPBaseDepayload
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload), T.stringof ~ " is not derived from gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleEvent", true)[0]) == gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload))
      _installVfunc(klass, "handle_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPacketLost", true)[0]) == gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload))
      _installVfunc(klass, "packet_lost");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProcess", true)[0]) == gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload))
      _installVfunc(klass, "process");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProcessRtpPacket", true)[0]) == gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload))
      _installVfunc(klass, "process_rtp_packet");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCaps", true)[0]) == gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload))
      _installVfunc(klass, "set_caps");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstRTPBaseDepayloadClass*)klass;

    switch (vfunc)
    {
      case "handle_event":
      {
        static extern(C) gboolean _vfuncHandleEventTramp(GstRTPBaseDepayload* filter, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBaseDepayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.handleEvent)
              return (cast(typeof(&_vfuncHandleEventTramp))_klass.handleEvent)(filter, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncHandleEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.vfuncHandleEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.handleEvent = cast(typeof(_klass.handleEvent))&_vfuncHandleEventTramp;
        break;
      }
      case "packet_lost":
      {
        static extern(C) gboolean _vfuncPacketLostTramp(GstRTPBaseDepayload* filter, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBaseDepayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.packetLost)
              return (cast(typeof(&_vfuncPacketLostTramp))_klass.packetLost)(filter, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPacketLost(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.vfuncPacketLost");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.packetLost = cast(typeof(_klass.packetLost))&_vfuncPacketLostTramp;
        break;
      }
      case "process":
      {
        static extern(C) GstBuffer* _vfuncProcessTramp(GstRTPBaseDepayload* base, GstBuffer* in_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)base);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBaseDepayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)base);
            if (_klass.process)
              return (cast(typeof(&_vfuncProcessTramp))_klass.process)(base, in_);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;
          auto _in_ = in_ ? new gid.gst1.buffer.Buffer(cast(void*)in_, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncProcess(_in_);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.vfuncProcess");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;
          if (_in_)
            _in_._cUnborrow;

          return _retval;
        }

        _klass.process = cast(typeof(_klass.process))&_vfuncProcessTramp;
        break;
      }
      case "process_rtp_packet":
      {
        static extern(C) GstBuffer* _vfuncProcessRtpPacketTramp(GstRTPBaseDepayload* base, GstRTPBuffer* rtpBuffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)base);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBaseDepayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)base);
            if (_klass.processRtpPacket)
              return (cast(typeof(&_vfuncProcessRtpPacketTramp))_klass.processRtpPacket)(base, rtpBuffer);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;
          auto _rtpBuffer = rtpBuffer ? new gid.gstrtp1.rtpbuffer.RTPBuffer(cast(void*)rtpBuffer, null) : null;

          try
          {
            _dretval = _obj.vfuncProcessRtpPacket(_rtpBuffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.vfuncProcessRtpPacket");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.processRtpPacket = cast(typeof(_klass.processRtpPacket))&_vfuncProcessRtpPacketTramp;
        break;
      }
      case "set_caps":
      {
        static extern(C) gboolean _vfuncSetCapsTramp(GstRTPBaseDepayload* filter, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBaseDepayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.setCaps)
              return (cast(typeof(&_vfuncSetCapsTramp))_klass.setCaps)(filter, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetCaps(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload.vfuncSetCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setCaps = cast(typeof(_klass.setCaps))&_vfuncSetCapsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload]
class RTPBaseDepayloadGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `autoHeaderExtension` property.
      Params:
        propval = If enabled, the depayloader will automatically try to enable all the
          RTP header extensions provided in the sink caps, saving the application
          the need to handle these extensions manually using the
          GstRTPBaseDepayload::request-extension: signal.
      Returns: Builder instance for fluent chaining
  */
  T autoHeaderExtension(bool propval) nothrow
  {
    return setProperty("auto-header-extension", propval);
  }

  /**
      Set `maxReorder` property.
      Params:
        propval = Max seqnum reorder before the sender is assumed to have restarted.
          
          When max-reorder is set to 0 all reordered/duplicate packets are
          considered coming from a restarted sender.
      Returns: Builder instance for fluent chaining
  */
  T maxReorder(int propval) nothrow
  {
    return setProperty("max-reorder", propval);
  }

  /**
      Set `sourceInfo` property.
      Params:
        propval = Add RTP source information found in RTP header as meta to output buffer.
      Returns: Builder instance for fluent chaining
  */
  T sourceInfo(bool propval) nothrow
  {
    return setProperty("source-info", propval);
  }
}

/// Fluent builder for [gid.gstrtp1.rtpbase_depayload.RTPBaseDepayload]
final class RTPBaseDepayloadGidBuilder : RTPBaseDepayloadGidBuilderImpl!RTPBaseDepayloadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RTPBaseDepayload build() nothrow
  {
    return new RTPBaseDepayload(cast(void*)createGObject(RTPBaseDepayload._getGType), Yes.Take);
  }
}
