/// Module for [GridLayout] class
module gid.gtk4.grid_layout;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;

/**
    Arranges child widgets in rows and columns.
    
    Children have an "attach point" defined by the horizontal and vertical
    index of the cell they occupy; children can span multiple rows or columns.
    The layout properties for setting the attach points and spans are set
    using the [gid.gtk4.grid_layout_child.GridLayoutChild] associated to each child widget.
    
    The behaviour of [gid.gtk4.grid_layout.GridLayout] when several children occupy the same
    grid cell is undefined.
    
    [gid.gtk4.grid_layout.GridLayout] can be used like a [gid.gtk4.box_layout.BoxLayout] if all children are
    attached to the same row or column; however, if you only ever need a
    single row or column, you should consider using [gid.gtk4.box_layout.BoxLayout].
*/
class GridLayout : gid.gtk4.layout_manager.LayoutManager
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
    return cast(void function())gtk_grid_layout_get_type != &gidSymbolNotFound ? gtk_grid_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGridLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override GridLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.grid_layout.GridLayout]
      Returns: New builder object
  */
  static GridLayoutGidBuilder builder() nothrow
  {
    return new GridLayoutGidBuilder;
  }

  /**
      Get `baselineRow` property.
      Returns: The row to align to the baseline, when `GtkWidget:valign` is set
        to [gid.gtk4.types.Align.Baseline].
  */
  @property int baselineRow() nothrow
  {
    return getBaselineRow();
  }

  /**
      Set `baselineRow` property.
      Params:
        propval = The row to align to the baseline, when `GtkWidget:valign` is set
          to [gid.gtk4.types.Align.Baseline].
  */
  @property void baselineRow(int propval) nothrow
  {
    setBaselineRow(propval);
  }

  /**
      Get `columnHomogeneous` property.
      Returns: Whether all the columns in the grid have the same width.
  */
  @property bool columnHomogeneous() nothrow
  {
    return getColumnHomogeneous();
  }

  /**
      Set `columnHomogeneous` property.
      Params:
        propval = Whether all the columns in the grid have the same width.
  */
  @property void columnHomogeneous(bool propval) nothrow
  {
    setColumnHomogeneous(propval);
  }

  /**
      Get `columnSpacing` property.
      Returns: The amount of space between to consecutive columns.
  */
  @property int columnSpacing() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("column-spacing");
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The amount of space between to consecutive columns.
  */
  @property void columnSpacing(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("column-spacing", propval);
  }

  /**
      Get `rowHomogeneous` property.
      Returns: Whether all the rows in the grid have the same height.
  */
  @property bool rowHomogeneous() nothrow
  {
    return getRowHomogeneous();
  }

  /**
      Set `rowHomogeneous` property.
      Params:
        propval = Whether all the rows in the grid have the same height.
  */
  @property void rowHomogeneous(bool propval) nothrow
  {
    setRowHomogeneous(propval);
  }

  /**
      Get `rowSpacing` property.
      Returns: The amount of space between to consecutive rows.
  */
  @property int rowSpacing() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("row-spacing");
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The amount of space between to consecutive rows.
  */
  @property void rowSpacing(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("row-spacing", propval);
  }

  /**
      Creates a new [gid.gtk4.grid_layout.GridLayout].
      Returns: the newly created [gid.gtk4.grid_layout.GridLayout]
  */
  this() nothrow
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_grid_layout_new();
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the row set with [gid.gtk4.grid_layout.GridLayout.setBaselineRow].
      Returns: the global baseline row
  */
  int getBaselineRow() nothrow
  {
    int _retval;
    _retval = gtk_grid_layout_get_baseline_row(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether all columns of grid should have the same width.
      Returns: true if the columns are homogeneous, and false otherwise
  */
  bool getColumnHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_layout_get_column_homogeneous(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the spacing set with [gid.gtk4.grid_layout.GridLayout.setColumnSpacing].
      Returns: the spacing between consecutive columns
  */
  uint getColumnSpacing() nothrow
  {
    uint _retval;
    _retval = gtk_grid_layout_get_column_spacing(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns the baseline position of row.
      
      If no value has been set with
      [gid.gtk4.grid_layout.GridLayout.setRowBaselinePosition],
      the default value of [gid.gtk4.types.BaselinePosition.Center]
      is returned.
  
      Params:
        row = a row index
      Returns: the baseline position of row
  */
  gid.gtk4.types.BaselinePosition getRowBaselinePosition(int row) nothrow
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_grid_layout_get_row_baseline_position(cast(GtkGridLayout*)this._cPtr, row);
    gid.gtk4.types.BaselinePosition _retval = cast(gid.gtk4.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Checks whether all rows of grid should have the same height.
      Returns: true if the rows are homogeneous, and false otherwise
  */
  bool getRowHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_layout_get_row_homogeneous(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the spacing set with [gid.gtk4.grid_layout.GridLayout.setRowSpacing].
      Returns: the spacing between consecutive rows
  */
  uint getRowSpacing() nothrow
  {
    uint _retval;
    _retval = gtk_grid_layout_get_row_spacing(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Sets which row defines the global baseline for the entire grid.
      
      Each row in the grid can have its own local baseline, but only
      one of those is global, meaning it will be the baseline in the
      parent of the grid.
  
      Params:
        row = the row index
  */
  void setBaselineRow(int row) nothrow
  {
    gtk_grid_layout_set_baseline_row(cast(GtkGridLayout*)this._cPtr, row);
  }

  /**
      Sets whether all columns of grid should have the same width.
  
      Params:
        homogeneous = true to make columns homogeneous
  */
  void setColumnHomogeneous(bool homogeneous) nothrow
  {
    gtk_grid_layout_set_column_homogeneous(cast(GtkGridLayout*)this._cPtr, homogeneous);
  }

  /**
      Sets the amount of space to insert between consecutive columns.
  
      Params:
        spacing = the amount of space between columns, in pixels
  */
  void setColumnSpacing(uint spacing) nothrow
  {
    gtk_grid_layout_set_column_spacing(cast(GtkGridLayout*)this._cPtr, spacing);
  }

  /**
      Sets how the baseline should be positioned on row of the
      grid, in case that row is assigned more space than is requested.
  
      Params:
        row = a row index
        pos = a [gid.gtk4.types.BaselinePosition]
  */
  void setRowBaselinePosition(int row, gid.gtk4.types.BaselinePosition pos) nothrow
  {
    gtk_grid_layout_set_row_baseline_position(cast(GtkGridLayout*)this._cPtr, row, pos);
  }

  /**
      Sets whether all rows of grid should have the same height.
  
      Params:
        homogeneous = true to make rows homogeneous
  */
  void setRowHomogeneous(bool homogeneous) nothrow
  {
    gtk_grid_layout_set_row_homogeneous(cast(GtkGridLayout*)this._cPtr, homogeneous);
  }

  /**
      Sets the amount of space to insert between consecutive rows.
  
      Params:
        spacing = the amount of space between rows, in pixels
  */
  void setRowSpacing(uint spacing) nothrow
  {
    gtk_grid_layout_set_row_spacing(cast(GtkGridLayout*)this._cPtr, spacing);
  }
}

/// Fluent builder implementation template for [gid.gtk4.grid_layout.GridLayout]
class GridLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T
{

  /**
      Set `baselineRow` property.
      Params:
        propval = The row to align to the baseline, when `GtkWidget:valign` is set
          to [gid.gtk4.types.Align.Baseline].
      Returns: Builder instance for fluent chaining
  */
  T baselineRow(int propval) nothrow
  {
    return setProperty("baseline-row", propval);
  }

  /**
      Set `columnHomogeneous` property.
      Params:
        propval = Whether all the columns in the grid have the same width.
      Returns: Builder instance for fluent chaining
  */
  T columnHomogeneous(bool propval) nothrow
  {
    return setProperty("column-homogeneous", propval);
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The amount of space between to consecutive columns.
      Returns: Builder instance for fluent chaining
  */
  T columnSpacing(int propval) nothrow
  {
    return setProperty("column-spacing", propval);
  }

  /**
      Set `rowHomogeneous` property.
      Params:
        propval = Whether all the rows in the grid have the same height.
      Returns: Builder instance for fluent chaining
  */
  T rowHomogeneous(bool propval) nothrow
  {
    return setProperty("row-homogeneous", propval);
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The amount of space between to consecutive rows.
      Returns: Builder instance for fluent chaining
  */
  T rowSpacing(int propval) nothrow
  {
    return setProperty("row-spacing", propval);
  }
}

/// Fluent builder for [gid.gtk4.grid_layout.GridLayout]
final class GridLayoutGidBuilder : GridLayoutGidBuilderImpl!GridLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GridLayout build() nothrow
  {
    return new GridLayout(cast(void*)createGObject(GridLayout._getGType), Yes.Take);
  }
}
