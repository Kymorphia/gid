/// Module for [SparseUnionArrayBuilder] class
module arrow.sparse_union_array_builder;

import arrow.c.functions;
import arrow.c.types;
import arrow.sparse_union_data_type;
import arrow.types;
import arrow.union_array_builder;
import gid.gid;
import glib.error;

/** */
class SparseUnionArrayBuilder : arrow.union_array_builder.UnionArrayBuilder
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
    return cast(void function())garrow_sparse_union_array_builder_get_type != &gidSymbolNotFound ? garrow_sparse_union_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SparseUnionArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.sparse_union_data_type.SparseUnionDataType dataType = null)
  {
    GArrowSparseUnionArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_sparse_union_array_builder_new(dataType ? cast(GArrowSparseUnionDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}
