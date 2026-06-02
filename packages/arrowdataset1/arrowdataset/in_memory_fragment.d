/// Module for [InMemoryFragment] class
module arrowdataset.in_memory_fragment;

public import gid.basictypes;
import arrow.record_batch;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.fragment;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;

/** */
class InMemoryFragment : arrowdataset.fragment.Fragment
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
    return cast(void function())gadataset_in_memory_fragment_get_type != &gidSymbolNotFound ? gadataset_in_memory_fragment_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InMemoryFragment self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.in_memory_fragment.InMemoryFragment]
      Returns: New builder object
  */
  static InMemoryFragmentGidBuilder builder() nothrow
  {
    return new InMemoryFragmentGidBuilder;
  }

  /** */
  this(arrow.schema.Schema schema, arrow.record_batch.RecordBatch[] recordBatches) nothrow
  {
    GADatasetInMemoryFragment* _cretval;
    size_t _nRecordBatches;
    if (recordBatches)
      _nRecordBatches = cast(size_t)recordBatches.length;

    GArrowRecordBatch*[] _tmprecordBatches;
    foreach (obj; recordBatches)
      _tmprecordBatches ~= obj ? cast(GArrowRecordBatch*)obj._cPtr : null;
    GArrowRecordBatch** _recordBatches = cast(GArrowRecordBatch**)_tmprecordBatches.ptr;

    _cretval = gadataset_in_memory_fragment_new(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _recordBatches, _nRecordBatches);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowdataset.in_memory_fragment.InMemoryFragment]
class InMemoryFragmentGidBuilderImpl(T) : arrowdataset.fragment.FragmentGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.in_memory_fragment.InMemoryFragment]
final class InMemoryFragmentGidBuilder : InMemoryFragmentGidBuilderImpl!InMemoryFragmentGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InMemoryFragment build() nothrow
  {
    return new InMemoryFragment(cast(void*)createGObject(InMemoryFragment._getGType), Yes.Take);
  }
}
