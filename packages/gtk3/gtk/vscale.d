/// Module for [VScale] class
module gtk.vscale;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
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
    The #GtkVScale widget is used to allow the user to select a value using
    a vertical slider. To create one, use [gtk.hscale.HScale.newWithRange].
    
    The position to show the current value, and the number of decimal places
    shown can be set using the parent #GtkScale class’s functions.
    
    GtkVScale has been deprecated, use #GtkScale instead.
*/
class VScale : gtk.scale.Scale
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
    return cast(void function())gtk_vscale_get_type != &gidSymbolNotFound ? gtk_vscale_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VScale self()
  {
    return this;
  }

  /**
      Get builder for [gtk.vscale.VScale]
      Returns: New builder object
  */
  static VScaleGidBuilder builder()
  {
    return new VScaleGidBuilder;
  }

  /**
      Creates a new #GtkVScale.
  
      Params:
        adjustment = the #GtkAdjustment which sets the range of the scale.
      Returns: a new #GtkVScale.
  
      Deprecated: Use [gtk.scale.Scale.new_] with [gtk.types.Orientation.Vertical] instead
  */
  this(gtk.adjustment.Adjustment adjustment)
  {
    GtkWidget* _cretval;
    _cretval = gtk_vscale_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new vertical scale widget that lets the user input a
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
      Returns: a new #GtkVScale
  
      Deprecated: Use [gtk.scale.Scale.newWithRange] with [gtk.types.Orientation.Vertical] instead
  */
  static gtk.vscale.VScale newWithRange(double min, double max, double step)
  {
    GtkWidget* _cretval;
    _cretval = gtk_vscale_new_with_range(min, max, step);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.vscale.VScale)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.vscale.VScale]
class VScaleGidBuilderImpl(T) : gtk.scale.ScaleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.vscale.VScale]
final class VScaleGidBuilder : VScaleGidBuilderImpl!VScaleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VScale build()
  {
    return new VScale(cast(void*)createGObject(VScale._getGType), No.Take);
  }
}
