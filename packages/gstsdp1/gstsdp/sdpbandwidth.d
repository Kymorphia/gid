/// Module for [SDPBandwidth] class
module gstsdp.sdpbandwidth;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "b=" field which specifies the proposed bandwidth to
    be used by the session or media.
*/
class SDPBandwidth
{
  GstSDPBandwidth _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.sdpbandwidth.SDPBandwidth");

    _cInstance = *cast(GstSDPBandwidth*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `bwtype` field.
      Returns: the bandwidth modifier type
  */
  @property string bwtype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPBandwidth*)this._cPtr).bwtype);
  }

  /**
      Set `bwtype` field.
      Params:
        propval = the bandwidth modifier type
  */
  @property void bwtype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPBandwidth*)this._cPtr).bwtype);
    dToC(propval, cast(void*)&(cast(GstSDPBandwidth*)this._cPtr).bwtype);
  }

  /**
      Get `bandwidth` field.
      Returns: the bandwidth in kilobits per second
  */
  @property uint bandwidth()
  {
    return (cast(GstSDPBandwidth*)this._cPtr).bandwidth;
  }

  /**
      Set `bandwidth` field.
      Params:
        propval = the bandwidth in kilobits per second
  */
  @property void bandwidth(uint propval)
  {
    (cast(GstSDPBandwidth*)this._cPtr).bandwidth = propval;
  }

  /**
      Reset the bandwidth information in bw.
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_bandwidth_clear(cast(GstSDPBandwidth*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set bandwidth information in bw.
  
      Params:
        bwtype = the bandwidth modifier type
        bandwidth = the bandwidth in kilobits per second
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult set(string bwtype, uint bandwidth)
  {
    GstSDPResult _cretval;
    const(char)* _bwtype = bwtype.toCString(No.Alloc);
    _cretval = gst_sdp_bandwidth_set(cast(GstSDPBandwidth*)this._cPtr, _bwtype, bandwidth);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
