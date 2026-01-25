/// Module for [TimeVal] struct
module glib.time_val;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    Represents a precise time, with seconds and microseconds.
    
    Similar to the struct timeval returned by the `gettimeofday()`
    UNIX system call.
    
    GLib is attempting to unify around the use of 64-bit integers to
    represent microsecond-precision time. As such, this type will be
    removed from a future version of GLib. A consequence of using `glong` for
    `tv_sec` is that on 32-bit systems [glib.time_val.TimeVal] is subject to the year 2038
    problem.

    Deprecated: Use #GDateTime or #guint64 instead.
*/
struct TimeVal
{
  /**
      seconds
  */
  glong tvSec;

  /**
      microseconds
  */
  glong tvUsec;

  /**
      Adds the given number of microseconds to time_. microseconds can
      also be negative to decrease the value of time_.
  
      Params:
        microseconds = number of microseconds to add to time
  
      Deprecated: #GTimeVal is not year-2038-safe. Use [gst.types.ulong] for
           representing microseconds since the epoch, or use #GDateTime.
  */
  void add(glong microseconds)
  {
    g_time_val_add(cast(GTimeVal*)&this, microseconds);
  }

  /**
      Converts time_ into an RFC 3339 encoded string, relative to the
      Coordinated Universal Time (UTC). This is one of the many formats
      allowed by ISO 8601.
      
      ISO 8601 allows a large number of date/time formats, with or without
      punctuation and optional elements. The format returned by this function
      is a complete date and time, with optional punctuation included, the
      UTC time zone represented as "Z", and the tv_usec part included if
      and only if it is nonzero, i.e. either
      "YYYY-MM-DDTHH:MM:SSZ" or "YYYY-MM-DDTHH:MM:SS.fffffZ".
      
      This corresponds to the Internet date/time format defined by
      [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt),
      and to either of the two most-precise formats defined by
      the W3C Note
      [Date and Time Formats](http://www.w3.org/TR/NOTE-datetime-19980827).
      Both of these documents are profiles of ISO 8601.
      
      Use [glib.date_time.DateTime.format] or [glib.global.strdupPrintf] if a different
      variation of ISO 8601 format is required.
      
      If time_ represents a date which is too large to fit into a `struct tm`,
      null will be returned. This is platform dependent. Note also that since
      [glib.time_val.TimeVal] stores the number of seconds as a `glong`, on 32-bit systems it
      is subject to the year 2038 problem. Accordingly, since GLib 2.62, this
      function has been deprecated. Equivalent functionality is available using:
      ```
      GDateTime *dt = g_date_time_new_from_unix_utc (time_val);
      iso8601_string = g_date_time_format_iso8601 (dt);
      g_date_time_unref (dt);
      ```
      
      The return value of [glib.time_val.TimeVal.toIso8601] has been nullable since GLib
      2.54; before then, GLib would crash under the same conditions.
      Returns: a newly allocated string containing an ISO 8601 date,
           or null if time_ was too large
  
      Deprecated: #GTimeVal is not year-2038-safe. Use
           g_date_time_format_iso8601(dt) instead.
  */
  string toIso8601()
  {
    char* _cretval;
    _cretval = g_time_val_to_iso8601(cast(GTimeVal*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Converts a string containing an ISO 8601 encoded date and time
      to a #GTimeVal and puts it into time_.
      
      iso_date must include year, month, day, hours, minutes, and
      seconds. It can optionally include fractions of a second and a time
      zone indicator. (In the absence of any time zone indication, the
      timestamp is assumed to be in local time.)
      
      Any leading or trailing space in iso_date is ignored.
      
      This function was deprecated, along with #GTimeVal itself, in GLib 2.62.
      Equivalent functionality is available using code like:
      ```
      GDateTime *dt = g_date_time_new_from_iso8601 (iso8601_string, NULL);
      gint64 time_val = g_date_time_to_unix (dt);
      g_date_time_unref (dt);
      ```
  
      Params:
        isoDate = an ISO 8601 encoded date string
        time = a #GTimeVal
      Returns: true if the conversion was successful.
  
      Deprecated: #GTimeVal is not year-2038-safe. Use
           [glib.date_time.DateTime.newFromIso8601] instead.
  */
  static bool fromIso8601(string isoDate, out glib.time_val.TimeVal time)
  {
    bool _retval;
    const(char)* _isoDate = isoDate.toCString(No.Alloc);
    _retval = cast(bool)g_time_val_from_iso8601(_isoDate, cast(GTimeVal*)&time);
    return _retval;
  }
}
