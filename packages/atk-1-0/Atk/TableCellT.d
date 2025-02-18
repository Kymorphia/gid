module Atk.TableCellT;

public import Atk.TableCellIfaceProxy;
public import Atk.ObjectAtk;
public import Atk.Types;
public import Atk.c.functions;
public import Atk.c.types;
public import GObject.ObjectG;
public import Gid.gid;

/**
 * The ATK interface implemented for a cell inside a two-dimentional #AtkTable
 * Being #AtkTable a component which present elements ordered via rows
 * and columns, an #AtkTableCell is the interface which each of those
 * elements, so "cells" should implement.
 * See iface@AtkTable
 */
template TableCellT()
{

  /**
   * Returns the column headers as an array of cell accessibles.
   * Returns: a GPtrArray of AtkObjects
   *   representing the column header cells.
   */
  override ObjectAtk[] getColumnHeaderCells()
  {
    GPtrArray* _cretval;
    _cretval = atk_table_cell_get_column_header_cells(cast(AtkTableCell*)cPtr);
    auto _retval = gPtrArrayToD!(ObjectAtk, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
   * Returns the number of columns occupied by this cell accessible.
   * Returns: a gint representing the number of columns occupied by this cell,
   *   or 0 if the cell does not implement this method.
   */
  override int getColumnSpan()
  {
    int _retval;
    _retval = atk_table_cell_get_column_span(cast(AtkTableCell*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the tabular position of this cell.
   * Params:
   *   row = the row of the given cell.
   *   column = the column of the given cell.
   * Returns: TRUE if successful; FALSE otherwise.
   */
  override bool getPosition(out int row, out int column)
  {
    bool _retval;
    _retval = atk_table_cell_get_position(cast(AtkTableCell*)cPtr, cast(int*)&row, cast(int*)&column);
    return _retval;
  }

  /**
   * Gets the row and column indexes and span of this cell accessible.
   * Note: If the object does not implement this function, then, by default, atk
   * will implement this function by calling get_row_span and get_column_span
   * on the object.
   * Params:
   *   row = the row index of the given cell.
   *   column = the column index of the given cell.
   *   rowSpan = the number of rows occupied by this cell.
   *   columnSpan = the number of columns occupied by this cell.
   * Returns: TRUE if successful; FALSE otherwise.
   */
  override bool getRowColumnSpan(out int row, out int column, out int rowSpan, out int columnSpan)
  {
    bool _retval;
    _retval = atk_table_cell_get_row_column_span(cast(AtkTableCell*)cPtr, cast(int*)&row, cast(int*)&column, cast(int*)&rowSpan, cast(int*)&columnSpan);
    return _retval;
  }

  /**
   * Returns the row headers as an array of cell accessibles.
   * Returns: a GPtrArray of AtkObjects
   *   representing the row header cells.
   */
  override ObjectAtk[] getRowHeaderCells()
  {
    GPtrArray* _cretval;
    _cretval = atk_table_cell_get_row_header_cells(cast(AtkTableCell*)cPtr);
    auto _retval = gPtrArrayToD!(ObjectAtk, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
   * Returns the number of rows occupied by this cell accessible.
   * Returns: a gint representing the number of rows occupied by this cell,
   *   or 0 if the cell does not implement this method.
   */
  override int getRowSpan()
  {
    int _retval;
    _retval = atk_table_cell_get_row_span(cast(AtkTableCell*)cPtr);
    return _retval;
  }

  /**
   * Returns a reference to the accessible of the containing table.
   * Returns: the atk object for the containing table.
   */
  override ObjectAtk getTable()
  {
    AtkObject* _cretval;
    _cretval = atk_table_cell_get_table(cast(AtkTableCell*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }
}
