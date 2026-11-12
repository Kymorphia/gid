/// Module for [RTSPExtension] interface
module gstrtsp.rtspextension;

public import gid.basictypes;
public import gstrtsp.rtspextension_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gst.caps;
import gst.structure;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtspmessage;
import gstrtsp.rtspurl;
import gstrtsp.types;
import gstsdp.sdpmedia;
import gstsdp.sdpmessage;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
     exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
interface RTSPExtension : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_extension_get_type != &gidSymbolNotFound ? gst_rtsp_extension_get_type() : cast(GType)0;
  }

  /** */
  gstrtsp.types.RTSPResult afterSend(gstrtsp.rtspmessage.RTSPMessage req, gstrtsp.rtspmessage.RTSPMessage resp);

  /** */
  gstrtsp.types.RTSPResult beforeSend(gstrtsp.rtspmessage.RTSPMessage req);

  /** */
  bool configureStream(gst.caps.Caps caps);

  /** */
  bool detectServer(gstrtsp.rtspmessage.RTSPMessage resp);

  /** */
  gstrtsp.types.RTSPResult getTransports(gstrtsp.types.RTSPLowerTrans protocols, string transport);

  /** */
  gstrtsp.types.RTSPResult parseSdp(gstsdp.sdpmessage.SDPMessage sdp, gst.structure.Structure s);

  /** */
  gstrtsp.types.RTSPResult receiveRequest(gstrtsp.rtspmessage.RTSPMessage req);

  /** */
  gstrtsp.types.RTSPResult send(gstrtsp.rtspmessage.RTSPMessage req, gstrtsp.rtspmessage.RTSPMessage resp);

  /** */
  gstrtsp.types.RTSPResult setupMedia(gstsdp.sdpmedia.SDPMedia media);

  /** */
  gstrtsp.types.RTSPResult streamSelect(gstrtsp.rtspurl.RTSPUrl url);

  /**
      Connect to `Send` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gstrtsp.types.RTSPResult callback(void* object, void* p0, gstrtsp.rtspextension.RTSPExtension rTSPExtension)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `rTSPExtension` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSend(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gstrtsp.types.RTSPResult)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == void*)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstrtsp.rtspextension.RTSPExtension)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gstrtsp.types.RTSPResult _retval;

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
        gidInvokeCallbackExceptionHandler(e, "gstrtsp.rtspextension.RTSPExtension.send");
      }

      setVal!(gstrtsp.types.RTSPResult)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("send", closure, after);
  }
}

/// Fluent builder implementation template for [gstrtsp.rtspextension.RTSPExtension]
interface RTSPExtensionGidBuilderImpl(T)
{
}
