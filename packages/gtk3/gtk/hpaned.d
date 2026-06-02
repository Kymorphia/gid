/// Module for [HPaned] class
module gtk.hpaned;

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
    The HPaned widget is a container widget with two
    children arranged horizontally. The division between
    the two panes is adjustable by the user by dragging
    a handle. See #GtkPaned for details.
    
    GtkHPaned has been deprecated, use #GtkPaned instead.
*/
class HPaned : gtk.paned.Paned
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
    return cast(void function())gtk_hpaned_get_type != &gidSymbolNotFound ? gtk_hpaned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HPaned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.hpaned.HPaned]
      Returns: New builder object
  */
  static HPanedGidBuilder builder() nothrow
  {
    return new HPanedGidBuilder;
  }

  /**
      Create a new #GtkHPaned
      Returns: the new #GtkHPaned
  
      Deprecated: Use [gtk.paned.Paned.new_] with [gtk.types.Orientation.Horizontal] instead
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_hpaned_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.hpaned.HPaned]
class HPanedGidBuilderImpl(T) : gtk.paned.PanedGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.hpaned.HPaned]
final class HPanedGidBuilder : HPanedGidBuilderImpl!HPanedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HPaned build() nothrow
  {
    return new HPaned(cast(void*)createGObject(HPaned._getGType), No.Take);
  }
}
