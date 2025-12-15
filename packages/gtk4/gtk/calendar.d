/// Module for [Calendar] class
module gtk.calendar;

import gid.gid;
import glib.date_time;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.calendar.Calendar] is a widget that displays a Gregorian calendar, one month
    at a time.
    
    ![An example GtkCalendar](calendar.png)
    
    A [gtk.calendar.Calendar] can be created with [gtk.calendar.Calendar.new_].
    
    The date that is currently displayed can be altered with
    [gtk.calendar.Calendar.selectDay].
    
    To place a visual marker on a particular day, use
    [gtk.calendar.Calendar.markDay] and to remove the marker,
    [gtk.calendar.Calendar.unmarkDay]. Alternative, all
    marks can be cleared with [gtk.calendar.Calendar.clearMarks].
    
    The selected date can be retrieved from a [gtk.calendar.Calendar] using
    [gtk.calendar.Calendar.getDate].
    
    Users should be aware that, although the Gregorian calendar is the
    legal calendar in most countries, it was adopted progressively
    between 1582 and 1929. Display before these dates is likely to be
    historically incorrect.
    
    # CSS nodes
    
    ```
    calendar.view
    ├── header
    │   ├── button
    │   ├── stack.month
    │   ├── button
    │   ├── button
    │   ├── label.year
    │   ╰── button
    ╰── grid
        ╰── label[.day-name][.week-number][.day-number][.other-month][.today]
    ```
    
    [gtk.calendar.Calendar] has a main node with name calendar. It contains a subnode
    called header containing the widgets for switching between years and months.
    
    The grid subnode contains all day labels, including week numbers on the left
    (marked with the .week-number css class) and day names on top (marked with the
    .day-name css class).
    
    Day labels that belong to the previous or next month get the .other-month
    style class. The label of the current day get the .today style class.
    
    Marked day labels get the :selected state assigned.
