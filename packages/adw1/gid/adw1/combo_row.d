/// Module for [ComboRow] class
module gid.adw1.combo_row;

public import gid.core.basictypes;
import gid.adw1.action_row;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
import gid.gio2.list_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.expression;
import gid.gtk4.list_item_factory;
import gid.gtk4.types;

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to choose from a list of items.
    
    <picture>
      <source srcset="combo-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="combo-row.png" alt="combo-row">
    </picture>
    
    The [gid.adw1.combo_row.ComboRow] widget allows the user to choose from a list of valid
    choices. The row displays the selected choice. When activated, the row
    displays a popover which allows the user to make a new choice.
    
    Example of an [gid.adw1.combo_row.ComboRow] UI definition:
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
    
    The [gid.adw1.combo_row.ComboRow.selected] and [gid.adw1.combo_row.ComboRow.selectedItem]
    properties can be used to keep track of the selected item and react to their
    changes.
    
    [gid.adw1.combo_row.ComboRow] mirrors [gid.gtk4.drop_down.DropDown], see that widget for details.
    
    [gid.adw1.combo_row.ComboRow] is [gid.gtk4.list_box_row.ListBoxRow.activatable] if a model is set.
    
    ## CSS nodes
    
    [gid.adw1.combo_row.ComboRow] has a main CSS node with name `row` and the `.combo` style
    class.
    
    Its popover has the node named `popover` with the `.menu` style class, it
    contains a [gid.gtk4.scrolled_window.ScrolledWindow], which in turn contains a
    [gid.gtk4.list_view.ListView], both are accessible via their regular nodes.
    
    ## Accessibility
    
    [gid.adw1.combo_row.ComboRow] uses the `enum@Gtk.AccessibleRole.combo-box` role.
