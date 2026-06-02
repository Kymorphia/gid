/// Module for [MultiSelection] class
module gtk.multi_selection;

public import gid.basictypes;
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
import gtk.selection_model;
import gtk.selection_model_mixin;
import gtk.types;

/**
    [gtk.multi_selection.MultiSelection] is a [gtk.selection_model.SelectionModel] that allows selecting multiple
    elements.
*/
class MultiSelection : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel, gtk.selection_model.SelectionModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_multi_selection_get_type != &gidSymbolNotFound ? gtk_multi_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiSelection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.multi_selection.MultiSelection]
      Returns: New builder object
  */
  static MultiSelectionGidBuilder builder() nothrow
  {
    return new MultiSelectionGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `model` property.
      Returns: The list managed by this selection.
  */
  @property gio.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The list managed by this selection.
  */
  @property void model(gio.list_model.ListModel propval) nothrow
  {
    setModel(propval);
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
  
      Params:
        model = the [gio.list_model.ListModel] to manage
      Returns: a new [gtk.multi_selection.MultiSelection]
  */
  this(gio.list_model.ListModel model = null) nothrow
  {
    GtkMultiSelection* _cretval;
    _cretval = gtk_multi_selection_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the underlying model of self.
      Returns: the underlying model
  */
  gio.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_multi_selection_get_model(cast(GtkMultiSelection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the model that self should wrap.
      
      If model is null, self will be empty.
  
      Params:
        model = A [gio.list_model.ListModel] to wrap
  */
  void setModel(gio.list_model.ListModel model = null) nothrow
  {
    gtk_multi_selection_set_model(cast(GtkMultiSelection*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.multi_selection.MultiSelection]
class MultiSelectionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T, gtk.section_model.SectionModelGidBuilderImpl!T, gtk.selection_model.SelectionModelGidBuilderImpl!T
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
  T model(gio.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gtk.multi_selection.MultiSelection]
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
