/// Module for [KeyValuePartitioningOptions] class
module arrowdataset.key_value_partitioning_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class KeyValuePartitioningOptions : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_key_value_partitioning_options_get_type != &gidSymbolNotFound ? gadataset_key_value_partitioning_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override KeyValuePartitioningOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.key_value_partitioning_options.KeyValuePartitioningOptions]
      Returns: New builder object
  */
  static KeyValuePartitioningOptionsGidBuilder builder()
  {
    return new KeyValuePartitioningOptionsGidBuilder;
  }

  /**
      Get `segmentEncoding` property.
      Returns: After splitting a path into components, decode the path
        components before parsing according to this scheme.
  */
  @property arrowdataset.types.SegmentEncoding segmentEncoding()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.types.SegmentEncoding)("segment-encoding");
  }

  /**
      Set `segmentEncoding` property.
      Params:
        propval = After splitting a path into components, decode the path
          components before parsing according to this scheme.
  */
  @property void segmentEncoding(arrowdataset.types.SegmentEncoding propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrowdataset.types.SegmentEncoding)("segment-encoding", propval);
  }

  /** */
  this()
  {
    GADatasetKeyValuePartitioningOptions* _cretval;
    _cretval = gadataset_key_value_partitioning_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowdataset.key_value_partitioning_options.KeyValuePartitioningOptions]
class KeyValuePartitioningOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `segmentEncoding` property.
      Params:
        propval = After splitting a path into components, decode the path
          components before parsing according to this scheme.
      Returns: Builder instance for fluent chaining
  */
  T segmentEncoding(arrowdataset.types.SegmentEncoding propval)
  {
    return setProperty("segment-encoding", propval);
  }
}

/// Fluent builder for [arrowdataset.key_value_partitioning_options.KeyValuePartitioningOptions]
final class KeyValuePartitioningOptionsGidBuilder : KeyValuePartitioningOptionsGidBuilderImpl!KeyValuePartitioningOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  KeyValuePartitioningOptions build()
  {
    return new KeyValuePartitioningOptions(cast(void*)createGObject(KeyValuePartitioningOptions._getGType), Yes.Take);
  }
}
