/// Module for [BinaryDataType] class
module arrow.binary_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class BinaryDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_binary_data_type_get_type != &gidSymbolNotFound ? garrow_binary_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.binary_data_type.BinaryDataType]
      Returns: New builder object
  */
  static BinaryDataTypeGidBuilder builder() nothrow
  {
    return new BinaryDataTypeGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowBinaryDataType* _cretval;
    _cretval = garrow_binary_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.binary_data_type.BinaryDataType]
class BinaryDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.binary_data_type.BinaryDataType]
final class BinaryDataTypeGidBuilder : BinaryDataTypeGidBuilderImpl!BinaryDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinaryDataType build() nothrow
  {
    return new BinaryDataType(cast(void*)createGObject(BinaryDataType._getGType), Yes.Take);
  }
}
