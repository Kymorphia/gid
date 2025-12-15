/// Module for [Grid] class
module gtk.grid;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    GtkGrid is a container which arranges its child widgets in
    rows and columns, with arbitrary positions and horizontal/vertical spans.
    
    Children are added using [gtk.grid.Grid.attach]. They can span multiple
    rows or columns. It is also possible to add a child next to an
    existing child, using [gtk.grid.Grid.attachNextTo]. The behaviour of
    GtkGrid when several children occupy the same grid cell is undefined.
    
    GtkGrid can be used like a #GtkBox by just using [gtk.container.Container.add],
    which will place children next to each other in the direction determined
    by the #GtkOrientable:orientation property. However, if all you want is a
    single row or column, then #GtkBox is the preferred widget.
    
    # CSS nodes
    
    GtkGrid uses a single CSS node with name grid.
*/
class Grid : gtk.container.Container, gtk.orientable.Orientable
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
    return cast(void function())gtk_grid_get_type != &gidSymbolNotFound ? gtk_grid_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Grid self()
  {
    return this;
  }

  /** */
  @property int baselineRow()
  {
    return getBaselineRow();
  }

  /** */
  @property void baselineRow(int propval)
  {
    return setBaselineRow(propval);
  }

  /** */
  @property bool columnHomogeneous()
  {
    return getColumnHomogeneous();
  }

  /** */
  @property void columnHomogeneous(bool propval)
  {
    return setColumnHomogeneous(propval);
  }

  /** */
  @property int columnSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("column-spacing");
  }

  /** */
  @property void columnSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("column-spacing", propval);
  }

  /** */
  @property bool rowHomogeneous()
  {
    return getRowHomogeneous();
  }

  /** */
  @property void rowHomogeneous(bool propval)
  {
    return setRowHomogeneous(propval);
  }

  /** */
  @property int rowSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("row-spacing");
  }

  /** */
  @property void rowSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("row-spacing", propval);
  }

  mixin OrientableT!();

  /**
      Creates a new grid widget.
      Returns: the new #GtkGrid
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_grid_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a widget to the grid.
      
      The position of child is determined by left and top. The
      number of “cells” that child will occupy is determined by
      width and height.
  
      Params:
        child = the widget to add
        left = the column number to attach the left side of child to
        top = the row number to attach the top side of child to
        width = the number of columns that child will span
        height = the number of rows that child will span
  */
  void attach(gtk.widget.Widget child, int left, int top, int width, int height)
  {
    gtk_grid_attach(cast(GtkGrid*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, left, top, width, height);
  }

  /**
      Adds a widget to the grid.
      
      The widget is placed next to sibling, on the side determined by
      side. When sibling is null, the widget is placed in row (for
      left or right placement) or column 0 (for top or bottom placement),
      at the end indicated by side.
      
      Attaching widgets labeled [1], [2], [3] with sibling == null and
      side == [gtk.types.PositionType.Left] yields a layout of [3][2][1].
  
      Params:
        child = the widget to add
        sibling = the child of grid that child will be placed
              next to, or null to place child at the beginning or end
        side = the side of sibling that child is positioned next to
        width = the number of columns that child will span
        height = the number of rows that child will span
  */
  void attachNextTo(gtk.widget.Widget child, gtk.widget.Widget sibling, gtk.types.PositionType side, int width, int height)
  {
    gtk_grid_attach_next_to(cast(GtkGrid*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null, side, width, height);
  }

  /**
      Returns which row defines the global baseline of grid.
      Returns: the row index defining the global baseline
  */
  int getBaselineRow()
  {
    int _retval;
    _retval = gtk_grid_get_baseline_row(cast(GtkGrid*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child of grid whose area covers the grid
      cell whose upper left corner is at left, top.
  
      Params:
        left = the left edge of the cell
        top = the top edge of the cell
      Returns: the child at the given position, or null
  */
  gtk.widget.Widget getChildAt(int left, int top)
  {
    GtkWidget* _cretval;
    _cretval = gtk_grid_get_child_at(cast(GtkGrid*)this._cPtr, left, top);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether all columns of grid have the same width.
      Returns: whether all columns of grid have the same width.
  */
  bool getColumnHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_get_column_homogeneous(cast(GtkGrid*)this._cPtr);
    return _retval;
  }

  /**
      Returns the amount of space between the columns of grid.
      Returns: the column spacing of grid
  */
  uint getColumnSpacing()
  {
    uint _retval;
    _retval = gtk_grid_get_column_spacing(cast(GtkGrid*)this._cPtr);
    return _retval;
  }

  /**
      Returns the baseline position of row as set
      by [gtk.grid.Grid.setRowBaselinePosition] or the default value
      [gtk.types.BaselinePosition.Center].
  
      Params:
        row = a row index
      Returns: the baseline position of row
  */
  gtk.types.BaselinePosition getRowBaselinePosition(int row)
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_grid_get_row_baseline_position(cast(GtkGrid*)this._cPtr, row);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns whether all rows of grid have the same height.
      Returns: whether all rows of grid have the same height.
  */
  bool getRowHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_get_row_homogeneous(cast(GtkGrid*)this._cPtr);
    return _retval;
  }

  /**
      Returns the amount of space between the rows of grid.
      Returns: the row spacing of grid
  */
  uint getRowSpacing()
  {
    uint _retval;
    _retval = gtk_grid_get_row_spacing(cast(GtkGrid*)this._cPtr);
    return _retval;
  }

  /**
      Inserts a column at the specified position.
      
      Children which are attached at or to the right of this position
      are moved one column to the right. Children which span across this
      position are grown to span the new column.
  
      Params:
        position = the position to insert the column at
  */
  void insertColumn(int position)
  {
    gtk_grid_insert_column(cast(GtkGrid*)this._cPtr, position);
  }

  /**
      Inserts a row or column at the specified position.
      
      The new row or column is placed next to sibling, on the side
      determined by side. If side is [gtk.types.PositionType.Top] or [gtk.types.PositionType.Bottom],
      a row is inserted. If side is [gtk.types.PositionType.Left] of [gtk.types.PositionType.Right],
      a column is inserted.
  
      Params:
        sibling = the child of grid that the new row or column will be
              placed next to
        side = the side of sibling that child is positioned next to
  */
  void insertNextTo(gtk.widget.Widget sibling, gtk.types.PositionType side)
  {
    gtk_grid_insert_next_to(cast(GtkGrid*)this._cPtr, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null, side);
  }

  /**
      Inserts a row at the specified position.
      
      Children which are attached at or below this position
      are moved one row down. Children which span across this
      position are grown to span the new row.
  
      Params:
        position = the position to insert the row at
  */
  void insertRow(int position)
  {
    gtk_grid_insert_row(cast(GtkGrid*)this._cPtr, position);
  }

  /**
      Removes a column from the grid.
      
      Children that are placed in this column are removed,
      spanning children that overlap this column have their
      width reduced by one, and children after the column
      are moved to the left.
  
      Params:
        position = the position of the column to remove
  */
  void removeColumn(int position)
  {
    gtk_grid_remove_column(cast(GtkGrid*)this._cPtr, position);
  }

  /**
      Removes a row from the grid.
      
      Children that are placed in this row are removed,
      spanning children that overlap this row have their
      height reduced by one, and children below the row
      are moved up.
  
      Params:
        position = the position of the row to remove
  */
  void removeRow(int position)
  {
    gtk_grid_remove_row(cast(GtkGrid*)this._cPtr, position);
  }

  /**
      Sets which row defines the global baseline for the entire grid.
      Each row in the grid can have its own local baseline, but only
      one of those is global, meaning it will be the baseline in the
      parent of the grid.
  
      Params:
        row = the row index
  */
  void setBaselineRow(int row)
  {
    gtk_grid_set_baseline_row(cast(GtkGrid*)this._cPtr, row);
  }

  /**
      Sets whether all columns of grid will have the same width.
  
      Params:
        homogeneous = true to make columns homogeneous
  */
  void setColumnHomogeneous(bool homogeneous)
  {
    gtk_grid_set_column_homogeneous(cast(GtkGrid*)this._cPtr, homogeneous);
  }

  /**
      Sets the amount of space between columns of grid.
  
      Params:
        spacing = the amount of space to insert between columns
  */
  void setColumnSpacing(uint spacing)
  {
    gtk_grid_set_column_spacing(cast(GtkGrid*)this._cPtr, spacing);
  }

  /**
      Sets how the baseline should be positioned on row of the
      grid, in case that row is assigned more space than is requested.
  
      Params:
        row = a row index
        pos = a #GtkBaselinePosition
  */
  void setRowBaselinePosition(int row, gtk.types.BaselinePosition pos)
  {
    gtk_grid_set_row_baseline_position(cast(GtkGrid*)this._cPtr, row, pos);
  }

  /**
      Sets whether all rows of grid will have the same height.
  
      Params:
        homogeneous = true to make rows homogeneous
  */
  void setRowHomogeneous(bool homogeneous)
  {
    gtk_grid_set_row_homogeneous(cast(GtkGrid*)this._cPtr, homogeneous);
  }

  /**
      Sets the amount of space between rows of grid.
  
      Params:
        spacing = the amount of space to insert between rows
  */
  void setRowSpacing(uint spacing)
  {
    gtk_grid_set_row_spacing(cast(GtkGrid*)this._cPtr, spacing);
  }
}
