/// Module for [HPaned] class
module gid.gtk3.hpaned;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
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
    The HPaned widget is a container widget with two
    children arranged horizontally. The division between
    the two panes is adjustable by the user by dragging
    a handle. See #GtkPaned for details.
    
    GtkHPaned has been deprecated, use #GtkPaned instead.
*/
class HPaned : gid.gtk3.paned.Paned
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
    return cast(void function())gtk_hpaned_get_type != &gidSymbolNotFound ? gtk_hpaned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHPaned";
  }

  /** Returns `this`, for use in `with` statements. */
  override HPaned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.hpaned.HPaned]
      Returns: New builder object
  */
  static HPanedGidBuilder builder() nothrow
  {
    return new HPanedGidBuilder;
  }

  /**
      Create a new #GtkHPaned
      Returns: the new #GtkHPaned
  
      Deprecated: Use [gid.gtk4.paned.Paned.new_] with [gid.gtk4.types.Orientation.Horizontal] instead
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_hpaned_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk3.hpaned.HPaned]
class HPanedGidBuilderImpl(T) : gid.gtk3.paned.PanedGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.hpaned.HPaned]
final class HPanedGidBuilder : HPanedGidBuilderImpl!HPanedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HPaned build() nothrow
  {
    return new HPaned(cast(void*)createGObject(HPaned._getGType), Yes.Take);
  }
}
