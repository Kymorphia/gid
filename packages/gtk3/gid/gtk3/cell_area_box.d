/// Module for [CellAreaBox] class
module gid.gtk3.cell_area_box;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_area;
import gid.gtk3.cell_layout;
import gid.gtk3.cell_layout_mixin;
import gid.gtk3.cell_renderer;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

/**
    The #GtkCellAreaBox renders cell renderers into a row or a column
    depending on its #GtkOrientation.
    
    GtkCellAreaBox uses a notion of packing. Packing
    refers to adding cell renderers with reference to a particular position
    in a #GtkCellAreaBox. There are two reference positions: the
    start and the end of the box.
    When the #GtkCellAreaBox is oriented in the [gid.gtk4.types.Orientation.Vertical]
    orientation, the start is defined as the top of the box and the end is
    defined as the bottom. In the [gid.gtk4.types.Orientation.Horizontal] orientation
    start is defined as the left side and the end is defined as the right
    side.
    
    Alignments of #GtkCellRenderers rendered in adjacent rows can be
    configured by configuring the #GtkCellAreaBox align child cell property
    with [gid.gtk4.cell_area.CellArea.cellSetProperty] or by specifying the "align"
    argument to [gid.gtk4.cell_area_box.CellAreaBox.packStart] and [gid.gtk4.cell_area_box.CellAreaBox.packEnd].
*/
class CellAreaBox : gid.gtk3.cell_area.CellArea, gid.gtk3.orientable.Orientable
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
    return cast(void function())gtk_cell_area_box_get_type != &gidSymbolNotFound ? gtk_cell_area_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellAreaBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAreaBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_area_box.CellAreaBox]
      Returns: New builder object
  */
  static CellAreaBoxGidBuilder builder() nothrow
  {
    return new CellAreaBoxGidBuilder;
  }

  /**
      Get `spacing` property.
      Returns: The amount of space to reserve between cells.
  */
  @property int spacing() nothrow
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space to reserve between cells.
  */
  @property void spacing(int propval) nothrow
  {
    setSpacing(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkCellAreaBox.
      Returns: a newly created #GtkCellAreaBox
  */
  this() nothrow
  {
    GtkCellArea* _cretval;
    _cretval = gtk_cell_area_box_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the spacing added between cell renderers.
      Returns: the space added between cell renderers in box.
  */
  int getSpacing() nothrow
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
  void packEnd(gid.gtk3.cell_renderer.CellRenderer renderer, bool expand, bool align_, bool fixed) nothrow
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
  void packStart(gid.gtk3.cell_renderer.CellRenderer renderer, bool expand, bool align_, bool fixed) nothrow
  {
    gtk_cell_area_box_pack_start(cast(GtkCellAreaBox*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, expand, align_, fixed);
  }

  /**
      Sets the spacing to add between cell renderers in box.
  
      Params:
        spacing = the space to add between #GtkCellRenderers
  */
  void setSpacing(int spacing) nothrow
  {
    gtk_cell_area_box_set_spacing(cast(GtkCellAreaBox*)this._cPtr, spacing);
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_area_box.CellAreaBox]
class CellAreaBoxGidBuilderImpl(T) : gid.gtk3.cell_area.CellAreaGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space to reserve between cells.
      Returns: Builder instance for fluent chaining
  */
  T spacing(int propval) nothrow
  {
    return setProperty("spacing", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_area_box.CellAreaBox]
final class CellAreaBoxGidBuilder : CellAreaBoxGidBuilderImpl!CellAreaBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellAreaBox build() nothrow
  {
    return new CellAreaBox(cast(void*)createGObject(CellAreaBox._getGType), Yes.Take);
  }
}
