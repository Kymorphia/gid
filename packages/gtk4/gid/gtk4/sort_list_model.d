/// Module for [SortListModel] class
module gid.gtk4.sort_list_model;

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
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    A list model that sorts the elements of another model.
    
    The elements are sorted according to a [gid.gtk4.sorter.Sorter].
    
    The model is a stable sort. If two items compare equal according
    to the sorter, the one that appears first in the original model will
    also appear first after sorting.
    
    Note that if you change the sorter, the previous order will have no
    influence on the new order. If you want that, consider using a
    [gid.gtk4.multi_sorter.MultiSorter] and appending the previous sorter to it.
    
    The model can be set up to do incremental sorting, so that
    sorting long lists doesn't block the UI. See
    [gid.gtk4.sort_list_model.SortListModel.setIncremental] for details.
    
    [gid.gtk4.sort_list_model.SortListModel] is a generic model and because of that it
    cannot take advantage of any external knowledge when sorting.
    If you run into performance issues with [gid.gtk4.sort_list_model.SortListModel],
    it is strongly recommended that you write your own sorting list
    model.
    
    [gid.gtk4.sort_list_model.SortListModel] allows sorting the items into sections. It
    implements [gid.gtk4.section_model.SectionModel] and when [gid.gtk4.sort_list_model.SortListModel.sectionSorter]
    is set, it will sort all items with that sorter and items comparing
    equal with it will be put into the same section.
    The [gid.gtk4.sort_list_model.SortListModel.sorter] will then be used to sort items
    inside their sections.
