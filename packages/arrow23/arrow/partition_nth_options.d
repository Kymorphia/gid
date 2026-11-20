/// Module for [PartitionNthOptions] class
module arrow.partition_nth_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PartitionNthOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_partition_nth_options_get_type != &gidSymbolNotFound ? garrow_partition_nth_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowPartitionNthOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override PartitionNthOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.partition_nth_options.PartitionNthOptions]
      Returns: New builder object
  */
  static PartitionNthOptionsGidBuilder builder() nothrow
  {
    return new PartitionNthOptionsGidBuilder;
  }

  /**
      Get `nullPlacement` property.
      Returns: Whether nulls and NaNs are partitioned at the start or at the end.
  */
  @property arrow.types.NullPlacement nullPlacement() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.NullPlacement)("null-placement");
  }

  /**
      Set `nullPlacement` property.
      Params:
        propval = Whether nulls and NaNs are partitioned at the start or at the end.
  */
  @property void nullPlacement(arrow.types.NullPlacement propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.NullPlacement)("null-placement", propval);
  }

  /**
      Get `pivot` property.
      Returns: The index into the equivalent sorted array of the partition pivot element.
  */
  @property long pivot() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("pivot");
  }

  /**
      Set `pivot` property.
      Params:
        propval = The index into the equivalent sorted array of the partition pivot element.
  */
  @property void pivot(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("pivot", propval);
  }

  /** */
  this() nothrow
  {
    GArrowPartitionNthOptions* _cretval;
    _cretval = garrow_partition_nth_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.partition_nth_options.PartitionNthOptions]
class PartitionNthOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `nullPlacement` property.
      Params:
        propval = Whether nulls and NaNs are partitioned at the start or at the end.
      Returns: Builder instance for fluent chaining
  */
  T nullPlacement(arrow.types.NullPlacement propval) nothrow
  {
    return setProperty("null-placement", propval);
  }

  /**
      Set `pivot` property.
      Params:
        propval = The index into the equivalent sorted array of the partition pivot element.
      Returns: Builder instance for fluent chaining
  */
  T pivot(long propval) nothrow
  {
    return setProperty("pivot", propval);
  }
}

/// Fluent builder for [arrow.partition_nth_options.PartitionNthOptions]
final class PartitionNthOptionsGidBuilder : PartitionNthOptionsGidBuilderImpl!PartitionNthOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PartitionNthOptions build() nothrow
  {
    return new PartitionNthOptions(cast(void*)createGObject(PartitionNthOptions._getGType), Yes.Take);
  }
}
