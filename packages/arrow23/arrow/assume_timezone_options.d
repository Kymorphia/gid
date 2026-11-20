/// Module for [AssumeTimezoneOptions] class
module arrow.assume_timezone_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class AssumeTimezoneOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_assume_timezone_options_get_type != &gidSymbolNotFound ? garrow_assume_timezone_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowAssumeTimezoneOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override AssumeTimezoneOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.assume_timezone_options.AssumeTimezoneOptions]
      Returns: New builder object
  */
  static AssumeTimezoneOptionsGidBuilder builder() nothrow
  {
    return new AssumeTimezoneOptionsGidBuilder;
  }

  /**
      Get `ambiguous` property.
      Returns: How to interpret ambiguous local times (due to DST shifts).
  */
  @property arrow.types.AssumeTimezoneAmbiguous ambiguous() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.AssumeTimezoneAmbiguous)("ambiguous");
  }

  /**
      Set `ambiguous` property.
      Params:
        propval = How to interpret ambiguous local times (due to DST shifts).
  */
  @property void ambiguous(arrow.types.AssumeTimezoneAmbiguous propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.AssumeTimezoneAmbiguous)("ambiguous", propval);
  }

  /**
      Get `nonexistent` property.
      Returns: How to interpret nonexistent local times (due to DST shifts).
  */
  @property arrow.types.AssumeTimezoneNonexistent nonexistent() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.AssumeTimezoneNonexistent)("nonexistent");
  }

  /**
      Set `nonexistent` property.
      Params:
        propval = How to interpret nonexistent local times (due to DST shifts).
  */
  @property void nonexistent(arrow.types.AssumeTimezoneNonexistent propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.AssumeTimezoneNonexistent)("nonexistent", propval);
  }

  /**
      Get `timezone` property.
      Returns: Timezone to convert timestamps from.
  */
  @property string timezone() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("timezone");
  }

  /**
      Set `timezone` property.
      Params:
        propval = Timezone to convert timestamps from.
  */
  @property void timezone(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("timezone", propval);
  }

  /** */
  this() nothrow
  {
    GArrowAssumeTimezoneOptions* _cretval;
    _cretval = garrow_assume_timezone_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.assume_timezone_options.AssumeTimezoneOptions]
class AssumeTimezoneOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `ambiguous` property.
      Params:
        propval = How to interpret ambiguous local times (due to DST shifts).
      Returns: Builder instance for fluent chaining
  */
  T ambiguous(arrow.types.AssumeTimezoneAmbiguous propval) nothrow
  {
    return setProperty("ambiguous", propval);
  }

  /**
      Set `nonexistent` property.
      Params:
        propval = How to interpret nonexistent local times (due to DST shifts).
      Returns: Builder instance for fluent chaining
  */
  T nonexistent(arrow.types.AssumeTimezoneNonexistent propval) nothrow
  {
    return setProperty("nonexistent", propval);
  }

  /**
      Set `timezone` property.
      Params:
        propval = Timezone to convert timestamps from.
      Returns: Builder instance for fluent chaining
  */
  T timezone(string propval) nothrow
  {
    return setProperty("timezone", propval);
  }
}

/// Fluent builder for [arrow.assume_timezone_options.AssumeTimezoneOptions]
final class AssumeTimezoneOptionsGidBuilder : AssumeTimezoneOptionsGidBuilderImpl!AssumeTimezoneOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AssumeTimezoneOptions build() nothrow
  {
    return new AssumeTimezoneOptions(cast(void*)createGObject(AssumeTimezoneOptions._getGType), Yes.Take);
  }
}
