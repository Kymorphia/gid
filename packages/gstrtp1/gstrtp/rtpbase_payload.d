/// Module for [RTPBasePayload] class
module gstrtp.rtpbase_payload;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.buffer;
import gst.buffer_list;
import gst.element;
import gst.structure;
import gst.types;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtpheader_extension;
import gstrtp.types;

/**
    Provides a base class for RTP payloaders
*/
class RTPBasePayload : gst.element.Element
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
    return cast(void function())gst_rtp_base_payload_get_type != &gidSymbolNotFound ? gst_rtp_base_payload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RTPBasePayload self()
  {
    return this;
  }

  /**
      Get `autoHeaderExtension` property.
      Returns: If enabled, the payloader will automatically try to enable all the
      RTP header extensions provided in the src caps, saving the application
      the need to handle these extensions manually using the
      GstRTPBasePayload::request-extension: signal.
  */
  @property bool autoHeaderExtension()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("auto-header-extension");
  }

  /**
      Set `autoHeaderExtension` property.
      Params:
        propval = If enabled, the payloader will automatically try to enable all the
        RTP header extensions provided in the src caps, saving the application
        the need to handle these extensions manually using the
        GstRTPBasePayload::request-extension: signal.
  */
  @property void autoHeaderExtension(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("auto-header-extension", propval);
  }

  /** */
  @property long maxPtime()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("max-ptime");
  }

  /** */
  @property void maxPtime(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("max-ptime", propval);
  }

  /**
      Get `minPtime` property.
      Returns: Minimum duration of the packet data in ns (can't go above MTU)
  */
  @property long minPtime()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("min-ptime");
  }

  /**
      Set `minPtime` property.
      Params:
        propval = Minimum duration of the packet data in ns (can't go above MTU)
  */
  @property void minPtime(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("min-ptime", propval);
  }

  /** */
  @property uint mtu()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("mtu");
  }

  /** */
  @property void mtu(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("mtu", propval);
  }

  /**
      Get `onvifNoRateControl` property.
      Returns: Make the payloader timestamp packets according to the Rate-Control=no
      behaviour specified in the ONVIF replay spec.
  */
  @property bool onvifNoRateControl()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("onvif-no-rate-control");
  }

  /**
      Set `onvifNoRateControl` property.
      Params:
        propval = Make the payloader timestamp packets according to the Rate-Control=no
        behaviour specified in the ONVIF replay spec.
  */
  @property void onvifNoRateControl(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("onvif-no-rate-control", propval);
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
  @property bool perfectRtptime()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("perfect-rtptime");
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
  @property void perfectRtptime(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("perfect-rtptime", propval);
  }

  /** */
  @property uint pt()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("pt");
  }

  /** */
  @property void pt(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("pt", propval);
  }

  /**
      Get `ptimeMultiple` property.
      Returns: Force buffers to be multiples of this duration in ns (0 disables)
  */
  @property long ptimeMultiple()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("ptime-multiple");
  }

  /**
      Set `ptimeMultiple` property.
      Params:
        propval = Force buffers to be multiples of this duration in ns (0 disables)
  */
  @property void ptimeMultiple(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("ptime-multiple", propval);
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
  @property bool scaleRtptime()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("scale-rtptime");
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
  @property void scaleRtptime(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("scale-rtptime", propval);
  }

  /** */
  @property uint seqnum()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("seqnum");
  }

  /** */
  @property int seqnumOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("seqnum-offset");
  }

  /** */
  @property void seqnumOffset(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("seqnum-offset", propval);
  }

  /**
      Get `sourceInfo` property.
      Returns: Enable writing the CSRC field in allocated RTP header based on RTP source
      information found in the input buffer's #GstRTPSourceMeta.
  */
  @property bool sourceInfo()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("source-info");
  }

  /**
      Set `sourceInfo` property.
      Params:
        propval = Enable writing the CSRC field in allocated RTP header based on RTP source
        information found in the input buffer's #GstRTPSourceMeta.
  */
  @property void sourceInfo(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("source-info", propval);
  }

  /** */
  @property uint ssrc()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("ssrc");
  }

  /** */
  @property void ssrc(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("ssrc", propval);
  }

  /**
      Get `stats` property.
      Returns: Various payloader statistics retrieved atomically (and are therefore
      synchroized with each other), these can be used e.g. to generate an
      RTP-Info header. This property return a GstStructure named
      application/x-rtp-payload-stats containing the following fields relating to
      the last processed buffer and current state of the stream being payloaded:
      
        $(LIST
            * `clock-rate` :#G_TYPE_UINT, clock-rate of the stream
            * `running-time` :#G_TYPE_UINT64, running time
            * `seqnum` :#G_TYPE_UINT, sequence number, same as #GstRTPBasePayload:seqnum
            * `timestamp` :#G_TYPE_UINT, RTP timestamp, same as #GstRTPBasePayload:timestamp
            * `ssrc` :#G_TYPE_UINT, The SSRC in use
            * `pt` :#G_TYPE_UINT, The Payload type in use, same as #GstRTPBasePayload:pt
            * `seqnum-offset` :#G_TYPE_UINT, The current offset added to the seqnum
            * `timestamp-offset` :#G_TYPE_UINT, The current offset added to the timestamp
        )
  */
  @property gst.structure.Structure stats()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.structure.Structure)("stats");
  }

  /** */
  @property uint timestamp()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("timestamp");
  }

  /** */
  @property uint timestampOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("timestamp-offset");
  }

  /** */
  @property void timestampOffset(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("timestamp-offset", propval);
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
  gst.buffer.Buffer allocateOutputBuffer(uint payloadLen, ubyte padLen, ubyte csrcCount)
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_base_payload_allocate_output_buffer(cast(GstRTPBasePayload*)this._cPtr, payloadLen, padLen, csrcCount);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Count the total number of RTP sources found in the meta of buffer, which
      will be automically added by [gstrtp.rtpbase_payload.RTPBasePayload.allocateOutputBuffer].
      If #GstRTPBasePayload:source-info is false the count will be 0.
  
      Params:
        buffer = a #GstBuffer, typically the buffer to payload
      Returns: The number of sources.
  */
  uint getSourceCount(gst.buffer.Buffer buffer)
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
  bool isFilled(uint size, gst.types.ClockTime duration)
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
  bool isSourceInfoEnabled()
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
  gst.types.FlowReturn push(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_payload_push(cast(GstRTPBasePayload*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
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
  gst.types.FlowReturn pushList(gst.buffer_list.BufferList list)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_payload_push_list(cast(GstRTPBasePayload*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Set the rtp options of the payloader. These options will be set in the caps
      of the payloader. Subclasses must call this method before calling
      [gstrtp.rtpbase_payload.RTPBasePayload.push] or [gstrtp.rtpbase_payload.RTPBasePayload.setOutcaps].
  
      Params:
        media = the media type (typically "audio" or "video")
        dynamic = if the payload type is dynamic
        encodingName = the encoding name
        clockRate = the clock rate of the media
  */
  void setOptions(string media, bool dynamic, string encodingName, uint clockRate)
  {
    const(char)* _media = media.toCString(No.Alloc);
    const(char)* _encodingName = encodingName.toCString(No.Alloc);
    gst_rtp_base_payload_set_options(cast(GstRTPBasePayload*)this._cPtr, _media, dynamic, _encodingName, clockRate);
  }

  /**
      Configure the output caps with the optional fields.
  
      Params:
        s = a #GstStructure with the caps fields
      Returns: true if the caps could be set.
  */
  bool setOutcapsStructure(gst.structure.Structure s = null)
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
  void setSourceInfoEnabled(bool enable)
  {
    gst_rtp_base_payload_set_source_info_enabled(cast(GstRTPBasePayload*)this._cPtr, enable);
  }

  /**
      Connect to `AddExtension` signal.
  
      Add ext as an extension for writing part of an RTP header extension onto
      outgoing RTP packets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload))
  
          `ext` the #GstRTPHeaderExtension (optional)
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAddExtension(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstrtp.rtpheader_extension.RTPHeaderExtension)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstrtp.rtpbase_payload.RTPBasePayload)))
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
    return connectSignalClosure("add-extension", closure, after);
  }

  /**
      Connect to `ClearExtensions` signal.
  
      Clear all RTP header extensions used by this payloader.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload))
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClearExtensions(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstrtp.rtpbase_payload.RTPBasePayload)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D gstrtp.rtpheader_extension.RTPHeaderExtension callback(uint extId, string extUri, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload))
  
          `extId` the extension id being requested (optional)
  
          `extUri` the extension URI being requested (optional)
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
          `Returns` the #GstRTPHeaderExtension for ext_id, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestExtension(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gstrtp.rtpheader_extension.RTPHeaderExtension)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstrtp.rtpbase_payload.RTPBasePayload)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gstrtp.rtpheader_extension.RTPHeaderExtension)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-extension", closure, after);
  }
}
