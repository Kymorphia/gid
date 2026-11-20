/// Module for [RoundTemporalOptions] class
module arrow.round_temporal_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class RoundTemporalOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_round_temporal_options_get_type != &gidSymbolNotFound ? garrow_round_temporal_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowRoundTemporalOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override RoundTemporalOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.round_temporal_options.RoundTemporalOptions]
      Returns: New builder object
  */
  static RoundTemporalOptionsGidBuilder builder() nothrow
  {
    return new RoundTemporalOptionsGidBuilder;
  }

  /**
      Get `calendarBasedOrigin` property.
      Returns: By default time is rounded to a multiple of units since 1970-01-01T00:00:00.
        By setting calendar_based_origin to true, time will be rounded to a number
        of units since the last greater calendar unit.
  */
  @property bool calendarBasedOrigin() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("calendar-based-origin");
  }

  /**
      Set `calendarBasedOrigin` property.
      Params:
        propval = By default time is rounded to a multiple of units since 1970-01-01T00:00:00.
          By setting calendar_based_origin to true, time will be rounded to a number
          of units since the last greater calendar unit.
  */
  @property void calendarBasedOrigin(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("calendar-based-origin", propval);
  }

  /**
      Get `ceilIsStrictlyGreater` property.
      Returns: Enable this flag to return a rounded value that is strictly greater than the input.
        This applies for ceiling only.
  */
  @property bool ceilIsStrictlyGreater() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("ceil-is-strictly-greater");
  }

  /**
      Set `ceilIsStrictlyGreater` property.
      Params:
        propval = Enable this flag to return a rounded value that is strictly greater than the input.
          This applies for ceiling only.
  */
  @property void ceilIsStrictlyGreater(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ceil-is-strictly-greater", propval);
  }

  /**
      Get `multiple` property.
      Returns: Number of units to round to.
  */
  @property int multiple() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("multiple");
  }

  /**
      Set `multiple` property.
      Params:
        propval = Number of units to round to.
  */
  @property void multiple(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("multiple", propval);
  }

  /**
      Get `unit` property.
      Returns: The unit used for rounding of time.
  */
  @property arrow.types.CalendarUnit unit() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.CalendarUnit)("unit");
  }

  /**
      Set `unit` property.
      Params:
        propval = The unit used for rounding of time.
  */
  @property void unit(arrow.types.CalendarUnit propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.CalendarUnit)("unit", propval);
  }

  /**
      Get `weekStartsMonday` property.
      Returns: What day does the week start with (Monday=true, Sunday=false).
  */
  @property bool weekStartsMonday() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("week-starts-monday");
  }

  /**
      Set `weekStartsMonday` property.
      Params:
        propval = What day does the week start with (Monday=true, Sunday=false).
  */
  @property void weekStartsMonday(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("week-starts-monday", propval);
  }

  /** */
  this() nothrow
  {
    GArrowRoundTemporalOptions* _cretval;
    _cretval = garrow_round_temporal_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.round_temporal_options.RoundTemporalOptions]
class RoundTemporalOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `calendarBasedOrigin` property.
      Params:
        propval = By default time is rounded to a multiple of units since 1970-01-01T00:00:00.
          By setting calendar_based_origin to true, time will be rounded to a number
          of units since the last greater calendar unit.
      Returns: Builder instance for fluent chaining
  */
  T calendarBasedOrigin(bool propval) nothrow
  {
    return setProperty("calendar-based-origin", propval);
  }

  /**
      Set `ceilIsStrictlyGreater` property.
      Params:
        propval = Enable this flag to return a rounded value that is strictly greater than the input.
          This applies for ceiling only.
      Returns: Builder instance for fluent chaining
  */
  T ceilIsStrictlyGreater(bool propval) nothrow
  {
    return setProperty("ceil-is-strictly-greater", propval);
  }

  /**
      Set `multiple` property.
      Params:
        propval = Number of units to round to.
      Returns: Builder instance for fluent chaining
  */
  T multiple(int propval) nothrow
  {
    return setProperty("multiple", propval);
  }

  /**
      Set `unit` property.
      Params:
        propval = The unit used for rounding of time.
      Returns: Builder instance for fluent chaining
  */
  T unit(arrow.types.CalendarUnit propval) nothrow
  {
    return setProperty("unit", propval);
  }

  /**
      Set `weekStartsMonday` property.
      Params:
        propval = What day does the week start with (Monday=true, Sunday=false).
      Returns: Builder instance for fluent chaining
  */
  T weekStartsMonday(bool propval) nothrow
  {
    return setProperty("week-starts-monday", propval);
  }
}

/// Fluent builder for [arrow.round_temporal_options.RoundTemporalOptions]
final class RoundTemporalOptionsGidBuilder : RoundTemporalOptionsGidBuilderImpl!RoundTemporalOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RoundTemporalOptions build() nothrow
  {
    return new RoundTemporalOptions(cast(void*)createGObject(RoundTemporalOptions._getGType), Yes.Take);
  }
}
