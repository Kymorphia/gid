/// Module for [VolumeButton] class
module gtk.volume_button;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scale_button;
import gtk.types;

/**
    [gtk.volume_button.VolumeButton] is a [gtk.scale_button.ScaleButton] subclass tailored for
    volume control.
    
    ![An example GtkVolumeButton](volumebutton.png)

    Deprecated: This widget will be removed in GTK 5
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
      Returns: Whether to use symbolic icons as the icons.
        
        Note that if the symbolic icons are not available in your installed
        theme, then the normal (potentially colorful) icons will be used.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property bool useSymbolic()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-symbolic");
  }

  /**
      Set `useSymbolic` property.
      Params:
        propval = Whether to use symbolic icons as the icons.
          
          Note that if the symbolic icons are not available in your installed
          theme, then the normal (potentially colorful) icons will be used.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void useSymbolic(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-symbolic", propval);
  }

  /**
      Creates a [gtk.volume_button.VolumeButton].
      
      The button has a range between 0.0 and 1.0, with a stepping of 0.02.
      Volume values can be obtained and modified using the functions from
      [gtk.scale_button.ScaleButton].
      Returns: a new [gtk.volume_button.VolumeButton]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_volume_button_new();
    this(_cretval, No.Take);
  }
}
