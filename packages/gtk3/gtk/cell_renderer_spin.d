/// Module for [CellRendererSpin] class
module gtk.cell_renderer_spin;

import gid.gid;
import gobject.object;
import gtk.adjustment;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer_text;
import gtk.types;

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
class CellRendererSpin : gtk.cell_renderer_text.CellRendererText
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
    return cast(void function())gtk_cell_renderer_spin_get_type != &gidSymbolNotFound ? gtk_cell_renderer_spin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererSpin self()
  {
    return this;
  }

  /**
      Get `adjustment` property.
      Returns: The adjustment that holds the value of the spinbutton.
        This must be non-null for the cell renderer to be editable.
  */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.adjustment.Adjustment)("adjustment");
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that holds the value of the spinbutton.
          This must be non-null for the cell renderer to be editable.
  */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.adjustment.Adjustment)("adjustment", propval);
  }

  /**
      Get `climbRate` property.
      Returns: The acceleration rate when you hold down a button.
  */
  @property double climbRate()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("climb-rate");
  }

  /**
      Set `climbRate` property.
      Params:
        propval = The acceleration rate when you hold down a button.
  */
  @property void climbRate(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("climb-rate", propval);
  }

  /**
      Get `digits` property.
      Returns: The number of decimal places to display.
  */
  @property uint digits()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("digits");
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places to display.
  */
  @property void digits(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("digits", propval);
  }

  /**
      Creates a new #GtkCellRendererSpin.
      Returns: a new #GtkCellRendererSpin
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_spin_new();
    this(_cretval, No.Take);
  }
}
