/// Module for [FlattenListModel] class
module gid.gtk4.flatten_list_model;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.section_model;
import gid.gtk4.section_model_mixin;
import gid.gtk4.types;

/**
    A list model that concatenates other list models.
    
    [gid.gtk4.flatten_list_model.FlattenListModel] takes a list model containing list models, and flattens
    it into a single model. Each list model becomes a section in the single model.
*/
class FlattenListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_flatten_list_model_get_type != &gidSymbolNotFound ? gtk_flatten_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFlattenListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override FlattenListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.flatten_list_model.FlattenListModel]
      Returns: New builder object
  */
  static FlattenListModelGidBuilder builder() nothrow
  {
    return new FlattenListModelGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `model` property.
      Returns: The model being flattened.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being flattened.
  */
  @property void model(gid.gio2.list_model.ListModel propval) nothrow
  {
    setModel(propval);
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
  mixin SectionModelT!();

  /**
      Creates a new [gid.gtk4.flatten_list_model.FlattenListModel] that flattens list.
  
      Params:
        model = the model to be flattened
      Returns: a new [gid.gtk4.flatten_list_model.FlattenListModel]
  */
  this(gid.gio2.list_model.ListModel model = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, model !is null), Yes.Take);
    }
    else
    {
      GtkFlattenListModel* _cretval;
      _cretval = gtk_flatten_list_model_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the model set via [gid.gtk4.flatten_list_model.FlattenListModel.setModel].
      Returns: The model flattened by self
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model(cast(GtkFlattenListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the model containing the item at the given position.
  
      Params:
        position = a position
      Returns: the model containing the item at position
  */
  gid.gio2.list_model.ListModel getModelForItem(uint position) nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model_for_item(cast(GtkFlattenListModel*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets a new model to be flattened.
  
      Params:
        model = the new model
  */
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_flatten_list_model_set_model(cast(GtkFlattenListModel*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.flatten_list_model.FlattenListModel]
class FlattenListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = The model being flattened.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gid.gtk4.flatten_list_model.FlattenListModel]
final class FlattenListModelGidBuilder : FlattenListModelGidBuilderImpl!FlattenListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FlattenListModel build() nothrow
  {
    return new FlattenListModel(cast(void*)createGObject(FlattenListModel._getGType), Yes.Take);
  }
}
