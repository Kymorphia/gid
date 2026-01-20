/// Module for [KeyValuePartitioningOptions] class
module arrowdataset.key_value_partitioning_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
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
