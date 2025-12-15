/// Module for [RTSPTransport] class
module gstrtsp.rtsptransport;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtsprange;
import gstrtsp.types;

/**
    Provides helper functions to deal with RTSP transport strings.
*/
class RTSPTransport
{
  GstRTSPTransport cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtsp.rtsptransport.RTSPTransport");

    cInstance = *cast(GstRTSPTransport*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `trans` field.
      Returns: the transport mode
  */
  @property gstrtsp.types.RTSPTransMode trans()
  {
    return cast(gstrtsp.types.RTSPTransMode)(cast(GstRTSPTransport*)this._cPtr).trans;
  }

  /**
      Set `trans` field.
      Params:
        propval = the transport mode
  */
  @property void trans(gstrtsp.types.RTSPTransMode propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).trans = cast(GstRTSPTransMode)propval;
  }

  /**
      Get `profile` field.
      Returns: the tansport profile
  */
  @property gstrtsp.types.RTSPProfile profile()
  {
    return cast(gstrtsp.types.RTSPProfile)(cast(GstRTSPTransport*)this._cPtr).profile;
  }

  /**
      Set `profile` field.
      Params:
        propval = the tansport profile
  */
  @property void profile(gstrtsp.types.RTSPProfile propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).profile = cast(GstRTSPProfile)propval;
  }

  /**
      Get `lowerTransport` field.
      Returns: the lower transport
  */
  @property gstrtsp.types.RTSPLowerTrans lowerTransport()
  {
    return cast(gstrtsp.types.RTSPLowerTrans)(cast(GstRTSPTransport*)this._cPtr).lowerTransport;
  }

  /**
      Set `lowerTransport` field.
      Params:
        propval = the lower transport
  */
  @property void lowerTransport(gstrtsp.types.RTSPLowerTrans propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).lowerTransport = cast(GstRTSPLowerTrans)propval;
  }

  /**
      Get `destination` field.
      Returns: the destination ip/hostname
  */
  @property string destination()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPTransport*)this._cPtr).destination);
  }

  /**
      Set `destination` field.
      Params:
        propval = the destination ip/hostname
  */
  @property void destination(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPTransport*)this._cPtr).destination);
    dToC(propval, cast(void*)&(cast(GstRTSPTransport*)this._cPtr).destination);
  }

  /**
      Get `source` field.
      Returns: the source ip/hostname
  */
  @property string source()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPTransport*)this._cPtr).source);
  }

  /**
      Set `source` field.
      Params:
        propval = the source ip/hostname
  */
  @property void source(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPTransport*)this._cPtr).source);
    dToC(propval, cast(void*)&(cast(GstRTSPTransport*)this._cPtr).source);
  }

  /**
      Get `layers` field.
      Returns: the number of layers
  */
  @property uint layers()
  {
    return (cast(GstRTSPTransport*)this._cPtr).layers;
  }

  /**
      Set `layers` field.
      Params:
        propval = the number of layers
  */
  @property void layers(uint propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).layers = propval;
  }

  /**
      Get `modePlay` field.
      Returns: if play mode was selected
  */
  @property bool modePlay()
  {
    return cast(bool)(cast(GstRTSPTransport*)this._cPtr).modePlay;
  }

  /**
      Set `modePlay` field.
      Params:
        propval = if play mode was selected
  */
  @property void modePlay(bool propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).modePlay = propval;
  }

  /**
      Get `modeRecord` field.
      Returns: if record mode was selected
  */
  @property bool modeRecord()
  {
    return cast(bool)(cast(GstRTSPTransport*)this._cPtr).modeRecord;
  }

  /**
      Set `modeRecord` field.
      Params:
        propval = if record mode was selected
  */
  @property void modeRecord(bool propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).modeRecord = propval;
  }

  /**
      Get `append` field.
      Returns: is append mode was selected
  */
  @property bool append()
  {
    return cast(bool)(cast(GstRTSPTransport*)this._cPtr).append;
  }

  /**
      Set `append` field.
      Params:
        propval = is append mode was selected
  */
  @property void append(bool propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).append = propval;
  }

  /**
      Get `interleaved` field.
      Returns: the interleave range
  */
  @property gstrtsp.rtsprange.RTSPRange interleaved()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)this._cPtr).interleaved, No.Take);
  }

  /**
      Get `ttl` field.
      Returns: the time to live for multicast UDP
  */
  @property uint ttl()
  {
    return (cast(GstRTSPTransport*)this._cPtr).ttl;
  }

  /**
      Set `ttl` field.
      Params:
        propval = the time to live for multicast UDP
  */
  @property void ttl(uint propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).ttl = propval;
  }

  /**
      Get `port` field.
      Returns: the port pair for multicast sessions
  */
  @property gstrtsp.rtsprange.RTSPRange port()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)this._cPtr).port, No.Take);
  }

  /**
      Get `clientPort` field.
      Returns: the client port pair for receiving data. For TCP
        based transports, applications can use this field to store the
        sender and receiver ports of the client.
  */
  @property gstrtsp.rtsprange.RTSPRange clientPort()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)this._cPtr).clientPort, No.Take);
  }

  /**
      Get `serverPort` field.
      Returns: the server port pair for receiving data. For TCP
        based transports, applications can use this field to store the
        sender and receiver ports of the server.
  */
  @property gstrtsp.rtsprange.RTSPRange serverPort()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)this._cPtr).serverPort, No.Take);
  }

  /**
      Get `ssrc` field.
      Returns: the ssrc that the sender/receiver will use
  */
  @property uint ssrc()
  {
    return (cast(GstRTSPTransport*)this._cPtr).ssrc;
  }

  /**
      Set `ssrc` field.
      Params:
        propval = the ssrc that the sender/receiver will use
  */
  @property void ssrc(uint propval)
  {
    (cast(GstRTSPTransport*)this._cPtr).ssrc = propval;
  }

  /**
      Convert transport into a string that can be used to signal the transport in
      an RTSP SETUP response.
      Returns: a string describing the RTSP transport
        or null when the transport is invalid.
  */
  string asText()
  {
    char* _cretval;
    _cretval = gst_rtsp_transport_as_text(cast(GstRTSPTransport*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the media type of transport. This media type is typically
      used to generate #GstCaps events.
  
      Params:
        mediaType = media type of transport
      Returns: #GST_RTSP_OK.
  */
  gstrtsp.types.RTSPResult getMediaType(out string mediaType)
  {
    GstRTSPResult _cretval;
    char* _mediaType;
    _cretval = gst_rtsp_transport_get_media_type(cast(GstRTSPTransport*)this._cPtr, &_mediaType);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    mediaType = _mediaType.fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #GstElement that can handle the buffers transported over trans.
      
      It is possible that there are several managers available, use option to
      selected one.
      
      manager will contain an element name or null when no manager is
      needed/available for trans.
  
      Params:
        trans = a #GstRTSPTransMode
        manager = location to hold the result
        option = option index.
      Returns: #GST_RTSP_OK.
  */
  static gstrtsp.types.RTSPResult getManager(gstrtsp.types.RTSPTransMode trans, out string manager, uint option)
  {
    GstRTSPResult _cretval;
    char* _manager;
    _cretval = gst_rtsp_transport_get_manager(trans, &_manager, option);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    manager = _manager.fromCString(No.Free);
    return _retval;
  }

  /**
      Get the mime type of the transport mode trans. This mime type is typically
      used to generate #GstCaps events.
  
      Params:
        trans = a #GstRTSPTransMode
        mime = location to hold the result
      Returns: #GST_RTSP_OK.
  
      Deprecated: This functions only deals with the GstRTSPTransMode and only
           returns the mime type for #GST_RTSP_PROFILE_AVP. Use
           [gstrtsp.rtsptransport.RTSPTransport.getMediaType] instead.
  */
  static gstrtsp.types.RTSPResult getMime(gstrtsp.types.RTSPTransMode trans, out string mime)
  {
    GstRTSPResult _cretval;
    char* _mime;
    _cretval = gst_rtsp_transport_get_mime(trans, &_mime);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    mime = _mime.fromCString(No.Free);
    return _retval;
  }

  /**
      Initialize transport so that it can be used.
  
      Params:
        transport = a #GstRTSPTransport
      Returns: #GST_RTSP_OK.
  */
  static gstrtsp.types.RTSPResult init_(out gstrtsp.rtsptransport.RTSPTransport transport)
  {
    GstRTSPResult _cretval;
    GstRTSPTransport _transport;
    _cretval = gst_rtsp_transport_init(&_transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    transport = new gstrtsp.rtsptransport.RTSPTransport(cast(void*)&_transport, No.Take);
    return _retval;
  }

  /**
      Allocate a new initialized #GstRTSPTransport. Use [gstrtsp.rtsptransport.RTSPTransport.free]
      after usage.
  
      Params:
        transport = location to hold the new #GstRTSPTransport
      Returns: a #GstRTSPResult.
  */
  static gstrtsp.types.RTSPResult new_(out gstrtsp.rtsptransport.RTSPTransport transport)
  {
    GstRTSPResult _cretval;
    GstRTSPTransport* _transport;
    _cretval = gst_rtsp_transport_new(&_transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    transport = new gstrtsp.rtsptransport.RTSPTransport(cast(void*)_transport, Yes.Take);
    return _retval;
  }

  /**
      Parse the RTSP transport string str into transport.
  
      Params:
        str = a transport string
        transport = a #GstRTSPTransport
      Returns: a #GstRTSPResult.
  */
  static gstrtsp.types.RTSPResult parse(string str, out gstrtsp.rtsptransport.RTSPTransport transport)
  {
    GstRTSPResult _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    GstRTSPTransport _transport;
    _cretval = gst_rtsp_transport_parse(_str, &_transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    transport = new gstrtsp.rtsptransport.RTSPTransport(cast(void*)&_transport, No.Take);
    return _retval;
  }
}
