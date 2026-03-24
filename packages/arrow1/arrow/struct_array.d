/// Module for [StructArray] class
module arrow.struct_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class StructArray : arrow.array.Array
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
    return cast(void function())garrow_struct_array_get_type != &gidSymbolNotFound ? garrow_struct_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructArray self()
  {
    return this;
  }

  /**
  Get builder for [arrow.struct_array.StructArray]
  Returns: New builder object
  */
  static StructArrayGidBuilder builder()
  {
    return new StructArrayGidBuilder;
  }

  /** */
  this(arrow.data_type.DataType dataType, long length, arrow.array.Array[] fields, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowStructArray* _cretval;
    auto _fields = gListFromD!(arrow.array.Array)(fields);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_fields);
    _cretval = garrow_struct_array_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, length, _fields, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array[] flatten()
  {
    GList* _cretval;
    GError *_err;
    _cretval = garrow_struct_array_flatten(cast(GArrowStructArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(arrow.array.Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  arrow.array.Array getField(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_struct_array_get_field(cast(GArrowStructArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array[] getFields()
  {
    GList* _cretval;
    _cretval = garrow_struct_array_get_fields(cast(GArrowStructArray*)this._cPtr);
    auto _retval = gListToD!(arrow.array.Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}

class StructArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.struct_array.StructArray]
final class StructArrayGidBuilder : StructArrayGidBuilderImpl!StructArrayGidBuilder
{
  StructArray build()
  {
    return new StructArray(cast(void*)createGObject(StructArray._getGType), Yes.Take);
  }
}
