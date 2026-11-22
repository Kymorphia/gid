/// Module for [CellAccessibleParent] interface mixin
module gid.gtk3.cell_accessible_parent_mixin;

public import gid.core.basictypes;
public import gid.gtk3.cell_accessible_parent_iface_proxy;
public import gid.atk1.object;
public import gid.atk1.relation_set;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gdk3.rectangle;
public import gid.gobject2.gid_builder;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.cell_accessible;
public import gid.gtk3.types;

/** */
template CellAccessibleParentT()
{

  /** */
  override void activate(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    gtk_cell_accessible_parent_activate(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  override void edit(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    gtk_cell_accessible_parent_edit(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  override void expandCollapse(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    gtk_cell_accessible_parent_expand_collapse(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  override void getCellArea(gid.gtk3.cell_accessible.CellAccessible cell, out gid.gdk3.rectangle.Rectangle cellRect) nothrow
  {
    gtk_cell_accessible_parent_get_cell_area(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(GdkRectangle*)&cellRect);
  }

  /** */
  override void getCellExtents(gid.gtk3.cell_accessible.CellAccessible cell, out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coordType) nothrow
  {
    gtk_cell_accessible_parent_get_cell_extents(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coordType);
  }

  /** */
  override void getCellPosition(gid.gtk3.cell_accessible.CellAccessible cell, out int row, out int column) nothrow
  {
    gtk_cell_accessible_parent_get_cell_position(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(int*)&row, cast(int*)&column);
  }

  /** */
  override int getChildIndex(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    int _retval;
    _retval = gtk_cell_accessible_parent_get_child_index(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override gid.atk1.object.ObjectWrap[] getColumnHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    GPtrArray* _cretval;
    _cretval = gtk_cell_accessible_parent_get_column_header_cells(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  override gid.gtk3.types.CellRendererState getRendererState(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    GtkCellRendererState _cretval;
    _cretval = gtk_cell_accessible_parent_get_renderer_state(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    gid.gtk3.types.CellRendererState _retval = cast(gid.gtk3.types.CellRendererState)_cretval;
    return _retval;
  }

  /** */
  override gid.atk1.object.ObjectWrap[] getRowHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    GPtrArray* _cretval;
    _cretval = gtk_cell_accessible_parent_get_row_header_cells(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  override bool grabFocus(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_accessible_parent_grab_focus(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override void updateRelationset(gid.gtk3.cell_accessible.CellAccessible cell, gid.atk1.relation_set.RelationSet relationset) nothrow
  {
    gtk_cell_accessible_parent_update_relationset(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, relationset ? cast(AtkRelationSet*)relationset._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_accessible_parent.CellAccessibleParent]
template CellAccessibleParentGidBuilderT()
{
}
