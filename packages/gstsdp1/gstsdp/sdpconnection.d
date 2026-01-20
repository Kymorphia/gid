/// Module for [SDPConnection] class
module gstsdp.sdpconnection;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "c=" field which contains connection data.
*/
class SDPConnection
{
  GstSDPConnection _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.sdpconnection.SDPConnection");

    _cInstance = *cast(GstSDPConnection*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `nettype` field.
      Returns: the type of network. "IN" is defined to have the meaning
           "Internet".
  */
  @property string nettype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPConnection*)this._cPtr).nettype);
  }

  /**
      Set `nettype` field.
      Params:
        propval = the type of network. "IN" is defined to have the meaning
             "Internet".
  */
  @property void nettype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPConnection*)this._cPtr).nettype);
    dToC(propval, cast(void*)&(cast(GstSDPConnection*)this._cPtr).nettype);
  }

  /**
      Get `addrtype` field.
      Returns: the type of @address.
  */
  @property string addrtype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPConnection*)this._cPtr).addrtype);
  }

  /**
      Set `addrtype` field.
      Params:
        propval = the type of @address.
  */
  @property void addrtype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPConnection*)this._cPtr).addrtype);
    dToC(propval, cast(void*)&(cast(GstSDPConnection*)this._cPtr).addrtype);
  }

  /**
      Get `address` field.
      Returns: the address
  */
  @property string address()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPConnection*)this._cPtr).address);
  }

  /**
      Set `address` field.
      Params:
        propval = the address
  */
  @property void address(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPConnection*)this._cPtr).address);
    dToC(propval, cast(void*)&(cast(GstSDPConnection*)this._cPtr).address);
  }

  /**
      Get `ttl` field.
      Returns: the time to live of the address
  */
  @property uint ttl()
  {
    return (cast(GstSDPConnection*)this._cPtr).ttl;
  }

  /**
      Set `ttl` field.
      Params:
        propval = the time to live of the address
  */
  @property void ttl(uint propval)
  {
    (cast(GstSDPConnection*)this._cPtr).ttl = propval;
  }

  /**
      Get `addrNumber` field.
      Returns: the number of layers
  */
  @property uint addrNumber()
  {
    return (cast(GstSDPConnection*)this._cPtr).addrNumber;
  }

  /**
      Set `addrNumber` field.
      Params:
        propval = the number of layers
  */
  @property void addrNumber(uint propval)
  {
    (cast(GstSDPConnection*)this._cPtr).addrNumber = propval;
  }

  /**
      Clear the connection.
      Returns: GST_SDP_OK.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_connection_clear(cast(GstSDPConnection*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the connection with the given parameters.
  
      Params:
        nettype = the type of network. "IN" is defined to have the meaning
          "Internet".
        addrtype = the type of address.
        address = the address
        ttl = the time to live of the address
        addrNumber = the number of layers
      Returns: GST_SDP_OK.
  */
  gstsdp.types.SDPResult set(string nettype, string addrtype, string address, uint ttl, uint addrNumber)
  {
    GstSDPResult _cretval;
    const(char)* _nettype = nettype.toCString(No.Alloc);
    const(char)* _addrtype = addrtype.toCString(No.Alloc);
    const(char)* _address = address.toCString(No.Alloc);
    _cretval = gst_sdp_connection_set(cast(GstSDPConnection*)this._cPtr, _nettype, _addrtype, _address, ttl, addrNumber);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
