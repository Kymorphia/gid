/// Module for [DateTime] class
module gst.date_time;

import gid.gid;
import glib.date_time;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    Struct to store date, time and timezone information altogether.
    #GstDateTime is refcounted and immutable.
    
    Date information is handled using the [proleptic Gregorian calendar].
    
    Provides basic creation functions and accessor functions to its fields.
    
    [proleptic Gregorian calendar]: https://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar
*/
class DateTime : gobject.boxed.Boxed
{

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
    return cast(void function())gst_date_time_get_type != &gidSymbolNotFound ? gst_date_time_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DateTime self()
  {
    return this;
  }

  /**
      Creates a new #GstDateTime using the date and times in the gregorian calendar
      in the supplied timezone.
      
      year should be from 1 to 9999, month should be from 1 to 12, day from
      1 to 31, hour from 0 to 23, minutes and seconds from 0 to 59.
      
      Note that tzoffset is a float and was chosen so for being able to handle
      some fractional timezones, while it still keeps the readability of
      representing it in hours for most timezones.
      
      If value is -1 then all over value will be ignored. For example
      if month == -1, then #GstDateTime will be created only for year. If
      day == -1, then #GstDateTime will be created for year and month and
      so on.
  
      Params:
        tzoffset = Offset from UTC in hours.
        year = the gregorian year
        month = the gregorian month
        day = the day of the gregorian month
        hour = the hour of the day
        minute = the minute of the hour
        seconds = the second of the minute
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  this(float tzoffset, int year, int month, int day, int hour, int minute, double seconds)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new(tzoffset, year, month, day, hour, minute, seconds);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GstDateTime from a #GDateTime object.
  
      Params:
        dt = the #GDateTime.
      Returns: a newly created #GstDateTime,
        or null if dt is null.
  */
  static gst.date_time.DateTime newFromGDateTime(glib.date_time.DateTime dt = null)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_from_g_date_time(dt ? cast(GDateTime*)dt._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tries to parse common variants of ISO-8601 datetime strings into a
      #GstDateTime. Possible input formats are (for example):
      `2012-06-30T22:46:43Z`, `2012`, `2012-06`, `2012-06-30`, `2012-06-30T22:46:43-0430`,
      `2012-06-30T22:46Z`, `2012-06-30T22:46-0430`, `2012-06-30 22:46`,
      `2012-06-30 22:46:43`, `2012-06-00`, `2012-00-00`, `2012-00-30`, `22:46:43Z`, `22:46Z`,
      `22:46:43-0430`, `22:46-0430`, `22:46:30`, `22:46`
      If no date is provided, it is assumed to be "today" in the timezone
      provided (if any), otherwise UTC.
  
      Params:
        string_ = ISO 8601-formatted datetime string.
      Returns: a newly created #GstDateTime,
        or null on error
  */
  static gst.date_time.DateTime newFromIso8601String(string string_)
  {
    GstDateTime* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gst_date_time_new_from_iso8601_string(_string_);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the time since Jan 1, 1970 specified by
      secs. The #GstDateTime is in the local timezone.
  
      Params:
        secs = seconds from the Unix epoch
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  static gst.date_time.DateTime newFromUnixEpochLocalTime(long secs)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_from_unix_epoch_local_time(secs);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the time since Jan 1, 1970 specified by
      usecs. The #GstDateTime is in the local timezone.
  
      Params:
        usecs = microseconds from the Unix epoch
      Returns: a newly created #GstDateTime, or null
        on error.
  */
  static gst.date_time.DateTime newFromUnixEpochLocalTimeUsecs(long usecs)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_from_unix_epoch_local_time_usecs(usecs);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the time since Jan 1, 1970 specified by
      secs. The #GstDateTime is in the UTC timezone.
  
      Params:
        secs = seconds from the Unix epoch
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  static gst.date_time.DateTime newFromUnixEpochUtc(long secs)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_from_unix_epoch_utc(secs);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the time since Jan 1, 1970 specified by
      usecs. The #GstDateTime is in UTC.
  
      Params:
        usecs = microseconds from the Unix epoch
      Returns: a newly created #GstDateTime, or null
        on error.
  */
  static gst.date_time.DateTime newFromUnixEpochUtcUsecs(long usecs)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_from_unix_epoch_utc_usecs(usecs);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the date and times in the gregorian calendar
      in the local timezone.
      
      year should be from 1 to 9999, month should be from 1 to 12, day from
      1 to 31, hour from 0 to 23, minutes and seconds from 0 to 59.
      
      If month is -1, then the #GstDateTime created will only contain year,
      and all other fields will be considered not set.
      
      If day is -1, then the #GstDateTime created will only contain year and
      month and all other fields will be considered not set.
      
      If hour is -1, then the #GstDateTime created will only contain year and
      month and day, and the time fields will be considered not set. In this
      case minute and seconds should also be -1.
  
      Params:
        year = the gregorian year
        month = the gregorian month, or -1
        day = the day of the gregorian month, or -1
        hour = the hour of the day, or -1
        minute = the minute of the hour, or -1
        seconds = the second of the minute, or -1
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  static gst.date_time.DateTime newLocalTime(int year, int month, int day, int hour, int minute, double seconds)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_local_time(year, month, day, hour, minute, seconds);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime representing the current date and time.
      Returns: the newly created #GstDateTime which should
            be freed with [gst.date_time.DateTime.unref], or null on error.
  */
  static gst.date_time.DateTime newNowLocalTime()
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_now_local_time();
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime that represents the current instant at Universal
      coordinated time.
      Returns: the newly created #GstDateTime which should
          be freed with [gst.date_time.DateTime.unref], or null on error.
  */
  static gst.date_time.DateTime newNowUtc()
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_now_utc();
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the date and times in the gregorian calendar
      in the local timezone.
      
      year should be from 1 to 9999.
  
      Params:
        year = the gregorian year
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  static gst.date_time.DateTime newY(int year)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_y(year);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the date and times in the gregorian calendar
      in the local timezone.
      
      year should be from 1 to 9999, month should be from 1 to 12.
      
      If value is -1 then all over value will be ignored. For example
      if month == -1, then #GstDateTime will created only for year.
  
      Params:
        year = the gregorian year
        month = the gregorian month
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  static gst.date_time.DateTime newYm(int year, int month)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_ym(year, month);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstDateTime using the date and times in the gregorian calendar
      in the local timezone.
      
      year should be from 1 to 9999, month should be from 1 to 12, day from
      1 to 31.
      
      If value is -1 then all over value will be ignored. For example
      if month == -1, then #GstDateTime will created only for year. If
      day == -1, then #GstDateTime will created for year and month and
      so on.
  
      Params:
        year = the gregorian year
        month = the gregorian month
        day = the day of the gregorian month
      Returns: the newly created #GstDateTime,
        or null on error.
  */
  static gst.date_time.DateTime newYmd(int year, int month, int day)
  {
    GstDateTime* _cretval;
    _cretval = gst_date_time_new_ymd(year, month, day);
    auto _retval = _cretval ? new gst.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the day of the month of this #GstDateTime.
      Returns: The day of this #GstDateTime, or -1 if none is set.
  */
  int getDay()
  {
    int _retval;
    _retval = gst_date_time_get_day(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the hour of the day represented by datetime in the gregorian
      calendar. The return is in the range of 0 to 23.
      Returns: the hour of the day, or -1 if none is set.
  */
  int getHour()
  {
    int _retval;
    _retval = gst_date_time_get_hour(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the fractional part of the seconds in microseconds represented by
      datetime in the gregorian calendar.
      Returns: the microsecond of the second, or -1 if none is set.
  */
  int getMicrosecond()
  {
    int _retval;
    _retval = gst_date_time_get_microsecond(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the minute of the hour represented by datetime in the gregorian
      calendar.
      Returns: the minute of the hour, or -1 if none is set.
  */
  int getMinute()
  {
    int _retval;
    _retval = gst_date_time_get_minute(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the month of this #GstDateTime. January is 1, February is 2, etc..
      Returns: The month of this #GstDateTime, or -1 if none is set.
  */
  int getMonth()
  {
    int _retval;
    _retval = gst_date_time_get_month(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the second of the minute represented by datetime in the gregorian
      calendar.
      Returns: the second represented by datetime, or -1 if none is set.
  */
  int getSecond()
  {
    int _retval;
    _retval = gst_date_time_get_second(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the offset from UTC in hours that the timezone specified
      by datetime represents. Timezones ahead (to the east) of UTC have positive
      values, timezones before (to the west) of UTC have negative values.
      If datetime represents UTC time, then the offset is zero.
      Returns: the offset from UTC in hours, or `G_MAXFLOAT` if none is set.
  */
  float getTimeZoneOffset()
  {
    float _retval;
    _retval = gst_date_time_get_time_zone_offset(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the year of this #GstDateTime.
      Call [gst.date_time.DateTime.hasYear] before, to avoid warnings.
      Returns: The year of this #GstDateTime
  */
  int getYear()
  {
    int _retval;
    _retval = gst_date_time_get_year(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasDay()
  {
    bool _retval;
    _retval = cast(bool)gst_date_time_has_day(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasMonth()
  {
    bool _retval;
    _retval = cast(bool)gst_date_time_has_month(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasSecond()
  {
    bool _retval;
    _retval = cast(bool)gst_date_time_has_second(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasTime()
  {
    bool _retval;
    _retval = cast(bool)gst_date_time_has_time(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasYear()
  {
    bool _retval;
    _retval = cast(bool)gst_date_time_has_year(cast(const(GstDateTime)*)this._cPtr);
    return _retval;
  }

  /**
      Creates a new #GDateTime from a fully defined #GstDateTime object.
      Returns: a newly created #GDateTime, or
        null on error or if datetime does not have a year, month, day, hour,
        minute and second.
  */
  glib.date_time.DateTime toGDateTime()
  {
    GDateTime* _cretval;
    _cretval = gst_date_time_to_g_date_time(cast(GstDateTime*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a minimal string compatible with ISO-8601. Possible output formats
      are (for example): `2012`, `2012-06`, `2012-06-23`, `2012-06-23T23:30Z`,
      `2012-06-23T23:30+0100`, `2012-06-23T23:30:59Z`, `2012-06-23T23:30:59+0100`
      Returns: a newly allocated string formatted according
            to ISO 8601 and only including the datetime fields that are
            valid, or null in case there was an error.
  */
  string toIso8601String()
  {
    char* _cretval;
    _cretval = gst_date_time_to_iso8601_string(cast(GstDateTime*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
