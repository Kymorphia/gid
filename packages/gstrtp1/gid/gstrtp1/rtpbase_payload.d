/// Module for [RTPBasePayload] class
module gid.gstrtp1.rtpbase_payload;

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
import gid.gst1.pad;
import gid.gst1.query;
import gid.gst1.structure;
import gid.gst1.types;
import gid.gstrtp1.c.functions;
import gid.gstrtp1.c.types;
import gid.gstrtp1.rtpheader_extension;
import gid.gstrtp1.types;

/**
    Provides a base class for RTP payloaders
*/
class RTPBasePayload : gid.gst1.element.Element
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
    return cast(void function())gst_rtp_base_payload_get_type != &gidSymbolNotFound ? gst_rtp_base_payload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstRTPBasePayload";
  }

  /** Returns `this`, for use in `with` statements. */
  override RTPBasePayload self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstrtp1.rtpbase_payload.RTPBasePayload]
      Returns: New builder object
  */
  static RTPBasePayloadGidBuilder builder() nothrow
  {
    return new RTPBasePayloadGidBuilder;
  }

  /**
      Get `autoHeaderExtension` property.
      Returns: If enabled, the payloader will automatically try to enable all the
        RTP header extensions provided in the src caps, saving the application
        the need to handle these extensions manually using the
        GstRTPBasePayload::request-extension: signal.
  */
  @property bool autoHeaderExtension() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("auto-header-extension");
  }

  /**
      Set `autoHeaderExtension` property.
      Params:
        propval = If enabled, the payloader will automatically try to enable all the
          RTP header extensions provided in the src caps, saving the application
          the need to handle these extensions manually using the
          GstRTPBasePayload::request-extension: signal.
  */
  @property void autoHeaderExtension(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("auto-header-extension", propval);
  }

  /** */
  @property long maxPtime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("max-ptime");
  }

  /** */
  @property void maxPtime(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("max-ptime", propval);
  }

  /**
      Get `minPtime` property.
      Returns: Minimum duration of the packet data in ns (can't go above MTU)
  */
  @property long minPtime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("min-ptime");
  }

  /**
      Set `minPtime` property.
      Params:
        propval = Minimum duration of the packet data in ns (can't go above MTU)
  */
  @property void minPtime(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("min-ptime", propval);
  }

  /** */
  @property uint mtu() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("mtu");
  }

  /** */
  @property void mtu(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("mtu", propval);
  }

  /**
      Get `onvifNoRateControl` property.
      Returns: Make the payloader timestamp packets according to the Rate-Control=no
        behaviour specified in the ONVIF replay spec.
  */
  @property bool onvifNoRateControl() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("onvif-no-rate-control");
  }

  /**
      Set `onvifNoRateControl` property.
      Params:
        propval = Make the payloader timestamp packets according to the Rate-Control=no
          behaviour specified in the ONVIF replay spec.
  */
  @property void onvifNoRateControl(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("onvif-no-rate-control", propval);
  }

  /**
      Get `perfectRtptime` property.
      Returns: Try to use the offset fields to generate perfect RTP timestamps. When this
        option is disabled, RTP timestamps are generated from GST_BUFFER_PTS of
        each payloaded buffer. The PTSes of buffers may not necessarily increment
        with the amount of data in each input buffer, consider e.g. the case where
        the buffer arrives from a network which means that the PTS is unrelated to
        the amount of data. Because the RTP timestamps are generated from
        GST_BUFFER_PTS this can result in RTP timestamps that also don't increment
        with the amount of data in the payloaded packet. To circumvent this it is
        possible to set the perfect rtptime option enabled. When this option is
        enabled the payloader will increment the RTP timestamps based on
        GST_BUFFER_OFFSET which relates to the amount of data in each packet
        rather than the GST_BUFFER_PTS of each buffer and therefore the RTP
        timestamps will more closely correlate with the amount of data in each
        buffer. Currently GstRTPBasePayload is limited to handling perfect RTP
        timestamps for audio streams.
  */
  @property bool perfectRtptime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("perfect-rtptime");
  }

  /**
      Set `perfectRtptime` property.
      Params:
        propval = Try to use the offset fields to generate perfect RTP timestamps. When this
          option is disabled, RTP timestamps are generated from GST_BUFFER_PTS of
          each payloaded buffer. The PTSes of buffers may not necessarily increment
          with the amount of data in each input buffer, consider e.g. the case where
          the buffer arrives from a network which means that the PTS is unrelated to
          the amount of data. Because the RTP timestamps are generated from
          GST_BUFFER_PTS this can result in RTP timestamps that also don't increment
          with the amount of data in the payloaded packet. To circumvent this it is
          possible to set the perfect rtptime option enabled. When this option is
          enabled the payloader will increment the RTP timestamps based on
          GST_BUFFER_OFFSET which relates to the amount of data in each packet
          rather than the GST_BUFFER_PTS of each buffer and therefore the RTP
          timestamps will more closely correlate with the amount of data in each
          buffer. Currently GstRTPBasePayload is limited to handling perfect RTP
          timestamps for audio streams.
  */
  @property void perfectRtptime(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("perfect-rtptime", propval);
  }

  /** */
  @property uint pt() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("pt");
  }

  /** */
  @property void pt(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("pt", propval);
  }

  /**
      Get `ptimeMultiple` property.
      Returns: Force buffers to be multiples of this duration in ns (0 disables)
  */
  @property long ptimeMultiple() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("ptime-multiple");
  }

  /**
      Set `ptimeMultiple` property.
      Params:
        propval = Force buffers to be multiples of this duration in ns (0 disables)
  */
  @property void ptimeMultiple(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("ptime-multiple", propval);
  }

  /**
      Get `scaleRtptime` property.
      Returns: Make the RTP packets' timestamps be scaled with the segment's rate
        (corresponding to RTSP speed parameter). Disabling this property means
        the timestamps will not be affected by the set delivery speed (RTSP speed).
        
        Example: A server wants to allow streaming a recorded video in double
        speed but still have the timestamps correspond to the position in the
        video. This is achieved by the client setting RTSP Speed to 2 while the
        server has this property disabled.
  */
  @property bool scaleRtptime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("scale-rtptime");
  }

  /**
      Set `scaleRtptime` property.
      Params:
        propval = Make the RTP packets' timestamps be scaled with the segment's rate
          (corresponding to RTSP speed parameter). Disabling this property means
          the timestamps will not be affected by the set delivery speed (RTSP speed).
          
          Example: A server wants to allow streaming a recorded video in double
          speed but still have the timestamps correspond to the position in the
          video. This is achieved by the client setting RTSP Speed to 2 while the
          server has this property disabled.
  */
  @property void scaleRtptime(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("scale-rtptime", propval);
  }

  /** */
  @property uint seqnum() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("seqnum");
  }

  /** */
  @property int seqnumOffset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("seqnum-offset");
  }

  /** */
  @property void seqnumOffset(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("seqnum-offset", propval);
  }

  /**
      Get `sourceInfo` property.
      Returns: Enable writing the CSRC field in allocated RTP header based on RTP source
        information found in the input buffer's #GstRTPSourceMeta.
  */
  @property bool sourceInfo() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("source-info");
  }

  /**
      Set `sourceInfo` property.
      Params:
        propval = Enable writing the CSRC field in allocated RTP header based on RTP source
          information found in the input buffer's #GstRTPSourceMeta.
  */
  @property void sourceInfo(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("source-info", propval);
  }

  /** */
  @property uint ssrc() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("ssrc");
  }

  /** */
  @property void ssrc(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("ssrc", propval);
  }

  /**
      Get `stats` property.
      Returns: Various payloader statistics retrieved atomically (and are therefore
        synchroized with each other), these can be used e.g. to generate an
        RTP-Info header. This property return a GstStructure named
        application/x-rtp-payload-stats containing the following fields relating to
        the last processed buffer and current state of the stream being payloaded:
        
          * `clock-rate` :#G_TYPE_UINT, clock-rate of the stream
          * `running-time` :#G_TYPE_UINT64, running time
          * `seqnum` :#G_TYPE_UINT, sequence number, same as #GstRTPBasePayload:seqnum
          * `timestamp` :#G_TYPE_UINT, RTP timestamp, same as #GstRTPBasePayload:timestamp
          * `ssrc` :#G_TYPE_UINT, The SSRC in use
          * `pt` :#G_TYPE_UINT, The Payload type in use, same as #GstRTPBasePayload:pt
          * `seqnum-offset` :#G_TYPE_UINT, The current offset added to the seqnum
          * `timestamp-offset` :#G_TYPE_UINT, The current offset added to the timestamp
  */
  @property gid.gst1.structure.Structure stats() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.structure.Structure)("stats");
  }

  /** */
  @property uint timestamp() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("timestamp");
  }

  /** */
  @property uint timestampOffset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("timestamp-offset");
  }

  /** */
  @property void timestampOffset(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("timestamp-offset", propval);
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
      get desired caps
  
      Params:
        pad = 
        filter =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncGetCaps(gid.gst1.pad.Pad pad, gid.gst1.caps.Caps filter)
  {
    auto _klass = cast(GstRTPBasePayloadClass*)_vfuncClass;
    if (!_klass.getCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getCaps(cast(GstRTPBasePayload*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      process data
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncHandleBuffer(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstRTPBasePayloadClass*)_vfuncClass;
    if (!_klass.handleBuffer)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.handleBuffer(cast(GstRTPBasePayload*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  alias vfuncQuery = gid.gst1.element.Element.vfuncQuery;

  /**
      custom query handling
  
      Params:
        pad = 
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncQuery(gid.gst1.pad.Pad pad, gid.gst1.query.Query query)
  {
    auto _klass = cast(GstRTPBasePayloadClass*)_vfuncClass;
    if (!_klass.query)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.query(cast(GstRTPBasePayload*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      configure the payloader
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSetCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstRTPBasePayloadClass*)_vfuncClass;
    if (!_klass.setCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaps(cast(GstRTPBasePayload*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      custom event handling on the sinkpad
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSinkEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstRTPBasePayloadClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstRTPBasePayload*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      custom event handling on the srcpad
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSrcEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstRTPBasePayloadClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstRTPBasePayload*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Allocate a new #GstBuffer with enough data to hold an RTP packet with
      minimum csrc_count CSRCs, a payload length of payload_len and padding of
      pad_len. If payload has #GstRTPBasePayload:source-info true additional
      CSRCs may be allocated and filled with RTP source information.
  
      Params:
        payloadLen = the length of the payload
        padLen = the amount of padding
        csrcCount = the minimum number of CSRC entries
      Returns: A newly allocated buffer that can hold an RTP packet with given
        parameters.
  */
  gid.gst1.buffer.Buffer allocateOutputBuffer(uint payloadLen, ubyte padLen, ubyte csrcCount) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_base_payload_allocate_output_buffer(cast(GstRTPBasePayload*)this._cPtr, payloadLen, padLen, csrcCount);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Count the total number of RTP sources found in the meta of buffer, which
      will be automically added by [gid.gstrtp1.rtpbase_payload.RTPBasePayload.allocateOutputBuffer].
      If #GstRTPBasePayload:source-info is false the count will be 0.
  
      Params:
        buffer = a #GstBuffer, typically the buffer to payload
      Returns: The number of sources.
  */
  uint getSourceCount(gid.gst1.buffer.Buffer buffer) nothrow
  {
    uint _retval;
    _retval = gst_rtp_base_payload_get_source_count(cast(GstRTPBasePayload*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if the packet with size and duration would exceed the configured
      maximum size.
  
      Params:
        size = the size of the packet
        duration = the duration of the packet
      Returns: true if the packet of size and duration would exceed the
        configured MTU or max_ptime.
  */
  bool isFilled(uint size, gid.gst1.types.ClockTime duration) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_base_payload_is_filled(cast(GstRTPBasePayload*)this._cPtr, size, duration);
    return _retval;
  }

  /**
      Queries whether the payloader will add contributing sources (CSRCs) to the
      RTP header from #GstRTPSourceMeta.
      Returns: true if source-info is enabled.
  */
  bool isSourceInfoEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_base_payload_is_source_info_enabled(cast(GstRTPBasePayload*)this._cPtr);
    return _retval;
  }

  /**
      Push buffer to the peer element of the payloader. The SSRC, payload type,
      seqnum and timestamp of the RTP buffer will be updated first.
      
      This function takes ownership of buffer.
  
      Params:
        buffer = a #GstBuffer
      Returns: a #GstFlowReturn.
  */
  gid.gst1.types.FlowReturn push(gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_payload_push(cast(GstRTPBasePayload*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Push list to the peer element of the payloader. The SSRC, payload type,
      seqnum and timestamp of the RTP buffer will be updated first.
      
      This function takes ownership of list.
  
      Params:
        list = a #GstBufferList
      Returns: a #GstFlowReturn.
  */
  gid.gst1.types.FlowReturn pushList(gid.gst1.buffer_list.BufferList list) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_payload_push_list(cast(GstRTPBasePayload*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Set the rtp options of the payloader. These options will be set in the caps
      of the payloader. Subclasses must call this method before calling
      [gid.gstrtp1.rtpbase_payload.RTPBasePayload.push] or [gid.gstrtp1.rtpbase_payload.RTPBasePayload.setOutcaps].
  
      Params:
        media = the media type (typically "audio" or "video")
        dynamic = if the payload type is dynamic
        encodingName = the encoding name
        clockRate = the clock rate of the media
  */
  void setOptions(string media, bool dynamic, string encodingName, uint clockRate) nothrow
  {
    const(char)* _media = media.toCString!(No.Malloc, No.Nullable);
    const(char)* _encodingName = encodingName.toCString!(No.Malloc, No.Nullable);
    gst_rtp_base_payload_set_options(cast(GstRTPBasePayload*)this._cPtr, _media, dynamic, _encodingName, clockRate);
  }

  /**
      Configure the output caps with the optional fields.
  
      Params:
        s = a #GstStructure with the caps fields
      Returns: true if the caps could be set.
  */
  bool setOutcapsStructure(gid.gst1.structure.Structure s = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_base_payload_set_outcaps_structure(cast(GstRTPBasePayload*)this._cPtr, s ? cast(GstStructure*)s._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Enable or disable adding contributing sources to RTP packets from
      #GstRTPSourceMeta.
  
      Params:
        enable = whether to add contributing sources to RTP packets
  */
  void setSourceInfoEnabled(bool enable) nothrow
  {
    gst_rtp_base_payload_set_source_info_enabled(cast(GstRTPBasePayload*)this._cPtr, enable);
  }

  /**
      Connect to `AddExtension` signal.
  
      Add ext as an extension for writing part of an RTP header extension onto
        outgoing RTP packets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension ext, gid.gstrtp1.rtpbase_payload.RTPBasePayload rTPBasePayload)`
  
          `ext` the #GstRTPHeaderExtension (optional)
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAddExtension(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstrtp1.rtpbase_payload.RTPBasePayload)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.addExtension");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-extension", closure, after);
  }

  /**
      Connect to `ClearExtensions` signal.
  
      Clear all RTP header extensions used by this payloader.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstrtp1.rtpbase_payload.RTPBasePayload rTPBasePayload)`
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClearExtensions(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstrtp1.rtpbase_payload.RTPBasePayload)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.clearExtensions");
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
  
          `gid.gstrtp1.rtpheader_extension.RTPHeaderExtension callback(uint extId, string extUri, gid.gstrtp1.rtpbase_payload.RTPBasePayload rTPBasePayload)`
  
          `extId` the extension id being requested (optional)
  
          `extUri` the extension URI being requested (optional)
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
          `Returns` the #GstRTPHeaderExtension for ext_id, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRequestExtension(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gstrtp1.rtpbase_payload.RTPBasePayload)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.requestExtension");
      }

      setVal!(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-extension", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RTPBasePayload
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstrtp1.rtpbase_payload.RTPBasePayload), T.stringof ~ " is not derived from gid.gstrtp1.rtpbase_payload.RTPBasePayload");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCaps", true)[0]) == gid.gstrtp1.rtpbase_payload.RTPBasePayload))
      _installVfunc(klass, "get_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleBuffer", true)[0]) == gid.gstrtp1.rtpbase_payload.RTPBasePayload))
      _installVfunc(klass, "handle_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQuery", true)[0]) == gid.gstrtp1.rtpbase_payload.RTPBasePayload))
      _installVfunc(klass, "query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCaps", true)[0]) == gid.gstrtp1.rtpbase_payload.RTPBasePayload))
      _installVfunc(klass, "set_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstrtp1.rtpbase_payload.RTPBasePayload))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstrtp1.rtpbase_payload.RTPBasePayload))
      _installVfunc(klass, "src_event");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstRTPBasePayloadClass*)klass;

    switch (vfunc)
    {
      case "get_caps":
      {
        static extern(C) GstCaps* _vfuncGetCapsTramp(GstRTPBasePayload* payload, GstPad* pad, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_payload.RTPBasePayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)payload);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBasePayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)payload);
            if (_klass.getCaps)
              return (cast(typeof(&_vfuncGetCapsTramp))_klass.getCaps)(payload, pad, filter);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _filter = filter ? new gid.gst1.caps.Caps(cast(void*)filter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetCaps(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), _filter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.vfuncGetCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_filter)
            _filter._cUnborrow;

          return _retval;
        }

        _klass.getCaps = cast(typeof(_klass.getCaps))&_vfuncGetCapsTramp;
        break;
      }
      case "handle_buffer":
      {
        static extern(C) GstFlowReturn _vfuncHandleBufferTramp(GstRTPBasePayload* payload, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_payload.RTPBasePayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)payload);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBasePayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)payload);
            if (_klass.handleBuffer)
              return (cast(typeof(&_vfuncHandleBufferTramp))_klass.handleBuffer)(payload, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncHandleBuffer(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.vfuncHandleBuffer");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.handleBuffer = cast(typeof(_klass.handleBuffer))&_vfuncHandleBufferTramp;
        break;
      }
      case "query":
      {
        static extern(C) gboolean _vfuncQueryTramp(GstRTPBasePayload* payload, GstPad* pad, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_payload.RTPBasePayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)payload);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBasePayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)payload);
            if (_klass.query)
              return (cast(typeof(&_vfuncQueryTramp))_klass.query)(payload, pad, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncQuery(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take), _query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.vfuncQuery");
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
        static extern(C) gboolean _vfuncSetCapsTramp(GstRTPBasePayload* payload, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_payload.RTPBasePayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)payload);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBasePayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)payload);
            if (_klass.setCaps)
              return (cast(typeof(&_vfuncSetCapsTramp))_klass.setCaps)(payload, caps);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.vfuncSetCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setCaps = cast(typeof(_klass.setCaps))&_vfuncSetCapsTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstRTPBasePayload* payload, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_payload.RTPBasePayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)payload);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBasePayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)payload);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(payload, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.vfuncSinkEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.sinkEvent = cast(typeof(_klass.sinkEvent))&_vfuncSinkEventTramp;
        break;
      }
      case "src_event":
      {
        static extern(C) gboolean _vfuncSrcEventTramp(GstRTPBasePayload* payload, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpbase_payload.RTPBasePayload)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)payload);
          if (!_obj)
          {
            auto _klass = cast(GstRTPBasePayloadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)payload);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(payload, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSrcEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpbase_payload.RTPBasePayload.vfuncSrcEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.srcEvent = cast(typeof(_klass.srcEvent))&_vfuncSrcEventTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstrtp1.rtpbase_payload.RTPBasePayload]
class RTPBasePayloadGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `autoHeaderExtension` property.
      Params:
        propval = If enabled, the payloader will automatically try to enable all the
          RTP header extensions provided in the src caps, saving the application
          the need to handle these extensions manually using the
          GstRTPBasePayload::request-extension: signal.
      Returns: Builder instance for fluent chaining
  */
  T autoHeaderExtension(bool propval) nothrow
  {
    return setProperty("auto-header-extension", propval);
  }

  /** */
  T maxPtime(long propval) nothrow
  {
    return setProperty("max-ptime", propval);
  }

  /**
      Set `minPtime` property.
      Params:
        propval = Minimum duration of the packet data in ns (can't go above MTU)
      Returns: Builder instance for fluent chaining
  */
  T minPtime(long propval) nothrow
  {
    return setProperty("min-ptime", propval);
  }

  /** */
  T mtu(uint propval) nothrow
  {
    return setProperty("mtu", propval);
  }

  /**
      Set `onvifNoRateControl` property.
      Params:
        propval = Make the payloader timestamp packets according to the Rate-Control=no
          behaviour specified in the ONVIF replay spec.
      Returns: Builder instance for fluent chaining
  */
  T onvifNoRateControl(bool propval) nothrow
  {
    return setProperty("onvif-no-rate-control", propval);
  }

  /**
      Set `perfectRtptime` property.
      Params:
        propval = Try to use the offset fields to generate perfect RTP timestamps. When this
          option is disabled, RTP timestamps are generated from GST_BUFFER_PTS of
          each payloaded buffer. The PTSes of buffers may not necessarily increment
          with the amount of data in each input buffer, consider e.g. the case where
          the buffer arrives from a network which means that the PTS is unrelated to
          the amount of data. Because the RTP timestamps are generated from
          GST_BUFFER_PTS this can result in RTP timestamps that also don't increment
          with the amount of data in the payloaded packet. To circumvent this it is
          possible to set the perfect rtptime option enabled. When this option is
          enabled the payloader will increment the RTP timestamps based on
          GST_BUFFER_OFFSET which relates to the amount of data in each packet
          rather than the GST_BUFFER_PTS of each buffer and therefore the RTP
          timestamps will more closely correlate with the amount of data in each
          buffer. Currently GstRTPBasePayload is limited to handling perfect RTP
          timestamps for audio streams.
      Returns: Builder instance for fluent chaining
  */
  T perfectRtptime(bool propval) nothrow
  {
    return setProperty("perfect-rtptime", propval);
  }

  /** */
  T pt(uint propval) nothrow
  {
    return setProperty("pt", propval);
  }

  /**
      Set `ptimeMultiple` property.
      Params:
        propval = Force buffers to be multiples of this duration in ns (0 disables)
      Returns: Builder instance for fluent chaining
  */
  T ptimeMultiple(long propval) nothrow
  {
    return setProperty("ptime-multiple", propval);
  }

  /**
      Set `scaleRtptime` property.
      Params:
        propval = Make the RTP packets' timestamps be scaled with the segment's rate
          (corresponding to RTSP speed parameter). Disabling this property means
          the timestamps will not be affected by the set delivery speed (RTSP speed).
          
          Example: A server wants to allow streaming a recorded video in double
          speed but still have the timestamps correspond to the position in the
          video. This is achieved by the client setting RTSP Speed to 2 while the
          server has this property disabled.
      Returns: Builder instance for fluent chaining
  */
  T scaleRtptime(bool propval) nothrow
  {
    return setProperty("scale-rtptime", propval);
  }

  /** */
  T seqnumOffset(int propval) nothrow
  {
    return setProperty("seqnum-offset", propval);
  }

  /**
      Set `sourceInfo` property.
      Params:
        propval = Enable writing the CSRC field in allocated RTP header based on RTP source
          information found in the input buffer's #GstRTPSourceMeta.
      Returns: Builder instance for fluent chaining
  */
  T sourceInfo(bool propval) nothrow
  {
    return setProperty("source-info", propval);
  }

  /** */
  T ssrc(uint propval) nothrow
  {
    return setProperty("ssrc", propval);
  }

  /** */
  T timestampOffset(uint propval) nothrow
  {
    return setProperty("timestamp-offset", propval);
  }
}

/// Fluent builder for [gid.gstrtp1.rtpbase_payload.RTPBasePayload]
final class RTPBasePayloadGidBuilder : RTPBasePayloadGidBuilderImpl!RTPBasePayloadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RTPBasePayload build() nothrow
  {
    return new RTPBasePayload(cast(void*)createGObject(RTPBasePayload._getGType), Yes.Take);
  }
}
