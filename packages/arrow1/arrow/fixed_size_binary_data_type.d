/// Module for [FixedSizeBinaryDataType] class
module arrow.fixed_size_binary_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class FixedSizeBinaryDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_fixed_size_binary_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType]
      Returns: New builder object
  */
  static FixedSizeBinaryDataTypeGidBuilder builder() nothrow
  {
    return new FixedSizeBinaryDataTypeGidBuilder;
  }

  /** */
  this(int byteWidth) nothrow
  {
    GArrowFixedSizeBinaryDataType* _cretval;
    _cretval = garrow_fixed_size_binary_data_type_new(byteWidth);
    this(_cretval, Yes.Take);
  }

  /** */
  int getByteWidth() nothrow
  {
    int _retval;
    _retval = garrow_fixed_size_binary_data_type_get_byte_width(cast(GArrowFixedSizeBinaryDataType*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType]
class FixedSizeBinaryDataTypeGidBuilderImpl(T) : arrow.fixed_width_data_type.FixedWidthDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType]
final class FixedSizeBinaryDataTypeGidBuilder : FixedSizeBinaryDataTypeGidBuilderImpl!FixedSizeBinaryDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeBinaryDataType build() nothrow
  {
    return new FixedSizeBinaryDataType(cast(void*)createGObject(FixedSizeBinaryDataType._getGType), Yes.Take);
  }
}
