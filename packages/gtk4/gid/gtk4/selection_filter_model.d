/// Module for [SelectionFilterModel] class
module gid.gtk4.selection_filter_model;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.selection_model;
import gid.gtk4.types;

/**
    A list model that presents the selection from a [gid.gtk4.selection_model.SelectionModel].
*/
@gidGir("SelectionFilterModel", "SelectionFilterModelClass")
class SelectionFilterModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
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
    return cast(void function())gtk_selection_filter_model_get_type != &gidSymbolNotFound ? gtk_selection_filter_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSelectionFilterModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override SelectionFilterModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.selection_filter_model.SelectionFilterModel]
      Returns: New builder object
  */
  static SelectionFilterModelGidBuilder builder() nothrow
  {
    return new SelectionFilterModelGidBuilder;
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
      Returns: The model being filtered.
  */
  @property gid.gtk4.selection_model.SelectionModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
  */
  @property void model(gid.gtk4.selection_model.SelectionModel propval) nothrow
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

  /**
      Creates a new [gid.gtk4.selection_filter_model.SelectionFilterModel] that will include the
      selected items from the underlying selection model.
  
      Params:
        model = the selection model to filter
      Returns: a new [gid.gtk4.selection_filter_model.SelectionFilterModel]
  */
  this(gid.gtk4.selection_model.SelectionModel model = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, model !is null), Yes.Take);
    }
    else
    {
      GtkSelectionFilterModel* _cretval;
      _cretval = gtk_selection_filter_model_new(model ? cast(GtkSelectionModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the model currently filtered or null if none.
      Returns: The model that gets filtered
  */
  gid.gtk4.selection_model.SelectionModel getModel() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_selection_filter_model_get_model(cast(GtkSelectionFilterModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
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
  void setModel(gid.gtk4.selection_model.SelectionModel model = null) nothrow
  {
    gtk_selection_filter_model_set_model(cast(GtkSelectionFilterModel*)this._cPtr, model ? cast(GtkSelectionModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.selection_filter_model.SelectionFilterModel]
class SelectionFilterModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gtk4.selection_model.SelectionModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gid.gtk4.selection_filter_model.SelectionFilterModel]
final class SelectionFilterModelGidBuilder : SelectionFilterModelGidBuilderImpl!SelectionFilterModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SelectionFilterModel build() nothrow
  {
    return new SelectionFilterModel(cast(void*)createGObject(SelectionFilterModel._getGType), Yes.Take);
  }
}
