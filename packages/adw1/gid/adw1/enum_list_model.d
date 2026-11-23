/// Module for [EnumListModel] class
module gid.adw1.enum_list_model;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    A [gid.gio2.list_model.ListModel] representing values of a given enum.
    
    [gid.adw1.enum_list_model.EnumListModel] contains objects of type [gid.adw1.enum_list_item.EnumListItem].
*/
class EnumListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_enum_list_model_get_type != &gidSymbolNotFound ? adw_enum_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwEnumListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override EnumListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.enum_list_model.EnumListModel]
      Returns: New builder object
  */
  static EnumListModelGidBuilder builder() nothrow
  {
    return new EnumListModelGidBuilder;
  }

  /**
      Get `enumType` property.
      Returns: The type of the enum represented by the model.
  */
  @property gid.gobject2.types.GType enumType() nothrow
  {
    return getEnumType();
  }

  /**
      Get `itemType` property.
      Returns: The type of the items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();

  /**
      Creates a new [gid.adw1.enum_list_model.EnumListModel] for enum_type.
  
      Params:
        enumType = the type of the enum to construct the model from
      Returns: the newly created [gid.adw1.enum_list_model.EnumListModel]
  */
  this(gid.gobject2.types.GType enumType) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      AdwEnumListModel* _cretval;
      _cretval = adw_enum_list_model_new(enumType);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Finds the position of a given enum value in self.
      
      If the value is not found, [gid.gtk4.types.INVALID_LIST_POSITION] is returned.
  
      Params:
        value = an enum value
      Returns: the position of the value
  */
  uint findPosition(int value) nothrow
  {
    uint _retval;
    _retval = adw_enum_list_model_find_position(cast(AdwEnumListModel*)this._cPtr, value);
    return _retval;
  }

  /**
      Gets the type of the enum represented by self.
      Returns: the enum type
  */
  gid.gobject2.types.GType getEnumType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = adw_enum_list_model_get_enum_type(cast(AdwEnumListModel*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.adw1.enum_list_model.EnumListModel]
class EnumListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `enumType` property.
      Params:
        propval = The type of the enum represented by the model.
      Returns: Builder instance for fluent chaining
  */
  T enumType(gid.gobject2.types.GType propval) nothrow
  {
    return setProperty("enum-type", propval);
  }
}

/// Fluent builder for [gid.adw1.enum_list_model.EnumListModel]
final class EnumListModelGidBuilder : EnumListModelGidBuilderImpl!EnumListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EnumListModel build() nothrow
  {
    return new EnumListModel(cast(void*)createGObject(EnumListModel._getGType), Yes.Take);
  }
}
