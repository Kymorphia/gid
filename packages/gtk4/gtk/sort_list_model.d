/// Module for [SortListModel] class
module gtk.sort_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.sorter;
import gtk.types;

/**
    A [gio.list_model.ListModel] that sorts the elements of an underlying model
    according to a [gtk.sorter.Sorter].
    
    The model is a stable sort. If two items compare equal according
    to the sorter, the one that appears first in the original model will
    also appear first after sorting.
    Note that if you change the sorter, the previous order will have no
    influence on the new order. If you want that, consider using a
    [gtk.multi_sorter.MultiSorter] and appending the previous sorter to it.
    
    The model can be set up to do incremental sorting, so that
    sorting long lists doesn't block the UI. See
    [gtk.sort_list_model.SortListModel.setIncremental] for details.
    
    [gtk.sort_list_model.SortListModel] is a generic model and because of that it
    cannot take advantage of any external knowledge when sorting.
    If you run into performance issues with [gtk.sort_list_model.SortListModel],
    it is strongly recommended that you write your own sorting list
    model.
    
    [gtk.sort_list_model.SortListModel] allows sorting the items into sections. It
    implements [gtk.section_model.SectionModel] and when `property@Gtk.SortListModel:section-sorter`
    is set, it will sort all items with that sorter and items comparing
    equal with it will be put into the same section.
    The [gtk.sort_list_model.SortListModel.sorter] will then be used to sort items
    inside their sections.
*/
class SortListModel : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel
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
    return cast(void function())gtk_sort_list_model_get_type != &gidSymbolNotFound ? gtk_sort_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SortListModel self()
  {
    return this;
  }

  /**
      Get `incremental` property.
      Returns: If the model should sort items incrementally.
  */
  @property bool incremental()
  {
    return getIncremental();
  }

  /**
      Set `incremental` property.
      Params:
        propval = If the model should sort items incrementally.
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
      Returns: The model being sorted.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being sorted.
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
      Returns: Estimate of unsorted items remaining.
  */
  @property uint pending()
  {
    return getPending();
  }

  /**
      Get `sectionSorter` property.
      Returns: The section sorter for this model, if one is set.
  */
  @property gtk.sorter.Sorter sectionSorter()
  {
    return getSectionSorter();
  }

  /**
      Set `sectionSorter` property.
      Params:
        propval = The section sorter for this model, if one is set.
  */
  @property void sectionSorter(gtk.sorter.Sorter propval)
  {
    return setSectionSorter(propval);
  }

  /**
      Get `sorter` property.
      Returns: The sorter for this model.
  */
  @property gtk.sorter.Sorter sorter()
  {
    return getSorter();
  }

  /**
      Set `sorter` property.
      Params:
        propval = The sorter for this model.
  */
  @property void sorter(gtk.sorter.Sorter propval)
  {
    return setSorter(propval);
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new sort list model that uses the sorter to sort model.
  
      Params:
        model = the model to sort
        sorter = the [gtk.sorter.Sorter] to sort model with,
      Returns: a new [gtk.sort_list_model.SortListModel]
  */
  this(gio.list_model.ListModel model = null, gtk.sorter.Sorter sorter = null)
  {
    GtkSortListModel* _cretval;
    _cretval = gtk_sort_list_model_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, sorter ? cast(GtkSorter*)sorter._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns whether incremental sorting is enabled.
      
      See [gtk.sort_list_model.SortListModel.setIncremental].
      Returns: true if incremental sorting is enabled
  */
  bool getIncremental()
  {
    bool _retval;
    _retval = cast(bool)gtk_sort_list_model_get_incremental(cast(GtkSortListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model currently sorted or null if none.
      Returns: The model that gets sorted
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_sort_list_model_get_model(cast(GtkSortListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Estimates progress of an ongoing sorting operation.
      
      The estimate is the number of items that would still need to be
      sorted to finish the sorting operation if this was a linear
      algorithm. So this number is not related to how many items are
      already correctly sorted.
      
      If you want to estimate the progress, you can use code like this:
      ```c
      pending = gtk_sort_list_model_get_pending (self);
      model = gtk_sort_list_model_get_model (self);
      progress = 1.0 - pending / (double) MAX (1, g_list_model_get_n_items (model));
      ```
      
      If no sort operation is ongoing - in particular when
      [gtk.sort_list_model.SortListModel.incremental] is false - this
      function returns 0.
      Returns: a progress estimate of remaining items to sort
  */
  uint getPending()
  {
    uint _retval;
    _retval = gtk_sort_list_model_get_pending(cast(GtkSortListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the section sorter that is used to sort items of self into
      sections.
      Returns: the sorter of #self
  */
  gtk.sorter.Sorter getSectionSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_sort_list_model_get_section_sorter(cast(GtkSortListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the sorter that is used to sort self.
      Returns: the sorter of #self
  */
  gtk.sorter.Sorter getSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_sort_list_model_get_sorter(cast(GtkSortListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the sort model to do an incremental sort.
      
      When incremental sorting is enabled, the [gtk.sort_list_model.SortListModel] will not do
      a complete sort immediately, but will instead queue an idle handler that
      incrementally sorts the items towards their correct position. This of
      course means that items do not instantly appear in the right place. It
      also means that the total sorting time is a lot slower.
      
      When your filter blocks the UI while sorting, you might consider
      turning this on. Depending on your model and sorters, this may become
      interesting around 10,000 to 100,000 items.
      
      By default, incremental sorting is disabled.
      
      See [gtk.sort_list_model.SortListModel.getPending] for progress information
      about an ongoing incremental sorting operation.
  
      Params:
        incremental = true to sort incrementally
  */
  void setIncremental(bool incremental)
  {
    gtk_sort_list_model_set_incremental(cast(GtkSortListModel*)this._cPtr, incremental);
  }

  /**
      Sets the model to be sorted.
      
      The model's item type must conform to the item type of self.
  
      Params:
        model = The model to be sorted
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_sort_list_model_set_model(cast(GtkSortListModel*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets a new section sorter on self.
  
      Params:
        sorter = the [gtk.sorter.Sorter] to sort model with
  */
  void setSectionSorter(gtk.sorter.Sorter sorter = null)
  {
    gtk_sort_list_model_set_section_sorter(cast(GtkSortListModel*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(No.Dup) : null);
  }

  /**
      Sets a new sorter on self.
  
      Params:
        sorter = the [gtk.sorter.Sorter] to sort model with
  */
  void setSorter(gtk.sorter.Sorter sorter = null)
  {
    gtk_sort_list_model_set_sorter(cast(GtkSortListModel*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(No.Dup) : null);
  }
}
