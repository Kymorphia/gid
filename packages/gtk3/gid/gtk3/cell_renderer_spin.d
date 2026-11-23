/// Module for [CellRendererSpin] class
module gid.gtk3.cell_renderer_spin;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_renderer_text;
import gid.gtk3.types;

/**
    #GtkCellRendererSpin renders text in a cell like #GtkCellRendererText from
    which it is derived. But while #GtkCellRendererText offers a simple entry to
    edit the text, #GtkCellRendererSpin offers a #GtkSpinButton widget. Of course,
    that means that the text has to be parseable as a floating point number.
    
    The range of the spinbutton is taken from the adjustment property of the
    cell renderer, which can be set explicitly or mapped to a column in the
    tree model, like all properties of cell renders. #GtkCellRendererSpin
    also has properties for the #GtkCellRendererSpin:climb-rate and the number
    of #GtkCellRendererSpin:digits to display. Other #GtkSpinButton properties
    can be set in a handler for the #GtkCellRenderer::editing-started signal.
    
    The #GtkCellRendererSpin cell renderer was added in GTK+ 2.10.
*/
class CellRendererSpin : gid.gtk3.cell_renderer_text.CellRendererText
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
    return cast(void function())gtk_cell_renderer_spin_get_type != &gidSymbolNotFound ? gtk_cell_renderer_spin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererSpin";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererSpin self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_renderer_spin.CellRendererSpin]
      Returns: New builder object
  */
  static CellRendererSpinGidBuilder builder() nothrow
  {
    return new CellRendererSpinGidBuilder;
  }

  /**
      Get `adjustment` property.
      Returns: The adjustment that holds the value of the spinbutton.
        This must be non-null for the cell renderer to be editable.
  */
  @property gid.gtk3.adjustment.Adjustment adjustment() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.adjustment.Adjustment)("adjustment");
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that holds the value of the spinbutton.
          This must be non-null for the cell renderer to be editable.
  */
  @property void adjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.adjustment.Adjustment)("adjustment", propval);
  }

  /**
      Get `climbRate` property.
      Returns: The acceleration rate when you hold down a button.
  */
  @property double climbRate() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("climb-rate");
  }

  /**
      Set `climbRate` property.
      Params:
        propval = The acceleration rate when you hold down a button.
  */
  @property void climbRate(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("climb-rate", propval);
  }

  /**
      Get `digits` property.
      Returns: The number of decimal places to display.
  */
  @property uint digits() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("digits");
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places to display.
  */
  @property void digits(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("digits", propval);
  }

  /**
      Creates a new #GtkCellRendererSpin.
      Returns: a new #GtkCellRendererSpin
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCellRenderer* _cretval;
      _cretval = gtk_cell_renderer_spin_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_renderer_spin.CellRendererSpin]
class CellRendererSpinGidBuilderImpl(T) : gid.gtk3.cell_renderer_text.CellRendererTextGidBuilderImpl!T
{

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that holds the value of the spinbutton.
          This must be non-null for the cell renderer to be editable.
      Returns: Builder instance for fluent chaining
  */
  T adjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    return setProperty("adjustment", propval);
  }

  /**
      Set `climbRate` property.
      Params:
        propval = The acceleration rate when you hold down a button.
      Returns: Builder instance for fluent chaining
  */
  T climbRate(double propval) nothrow
  {
    return setProperty("climb-rate", propval);
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places to display.
      Returns: Builder instance for fluent chaining
  */
  T digits(uint propval) nothrow
  {
    return setProperty("digits", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_renderer_spin.CellRendererSpin]
final class CellRendererSpinGidBuilder : CellRendererSpinGidBuilderImpl!CellRendererSpinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererSpin build() nothrow
  {
    return new CellRendererSpin(cast(void*)createGObject(CellRendererSpin._getGType), Yes.Take);
  }
}
