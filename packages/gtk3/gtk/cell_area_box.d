/// Module for [CellAreaBox] class
module gtk.cell_area_box;

import gid.gid;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.cell_renderer;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    The #GtkCellAreaBox renders cell renderers into a row or a column
    depending on its #GtkOrientation.
    
    GtkCellAreaBox uses a notion of packing. Packing
    refers to adding cell renderers with reference to a particular position
    in a #GtkCellAreaBox. There are two reference positions: the
    start and the end of the box.
    When the #GtkCellAreaBox is oriented in the [gtk.types.Orientation.Vertical]
    orientation, the start is defined as the top of the box and the end is
    defined as the bottom. In the [gtk.types.Orientation.Horizontal] orientation
    start is defined as the left side and the end is defined as the right
    side.
    
    Alignments of #GtkCellRenderers rendered in adjacent rows can be
    configured by configuring the #GtkCellAreaBox align child cell property
    with [gtk.cell_area.CellArea.cellSetProperty] or by specifying the "align"
    argument to [gtk.cell_area_box.CellAreaBox.packStart] and [gtk.cell_area_box.CellAreaBox.packEnd].
*/
class CellAreaBox : gtk.cell_area.CellArea, gtk.orientable.Orientable
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
    return cast(void function())gtk_cell_area_box_get_type != &gidSymbolNotFound ? gtk_cell_area_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAreaBox self()
  {
    return this;
  }

  /**
      Get builder for [gtk.cell_area_box.CellAreaBox]
      Returns: New builder object
  */
  static CellAreaBoxGidBuilder builder()
  {
    return new CellAreaBoxGidBuilder;
  }

  /**
      Get `spacing` property.
      Returns: The amount of space to reserve between cells.
  */
  @property int spacing()
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space to reserve between cells.
  */
  @property void spacing(int propval)
  {
    setSpacing(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkCellAreaBox.
      Returns: a newly created #GtkCellAreaBox
  */
  this()
  {
    GtkCellArea* _cretval;
    _cretval = gtk_cell_area_box_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the spacing added between cell renderers.
      Returns: the space added between cell renderers in box.
  */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_cell_area_box_get_spacing(cast(GtkCellAreaBox*)this._cPtr);
    return _retval;
  }

  /**
      Adds renderer to box, packed with reference to the end of box.
      
      The renderer is packed after (away from end of) any other
      #GtkCellRenderer packed with reference to the end of box.
  
      Params:
        renderer = the #GtkCellRenderer to add
        expand = whether renderer should receive extra space when the area receives
          more than its natural size
        align_ = whether renderer should be aligned in adjacent rows
        fixed = whether renderer should have the same size in all rows
  */
  void packEnd(gtk.cell_renderer.CellRenderer renderer, bool expand, bool align_, bool fixed)
  {
    gtk_cell_area_box_pack_end(cast(GtkCellAreaBox*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, expand, align_, fixed);
  }

  /**
      Adds renderer to box, packed with reference to the start of box.
      
      The renderer is packed after any other #GtkCellRenderer packed
      with reference to the start of box.
  
      Params:
        renderer = the #GtkCellRenderer to add
        expand = whether renderer should receive extra space when the area receives
          more than its natural size
        align_ = whether renderer should be aligned in adjacent rows
        fixed = whether renderer should have the same size in all rows
  */
  void packStart(gtk.cell_renderer.CellRenderer renderer, bool expand, bool align_, bool fixed)
  {
    gtk_cell_area_box_pack_start(cast(GtkCellAreaBox*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, expand, align_, fixed);
  }

  /**
      Sets the spacing to add between cell renderers in box.
  
      Params:
        spacing = the space to add between #GtkCellRenderers
  */
  void setSpacing(int spacing)
  {
    gtk_cell_area_box_set_spacing(cast(GtkCellAreaBox*)this._cPtr, spacing);
  }
}

/// Fluent builder implementation template for [gtk.cell_area_box.CellAreaBox]
class CellAreaBoxGidBuilderImpl(T) : gtk.cell_area.CellAreaGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space to reserve between cells.
      Returns: Builder instance for fluent chaining
  */
  T spacing(int propval)
  {
    return setProperty("spacing", propval);
  }
}

/// Fluent builder for [gtk.cell_area_box.CellAreaBox]
final class CellAreaBoxGidBuilder : CellAreaBoxGidBuilderImpl!CellAreaBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellAreaBox build()
  {
    return new CellAreaBox(cast(void*)createGObject(CellAreaBox._getGType), No.Take);
  }
}
