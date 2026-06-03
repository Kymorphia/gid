/// Module for [Partitioning] class
module arrowdataset.partitioning;

public import gid.basictypes;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Partitioning : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_partitioning_get_type != &gidSymbolNotFound ? gadataset_partitioning_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Partitioning self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.partitioning.Partitioning]
      Returns: New builder object
  */
  static PartitioningGidBuilder builder() nothrow
  {
    return new PartitioningGidBuilder;
  }

  /** */
  static arrowdataset.partitioning.Partitioning createDefault() nothrow
  {
    GADatasetPartitioning* _cretval;
    _cretval = gadataset_partitioning_create_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.partitioning.Partitioning)(cast(GADatasetPartitioning*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getTypeName() nothrow
  {
    char* _cretval;
    _cretval = gadataset_partitioning_get_type_name(cast(GADatasetPartitioning*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowdataset.partitioning.Partitioning]
class PartitioningGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T partitioning(void* propval) nothrow
  {
    return setProperty("partitioning", propval);
  }
}

/// Fluent builder for [arrowdataset.partitioning.Partitioning]
final class PartitioningGidBuilder : PartitioningGidBuilderImpl!PartitioningGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Partitioning build() nothrow
  {
    return new Partitioning(cast(void*)createGObject(Partitioning._getGType), No.Take);
  }
}
