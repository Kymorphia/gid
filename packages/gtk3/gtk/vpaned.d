/// Module for [VPaned] class
module gtk.vpaned;

public import gid.basictypes;
import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.paned;
import gtk.types;

/**
    The VPaned widget is a container widget with two
    children arranged vertically. The division between
    the two panes is adjustable by the user by dragging
    a handle. See #GtkPaned for details.
    
    GtkVPaned has been deprecated, use #GtkPaned instead.
*/
class VPaned : gtk.paned.Paned
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_vpaned_get_type != &gidSymbolNotFound ? gtk_vpaned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VPaned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.vpaned.VPaned]
      Returns: New builder object
  */
  static VPanedGidBuilder builder() nothrow
  {
    return new VPanedGidBuilder;
  }

  /**
      Create a new #GtkVPaned
      Returns: the new #GtkVPaned
  
      Deprecated: Use [gtk.paned.Paned.new_] with [gtk.types.Orientation.Vertical] instead
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_vpaned_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.vpaned.VPaned]
class VPanedGidBuilderImpl(T) : gtk.paned.PanedGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.vpaned.VPaned]
final class VPanedGidBuilder : VPanedGidBuilderImpl!VPanedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VPaned build() nothrow
  {
    return new VPaned(cast(void*)createGObject(VPaned._getGType), No.Take);
  }
}
