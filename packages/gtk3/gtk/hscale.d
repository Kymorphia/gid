/// Module for [HScale] class
module gtk.hscale;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scale;
import gtk.types;

/**
    The #GtkHScale widget is used to allow the user to select a value using
    a horizontal slider. To create one, use [gtk.hscale.HScale.newWithRange].
    
    The position to show the current value, and the number of decimal places
    shown can be set using the parent #GtkScale class’s functions.
    
    GtkHScale has been deprecated, use #GtkScale instead.
*/
class HScale : gtk.scale.Scale
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_hscale_get_type != &gidSymbolNotFound ? gtk_hscale_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override HScale self()
  {
    return this;
  }

  /**
      Creates a new #GtkHScale.
  
      Params:
        adjustment = the #GtkAdjustment which sets the range of
          the scale.
      Returns: a new #GtkHScale.
  
      Deprecated: Use [gtk.scale.Scale.new_] with [gtk.types.Orientation.Horizontal] instead
  */
  this(gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_hscale_new(adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new horizontal scale widget that lets the user input a
      number between min and max (including min and max) with the
      increment step.  step must be nonzero; it’s the distance the
      slider moves when using the arrow keys to adjust the scale value.
      
      Note that the way in which the precision is derived works best if step
      is a power of ten. If the resulting precision is not suitable for your
      needs, use [gtk.scale.Scale.setDigits] to correct it.
  
      Params:
        min = minimum value
        max = maximum value
        step = step increment (tick size) used with keyboard shortcuts
      Returns: a new #GtkHScale
  
      Deprecated: Use [gtk.scale.Scale.newWithRange] with [gtk.types.Orientation.Horizontal] instead
  */
  static gtk.hscale.HScale newWithRange(double min, double max, double step)
  {
    GtkWidget* _cretval;
    _cretval = gtk_hscale_new_with_range(min, max, step);
    auto _retval = ObjectG.getDObject!(gtk.hscale.HScale)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
