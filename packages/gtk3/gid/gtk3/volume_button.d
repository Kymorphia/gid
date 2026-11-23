/// Module for [VolumeButton] class
module gid.gtk3.volume_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.scale_button;
import gid.gtk3.types;

/**
    #GtkVolumeButton is a subclass of #GtkScaleButton that has
    been tailored for use as a volume control widget with suitable
    icons, tooltips and accessible labels.
*/
class VolumeButton : gid.gtk3.scale_button.ScaleButton
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
    return cast(void function())gtk_volume_button_get_type != &gidSymbolNotFound ? gtk_volume_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVolumeButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override VolumeButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.volume_button.VolumeButton]
      Returns: New builder object
  */
  static VolumeButtonGidBuilder builder() nothrow
  {
    return new VolumeButtonGidBuilder;
  }

  /**
      Get `useSymbolic` property.
      Returns: Whether to use symbolic icons as the icons. Note that
        if the symbolic icons are not available in your installed
        theme, then the normal (potentially colorful) icons will
        be used.
  */
  @property bool useSymbolic() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-symbolic");
  }

  /**
      Set `useSymbolic` property.
      Params:
        propval = Whether to use symbolic icons as the icons. Note that
          if the symbolic icons are not available in your installed
          theme, then the normal (potentially colorful) icons will
          be used.
  */
  @property void useSymbolic(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("use-symbolic", propval);
  }

  /**
      Creates a #GtkVolumeButton, with a range between 0.0 and 1.0, with
      a stepping of 0.02. Volume values can be obtained and modified using
      the functions from #GtkScaleButton.
      Returns: a new #GtkVolumeButton
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_volume_button_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.volume_button.VolumeButton]
class VolumeButtonGidBuilderImpl(T) : gid.gtk3.scale_button.ScaleButtonGidBuilderImpl!T
{


  /**
      Set `useSymbolic` property.
      Params:
        propval = Whether to use symbolic icons as the icons. Note that
          if the symbolic icons are not available in your installed
          theme, then the normal (potentially colorful) icons will
          be used.
      Returns: Builder instance for fluent chaining
  */
  T useSymbolic(bool propval) nothrow
  {
    return setProperty("use-symbolic", propval);
  }
}

/// Fluent builder for [gid.gtk3.volume_button.VolumeButton]
final class VolumeButtonGidBuilder : VolumeButtonGidBuilderImpl!VolumeButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VolumeButton build() nothrow
  {
    return new VolumeButton(cast(void*)createGObject(VolumeButton._getGType), Yes.Take);
  }
}
