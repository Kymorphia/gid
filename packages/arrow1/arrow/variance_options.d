/// Module for [VarianceOptions] class
module arrow.variance_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class VarianceOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_variance_options_get_type != &gidSymbolNotFound ? garrow_variance_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VarianceOptions self()
  {
    return this;
  }

  /**
      Get `ddof` property.
      Returns: The Delta Degrees of Freedom (ddof) to be used.
  */
  @property int ddof()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("ddof");
  }

  /**
      Set `ddof` property.
      Params:
        propval = The Delta Degrees of Freedom (ddof) to be used.
  */
  @property void ddof(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("ddof", propval);
  }

  /**
      Get `minCount` property.
      Returns: If less than this many non-null values are observed, emit null.
  */
  @property uint minCount()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("min-count");
  }

  /**
      Set `minCount` property.
      Params:
        propval = If less than this many non-null values are observed, emit null.
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
    GArrowVarianceOptions* _cretval;
    _cretval = garrow_variance_options_new();
    this(_cretval, Yes.Take);
  }
}
