/// Module for [DateTime] class
module glib.date_time;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.time_val;
import glib.time_zone;
import glib.types;
import gobject.boxed;

/**
    [glib.date_time.DateTime] is a structure that combines a Gregorian date and time
    into a single structure.
    
    [glib.date_time.DateTime] provides many conversion and methods to manipulate dates and times.
    Time precision is provided down to microseconds and the time can range
    (proleptically) from 0001-01-01 00:00:00 to 9999-12-31 23:59:59.999999.
    [glib.date_time.DateTime] follows POSIX time in the sense that it is oblivious to leap
    seconds.
    
    [glib.date_time.DateTime] is an immutable object; once it has been created it cannot
    be modified further. All modifiers will create a new [glib.date_time.DateTime].
    Nearly all such functions can fail due to the date or time going out
    of range, in which case null will be returned.
    
    [glib.date_time.DateTime] is reference counted: the reference count is increased by calling
    [glib.date_time.DateTime.ref_] and decreased by calling [glib.date_time.DateTime.unref].
    When the reference count drops to 0, the resources allocated by the [glib.date_time.DateTime]
    structure are released.
    
    Many parts of the API may produce non-obvious results. As an
    example, adding two months to January 31st will yield March 31st
    whereas adding one month and then one month again will yield either
    March 28th or March 29th.  Also note that adding 24 hours is not
    always the same as adding one day (since days containing daylight
    savings time transitions are either 23 or 25 hours in length).
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
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_date_time_get_type != &gidSymbolNotFound ? g_date_time_get_type() : cast(GType)0;
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
      Creates a new #GDateTime corresponding to the given date and time in
      the time zone tz.
      
      The year must be between 1 and 9999, month between 1 and 12 and day
      between 1 and 28, 29, 30 or 31 depending on the month and the year.
      
      hour must be between 0 and 23 and minute must be between 0 and 59.
      
      seconds must be at least 0.0 and must be strictly less than 60.0.
      It will be rounded down to the nearest microsecond.
      
      If the given time is not representable in the given time zone (for
      example, 02:30 on March 14th 2010 in Toronto, due to daylight savings
      time) then the time will be rounded up to the nearest existing time
      (in this case, 03:00).  If this matters to you then you should verify
      the return value for containing the same as the numbers you gave.
      
      In the case that the given time is ambiguous in the given time zone
      (for example, 01:30 on November 7th 2010 in Toronto, due to daylight
      savings time) then the time falling within standard (ie:
      non-daylight) time is taken.
      
      It not considered a programmer error for the values to this function
      to be out of range, but in the case that they are, the function will
      return null.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        tz = a #GTimeZone
        year = the year component of the date
        month = the month component of the date
        day = the day component of the date
        hour = the hour component of the date
        minute = the minute component of the date
        seconds = the number of seconds past the minute
      Returns: a new #GDateTime, or null
  */
  this(glib.time_zone.TimeZone tz, int year, int month, int day, int hour, int minute, double seconds)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new(tz ? cast(GTimeZone*)tz._cPtr(No.Dup) : null, year, month, day, hour, minute, seconds);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a #GDateTime corresponding to the given
      [ISO 8601 formatted string](https://en.wikipedia.org/wiki/ISO_8601)
      text. ISO 8601 strings of the form <date><sep><time><tz> are supported, with
      some extensions from [RFC 3339](https://tools.ietf.org/html/rfc3339) as
      mentioned below.
      
      Note that as #GDateTime "is oblivious to leap seconds", leap seconds information
      in an ISO-8601 string will be ignored, so a `23:59:60` time would be parsed as
      `23:59:59`.
      
      <sep> is the separator and can be either 'T', 't' or ' '. The latter two
      separators are an extension from
      [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6).
      
      <date> is in the form:
      
      $(LIST
        * `YYYY-MM-DD` - Year/month/day, e.g. 2016-08-24.
        * `YYYYMMDD` - Same as above without dividers.
        * `YYYY-DDD` - Ordinal day where DDD is from 001 to 366, e.g. 2016-237.
        * `YYYYDDD` - Same as above without dividers.
        * `YYYY-Www-D` - Week day where ww is from 01 to 52 and D from 1-7,
          e.g. 2016-W34-3.
        * `YYYYWwwD` - Same as above without dividers.
      )
        
      <time> is in the form:
      
      $(LIST
        * `hh:mm:ss(.sss)` - Hours, minutes, seconds (subseconds), e.g. 22:10:42.123.
        * `hhmmss(.sss)` - Same as above without dividers.
      )
        
      <tz> is an optional timezone suffix of the form:
      
      $(LIST
        * `Z` - UTC.
        * `+hh:mm` or `-hh:mm` - Offset from UTC in hours and minutes, e.g. +12:00.
        * `+hh` or `-hh` - Offset from UTC in hours, e.g. +12.
      )
        
      If the timezone is not provided in text it must be provided in default_tz
      (this field is otherwise ignored).
      
      This call can fail (returning null) if text is not a valid ISO 8601
      formatted string.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        text = an ISO 8601 formatted time string.
        defaultTz = a #GTimeZone to use if the text doesn't contain a
                                   timezone, or null.
      Returns: a new #GDateTime, or null
  */
  static glib.date_time.DateTime newFromIso8601(string text, glib.time_zone.TimeZone defaultTz = null)
  {
    GDateTime* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = g_date_time_new_from_iso8601(_text, defaultTz ? cast(GTimeZone*)defaultTz._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to the given #GTimeVal tv in the
      local time zone.
      
      The time contained in a #GTimeVal is always stored in the form of
      seconds elapsed since 1970-01-01 00:00:00 UTC, regardless of the
      local time offset.
      
      This call can fail (returning null) if tv represents a time outside
      of the supported range of #GDateTime.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        tv = a #GTimeVal
      Returns: a new #GDateTime, or null
  
      Deprecated: #GTimeVal is not year-2038-safe. Use
           [glib.date_time.DateTime.newFromUnixLocal] instead.
  */
  static glib.date_time.DateTime newFromTimevalLocal(glib.time_val.TimeVal tv)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_from_timeval_local(cast(const(GTimeVal)*)&tv);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to the given #GTimeVal tv in UTC.
      
      The time contained in a #GTimeVal is always stored in the form of
      seconds elapsed since 1970-01-01 00:00:00 UTC.
      
      This call can fail (returning null) if tv represents a time outside
      of the supported range of #GDateTime.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        tv = a #GTimeVal
      Returns: a new #GDateTime, or null
  
      Deprecated: #GTimeVal is not year-2038-safe. Use
           [glib.date_time.DateTime.newFromUnixUtc] instead.
  */
  static glib.date_time.DateTime newFromTimevalUtc(glib.time_val.TimeVal tv)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_from_timeval_utc(cast(const(GTimeVal)*)&tv);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to the given Unix time `t` in the
      local time zone.
      
      Unix time is the number of seconds that have elapsed since 1970-01-01
      00:00:00 UTC, regardless of the local time offset.
      
      This call can fail (returning null) if `t` represents a time outside
      of the supported range of #GDateTime.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        t = the Unix time
      Returns: a new #GDateTime, or null
  */
  static glib.date_time.DateTime newFromUnixLocal(long t)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_from_unix_local(t);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a [glib.date_time.DateTime] corresponding to the given Unix time t in the
      local time zone.
      
      Unix time is the number of microseconds that have elapsed since 1970-01-01
      00:00:00 UTC, regardless of the local time offset.
      
      This call can fail (returning `NULL`) if t represents a time outside
      of the supported range of #GDateTime.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        usecs = the Unix time in microseconds
      Returns: a new [glib.date_time.DateTime], or `NULL`
  */
  static glib.date_time.DateTime newFromUnixLocalUsec(long usecs)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_from_unix_local_usec(usecs);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to the given Unix time `t` in UTC.
      
      Unix time is the number of seconds that have elapsed since 1970-01-01
      00:00:00 UTC.
      
      This call can fail (returning null) if `t` represents a time outside
      of the supported range of #GDateTime.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        t = the Unix time
      Returns: a new #GDateTime, or null
  */
  static glib.date_time.DateTime newFromUnixUtc(long t)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_from_unix_utc(t);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a [glib.date_time.DateTime] corresponding to the given Unix time t in UTC.
      
      Unix time is the number of microseconds that have elapsed since 1970-01-01
      00:00:00 UTC.
      
      This call can fail (returning `NULL`) if t represents a time outside
      of the supported range of #GDateTime.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        usecs = the Unix time in microseconds
      Returns: a new [glib.date_time.DateTime], or `NULL`
  */
  static glib.date_time.DateTime newFromUnixUtcUsec(long usecs)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_from_unix_utc_usec(usecs);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GDateTime corresponding to the given date and time in
      the local time zone.
      
      This call is equivalent to calling [glib.date_time.DateTime.new_] with the time
      zone returned by [glib.time_zone.TimeZone.newLocal].
  
      Params:
        year = the year component of the date
        month = the month component of the date
        day = the day component of the date
        hour = the hour component of the date
        minute = the minute component of the date
        seconds = the number of seconds past the minute
      Returns: a #GDateTime, or null
  */
  static glib.date_time.DateTime newLocal(int year, int month, int day, int hour, int minute, double seconds)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_local(year, month, day, hour, minute, seconds);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to this exact instant in the given
      time zone tz.  The time is as accurate as the system allows, to a
      maximum accuracy of 1 microsecond.
      
      This function will always succeed unless GLib is still being used after the
      year 9999.
      
      You should release the return value by calling [glib.date_time.DateTime.unref]
      when you are done with it.
  
      Params:
        tz = a #GTimeZone
      Returns: a new #GDateTime, or null
  */
  static glib.date_time.DateTime newNow(glib.time_zone.TimeZone tz)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_now(tz ? cast(GTimeZone*)tz._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to this exact instant in the local
      time zone.
      
      This is equivalent to calling [glib.date_time.DateTime.newNow] with the time
      zone returned by [glib.time_zone.TimeZone.newLocal].
      Returns: a new #GDateTime, or null
  */
  static glib.date_time.DateTime newNowLocal()
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_now_local();
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GDateTime corresponding to this exact instant in UTC.
      
      This is equivalent to calling [glib.date_time.DateTime.newNow] with the time
      zone returned by [glib.time_zone.TimeZone.newUtc].
      Returns: a new #GDateTime, or null
  */
  static glib.date_time.DateTime newNowUtc()
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_now_utc();
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GDateTime corresponding to the given date and time in
      UTC.
      
      This call is equivalent to calling [glib.date_time.DateTime.new_] with the time
      zone returned by [glib.time_zone.TimeZone.newUtc].
  
      Params:
        year = the year component of the date
        month = the month component of the date
        day = the day component of the date
        hour = the hour component of the date
        minute = the minute component of the date
        seconds = the number of seconds past the minute
      Returns: a #GDateTime, or null
  */
  static glib.date_time.DateTime newUtc(int year, int month, int day, int hour, int minute, double seconds)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_new_utc(year, month, day, hour, minute, seconds);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified timespan to the copy.
  
      Params:
        timespan = a #GTimeSpan
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime add(glib.types.TimeSpan timespan)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add(cast(GDateTime*)this._cPtr, timespan);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified number of days to the
      copy. Add negative values to subtract days.
  
      Params:
        days = the number of days
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addDays(int days)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_days(cast(GDateTime*)this._cPtr, days);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GDateTime adding the specified values to the current date and
      time in datetime. Add negative values to subtract.
  
      Params:
        years = the number of years to add
        months = the number of months to add
        days = the number of days to add
        hours = the number of hours to add
        minutes = the number of minutes to add
        seconds = the number of seconds to add
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addFull(int years, int months, int days, int hours, int minutes, double seconds)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_full(cast(GDateTime*)this._cPtr, years, months, days, hours, minutes, seconds);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified number of hours.
      Add negative values to subtract hours.
  
      Params:
        hours = the number of hours to add
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addHours(int hours)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_hours(cast(GDateTime*)this._cPtr, hours);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime adding the specified number of minutes.
      Add negative values to subtract minutes.
  
      Params:
        minutes = the number of minutes to add
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addMinutes(int minutes)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_minutes(cast(GDateTime*)this._cPtr, minutes);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified number of months to the
      copy. Add negative values to subtract months.
      
      The day of the month of the resulting #GDateTime is clamped to the number
      of days in the updated calendar month. For example, if adding 1 month to
      31st January 2018, the result would be 28th February 2018. In 2020 (a leap
      year), the result would be 29th February.
  
      Params:
        months = the number of months
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addMonths(int months)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_months(cast(GDateTime*)this._cPtr, months);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified number of seconds.
      Add negative values to subtract seconds.
  
      Params:
        seconds = the number of seconds to add
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addSeconds(double seconds)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_seconds(cast(GDateTime*)this._cPtr, seconds);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified number of weeks to the
      copy. Add negative values to subtract weeks.
  
      Params:
        weeks = the number of weeks
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addWeeks(int weeks)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_weeks(cast(GDateTime*)this._cPtr, weeks);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of datetime and adds the specified number of years to the
      copy. Add negative values to subtract years.
      
      As with [glib.date_time.DateTime.addMonths], if the resulting date would be 29th
      February on a non-leap year, the day will be clamped to 28th February.
  
      Params:
        years = the number of years
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime addYears(int years)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_add_years(cast(GDateTime*)this._cPtr, years);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      A comparison function for #GDateTimes that is suitable
      as a #GCompareFunc. Both #GDateTimes must be non-null.
  
      Params:
        dt2 = second #GDateTime to compare
      Returns: -1, 0 or 1 if dt1 is less than, equal to or greater
          than dt2.
  */
  int compare(glib.date_time.DateTime dt2)
  {
    int _retval;
    _retval = g_date_time_compare(cast(GDateTime*)this._cPtr, dt2 ? cast(GDateTime*)dt2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calculates the difference in time between end and begin.  The
      #GTimeSpan that is returned is effectively end - begin (ie:
      positive if the first parameter is larger).
  
      Params:
        begin = a #GDateTime
      Returns: the difference between the two #GDateTime, as a time
          span expressed in microseconds.
  */
  glib.types.TimeSpan difference(glib.date_time.DateTime begin)
  {
    glib.types.TimeSpan _retval;
    _retval = g_date_time_difference(cast(GDateTime*)this._cPtr, begin ? cast(GDateTime*)begin._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks to see if dt1 and dt2 are equal.
      
      Equal here means that they represent the same moment after converting
      them to the same time zone.
  
      Params:
        dt2 = a #GDateTime
      Returns: true if dt1 and dt2 are equal
  */
  bool equal(glib.date_time.DateTime dt2)
  {
    bool _retval;
    _retval = cast(bool)g_date_time_equal(cast(GDateTime*)this._cPtr, dt2 ? cast(GDateTime*)dt2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a newly allocated string representing the requested format.
      
      The format strings understood by this function are a subset of the
      `strftime()` format language as specified by C99.  The ``D``, ``U`` and ``W``
      conversions are not supported, nor is the `E` modifier.  The GNU
      extensions ``k``, ``l``, ``s`` and ``P`` are supported, however, as are the
      `0`, `_` and `-` modifiers. The Python extension ``f`` is also supported.
      
      In contrast to `strftime()`, this function always produces a UTF-8
      string, regardless of the current locale.  Note that the rendering of
      many formats is locale-dependent and may not match the `strftime()`
      output exactly.
      
      The following format specifiers are supported:
      
      $(LIST
        * ``a``: the abbreviated weekday name according to the current locale
        * ``A``: the full weekday name according to the current locale
        * ``b``: the abbreviated month name according to the current locale
        * ``B``: the full month name according to the current locale
        * ``c``: the preferred date and time representation for the current locale
        * ``C``: the century number (year/100) as a 2-digit integer (00-99)
        * ``d``: the day of the month as a decimal number (range 01 to 31)
        * ``e``: the day of the month as a decimal number (range 1 to 31);
          single digits are preceded by a figure space (U+2007)
        * ``F``: equivalent to ``Y`-`m`-`d`` (the ISO 8601 date format)
        * ``g``: the last two digits of the ISO 8601 week-based year as a
          decimal number (00-99). This works well with ``V`` and ``u``.
        * ``G``: the ISO 8601 week-based year as a decimal number. This works
          well with ``V`` and ``u``.
        * ``h``: equivalent to ``b``
        * ``H``: the hour as a decimal number using a 24-hour clock (range 00 to 23)
        * ``I``: the hour as a decimal number using a 12-hour clock (range 01 to 12)
        * ``j``: the day of the year as a decimal number (range 001 to 366)
        * ``k``: the hour (24-hour clock) as a decimal number (range 0 to 23);
          single digits are preceded by a figure space (U+2007)
        * ``l``: the hour (12-hour clock) as a decimal number (range 1 to 12);
          single digits are preceded by a figure space (U+2007)
        * ``m``: the month as a decimal number (range 01 to 12)
        * ``M``: the minute as a decimal number (range 00 to 59)
        * ``f``: the microsecond as a decimal number (range 000000 to 999999)
        * ``p``: either ‘AM’ or ‘PM’ according to the given time value, or the
          corresponding  strings for the current locale.  Noon is treated as
          ‘PM’ and midnight as ‘AM’. Use of this format specifier is discouraged, as
          many locales have no concept of AM/PM formatting. Use ``c`` or ``X`` instead.
        * ``P``: like ``p`` but lowercase: ‘am’ or ‘pm’ or a corresponding string for
          the current locale. Use of this format specifier is discouraged, as
          many locales have no concept of AM/PM formatting. Use ``c`` or ``X`` instead.
        * ``r``: the time in a.m. or p.m. notation. Use of this format specifier is
          discouraged, as many locales have no concept of AM/PM formatting. Use ``c``
          or ``X`` instead.
        * ``R``: the time in 24-hour notation (``H`:`M``)
        * ``s``: the number of seconds since the Epoch, that is, since 1970-01-01
          00:00:00 UTC
        * ``S``: the second as a decimal number (range 00 to 60)
        * ``t``: a tab character
        * ``T``: the time in 24-hour notation with seconds (``H`:`M`:`S``)
        * ``u``: the ISO 8601 standard day of the week as a decimal, range 1 to 7,
           Monday being 1. This works well with ``G`` and ``V``.
        * ``V``: the ISO 8601 standard week number of the current year as a decimal
          number, range 01 to 53, where week 1 is the first week that has at
          least 4 days in the new year. See [glib.date_time.DateTime.getWeekOfYear].
          This works well with ``G`` and ``u``.
        * ``w``: the day of the week as a decimal, range 0 to 6, Sunday being 0.
          This is not the ISO 8601 standard format — use ``u`` instead.
        * ``x``: the preferred date representation for the current locale without
          the time
        * ``X``: the preferred time representation for the current locale without
          the date
        * ``y``: the year as a decimal number without the century
        * ``Y``: the year as a decimal number including the century
        * ``z``: the time zone as an offset from UTC (`+hhmm`)
        * `%:z`: the time zone as an offset from UTC (`+hh:mm`).
          This is a gnulib `strftime()` extension. Since: 2.38
        * `%::z`: the time zone as an offset from UTC (`+hh:mm:ss`). This is a
          gnulib `strftime()` extension. Since: 2.38
        * `%:::z`: the time zone as an offset from UTC, with `:` to necessary
          precision (e.g., `-04`, `+05:30`). This is a gnulib `strftime()` extension. Since: 2.38
        * ``Z``: the time zone or name or abbreviation
        * `%%`: a literal `%` character
      )
        
      Some conversion specifications can be modified by preceding the
      conversion specifier by one or more modifier characters.
      
      The following modifiers are supported for many of the numeric
      conversions:
      
      $(LIST
        * `O`: Use alternative numeric symbols, if the current locale supports those.
        * `_`: Pad a numeric result with spaces. This overrides the default padding
          for the specifier.
        * `-`: Do not pad a numeric result. This overrides the default padding
          for the specifier.
        * `0`: Pad a numeric result with zeros. This overrides the default padding
          for the specifier.
      )
        
      The following modifiers are supported for many of the alphabetic conversions:
      
      $(LIST
        * `^`: Use upper case if possible. This is a gnulib `strftime()` extension.
          Since: 2.80
        * `#`: Use opposite case if possible. This is a gnulib `strftime()`
          extension. Since: 2.80
      )
        
      Additionally, when `O` is used with `B`, `b`, or `h`, it produces the alternative
      form of a month name. The alternative form should be used when the month
      name is used without a day number (e.g., standalone). It is required in
      some languages (Baltic, Slavic, Greek, and more) due to their grammatical
      rules. For other languages there is no difference. ``OB`` is a GNU and BSD
      `strftime()` extension expected to be added to the future POSIX specification,
      ``Ob`` and ``Oh`` are GNU `strftime()` extensions. Since: 2.56
      
      Since GLib 2.80, when `E` is used with ``c``, ``C``, ``x``, ``X``, ``y`` or ``Y``,
      the date is formatted using an alternate era representation specific to the
      locale. This is typically used for the Thai solar calendar or Japanese era
      names, for example.
      
      $(LIST
        * ``Ec``: the preferred date and time representation for the current locale,
          using the alternate era representation
        * ``EC``: the name of the era
        * ``Ex``: the preferred date representation for the current locale without
          the time, using the alternate era representation
        * ``EX``: the preferred time representation for the current locale without
          the date, using the alternate era representation
        * ``Ey``: the year since the beginning of the era denoted by the ``EC``
          specifier
        * ``EY``: the full alternative year representation
      )
  
      Params:
        format = a valid UTF-8 string, containing the format for the
                   #GDateTime
      Returns: a newly allocated string formatted to
           the requested format or null in the case that there was an error (such
           as a format specifier not being supported in the current locale). The
           string should be freed with [glib.global.gfree].
  */
  string format(string format)
  {
    char* _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = g_date_time_format(cast(GDateTime*)this._cPtr, _format);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Format datetime in [ISO 8601 format](https://en.wikipedia.org/wiki/ISO_8601),
      including the date, time and time zone, and return that as a UTF-8 encoded
      string.
      
      Since GLib 2.66, this will output to sub-second precision if needed.
      Returns: a newly allocated string formatted in
          ISO 8601 format or null in the case that there was an error. The string
          should be freed with [glib.global.gfree].
  */
  string formatIso8601()
  {
    char* _cretval;
    _cretval = g_date_time_format_iso8601(cast(GDateTime*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the day of the month represented by datetime in the gregorian
      calendar.
      Returns: the day of the month
  */
  int getDayOfMonth()
  {
    int _retval;
    _retval = g_date_time_get_day_of_month(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the ISO 8601 day of the week on which datetime falls (1 is
      Monday, 2 is Tuesday... 7 is Sunday).
      Returns: the day of the week
  */
  int getDayOfWeek()
  {
    int _retval;
    _retval = g_date_time_get_day_of_week(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the day of the year represented by datetime in the Gregorian
      calendar.
      Returns: the day of the year
  */
  int getDayOfYear()
  {
    int _retval;
    _retval = g_date_time_get_day_of_year(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the hour of the day represented by datetime
      Returns: the hour of the day
  */
  int getHour()
  {
    int _retval;
    _retval = g_date_time_get_hour(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the microsecond of the date represented by datetime
      Returns: the microsecond of the second
  */
  int getMicrosecond()
  {
    int _retval;
    _retval = g_date_time_get_microsecond(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the minute of the hour represented by datetime
      Returns: the minute of the hour
  */
  int getMinute()
  {
    int _retval;
    _retval = g_date_time_get_minute(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the month of the year represented by datetime in the Gregorian
      calendar.
      Returns: the month represented by datetime
  */
  int getMonth()
  {
    int _retval;
    _retval = g_date_time_get_month(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the second of the minute represented by datetime
      Returns: the second represented by datetime
  */
  int getSecond()
  {
    int _retval;
    _retval = g_date_time_get_second(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the number of seconds since the start of the last minute,
      including the fractional part.
      Returns: the number of seconds
  */
  double getSeconds()
  {
    double _retval;
    _retval = g_date_time_get_seconds(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Get the time zone for this datetime.
      Returns: the time zone
  */
  glib.time_zone.TimeZone getTimezone()
  {
    GTimeZone* _cretval;
    _cretval = g_date_time_get_timezone(cast(GDateTime*)this._cPtr);
    auto _retval = _cretval ? new glib.time_zone.TimeZone(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Determines the time zone abbreviation to be used at the time and in
      the time zone of datetime.
      
      For example, in Toronto this is currently "EST" during the winter
      months and "EDT" during the summer months when daylight savings
      time is in effect.
      Returns: the time zone abbreviation. The returned
                 string is owned by the #GDateTime and it should not be
                 modified or freed
  */
  string getTimezoneAbbreviation()
  {
    const(char)* _cretval;
    _cretval = g_date_time_get_timezone_abbreviation(cast(GDateTime*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Determines the offset to UTC in effect at the time and in the time
      zone of datetime.
      
      The offset is the number of microseconds that you add to UTC time to
      arrive at local time for the time zone (ie: negative numbers for time
      zones west of GMT, positive numbers for east).
      
      If datetime represents UTC time, then the offset is always zero.
      Returns: the number of microseconds that should be added to UTC to
                 get the local time
  */
  glib.types.TimeSpan getUtcOffset()
  {
    glib.types.TimeSpan _retval;
    _retval = g_date_time_get_utc_offset(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Returns the ISO 8601 week-numbering year in which the week containing
      datetime falls.
      
      This function, taken together with [glib.date_time.DateTime.getWeekOfYear] and
      [glib.date_time.DateTime.getDayOfWeek] can be used to determine the full ISO
      week date on which datetime falls.
      
      This is usually equal to the normal Gregorian year (as returned by
      [glib.date_time.DateTime.getYear]), except as detailed below:
      
      For Thursday, the week-numbering year is always equal to the usual
      calendar year.  For other days, the number is such that every day
      within a complete week (Monday to Sunday) is contained within the
      same week-numbering year.
      
      For Monday, Tuesday and Wednesday occurring near the end of the year,
      this may mean that the week-numbering year is one greater than the
      calendar year (so that these days have the same week-numbering year
      as the Thursday occurring early in the next year).
      
      For Friday, Saturday and Sunday occurring near the start of the year,
      this may mean that the week-numbering year is one less than the
      calendar year (so that these days have the same week-numbering year
      as the Thursday occurring late in the previous year).
      
      An equivalent description is that the week-numbering year is equal to
      the calendar year containing the majority of the days in the current
      week (Monday to Sunday).
      
      Note that January 1 0001 in the proleptic Gregorian calendar is a
      Monday, so this function never returns 0.
      Returns: the ISO 8601 week-numbering year for datetime
  */
  int getWeekNumberingYear()
  {
    int _retval;
    _retval = g_date_time_get_week_numbering_year(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Returns the ISO 8601 week number for the week containing datetime.
      The ISO 8601 week number is the same for every day of the week (from
      Moday through Sunday).  That can produce some unusual results
      (described below).
      
      The first week of the year is week 1.  This is the week that contains
      the first Thursday of the year.  Equivalently, this is the first week
      that has more than 4 of its days falling within the calendar year.
      
      The value 0 is never returned by this function.  Days contained
      within a year but occurring before the first ISO 8601 week of that
      year are considered as being contained in the last week of the
      previous year.  Similarly, the final days of a calendar year may be
      considered as being part of the first ISO 8601 week of the next year
      if 4 or more days of that week are contained within the new year.
      Returns: the ISO 8601 week number for datetime.
  */
  int getWeekOfYear()
  {
    int _retval;
    _retval = g_date_time_get_week_of_year(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the year represented by datetime in the Gregorian calendar.
      Returns: the year represented by datetime
  */
  int getYear()
  {
    int _retval;
    _retval = g_date_time_get_year(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the Gregorian day, month, and year of a given #GDateTime.
  
      Params:
        year = the return location for the gregorian year, or null.
        month = the return location for the month of the year, or null.
        day = the return location for the day of the month, or null.
  */
  void getYmd(out int year, out int month, out int day)
  {
    g_date_time_get_ymd(cast(GDateTime*)this._cPtr, cast(int*)&year, cast(int*)&month, cast(int*)&day);
  }

  /**
      Hashes datetime into a #guint, suitable for use within #GHashTable.
      Returns: a #guint containing the hash
  */
  uint hash()
  {
    uint _retval;
    _retval = g_date_time_hash(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Determines if daylight savings time is in effect at the time and in
      the time zone of datetime.
      Returns: true if daylight savings time is in effect
  */
  bool isDaylightSavings()
  {
    bool _retval;
    _retval = cast(bool)g_date_time_is_daylight_savings(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Creates a new #GDateTime corresponding to the same instant in time as
      datetime, but in the local time zone.
      
      This call is equivalent to calling [glib.date_time.DateTime.toTimezone] with the
      time zone returned by [glib.time_zone.TimeZone.newLocal].
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime toLocal()
  {
    GDateTime* _cretval;
    _cretval = g_date_time_to_local(cast(GDateTime*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Stores the instant in time that datetime represents into tv.
      
      The time contained in a #GTimeVal is always stored in the form of
      seconds elapsed since 1970-01-01 00:00:00 UTC, regardless of the time
      zone associated with datetime.
      
      On systems where 'long' is 32bit (ie: all 32bit systems and all
      Windows systems), a #GTimeVal is incapable of storing the entire
      range of values that #GDateTime is capable of expressing.  On those
      systems, this function returns false to indicate that the time is
      out of range.
      
      On systems where 'long' is 64bit, this function never fails.
  
      Params:
        tv = a #GTimeVal to modify
      Returns: true if successful, else false
  
      Deprecated: #GTimeVal is not year-2038-safe. Use
           [glib.date_time.DateTime.toUnix] instead.
  */
  bool toTimeval(glib.time_val.TimeVal tv)
  {
    bool _retval;
    _retval = cast(bool)g_date_time_to_timeval(cast(GDateTime*)this._cPtr, cast(GTimeVal*)&tv);
    return _retval;
  }

  /**
      Create a new #GDateTime corresponding to the same instant in time as
      datetime, but in the time zone tz.
      
      This call can fail in the case that the time goes out of bounds.  For
      example, converting 0001-01-01 00:00:00 UTC to a time zone west of
      Greenwich will fail (due to the year 0 being out of range).
  
      Params:
        tz = the new #GTimeZone
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime toTimezone(glib.time_zone.TimeZone tz)
  {
    GDateTime* _cretval;
    _cretval = g_date_time_to_timezone(cast(GDateTime*)this._cPtr, tz ? cast(GTimeZone*)tz._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gives the Unix time corresponding to datetime, rounding down to the
      nearest second.
      
      Unix time is the number of seconds that have elapsed since 1970-01-01
      00:00:00 UTC, regardless of the time zone associated with datetime.
      Returns: the Unix time corresponding to datetime
  */
  long toUnix()
  {
    long _retval;
    _retval = g_date_time_to_unix(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Gives the Unix time corresponding to datetime, in microseconds.
      
      Unix time is the number of microseconds that have elapsed since 1970-01-01
      00:00:00 UTC, regardless of the time zone associated with datetime.
      Returns: the Unix time corresponding to datetime
  */
  long toUnixUsec()
  {
    long _retval;
    _retval = g_date_time_to_unix_usec(cast(GDateTime*)this._cPtr);
    return _retval;
  }

  /**
      Creates a new #GDateTime corresponding to the same instant in time as
      datetime, but in UTC.
      
      This call is equivalent to calling [glib.date_time.DateTime.toTimezone] with the
      time zone returned by [glib.time_zone.TimeZone.newUtc].
      Returns: the newly created #GDateTime which
          should be freed with [glib.date_time.DateTime.unref], or null
  */
  glib.date_time.DateTime toUtc()
  {
    GDateTime* _cretval;
    _cretval = g_date_time_to_utc(cast(GDateTime*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
