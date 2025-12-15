/// Module for [RTPBaseDepayload] class
module gstrtp.rtpbase_depayload;

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
    Provides a base class for RTP depayloaders
    
    In order to handle RTP header extensions correctly if the
    depayloader aggregates multiple RTP packet payloads into one output
    buffer this class provides the function
    [gstrtp.rtpbase_depayload.RTPBaseDepayload.setAggregateHdrextEnabled]. If the
    aggregation is enabled the virtual functions
    @GstRTPBaseDepayload.process or
    @GstRTPBaseDepayload.process_rtp_packet must tell the base class
    what happens to the current RTP packet. By default the base class
    assumes that the packet payload is used with the next output
    buffer.
    
    If the RTP packet will not be used with an output buffer
    [gstrtp.rtpbase_depayload.RTPBaseDepayload.dropped] must be called. A typical
    situation would be if we are waiting for a keyframe.
    
    If the RTP packet will be used but not with the current output
    buffer but with the next one [gstrtp.rtpbase_depayload.RTPBaseDepayload.delayed] must
    be called. This may happen if the current RTP packet signals the
    start of a new output buffer and the currently processed output
    buffer will be pushed first. The undelay happens implicitly once
    the current buffer has been pushed or
    [gstrtp.rtpbase_depayload.RTPBaseDepayload.flush] has been called.
    
    If [gstrtp.rtpbase_depayload.RTPBaseDepayload.flush] is called all RTP packets that
    have not been dropped since the last output buffer are dropped,
    e.g. if an output buffer is discarded due to malformed data. This
    may or may not include the current RTP packet depending on the 2nd
    parameter @keep_current.
    
    Be aware that in case [gstrtp.rtpbase_depayload.RTPBaseDepayload.pushList] is used
    each buffer will see the same list of RTP header extensions.
