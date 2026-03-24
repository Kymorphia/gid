/// Module for [ScalarDatum] class
module arrow.scalar_datum;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_scalar_datum_get_type != &gidSymbolNotFound ? garrow_scalar_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScalarDatum self()
  {
    return this;
  }

  /**
  Get builder for [arrow.scalar_datum.ScalarDatum]
  Returns: New builder object
  */
  static ScalarDatumGidBuilder builder()
  {
    return new ScalarDatumGidBuilder;
  }

  /** */
  @property arrow.scalar.Scalar value()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.scalar.Scalar)("value");
  }

  /** */
  this(arrow.scalar.Scalar value)
  {
    GArrowScalarDatum* _cretval;
    _cretval = garrow_scalar_datum_new(value ? cast(GArrowScalar*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class ScalarDatumGidBuilderImpl(T) : arrow.datum.DatumGidBuilderImpl!T
{

  /** */
  T value(arrow.scalar.Scalar propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.scalar_datum.ScalarDatum]
final class ScalarDatumGidBuilder : ScalarDatumGidBuilderImpl!ScalarDatumGidBuilder
{
  ScalarDatum build()
  {
    return new ScalarDatum(cast(void*)createGObject(ScalarDatum._getGType), Yes.Take);
  }
}
