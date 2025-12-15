/// Module for [StructArrayBuilder] class
module arrow.struct_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.struct_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class StructArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_struct_array_builder_get_type != &gidSymbolNotFound ? garrow_struct_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.struct_data_type.StructDataType dataType)
  {
    GArrowStructArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_struct_array_builder_new(dataType ? cast(GArrowStructDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool append()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_struct_array_builder_append(cast(GArrowStructArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_struct_array_builder_append_value(cast(GArrowStructArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getFieldBuilder(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_struct_array_builder_get_field_builder(cast(GArrowStructArrayBuilder*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder[] getFieldBuilders()
  {
    GList* _cretval;
    _cretval = garrow_struct_array_builder_get_field_builders(cast(GArrowStructArrayBuilder*)this._cPtr);
    auto _retval = gListToD!(arrow.array_builder.ArrayBuilder, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
