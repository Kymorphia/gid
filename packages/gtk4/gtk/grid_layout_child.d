/// Module for [GridLayoutChild] class
module gtk.grid_layout_child;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.grid_layout.GridLayout].
*/
class GridLayoutChild : gtk.layout_child.LayoutChild
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
    return cast(void function())gtk_grid_layout_child_get_type != &gidSymbolNotFound ? gtk_grid_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GridLayoutChild self()
  {
    return this;
  }

  /**
  Get builder for [gtk.grid_layout_child.GridLayoutChild]
  Returns: New builder object
  */
  static GridLayoutChildGidBuilder builder()
  {
    return new GridLayoutChildGidBuilder;
  }

  /**
      Get `column` property.
      Returns: The column to place the child in.
  */
  @property int column()
  {
    return getColumn();
  }

  /**
      Set `column` property.
      Params:
        propval = The column to place the child in.
  */
  @property void column(int propval)
  {
    setColumn(propval);
  }

  /**
      Get `columnSpan` property.
      Returns: The number of columns the child spans to.
  */
  @property int columnSpan()
  {
    return getColumnSpan();
  }

  /**
      Set `columnSpan` property.
      Params:
        propval = The number of columns the child spans to.
  */
  @property void columnSpan(int propval)
  {
    setColumnSpan(propval);
  }

  /**
      Get `row` property.
      Returns: The row to place the child in.
  */
  @property int row()
  {
    return getRow();
  }

  /**
      Set `row` property.
      Params:
        propval = The row to place the child in.
  */
  @property void row(int propval)
  {
    setRow(propval);
  }

  /**
      Get `rowSpan` property.
      Returns: The number of rows the child spans to.
  */
  @property int rowSpan()
  {
    return getRowSpan();
  }

  /**
      Set `rowSpan` property.
      Params:
        propval = The number of rows the child spans to.
  */
  @property void rowSpan(int propval)
  {
    setRowSpan(propval);
  }

  /**
      Retrieves the column number to which child attaches its left side.
      Returns: the column number
  */
  int getColumn()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_column(cast(GtkGridLayoutChild*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the number of columns that child spans to.
      Returns: the number of columns
  */
  int getColumnSpan()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_column_span(cast(GtkGridLayoutChild*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the row number to which child attaches its top side.
      Returns: the row number
  */
  int getRow()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_row(cast(GtkGridLayoutChild*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the number of rows that child spans to.
      Returns: the number of row
  */
  int getRowSpan()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_row_span(cast(GtkGridLayoutChild*)this._cPtr);
    return _retval;
  }

  /**
      Sets the column number to attach the left side of child.
  
      Params:
        column = the attach point for child
  */
  void setColumn(int column)
  {
    gtk_grid_layout_child_set_column(cast(GtkGridLayoutChild*)this._cPtr, column);
  }

  /**
      Sets the number of columns child spans to.
  
      Params:
        span = the span of child
  */
  void setColumnSpan(int span)
  {
    gtk_grid_layout_child_set_column_span(cast(GtkGridLayoutChild*)this._cPtr, span);
  }

  /**
      Sets the row to place child in.
  
      Params:
        row = the row for child
  */
  void setRow(int row)
  {
    gtk_grid_layout_child_set_row(cast(GtkGridLayoutChild*)this._cPtr, row);
  }

  /**
      Sets the number of rows child spans to.
  
      Params:
        span = the span of child
  */
  void setRowSpan(int span)
  {
    gtk_grid_layout_child_set_row_span(cast(GtkGridLayoutChild*)this._cPtr, span);
  }
}

class GridLayoutChildGidBuilderImpl(T) : gtk.layout_child.LayoutChildGidBuilderImpl!T
{

  /**
      Set `column` property.
      Params:
        propval = The column to place the child in.
      Returns: Builder instance for fluent chaining
  */
  T column(int propval)
  {
    return setProperty("column", propval);
  }

  /**
      Set `columnSpan` property.
      Params:
        propval = The number of columns the child spans to.
      Returns: Builder instance for fluent chaining
  */
  T columnSpan(int propval)
  {
    return setProperty("column-span", propval);
  }

  /**
      Set `row` property.
      Params:
        propval = The row to place the child in.
      Returns: Builder instance for fluent chaining
  */
  T row(int propval)
  {
    return setProperty("row", propval);
  }

  /**
      Set `rowSpan` property.
      Params:
        propval = The number of rows the child spans to.
      Returns: Builder instance for fluent chaining
  */
  T rowSpan(int propval)
  {
    return setProperty("row-span", propval);
  }
}

/// Fluent builder for [gtk.grid_layout_child.GridLayoutChild]
final class GridLayoutChildGidBuilder : GridLayoutChildGidBuilderImpl!GridLayoutChildGidBuilder
{
  GridLayoutChild build()
  {
    return new GridLayoutChild(cast(void*)createGObject(GridLayoutChild._getGType), No.Take);
  }
}
