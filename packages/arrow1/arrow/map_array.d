/// Module for [MapArray] class
module arrow.map_array;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_map_array_get_type != &gidSymbolNotFound ? garrow_map_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapArray self()
  {
    return this;
  }

  /**
  Get builder for [arrow.map_array.MapArray]
  Returns: New builder object
  */
  static MapArrayGidBuilder builder()
  {
    return new MapArrayGidBuilder;
  }

  /** */
  @property arrow.array.Array items()
  {
    return getItems();
  }

  /** */
  @property arrow.array.Array keys()
  {
    return getKeys();
  }

  /** */
  @property arrow.array.Array offsets()
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
  arrow.array.Array getItems()
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_items(cast(GArrowMapArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getKeys()
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_keys(cast(GArrowMapArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}

class MapArrayGidBuilderImpl(T) : arrow.list_array.ListArrayGidBuilderImpl!T
{

  /** */
  T items(arrow.array.Array propval)
  {
    return setProperty("items", propval);
  }

  /** */
  T keys(arrow.array.Array propval)
  {
    return setProperty("keys", propval);
  }

  /** */
  T offsets(arrow.array.Array propval)
  {
    return setProperty("offsets", propval);
  }
}

/// Fluent builder for [arrow.map_array.MapArray]
final class MapArrayGidBuilder : MapArrayGidBuilderImpl!MapArrayGidBuilder
{
  MapArray build()
  {
    return new MapArray(cast(void*)createGObject(MapArray._getGType), Yes.Take);
  }
}
