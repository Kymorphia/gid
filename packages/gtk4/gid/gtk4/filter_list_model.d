/// Module for [FilterListModel] class
module gid.gtk4.filter_list_model;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.filter;
import gid.gtk4.section_model;
import gid.gtk4.section_model_mixin;
import gid.gtk4.types;

/**
    A list model that filters the elements of another model.
    
    It hides some elements from the underlying model according to
    criteria given by a [gid.gtk4.filter.Filter].
    
    The model can be set up to do incremental filtering, so that
    filtering long lists doesn't block the UI. See
    [gid.gtk4.filter_list_model.FilterListModel.setIncremental] for details.
    
    [gid.gtk4.filter_list_model.FilterListModel] passes through sections from the underlying model.
*/
@gidGir("FilterListModel", "FilterListModelClass")
class FilterListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel
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
    return cast(void function())gtk_filter_list_model_get_type != &gidSymbolNotFound ? gtk_filter_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFilterListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.filter_list_model.FilterListModel]
      Returns: New builder object
  */
  static FilterListModelGidBuilder builder() nothrow
  {
    return new FilterListModelGidBuilder;
  }

  /**
      Get `filter` property.
      Returns: The filter for this model.
  */
  @property gid.gtk4.filter.Filter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The filter for this model.
  */
  @property void filter(gid.gtk4.filter.Filter propval) nothrow
  {
    setFilter(propval);
  }

  /**
      Get `incremental` property.
      Returns: If the model should filter items incrementally.
  */
  @property bool incremental() nothrow
  {
    return getIncremental();
  }

  /**
      Set `incremental` property.
      Params:
        propval = If the model should filter items incrementally.
  */
  @property void incremental(bool propval) nothrow
  {
    setIncremental(propval);
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
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
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
      Get `pending` property.
      Returns: Number of items not yet filtered.
  */
  @property uint pending() nothrow
  {
    return getPending();
  }

  /**
      Get `watchItems` property.
      Returns: Monitor the list items for changes. It may impact performance.
  */
  @property bool watchItems() nothrow
  {
    return getWatchItems();
  }

  /**
      Set `watchItems` property.
      Params:
        propval = Monitor the list items for changes. It may impact performance.
  */
  @property void watchItems(bool propval) nothrow
  {
    setWatchItems(propval);
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new [gid.gtk4.filter_list_model.FilterListModel] that will filter model using the given
      filter.
  
      Params:
        model = the model to sort
        filter = filter
      Returns: a new [gid.gtk4.filter_list_model.FilterListModel]
  */
  this(gid.gio2.list_model.ListModel model = null, gid.gtk4.filter.Filter filter = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, model !is null || filter !is null), Yes.Take);
    }
    else
    {
      GtkFilterListModel* _cretval;
      _cretval = gtk_filter_list_model_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, filter ? cast(GtkFilter*)filter._cPtr(Yes.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the [gid.gtk4.filter.Filter] currently set on self.
      Returns: The filter currently in use
  */
  gid.gtk4.filter.Filter getFilter() nothrow
  {
    GtkFilter* _cretval;
    _cretval = gtk_filter_list_model_get_filter(cast(GtkFilterListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether incremental filtering is enabled.
      
      See [gid.gtk4.filter_list_model.FilterListModel.setIncremental].
      Returns: true if incremental filtering is enabled
  */
  bool getIncremental() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_filter_list_model_get_incremental(cast(GtkFilterListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model currently filtered or null if none.
      Returns: The model that gets filtered
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_filter_list_model_get_model(cast(GtkFilterListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the number of items that have not been filtered yet.
      
      You can use this value to check if self is busy filtering by
      comparing the return value to 0 or you can compute the percentage
      of the filter remaining by dividing the return value by the total
      number of items in the underlying model:
      
      ```c
      pending = gtk_filter_list_model_get_pending (self);
      model = gtk_filter_list_model_get_model (self);
      percentage = pending / (double) g_list_model_get_n_items (model);
      ```
      
      If no filter operation is ongoing - in particular when
      [gid.gtk4.filter_list_model.FilterListModel.incremental] is false - this
      function returns 0.
      Returns: The number of items not yet filtered
  */
  uint getPending() nothrow
  {
    uint _retval;
    _retval = gtk_filter_list_model_get_pending(cast(GtkFilterListModel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether watching items is enabled.
      
      See [gid.gtk4.filter_list_model.FilterListModel.setWatchItems].
      Returns: true if watching items is enabled
  */
  bool getWatchItems() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_filter_list_model_get_watch_items(cast(GtkFilterListModel*)this._cPtr);
    return _retval;
  }

  /**
      Sets the filter used to filter items.
  
      Params:
        filter = filter to use
  */
  void setFilter(gid.gtk4.filter.Filter filter = null) nothrow
  {
    gtk_filter_list_model_set_filter(cast(GtkFilterListModel*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the filter model to do an incremental sort.
      
      When incremental filtering is enabled, the [gid.gtk4.filter_list_model.FilterListModel] will not
      run filters immediately, but will instead queue an idle handler that
      incrementally filters the items and adds them to the list. This of course
      means that items are not instantly added to the list, but only appear
      incrementally.
      
      When your filter blocks the UI while filtering, you might consider
      turning this on. Depending on your model and filters, this may become
      interesting around 10,000 to 100,000 items.
      
      By default, incremental filtering is disabled.
      
      See [gid.gtk4.filter_list_model.FilterListModel.getPending] for progress information
      about an ongoing incremental filtering operation.
  
      Params:
        incremental = true to enable incremental filtering
  */
  void setIncremental(bool incremental) nothrow
  {
    gtk_filter_list_model_set_incremental(cast(GtkFilterListModel*)this._cPtr, incremental);
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
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_filter_list_model_set_model(cast(GtkFilterListModel*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets the filter model to monitor properties of its items.
      
      This allows implementations of [gid.gtk4.filter.Filter] that support expression
      watching to react to property changes. This property has no effect if the
      current filter doesn't support watching items.
      
      By default, watching items is disabled.
  
      Params:
        watchItems = true to watch items for property changes
  */
  void setWatchItems(bool watchItems) nothrow
  {
    gtk_filter_list_model_set_watch_items(cast(GtkFilterListModel*)this._cPtr, watchItems);
  }
}

/// Fluent builder implementation template for [gid.gtk4.filter_list_model.FilterListModel]
class FilterListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `filter` property.
      Params:
        propval = The filter for this model.
      Returns: Builder instance for fluent chaining
  */
  T filter(gid.gtk4.filter.Filter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `incremental` property.
      Params:
        propval = If the model should filter items incrementally.
      Returns: Builder instance for fluent chaining
  */
  T incremental(bool propval) nothrow
  {
    return setProperty("incremental", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `watchItems` property.
      Params:
        propval = Monitor the list items for changes. It may impact performance.
      Returns: Builder instance for fluent chaining
  */
  T watchItems(bool propval) nothrow
  {
    return setProperty("watch-items", propval);
  }
}

/// Fluent builder for [gid.gtk4.filter_list_model.FilterListModel]
final class FilterListModelGidBuilder : FilterListModelGidBuilderImpl!FilterListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterListModel build() nothrow
  {
    return new FilterListModel(cast(void*)createGObject(FilterListModel._getGType), Yes.Take);
  }
}