*/
class Calendar : gtk.widget.Widget
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
    return cast(void function())gtk_calendar_get_type != &gidSymbolNotFound ? gtk_calendar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Calendar self()
  {
    return this;
  }

  /**
      Get `day` property.
      Returns: The selected day (as a number between 1 and 31).
  */
  @property int day()
  {
    return getDay();
  }

  /**
      Set `day` property.
      Params:
        propval = The selected day (as a number between 1 and 31).
  */
  @property void day(int propval)
  {
    return setDay(propval);
  }

  /**
      Get `month` property.
      Returns: The selected month (as a number between 0 and 11).
      
      This property gets initially set to the current month.
  */
  @property int month()
  {
    return getMonth();
  }

  /**
      Set `month` property.
      Params:
        propval = The selected month (as a number between 0 and 11).
        
        This property gets initially set to the current month.
  */
  @property void month(int propval)
  {
    return setMonth(propval);
  }

  /**
      Get `showDayNames` property.
      Returns: Determines whether day names are displayed.
  */
  @property bool showDayNames()
  {
    return getShowDayNames();
  }

  /**
      Set `showDayNames` property.
      Params:
        propval = Determines whether day names are displayed.
  */
  @property void showDayNames(bool propval)
  {
    return setShowDayNames(propval);
  }

  /**
      Get `showHeading` property.
      Returns: Determines whether a heading is displayed.
  */
  @property bool showHeading()
  {
    return getShowHeading();
  }

  /**
      Set `showHeading` property.
      Params:
        propval = Determines whether a heading is displayed.
  */
  @property void showHeading(bool propval)
  {
    return setShowHeading(propval);
  }

  /**
      Get `showWeekNumbers` property.
      Returns: Determines whether week numbers are displayed.
  */
  @property bool showWeekNumbers()
  {
    return getShowWeekNumbers();
  }

  /**
      Set `showWeekNumbers` property.
      Params:
        propval = Determines whether week numbers are displayed.
  */
  @property void showWeekNumbers(bool propval)
  {
    return setShowWeekNumbers(propval);
  }

  /**
      Get `year` property.
      Returns: The selected year.
      
      This property gets initially set to the current year.
  */
  @property int year()
  {
    return getYear();
  }

  /**
      Set `year` property.
      Params:
        propval = The selected year.
        
        This property gets initially set to the current year.
  */
  @property void year(int propval)
  {
    return setYear(propval);
  }

  /**
      Creates a new calendar, with the current date being selected.
      Returns: a newly [gtk.calendar.Calendar] widget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_calendar_new();
    this(_cretval, No.Take);
  }

  /**
      Remove all visual markers.
  */
  void clearMarks()
  {
    gtk_calendar_clear_marks(cast(GtkCalendar*)this._cPtr);
  }

  /**
      Returns a [glib.date_time.DateTime] representing the shown
      year, month and the selected day.
      
      The returned date is in the local time zone.
      Returns: the [glib.date_time.DateTime] representing the shown date
  */
  glib.date_time.DateTime getDate()
  {
    GDateTime* _cretval;
    _cretval = gtk_calendar_get_date(cast(GtkCalendar*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the day of the selected date.
      Returns: the day of the selected date.
  */
  int getDay()
  {
    int _retval;
    _retval = gtk_calendar_get_day(cast(GtkCalendar*)this._cPtr);
    return _retval;
  }

  /**
      Returns if the day of the calendar is already marked.
  
      Params:
        day = the day number between 1 and 31.
      Returns: whether the day is marked.
  */
  bool getDayIsMarked(uint day)
  {
    bool _retval;
    _retval = cast(bool)gtk_calendar_get_day_is_marked(cast(GtkCalendar*)this._cPtr, day);
    return _retval;
  }

  /**
      Gets the month of the selected date.
      Returns: The month of the selected date (as a number between 0 and 11).
  */
  int getMonth()
  {
    int _retval;
    _retval = gtk_calendar_get_month(cast(GtkCalendar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether self is currently showing the names
      of the week days.
      
      This is the value of the `propertyGtk.Calendar:show-day-names`
      property.
      Returns: Whether the calendar shows day names.
  */
  bool getShowDayNames()
  {
    bool _retval;
    _retval = cast(bool)gtk_calendar_get_show_day_names(cast(GtkCalendar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether self is currently showing the heading.
      
      This is the value of the `propertyGtk.Calendar:show-heading`
      property.
      Returns: Whether the calendar is showing a heading.
  */
  bool getShowHeading()
  {
    bool _retval;
    _retval = cast(bool)gtk_calendar_get_show_heading(cast(GtkCalendar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether self is showing week numbers right
      now.
      
      This is the value of the `propertyGtk.Calendar:show-week-numbers`
      property.
      Returns: Whether the calendar is showing week numbers.
  */
  bool getShowWeekNumbers()
  {
    bool _retval;
    _retval = cast(bool)gtk_calendar_get_show_week_numbers(cast(GtkCalendar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the year of the selected date.
      Returns: the year of the selected date.
  */
  int getYear()
  {
    int _retval;
    _retval = gtk_calendar_get_year(cast(GtkCalendar*)this._cPtr);
    return _retval;
  }

  /**
      Places a visual marker on a particular day of the current month.
  
      Params:
        day = the day number to mark between 1 and 31.
  */
  void markDay(uint day)
  {
    gtk_calendar_mark_day(cast(GtkCalendar*)this._cPtr, day);
  }

  /**
      Switches to date's year and month and select its day.
  
      Params:
        date = a [glib.date_time.DateTime] representing the day to select
  */
  void selectDay(glib.date_time.DateTime date)
  {
    gtk_calendar_select_day(cast(GtkCalendar*)this._cPtr, date ? cast(GDateTime*)date._cPtr(No.Dup) : null);
  }

  /**
      Sets the day for the selected date.
      
      The new date must be valid. For example, setting 31 for the day when the
      month is February, fails.
  
      Params:
        day = The desired day for the selected date (as a number between 1 and 31).
  */
  void setDay(int day)
  {
    gtk_calendar_set_day(cast(GtkCalendar*)this._cPtr, day);
  }

  /**
      Sets the month for the selected date.
      
      The new date must be valid. For example, setting 1 (February) for the month
      when the day is 31, fails.
  
      Params:
        month = The desired month for the selected date (as a number between 0 and 11).
  */
  void setMonth(int month)
  {
    gtk_calendar_set_month(cast(GtkCalendar*)this._cPtr, month);
  }

  /**
      Sets whether the calendar shows day names.
  
      Params:
        value = Whether to show day names above the day numbers
  */
  void setShowDayNames(bool value)
  {
    gtk_calendar_set_show_day_names(cast(GtkCalendar*)this._cPtr, value);
  }

  /**
      Sets whether the calendar should show a heading.
      
      The heading contains the current year and month as well as
      buttons for changing both.
  
      Params:
        value = Whether to show the heading in the calendar
  */
  void setShowHeading(bool value)
  {
    gtk_calendar_set_show_heading(cast(GtkCalendar*)this._cPtr, value);
  }

  /**
      Sets whether week numbers are shown in the calendar.
  
      Params:
        value = whether to show week numbers on the left of the days
  */
  void setShowWeekNumbers(bool value)
  {
    gtk_calendar_set_show_week_numbers(cast(GtkCalendar*)this._cPtr, value);
  }

  /**
      Sets the year for the selected date.
      
      The new date must be valid. For example, setting 2023 for the year when then
      the date is 2024-02-29, fails.
  
      Params:
        year = The desired year for the selected date (within [glib.date_time.DateTime]
            limits, i.e. from 0001 to 9999).
  */
  void setYear(int year)
  {
    gtk_calendar_set_year(cast(GtkCalendar*)this._cPtr, year);
  }

  /**
      Removes the visual marker from a particular day.
  
      Params:
        day = the day number to unmark between 1 and 31.
  */
  void unmarkDay(uint day)
  {
    gtk_calendar_unmark_day(cast(GtkCalendar*)this._cPtr, day);
  }

  /**
      Connect to `DaySelected` signal.
  
      Emitted when the user selects a day.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.calendar.Calendar calendar))
  
          `calendar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDaySelected(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.calendar.Calendar)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("day-selected", closure, after);
  }

  /**
      Connect to `NextMonth` signal.
  
      Emitted when the user switched to the next month.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.calendar.Calendar calendar))
  
          `calendar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNextMonth(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.calendar.Calendar)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-month", closure, after);
  }

  /**
      Connect to `NextYear` signal.
  
      Emitted when user switched to the next year.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.calendar.Calendar calendar))
  
          `calendar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNextYear(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.calendar.Calendar)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-year", closure, after);
  }

  /**
      Connect to `PrevMonth` signal.
  
      Emitted when the user switched to the previous month.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.calendar.Calendar calendar))
  
          `calendar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPrevMonth(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.calendar.Calendar)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prev-month", closure, after);
  }

  /**
      Connect to `PrevYear` signal.
  
      Emitted when user switched to the previous year.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.calendar.Calendar calendar))
  
          `calendar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPrevYear(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.calendar.Calendar)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prev-year", closure, after);
  }
}
