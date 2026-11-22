/// Module for [SingleSelection] class
module gid.gtk4.single_selection;

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
import gid.gtk4.selection_model;
import gid.gtk4.selection_model_mixin;
import gid.gtk4.types;

/**
    A selection model that allows selecting a single item.
    
    Note that the selection is *persistent* -- if the selected item is removed
    and re-added in the same [gid.gio2.list_model.ListModel.itemsChanged] emission, it
    stays selected. In particular, this means that changing the sort order of an
    underlying sort model will preserve the selection.
*/
class SingleSelection : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel, gid.gtk4.selection_model.SelectionModel
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
    return cast(void function())gtk_single_selection_get_type != &gidSymbolNotFound ? gtk_single_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSingleSelection";
  }

  /** Returns `this`, for use in `with` statements. */
  override SingleSelection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.single_selection.SingleSelection]
      Returns: New builder object
  */
  static SingleSelectionGidBuilder builder() nothrow
  {
    return new SingleSelectionGidBuilder;
  }

  /**
      Get `autoselect` property.
      Returns: If the selection will always select an item.
  */
  @property bool autoselect() nothrow
  {
    return getAutoselect();
  }

  /**
      Set `autoselect` property.
      Params:
        propval = If the selection will always select an item.
  */
  @property void autoselect(bool propval) nothrow
  {
    setAutoselect(propval);
  }

  /**
      Get `canUnselect` property.
      Returns: If unselecting the selected item is allowed.
  */
  @property bool canUnselect() nothrow
  {
    return getCanUnselect();
  }

  /**
      Set `canUnselect` property.
      Params:
        propval = If unselecting the selected item is allowed.
  */
  @property void canUnselect(bool propval) nothrow
  {
    setCanUnselect(propval);
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
      Returns: The model being managed.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being managed.
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

  /**
      Get `selected` property.
      Returns: Position of the selected item.
  */
  @property uint selected() nothrow
  {
    return getSelected();
  }

  /**
      Set `selected` property.
      Params:
        propval = Position of the selected item.
  */
  @property void selected(uint propval) nothrow
  {
    setSelected(propval);
  }

  /**
      Get `selectedItem` property.
      Returns: The selected item.
  */
  @property gid.gobject2.object.ObjectWrap selectedItem() nothrow
  {
    return getSelectedItem();
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
  
      Params:
        model = the [gid.gio2.list_model.ListModel] to manage
      Returns: a new [gid.gtk4.single_selection.SingleSelection]
  */
  this(gid.gio2.list_model.ListModel model = null) nothrow
  {
    GtkSingleSelection* _cretval;
    _cretval = gtk_single_selection_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Checks if autoselect has been enabled or disabled via
      [gid.gtk4.single_selection.SingleSelection.setAutoselect].
      Returns: true if autoselect is enabled
  */
  bool getAutoselect() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_single_selection_get_autoselect(cast(GtkSingleSelection*)this._cPtr);
    return _retval;
  }

  /**
      If true, [gid.gtk4.selection_model.SelectionModel.unselectItem] is supported and allows
      unselecting the selected item.
      Returns: true to support unselecting
  */
  bool getCanUnselect() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_single_selection_get_can_unselect(cast(GtkSingleSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model that self is wrapping.
      Returns: The model being wrapped
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_single_selection_get_model(cast(GtkSingleSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the selected item.
      
      If no item is selected, [gid.gtk4.types.INVALID_LIST_POSITION] is returned.
      Returns: The position of the selected item
  */
  uint getSelected() nothrow
  {
    uint _retval;
    _retval = gtk_single_selection_get_selected(cast(GtkSingleSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selected item.
      
      If no item is selected, null is returned.
      Returns: The selected item
  */
  gid.gobject2.object.ObjectWrap getSelectedItem() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_single_selection_get_selected_item(cast(GtkSingleSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Enables or disables autoselect.
      
      If autoselect is true, self will enforce that an item is always
      selected. It will select a new item when the currently selected
      item is deleted and it will disallow unselecting the current item.
  
      Params:
        autoselect = true to always select an item
  */
  void setAutoselect(bool autoselect) nothrow
  {
    gtk_single_selection_set_autoselect(cast(GtkSingleSelection*)this._cPtr, autoselect);
  }

  /**
      If true, unselecting the current item via
      [gid.gtk4.selection_model.SelectionModel.unselectItem] is supported.
      
      Note that setting [gid.gtk4.single_selection.SingleSelection.autoselect] will
      cause unselecting to not work, so it practically makes no sense
      to set both at the same time.
  
      Params:
        canUnselect = true to allow unselecting
  */
  void setCanUnselect(bool canUnselect) nothrow
  {
    gtk_single_selection_set_can_unselect(cast(GtkSingleSelection*)this._cPtr, canUnselect);
  }

  /**
      Sets the model that self should wrap.
      
      If model is null, self will be empty.
  
      Params:
        model = A [gid.gio2.list_model.ListModel] to wrap
  */
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_single_selection_set_model(cast(GtkSingleSelection*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Selects the item at the given position.
      
      If the list does not have an item at position or
      [gid.gtk4.types.INVALID_LIST_POSITION] is given, the behavior depends on the
      value of the [gid.gtk4.single_selection.SingleSelection.autoselect] property:
      If it is set, no change will occur and the old item will stay
      selected. If it is unset, the selection will be unset and no item
      will be selected. This also applies if [gid.gtk4.single_selection.SingleSelection.canUnselect]
      is set to false.
  
      Params:
        position = the item to select or [gid.gtk4.types.INVALID_LIST_POSITION]
  */
  void setSelected(uint position) nothrow
  {
    gtk_single_selection_set_selected(cast(GtkSingleSelection*)this._cPtr, position);
  }
}

/// Fluent builder implementation template for [gid.gtk4.single_selection.SingleSelection]
class SingleSelectionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T, gid.gtk4.selection_model.SelectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();
  mixin SelectionModelGidBuilderT!();

  /**
      Set `autoselect` property.
      Params:
        propval = If the selection will always select an item.
      Returns: Builder instance for fluent chaining
  */
  T autoselect(bool propval) nothrow
  {
    return setProperty("autoselect", propval);
  }

  /**
      Set `canUnselect` property.
      Params:
        propval = If unselecting the selected item is allowed.
      Returns: Builder instance for fluent chaining
  */
  T canUnselect(bool propval) nothrow
  {
    return setProperty("can-unselect", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model being managed.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `selected` property.
      Params:
        propval = Position of the selected item.
      Returns: Builder instance for fluent chaining
  */
  T selected(uint propval) nothrow
  {
    return setProperty("selected", propval);
  }
}

/// Fluent builder for [gid.gtk4.single_selection.SingleSelection]
final class SingleSelectionGidBuilder : SingleSelectionGidBuilderImpl!SingleSelectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SingleSelection build() nothrow
  {
    return new SingleSelection(cast(void*)createGObject(SingleSelection._getGType), Yes.Take);
  }
}
