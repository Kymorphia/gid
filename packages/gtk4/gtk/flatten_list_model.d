/// Module for [FlattenListModel] class
module gtk.flatten_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.types;

/**
    [gtk.flatten_list_model.FlattenListModel] is a list model that concatenates other list models.
    
    [gtk.flatten_list_model.FlattenListModel] takes a list model containing list models, and flattens
    it into a single model. Each list model becomes a section in the single model.
*/
class FlattenListModel : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel
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
    return cast(void function())gtk_flatten_list_model_get_type != &gidSymbolNotFound ? gtk_flatten_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FlattenListModel self()
  {
    return this;
  }

  /**
      Get builder for [gtk.flatten_list_model.FlattenListModel]
      Returns: New builder object
  */
  static FlattenListModelGidBuilder builder()
  {
    return new FlattenListModelGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `model` property.
      Returns: The model being flattened.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being flattened.
  */
  @property void model(gio.list_model.ListModel propval)
  {
    setModel(propval);
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new [gtk.flatten_list_model.FlattenListModel] that flattens list.
  
      Params:
        model = the model to be flattened
      Returns: a new [gtk.flatten_list_model.FlattenListModel]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkFlattenListModel* _cretval;
    _cretval = gtk_flatten_list_model_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model set via [gtk.flatten_list_model.FlattenListModel.setModel].
      Returns: The model flattened by self
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model(cast(GtkFlattenListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the model containing the item at the given position.
  
      Params:
        position = a position
      Returns: the model containing the item at position
  */
  gio.list_model.ListModel getModelForItem(uint position)
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model_for_item(cast(GtkFlattenListModel*)this._cPtr, position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets a new model to be flattened.
  
      Params:
        model = the new model
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_flatten_list_model_set_model(cast(GtkFlattenListModel*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.flatten_list_model.FlattenListModel]
class FlattenListModelGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T, gtk.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = The model being flattened.
      Returns: Builder instance for fluent chaining
  */
  T model(gio.list_model.ListModel propval)
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gtk.flatten_list_model.FlattenListModel]
final class FlattenListModelGidBuilder : FlattenListModelGidBuilderImpl!FlattenListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FlattenListModel build()
  {
    return new FlattenListModel(cast(void*)createGObject(FlattenListModel._getGType), Yes.Take);
  }
}
