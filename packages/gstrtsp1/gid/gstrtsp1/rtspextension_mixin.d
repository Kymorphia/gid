/// Module for [RTSPExtension] interface mixin
module gid.gstrtsp1.rtspextension_mixin;

public import gid.core.basictypes;
public import gid.gstrtsp1.rtspextension_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gst1.caps;
public import gid.gst1.structure;
public import gid.gstrtsp1.c.functions;
public import gid.gstrtsp1.c.types;
public import gid.gstrtsp1.rtspmessage;
public import gid.gstrtsp1.rtspurl;
public import gid.gstrtsp1.types;
public import gid.gstsdp1.sdpmedia;
public import gid.gstsdp1.sdpmessage;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
     exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
template RTSPExtensionT()
{

  /** */
  override gid.gstrtsp1.types.RTSPResult afterSend(gid.gstrtsp1.rtspmessage.RTSPMessage req, gid.gstrtsp1.rtspmessage.RTSPMessage resp) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_after_send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult beforeSend(gid.gstrtsp1.rtspmessage.RTSPMessage req) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_before_send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override bool configureStream(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_extension_configure_stream(cast(GstRTSPExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override bool detectServer(gid.gstrtsp1.rtspmessage.RTSPMessage resp) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_extension_detect_server(cast(GstRTSPExtension*)this._cPtr, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult getTransports(gid.gstrtsp1.types.RTSPLowerTrans protocols, string transport) nothrow
  {
    GstRTSPResult _cretval;
    char* _transport = transport.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_extension_get_transports(cast(GstRTSPExtension*)this._cPtr, protocols, _transport);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult parseSdp(gid.gstsdp1.sdpmessage.SDPMessage sdp, gid.gst1.structure.Structure s) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_parse_sdp(cast(GstRTSPExtension*)this._cPtr, sdp ? cast(GstSDPMessage*)sdp._cPtr(No.Dup) : null, s ? cast(GstStructure*)s._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult receiveRequest(gid.gstrtsp1.rtspmessage.RTSPMessage req) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_receive_request(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult send(gid.gstrtsp1.rtspmessage.RTSPMessage req, gid.gstrtsp1.rtspmessage.RTSPMessage resp) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult setupMedia(gid.gstsdp1.sdpmedia.SDPMedia media) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_setup_media(cast(GstRTSPExtension*)this._cPtr, media ? cast(GstSDPMedia*)media._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gid.gstrtsp1.types.RTSPResult streamSelect(gid.gstrtsp1.rtspurl.RTSPUrl url) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_stream_select(cast(GstRTSPExtension*)this._cPtr, url ? cast(GstRTSPUrl*)url._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Connect to `Send` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gstrtsp1.types.RTSPResult callback(void* object, void* p0, gid.gstrtsp1.rtspextension.RTSPExtension rTSPExtension)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `rTSPExtension` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSend(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gstrtsp1.types.RTSPResult)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == void*)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gstrtsp1.rtspextension.RTSPExtension)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gstrtsp1.types.RTSPResult _retval;

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
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.send");
      }

      setVal!(gid.gstrtsp1.types.RTSPResult)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("send", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gstrtsp1.rtspextension.RTSPExtension]
template RTSPExtensionGidBuilderT()
{
}
