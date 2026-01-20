/// Module for [RoundToMultipleOptions] class
module arrow.round_to_multiple_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class RoundToMultipleOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_round_to_multiple_options_get_type != &gidSymbolNotFound ? garrow_round_to_multiple_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RoundToMultipleOptions self()
  {
    return this;
  }

  /**
      Get `mode` property.
      Returns: The rounding and tie-breaking mode.
  */
  @property arrow.types.RoundMode mode()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.RoundMode)("mode");
  }

  /**
      Set `mode` property.
      Params:
        propval = The rounding and tie-breaking mode.
  */
  @property void mode(arrow.types.RoundMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.RoundMode)("mode", propval);
  }

  /**
      Get `multiple` property.
      Returns: The rounding scale (multiple to round to).
        
        Should be a scalar of a type compatible with the argument to be rounded.
        For example, rounding a decimal value means a decimal multiple is
        required. Rounding a floating point or integer value means a floating
        point scalar is required.
  */
  @property arrow.scalar.Scalar multiple()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.scalar.Scalar)("multiple");
  }

  /**
      Set `multiple` property.
      Params:
        propval = The rounding scale (multiple to round to).
          
          Should be a scalar of a type compatible with the argument to be rounded.
          For example, rounding a decimal value means a decimal multiple is
          required. Rounding a floating point or integer value means a floating
          point scalar is required.
  */
  @property void multiple(arrow.scalar.Scalar propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.scalar.Scalar)("multiple", propval);
  }

  /** */
  this()
  {
    GArrowRoundToMultipleOptions* _cretval;
    _cretval = garrow_round_to_multiple_options_new();
    this(_cretval, Yes.Take);
  }
}
