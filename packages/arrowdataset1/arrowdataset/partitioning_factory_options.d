/// Module for [PartitioningFactoryOptions] class
module arrowdataset.partitioning_factory_options;

import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.object;

/** */
class PartitioningFactoryOptions : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_partitioning_factory_options_get_type != &gidSymbolNotFound ? gadataset_partitioning_factory_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PartitioningFactoryOptions self()
  {
    return this;
  }

  /**
      Get `inferDictionary` property.
      Returns: When inferring a schema for partition fields, yield dictionary
        encoded types instead of plain. This can be more efficient when
        materializing virtual columns, and Expressions parsed by the
        finished Partitioning will include dictionaries of all unique
        inspected values for each field.
  */
  @property bool inferDictionary()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("infer-dictionary");
  }

  /**
      Set `inferDictionary` property.
      Params:
        propval = When inferring a schema for partition fields, yield dictionary
          encoded types instead of plain. This can be more efficient when
          materializing virtual columns, and Expressions parsed by the
          finished Partitioning will include dictionaries of all unique
          inspected values for each field.
  */
  @property void inferDictionary(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("infer-dictionary", propval);
  }

  /**
      Get `schema` property.
      Returns: Optionally, an expected schema can be provided, in which case
        inference will only check discovered fields against the schema
        and update internal state (such as dictionaries).
  */
  @property arrow.schema.Schema schema()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.schema.Schema)("schema");
  }

  /**
      Set `schema` property.
      Params:
        propval = Optionally, an expected schema can be provided, in which case
          inference will only check discovered fields against the schema
          and update internal state (such as dictionaries).
  */
  @property void schema(arrow.schema.Schema propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.schema.Schema)("schema", propval);
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
    GADatasetPartitioningFactoryOptions* _cretval;
    _cretval = gadataset_partitioning_factory_options_new();
    this(_cretval, Yes.Take);
  }
}
