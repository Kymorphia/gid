/// Module for [RTSPExtension] interface mixin
module gstrtsp.rtspextension_mixin;

public import gstrtsp.rtspextension_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gst.caps;
public import gst.structure;
public import gstrtsp.c.functions;
public import gstrtsp.c.types;
public import gstrtsp.rtspmessage;
public import gstrtsp.rtspurl;
public import gstrtsp.types;
public import gstsdp.sdpmedia;
public import gstsdp.sdpmessage;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
     exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
template RTSPExtensionT()
{

  /** */
  override gstrtsp.types.RTSPResult afterSend(gstrtsp.rtspmessage.RTSPMessage req, gstrtsp.rtspmessage.RTSPMessage resp)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_after_send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult beforeSend(gstrtsp.rtspmessage.RTSPMessage req)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_before_send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override bool configureStream(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_extension_configure_stream(cast(GstRTSPExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override bool detectServer(gstrtsp.rtspmessage.RTSPMessage resp)
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_extension_detect_server(cast(GstRTSPExtension*)this._cPtr, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult getTransports(gstrtsp.types.RTSPLowerTrans protocols, string transport)
  {
    GstRTSPResult _cretval;
    char* _transport = transport.toCString(No.Alloc);
    _cretval = gst_rtsp_extension_get_transports(cast(GstRTSPExtension*)this._cPtr, protocols, _transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult parseSdp(gstsdp.sdpmessage.SDPMessage sdp, gst.structure.Structure s)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_parse_sdp(cast(GstRTSPExtension*)this._cPtr, sdp ? cast(GstSDPMessage*)sdp._cPtr(No.Dup) : null, s ? cast(GstStructure*)s._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult receiveRequest(gstrtsp.rtspmessage.RTSPMessage req)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_receive_request(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult send(gstrtsp.rtspmessage.RTSPMessage req, gstrtsp.rtspmessage.RTSPMessage resp)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult setupMedia(gstsdp.sdpmedia.SDPMedia media)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_setup_media(cast(GstRTSPExtension*)this._cPtr, media ? cast(GstSDPMedia*)media._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult streamSelect(gstrtsp.rtspurl.RTSPUrl url)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_stream_select(cast(GstRTSPExtension*)this._cPtr, url ? cast(GstRTSPUrl*)url._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Connect to `Send` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gstrtsp.types.RTSPResult callback(void* object, void* p0, gstrtsp.rtspextension.RTSPExtension rTSPExtension))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `rTSPExtension` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSend(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gstrtsp.types.RTSPResult)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == void*)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstrtsp.rtspextension.RTSPExtension)))
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
      setVal!(gstrtsp.types.RTSPResult)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("send", closure, after);
  }
}
