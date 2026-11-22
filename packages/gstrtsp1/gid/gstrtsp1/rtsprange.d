/// Module for [RTSPRange] struct
module gid.gstrtsp1.rtsprange;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.types;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtsptime_range;
import gid.gstrtsp1.types;

/**
    Provides helper functions to deal with time ranges.
*/
struct RTSPRange
{
  /**
      minimum value of the range
  */
  int min;

  /**
      maximum value of the range
  */
  int max;

  /**
      Converts the range in-place between different types of units.
      Ranges containing the special value #GST_RTSP_TIME_NOW can not be
      converted as these are only valid for #GST_RTSP_RANGE_NPT.
  
      Params:
        range = a #GstRTSPTimeRange
        unit = the unit to convert the range into
      Returns: true if the range could be converted
  */
  static bool convertUnits(gid.gstrtsp1.rtsptime_range.RTSPTimeRange range, gid.gstrtsp1.types.RTSPRangeUnit unit) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_range_convert_units(range ? cast(GstRTSPTimeRange*)range._cPtr : null, unit);
    return _retval;
  }

  /**
      Free the memory allocated by range.
  
      Params:
        range = a #GstRTSPTimeRange
  */
  static void free(gid.gstrtsp1.rtsptime_range.RTSPTimeRange range) nothrow
  {
    gst_rtsp_range_free(range ? cast(GstRTSPTimeRange*)range._cPtr : null);
  }

  /**
      Retrieve the minimum and maximum values from range converted to
      #GstClockTime in min and max.
      
      A value of [gid.gst1.types.CLOCK_TIME_NONE] will be used to signal #GST_RTSP_TIME_NOW
      and #GST_RTSP_TIME_END for min and max respectively.
      
      UTC times will be converted to nanoseconds since 1900.
  
      Params:
        range = a #GstRTSPTimeRange
        min = result minimum #GstClockTime
        max = result maximum #GstClockTime
      Returns: true on success.
  */
  static bool getTimes(gid.gstrtsp1.rtsptime_range.RTSPTimeRange range, out gid.gst1.types.ClockTime min, out gid.gst1.types.ClockTime max) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_range_get_times(range ? cast(const(GstRTSPTimeRange)*)range._cPtr : null, cast(GstClockTime*)&min, cast(GstClockTime*)&max);
    return _retval;
  }

  /**
      Parse rangestr to a #GstRTSPTimeRange.
  
      Params:
        rangestr = a range string to parse
        range = location to hold the #GstRTSPTimeRange result
      Returns: #GST_RTSP_OK on success.
  */
  static gid.gstrtsp1.types.RTSPResult parse(string rangestr, out gid.gstrtsp1.rtsptime_range.RTSPTimeRange range) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _rangestr = rangestr.toCString!(No.Malloc, No.Nullable);
    GstRTSPTimeRange* _range;
    _cretval = gst_rtsp_range_parse(_rangestr, &_range);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_range)
      range = new gid.gstrtsp1.rtsptime_range.RTSPTimeRange(cast(void*)_range, Yes.Take);
    return _retval;
  }

  /**
      Convert range into a string representation.
  
      Params:
        range = a #GstRTSPTimeRange
      Returns: The string representation of range. [gid.glib2.global.gfree] after usage.
  */
  static string toString_(gid.gstrtsp1.rtsptime_range.RTSPTimeRange range) nothrow
  {
    char* _cretval;
    _cretval = gst_rtsp_range_to_string(range ? cast(const(GstRTSPTimeRange)*)range._cPtr : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
