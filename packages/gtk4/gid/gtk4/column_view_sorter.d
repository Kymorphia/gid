/// Module for [ColumnViewSorter] class
module gid.gtk4.column_view_sorter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.column_view_column;
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    Sorts [gid.gtk4.column_view.ColumnView] columns.
    
    The sorter returned by [gid.gtk4.column_view.ColumnView.getSorter] is
    a [gid.gtk4.column_view_sorter.ColumnViewSorter].
    
    In column views, sorting can be configured by associating
    sorters with columns, and users can invert sort order by clicking
    on column headers. The API of [gid.gtk4.column_view_sorter.ColumnViewSorter] is designed
    to allow saving and restoring this configuration.
    
    If you are only interested in the primary sort column (i.e. the
    column where a sort indicator is shown in the header), then
    you can just look at [gid.gtk4.column_view_sorter.ColumnViewSorter.primarySortColumn]
    and [gid.gtk4.column_view_sorter.ColumnViewSorter.primarySortOrder].
    
    If you want to store the full sort configuration, including
    secondary sort columns that are used for tie breaking, then
    you can use [gid.gtk4.column_view_sorter.ColumnViewSorter.getNthSortColumn].
    To get notified about changes, use [gid.gtk4.sorter.Sorter.changed].
    
    To restore a saved sort configuration on a [gid.gtk4.column_view.ColumnView],
    use code like:
    
    ```
    sorter = gtk_column_view_get_sorter (view);
    for (i = gtk_column_view_sorter_get_n_sort_columns (sorter) - 1; i >= 0; i--)
      {
        column = gtk_column_view_sorter_get_nth_sort_column (sorter, i, &order);
        gtk_column_view_sort_by_column (view, column, order);
      }
    ```
*/
class ColumnViewSorter : gid.gtk4.sorter.Sorter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_column_view_sorter_get_type != &gidSymbolNotFound ? gtk_column_view_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColumnViewSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnViewSorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.column_view_sorter.ColumnViewSorter]
      Returns: New builder object
  */
  static ColumnViewSorterGidBuilder builder() nothrow
  {
    return new ColumnViewSorterGidBuilder;
  }

  /**
      Get `primarySortColumn` property.
      Returns: The primary sort column.
        
        The primary sort column is the one that displays the triangle
        in a column view header.
  */
  @property gid.gtk4.column_view_column.ColumnViewColumn primarySortColumn() nothrow
  {
    return getPrimarySortColumn();
  }

  /**
      Get `primarySortOrder` property.
      Returns: The primary sort order.
        
        The primary sort order determines whether the triangle displayed
        in the column view header of the primary sort column points upwards
        or downwards.
  */
  @property gid.gtk4.types.SortType primarySortOrder() nothrow
  {
    return getPrimarySortOrder();
  }

  /**
      Returns the number of columns by which the sorter sorts.
      
      If the sorter of the primary sort column does not determine
      a total order, then the secondary sorters are consulted to
      break the ties.
      
      Use the [gid.gtk4.sorter.Sorter.changed] signal to get notified
      when the number of sort columns changes.
      Returns: the number of sort columns
  */
  uint getNSortColumns() nothrow
  {
    uint _retval;
    _retval = gtk_column_view_sorter_get_n_sort_columns(cast(GtkColumnViewSorter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the position'th sort column and its associated sort order.
      
      Use the [gid.gtk4.sorter.Sorter.changed] signal to get notified
      when sort columns change.
  
      Params:
        position = the position of the sort column to retrieve (0 for the
              primary sort column)
        sortOrder = return location for the sort order
      Returns: the sort column at the position
  */
  gid.gtk4.column_view_column.ColumnViewColumn getNthSortColumn(uint position, out gid.gtk4.types.SortType sortOrder) nothrow
  {
    GtkColumnViewColumn* _cretval;
    _cretval = gtk_column_view_sorter_get_nth_sort_column(cast(GtkColumnViewSorter*)this._cPtr, position, &sortOrder);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.column_view_column.ColumnViewColumn)(cast(GtkColumnViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the primary sort column.
      
      The primary sort column is the one that displays the triangle
      in a column view header.
      Returns: the primary sort column
  */
  gid.gtk4.column_view_column.ColumnViewColumn getPrimarySortColumn() nothrow
  {
    GtkColumnViewColumn* _cretval;
    _cretval = gtk_column_view_sorter_get_primary_sort_column(cast(GtkColumnViewSorter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.column_view_column.ColumnViewColumn)(cast(GtkColumnViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the primary sort order.
      
      The primary sort order determines whether the triangle displayed
      in the column view header of the primary sort column points upwards
      or downwards.
      
      If there is no primary sort column, then this function returns
      [gid.gtk4.types.SortType.Ascending].
      Returns: the primary sort order
  */
  gid.gtk4.types.SortType getPrimarySortOrder() nothrow
  {
    GtkSortType _cretval;
    _cretval = gtk_column_view_sorter_get_primary_sort_order(cast(GtkColumnViewSorter*)this._cPtr);
    gid.gtk4.types.SortType _retval = cast(gid.gtk4.types.SortType)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.column_view_sorter.ColumnViewSorter]
class ColumnViewSorterGidBuilderImpl(T) : gid.gtk4.sorter.SorterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.column_view_sorter.ColumnViewSorter]
final class ColumnViewSorterGidBuilder : ColumnViewSorterGidBuilderImpl!ColumnViewSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColumnViewSorter build() nothrow
  {
    return new ColumnViewSorter(cast(void*)createGObject(ColumnViewSorter._getGType), Yes.Take);
  }
}
