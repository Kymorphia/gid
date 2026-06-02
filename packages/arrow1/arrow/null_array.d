/// Module for [NullArray] class
module arrow.null_array;

public import gid.basictypes;
import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class NullArray : arrow.array.Array
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
    return cast(void function())garrow_null_array_get_type != &gidSymbolNotFound ? garrow_null_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NullArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.null_array.NullArray]
      Returns: New builder object
  */
  static NullArrayGidBuilder builder() nothrow
  {
    return new NullArrayGidBuilder;
  }

  /** */
  this(long length) nothrow
  {
    GArrowNullArray* _cretval;
    _cretval = garrow_null_array_new(length);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.null_array.NullArray]
class NullArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.null_array.NullArray]
final class NullArrayGidBuilder : NullArrayGidBuilderImpl!NullArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NullArray build() nothrow
  {
    return new NullArray(cast(void*)createGObject(NullArray._getGType), Yes.Take);
  }
}
