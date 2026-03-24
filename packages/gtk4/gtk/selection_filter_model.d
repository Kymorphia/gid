/// Module for [SelectionFilterModel] class
module gtk.selection_filter_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.selection_model;
import gtk.types;

/**
    [gtk.selection_filter_model.SelectionFilterModel] is a list model that presents the selection from
    a [gtk.selection_model.SelectionModel].
*/
class SelectionFilterModel : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())gtk_selection_filter_model_get_type != &gidSymbolNotFound ? gtk_selection_filter_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SelectionFilterModel self()
  {
    return this;
  }

  /**
  Get builder for [gtk.selection_filter_model.SelectionFilterModel]
  Returns: New builder object
  */
  static SelectionFilterModelGidBuilder builder()
  {
    return new SelectionFilterModelGidBuilder;
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
      Returns: The model being filtered.
  */
  @property gtk.selection_model.SelectionModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
  */
  @property void model(gtk.selection_model.SelectionModel propval)
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

  /**
      Creates a new [gtk.selection_filter_model.SelectionFilterModel] that will include the
      selected items from the underlying selection model.
  
      Params:
        model = the selection model to filter
      Returns: a new [gtk.selection_filter_model.SelectionFilterModel]
  */
  this(gtk.selection_model.SelectionModel model = null)
  {
    GtkSelectionFilterModel* _cretval;
    _cretval = gtk_selection_filter_model_new(model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model currently filtered or null if none.
      Returns: The model that gets filtered
  */
  gtk.selection_model.SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_selection_filter_model_get_model(cast(GtkSelectionFilterModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the model to be filtered.
      
      Note that GTK makes no effort to ensure that model conforms to
      the item type of self. It assumes that the caller knows what they
      are doing and have set up an appropriate filter to ensure that item
      types match.
  
      Params:
        model = The model to be filtered
  */
  void setModel(gtk.selection_model.SelectionModel model = null)
  {
    gtk_selection_filter_model_set_model(cast(GtkSelectionFilterModel*)this._cPtr, model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

class SelectionFilterModelGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
      Returns: Builder instance for fluent chaining
  */
  T model(gtk.selection_model.SelectionModel propval)
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gtk.selection_filter_model.SelectionFilterModel]
final class SelectionFilterModelGidBuilder : SelectionFilterModelGidBuilderImpl!SelectionFilterModelGidBuilder
{
  SelectionFilterModel build()
  {
    return new SelectionFilterModel(cast(void*)createGObject(SelectionFilterModel._getGType), Yes.Take);
  }
}
