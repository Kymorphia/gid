/// Module for [DenseUnionArrayBuilder] class
module arrow.dense_union_array_builder;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.dense_union_data_type;
import arrow.types;
import arrow.union_array_builder;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class DenseUnionArrayBuilder : arrow.union_array_builder.UnionArrayBuilder
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dense_union_array_builder_get_type != &gidSymbolNotFound ? garrow_dense_union_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DenseUnionArrayBuilder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.dense_union_array_builder.DenseUnionArrayBuilder]
      Returns: New builder object
  */
  static DenseUnionArrayBuilderGidBuilder builder() nothrow
  {
    return new DenseUnionArrayBuilderGidBuilder;
  }

  /** */
  this(arrow.dense_union_data_type.DenseUnionDataType dataType = null)
  {
    GArrowDenseUnionArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_dense_union_array_builder_new(dataType ? cast(GArrowDenseUnionDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.dense_union_array_builder.DenseUnionArrayBuilder]
class DenseUnionArrayBuilderGidBuilderImpl(T) : arrow.union_array_builder.UnionArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.dense_union_array_builder.DenseUnionArrayBuilder]
final class DenseUnionArrayBuilderGidBuilder : DenseUnionArrayBuilderGidBuilderImpl!DenseUnionArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DenseUnionArrayBuilder build() nothrow
  {
    return new DenseUnionArrayBuilder(cast(void*)createGObject(DenseUnionArrayBuilder._getGType), Yes.Take);
  }
}
