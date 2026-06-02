/// Module for [KeyValuePartitioning] class
module arrowdataset.key_value_partitioning;

public import gid.basictypes;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.partitioning;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;

/** */
class KeyValuePartitioning : arrowdataset.partitioning.Partitioning
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
    return cast(void function())gadataset_key_value_partitioning_get_type != &gidSymbolNotFound ? gadataset_key_value_partitioning_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override KeyValuePartitioning self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.key_value_partitioning.KeyValuePartitioning]
      Returns: New builder object
  */
  static KeyValuePartitioningGidBuilder builder() nothrow
  {
    return new KeyValuePartitioningGidBuilder;
  }
}

/// Fluent builder implementation template for [arrowdataset.key_value_partitioning.KeyValuePartitioning]
class KeyValuePartitioningGidBuilderImpl(T) : arrowdataset.partitioning.PartitioningGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.key_value_partitioning.KeyValuePartitioning]
final class KeyValuePartitioningGidBuilder : KeyValuePartitioningGidBuilderImpl!KeyValuePartitioningGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  KeyValuePartitioning build() nothrow
  {
    return new KeyValuePartitioning(cast(void*)createGObject(KeyValuePartitioning._getGType), No.Take);
  }
}
