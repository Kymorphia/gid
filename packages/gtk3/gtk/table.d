/// Module for [Table] class
module gtk.table;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    The #GtkTable functions allow the programmer to arrange widgets in rows and
    columns, making it easy to align many widgets next to each other,
    horizontally and vertically.
    
    Tables are created with a call to [gtk.table.Table.new_], the size of which can
    later be changed with [gtk.table.Table.resize].
    
    Widgets can be added to a table using [gtk.table.Table.attach] or the more
    convenient (but slightly less flexible) [gtk.table.Table.attachDefaults].
    
    To alter the space next to a specific row, use [gtk.table.Table.setRowSpacing],
    and for a column, [gtk.table.Table.setColSpacing].
    The gaps between all rows or columns can be changed by
    calling [gtk.table.Table.setRowSpacings] or [gtk.table.Table.setColSpacings]
    respectively. Note that spacing is added between the
    children, while padding added by [gtk.table.Table.attach] is added on
    either side of the widget it belongs to.
    
    [gtk.table.Table.setHomogeneous], can be used to set whether all cells in the
    table will resize themselves to the size of the largest widget in the table.
    
    > #GtkTable has been deprecated. Use #GtkGrid instead. It provides the same
    > capabilities as GtkTable for arranging widgets in a rectangular grid, but
    > does support height-for-width geometry management.
