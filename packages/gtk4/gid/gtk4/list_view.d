/// Module for [ListView] class
module gid.gtk4.list_view;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.list_base;
import gid.gtk4.list_item_factory;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.scroll_info;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.types;

/**
    Presents a large dynamic list of items.
    
    [gid.gtk4.list_view.ListView] uses its factory to generate one row widget for each visible
    item and shows them in a linear display, either vertically or horizontally.
    
    The [gid.gtk4.list_view.ListView.showSeparators] property offers a simple way to
    display separators between the rows.
    
    [gid.gtk4.list_view.ListView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on _rubberband selection_, using
    [gid.gtk4.list_view.ListView.enableRubberband].
    
    If you need multiple columns with headers, see [gid.gtk4.column_view.ColumnView].
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    An example of using [gid.gtk4.list_view.ListView]:
    ```c
    static void
    setup_listitem_cb (GtkListItemFactory *factory,
                       GtkListItem        *list_item)
    {
      GtkWidget *image;
    
      image = gtk_image_new ();
      gtk_image_set_icon_size (GTK_IMAGE (image), GTK_ICON_SIZE_LARGE);
      gtk_list_item_set_child (list_item, image);
    }
    
    static void
    bind_listitem_cb (GtkListItemFactory *factory,
                      GtkListItem        *list_item)
    {
      GtkWidget *image;
      GAppInfo *app_info;
    
      image = gtk_list_item_get_child (list_item);
      app_info = gtk_list_item_get_item (list_item);
      gtk_image_set_from_gicon (GTK_IMAGE (image), g_app_info_get_icon (app_info));
    }
    
    static void
    activate_cb (GtkListView  *list,
                 guint         position,
                 gpointer      unused)
    {
      GAppInfo *app_info;
    
      app_info = g_list_model_get_item (G_LIST_MODEL (gtk_list_view_get_model (list)), position);
      g_app_info_launch (app_info, NULL, NULL, NULL);
      g_object_unref (app_info);
    }
    
    ...
    
      model = create_application_list ();
    
      factory = gtk_signal_list_item_factory_new ();
      g_signal_connect (factory, "setup", G_CALLBACK (setup_listitem_cb), NULL);
      g_signal_connect (factory, "bind", G_CALLBACK (bind_listitem_cb), NULL);
    
      list = gtk_list_view_new (GTK_SELECTION_MODEL (gtk_single_selection_new (model)), factory);
    
      g_signal_connect (list, "activate", G_CALLBACK (activate_cb), NULL);
    
      gtk_scrolled_window_set_child (GTK_SCROLLED_WINDOW (sw), list);
    ```
    
    # Actions
    
    [gid.gtk4.list_view.ListView] defines a set of built-in actions:
    
    - `list.activate-item` activates the item at given position by emitting
      the [gid.gtk4.list_view.ListView.activate] signal.
    
    # CSS nodes
    
    ```
    listview[.separators][.rich-list][.navigation-sidebar][.data-table]
    ├── row[.activatable]
    │
    ├── row[.activatable]
    │
    ┊
    ╰── [rubberband]
    ```
    
    [gid.gtk4.list_view.ListView] uses a single CSS node named `listview`. It may carry the
    `.separators` style class, when [gid.gtk4.list_view.ListView.showSeparators]
    property is set. Each child widget uses a single CSS node named `row`.
    If the [gid.gtk4.list_item.ListItem.activatable] property is set, the
    corresponding row will have the `.activatable` style class. For
    rubberband selection, a node with name `rubberband` is used.
    
    The main listview node may also carry style classes to select
    the style of [list presentation](section-list-widget.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gid.gtk4.list_view.ListView] uses the [gid.gtk4.types.AccessibleRole.List] role, and the list
    items use the [gid.gtk4.types.AccessibleRole.ListItem] role.
*/
@gidGir("ListView", "ListViewClass")
class ListView : gid.gtk4.list_base.ListBase
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
    return cast(void function())gtk_list_view_get_type != &gidSymbolNotFound ? gtk_list_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkListView";
  }

  /** Returns `this`, for use in `with` statements. */
  override ListView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.list_view.ListView]
      Returns: New builder object
  */
  static ListViewGidBuilder builder() nothrow
  {
    return new ListViewGidBuilder;
  }

  /**
      Get `enableRubberband` property.
      Returns: Allow rubberband selection.
  */
  @property bool enableRubberband() nothrow
  {
    return getEnableRubberband();
  }

  /**
      Set `enableRubberband` property.
      Params:
        propval = Allow rubberband selection.
  */
  @property void enableRubberband(bool propval) nothrow
  {
    setEnableRubberband(propval);
  }

  /**
      Get `factory` property.
      Returns: Factory for populating list items.
        
        The factory must be for configuring [gid.gtk4.list_item.ListItem] objects.
  */
  @property gid.gtk4.list_item_factory.ListItemFactory factory() nothrow
  {
    return getFactory();
  }

  /**
      Set `factory` property.
      Params:
        propval = Factory for populating list items.
          
          The factory must be for configuring [gid.gtk4.list_item.ListItem] objects.
  */
  @property void factory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    setFactory(propval);
  }

  /**
      Get `headerFactory` property.
      Returns: Factory for creating header widgets.
        
        The factory must be for configuring [gid.gtk4.list_header.ListHeader] objects.
  */
  @property gid.gtk4.list_item_factory.ListItemFactory headerFactory() nothrow
  {
    return getHeaderFactory();
  }

  /**
      Set `headerFactory` property.
      Params:
        propval = Factory for creating header widgets.
          
          The factory must be for configuring [gid.gtk4.list_header.ListHeader] objects.
  */
  @property void headerFactory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    setHeaderFactory(propval);
  }

  /**
      Get `model` property.
      Returns: Model for the items displayed.
  */
  @property gid.gtk4.selection_model.SelectionModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = Model for the items displayed.
  */
  @property void model(gid.gtk4.selection_model.SelectionModel propval) nothrow
  {
    setModel(propval);
  }

  /**
      Get `showSeparators` property.
      Returns: Show separators between rows.
  */
  @property bool showSeparators() nothrow
  {
    return getShowSeparators();
  }

  /**
      Set `showSeparators` property.
      Params:
        propval = Show separators between rows.
  */
  @property void showSeparators(bool propval) nothrow
  {
    setShowSeparators(propval);
  }

  /**
      Get `singleClickActivate` property.
      Returns: Activate rows on single click and select them on hover.
  */
  @property bool singleClickActivate() nothrow
  {
    return getSingleClickActivate();
  }

  /**
      Set `singleClickActivate` property.
      Params:
        propval = Activate rows on single click and select them on hover.
  */
  @property void singleClickActivate(bool propval) nothrow
  {
    setSingleClickActivate(propval);
  }

  /**
      Get `tabBehavior` property.
      Returns: Behavior of the <kbd>Tab</kbd> key
  */
  @property gid.gtk4.types.ListTabBehavior tabBehavior() nothrow
  {
    return getTabBehavior();
  }

  /**
      Set `tabBehavior` property.
      Params:
        propval = Behavior of the <kbd>Tab</kbd> key
  */
  @property void tabBehavior(gid.gtk4.types.ListTabBehavior propval) nothrow
  {
    setTabBehavior(propval);
  }

  /**
      Creates a new [gid.gtk4.list_view.ListView] that uses the given factory for
      mapping items to widgets.
      
      The function takes ownership of the
      arguments, so you can write code like
      ```c
      list_view = gtk_list_view_new (create_model (),
        gtk_builder_list_item_factory_new_from_resource ("/resource.ui"));
      ```
  
      Params:
        model = the model to use
        factory = The factory to populate items with
      Returns: a new [gid.gtk4.list_view.ListView] using the given model and factory
  */
  this(gid.gtk4.selection_model.SelectionModel model = null, gid.gtk4.list_item_factory.ListItemFactory factory = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, model !is null || factory !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_list_view_new(model ? cast(GtkSelectionModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, factory ? cast(GtkListItemFactory*)factory._cPtr(Yes.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether rows can be selected by dragging with the mouse.
      Returns: true if rubberband selection is enabled
  */
  bool getEnableRubberband() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_view_get_enable_rubberband(cast(GtkListView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate list items.
      Returns: The factory in use
  */
  gid.gtk4.list_item_factory.ListItemFactory getFactory() nothrow
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_list_view_get_factory(cast(GtkListView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate section headers.
      Returns: The factory in use
  */
  gid.gtk4.list_item_factory.ListItemFactory getHeaderFactory() nothrow
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_list_view_get_header_factory(cast(GtkListView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the model that's currently used to read the items displayed.
      Returns: The model in use
  */
  gid.gtk4.selection_model.SelectionModel getModel() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_list_view_get_model(cast(GtkListView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the listview should show separators
      between rows.
      Returns: true if the listview shows separators
  */
  bool getShowSeparators() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_view_get_show_separators(cast(GtkListView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether rows will be activated on single click and
      selected on hover.
      Returns: true if rows are activated on single click
  */
  bool getSingleClickActivate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_view_get_single_click_activate(cast(GtkListView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the behavior set for the <kbd>Tab</kbd> key.
      Returns: The behavior of the <kbd>Tab</kbd> key
  */
  gid.gtk4.types.ListTabBehavior getTabBehavior() nothrow
  {
    GtkListTabBehavior _cretval;
    _cretval = gtk_list_view_get_tab_behavior(cast(GtkListView*)this._cPtr);
    gid.gtk4.types.ListTabBehavior _retval = cast(gid.gtk4.types.ListTabBehavior)_cretval;
    return _retval;
  }

  /**
      Scrolls to the item at the given position and performs the actions
      specified in flags.
      
      This function works no matter if the listview is shown or focused.
      If it isn't, then the changes will take effect once that happens.
  
      Params:
        pos = position of the item. Must be less than the number of
            items in the view.
        flags = actions to perform
        scroll = details of how to perform
            the scroll operation or null to scroll into view
  */
  void scrollTo(uint pos, gid.gtk4.types.ListScrollFlags flags, gid.gtk4.scroll_info.ScrollInfo scroll = null) nothrow
  {
    gtk_list_view_scroll_to(cast(GtkListView*)this._cPtr, pos, flags, scroll ? cast(GtkScrollInfo*)scroll._cPtr(Yes.Dup) : null);
  }

  /**
      Sets whether selections can be changed by dragging with the mouse.
  
      Params:
        enableRubberband = whether to enable rubberband selection
  */
  void setEnableRubberband(bool enableRubberband) nothrow
  {
    gtk_list_view_set_enable_rubberband(cast(GtkListView*)this._cPtr, enableRubberband);
  }

  /**
      Sets the [gid.gtk4.list_item_factory.ListItemFactory] to use for populating list items.
  
      Params:
        factory = the factory to use
  */
  void setFactory(gid.gtk4.list_item_factory.ListItemFactory factory = null) nothrow
  {
    gtk_list_view_set_factory(cast(GtkListView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.list_item_factory.ListItemFactory] to use for populating the
      [gid.gtk4.list_header.ListHeader] objects used in section headers.
      
      If this factory is set to `NULL`, the list will not show
      section headers.
  
      Params:
        factory = the factory to use
  */
  void setHeaderFactory(gid.gtk4.list_item_factory.ListItemFactory factory = null) nothrow
  {
    gtk_list_view_set_header_factory(cast(GtkListView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the model to use.
      
      This must be a [gid.gtk4.selection_model.SelectionModel] to use.
  
      Params:
        model = the model to use
  */
  void setModel(gid.gtk4.selection_model.SelectionModel model = null) nothrow
  {
    gtk_list_view_set_model(cast(GtkListView*)this._cPtr, model ? cast(GtkSelectionModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the listview should show separators
      between rows.
  
      Params:
        showSeparators = whether to show separators
  */
  void setShowSeparators(bool showSeparators) nothrow
  {
    gtk_list_view_set_show_separators(cast(GtkListView*)this._cPtr, showSeparators);
  }

  /**
      Sets whether rows should be activated on single click and
      selected on hover.
  
      Params:
        singleClickActivate = whether to activate items on single click
  */
  void setSingleClickActivate(bool singleClickActivate) nothrow
  {
    gtk_list_view_set_single_click_activate(cast(GtkListView*)this._cPtr, singleClickActivate);
  }

  /**
      Sets the <kbd>Tab</kbd> key behavior.
      
      This influences how the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys move the
      focus in the listview.
  
      Params:
        tabBehavior = The desired tab behavior
  */
  void setTabBehavior(gid.gtk4.types.ListTabBehavior tabBehavior) nothrow
  {
    gtk_list_view_set_tab_behavior(cast(GtkListView*)this._cPtr, tabBehavior);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when a row has been activated by the user.
        
        Activation usually happens via the list.activate-item action of
        the [gid.gtk4.list_view.ListView].
        
        This allows for a convenient way to handle activation in a listview.
        See [gid.gtk4.list_item.ListItem.setActivatable] for details on how to use
        this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint position, gid.gtk4.list_view.ListView listView)`
  
          `position` position of item to activate (optional)
  
          `listView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.list_view.ListView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_view.ListView.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.list_view.ListView]
class ListViewGidBuilderImpl(T) : gid.gtk4.list_base.ListBaseGidBuilderImpl!T
{


  /**
      Set `enableRubberband` property.
      Params:
        propval = Allow rubberband selection.
      Returns: Builder instance for fluent chaining
  */
  T enableRubberband(bool propval) nothrow
  {
    return setProperty("enable-rubberband", propval);
  }

  /**
      Set `factory` property.
      Params:
        propval = Factory for populating list items.
          
          The factory must be for configuring [gid.gtk4.list_item.ListItem] objects.
      Returns: Builder instance for fluent chaining
  */
  T factory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    return setProperty("factory", propval);
  }

  /**
      Set `headerFactory` property.
      Params:
        propval = Factory for creating header widgets.
          
          The factory must be for configuring [gid.gtk4.list_header.ListHeader] objects.
      Returns: Builder instance for fluent chaining
  */
  T headerFactory(gid.gtk4.list_item_factory.ListItemFactory propval) nothrow
  {
    return setProperty("header-factory", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = Model for the items displayed.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gtk4.selection_model.SelectionModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `showSeparators` property.
      Params:
        propval = Show separators between rows.
      Returns: Builder instance for fluent chaining
  */
  T showSeparators(bool propval) nothrow
  {
    return setProperty("show-separators", propval);
  }

  /**
      Set `singleClickActivate` property.
      Params:
        propval = Activate rows on single click and select them on hover.
      Returns: Builder instance for fluent chaining
  */
  T singleClickActivate(bool propval) nothrow
  {
    return setProperty("single-click-activate", propval);
  }

  /**
      Set `tabBehavior` property.
      Params:
        propval = Behavior of the <kbd>Tab</kbd> key
      Returns: Builder instance for fluent chaining
  */
  T tabBehavior(gid.gtk4.types.ListTabBehavior propval) nothrow
  {
    return setProperty("tab-behavior", propval);
  }
}

/// Fluent builder for [gid.gtk4.list_view.ListView]
final class ListViewGidBuilder : ListViewGidBuilderImpl!ListViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListView build() nothrow
  {
    return new ListView(cast(void*)createGObject(ListView._getGType), Yes.Take);
  }
}
