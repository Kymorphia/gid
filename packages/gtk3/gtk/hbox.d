/// Module for [HBox] class
module gtk.hbox;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    #GtkHBox is a container that organizes child widgets into a single row.
    
    Use the #GtkBox packing interface to determine the arrangement,
    spacing, width, and alignment of #GtkHBox children.
    
    All children are allocated the same height.
    
    GtkHBox has been deprecated. You can use #GtkBox instead, which is a
    very quick and easy change. If you have derived your own classes from
    GtkHBox, you can simply change the inheritance to derive directly
    from #GtkBox. No further changes are needed, since the default
    value of the #GtkOrientable:orientation property is
    [gtk.types.Orientation.Horizontal].
    
    If you have a grid-like layout composed of nested boxes, and you don’t
    need first-child or last-child styling, the recommendation is to switch
    to #GtkGrid. For more information about migrating to #GtkGrid, see
    [Migrating from other containers to GtkGrid][gtk-migrating-GtkGrid].
*/
class HBox : gtk.box.Box
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
    return cast(void function())gtk_hbox_get_type != &gidSymbolNotFound ? gtk_hbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HBox self()
  {
    return this;
  }

  /**
      Get builder for [gtk.hbox.HBox]
      Returns: New builder object
  */
  static HBoxGidBuilder builder()
  {
    return new HBoxGidBuilder;
  }

  /**
      Creates a new #GtkHBox.
  
      Params:
        homogeneous = true if all children are to be given equal space allotments.
        spacing = the number of pixels to place by default between children.
      Returns: a new #GtkHBox.
  
      Deprecated: You should use [gtk.box.Box.new_] with a [gtk.types.Orientation.Horizontal]
          #GtkOrientable:orientation instead
  */
  this(bool homogeneous, int spacing)
  {
    GtkWidget* _cretval;
    _cretval = gtk_hbox_new(homogeneous, spacing);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.hbox.HBox]
class HBoxGidBuilderImpl(T) : gtk.box.BoxGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.hbox.HBox]
final class HBoxGidBuilder : HBoxGidBuilderImpl!HBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HBox build()
  {
    return new HBox(cast(void*)createGObject(HBox._getGType), No.Take);
  }
}
