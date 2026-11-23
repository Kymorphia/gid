/// Module for [VBox] class
module gid.gtk3.vbox;

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
    A #GtkVBox is a container that organizes child widgets into a single column.
    
    Use the #GtkBox packing interface to determine the arrangement,
    spacing, height, and alignment of #GtkVBox children.
    
    All children are allocated the same width.
    
    GtkVBox has been deprecated. You can use #GtkBox with a #GtkOrientable:orientation
    set to [gid.gtk4.types.Orientation.Vertical] instead when calling [gid.gtk4.box.Box.new_],
    which is a very quick and easy change.
    
    If you have derived your own classes from GtkVBox, you can change the
    inheritance to derive directly from #GtkBox, and set the #GtkOrientable:orientation
    property to [gid.gtk4.types.Orientation.Vertical] in your instance init function,
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
class VBox : gid.gtk3.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_vbox_get_type != &gidSymbolNotFound ? gtk_vbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override VBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.vbox.VBox]
      Returns: New builder object
  */
  static VBoxGidBuilder builder() nothrow
  {
    return new VBoxGidBuilder;
  }

  /**
      Creates a new #GtkVBox.
  
      Params:
        homogeneous = true if all children are to be given equal space allotments.
        spacing = the number of pixels to place by default between children.
      Returns: a new #GtkVBox.
  
      Deprecated: You should use [gid.gtk4.box.Box.new_] with a [gid.gtk4.types.Orientation.Vertical]
          #GtkOrientable:orientation instead
  */
  this(bool homogeneous, int spacing) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_vbox_new(homogeneous, spacing);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.vbox.VBox]
class VBoxGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.vbox.VBox]
final class VBoxGidBuilder : VBoxGidBuilderImpl!VBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VBox build() nothrow
  {
    return new VBox(cast(void*)createGObject(VBox._getGType), Yes.Take);
  }
}
