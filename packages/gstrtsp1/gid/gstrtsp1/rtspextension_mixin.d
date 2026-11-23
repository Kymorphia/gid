/// Module for [RTSPExtension] interface mixin
module gid.gstrtsp1.rtspextension_mixin;

public import gid.core.basictypes;
public import gid.gstrtsp1.rtspextension_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
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
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncAfterSend(gid.gstrtsp1.rtspmessage.RTSPMessage req, gid.gstrtsp1.rtspmessage.RTSPMessage resp)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.afterSend)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.afterSend(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncBeforeSend(gid.gstrtsp1.rtspmessage.RTSPMessage req)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.beforeSend)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.beforeSend(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncConfigureStream(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.configureStream)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.configureStream(cast(GstRTSPExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDetectServer(gid.gstrtsp1.rtspmessage.RTSPMessage resp)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.detectServer)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.detectServer(cast(GstRTSPExtension*)this._cPtr, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncParseSdp(gid.gstsdp1.sdpmessage.SDPMessage sdp, gid.gst1.structure.Structure s)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.parseSdp)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.parseSdp(cast(GstRTSPExtension*)this._cPtr, sdp ? cast(GstSDPMessage*)sdp._cPtr(No.Dup) : null, s ? cast(GstStructure*)s._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncReceiveRequest(gid.gstrtsp1.rtspmessage.RTSPMessage req)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.receiveRequest)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.receiveRequest(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncSend(gid.gstrtsp1.rtspmessage.RTSPMessage req, gid.gstrtsp1.rtspmessage.RTSPMessage resp)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.send)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.send(cast(GstRTSPExtension*)this._cPtr, req ? cast(GstRTSPMessage*)req._cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncSetupMedia(gid.gstsdp1.sdpmedia.SDPMedia media)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.setupMedia)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.setupMedia(cast(GstRTSPExtension*)this._cPtr, media ? cast(GstSDPMedia*)media._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gstrtsp1.types.RTSPResult vfuncStreamSelect(gid.gstrtsp1.rtspurl.RTSPUrl url)
  {
    auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
    if (!_klass || !_klass.streamSelect)
      return typeof(return).init;

    GstRTSPResult _cretval;
    _cretval = _klass.streamSelect(cast(GstRTSPExtension*)this._cPtr, url ? cast(GstRTSPUrl*)url._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

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
      gidAttachThread();
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

  /// True if the D class T overrides any vfunc method of gid.gstrtsp1.rtspextension.RTSPExtension (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gstrtsp1_rtspextension_RTSPExtension(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAfterSend", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncBeforeSend", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConfigureStream", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDetectServer", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncParseSdp", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReceiveRequest", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSend", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetupMedia", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStreamSelect", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gstrtsp1.rtspextension.RTSPExtension vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gstrtsp1_rtspextension_RTSPExtension(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAfterSend", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "after_send");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncBeforeSend", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "before_send");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConfigureStream", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "configure_stream");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDetectServer", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "detect_server");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncParseSdp", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "parse_sdp");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReceiveRequest", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "receive_request");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSend", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "send");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetupMedia", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "setup_media");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStreamSelect", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(iface, "stream_select");
  }

  private static void _installIfaceVfunc_gid_gstrtsp1_rtspextension_RTSPExtension(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstRTSPExtensionInterface*)iface;

    switch (vfunc)
    {
      case "after_send":
      {
        static extern(C) GstRTSPResult _vfuncAfterSendTramp(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.afterSend)
              return (cast(typeof(&_vfuncAfterSendTramp))_klass.afterSend)(ext, req, resp);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _req = req ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)req, Yes.Take)._cBorrow : null;
          auto _resp = resp ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)resp, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncAfterSend(_req, _resp);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncAfterSend");
          }
          auto _retval = cast(GstRTSPResult)_dretval;
          if (_req)
            _req._cUnborrow;
          if (_resp)
            _resp._cUnborrow;

          return _retval;
        }

        _klass.afterSend = cast(typeof(_klass.afterSend))&_vfuncAfterSendTramp;
        break;
      }
      case "before_send":
      {
        static extern(C) GstRTSPResult _vfuncBeforeSendTramp(GstRTSPExtension* ext, GstRTSPMessage* req) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.beforeSend)
              return (cast(typeof(&_vfuncBeforeSendTramp))_klass.beforeSend)(ext, req);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _req = req ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)req, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncBeforeSend(_req);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncBeforeSend");
          }
          auto _retval = cast(GstRTSPResult)_dretval;
          if (_req)
            _req._cUnborrow;

          return _retval;
        }

        _klass.beforeSend = cast(typeof(_klass.beforeSend))&_vfuncBeforeSendTramp;
        break;
      }
      case "configure_stream":
      {
        static extern(C) gboolean _vfuncConfigureStreamTramp(GstRTSPExtension* ext, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.configureStream)
              return (cast(typeof(&_vfuncConfigureStreamTramp))_klass.configureStream)(ext, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncConfigureStream(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncConfigureStream");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.configureStream = cast(typeof(_klass.configureStream))&_vfuncConfigureStreamTramp;
        break;
      }
      case "detect_server":
      {
        static extern(C) gboolean _vfuncDetectServerTramp(GstRTSPExtension* ext, GstRTSPMessage* resp) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.detectServer)
              return (cast(typeof(&_vfuncDetectServerTramp))_klass.detectServer)(ext, resp);
            return typeof(return).init;
          }

          bool _dretval;
          auto _resp = resp ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)resp, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDetectServer(_resp);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncDetectServer");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_resp)
            _resp._cUnborrow;

          return _retval;
        }

        _klass.detectServer = cast(typeof(_klass.detectServer))&_vfuncDetectServerTramp;
        break;
      }
      case "parse_sdp":
      {
        static extern(C) GstRTSPResult _vfuncParseSdpTramp(GstRTSPExtension* ext, GstSDPMessage* sdp, GstStructure* s) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.parseSdp)
              return (cast(typeof(&_vfuncParseSdpTramp))_klass.parseSdp)(ext, sdp, s);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _sdp = sdp ? new gid.gstsdp1.sdpmessage.SDPMessage(cast(void*)sdp, Yes.Take)._cBorrow : null;
          auto _s = s ? new gid.gst1.structure.Structure(cast(void*)s, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncParseSdp(_sdp, _s);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncParseSdp");
          }
          auto _retval = cast(GstRTSPResult)_dretval;
          if (_sdp)
            _sdp._cUnborrow;
          if (_s)
            _s._cUnborrow;

          return _retval;
        }

        _klass.parseSdp = cast(typeof(_klass.parseSdp))&_vfuncParseSdpTramp;
        break;
      }
      case "receive_request":
      {
        static extern(C) GstRTSPResult _vfuncReceiveRequestTramp(GstRTSPExtension* ext, GstRTSPMessage* req) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.receiveRequest)
              return (cast(typeof(&_vfuncReceiveRequestTramp))_klass.receiveRequest)(ext, req);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _req = req ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)req, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncReceiveRequest(_req);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncReceiveRequest");
          }
          auto _retval = cast(GstRTSPResult)_dretval;
          if (_req)
            _req._cUnborrow;

          return _retval;
        }

        _klass.receiveRequest = cast(typeof(_klass.receiveRequest))&_vfuncReceiveRequestTramp;
        break;
      }
      case "send":
      {
        static extern(C) GstRTSPResult _vfuncSendTramp(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.send)
              return (cast(typeof(&_vfuncSendTramp))_klass.send)(ext, req, resp);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _req = req ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)req, Yes.Take)._cBorrow : null;
          auto _resp = resp ? new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)resp, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSend(_req, _resp);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncSend");
          }
          auto _retval = cast(GstRTSPResult)_dretval;
          if (_req)
            _req._cUnborrow;
          if (_resp)
            _resp._cUnborrow;

          return _retval;
        }

        _klass.send = cast(typeof(_klass.send))&_vfuncSendTramp;
        break;
      }
      case "setup_media":
      {
        static extern(C) GstRTSPResult _vfuncSetupMediaTramp(GstRTSPExtension* ext, GstSDPMedia* media) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.setupMedia)
              return (cast(typeof(&_vfuncSetupMediaTramp))_klass.setupMedia)(ext, media);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _media = media ? new gid.gstsdp1.sdpmedia.SDPMedia(cast(void*)media, null) : null;

          try
          {
            _dretval = _obj.vfuncSetupMedia(_media);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncSetupMedia");
          }
          auto _retval = cast(GstRTSPResult)_dretval;

          return _retval;
        }

        _klass.setupMedia = cast(typeof(_klass.setupMedia))&_vfuncSetupMediaTramp;
        break;
      }
      case "stream_select":
      {
        static extern(C) GstRTSPResult _vfuncStreamSelectTramp(GstRTSPExtension* ext, GstRTSPUrl* url) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTSPExtensionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext), gid.gstrtsp1.rtspextension.RTSPExtension._getGType);
            if (_klass && _klass.streamSelect)
              return (cast(typeof(&_vfuncStreamSelectTramp))_klass.streamSelect)(ext, url);
            return typeof(return).init;
          }

          gid.gstrtsp1.types.RTSPResult _dretval;
          auto _url = url ? new gid.gstrtsp1.rtspurl.RTSPUrl(cast(void*)url, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncStreamSelect(_url);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.rtspextension.RTSPExtension.vfuncStreamSelect");
          }
          auto _retval = cast(GstRTSPResult)_dretval;
          if (_url)
            _url._cUnborrow;

          return _retval;
        }

        _klass.streamSelect = cast(typeof(_klass.streamSelect))&_vfuncStreamSelectTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstrtsp1.rtspextension.RTSPExtension]
template RTSPExtensionGidBuilderT()
{
}
