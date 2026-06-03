/// Module for [SDPTime] class
module gstsdp.sdptime;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "t=" field which specify the start and stop times for
    a conference session.
*/
class SDPTime
{
  GstSDPTime _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstSDPTime*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `start` field.
      Returns: start time for the conference. The value is the decimal
            representation of Network Time Protocol (NTP) time values in seconds
  */
  @property string start() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPTime*)this._cPtr).start);
  }

  /**
      Set `start` field.
      Params:
        propval = start time for the conference. The value is the decimal
              representation of Network Time Protocol (NTP) time values in seconds
  */
  @property void start(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPTime*)this._cPtr).start);
    dToC(propval, cast(void*)&(cast(GstSDPTime*)this._cPtr).start);
  }

  /**
      Get `stop` field.
      Returns: stop time for the conference. The value is the decimal
            representation of Network Time Protocol (NTP) time values in seconds
  */
  @property string stop() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPTime*)this._cPtr).stop);
  }

  /**
      Set `stop` field.
      Params:
        propval = stop time for the conference. The value is the decimal
              representation of Network Time Protocol (NTP) time values in seconds
  */
  @property void stop(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPTime*)this._cPtr).stop);
    dToC(propval, cast(void*)&(cast(GstSDPTime*)this._cPtr).stop);
  }

  /**
      Reset the time information in `t`.
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult clear() nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_time_clear(cast(GstSDPTime*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set time information start, stop and repeat in `t`.
  
      Params:
        start = the start time
        stop = the stop time
        repeat = the repeat times
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult set(string start, string stop, string[] repeat) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _start = start.toCString!(No.Malloc, No.Nullable);
    const(char)* _stop = stop.toCString!(No.Malloc, No.Nullable);
    char*[] _tmprepeat;
    foreach (s; repeat)
      _tmprepeat ~= s.toCString;
    _tmprepeat ~= null;
    const(char*)* _repeat = _tmprepeat.ptr;

    _cretval = gst_sdp_time_set(cast(GstSDPTime*)this._cPtr, _start, _stop, _repeat);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
