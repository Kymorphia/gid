/// Module for [ArrayDatum] class
module arrow.array_datum;

public import gid.basictypes;
import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ArrayDatum : arrow.datum.Datum
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
    return cast(void function())garrow_array_datum_get_type != &gidSymbolNotFound ? garrow_array_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrayDatum self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.array_datum.ArrayDatum]
      Returns: New builder object
  */
  static ArrayDatumGidBuilder builder() nothrow
  {
    return new ArrayDatumGidBuilder;
  }

  /** */
  @property arrow.array.Array value() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.array.Array)("value");
  }

  /** */
  this(arrow.array.Array value) nothrow
  {
    GArrowArrayDatum* _cretval;
    _cretval = garrow_array_datum_new(value ? cast(GArrowArray*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.array_datum.ArrayDatum]
class ArrayDatumGidBuilderImpl(T) : arrow.datum.DatumGidBuilderImpl!T
{

  /** */
  T value(arrow.array.Array propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.array_datum.ArrayDatum]
final class ArrayDatumGidBuilder : ArrayDatumGidBuilderImpl!ArrayDatumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ArrayDatum build() nothrow
  {
    return new ArrayDatum(cast(void*)createGObject(ArrayDatum._getGType), Yes.Take);
  }
}
