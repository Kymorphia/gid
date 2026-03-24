/// Module for [VBox] class
module gtk.vbox;

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
    A #GtkVBox is a container that organizes child widgets into a single column.
    
    Use the #GtkBox packing interface to determine the arrangement,
    spacing, height, and alignment of #GtkVBox children.
    
    All children are allocated the same width.
    
    GtkVBox has been deprecated. You can use #GtkBox with a #GtkOrientable:orientation
    set to [gtk.types.Orientation.Vertical] instead when calling [gtk.box.Box.new_],
    which is a very quick and easy change.
    
    If you have derived your own classes from GtkVBox, you can change the
    inheritance to derive directly from #GtkBox, and set the #GtkOrientable:orientation
    property to [gtk.types.Orientation.Vertical] in your instance init function,
    with a call like:
    
    ```c
      gtk_orientable_set_orientation (GTK_ORIENTABLE (object),
                                      GTK_ORIENTATION_VERTICAL);
    ```
    
    If you have a grid-like layout composed of nested boxes, and you don’t
    need first-child or last-child styling, the recommendation is to switch
    to #GtkGrid. For more information about migrating to #GtkGrid, see
    [Migrating from other containers to GtkGrid][gtk-migrating-GtkGrid].
*/
class VBox : gtk.box.Box
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
    return cast(void function())gtk_vbox_get_type != &gidSymbolNotFound ? gtk_vbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VBox self()
  {
    return this;
  }

  /**
  Get builder for [gtk.vbox.VBox]
  Returns: New builder object
  */
  static VBoxGidBuilder builder()
  {
    return new VBoxGidBuilder;
  }

  /**
      Creates a new #GtkVBox.
  
      Params:
        homogeneous = true if all children are to be given equal space allotments.
        spacing = the number of pixels to place by default between children.
      Returns: a new #GtkVBox.
  
      Deprecated: You should use [gtk.box.Box.new_] with a [gtk.types.Orientation.Vertical]
          #GtkOrientable:orientation instead
  */
  this(bool homogeneous, int spacing)
  {
    GtkWidget* _cretval;
    _cretval = gtk_vbox_new(homogeneous, spacing);
    this(_cretval, No.Take);
  }
}

class VBoxGidBuilderImpl(T) : gtk.box.BoxGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.vbox.VBox]
final class VBoxGidBuilder : VBoxGidBuilderImpl!VBoxGidBuilder
{
  VBox build()
  {
    return new VBox(cast(void*)createGObject(VBox._getGType), No.Take);
  }
}
