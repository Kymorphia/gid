/// Module for [CustomSorter] class
module gtk.custom_sorter;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.sorter;
import gtk.types;

/**
    [gtk.custom_sorter.CustomSorter] is a [gtk.sorter.Sorter] implementation that sorts via a callback
    function.
*/
class CustomSorter : gtk.sorter.Sorter
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
    return cast(void function())gtk_custom_sorter_get_type != &gidSymbolNotFound ? gtk_custom_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomSorter self()
  {
    return this;
  }

  /**
      Get builder for [gtk.custom_sorter.CustomSorter]
      Returns: New builder object
  */
  static CustomSorterGidBuilder builder()
  {
    return new CustomSorterGidBuilder;
  }
  import gobject.object;

  // Define a sort delegate that takes ObjectWrap objects, instead of the CompareDataFunc which is passed raw GObject pointers
  alias CustomSortDelegate = int delegate(gobject.object.ObjectWrap aObj, gobject.object.ObjectWrap bObj);

  /**
  * Creates a new `GtkSorter` that works by calling
  * sortFunc to compare items.
  * If sortFunc is null, all items are considered equal.
  * Params:
  *   sortFunc = the callback delegate to use for sorting
  * Returns: a new `CustomSorter`
  */
  this(CustomSortDelegate sortFunc)
  {
    extern(C) int _sortFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(CustomSortDelegate*)userData;
      auto aObj = cast(GObject*)a;
      auto bObj = cast(GObject*)b;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(aObj, No.Take),
      gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(bObj, No.Take));
      return _retval;
    }

    GtkCustomSorter* _cretval;
    auto _sortFunc = freezeDelegate(cast(void*)&sortFunc);
    _cretval = gtk_custom_sorter_new(&_sortFuncCallback, _sortFunc, &thawDelegate);
    this(_cretval, Yes.Take);
  }

  /**
  * Sets (or unsets) the function used for sorting items.
  * If sort_func is %NULL, all items are considered equal.
  * If the sort func changes its sorting behavior,
  * [Gtk.Sorter.changed] needs to be called.
  * If a previous function was set, its user_destroy will be
  * called now.
  * Params:
  *   sortFunc = function to sort items
  */
  void setSortFunc(CustomSortDelegate sortFunc)
  {
    extern(C) int _sortFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(CustomSortDelegate*)userData;
      auto aObj = cast(GObject*)a;
      auto bObj = cast(GObject*)b;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(aObj, No.Take),
      gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(bObj, No.Take));
      return _retval;
    }

    auto _sortFunc = freezeDelegate(cast(void*)&sortFunc);
    gtk_custom_sorter_set_sort_func(cast(GtkCustomSorter*)_cPtr, &_sortFuncCallback, _sortFunc, &thawDelegate);
  }

}

/// Fluent builder implementation template for [gtk.custom_sorter.CustomSorter]
class CustomSorterGidBuilderImpl(T) : gtk.sorter.SorterGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.custom_sorter.CustomSorter]
final class CustomSorterGidBuilder : CustomSorterGidBuilderImpl!CustomSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CustomSorter build()
  {
    return new CustomSorter(cast(void*)createGObject(CustomSorter._getGType), Yes.Take);
  }
}
