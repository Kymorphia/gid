/// Module for [Timestamp] struct
module gda.timestamp;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    Represents an instant (a time stamp)
*/
struct Timestamp
{
  /**
      year representation of the time stamp
  */
  short year;

  /**
      month representation of the time stamp, as a number between 1 and 12
  */
  ushort month;

  /**
      day representation of the time stamp, as a number between 1 and 31
  */
  ushort day;

  /**
      hour representation of the time stamp, as a number between 0 and 23
  */
  ushort hour;

  /**
      minute representation of the time stamp, as a number between 0 and 59
  */
  ushort minute;

  /**
      second representation of the time stamp, as a number between 0 and 59
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

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_timestamp_get_type != &gidSymbolNotFound ? gda_timestamp_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType()
  {
    return _getGType();
  }

  void* boxCopy()
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType,
        cast(void*)&this);
  }

  /**
      This function is similar to [gda.time.Time.changeTimezone] but operates on time stamps.
      
      Note: the resulting will always be a valid time.
  
      Params:
        ntz = a new timezone to use, in seconds added to GMT
  */
  void changeTimezone(glong ntz)
  {
    gda_timestamp_change_timezone(cast(GdaTimestamp*)&this, ntz);
  }

  /** */
  bool valid()
  {
    bool _retval;
    _retval = cast(bool)gda_timestamp_valid(cast(const(GdaTimestamp)*)&this);
    return _retval;
  }

  /** */
  static void* copy(void* boxed = null)
  {
    auto _retval = gda_timestamp_copy(boxed);
    return _retval;
  }

  /** */
  static void free(void* boxed = null)
  {
    gda_timestamp_free(boxed);
  }
}
