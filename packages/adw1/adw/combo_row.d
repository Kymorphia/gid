/// Module for [ComboRow] class
module adw.combo_row;

import adw.action_row;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gio.list_model;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.expression;
import gtk.list_item_factory;

/**
    A [gtk.list_box_row.ListBoxRow] used to choose from a list of items.
    
    <picture>
      <source srcset="combo-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="combo-row.png" alt="combo-row">
    </picture>
    
    The [adw.combo_row.ComboRow] widget allows the user to choose from a list of valid
    choices. The row displays the selected choice. When activated, the row
    displays a popover which allows the user to make a new choice.
    
    Example of an [adw.combo_row.ComboRow] UI definition:
    ```xml
    <object class="AdwComboRow">
      <property name="title" translatable="yes">Combo Row</property>
      <property name="model">
        <object class="GtkStringList">
          <items>
            <item translatable="yes">Foo</item>
            <item translatable="yes">Bar</item>
            <item translatable="yes">Baz</item>
          </items>
        </object>
      </property>
    </object>
    ```
    
    The `property@ComboRow:selected` and `property@ComboRow:selected-item`
    properties can be used to keep track of the selected item and react to their
    changes.
    
    [adw.combo_row.ComboRow] mirrors [gtk.drop_down.DropDown], see that widget for details.
    
    [adw.combo_row.ComboRow] is [gtk.list_box_row.ListBoxRow.activatable] if a model is set.
    
    ## CSS nodes
    
    [adw.combo_row.ComboRow] has a main CSS node with name `row` and the `.combo` style
    class.
    
    Its popover has the node named `popover` with the `.menu` style class, it
    contains a [gtk.scrolled_window.ScrolledWindow], which in turn contains a
    [gtk.list_view.ListView], both are accessible via their regular nodes.
    
    ## Accessibility
    
    [adw.combo_row.ComboRow] uses the [gtk.types.AccessibleRole.ComboBox] role.
*/
class ComboRow : adw.action_row.ActionRow
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
    return cast(void function())adw_combo_row_get_type != &gidSymbolNotFound ? adw_combo_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ComboRow self()
  {
    return this;
  }

  /**
      Get `enableSearch` property.
      Returns: Whether to show a search entry in the popup.
      
      If set to `TRUE`, a search entry will be shown in the popup that
      allows to search for items in the list.
      
      Search requires `property@ComboRow:expression` to be set.
  */
  @property bool enableSearch()
  {
    return getEnableSearch();
  }

  /**
      Set `enableSearch` property.
      Params:
        propval = Whether to show a search entry in the popup.
        
        If set to `TRUE`, a search entry will be shown in the popup that
        allows to search for items in the list.
        
        Search requires `property@ComboRow:expression` to be set.
  */
  @property void enableSearch(bool propval)
  {
    return setEnableSearch(propval);
  }

  /**
      Get `expression` property.
      Returns: An expression used to obtain strings from items.
      
      The expression must have a value type of `G_TYPE_STRING`.
      
      It's used to bind strings to labels produced by the default factory if
      `property@ComboRow:factory` is not set, or when
      `property@ComboRow:use-subtitle` is set to `TRUE`.
  */
  @property gtk.expression.Expression expression()
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = An expression used to obtain strings from items.
        
        The expression must have a value type of `G_TYPE_STRING`.
        
        It's used to bind strings to labels produced by the default factory if
        `property@ComboRow:factory` is not set, or when
        `property@ComboRow:use-subtitle` is set to `TRUE`.
  */
  @property void expression(gtk.expression.Expression propval)
  {
    return setExpression(propval);
  }

  /**
      Get `factory` property.
      Returns: Factory for populating list items.
      
      This factory is always used for the item in the row. It is also used for
      items in the popup unless `property@ComboRow:list-factory` is set.
  */
  @property gtk.list_item_factory.ListItemFactory factory()
  {
    return getFactory();
  }

  /**
      Set `factory` property.
      Params:
        propval = Factory for populating list items.
        
        This factory is always used for the item in the row. It is also used for
        items in the popup unless `property@ComboRow:list-factory` is set.
  */
  @property void factory(gtk.list_item_factory.ListItemFactory propval)
  {
    return setFactory(propval);
  }

  /**
      Get `listFactory` property.
      Returns: The factory for populating list items in the popup.
      
      If this is not set, `property@ComboRow:factory` is used.
  */
  @property gtk.list_item_factory.ListItemFactory listFactory()
  {
    return getListFactory();
  }

  /**
      Set `listFactory` property.
      Params:
        propval = The factory for populating list items in the popup.
        
        If this is not set, `property@ComboRow:factory` is used.
  */
  @property void listFactory(gtk.list_item_factory.ListItemFactory propval)
  {
    return setListFactory(propval);
  }

  /**
      Get `model` property.
      Returns: The model that provides the displayed items.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model that provides the displayed items.
  */
  @property void model(gio.list_model.ListModel propval)
  {
    return setModel(propval);
  }

  /**
      Get `selected` property.
      Returns: The position of the selected item.
      
      If no item is selected, the property has the value
      [gtk.types.INVALID_LIST_POSITION]
  */
  @property uint selected()
  {
    return getSelected();
  }

  /**
      Set `selected` property.
      Params:
        propval = The position of the selected item.
        
        If no item is selected, the property has the value
        [gtk.types.INVALID_LIST_POSITION]
  */
  @property void selected(uint propval)
  {
    return setSelected(propval);
  }

  /**
      Get `selectedItem` property.
      Returns: The selected item.
  */
  @property gobject.object.ObjectWrap selectedItem()
  {
    return getSelectedItem();
  }

  /**
      Get `useSubtitle` property.
      Returns: Whether to use the current value as the subtitle.
      
      If you use a custom list item factory, you will need to give the row a
      name conversion expression with `property@ComboRow:expression`.
      
      If set to `TRUE`, you should not access `property@ActionRow:subtitle`.
      
      The subtitle is interpreted as Pango markup if
      `property@PreferencesRow:use-markup` is set to `TRUE`.
  */
  @property bool useSubtitle()
  {
    return getUseSubtitle();
  }

  /**
      Set `useSubtitle` property.
      Params:
        propval = Whether to use the current value as the subtitle.
        
        If you use a custom list item factory, you will need to give the row a
        name conversion expression with `property@ComboRow:expression`.
        
        If set to `TRUE`, you should not access `property@ActionRow:subtitle`.
        
        The subtitle is interpreted as Pango markup if
        `property@PreferencesRow:use-markup` is set to `TRUE`.
  */
  @property void useSubtitle(bool propval)
  {
    return setUseSubtitle(propval);
  }

  /**
      Creates a new [adw.combo_row.ComboRow].
      Returns: the newly created [adw.combo_row.ComboRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_combo_row_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether search is enabled.
      
      If set to `TRUE`, a search entry will be shown in the popup that
      allows to search for items in the list.
      
      Search requires `propertyComboRow:expression` to be set.
      Returns: whether the popup includes a search entry
  */
  bool getEnableSearch()
  {
    bool _retval;
    _retval = cast(bool)adw_combo_row_get_enable_search(cast(AdwComboRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the expression used to obtain strings from items.
      Returns: the expression used to obtain strings from items
  */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = adw_combo_row_get_expression(cast(AdwComboRow*)this._cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the factory for populating list items.
      Returns: the factory in use
  */
  gtk.list_item_factory.ListItemFactory getFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = adw_combo_row_get_factory(cast(AdwComboRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory for populating list items in the popup.
      Returns: the factory in use
  */
  gtk.list_item_factory.ListItemFactory getListFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = adw_combo_row_get_list_factory(cast(AdwComboRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the model that provides the displayed items.
      Returns: The model in use
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = adw_combo_row_get_model(cast(AdwComboRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the selected item.
      Returns: the position of the selected item, or
          [gtk.types.INVALID_LIST_POSITION] if no item is selected
  */
  uint getSelected()
  {
    uint _retval;
    _retval = adw_combo_row_get_selected(cast(AdwComboRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selected item.
      Returns: the selected item
  */
  gobject.object.ObjectWrap getSelectedItem()
  {
    GObject* _cretval;
    _cretval = adw_combo_row_get_selected_item(cast(AdwComboRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to use the current value as the subtitle.
      Returns: whether to use the current value as the subtitle
  */
  bool getUseSubtitle()
  {
    bool _retval;
    _retval = cast(bool)adw_combo_row_get_use_subtitle(cast(AdwComboRow*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether to enable search.
      
      If set to `TRUE`, a search entry will be shown in the popup that
      allows to search for items in the list.
      
      Search requires `propertyComboRow:expression` to be set.
  
      Params:
        enableSearch = whether to enable search
  */
  void setEnableSearch(bool enableSearch)
  {
    adw_combo_row_set_enable_search(cast(AdwComboRow*)this._cPtr, enableSearch);
  }

  /**
      Sets the expression used to obtain strings from items.
      
      The expression must have a value type of `G_TYPE_STRING`.
      
      It's used to bind strings to labels produced by the default factory if
      `propertyComboRow:factory` is not set, or when
      `propertyComboRow:use-subtitle` is set to `TRUE`.
  
      Params:
        expression = an expression
  */
  void setExpression(gtk.expression.Expression expression = null)
  {
    adw_combo_row_set_expression(cast(AdwComboRow*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets the factory for populating list items.
      
      This factory is always used for the item in the row. It is also used for
      items in the popup unless `propertyComboRow:list-factory` is set.
  
      Params:
        factory = the factory to use
  */
  void setFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    adw_combo_row_set_factory(cast(AdwComboRow*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the factory for populating list items in the popup.
      
      If this is not set, `propertyComboRow:factory` is used.
  
      Params:
        factory = the factory to use
  */
  void setListFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    adw_combo_row_set_list_factory(cast(AdwComboRow*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the model that provides the displayed items.
  
      Params:
        model = the model to use
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    adw_combo_row_set_model(cast(AdwComboRow*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Selects the item at the given position.
  
      Params:
        position = the position of the item to select, or
            [gtk.types.INVALID_LIST_POSITION]
  */
  void setSelected(uint position)
  {
    adw_combo_row_set_selected(cast(AdwComboRow*)this._cPtr, position);
  }

  /**
      Sets whether to use the current value as the subtitle.
      
      If you use a custom list item factory, you will need to give the row a
      name conversion expression with `propertyComboRow:expression`.
      
      If set to `TRUE`, you should not access `propertyActionRow:subtitle`.
      
      The subtitle is interpreted as Pango markup if
      `propertyPreferencesRow:use-markup` is set to `TRUE`.
  
      Params:
        useSubtitle = whether to use the current value as the subtitle
  */
  void setUseSubtitle(bool useSubtitle)
  {
    adw_combo_row_set_use_subtitle(cast(AdwComboRow*)this._cPtr, useSubtitle);
  }
}
