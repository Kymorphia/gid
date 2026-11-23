/// Module for [TableCell] interface
module gid.atk1.table_cell;

public import gid.core.basictypes;
public import gid.atk1.table_cell_iface_proxy;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    The ATK interface implemented for a cell inside a two-dimentional #AtkTable
    
    Being #AtkTable a component which present elements ordered via rows
    and columns, an #AtkTableCell is the interface which each of those
    elements, so "cells" should implement.
    
    See `iface@AtkTable`
*/
interface TableCell : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_table_cell_get_type != &gidSymbolNotFound ? atk_table_cell_get_type() : cast(GType)0;
  }








  /**
      Returns the column headers as an array of cell accessibles.
      Returns: a GPtrArray of AtkObjects
        representing the column header cells.
  */
  gid.atk1.object.ObjectWrap[] getColumnHeaderCells();

  /**
      Returns the number of columns occupied by this cell accessible.
      Returns: a gint representing the number of columns occupied by this cell,
        or 0 if the cell does not implement this method.
  */
  int getColumnSpan();

  /**
      Retrieves the tabular position of this cell.
  
      Params:
        row = the row of the given cell.
        column = the column of the given cell.
      Returns: TRUE if successful; FALSE otherwise.
  */
  bool getPosition(out int row, out int column);

  /**
      Gets the row and column indexes and span of this cell accessible.
      
      Note: If the object does not implement this function, then, by default, atk
      will implement this function by calling get_row_span and get_column_span
      on the object.
  
      Params:
        row = the row index of the given cell.
        column = the column index of the given cell.
        rowSpan = the number of rows occupied by this cell.
        columnSpan = the number of columns occupied by this cell.
      Returns: TRUE if successful; FALSE otherwise.
  */
  bool getRowColumnSpan(out int row, out int column, out int rowSpan, out int columnSpan);

  /**
      Returns the row headers as an array of cell accessibles.
      Returns: a GPtrArray of AtkObjects
        representing the row header cells.
  */
  gid.atk1.object.ObjectWrap[] getRowHeaderCells();

  /**
      Returns the number of rows occupied by this cell accessible.
      Returns: a gint representing the number of rows occupied by this cell,
        or 0 if the cell does not implement this method.
  */
  int getRowSpan();

  /**
      Returns a reference to the accessible of the containing table.
      Returns: the atk object for the containing table.
  */
  gid.atk1.object.ObjectWrap getTable();
}

/// Fluent builder implementation template for [gid.atk1.table_cell.TableCell]
interface TableCellGidBuilderImpl(T)
{
}
