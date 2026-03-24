/// Module for [HandlerTime] class
module gda.handler_time;

import gda.c.functions;
import gda.c.types;
import gda.data_handler;
import gda.data_handler_mixin;
import gda.types;
import gid.gid;
import glib.types;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gobject.value;

/** */
class HandlerTime : gobject.object.ObjectWrap, gda.data_handler.DataHandler
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_handler_time_get_type != &gidSymbolNotFound ? gda_handler_time_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HandlerTime self()
  {
    return this;
  }

  /**
  Get builder for [gda.handler_time.HandlerTime]
  Returns: New builder object
  */
  static HandlerTimeGidBuilder builder()
  {
    return new HandlerTimeGidBuilder;
  }

  mixin DataHandlerT!();

  /**
      Creates a data handler for time values
      Returns: the new object
  */
  static gda.data_handler.DataHandler new_()
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_time_new();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a data handler for time values, but using the default C locale
      instead of the current user locale.
      Returns: the new object
  */
  static gda.data_handler.DataHandler newNoLocale()
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_time_new_no_locale();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a string representing the locale-dependent way to enter a date/time/datetime, using
      a syntax suitable for the #GdauiFormatEntry widget
  
      Params:
        type = the type of data being handled
      Returns: a new string
  */
  string getFormat(gobject.types.GType type)
  {
    char* _cretval;
    _cretval = gda_handler_time_get_format(cast(GdaHandlerTime*)this._cPtr, type);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string getNoLocaleStrFromValue(gobject.value.Value value)
  {
    char* _cretval;
    _cretval = gda_handler_time_get_no_locale_str_from_value(cast(GdaHandlerTime*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Specifies the SQL output style of the dh data handler. The general format is "FIRSTsSECsTHIRD"
      where FIRST, SEC and THIRD are specified by first, sec and trird and 's' is the separator,
      specified by separator.
      
      The default implementation is first=G_DATE_MONTH, sec=G_DATE_DAY and third=G_DATE_YEAR
      (the year is rendered on 4 digits) and the separator is '-'
  
      Params:
        first = what comes first in the date representation
        sec = what comes second in the date representation
        third = what comes third in the date representation
        separator = separator character used between year, month and day
        twodigitsYears = TRUE if year part of date must be rendered on 2 digits
  */
  void setSqlSpec(glib.types.DateDMY first, glib.types.DateDMY sec, glib.types.DateDMY third, char separator, bool twodigitsYears)
  {
    gda_handler_time_set_sql_spec(cast(GdaHandlerTime*)this._cPtr, first, sec, third, separator, twodigitsYears);
  }

  /**
      Specifies the human readable output style of the dh data handler.
      The general format is "FIRSTsSECsTHIRD"
      where FIRST, SEC and THIRD are specified by first, sec and trird and 's' is the separator,
      specified by separator.
      
      The default implementation depends on the current locale, except if dh was created
      using [gda.handler_time.HandlerTime.newNoLocale].
  
      Params:
        first = what comes first in the date representation
        sec = what comes second in the date representation
        third = what comes third in the date representation
        separator = separator character used between year, month and day
        twodigitsYears = TRUE if year part of date must be rendered on 2 digits
  */
  void setStrSpec(glib.types.DateDMY first, glib.types.DateDMY sec, glib.types.DateDMY third, char separator, bool twodigitsYears)
  {
    gda_handler_time_set_str_spec(cast(GdaHandlerTime*)this._cPtr, first, sec, third, separator, twodigitsYears);
  }
}

class HandlerTimeGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_handler.DataHandlerGidBuilderImpl!T
{

  mixin DataHandlerGidBuilderT!();
}

/// Fluent builder for [gda.handler_time.HandlerTime]
final class HandlerTimeGidBuilder : HandlerTimeGidBuilderImpl!HandlerTimeGidBuilder
{
  HandlerTime build()
  {
    return new HandlerTime(cast(void*)createGObject(HandlerTime._getGType), No.Take);
  }
}
