/// Module for [VolumeButton] class
module gtk.volume_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scale_button;
import gtk.types;

/**
    #GtkVolumeButton is a subclass of #GtkScaleButton that has
    been tailored for use as a volume control widget with suitable
    icons, tooltips and accessible labels.
*/
class VolumeButton : gtk.scale_button.ScaleButton
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
    return cast(void function())gtk_volume_button_get_type != &gidSymbolNotFound ? gtk_volume_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VolumeButton self()
  {
    return this;
  }

  /**
      Get `useSymbolic` property.
      Returns: Whether to use symbolic icons as the icons. Note that
        if the symbolic icons are not available in your installed
        theme, then the normal (potentially colorful) icons will
        be used.
  */
  @property bool useSymbolic()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-symbolic");
  }

  /**
      Set `useSymbolic` property.
      Params:
        propval = Whether to use symbolic icons as the icons. Note that
          if the symbolic icons are not available in your installed
          theme, then the normal (potentially colorful) icons will
          be used.
  */
  @property void useSymbolic(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-symbolic", propval);
  }

  /**
      Creates a #GtkVolumeButton, with a range between 0.0 and 1.0, with
      a stepping of 0.02. Volume values can be obtained and modified using
      the functions from #GtkScaleButton.
      Returns: a new #GtkVolumeButton
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_volume_button_new();
    this(_cretval, No.Take);
  }
}
