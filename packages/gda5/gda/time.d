/// Module for [Time] class
module gda.time;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/**
    Represents a time information.
*/
class Time : gobject.boxed.Boxed
{

  /**
      Create a `time.Time` boxed type.
      Params:
        hour = hour representation of the time, as a number between 0 and 23
        minute = minute representation of the time, as a number between 0 and 59
        second = second representation of the time, as a number between 0 and 59
        fraction = fractionnal part of the seconds, in millionth' of second
        timezone = number of seconds added to the GMT timezone
  */
  this(ushort hour = ushort.init, ushort minute = ushort.init, ushort second = ushort.init, gulong fraction = gulong.init, glong timezone = glong.init)
  {
    super(gMalloc(GdaTime.sizeof), Yes.Take);
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
    return cast(void function())gda_time_get_type != &gidSymbolNotFound ? gda_time_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time self()
  {
    return this;
  }

  /**
      Get `hour` field.
      Returns: hour representation of the time, as a number between 0 and 23
  */
  @property ushort hour()
  {
    return (cast(GdaTime*)this._cPtr).hour;
  }

  /**
      Set `hour` field.
      Params:
        propval = hour representation of the time, as a number between 0 and 23
  */
  @property void hour(ushort propval)
  {
    (cast(GdaTime*)this._cPtr).hour = propval;
  }

  /**
      Get `minute` field.
      Returns: minute representation of the time, as a number between 0 and 59
  */
  @property ushort minute()
  {
    return (cast(GdaTime*)this._cPtr).minute;
  }

  /**
      Set `minute` field.
      Params:
        propval = minute representation of the time, as a number between 0 and 59
  */
  @property void minute(ushort propval)
  {
    (cast(GdaTime*)this._cPtr).minute = propval;
  }

  /**
      Get `second` field.
      Returns: second representation of the time, as a number between 0 and 59
  */
  @property ushort second()
  {
    return (cast(GdaTime*)this._cPtr).second;
  }

  /**
      Set `second` field.
      Params:
        propval = second representation of the time, as a number between 0 and 59
  */
  @property void second(ushort propval)
  {
    (cast(GdaTime*)this._cPtr).second = propval;
  }

  /**
      Get `fraction` field.
      Returns: fractionnal part of the seconds, in millionth' of second
  */
  @property gulong fraction()
  {
    return (cast(GdaTime*)this._cPtr).fraction;
  }

  /**
      Set `fraction` field.
      Params:
        propval = fractionnal part of the seconds, in millionth' of second
  */
  @property void fraction(gulong propval)
  {
    (cast(GdaTime*)this._cPtr).fraction = propval;
  }

  /**
      Get `timezone` field.
      Returns: number of seconds added to the GMT timezone
  */
  @property glong timezone()
  {
    return (cast(GdaTime*)this._cPtr).timezone;
  }

  /**
      Set `timezone` field.
      Params:
        propval = number of seconds added to the GMT timezone
  */
  @property void timezone(glong propval)
  {
    (cast(GdaTime*)this._cPtr).timezone = propval;
  }

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
    gda_time_change_timezone(cast(GdaTime*)this._cPtr, ntz);
  }

  /** */
  bool valid()
  {
    bool _retval;
    _retval = cast(bool)gda_time_valid(cast(const(GdaTime)*)this._cPtr);
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
