/// Module for [RTSPAuthCredential] class
module gid.gstrtsp1.rtspauth_credential;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtspauth_param;
import gid.gstrtsp1.types;

/**
    RTSP Authentication credentials
*/
class RTSPAuthCredential : gid.gobject2.boxed.BoxedWrap!(gst_rtsp_auth_credential_get_type)
{
  /**
      Create a `rtspauth_credential.RTSPAuthCredential` boxed type.
      Params:
        scheme = a #GstRTSPAuthMethod
  */
  this(gid.gstrtsp1.types.RTSPAuthMethod scheme = gid.gstrtsp1.types.RTSPAuthMethod.init) nothrow
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
  @property gid.gstrtsp1.types.RTSPAuthMethod scheme() nothrow
  {
    return cast(gid.gstrtsp1.types.RTSPAuthMethod)(cast(GstRTSPAuthCredential*)this._cPtr).scheme;
  }

  /**
      Set `scheme` field.
      Params:
        propval = a #GstRTSPAuthMethod
  */
  @property void scheme(gid.gstrtsp1.types.RTSPAuthMethod propval) nothrow
  {
    (cast(GstRTSPAuthCredential*)this._cPtr).scheme = cast(GstRTSPAuthMethod)propval;
  }

  /**
      Get `params` field.
      Returns: A NULL-terminated array of #GstRTSPAuthParam
  */
  @property gid.gstrtsp1.rtspauth_param.RTSPAuthParam[] params() nothrow
  {
    uint len;
    if ((cast(GstRTSPAuthCredential*)this._cPtr).params)
    {
      for (; (cast(GstRTSPAuthCredential*)this._cPtr).params[len] !is null; len++)
      {
      }
    }

    auto _retval = new gid.gstrtsp1.rtspauth_param.RTSPAuthParam[](len);
    foreach (i; 0 .. len)
      _retval[i] = new gid.gstrtsp1.rtspauth_param.RTSPAuthParam(cast(void*)(cast(GstRTSPAuthCredential*)this._cPtr).params[i], No.Take);
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
