/// Module for [ScaleButtonAccessible] class
module gtk.scale_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gtk.button_accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class ScaleButtonAccessible : gtk.button_accessible.ButtonAccessible, atk.value.Value
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
    return cast(void function())gtk_scale_button_accessible_get_type != &gidSymbolNotFound ? gtk_scale_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleButtonAccessible self()
  {
    return this;
  }

  mixin ValueT!();
}