*/
class SortListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel
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
    return cast(void function())gtk_sort_list_model_get_type != &gidSymbolNotFound ? gtk_sort_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSortListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override SortListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.sort_list_model.SortListModel]
      Returns: New builder object
  */
  static SortListModelGidBuilder builder() nothrow
  {
    return new SortListModelGidBuilder;
  }

  /**
      Get `incremental` property.
      Returns: If the model should sort items incrementally.
  */
  @property bool incremental() nothrow
  {
    return getIncremental();
  }

  /**
      Set `incremental` property.
      Params:
        propval = If the model should sort items incrementally.
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
      Returns: The model being sorted.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being sorted.
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
      Returns: Estimate of unsorted items remaining.
  */
  @property uint pending() nothrow
  {
    return getPending();
  }

  /**
      Get `sectionSorter` property.
      Returns: The section sorter for this model, if one is set.
  */
  @property gid.gtk4.sorter.Sorter sectionSorter() nothrow
  {
    return getSectionSorter();
  }

  /**
      Set `sectionSorter` property.
      Params:
        propval = The section sorter for this model, if one is set.
  */
  @property void sectionSorter(gid.gtk4.sorter.Sorter propval) nothrow
  {
    setSectionSorter(propval);
  }

  /**
      Get `sorter` property.
      Returns: The sorter for this model.
  */
  @property gid.gtk4.sorter.Sorter sorter() nothrow
  {
    return getSorter();
  }

  /**
      Set `sorter` property.
      Params:
        propval = The sorter for this model.
  */
  @property void sorter(gid.gtk4.sorter.Sorter propval) nothrow
  {
    setSorter(propval);
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new sort list model that uses the sorter to sort model.
  
      Params:
        model = the model to sort
        sorter = the [gid.gtk4.sorter.Sorter] to sort model with,
      Returns: a new [gid.gtk4.sort_list_model.SortListModel]
  */
  this(gid.gio2.list_model.ListModel model = null, gid.gtk4.sorter.Sorter sorter = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, model !is null || sorter !is null), Yes.Take);
    }
    else
    {
      GtkSortListModel* _cretval;
      _cretval = gtk_sort_list_model_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, sorter ? cast(GtkSorter*)sorter._cPtr(Yes.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns whether incremental sorting is enabled.
      
      See [gid.gtk4.sort_list_model.SortListModel.setIncremental].
      Returns: true if incremental sorting is enabled
  */
  bool getIncremental() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_sort_list_model_get_incremental(cast(GtkSortListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model currently sorted or null if none.
      Returns: The model that gets sorted
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_sort_list_model_get_model(cast(GtkSortListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
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
      [gid.gtk4.sort_list_model.SortListModel.incremental] is false - this
      function returns 0.
      Returns: a progress estimate of remaining items to sort
  */
  uint getPending() nothrow
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
  gid.gtk4.sorter.Sorter getSectionSorter() nothrow
  {
    GtkSorter* _cretval;
    _cretval = gtk_sort_list_model_get_section_sorter(cast(GtkSortListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the sorter that is used to sort self.
      Returns: the sorter of #self
  */
  gid.gtk4.sorter.Sorter getSorter() nothrow
  {
    GtkSorter* _cretval;
    _cretval = gtk_sort_list_model_get_sorter(cast(GtkSortListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the sort model to do an incremental sort.
      
      When incremental sorting is enabled, the [gid.gtk4.sort_list_model.SortListModel] will not do
      a complete sort immediately, but will instead queue an idle handler that
      incrementally sorts the items towards their correct position. This of
      course means that items do not instantly appear in the right place. It
      also means that the total sorting time is a lot slower.
      
      When your filter blocks the UI while sorting, you might consider
      turning this on. Depending on your model and sorters, this may become
      interesting around 10,000 to 100,000 items.
      
      By default, incremental sorting is disabled.
      
      See [gid.gtk4.sort_list_model.SortListModel.getPending] for progress information
      about an ongoing incremental sorting operation.
  
      Params:
        incremental = true to sort incrementally
  */
  void setIncremental(bool incremental) nothrow
  {
    gtk_sort_list_model_set_incremental(cast(GtkSortListModel*)this._cPtr, incremental);
  }

  /**
      Sets the model to be sorted.
      
      The model's item type must conform to the item type of self.
  
      Params:
        model = The model to be sorted
  */
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_sort_list_model_set_model(cast(GtkSortListModel*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets a new section sorter on self.
  
      Params:
        sorter = the [gid.gtk4.sorter.Sorter] to sort model with
  */
  void setSectionSorter(gid.gtk4.sorter.Sorter sorter = null) nothrow
  {
    gtk_sort_list_model_set_section_sorter(cast(GtkSortListModel*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(No.Dup) : null);
  }

  /**
      Sets a new sorter on self.
  
      Params:
        sorter = the [gid.gtk4.sorter.Sorter] to sort model with
  */
  void setSorter(gid.gtk4.sorter.Sorter sorter = null) nothrow
  {
    gtk_sort_list_model_set_sorter(cast(GtkSortListModel*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.sort_list_model.SortListModel]
class SortListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `incremental` property.
      Params:
        propval = If the model should sort items incrementally.
      Returns: Builder instance for fluent chaining
  */
  T incremental(bool propval) nothrow
  {
    return setProperty("incremental", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model being sorted.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `sectionSorter` property.
      Params:
        propval = The section sorter for this model, if one is set.
      Returns: Builder instance for fluent chaining
  */
  T sectionSorter(gid.gtk4.sorter.Sorter propval) nothrow
  {
    return setProperty("section-sorter", propval);
  }

  /**
      Set `sorter` property.
      Params:
        propval = The sorter for this model.
      Returns: Builder instance for fluent chaining
  */
  T sorter(gid.gtk4.sorter.Sorter propval) nothrow
  {
    return setProperty("sorter", propval);
  }
}

/// Fluent builder for [gid.gtk4.sort_list_model.SortListModel]
final class SortListModelGidBuilder : SortListModelGidBuilderImpl!SortListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SortListModel build() nothrow
  {
    return new SortListModel(cast(void*)createGObject(SortListModel._getGType), Yes.Take);
  }
}
