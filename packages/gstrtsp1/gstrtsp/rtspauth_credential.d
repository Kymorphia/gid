/// Module for [RTSPAuthCredential] class
module gstrtsp.rtspauth_credential;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtspauth_param;
import gstrtsp.types;

/**
    RTSP Authentication credentials
*/
class RTSPAuthCredential : gobject.boxed.BoxedWrap!(gst_rtsp_auth_credential_get_type)
{
  /**
      Create a `rtspauth_credential.RTSPAuthCredential` boxed type.
      Params:
        scheme = a #GstRTSPAuthMethod
  */
  this(gstrtsp.types.RTSPAuthMethod scheme = gstrtsp.types.RTSPAuthMethod.init) nothrow
  {
    super(boxedNew!GstRTSPAuthCredential(_getGType), Yes.Take);
    this.scheme = scheme;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override RTSPAuthCredential self() nothrow
  {
    return this;
  }

  /**
      Get `scheme` field.
      Returns: a #GstRTSPAuthMethod
  */
  @property gstrtsp.types.RTSPAuthMethod scheme() nothrow
  {
    return cast(gstrtsp.types.RTSPAuthMethod)(cast(GstRTSPAuthCredential*)this._cPtr).scheme;
  }

  /**
      Set `scheme` field.
      Params:
        propval = a #GstRTSPAuthMethod
  */
  @property void scheme(gstrtsp.types.RTSPAuthMethod propval) nothrow
  {
    (cast(GstRTSPAuthCredential*)this._cPtr).scheme = cast(GstRTSPAuthMethod)propval;
  }

  /**
      Get `params` field.
      Returns: A NULL-terminated array of #GstRTSPAuthParam
  */
  @property gstrtsp.rtspauth_param.RTSPAuthParam[] params() nothrow
  {
    uint len;
    if ((cast(GstRTSPAuthCredential*)this._cPtr).params)
    {
      for (; (cast(GstRTSPAuthCredential*)this._cPtr).params[len] !is null; len++)
      {
      }
    }

    auto _retval = new gstrtsp.rtspauth_param.RTSPAuthParam[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gstrtsp.rtspauth_param.RTSPAuthParam(cast(void*)(cast(GstRTSPAuthCredential*)this._cPtr).params[i], No.Take);
    return _retval;
  }

  /**
      Get `authorization` field.
      Returns: The authorization for the basic schem
  */
  @property string authorization() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthCredential*)this._cPtr).authorization);
  }
}
