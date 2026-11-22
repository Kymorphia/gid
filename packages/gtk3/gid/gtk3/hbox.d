/// Module for [HBox] class
module gid.gtk3.hbox;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

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
    [gid.gtk4.types.Orientation.Horizontal].
    
    If you have a grid-like layout composed of nested boxes, and you don’t
    need first-child or last-child styling, the recommendation is to switch
    to #GtkGrid. For more information about migrating to #GtkGrid, see
    [Migrating from other containers to GtkGrid][gtk-migrating-GtkGrid].
*/
class HBox : gid.gtk3.box.Box
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
    return cast(void function())gtk_hbox_get_type != &gidSymbolNotFound ? gtk_hbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override HBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.hbox.HBox]
      Returns: New builder object
  */
  static HBoxGidBuilder builder() nothrow
  {
    return new HBoxGidBuilder;
  }

  /**
      Creates a new #GtkHBox.
  
      Params:
        homogeneous = true if all children are to be given equal space allotments.
        spacing = the number of pixels to place by default between children.
      Returns: a new #GtkHBox.
  
      Deprecated: You should use [gid.gtk4.box.Box.new_] with a [gid.gtk4.types.Orientation.Horizontal]
          #GtkOrientable:orientation instead
  */
  this(bool homogeneous, int spacing) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_hbox_new(homogeneous, spacing);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk3.hbox.HBox]
class HBoxGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.hbox.HBox]
final class HBoxGidBuilder : HBoxGidBuilderImpl!HBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HBox build() nothrow
  {
    return new HBox(cast(void*)createGObject(HBox._getGType), Yes.Take);
  }
}
