/// Module for [RTSPAuthCredential] class
module gstrtsp.rtspauth_credential;

import gid.gid;
import gobject.boxed;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    RTSP Authentication credentials
*/
class RTSPAuthCredential : gobject.boxed.Boxed
{

  /**
      Create a `rtspauth_credential.RTSPAuthCredential` boxed type.
      Params:
        scheme = a #GstRTSPAuthMethod
        authorization = The authorization for the basic schem
  */
  this(gstrtsp.types.RTSPAuthMethod scheme = gstrtsp.types.RTSPAuthMethod.init, string authorization = string.init)
  {
    super(gMalloc(GstRTSPAuthCredential.sizeof), Yes.Take);
    this.scheme = scheme;
    this.authorization = authorization;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_auth_credential_get_type != &gidSymbolNotFound ? gst_rtsp_auth_credential_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RTSPAuthCredential self()
  {
    return this;
  }

  /**
      Get `scheme` field.
      Returns: a #GstRTSPAuthMethod
  */
  @property gstrtsp.types.RTSPAuthMethod scheme()
  {
    return cast(gstrtsp.types.RTSPAuthMethod)(cast(GstRTSPAuthCredential*)this._cPtr).scheme;
  }

  /**
      Set `scheme` field.
      Params:
        propval = a #GstRTSPAuthMethod
  */
  @property void scheme(gstrtsp.types.RTSPAuthMethod propval)
  {
    (cast(GstRTSPAuthCredential*)this._cPtr).scheme = cast(GstRTSPAuthMethod)propval;
  }

  /**
      Get `authorization` field.
      Returns: The authorization for the basic schem
  */
  @property string authorization()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthCredential*)this._cPtr).authorization);
  }

  /**
      Set `authorization` field.
      Params:
        propval = The authorization for the basic schem
  */
  @property void authorization(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPAuthCredential*)this._cPtr).authorization);
    dToC(propval, cast(void*)&(cast(GstRTSPAuthCredential*)this._cPtr).authorization);
  }
}
