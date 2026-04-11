/// Module for [SingleSelection] class
module gtk.single_selection;

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
    [gtk.single_selection.SingleSelection] is a [gtk.selection_model.SelectionModel] that allows selecting a single
    item.
    
    Note that the selection is *persistent* -- if the selected item is removed
    and re-added in the same `signal@Gio.ListModel::items-changed` emission, it
    stays selected. In particular, this means that changing the sort order of an
    underlying sort model will preserve the selection.
*/
class SingleSelection : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel, gtk.selection_model.SelectionModel
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
    return cast(void function())gtk_single_selection_get_type != &gidSymbolNotFound ? gtk_single_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SingleSelection self()
  {
    return this;
  }

  /**
      Get builder for [gtk.single_selection.SingleSelection]
      Returns: New builder object
  */
  static SingleSelectionGidBuilder builder()
  {
    return new SingleSelectionGidBuilder;
  }

  /**
      Get `autoselect` property.
      Returns: If the selection will always select an item.
  */
  @property bool autoselect()
  {
    return getAutoselect();
  }

  /**
      Set `autoselect` property.
      Params:
        propval = If the selection will always select an item.
  */
  @property void autoselect(bool propval)
  {
    setAutoselect(propval);
  }

  /**
      Get `canUnselect` property.
      Returns: If unselecting the selected item is allowed.
  */
  @property bool canUnselect()
  {
    return getCanUnselect();
  }

  /**
      Set `canUnselect` property.
      Params:
        propval = If unselecting the selected item is allowed.
  */
  @property void canUnselect(bool propval)
  {
    setCanUnselect(propval);
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
      Returns: The model being managed.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being managed.
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

  /**
      Get `selected` property.
      Returns: Position of the selected item.
  */
  @property uint selected()
  {
    return getSelected();
  }

  /**
      Set `selected` property.
      Params:
        propval = Position of the selected item.
  */
  @property void selected(uint propval)
  {
    setSelected(propval);
  }

  /**
      Get `selectedItem` property.
      Returns: The selected item.
  */
  @property gobject.object.ObjectWrap selectedItem()
  {
    return getSelectedItem();
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
  
      Params:
        model = the [gio.list_model.ListModel] to manage
      Returns: a new [gtk.single_selection.SingleSelection]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkSingleSelection* _cretval;
    _cretval = gtk_single_selection_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Checks if autoselect has been enabled or disabled via
      [gtk.single_selection.SingleSelection.setAutoselect].
      Returns: true if autoselect is enabled
  */
  bool getAutoselect()
  {
    bool _retval;
    _retval = cast(bool)gtk_single_selection_get_autoselect(cast(GtkSingleSelection*)this._cPtr);
    return _retval;
  }

  /**
      If true, [gtk.selection_model.SelectionModel.unselectItem] is supported and allows
      unselecting the selected item.
      Returns: true to support unselecting
  */
  bool getCanUnselect()
  {
    bool _retval;
    _retval = cast(bool)gtk_single_selection_get_can_unselect(cast(GtkSingleSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model that self is wrapping.
      Returns: The model being wrapped
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_single_selection_get_model(cast(GtkSingleSelection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the selected item.
      
      If no item is selected, [gtk.types.INVALID_LIST_POSITION] is returned.
      Returns: The position of the selected item
  */
  uint getSelected()
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
  gobject.object.ObjectWrap getSelectedItem()
  {
    GObject* _cretval;
    _cretval = gtk_single_selection_get_selected_item(cast(GtkSingleSelection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
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
  void setAutoselect(bool autoselect)
  {
    gtk_single_selection_set_autoselect(cast(GtkSingleSelection*)this._cPtr, autoselect);
  }

  /**
      If true, unselecting the current item via
      [gtk.selection_model.SelectionModel.unselectItem] is supported.
      
      Note that setting [gtk.single_selection.SingleSelection.autoselect] will
      cause unselecting to not work, so it practically makes no sense
      to set both at the same time the same time.
  
      Params:
        canUnselect = true to allow unselecting
  */
  void setCanUnselect(bool canUnselect)
  {
    gtk_single_selection_set_can_unselect(cast(GtkSingleSelection*)this._cPtr, canUnselect);
  }

  /**
      Sets the model that self should wrap.
      
      If model is null, self will be empty.
  
      Params:
        model = A [gio.list_model.ListModel] to wrap
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_single_selection_set_model(cast(GtkSingleSelection*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Selects the item at the given position.
      
      If the list does not have an item at position or
      [gtk.types.INVALID_LIST_POSITION] is given, the behavior depends on the
      value of the [gtk.single_selection.SingleSelection.autoselect] property:
      If it is set, no change will occur and the old item will stay
      selected. If it is unset, the selection will be unset and no item
      will be selected.
  
      Params:
        position = the item to select or [gtk.types.INVALID_LIST_POSITION]
  */
  void setSelected(uint position)
  {
    gtk_single_selection_set_selected(cast(GtkSingleSelection*)this._cPtr, position);
  }
}

/// Fluent builder implementation template for [gtk.single_selection.SingleSelection]
class SingleSelectionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T, gtk.section_model.SectionModelGidBuilderImpl!T, gtk.selection_model.SelectionModelGidBuilderImpl!T
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
  T autoselect(bool propval)
  {
    return setProperty("autoselect", propval);
  }

  /**
      Set `canUnselect` property.
      Params:
        propval = If unselecting the selected item is allowed.
      Returns: Builder instance for fluent chaining
  */
  T canUnselect(bool propval)
  {
    return setProperty("can-unselect", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model being managed.
      Returns: Builder instance for fluent chaining
  */
  T model(gio.list_model.ListModel propval)
  {
    return setProperty("model", propval);
  }

  /**
      Set `selected` property.
      Params:
        propval = Position of the selected item.
      Returns: Builder instance for fluent chaining
  */
  T selected(uint propval)
  {
    return setProperty("selected", propval);
  }
}

/// Fluent builder for [gtk.single_selection.SingleSelection]
final class SingleSelectionGidBuilder : SingleSelectionGidBuilderImpl!SingleSelectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SingleSelection build()
  {
    return new SingleSelection(cast(void*)createGObject(SingleSelection._getGType), Yes.Take);
  }
}
