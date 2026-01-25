/// Module for [RTSPRange] struct
module gstrtsp.rtsprange;

import gid.gid;
import gst.types;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtsptime_range;
import gstrtsp.types;

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
  static bool convertUnits(gstrtsp.rtsptime_range.RTSPTimeRange range, gstrtsp.types.RTSPRangeUnit unit)
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
  static void free(gstrtsp.rtsptime_range.RTSPTimeRange range)
  {
    gst_rtsp_range_free(range ? cast(GstRTSPTimeRange*)range._cPtr : null);
  }

  /**
      Retrieve the minimum and maximum values from range converted to
      #GstClockTime in min and max.
      
      A value of [gst.types.CLOCK_TIME_NONE] will be used to signal #GST_RTSP_TIME_NOW
      and #GST_RTSP_TIME_END for min and max respectively.
      
      UTC times will be converted to nanoseconds since 1900.
  
      Params:
        range = a #GstRTSPTimeRange
        min = result minimum #GstClockTime
        max = result maximum #GstClockTime
      Returns: true on success.
  */
  static bool getTimes(gstrtsp.rtsptime_range.RTSPTimeRange range, out gst.types.ClockTime min, out gst.types.ClockTime max)
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
  static gstrtsp.types.RTSPResult parse(string rangestr, out gstrtsp.rtsptime_range.RTSPTimeRange range)
  {
    GstRTSPResult _cretval;
    const(char)* _rangestr = rangestr.toCString(No.Alloc);
    GstRTSPTimeRange* _range;
    _cretval = gst_rtsp_range_parse(_rangestr, &_range);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    range = new gstrtsp.rtsptime_range.RTSPTimeRange(cast(void*)_range, Yes.Take);
    return _retval;
  }

  /**
      Convert range into a string representation.
  
      Params:
        range = a #GstRTSPTimeRange
      Returns: The string representation of range. [glib.global.gfree] after usage.
  */
  static string toString_(gstrtsp.rtsptime_range.RTSPTimeRange range)
  {
    char* _cretval;
    _cretval = gst_rtsp_range_to_string(range ? cast(const(GstRTSPTimeRange)*)range._cPtr : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
