/// Module for [MultiSelection] class
module gid.gtk4.multi_selection;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.section_model;
import gid.gtk4.section_model_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.selection_model_mixin;
import gid.gtk4.types;

/**
    A selection model that allows selecting multiple elements.
*/
class MultiSelection : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel, gid.gtk4.selection_model.SelectionModel
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
    return cast(void function())gtk_multi_selection_get_type != &gidSymbolNotFound ? gtk_multi_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMultiSelection";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiSelection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.multi_selection.MultiSelection]
      Returns: New builder object
  */
  static MultiSelectionGidBuilder builder() nothrow
  {
    return new MultiSelectionGidBuilder;
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
      Returns: The list managed by this selection.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The list managed by this selection.
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
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
  
      Params:
        model = the [gid.gio2.list_model.ListModel] to manage
      Returns: a new [gid.gtk4.multi_selection.MultiSelection]
  */
  this(gid.gio2.list_model.ListModel model = null) nothrow
  {
    GtkMultiSelection* _cretval;
    _cretval = gtk_multi_selection_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the underlying model of self.
      Returns: the underlying model
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_multi_selection_get_model(cast(GtkMultiSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the model that self should wrap.
      
      If model is null, self will be empty.
  
      Params:
        model = A [gid.gio2.list_model.ListModel] to wrap
  */
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_multi_selection_set_model(cast(GtkMultiSelection*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.multi_selection.MultiSelection]
class MultiSelectionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T, gid.gtk4.selection_model.SelectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();
  mixin SelectionModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = The list managed by this selection.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gid.gtk4.multi_selection.MultiSelection]
final class MultiSelectionGidBuilder : MultiSelectionGidBuilderImpl!MultiSelectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultiSelection build() nothrow
  {
    return new MultiSelection(cast(void*)createGObject(MultiSelection._getGType), Yes.Take);
  }
}
