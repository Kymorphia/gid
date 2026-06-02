/// Module for [ChunkedArrayDatum] class
module arrow.chunked_array_datum;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.chunked_array;
import arrow.datum;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ChunkedArrayDatum : arrow.datum.Datum
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
    return cast(void function())garrow_chunked_array_datum_get_type != &gidSymbolNotFound ? garrow_chunked_array_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ChunkedArrayDatum self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.chunked_array_datum.ChunkedArrayDatum]
      Returns: New builder object
  */
  static ChunkedArrayDatumGidBuilder builder() nothrow
  {
    return new ChunkedArrayDatumGidBuilder;
  }

  /** */
  @property arrow.chunked_array.ChunkedArray value() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.chunked_array.ChunkedArray)("value");
  }

  /** */
  this(arrow.chunked_array.ChunkedArray value) nothrow
  {
    GArrowChunkedArrayDatum* _cretval;
    _cretval = garrow_chunked_array_datum_new(value ? cast(GArrowChunkedArray*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.chunked_array_datum.ChunkedArrayDatum]
class ChunkedArrayDatumGidBuilderImpl(T) : arrow.datum.DatumGidBuilderImpl!T
{

  /** */
  T value(arrow.chunked_array.ChunkedArray propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.chunked_array_datum.ChunkedArrayDatum]
final class ChunkedArrayDatumGidBuilder : ChunkedArrayDatumGidBuilderImpl!ChunkedArrayDatumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ChunkedArrayDatum build() nothrow
  {
    return new ChunkedArrayDatum(cast(void*)createGObject(ChunkedArrayDatum._getGType), Yes.Take);
  }
}
