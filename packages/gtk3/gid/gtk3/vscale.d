/// Module for [VScale] class
module gid.gtk3.vscale;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.scale;
import gid.gtk3.types;

/**
    The #GtkVScale widget is used to allow the user to select a value using
    a vertical slider. To create one, use [gid.gtk3.hscale.HScale.newWithRange].
    
    The position to show the current value, and the number of decimal places
    shown can be set using the parent #GtkScale class’s functions.
    
    GtkVScale has been deprecated, use #GtkScale instead.
*/
class VScale : gid.gtk3.scale.Scale
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_vscale_get_type != &gidSymbolNotFound ? gtk_vscale_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVScale";
  }

  /** Returns `this`, for use in `with` statements. */
  override VScale self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.vscale.VScale]
      Returns: New builder object
  */
  static VScaleGidBuilder builder() nothrow
  {
    return new VScaleGidBuilder;
  }

  /**
      Creates a new #GtkVScale.
  
      Params:
        adjustment = the #GtkAdjustment which sets the range of the scale.
      Returns: a new #GtkVScale.
  
      Deprecated: Use [gid.gtk4.scale.Scale.new_] with [gid.gtk4.types.Orientation.Vertical] instead
  */
  this(gid.gtk3.adjustment.Adjustment adjustment) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_vscale_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new vertical scale widget that lets the user input a
      number between min and max (including min and max) with the
      increment step.  step must be nonzero; it’s the distance the
      slider moves when using the arrow keys to adjust the scale value.
      
      Note that the way in which the precision is derived works best if step
      is a power of ten. If the resulting precision is not suitable for your
      needs, use [gid.gtk4.scale.Scale.setDigits] to correct it.
  
      Params:
        min = minimum value
        max = maximum value
        step = step increment (tick size) used with keyboard shortcuts
      Returns: a new #GtkVScale
  
      Deprecated: Use [gid.gtk4.scale.Scale.newWithRange] with [gid.gtk4.types.Orientation.Vertical] instead
  */
  static gid.gtk3.vscale.VScale newWithRange(double min, double max, double step) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_vscale_new_with_range(min, max, step);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.vscale.VScale)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.vscale.VScale]
class VScaleGidBuilderImpl(T) : gid.gtk3.scale.ScaleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.vscale.VScale]
final class VScaleGidBuilder : VScaleGidBuilderImpl!VScaleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VScale build() nothrow
  {
    return new VScale(cast(void*)createGObject(VScale._getGType), Yes.Take);
  }
}
