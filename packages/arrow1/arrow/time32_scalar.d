/// Module for [Time32Scalar] class
module arrow.time32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.time32_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Time32Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_time32_scalar_get_type != &gidSymbolNotFound ? garrow_time32_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time32Scalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.time32_scalar.Time32Scalar]
  Returns: New builder object
  */
  static Time32ScalarGidBuilder builder()
  {
    return new Time32ScalarGidBuilder;
  }

  /** */
  this(arrow.time32_data_type.Time32DataType dataType, int value)
  {
    GArrowTime32Scalar* _cretval;
    _cretval = garrow_time32_scalar_new(dataType ? cast(GArrowTime32DataType*)dataType._cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue()
  {
    int _retval;
    _retval = garrow_time32_scalar_get_value(cast(GArrowTime32Scalar*)this._cPtr);
    return _retval;
  }
}

class Time32ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.time32_scalar.Time32Scalar]
final class Time32ScalarGidBuilder : Time32ScalarGidBuilderImpl!Time32ScalarGidBuilder
{
  Time32Scalar build()
  {
    return new Time32Scalar(cast(void*)createGObject(Time32Scalar._getGType), Yes.Take);
  }
}
