/// Module for [EnumListItem] class
module adw.enum_list_item;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    [adw.enum_list_item.EnumListItem] is the type of items in a `class@EnumListModel`.
*/
class EnumListItem : gobject.object.ObjectWrap
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
    return cast(void function())adw_enum_list_item_get_type != &gidSymbolNotFound ? adw_enum_list_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EnumListItem self()
  {
    return this;
  }

  /**
  Get builder for [adw.enum_list_item.EnumListItem]
  Returns: New builder object
  */
  static EnumListItemGidBuilder builder()
  {
    return new EnumListItemGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The enum value name.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Get `nick` property.
      Returns: The enum value nick.
  */
  @property string nick()
  {
    return getNick();
  }

  /**
      Get `value` property.
      Returns: The enum value.
  */
  @property int value()
  {
    return getValue();
  }

  /**
      Gets the enum value name.
      Returns: the enum value name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = adw_enum_list_item_get_name(cast(AdwEnumListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the enum value nick.
      Returns: the enum value nick
  */
  string getNick()
  {
    const(char)* _cretval;
    _cretval = adw_enum_list_item_get_nick(cast(AdwEnumListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the enum value.
      Returns: the enum value
  */
  int getValue()
  {
    int _retval;
    _retval = adw_enum_list_item_get_value(cast(AdwEnumListItem*)this._cPtr);
    return _retval;
  }
}

class EnumListItemGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [adw.enum_list_item.EnumListItem]
final class EnumListItemGidBuilder : EnumListItemGidBuilderImpl!EnumListItemGidBuilder
{
  EnumListItem build()
  {
    return new EnumListItem(cast(void*)createGObject(EnumListItem._getGType), No.Take);
  }
}
