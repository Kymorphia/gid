/// Module for [MapArray] class
module arrow.map_array;

public import gid.basictypes;
import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_array;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class MapArray : arrow.list_array.ListArray
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
    return cast(void function())garrow_map_array_get_type != &gidSymbolNotFound ? garrow_map_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.map_array.MapArray]
      Returns: New builder object
  */
  static MapArrayGidBuilder builder() nothrow
  {
    return new MapArrayGidBuilder;
  }

  /** */
  @property arrow.array.Array items() nothrow
  {
    return getItems();
  }

  /** */
  @property arrow.array.Array keys() nothrow
  {
    return getKeys();
  }

  /** */
  @property arrow.array.Array offsets() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.array.Array)("offsets");
  }

  /** */
  this(arrow.array.Array offsets, arrow.array.Array keys, arrow.array.Array items)
  {
    GArrowMapArray* _cretval;
    GError *_err;
    _cretval = garrow_map_array_new(offsets ? cast(GArrowArray*)offsets._cPtr(No.Dup) : null, keys ? cast(GArrowArray*)keys._cPtr(No.Dup) : null, items ? cast(GArrowArray*)items._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array getItems() nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_items(cast(GArrowMapArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getKeys() nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_keys(cast(GArrowMapArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.map_array.MapArray]
class MapArrayGidBuilderImpl(T) : arrow.list_array.ListArrayGidBuilderImpl!T
{

  /** */
  T items(arrow.array.Array propval) nothrow
  {
    return setProperty("items", propval);
  }

  /** */
  T keys(arrow.array.Array propval) nothrow
  {
    return setProperty("keys", propval);
  }

  /** */
  T offsets(arrow.array.Array propval) nothrow
  {
    return setProperty("offsets", propval);
  }
}

/// Fluent builder for [arrow.map_array.MapArray]
final class MapArrayGidBuilder : MapArrayGidBuilderImpl!MapArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MapArray build() nothrow
  {
    return new MapArray(cast(void*)createGObject(MapArray._getGType), Yes.Take);
  }
}
