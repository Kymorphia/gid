/// Module for [DayOfWeekOptions] class
module arrow.day_of_week_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DayOfWeekOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_day_of_week_options_get_type != &gidSymbolNotFound ? garrow_day_of_week_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowDayOfWeekOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override DayOfWeekOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.day_of_week_options.DayOfWeekOptions]
      Returns: New builder object
  */
  static DayOfWeekOptionsGidBuilder builder() nothrow
  {
    return new DayOfWeekOptionsGidBuilder;
  }

  /**
      Get `countFromZero` property.
      Returns: Number days from 0 if true and from 1 if false.
  */
  @property bool countFromZero() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("count-from-zero");
  }

  /**
      Set `countFromZero` property.
      Params:
        propval = Number days from 0 if true and from 1 if false.
  */
  @property void countFromZero(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("count-from-zero", propval);
  }

  /**
      Get `weekStart` property.
      Returns: What day does the week start with (Monday=1, Sunday=7).
        The numbering is unaffected by the count_from_zero parameter.
  */
  @property uint weekStart() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("week-start");
  }

  /**
      Set `weekStart` property.
      Params:
        propval = What day does the week start with (Monday=1, Sunday=7).
          The numbering is unaffected by the count_from_zero parameter.
  */
  @property void weekStart(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("week-start", propval);
  }

  /** */
  this() nothrow
  {
    GArrowDayOfWeekOptions* _cretval;
    _cretval = garrow_day_of_week_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.day_of_week_options.DayOfWeekOptions]
class DayOfWeekOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `countFromZero` property.
      Params:
        propval = Number days from 0 if true and from 1 if false.
      Returns: Builder instance for fluent chaining
  */
  T countFromZero(bool propval) nothrow
  {
    return setProperty("count-from-zero", propval);
  }

  /**
      Set `weekStart` property.
      Params:
        propval = What day does the week start with (Monday=1, Sunday=7).
          The numbering is unaffected by the count_from_zero parameter.
      Returns: Builder instance for fluent chaining
  */
  T weekStart(uint propval) nothrow
  {
    return setProperty("week-start", propval);
  }
}

/// Fluent builder for [arrow.day_of_week_options.DayOfWeekOptions]
final class DayOfWeekOptionsGidBuilder : DayOfWeekOptionsGidBuilderImpl!DayOfWeekOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DayOfWeekOptions build() nothrow
  {
    return new DayOfWeekOptions(cast(void*)createGObject(DayOfWeekOptions._getGType), Yes.Take);
  }
}
