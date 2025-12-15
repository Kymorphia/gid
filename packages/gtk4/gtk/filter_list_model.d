/// Module for [FilterListModel] class
module gtk.filter_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.filter;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.types;

/**
    [gtk.filter_list_model.FilterListModel] is a list model that filters the elements of
    the underlying model according to a [gtk.filter.Filter].
    
    It hides some elements from the other model according to
    criteria given by a [gtk.filter.Filter].
    
    The model can be set up to do incremental filtering, so that
    filtering long lists doesn't block the UI. See
    [gtk.filter_list_model.FilterListModel.setIncremental] for details.
    
    [gtk.filter_list_model.FilterListModel] passes through sections from the underlying model.
*/
class FilterListModel : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel
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
    return cast(void function())gtk_filter_list_model_get_type != &gidSymbolNotFound ? gtk_filter_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterListModel self()
  {
    return this;
  }

  /**
      Get `filter` property.
      Returns: The filter for this model.
  */
  @property gtk.filter.Filter filter()
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The filter for this model.
  */
  @property void filter(gtk.filter.Filter propval)
  {
    return setFilter(propval);
  }

  /**
      Get `incremental` property.
      Returns: If the model should filter items incrementally.
  */
  @property bool incremental()
  {
    return getIncremental();
  }

  /**
      Set `incremental` property.
      Params:
        propval = If the model should filter items incrementally.
  */
  @property void incremental(bool propval)
  {
    return setIncremental(propval);
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
      Returns: The model being filtered.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being filtered.
  */
  @property void model(gio.list_model.ListModel propval)
  {
    return setModel(propval);
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
      Get `pending` property.
      Returns: Number of items not yet filtered.
  */
  @property uint pending()
  {
    return getPending();
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new [gtk.filter_list_model.FilterListModel] that will filter model using the given
      filter.
  
      Params:
        model = the model to sort
        filter = filter
      Returns: a new [gtk.filter_list_model.FilterListModel]
  */
  this(gio.list_model.ListModel model = null, gtk.filter.Filter filter = null)
  {
    GtkFilterListModel* _cretval;
    _cretval = gtk_filter_list_model_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, filter ? cast(GtkFilter*)filter._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the [gtk.filter.Filter] currently set on self.
      Returns: The filter currently in use
  */
  gtk.filter.Filter getFilter()
  {
    GtkFilter* _cretval;
    _cretval = gtk_filter_list_model_get_filter(cast(GtkFilterListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether incremental filtering is enabled.
      
      See [gtk.filter_list_model.FilterListModel.setIncremental].
      Returns: true if incremental filtering is enabled
  */
  bool getIncremental()
  {
    bool _retval;
    _retval = cast(bool)gtk_filter_list_model_get_incremental(cast(GtkFilterListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model currently filtered or null if none.
      Returns: The model that gets filtered
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_filter_list_model_get_model(cast(GtkFilterListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
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
      [gtk.filter_list_model.FilterListModel.incremental] is false - this
      function returns 0.
      Returns: The number of items not yet filtered
  */
  uint getPending()
  {
    uint _retval;
    _retval = gtk_filter_list_model_get_pending(cast(GtkFilterListModel*)this._cPtr);
    return _retval;
  }

  /**
      Sets the filter used to filter items.
  
      Params:
        filter = filter to use
  */
  void setFilter(gtk.filter.Filter filter = null)
  {
    gtk_filter_list_model_set_filter(cast(GtkFilterListModel*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the filter model to do an incremental sort.
      
      When incremental filtering is enabled, the [gtk.filter_list_model.FilterListModel] will not
      run filters immediately, but will instead queue an idle handler that
      incrementally filters the items and adds them to the list. This of course
      means that items are not instantly added to the list, but only appear
      incrementally.
      
      When your filter blocks the UI while filtering, you might consider
      turning this on. Depending on your model and filters, this may become
      interesting around 10,000 to 100,000 items.
      
      By default, incremental filtering is disabled.
      
      See [gtk.filter_list_model.FilterListModel.getPending] for progress information
      about an ongoing incremental filtering operation.
  
      Params:
        incremental = true to enable incremental filtering
  */
  void setIncremental(bool incremental)
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
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_filter_list_model_set_model(cast(GtkFilterListModel*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}
