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
class SDPTime : StructWrap!(GstSDPTime)
{
  /**
      Create a `sdptime.SDPTime` wrap type.
      Params:
        start = start time for the conference. The value is the decimal
              representation of Network Time Protocol (NTP) time values in seconds
        stop = stop time for the conference. The value is the decimal
              representation of Network Time Protocol (NTP) time values in seconds
  */
  this(string start = string.init, string stop = string.init) nothrow
  {
    this.start = start;
    this.stop = stop;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _startRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("start"))
      return;

    _startRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPTime*)this._cPtr).start = cast(char*)_startRef;
  }

  private const(char)* _stopRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("stop"))
      return;

    _stopRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPTime*)this._cPtr).stop = cast(char*)_stopRef;
  }

  /**
      Get `repeat` field.
      Returns: repeat times for a session
  */
  @property void*[] repeat() nothrow
  {
    return gArrayGToD!(void*)((cast(GstSDPTime*)this._cPtr).repeat);
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
    auto _repeat_arr = new char*[](repeat.length + 1);
    auto _repeat = cast(char**)_repeat_arr.ptr;
    foreach (i, s; repeat) _repeat[i] = s.toCString!(No.Malloc);
    _cretval = gst_sdp_time_set(cast(GstSDPTime*)this._cPtr, _start, _stop, _repeat);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
