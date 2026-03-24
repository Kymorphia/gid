/// Module for [Date64Scalar] class
module arrow.date64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Date64Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_date64_scalar_get_type != &gidSymbolNotFound ? garrow_date64_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date64Scalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.date64_scalar.Date64Scalar]
  Returns: New builder object
  */
  static Date64ScalarGidBuilder builder()
  {
    return new Date64ScalarGidBuilder;
  }

  /** */
  this(long value)
  {
    GArrowDate64Scalar* _cretval;
    _cretval = garrow_date64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue()
  {
    long _retval;
    _retval = garrow_date64_scalar_get_value(cast(GArrowDate64Scalar*)this._cPtr);
    return _retval;
  }
}

class Date64ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date64_scalar.Date64Scalar]
final class Date64ScalarGidBuilder : Date64ScalarGidBuilderImpl!Date64ScalarGidBuilder
{
  Date64Scalar build()
  {
    return new Date64Scalar(cast(void*)createGObject(Date64Scalar._getGType), Yes.Take);
  }
}
