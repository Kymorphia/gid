/// Module for [HivePartitioning] class
module arrowdataset.hive_partitioning;

import arrow.array;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.hive_partitioning_options;
import arrowdataset.key_value_partitioning;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class HivePartitioning : arrowdataset.key_value_partitioning.KeyValuePartitioning
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
    return cast(void function())gadataset_hive_partitioning_get_type != &gidSymbolNotFound ? gadataset_hive_partitioning_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HivePartitioning self()
  {
    return this;
  }

  /**
  Get builder for [arrowdataset.hive_partitioning.HivePartitioning]
  Returns: New builder object
  */
  static HivePartitioningGidBuilder builder()
  {
    return new HivePartitioningGidBuilder;
  }

  /** */
  this(arrow.schema.Schema schema, arrow.array.Array[] dictionaries = null, arrowdataset.hive_partitioning_options.HivePartitioningOptions options = null)
  {
    GADatasetHivePartitioning* _cretval;
    auto _dictionaries = gListFromD!(arrow.array.Array)(dictionaries);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_dictionaries);
    GError *_err;
    _cretval = gadataset_hive_partitioning_new(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _dictionaries, options ? cast(GADatasetHivePartitioningOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  string getNullFallback()
  {
    char* _cretval;
    _cretval = gadataset_hive_partitioning_get_null_fallback(cast(GADatasetHivePartitioning*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

class HivePartitioningGidBuilderImpl(T) : arrowdataset.key_value_partitioning.KeyValuePartitioningGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.hive_partitioning.HivePartitioning]
final class HivePartitioningGidBuilder : HivePartitioningGidBuilderImpl!HivePartitioningGidBuilder
{
  HivePartitioning build()
  {
    return new HivePartitioning(cast(void*)createGObject(HivePartitioning._getGType), Yes.Take);
  }
}
