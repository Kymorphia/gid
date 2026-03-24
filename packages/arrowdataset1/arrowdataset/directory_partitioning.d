/// Module for [DirectoryPartitioning] class
module arrowdataset.directory_partitioning;

import arrow.array;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.key_value_partitioning;
import arrowdataset.key_value_partitioning_options;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class DirectoryPartitioning : arrowdataset.key_value_partitioning.KeyValuePartitioning
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
    return cast(void function())gadataset_directory_partitioning_get_type != &gidSymbolNotFound ? gadataset_directory_partitioning_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DirectoryPartitioning self()
  {
    return this;
  }

  /**
  Get builder for [arrowdataset.directory_partitioning.DirectoryPartitioning]
  Returns: New builder object
  */
  static DirectoryPartitioningGidBuilder builder()
  {
    return new DirectoryPartitioningGidBuilder;
  }

  /** */
  this(arrow.schema.Schema schema, arrow.array.Array[] dictionaries = null, arrowdataset.key_value_partitioning_options.KeyValuePartitioningOptions options = null)
  {
    GADatasetDirectoryPartitioning* _cretval;
    auto _dictionaries = gListFromD!(arrow.array.Array)(dictionaries);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_dictionaries);
    GError *_err;
    _cretval = gadataset_directory_partitioning_new(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _dictionaries, options ? cast(GADatasetKeyValuePartitioningOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

class DirectoryPartitioningGidBuilderImpl(T) : arrowdataset.key_value_partitioning.KeyValuePartitioningGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.directory_partitioning.DirectoryPartitioning]
final class DirectoryPartitioningGidBuilder : DirectoryPartitioningGidBuilderImpl!DirectoryPartitioningGidBuilder
{
  DirectoryPartitioning build()
  {
    return new DirectoryPartitioning(cast(void*)createGObject(DirectoryPartitioning._getGType), Yes.Take);
  }
}
