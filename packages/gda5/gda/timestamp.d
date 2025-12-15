/// Module for [Timestamp] class
module gda.timestamp;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/**
    Represents an instant (a time stamp)
*/
class Timestamp : gobject.boxed.Boxed
{

  /**
      Create a `timestamp.Timestamp` boxed type.
      Params:
        year = year representation of the time stamp
        month = month representation of the time stamp, as a number between 1 and 12
        day = day representation of the time stamp, as a number between 1 and 31
        hour = hour representation of the time stamp, as a number between 0 and 23
        minute = minute representation of the time stamp, as a number between 0 and 59
        second = second representation of the time stamp, as a number between 0 and 59
        fraction = fractionnal part of the seconds, in millionth' of second
        timezone = number of seconds added to the GMT timezone
  */
  this(short year = short.init, ushort month = ushort.init, ushort day = ushort.init, ushort hour = ushort.init, ushort minute = ushort.init, ushort second = ushort.init, gulong fraction = gulong.init, glong timezone = glong.init)
  {
    super(gMalloc(GdaTimestamp.sizeof), Yes.Take);
    this.year = year;
    this.month = month;
    this.day = day;
    this.hour = hour;
    this.minute = minute;
    this.second = second;
    this.fraction = fraction;
    this.timezone = timezone;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_timestamp_get_type != &gidSymbolNotFound ? gda_timestamp_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Timestamp self()
  {
    return this;
  }

  /**
      Get `year` field.
      Returns: year representation of the time stamp
  */
  @property short year()
  {
    return (cast(GdaTimestamp*)this._cPtr).year;
  }

  /**
      Set `year` field.
      Params:
        propval = year representation of the time stamp
  */
  @property void year(short propval)
  {
    (cast(GdaTimestamp*)this._cPtr).year = propval;
  }

  /**
      Get `month` field.
      Returns: month representation of the time stamp, as a number between 1 and 12
  */
  @property ushort month()
  {
    return (cast(GdaTimestamp*)this._cPtr).month;
  }

  /**
      Set `month` field.
      Params:
        propval = month representation of the time stamp, as a number between 1 and 12
  */
  @property void month(ushort propval)
  {
    (cast(GdaTimestamp*)this._cPtr).month = propval;
  }

  /**
      Get `day` field.
      Returns: day representation of the time stamp, as a number between 1 and 31
  */
  @property ushort day()
  {
    return (cast(GdaTimestamp*)this._cPtr).day;
  }

  /**
      Set `day` field.
      Params:
        propval = day representation of the time stamp, as a number between 1 and 31
  */
  @property void day(ushort propval)
  {
    (cast(GdaTimestamp*)this._cPtr).day = propval;
  }

  /**
      Get `hour` field.
      Returns: hour representation of the time stamp, as a number between 0 and 23
  */
  @property ushort hour()
  {
    return (cast(GdaTimestamp*)this._cPtr).hour;
  }

  /**
      Set `hour` field.
      Params:
        propval = hour representation of the time stamp, as a number between 0 and 23
  */
  @property void hour(ushort propval)
  {
    (cast(GdaTimestamp*)this._cPtr).hour = propval;
  }

  /**
      Get `minute` field.
      Returns: minute representation of the time stamp, as a number between 0 and 59
  */
  @property ushort minute()
  {
    return (cast(GdaTimestamp*)this._cPtr).minute;
  }

  /**
      Set `minute` field.
      Params:
        propval = minute representation of the time stamp, as a number between 0 and 59
  */
  @property void minute(ushort propval)
  {
    (cast(GdaTimestamp*)this._cPtr).minute = propval;
  }

  /**
      Get `second` field.
      Returns: second representation of the time stamp, as a number between 0 and 59
  */
  @property ushort second()
  {
    return (cast(GdaTimestamp*)this._cPtr).second;
  }

  /**
      Set `second` field.
      Params:
        propval = second representation of the time stamp, as a number between 0 and 59
  */
  @property void second(ushort propval)
  {
    (cast(GdaTimestamp*)this._cPtr).second = propval;
  }

  /**
      Get `fraction` field.
      Returns: fractionnal part of the seconds, in millionth' of second
  */
  @property gulong fraction()
  {
    return (cast(GdaTimestamp*)this._cPtr).fraction;
  }

  /**
      Set `fraction` field.
      Params:
        propval = fractionnal part of the seconds, in millionth' of second
  */
  @property void fraction(gulong propval)
  {
    (cast(GdaTimestamp*)this._cPtr).fraction = propval;
  }

  /**
      Get `timezone` field.
      Returns: number of seconds added to the GMT timezone
  */
  @property glong timezone()
  {
    return (cast(GdaTimestamp*)this._cPtr).timezone;
  }

  /**
      Set `timezone` field.
      Params:
        propval = number of seconds added to the GMT timezone
  */
  @property void timezone(glong propval)
  {
    (cast(GdaTimestamp*)this._cPtr).timezone = propval;
  }

  /**
      This function is similar to [gda.time.Time.changeTimezone] but operates on time stamps.
      
      Note: the resulting will always be a valid time.
  
      Params:
        ntz = a new timezone to use, in seconds added to GMT
  */
  void changeTimezone(glong ntz)
  {
    gda_timestamp_change_timezone(cast(GdaTimestamp*)this._cPtr, ntz);
  }

  /** */
  bool valid()
  {
    bool _retval;
    _retval = cast(bool)gda_timestamp_valid(cast(const(GdaTimestamp)*)this._cPtr);
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
