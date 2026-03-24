/// Module for [ListScalar] class
module arrow.list_scalar;

import arrow.base_list_scalar;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class ListScalar : arrow.base_list_scalar.BaseListScalar
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
    return cast(void function())garrow_list_scalar_get_type != &gidSymbolNotFound ? garrow_list_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.list_scalar.ListScalar]
  Returns: New builder object
  */
  static ListScalarGidBuilder builder()
  {
    return new ListScalarGidBuilder;
  }

  /** */
  this(arrow.list_array.ListArray value)
  {
    GArrowListScalar* _cretval;
    _cretval = garrow_list_scalar_new(value ? cast(GArrowListArray*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class ListScalarGidBuilderImpl(T) : arrow.base_list_scalar.BaseListScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.list_scalar.ListScalar]
final class ListScalarGidBuilder : ListScalarGidBuilderImpl!ListScalarGidBuilder
{
  ListScalar build()
  {
    return new ListScalar(cast(void*)createGObject(ListScalar._getGType), Yes.Take);
  }
}
