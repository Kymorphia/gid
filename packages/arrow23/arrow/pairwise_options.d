/// Module for [PairwiseOptions] class
module arrow.pairwise_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PairwiseOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_pairwise_options_get_type != &gidSymbolNotFound ? garrow_pairwise_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowPairwiseOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override PairwiseOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.pairwise_options.PairwiseOptions]
      Returns: New builder object
  */
  static PairwiseOptionsGidBuilder builder() nothrow
  {
    return new PairwiseOptionsGidBuilder;
  }

  /**
      Get `periods` property.
      Returns: Periods to shift for applying the binary operation, accepts negative values.
  */
  @property long periods() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("periods");
  }

  /**
      Set `periods` property.
      Params:
        propval = Periods to shift for applying the binary operation, accepts negative values.
  */
  @property void periods(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("periods", propval);
  }

  /** */
  this() nothrow
  {
    GArrowPairwiseOptions* _cretval;
    _cretval = garrow_pairwise_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.pairwise_options.PairwiseOptions]
class PairwiseOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `periods` property.
      Params:
        propval = Periods to shift for applying the binary operation, accepts negative values.
      Returns: Builder instance for fluent chaining
  */
  T periods(long propval) nothrow
  {
    return setProperty("periods", propval);
  }
}

/// Fluent builder for [arrow.pairwise_options.PairwiseOptions]
final class PairwiseOptionsGidBuilder : PairwiseOptionsGidBuilderImpl!PairwiseOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PairwiseOptions build() nothrow
  {
    return new PairwiseOptions(cast(void*)createGObject(PairwiseOptions._getGType), Yes.Take);
  }
}
