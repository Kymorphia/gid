/// Module for [GridView] class
module gtk.grid_view;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.list_base;
import gtk.list_item_factory;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scroll_info;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.selection_model;
import gtk.types;

/**
    [gtk.grid_view.GridView] presents a large dynamic grid of items.
    
    [gtk.grid_view.GridView] uses its factory to generate one child widget for each
    visible item and shows them in a grid. The orientation of the grid view
    determines if the grid reflows vertically or horizontally.
    
    [gtk.grid_view.GridView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on _rubberband selection_, using
    `property@Gtk.GridView:enable-rubberband`.
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    # CSS nodes
    
    ```
    gridview
    ├── child[.activatable]
    │
    ├── child[.activatable]
    │
    ┊
    ╰── [rubberband]
    ```
    
    [gtk.grid_view.GridView] uses a single CSS node with name `gridview`. Each child uses
    a single CSS node with name `child`. If the [gtk.list_item.ListItem.activatable]
    property is set, the corresponding row will have the `.activatable` style
    class. For rubberband selection, a subnode with name `rubberband` is used.
    
    # Accessibility
    
    [gtk.grid_view.GridView] uses the [gtk.types.AccessibleRole.Grid] role, and the items
    use the [gtk.types.AccessibleRole.GridCell] role.
*/
class GridView : gtk.list_base.ListBase
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
    return cast(void function())gtk_grid_view_get_type != &gidSymbolNotFound ? gtk_grid_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GridView self()
  {
    return this;
  }

  /**
      Get `enableRubberband` property.
      Returns: Allow rubberband selection.
  */
  @property bool enableRubberband()
  {
    return getEnableRubberband();
  }

  /**
      Set `enableRubberband` property.
      Params:
        propval = Allow rubberband selection.
  */
  @property void enableRubberband(bool propval)
  {
    return setEnableRubberband(propval);
  }

  /**
      Get `factory` property.
      Returns: Factory for populating list items.
  */
  @property gtk.list_item_factory.ListItemFactory factory()
  {
    return getFactory();
  }

  /**
      Set `factory` property.
      Params:
        propval = Factory for populating list items.
  */
  @property void factory(gtk.list_item_factory.ListItemFactory propval)
  {
    return setFactory(propval);
  }

  /**
      Get `maxColumns` property.
      Returns: Maximum number of columns per row.
      
      If this number is smaller than `property@Gtk.GridView:min-columns`,
      that value is used instead.
  */
  @property uint maxColumns()
  {
    return getMaxColumns();
  }

  /**
      Set `maxColumns` property.
      Params:
        propval = Maximum number of columns per row.
        
        If this number is smaller than `property@Gtk.GridView:min-columns`,
        that value is used instead.
  */
  @property void maxColumns(uint propval)
  {
    return setMaxColumns(propval);
  }

  /**
      Get `minColumns` property.
      Returns: Minimum number of columns per row.
  */
  @property uint minColumns()
  {
    return getMinColumns();
  }

  /**
      Set `minColumns` property.
      Params:
        propval = Minimum number of columns per row.
  */
  @property void minColumns(uint propval)
  {
    return setMinColumns(propval);
  }

  /**
      Get `model` property.
      Returns: Model for the items displayed.
  */
  @property gtk.selection_model.SelectionModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = Model for the items displayed.
  */
  @property void model(gtk.selection_model.SelectionModel propval)
  {
    return setModel(propval);
  }

  /**
      Get `singleClickActivate` property.
      Returns: Activate rows on single click and select them on hover.
  */
  @property bool singleClickActivate()
  {
    return getSingleClickActivate();
  }

  /**
      Set `singleClickActivate` property.
      Params:
        propval = Activate rows on single click and select them on hover.
  */
  @property void singleClickActivate(bool propval)
  {
    return setSingleClickActivate(propval);
  }

  /**
      Get `tabBehavior` property.
      Returns: Behavior of the <kbd>Tab</kbd> key
  */
  @property gtk.types.ListTabBehavior tabBehavior()
  {
    return getTabBehavior();
  }

  /**
      Set `tabBehavior` property.
      Params:
        propval = Behavior of the <kbd>Tab</kbd> key
  */
  @property void tabBehavior(gtk.types.ListTabBehavior propval)
  {
    return setTabBehavior(propval);
  }

  /**
      Creates a new [gtk.grid_view.GridView] that uses the given factory for
      mapping items to widgets.
      
      The function takes ownership of the
      arguments, so you can write code like
      ```c
      grid_view = gtk_grid_view_new (create_model (),
        gtk_builder_list_item_factory_new_from_resource ("/resource.ui"));
      ```
  
      Params:
        model = the model to use
        factory = The factory to populate items with
      Returns: a new [gtk.grid_view.GridView] using the given model and factory
  */
  this(gtk.selection_model.SelectionModel model = null, gtk.list_item_factory.ListItemFactory factory = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_grid_view_new(model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, factory ? cast(GtkListItemFactory*)factory._cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Returns whether rows can be selected by dragging with the mouse.
      Returns: true if rubberband selection is enabled
  */
  bool getEnableRubberband()
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_view_get_enable_rubberband(cast(GtkGridView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate list items.
      Returns: The factory in use
  */
  gtk.list_item_factory.ListItemFactory getFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_grid_view_get_factory(cast(GtkGridView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the maximum number of columns that the grid will use.
      Returns: The maximum number of columns
  */
  uint getMaxColumns()
  {
    uint _retval;
    _retval = gtk_grid_view_get_max_columns(cast(GtkGridView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum number of columns that the grid will use.
      Returns: The minimum number of columns
  */
  uint getMinColumns()
  {
    uint _retval;
    _retval = gtk_grid_view_get_min_columns(cast(GtkGridView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model that's currently used to read the items displayed.
      Returns: The model in use
  */
  gtk.selection_model.SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_grid_view_get_model(cast(GtkGridView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether items will be activated on single click and
      selected on hover.
      Returns: true if items are activated on single click
  */
  bool getSingleClickActivate()
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_view_get_single_click_activate(cast(GtkGridView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the behavior set for the <kbd>Tab</kbd> key.
      Returns: The behavior of the <kbd>Tab</kbd> key
  */
  gtk.types.ListTabBehavior getTabBehavior()
  {
    GtkListTabBehavior _cretval;
    _cretval = gtk_grid_view_get_tab_behavior(cast(GtkGridView*)this._cPtr);
    gtk.types.ListTabBehavior _retval = cast(gtk.types.ListTabBehavior)_cretval;
    return _retval;
  }

  /**
      Scrolls to the item at the given position and performs the actions
      specified in flags.
      
      This function works no matter if the gridview is shown or focused.
      If it isn't, then the changes will take effect once that happens.
  
      Params:
        pos = position of the item
        flags = actions to perform
        scroll = details of how to perform
            the scroll operation or null to scroll into view
  */
  void scrollTo(uint pos, gtk.types.ListScrollFlags flags, gtk.scroll_info.ScrollInfo scroll = null)
  {
    gtk_grid_view_scroll_to(cast(GtkGridView*)this._cPtr, pos, flags, scroll ? cast(GtkScrollInfo*)scroll._cPtr(Yes.Dup) : null);
  }

  /**
      Sets whether selections can be changed by dragging with the mouse.
  
      Params:
        enableRubberband = true to enable rubberband selection
  */
  void setEnableRubberband(bool enableRubberband)
  {
    gtk_grid_view_set_enable_rubberband(cast(GtkGridView*)this._cPtr, enableRubberband);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating list items.
  
      Params:
        factory = the factory to use
  */
  void setFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_grid_view_set_factory(cast(GtkGridView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the maximum number of columns to use.
      
      This number must be at least 1.
      
      If max_columns is smaller than the minimum set via
      [gtk.grid_view.GridView.setMinColumns], that value is used instead.
  
      Params:
        maxColumns = The maximum number of columns
  */
  void setMaxColumns(uint maxColumns)
  {
    gtk_grid_view_set_max_columns(cast(GtkGridView*)this._cPtr, maxColumns);
  }

  /**
      Sets the minimum number of columns to use.
      
      This number must be at least 1.
      
      If min_columns is smaller than the minimum set via
      [gtk.grid_view.GridView.setMaxColumns], that value is ignored.
  
      Params:
        minColumns = The minimum number of columns
  */
  void setMinColumns(uint minColumns)
  {
    gtk_grid_view_set_min_columns(cast(GtkGridView*)this._cPtr, minColumns);
  }

  /**
      Sets the model to use.
      
      This must be a [gtk.selection_model.SelectionModel].
  
      Params:
        model = the model to use
  */
  void setModel(gtk.selection_model.SelectionModel model = null)
  {
    gtk_grid_view_set_model(cast(GtkGridView*)this._cPtr, model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether items should be activated on single click and
      selected on hover.
  
      Params:
        singleClickActivate = true to activate items on single click
  */
  void setSingleClickActivate(bool singleClickActivate)
  {
    gtk_grid_view_set_single_click_activate(cast(GtkGridView*)this._cPtr, singleClickActivate);
  }

  /**
      Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
  
      Params:
        tabBehavior = The desired tab behavior
  */
  void setTabBehavior(gtk.types.ListTabBehavior tabBehavior)
  {
    gtk_grid_view_set_tab_behavior(cast(GtkGridView*)this._cPtr, tabBehavior);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when a cell has been activated by the user,
      usually via activating the GtkGridView|list.activate-item action.
      
      This allows for a convenient way to handle activation in a gridview.
      See [gtk.list_item.ListItem.activatable] for details on how to use
      this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, gtk.grid_view.GridView gridView))
  
          `position` position of item to activate (optional)
  
          `gridView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.grid_view.GridView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
