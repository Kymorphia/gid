/// Module for [UnionArray] class
module arrow.union_array;

public import gid.basictypes;
import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.int8_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class UnionArray : arrow.array.Array
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
    return cast(void function())garrow_union_array_get_type != &gidSymbolNotFound ? garrow_union_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnionArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.union_array.UnionArray]
      Returns: New builder object
  */
  static UnionArrayGidBuilder builder() nothrow
  {
    return new UnionArrayGidBuilder;
  }

  /** */
  @property arrow.int8_array.Int8Array typeIds() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.int8_array.Int8Array)("type-ids");
  }

  /** */
  int getChildId(long i) nothrow
  {
    int _retval;
    _retval = garrow_union_array_get_child_id(cast(GArrowUnionArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  arrow.array.Array getField(int i) nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_union_array_get_field(cast(GArrowUnionArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  byte getTypeCode(long i) nothrow
  {
    byte _retval;
    _retval = garrow_union_array_get_type_code(cast(GArrowUnionArray*)this._cPtr, i);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.union_array.UnionArray]
class UnionArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{

  /** */
  T typeIds(arrow.int8_array.Int8Array propval) nothrow
  {
    return setProperty("type-ids", propval);
  }
}

/// Fluent builder for [arrow.union_array.UnionArray]
final class UnionArrayGidBuilder : UnionArrayGidBuilderImpl!UnionArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UnionArray build() nothrow
  {
    return new UnionArray(cast(void*)createGObject(UnionArray._getGType), No.Take);
  }
}
