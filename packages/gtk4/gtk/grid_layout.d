/// Module for [GridLayout] class
module gtk.grid_layout;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.grid_layout.GridLayout] is a layout manager which arranges child widgets in
    rows and columns.
    
    Children have an "attach point" defined by the horizontal and vertical
    index of the cell they occupy; children can span multiple rows or columns.
    The layout properties for setting the attach points and spans are set
    using the [gtk.grid_layout_child.GridLayoutChild] associated to each child widget.
    
    The behaviour of [gtk.grid_layout.GridLayout] when several children occupy the same
    grid cell is undefined.
    
    [gtk.grid_layout.GridLayout] can be used like a [gtk.box_layout.BoxLayout] if all children are
    attached to the same row or column; however, if you only ever need a
    single row or column, you should consider using [gtk.box_layout.BoxLayout].
*/
class GridLayout : gtk.layout_manager.LayoutManager
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
    return cast(void function())gtk_grid_layout_get_type != &gidSymbolNotFound ? gtk_grid_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GridLayout self()
  {
    return this;
  }

  /**
      Get `baselineRow` property.
      Returns: The row to align to the baseline, when `GtkWidget:valign` is set
        to [gtk.types.Align.Baseline].
  */
  @property int baselineRow()
  {
    return getBaselineRow();
  }

  /**
      Set `baselineRow` property.
      Params:
        propval = The row to align to the baseline, when `GtkWidget:valign` is set
          to [gtk.types.Align.Baseline].
  */
  @property void baselineRow(int propval)
  {
    return setBaselineRow(propval);
  }

  /**
      Get `columnHomogeneous` property.
      Returns: Whether all the columns in the grid have the same width.
  */
  @property bool columnHomogeneous()
  {
    return getColumnHomogeneous();
  }

  /**
      Set `columnHomogeneous` property.
      Params:
        propval = Whether all the columns in the grid have the same width.
  */
  @property void columnHomogeneous(bool propval)
  {
    return setColumnHomogeneous(propval);
  }

  /**
      Get `columnSpacing` property.
      Returns: The amount of space between to consecutive columns.
  */
  @property int columnSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("column-spacing");
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The amount of space between to consecutive columns.
  */
  @property void columnSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("column-spacing", propval);
  }

  /**
      Get `rowHomogeneous` property.
      Returns: Whether all the rows in the grid have the same height.
  */
  @property bool rowHomogeneous()
  {
    return getRowHomogeneous();
  }

  /**
      Set `rowHomogeneous` property.
      Params:
        propval = Whether all the rows in the grid have the same height.
  */
  @property void rowHomogeneous(bool propval)
  {
    return setRowHomogeneous(propval);
  }

  /**
      Get `rowSpacing` property.
      Returns: The amount of space between to consecutive rows.
  */
  @property int rowSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("row-spacing");
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The amount of space between to consecutive rows.
  */
  @property void rowSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("row-spacing", propval);
  }

  /**
      Creates a new [gtk.grid_layout.GridLayout].
      Returns: the newly created [gtk.grid_layout.GridLayout]
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_grid_layout_new();
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the row set with [gtk.grid_layout.GridLayout.setBaselineRow].
      Returns: the global baseline row
  */
  int getBaselineRow()
  {
    int _retval;
    _retval = gtk_grid_layout_get_baseline_row(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether all columns of grid should have the same width.
      Returns: true if the columns are homogeneous, and false otherwise
  */
  bool getColumnHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_layout_get_column_homogeneous(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the spacing set with [gtk.grid_layout.GridLayout.setColumnSpacing].
      Returns: the spacing between consecutive columns
  */
  uint getColumnSpacing()
  {
    uint _retval;
    _retval = gtk_grid_layout_get_column_spacing(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns the baseline position of row.
      
      If no value has been set with
      [gtk.grid_layout.GridLayout.setRowBaselinePosition],
      the default value of [gtk.types.BaselinePosition.Center]
      is returned.
  
      Params:
        row = a row index
      Returns: the baseline position of row
  */
  gtk.types.BaselinePosition getRowBaselinePosition(int row)
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_grid_layout_get_row_baseline_position(cast(GtkGridLayout*)this._cPtr, row);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Checks whether all rows of grid should have the same height.
      Returns: true if the rows are homogeneous, and false otherwise
  */
  bool getRowHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_grid_layout_get_row_homogeneous(cast(GtkGridLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the spacing set with [gtk.grid_layout.GridLayout.setRowSpacing].
      Returns: the spacing between consecutive rows
  */
  uint getRowSpacing()
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
  void setBaselineRow(int row)
  {
    gtk_grid_layout_set_baseline_row(cast(GtkGridLayout*)this._cPtr, row);
  }

  /**
      Sets whether all columns of grid should have the same width.
  
      Params:
        homogeneous = true to make columns homogeneous
  */
  void setColumnHomogeneous(bool homogeneous)
  {
    gtk_grid_layout_set_column_homogeneous(cast(GtkGridLayout*)this._cPtr, homogeneous);
  }

  /**
      Sets the amount of space to insert between consecutive columns.
  
      Params:
        spacing = the amount of space between columns, in pixels
  */
  void setColumnSpacing(uint spacing)
  {
    gtk_grid_layout_set_column_spacing(cast(GtkGridLayout*)this._cPtr, spacing);
  }

  /**
      Sets how the baseline should be positioned on row of the
      grid, in case that row is assigned more space than is requested.
  
      Params:
        row = a row index
        pos = a [gtk.types.BaselinePosition]
  */
  void setRowBaselinePosition(int row, gtk.types.BaselinePosition pos)
  {
    gtk_grid_layout_set_row_baseline_position(cast(GtkGridLayout*)this._cPtr, row, pos);
  }

  /**
      Sets whether all rows of grid should have the same height.
  
      Params:
        homogeneous = true to make rows homogeneous
  */
  void setRowHomogeneous(bool homogeneous)
  {
    gtk_grid_layout_set_row_homogeneous(cast(GtkGridLayout*)this._cPtr, homogeneous);
  }

  /**
      Sets the amount of space to insert between consecutive rows.
  
      Params:
        spacing = the amount of space between rows, in pixels
  */
  void setRowSpacing(uint spacing)
  {
    gtk_grid_layout_set_row_spacing(cast(GtkGridLayout*)this._cPtr, spacing);
  }
}
