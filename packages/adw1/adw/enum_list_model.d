/// Module for [EnumListModel] class
module adw.enum_list_model;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;

/**
    A [gio.list_model.ListModel] representing values of a given enum.
    
    [adw.enum_list_model.EnumListModel] contains objects of type `class@EnumListItem`.
*/
class EnumListModel : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())adw_enum_list_model_get_type != &gidSymbolNotFound ? adw_enum_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EnumListModel self()
  {
    return this;
  }

  mixin ListModelT!();

  /**
      Creates a new [adw.enum_list_model.EnumListModel] for enum_type.
  
      Params:
        enumType = the type of the enum to construct the model from
      Returns: the newly created [adw.enum_list_model.EnumListModel]
  */
  this(gobject.types.GType enumType)
  {
    AdwEnumListModel* _cretval;
    _cretval = adw_enum_list_model_new(enumType);
    this(_cretval, Yes.Take);
  }

  /**
      Finds the position of a given enum value in self.
      
      If the value is not found, [gtk.types.INVALID_LIST_POSITION] is returned.
  
      Params:
        value = an enum value
      Returns: the position of the value
  */
  uint findPosition(int value)
  {
    uint _retval;
    _retval = adw_enum_list_model_find_position(cast(AdwEnumListModel*)this._cPtr, value);
    return _retval;
  }

  /**
      Gets the type of the enum represented by self.
      Returns: the enum type
  */
  gobject.types.GType getEnumType()
  {
    gobject.types.GType _retval;
    _retval = adw_enum_list_model_get_enum_type(cast(AdwEnumListModel*)this._cPtr);
    return _retval;
  }
}
