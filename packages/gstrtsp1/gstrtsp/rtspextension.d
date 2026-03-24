/// Module for [RTSPExtension] interface
module gstrtsp.rtspextension;

public import gstrtsp.rtspextension_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
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
interface RTSPExtension
{

  /** */
  static GType _getGType()
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
  
          $(D gstrtsp.types.RTSPResult callback(void* object, void* p0, gstrtsp.rtspextension.RTSPExtension rTSPExtension))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `rTSPExtension` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSend(T)(T callback, Flag!"After" after = No.After);
}

interface RTSPExtensionGidBuilderImpl(T)
{
}
