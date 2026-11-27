/// Module for [CellAccessibleParent] interface
module gid.gtk3.cell_accessible_parent;

public import gid.core.basictypes;
public import gid.gtk3.cell_accessible_parent_iface_proxy;
import gid.atk1.object;
import gid.atk1.relation_set;
import gid.atk1.types;
import gid.core.utils;
import gid.gdk3.rectangle;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_accessible;
import gid.gtk3.types;

/** */
@gidGir("CellAccessibleParent", "CellAccessibleParentIface")
interface CellAccessibleParent : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_accessible_parent_get_type != &gidSymbolNotFound ? gtk_cell_accessible_parent_get_type() : cast(GType)0;
  }













  /** */
  void activate(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  void edit(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  void expandCollapse(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  void getCellArea(gid.gtk3.cell_accessible.CellAccessible cell, out gid.gdk3.rectangle.Rectangle cellRect);

  /** */
  void getCellExtents(gid.gtk3.cell_accessible.CellAccessible cell, out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coordType);

  /** */
  void getCellPosition(gid.gtk3.cell_accessible.CellAccessible cell, out int row, out int column);

  /** */
  int getChildIndex(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  gid.atk1.object.ObjectWrap[] getColumnHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  gid.gtk3.types.CellRendererState getRendererState(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  gid.atk1.object.ObjectWrap[] getRowHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  bool grabFocus(gid.gtk3.cell_accessible.CellAccessible cell);

  /** */
  void updateRelationset(gid.gtk3.cell_accessible.CellAccessible cell, gid.atk1.relation_set.RelationSet relationset);
}

/// Fluent builder implementation template for [gid.gtk3.cell_accessible_parent.CellAccessibleParent]
interface CellAccessibleParentGidBuilderImpl(T)
{
}
