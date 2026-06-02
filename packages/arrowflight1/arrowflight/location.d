/// Module for [Location] class
module arrowflight.location;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class Location : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_location_get_type != &gidSymbolNotFound ? gaflight_location_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Location self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.location.Location]
      Returns: New builder object
  */
  static LocationGidBuilder builder() nothrow
  {
    return new LocationGidBuilder;
  }

  /** */
  this(string uri)
  {
    GAFlightLocation* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = gaflight_location_new(_uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrowflight.location.Location otherLocation) nothrow
  {
    bool _retval;
    _retval = cast(bool)gaflight_location_equal(cast(GAFlightLocation*)this._cPtr, otherLocation ? cast(GAFlightLocation*)otherLocation._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string getScheme() nothrow
  {
    char* _cretval;
    _cretval = gaflight_location_get_scheme(cast(GAFlightLocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gaflight_location_to_string(cast(GAFlightLocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.location.Location]
class LocationGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.location.Location]
final class LocationGidBuilder : LocationGidBuilderImpl!LocationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Location build() nothrow
  {
    return new Location(cast(void*)createGObject(Location._getGType), Yes.Take);
  }
}
