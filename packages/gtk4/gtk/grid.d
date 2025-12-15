/// Module for [Grid] class
module gtk.grid;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.grid.Grid] is a container which arranges its child widgets in
    rows and columns.
    
    ![An example GtkGrid](grid.png)
    
    It supports arbitrary positions and horizontal/vertical spans.
    
    Children are added using [gtk.grid.Grid.attach]. They can span multiple
    rows or columns. It is also possible to add a child next to an existing
    child, using [gtk.grid.Grid.attachNextTo]. To remove a child from the
    grid, use [gtk.grid.Grid.remove].
    
    The behaviour of [gtk.grid.Grid] when several children occupy the same grid
    cell is undefined.
    
    # GtkGrid as GtkBuildable
    
    Every child in a [gtk.grid.Grid] has access to a custom [gtk.buildable.Buildable]
    element, called `<layout>`. It can by used to specify a position in the
    grid and optionally spans. All properties that can be used in the `<layout>`
    element are implemented by [gtk.grid_layout_child.GridLayoutChild].
    
    It is implemented by [gtk.widget.Widget] using [gtk.layout_manager.LayoutManager].
    
    To showcase it, here is a simple example:
    
    ```xml
    <object class="GtkGrid" id="my_grid">
      <child>
        <object class="GtkButton" id="button1">
          <property name="label">Button 1</property>
          <layout>
            <property name="column">0</property>
            <property name="row">0</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkButton" id="button2">
          <property name="label">Button 2</property>
          <layout>
            <property name="column">1</property>
            <property name="row">0</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkButton" id="button3">
          <property name="label">Button 3</property>
          <layout>
            <property name="column">2</property>
            <property name="row">0</property>
            <property name="row-span">2</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkButton" id="button4">
          <property name="label">Button 4</property>
          <layout>
            <property name="column">0</property>
            <property name="row">1</property>
            <property name="column-span">2</property>
          </layout>
        </object>
      </child>
    </object>
    ```
    
    It organizes the first two buttons side-by-side in one cell each.
    The third button is in the last column but spans across two rows.
    This is defined by the `row-span` property. The last button is
    located in the second row and spans across two columns, which is
    defined by the `column-span` property.
    
    # CSS nodes
    
    [gtk.grid.Grid] uses a single CSS node with name `grid`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.grid.Grid] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.grid.Grid] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class Grid : gtk.widget.Widget, gtk.orientable.Orientable
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

  /**
      Get `baselineRow` property.
      Returns: The row to align to the baseline when valign is using baseline alignment.
  */
  @property int baselineRow()
  {
    return getBaselineRow();
  }

  /**
      Set `baselineRow` property.
      Params:
        propval = The row to align to the baseline when valign is using baseline alignment.
  */
  @property void baselineRow(int propval)
  {
    return setBaselineRow(propval);
  }

  /**
      Get `columnHomogeneous` property.
      Returns: If true, the columns are all the same width.
  */
  @property bool columnHomogeneous()
  {
    return getColumnHomogeneous();
  }

  /**
      Set `columnHomogeneous` property.
      Params:
        propval = If true, the columns are all the same width.
  */
  @property void columnHomogeneous(bool propval)
  {
    return setColumnHomogeneous(propval);
  }

  /**
      Get `columnSpacing` property.
      Returns: The amount of space between two consecutive columns.
  */
  @property int columnSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("column-spacing");
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The amount of space between two consecutive columns.
  */
  @property void columnSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("column-spacing", propval);
  }

  /**
      Get `rowHomogeneous` property.
      Returns: If true, the rows are all the same height.
  */
  @property bool rowHomogeneous()
  {
    return getRowHomogeneous();
  }

  /**
      Set `rowHomogeneous` property.
      Params:
        propval = If true, the rows are all the same height.
  */
  @property void rowHomogeneous(bool propval)
  {
    return setRowHomogeneous(propval);
  }

  /**
      Get `rowSpacing` property.
      Returns: The amount of space between two consecutive rows.
  */
  @property int rowSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("row-spacing");
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The amount of space between two consecutive rows.
  */
  @property void rowSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("row-spacing", propval);
  }

  mixin OrientableT!();

  /**
      Creates a new grid widget.
      Returns: the new [gtk.grid.Grid]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_grid_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a widget to the grid.
      
      The position of child is determined by column and row.
      The number of “cells” that child will occupy is determined
      by width and height.
  
      Params:
        child = the widget to add
        column = the column number to attach the left side of child to
        row = the row number to attach the top side of child to
        width = the number of columns that child will span
        height = the number of rows that child will span
  */
  void attach(gtk.widget.Widget child, int column, int row, int width, int height)
  {
    gtk_grid_attach(cast(GtkGrid*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, column, row, width, height);
  }

  /**
      Adds a widget to the grid.
      
      The widget is placed next to sibling, on the side determined by
      side. When sibling is null, the widget is placed in row (for
      left or right placement) or column 0 (for top or bottom placement),
      at the end indicated by side.
      
      Attaching widgets labeled `[1]`, `[2]`, `[3]` with `sibling == null` and
      `side == [gtk.types.PositionType.Left]` yields a layout of `[3][2][1]`.
  
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
      cell at column, row.
  
      Params:
        column = the left edge of the cell
        row = the top edge of the cell
      Returns: the child at the given position
  */
  gtk.widget.Widget getChildAt(int column, int row)
  {
    GtkWidget* _cretval;
    _cretval = gtk_grid_get_child_at(cast(GtkGrid*)this._cPtr, column, row);
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
      Returns the baseline position of row.
      
      See [gtk.grid.Grid.setRowBaselinePosition].
  
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
      Queries the attach points and spans of child inside the given [gtk.grid.Grid].
  
      Params:
        child = a [gtk.widget.Widget] child of grid
        column = the column used to attach the left side of child
        row = the row used to attach the top side of child
        width = the number of columns child spans
        height = the number of rows child spans
  */
  void queryChild(gtk.widget.Widget child, out int column, out int row, out int width, out int height)
  {
    gtk_grid_query_child(cast(GtkGrid*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, cast(int*)&column, cast(int*)&row, cast(int*)&width, cast(int*)&height);
  }

  /**
      Removes a child from grid.
      
      The child must have been added with
      [gtk.grid.Grid.attach] or [gtk.grid.Grid.attachNextTo].
  
      Params:
        child = the child widget to remove
  */
  void remove(gtk.widget.Widget child)
  {
    gtk_grid_remove(cast(GtkGrid*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
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
      
      The default baseline position is [gtk.types.BaselinePosition.Center].
  
      Params:
        row = a row index
        pos = a [gtk.types.BaselinePosition]
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
