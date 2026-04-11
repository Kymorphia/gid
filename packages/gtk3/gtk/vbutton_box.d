/// Module for [VButtonBox] class
module gtk.vbutton_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button_box;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/** */
class VButtonBox : gtk.button_box.ButtonBox
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
    return cast(void function())gtk_vbutton_box_get_type != &gidSymbolNotFound ? gtk_vbutton_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VButtonBox self()
  {
    return this;
  }

  /**
      Get builder for [gtk.vbutton_box.VButtonBox]
      Returns: New builder object
  */
  static VButtonBoxGidBuilder builder()
  {
    return new VButtonBoxGidBuilder;
  }

  /**
      Creates a new vertical button box.
      Returns: a new button box #GtkWidget.
  
      Deprecated: Use [gtk.button_box.ButtonBox.new_] with [gtk.types.Orientation.Vertical] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_vbutton_box_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.vbutton_box.VButtonBox]
class VButtonBoxGidBuilderImpl(T) : gtk.button_box.ButtonBoxGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.vbutton_box.VButtonBox]
final class VButtonBoxGidBuilder : VButtonBoxGidBuilderImpl!VButtonBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VButtonBox build()
  {
    return new VButtonBox(cast(void*)createGObject(VButtonBox._getGType), No.Take);
  }
}