*/
class Table : gtk.container.Container
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
    return cast(void function())gtk_table_get_type != &gidSymbolNotFound ? gtk_table_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Table self()
  {
    return this;
  }

  /** */
  @property uint columnSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("column-spacing");
  }

  /** */
  @property void columnSpacing(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("column-spacing", propval);
  }

  /** */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /** */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /** */
  @property uint nColumns()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-columns");
  }

  /** */
  @property void nColumns(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("n-columns", propval);
  }

  /** */
  @property uint nRows()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-rows");
  }

  /** */
  @property void nRows(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("n-rows", propval);
  }

  /** */
  @property uint rowSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("row-spacing");
  }

  /** */
  @property void rowSpacing(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("row-spacing", propval);
  }

  /**
      Used to create a new table widget. An initial size must be given by
      specifying how many rows and columns the table should have, although
      this can be changed later with [gtk.table.Table.resize].  rows and columns
      must both be in the range 1 .. 65535. For historical reasons, 0 is accepted
      as well and is silently interpreted as 1.
  
      Params:
        rows = The number of rows the new table should have.
        columns = The number of columns the new table should have.
        homogeneous = If set to true, all table cells are resized to the size of
            the cell containing the largest widget.
      Returns: A pointer to the newly created table widget.
  
      Deprecated: Use [gtk.grid.Grid.new_].
  */
  this(uint rows, uint columns, bool homogeneous)
  {
    GtkWidget* _cretval;
    _cretval = gtk_table_new(rows, columns, homogeneous);
    this(_cretval, No.Take);
  }

  /**
      Adds a widget to a table. The number of “cells” that a widget will occupy is
      specified by left_attach, right_attach, top_attach and bottom_attach.
      These each represent the leftmost, rightmost, uppermost and lowest column
      and row numbers of the table. (Columns and rows are indexed from zero).
      
      To make a button occupy the lower right cell of a 2x2 table, use
      ```
      gtk_table_attach (table, button,
                        1, 2, // left, right attach
                        1, 2, // top, bottom attach
                        xoptions, yoptions,
                        xpadding, ypadding);
      ```
      If you want to make the button span the entire bottom row, use left_attach == 0 and right_attach = 2 instead.
  
      Params:
        child = The widget to add.
        leftAttach = the column number to attach the left side of a child widget to.
        rightAttach = the column number to attach the right side of a child widget to.
        topAttach = the row number to attach the top of a child widget to.
        bottomAttach = the row number to attach the bottom of a child widget to.
        xoptions = Used to specify the properties of the child widget when the table is resized.
        yoptions = The same as xoptions, except this field determines behaviour of vertical resizing.
        xpadding = An integer value specifying the padding on the left and right of the widget being added to the table.
        ypadding = The amount of padding above and below the child widget.
  
      Deprecated: Use [gtk.grid.Grid.attach] with #GtkGrid. Note that the attach
            arguments differ between those two functions.
  */
  void attach(gtk.widget.Widget child, uint leftAttach, uint rightAttach, uint topAttach, uint bottomAttach, gtk.types.AttachOptions xoptions, gtk.types.AttachOptions yoptions, uint xpadding, uint ypadding)
  {
    gtk_table_attach(cast(GtkTable*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, leftAttach, rightAttach, topAttach, bottomAttach, xoptions, yoptions, xpadding, ypadding);
  }

  /**
      As there are many options associated with [gtk.table.Table.attach], this convenience
      function provides the programmer with a means to add children to a table with
      identical padding and expansion options. The values used for the #GtkAttachOptions
      are `GTK_EXPAND | GTK_FILL`, and the padding is set to 0.
  
      Params:
        widget = The child widget to add.
        leftAttach = The column number to attach the left side of the child widget to.
        rightAttach = The column number to attach the right side of the child widget to.
        topAttach = The row number to attach the top of the child widget to.
        bottomAttach = The row number to attach the bottom of the child widget to.
  
      Deprecated: Use [gtk.grid.Grid.attach] with #GtkGrid. Note that the attach
            arguments differ between those two functions.
  */
  void attachDefaults(gtk.widget.Widget widget, uint leftAttach, uint rightAttach, uint topAttach, uint bottomAttach)
  {
    gtk_table_attach_defaults(cast(GtkTable*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, leftAttach, rightAttach, topAttach, bottomAttach);
  }

  /**
      Gets the amount of space between column col, and
      column col + 1. See [gtk.table.Table.setColSpacing].
  
      Params:
        column = a column in the table, 0 indicates the first column
      Returns: the column spacing
  
      Deprecated: #GtkGrid does not offer a replacement for this
            functionality.
  */
  uint getColSpacing(uint column)
  {
    uint _retval;
    _retval = gtk_table_get_col_spacing(cast(GtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Gets the default column spacing for the table. This is
      the spacing that will be used for newly added columns.
      (See [gtk.table.Table.setColSpacings])
      Returns: the default column spacing
  
      Deprecated: Use [gtk.grid.Grid.getColumnSpacing] with #GtkGrid.
  */
  uint getDefaultColSpacing()
  {
    uint _retval;
    _retval = gtk_table_get_default_col_spacing(cast(GtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default row spacing for the table. This is
      the spacing that will be used for newly added rows.
      (See [gtk.table.Table.setRowSpacings])
      Returns: the default row spacing
  
      Deprecated: Use [gtk.grid.Grid.getRowSpacing] with #GtkGrid.
  */
  uint getDefaultRowSpacing()
  {
    uint _retval;
    _retval = gtk_table_get_default_row_spacing(cast(GtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the table cells are all constrained to the same
      width and height. (See gtk_table_set_homogeneous ())
      Returns: true if the cells are all constrained to the same size
  
      Deprecated: Use [gtk.grid.Grid.getRowHomogeneous] and
            [gtk.grid.Grid.getColumnHomogeneous] with #GtkGrid.
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_table_get_homogeneous(cast(GtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the amount of space between row row, and
      row row + 1. See [gtk.table.Table.setRowSpacing].
  
      Params:
        row = a row in the table, 0 indicates the first row
      Returns: the row spacing
  
      Deprecated: #GtkGrid does not offer a replacement for this
            functionality.
  */
  uint getRowSpacing(uint row)
  {
    uint _retval;
    _retval = gtk_table_get_row_spacing(cast(GtkTable*)this._cPtr, row);
    return _retval;
  }

  /**
      Gets the number of rows and columns in the table.
  
      Params:
        rows = return location for the number of
            rows, or null
        columns = return location for the number
            of columns, or null
  
      Deprecated: #GtkGrid does not expose the number of columns and
            rows.
  */
  void getSize(out uint rows, out uint columns)
  {
    gtk_table_get_size(cast(GtkTable*)this._cPtr, cast(uint*)&rows, cast(uint*)&columns);
  }

  /**
      If you need to change a table’s size after
      it has been created, this function allows you to do so.
  
      Params:
        rows = The new number of rows.
        columns = The new number of columns.
  
      Deprecated: #GtkGrid resizes automatically.
  */
  void resize(uint rows, uint columns)
  {
    gtk_table_resize(cast(GtkTable*)this._cPtr, rows, columns);
  }

  /**
      Alters the amount of space between a given table column and the following
      column.
  
      Params:
        column = the column whose spacing should be changed.
        spacing = number of pixels that the spacing should take up.
  
      Deprecated: Use [gtk.widget.Widget.setMarginStart] and
            [gtk.widget.Widget.setMarginEnd] on the widgets contained in the row if
            you need this functionality. #GtkGrid does not support per-row spacing.
  */
  void setColSpacing(uint column, uint spacing)
  {
    gtk_table_set_col_spacing(cast(GtkTable*)this._cPtr, column, spacing);
  }

  /**
      Sets the space between every column in table equal to spacing.
  
      Params:
        spacing = the number of pixels of space to place between every column
            in the table.
  
      Deprecated: Use [gtk.grid.Grid.setColumnSpacing] with #GtkGrid.
  */
  void setColSpacings(uint spacing)
  {
    gtk_table_set_col_spacings(cast(GtkTable*)this._cPtr, spacing);
  }

  /**
      Changes the homogenous property of table cells, ie. whether all cells are
      an equal size or not.
  
      Params:
        homogeneous = Set to true to ensure all table cells are the same size. Set
            to false if this is not your desired behaviour.
  
      Deprecated: Use [gtk.grid.Grid.setRowHomogeneous] and
            [gtk.grid.Grid.setColumnHomogeneous] with #GtkGrid.
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_table_set_homogeneous(cast(GtkTable*)this._cPtr, homogeneous);
  }

  /**
      Changes the space between a given table row and the subsequent row.
  
      Params:
        row = row number whose spacing will be changed.
        spacing = number of pixels that the spacing should take up.
  
      Deprecated: Use [gtk.widget.Widget.setMarginTop] and
            [gtk.widget.Widget.setMarginBottom] on the widgets contained in the row if
            you need this functionality. #GtkGrid does not support per-row spacing.
  */
  void setRowSpacing(uint row, uint spacing)
  {
    gtk_table_set_row_spacing(cast(GtkTable*)this._cPtr, row, spacing);
  }

  /**
      Sets the space between every row in table equal to spacing.
  
      Params:
        spacing = the number of pixels of space to place between every row in the table.
  
      Deprecated: Use [gtk.grid.Grid.setRowSpacing] with #GtkGrid.
  */
  void setRowSpacings(uint spacing)
  {
    gtk_table_set_row_spacings(cast(GtkTable*)this._cPtr, spacing);
  }
}