*/
class ComboRow : gid.adw1.action_row.ActionRow
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
    return cast(void function())adw_combo_row_get_type != &gidSymbolNotFound ? adw_combo_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwComboRow";
  }

  /** Returns `this`, for use in `with` statements. */
  override ComboRow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.combo_row.ComboRow]
      Returns: New builder object
  */
  static ComboRowGidBuilder builder() nothrow
  {
    return new ComboRowGidBuilder;
  }

  /**
      Get `enableSearch` property.
      Returns: Whether to show a search entry in the popup.
        
        If set to `TRUE`, a search entry will be shown in the popup that
        allows to search for items in the list.
        
        Search requires [gid.adw1.combo_row.ComboRow.expression] to be set.
  */
  @property bool enableSearch() nothrow
  {
    return getEnableSearch();
  }

  /**
      Set `enableSearch` property.
      Params:
        propval = Whether to show a search entry in the popup.
          
          If set to `TRUE`, a search entry will be shown in the popup that
          allows to search for items in the list.
          
          Search requires [gid.adw1.combo_row.ComboRow.expression] to be set.
  */
  @property void enableSearch(bool propval) nothrow
  {
    setEnableSearch(propval);
  }

  /**
      Get `expression` property.
      Returns: An expression used to obtain strings from items.
        
        The expression must have a value type of `G_TYPE_STRING`.
        
        It's used to bind strings to labels produced by the default factory if
        [gid.adw1.combo_row.ComboRow.factory] is not set, or when
        [gid.adw1.combo_row.ComboRow.useSubtitle] is set to `TRUE`.
  */
  @property gid.gtk4.expression.Expression expression() nothrow
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = An expression used to obtain strings from items.
          
          The expression must have a value type of `G_TYPE_STRING`.
          
          It's used to bind strings to labels produced by the default factory if
          [gid.adw1.combo_row.ComboRow.factory] is not set, or when
          [gid.adw1.combo_row.ComboRow.useSubtitle] is set to `TRUE`.
  */
  @property void expression(gid.gtk4.expression.Expression propval) nothrow
  {
    setExpression(propval);
  }

  /**
      Get `factory` property.
      Returns: Factory for populating list items.
        
        This factory is always used for the item in the row. It is also used for
        items in the popup unless [gid.adw1.combo_row.ComboRow.listFactory] is set.
  */
  @property gid.gtk4.list_item_factory.ListItemFactory factory() nothrow
  {
    return getFactory();
  }

  /**
      Set `factory` property.
      Params:
        propval = Factory for populating list items.
          
          This factory is always used for the item in the row. It is also used for
          items in the popup unless [gid.adw1.combo_row.ComboRow.listFactory] is set.
  */
  @property void factory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    setFactory(propval);
  }

  /**
      Get `headerFactory` property.
      Returns: The factory for creating header widgets for the popup.
  */
  @property gid.gtk4.list_item_factory.ListItemFactory headerFactory() nothrow
  {
    return getHeaderFactory();
  }

  /**
      Set `headerFactory` property.
      Params:
        propval = The factory for creating header widgets for the popup.
  */
  @property void headerFactory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    setHeaderFactory(propval);
  }

  /**
      Get `listFactory` property.
      Returns: The factory for populating list items in the popup.
        
        If this is not set, [gid.adw1.combo_row.ComboRow.factory] is used.
  */
  @property gid.gtk4.list_item_factory.ListItemFactory listFactory() nothrow
  {
    return getListFactory();
  }

  /**
      Set `listFactory` property.
      Params:
        propval = The factory for populating list items in the popup.
          
          If this is not set, [gid.adw1.combo_row.ComboRow.factory] is used.
  */
  @property void listFactory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    setListFactory(propval);
  }

  /**
      Get `model` property.
      Returns: The model that provides the displayed items.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model that provides the displayed items.
  */
  @property void model(gid.gio2.list_model.ListModel propval) nothrow
  {
    setModel(propval);
  }

  /**
      Get `searchMatchMode` property.
      Returns: The match mode for the search filter.
  */
  @property gid.gtk4.types.StringFilterMatchMode searchMatchMode() nothrow
  {
    return getSearchMatchMode();
  }

  /**
      Set `searchMatchMode` property.
      Params:
        propval = The match mode for the search filter.
  */
  @property void searchMatchMode(gid.gtk4.types.StringFilterMatchMode propval) nothrow
  {
    setSearchMatchMode(propval);
  }

  /**
      Get `selected` property.
      Returns: The position of the selected item.
        
        If no item is selected, the property has the value
        [gid.gtk4.types.INVALID_LIST_POSITION]
  */
  @property uint selected() nothrow
  {
    return getSelected();
  }

  /**
      Set `selected` property.
      Params:
        propval = The position of the selected item.
          
          If no item is selected, the property has the value
          [gid.gtk4.types.INVALID_LIST_POSITION]
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

  /**
      Get `useSubtitle` property.
      Returns: Whether to use the current value as the subtitle.
        
        If you use a custom list item factory, you will need to give the row a
        name conversion expression with [gid.adw1.combo_row.ComboRow.expression].
        
        If set to `TRUE`, you should not access [gid.adw1.action_row.ActionRow.subtitle].
        
        The subtitle is interpreted as Pango markup if
        [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `TRUE`.
  */
  @property bool useSubtitle() nothrow
  {
    return getUseSubtitle();
  }

  /**
      Set `useSubtitle` property.
      Params:
        propval = Whether to use the current value as the subtitle.
          
          If you use a custom list item factory, you will need to give the row a
          name conversion expression with [gid.adw1.combo_row.ComboRow.expression].
          
          If set to `TRUE`, you should not access [gid.adw1.action_row.ActionRow.subtitle].
          
          The subtitle is interpreted as Pango markup if
          [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `TRUE`.
  */
  @property void useSubtitle(bool propval) nothrow
  {
    setUseSubtitle(propval);
  }

  /**
      Creates a new [gid.adw1.combo_row.ComboRow].
      Returns: the newly created [gid.adw1.combo_row.ComboRow]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_combo_row_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether search is enabled.
      
      If set to `TRUE`, a search entry will be shown in the popup that
      allows to search for items in the list.
      
      Search requires [gid.adw1.combo_row.ComboRow.expression] to be set.
      Returns: whether the popup includes a search entry
  */
  bool getEnableSearch() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_combo_row_get_enable_search(cast(AdwComboRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the expression used to obtain strings from items.
      Returns: the expression used to obtain strings from items
  */
  gid.gtk4.expression.Expression getExpression() nothrow
  {
    GtkExpression* _cretval;
    _cretval = adw_combo_row_get_expression(cast(AdwComboRow*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the factory for populating list items.
      Returns: the factory in use
  */
  gid.gtk4.list_item_factory.ListItemFactory getFactory() nothrow
  {
    GtkListItemFactory* _cretval;
    _cretval = adw_combo_row_get_factory(cast(AdwComboRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory that's currently used to create header widgets for the popup.
      Returns: The factory in use
  */
  gid.gtk4.list_item_factory.ListItemFactory getHeaderFactory() nothrow
  {
    GtkListItemFactory* _cretval;
    _cretval = adw_combo_row_get_header_factory(cast(AdwComboRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory for populating list items in the popup.
      Returns: the factory in use
  */
  gid.gtk4.list_item_factory.ListItemFactory getListFactory() nothrow
  {
    GtkListItemFactory* _cretval;
    _cretval = adw_combo_row_get_list_factory(cast(AdwComboRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the model that provides the displayed items.
      Returns: The model in use
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = adw_combo_row_get_model(cast(AdwComboRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the match mode that the search filter is using.
      Returns: the match mode of the search filter
  */
  gid.gtk4.types.StringFilterMatchMode getSearchMatchMode() nothrow
  {
    GtkStringFilterMatchMode _cretval;
    _cretval = adw_combo_row_get_search_match_mode(cast(AdwComboRow*)this._cPtr);
    gid.gtk4.types.StringFilterMatchMode _retval = cast(gid.gtk4.types.StringFilterMatchMode)_cretval;
    return _retval;
  }

  /**
      Gets the position of the selected item.
      Returns: the position of the selected item, or
          [gid.gtk4.types.INVALID_LIST_POSITION] if no item is selected
  */
  uint getSelected() nothrow
  {
    uint _retval;
    _retval = adw_combo_row_get_selected(cast(AdwComboRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selected item.
      Returns: the selected item
  */
  gid.gobject2.object.ObjectWrap getSelectedItem() nothrow
  {
    GObject* _cretval;
    _cretval = adw_combo_row_get_selected_item(cast(AdwComboRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to use the current value as the subtitle.
      Returns: whether to use the current value as the subtitle
  */
  bool getUseSubtitle() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_combo_row_get_use_subtitle(cast(AdwComboRow*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether to enable search.
      
      If set to `TRUE`, a search entry will be shown in the popup that
      allows to search for items in the list.
      
      Search requires [gid.adw1.combo_row.ComboRow.expression] to be set.
  
      Params:
        enableSearch = whether to enable search
  */
  void setEnableSearch(bool enableSearch) nothrow
  {
    adw_combo_row_set_enable_search(cast(AdwComboRow*)this._cPtr, enableSearch);
  }

  /**
      Sets the expression used to obtain strings from items.
      
      The expression must have a value type of `G_TYPE_STRING`.
      
      It's used to bind strings to labels produced by the default factory if
      [gid.adw1.combo_row.ComboRow.factory] is not set, or when
      [gid.adw1.combo_row.ComboRow.useSubtitle] is set to `TRUE`.
  
      Params:
        expression = an expression
  */
  void setExpression(gid.gtk4.expression.Expression expression = null) nothrow
  {
    adw_combo_row_set_expression(cast(AdwComboRow*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets the factory for populating list items.
      
      This factory is always used for the item in the row. It is also used for
      items in the popup unless [gid.adw1.combo_row.ComboRow.listFactory] is set.
  
      Params:
        factory = the factory to use
  */
  void setFactory(gid.gtk4.list_item_factory.ListItemFactory factory = null) nothrow
  {
    adw_combo_row_set_factory(cast(AdwComboRow*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the factory to use for creating header widgets for the popup.
  
      Params:
        factory = the factory to use
  */
  void setHeaderFactory(gid.gtk4.list_item_factory.ListItemFactory factory = null) nothrow
  {
    adw_combo_row_set_header_factory(cast(AdwComboRow*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the factory for populating list items in the popup.
      
      If this is not set, [gid.adw1.combo_row.ComboRow.factory] is used.
  
      Params:
        factory = the factory to use
  */
  void setListFactory(gid.gtk4.list_item_factory.ListItemFactory factory = null) nothrow
  {
    adw_combo_row_set_list_factory(cast(AdwComboRow*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the model that provides the displayed items.
  
      Params:
        model = the model to use
  */
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    adw_combo_row_set_model(cast(AdwComboRow*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets the match mode for the search filter.
  
      Params:
        searchMatchMode = the new match mode
  */
  void setSearchMatchMode(gid.gtk4.types.StringFilterMatchMode searchMatchMode) nothrow
  {
    adw_combo_row_set_search_match_mode(cast(AdwComboRow*)this._cPtr, searchMatchMode);
  }

  /**
      Selects the item at the given position.
  
      Params:
        position = the position of the item to select, or
            [gid.gtk4.types.INVALID_LIST_POSITION]
  */
  void setSelected(uint position) nothrow
  {
    adw_combo_row_set_selected(cast(AdwComboRow*)this._cPtr, position);
  }

  /**
      Sets whether to use the current value as the subtitle.
      
      If you use a custom list item factory, you will need to give the row a
      name conversion expression with [gid.adw1.combo_row.ComboRow.expression].
      
      If set to `TRUE`, you should not access [gid.adw1.action_row.ActionRow.subtitle].
      
      The subtitle is interpreted as Pango markup if
      [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `TRUE`.
  
      Params:
        useSubtitle = whether to use the current value as the subtitle
  */
  void setUseSubtitle(bool useSubtitle) nothrow
  {
    adw_combo_row_set_use_subtitle(cast(AdwComboRow*)this._cPtr, useSubtitle);
  }
}

/// Fluent builder implementation template for [gid.adw1.combo_row.ComboRow]
class ComboRowGidBuilderImpl(T) : gid.adw1.action_row.ActionRowGidBuilderImpl!T
{


  /**
      Set `enableSearch` property.
      Params:
        propval = Whether to show a search entry in the popup.
          
          If set to `TRUE`, a search entry will be shown in the popup that
          allows to search for items in the list.
          
          Search requires [gid.adw1.combo_row.ComboRow.expression] to be set.
      Returns: Builder instance for fluent chaining
  */
  T enableSearch(bool propval) nothrow
  {
    return setProperty("enable-search", propval);
  }

  /**
      Set `expression` property.
      Params:
        propval = An expression used to obtain strings from items.
          
          The expression must have a value type of `G_TYPE_STRING`.
          
          It's used to bind strings to labels produced by the default factory if
          [gid.adw1.combo_row.ComboRow.factory] is not set, or when
          [gid.adw1.combo_row.ComboRow.useSubtitle] is set to `TRUE`.
      Returns: Builder instance for fluent chaining
  */
  T expression(gid.gtk4.expression.Expression propval) nothrow
  {
    return setProperty("expression", propval);
  }

  /**
      Set `factory` property.
      Params:
        propval = Factory for populating list items.
          
          This factory is always used for the item in the row. It is also used for
          items in the popup unless [gid.adw1.combo_row.ComboRow.listFactory] is set.
      Returns: Builder instance for fluent chaining
  */
  T factory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    return setProperty("factory", propval);
  }

  /**
      Set `headerFactory` property.
      Params:
        propval = The factory for creating header widgets for the popup.
      Returns: Builder instance for fluent chaining
  */
  T headerFactory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    return setProperty("header-factory", propval);
  }

  /**
      Set `listFactory` property.
      Params:
        propval = The factory for populating list items in the popup.
          
          If this is not set, [gid.adw1.combo_row.ComboRow.factory] is used.
      Returns: Builder instance for fluent chaining
  */
  T listFactory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    return setProperty("list-factory", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model that provides the displayed items.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `searchMatchMode` property.
      Params:
        propval = The match mode for the search filter.
      Returns: Builder instance for fluent chaining
  */
  T searchMatchMode(gid.gtk4.types.StringFilterMatchMode propval) nothrow
  {
    return setProperty("search-match-mode", propval);
  }

  /**
      Set `selected` property.
      Params:
        propval = The position of the selected item.
          
          If no item is selected, the property has the value
          [gid.gtk4.types.INVALID_LIST_POSITION]
      Returns: Builder instance for fluent chaining
  */
  T selected(uint propval) nothrow
  {
    return setProperty("selected", propval);
  }

  /**
      Set `useSubtitle` property.
      Params:
        propval = Whether to use the current value as the subtitle.
          
          If you use a custom list item factory, you will need to give the row a
          name conversion expression with [gid.adw1.combo_row.ComboRow.expression].
          
          If set to `TRUE`, you should not access [gid.adw1.action_row.ActionRow.subtitle].
          
          The subtitle is interpreted as Pango markup if
          [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `TRUE`.
      Returns: Builder instance for fluent chaining
  */
  T useSubtitle(bool propval) nothrow
  {
    return setProperty("use-subtitle", propval);
  }
}

/// Fluent builder for [gid.adw1.combo_row.ComboRow]
final class ComboRowGidBuilder : ComboRowGidBuilderImpl!ComboRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ComboRow build() nothrow
  {
    return new ComboRow(cast(void*)createGObject(ComboRow._getGType), Yes.Take);
  }
}
