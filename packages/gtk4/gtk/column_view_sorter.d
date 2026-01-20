/// Module for [ColumnViewSorter] class
module gtk.column_view_sorter;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.column_view_column;
import gtk.sorter;
import gtk.types;

/**
    [gtk.column_view_sorter.ColumnViewSorter] is a sorter implementation that
    is geared towards the needs of [gtk.column_view.ColumnView].
    
    The sorter returned by [gtk.column_view.ColumnView.getSorter] is
    a [gtk.column_view_sorter.ColumnViewSorter].
    
    In column views, sorting can be configured by associating
    sorters with columns, and users can invert sort order by clicking
    on column headers. The API of [gtk.column_view_sorter.ColumnViewSorter] is designed
    to allow saving and restoring this configuration.
    
    If you are only interested in the primary sort column (i.e. the
    column where a sort indicator is shown in the header), then
    you can just look at `property@Gtk.ColumnViewSorter:primary-sort-column`
    and `property@Gtk.ColumnViewSorter:primary-sort-order`.
    
    If you want to store the full sort configuration, including
    secondary sort columns that are used for tie breaking, then
    you can use [gtk.column_view_sorter.ColumnViewSorter.getNthSortColumn].
    To get notified about changes, use [gtk.sorter.Sorter.changed].
    
    To restore a saved sort configuration on a [gtk.column_view.ColumnView],
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
class ColumnViewSorter : gtk.sorter.Sorter
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
    return cast(void function())gtk_column_view_sorter_get_type != &gidSymbolNotFound ? gtk_column_view_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnViewSorter self()
  {
    return this;
  }

  /**
      Get `primarySortColumn` property.
      Returns: The primary sort column.
        
        The primary sort column is the one that displays the triangle
        in a column view header.
  */
  @property gtk.column_view_column.ColumnViewColumn primarySortColumn()
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
  @property gtk.types.SortType primarySortOrder()
  {
    return getPrimarySortOrder();
  }

  /**
      Returns the number of columns by which the sorter sorts.
      
      If the sorter of the primary sort column does not determine
      a total order, then the secondary sorters are consulted to
      break the ties.
      
      Use the [gtk.sorter.Sorter.changed] signal to get notified
      when the number of sort columns changes.
      Returns: the number of sort columns
  */
  uint getNSortColumns()
  {
    uint _retval;
    _retval = gtk_column_view_sorter_get_n_sort_columns(cast(GtkColumnViewSorter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the position'th sort column and its associated sort order.
      
      Use the [gtk.sorter.Sorter.changed] signal to get notified
      when sort columns change.
  
      Params:
        position = the position of the sort column to retrieve (0 for the
              primary sort column)
        sortOrder = return location for the sort order
      Returns: the positions sort column
  */
  gtk.column_view_column.ColumnViewColumn getNthSortColumn(uint position, out gtk.types.SortType sortOrder)
  {
    GtkColumnViewColumn* _cretval;
    _cretval = gtk_column_view_sorter_get_nth_sort_column(cast(GtkColumnViewSorter*)this._cPtr, position, &sortOrder);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.column_view_column.ColumnViewColumn)(cast(GtkColumnViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the primary sort column.
      
      The primary sort column is the one that displays the triangle
      in a column view header.
      Returns: the primary sort column
  */
  gtk.column_view_column.ColumnViewColumn getPrimarySortColumn()
  {
    GtkColumnViewColumn* _cretval;
    _cretval = gtk_column_view_sorter_get_primary_sort_column(cast(GtkColumnViewSorter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.column_view_column.ColumnViewColumn)(cast(GtkColumnViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the primary sort order.
      
      The primary sort order determines whether the triangle displayed
      in the column view header of the primary sort column points upwards
      or downwards.
      
      If there is no primary sort column, then this function returns
      [gtk.types.SortType.Ascending].
      Returns: the primary sort order
  */
  gtk.types.SortType getPrimarySortOrder()
  {
    GtkSortType _cretval;
    _cretval = gtk_column_view_sorter_get_primary_sort_order(cast(GtkColumnViewSorter*)this._cPtr);
    gtk.types.SortType _retval = cast(gtk.types.SortType)_cretval;
    return _retval;
  }
}
