/// Module for [CustomSorter] class
module gid.gtk4.custom_sorter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    Sorts items via a callback function.
*/
class CustomSorter : gid.gtk4.sorter.Sorter
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
    return cast(void function())gtk_custom_sorter_get_type != &gidSymbolNotFound ? gtk_custom_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCustomSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomSorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.custom_sorter.CustomSorter]
      Returns: New builder object
  */
  static CustomSorterGidBuilder builder() nothrow
  {
    return new CustomSorterGidBuilder;
  }
  import gid.gobject2.object;

  // Define a sort delegate that takes ObjectWrap objects, instead of the CompareDataFunc which is passed raw GObject pointers
  alias CustomSortDelegate = int delegate(gid.gobject2.object.ObjectWrap aObj, gid.gobject2.object.ObjectWrap bObj);

  /**
  * Creates a new `GtkSorter` that works by calling
  * sortFunc to compare items.
  * If sortFunc is null, all items are considered equal.
  * Params:
  *   sortFunc = the callback delegate to use for sorting
  * Returns: a new `CustomSorter`
  */
  this(CustomSortDelegate sortFunc) nothrow
  {
    extern(C) int _sortFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      auto _dlg = cast(CustomSortDelegate*)userData;
      auto aObj = cast(GObject*)a;
      auto bObj = cast(GObject*)b;
      int _retval;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(aObj, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(bObj, No.Take));
      }
      catch (Exception e)
      gidInvokeCallbackExceptionHandler(e, "gid.gtk4.custom_sorter.CustomSorter");

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
  void setSortFunc(CustomSortDelegate sortFunc) nothrow
  {
    extern(C) int _sortFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      auto _dlg = cast(CustomSortDelegate*)userData;
      auto aObj = cast(GObject*)a;
      auto bObj = cast(GObject*)b;
      int _retval;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(aObj, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(bObj, No.Take));
      }
      catch (Exception e)
      gidInvokeCallbackExceptionHandler(e, "gid.gtk4.custom_sorter.CustomSorter.setSortFunc");

      return _retval;
    }

    auto _sortFunc = freezeDelegate(cast(void*)&sortFunc);
    gtk_custom_sorter_set_sort_func(cast(GtkCustomSorter*)_cPtr, &_sortFuncCallback, _sortFunc, &thawDelegate);
  }

}

/// Fluent builder implementation template for [gid.gtk4.custom_sorter.CustomSorter]
class CustomSorterGidBuilderImpl(T) : gid.gtk4.sorter.SorterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.custom_sorter.CustomSorter]
final class CustomSorterGidBuilder : CustomSorterGidBuilderImpl!CustomSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CustomSorter build() nothrow
  {
    return new CustomSorter(cast(void*)createGObject(CustomSorter._getGType), Yes.Take);
  }
}
