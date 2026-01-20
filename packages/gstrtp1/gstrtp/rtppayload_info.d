/// Module for [RTPPayloadInfo] class
module gstrtp.rtppayload_info;

import gid.gid;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.types;

/**
    Structure holding default payload type information.
*/
class RTPPayloadInfo
{
  GstRTPPayloadInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtp.rtppayload_info.RTPPayloadInfo");

    _cInstance = *cast(GstRTPPayloadInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `payloadType` field.
      Returns: payload type, -1 means dynamic
  */
  @property ubyte payloadType()
  {
    return (cast(GstRTPPayloadInfo*)this._cPtr).payloadType;
  }

  /**
      Set `payloadType` field.
      Params:
        propval = payload type, -1 means dynamic
  */
  @property void payloadType(ubyte propval)
  {
    (cast(GstRTPPayloadInfo*)this._cPtr).payloadType = propval;
  }

  /**
      Get `media` field.
      Returns: the media type(s), usually "audio", "video", "application", "text",
        "message".
  */
  @property string media()
  {
    return cToD!(string)(cast(void*)(cast(GstRTPPayloadInfo*)this._cPtr).media);
  }

  /**
      Set `media` field.
      Params:
        propval = the media type(s), usually "audio", "video", "application", "text",
          "message".
  */
  @property void media(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTPPayloadInfo*)this._cPtr).media);
    dToC(propval, cast(void*)&(cast(GstRTPPayloadInfo*)this._cPtr).media);
  }

  /**
      Get `encodingName` field.
      Returns: the encoding name of @pt
  */
  @property string encodingName()
  {
    return cToD!(string)(cast(void*)(cast(GstRTPPayloadInfo*)this._cPtr).encodingName);
  }

  /**
      Set `encodingName` field.
      Params:
        propval = the encoding name of @pt
  */
  @property void encodingName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTPPayloadInfo*)this._cPtr).encodingName);
    dToC(propval, cast(void*)&(cast(GstRTPPayloadInfo*)this._cPtr).encodingName);
  }

  /**
      Get `clockRate` field.
      Returns: default clock rate, 0 = unknown/variable
  */
  @property uint clockRate()
  {
    return (cast(GstRTPPayloadInfo*)this._cPtr).clockRate;
  }

  /**
      Set `clockRate` field.
      Params:
        propval = default clock rate, 0 = unknown/variable
  */
  @property void clockRate(uint propval)
  {
    (cast(GstRTPPayloadInfo*)this._cPtr).clockRate = propval;
  }

  /**
      Get `encodingParameters` field.
      Returns: encoding parameters. For audio this is the number of
        channels. NULL = not applicable.
  */
  @property string encodingParameters()
  {
    return cToD!(string)(cast(void*)(cast(GstRTPPayloadInfo*)this._cPtr).encodingParameters);
  }

  /**
      Set `encodingParameters` field.
      Params:
        propval = encoding parameters. For audio this is the number of
          channels. NULL = not applicable.
  */
  @property void encodingParameters(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTPPayloadInfo*)this._cPtr).encodingParameters);
    dToC(propval, cast(void*)&(cast(GstRTPPayloadInfo*)this._cPtr).encodingParameters);
  }

  /**
      Get `bitrate` field.
      Returns: the bitrate of the media. 0 = unknown/variable.
  */
  @property uint bitrate()
  {
    return (cast(GstRTPPayloadInfo*)this._cPtr).bitrate;
  }

  /**
      Set `bitrate` field.
      Params:
        propval = the bitrate of the media. 0 = unknown/variable.
  */
  @property void bitrate(uint propval)
  {
    (cast(GstRTPPayloadInfo*)this._cPtr).bitrate = propval;
  }

  /**
      Get the #GstRTPPayloadInfo for media and encoding_name. This function is
      mostly used to get the default clock-rate and bandwidth for dynamic payload
      types specified with media and encoding name.
      
      The search for encoding_name will be performed in a case insensitive way.
  
      Params:
        media = the media to find
        encodingName = the encoding name to find
      Returns: a #GstRTPPayloadInfo or NULL when no info could be found.
  */
  static gstrtp.rtppayload_info.RTPPayloadInfo forName(string media, string encodingName)
  {
    const(GstRTPPayloadInfo)* _cretval;
    const(char)* _media = media.toCString(No.Alloc);
    const(char)* _encodingName = encodingName.toCString(No.Alloc);
    _cretval = gst_rtp_payload_info_for_name(_media, _encodingName);
    auto _retval = _cretval ? new gstrtp.rtppayload_info.RTPPayloadInfo(cast(GstRTPPayloadInfo*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the #GstRTPPayloadInfo for payload_type. This function is
      mostly used to get the default clock-rate and bandwidth for static payload
      types specified with payload_type.
  
      Params:
        payloadType = the payload_type to find
      Returns: a #GstRTPPayloadInfo or NULL when no info could be found.
  */
  static gstrtp.rtppayload_info.RTPPayloadInfo forPt(ubyte payloadType)
  {
    const(GstRTPPayloadInfo)* _cretval;
    _cretval = gst_rtp_payload_info_for_pt(payloadType);
    auto _retval = _cretval ? new gstrtp.rtppayload_info.RTPPayloadInfo(cast(GstRTPPayloadInfo*)_cretval, No.Take) : null;
    return _retval;
  }
}
