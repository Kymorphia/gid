/// Module for [StringScalar] class
module arrow.string_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class StringScalar : arrow.base_binary_scalar.BaseBinaryScalar
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
    return cast(void function())garrow_string_scalar_get_type != &gidSymbolNotFound ? garrow_string_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.string_scalar.StringScalar]
      Returns: New builder object
  */
  static StringScalarGidBuilder builder()
  {
    return new StringScalarGidBuilder;
  }

  /** */
  this(arrow.buffer.Buffer value)
  {
    GArrowStringScalar* _cretval;
    _cretval = garrow_string_scalar_new(value ? cast(GArrowBuffer*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.string_scalar.StringScalar]
class StringScalarGidBuilderImpl(T) : arrow.base_binary_scalar.BaseBinaryScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.string_scalar.StringScalar]
final class StringScalarGidBuilder : StringScalarGidBuilderImpl!StringScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StringScalar build()
  {
    return new StringScalar(cast(void*)createGObject(StringScalar._getGType), Yes.Take);
  }
}