*/
class RTPBaseDepayload : gst.element.Element
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
    return cast(void function())gst_rtp_base_depayload_get_type != &gidSymbolNotFound ? gst_rtp_base_depayload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RTPBaseDepayload self()
  {
    return this;
  }

  /**
      Get `autoHeaderExtension` property.
      Returns: If enabled, the depayloader will automatically try to enable all the
      RTP header extensions provided in the sink caps, saving the application
      the need to handle these extensions manually using the
      GstRTPBaseDepayload::request-extension: signal.
  */
  @property bool autoHeaderExtension()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("auto-header-extension");
  }

  /**
      Set `autoHeaderExtension` property.
      Params:
        propval = If enabled, the depayloader will automatically try to enable all the
        RTP header extensions provided in the sink caps, saving the application
        the need to handle these extensions manually using the
        GstRTPBaseDepayload::request-extension: signal.
  */
  @property void autoHeaderExtension(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("auto-header-extension", propval);
  }

  /**
      Get `maxReorder` property.
      Returns: Max seqnum reorder before the sender is assumed to have restarted.
      
      When max-reorder is set to 0 all reordered/duplicate packets are
      considered coming from a restarted sender.
  */
  @property int maxReorder()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-reorder");
  }

  /**
      Set `maxReorder` property.
      Params:
        propval = Max seqnum reorder before the sender is assumed to have restarted.
        
        When max-reorder is set to 0 all reordered/duplicate packets are
        considered coming from a restarted sender.
  */
  @property void maxReorder(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-reorder", propval);
  }

  /**
      Get `sourceInfo` property.
      Returns: Add RTP source information found in RTP header as meta to output buffer.
  */
  @property bool sourceInfo()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("source-info");
  }

  /**
      Set `sourceInfo` property.
      Params:
        propval = Add RTP source information found in RTP header as meta to output buffer.
  */
  @property void sourceInfo(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("source-info", propval);
  }

  /**
      Get `stats` property.
      Returns: Various depayloader statistics retrieved atomically (and are therefore
      synchroized with each other). This property return a GstStructure named
      application/x-rtp-depayload-stats containing the following fields relating to
      the last processed buffer and current state of the stream being depayloaded:
      
        $(LIST
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
        )
  */
  @property gst.structure.Structure stats()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.structure.Structure)("stats");
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
  void delayed()
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
  void dropped()
  {
    gst_rtp_base_depayload_dropped(cast(GstRTPBaseDepayload*)this._cPtr);
  }

  /**
      If GstRTPBaseDepayload.process or
      GstRTPBaseDepayload.process_rtp_packet drop an output buffer this
      function tells the base class to flush header extension cache as
      well.
      
      This will not drop an input RTP header marked as delayed from
      [gstrtp.rtpbase_depayload.RTPBaseDepayload.delayed].
      
      If keep_current is true the current input RTP header will be kept
      and enqueued after flushing the previous input RTP headers.
      
      A typical use-case for keep_current is when the depayloader
      implementation invalidates the current output buffer and starts a
      new one with the current RTP input buffer.
      
      Must be called with the stream lock held.
  
      Params:
        keepCurrent = if the current RTP buffer shall be kept
  */
  void flush(bool keepCurrent)
  {
    gst_rtp_base_depayload_flush(cast(GstRTPBaseDepayload*)this._cPtr, keepCurrent);
  }

  /**
      Queries whether header extensions will be aggregated per depayloaded buffers.
      Returns: true if aggregate-header-extension is enabled.
  */
  bool isAggregateHdrextEnabled()
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_base_depayload_is_aggregate_hdrext_enabled(cast(GstRTPBaseDepayload*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether #GstRTPSourceMeta will be added to depayloaded buffers.
      Returns: true if source-info is enabled.
  */
  bool isSourceInfoEnabled()
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
  gst.types.FlowReturn push(gst.buffer.Buffer outBuf)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_depayload_push(cast(GstRTPBaseDepayload*)this._cPtr, outBuf ? cast(GstBuffer*)outBuf._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Push out_list to the peer of filter. This function takes ownership of
      out_list.
  
      Params:
        outList = a #GstBufferList
      Returns: a #GstFlowReturn.
  */
  gst.types.FlowReturn pushList(gst.buffer_list.BufferList outList)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_depayload_push_list(cast(GstRTPBaseDepayload*)this._cPtr, outList ? cast(GstBufferList*)outList._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Enable or disable aggregating header extensions.
  
      Params:
        enable = whether to aggregate header extensions per output buffer
  */
  void setAggregateHdrextEnabled(bool enable)
  {
    gst_rtp_base_depayload_set_aggregate_hdrext_enabled(cast(GstRTPBaseDepayload*)this._cPtr, enable);
  }

  /**
      Enable or disable adding #GstRTPSourceMeta to depayloaded buffers.
  
      Params:
        enable = whether to add meta about RTP sources to buffer
  */
  void setSourceInfoEnabled(bool enable)
  {
    gst_rtp_base_depayload_set_source_info_enabled(cast(GstRTPBaseDepayload*)this._cPtr, enable);
  }

  /**
      Connect to `AddExtension` signal.
  
      Add ext as an extension for reading part of an RTP header extension from
      incoming RTP packets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload))
  
          `ext` the #GstRTPHeaderExtension (optional)
  
          `rTPBaseDepayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAddExtension(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstrtp.rtpheader_extension.RTPHeaderExtension)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstrtp.rtpbase_depayload.RTPBaseDepayload)))
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
  
      Clear all RTP header extensions used by this depayloader.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload))
  
          `rTPBaseDepayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClearExtensions(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstrtp.rtpbase_depayload.RTPBaseDepayload)))
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
  
          $(D gstrtp.rtpheader_extension.RTPHeaderExtension callback(uint extId, string extUri, gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload))
  
          `extId` the extension id being requested (optional)
  
          `extUri` the extension URI being requested (optional)
  
          `rTPBaseDepayload` the instance the signal is connected to (optional)
  
          `Returns` the #GstRTPHeaderExtension for ext_id, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestExtension(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gstrtp.rtpheader_extension.RTPHeaderExtension)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstrtp.rtpbase_depayload.RTPBaseDepayload)))
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
