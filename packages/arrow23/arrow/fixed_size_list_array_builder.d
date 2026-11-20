/// Module for [FixedSizeListArrayBuilder] class
module arrow.fixed_size_list_array_builder;

public import gid.basictypes;
import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_list_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class FixedSizeListArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_fixed_size_list_array_builder_get_type != &gidSymbolNotFound ? garrow_fixed_size_list_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowFixedSizeListArrayBuilder";
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeListArrayBuilder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_list_array_builder.FixedSizeListArrayBuilder]
      Returns: New builder object
  */
  static FixedSizeListArrayBuilderGidBuilder builder() nothrow
  {
    return new FixedSizeListArrayBuilderGidBuilder;
  }

  /** */
  this(arrow.fixed_size_list_data_type.FixedSizeListDataType dataType)
  {
    GArrowFixedSizeListArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_fixed_size_list_array_builder_new(dataType ? cast(GArrowFixedSizeListDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_list_array_builder_append_value(cast(GArrowFixedSizeListArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getValueBuilder() nothrow
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_fixed_size_list_array_builder_get_value_builder(cast(GArrowFixedSizeListArrayBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_list_array_builder.FixedSizeListArrayBuilder]
class FixedSizeListArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_size_list_array_builder.FixedSizeListArrayBuilder]
final class FixedSizeListArrayBuilderGidBuilder : FixedSizeListArrayBuilderGidBuilderImpl!FixedSizeListArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeListArrayBuilder build() nothrow
  {
    return new FixedSizeListArrayBuilder(cast(void*)createGObject(FixedSizeListArrayBuilder._getGType), Yes.Take);
  }
}
