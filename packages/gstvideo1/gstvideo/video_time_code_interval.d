/// Module for [VideoTimeCodeInterval] struct
module gstvideo.video_time_code_interval;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    A representation of a difference between two #GstVideoTimeCode instances.
    Will not necessarily correspond to a real timecode (e.g. 00:00:10;00)
*/
struct VideoTimeCodeInterval
{
  /**
      the hours field of #GstVideoTimeCodeInterval
  */
  uint hours;

  /**
      the minutes field of #GstVideoTimeCodeInterval
  */
  uint minutes;

  /**
      the seconds field of #GstVideoTimeCodeInterval
  */
  uint seconds;

  /**
      the frames field of #GstVideoTimeCodeInterval
  */
  uint frames;

  /**
      Initializes tc with empty/zero/NULL values.
  */
  void clear()
  {
    gst_video_time_code_interval_clear(cast(GstVideoTimeCodeInterval*)&this);
  }

  /** */
  gstvideo.video_time_code_interval.VideoTimeCodeInterval copy()
  {
    GstVideoTimeCodeInterval* _cretval;
    _cretval = gst_video_time_code_interval_copy(cast(const(GstVideoTimeCodeInterval)*)&this);
    gstvideo.video_time_code_interval.VideoTimeCodeInterval _retval;
    if (_cretval)
      _retval = *cast(gstvideo.video_time_code_interval.VideoTimeCodeInterval*)_cretval;
    return _retval;
  }

  /**
      Initializes tc with the given values.
  
      Params:
        hours = the hours field of #GstVideoTimeCodeInterval
        minutes = the minutes field of #GstVideoTimeCodeInterval
        seconds = the seconds field of #GstVideoTimeCodeInterval
        frames = the frames field of #GstVideoTimeCodeInterval
  */
  void init_(uint hours, uint minutes, uint seconds, uint frames)
  {
    gst_video_time_code_interval_init(cast(GstVideoTimeCodeInterval*)&this, hours, minutes, seconds, frames);
  }
}
