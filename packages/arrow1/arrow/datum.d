/// Module for [Datum] class
module arrow.datum;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_datum_get_type != &gidSymbolNotFound ? garrow_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Datum self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.datum.Datum]
      Returns: New builder object
  */
  static DatumGidBuilder builder() nothrow
  {
    return new DatumGidBuilder;
  }

  /** */
  bool equal(arrow.datum.Datum otherDatum) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_equal(cast(GArrowDatum*)this._cPtr, otherDatum ? cast(GArrowDatum*)otherDatum._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool isArray() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_array(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  bool isArrayLike() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_array_like(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  bool isScalar() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_scalar(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  bool isValue() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_datum_is_value(cast(GArrowDatum*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = garrow_datum_to_string(cast(GArrowDatum*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.datum.Datum]
class DatumGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T datum(void* propval) nothrow
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
  Datum build() nothrow
  {
    return new Datum(cast(void*)createGObject(Datum._getGType), No.Take);
  }
}
