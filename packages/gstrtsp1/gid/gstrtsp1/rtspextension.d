/// Module for [RTSPExtension] interface
module gid.gstrtsp1.rtspextension;

public import gid.core.basictypes;
public import gid.gstrtsp1.rtspextension_iface_proxy;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.caps;
import gid.gst1.structure;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtspmessage;
import gid.gstrtsp1.rtspurl;
import gid.gstrtsp1.types;
import gid.gstsdp1.sdpmedia;
import gid.gstsdp1.sdpmessage;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
     exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
@gidGir("RTSPExtension", "RTSPExtensionInterface")
interface RTSPExtension : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_extension_get_type != &gidSymbolNotFound ? gst_rtsp_extension_get_type() : cast(GType)0;
  }










  /** */
  gid.gstrtsp1.types.RTSPResult afterSend(gid.gstrtsp1.rtspmessage.RTSPMessage req, gid.gstrtsp1.rtspmessage.RTSPMessage resp);

  /** */
  gid.gstrtsp1.types.RTSPResult beforeSend(gid.gstrtsp1.rtspmessage.RTSPMessage req);

  /** */
  bool configureStream(gid.gst1.caps.Caps caps);

  /** */
  bool detectServer(gid.gstrtsp1.rtspmessage.RTSPMessage resp);

  /** */
  gid.gstrtsp1.types.RTSPResult getTransports(gid.gstrtsp1.types.RTSPLowerTrans protocols, string transport);

  /** */
  gid.gstrtsp1.types.RTSPResult parseSdp(gid.gstsdp1.sdpmessage.SDPMessage sdp, gid.gst1.structure.Structure s);

  /** */
  gid.gstrtsp1.types.RTSPResult receiveRequest(gid.gstrtsp1.rtspmessage.RTSPMessage req);

  /** */
  gid.gstrtsp1.types.RTSPResult send(gid.gstrtsp1.rtspmessage.RTSPMessage req, gid.gstrtsp1.rtspmessage.RTSPMessage resp);

  /** */
  gid.gstrtsp1.types.RTSPResult setupMedia(gid.gstsdp1.sdpmedia.SDPMedia media);

  /** */
  gid.gstrtsp1.types.RTSPResult streamSelect(gid.gstrtsp1.rtspurl.RTSPUrl url);

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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("send", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gstrtsp1.rtspextension.RTSPExtension]
interface RTSPExtensionGidBuilderImpl(T)
{
}
