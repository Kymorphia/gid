/// Module for [RTSPAuthParam] class
module gstrtsp.rtspauth_param;

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
      Params:
        name = The name of the parameter
        value = The value of the parameter
  */
  this(string name = string.init, string value = string.init)
  {
    super(gMalloc(GstRTSPAuthParam.sizeof), Yes.Take);
    this.name = name;
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_auth_param_get_type != &gidSymbolNotFound ? gst_rtsp_auth_param_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RTSPAuthParam self()
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: The name of the parameter
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthParam*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the parameter
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPAuthParam*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GstRTSPAuthParam*)this._cPtr).name);
  }

  /**
      Get `value` field.
      Returns: The value of the parameter
  */
  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthParam*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = The value of the parameter
  */
  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPAuthParam*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(GstRTSPAuthParam*)this._cPtr).value);
  }

  /** */
  gstrtsp.rtspauth_param.RTSPAuthParam copy()
  {
    GstRTSPAuthParam* _cretval;
    _cretval = gst_rtsp_auth_param_copy(cast(GstRTSPAuthParam*)this._cPtr);
    auto _retval = _cretval ? new gstrtsp.rtspauth_param.RTSPAuthParam(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
