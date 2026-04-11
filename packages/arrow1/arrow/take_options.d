/// Module for [TakeOptions] class
module arrow.take_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class TakeOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_take_options_get_type != &gidSymbolNotFound ? garrow_take_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TakeOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.take_options.TakeOptions]
      Returns: New builder object
  */
  static TakeOptionsGidBuilder builder()
  {
    return new TakeOptionsGidBuilder;
  }

  /** */
  this()
  {
    GArrowTakeOptions* _cretval;
    _cretval = garrow_take_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.take_options.TakeOptions]
class TakeOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.take_options.TakeOptions]
final class TakeOptionsGidBuilder : TakeOptionsGidBuilderImpl!TakeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TakeOptions build()
  {
    return new TakeOptions(cast(void*)createGObject(TakeOptions._getGType), Yes.Take);
  }
}
