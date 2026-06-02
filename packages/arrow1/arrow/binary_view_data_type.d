/// Module for [BinaryViewDataType] class
module arrow.binary_view_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class BinaryViewDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_binary_view_data_type_get_type != &gidSymbolNotFound ? garrow_binary_view_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryViewDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.binary_view_data_type.BinaryViewDataType]
      Returns: New builder object
  */
  static BinaryViewDataTypeGidBuilder builder() nothrow
  {
    return new BinaryViewDataTypeGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowBinaryViewDataType* _cretval;
    _cretval = garrow_binary_view_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.binary_view_data_type.BinaryViewDataType]
class BinaryViewDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.binary_view_data_type.BinaryViewDataType]
final class BinaryViewDataTypeGidBuilder : BinaryViewDataTypeGidBuilderImpl!BinaryViewDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinaryViewDataType build() nothrow
  {
    return new BinaryViewDataType(cast(void*)createGObject(BinaryViewDataType._getGType), Yes.Take);
  }
}
