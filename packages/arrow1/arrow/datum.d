/// Module for [Datum] class
module arrow.datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Datum : gobject.object.ObjectWrap
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
    return cast(void function())garrow_datum_get_type != &gidSymbolNotFound ? garrow_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Datum self()
  {
    return this;
  }

  /**
      Get builder for [arrow.datum.Datum]
      Returns: New builder object
  */
  static DatumGidBuilder builder()
  {
    return new DatumGidBuilder;
  }

  /** */
  bool equal(arrow.datum.Datum otherDatum)
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_equal(cast(GArrowDatum*)this._cPtr, otherDatum ? cast(GArrowDatum*)otherDatum._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool isArray()
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_array(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  bool isArrayLike()
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_array_like(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  bool isScalar()
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_scalar(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  bool isValue()
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_value(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_datum_to_string(cast(GArrowDatum*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.datum.Datum]
class DatumGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T datum(void* propval)
  {
    return setProperty("datum", propval);
  }
}

/// Fluent builder for [arrow.datum.Datum]
final class DatumGidBuilder : DatumGidBuilderImpl!DatumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Datum build()
  {
    return new Datum(cast(void*)createGObject(Datum._getGType), No.Take);
  }
}
