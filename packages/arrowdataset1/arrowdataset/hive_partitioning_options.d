/// Module for [HivePartitioningOptions] class
module arrowdataset.hive_partitioning_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.key_value_partitioning_options;
import arrowdataset.types;
import gid.gid;
import gobject.object;

/** */
class HivePartitioningOptions : arrowdataset.key_value_partitioning_options.KeyValuePartitioningOptions
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
    return cast(void function())gadataset_hive_partitioning_options_get_type != &gidSymbolNotFound ? gadataset_hive_partitioning_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HivePartitioningOptions self()
  {
    return this;
  }

  /**
      Get `nullFallback` property.
      Returns: The fallback string for null. This is used only by
        #GADatasetHivePartitioning.
  */
  @property string nullFallback()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("null-fallback");
  }

  /**
      Set `nullFallback` property.
      Params:
        propval = The fallback string for null. This is used only by
          #GADatasetHivePartitioning.
  */
  @property void nullFallback(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("null-fallback", propval);
  }

  /** */
  this()
  {
    GADatasetHivePartitioningOptions* _cretval;
    _cretval = gadataset_hive_partitioning_options_new();
    this(_cretval, Yes.Take);
  }
}
