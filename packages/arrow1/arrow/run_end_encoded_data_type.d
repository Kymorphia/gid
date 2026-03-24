/// Module for [RunEndEncodedDataType] class
module arrow.run_end_encoded_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class RunEndEncodedDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_run_end_encoded_data_type_get_type != &gidSymbolNotFound ? garrow_run_end_encoded_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RunEndEncodedDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.run_end_encoded_data_type.RunEndEncodedDataType]
  Returns: New builder object
  */
  static RunEndEncodedDataTypeGidBuilder builder()
  {
    return new RunEndEncodedDataTypeGidBuilder;
  }

  /** */
  this(arrow.data_type.DataType runEndDataType, arrow.data_type.DataType valueDataType)
  {
    GArrowRunEndEncodedDataType* _cretval;
    _cretval = garrow_run_end_encoded_data_type_new(runEndDataType ? cast(GArrowDataType*)runEndDataType._cPtr(No.Dup) : null, valueDataType ? cast(GArrowDataType*)valueDataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.data_type.DataType getRunEndDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_run_end_encoded_data_type_get_run_end_data_type(cast(GArrowRunEndEncodedDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_run_end_encoded_data_type_get_value_data_type(cast(GArrowRunEndEncodedDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }
}

class RunEndEncodedDataTypeGidBuilderImpl(T) : arrow.fixed_width_data_type.FixedWidthDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.run_end_encoded_data_type.RunEndEncodedDataType]
final class RunEndEncodedDataTypeGidBuilder : RunEndEncodedDataTypeGidBuilderImpl!RunEndEncodedDataTypeGidBuilder
{
  RunEndEncodedDataType build()
  {
    return new RunEndEncodedDataType(cast(void*)createGObject(RunEndEncodedDataType._getGType), Yes.Take);
  }
}
