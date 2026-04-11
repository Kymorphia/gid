/// Module for [CellAccessibleParent] interface
module gtk.cell_accessible_parent;

public import gtk.cell_accessible_parent_iface_proxy;
import atk.object;
import atk.relation_set;
import atk.types;
import gdk.rectangle;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_accessible;
import gtk.types;

/** */
interface CellAccessibleParent
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_accessible_parent_get_type != &gidSymbolNotFound ? gtk_cell_accessible_parent_get_type() : cast(GType)0;
  }

  /** */
  void activate(gtk.cell_accessible.CellAccessible cell);

  /** */
  void edit(gtk.cell_accessible.CellAccessible cell);

  /** */
  void expandCollapse(gtk.cell_accessible.CellAccessible cell);

  /** */
  void getCellArea(gtk.cell_accessible.CellAccessible cell, out gdk.rectangle.Rectangle cellRect);

  /** */
  void getCellExtents(gtk.cell_accessible.CellAccessible cell, out int x, out int y, out int width, out int height, atk.types.CoordType coordType);

  /** */
  void getCellPosition(gtk.cell_accessible.CellAccessible cell, out int row, out int column);

  /** */
  int getChildIndex(gtk.cell_accessible.CellAccessible cell);

  /** */
  atk.object.ObjectWrap[] getColumnHeaderCells(gtk.cell_accessible.CellAccessible cell);

  /** */
  gtk.types.CellRendererState getRendererState(gtk.cell_accessible.CellAccessible cell);

  /** */
  atk.object.ObjectWrap[] getRowHeaderCells(gtk.cell_accessible.CellAccessible cell);

  /** */
  bool grabFocus(gtk.cell_accessible.CellAccessible cell);

  /** */
  void updateRelationset(gtk.cell_accessible.CellAccessible cell, atk.relation_set.RelationSet relationset);
}

/// Fluent builder implementation template for [gtk.cell_accessible_parent.CellAccessibleParent]
interface CellAccessibleParentGidBuilderImpl(T)
{
}
