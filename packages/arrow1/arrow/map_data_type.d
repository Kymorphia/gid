/// Module for [MapDataType] class
module arrow.map_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.list_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class MapDataType : arrow.list_data_type.ListDataType
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
    return cast(void function())garrow_map_data_type_get_type != &gidSymbolNotFound ? garrow_map_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.map_data_type.MapDataType]
  Returns: New builder object
  */
  static MapDataTypeGidBuilder builder()
  {
    return new MapDataTypeGidBuilder;
  }

  /** */
  this(arrow.data_type.DataType keyType, arrow.data_type.DataType itemType)
  {
    GArrowMapDataType* _cretval;
    _cretval = garrow_map_data_type_new(keyType ? cast(GArrowDataType*)keyType._cPtr(No.Dup) : null, itemType ? cast(GArrowDataType*)itemType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.data_type.DataType getItemType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_map_data_type_get_item_type(cast(GArrowMapDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getKeyType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_map_data_type_get_key_type(cast(GArrowMapDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }
}

class MapDataTypeGidBuilderImpl(T) : arrow.list_data_type.ListDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.map_data_type.MapDataType]
final class MapDataTypeGidBuilder : MapDataTypeGidBuilderImpl!MapDataTypeGidBuilder
{
  MapDataType build()
  {
    return new MapDataType(cast(void*)createGObject(MapDataType._getGType), Yes.Take);
  }
}
