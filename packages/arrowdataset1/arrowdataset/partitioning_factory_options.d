/// Module for [PartitioningFactoryOptions] class
module arrowdataset.partitioning_factory_options;

public import gid.basictypes;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PartitioningFactoryOptions : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_partitioning_factory_options_get_type != &gidSymbolNotFound ? gadataset_partitioning_factory_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PartitioningFactoryOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.partitioning_factory_options.PartitioningFactoryOptions]
      Returns: New builder object
  */
  static PartitioningFactoryOptionsGidBuilder builder() nothrow
  {
    return new PartitioningFactoryOptionsGidBuilder;
  }

  /**
      Get `inferDictionary` property.
      Returns: When inferring a schema for partition fields, yield dictionary
        encoded types instead of plain. This can be more efficient when
        materializing virtual columns, and Expressions parsed by the
        finished Partitioning will include dictionaries of all unique
        inspected values for each field.
  */
  @property bool inferDictionary() nothrow
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
  @property void inferDictionary(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("infer-dictionary", propval);
  }

  /**
      Get `schema` property.
      Returns: Optionally, an expected schema can be provided, in which case
        inference will only check discovered fields against the schema
        and update internal state (such as dictionaries).
  */
  @property arrow.schema.Schema schema() nothrow
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
  @property void schema(arrow.schema.Schema propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.schema.Schema)("schema", propval);
  }

  /**
      Get `segmentEncoding` property.
      Returns: After splitting a path into components, decode the path
        components before parsing according to this scheme.
  */
  @property arrowdataset.types.SegmentEncoding segmentEncoding() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.types.SegmentEncoding)("segment-encoding");
  }

  /**
      Set `segmentEncoding` property.
      Params:
        propval = After splitting a path into components, decode the path
          components before parsing according to this scheme.
  */
  @property void segmentEncoding(arrowdataset.types.SegmentEncoding propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrowdataset.types.SegmentEncoding)("segment-encoding", propval);
  }

  /** */
  this() nothrow
  {
    GADatasetPartitioningFactoryOptions* _cretval;
    _cretval = gadataset_partitioning_factory_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowdataset.partitioning_factory_options.PartitioningFactoryOptions]
class PartitioningFactoryOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `inferDictionary` property.
      Params:
        propval = When inferring a schema for partition fields, yield dictionary
          encoded types instead of plain. This can be more efficient when
          materializing virtual columns, and Expressions parsed by the
          finished Partitioning will include dictionaries of all unique
          inspected values for each field.
      Returns: Builder instance for fluent chaining
  */
  T inferDictionary(bool propval) nothrow
  {
    return setProperty("infer-dictionary", propval);
  }

  /**
      Set `schema` property.
      Params:
        propval = Optionally, an expected schema can be provided, in which case
          inference will only check discovered fields against the schema
          and update internal state (such as dictionaries).
      Returns: Builder instance for fluent chaining
  */
  T schema(arrow.schema.Schema propval) nothrow
  {
    return setProperty("schema", propval);
  }

  /**
      Set `segmentEncoding` property.
      Params:
        propval = After splitting a path into components, decode the path
          components before parsing according to this scheme.
      Returns: Builder instance for fluent chaining
  */
  T segmentEncoding(arrowdataset.types.SegmentEncoding propval) nothrow
  {
    return setProperty("segment-encoding", propval);
  }
}

/// Fluent builder for [arrowdataset.partitioning_factory_options.PartitioningFactoryOptions]
final class PartitioningFactoryOptionsGidBuilder : PartitioningFactoryOptionsGidBuilderImpl!PartitioningFactoryOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PartitioningFactoryOptions build() nothrow
  {
    return new PartitioningFactoryOptions(cast(void*)createGObject(PartitioningFactoryOptions._getGType), Yes.Take);
  }
}
