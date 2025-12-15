/// Module for [ListArrayBuilder] class
module arrow.list_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ListArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_list_array_builder_get_type != &gidSymbolNotFound ? garrow_list_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.list_data_type.ListDataType dataType)
  {
    GArrowListArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_list_array_builder_new(dataType ? cast(GArrowListDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool append()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_list_array_builder_append(cast(GArrowListArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_list_array_builder_append_value(cast(GArrowListArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getValueBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_list_array_builder_get_value_builder(cast(GArrowListArrayBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }
}
