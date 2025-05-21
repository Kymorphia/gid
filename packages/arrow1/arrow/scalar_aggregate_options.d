/// Module for [ScalarAggregateOptions] class
module arrow.scalar_aggregate_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ScalarAggregateOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_scalar_aggregate_options_get_type != &gidSymbolNotFound ? garrow_scalar_aggregate_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScalarAggregateOptions self()
  {
    return this;
  }

  /**
      Get `minCount` property.
      Returns: The minimum required number of values.
  */
  @property uint minCount()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("min-count");
  }

  /**
      Set `minCount` property.
      Params:
        propval = The minimum required number of values.
  */
  @property void minCount(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("min-count", propval);
  }

  /**
      Get `skipNulls` property.
      Returns: Whether NULLs are skipped or not.
  */
  @property bool skipNulls()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("skip-nulls");
  }

  /**
      Set `skipNulls` property.
      Params:
        propval = Whether NULLs are skipped or not.
  */
  @property void skipNulls(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("skip-nulls", propval);
  }

  /** */
  this()
  {
    GArrowScalarAggregateOptions* _cretval;
    _cretval = garrow_scalar_aggregate_options_new();
    this(_cretval, Yes.Take);
  }
}
