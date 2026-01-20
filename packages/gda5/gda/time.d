/// Module for [Time] struct
module gda.time;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    Represents a time information.
*/
struct Time
{
  /**
      hour representation of the time, as a number between 0 and 23
  */
  ushort hour;

  /**
      minute representation of the time, as a number between 0 and 59
  */
  ushort minute;

  /**
      second representation of the time, as a number between 0 and 59
  */
  ushort second;

  /**
      fractionnal part of the seconds, in millionth' of second
  */
  gulong fraction;

  /**
      number of seconds added to the GMT timezone
  */
  glong timezone;

  /**
      Changes time's timezone (for example to convert from GMT to another time zone).
      If time's current timezone is unset (i.e. equal to `GDA_TIMEZONE_INVALID`), then this function simply sets
      time's timezone attribute; Otherwise, it adds or removes hours, minutes or seconds to reflect the time in the new timezone.
      
      Note: the resulting will always be a valid time.
  
      Params:
        ntz = a new timezone to use, in seconds added to GMT
  */
  void changeTimezone(glong ntz)
  {
    gda_time_change_timezone(cast(GdaTime*)&this, ntz);
  }

  /** */
  bool valid()
  {
    bool _retval;
    _retval = cast(bool)gda_time_valid(cast(const(GdaTime)*)&this);
    return _retval;
  }

  /** */
  static void* copy(void* boxed = null)
  {
    auto _retval = gda_time_copy(boxed);
    return _retval;
  }

  /** */
  static void free(void* boxed = null)
  {
    gda_time_free(boxed);
  }
}
