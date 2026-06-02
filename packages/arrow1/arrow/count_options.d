/// Module for [CountOptions] class
module arrow.count_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class CountOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_count_options_get_type != &gidSymbolNotFound ? garrow_count_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CountOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.count_options.CountOptions]
      Returns: New builder object
  */
  static CountOptionsGidBuilder builder() nothrow
  {
    return new CountOptionsGidBuilder;
  }

  /** */
  @property arrow.types.CountMode mode() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.CountMode)("mode");
  }

  /** */
  @property void mode(arrow.types.CountMode propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.CountMode)("mode", propval);
  }

  /** */
  this() nothrow
  {
    GArrowCountOptions* _cretval;
    _cretval = garrow_count_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.count_options.CountOptions]
class CountOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /** */
  T mode(arrow.types.CountMode propval) nothrow
  {
    return setProperty("mode", propval);
  }
}

/// Fluent builder for [arrow.count_options.CountOptions]
final class CountOptionsGidBuilder : CountOptionsGidBuilderImpl!CountOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CountOptions build() nothrow
  {
    return new CountOptions(cast(void*)createGObject(CountOptions._getGType), Yes.Take);
  }
}
