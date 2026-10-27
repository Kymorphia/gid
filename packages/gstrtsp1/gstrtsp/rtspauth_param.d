/// Module for [RTSPAuthParam] class
module gstrtsp.rtspauth_param;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    RTSP Authentication parameter
*/
class RTSPAuthParam : gobject.boxed.Boxed
{

  /**
      Create a `rtspauth_param.RTSPAuthParam` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GstRTSPAuthParam(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_auth_param_get_type != &gidSymbolNotFound ? gst_rtsp_auth_param_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RTSPAuthParam self() nothrow
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: The name of the parameter
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthParam*)this._cPtr).name);
  }

  /**
      Get `value` field.
      Returns: The value of the parameter
  */
  @property string value() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthParam*)this._cPtr).value);
  }

  /** */
  gstrtsp.rtspauth_param.RTSPAuthParam copy() nothrow
  {
    GstRTSPAuthParam* _cretval;
    _cretval = gst_rtsp_auth_param_copy(cast(GstRTSPAuthParam*)this._cPtr);
    auto _retval = _cretval ? new gstrtsp.rtspauth_param.RTSPAuthParam(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
