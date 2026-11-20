/// Module for [RoundBinaryOptions] class
module arrow.round_binary_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class RoundBinaryOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_round_binary_options_get_type != &gidSymbolNotFound ? garrow_round_binary_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowRoundBinaryOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override RoundBinaryOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.round_binary_options.RoundBinaryOptions]
      Returns: New builder object
  */
  static RoundBinaryOptionsGidBuilder builder() nothrow
  {
    return new RoundBinaryOptionsGidBuilder;
  }

  /**
      Get `mode` property.
      Returns: The rounding and tie-breaking mode.
  */
  @property arrow.types.RoundMode mode() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.RoundMode)("mode");
  }

  /**
      Set `mode` property.
      Params:
        propval = The rounding and tie-breaking mode.
  */
  @property void mode(arrow.types.RoundMode propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.RoundMode)("mode", propval);
  }

  /** */
  this() nothrow
  {
    GArrowRoundBinaryOptions* _cretval;
    _cretval = garrow_round_binary_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.round_binary_options.RoundBinaryOptions]
class RoundBinaryOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `mode` property.
      Params:
        propval = The rounding and tie-breaking mode.
      Returns: Builder instance for fluent chaining
  */
  T mode(arrow.types.RoundMode propval) nothrow
  {
    return setProperty("mode", propval);
  }
}

/// Fluent builder for [arrow.round_binary_options.RoundBinaryOptions]
final class RoundBinaryOptionsGidBuilder : RoundBinaryOptionsGidBuilderImpl!RoundBinaryOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RoundBinaryOptions build() nothrow
  {
    return new RoundBinaryOptions(cast(void*)createGObject(RoundBinaryOptions._getGType), Yes.Take);
  }
}
