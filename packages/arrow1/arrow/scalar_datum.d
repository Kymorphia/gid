/// Module for [ScalarDatum] class
module arrow.scalar_datum;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ScalarDatum : arrow.datum.Datum
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
    return cast(void function())garrow_scalar_datum_get_type != &gidSymbolNotFound ? garrow_scalar_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScalarDatum self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.scalar_datum.ScalarDatum]
      Returns: New builder object
  */
  static ScalarDatumGidBuilder builder() nothrow
  {
    return new ScalarDatumGidBuilder;
  }

  /** */
  @property arrow.scalar.Scalar value() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.scalar.Scalar)("value");
  }

  /** */
  this(arrow.scalar.Scalar value) nothrow
  {
    GArrowScalarDatum* _cretval;
    _cretval = garrow_scalar_datum_new(value ? cast(GArrowScalar*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.scalar_datum.ScalarDatum]
class ScalarDatumGidBuilderImpl(T) : arrow.datum.DatumGidBuilderImpl!T
{

  /** */
  T value(arrow.scalar.Scalar propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.scalar_datum.ScalarDatum]
final class ScalarDatumGidBuilder : ScalarDatumGidBuilderImpl!ScalarDatumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScalarDatum build() nothrow
  {
    return new ScalarDatum(cast(void*)createGObject(ScalarDatum._getGType), Yes.Take);
  }
}
