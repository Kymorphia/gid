/// Module for [ListView] class
module gtk.list_view;

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
    [gtk.list_view.ListView] presents a large dynamic list of items.
    
    [gtk.list_view.ListView] uses its factory to generate one row widget for each visible
    item and shows them in a linear display, either vertically or horizontally.
    
    The `property@Gtk.ListView:show-separators` property offers a simple way to
    display separators between the rows.
    
    [gtk.list_view.ListView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on _rubberband selection_, using
    `property@Gtk.ListView:enable-rubberband`.
    
    If you need multiple columns with headers, see [gtk.column_view.ColumnView].
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    An example of using [gtk.list_view.ListView]:
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
    
    [gtk.list_view.ListView] uses a single CSS node named `listview`. It may carry the
    `.separators` style class, when `property@Gtk.ListView:show-separators`
    property is set. Each child widget uses a single CSS node named `row`.
    If the [gtk.list_item.ListItem.activatable] property is set, the
    corresponding row will have the `.activatable` style class. For
    rubberband selection, a node with name `rubberband` is used.
    
    The main listview node may also carry style classes to select
    the style of [list presentation](ListContainers.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gtk.list_view.ListView] uses the [gtk.types.AccessibleRole.List] role, and the list
    items use the [gtk.types.AccessibleRole.ListItem] role.
*/
class ListView : gtk.list_base.ListBase
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
    return cast(void function())gtk_list_view_get_type != &gidSymbolNotFound ? gtk_list_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListView self()
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
      Get `headerFactory` property.
      Returns: Factory for creating header widgets.
  */
  @property gtk.list_item_factory.ListItemFactory headerFactory()
  {
    return getHeaderFactory();
  }

  /**
      Set `headerFactory` property.
      Params:
        propval = Factory for creating header widgets.
  */
  @property void headerFactory(gtk.list_item_factory.ListItemFactory propval)
  {
    return setHeaderFactory(propval);
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
      Get `showSeparators` property.
      Returns: Show separators between rows.
  */
  @property bool showSeparators()
  {
    return getShowSeparators();
  }

  /**
      Set `showSeparators` property.
      Params:
        propval = Show separators between rows.
  */
  @property void showSeparators(bool propval)
  {
    return setShowSeparators(propval);
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
      Creates a new [gtk.list_view.ListView] that uses the given factory for
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
      Returns: a new [gtk.list_view.ListView] using the given model and factory
  */
  this(gtk.selection_model.SelectionModel model = null, gtk.list_item_factory.ListItemFactory factory = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_view_new(model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, factory ? cast(GtkListItemFactory*)factory._cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Returns whether rows can be selected by dragging with the mouse.
      Returns: true if rubberband selection is enabled
  */
  bool getEnableRubberband()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_view_get_enable_rubberband(cast(GtkListView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate list items.
      Returns: The factory in use
  */
  gtk.list_item_factory.ListItemFactory getFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_list_view_get_factory(cast(GtkListView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate section headers.
      Returns: The factory in use
  */
  gtk.list_item_factory.ListItemFactory getHeaderFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_list_view_get_header_factory(cast(GtkListView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the model that's currently used to read the items displayed.
      Returns: The model in use
  */
  gtk.selection_model.SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_list_view_get_model(cast(GtkListView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the list box should show separators
      between rows.
      Returns: true if the list box shows separators
  */
  bool getShowSeparators()
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
  bool getSingleClickActivate()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_view_get_single_click_activate(cast(GtkListView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the behavior set for the <kbd>Tab</kbd> key.
      Returns: The behavior of the <kbd>Tab</kbd> key
  */
  gtk.types.ListTabBehavior getTabBehavior()
  {
    GtkListTabBehavior _cretval;
    _cretval = gtk_list_view_get_tab_behavior(cast(GtkListView*)this._cPtr);
    gtk.types.ListTabBehavior _retval = cast(gtk.types.ListTabBehavior)_cretval;
    return _retval;
  }

  /**
      Scrolls to the item at the given position and performs the actions
      specified in flags.
      
      This function works no matter if the listview is shown or focused.
      If it isn't, then the changes will take effect once that happens.
  
      Params:
        pos = position of the item
        flags = actions to perform
        scroll = details of how to perform
            the scroll operation or null to scroll into view
  */
  void scrollTo(uint pos, gtk.types.ListScrollFlags flags, gtk.scroll_info.ScrollInfo scroll = null)
  {
    gtk_list_view_scroll_to(cast(GtkListView*)this._cPtr, pos, flags, scroll ? cast(GtkScrollInfo*)scroll._cPtr(Yes.Dup) : null);
  }

  /**
      Sets whether selections can be changed by dragging with the mouse.
  
      Params:
        enableRubberband = true to enable rubberband selection
  */
  void setEnableRubberband(bool enableRubberband)
  {
    gtk_list_view_set_enable_rubberband(cast(GtkListView*)this._cPtr, enableRubberband);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating list items.
  
      Params:
        factory = the factory to use
  */
  void setFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_list_view_set_factory(cast(GtkListView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating the
      [gtk.list_header.ListHeader] objects used in section headers.
      
      If this factory is set to null, the list will not show section headers.
  
      Params:
        factory = the factory to use
  */
  void setHeaderFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_list_view_set_header_factory(cast(GtkListView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the model to use.
      
      This must be a [gtk.selection_model.SelectionModel] to use.
  
      Params:
        model = the model to use
  */
  void setModel(gtk.selection_model.SelectionModel model = null)
  {
    gtk_list_view_set_model(cast(GtkListView*)this._cPtr, model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the list box should show separators
      between rows.
  
      Params:
        showSeparators = true to show separators
  */
  void setShowSeparators(bool showSeparators)
  {
    gtk_list_view_set_show_separators(cast(GtkListView*)this._cPtr, showSeparators);
  }

  /**
      Sets whether rows should be activated on single click and
      selected on hover.
  
      Params:
        singleClickActivate = true to activate items on single click
  */
  void setSingleClickActivate(bool singleClickActivate)
  {
    gtk_list_view_set_single_click_activate(cast(GtkListView*)this._cPtr, singleClickActivate);
  }

  /**
      Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
  
      Params:
        tabBehavior = The desired tab behavior
  */
  void setTabBehavior(gtk.types.ListTabBehavior tabBehavior)
  {
    gtk_list_view_set_tab_behavior(cast(GtkListView*)this._cPtr, tabBehavior);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when a row has been activated by the user,
        usually via activating the GtkListView|list.activate-item action.
        
        This allows for a convenient way to handle activation in a listview.
        See [gtk.list_item.ListItem.setActivatable] for details on how to use
        this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, gtk.list_view.ListView listView))
  
          `position` position of item to activate (optional)
  
          `listView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.list_view.ListView)))
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
