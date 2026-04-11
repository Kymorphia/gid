/// Module for [VSeparator] class
module gtk.vseparator;

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
import gtk.separator;
import gtk.types;

/**
    The #GtkVSeparator widget is a vertical separator, used to group the
    widgets within a window. It displays a vertical line with a shadow to
    make it appear sunken into the interface.
    
    GtkVSeparator has been deprecated, use #GtkSeparator instead.
*/
class VSeparator : gtk.separator.Separator
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
    return cast(void function())gtk_vseparator_get_type != &gidSymbolNotFound ? gtk_vseparator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VSeparator self()
  {
    return this;
  }

  /**
      Get builder for [gtk.vseparator.VSeparator]
      Returns: New builder object
  */
  static VSeparatorGidBuilder builder()
  {
    return new VSeparatorGidBuilder;
  }

  /**
      Creates a new #GtkVSeparator.
      Returns: a new #GtkVSeparator.
  
      Deprecated: Use [gtk.separator.Separator.new_] with [gtk.types.Orientation.Vertical] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_vseparator_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.vseparator.VSeparator]
class VSeparatorGidBuilderImpl(T) : gtk.separator.SeparatorGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.vseparator.VSeparator]
final class VSeparatorGidBuilder : VSeparatorGidBuilderImpl!VSeparatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VSeparator build()
  {
    return new VSeparator(cast(void*)createGObject(VSeparator._getGType), No.Take);
  }
}
