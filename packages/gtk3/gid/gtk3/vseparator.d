/// Module for [VSeparator] class
module gid.gtk3.vseparator;

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
import gid.gtk3.separator;
import gid.gtk3.types;

/**
    The #GtkVSeparator widget is a vertical separator, used to group the
    widgets within a window. It displays a vertical line with a shadow to
    make it appear sunken into the interface.
    
    GtkVSeparator has been deprecated, use #GtkSeparator instead.
*/
class VSeparator : gid.gtk3.separator.Separator
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
    return cast(void function())gtk_vseparator_get_type != &gidSymbolNotFound ? gtk_vseparator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVSeparator";
  }

  /** Returns `this`, for use in `with` statements. */
  override VSeparator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.vseparator.VSeparator]
      Returns: New builder object
  */
  static VSeparatorGidBuilder builder() nothrow
  {
    return new VSeparatorGidBuilder;
  }

  /**
      Creates a new #GtkVSeparator.
      Returns: a new #GtkVSeparator.
  
      Deprecated: Use [gid.gtk4.separator.Separator.new_] with [gid.gtk4.types.Orientation.Vertical] instead
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_vseparator_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk3.vseparator.VSeparator]
class VSeparatorGidBuilderImpl(T) : gid.gtk3.separator.SeparatorGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.vseparator.VSeparator]
final class VSeparatorGidBuilder : VSeparatorGidBuilderImpl!VSeparatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VSeparator build() nothrow
  {
    return new VSeparator(cast(void*)createGObject(VSeparator._getGType), Yes.Take);
  }
}
