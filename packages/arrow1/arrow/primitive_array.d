/// Module for [PrimitiveArray] class
module arrow.primitive_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PrimitiveArray : arrow.array.Array
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
    return cast(void function())garrow_primitive_array_get_type != &gidSymbolNotFound ? garrow_primitive_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrimitiveArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.primitive_array.PrimitiveArray]
      Returns: New builder object
  */
  static PrimitiveArrayGidBuilder builder()
  {
    return new PrimitiveArrayGidBuilder;
  }

  /** */
  arrow.buffer.Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_primitive_array_get_buffer(cast(GArrowPrimitiveArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getDataBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_primitive_array_get_data_buffer(cast(GArrowPrimitiveArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.primitive_array.PrimitiveArray]
class PrimitiveArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.primitive_array.PrimitiveArray]
final class PrimitiveArrayGidBuilder : PrimitiveArrayGidBuilderImpl!PrimitiveArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PrimitiveArray build()
  {
    return new PrimitiveArray(cast(void*)createGObject(PrimitiveArray._getGType), No.Take);
  }
}
