/// Module for [EnumListItem] class
module gid.adw1.enum_list_item;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.adw1.enum_list_item.EnumListItem] is the type of items in a [gid.adw1.enum_list_model.EnumListModel].
*/
class EnumListItem : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_enum_list_item_get_type != &gidSymbolNotFound ? adw_enum_list_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwEnumListItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override EnumListItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.enum_list_item.EnumListItem]
      Returns: New builder object
  */
  static EnumListItemGidBuilder builder() nothrow
  {
    return new EnumListItemGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The enum value name.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `nick` property.
      Returns: The enum value nick.
  */
  @property string nick() nothrow
  {
    return getNick();
  }

  /**
      Get `value` property.
      Returns: The enum value.
  */
  @property int value() nothrow
  {
    return getValue();
  }

  /**
      Gets the enum value name.
      Returns: the enum value name
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_enum_list_item_get_name(cast(AdwEnumListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the enum value nick.
      Returns: the enum value nick
  */
  string getNick() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_enum_list_item_get_nick(cast(AdwEnumListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the enum value.
      Returns: the enum value
  */
  int getValue() nothrow
  {
    int _retval;
    _retval = adw_enum_list_item_get_value(cast(AdwEnumListItem*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.adw1.enum_list_item.EnumListItem]
class EnumListItemGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.adw1.enum_list_item.EnumListItem]
final class EnumListItemGidBuilder : EnumListItemGidBuilderImpl!EnumListItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EnumListItem build() nothrow
  {
    return new EnumListItem(cast(void*)createGObject(EnumListItem._getGType), Yes.Take);
  }
}
