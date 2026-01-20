/// Module for [SDPOrigin] class
module gstsdp.sdporigin;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "o=" field which gives the originator of the session
    (their username and the address of the user's host) plus a session id and
    session version number.
*/
class SDPOrigin
{
  GstSDPOrigin _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.sdporigin.SDPOrigin");

    _cInstance = *cast(GstSDPOrigin*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `username` field.
      Returns: the user's login on the originating host, or it is "-"
           if the originating host does not support the concept of user ids.
  */
  @property string username()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).username);
  }

  /**
      Set `username` field.
      Params:
        propval = the user's login on the originating host, or it is "-"
             if the originating host does not support the concept of user ids.
  */
  @property void username(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).username);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)this._cPtr).username);
  }

  /**
      Get `sessId` field.
      Returns: is a numeric string such that the tuple of @username, @sess_id,
           @nettype, @addrtype and @addr form a globally unique identifier for the
           session.
  */
  @property string sessId()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).sessId);
  }

  /**
      Set `sessId` field.
      Params:
        propval = is a numeric string such that the tuple of @username, @sess_id,
             @nettype, @addrtype and @addr form a globally unique identifier for the
             session.
  */
  @property void sessId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).sessId);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)this._cPtr).sessId);
  }

  /**
      Get `sessVersion` field.
      Returns: a version number for this announcement
  */
  @property string sessVersion()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).sessVersion);
  }

  /**
      Set `sessVersion` field.
      Params:
        propval = a version number for this announcement
  */
  @property void sessVersion(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).sessVersion);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)this._cPtr).sessVersion);
  }

  /**
      Get `nettype` field.
      Returns: the type of network. "IN" is defined to have the meaning
           "Internet".
  */
  @property string nettype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).nettype);
  }

  /**
      Set `nettype` field.
      Params:
        propval = the type of network. "IN" is defined to have the meaning
             "Internet".
  */
  @property void nettype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).nettype);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)this._cPtr).nettype);
  }

  /**
      Get `addrtype` field.
      Returns: the type of @addr.
  */
  @property string addrtype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).addrtype);
  }

  /**
      Set `addrtype` field.
      Params:
        propval = the type of @addr.
  */
  @property void addrtype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).addrtype);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)this._cPtr).addrtype);
  }

  /**
      Get `addr` field.
      Returns: the globally unique address of the machine from which the session was
            created.
  */
  @property string addr()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).addr);
  }

  /**
      Set `addr` field.
      Params:
        propval = the globally unique address of the machine from which the session was
              created.
  */
  @property void addr(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).addr);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)this._cPtr).addr);
  }
}
