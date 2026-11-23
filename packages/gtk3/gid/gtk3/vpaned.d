/// Module for [VPaned] class
module gid.gtk3.vpaned;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.paned;
import gid.gtk3.types;

/**
    The VPaned widget is a container widget with two
    children arranged vertically. The division between
    the two panes is adjustable by the user by dragging
    a handle. See #GtkPaned for details.
    
    GtkVPaned has been deprecated, use #GtkPaned instead.
*/
class VPaned : gid.gtk3.paned.Paned
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
    return cast(void function())gtk_vpaned_get_type != &gidSymbolNotFound ? gtk_vpaned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVPaned";
  }

  /** Returns `this`, for use in `with` statements. */
  override VPaned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.vpaned.VPaned]
      Returns: New builder object
  */
  static VPanedGidBuilder builder() nothrow
  {
    return new VPanedGidBuilder;
  }

  /**
      Create a new #GtkVPaned
      Returns: the new #GtkVPaned
  
      Deprecated: Use [gid.gtk4.paned.Paned.new_] with [gid.gtk4.types.Orientation.Vertical] instead
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_vpaned_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.vpaned.VPaned]
class VPanedGidBuilderImpl(T) : gid.gtk3.paned.PanedGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.vpaned.VPaned]
final class VPanedGidBuilder : VPanedGidBuilderImpl!VPanedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VPaned build() nothrow
  {
    return new VPaned(cast(void*)createGObject(VPaned._getGType), Yes.Take);
  }
}
